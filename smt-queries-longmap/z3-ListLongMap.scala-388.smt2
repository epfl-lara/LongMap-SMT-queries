; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7330 () Bool)

(assert start!7330)

(declare-fun mapNonEmpty!2036 () Bool)

(declare-fun mapRes!2036 () Bool)

(declare-fun tp!6185 () Bool)

(declare-fun e!30045 () Bool)

(assert (=> mapNonEmpty!2036 (= mapRes!2036 (and tp!6185 e!30045))))

(declare-datatypes ((V!2407 0))(
  ( (V!2408 (val!1041 Int)) )
))
(declare-datatypes ((ValueCell!713 0))(
  ( (ValueCellFull!713 (v!2102 V!2407)) (EmptyCell!713) )
))
(declare-fun mapRest!2036 () (Array (_ BitVec 32) ValueCell!713))

(declare-fun mapValue!2036 () ValueCell!713)

(declare-fun mapKey!2036 () (_ BitVec 32))

(declare-datatypes ((array!3058 0))(
  ( (array!3059 (arr!1468 (Array (_ BitVec 32) ValueCell!713)) (size!1690 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3058)

(assert (=> mapNonEmpty!2036 (= (arr!1468 _values!1550) (store mapRest!2036 mapKey!2036 mapValue!2036))))

(declare-fun b!47013 () Bool)

(declare-fun e!30042 () Bool)

(declare-fun tp_is_empty!2005 () Bool)

(assert (=> b!47013 (= e!30042 tp_is_empty!2005)))

(declare-fun b!47014 () Bool)

(declare-fun e!30044 () Bool)

(assert (=> b!47014 (= e!30044 (and e!30042 mapRes!2036))))

(declare-fun condMapEmpty!2036 () Bool)

(declare-fun mapDefault!2036 () ValueCell!713)

(assert (=> b!47014 (= condMapEmpty!2036 (= (arr!1468 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!713)) mapDefault!2036)))))

(declare-fun b!47015 () Bool)

(assert (=> b!47015 (= e!30045 tp_is_empty!2005)))

(declare-fun res!27392 () Bool)

(declare-fun e!30046 () Bool)

(assert (=> start!7330 (=> (not res!27392) (not e!30046))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7330 (= res!27392 (validMask!0 mask!2458))))

(assert (=> start!7330 e!30046))

(assert (=> start!7330 true))

(declare-fun array_inv!870 (array!3058) Bool)

(assert (=> start!7330 (and (array_inv!870 _values!1550) e!30044)))

(declare-datatypes ((array!3060 0))(
  ( (array!3061 (arr!1469 (Array (_ BitVec 32) (_ BitVec 64))) (size!1691 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3060)

(declare-fun array_inv!871 (array!3060) Bool)

(assert (=> start!7330 (array_inv!871 _keys!1940)))

(declare-fun b!47016 () Bool)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47016 (= e!30046 (and (= (size!1690 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1691 _keys!1940) (size!1690 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (= (size!1691 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)) (bvsgt #b00000000000000000000000000000000 (size!1691 _keys!1940))))))

(declare-fun mapIsEmpty!2036 () Bool)

(assert (=> mapIsEmpty!2036 mapRes!2036))

(assert (= (and start!7330 res!27392) b!47016))

(assert (= (and b!47014 condMapEmpty!2036) mapIsEmpty!2036))

(assert (= (and b!47014 (not condMapEmpty!2036)) mapNonEmpty!2036))

(get-info :version)

(assert (= (and mapNonEmpty!2036 ((_ is ValueCellFull!713) mapValue!2036)) b!47015))

(assert (= (and b!47014 ((_ is ValueCellFull!713) mapDefault!2036)) b!47013))

(assert (= start!7330 b!47014))

(declare-fun m!41309 () Bool)

(assert (=> mapNonEmpty!2036 m!41309))

(declare-fun m!41311 () Bool)

(assert (=> start!7330 m!41311))

(declare-fun m!41313 () Bool)

(assert (=> start!7330 m!41313))

(declare-fun m!41315 () Bool)

(assert (=> start!7330 m!41315))

(check-sat (not start!7330) (not mapNonEmpty!2036) tp_is_empty!2005)
(check-sat)
(get-model)

(declare-fun d!9395 () Bool)

(assert (=> d!9395 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7330 d!9395))

(declare-fun d!9397 () Bool)

(assert (=> d!9397 (= (array_inv!870 _values!1550) (bvsge (size!1690 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7330 d!9397))

(declare-fun d!9399 () Bool)

(assert (=> d!9399 (= (array_inv!871 _keys!1940) (bvsge (size!1691 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7330 d!9399))

(declare-fun b!47048 () Bool)

(declare-fun e!30081 () Bool)

(assert (=> b!47048 (= e!30081 tp_is_empty!2005)))

(declare-fun condMapEmpty!2045 () Bool)

(declare-fun mapDefault!2045 () ValueCell!713)

(assert (=> mapNonEmpty!2036 (= condMapEmpty!2045 (= mapRest!2036 ((as const (Array (_ BitVec 32) ValueCell!713)) mapDefault!2045)))))

(declare-fun mapRes!2045 () Bool)

(assert (=> mapNonEmpty!2036 (= tp!6185 (and e!30081 mapRes!2045))))

(declare-fun mapIsEmpty!2045 () Bool)

(assert (=> mapIsEmpty!2045 mapRes!2045))

(declare-fun mapNonEmpty!2045 () Bool)

(declare-fun tp!6194 () Bool)

(declare-fun e!30082 () Bool)

(assert (=> mapNonEmpty!2045 (= mapRes!2045 (and tp!6194 e!30082))))

(declare-fun mapKey!2045 () (_ BitVec 32))

(declare-fun mapRest!2045 () (Array (_ BitVec 32) ValueCell!713))

(declare-fun mapValue!2045 () ValueCell!713)

(assert (=> mapNonEmpty!2045 (= mapRest!2036 (store mapRest!2045 mapKey!2045 mapValue!2045))))

(declare-fun b!47047 () Bool)

(assert (=> b!47047 (= e!30082 tp_is_empty!2005)))

(assert (= (and mapNonEmpty!2036 condMapEmpty!2045) mapIsEmpty!2045))

(assert (= (and mapNonEmpty!2036 (not condMapEmpty!2045)) mapNonEmpty!2045))

(assert (= (and mapNonEmpty!2045 ((_ is ValueCellFull!713) mapValue!2045)) b!47047))

(assert (= (and mapNonEmpty!2036 ((_ is ValueCellFull!713) mapDefault!2045)) b!47048))

(declare-fun m!41333 () Bool)

(assert (=> mapNonEmpty!2045 m!41333))

(check-sat (not mapNonEmpty!2045) tp_is_empty!2005)
(check-sat)
