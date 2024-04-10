; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43138 () Bool)

(assert start!43138)

(declare-fun b!478382 () Bool)

(declare-fun res!285423 () Bool)

(declare-fun e!281253 () Bool)

(assert (=> b!478382 (=> (not res!285423) (not e!281253))))

(declare-datatypes ((array!30785 0))(
  ( (array!30786 (arr!14803 (Array (_ BitVec 32) (_ BitVec 64))) (size!15161 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30785)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30785 (_ BitVec 32)) Bool)

(assert (=> b!478382 (= res!285423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478383 () Bool)

(declare-fun e!281252 () Bool)

(declare-fun e!281254 () Bool)

(declare-fun mapRes!22021 () Bool)

(assert (=> b!478383 (= e!281252 (and e!281254 mapRes!22021))))

(declare-fun condMapEmpty!22021 () Bool)

(declare-datatypes ((V!19147 0))(
  ( (V!19148 (val!6826 Int)) )
))
(declare-datatypes ((ValueCell!6417 0))(
  ( (ValueCellFull!6417 (v!9114 V!19147)) (EmptyCell!6417) )
))
(declare-datatypes ((array!30787 0))(
  ( (array!30788 (arr!14804 (Array (_ BitVec 32) ValueCell!6417)) (size!15162 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30787)

(declare-fun mapDefault!22021 () ValueCell!6417)

(assert (=> b!478383 (= condMapEmpty!22021 (= (arr!14804 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6417)) mapDefault!22021)))))

(declare-fun b!478384 () Bool)

(declare-fun tp_is_empty!13557 () Bool)

(assert (=> b!478384 (= e!281254 tp_is_empty!13557)))

(declare-fun res!285422 () Bool)

(assert (=> start!43138 (=> (not res!285422) (not e!281253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43138 (= res!285422 (validMask!0 mask!2352))))

(assert (=> start!43138 e!281253))

(assert (=> start!43138 true))

(declare-fun array_inv!10680 (array!30787) Bool)

(assert (=> start!43138 (and (array_inv!10680 _values!1516) e!281252)))

(declare-fun array_inv!10681 (array!30785) Bool)

(assert (=> start!43138 (array_inv!10681 _keys!1874)))

(declare-fun mapIsEmpty!22021 () Bool)

(assert (=> mapIsEmpty!22021 mapRes!22021))

(declare-fun b!478385 () Bool)

(assert (=> b!478385 (= e!281253 (and (bvsle #b00000000000000000000000000000000 (size!15161 _keys!1874)) (bvsge (size!15161 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!22021 () Bool)

(declare-fun tp!42496 () Bool)

(declare-fun e!281251 () Bool)

(assert (=> mapNonEmpty!22021 (= mapRes!22021 (and tp!42496 e!281251))))

(declare-fun mapKey!22021 () (_ BitVec 32))

(declare-fun mapValue!22021 () ValueCell!6417)

(declare-fun mapRest!22021 () (Array (_ BitVec 32) ValueCell!6417))

(assert (=> mapNonEmpty!22021 (= (arr!14804 _values!1516) (store mapRest!22021 mapKey!22021 mapValue!22021))))

(declare-fun b!478386 () Bool)

(assert (=> b!478386 (= e!281251 tp_is_empty!13557)))

(declare-fun b!478387 () Bool)

(declare-fun res!285424 () Bool)

(assert (=> b!478387 (=> (not res!285424) (not e!281253))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478387 (= res!285424 (and (= (size!15162 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15161 _keys!1874) (size!15162 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43138 res!285422) b!478387))

(assert (= (and b!478387 res!285424) b!478382))

(assert (= (and b!478382 res!285423) b!478385))

(assert (= (and b!478383 condMapEmpty!22021) mapIsEmpty!22021))

(assert (= (and b!478383 (not condMapEmpty!22021)) mapNonEmpty!22021))

(get-info :version)

(assert (= (and mapNonEmpty!22021 ((_ is ValueCellFull!6417) mapValue!22021)) b!478386))

(assert (= (and b!478383 ((_ is ValueCellFull!6417) mapDefault!22021)) b!478384))

(assert (= start!43138 b!478383))

(declare-fun m!460677 () Bool)

(assert (=> b!478382 m!460677))

(declare-fun m!460679 () Bool)

(assert (=> start!43138 m!460679))

(declare-fun m!460681 () Bool)

(assert (=> start!43138 m!460681))

(declare-fun m!460683 () Bool)

(assert (=> start!43138 m!460683))

(declare-fun m!460685 () Bool)

(assert (=> mapNonEmpty!22021 m!460685))

(check-sat (not b!478382) (not start!43138) (not mapNonEmpty!22021) tp_is_empty!13557)
(check-sat)
(get-model)

(declare-fun b!478414 () Bool)

(declare-fun e!281278 () Bool)

(declare-fun e!281276 () Bool)

(assert (=> b!478414 (= e!281278 e!281276)))

(declare-fun lt!217717 () (_ BitVec 64))

(assert (=> b!478414 (= lt!217717 (select (arr!14803 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14060 0))(
  ( (Unit!14061) )
))
(declare-fun lt!217718 () Unit!14060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30785 (_ BitVec 64) (_ BitVec 32)) Unit!14060)

(assert (=> b!478414 (= lt!217718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217717 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478414 (arrayContainsKey!0 _keys!1874 lt!217717 #b00000000000000000000000000000000)))

(declare-fun lt!217719 () Unit!14060)

(assert (=> b!478414 (= lt!217719 lt!217718)))

(declare-fun res!285438 () Bool)

(declare-datatypes ((SeekEntryResult!3564 0))(
  ( (MissingZero!3564 (index!16435 (_ BitVec 32))) (Found!3564 (index!16436 (_ BitVec 32))) (Intermediate!3564 (undefined!4376 Bool) (index!16437 (_ BitVec 32)) (x!44894 (_ BitVec 32))) (Undefined!3564) (MissingVacant!3564 (index!16438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30785 (_ BitVec 32)) SeekEntryResult!3564)

(assert (=> b!478414 (= res!285438 (= (seekEntryOrOpen!0 (select (arr!14803 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3564 #b00000000000000000000000000000000)))))

(assert (=> b!478414 (=> (not res!285438) (not e!281276))))

(declare-fun b!478415 () Bool)

(declare-fun call!30835 () Bool)

(assert (=> b!478415 (= e!281276 call!30835)))

(declare-fun bm!30832 () Bool)

(assert (=> bm!30832 (= call!30835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478417 () Bool)

(assert (=> b!478417 (= e!281278 call!30835)))

(declare-fun d!76599 () Bool)

(declare-fun res!285439 () Bool)

(declare-fun e!281277 () Bool)

(assert (=> d!76599 (=> res!285439 e!281277)))

(assert (=> d!76599 (= res!285439 (bvsge #b00000000000000000000000000000000 (size!15161 _keys!1874)))))

(assert (=> d!76599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281277)))

(declare-fun b!478416 () Bool)

(assert (=> b!478416 (= e!281277 e!281278)))

(declare-fun c!57664 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478416 (= c!57664 (validKeyInArray!0 (select (arr!14803 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76599 (not res!285439)) b!478416))

(assert (= (and b!478416 c!57664) b!478414))

(assert (= (and b!478416 (not c!57664)) b!478417))

(assert (= (and b!478414 res!285438) b!478415))

(assert (= (or b!478415 b!478417) bm!30832))

(declare-fun m!460697 () Bool)

(assert (=> b!478414 m!460697))

(declare-fun m!460699 () Bool)

(assert (=> b!478414 m!460699))

(declare-fun m!460701 () Bool)

(assert (=> b!478414 m!460701))

(assert (=> b!478414 m!460697))

(declare-fun m!460703 () Bool)

(assert (=> b!478414 m!460703))

(declare-fun m!460705 () Bool)

(assert (=> bm!30832 m!460705))

(assert (=> b!478416 m!460697))

(assert (=> b!478416 m!460697))

(declare-fun m!460707 () Bool)

(assert (=> b!478416 m!460707))

(assert (=> b!478382 d!76599))

(declare-fun d!76601 () Bool)

(assert (=> d!76601 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43138 d!76601))

(declare-fun d!76603 () Bool)

(assert (=> d!76603 (= (array_inv!10680 _values!1516) (bvsge (size!15162 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43138 d!76603))

(declare-fun d!76605 () Bool)

(assert (=> d!76605 (= (array_inv!10681 _keys!1874) (bvsge (size!15161 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43138 d!76605))

(declare-fun mapNonEmpty!22027 () Bool)

(declare-fun mapRes!22027 () Bool)

(declare-fun tp!42502 () Bool)

(declare-fun e!281283 () Bool)

(assert (=> mapNonEmpty!22027 (= mapRes!22027 (and tp!42502 e!281283))))

(declare-fun mapKey!22027 () (_ BitVec 32))

(declare-fun mapValue!22027 () ValueCell!6417)

(declare-fun mapRest!22027 () (Array (_ BitVec 32) ValueCell!6417))

(assert (=> mapNonEmpty!22027 (= mapRest!22021 (store mapRest!22027 mapKey!22027 mapValue!22027))))

(declare-fun condMapEmpty!22027 () Bool)

(declare-fun mapDefault!22027 () ValueCell!6417)

(assert (=> mapNonEmpty!22021 (= condMapEmpty!22027 (= mapRest!22021 ((as const (Array (_ BitVec 32) ValueCell!6417)) mapDefault!22027)))))

(declare-fun e!281284 () Bool)

(assert (=> mapNonEmpty!22021 (= tp!42496 (and e!281284 mapRes!22027))))

(declare-fun b!478425 () Bool)

(assert (=> b!478425 (= e!281284 tp_is_empty!13557)))

(declare-fun mapIsEmpty!22027 () Bool)

(assert (=> mapIsEmpty!22027 mapRes!22027))

(declare-fun b!478424 () Bool)

(assert (=> b!478424 (= e!281283 tp_is_empty!13557)))

(assert (= (and mapNonEmpty!22021 condMapEmpty!22027) mapIsEmpty!22027))

(assert (= (and mapNonEmpty!22021 (not condMapEmpty!22027)) mapNonEmpty!22027))

(assert (= (and mapNonEmpty!22027 ((_ is ValueCellFull!6417) mapValue!22027)) b!478424))

(assert (= (and mapNonEmpty!22021 ((_ is ValueCellFull!6417) mapDefault!22027)) b!478425))

(declare-fun m!460709 () Bool)

(assert (=> mapNonEmpty!22027 m!460709))

(check-sat (not mapNonEmpty!22027) (not bm!30832) tp_is_empty!13557 (not b!478414) (not b!478416))
(check-sat)
