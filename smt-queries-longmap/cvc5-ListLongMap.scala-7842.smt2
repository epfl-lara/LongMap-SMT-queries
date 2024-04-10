; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97796 () Bool)

(assert start!97796)

(declare-fun b_free!23497 () Bool)

(declare-fun b_next!23497 () Bool)

(assert (=> start!97796 (= b_free!23497 (not b_next!23497))))

(declare-fun tp!83195 () Bool)

(declare-fun b_and!37777 () Bool)

(assert (=> start!97796 (= tp!83195 b_and!37777)))

(declare-fun b!1118858 () Bool)

(declare-fun e!637257 () Bool)

(assert (=> b!1118858 (= e!637257 true)))

(declare-datatypes ((V!42497 0))(
  ( (V!42498 (val!14070 Int)) )
))
(declare-fun zeroValue!944 () V!42497)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17652 0))(
  ( (tuple2!17653 (_1!8837 (_ BitVec 64)) (_2!8837 V!42497)) )
))
(declare-datatypes ((List!24438 0))(
  ( (Nil!24435) (Cons!24434 (h!25643 tuple2!17652) (t!34927 List!24438)) )
))
(declare-datatypes ((ListLongMap!15621 0))(
  ( (ListLongMap!15622 (toList!7826 List!24438)) )
))
(declare-fun lt!497596 () ListLongMap!15621)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13304 0))(
  ( (ValueCellFull!13304 (v!16703 V!42497)) (EmptyCell!13304) )
))
(declare-datatypes ((array!72943 0))(
  ( (array!72944 (arr!35124 (Array (_ BitVec 32) ValueCell!13304)) (size!35660 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72943)

(declare-fun minValue!944 () V!42497)

(declare-datatypes ((array!72945 0))(
  ( (array!72946 (arr!35125 (Array (_ BitVec 32) (_ BitVec 64))) (size!35661 (_ BitVec 32))) )
))
(declare-fun lt!497595 () array!72945)

(declare-fun getCurrentListMapNoExtraKeys!4316 (array!72945 array!72943 (_ BitVec 32) (_ BitVec 32) V!42497 V!42497 (_ BitVec 32) Int) ListLongMap!15621)

(declare-fun dynLambda!2420 (Int (_ BitVec 64)) V!42497)

(assert (=> b!1118858 (= lt!497596 (getCurrentListMapNoExtraKeys!4316 lt!497595 (array!72944 (store (arr!35124 _values!996) i!673 (ValueCellFull!13304 (dynLambda!2420 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35660 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!72945)

(declare-fun lt!497597 () ListLongMap!15621)

(assert (=> b!1118858 (= lt!497597 (getCurrentListMapNoExtraKeys!4316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118859 () Bool)

(declare-fun e!637254 () Bool)

(declare-fun tp_is_empty!28027 () Bool)

(assert (=> b!1118859 (= e!637254 tp_is_empty!28027)))

(declare-fun b!1118860 () Bool)

(declare-fun res!747322 () Bool)

(declare-fun e!637260 () Bool)

(assert (=> b!1118860 (=> (not res!747322) (not e!637260))))

(declare-datatypes ((List!24439 0))(
  ( (Nil!24436) (Cons!24435 (h!25644 (_ BitVec 64)) (t!34928 List!24439)) )
))
(declare-fun arrayNoDuplicates!0 (array!72945 (_ BitVec 32) List!24439) Bool)

(assert (=> b!1118860 (= res!747322 (arrayNoDuplicates!0 lt!497595 #b00000000000000000000000000000000 Nil!24436))))

(declare-fun b!1118861 () Bool)

(declare-fun res!747319 () Bool)

(declare-fun e!637258 () Bool)

(assert (=> b!1118861 (=> (not res!747319) (not e!637258))))

(assert (=> b!1118861 (= res!747319 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24436))))

(declare-fun b!1118862 () Bool)

(declare-fun res!747317 () Bool)

(assert (=> b!1118862 (=> (not res!747317) (not e!637258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118862 (= res!747317 (validMask!0 mask!1564))))

(declare-fun res!747324 () Bool)

(assert (=> start!97796 (=> (not res!747324) (not e!637258))))

(assert (=> start!97796 (= res!747324 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35661 _keys!1208))))))

(assert (=> start!97796 e!637258))

(assert (=> start!97796 tp_is_empty!28027))

(declare-fun array_inv!26990 (array!72945) Bool)

(assert (=> start!97796 (array_inv!26990 _keys!1208)))

(assert (=> start!97796 true))

(assert (=> start!97796 tp!83195))

(declare-fun e!637256 () Bool)

(declare-fun array_inv!26991 (array!72943) Bool)

(assert (=> start!97796 (and (array_inv!26991 _values!996) e!637256)))

(declare-fun b!1118863 () Bool)

(assert (=> b!1118863 (= e!637258 e!637260)))

(declare-fun res!747316 () Bool)

(assert (=> b!1118863 (=> (not res!747316) (not e!637260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72945 (_ BitVec 32)) Bool)

(assert (=> b!1118863 (= res!747316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497595 mask!1564))))

(assert (=> b!1118863 (= lt!497595 (array!72946 (store (arr!35125 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35661 _keys!1208)))))

(declare-fun b!1118864 () Bool)

(declare-fun res!747321 () Bool)

(assert (=> b!1118864 (=> (not res!747321) (not e!637258))))

(assert (=> b!1118864 (= res!747321 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35661 _keys!1208))))))

(declare-fun b!1118865 () Bool)

(assert (=> b!1118865 (= e!637260 (not e!637257))))

(declare-fun res!747325 () Bool)

(assert (=> b!1118865 (=> res!747325 e!637257)))

(assert (=> b!1118865 (= res!747325 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118865 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36722 0))(
  ( (Unit!36723) )
))
(declare-fun lt!497594 () Unit!36722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72945 (_ BitVec 64) (_ BitVec 32)) Unit!36722)

(assert (=> b!1118865 (= lt!497594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43858 () Bool)

(declare-fun mapRes!43858 () Bool)

(declare-fun tp!83194 () Bool)

(assert (=> mapNonEmpty!43858 (= mapRes!43858 (and tp!83194 e!637254))))

(declare-fun mapValue!43858 () ValueCell!13304)

(declare-fun mapRest!43858 () (Array (_ BitVec 32) ValueCell!13304))

(declare-fun mapKey!43858 () (_ BitVec 32))

(assert (=> mapNonEmpty!43858 (= (arr!35124 _values!996) (store mapRest!43858 mapKey!43858 mapValue!43858))))

(declare-fun mapIsEmpty!43858 () Bool)

(assert (=> mapIsEmpty!43858 mapRes!43858))

(declare-fun b!1118866 () Bool)

(declare-fun e!637259 () Bool)

(assert (=> b!1118866 (= e!637256 (and e!637259 mapRes!43858))))

(declare-fun condMapEmpty!43858 () Bool)

(declare-fun mapDefault!43858 () ValueCell!13304)

