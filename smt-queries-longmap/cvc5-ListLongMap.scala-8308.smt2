; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101196 () Bool)

(assert start!101196)

(declare-fun b_free!26119 () Bool)

(declare-fun b_next!26119 () Bool)

(assert (=> start!101196 (= b_free!26119 (not b_next!26119))))

(declare-fun tp!91378 () Bool)

(declare-fun b_and!43355 () Bool)

(assert (=> start!101196 (= tp!91378 b_and!43355)))

(declare-fun b!1214892 () Bool)

(declare-fun res!806597 () Bool)

(declare-fun e!689887 () Bool)

(assert (=> b!1214892 (=> (not res!806597) (not e!689887))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!78425 0))(
  ( (array!78426 (arr!37847 (Array (_ BitVec 32) (_ BitVec 64))) (size!38383 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78425)

(assert (=> b!1214892 (= res!806597 (= (select (arr!37847 _keys!1208) i!673) k!934))))

(declare-fun b!1214893 () Bool)

(declare-fun res!806601 () Bool)

(assert (=> b!1214893 (=> (not res!806601) (not e!689887))))

(declare-datatypes ((List!26681 0))(
  ( (Nil!26678) (Cons!26677 (h!27886 (_ BitVec 64)) (t!39780 List!26681)) )
))
(declare-fun arrayNoDuplicates!0 (array!78425 (_ BitVec 32) List!26681) Bool)

(assert (=> b!1214893 (= res!806601 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26678))))

(declare-fun b!1214894 () Bool)

(declare-fun res!806600 () Bool)

(assert (=> b!1214894 (=> (not res!806600) (not e!689887))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214894 (= res!806600 (validMask!0 mask!1564))))

(declare-fun b!1214895 () Bool)

(declare-fun res!806603 () Bool)

(assert (=> b!1214895 (=> (not res!806603) (not e!689887))))

(assert (=> b!1214895 (= res!806603 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38383 _keys!1208))))))

(declare-fun b!1214896 () Bool)

(declare-fun res!806593 () Bool)

