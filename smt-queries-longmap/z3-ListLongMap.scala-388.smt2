; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7326 () Bool)

(assert start!7326)

(declare-fun b!47004 () Bool)

(declare-fun e!30036 () Bool)

(declare-fun tp_is_empty!2005 () Bool)

(assert (=> b!47004 (= e!30036 tp_is_empty!2005)))

(declare-fun b!47006 () Bool)

(declare-fun e!30038 () Bool)

(assert (=> b!47006 (= e!30038 tp_is_empty!2005)))

(declare-fun mapNonEmpty!2036 () Bool)

(declare-fun mapRes!2036 () Bool)

(declare-fun tp!6185 () Bool)

(assert (=> mapNonEmpty!2036 (= mapRes!2036 (and tp!6185 e!30036))))

(declare-datatypes ((V!2407 0))(
  ( (V!2408 (val!1041 Int)) )
))
(declare-datatypes ((ValueCell!713 0))(
  ( (ValueCellFull!713 (v!2099 V!2407)) (EmptyCell!713) )
))
(declare-fun mapValue!2036 () ValueCell!713)

(declare-datatypes ((array!3048 0))(
  ( (array!3049 (arr!1463 (Array (_ BitVec 32) ValueCell!713)) (size!1686 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3048)

(declare-fun mapKey!2036 () (_ BitVec 32))

(declare-fun mapRest!2036 () (Array (_ BitVec 32) ValueCell!713))

(assert (=> mapNonEmpty!2036 (= (arr!1463 _values!1550) (store mapRest!2036 mapKey!2036 mapValue!2036))))

(declare-fun b!47007 () Bool)

(declare-fun e!30039 () Bool)

(assert (=> b!47007 (= e!30039 (and e!30038 mapRes!2036))))

(declare-fun condMapEmpty!2036 () Bool)

(declare-fun mapDefault!2036 () ValueCell!713)

(assert (=> b!47007 (= condMapEmpty!2036 (= (arr!1463 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!713)) mapDefault!2036)))))

(declare-fun mapIsEmpty!2036 () Bool)

(assert (=> mapIsEmpty!2036 mapRes!2036))

(declare-datatypes ((array!3050 0))(
  ( (array!3051 (arr!1464 (Array (_ BitVec 32) (_ BitVec 64))) (size!1687 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3050)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun b!47005 () Bool)

(declare-fun e!30040 () Bool)

(assert (=> b!47005 (= e!30040 (and (= (size!1686 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1687 _keys!1940) (size!1686 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (= (size!1687 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)) (bvsgt #b00000000000000000000000000000000 (size!1687 _keys!1940))))))

(declare-fun res!27397 () Bool)

(assert (=> start!7326 (=> (not res!27397) (not e!30040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7326 (= res!27397 (validMask!0 mask!2458))))

(assert (=> start!7326 e!30040))

(assert (=> start!7326 true))

(declare-fun array_inv!882 (array!3048) Bool)

(assert (=> start!7326 (and (array_inv!882 _values!1550) e!30039)))

(declare-fun array_inv!883 (array!3050) Bool)

(assert (=> start!7326 (array_inv!883 _keys!1940)))

(assert (= (and start!7326 res!27397) b!47005))

(assert (= (and b!47007 condMapEmpty!2036) mapIsEmpty!2036))

(assert (= (and b!47007 (not condMapEmpty!2036)) mapNonEmpty!2036))

(get-info :version)

(assert (= (and mapNonEmpty!2036 ((_ is ValueCellFull!713) mapValue!2036)) b!47004))

(assert (= (and b!47007 ((_ is ValueCellFull!713) mapDefault!2036)) b!47006))

(assert (= start!7326 b!47007))

(declare-fun m!41351 () Bool)

(assert (=> mapNonEmpty!2036 m!41351))

(declare-fun m!41353 () Bool)

(assert (=> start!7326 m!41353))

(declare-fun m!41355 () Bool)

(assert (=> start!7326 m!41355))

(declare-fun m!41357 () Bool)

(assert (=> start!7326 m!41357))

(check-sat (not start!7326) (not mapNonEmpty!2036) tp_is_empty!2005)
(check-sat)
(get-model)

(declare-fun d!9381 () Bool)

(assert (=> d!9381 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7326 d!9381))

(declare-fun d!9383 () Bool)

(assert (=> d!9383 (= (array_inv!882 _values!1550) (bvsge (size!1686 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7326 d!9383))

(declare-fun d!9385 () Bool)

(assert (=> d!9385 (= (array_inv!883 _keys!1940) (bvsge (size!1687 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7326 d!9385))

(declare-fun b!47039 () Bool)

(declare-fun e!30075 () Bool)

(assert (=> b!47039 (= e!30075 tp_is_empty!2005)))

(declare-fun mapNonEmpty!2045 () Bool)

(declare-fun mapRes!2045 () Bool)

(declare-fun tp!6194 () Bool)

(declare-fun e!30076 () Bool)

(assert (=> mapNonEmpty!2045 (= mapRes!2045 (and tp!6194 e!30076))))

(declare-fun mapKey!2045 () (_ BitVec 32))

(declare-fun mapRest!2045 () (Array (_ BitVec 32) ValueCell!713))

(declare-fun mapValue!2045 () ValueCell!713)

(assert (=> mapNonEmpty!2045 (= mapRest!2036 (store mapRest!2045 mapKey!2045 mapValue!2045))))

(declare-fun condMapEmpty!2045 () Bool)

(declare-fun mapDefault!2045 () ValueCell!713)

(assert (=> mapNonEmpty!2036 (= condMapEmpty!2045 (= mapRest!2036 ((as const (Array (_ BitVec 32) ValueCell!713)) mapDefault!2045)))))

(assert (=> mapNonEmpty!2036 (= tp!6185 (and e!30075 mapRes!2045))))

(declare-fun mapIsEmpty!2045 () Bool)

(assert (=> mapIsEmpty!2045 mapRes!2045))

(declare-fun b!47038 () Bool)

(assert (=> b!47038 (= e!30076 tp_is_empty!2005)))

(assert (= (and mapNonEmpty!2036 condMapEmpty!2045) mapIsEmpty!2045))

(assert (= (and mapNonEmpty!2036 (not condMapEmpty!2045)) mapNonEmpty!2045))

(assert (= (and mapNonEmpty!2045 ((_ is ValueCellFull!713) mapValue!2045)) b!47038))

(assert (= (and mapNonEmpty!2036 ((_ is ValueCellFull!713) mapDefault!2045)) b!47039))

(declare-fun m!41375 () Bool)

(assert (=> mapNonEmpty!2045 m!41375))

(check-sat (not mapNonEmpty!2045) tp_is_empty!2005)
(check-sat)
