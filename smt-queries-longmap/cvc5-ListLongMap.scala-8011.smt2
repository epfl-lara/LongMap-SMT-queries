; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98906 () Bool)

(assert start!98906)

(declare-fun b_free!24511 () Bool)

(declare-fun b_next!24511 () Bool)

(assert (=> start!98906 (= b_free!24511 (not b_next!24511))))

(declare-fun tp!86244 () Bool)

(declare-fun b_and!39871 () Bool)

(assert (=> start!98906 (= tp!86244 b_and!39871)))

(declare-fun b!1158518 () Bool)

(declare-fun e!658829 () Bool)

(declare-fun e!658824 () Bool)

(assert (=> b!1158518 (= e!658829 e!658824)))

(declare-fun res!769171 () Bool)

(assert (=> b!1158518 (=> (not res!769171) (not e!658824))))

(declare-datatypes ((array!74925 0))(
  ( (array!74926 (arr!36113 (Array (_ BitVec 32) (_ BitVec 64))) (size!36649 (_ BitVec 32))) )
))
(declare-fun lt!520613 () array!74925)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74925 (_ BitVec 32)) Bool)

(assert (=> b!1158518 (= res!769171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520613 mask!1564))))

(declare-fun _keys!1208 () array!74925)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158518 (= lt!520613 (array!74926 (store (arr!36113 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36649 _keys!1208)))))

(declare-datatypes ((V!43849 0))(
  ( (V!43850 (val!14577 Int)) )
))
(declare-datatypes ((tuple2!18556 0))(
  ( (tuple2!18557 (_1!9289 (_ BitVec 64)) (_2!9289 V!43849)) )
))
(declare-datatypes ((List!25295 0))(
  ( (Nil!25292) (Cons!25291 (h!26500 tuple2!18556) (t!36798 List!25295)) )
))
(declare-datatypes ((ListLongMap!16525 0))(
  ( (ListLongMap!16526 (toList!8278 List!25295)) )
))
(declare-fun lt!520600 () ListLongMap!16525)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!55671 () Bool)

(declare-fun call!55678 () Bool)

(declare-fun c!115457 () Bool)

(declare-fun call!55680 () ListLongMap!16525)

(declare-fun contains!6788 (ListLongMap!16525 (_ BitVec 64)) Bool)

(assert (=> bm!55671 (= call!55678 (contains!6788 (ite c!115457 lt!520600 call!55680) k!934))))

(declare-fun bm!55672 () Bool)

(declare-datatypes ((Unit!38177 0))(
  ( (Unit!38178) )
))
(declare-fun call!55674 () Unit!38177)

(declare-fun call!55679 () Unit!38177)

(assert (=> bm!55672 (= call!55674 call!55679)))

(declare-fun b!1158519 () Bool)

(declare-fun res!769173 () Bool)

(assert (=> b!1158519 (=> (not res!769173) (not e!658829))))

(assert (=> b!1158519 (= res!769173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!769172 () Bool)

(assert (=> start!98906 (=> (not res!769172) (not e!658829))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98906 (= res!769172 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36649 _keys!1208))))))

(assert (=> start!98906 e!658829))

(declare-fun tp_is_empty!29041 () Bool)

(assert (=> start!98906 tp_is_empty!29041))

(declare-fun array_inv!27636 (array!74925) Bool)

(assert (=> start!98906 (array_inv!27636 _keys!1208)))

(assert (=> start!98906 true))

(assert (=> start!98906 tp!86244))

(declare-datatypes ((ValueCell!13811 0))(
  ( (ValueCellFull!13811 (v!17214 V!43849)) (EmptyCell!13811) )
))
(declare-datatypes ((array!74927 0))(
  ( (array!74928 (arr!36114 (Array (_ BitVec 32) ValueCell!13811)) (size!36650 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74927)

(declare-fun e!658816 () Bool)

(declare-fun array_inv!27637 (array!74927) Bool)

(assert (=> start!98906 (and (array_inv!27637 _values!996) e!658816)))

(declare-fun b!1158520 () Bool)

(declare-fun res!769165 () Bool)

(assert (=> b!1158520 (=> (not res!769165) (not e!658824))))

(declare-datatypes ((List!25296 0))(
  ( (Nil!25293) (Cons!25292 (h!26501 (_ BitVec 64)) (t!36799 List!25296)) )
))
(declare-fun arrayNoDuplicates!0 (array!74925 (_ BitVec 32) List!25296) Bool)

(assert (=> b!1158520 (= res!769165 (arrayNoDuplicates!0 lt!520613 #b00000000000000000000000000000000 Nil!25293))))

(declare-fun zeroValue!944 () V!43849)

(declare-fun lt!520608 () ListLongMap!16525)

(declare-fun minValue!944 () V!43849)

(declare-fun c!115458 () Bool)

(declare-fun bm!55673 () Bool)

(declare-fun addStillContains!929 (ListLongMap!16525 (_ BitVec 64) V!43849 (_ BitVec 64)) Unit!38177)

(assert (=> bm!55673 (= call!55679 (addStillContains!929 (ite c!115457 lt!520600 lt!520608) (ite c!115457 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115458 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115457 minValue!944 (ite c!115458 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!55674 () Bool)

(declare-fun call!55675 () Bool)

(assert (=> bm!55674 (= call!55675 call!55678)))

(declare-fun b!1158521 () Bool)

(declare-fun e!658817 () Unit!38177)

(declare-fun Unit!38179 () Unit!38177)

(assert (=> b!1158521 (= e!658817 Unit!38179)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!55675 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!55677 () ListLongMap!16525)

(declare-fun getCurrentListMapNoExtraKeys!4743 (array!74925 array!74927 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 32) Int) ListLongMap!16525)

(assert (=> bm!55675 (= call!55677 (getCurrentListMapNoExtraKeys!4743 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158522 () Bool)

(declare-fun e!658825 () Bool)

(assert (=> b!1158522 (= e!658825 tp_is_empty!29041)))

(declare-fun e!658818 () Bool)

(declare-fun b!1158523 () Bool)

(declare-fun arrayContainsKey!0 (array!74925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158523 (= e!658818 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158524 () Bool)

(declare-fun mapRes!45386 () Bool)

(assert (=> b!1158524 (= e!658816 (and e!658825 mapRes!45386))))

(declare-fun condMapEmpty!45386 () Bool)

(declare-fun mapDefault!45386 () ValueCell!13811)

