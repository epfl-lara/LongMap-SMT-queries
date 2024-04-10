; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101384 () Bool)

(assert start!101384)

(declare-fun b_free!26255 () Bool)

(declare-fun b_next!26255 () Bool)

(assert (=> start!101384 (= b_free!26255 (not b_next!26255))))

(declare-fun tp!91792 () Bool)

(declare-fun b_and!43663 () Bool)

(assert (=> start!101384 (= tp!91792 b_and!43663)))

(declare-fun b!1218447 () Bool)

(declare-fun e!691779 () Bool)

(declare-fun e!691781 () Bool)

(assert (=> b!1218447 (= e!691779 e!691781)))

(declare-fun res!809241 () Bool)

(assert (=> b!1218447 (=> res!809241 e!691781)))

(declare-datatypes ((array!78693 0))(
  ( (array!78694 (arr!37979 (Array (_ BitVec 32) (_ BitVec 64))) (size!38515 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78693)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218447 (= res!809241 (not (= (select (arr!37979 _keys!1208) from!1455) k!934)))))

(declare-fun b!1218448 () Bool)

(declare-fun e!691778 () Bool)

(declare-fun e!691777 () Bool)

(assert (=> b!1218448 (= e!691778 (not e!691777))))

(declare-fun res!809234 () Bool)

(assert (=> b!1218448 (=> res!809234 e!691777)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218448 (= res!809234 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218448 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40390 0))(
  ( (Unit!40391) )
))
(declare-fun lt!553900 () Unit!40390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78693 (_ BitVec 64) (_ BitVec 32)) Unit!40390)

(assert (=> b!1218448 (= lt!553900 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!48319 () Bool)

(declare-fun mapRes!48319 () Bool)

(declare-fun tp!91793 () Bool)

(declare-fun e!691774 () Bool)

(assert (=> mapNonEmpty!48319 (= mapRes!48319 (and tp!91793 e!691774))))

(declare-fun mapKey!48319 () (_ BitVec 32))

(declare-datatypes ((V!46405 0))(
  ( (V!46406 (val!15536 Int)) )
))
(declare-datatypes ((ValueCell!14770 0))(
  ( (ValueCellFull!14770 (v!18191 V!46405)) (EmptyCell!14770) )
))
(declare-fun mapValue!48319 () ValueCell!14770)

(declare-datatypes ((array!78695 0))(
  ( (array!78696 (arr!37980 (Array (_ BitVec 32) ValueCell!14770)) (size!38516 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78695)

(declare-fun mapRest!48319 () (Array (_ BitVec 32) ValueCell!14770))

(assert (=> mapNonEmpty!48319 (= (arr!37980 _values!996) (store mapRest!48319 mapKey!48319 mapValue!48319))))

(declare-fun b!1218449 () Bool)

(declare-fun res!809242 () Bool)

(declare-fun e!691780 () Bool)

(assert (=> b!1218449 (=> (not res!809242) (not e!691780))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78693 (_ BitVec 32)) Bool)

(assert (=> b!1218449 (= res!809242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218450 () Bool)

(declare-fun res!809233 () Bool)

(assert (=> b!1218450 (=> (not res!809233) (not e!691780))))

(assert (=> b!1218450 (= res!809233 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38515 _keys!1208))))))

(declare-fun b!1218451 () Bool)

(declare-fun e!691775 () Bool)

(declare-fun tp_is_empty!30959 () Bool)

(assert (=> b!1218451 (= e!691775 tp_is_empty!30959)))

(declare-fun b!1218452 () Bool)

(declare-fun res!809237 () Bool)

(assert (=> b!1218452 (=> (not res!809237) (not e!691778))))

(declare-fun lt!553901 () array!78693)

(declare-datatypes ((List!26788 0))(
  ( (Nil!26785) (Cons!26784 (h!27993 (_ BitVec 64)) (t!40023 List!26788)) )
))
(declare-fun arrayNoDuplicates!0 (array!78693 (_ BitVec 32) List!26788) Bool)

(assert (=> b!1218452 (= res!809237 (arrayNoDuplicates!0 lt!553901 #b00000000000000000000000000000000 Nil!26785))))

(declare-fun b!1218453 () Bool)

(declare-fun res!809235 () Bool)

(assert (=> b!1218453 (=> (not res!809235) (not e!691780))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1218453 (= res!809235 (and (= (size!38516 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38515 _keys!1208) (size!38516 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218454 () Bool)

(assert (=> b!1218454 (= e!691781 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun res!809244 () Bool)

(assert (=> start!101384 (=> (not res!809244) (not e!691780))))

(assert (=> start!101384 (= res!809244 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38515 _keys!1208))))))

(assert (=> start!101384 e!691780))

(assert (=> start!101384 tp_is_empty!30959))

(declare-fun array_inv!28904 (array!78693) Bool)

(assert (=> start!101384 (array_inv!28904 _keys!1208)))

(assert (=> start!101384 true))

(assert (=> start!101384 tp!91792))

(declare-fun e!691776 () Bool)

(declare-fun array_inv!28905 (array!78695) Bool)

(assert (=> start!101384 (and (array_inv!28905 _values!996) e!691776)))

(declare-fun b!1218455 () Bool)

(declare-fun e!691784 () Bool)

(assert (=> b!1218455 (= e!691784 true)))

(assert (=> b!1218455 e!691779))

(declare-fun res!809232 () Bool)

(assert (=> b!1218455 (=> (not res!809232) (not e!691779))))

(declare-datatypes ((tuple2!19986 0))(
  ( (tuple2!19987 (_1!10004 (_ BitVec 64)) (_2!10004 V!46405)) )
))
(declare-datatypes ((List!26789 0))(
  ( (Nil!26786) (Cons!26785 (h!27994 tuple2!19986) (t!40024 List!26789)) )
))
(declare-datatypes ((ListLongMap!17955 0))(
  ( (ListLongMap!17956 (toList!8993 List!26789)) )
))
(declare-fun lt!553893 () ListLongMap!17955)

(declare-fun lt!553894 () V!46405)

(declare-fun lt!553895 () ListLongMap!17955)

(declare-fun +!4062 (ListLongMap!17955 tuple2!19986) ListLongMap!17955)

(declare-fun get!19357 (ValueCell!14770 V!46405) V!46405)

(assert (=> b!1218455 (= res!809232 (= lt!553895 (+!4062 lt!553893 (tuple2!19987 (select (arr!37979 _keys!1208) from!1455) (get!19357 (select (arr!37980 _values!996) from!1455) lt!553894)))))))

(declare-fun b!1218456 () Bool)

(declare-fun e!691783 () Bool)

(assert (=> b!1218456 (= e!691777 e!691783)))

(declare-fun res!809245 () Bool)

(assert (=> b!1218456 (=> res!809245 e!691783)))

(assert (=> b!1218456 (= res!809245 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46405)

(declare-fun lt!553898 () array!78695)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46405)

(declare-fun getCurrentListMapNoExtraKeys!5419 (array!78693 array!78695 (_ BitVec 32) (_ BitVec 32) V!46405 V!46405 (_ BitVec 32) Int) ListLongMap!17955)

(assert (=> b!1218456 (= lt!553895 (getCurrentListMapNoExtraKeys!5419 lt!553901 lt!553898 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218456 (= lt!553898 (array!78696 (store (arr!37980 _values!996) i!673 (ValueCellFull!14770 lt!553894)) (size!38516 _values!996)))))

(declare-fun dynLambda!3302 (Int (_ BitVec 64)) V!46405)

(assert (=> b!1218456 (= lt!553894 (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553899 () ListLongMap!17955)

(assert (=> b!1218456 (= lt!553899 (getCurrentListMapNoExtraKeys!5419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218457 () Bool)

(declare-fun res!809236 () Bool)

(assert (=> b!1218457 (=> (not res!809236) (not e!691780))))

(assert (=> b!1218457 (= res!809236 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26785))))

(declare-fun b!1218458 () Bool)

(assert (=> b!1218458 (= e!691774 tp_is_empty!30959)))

(declare-fun b!1218459 () Bool)

(declare-fun res!809240 () Bool)

(assert (=> b!1218459 (=> (not res!809240) (not e!691780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218459 (= res!809240 (validMask!0 mask!1564))))

(declare-fun b!1218460 () Bool)

(declare-fun res!809243 () Bool)

(assert (=> b!1218460 (=> (not res!809243) (not e!691780))))

(assert (=> b!1218460 (= res!809243 (= (select (arr!37979 _keys!1208) i!673) k!934))))

(declare-fun b!1218461 () Bool)

(assert (=> b!1218461 (= e!691776 (and e!691775 mapRes!48319))))

(declare-fun condMapEmpty!48319 () Bool)

(declare-fun mapDefault!48319 () ValueCell!14770)

