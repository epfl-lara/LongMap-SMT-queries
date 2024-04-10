; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101220 () Bool)

(assert start!101220)

(declare-fun b_free!26143 () Bool)

(declare-fun b_next!26143 () Bool)

(assert (=> start!101220 (= b_free!26143 (not b_next!26143))))

(declare-fun tp!91450 () Bool)

(declare-fun b_and!43403 () Bool)

(assert (=> start!101220 (= tp!91450 b_and!43403)))

(declare-fun b!1215420 () Bool)

(declare-fun res!806996 () Bool)

(declare-fun e!690133 () Bool)

(assert (=> b!1215420 (=> (not res!806996) (not e!690133))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78469 0))(
  ( (array!78470 (arr!37869 (Array (_ BitVec 32) (_ BitVec 64))) (size!38405 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78469)

(assert (=> b!1215420 (= res!806996 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38405 _keys!1208))))))

(declare-fun b!1215421 () Bool)

(declare-fun res!806997 () Bool)

(declare-fun e!690138 () Bool)

(assert (=> b!1215421 (=> (not res!806997) (not e!690138))))

(declare-fun lt!552610 () array!78469)

(declare-datatypes ((List!26696 0))(
  ( (Nil!26693) (Cons!26692 (h!27901 (_ BitVec 64)) (t!39819 List!26696)) )
))
(declare-fun arrayNoDuplicates!0 (array!78469 (_ BitVec 32) List!26696) Bool)

