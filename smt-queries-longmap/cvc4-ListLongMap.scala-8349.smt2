; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101648 () Bool)

(assert start!101648)

(declare-fun b_free!26369 () Bool)

(declare-fun b_next!26369 () Bool)

(assert (=> start!101648 (= b_free!26369 (not b_next!26369))))

(declare-fun tp!92149 () Bool)

(declare-fun b_and!43981 () Bool)

(assert (=> start!101648 (= tp!92149 b_and!43981)))

(declare-fun b!1222666 () Bool)

(declare-fun res!812373 () Bool)

(declare-fun e!694383 () Bool)

(assert (=> b!1222666 (=> (not res!812373) (not e!694383))))

(declare-datatypes ((array!78929 0))(
  ( (array!78930 (arr!38092 (Array (_ BitVec 32) (_ BitVec 64))) (size!38628 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46557 0))(
  ( (V!46558 (val!15593 Int)) )
))
(declare-datatypes ((ValueCell!14827 0))(
  ( (ValueCellFull!14827 (v!18254 V!46557)) (EmptyCell!14827) )
))
(declare-datatypes ((array!78931 0))(
  ( (array!78932 (arr!38093 (Array (_ BitVec 32) ValueCell!14827)) (size!38629 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78931)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1222666 (= res!812373 (and (= (size!38629 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38628 _keys!1208) (size!38629 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48505 () Bool)

(declare-fun mapRes!48505 () Bool)

(declare-fun tp!92150 () Bool)

(declare-fun e!694378 () Bool)

(assert (=> mapNonEmpty!48505 (= mapRes!48505 (and tp!92150 e!694378))))

(declare-fun mapKey!48505 () (_ BitVec 32))

(declare-fun mapValue!48505 () ValueCell!14827)

(declare-fun mapRest!48505 () (Array (_ BitVec 32) ValueCell!14827))

(assert (=> mapNonEmpty!48505 (= (arr!38093 _values!996) (store mapRest!48505 mapKey!48505 mapValue!48505))))

(declare-fun b!1222667 () Bool)

(declare-fun res!812364 () Bool)

(assert (=> b!1222667 (=> (not res!812364) (not e!694383))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222667 (= res!812364 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38628 _keys!1208))))))

(declare-fun res!812368 () Bool)

(assert (=> start!101648 (=> (not res!812368) (not e!694383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101648 (= res!812368 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38628 _keys!1208))))))

(assert (=> start!101648 e!694383))

(declare-fun tp_is_empty!31073 () Bool)

(assert (=> start!101648 tp_is_empty!31073))

(declare-fun array_inv!28984 (array!78929) Bool)

(assert (=> start!101648 (array_inv!28984 _keys!1208)))

(assert (=> start!101648 true))

(assert (=> start!101648 tp!92149))

(declare-fun e!694372 () Bool)

(declare-fun array_inv!28985 (array!78931) Bool)

(assert (=> start!101648 (and (array_inv!28985 _values!996) e!694372)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1222668 () Bool)

(declare-fun e!694380 () Bool)

(declare-fun arrayContainsKey!0 (array!78929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222668 (= e!694380 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222669 () Bool)

(declare-fun res!812372 () Bool)

(assert (=> b!1222669 (=> (not res!812372) (not e!694383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222669 (= res!812372 (validKeyInArray!0 k!934))))

(declare-fun b!1222670 () Bool)

(declare-datatypes ((Unit!40496 0))(
  ( (Unit!40497) )
))
(declare-fun e!694375 () Unit!40496)

(declare-fun Unit!40498 () Unit!40496)

(assert (=> b!1222670 (= e!694375 Unit!40498)))

(declare-fun lt!556334 () Unit!40496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78929 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40496)

(assert (=> b!1222670 (= lt!556334 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222670 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556329 () Unit!40496)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78929 (_ BitVec 32) (_ BitVec 32)) Unit!40496)

(assert (=> b!1222670 (= lt!556329 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26886 0))(
  ( (Nil!26883) (Cons!26882 (h!28091 (_ BitVec 64)) (t!40235 List!26886)) )
))
(declare-fun arrayNoDuplicates!0 (array!78929 (_ BitVec 32) List!26886) Bool)

(assert (=> b!1222670 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26883)))

(declare-fun lt!556335 () Unit!40496)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78929 (_ BitVec 64) (_ BitVec 32) List!26886) Unit!40496)

(assert (=> b!1222670 (= lt!556335 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26883))))

(assert (=> b!1222670 false))

(declare-fun b!1222671 () Bool)

(declare-fun e!694373 () Bool)

(assert (=> b!1222671 (= e!694373 e!694380)))

(declare-fun res!812367 () Bool)

(assert (=> b!1222671 (=> res!812367 e!694380)))

(assert (=> b!1222671 (= res!812367 (not (= (select (arr!38092 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222672 () Bool)

(declare-fun res!812365 () Bool)

(declare-fun e!694377 () Bool)

(assert (=> b!1222672 (=> (not res!812365) (not e!694377))))

(declare-fun lt!556323 () array!78929)

(assert (=> b!1222672 (= res!812365 (arrayNoDuplicates!0 lt!556323 #b00000000000000000000000000000000 Nil!26883))))

(declare-fun b!1222673 () Bool)

(declare-fun res!812371 () Bool)

(assert (=> b!1222673 (=> (not res!812371) (not e!694383))))

(assert (=> b!1222673 (= res!812371 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26883))))

(declare-fun b!1222674 () Bool)

(declare-fun e!694374 () Bool)

(declare-fun e!694379 () Bool)

(assert (=> b!1222674 (= e!694374 e!694379)))

(declare-fun res!812370 () Bool)

(assert (=> b!1222674 (=> res!812370 e!694379)))

(assert (=> b!1222674 (= res!812370 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46557)

(declare-fun lt!556324 () array!78931)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20086 0))(
  ( (tuple2!20087 (_1!10054 (_ BitVec 64)) (_2!10054 V!46557)) )
))
(declare-datatypes ((List!26887 0))(
  ( (Nil!26884) (Cons!26883 (h!28092 tuple2!20086) (t!40236 List!26887)) )
))
(declare-datatypes ((ListLongMap!18055 0))(
  ( (ListLongMap!18056 (toList!9043 List!26887)) )
))
(declare-fun lt!556332 () ListLongMap!18055)

(declare-fun minValue!944 () V!46557)

(declare-fun getCurrentListMapNoExtraKeys!5465 (array!78929 array!78931 (_ BitVec 32) (_ BitVec 32) V!46557 V!46557 (_ BitVec 32) Int) ListLongMap!18055)

(assert (=> b!1222674 (= lt!556332 (getCurrentListMapNoExtraKeys!5465 lt!556323 lt!556324 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556331 () V!46557)

(assert (=> b!1222674 (= lt!556324 (array!78932 (store (arr!38093 _values!996) i!673 (ValueCellFull!14827 lt!556331)) (size!38629 _values!996)))))

(declare-fun dynLambda!3341 (Int (_ BitVec 64)) V!46557)

(assert (=> b!1222674 (= lt!556331 (dynLambda!3341 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556336 () ListLongMap!18055)

(assert (=> b!1222674 (= lt!556336 (getCurrentListMapNoExtraKeys!5465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48505 () Bool)

(assert (=> mapIsEmpty!48505 mapRes!48505))

(declare-fun b!1222675 () Bool)

(declare-fun res!812375 () Bool)

(assert (=> b!1222675 (=> (not res!812375) (not e!694383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222675 (= res!812375 (validMask!0 mask!1564))))

(declare-fun b!1222676 () Bool)

(declare-fun e!694382 () Bool)

(assert (=> b!1222676 (= e!694382 (not (= (select (arr!38092 _keys!1208) from!1455) k!934)))))

(declare-fun lt!556326 () Unit!40496)

(assert (=> b!1222676 (= lt!556326 e!694375)))

(declare-fun c!120335 () Bool)

(assert (=> b!1222676 (= c!120335 (= (select (arr!38092 _keys!1208) from!1455) k!934))))

(assert (=> b!1222676 e!694373))

(declare-fun res!812366 () Bool)

(assert (=> b!1222676 (=> (not res!812366) (not e!694373))))

(declare-fun lt!556327 () ListLongMap!18055)

(declare-fun +!4103 (ListLongMap!18055 tuple2!20086) ListLongMap!18055)

(declare-fun get!19446 (ValueCell!14827 V!46557) V!46557)

(assert (=> b!1222676 (= res!812366 (= lt!556332 (+!4103 lt!556327 (tuple2!20087 (select (arr!38092 _keys!1208) from!1455) (get!19446 (select (arr!38093 _values!996) from!1455) lt!556331)))))))

(declare-fun b!1222677 () Bool)

(declare-fun Unit!40499 () Unit!40496)

(assert (=> b!1222677 (= e!694375 Unit!40499)))

(declare-fun b!1222678 () Bool)

(assert (=> b!1222678 (= e!694383 e!694377)))

(declare-fun res!812377 () Bool)

(assert (=> b!1222678 (=> (not res!812377) (not e!694377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78929 (_ BitVec 32)) Bool)

(assert (=> b!1222678 (= res!812377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556323 mask!1564))))

(assert (=> b!1222678 (= lt!556323 (array!78930 (store (arr!38092 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38628 _keys!1208)))))

(declare-fun b!1222679 () Bool)

(declare-fun res!812374 () Bool)

(assert (=> b!1222679 (=> (not res!812374) (not e!694383))))

(assert (=> b!1222679 (= res!812374 (= (select (arr!38092 _keys!1208) i!673) k!934))))

(declare-fun b!1222680 () Bool)

(declare-fun e!694381 () Bool)

(assert (=> b!1222680 (= e!694372 (and e!694381 mapRes!48505))))

(declare-fun condMapEmpty!48505 () Bool)

(declare-fun mapDefault!48505 () ValueCell!14827)

