; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100490 () Bool)

(assert start!100490)

(declare-fun b_free!25813 () Bool)

(declare-fun b_next!25813 () Bool)

(assert (=> start!100490 (= b_free!25813 (not b_next!25813))))

(declare-fun tp!90429 () Bool)

(declare-fun b_and!42513 () Bool)

(assert (=> start!100490 (= tp!90429 b_and!42513)))

(declare-fun b!1200288 () Bool)

(declare-fun res!798996 () Bool)

(declare-fun e!681649 () Bool)

(assert (=> b!1200288 (=> (not res!798996) (not e!681649))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77807 0))(
  ( (array!77808 (arr!37548 (Array (_ BitVec 32) (_ BitVec 64))) (size!38084 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77807)

(assert (=> b!1200288 (= res!798996 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38084 _keys!1208))))))

(declare-fun b!1200289 () Bool)

(declare-fun e!681652 () Bool)

(assert (=> b!1200289 (= e!681649 e!681652)))

(declare-fun res!798998 () Bool)

(assert (=> b!1200289 (=> (not res!798998) (not e!681652))))

(declare-fun lt!544001 () array!77807)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77807 (_ BitVec 32)) Bool)

(assert (=> b!1200289 (= res!798998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544001 mask!1564))))

(assert (=> b!1200289 (= lt!544001 (array!77808 (store (arr!37548 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38084 _keys!1208)))))

(declare-fun b!1200290 () Bool)

(declare-fun res!799002 () Bool)

(assert (=> b!1200290 (=> (not res!799002) (not e!681649))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200290 (= res!799002 (validKeyInArray!0 k!934))))

(declare-fun b!1200291 () Bool)

(declare-fun e!681654 () Bool)

(declare-fun tp_is_empty!30517 () Bool)

(assert (=> b!1200291 (= e!681654 tp_is_empty!30517)))

(declare-fun b!1200292 () Bool)

(declare-fun res!798994 () Bool)

(assert (=> b!1200292 (=> (not res!798994) (not e!681652))))

(declare-datatypes ((List!26424 0))(
  ( (Nil!26421) (Cons!26420 (h!27629 (_ BitVec 64)) (t!39217 List!26424)) )
))
(declare-fun arrayNoDuplicates!0 (array!77807 (_ BitVec 32) List!26424) Bool)

(assert (=> b!1200292 (= res!798994 (arrayNoDuplicates!0 lt!544001 #b00000000000000000000000000000000 Nil!26421))))

(declare-fun b!1200293 () Bool)

(declare-fun res!798992 () Bool)

(assert (=> b!1200293 (=> (not res!798992) (not e!681649))))

(assert (=> b!1200293 (= res!798992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200294 () Bool)

(declare-fun res!798997 () Bool)

(assert (=> b!1200294 (=> (not res!798997) (not e!681649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200294 (= res!798997 (validMask!0 mask!1564))))

(declare-fun b!1200296 () Bool)

(declare-fun res!799000 () Bool)

(assert (=> b!1200296 (=> (not res!799000) (not e!681649))))

(assert (=> b!1200296 (= res!799000 (= (select (arr!37548 _keys!1208) i!673) k!934))))

(declare-fun b!1200297 () Bool)

(declare-fun e!681650 () Bool)

(assert (=> b!1200297 (= e!681650 tp_is_empty!30517)))

(declare-fun b!1200298 () Bool)

(declare-fun e!681651 () Bool)

(assert (=> b!1200298 (= e!681652 (not e!681651))))

(declare-fun res!798995 () Bool)

(assert (=> b!1200298 (=> res!798995 e!681651)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200298 (= res!798995 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200298 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39796 0))(
  ( (Unit!39797) )
))
(declare-fun lt!544002 () Unit!39796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77807 (_ BitVec 64) (_ BitVec 32)) Unit!39796)

(assert (=> b!1200298 (= lt!544002 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!47618 () Bool)

(declare-fun mapRes!47618 () Bool)

(assert (=> mapIsEmpty!47618 mapRes!47618))

(declare-fun b!1200295 () Bool)

(assert (=> b!1200295 (= e!681651 (or (not (= from!1455 i!673)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38084 _keys!1208)) (bvslt (bvsub (size!38084 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38084 _keys!1208) from!1455))))))

(declare-datatypes ((V!45817 0))(
  ( (V!45818 (val!15315 Int)) )
))
(declare-fun zeroValue!944 () V!45817)

(declare-datatypes ((tuple2!19604 0))(
  ( (tuple2!19605 (_1!9813 (_ BitVec 64)) (_2!9813 V!45817)) )
))
(declare-datatypes ((List!26425 0))(
  ( (Nil!26422) (Cons!26421 (h!27630 tuple2!19604) (t!39218 List!26425)) )
))
(declare-datatypes ((ListLongMap!17573 0))(
  ( (ListLongMap!17574 (toList!8802 List!26425)) )
))
(declare-fun lt!544000 () ListLongMap!17573)

(declare-datatypes ((ValueCell!14549 0))(
  ( (ValueCellFull!14549 (v!17953 V!45817)) (EmptyCell!14549) )
))
(declare-datatypes ((array!77809 0))(
  ( (array!77810 (arr!37549 (Array (_ BitVec 32) ValueCell!14549)) (size!38085 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77809)

(declare-fun minValue!944 () V!45817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5241 (array!77807 array!77809 (_ BitVec 32) (_ BitVec 32) V!45817 V!45817 (_ BitVec 32) Int) ListLongMap!17573)

(declare-fun dynLambda!3161 (Int (_ BitVec 64)) V!45817)

(assert (=> b!1200295 (= lt!544000 (getCurrentListMapNoExtraKeys!5241 lt!544001 (array!77810 (store (arr!37549 _values!996) i!673 (ValueCellFull!14549 (dynLambda!3161 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38085 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544003 () ListLongMap!17573)

(assert (=> b!1200295 (= lt!544003 (getCurrentListMapNoExtraKeys!5241 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!799001 () Bool)

(assert (=> start!100490 (=> (not res!799001) (not e!681649))))

(assert (=> start!100490 (= res!799001 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38084 _keys!1208))))))

(assert (=> start!100490 e!681649))

(assert (=> start!100490 tp_is_empty!30517))

(declare-fun array_inv!28616 (array!77807) Bool)

(assert (=> start!100490 (array_inv!28616 _keys!1208)))

(assert (=> start!100490 true))

(assert (=> start!100490 tp!90429))

(declare-fun e!681653 () Bool)

(declare-fun array_inv!28617 (array!77809) Bool)

(assert (=> start!100490 (and (array_inv!28617 _values!996) e!681653)))

(declare-fun b!1200299 () Bool)

(assert (=> b!1200299 (= e!681653 (and e!681650 mapRes!47618))))

(declare-fun condMapEmpty!47618 () Bool)

(declare-fun mapDefault!47618 () ValueCell!14549)

