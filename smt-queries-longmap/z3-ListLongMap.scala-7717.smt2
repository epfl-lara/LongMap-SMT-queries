; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97194 () Bool)

(assert start!97194)

(declare-fun b!1104405 () Bool)

(declare-fun e!630483 () Bool)

(declare-fun e!630484 () Bool)

(declare-fun mapRes!42712 () Bool)

(assert (=> b!1104405 (= e!630483 (and e!630484 mapRes!42712))))

(declare-fun condMapEmpty!42712 () Bool)

(declare-datatypes ((V!41497 0))(
  ( (V!41498 (val!13695 Int)) )
))
(declare-datatypes ((ValueCell!12929 0))(
  ( (ValueCellFull!12929 (v!16322 V!41497)) (EmptyCell!12929) )
))
(declare-datatypes ((array!71513 0))(
  ( (array!71514 (arr!34410 (Array (_ BitVec 32) ValueCell!12929)) (size!34947 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71513)

(declare-fun mapDefault!42712 () ValueCell!12929)

(assert (=> b!1104405 (= condMapEmpty!42712 (= (arr!34410 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12929)) mapDefault!42712)))))

(declare-fun b!1104406 () Bool)

(declare-fun res!736470 () Bool)

(declare-fun e!630486 () Bool)

(assert (=> b!1104406 (=> (not res!736470) (not e!630486))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104406 (= res!736470 (validMask!0 mask!1564))))

(declare-fun b!1104407 () Bool)

(declare-fun e!630487 () Bool)

(declare-fun tp_is_empty!27277 () Bool)

(assert (=> b!1104407 (= e!630487 tp_is_empty!27277)))

(declare-fun b!1104408 () Bool)

(assert (=> b!1104408 (= e!630484 tp_is_empty!27277)))

(declare-fun mapIsEmpty!42712 () Bool)

(assert (=> mapIsEmpty!42712 mapRes!42712))

(declare-datatypes ((array!71515 0))(
  ( (array!71516 (arr!34411 (Array (_ BitVec 32) (_ BitVec 64))) (size!34948 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71515)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1104409 () Bool)

(assert (=> b!1104409 (= e!630486 (and (= (size!34947 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34948 _keys!1208) (size!34947 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (= (size!34948 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34948 _keys!1208))))))

(declare-fun mapNonEmpty!42712 () Bool)

(declare-fun tp!81632 () Bool)

(assert (=> mapNonEmpty!42712 (= mapRes!42712 (and tp!81632 e!630487))))

(declare-fun mapRest!42712 () (Array (_ BitVec 32) ValueCell!12929))

(declare-fun mapValue!42712 () ValueCell!12929)

(declare-fun mapKey!42712 () (_ BitVec 32))

(assert (=> mapNonEmpty!42712 (= (arr!34410 _values!996) (store mapRest!42712 mapKey!42712 mapValue!42712))))

(declare-fun res!736471 () Bool)

(assert (=> start!97194 (=> (not res!736471) (not e!630486))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97194 (= res!736471 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34948 _keys!1208))))))

(assert (=> start!97194 e!630486))

(declare-fun array_inv!26530 (array!71515) Bool)

(assert (=> start!97194 (array_inv!26530 _keys!1208)))

(assert (=> start!97194 true))

(declare-fun array_inv!26531 (array!71513) Bool)

(assert (=> start!97194 (and (array_inv!26531 _values!996) e!630483)))

(assert (= (and start!97194 res!736471) b!1104406))

(assert (= (and b!1104406 res!736470) b!1104409))

(assert (= (and b!1104405 condMapEmpty!42712) mapIsEmpty!42712))

(assert (= (and b!1104405 (not condMapEmpty!42712)) mapNonEmpty!42712))

(get-info :version)

(assert (= (and mapNonEmpty!42712 ((_ is ValueCellFull!12929) mapValue!42712)) b!1104407))

(assert (= (and b!1104405 ((_ is ValueCellFull!12929) mapDefault!42712)) b!1104408))

(assert (= start!97194 b!1104405))

(declare-fun m!1025077 () Bool)

(assert (=> b!1104406 m!1025077))

(declare-fun m!1025079 () Bool)

(assert (=> mapNonEmpty!42712 m!1025079))

(declare-fun m!1025081 () Bool)

(assert (=> start!97194 m!1025081))

(declare-fun m!1025083 () Bool)

(assert (=> start!97194 m!1025083))

(check-sat (not b!1104406) (not start!97194) (not mapNonEmpty!42712) tp_is_empty!27277)
(check-sat)
