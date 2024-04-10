; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97692 () Bool)

(assert start!97692)

(declare-fun b!1116732 () Bool)

(declare-fun res!745670 () Bool)

(declare-fun e!636230 () Bool)

(assert (=> b!1116732 (=> (not res!745670) (not e!636230))))

(declare-datatypes ((array!72743 0))(
  ( (array!72744 (arr!35024 (Array (_ BitVec 32) (_ BitVec 64))) (size!35560 (_ BitVec 32))) )
))
(declare-fun lt!497180 () array!72743)

(declare-datatypes ((List!24374 0))(
  ( (Nil!24371) (Cons!24370 (h!25579 (_ BitVec 64)) (t!34855 List!24374)) )
))
(declare-fun arrayNoDuplicates!0 (array!72743 (_ BitVec 32) List!24374) Bool)

(assert (=> b!1116732 (= res!745670 (arrayNoDuplicates!0 lt!497180 #b00000000000000000000000000000000 Nil!24371))))

(declare-fun b!1116733 () Bool)

(declare-fun res!745668 () Bool)

(declare-fun e!636226 () Bool)

(assert (=> b!1116733 (=> (not res!745668) (not e!636226))))

(declare-fun _keys!1208 () array!72743)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72743 (_ BitVec 32)) Bool)

(assert (=> b!1116733 (= res!745668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116734 () Bool)

(declare-fun res!745667 () Bool)

(assert (=> b!1116734 (=> (not res!745667) (not e!636226))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42357 0))(
  ( (V!42358 (val!14018 Int)) )
))
(declare-datatypes ((ValueCell!13252 0))(
  ( (ValueCellFull!13252 (v!16651 V!42357)) (EmptyCell!13252) )
))
(declare-datatypes ((array!72745 0))(
  ( (array!72746 (arr!35025 (Array (_ BitVec 32) ValueCell!13252)) (size!35561 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72745)

(assert (=> b!1116734 (= res!745667 (and (= (size!35561 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35560 _keys!1208) (size!35561 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116736 () Bool)

(declare-fun res!745666 () Bool)

(assert (=> b!1116736 (=> (not res!745666) (not e!636226))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116736 (= res!745666 (validKeyInArray!0 k!934))))

(declare-fun b!1116737 () Bool)

(declare-fun res!745663 () Bool)

(assert (=> b!1116737 (=> (not res!745663) (not e!636226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116737 (= res!745663 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43702 () Bool)

(declare-fun mapRes!43702 () Bool)

(assert (=> mapIsEmpty!43702 mapRes!43702))

(declare-fun b!1116738 () Bool)

(assert (=> b!1116738 (= e!636226 e!636230)))

(declare-fun res!745669 () Bool)

(assert (=> b!1116738 (=> (not res!745669) (not e!636230))))

(assert (=> b!1116738 (= res!745669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497180 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116738 (= lt!497180 (array!72744 (store (arr!35024 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35560 _keys!1208)))))

(declare-fun mapNonEmpty!43702 () Bool)

(declare-fun tp!82946 () Bool)

(declare-fun e!636229 () Bool)

(assert (=> mapNonEmpty!43702 (= mapRes!43702 (and tp!82946 e!636229))))

(declare-fun mapValue!43702 () ValueCell!13252)

(declare-fun mapKey!43702 () (_ BitVec 32))

(declare-fun mapRest!43702 () (Array (_ BitVec 32) ValueCell!13252))

(assert (=> mapNonEmpty!43702 (= (arr!35025 _values!996) (store mapRest!43702 mapKey!43702 mapValue!43702))))

(declare-fun b!1116739 () Bool)

(declare-fun tp_is_empty!27923 () Bool)

(assert (=> b!1116739 (= e!636229 tp_is_empty!27923)))

(declare-fun b!1116740 () Bool)

(declare-fun res!745664 () Bool)

(assert (=> b!1116740 (=> (not res!745664) (not e!636226))))

(assert (=> b!1116740 (= res!745664 (= (select (arr!35024 _keys!1208) i!673) k!934))))

(declare-fun res!745672 () Bool)

(assert (=> start!97692 (=> (not res!745672) (not e!636226))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97692 (= res!745672 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35560 _keys!1208))))))

(assert (=> start!97692 e!636226))

(declare-fun array_inv!26918 (array!72743) Bool)

(assert (=> start!97692 (array_inv!26918 _keys!1208)))

(assert (=> start!97692 true))

(declare-fun e!636227 () Bool)

(declare-fun array_inv!26919 (array!72745) Bool)

(assert (=> start!97692 (and (array_inv!26919 _values!996) e!636227)))

(declare-fun b!1116735 () Bool)

(declare-fun e!636231 () Bool)

(assert (=> b!1116735 (= e!636227 (and e!636231 mapRes!43702))))

(declare-fun condMapEmpty!43702 () Bool)

(declare-fun mapDefault!43702 () ValueCell!13252)

