; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100566 () Bool)

(assert start!100566)

(declare-fun b_free!25889 () Bool)

(declare-fun b_next!25889 () Bool)

(assert (=> start!100566 (= b_free!25889 (not b_next!25889))))

(declare-fun tp!90657 () Bool)

(declare-fun b_and!42665 () Bool)

(assert (=> start!100566 (= tp!90657 b_and!42665)))

(declare-datatypes ((V!45917 0))(
  ( (V!45918 (val!15353 Int)) )
))
(declare-fun zeroValue!944 () V!45917)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14587 0))(
  ( (ValueCellFull!14587 (v!17991 V!45917)) (EmptyCell!14587) )
))
(declare-datatypes ((array!77959 0))(
  ( (array!77960 (arr!37624 (Array (_ BitVec 32) ValueCell!14587)) (size!38160 (_ BitVec 32))) )
))
(declare-fun lt!545215 () array!77959)

(declare-datatypes ((tuple2!19678 0))(
  ( (tuple2!19679 (_1!9850 (_ BitVec 64)) (_2!9850 V!45917)) )
))
(declare-datatypes ((List!26489 0))(
  ( (Nil!26486) (Cons!26485 (h!27694 tuple2!19678) (t!39358 List!26489)) )
))
(declare-datatypes ((ListLongMap!17647 0))(
  ( (ListLongMap!17648 (toList!8839 List!26489)) )
))
(declare-fun call!57871 () ListLongMap!17647)

(declare-fun minValue!944 () V!45917)

(declare-fun bm!57865 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!77961 0))(
  ( (array!77962 (arr!37625 (Array (_ BitVec 32) (_ BitVec 64))) (size!38161 (_ BitVec 32))) )
))
(declare-fun lt!545218 () array!77961)

(declare-fun getCurrentListMapNoExtraKeys!5275 (array!77961 array!77959 (_ BitVec 32) (_ BitVec 32) V!45917 V!45917 (_ BitVec 32) Int) ListLongMap!17647)

(assert (=> bm!57865 (= call!57871 (getCurrentListMapNoExtraKeys!5275 lt!545218 lt!545215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202831 () Bool)

(declare-fun e!683020 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!57874 () ListLongMap!17647)

(declare-fun -!1806 (ListLongMap!17647 (_ BitVec 64)) ListLongMap!17647)

(assert (=> b!1202831 (= e!683020 (= call!57871 (-!1806 call!57874 k!934)))))

(declare-fun b!1202832 () Bool)

(declare-fun res!800541 () Bool)

(declare-fun e!683026 () Bool)

(assert (=> b!1202832 (=> (not res!800541) (not e!683026))))

(declare-fun _values!996 () array!77959)

(declare-fun _keys!1208 () array!77961)

(assert (=> b!1202832 (= res!800541 (and (= (size!38160 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38161 _keys!1208) (size!38160 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47732 () Bool)

(declare-fun mapRes!47732 () Bool)

(assert (=> mapIsEmpty!47732 mapRes!47732))

(declare-fun b!1202833 () Bool)

(declare-fun c!117731 () Bool)

(declare-fun lt!545211 () Bool)

(assert (=> b!1202833 (= c!117731 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545211))))

(declare-datatypes ((Unit!39876 0))(
  ( (Unit!39877) )
))
(declare-fun e!683025 () Unit!39876)

(declare-fun e!683018 () Unit!39876)

(assert (=> b!1202833 (= e!683025 e!683018)))

(declare-fun bm!57866 () Bool)

(declare-fun call!57875 () Bool)

(declare-fun call!57868 () Bool)

(assert (=> bm!57866 (= call!57875 call!57868)))

(declare-fun b!1202834 () Bool)

(declare-fun res!800544 () Bool)

(assert (=> b!1202834 (=> (not res!800544) (not e!683026))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202834 (= res!800544 (= (select (arr!37625 _keys!1208) i!673) k!934))))

(declare-fun b!1202836 () Bool)

(declare-fun e!683016 () Bool)

(assert (=> b!1202836 (= e!683026 e!683016)))

(declare-fun res!800537 () Bool)

(assert (=> b!1202836 (=> (not res!800537) (not e!683016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77961 (_ BitVec 32)) Bool)

(assert (=> b!1202836 (= res!800537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545218 mask!1564))))

(assert (=> b!1202836 (= lt!545218 (array!77962 (store (arr!37625 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38161 _keys!1208)))))

(declare-fun b!1202837 () Bool)

(declare-fun e!683017 () Bool)

(declare-fun e!683019 () Bool)

(assert (=> b!1202837 (= e!683017 (and e!683019 mapRes!47732))))

(declare-fun condMapEmpty!47732 () Bool)

(declare-fun mapDefault!47732 () ValueCell!14587)

