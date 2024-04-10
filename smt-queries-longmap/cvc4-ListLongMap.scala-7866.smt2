; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97944 () Bool)

(assert start!97944)

(declare-fun b_free!23645 () Bool)

(declare-fun b_next!23645 () Bool)

(assert (=> start!97944 (= b_free!23645 (not b_next!23645))))

(declare-fun tp!83639 () Bool)

(declare-fun b_and!38073 () Bool)

(assert (=> start!97944 (= tp!83639 b_and!38073)))

(declare-fun b!1122461 () Bool)

(declare-fun e!639052 () Bool)

(declare-fun e!639055 () Bool)

(assert (=> b!1122461 (= e!639052 e!639055)))

(declare-fun res!749894 () Bool)

(assert (=> b!1122461 (=> res!749894 e!639055)))

(declare-datatypes ((array!73227 0))(
  ( (array!73228 (arr!35266 (Array (_ BitVec 32) (_ BitVec 64))) (size!35802 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73227)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1122461 (= res!749894 (not (= (select (arr!35266 _keys!1208) from!1455) k!934)))))

(declare-fun e!639056 () Bool)

(assert (=> b!1122461 e!639056))

(declare-fun c!109458 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122461 (= c!109458 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42693 0))(
  ( (V!42694 (val!14144 Int)) )
))
(declare-fun zeroValue!944 () V!42693)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13378 0))(
  ( (ValueCellFull!13378 (v!16777 V!42693)) (EmptyCell!13378) )
))
(declare-datatypes ((array!73229 0))(
  ( (array!73230 (arr!35267 (Array (_ BitVec 32) ValueCell!13378)) (size!35803 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73229)

(declare-fun minValue!944 () V!42693)

(declare-datatypes ((Unit!36816 0))(
  ( (Unit!36817) )
))
(declare-fun lt!498725 () Unit!36816)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!335 (array!73227 array!73229 (_ BitVec 32) (_ BitVec 32) V!42693 V!42693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36816)

(assert (=> b!1122461 (= lt!498725 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!749902 () Bool)

(declare-fun e!639054 () Bool)

(assert (=> start!97944 (=> (not res!749902) (not e!639054))))

(assert (=> start!97944 (= res!749902 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35802 _keys!1208))))))

(assert (=> start!97944 e!639054))

(declare-fun tp_is_empty!28175 () Bool)

(assert (=> start!97944 tp_is_empty!28175))

(declare-fun array_inv!27076 (array!73227) Bool)

(assert (=> start!97944 (array_inv!27076 _keys!1208)))

(assert (=> start!97944 true))

(assert (=> start!97944 tp!83639))

(declare-fun e!639051 () Bool)

(declare-fun array_inv!27077 (array!73229) Bool)

(assert (=> start!97944 (and (array_inv!27077 _values!996) e!639051)))

(declare-fun b!1122462 () Bool)

(declare-datatypes ((tuple2!17760 0))(
  ( (tuple2!17761 (_1!8891 (_ BitVec 64)) (_2!8891 V!42693)) )
))
(declare-datatypes ((List!24540 0))(
  ( (Nil!24537) (Cons!24536 (h!25745 tuple2!17760) (t!35177 List!24540)) )
))
(declare-datatypes ((ListLongMap!15729 0))(
  ( (ListLongMap!15730 (toList!7880 List!24540)) )
))
(declare-fun call!47217 () ListLongMap!15729)

(declare-fun call!47218 () ListLongMap!15729)

(assert (=> b!1122462 (= e!639056 (= call!47217 call!47218))))

(declare-fun mapIsEmpty!44080 () Bool)

(declare-fun mapRes!44080 () Bool)

(assert (=> mapIsEmpty!44080 mapRes!44080))

(declare-fun b!1122463 () Bool)

(declare-fun res!749895 () Bool)

(declare-fun e!639048 () Bool)

(assert (=> b!1122463 (=> (not res!749895) (not e!639048))))

(declare-fun lt!498723 () array!73227)

(declare-datatypes ((List!24541 0))(
  ( (Nil!24538) (Cons!24537 (h!25746 (_ BitVec 64)) (t!35178 List!24541)) )
))
(declare-fun arrayNoDuplicates!0 (array!73227 (_ BitVec 32) List!24541) Bool)

(assert (=> b!1122463 (= res!749895 (arrayNoDuplicates!0 lt!498723 #b00000000000000000000000000000000 Nil!24538))))

(declare-fun b!1122464 () Bool)

(declare-fun res!749901 () Bool)

(assert (=> b!1122464 (=> (not res!749901) (not e!639054))))

(assert (=> b!1122464 (= res!749901 (= (select (arr!35266 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!44080 () Bool)

(declare-fun tp!83638 () Bool)

(declare-fun e!639049 () Bool)

(assert (=> mapNonEmpty!44080 (= mapRes!44080 (and tp!83638 e!639049))))

(declare-fun mapKey!44080 () (_ BitVec 32))

(declare-fun mapValue!44080 () ValueCell!13378)

(declare-fun mapRest!44080 () (Array (_ BitVec 32) ValueCell!13378))

(assert (=> mapNonEmpty!44080 (= (arr!35267 _values!996) (store mapRest!44080 mapKey!44080 mapValue!44080))))

(declare-fun b!1122465 () Bool)

(declare-fun e!639057 () Bool)

(assert (=> b!1122465 (= e!639057 e!639052)))

(declare-fun res!749899 () Bool)

(assert (=> b!1122465 (=> res!749899 e!639052)))

(assert (=> b!1122465 (= res!749899 (not (= from!1455 i!673)))))

(declare-fun lt!498722 () array!73229)

(declare-fun lt!498724 () ListLongMap!15729)

(declare-fun getCurrentListMapNoExtraKeys!4369 (array!73227 array!73229 (_ BitVec 32) (_ BitVec 32) V!42693 V!42693 (_ BitVec 32) Int) ListLongMap!15729)

(assert (=> b!1122465 (= lt!498724 (getCurrentListMapNoExtraKeys!4369 lt!498723 lt!498722 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2465 (Int (_ BitVec 64)) V!42693)

(assert (=> b!1122465 (= lt!498722 (array!73230 (store (arr!35267 _values!996) i!673 (ValueCellFull!13378 (dynLambda!2465 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35803 _values!996)))))

(declare-fun lt!498728 () ListLongMap!15729)

(assert (=> b!1122465 (= lt!498728 (getCurrentListMapNoExtraKeys!4369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47214 () Bool)

(assert (=> bm!47214 (= call!47218 (getCurrentListMapNoExtraKeys!4369 (ite c!109458 lt!498723 _keys!1208) (ite c!109458 lt!498722 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122466 () Bool)

(declare-fun res!749890 () Bool)

(assert (=> b!1122466 (=> (not res!749890) (not e!639054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73227 (_ BitVec 32)) Bool)

(assert (=> b!1122466 (= res!749890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122467 () Bool)

(declare-fun e!639053 () Bool)

(assert (=> b!1122467 (= e!639053 tp_is_empty!28175)))

(declare-fun b!1122468 () Bool)

(declare-fun res!749898 () Bool)

(assert (=> b!1122468 (=> (not res!749898) (not e!639054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122468 (= res!749898 (validKeyInArray!0 k!934))))

(declare-fun b!1122469 () Bool)

(assert (=> b!1122469 (= e!639051 (and e!639053 mapRes!44080))))

(declare-fun condMapEmpty!44080 () Bool)

(declare-fun mapDefault!44080 () ValueCell!13378)