(assert (=> b!1214896 (=> (not res!806593) (not e!689887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78425 (_ BitVec 32)) Bool)

(assert (=> b!1214896 (= res!806593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214897 () Bool)

(declare-fun res!806595 () Bool)

(declare-fun e!689885 () Bool)

(assert (=> b!1214897 (=> (not res!806595) (not e!689885))))

(declare-fun lt!552467 () array!78425)

(assert (=> b!1214897 (= res!806595 (arrayNoDuplicates!0 lt!552467 #b00000000000000000000000000000000 Nil!26678))))

(declare-fun b!1214899 () Bool)

(declare-fun e!689884 () Bool)

(assert (=> b!1214899 (= e!689884 true)))

(declare-datatypes ((V!46225 0))(
  ( (V!46226 (val!15468 Int)) )
))
(declare-fun zeroValue!944 () V!46225)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14702 0))(
  ( (ValueCellFull!14702 (v!18121 V!46225)) (EmptyCell!14702) )
))
(declare-datatypes ((array!78427 0))(
  ( (array!78428 (arr!37848 (Array (_ BitVec 32) ValueCell!14702)) (size!38384 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78427)

(declare-fun minValue!944 () V!46225)

(declare-datatypes ((tuple2!19882 0))(
  ( (tuple2!19883 (_1!9952 (_ BitVec 64)) (_2!9952 V!46225)) )
))
(declare-datatypes ((List!26682 0))(
  ( (Nil!26679) (Cons!26678 (h!27887 tuple2!19882) (t!39781 List!26682)) )
))
(declare-datatypes ((ListLongMap!17851 0))(
  ( (ListLongMap!17852 (toList!8941 List!26682)) )
))
(declare-fun lt!552465 () ListLongMap!17851)

(declare-fun getCurrentListMapNoExtraKeys!5368 (array!78425 array!78427 (_ BitVec 32) (_ BitVec 32) V!46225 V!46225 (_ BitVec 32) Int) ListLongMap!17851)

(declare-fun dynLambda!3257 (Int (_ BitVec 64)) V!46225)

(assert (=> b!1214899 (= lt!552465 (getCurrentListMapNoExtraKeys!5368 lt!552467 (array!78428 (store (arr!37848 _values!996) i!673 (ValueCellFull!14702 (dynLambda!3257 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38384 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552468 () ListLongMap!17851)

(assert (=> b!1214899 (= lt!552468 (getCurrentListMapNoExtraKeys!5368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214900 () Bool)

(declare-fun e!689881 () Bool)

(declare-fun tp_is_empty!30823 () Bool)

(assert (=> b!1214900 (= e!689881 tp_is_empty!30823)))

(declare-fun b!1214901 () Bool)

(declare-fun res!806596 () Bool)

(assert (=> b!1214901 (=> (not res!806596) (not e!689887))))

(assert (=> b!1214901 (= res!806596 (and (= (size!38384 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38383 _keys!1208) (size!38384 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!806598 () Bool)

(assert (=> start!101196 (=> (not res!806598) (not e!689887))))

(assert (=> start!101196 (= res!806598 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38383 _keys!1208))))))

(assert (=> start!101196 e!689887))

(assert (=> start!101196 tp_is_empty!30823))

(declare-fun array_inv!28818 (array!78425) Bool)

(assert (=> start!101196 (array_inv!28818 _keys!1208)))

(assert (=> start!101196 true))

(assert (=> start!101196 tp!91378))

(declare-fun e!689882 () Bool)

(declare-fun array_inv!28819 (array!78427) Bool)

(assert (=> start!101196 (and (array_inv!28819 _values!996) e!689882)))

(declare-fun b!1214898 () Bool)

(assert (=> b!1214898 (= e!689885 (not e!689884))))

(declare-fun res!806602 () Bool)

(assert (=> b!1214898 (=> res!806602 e!689884)))

(assert (=> b!1214898 (= res!806602 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214898 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40284 0))(
  ( (Unit!40285) )
))
(declare-fun lt!552466 () Unit!40284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78425 (_ BitVec 64) (_ BitVec 32)) Unit!40284)

(assert (=> b!1214898 (= lt!552466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1214902 () Bool)

(declare-fun res!806594 () Bool)

(assert (=> b!1214902 (=> (not res!806594) (not e!689887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214902 (= res!806594 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!48109 () Bool)

(declare-fun mapRes!48109 () Bool)

(declare-fun tp!91379 () Bool)

(declare-fun e!689883 () Bool)

(assert (=> mapNonEmpty!48109 (= mapRes!48109 (and tp!91379 e!689883))))

(declare-fun mapRest!48109 () (Array (_ BitVec 32) ValueCell!14702))

(declare-fun mapValue!48109 () ValueCell!14702)

(declare-fun mapKey!48109 () (_ BitVec 32))

(assert (=> mapNonEmpty!48109 (= (arr!37848 _values!996) (store mapRest!48109 mapKey!48109 mapValue!48109))))

(declare-fun b!1214903 () Bool)

(assert (=> b!1214903 (= e!689883 tp_is_empty!30823)))

(declare-fun mapIsEmpty!48109 () Bool)

(assert (=> mapIsEmpty!48109 mapRes!48109))

(declare-fun b!1214904 () Bool)

(assert (=> b!1214904 (= e!689887 e!689885)))

(declare-fun res!806599 () Bool)

(assert (=> b!1214904 (=> (not res!806599) (not e!689885))))

(assert (=> b!1214904 (= res!806599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552467 mask!1564))))

(assert (=> b!1214904 (= lt!552467 (array!78426 (store (arr!37847 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38383 _keys!1208)))))

(declare-fun b!1214905 () Bool)

(assert (=> b!1214905 (= e!689882 (and e!689881 mapRes!48109))))

(declare-fun condMapEmpty!48109 () Bool)

(declare-fun mapDefault!48109 () ValueCell!14702)

