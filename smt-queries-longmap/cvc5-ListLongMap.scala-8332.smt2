; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101418 () Bool)

(assert start!101418)

(declare-fun b_free!26263 () Bool)

(declare-fun b_next!26263 () Bool)

(assert (=> start!101418 (= b_free!26263 (not b_next!26263))))

(declare-fun tp!91820 () Bool)

(declare-fun b_and!43697 () Bool)

(assert (=> start!101418 (= tp!91820 b_and!43697)))

(declare-fun res!809475 () Bool)

(declare-fun e!692009 () Bool)

(assert (=> start!101418 (=> (not res!809475) (not e!692009))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78709 0))(
  ( (array!78710 (arr!37986 (Array (_ BitVec 32) (_ BitVec 64))) (size!38522 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78709)

(assert (=> start!101418 (= res!809475 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38522 _keys!1208))))))

(assert (=> start!101418 e!692009))

(declare-fun tp_is_empty!30967 () Bool)

(assert (=> start!101418 tp_is_empty!30967))

(declare-fun array_inv!28910 (array!78709) Bool)

(assert (=> start!101418 (array_inv!28910 _keys!1208)))

(assert (=> start!101418 true))

(assert (=> start!101418 tp!91820))

(declare-datatypes ((V!46417 0))(
  ( (V!46418 (val!15540 Int)) )
))
(declare-datatypes ((ValueCell!14774 0))(
  ( (ValueCellFull!14774 (v!18196 V!46417)) (EmptyCell!14774) )
))
(declare-datatypes ((array!78711 0))(
  ( (array!78712 (arr!37987 (Array (_ BitVec 32) ValueCell!14774)) (size!38523 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78711)

(declare-fun e!692008 () Bool)

(declare-fun array_inv!28911 (array!78711) Bool)

(assert (=> start!101418 (and (array_inv!28911 _values!996) e!692008)))

(declare-fun mapIsEmpty!48334 () Bool)

(declare-fun mapRes!48334 () Bool)

(assert (=> mapIsEmpty!48334 mapRes!48334))

(declare-fun b!1218816 () Bool)

(declare-fun e!692003 () Bool)

(declare-fun e!692002 () Bool)

(assert (=> b!1218816 (= e!692003 e!692002)))

(declare-fun res!809487 () Bool)

(assert (=> b!1218816 (=> res!809487 e!692002)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218816 (= res!809487 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19992 0))(
  ( (tuple2!19993 (_1!10007 (_ BitVec 64)) (_2!10007 V!46417)) )
))
(declare-datatypes ((List!26794 0))(
  ( (Nil!26791) (Cons!26790 (h!27999 tuple2!19992) (t!40037 List!26794)) )
))
(declare-datatypes ((ListLongMap!17961 0))(
  ( (ListLongMap!17962 (toList!8996 List!26794)) )
))
(declare-fun lt!554090 () ListLongMap!17961)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!554091 () array!78709)

(declare-fun minValue!944 () V!46417)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554095 () array!78711)

(declare-fun getCurrentListMapNoExtraKeys!5422 (array!78709 array!78711 (_ BitVec 32) (_ BitVec 32) V!46417 V!46417 (_ BitVec 32) Int) ListLongMap!17961)

(assert (=> b!1218816 (= lt!554090 (getCurrentListMapNoExtraKeys!5422 lt!554091 lt!554095 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554089 () V!46417)

(assert (=> b!1218816 (= lt!554095 (array!78712 (store (arr!37987 _values!996) i!673 (ValueCellFull!14774 lt!554089)) (size!38523 _values!996)))))

(declare-fun dynLambda!3305 (Int (_ BitVec 64)) V!46417)

(assert (=> b!1218816 (= lt!554089 (dynLambda!3305 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554092 () ListLongMap!17961)

(assert (=> b!1218816 (= lt!554092 (getCurrentListMapNoExtraKeys!5422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218817 () Bool)

(declare-fun res!809474 () Bool)

(assert (=> b!1218817 (=> (not res!809474) (not e!692009))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218817 (= res!809474 (validKeyInArray!0 k!934))))

(declare-fun b!1218818 () Bool)

(declare-fun res!809479 () Bool)

(assert (=> b!1218818 (=> (not res!809479) (not e!692009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78709 (_ BitVec 32)) Bool)

(assert (=> b!1218818 (= res!809479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218819 () Bool)

(declare-fun res!809476 () Bool)

(assert (=> b!1218819 (=> (not res!809476) (not e!692009))))

(assert (=> b!1218819 (= res!809476 (and (= (size!38523 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38522 _keys!1208) (size!38523 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218820 () Bool)

(declare-fun e!692010 () Bool)

(assert (=> b!1218820 (= e!692010 tp_is_empty!30967)))

(declare-fun b!1218821 () Bool)

(declare-fun e!692012 () Bool)

(assert (=> b!1218821 (= e!692012 true)))

(declare-fun e!692004 () Bool)

(assert (=> b!1218821 e!692004))

(declare-fun res!809482 () Bool)

(assert (=> b!1218821 (=> (not res!809482) (not e!692004))))

(declare-fun lt!554094 () ListLongMap!17961)

(declare-fun +!4065 (ListLongMap!17961 tuple2!19992) ListLongMap!17961)

(declare-fun get!19366 (ValueCell!14774 V!46417) V!46417)

(assert (=> b!1218821 (= res!809482 (= lt!554090 (+!4065 lt!554094 (tuple2!19993 (select (arr!37986 _keys!1208) from!1455) (get!19366 (select (arr!37987 _values!996) from!1455) lt!554089)))))))

(declare-fun b!1218822 () Bool)

(declare-fun e!692011 () Bool)

(assert (=> b!1218822 (= e!692009 e!692011)))

(declare-fun res!809477 () Bool)

(assert (=> b!1218822 (=> (not res!809477) (not e!692011))))

(assert (=> b!1218822 (= res!809477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554091 mask!1564))))

(assert (=> b!1218822 (= lt!554091 (array!78710 (store (arr!37986 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38522 _keys!1208)))))

(declare-fun b!1218823 () Bool)

(declare-fun res!809483 () Bool)

(assert (=> b!1218823 (=> (not res!809483) (not e!692009))))

(declare-datatypes ((List!26795 0))(
  ( (Nil!26792) (Cons!26791 (h!28000 (_ BitVec 64)) (t!40038 List!26795)) )
))
(declare-fun arrayNoDuplicates!0 (array!78709 (_ BitVec 32) List!26795) Bool)

(assert (=> b!1218823 (= res!809483 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26792))))

(declare-fun b!1218824 () Bool)

(declare-fun res!809480 () Bool)

(assert (=> b!1218824 (=> (not res!809480) (not e!692011))))

(assert (=> b!1218824 (= res!809480 (arrayNoDuplicates!0 lt!554091 #b00000000000000000000000000000000 Nil!26792))))

(declare-fun b!1218825 () Bool)

(declare-fun res!809478 () Bool)

(assert (=> b!1218825 (=> (not res!809478) (not e!692009))))

(assert (=> b!1218825 (= res!809478 (= (select (arr!37986 _keys!1208) i!673) k!934))))

(declare-fun b!1218826 () Bool)

(declare-fun res!809486 () Bool)

(assert (=> b!1218826 (=> (not res!809486) (not e!692009))))

(assert (=> b!1218826 (= res!809486 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38522 _keys!1208))))))

(declare-fun b!1218827 () Bool)

(declare-fun e!692007 () Bool)

(assert (=> b!1218827 (= e!692007 tp_is_empty!30967)))

(declare-fun b!1218828 () Bool)

(declare-fun res!809481 () Bool)

(assert (=> b!1218828 (=> (not res!809481) (not e!692009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218828 (= res!809481 (validMask!0 mask!1564))))

(declare-fun b!1218829 () Bool)

(assert (=> b!1218829 (= e!692008 (and e!692010 mapRes!48334))))

(declare-fun condMapEmpty!48334 () Bool)

(declare-fun mapDefault!48334 () ValueCell!14774)

