; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97934 () Bool)

(assert start!97934)

(declare-fun b_free!23635 () Bool)

(declare-fun b_next!23635 () Bool)

(assert (=> start!97934 (= b_free!23635 (not b_next!23635))))

(declare-fun tp!83608 () Bool)

(declare-fun b_and!38053 () Bool)

(assert (=> start!97934 (= tp!83608 b_and!38053)))

(declare-fun b!1122181 () Bool)

(declare-fun e!638900 () Bool)

(declare-fun e!638903 () Bool)

(assert (=> b!1122181 (= e!638900 e!638903)))

(declare-fun res!749698 () Bool)

(assert (=> b!1122181 (=> (not res!749698) (not e!638903))))

(declare-datatypes ((array!73209 0))(
  ( (array!73210 (arr!35257 (Array (_ BitVec 32) (_ BitVec 64))) (size!35793 (_ BitVec 32))) )
))
(declare-fun lt!498618 () array!73209)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73209 (_ BitVec 32)) Bool)

(assert (=> b!1122181 (= res!749698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498618 mask!1564))))

(declare-fun _keys!1208 () array!73209)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122181 (= lt!498618 (array!73210 (store (arr!35257 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35793 _keys!1208)))))

(declare-datatypes ((V!42681 0))(
  ( (V!42682 (val!14139 Int)) )
))
(declare-fun zeroValue!944 () V!42681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47184 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17752 0))(
  ( (tuple2!17753 (_1!8887 (_ BitVec 64)) (_2!8887 V!42681)) )
))
(declare-datatypes ((List!24533 0))(
  ( (Nil!24530) (Cons!24529 (h!25738 tuple2!17752) (t!35160 List!24533)) )
))
(declare-datatypes ((ListLongMap!15721 0))(
  ( (ListLongMap!15722 (toList!7876 List!24533)) )
))
(declare-fun call!47188 () ListLongMap!15721)

(declare-datatypes ((ValueCell!13373 0))(
  ( (ValueCellFull!13373 (v!16772 V!42681)) (EmptyCell!13373) )
))
(declare-datatypes ((array!73211 0))(
  ( (array!73212 (arr!35258 (Array (_ BitVec 32) ValueCell!13373)) (size!35794 (_ BitVec 32))) )
))
(declare-fun lt!498619 () array!73211)

(declare-fun minValue!944 () V!42681)

(declare-fun getCurrentListMapNoExtraKeys!4365 (array!73209 array!73211 (_ BitVec 32) (_ BitVec 32) V!42681 V!42681 (_ BitVec 32) Int) ListLongMap!15721)

(assert (=> bm!47184 (= call!47188 (getCurrentListMapNoExtraKeys!4365 lt!498618 lt!498619 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44065 () Bool)

(declare-fun mapRes!44065 () Bool)

(declare-fun tp!83609 () Bool)

(declare-fun e!638898 () Bool)

(assert (=> mapNonEmpty!44065 (= mapRes!44065 (and tp!83609 e!638898))))

(declare-fun mapKey!44065 () (_ BitVec 32))

(declare-fun mapRest!44065 () (Array (_ BitVec 32) ValueCell!13373))

(declare-fun _values!996 () array!73211)

(declare-fun mapValue!44065 () ValueCell!13373)

(assert (=> mapNonEmpty!44065 (= (arr!35258 _values!996) (store mapRest!44065 mapKey!44065 mapValue!44065))))

(declare-fun res!749702 () Bool)

(assert (=> start!97934 (=> (not res!749702) (not e!638900))))

(assert (=> start!97934 (= res!749702 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35793 _keys!1208))))))

(assert (=> start!97934 e!638900))

(declare-fun tp_is_empty!28165 () Bool)

(assert (=> start!97934 tp_is_empty!28165))

(declare-fun array_inv!27068 (array!73209) Bool)

(assert (=> start!97934 (array_inv!27068 _keys!1208)))

(assert (=> start!97934 true))

(assert (=> start!97934 tp!83608))

(declare-fun e!638907 () Bool)

(declare-fun array_inv!27069 (array!73211) Bool)

(assert (=> start!97934 (and (array_inv!27069 _values!996) e!638907)))

(declare-fun b!1122182 () Bool)

(declare-fun res!749697 () Bool)

(assert (=> b!1122182 (=> (not res!749697) (not e!638900))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1122182 (= res!749697 (= (select (arr!35257 _keys!1208) i!673) k!934))))

(declare-fun b!1122183 () Bool)

(declare-fun res!749705 () Bool)

(assert (=> b!1122183 (=> (not res!749705) (not e!638900))))

(assert (=> b!1122183 (= res!749705 (and (= (size!35794 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35793 _keys!1208) (size!35794 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122184 () Bool)

(declare-fun res!749700 () Bool)

(assert (=> b!1122184 (=> (not res!749700) (not e!638900))))

(assert (=> b!1122184 (= res!749700 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35793 _keys!1208))))))

(declare-fun b!1122185 () Bool)

(declare-fun e!638906 () Bool)

(declare-fun e!638905 () Bool)

(assert (=> b!1122185 (= e!638906 e!638905)))

(declare-fun res!749707 () Bool)

(assert (=> b!1122185 (=> res!749707 e!638905)))

(assert (=> b!1122185 (= res!749707 (not (= (select (arr!35257 _keys!1208) from!1455) k!934)))))

(declare-fun e!638901 () Bool)

(assert (=> b!1122185 e!638901))

(declare-fun c!109443 () Bool)

(assert (=> b!1122185 (= c!109443 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36808 0))(
  ( (Unit!36809) )
))
(declare-fun lt!498621 () Unit!36808)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!331 (array!73209 array!73211 (_ BitVec 32) (_ BitVec 32) V!42681 V!42681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36808)

(assert (=> b!1122185 (= lt!498621 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122186 () Bool)

(declare-fun e!638902 () Bool)

(assert (=> b!1122186 (= e!638907 (and e!638902 mapRes!44065))))

(declare-fun condMapEmpty!44065 () Bool)

(declare-fun mapDefault!44065 () ValueCell!13373)

