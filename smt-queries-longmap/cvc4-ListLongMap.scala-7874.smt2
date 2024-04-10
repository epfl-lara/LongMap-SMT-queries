; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97992 () Bool)

(assert start!97992)

(declare-fun b_free!23693 () Bool)

(declare-fun b_next!23693 () Bool)

(assert (=> start!97992 (= b_free!23693 (not b_next!23693))))

(declare-fun tp!83783 () Bool)

(declare-fun b_and!38169 () Bool)

(assert (=> start!97992 (= tp!83783 b_and!38169)))

(declare-fun b!1123830 () Bool)

(declare-fun e!639786 () Bool)

(declare-fun e!639782 () Bool)

(assert (=> b!1123830 (= e!639786 e!639782)))

(declare-fun res!750861 () Bool)

(assert (=> b!1123830 (=> (not res!750861) (not e!639782))))

(declare-datatypes ((array!73313 0))(
  ( (array!73314 (arr!35309 (Array (_ BitVec 32) (_ BitVec 64))) (size!35845 (_ BitVec 32))) )
))
(declare-fun lt!499232 () array!73313)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73313 (_ BitVec 32)) Bool)

(assert (=> b!1123830 (= res!750861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499232 mask!1564))))

(declare-fun _keys!1208 () array!73313)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123830 (= lt!499232 (array!73314 (store (arr!35309 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35845 _keys!1208)))))

(declare-fun b!1123831 () Bool)

(declare-fun res!750862 () Bool)

(assert (=> b!1123831 (=> (not res!750862) (not e!639786))))

(declare-datatypes ((List!24571 0))(
  ( (Nil!24568) (Cons!24567 (h!25776 (_ BitVec 64)) (t!35256 List!24571)) )
))
(declare-fun arrayNoDuplicates!0 (array!73313 (_ BitVec 32) List!24571) Bool)

(assert (=> b!1123831 (= res!750862 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24568))))

(declare-fun b!1123832 () Bool)

(declare-fun res!750857 () Bool)

(assert (=> b!1123832 (=> (not res!750857) (not e!639782))))

