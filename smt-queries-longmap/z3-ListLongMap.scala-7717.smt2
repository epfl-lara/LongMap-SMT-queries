; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96960 () Bool)

(assert start!96960)

(declare-datatypes ((array!71479 0))(
  ( (array!71480 (arr!34399 (Array (_ BitVec 32) (_ BitVec 64))) (size!34935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71479)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1103093 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun e!629647 () Bool)

(declare-datatypes ((V!41499 0))(
  ( (V!41500 (val!13696 Int)) )
))
(declare-datatypes ((ValueCell!12930 0))(
  ( (ValueCellFull!12930 (v!16327 V!41499)) (EmptyCell!12930) )
))
(declare-datatypes ((array!71481 0))(
  ( (array!71482 (arr!34400 (Array (_ BitVec 32) ValueCell!12930)) (size!34936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71481)

(assert (=> b!1103093 (= e!629647 (and (= (size!34936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34935 _keys!1208) (size!34936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (= (size!34935 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34935 _keys!1208))))))

(declare-fun mapNonEmpty!42715 () Bool)

(declare-fun mapRes!42715 () Bool)

(declare-fun tp!81635 () Bool)

(declare-fun e!629645 () Bool)

(assert (=> mapNonEmpty!42715 (= mapRes!42715 (and tp!81635 e!629645))))

(declare-fun mapValue!42715 () ValueCell!12930)

(declare-fun mapRest!42715 () (Array (_ BitVec 32) ValueCell!12930))

(declare-fun mapKey!42715 () (_ BitVec 32))

(assert (=> mapNonEmpty!42715 (= (arr!34400 _values!996) (store mapRest!42715 mapKey!42715 mapValue!42715))))

(declare-fun res!735954 () Bool)

(assert (=> start!96960 (=> (not res!735954) (not e!629647))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96960 (= res!735954 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34935 _keys!1208))))))

(assert (=> start!96960 e!629647))

(declare-fun array_inv!26494 (array!71479) Bool)

(assert (=> start!96960 (array_inv!26494 _keys!1208)))

(assert (=> start!96960 true))

(declare-fun e!629643 () Bool)

(declare-fun array_inv!26495 (array!71481) Bool)

(assert (=> start!96960 (and (array_inv!26495 _values!996) e!629643)))

(declare-fun b!1103094 () Bool)

(declare-fun e!629646 () Bool)

(assert (=> b!1103094 (= e!629643 (and e!629646 mapRes!42715))))

(declare-fun condMapEmpty!42715 () Bool)

(declare-fun mapDefault!42715 () ValueCell!12930)

(assert (=> b!1103094 (= condMapEmpty!42715 (= (arr!34400 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12930)) mapDefault!42715)))))

(declare-fun b!1103095 () Bool)

(declare-fun tp_is_empty!27279 () Bool)

(assert (=> b!1103095 (= e!629646 tp_is_empty!27279)))

(declare-fun mapIsEmpty!42715 () Bool)

(assert (=> mapIsEmpty!42715 mapRes!42715))

(declare-fun b!1103096 () Bool)

(assert (=> b!1103096 (= e!629645 tp_is_empty!27279)))

(declare-fun b!1103097 () Bool)

(declare-fun res!735955 () Bool)

(assert (=> b!1103097 (=> (not res!735955) (not e!629647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103097 (= res!735955 (validMask!0 mask!1564))))

(assert (= (and start!96960 res!735954) b!1103097))

(assert (= (and b!1103097 res!735955) b!1103093))

(assert (= (and b!1103094 condMapEmpty!42715) mapIsEmpty!42715))

(assert (= (and b!1103094 (not condMapEmpty!42715)) mapNonEmpty!42715))

(get-info :version)

(assert (= (and mapNonEmpty!42715 ((_ is ValueCellFull!12930) mapValue!42715)) b!1103096))

(assert (= (and b!1103094 ((_ is ValueCellFull!12930) mapDefault!42715)) b!1103095))

(assert (= start!96960 b!1103094))

(declare-fun m!1023413 () Bool)

(assert (=> mapNonEmpty!42715 m!1023413))

(declare-fun m!1023415 () Bool)

(assert (=> start!96960 m!1023415))

(declare-fun m!1023417 () Bool)

(assert (=> start!96960 m!1023417))

(declare-fun m!1023419 () Bool)

(assert (=> b!1103097 m!1023419))

(check-sat (not b!1103097) (not start!96960) (not mapNonEmpty!42715) tp_is_empty!27279)
(check-sat)
