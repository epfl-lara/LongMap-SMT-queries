; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99646 () Bool)

(assert start!99646)

(declare-fun b_free!25225 () Bool)

(declare-fun b_next!25225 () Bool)

(assert (=> start!99646 (= b_free!25225 (not b_next!25225))))

(declare-fun tp!88388 () Bool)

(declare-fun b_and!41317 () Bool)

(assert (=> start!99646 (= tp!88388 b_and!41317)))

(declare-fun b!1181229 () Bool)

(declare-fun res!784941 () Bool)

(declare-fun e!671570 () Bool)

(assert (=> b!1181229 (=> (not res!784941) (not e!671570))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181229 (= res!784941 (validKeyInArray!0 k!934))))

(declare-fun b!1181230 () Bool)

(declare-fun res!784947 () Bool)

(assert (=> b!1181230 (=> (not res!784947) (not e!671570))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76313 0))(
  ( (array!76314 (arr!36806 (Array (_ BitVec 32) (_ BitVec 64))) (size!37342 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76313)

(assert (=> b!1181230 (= res!784947 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37342 _keys!1208))))))

(declare-fun b!1181231 () Bool)

(declare-fun e!671572 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181231 (= e!671572 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37342 _keys!1208))))))

(declare-fun e!671566 () Bool)

(assert (=> b!1181231 e!671566))

(declare-fun res!784946 () Bool)

(assert (=> b!1181231 (=> (not res!784946) (not e!671566))))

