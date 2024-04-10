; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100536 () Bool)

(assert start!100536)

(declare-fun b_free!25859 () Bool)

(declare-fun b_next!25859 () Bool)

(assert (=> start!100536 (= b_free!25859 (not b_next!25859))))

(declare-fun tp!90567 () Bool)

(declare-fun b_and!42605 () Bool)

(assert (=> start!100536 (= tp!90567 b_and!42605)))

(declare-fun bm!57505 () Bool)

(declare-fun call!57514 () Bool)

(declare-fun call!57509 () Bool)

(assert (=> bm!57505 (= call!57514 call!57509)))

(declare-fun b!1201676 () Bool)

(declare-fun e!682386 () Bool)

(declare-fun e!682398 () Bool)

(assert (=> b!1201676 (= e!682386 e!682398)))

(declare-fun res!799906 () Bool)

(assert (=> b!1201676 (=> res!799906 e!682398)))

(declare-datatypes ((V!45877 0))(
  ( (V!45878 (val!15338 Int)) )
))
(declare-datatypes ((tuple2!19648 0))(
  ( (tuple2!19649 (_1!9835 (_ BitVec 64)) (_2!9835 V!45877)) )
))
(declare-datatypes ((List!26464 0))(
  ( (Nil!26461) (Cons!26460 (h!27669 tuple2!19648) (t!39303 List!26464)) )
))
(declare-datatypes ((ListLongMap!17617 0))(
  ( (ListLongMap!17618 (toList!8824 List!26464)) )
))
(declare-fun lt!544591 () ListLongMap!17617)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6881 (ListLongMap!17617 (_ BitVec 64)) Bool)

(assert (=> b!1201676 (= res!799906 (not (contains!6881 lt!544591 k!934)))))

(declare-fun zeroValue!944 () V!45877)

(declare-datatypes ((array!77899 0))(
  ( (array!77900 (arr!37594 (Array (_ BitVec 32) (_ BitVec 64))) (size!38130 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77899)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14572 0))(
  ( (ValueCellFull!14572 (v!17976 V!45877)) (EmptyCell!14572) )
))
(declare-datatypes ((array!77901 0))(
  ( (array!77902 (arr!37595 (Array (_ BitVec 32) ValueCell!14572)) (size!38131 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77901)

(declare-fun minValue!944 () V!45877)

(declare-fun getCurrentListMapNoExtraKeys!5262 (array!77899 array!77901 (_ BitVec 32) (_ BitVec 32) V!45877 V!45877 (_ BitVec 32) Int) ListLongMap!17617)

(assert (=> b!1201676 (= lt!544591 (getCurrentListMapNoExtraKeys!5262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47687 () Bool)

(declare-fun mapRes!47687 () Bool)

(assert (=> mapIsEmpty!47687 mapRes!47687))

(declare-fun call!57512 () ListLongMap!17617)

(declare-fun call!57513 () ListLongMap!17617)

(declare-fun b!1201677 () Bool)

(declare-fun e!682395 () Bool)

(declare-fun -!1796 (ListLongMap!17617 (_ BitVec 64)) ListLongMap!17617)

(assert (=> b!1201677 (= e!682395 (= call!57513 (-!1796 call!57512 k!934)))))

(declare-fun res!799910 () Bool)

(declare-fun e!682388 () Bool)

(assert (=> start!100536 (=> (not res!799910) (not e!682388))))

(assert (=> start!100536 (= res!799910 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38130 _keys!1208))))))

(assert (=> start!100536 e!682388))

(declare-fun tp_is_empty!30563 () Bool)

(assert (=> start!100536 tp_is_empty!30563))

(declare-fun array_inv!28650 (array!77899) Bool)

(assert (=> start!100536 (array_inv!28650 _keys!1208)))

(assert (=> start!100536 true))

(assert (=> start!100536 tp!90567))

(declare-fun e!682396 () Bool)

(declare-fun array_inv!28651 (array!77901) Bool)

(assert (=> start!100536 (and (array_inv!28651 _values!996) e!682396)))

(declare-fun b!1201678 () Bool)

(declare-fun e!682393 () Bool)

(declare-fun e!682399 () Bool)

(assert (=> b!1201678 (= e!682393 e!682399)))

(declare-fun res!799907 () Bool)

(assert (=> b!1201678 (=> res!799907 e!682399)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201678 (= res!799907 (not (= from!1455 i!673)))))

(declare-fun lt!544587 () array!77901)

(declare-fun lt!544583 () array!77899)

(declare-fun lt!544585 () ListLongMap!17617)

(assert (=> b!1201678 (= lt!544585 (getCurrentListMapNoExtraKeys!5262 lt!544583 lt!544587 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3178 (Int (_ BitVec 64)) V!45877)

(assert (=> b!1201678 (= lt!544587 (array!77902 (store (arr!37595 _values!996) i!673 (ValueCellFull!14572 (dynLambda!3178 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38131 _values!996)))))

(declare-fun lt!544586 () ListLongMap!17617)

(assert (=> b!1201678 (= lt!544586 (getCurrentListMapNoExtraKeys!5262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201679 () Bool)

(assert (=> b!1201679 (= e!682399 e!682386)))

(declare-fun res!799908 () Bool)

(assert (=> b!1201679 (=> res!799908 e!682386)))

(assert (=> b!1201679 (= res!799908 (not (= (select (arr!37594 _keys!1208) from!1455) k!934)))))

(assert (=> b!1201679 e!682395))

(declare-fun c!117553 () Bool)

(assert (=> b!1201679 (= c!117553 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39840 0))(
  ( (Unit!39841) )
))
(declare-fun lt!544581 () Unit!39840)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1001 (array!77899 array!77901 (_ BitVec 32) (_ BitVec 32) V!45877 V!45877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39840)

(assert (=> b!1201679 (= lt!544581 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!117554 () Bool)

(declare-fun c!117551 () Bool)

(declare-fun bm!57506 () Bool)

(declare-fun call!57511 () Unit!39840)

(declare-fun lt!544584 () ListLongMap!17617)

(declare-fun addStillContains!982 (ListLongMap!17617 (_ BitVec 64) V!45877 (_ BitVec 64)) Unit!39840)

(assert (=> bm!57506 (= call!57511 (addStillContains!982 (ite c!117551 lt!544584 lt!544591) (ite c!117551 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117554 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117551 minValue!944 (ite c!117554 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1201680 () Bool)

(declare-fun res!799914 () Bool)

(assert (=> b!1201680 (=> (not res!799914) (not e!682388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77899 (_ BitVec 32)) Bool)

(assert (=> b!1201680 (= res!799914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201681 () Bool)

(declare-fun e!682389 () Bool)

(assert (=> b!1201681 (= e!682388 e!682389)))

(declare-fun res!799905 () Bool)

(assert (=> b!1201681 (=> (not res!799905) (not e!682389))))

(assert (=> b!1201681 (= res!799905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544583 mask!1564))))

(assert (=> b!1201681 (= lt!544583 (array!77900 (store (arr!37594 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38130 _keys!1208)))))

(declare-fun b!1201682 () Bool)

(declare-fun e!682387 () Bool)

(assert (=> b!1201682 (= e!682396 (and e!682387 mapRes!47687))))

(declare-fun condMapEmpty!47687 () Bool)

(declare-fun mapDefault!47687 () ValueCell!14572)