(assert (=> b!1123832 (= res!750857 (arrayNoDuplicates!0 lt!499232 #b00000000000000000000000000000000 Nil!24568))))

(declare-fun b!1123833 () Bool)

(declare-fun e!639777 () Bool)

(declare-fun tp_is_empty!28223 () Bool)

(assert (=> b!1123833 (= e!639777 tp_is_empty!28223)))

(declare-fun b!1123834 () Bool)

(declare-fun e!639784 () Bool)

(assert (=> b!1123834 (= e!639782 (not e!639784))))

(declare-fun res!750863 () Bool)

(assert (=> b!1123834 (=> res!750863 e!639784)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123834 (= res!750863 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123834 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36846 0))(
  ( (Unit!36847) )
))
(declare-fun lt!499231 () Unit!36846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73313 (_ BitVec 64) (_ BitVec 32)) Unit!36846)

(assert (=> b!1123834 (= lt!499231 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((V!42757 0))(
  ( (V!42758 (val!14168 Int)) )
))
(declare-datatypes ((tuple2!17792 0))(
  ( (tuple2!17793 (_1!8907 (_ BitVec 64)) (_2!8907 V!42757)) )
))
(declare-datatypes ((List!24572 0))(
  ( (Nil!24569) (Cons!24568 (h!25777 tuple2!17792) (t!35257 List!24572)) )
))
(declare-datatypes ((ListLongMap!15761 0))(
  ( (ListLongMap!15762 (toList!7896 List!24572)) )
))
(declare-fun call!47362 () ListLongMap!15761)

(declare-fun e!639783 () Bool)

(declare-fun call!47361 () ListLongMap!15761)

(declare-fun b!1123835 () Bool)

(declare-fun -!1101 (ListLongMap!15761 (_ BitVec 64)) ListLongMap!15761)

(assert (=> b!1123835 (= e!639783 (= call!47362 (-!1101 call!47361 k!934)))))

(declare-fun b!1123836 () Bool)

(declare-fun res!750860 () Bool)

(assert (=> b!1123836 (=> (not res!750860) (not e!639786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123836 (= res!750860 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44152 () Bool)

(declare-fun mapRes!44152 () Bool)

(assert (=> mapIsEmpty!44152 mapRes!44152))

(declare-fun b!1123837 () Bool)

(declare-fun res!750865 () Bool)

(assert (=> b!1123837 (=> (not res!750865) (not e!639786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123837 (= res!750865 (validKeyInArray!0 k!934))))

(declare-fun b!1123838 () Bool)

(declare-fun e!639781 () Bool)

(assert (=> b!1123838 (= e!639784 e!639781)))

(declare-fun res!750854 () Bool)

(assert (=> b!1123838 (=> res!750854 e!639781)))

(assert (=> b!1123838 (= res!750854 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13402 0))(
  ( (ValueCellFull!13402 (v!16801 V!42757)) (EmptyCell!13402) )
))
(declare-datatypes ((array!73315 0))(
  ( (array!73316 (arr!35310 (Array (_ BitVec 32) ValueCell!13402)) (size!35846 (_ BitVec 32))) )
))
(declare-fun lt!499227 () array!73315)

(declare-fun lt!499228 () ListLongMap!15761)

(declare-fun minValue!944 () V!42757)

(declare-fun zeroValue!944 () V!42757)

(declare-fun getCurrentListMapNoExtraKeys!4384 (array!73313 array!73315 (_ BitVec 32) (_ BitVec 32) V!42757 V!42757 (_ BitVec 32) Int) ListLongMap!15761)

(assert (=> b!1123838 (= lt!499228 (getCurrentListMapNoExtraKeys!4384 lt!499232 lt!499227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73315)

(declare-fun dynLambda!2480 (Int (_ BitVec 64)) V!42757)

(assert (=> b!1123838 (= lt!499227 (array!73316 (store (arr!35310 _values!996) i!673 (ValueCellFull!13402 (dynLambda!2480 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35846 _values!996)))))

(declare-fun lt!499226 () ListLongMap!15761)

(assert (=> b!1123838 (= lt!499226 (getCurrentListMapNoExtraKeys!4384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123839 () Bool)

(declare-fun e!639776 () Bool)

(assert (=> b!1123839 (= e!639776 tp_is_empty!28223)))

(declare-fun b!1123840 () Bool)

(declare-fun res!750856 () Bool)

(assert (=> b!1123840 (=> (not res!750856) (not e!639786))))

(assert (=> b!1123840 (= res!750856 (and (= (size!35846 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35845 _keys!1208) (size!35846 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123841 () Bool)

(declare-fun e!639778 () Bool)

(declare-fun e!639780 () Bool)

(assert (=> b!1123841 (= e!639778 e!639780)))

(declare-fun res!750855 () Bool)

(assert (=> b!1123841 (=> res!750855 e!639780)))

(declare-fun lt!499230 () ListLongMap!15761)

(declare-fun contains!6435 (ListLongMap!15761 (_ BitVec 64)) Bool)

(assert (=> b!1123841 (= res!750855 (not (contains!6435 lt!499230 k!934)))))

(assert (=> b!1123841 (= lt!499230 (getCurrentListMapNoExtraKeys!4384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123842 () Bool)

(assert (=> b!1123842 (= e!639781 e!639778)))

(declare-fun res!750851 () Bool)

(assert (=> b!1123842 (=> res!750851 e!639778)))

(assert (=> b!1123842 (= res!750851 (not (= (select (arr!35309 _keys!1208) from!1455) k!934)))))

(assert (=> b!1123842 e!639783))

(declare-fun c!109530 () Bool)

(assert (=> b!1123842 (= c!109530 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499225 () Unit!36846)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!348 (array!73313 array!73315 (_ BitVec 32) (_ BitVec 32) V!42757 V!42757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36846)

(assert (=> b!1123842 (= lt!499225 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123843 () Bool)

(declare-fun res!750853 () Bool)

(assert (=> b!1123843 (=> (not res!750853) (not e!639786))))

(assert (=> b!1123843 (= res!750853 (= (select (arr!35309 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!44152 () Bool)

(declare-fun tp!83782 () Bool)

(assert (=> mapNonEmpty!44152 (= mapRes!44152 (and tp!83782 e!639777))))

(declare-fun mapKey!44152 () (_ BitVec 32))

(declare-fun mapValue!44152 () ValueCell!13402)

(declare-fun mapRest!44152 () (Array (_ BitVec 32) ValueCell!13402))

(assert (=> mapNonEmpty!44152 (= (arr!35310 _values!996) (store mapRest!44152 mapKey!44152 mapValue!44152))))

(declare-fun b!1123844 () Bool)

(declare-fun res!750858 () Bool)

(assert (=> b!1123844 (=> res!750858 e!639780)))

(assert (=> b!1123844 (= res!750858 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!47358 () Bool)

(assert (=> bm!47358 (= call!47362 (getCurrentListMapNoExtraKeys!4384 lt!499232 lt!499227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123845 () Bool)

(assert (=> b!1123845 (= e!639783 (= call!47362 call!47361))))

(declare-fun b!1123846 () Bool)

(declare-fun res!750864 () Bool)

(assert (=> b!1123846 (=> (not res!750864) (not e!639786))))

(assert (=> b!1123846 (= res!750864 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35845 _keys!1208))))))

(declare-fun b!1123847 () Bool)

(assert (=> b!1123847 (= e!639780 true)))

(declare-fun +!3407 (ListLongMap!15761 tuple2!17792) ListLongMap!15761)

(assert (=> b!1123847 (contains!6435 (+!3407 lt!499230 (tuple2!17793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-fun lt!499229 () Unit!36846)

(declare-fun addStillContains!669 (ListLongMap!15761 (_ BitVec 64) V!42757 (_ BitVec 64)) Unit!36846)

(assert (=> b!1123847 (= lt!499229 (addStillContains!669 lt!499230 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun bm!47359 () Bool)

(assert (=> bm!47359 (= call!47361 (getCurrentListMapNoExtraKeys!4384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123848 () Bool)

(declare-fun res!750859 () Bool)

(assert (=> b!1123848 (=> (not res!750859) (not e!639786))))

(assert (=> b!1123848 (= res!750859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123849 () Bool)

(declare-fun e!639785 () Bool)

(assert (=> b!1123849 (= e!639785 (and e!639776 mapRes!44152))))

(declare-fun condMapEmpty!44152 () Bool)

(declare-fun mapDefault!44152 () ValueCell!13402)

