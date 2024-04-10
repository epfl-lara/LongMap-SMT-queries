; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96954 () Bool)

(assert start!96954)

(declare-fun b!1103048 () Bool)

(declare-fun res!735937 () Bool)

(declare-fun e!629601 () Bool)

(assert (=> b!1103048 (=> (not res!735937) (not e!629601))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103048 (= res!735937 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42706 () Bool)

(declare-fun mapRes!42706 () Bool)

(declare-fun tp!81626 () Bool)

(declare-fun e!629599 () Bool)

(assert (=> mapNonEmpty!42706 (= mapRes!42706 (and tp!81626 e!629599))))

(declare-datatypes ((V!41491 0))(
  ( (V!41492 (val!13693 Int)) )
))
(declare-datatypes ((ValueCell!12927 0))(
  ( (ValueCellFull!12927 (v!16324 V!41491)) (EmptyCell!12927) )
))
(declare-fun mapRest!42706 () (Array (_ BitVec 32) ValueCell!12927))

(declare-fun mapValue!42706 () ValueCell!12927)

(declare-fun mapKey!42706 () (_ BitVec 32))

(declare-datatypes ((array!71469 0))(
  ( (array!71470 (arr!34394 (Array (_ BitVec 32) ValueCell!12927)) (size!34930 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71469)

(assert (=> mapNonEmpty!42706 (= (arr!34394 _values!996) (store mapRest!42706 mapKey!42706 mapValue!42706))))

(declare-fun b!1103049 () Bool)

(declare-fun e!629598 () Bool)

(declare-fun e!629602 () Bool)

(assert (=> b!1103049 (= e!629598 (and e!629602 mapRes!42706))))

(declare-fun condMapEmpty!42706 () Bool)

(declare-fun mapDefault!42706 () ValueCell!12927)

(assert (=> b!1103049 (= condMapEmpty!42706 (= (arr!34394 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12927)) mapDefault!42706)))))

(declare-fun res!735936 () Bool)

(assert (=> start!96954 (=> (not res!735936) (not e!629601))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71471 0))(
  ( (array!71472 (arr!34395 (Array (_ BitVec 32) (_ BitVec 64))) (size!34931 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71471)

(assert (=> start!96954 (= res!735936 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34931 _keys!1208))))))

(assert (=> start!96954 e!629601))

(declare-fun array_inv!26490 (array!71471) Bool)

(assert (=> start!96954 (array_inv!26490 _keys!1208)))

(assert (=> start!96954 true))

(declare-fun array_inv!26491 (array!71469) Bool)

(assert (=> start!96954 (and (array_inv!26491 _values!996) e!629598)))

(declare-fun b!1103050 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103050 (= e!629601 (and (= (size!34930 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34931 _keys!1208) (size!34930 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (not (= (size!34931 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)))))))

(declare-fun mapIsEmpty!42706 () Bool)

(assert (=> mapIsEmpty!42706 mapRes!42706))

(declare-fun b!1103051 () Bool)

(declare-fun tp_is_empty!27273 () Bool)

(assert (=> b!1103051 (= e!629602 tp_is_empty!27273)))

(declare-fun b!1103052 () Bool)

(assert (=> b!1103052 (= e!629599 tp_is_empty!27273)))

(assert (= (and start!96954 res!735936) b!1103048))

(assert (= (and b!1103048 res!735937) b!1103050))

(assert (= (and b!1103049 condMapEmpty!42706) mapIsEmpty!42706))

(assert (= (and b!1103049 (not condMapEmpty!42706)) mapNonEmpty!42706))

(get-info :version)

(assert (= (and mapNonEmpty!42706 ((_ is ValueCellFull!12927) mapValue!42706)) b!1103052))

(assert (= (and b!1103049 ((_ is ValueCellFull!12927) mapDefault!42706)) b!1103051))

(assert (= start!96954 b!1103049))

(declare-fun m!1023389 () Bool)

(assert (=> b!1103048 m!1023389))

(declare-fun m!1023391 () Bool)

(assert (=> mapNonEmpty!42706 m!1023391))

(declare-fun m!1023393 () Bool)

(assert (=> start!96954 m!1023393))

(declare-fun m!1023395 () Bool)

(assert (=> start!96954 m!1023395))

(check-sat (not b!1103048) (not start!96954) (not mapNonEmpty!42706) tp_is_empty!27273)
(check-sat)
