; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98364 () Bool)

(assert start!98364)

(declare-fun b_free!23969 () Bool)

(declare-fun b_next!23969 () Bool)

(assert (=> start!98364 (= b_free!23969 (not b_next!23969))))

(declare-fun tp!84618 () Bool)

(declare-fun b_and!38787 () Bool)

(assert (=> start!98364 (= tp!84618 b_and!38787)))

(declare-fun b!1133777 () Bool)

(declare-fun c!110670 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!503872 () Bool)

(assert (=> b!1133777 (= c!110670 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503872))))

(declare-datatypes ((Unit!37151 0))(
  ( (Unit!37152) )
))
(declare-fun e!645263 () Unit!37151)

(declare-fun e!645261 () Unit!37151)

(assert (=> b!1133777 (= e!645263 e!645261)))

(declare-datatypes ((V!43125 0))(
  ( (V!43126 (val!14306 Int)) )
))
(declare-datatypes ((tuple2!18044 0))(
  ( (tuple2!18045 (_1!9033 (_ BitVec 64)) (_2!9033 V!43125)) )
))
(declare-datatypes ((List!24805 0))(
  ( (Nil!24802) (Cons!24801 (h!26010 tuple2!18044) (t!35766 List!24805)) )
))
(declare-datatypes ((ListLongMap!16013 0))(
  ( (ListLongMap!16014 (toList!8022 List!24805)) )
))
(declare-fun call!49171 () ListLongMap!16013)

(declare-fun e!645265 () Bool)

(declare-fun b!1133778 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!49177 () ListLongMap!16013)

(declare-fun -!1189 (ListLongMap!16013 (_ BitVec 64)) ListLongMap!16013)

(assert (=> b!1133778 (= e!645265 (= call!49171 (-!1189 call!49177 k!934)))))

(declare-fun b!1133779 () Bool)

(declare-fun e!645268 () Bool)

(assert (=> b!1133779 (= e!645268 true)))

(declare-fun e!645255 () Bool)

(assert (=> b!1133779 e!645255))

(declare-fun res!756991 () Bool)

(assert (=> b!1133779 (=> (not res!756991) (not e!645255))))

(declare-fun e!645264 () Bool)

(assert (=> b!1133779 (= res!756991 e!645264)))

(declare-fun c!110674 () Bool)

(assert (=> b!1133779 (= c!110674 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!43125)

(declare-fun lt!503865 () Unit!37151)

(declare-datatypes ((array!73859 0))(
  ( (array!73860 (arr!35580 (Array (_ BitVec 32) (_ BitVec 64))) (size!36116 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73859)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13540 0))(
  ( (ValueCellFull!13540 (v!16943 V!43125)) (EmptyCell!13540) )
))
(declare-datatypes ((array!73861 0))(
  ( (array!73862 (arr!35581 (Array (_ BitVec 32) ValueCell!13540)) (size!36117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73861)

(declare-fun minValue!944 () V!43125)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!334 (array!73859 array!73861 (_ BitVec 32) (_ BitVec 32) V!43125 V!43125 (_ BitVec 64) (_ BitVec 32) Int) Unit!37151)

(assert (=> b!1133779 (= lt!503865 (lemmaListMapContainsThenArrayContainsFrom!334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503871 () Unit!37151)

(declare-fun e!645259 () Unit!37151)

(assert (=> b!1133779 (= lt!503871 e!645259)))

(declare-fun c!110671 () Bool)

(assert (=> b!1133779 (= c!110671 (and (not lt!503872) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133779 (= lt!503872 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133780 () Bool)

(declare-fun res!756992 () Bool)

(declare-fun e!645258 () Bool)

(assert (=> b!1133780 (=> (not res!756992) (not e!645258))))

(declare-fun lt!503874 () array!73859)

(declare-datatypes ((List!24806 0))(
  ( (Nil!24803) (Cons!24802 (h!26011 (_ BitVec 64)) (t!35767 List!24806)) )
))
(declare-fun arrayNoDuplicates!0 (array!73859 (_ BitVec 32) List!24806) Bool)

(assert (=> b!1133780 (= res!756992 (arrayNoDuplicates!0 lt!503874 #b00000000000000000000000000000000 Nil!24803))))

(declare-fun b!1133781 () Bool)

(assert (=> b!1133781 (= e!645265 (= call!49171 call!49177))))

(declare-fun b!1133782 () Bool)

(declare-fun e!645266 () Bool)

(declare-fun e!645260 () Bool)

(declare-fun mapRes!44573 () Bool)

(assert (=> b!1133782 (= e!645266 (and e!645260 mapRes!44573))))

(declare-fun condMapEmpty!44573 () Bool)

(declare-fun mapDefault!44573 () ValueCell!13540)

