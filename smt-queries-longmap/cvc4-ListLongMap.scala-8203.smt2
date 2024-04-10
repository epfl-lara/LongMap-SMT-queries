; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100088 () Bool)

(assert start!100088)

(declare-fun b_free!25667 () Bool)

(declare-fun b_next!25667 () Bool)

(assert (=> start!100088 (= b_free!25667 (not b_next!25667))))

(declare-fun tp!89714 () Bool)

(declare-fun b_and!42201 () Bool)

(assert (=> start!100088 (= tp!89714 b_and!42201)))

(declare-fun b!1193348 () Bool)

(declare-fun e!678243 () Bool)

(assert (=> b!1193348 (= e!678243 true)))

(declare-datatypes ((V!45389 0))(
  ( (V!45390 (val!15155 Int)) )
))
(declare-fun zeroValue!944 () V!45389)

(declare-datatypes ((array!77173 0))(
  ( (array!77174 (arr!37236 (Array (_ BitVec 32) (_ BitVec 64))) (size!37772 (_ BitVec 32))) )
))
(declare-fun lt!542566 () array!77173)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14389 0))(
  ( (ValueCellFull!14389 (v!17793 V!45389)) (EmptyCell!14389) )
))
(declare-datatypes ((array!77175 0))(
  ( (array!77176 (arr!37237 (Array (_ BitVec 32) ValueCell!14389)) (size!37773 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77175)

(declare-fun minValue!944 () V!45389)

(declare-fun _keys!1208 () array!77173)

(declare-fun lt!542564 () array!77175)

(declare-datatypes ((tuple2!19484 0))(
  ( (tuple2!19485 (_1!9753 (_ BitVec 64)) (_2!9753 V!45389)) )
))
(declare-datatypes ((List!26228 0))(
  ( (Nil!26225) (Cons!26224 (h!27433 tuple2!19484) (t!38887 List!26228)) )
))
(declare-datatypes ((ListLongMap!17453 0))(
  ( (ListLongMap!17454 (toList!8742 List!26228)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5183 (array!77173 array!77175 (_ BitVec 32) (_ BitVec 32) V!45389 V!45389 (_ BitVec 32) Int) ListLongMap!17453)

(declare-fun -!1767 (ListLongMap!17453 (_ BitVec 64)) ListLongMap!17453)

(assert (=> b!1193348 (= (getCurrentListMapNoExtraKeys!5183 lt!542566 lt!542564 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1767 (getCurrentListMapNoExtraKeys!5183 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39588 0))(
  ( (Unit!39589) )
))
(declare-fun lt!542565 () Unit!39588)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!976 (array!77173 array!77175 (_ BitVec 32) (_ BitVec 32) V!45389 V!45389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39588)

(assert (=> b!1193348 (= lt!542565 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!976 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!793951 () Bool)

(declare-fun e!678249 () Bool)

(assert (=> start!100088 (=> (not res!793951) (not e!678249))))

(assert (=> start!100088 (= res!793951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37772 _keys!1208))))))

(assert (=> start!100088 e!678249))

(declare-fun tp_is_empty!30197 () Bool)

(assert (=> start!100088 tp_is_empty!30197))

(declare-fun array_inv!28390 (array!77173) Bool)

(assert (=> start!100088 (array_inv!28390 _keys!1208)))

(assert (=> start!100088 true))

(assert (=> start!100088 tp!89714))

(declare-fun e!678244 () Bool)

(declare-fun array_inv!28391 (array!77175) Bool)

(assert (=> start!100088 (and (array_inv!28391 _values!996) e!678244)))

(declare-fun b!1193349 () Bool)

(declare-fun res!793940 () Bool)

(assert (=> b!1193349 (=> (not res!793940) (not e!678249))))

(assert (=> b!1193349 (= res!793940 (= (select (arr!37236 _keys!1208) i!673) k!934))))

(declare-fun b!1193350 () Bool)

(declare-fun e!678248 () Bool)

(assert (=> b!1193350 (= e!678248 tp_is_empty!30197)))

(declare-fun b!1193351 () Bool)

(declare-fun res!793944 () Bool)

(assert (=> b!1193351 (=> (not res!793944) (not e!678249))))

(assert (=> b!1193351 (= res!793944 (and (= (size!37773 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37772 _keys!1208) (size!37773 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47123 () Bool)

(declare-fun mapRes!47123 () Bool)

(assert (=> mapIsEmpty!47123 mapRes!47123))

(declare-fun b!1193352 () Bool)

(declare-fun res!793943 () Bool)

(assert (=> b!1193352 (=> (not res!793943) (not e!678249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193352 (= res!793943 (validKeyInArray!0 k!934))))

(declare-fun b!1193353 () Bool)

(declare-fun e!678250 () Bool)

(assert (=> b!1193353 (= e!678249 e!678250)))

(declare-fun res!793946 () Bool)

(assert (=> b!1193353 (=> (not res!793946) (not e!678250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77173 (_ BitVec 32)) Bool)

(assert (=> b!1193353 (= res!793946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542566 mask!1564))))

(assert (=> b!1193353 (= lt!542566 (array!77174 (store (arr!37236 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37772 _keys!1208)))))

(declare-fun b!1193354 () Bool)

(declare-fun res!793945 () Bool)

(assert (=> b!1193354 (=> (not res!793945) (not e!678250))))

(declare-datatypes ((List!26229 0))(
  ( (Nil!26226) (Cons!26225 (h!27434 (_ BitVec 64)) (t!38888 List!26229)) )
))
(declare-fun arrayNoDuplicates!0 (array!77173 (_ BitVec 32) List!26229) Bool)

(assert (=> b!1193354 (= res!793945 (arrayNoDuplicates!0 lt!542566 #b00000000000000000000000000000000 Nil!26226))))

(declare-fun b!1193355 () Bool)

(declare-fun res!793950 () Bool)

(assert (=> b!1193355 (=> (not res!793950) (not e!678249))))

(assert (=> b!1193355 (= res!793950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193356 () Bool)

(assert (=> b!1193356 (= e!678244 (and e!678248 mapRes!47123))))

(declare-fun condMapEmpty!47123 () Bool)

(declare-fun mapDefault!47123 () ValueCell!14389)

