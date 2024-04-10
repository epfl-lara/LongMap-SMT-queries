; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101178 () Bool)

(assert start!101178)

(declare-fun b_free!26101 () Bool)

(declare-fun b_next!26101 () Bool)

(assert (=> start!101178 (= b_free!26101 (not b_next!26101))))

(declare-fun tp!91325 () Bool)

(declare-fun b_and!43319 () Bool)

(assert (=> start!101178 (= tp!91325 b_and!43319)))

(declare-fun b!1214496 () Bool)

(declare-fun res!806302 () Bool)

(declare-fun e!689696 () Bool)

(assert (=> b!1214496 (=> (not res!806302) (not e!689696))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78393 0))(
  ( (array!78394 (arr!37831 (Array (_ BitVec 32) (_ BitVec 64))) (size!38367 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78393)

(assert (=> b!1214496 (= res!806302 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38367 _keys!1208))))))

(declare-fun res!806298 () Bool)

(assert (=> start!101178 (=> (not res!806298) (not e!689696))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101178 (= res!806298 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38367 _keys!1208))))))

(assert (=> start!101178 e!689696))

(declare-fun tp_is_empty!30805 () Bool)

(assert (=> start!101178 tp_is_empty!30805))

(declare-fun array_inv!28806 (array!78393) Bool)

(assert (=> start!101178 (array_inv!28806 _keys!1208)))

(assert (=> start!101178 true))

(assert (=> start!101178 tp!91325))

(declare-datatypes ((V!46201 0))(
  ( (V!46202 (val!15459 Int)) )
))
(declare-datatypes ((ValueCell!14693 0))(
  ( (ValueCellFull!14693 (v!18112 V!46201)) (EmptyCell!14693) )
))
(declare-datatypes ((array!78395 0))(
  ( (array!78396 (arr!37832 (Array (_ BitVec 32) ValueCell!14693)) (size!38368 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78395)

(declare-fun e!689693 () Bool)

(declare-fun array_inv!28807 (array!78395) Bool)

(assert (=> start!101178 (and (array_inv!28807 _values!996) e!689693)))

(declare-fun b!1214497 () Bool)

(declare-fun e!689695 () Bool)

(assert (=> b!1214497 (= e!689696 e!689695)))

(declare-fun res!806299 () Bool)

(assert (=> b!1214497 (=> (not res!806299) (not e!689695))))

(declare-fun lt!552358 () array!78393)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78393 (_ BitVec 32)) Bool)

(assert (=> b!1214497 (= res!806299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552358 mask!1564))))

(assert (=> b!1214497 (= lt!552358 (array!78394 (store (arr!37831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38367 _keys!1208)))))

(declare-fun b!1214498 () Bool)

(declare-fun res!806306 () Bool)

(assert (=> b!1214498 (=> (not res!806306) (not e!689696))))

(declare-datatypes ((List!26671 0))(
  ( (Nil!26668) (Cons!26667 (h!27876 (_ BitVec 64)) (t!39752 List!26671)) )
))
(declare-fun arrayNoDuplicates!0 (array!78393 (_ BitVec 32) List!26671) Bool)

(assert (=> b!1214498 (= res!806306 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26668))))

(declare-fun mapIsEmpty!48082 () Bool)

(declare-fun mapRes!48082 () Bool)

(assert (=> mapIsEmpty!48082 mapRes!48082))

(declare-fun b!1214499 () Bool)

(declare-fun res!806301 () Bool)

(assert (=> b!1214499 (=> (not res!806301) (not e!689696))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1214499 (= res!806301 (= (select (arr!37831 _keys!1208) i!673) k!934))))

(declare-fun b!1214500 () Bool)

(declare-fun res!806305 () Bool)

(assert (=> b!1214500 (=> (not res!806305) (not e!689696))))

(assert (=> b!1214500 (= res!806305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214501 () Bool)

(declare-fun res!806300 () Bool)

(assert (=> b!1214501 (=> (not res!806300) (not e!689696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214501 (= res!806300 (validMask!0 mask!1564))))

(declare-fun b!1214502 () Bool)

(declare-fun e!689697 () Bool)

(assert (=> b!1214502 (= e!689697 tp_is_empty!30805)))

(declare-fun b!1214503 () Bool)

(declare-fun res!806304 () Bool)

(assert (=> b!1214503 (=> (not res!806304) (not e!689695))))

(assert (=> b!1214503 (= res!806304 (arrayNoDuplicates!0 lt!552358 #b00000000000000000000000000000000 Nil!26668))))

(declare-fun b!1214504 () Bool)

(declare-fun e!689692 () Bool)

(assert (=> b!1214504 (= e!689692 true)))

(declare-fun zeroValue!944 () V!46201)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19872 0))(
  ( (tuple2!19873 (_1!9947 (_ BitVec 64)) (_2!9947 V!46201)) )
))
(declare-datatypes ((List!26672 0))(
  ( (Nil!26669) (Cons!26668 (h!27877 tuple2!19872) (t!39753 List!26672)) )
))
(declare-datatypes ((ListLongMap!17841 0))(
  ( (ListLongMap!17842 (toList!8936 List!26672)) )
))
(declare-fun lt!552360 () ListLongMap!17841)

(declare-fun minValue!944 () V!46201)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5363 (array!78393 array!78395 (_ BitVec 32) (_ BitVec 32) V!46201 V!46201 (_ BitVec 32) Int) ListLongMap!17841)

(declare-fun dynLambda!3252 (Int (_ BitVec 64)) V!46201)

(assert (=> b!1214504 (= lt!552360 (getCurrentListMapNoExtraKeys!5363 lt!552358 (array!78396 (store (arr!37832 _values!996) i!673 (ValueCellFull!14693 (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38368 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552357 () ListLongMap!17841)

(assert (=> b!1214504 (= lt!552357 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214505 () Bool)

(assert (=> b!1214505 (= e!689693 (and e!689697 mapRes!48082))))

(declare-fun condMapEmpty!48082 () Bool)

(declare-fun mapDefault!48082 () ValueCell!14693)

