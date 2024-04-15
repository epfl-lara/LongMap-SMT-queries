; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!456 () Bool)

(assert start!456)

(declare-fun b!2705 () Bool)

(declare-fun e!1053 () Bool)

(declare-fun tp_is_empty!61 () Bool)

(assert (=> b!2705 (= e!1053 tp_is_empty!61)))

(declare-fun mapIsEmpty!32 () Bool)

(declare-fun mapRes!32 () Bool)

(assert (=> mapIsEmpty!32 mapRes!32))

(declare-fun b!2706 () Bool)

(declare-fun e!1052 () Bool)

(declare-fun e!1050 () Bool)

(assert (=> b!2706 (= e!1052 (and e!1050 mapRes!32))))

(declare-fun condMapEmpty!32 () Bool)

(declare-datatypes ((V!259 0))(
  ( (V!260 (val!36 Int)) )
))
(declare-datatypes ((ValueCell!14 0))(
  ( (ValueCellFull!14 (v!1122 V!259)) (EmptyCell!14) )
))
(declare-datatypes ((array!51 0))(
  ( (array!52 (arr!24 (Array (_ BitVec 32) ValueCell!14)) (size!86 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!51)

(declare-fun mapDefault!32 () ValueCell!14)

(assert (=> b!2706 (= condMapEmpty!32 (= (arr!24 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!14)) mapDefault!32)))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun b!2707 () Bool)

(declare-datatypes ((array!53 0))(
  ( (array!54 (arr!25 (Array (_ BitVec 32) (_ BitVec 64))) (size!87 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!53)

(declare-fun e!1049 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2707 (= e!1049 (and (= (size!86 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!87 _keys!1806) (size!86 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011) (= (size!87 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)) (bvsgt #b00000000000000000000000000000000 (size!87 _keys!1806))))))

(declare-fun b!2708 () Bool)

(assert (=> b!2708 (= e!1050 tp_is_empty!61)))

(declare-fun res!4811 () Bool)

(assert (=> start!456 (=> (not res!4811) (not e!1049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!456 (= res!4811 (validMask!0 mask!2250))))

(assert (=> start!456 e!1049))

(assert (=> start!456 true))

(declare-fun array_inv!13 (array!51) Bool)

(assert (=> start!456 (and (array_inv!13 _values!1492) e!1052)))

(declare-fun array_inv!14 (array!53) Bool)

(assert (=> start!456 (array_inv!14 _keys!1806)))

(declare-fun mapNonEmpty!32 () Bool)

(declare-fun tp!272 () Bool)

(assert (=> mapNonEmpty!32 (= mapRes!32 (and tp!272 e!1053))))

(declare-fun mapRest!32 () (Array (_ BitVec 32) ValueCell!14))

(declare-fun mapKey!32 () (_ BitVec 32))

(declare-fun mapValue!32 () ValueCell!14)

(assert (=> mapNonEmpty!32 (= (arr!24 _values!1492) (store mapRest!32 mapKey!32 mapValue!32))))

(assert (= (and start!456 res!4811) b!2707))

(assert (= (and b!2706 condMapEmpty!32) mapIsEmpty!32))

(assert (= (and b!2706 (not condMapEmpty!32)) mapNonEmpty!32))

(get-info :version)

(assert (= (and mapNonEmpty!32 ((_ is ValueCellFull!14) mapValue!32)) b!2705))

(assert (= (and b!2706 ((_ is ValueCellFull!14) mapDefault!32)) b!2708))

(assert (= start!456 b!2706))

(declare-fun m!1189 () Bool)

(assert (=> start!456 m!1189))

(declare-fun m!1191 () Bool)

(assert (=> start!456 m!1191))

(declare-fun m!1193 () Bool)

(assert (=> start!456 m!1193))

(declare-fun m!1195 () Bool)

(assert (=> mapNonEmpty!32 m!1195))

(check-sat (not start!456) (not mapNonEmpty!32) tp_is_empty!61)
(check-sat)
(get-model)

(declare-fun d!565 () Bool)

(assert (=> d!565 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!456 d!565))

(declare-fun d!567 () Bool)

(assert (=> d!567 (= (array_inv!13 _values!1492) (bvsge (size!86 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!456 d!567))

(declare-fun d!569 () Bool)

(assert (=> d!569 (= (array_inv!14 _keys!1806) (bvsge (size!87 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!456 d!569))

(declare-fun mapNonEmpty!41 () Bool)

(declare-fun mapRes!41 () Bool)

(declare-fun tp!281 () Bool)

(declare-fun e!1088 () Bool)

(assert (=> mapNonEmpty!41 (= mapRes!41 (and tp!281 e!1088))))

(declare-fun mapKey!41 () (_ BitVec 32))

(declare-fun mapValue!41 () ValueCell!14)

(declare-fun mapRest!41 () (Array (_ BitVec 32) ValueCell!14))

(assert (=> mapNonEmpty!41 (= mapRest!32 (store mapRest!41 mapKey!41 mapValue!41))))

(declare-fun b!2739 () Bool)

(assert (=> b!2739 (= e!1088 tp_is_empty!61)))

(declare-fun mapIsEmpty!41 () Bool)

(assert (=> mapIsEmpty!41 mapRes!41))

(declare-fun condMapEmpty!41 () Bool)

(declare-fun mapDefault!41 () ValueCell!14)

(assert (=> mapNonEmpty!32 (= condMapEmpty!41 (= mapRest!32 ((as const (Array (_ BitVec 32) ValueCell!14)) mapDefault!41)))))

(declare-fun e!1089 () Bool)

(assert (=> mapNonEmpty!32 (= tp!272 (and e!1089 mapRes!41))))

(declare-fun b!2740 () Bool)

(assert (=> b!2740 (= e!1089 tp_is_empty!61)))

(assert (= (and mapNonEmpty!32 condMapEmpty!41) mapIsEmpty!41))

(assert (= (and mapNonEmpty!32 (not condMapEmpty!41)) mapNonEmpty!41))

(assert (= (and mapNonEmpty!41 ((_ is ValueCellFull!14) mapValue!41)) b!2739))

(assert (= (and mapNonEmpty!32 ((_ is ValueCellFull!14) mapDefault!41)) b!2740))

(declare-fun m!1213 () Bool)

(assert (=> mapNonEmpty!41 m!1213))

(check-sat (not mapNonEmpty!41) tp_is_empty!61)
(check-sat)
