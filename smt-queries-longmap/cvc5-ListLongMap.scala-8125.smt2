; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99616 () Bool)

(assert start!99616)

(declare-fun b_free!25195 () Bool)

(declare-fun b_next!25195 () Bool)

(assert (=> start!99616 (= b_free!25195 (not b_next!25195))))

(declare-fun tp!88298 () Bool)

(declare-fun b_and!41257 () Bool)

(assert (=> start!99616 (= tp!88298 b_and!41257)))

(declare-fun b!1180209 () Bool)

(declare-fun res!784179 () Bool)

(declare-fun e!670982 () Bool)

(assert (=> b!1180209 (=> (not res!784179) (not e!670982))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180209 (= res!784179 (validMask!0 mask!1564))))

(declare-datatypes ((array!76253 0))(
  ( (array!76254 (arr!36776 (Array (_ BitVec 32) (_ BitVec 64))) (size!37312 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76253)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!670985 () Bool)

(declare-fun b!1180210 () Bool)

(declare-fun arrayContainsKey!0 (array!76253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180210 (= e!670985 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1180211 () Bool)

(declare-fun e!670989 () Bool)

(declare-datatypes ((V!44761 0))(
  ( (V!44762 (val!14919 Int)) )
))
(declare-datatypes ((tuple2!19104 0))(
  ( (tuple2!19105 (_1!9563 (_ BitVec 64)) (_2!9563 V!44761)) )
))
(declare-datatypes ((List!25842 0))(
  ( (Nil!25839) (Cons!25838 (h!27047 tuple2!19104) (t!38029 List!25842)) )
))
(declare-datatypes ((ListLongMap!17073 0))(
  ( (ListLongMap!17074 (toList!8552 List!25842)) )
))
(declare-fun lt!533564 () ListLongMap!17073)

(declare-fun lt!533561 () ListLongMap!17073)

(assert (=> b!1180211 (= e!670989 (= lt!533564 lt!533561))))

(declare-fun b!1180212 () Bool)

(declare-fun e!670981 () Bool)

(assert (=> b!1180212 (= e!670981 e!670985)))

(declare-fun res!784170 () Bool)

(assert (=> b!1180212 (=> res!784170 e!670985)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180212 (= res!784170 (not (= (select (arr!36776 _keys!1208) from!1455) k!934)))))

(declare-fun res!784182 () Bool)

(assert (=> start!99616 (=> (not res!784182) (not e!670982))))

(assert (=> start!99616 (= res!784182 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37312 _keys!1208))))))

(assert (=> start!99616 e!670982))

(declare-fun tp_is_empty!29725 () Bool)

(assert (=> start!99616 tp_is_empty!29725))

(declare-fun array_inv!28082 (array!76253) Bool)

(assert (=> start!99616 (array_inv!28082 _keys!1208)))

(assert (=> start!99616 true))

(assert (=> start!99616 tp!88298))

(declare-datatypes ((ValueCell!14153 0))(
  ( (ValueCellFull!14153 (v!17557 V!44761)) (EmptyCell!14153) )
))
(declare-datatypes ((array!76255 0))(
  ( (array!76256 (arr!36777 (Array (_ BitVec 32) ValueCell!14153)) (size!37313 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76255)

(declare-fun e!670987 () Bool)

(declare-fun array_inv!28083 (array!76255) Bool)

(assert (=> start!99616 (and (array_inv!28083 _values!996) e!670987)))

(declare-fun b!1180213 () Bool)

(declare-fun res!784173 () Bool)

(assert (=> b!1180213 (=> (not res!784173) (not e!670982))))

(declare-datatypes ((List!25843 0))(
  ( (Nil!25840) (Cons!25839 (h!27048 (_ BitVec 64)) (t!38030 List!25843)) )
))
(declare-fun arrayNoDuplicates!0 (array!76253 (_ BitVec 32) List!25843) Bool)

(assert (=> b!1180213 (= res!784173 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25840))))

(declare-fun b!1180214 () Bool)

(declare-fun e!670983 () Bool)

(assert (=> b!1180214 (= e!670983 tp_is_empty!29725)))

(declare-fun b!1180215 () Bool)

(declare-fun res!784175 () Bool)

(assert (=> b!1180215 (=> (not res!784175) (not e!670982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180215 (= res!784175 (validKeyInArray!0 k!934))))

(declare-fun b!1180216 () Bool)

(declare-fun e!670990 () Bool)

(declare-fun e!670986 () Bool)

(assert (=> b!1180216 (= e!670990 (not e!670986))))

(declare-fun res!784181 () Bool)

(assert (=> b!1180216 (=> res!784181 e!670986)))

(assert (=> b!1180216 (= res!784181 (bvsgt from!1455 i!673))))

(assert (=> b!1180216 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39009 0))(
  ( (Unit!39010) )
))
(declare-fun lt!533563 () Unit!39009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76253 (_ BitVec 64) (_ BitVec 32)) Unit!39009)

(assert (=> b!1180216 (= lt!533563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1180217 () Bool)

(assert (=> b!1180217 (= e!670982 e!670990)))

(declare-fun res!784180 () Bool)

(assert (=> b!1180217 (=> (not res!784180) (not e!670990))))

(declare-fun lt!533556 () array!76253)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76253 (_ BitVec 32)) Bool)

(assert (=> b!1180217 (= res!784180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533556 mask!1564))))

(assert (=> b!1180217 (= lt!533556 (array!76254 (store (arr!36776 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37312 _keys!1208)))))

(declare-fun b!1180218 () Bool)

(declare-fun res!784169 () Bool)

(assert (=> b!1180218 (=> (not res!784169) (not e!670990))))

(assert (=> b!1180218 (= res!784169 (arrayNoDuplicates!0 lt!533556 #b00000000000000000000000000000000 Nil!25840))))

(declare-fun b!1180219 () Bool)

(declare-fun res!784183 () Bool)

(assert (=> b!1180219 (=> (not res!784183) (not e!670982))))

(assert (=> b!1180219 (= res!784183 (= (select (arr!36776 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!46415 () Bool)

(declare-fun mapRes!46415 () Bool)

(declare-fun tp!88299 () Bool)

(declare-fun e!670988 () Bool)

(assert (=> mapNonEmpty!46415 (= mapRes!46415 (and tp!88299 e!670988))))

(declare-fun mapKey!46415 () (_ BitVec 32))

(declare-fun mapValue!46415 () ValueCell!14153)

(declare-fun mapRest!46415 () (Array (_ BitVec 32) ValueCell!14153))

(assert (=> mapNonEmpty!46415 (= (arr!36777 _values!996) (store mapRest!46415 mapKey!46415 mapValue!46415))))

(declare-fun b!1180220 () Bool)

(declare-fun res!784167 () Bool)

(assert (=> b!1180220 (=> (not res!784167) (not e!670982))))

(assert (=> b!1180220 (= res!784167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46415 () Bool)

(assert (=> mapIsEmpty!46415 mapRes!46415))

(declare-fun b!1180221 () Bool)

(declare-fun e!670984 () Bool)

(declare-fun e!670978 () Bool)

(assert (=> b!1180221 (= e!670984 e!670978)))

(declare-fun res!784171 () Bool)

(assert (=> b!1180221 (=> res!784171 e!670978)))

(assert (=> b!1180221 (= res!784171 (not (validKeyInArray!0 (select (arr!36776 _keys!1208) from!1455))))))

(assert (=> b!1180221 (= lt!533561 lt!533564)))

(declare-fun lt!533555 () ListLongMap!17073)

(declare-fun -!1594 (ListLongMap!17073 (_ BitVec 64)) ListLongMap!17073)

(assert (=> b!1180221 (= lt!533564 (-!1594 lt!533555 k!934))))

(declare-fun zeroValue!944 () V!44761)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44761)

(declare-fun lt!533568 () array!76255)

(declare-fun getCurrentListMapNoExtraKeys!5006 (array!76253 array!76255 (_ BitVec 32) (_ BitVec 32) V!44761 V!44761 (_ BitVec 32) Int) ListLongMap!17073)

(assert (=> b!1180221 (= lt!533561 (getCurrentListMapNoExtraKeys!5006 lt!533556 lt!533568 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180221 (= lt!533555 (getCurrentListMapNoExtraKeys!5006 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533557 () Unit!39009)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!821 (array!76253 array!76255 (_ BitVec 32) (_ BitVec 32) V!44761 V!44761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39009)

(assert (=> b!1180221 (= lt!533557 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180222 () Bool)

(assert (=> b!1180222 (= e!670978 true)))

(assert (=> b!1180222 e!670989))

(declare-fun res!784177 () Bool)

(assert (=> b!1180222 (=> (not res!784177) (not e!670989))))

(assert (=> b!1180222 (= res!784177 (not (= (select (arr!36776 _keys!1208) from!1455) k!934)))))

(declare-fun lt!533562 () Unit!39009)

(declare-fun e!670980 () Unit!39009)

(assert (=> b!1180222 (= lt!533562 e!670980)))

(declare-fun c!116916 () Bool)

(assert (=> b!1180222 (= c!116916 (= (select (arr!36776 _keys!1208) from!1455) k!934))))

(assert (=> b!1180222 e!670981))

(declare-fun res!784178 () Bool)

(assert (=> b!1180222 (=> (not res!784178) (not e!670981))))

(declare-fun lt!533560 () ListLongMap!17073)

(declare-fun lt!533559 () tuple2!19104)

(declare-fun +!3863 (ListLongMap!17073 tuple2!19104) ListLongMap!17073)

(assert (=> b!1180222 (= res!784178 (= lt!533560 (+!3863 lt!533564 lt!533559)))))

(declare-fun lt!533566 () V!44761)

(declare-fun get!18806 (ValueCell!14153 V!44761) V!44761)

(assert (=> b!1180222 (= lt!533559 (tuple2!19105 (select (arr!36776 _keys!1208) from!1455) (get!18806 (select (arr!36777 _values!996) from!1455) lt!533566)))))

(declare-fun b!1180223 () Bool)

(declare-fun res!784172 () Bool)

(assert (=> b!1180223 (=> (not res!784172) (not e!670982))))

(assert (=> b!1180223 (= res!784172 (and (= (size!37313 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37312 _keys!1208) (size!37313 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180224 () Bool)

(assert (=> b!1180224 (= e!670986 e!670984)))

(declare-fun res!784168 () Bool)

(assert (=> b!1180224 (=> res!784168 e!670984)))

(assert (=> b!1180224 (= res!784168 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1180224 (= lt!533560 (getCurrentListMapNoExtraKeys!5006 lt!533556 lt!533568 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1180224 (= lt!533568 (array!76256 (store (arr!36777 _values!996) i!673 (ValueCellFull!14153 lt!533566)) (size!37313 _values!996)))))

(declare-fun dynLambda!2965 (Int (_ BitVec 64)) V!44761)

(assert (=> b!1180224 (= lt!533566 (dynLambda!2965 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533558 () ListLongMap!17073)

(assert (=> b!1180224 (= lt!533558 (getCurrentListMapNoExtraKeys!5006 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180225 () Bool)

(declare-fun Unit!39011 () Unit!39009)

(assert (=> b!1180225 (= e!670980 Unit!39011)))

(declare-fun b!1180226 () Bool)

(declare-fun res!784174 () Bool)

(assert (=> b!1180226 (=> (not res!784174) (not e!670982))))

(assert (=> b!1180226 (= res!784174 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37312 _keys!1208))))))

(declare-fun b!1180227 () Bool)

(assert (=> b!1180227 (= e!670988 tp_is_empty!29725)))

(declare-fun b!1180228 () Bool)

(declare-fun res!784176 () Bool)

(assert (=> b!1180228 (=> (not res!784176) (not e!670989))))

(assert (=> b!1180228 (= res!784176 (= lt!533558 (+!3863 lt!533555 lt!533559)))))

(declare-fun b!1180229 () Bool)

(assert (=> b!1180229 (= e!670987 (and e!670983 mapRes!46415))))

(declare-fun condMapEmpty!46415 () Bool)

(declare-fun mapDefault!46415 () ValueCell!14153)

