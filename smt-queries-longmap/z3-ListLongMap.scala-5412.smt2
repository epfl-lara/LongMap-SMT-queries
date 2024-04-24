; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72394 () Bool)

(assert start!72394)

(declare-fun b!837996 () Bool)

(declare-fun e!467722 () Bool)

(declare-fun e!467725 () Bool)

(declare-fun mapRes!24551 () Bool)

(assert (=> b!837996 (= e!467722 (and e!467725 mapRes!24551))))

(declare-fun condMapEmpty!24551 () Bool)

(declare-datatypes ((V!25457 0))(
  ( (V!25458 (val!7701 Int)) )
))
(declare-datatypes ((ValueCell!7214 0))(
  ( (ValueCellFull!7214 (v!10125 V!25457)) (EmptyCell!7214) )
))
(declare-datatypes ((array!46909 0))(
  ( (array!46910 (arr!22484 (Array (_ BitVec 32) ValueCell!7214)) (size!22925 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46909)

(declare-fun mapDefault!24551 () ValueCell!7214)

(assert (=> b!837996 (= condMapEmpty!24551 (= (arr!22484 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7214)) mapDefault!24551)))))

(declare-fun b!837997 () Bool)

(declare-fun res!569685 () Bool)

(declare-fun e!467723 () Bool)

(assert (=> b!837997 (=> (not res!569685) (not e!467723))))

(declare-datatypes ((array!46911 0))(
  ( (array!46912 (arr!22485 (Array (_ BitVec 32) (_ BitVec 64))) (size!22926 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46911)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46911 (_ BitVec 32)) Bool)

(assert (=> b!837997 (= res!569685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837998 () Bool)

(declare-fun res!569686 () Bool)

(assert (=> b!837998 (=> (not res!569686) (not e!467723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837998 (= res!569686 (validMask!0 mask!1196))))

(declare-fun b!837999 () Bool)

(assert (=> b!837999 (= e!467723 (and (bvsle #b00000000000000000000000000000000 (size!22926 _keys!868)) (bvsge (size!22926 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun b!838000 () Bool)

(declare-fun e!467726 () Bool)

(declare-fun tp_is_empty!15307 () Bool)

(assert (=> b!838000 (= e!467726 tp_is_empty!15307)))

(declare-fun mapNonEmpty!24551 () Bool)

(declare-fun tp!47546 () Bool)

(assert (=> mapNonEmpty!24551 (= mapRes!24551 (and tp!47546 e!467726))))

(declare-fun mapValue!24551 () ValueCell!7214)

(declare-fun mapRest!24551 () (Array (_ BitVec 32) ValueCell!7214))

(declare-fun mapKey!24551 () (_ BitVec 32))

(assert (=> mapNonEmpty!24551 (= (arr!22484 _values!688) (store mapRest!24551 mapKey!24551 mapValue!24551))))

(declare-fun b!838001 () Bool)

(declare-fun res!569687 () Bool)

(assert (=> b!838001 (=> (not res!569687) (not e!467723))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838001 (= res!569687 (and (= (size!22925 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22926 _keys!868) (size!22925 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838002 () Bool)

(assert (=> b!838002 (= e!467725 tp_is_empty!15307)))

(declare-fun mapIsEmpty!24551 () Bool)

(assert (=> mapIsEmpty!24551 mapRes!24551))

(declare-fun res!569684 () Bool)

(assert (=> start!72394 (=> (not res!569684) (not e!467723))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72394 (= res!569684 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22926 _keys!868))))))

(assert (=> start!72394 e!467723))

(assert (=> start!72394 true))

(declare-fun array_inv!17966 (array!46911) Bool)

(assert (=> start!72394 (array_inv!17966 _keys!868)))

(declare-fun array_inv!17967 (array!46909) Bool)

(assert (=> start!72394 (and (array_inv!17967 _values!688) e!467722)))

(assert (= (and start!72394 res!569684) b!837998))

(assert (= (and b!837998 res!569686) b!838001))

(assert (= (and b!838001 res!569687) b!837997))

(assert (= (and b!837997 res!569685) b!837999))

(assert (= (and b!837996 condMapEmpty!24551) mapIsEmpty!24551))

(assert (= (and b!837996 (not condMapEmpty!24551)) mapNonEmpty!24551))

(get-info :version)

(assert (= (and mapNonEmpty!24551 ((_ is ValueCellFull!7214) mapValue!24551)) b!838000))

(assert (= (and b!837996 ((_ is ValueCellFull!7214) mapDefault!24551)) b!838002))

(assert (= start!72394 b!837996))

(declare-fun m!783383 () Bool)

(assert (=> b!837997 m!783383))

(declare-fun m!783385 () Bool)

(assert (=> b!837998 m!783385))

(declare-fun m!783387 () Bool)

(assert (=> mapNonEmpty!24551 m!783387))

(declare-fun m!783389 () Bool)

(assert (=> start!72394 m!783389))

(declare-fun m!783391 () Bool)

(assert (=> start!72394 m!783391))

(check-sat tp_is_empty!15307 (not b!837998) (not mapNonEmpty!24551) (not b!837997) (not start!72394))
(check-sat)
(get-model)

(declare-fun d!108123 () Bool)

(assert (=> d!108123 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!837998 d!108123))

(declare-fun d!108125 () Bool)

(assert (=> d!108125 (= (array_inv!17966 _keys!868) (bvsge (size!22926 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72394 d!108125))

(declare-fun d!108127 () Bool)

(assert (=> d!108127 (= (array_inv!17967 _values!688) (bvsge (size!22925 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72394 d!108127))

(declare-fun b!838053 () Bool)

(declare-fun e!467763 () Bool)

(declare-fun e!467765 () Bool)

(assert (=> b!838053 (= e!467763 e!467765)))

(declare-fun lt!380890 () (_ BitVec 64))

(assert (=> b!838053 (= lt!380890 (select (arr!22485 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28792 0))(
  ( (Unit!28793) )
))
(declare-fun lt!380888 () Unit!28792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46911 (_ BitVec 64) (_ BitVec 32)) Unit!28792)

(assert (=> b!838053 (= lt!380888 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380890 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!838053 (arrayContainsKey!0 _keys!868 lt!380890 #b00000000000000000000000000000000)))

(declare-fun lt!380889 () Unit!28792)

(assert (=> b!838053 (= lt!380889 lt!380888)))

(declare-fun res!569716 () Bool)

(declare-datatypes ((SeekEntryResult!8697 0))(
  ( (MissingZero!8697 (index!37159 (_ BitVec 32))) (Found!8697 (index!37160 (_ BitVec 32))) (Intermediate!8697 (undefined!9509 Bool) (index!37161 (_ BitVec 32)) (x!70676 (_ BitVec 32))) (Undefined!8697) (MissingVacant!8697 (index!37162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46911 (_ BitVec 32)) SeekEntryResult!8697)

(assert (=> b!838053 (= res!569716 (= (seekEntryOrOpen!0 (select (arr!22485 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8697 #b00000000000000000000000000000000)))))

(assert (=> b!838053 (=> (not res!569716) (not e!467765))))

(declare-fun b!838054 () Bool)

(declare-fun e!467764 () Bool)

(assert (=> b!838054 (= e!467764 e!467763)))

(declare-fun c!91429 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838054 (= c!91429 (validKeyInArray!0 (select (arr!22485 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!838055 () Bool)

(declare-fun call!36860 () Bool)

(assert (=> b!838055 (= e!467765 call!36860)))

(declare-fun d!108129 () Bool)

(declare-fun res!569717 () Bool)

(assert (=> d!108129 (=> res!569717 e!467764)))

(assert (=> d!108129 (= res!569717 (bvsge #b00000000000000000000000000000000 (size!22926 _keys!868)))))

(assert (=> d!108129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467764)))

(declare-fun b!838056 () Bool)

(assert (=> b!838056 (= e!467763 call!36860)))

(declare-fun bm!36857 () Bool)

(assert (=> bm!36857 (= call!36860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!108129 (not res!569717)) b!838054))

(assert (= (and b!838054 c!91429) b!838053))

(assert (= (and b!838054 (not c!91429)) b!838056))

(assert (= (and b!838053 res!569716) b!838055))

(assert (= (or b!838055 b!838056) bm!36857))

(declare-fun m!783413 () Bool)

(assert (=> b!838053 m!783413))

(declare-fun m!783415 () Bool)

(assert (=> b!838053 m!783415))

(declare-fun m!783417 () Bool)

(assert (=> b!838053 m!783417))

(assert (=> b!838053 m!783413))

(declare-fun m!783419 () Bool)

(assert (=> b!838053 m!783419))

(assert (=> b!838054 m!783413))

(assert (=> b!838054 m!783413))

(declare-fun m!783421 () Bool)

(assert (=> b!838054 m!783421))

(declare-fun m!783423 () Bool)

(assert (=> bm!36857 m!783423))

(assert (=> b!837997 d!108129))

(declare-fun condMapEmpty!24560 () Bool)

(declare-fun mapDefault!24560 () ValueCell!7214)

(assert (=> mapNonEmpty!24551 (= condMapEmpty!24560 (= mapRest!24551 ((as const (Array (_ BitVec 32) ValueCell!7214)) mapDefault!24560)))))

(declare-fun e!467770 () Bool)

(declare-fun mapRes!24560 () Bool)

(assert (=> mapNonEmpty!24551 (= tp!47546 (and e!467770 mapRes!24560))))

(declare-fun b!838063 () Bool)

(declare-fun e!467771 () Bool)

(assert (=> b!838063 (= e!467771 tp_is_empty!15307)))

(declare-fun mapIsEmpty!24560 () Bool)

(assert (=> mapIsEmpty!24560 mapRes!24560))

(declare-fun b!838064 () Bool)

(assert (=> b!838064 (= e!467770 tp_is_empty!15307)))

(declare-fun mapNonEmpty!24560 () Bool)

(declare-fun tp!47555 () Bool)

(assert (=> mapNonEmpty!24560 (= mapRes!24560 (and tp!47555 e!467771))))

(declare-fun mapValue!24560 () ValueCell!7214)

(declare-fun mapRest!24560 () (Array (_ BitVec 32) ValueCell!7214))

(declare-fun mapKey!24560 () (_ BitVec 32))

(assert (=> mapNonEmpty!24560 (= mapRest!24551 (store mapRest!24560 mapKey!24560 mapValue!24560))))

(assert (= (and mapNonEmpty!24551 condMapEmpty!24560) mapIsEmpty!24560))

(assert (= (and mapNonEmpty!24551 (not condMapEmpty!24560)) mapNonEmpty!24560))

(assert (= (and mapNonEmpty!24560 ((_ is ValueCellFull!7214) mapValue!24560)) b!838063))

(assert (= (and mapNonEmpty!24551 ((_ is ValueCellFull!7214) mapDefault!24560)) b!838064))

(declare-fun m!783425 () Bool)

(assert (=> mapNonEmpty!24560 m!783425))

(check-sat tp_is_empty!15307 (not b!838054) (not b!838053) (not bm!36857) (not mapNonEmpty!24560))
(check-sat)