(assert (=> b!1181231 (= res!784946 (not (= (select (arr!36806 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!39059 0))(
  ( (Unit!39060) )
))
(declare-fun lt!534237 () Unit!39059)

(declare-fun e!671564 () Unit!39059)

(assert (=> b!1181231 (= lt!534237 e!671564)))

(declare-fun c!116961 () Bool)

(assert (=> b!1181231 (= c!116961 (= (select (arr!36806 _keys!1208) from!1455) k!934))))

(declare-fun e!671565 () Bool)

(assert (=> b!1181231 e!671565))

(declare-fun res!784945 () Bool)

(assert (=> b!1181231 (=> (not res!784945) (not e!671565))))

(declare-datatypes ((V!44801 0))(
  ( (V!44802 (val!14934 Int)) )
))
(declare-datatypes ((tuple2!19128 0))(
  ( (tuple2!19129 (_1!9575 (_ BitVec 64)) (_2!9575 V!44801)) )
))
(declare-datatypes ((List!25869 0))(
  ( (Nil!25866) (Cons!25865 (h!27074 tuple2!19128) (t!38086 List!25869)) )
))
(declare-datatypes ((ListLongMap!17097 0))(
  ( (ListLongMap!17098 (toList!8564 List!25869)) )
))
(declare-fun lt!534229 () ListLongMap!17097)

(declare-fun lt!534231 () ListLongMap!17097)

(declare-fun lt!534230 () tuple2!19128)

(declare-fun +!3872 (ListLongMap!17097 tuple2!19128) ListLongMap!17097)

(assert (=> b!1181231 (= res!784945 (= lt!534231 (+!3872 lt!534229 lt!534230)))))

(declare-fun lt!534241 () V!44801)

(declare-datatypes ((ValueCell!14168 0))(
  ( (ValueCellFull!14168 (v!17572 V!44801)) (EmptyCell!14168) )
))
(declare-datatypes ((array!76315 0))(
  ( (array!76316 (arr!36807 (Array (_ BitVec 32) ValueCell!14168)) (size!37343 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76315)

(declare-fun get!18823 (ValueCell!14168 V!44801) V!44801)

(assert (=> b!1181231 (= lt!534230 (tuple2!19129 (select (arr!36806 _keys!1208) from!1455) (get!18823 (select (arr!36807 _values!996) from!1455) lt!534241)))))

(declare-fun b!1181232 () Bool)

(declare-fun res!784948 () Bool)

(assert (=> b!1181232 (=> (not res!784948) (not e!671566))))

(declare-fun lt!534242 () ListLongMap!17097)

(declare-fun lt!534238 () ListLongMap!17097)

(assert (=> b!1181232 (= res!784948 (= lt!534242 (+!3872 lt!534238 lt!534230)))))

(declare-fun b!1181233 () Bool)

(declare-fun res!784939 () Bool)

(assert (=> b!1181233 (=> (not res!784939) (not e!671570))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181233 (= res!784939 (validMask!0 mask!1564))))

(declare-fun b!1181234 () Bool)

(declare-fun Unit!39061 () Unit!39059)

(assert (=> b!1181234 (= e!671564 Unit!39061)))

(declare-fun b!1181235 () Bool)

(declare-fun e!671575 () Bool)

(declare-fun tp_is_empty!29755 () Bool)

(assert (=> b!1181235 (= e!671575 tp_is_empty!29755)))

(declare-fun b!1181236 () Bool)

(declare-fun e!671573 () Bool)

(assert (=> b!1181236 (= e!671573 tp_is_empty!29755)))

(declare-fun b!1181237 () Bool)

(declare-fun res!784933 () Bool)

(assert (=> b!1181237 (=> (not res!784933) (not e!671570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76313 (_ BitVec 32)) Bool)

(assert (=> b!1181237 (= res!784933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181238 () Bool)

(declare-fun res!784943 () Bool)

(assert (=> b!1181238 (=> (not res!784943) (not e!671570))))

(declare-datatypes ((List!25870 0))(
  ( (Nil!25867) (Cons!25866 (h!27075 (_ BitVec 64)) (t!38087 List!25870)) )
))
(declare-fun arrayNoDuplicates!0 (array!76313 (_ BitVec 32) List!25870) Bool)

(assert (=> b!1181238 (= res!784943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25867))))

(declare-fun b!1181239 () Bool)

(declare-fun res!784937 () Bool)

(declare-fun e!671571 () Bool)

(assert (=> b!1181239 (=> (not res!784937) (not e!671571))))

(declare-fun lt!534236 () array!76313)

(assert (=> b!1181239 (= res!784937 (arrayNoDuplicates!0 lt!534236 #b00000000000000000000000000000000 Nil!25867))))

(declare-fun e!671569 () Bool)

(declare-fun b!1181240 () Bool)

(declare-fun arrayContainsKey!0 (array!76313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181240 (= e!671569 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46460 () Bool)

(declare-fun mapRes!46460 () Bool)

(declare-fun tp!88389 () Bool)

(assert (=> mapNonEmpty!46460 (= mapRes!46460 (and tp!88389 e!671575))))

(declare-fun mapKey!46460 () (_ BitVec 32))

(declare-fun mapValue!46460 () ValueCell!14168)

(declare-fun mapRest!46460 () (Array (_ BitVec 32) ValueCell!14168))

(assert (=> mapNonEmpty!46460 (= (arr!36807 _values!996) (store mapRest!46460 mapKey!46460 mapValue!46460))))

(declare-fun res!784934 () Bool)

(assert (=> start!99646 (=> (not res!784934) (not e!671570))))

(assert (=> start!99646 (= res!784934 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37342 _keys!1208))))))

(assert (=> start!99646 e!671570))

(assert (=> start!99646 tp_is_empty!29755))

(declare-fun array_inv!28104 (array!76313) Bool)

(assert (=> start!99646 (array_inv!28104 _keys!1208)))

(assert (=> start!99646 true))

(assert (=> start!99646 tp!88388))

(declare-fun e!671567 () Bool)

(declare-fun array_inv!28105 (array!76315) Bool)

(assert (=> start!99646 (and (array_inv!28105 _values!996) e!671567)))

(declare-fun b!1181241 () Bool)

(declare-fun res!784936 () Bool)

(assert (=> b!1181241 (=> (not res!784936) (not e!671570))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1181241 (= res!784936 (and (= (size!37343 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37342 _keys!1208) (size!37343 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181242 () Bool)

(assert (=> b!1181242 (= e!671567 (and e!671573 mapRes!46460))))

(declare-fun condMapEmpty!46460 () Bool)

(declare-fun mapDefault!46460 () ValueCell!14168)

