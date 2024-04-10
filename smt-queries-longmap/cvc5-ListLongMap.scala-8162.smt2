; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99838 () Bool)

(assert start!99838)

(declare-fun b_free!25417 () Bool)

(declare-fun b_next!25417 () Bool)

(assert (=> start!99838 (= b_free!25417 (not b_next!25417))))

(declare-fun tp!88965 () Bool)

(declare-fun b_and!41701 () Bool)

(assert (=> start!99838 (= tp!88965 b_and!41701)))

(declare-fun b!1187213 () Bool)

(declare-fun res!789297 () Bool)

(declare-fun e!675046 () Bool)

(assert (=> b!1187213 (=> (not res!789297) (not e!675046))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187213 (= res!789297 (validMask!0 mask!1564))))

(declare-fun b!1187214 () Bool)

(declare-datatypes ((Unit!39364 0))(
  ( (Unit!39365) )
))
(declare-fun e!675040 () Unit!39364)

(declare-fun Unit!39366 () Unit!39364)

(assert (=> b!1187214 (= e!675040 Unit!39366)))

(declare-fun b!1187215 () Bool)

(declare-fun res!789291 () Bool)

(assert (=> b!1187215 (=> (not res!789291) (not e!675046))))

(declare-datatypes ((array!76689 0))(
  ( (array!76690 (arr!36994 (Array (_ BitVec 32) (_ BitVec 64))) (size!37530 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76689)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76689 (_ BitVec 32)) Bool)

(assert (=> b!1187215 (= res!789291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1187216 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!675039 () Bool)

(declare-fun arrayContainsKey!0 (array!76689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187216 (= e!675039 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187217 () Bool)

(declare-fun res!789284 () Bool)

(declare-fun e!675038 () Bool)

(assert (=> b!1187217 (=> (not res!789284) (not e!675038))))

(declare-fun lt!539654 () array!76689)

(declare-datatypes ((List!26032 0))(
  ( (Nil!26029) (Cons!26028 (h!27237 (_ BitVec 64)) (t!38441 List!26032)) )
))
(declare-fun arrayNoDuplicates!0 (array!76689 (_ BitVec 32) List!26032) Bool)

(assert (=> b!1187217 (= res!789284 (arrayNoDuplicates!0 lt!539654 #b00000000000000000000000000000000 Nil!26029))))

(declare-fun b!1187218 () Bool)

(declare-fun res!789294 () Bool)

(assert (=> b!1187218 (=> (not res!789294) (not e!675046))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45057 0))(
  ( (V!45058 (val!15030 Int)) )
))
(declare-datatypes ((ValueCell!14264 0))(
  ( (ValueCellFull!14264 (v!17668 V!45057)) (EmptyCell!14264) )
))
(declare-datatypes ((array!76691 0))(
  ( (array!76692 (arr!36995 (Array (_ BitVec 32) ValueCell!14264)) (size!37531 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76691)

(assert (=> b!1187218 (= res!789294 (and (= (size!37531 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37530 _keys!1208) (size!37531 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187219 () Bool)

(declare-fun e!675037 () Bool)

(declare-fun e!675035 () Bool)

(assert (=> b!1187219 (= e!675037 e!675035)))

(declare-fun res!789292 () Bool)

(assert (=> b!1187219 (=> res!789292 e!675035)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187219 (= res!789292 (not (validKeyInArray!0 (select (arr!36994 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19292 0))(
  ( (tuple2!19293 (_1!9657 (_ BitVec 64)) (_2!9657 V!45057)) )
))
(declare-datatypes ((List!26033 0))(
  ( (Nil!26030) (Cons!26029 (h!27238 tuple2!19292) (t!38442 List!26033)) )
))
(declare-datatypes ((ListLongMap!17261 0))(
  ( (ListLongMap!17262 (toList!8646 List!26033)) )
))
(declare-fun lt!539640 () ListLongMap!17261)

(declare-fun lt!539652 () ListLongMap!17261)

(assert (=> b!1187219 (= lt!539640 lt!539652)))

(declare-fun lt!539647 () ListLongMap!17261)

(declare-fun -!1677 (ListLongMap!17261 (_ BitVec 64)) ListLongMap!17261)

(assert (=> b!1187219 (= lt!539652 (-!1677 lt!539647 k!934))))

(declare-fun zeroValue!944 () V!45057)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539637 () array!76691)

(declare-fun minValue!944 () V!45057)

(declare-fun getCurrentListMapNoExtraKeys!5089 (array!76689 array!76691 (_ BitVec 32) (_ BitVec 32) V!45057 V!45057 (_ BitVec 32) Int) ListLongMap!17261)

(assert (=> b!1187219 (= lt!539640 (getCurrentListMapNoExtraKeys!5089 lt!539654 lt!539637 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187219 (= lt!539647 (getCurrentListMapNoExtraKeys!5089 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539645 () Unit!39364)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!889 (array!76689 array!76691 (_ BitVec 32) (_ BitVec 32) V!45057 V!45057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39364)

(assert (=> b!1187219 (= lt!539645 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!789293 () Bool)

(assert (=> start!99838 (=> (not res!789293) (not e!675046))))

(assert (=> start!99838 (= res!789293 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37530 _keys!1208))))))

(assert (=> start!99838 e!675046))

(declare-fun tp_is_empty!29947 () Bool)

(assert (=> start!99838 tp_is_empty!29947))

(declare-fun array_inv!28228 (array!76689) Bool)

(assert (=> start!99838 (array_inv!28228 _keys!1208)))

(assert (=> start!99838 true))

(assert (=> start!99838 tp!88965))

(declare-fun e!675042 () Bool)

(declare-fun array_inv!28229 (array!76691) Bool)

(assert (=> start!99838 (and (array_inv!28229 _values!996) e!675042)))

(declare-fun b!1187220 () Bool)

(declare-fun e!675036 () Bool)

(declare-fun mapRes!46748 () Bool)

(assert (=> b!1187220 (= e!675042 (and e!675036 mapRes!46748))))

(declare-fun condMapEmpty!46748 () Bool)

(declare-fun mapDefault!46748 () ValueCell!14264)

