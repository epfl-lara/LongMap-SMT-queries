; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43136 () Bool)

(assert start!43136)

(declare-fun b!478379 () Bool)

(declare-fun e!281259 () Bool)

(declare-fun tp_is_empty!13561 () Bool)

(assert (=> b!478379 (= e!281259 tp_is_empty!13561)))

(declare-fun b!478380 () Bool)

(declare-fun res!285443 () Bool)

(declare-fun e!281256 () Bool)

(assert (=> b!478380 (=> (not res!285443) (not e!281256))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30784 0))(
  ( (array!30785 (arr!14801 (Array (_ BitVec 32) (_ BitVec 64))) (size!15159 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30784)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19153 0))(
  ( (V!19154 (val!6828 Int)) )
))
(declare-datatypes ((ValueCell!6419 0))(
  ( (ValueCellFull!6419 (v!9117 V!19153)) (EmptyCell!6419) )
))
(declare-datatypes ((array!30786 0))(
  ( (array!30787 (arr!14802 (Array (_ BitVec 32) ValueCell!6419)) (size!15160 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30786)

(assert (=> b!478380 (= res!285443 (and (= (size!15160 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15159 _keys!1874) (size!15160 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478381 () Bool)

(declare-fun e!281257 () Bool)

(declare-fun mapRes!22030 () Bool)

(assert (=> b!478381 (= e!281257 (and e!281259 mapRes!22030))))

(declare-fun condMapEmpty!22030 () Bool)

(declare-fun mapDefault!22030 () ValueCell!6419)

(assert (=> b!478381 (= condMapEmpty!22030 (= (arr!14802 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6419)) mapDefault!22030)))))

(declare-fun b!478382 () Bool)

(declare-fun e!281258 () Bool)

(assert (=> b!478382 (= e!281258 tp_is_empty!13561)))

(declare-fun mapNonEmpty!22030 () Bool)

(declare-fun tp!42505 () Bool)

(assert (=> mapNonEmpty!22030 (= mapRes!22030 (and tp!42505 e!281258))))

(declare-fun mapKey!22030 () (_ BitVec 32))

(declare-fun mapRest!22030 () (Array (_ BitVec 32) ValueCell!6419))

(declare-fun mapValue!22030 () ValueCell!6419)

(assert (=> mapNonEmpty!22030 (= (arr!14802 _values!1516) (store mapRest!22030 mapKey!22030 mapValue!22030))))

(declare-fun b!478383 () Bool)

(declare-fun res!285444 () Bool)

(assert (=> b!478383 (=> (not res!285444) (not e!281256))))

(assert (=> b!478383 (= res!285444 (and (bvsle #b00000000000000000000000000000000 (size!15159 _keys!1874)) (bvslt (size!15159 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!22030 () Bool)

(assert (=> mapIsEmpty!22030 mapRes!22030))

(declare-fun res!285442 () Bool)

(assert (=> start!43136 (=> (not res!285442) (not e!281256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43136 (= res!285442 (validMask!0 mask!2352))))

(assert (=> start!43136 e!281256))

(assert (=> start!43136 true))

(declare-fun array_inv!10760 (array!30786) Bool)

(assert (=> start!43136 (and (array_inv!10760 _values!1516) e!281257)))

(declare-fun array_inv!10761 (array!30784) Bool)

(assert (=> start!43136 (array_inv!10761 _keys!1874)))

(declare-fun b!478384 () Bool)

(declare-fun res!285441 () Bool)

(assert (=> b!478384 (=> (not res!285441) (not e!281256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30784 (_ BitVec 32)) Bool)

(assert (=> b!478384 (= res!285441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478385 () Bool)

(declare-datatypes ((List!8968 0))(
  ( (Nil!8965) (Cons!8964 (h!9820 (_ BitVec 64)) (t!15166 List!8968)) )
))
(declare-fun noDuplicate!207 (List!8968) Bool)

(assert (=> b!478385 (= e!281256 (not (noDuplicate!207 Nil!8965)))))

(assert (= (and start!43136 res!285442) b!478380))

(assert (= (and b!478380 res!285443) b!478384))

(assert (= (and b!478384 res!285441) b!478383))

(assert (= (and b!478383 res!285444) b!478385))

(assert (= (and b!478381 condMapEmpty!22030) mapIsEmpty!22030))

(assert (= (and b!478381 (not condMapEmpty!22030)) mapNonEmpty!22030))

(get-info :version)

(assert (= (and mapNonEmpty!22030 ((_ is ValueCellFull!6419) mapValue!22030)) b!478382))

(assert (= (and b!478381 ((_ is ValueCellFull!6419) mapDefault!22030)) b!478379))

(assert (= start!43136 b!478381))

(declare-fun m!460893 () Bool)

(assert (=> mapNonEmpty!22030 m!460893))

(declare-fun m!460895 () Bool)

(assert (=> start!43136 m!460895))

(declare-fun m!460897 () Bool)

(assert (=> start!43136 m!460897))

(declare-fun m!460899 () Bool)

(assert (=> start!43136 m!460899))

(declare-fun m!460901 () Bool)

(assert (=> b!478384 m!460901))

(declare-fun m!460903 () Bool)

(assert (=> b!478385 m!460903))

(check-sat (not mapNonEmpty!22030) (not b!478385) (not b!478384) (not start!43136) tp_is_empty!13561)
(check-sat)
(get-model)

(declare-fun b!478436 () Bool)

(declare-fun e!281297 () Bool)

(declare-fun call!30824 () Bool)

(assert (=> b!478436 (= e!281297 call!30824)))

(declare-fun b!478437 () Bool)

(declare-fun e!281299 () Bool)

(assert (=> b!478437 (= e!281299 e!281297)))

(declare-fun lt!217740 () (_ BitVec 64))

(assert (=> b!478437 (= lt!217740 (select (arr!14801 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14033 0))(
  ( (Unit!14034) )
))
(declare-fun lt!217738 () Unit!14033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30784 (_ BitVec 64) (_ BitVec 32)) Unit!14033)

(assert (=> b!478437 (= lt!217738 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217740 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478437 (arrayContainsKey!0 _keys!1874 lt!217740 #b00000000000000000000000000000000)))

(declare-fun lt!217739 () Unit!14033)

(assert (=> b!478437 (= lt!217739 lt!217738)))

(declare-fun res!285474 () Bool)

(declare-datatypes ((SeekEntryResult!3514 0))(
  ( (MissingZero!3514 (index!16235 (_ BitVec 32))) (Found!3514 (index!16236 (_ BitVec 32))) (Intermediate!3514 (undefined!4326 Bool) (index!16237 (_ BitVec 32)) (x!44851 (_ BitVec 32))) (Undefined!3514) (MissingVacant!3514 (index!16238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30784 (_ BitVec 32)) SeekEntryResult!3514)

(assert (=> b!478437 (= res!285474 (= (seekEntryOrOpen!0 (select (arr!14801 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3514 #b00000000000000000000000000000000)))))

(assert (=> b!478437 (=> (not res!285474) (not e!281297))))

(declare-fun b!478438 () Bool)

(assert (=> b!478438 (= e!281299 call!30824)))

(declare-fun bm!30821 () Bool)

(assert (=> bm!30821 (= call!30824 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478439 () Bool)

(declare-fun e!281298 () Bool)

(assert (=> b!478439 (= e!281298 e!281299)))

(declare-fun c!57640 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478439 (= c!57640 (validKeyInArray!0 (select (arr!14801 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76637 () Bool)

(declare-fun res!285473 () Bool)

(assert (=> d!76637 (=> res!285473 e!281298)))

(assert (=> d!76637 (= res!285473 (bvsge #b00000000000000000000000000000000 (size!15159 _keys!1874)))))

(assert (=> d!76637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281298)))

(assert (= (and d!76637 (not res!285473)) b!478439))

(assert (= (and b!478439 c!57640) b!478437))

(assert (= (and b!478439 (not c!57640)) b!478438))

(assert (= (and b!478437 res!285474) b!478436))

(assert (= (or b!478436 b!478438) bm!30821))

(declare-fun m!460929 () Bool)

(assert (=> b!478437 m!460929))

(declare-fun m!460931 () Bool)

(assert (=> b!478437 m!460931))

(declare-fun m!460933 () Bool)

(assert (=> b!478437 m!460933))

(assert (=> b!478437 m!460929))

(declare-fun m!460935 () Bool)

(assert (=> b!478437 m!460935))

(declare-fun m!460937 () Bool)

(assert (=> bm!30821 m!460937))

(assert (=> b!478439 m!460929))

(assert (=> b!478439 m!460929))

(declare-fun m!460939 () Bool)

(assert (=> b!478439 m!460939))

(assert (=> b!478384 d!76637))

(declare-fun d!76639 () Bool)

(assert (=> d!76639 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43136 d!76639))

(declare-fun d!76641 () Bool)

(assert (=> d!76641 (= (array_inv!10760 _values!1516) (bvsge (size!15160 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43136 d!76641))

(declare-fun d!76643 () Bool)

(assert (=> d!76643 (= (array_inv!10761 _keys!1874) (bvsge (size!15159 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43136 d!76643))

(declare-fun d!76645 () Bool)

(declare-fun res!285479 () Bool)

(declare-fun e!281304 () Bool)

(assert (=> d!76645 (=> res!285479 e!281304)))

(assert (=> d!76645 (= res!285479 ((_ is Nil!8965) Nil!8965))))

(assert (=> d!76645 (= (noDuplicate!207 Nil!8965) e!281304)))

(declare-fun b!478444 () Bool)

(declare-fun e!281305 () Bool)

(assert (=> b!478444 (= e!281304 e!281305)))

(declare-fun res!285480 () Bool)

(assert (=> b!478444 (=> (not res!285480) (not e!281305))))

(declare-fun contains!2561 (List!8968 (_ BitVec 64)) Bool)

(assert (=> b!478444 (= res!285480 (not (contains!2561 (t!15166 Nil!8965) (h!9820 Nil!8965))))))

(declare-fun b!478445 () Bool)

(assert (=> b!478445 (= e!281305 (noDuplicate!207 (t!15166 Nil!8965)))))

(assert (= (and d!76645 (not res!285479)) b!478444))

(assert (= (and b!478444 res!285480) b!478445))

(declare-fun m!460941 () Bool)

(assert (=> b!478444 m!460941))

(declare-fun m!460943 () Bool)

(assert (=> b!478445 m!460943))

(assert (=> b!478385 d!76645))

(declare-fun condMapEmpty!22039 () Bool)

(declare-fun mapDefault!22039 () ValueCell!6419)

(assert (=> mapNonEmpty!22030 (= condMapEmpty!22039 (= mapRest!22030 ((as const (Array (_ BitVec 32) ValueCell!6419)) mapDefault!22039)))))

(declare-fun e!281311 () Bool)

(declare-fun mapRes!22039 () Bool)

(assert (=> mapNonEmpty!22030 (= tp!42505 (and e!281311 mapRes!22039))))

(declare-fun mapNonEmpty!22039 () Bool)

(declare-fun tp!42514 () Bool)

(declare-fun e!281310 () Bool)

(assert (=> mapNonEmpty!22039 (= mapRes!22039 (and tp!42514 e!281310))))

(declare-fun mapRest!22039 () (Array (_ BitVec 32) ValueCell!6419))

(declare-fun mapKey!22039 () (_ BitVec 32))

(declare-fun mapValue!22039 () ValueCell!6419)

(assert (=> mapNonEmpty!22039 (= mapRest!22030 (store mapRest!22039 mapKey!22039 mapValue!22039))))

(declare-fun b!478453 () Bool)

(assert (=> b!478453 (= e!281311 tp_is_empty!13561)))

(declare-fun b!478452 () Bool)

(assert (=> b!478452 (= e!281310 tp_is_empty!13561)))

(declare-fun mapIsEmpty!22039 () Bool)

(assert (=> mapIsEmpty!22039 mapRes!22039))

(assert (= (and mapNonEmpty!22030 condMapEmpty!22039) mapIsEmpty!22039))

(assert (= (and mapNonEmpty!22030 (not condMapEmpty!22039)) mapNonEmpty!22039))

(assert (= (and mapNonEmpty!22039 ((_ is ValueCellFull!6419) mapValue!22039)) b!478452))

(assert (= (and mapNonEmpty!22030 ((_ is ValueCellFull!6419) mapDefault!22039)) b!478453))

(declare-fun m!460945 () Bool)

(assert (=> mapNonEmpty!22039 m!460945))

(check-sat (not mapNonEmpty!22039) (not b!478437) (not b!478444) (not b!478445) tp_is_empty!13561 (not bm!30821) (not b!478439))
(check-sat)