(assert (=> b!1215421 (= res!806997 (arrayNoDuplicates!0 lt!552610 #b00000000000000000000000000000000 Nil!26693))))

(declare-fun b!1215422 () Bool)

(declare-fun res!806999 () Bool)

(assert (=> b!1215422 (=> (not res!806999) (not e!690133))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78469 (_ BitVec 32)) Bool)

(assert (=> b!1215422 (= res!806999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215423 () Bool)

(declare-fun res!806991 () Bool)

(assert (=> b!1215423 (=> (not res!806991) (not e!690133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215423 (= res!806991 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48145 () Bool)

(declare-fun mapRes!48145 () Bool)

(declare-fun tp!91451 () Bool)

(declare-fun e!690134 () Bool)

(assert (=> mapNonEmpty!48145 (= mapRes!48145 (and tp!91451 e!690134))))

(declare-fun mapKey!48145 () (_ BitVec 32))

(declare-datatypes ((V!46257 0))(
  ( (V!46258 (val!15480 Int)) )
))
(declare-datatypes ((ValueCell!14714 0))(
  ( (ValueCellFull!14714 (v!18133 V!46257)) (EmptyCell!14714) )
))
(declare-fun mapRest!48145 () (Array (_ BitVec 32) ValueCell!14714))

(declare-datatypes ((array!78471 0))(
  ( (array!78472 (arr!37870 (Array (_ BitVec 32) ValueCell!14714)) (size!38406 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78471)

(declare-fun mapValue!48145 () ValueCell!14714)

(assert (=> mapNonEmpty!48145 (= (arr!37870 _values!996) (store mapRest!48145 mapKey!48145 mapValue!48145))))

(declare-fun b!1215424 () Bool)

(declare-fun res!806994 () Bool)

(assert (=> b!1215424 (=> (not res!806994) (not e!690133))))

(assert (=> b!1215424 (= res!806994 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26693))))

(declare-fun b!1215425 () Bool)

(declare-fun res!806993 () Bool)

(assert (=> b!1215425 (=> (not res!806993) (not e!690133))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1215425 (= res!806993 (= (select (arr!37869 _keys!1208) i!673) k!934))))

(declare-fun b!1215426 () Bool)

(declare-fun res!806998 () Bool)

(assert (=> b!1215426 (=> (not res!806998) (not e!690133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215426 (= res!806998 (validKeyInArray!0 k!934))))

(declare-fun res!806992 () Bool)

(assert (=> start!101220 (=> (not res!806992) (not e!690133))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101220 (= res!806992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38405 _keys!1208))))))

(assert (=> start!101220 e!690133))

(declare-fun tp_is_empty!30847 () Bool)

(assert (=> start!101220 tp_is_empty!30847))

(declare-fun array_inv!28834 (array!78469) Bool)

(assert (=> start!101220 (array_inv!28834 _keys!1208)))

(assert (=> start!101220 true))

(assert (=> start!101220 tp!91450))

(declare-fun e!690136 () Bool)

(declare-fun array_inv!28835 (array!78471) Bool)

(assert (=> start!101220 (and (array_inv!28835 _values!996) e!690136)))

(declare-fun b!1215427 () Bool)

(declare-fun res!806995 () Bool)

(assert (=> b!1215427 (=> (not res!806995) (not e!690133))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1215427 (= res!806995 (and (= (size!38406 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38405 _keys!1208) (size!38406 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215428 () Bool)

(assert (=> b!1215428 (= e!690134 tp_is_empty!30847)))

(declare-fun b!1215429 () Bool)

(declare-fun e!690137 () Bool)

(assert (=> b!1215429 (= e!690138 (not e!690137))))

(declare-fun res!806989 () Bool)

(assert (=> b!1215429 (=> res!806989 e!690137)))

(assert (=> b!1215429 (= res!806989 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215429 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40298 0))(
  ( (Unit!40299) )
))
(declare-fun lt!552609 () Unit!40298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78469 (_ BitVec 64) (_ BitVec 32)) Unit!40298)

(assert (=> b!1215429 (= lt!552609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1215430 () Bool)

(assert (=> b!1215430 (= e!690133 e!690138)))

(declare-fun res!806990 () Bool)

(assert (=> b!1215430 (=> (not res!806990) (not e!690138))))

(assert (=> b!1215430 (= res!806990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552610 mask!1564))))

(assert (=> b!1215430 (= lt!552610 (array!78470 (store (arr!37869 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38405 _keys!1208)))))

(declare-fun b!1215431 () Bool)

(assert (=> b!1215431 (= e!690137 true)))

(declare-fun zeroValue!944 () V!46257)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19896 0))(
  ( (tuple2!19897 (_1!9959 (_ BitVec 64)) (_2!9959 V!46257)) )
))
(declare-datatypes ((List!26697 0))(
  ( (Nil!26694) (Cons!26693 (h!27902 tuple2!19896) (t!39820 List!26697)) )
))
(declare-datatypes ((ListLongMap!17865 0))(
  ( (ListLongMap!17866 (toList!8948 List!26697)) )
))
(declare-fun lt!552611 () ListLongMap!17865)

(declare-fun minValue!944 () V!46257)

(declare-fun getCurrentListMapNoExtraKeys!5375 (array!78469 array!78471 (_ BitVec 32) (_ BitVec 32) V!46257 V!46257 (_ BitVec 32) Int) ListLongMap!17865)

(declare-fun dynLambda!3264 (Int (_ BitVec 64)) V!46257)

(assert (=> b!1215431 (= lt!552611 (getCurrentListMapNoExtraKeys!5375 lt!552610 (array!78472 (store (arr!37870 _values!996) i!673 (ValueCellFull!14714 (dynLambda!3264 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38406 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552612 () ListLongMap!17865)

(assert (=> b!1215431 (= lt!552612 (getCurrentListMapNoExtraKeys!5375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215432 () Bool)

(declare-fun e!690139 () Bool)

(assert (=> b!1215432 (= e!690139 tp_is_empty!30847)))

(declare-fun b!1215433 () Bool)

(assert (=> b!1215433 (= e!690136 (and e!690139 mapRes!48145))))

(declare-fun condMapEmpty!48145 () Bool)

(declare-fun mapDefault!48145 () ValueCell!14714)

