; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98802 () Bool)

(assert start!98802)

(declare-fun b_free!24407 () Bool)

(declare-fun b_next!24407 () Bool)

(assert (=> start!98802 (= b_free!24407 (not b_next!24407))))

(declare-fun tp!85932 () Bool)

(declare-fun b_and!39663 () Bool)

(assert (=> start!98802 (= tp!85932 b_and!39663)))

(declare-fun b!1153734 () Bool)

(declare-datatypes ((Unit!37974 0))(
  ( (Unit!37975) )
))
(declare-fun e!656174 () Unit!37974)

(declare-fun lt!517179 () Unit!37974)

(assert (=> b!1153734 (= e!656174 lt!517179)))

(declare-fun call!54431 () Unit!37974)

(assert (=> b!1153734 (= lt!517179 call!54431)))

(declare-fun call!54432 () Bool)

(assert (=> b!1153734 call!54432))

(declare-fun b!1153735 () Bool)

(declare-fun res!766831 () Bool)

(declare-fun e!656163 () Bool)

(assert (=> b!1153735 (=> (not res!766831) (not e!656163))))

(declare-datatypes ((array!74721 0))(
  ( (array!74722 (arr!36011 (Array (_ BitVec 32) (_ BitVec 64))) (size!36547 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74721)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74721 (_ BitVec 32)) Bool)

(assert (=> b!1153735 (= res!766831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153736 () Bool)

(declare-fun res!766825 () Bool)

(assert (=> b!1153736 (=> (not res!766825) (not e!656163))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153736 (= res!766825 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!45230 () Bool)

(declare-fun mapRes!45230 () Bool)

(declare-fun tp!85931 () Bool)

(declare-fun e!656172 () Bool)

(assert (=> mapNonEmpty!45230 (= mapRes!45230 (and tp!85931 e!656172))))

(declare-datatypes ((V!43709 0))(
  ( (V!43710 (val!14525 Int)) )
))
(declare-datatypes ((ValueCell!13759 0))(
  ( (ValueCellFull!13759 (v!17162 V!43709)) (EmptyCell!13759) )
))
(declare-fun mapValue!45230 () ValueCell!13759)

(declare-fun mapRest!45230 () (Array (_ BitVec 32) ValueCell!13759))

(declare-datatypes ((array!74723 0))(
  ( (array!74724 (arr!36012 (Array (_ BitVec 32) ValueCell!13759)) (size!36548 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74723)

(declare-fun mapKey!45230 () (_ BitVec 32))

(assert (=> mapNonEmpty!45230 (= (arr!36012 _values!996) (store mapRest!45230 mapKey!45230 mapValue!45230))))

(declare-fun b!1153738 () Bool)

(declare-fun res!766829 () Bool)

(assert (=> b!1153738 (=> (not res!766829) (not e!656163))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153738 (= res!766829 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36547 _keys!1208))))))

(declare-fun b!1153739 () Bool)

(declare-fun e!656170 () Unit!37974)

(declare-fun Unit!37976 () Unit!37974)

(assert (=> b!1153739 (= e!656170 Unit!37976)))

(declare-fun b!1153740 () Bool)

(declare-fun res!766828 () Bool)

(assert (=> b!1153740 (=> (not res!766828) (not e!656163))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1153740 (= res!766828 (and (= (size!36548 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36547 _keys!1208) (size!36548 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!114523 () Bool)

(declare-fun bm!54423 () Bool)

(declare-datatypes ((tuple2!18458 0))(
  ( (tuple2!18459 (_1!9240 (_ BitVec 64)) (_2!9240 V!43709)) )
))
(declare-datatypes ((List!25203 0))(
  ( (Nil!25200) (Cons!25199 (h!26408 tuple2!18458) (t!36602 List!25203)) )
))
(declare-datatypes ((ListLongMap!16427 0))(
  ( (ListLongMap!16428 (toList!8229 List!25203)) )
))
(declare-fun lt!517172 () ListLongMap!16427)

(declare-fun call!54429 () Unit!37974)

(declare-fun lt!517173 () ListLongMap!16427)

(declare-fun minValue!944 () V!43709)

(declare-fun zeroValue!944 () V!43709)

(declare-fun c!114522 () Bool)

(declare-fun addStillContains!888 (ListLongMap!16427 (_ BitVec 64) V!43709 (_ BitVec 64)) Unit!37974)

(assert (=> bm!54423 (= call!54429 (addStillContains!888 (ite c!114523 lt!517172 lt!517173) (ite c!114523 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114522 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114523 minValue!944 (ite c!114522 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1153741 () Bool)

(declare-fun e!656167 () Bool)

(declare-fun tp_is_empty!28937 () Bool)

(assert (=> b!1153741 (= e!656167 tp_is_empty!28937)))

(declare-fun b!1153742 () Bool)

(declare-fun e!656171 () Bool)

(assert (=> b!1153742 (= e!656171 (and e!656167 mapRes!45230))))

(declare-fun condMapEmpty!45230 () Bool)

(declare-fun mapDefault!45230 () ValueCell!13759)

