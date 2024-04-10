; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100530 () Bool)

(assert start!100530)

(declare-fun b_free!25853 () Bool)

(declare-fun b_next!25853 () Bool)

(assert (=> start!100530 (= b_free!25853 (not b_next!25853))))

(declare-fun tp!90549 () Bool)

(declare-fun b_and!42593 () Bool)

(assert (=> start!100530 (= tp!90549 b_and!42593)))

(declare-fun bm!57433 () Bool)

(declare-datatypes ((Unit!39832 0))(
  ( (Unit!39833) )
))
(declare-fun call!57442 () Unit!39832)

(declare-fun call!57437 () Unit!39832)

(assert (=> bm!57433 (= call!57442 call!57437)))

(declare-fun mapNonEmpty!47678 () Bool)

(declare-fun mapRes!47678 () Bool)

(declare-fun tp!90548 () Bool)

(declare-fun e!682261 () Bool)

(assert (=> mapNonEmpty!47678 (= mapRes!47678 (and tp!90548 e!682261))))

(declare-fun mapKey!47678 () (_ BitVec 32))

(declare-datatypes ((V!45869 0))(
  ( (V!45870 (val!15335 Int)) )
))
(declare-datatypes ((ValueCell!14569 0))(
  ( (ValueCellFull!14569 (v!17973 V!45869)) (EmptyCell!14569) )
))
(declare-datatypes ((array!77887 0))(
  ( (array!77888 (arr!37588 (Array (_ BitVec 32) ValueCell!14569)) (size!38124 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77887)

(declare-fun mapRest!47678 () (Array (_ BitVec 32) ValueCell!14569))

(declare-fun mapValue!47678 () ValueCell!14569)

(assert (=> mapNonEmpty!47678 (= (arr!37588 _values!996) (store mapRest!47678 mapKey!47678 mapValue!47678))))

(declare-fun b!1201445 () Bool)

(declare-fun e!682265 () Bool)

(declare-fun tp_is_empty!30557 () Bool)

(assert (=> b!1201445 (= e!682265 tp_is_empty!30557)))

(declare-fun zeroValue!944 () V!45869)

(declare-fun c!117518 () Bool)

(declare-fun bm!57434 () Bool)

(declare-datatypes ((tuple2!19642 0))(
  ( (tuple2!19643 (_1!9832 (_ BitVec 64)) (_2!9832 V!45869)) )
))
(declare-datatypes ((List!26460 0))(
  ( (Nil!26457) (Cons!26456 (h!27665 tuple2!19642) (t!39293 List!26460)) )
))
(declare-datatypes ((ListLongMap!17611 0))(
  ( (ListLongMap!17612 (toList!8821 List!26460)) )
))
(declare-fun lt!544463 () ListLongMap!17611)

(declare-fun lt!544457 () ListLongMap!17611)

(declare-fun minValue!944 () V!45869)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!117516 () Bool)

(declare-fun addStillContains!980 (ListLongMap!17611 (_ BitVec 64) V!45869 (_ BitVec 64)) Unit!39832)

(assert (=> bm!57434 (= call!57437 (addStillContains!980 (ite c!117516 lt!544463 lt!544457) (ite c!117516 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117518 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117516 minValue!944 (ite c!117518 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1201446 () Bool)

(declare-fun e!682270 () Unit!39832)

(declare-fun e!682262 () Unit!39832)

(assert (=> b!1201446 (= e!682270 e!682262)))

(declare-fun lt!544455 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1201446 (= c!117518 (and (not lt!544455) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201447 () Bool)

(declare-fun res!799783 () Bool)

(declare-fun e!682264 () Bool)

(assert (=> b!1201447 (=> (not res!799783) (not e!682264))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201447 (= res!799783 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47678 () Bool)

(assert (=> mapIsEmpty!47678 mapRes!47678))

(declare-fun b!1201448 () Bool)

(declare-fun call!57440 () Bool)

(assert (=> b!1201448 call!57440))

(declare-fun lt!544461 () Unit!39832)

(assert (=> b!1201448 (= lt!544461 call!57442)))

(assert (=> b!1201448 (= e!682262 lt!544461)))

(declare-fun b!1201449 () Bool)

(declare-fun res!799775 () Bool)

(assert (=> b!1201449 (=> (not res!799775) (not e!682264))))

(declare-datatypes ((array!77889 0))(
  ( (array!77890 (arr!37589 (Array (_ BitVec 32) (_ BitVec 64))) (size!38125 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77889)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77889 (_ BitVec 32)) Bool)

(assert (=> b!1201449 (= res!799775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201450 () Bool)

(declare-fun lt!544456 () Unit!39832)

(assert (=> b!1201450 (= e!682270 lt!544456)))

(declare-fun lt!544468 () Unit!39832)

(assert (=> b!1201450 (= lt!544468 (addStillContains!980 lt!544457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!57438 () ListLongMap!17611)

(assert (=> b!1201450 (= lt!544463 call!57438)))

(declare-fun call!57441 () Bool)

(assert (=> b!1201450 call!57441))

(assert (=> b!1201450 (= lt!544456 call!57437)))

(declare-fun contains!6879 (ListLongMap!17611 (_ BitVec 64)) Bool)

(declare-fun +!3953 (ListLongMap!17611 tuple2!19642) ListLongMap!17611)

(assert (=> b!1201450 (contains!6879 (+!3953 lt!544463 (tuple2!19643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1201451 () Bool)

(declare-fun res!799778 () Bool)

(assert (=> b!1201451 (=> (not res!799778) (not e!682264))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201451 (= res!799778 (= (select (arr!37589 _keys!1208) i!673) k!934))))

(declare-fun e!682269 () Bool)

(declare-fun call!57436 () ListLongMap!17611)

(declare-fun b!1201452 () Bool)

(declare-fun call!57439 () ListLongMap!17611)

(declare-fun -!1794 (ListLongMap!17611 (_ BitVec 64)) ListLongMap!17611)

(assert (=> b!1201452 (= e!682269 (= call!57436 (-!1794 call!57439 k!934)))))

(declare-fun bm!57435 () Bool)

(declare-fun call!57443 () ListLongMap!17611)

(assert (=> bm!57435 (= call!57441 (contains!6879 (ite c!117516 lt!544463 call!57443) k!934))))

(declare-fun b!1201453 () Bool)

(declare-fun e!682273 () Unit!39832)

(declare-fun Unit!39834 () Unit!39832)

(assert (=> b!1201453 (= e!682273 Unit!39834)))

(declare-fun b!1201454 () Bool)

(declare-fun e!682266 () Bool)

(assert (=> b!1201454 (= e!682264 e!682266)))

(declare-fun res!799782 () Bool)

(assert (=> b!1201454 (=> (not res!799782) (not e!682266))))

(declare-fun lt!544465 () array!77889)

(assert (=> b!1201454 (= res!799782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544465 mask!1564))))

(assert (=> b!1201454 (= lt!544465 (array!77890 (store (arr!37589 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38125 _keys!1208)))))

(declare-fun res!799780 () Bool)

(assert (=> start!100530 (=> (not res!799780) (not e!682264))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100530 (= res!799780 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38125 _keys!1208))))))

(assert (=> start!100530 e!682264))

(assert (=> start!100530 tp_is_empty!30557))

(declare-fun array_inv!28646 (array!77889) Bool)

(assert (=> start!100530 (array_inv!28646 _keys!1208)))

(assert (=> start!100530 true))

(assert (=> start!100530 tp!90549))

(declare-fun e!682267 () Bool)

(declare-fun array_inv!28647 (array!77887) Bool)

(assert (=> start!100530 (and (array_inv!28647 _values!996) e!682267)))

(declare-fun b!1201455 () Bool)

(declare-fun e!682268 () Bool)

(assert (=> b!1201455 (= e!682268 true)))

(declare-fun lt!544458 () Unit!39832)

(assert (=> b!1201455 (= lt!544458 e!682270)))

(assert (=> b!1201455 (= c!117516 (and (not lt!544455) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201455 (= lt!544455 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201456 () Bool)

(declare-fun e!682271 () Bool)

(assert (=> b!1201456 (= e!682266 (not e!682271))))

(declare-fun res!799786 () Bool)

(assert (=> b!1201456 (=> res!799786 e!682271)))

(assert (=> b!1201456 (= res!799786 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201456 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!544459 () Unit!39832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77889 (_ BitVec 64) (_ BitVec 32)) Unit!39832)

(assert (=> b!1201456 (= lt!544459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1201457 () Bool)

(declare-fun res!799788 () Bool)

(assert (=> b!1201457 (=> (not res!799788) (not e!682264))))

(assert (=> b!1201457 (= res!799788 (and (= (size!38124 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38125 _keys!1208) (size!38124 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201458 () Bool)

(assert (=> b!1201458 (= e!682267 (and e!682265 mapRes!47678))))

(declare-fun condMapEmpty!47678 () Bool)

(declare-fun mapDefault!47678 () ValueCell!14569)

