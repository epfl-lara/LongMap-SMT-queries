; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72408 () Bool)

(assert start!72408)

(declare-fun mapNonEmpty!24563 () Bool)

(declare-fun mapRes!24563 () Bool)

(declare-fun tp!47558 () Bool)

(declare-fun e!467785 () Bool)

(assert (=> mapNonEmpty!24563 (= mapRes!24563 (and tp!47558 e!467785))))

(declare-fun mapKey!24563 () (_ BitVec 32))

(declare-datatypes ((V!25465 0))(
  ( (V!25466 (val!7704 Int)) )
))
(declare-datatypes ((ValueCell!7217 0))(
  ( (ValueCellFull!7217 (v!10128 V!25465)) (EmptyCell!7217) )
))
(declare-fun mapValue!24563 () ValueCell!7217)

(declare-fun mapRest!24563 () (Array (_ BitVec 32) ValueCell!7217))

(declare-datatypes ((array!46923 0))(
  ( (array!46924 (arr!22490 (Array (_ BitVec 32) ValueCell!7217)) (size!22931 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46923)

(assert (=> mapNonEmpty!24563 (= (arr!22490 _values!688) (store mapRest!24563 mapKey!24563 mapValue!24563))))

(declare-fun b!838081 () Bool)

(declare-fun e!467782 () Bool)

(declare-fun e!467786 () Bool)

(assert (=> b!838081 (= e!467782 (and e!467786 mapRes!24563))))

(declare-fun condMapEmpty!24563 () Bool)

(declare-fun mapDefault!24563 () ValueCell!7217)

(assert (=> b!838081 (= condMapEmpty!24563 (= (arr!22490 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7217)) mapDefault!24563)))))

(declare-fun mapIsEmpty!24563 () Bool)

(assert (=> mapIsEmpty!24563 mapRes!24563))

(declare-fun b!838083 () Bool)

(declare-fun res!569731 () Bool)

(declare-fun e!467783 () Bool)

(assert (=> b!838083 (=> (not res!569731) (not e!467783))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838083 (= res!569731 (validMask!0 mask!1196))))

(declare-fun b!838084 () Bool)

(declare-fun tp_is_empty!15313 () Bool)

(assert (=> b!838084 (= e!467785 tp_is_empty!15313)))

(declare-fun b!838085 () Bool)

(declare-fun res!569728 () Bool)

(assert (=> b!838085 (=> (not res!569728) (not e!467783))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!46925 0))(
  ( (array!46926 (arr!22491 (Array (_ BitVec 32) (_ BitVec 64))) (size!22932 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46925)

(assert (=> b!838085 (= res!569728 (and (= (size!22931 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22932 _keys!868) (size!22931 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838082 () Bool)

(declare-datatypes ((List!15925 0))(
  ( (Nil!15922) (Cons!15921 (h!17058 (_ BitVec 64)) (t!22288 List!15925)) )
))
(declare-fun noDuplicate!1298 (List!15925) Bool)

(assert (=> b!838082 (= e!467783 (not (noDuplicate!1298 Nil!15922)))))

(declare-fun res!569729 () Bool)

(assert (=> start!72408 (=> (not res!569729) (not e!467783))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72408 (= res!569729 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22932 _keys!868))))))

(assert (=> start!72408 e!467783))

(assert (=> start!72408 true))

(declare-fun array_inv!17972 (array!46925) Bool)

(assert (=> start!72408 (array_inv!17972 _keys!868)))

(declare-fun array_inv!17973 (array!46923) Bool)

(assert (=> start!72408 (and (array_inv!17973 _values!688) e!467782)))

(declare-fun b!838086 () Bool)

(declare-fun res!569730 () Bool)

(assert (=> b!838086 (=> (not res!569730) (not e!467783))))

(assert (=> b!838086 (= res!569730 (and (bvsle #b00000000000000000000000000000000 (size!22932 _keys!868)) (bvslt (size!22932 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun b!838087 () Bool)

(declare-fun res!569732 () Bool)

(assert (=> b!838087 (=> (not res!569732) (not e!467783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46925 (_ BitVec 32)) Bool)

(assert (=> b!838087 (= res!569732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838088 () Bool)

(assert (=> b!838088 (= e!467786 tp_is_empty!15313)))

(assert (= (and start!72408 res!569729) b!838083))

(assert (= (and b!838083 res!569731) b!838085))

(assert (= (and b!838085 res!569728) b!838087))

(assert (= (and b!838087 res!569732) b!838086))

(assert (= (and b!838086 res!569730) b!838082))

(assert (= (and b!838081 condMapEmpty!24563) mapIsEmpty!24563))

(assert (= (and b!838081 (not condMapEmpty!24563)) mapNonEmpty!24563))

(get-info :version)

(assert (= (and mapNonEmpty!24563 ((_ is ValueCellFull!7217) mapValue!24563)) b!838084))

(assert (= (and b!838081 ((_ is ValueCellFull!7217) mapDefault!24563)) b!838088))

(assert (= start!72408 b!838081))

(declare-fun m!783427 () Bool)

(assert (=> b!838083 m!783427))

(declare-fun m!783429 () Bool)

(assert (=> mapNonEmpty!24563 m!783429))

(declare-fun m!783431 () Bool)

(assert (=> start!72408 m!783431))

(declare-fun m!783433 () Bool)

(assert (=> start!72408 m!783433))

(declare-fun m!783435 () Bool)

(assert (=> b!838082 m!783435))

(declare-fun m!783437 () Bool)

(assert (=> b!838087 m!783437))

(check-sat (not mapNonEmpty!24563) (not b!838083) tp_is_empty!15313 (not b!838082) (not start!72408) (not b!838087))
(check-sat)
(get-model)

(declare-fun d!108133 () Bool)

(assert (=> d!108133 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!838083 d!108133))

(declare-fun b!838145 () Bool)

(declare-fun e!467823 () Bool)

(declare-fun call!36863 () Bool)

(assert (=> b!838145 (= e!467823 call!36863)))

(declare-fun bm!36860 () Bool)

(assert (=> bm!36860 (= call!36863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108135 () Bool)

(declare-fun res!569767 () Bool)

(declare-fun e!467825 () Bool)

(assert (=> d!108135 (=> res!569767 e!467825)))

(assert (=> d!108135 (= res!569767 (bvsge #b00000000000000000000000000000000 (size!22932 _keys!868)))))

(assert (=> d!108135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467825)))

(declare-fun b!838146 () Bool)

(declare-fun e!467824 () Bool)

(assert (=> b!838146 (= e!467824 call!36863)))

(declare-fun b!838147 () Bool)

(assert (=> b!838147 (= e!467825 e!467824)))

(declare-fun c!91432 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838147 (= c!91432 (validKeyInArray!0 (select (arr!22491 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!838148 () Bool)

(assert (=> b!838148 (= e!467824 e!467823)))

(declare-fun lt!380897 () (_ BitVec 64))

(assert (=> b!838148 (= lt!380897 (select (arr!22491 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28794 0))(
  ( (Unit!28795) )
))
(declare-fun lt!380898 () Unit!28794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46925 (_ BitVec 64) (_ BitVec 32)) Unit!28794)

(assert (=> b!838148 (= lt!380898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380897 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!838148 (arrayContainsKey!0 _keys!868 lt!380897 #b00000000000000000000000000000000)))

(declare-fun lt!380899 () Unit!28794)

(assert (=> b!838148 (= lt!380899 lt!380898)))

(declare-fun res!569768 () Bool)

(declare-datatypes ((SeekEntryResult!8698 0))(
  ( (MissingZero!8698 (index!37163 (_ BitVec 32))) (Found!8698 (index!37164 (_ BitVec 32))) (Intermediate!8698 (undefined!9510 Bool) (index!37165 (_ BitVec 32)) (x!70687 (_ BitVec 32))) (Undefined!8698) (MissingVacant!8698 (index!37166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46925 (_ BitVec 32)) SeekEntryResult!8698)

(assert (=> b!838148 (= res!569768 (= (seekEntryOrOpen!0 (select (arr!22491 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8698 #b00000000000000000000000000000000)))))

(assert (=> b!838148 (=> (not res!569768) (not e!467823))))

(assert (= (and d!108135 (not res!569767)) b!838147))

(assert (= (and b!838147 c!91432) b!838148))

(assert (= (and b!838147 (not c!91432)) b!838146))

(assert (= (and b!838148 res!569768) b!838145))

(assert (= (or b!838145 b!838146) bm!36860))

(declare-fun m!783463 () Bool)

(assert (=> bm!36860 m!783463))

(declare-fun m!783465 () Bool)

(assert (=> b!838147 m!783465))

(assert (=> b!838147 m!783465))

(declare-fun m!783467 () Bool)

(assert (=> b!838147 m!783467))

(assert (=> b!838148 m!783465))

(declare-fun m!783469 () Bool)

(assert (=> b!838148 m!783469))

(declare-fun m!783471 () Bool)

(assert (=> b!838148 m!783471))

(assert (=> b!838148 m!783465))

(declare-fun m!783473 () Bool)

(assert (=> b!838148 m!783473))

(assert (=> b!838087 d!108135))

(declare-fun d!108137 () Bool)

(declare-fun res!569773 () Bool)

(declare-fun e!467830 () Bool)

(assert (=> d!108137 (=> res!569773 e!467830)))

(assert (=> d!108137 (= res!569773 ((_ is Nil!15922) Nil!15922))))

(assert (=> d!108137 (= (noDuplicate!1298 Nil!15922) e!467830)))

(declare-fun b!838153 () Bool)

(declare-fun e!467831 () Bool)

(assert (=> b!838153 (= e!467830 e!467831)))

(declare-fun res!569774 () Bool)

(assert (=> b!838153 (=> (not res!569774) (not e!467831))))

(declare-fun contains!4192 (List!15925 (_ BitVec 64)) Bool)

(assert (=> b!838153 (= res!569774 (not (contains!4192 (t!22288 Nil!15922) (h!17058 Nil!15922))))))

(declare-fun b!838154 () Bool)

(assert (=> b!838154 (= e!467831 (noDuplicate!1298 (t!22288 Nil!15922)))))

(assert (= (and d!108137 (not res!569773)) b!838153))

(assert (= (and b!838153 res!569774) b!838154))

(declare-fun m!783475 () Bool)

(assert (=> b!838153 m!783475))

(declare-fun m!783477 () Bool)

(assert (=> b!838154 m!783477))

(assert (=> b!838082 d!108137))

(declare-fun d!108139 () Bool)

(assert (=> d!108139 (= (array_inv!17972 _keys!868) (bvsge (size!22932 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72408 d!108139))

(declare-fun d!108141 () Bool)

(assert (=> d!108141 (= (array_inv!17973 _values!688) (bvsge (size!22931 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72408 d!108141))

(declare-fun b!838162 () Bool)

(declare-fun e!467836 () Bool)

(assert (=> b!838162 (= e!467836 tp_is_empty!15313)))

(declare-fun mapNonEmpty!24572 () Bool)

(declare-fun mapRes!24572 () Bool)

(declare-fun tp!47567 () Bool)

(declare-fun e!467837 () Bool)

(assert (=> mapNonEmpty!24572 (= mapRes!24572 (and tp!47567 e!467837))))

(declare-fun mapValue!24572 () ValueCell!7217)

(declare-fun mapKey!24572 () (_ BitVec 32))

(declare-fun mapRest!24572 () (Array (_ BitVec 32) ValueCell!7217))

(assert (=> mapNonEmpty!24572 (= mapRest!24563 (store mapRest!24572 mapKey!24572 mapValue!24572))))

(declare-fun condMapEmpty!24572 () Bool)

(declare-fun mapDefault!24572 () ValueCell!7217)

(assert (=> mapNonEmpty!24563 (= condMapEmpty!24572 (= mapRest!24563 ((as const (Array (_ BitVec 32) ValueCell!7217)) mapDefault!24572)))))

(assert (=> mapNonEmpty!24563 (= tp!47558 (and e!467836 mapRes!24572))))

(declare-fun mapIsEmpty!24572 () Bool)

(assert (=> mapIsEmpty!24572 mapRes!24572))

(declare-fun b!838161 () Bool)

(assert (=> b!838161 (= e!467837 tp_is_empty!15313)))

(assert (= (and mapNonEmpty!24563 condMapEmpty!24572) mapIsEmpty!24572))

(assert (= (and mapNonEmpty!24563 (not condMapEmpty!24572)) mapNonEmpty!24572))

(assert (= (and mapNonEmpty!24572 ((_ is ValueCellFull!7217) mapValue!24572)) b!838161))

(assert (= (and mapNonEmpty!24563 ((_ is ValueCellFull!7217) mapDefault!24572)) b!838162))

(declare-fun m!783479 () Bool)

(assert (=> mapNonEmpty!24572 m!783479))

(check-sat (not bm!36860) (not b!838153) tp_is_empty!15313 (not b!838148) (not b!838147) (not mapNonEmpty!24572) (not b!838154))
(check-sat)
