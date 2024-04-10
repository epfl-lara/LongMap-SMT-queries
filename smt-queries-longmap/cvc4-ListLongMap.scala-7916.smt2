; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98310 () Bool)

(assert start!98310)

(declare-fun b_free!23945 () Bool)

(declare-fun b_next!23945 () Bool)

(assert (=> start!98310 (= b_free!23945 (not b_next!23945))))

(declare-fun tp!84542 () Bool)

(declare-fun b_and!38721 () Bool)

(assert (=> start!98310 (= tp!84542 b_and!38721)))

(declare-datatypes ((V!43093 0))(
  ( (V!43094 (val!14294 Int)) )
))
(declare-fun zeroValue!944 () V!43093)

(declare-fun bm!48859 () Bool)

(declare-datatypes ((array!73809 0))(
  ( (array!73810 (arr!35556 (Array (_ BitVec 32) (_ BitVec 64))) (size!36092 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13528 0))(
  ( (ValueCellFull!13528 (v!16930 V!43093)) (EmptyCell!13528) )
))
(declare-datatypes ((array!73811 0))(
  ( (array!73812 (arr!35557 (Array (_ BitVec 32) ValueCell!13528)) (size!36093 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73811)

(declare-fun minValue!944 () V!43093)

(declare-datatypes ((tuple2!18022 0))(
  ( (tuple2!18023 (_1!9022 (_ BitVec 64)) (_2!9022 V!43093)) )
))
(declare-datatypes ((List!24785 0))(
  ( (Nil!24782) (Cons!24781 (h!25990 tuple2!18022) (t!35722 List!24785)) )
))
(declare-datatypes ((ListLongMap!15991 0))(
  ( (ListLongMap!15992 (toList!8011 List!24785)) )
))
(declare-fun call!48864 () ListLongMap!15991)

(declare-fun getCurrentListMapNoExtraKeys!4498 (array!73809 array!73811 (_ BitVec 32) (_ BitVec 32) V!43093 V!43093 (_ BitVec 32) Int) ListLongMap!15991)

(assert (=> bm!48859 (= call!48864 (getCurrentListMapNoExtraKeys!4498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!756371 () Bool)

(declare-fun e!644579 () Bool)

(assert (=> start!98310 (=> (not res!756371) (not e!644579))))

(assert (=> start!98310 (= res!756371 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36092 _keys!1208))))))

(assert (=> start!98310 e!644579))

(declare-fun tp_is_empty!28475 () Bool)

(assert (=> start!98310 tp_is_empty!28475))

(declare-fun array_inv!27274 (array!73809) Bool)

(assert (=> start!98310 (array_inv!27274 _keys!1208)))

(assert (=> start!98310 true))

(assert (=> start!98310 tp!84542))

(declare-fun e!644574 () Bool)

(declare-fun array_inv!27275 (array!73811) Bool)

(assert (=> start!98310 (and (array_inv!27275 _values!996) e!644574)))

(declare-fun b!1132583 () Bool)

(declare-fun e!644584 () Bool)

(assert (=> b!1132583 (= e!644579 e!644584)))

(declare-fun res!756384 () Bool)

(assert (=> b!1132583 (=> (not res!756384) (not e!644584))))

(declare-fun lt!503224 () array!73809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73809 (_ BitVec 32)) Bool)

(assert (=> b!1132583 (= res!756384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503224 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132583 (= lt!503224 (array!73810 (store (arr!35556 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36092 _keys!1208)))))

(declare-fun lt!503219 () ListLongMap!15991)

(declare-fun call!48863 () Bool)

(declare-fun call!48868 () ListLongMap!15991)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!110450 () Bool)

(declare-fun bm!48860 () Bool)

(declare-fun contains!6535 (ListLongMap!15991 (_ BitVec 64)) Bool)

(assert (=> bm!48860 (= call!48863 (contains!6535 (ite c!110450 lt!503219 call!48868) k!934))))

(declare-fun bm!48861 () Bool)

(declare-datatypes ((Unit!37113 0))(
  ( (Unit!37114) )
))
(declare-fun call!48865 () Unit!37113)

(declare-fun call!48862 () Unit!37113)

(assert (=> bm!48861 (= call!48865 call!48862)))

(declare-fun b!1132584 () Bool)

(declare-fun e!644583 () Unit!37113)

(declare-fun Unit!37115 () Unit!37113)

(assert (=> b!1132584 (= e!644583 Unit!37115)))

(declare-fun bm!48862 () Bool)

(declare-fun lt!503228 () array!73811)

(declare-fun call!48869 () ListLongMap!15991)

(assert (=> bm!48862 (= call!48869 (getCurrentListMapNoExtraKeys!4498 lt!503224 lt!503228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132585 () Bool)

(declare-fun c!110449 () Bool)

(declare-fun lt!503226 () Bool)

(assert (=> b!1132585 (= c!110449 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503226))))

(declare-fun e!644578 () Unit!37113)

(assert (=> b!1132585 (= e!644578 e!644583)))

(declare-fun b!1132586 () Bool)

(declare-fun e!644587 () Unit!37113)

(declare-fun lt!503215 () Unit!37113)

(assert (=> b!1132586 (= e!644587 lt!503215)))

(declare-fun lt!503217 () ListLongMap!15991)

(declare-fun lt!503216 () Unit!37113)

(declare-fun addStillContains!717 (ListLongMap!15991 (_ BitVec 64) V!43093 (_ BitVec 64)) Unit!37113)

(assert (=> b!1132586 (= lt!503216 (addStillContains!717 lt!503217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!48866 () ListLongMap!15991)

(assert (=> b!1132586 (= lt!503219 call!48866)))

(assert (=> b!1132586 call!48863))

(assert (=> b!1132586 (= lt!503215 call!48862)))

(declare-fun +!3454 (ListLongMap!15991 tuple2!18022) ListLongMap!15991)

(assert (=> b!1132586 (contains!6535 (+!3454 lt!503219 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1132587 () Bool)

(declare-fun e!644586 () Bool)

(declare-fun mapRes!44534 () Bool)

(assert (=> b!1132587 (= e!644574 (and e!644586 mapRes!44534))))

(declare-fun condMapEmpty!44534 () Bool)

(declare-fun mapDefault!44534 () ValueCell!13528)

