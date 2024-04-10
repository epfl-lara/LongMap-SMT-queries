; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97826 () Bool)

(assert start!97826)

(declare-fun b_free!23527 () Bool)

(declare-fun b_next!23527 () Bool)

(assert (=> start!97826 (= b_free!23527 (not b_next!23527))))

(declare-fun tp!83285 () Bool)

(declare-fun b_and!37837 () Bool)

(assert (=> start!97826 (= tp!83285 b_and!37837)))

(declare-fun b!1119518 () Bool)

(declare-fun res!747811 () Bool)

(declare-fun e!637573 () Bool)

(assert (=> b!1119518 (=> (not res!747811) (not e!637573))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72999 0))(
  ( (array!73000 (arr!35152 (Array (_ BitVec 32) (_ BitVec 64))) (size!35688 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72999)

(assert (=> b!1119518 (= res!747811 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35688 _keys!1208))))))

(declare-fun b!1119519 () Bool)

(declare-fun e!637575 () Bool)

(assert (=> b!1119519 (= e!637573 e!637575)))

(declare-fun res!747817 () Bool)

(assert (=> b!1119519 (=> (not res!747817) (not e!637575))))

(declare-fun lt!497776 () array!72999)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72999 (_ BitVec 32)) Bool)

(assert (=> b!1119519 (= res!747817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497776 mask!1564))))

(assert (=> b!1119519 (= lt!497776 (array!73000 (store (arr!35152 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35688 _keys!1208)))))

(declare-fun b!1119520 () Bool)

(declare-fun e!637569 () Bool)

(assert (=> b!1119520 (= e!637569 true)))

(declare-datatypes ((V!42537 0))(
  ( (V!42538 (val!14085 Int)) )
))
(declare-fun zeroValue!944 () V!42537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17672 0))(
  ( (tuple2!17673 (_1!8847 (_ BitVec 64)) (_2!8847 V!42537)) )
))
(declare-datatypes ((List!24456 0))(
  ( (Nil!24453) (Cons!24452 (h!25661 tuple2!17672) (t!34975 List!24456)) )
))
(declare-datatypes ((ListLongMap!15641 0))(
  ( (ListLongMap!15642 (toList!7836 List!24456)) )
))
(declare-fun lt!497775 () ListLongMap!15641)

(declare-datatypes ((ValueCell!13319 0))(
  ( (ValueCellFull!13319 (v!16718 V!42537)) (EmptyCell!13319) )
))
(declare-datatypes ((array!73001 0))(
  ( (array!73002 (arr!35153 (Array (_ BitVec 32) ValueCell!13319)) (size!35689 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73001)

(declare-fun minValue!944 () V!42537)

(declare-fun getCurrentListMapNoExtraKeys!4326 (array!72999 array!73001 (_ BitVec 32) (_ BitVec 32) V!42537 V!42537 (_ BitVec 32) Int) ListLongMap!15641)

(declare-fun dynLambda!2430 (Int (_ BitVec 64)) V!42537)

(assert (=> b!1119520 (= lt!497775 (getCurrentListMapNoExtraKeys!4326 lt!497776 (array!73002 (store (arr!35153 _values!996) i!673 (ValueCellFull!13319 (dynLambda!2430 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35689 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497777 () ListLongMap!15641)

(assert (=> b!1119520 (= lt!497777 (getCurrentListMapNoExtraKeys!4326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119521 () Bool)

(assert (=> b!1119521 (= e!637575 (not e!637569))))

(declare-fun res!747816 () Bool)

(assert (=> b!1119521 (=> res!747816 e!637569)))

(assert (=> b!1119521 (= res!747816 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119521 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36740 0))(
  ( (Unit!36741) )
))
(declare-fun lt!497774 () Unit!36740)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72999 (_ BitVec 64) (_ BitVec 32)) Unit!36740)

(assert (=> b!1119521 (= lt!497774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1119522 () Bool)

(declare-fun res!747810 () Bool)

(assert (=> b!1119522 (=> (not res!747810) (not e!637573))))

(declare-datatypes ((List!24457 0))(
  ( (Nil!24454) (Cons!24453 (h!25662 (_ BitVec 64)) (t!34976 List!24457)) )
))
(declare-fun arrayNoDuplicates!0 (array!72999 (_ BitVec 32) List!24457) Bool)

(assert (=> b!1119522 (= res!747810 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24454))))

(declare-fun res!747812 () Bool)

(assert (=> start!97826 (=> (not res!747812) (not e!637573))))

(assert (=> start!97826 (= res!747812 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35688 _keys!1208))))))

(assert (=> start!97826 e!637573))

(declare-fun tp_is_empty!28057 () Bool)

(assert (=> start!97826 tp_is_empty!28057))

(declare-fun array_inv!27006 (array!72999) Bool)

(assert (=> start!97826 (array_inv!27006 _keys!1208)))

(assert (=> start!97826 true))

(assert (=> start!97826 tp!83285))

(declare-fun e!637571 () Bool)

(declare-fun array_inv!27007 (array!73001) Bool)

(assert (=> start!97826 (and (array_inv!27007 _values!996) e!637571)))

(declare-fun b!1119523 () Bool)

(declare-fun res!747815 () Bool)

(assert (=> b!1119523 (=> (not res!747815) (not e!637573))))

(assert (=> b!1119523 (= res!747815 (and (= (size!35689 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35688 _keys!1208) (size!35689 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119524 () Bool)

(declare-fun res!747813 () Bool)

(assert (=> b!1119524 (=> (not res!747813) (not e!637573))))

(assert (=> b!1119524 (= res!747813 (= (select (arr!35152 _keys!1208) i!673) k!934))))

(declare-fun b!1119525 () Bool)

(declare-fun res!747819 () Bool)

(assert (=> b!1119525 (=> (not res!747819) (not e!637573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119525 (= res!747819 (validMask!0 mask!1564))))

(declare-fun b!1119526 () Bool)

(declare-fun res!747818 () Bool)

(assert (=> b!1119526 (=> (not res!747818) (not e!637573))))

(assert (=> b!1119526 (= res!747818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119527 () Bool)

(declare-fun e!637570 () Bool)

(assert (=> b!1119527 (= e!637570 tp_is_empty!28057)))

(declare-fun mapIsEmpty!43903 () Bool)

(declare-fun mapRes!43903 () Bool)

(assert (=> mapIsEmpty!43903 mapRes!43903))

(declare-fun b!1119528 () Bool)

(declare-fun res!747814 () Bool)

(assert (=> b!1119528 (=> (not res!747814) (not e!637575))))

(assert (=> b!1119528 (= res!747814 (arrayNoDuplicates!0 lt!497776 #b00000000000000000000000000000000 Nil!24454))))

(declare-fun b!1119529 () Bool)

(declare-fun res!747820 () Bool)

(assert (=> b!1119529 (=> (not res!747820) (not e!637573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119529 (= res!747820 (validKeyInArray!0 k!934))))

(declare-fun b!1119530 () Bool)

(assert (=> b!1119530 (= e!637571 (and e!637570 mapRes!43903))))

(declare-fun condMapEmpty!43903 () Bool)

(declare-fun mapDefault!43903 () ValueCell!13319)

