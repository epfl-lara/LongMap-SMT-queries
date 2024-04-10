; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7320 () Bool)

(assert start!7320)

(declare-fun b!47046 () Bool)

(declare-fun e!30049 () Bool)

(declare-fun e!30052 () Bool)

(declare-fun mapRes!2030 () Bool)

(assert (=> b!47046 (= e!30049 (and e!30052 mapRes!2030))))

(declare-fun condMapEmpty!2030 () Bool)

(declare-datatypes ((V!2401 0))(
  ( (V!2402 (val!1039 Int)) )
))
(declare-datatypes ((ValueCell!711 0))(
  ( (ValueCellFull!711 (v!2099 V!2401)) (EmptyCell!711) )
))
(declare-datatypes ((array!3065 0))(
  ( (array!3066 (arr!1472 (Array (_ BitVec 32) ValueCell!711)) (size!1694 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3065)

(declare-fun mapDefault!2030 () ValueCell!711)

(assert (=> b!47046 (= condMapEmpty!2030 (= (arr!1472 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!711)) mapDefault!2030)))))

(declare-fun b!47047 () Bool)

(declare-fun tp_is_empty!2001 () Bool)

(assert (=> b!47047 (= e!30052 tp_is_empty!2001)))

(declare-fun mapNonEmpty!2030 () Bool)

(declare-fun tp!6179 () Bool)

(declare-fun e!30053 () Bool)

(assert (=> mapNonEmpty!2030 (= mapRes!2030 (and tp!6179 e!30053))))

(declare-fun mapKey!2030 () (_ BitVec 32))

(declare-fun mapRest!2030 () (Array (_ BitVec 32) ValueCell!711))

(declare-fun mapValue!2030 () ValueCell!711)

(assert (=> mapNonEmpty!2030 (= (arr!1472 _values!1550) (store mapRest!2030 mapKey!2030 mapValue!2030))))

(declare-fun mapIsEmpty!2030 () Bool)

(assert (=> mapIsEmpty!2030 mapRes!2030))

(declare-fun res!27411 () Bool)

(declare-fun e!30051 () Bool)

(assert (=> start!7320 (=> (not res!27411) (not e!30051))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7320 (= res!27411 (validMask!0 mask!2458))))

(assert (=> start!7320 e!30051))

(assert (=> start!7320 true))

(declare-fun array_inv!882 (array!3065) Bool)

(assert (=> start!7320 (and (array_inv!882 _values!1550) e!30049)))

(declare-datatypes ((array!3067 0))(
  ( (array!3068 (arr!1473 (Array (_ BitVec 32) (_ BitVec 64))) (size!1695 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3067)

(declare-fun array_inv!883 (array!3067) Bool)

(assert (=> start!7320 (array_inv!883 _keys!1940)))

(declare-fun b!47048 () Bool)

(assert (=> b!47048 (= e!30053 tp_is_empty!2001)))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun b!47049 () Bool)

(assert (=> b!47049 (= e!30051 (and (= (size!1694 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1695 _keys!1940) (size!1694 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (not (= (size!1695 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)))))))

(assert (= (and start!7320 res!27411) b!47049))

(assert (= (and b!47046 condMapEmpty!2030) mapIsEmpty!2030))

(assert (= (and b!47046 (not condMapEmpty!2030)) mapNonEmpty!2030))

(get-info :version)

(assert (= (and mapNonEmpty!2030 ((_ is ValueCellFull!711) mapValue!2030)) b!47048))

(assert (= (and b!47046 ((_ is ValueCellFull!711) mapDefault!2030)) b!47047))

(assert (= start!7320 b!47046))

(declare-fun m!41417 () Bool)

(assert (=> mapNonEmpty!2030 m!41417))

(declare-fun m!41419 () Bool)

(assert (=> start!7320 m!41419))

(declare-fun m!41421 () Bool)

(assert (=> start!7320 m!41421))

(declare-fun m!41423 () Bool)

(assert (=> start!7320 m!41423))

(check-sat (not start!7320) (not mapNonEmpty!2030) tp_is_empty!2001)
(check-sat)
