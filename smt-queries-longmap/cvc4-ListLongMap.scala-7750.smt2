; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97248 () Bool)

(assert start!97248)

(declare-fun b!1106850 () Bool)

(declare-fun res!738680 () Bool)

(declare-fun e!631568 () Bool)

(assert (=> b!1106850 (=> (not res!738680) (not e!631568))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71875 0))(
  ( (array!71876 (arr!34590 (Array (_ BitVec 32) (_ BitVec 64))) (size!35126 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71875)

(assert (=> b!1106850 (= res!738680 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35126 _keys!1208))))))

(declare-fun b!1106851 () Bool)

(declare-fun e!631565 () Bool)

(declare-fun tp_is_empty!27479 () Bool)

(assert (=> b!1106851 (= e!631565 tp_is_empty!27479)))

(declare-fun b!1106852 () Bool)

(declare-fun e!631567 () Bool)

(assert (=> b!1106852 (= e!631567 tp_is_empty!27479)))

(declare-fun b!1106853 () Bool)

(declare-fun res!738688 () Bool)

(assert (=> b!1106853 (=> (not res!738688) (not e!631568))))

(declare-datatypes ((List!24105 0))(
  ( (Nil!24102) (Cons!24101 (h!25310 (_ BitVec 64)) (t!34370 List!24105)) )
))
(declare-fun arrayNoDuplicates!0 (array!71875 (_ BitVec 32) List!24105) Bool)

(assert (=> b!1106853 (= res!738688 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24102))))

(declare-fun b!1106854 () Bool)

(declare-fun e!631566 () Bool)

(assert (=> b!1106854 (= e!631566 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106854 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36324 0))(
  ( (Unit!36325) )
))
(declare-fun lt!495524 () Unit!36324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71875 (_ BitVec 64) (_ BitVec 32)) Unit!36324)

(assert (=> b!1106854 (= lt!495524 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106855 () Bool)

(declare-fun res!738687 () Bool)

(assert (=> b!1106855 (=> (not res!738687) (not e!631566))))

(declare-fun lt!495523 () array!71875)

(assert (=> b!1106855 (= res!738687 (arrayNoDuplicates!0 lt!495523 #b00000000000000000000000000000000 Nil!24102))))

(declare-fun b!1106856 () Bool)

(declare-fun res!738683 () Bool)

(assert (=> b!1106856 (=> (not res!738683) (not e!631568))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71875 (_ BitVec 32)) Bool)

(assert (=> b!1106856 (= res!738683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106857 () Bool)

(declare-fun res!738679 () Bool)

(assert (=> b!1106857 (=> (not res!738679) (not e!631568))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41765 0))(
  ( (V!41766 (val!13796 Int)) )
))
(declare-datatypes ((ValueCell!13030 0))(
  ( (ValueCellFull!13030 (v!16429 V!41765)) (EmptyCell!13030) )
))
(declare-datatypes ((array!71877 0))(
  ( (array!71878 (arr!34591 (Array (_ BitVec 32) ValueCell!13030)) (size!35127 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71877)

(assert (=> b!1106857 (= res!738679 (and (= (size!35127 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35126 _keys!1208) (size!35127 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43036 () Bool)

(declare-fun mapRes!43036 () Bool)

(assert (=> mapIsEmpty!43036 mapRes!43036))

(declare-fun res!738685 () Bool)

(assert (=> start!97248 (=> (not res!738685) (not e!631568))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97248 (= res!738685 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35126 _keys!1208))))))

(assert (=> start!97248 e!631568))

(declare-fun array_inv!26618 (array!71875) Bool)

(assert (=> start!97248 (array_inv!26618 _keys!1208)))

(assert (=> start!97248 true))

(declare-fun e!631564 () Bool)

(declare-fun array_inv!26619 (array!71877) Bool)

(assert (=> start!97248 (and (array_inv!26619 _values!996) e!631564)))

(declare-fun b!1106858 () Bool)

(declare-fun res!738686 () Bool)

(assert (=> b!1106858 (=> (not res!738686) (not e!631568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106858 (= res!738686 (validKeyInArray!0 k!934))))

(declare-fun b!1106859 () Bool)

(declare-fun res!738684 () Bool)

(assert (=> b!1106859 (=> (not res!738684) (not e!631568))))

(assert (=> b!1106859 (= res!738684 (= (select (arr!34590 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43036 () Bool)

(declare-fun tp!81956 () Bool)

(assert (=> mapNonEmpty!43036 (= mapRes!43036 (and tp!81956 e!631565))))

(declare-fun mapRest!43036 () (Array (_ BitVec 32) ValueCell!13030))

(declare-fun mapKey!43036 () (_ BitVec 32))

(declare-fun mapValue!43036 () ValueCell!13030)

(assert (=> mapNonEmpty!43036 (= (arr!34591 _values!996) (store mapRest!43036 mapKey!43036 mapValue!43036))))

(declare-fun b!1106860 () Bool)

(assert (=> b!1106860 (= e!631564 (and e!631567 mapRes!43036))))

(declare-fun condMapEmpty!43036 () Bool)

(declare-fun mapDefault!43036 () ValueCell!13030)

