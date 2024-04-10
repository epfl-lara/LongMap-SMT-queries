; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97644 () Bool)

(assert start!97644)

(declare-fun b!1115796 () Bool)

(declare-fun res!744943 () Bool)

(declare-fun e!635796 () Bool)

(assert (=> b!1115796 (=> (not res!744943) (not e!635796))))

(declare-datatypes ((array!72647 0))(
  ( (array!72648 (arr!34976 (Array (_ BitVec 32) (_ BitVec 64))) (size!35512 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72647)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72647 (_ BitVec 32)) Bool)

(assert (=> b!1115796 (= res!744943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115797 () Bool)

(declare-fun e!635798 () Bool)

(assert (=> b!1115797 (= e!635796 e!635798)))

(declare-fun res!744951 () Bool)

(assert (=> b!1115797 (=> (not res!744951) (not e!635798))))

(declare-fun lt!497035 () array!72647)

(assert (=> b!1115797 (= res!744951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497035 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115797 (= lt!497035 (array!72648 (store (arr!34976 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35512 _keys!1208)))))

(declare-fun b!1115798 () Bool)

(declare-fun e!635797 () Bool)

(declare-fun tp_is_empty!27875 () Bool)

(assert (=> b!1115798 (= e!635797 tp_is_empty!27875)))

(declare-fun b!1115799 () Bool)

(declare-fun res!744947 () Bool)

(assert (=> b!1115799 (=> (not res!744947) (not e!635796))))

(declare-datatypes ((List!24354 0))(
  ( (Nil!24351) (Cons!24350 (h!25559 (_ BitVec 64)) (t!34835 List!24354)) )
))
(declare-fun arrayNoDuplicates!0 (array!72647 (_ BitVec 32) List!24354) Bool)

(assert (=> b!1115799 (= res!744947 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24351))))

(declare-fun res!744944 () Bool)

(assert (=> start!97644 (=> (not res!744944) (not e!635796))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97644 (= res!744944 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35512 _keys!1208))))))

(assert (=> start!97644 e!635796))

(declare-fun array_inv!26884 (array!72647) Bool)

(assert (=> start!97644 (array_inv!26884 _keys!1208)))

(assert (=> start!97644 true))

(declare-datatypes ((V!42293 0))(
  ( (V!42294 (val!13994 Int)) )
))
(declare-datatypes ((ValueCell!13228 0))(
  ( (ValueCellFull!13228 (v!16627 V!42293)) (EmptyCell!13228) )
))
(declare-datatypes ((array!72649 0))(
  ( (array!72650 (arr!34977 (Array (_ BitVec 32) ValueCell!13228)) (size!35513 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72649)

(declare-fun e!635794 () Bool)

(declare-fun array_inv!26885 (array!72649) Bool)

(assert (=> start!97644 (and (array_inv!26885 _values!996) e!635794)))

(declare-fun b!1115800 () Bool)

(declare-fun res!744946 () Bool)

(assert (=> b!1115800 (=> (not res!744946) (not e!635796))))

(assert (=> b!1115800 (= res!744946 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35512 _keys!1208))))))

(declare-fun mapNonEmpty!43630 () Bool)

(declare-fun mapRes!43630 () Bool)

(declare-fun tp!82874 () Bool)

(declare-fun e!635795 () Bool)

(assert (=> mapNonEmpty!43630 (= mapRes!43630 (and tp!82874 e!635795))))

(declare-fun mapKey!43630 () (_ BitVec 32))

(declare-fun mapRest!43630 () (Array (_ BitVec 32) ValueCell!13228))

(declare-fun mapValue!43630 () ValueCell!13228)

(assert (=> mapNonEmpty!43630 (= (arr!34977 _values!996) (store mapRest!43630 mapKey!43630 mapValue!43630))))

(declare-fun b!1115801 () Bool)

(declare-fun res!744949 () Bool)

(assert (=> b!1115801 (=> (not res!744949) (not e!635796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115801 (= res!744949 (validMask!0 mask!1564))))

(declare-fun b!1115802 () Bool)

(assert (=> b!1115802 (= e!635794 (and e!635797 mapRes!43630))))

(declare-fun condMapEmpty!43630 () Bool)

(declare-fun mapDefault!43630 () ValueCell!13228)

