; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97880 () Bool)

(assert start!97880)

(declare-fun b_free!23581 () Bool)

(declare-fun b_next!23581 () Bool)

(assert (=> start!97880 (= b_free!23581 (not b_next!23581))))

(declare-fun tp!83446 () Bool)

(declare-fun b_and!37945 () Bool)

(assert (=> start!97880 (= tp!83446 b_and!37945)))

(declare-fun b!1120739 () Bool)

(declare-fun res!748719 () Bool)

(declare-fun e!638165 () Bool)

(assert (=> b!1120739 (=> (not res!748719) (not e!638165))))

(declare-datatypes ((array!73103 0))(
  ( (array!73104 (arr!35204 (Array (_ BitVec 32) (_ BitVec 64))) (size!35740 (_ BitVec 32))) )
))
(declare-fun lt!498121 () array!73103)

(declare-datatypes ((List!24492 0))(
  ( (Nil!24489) (Cons!24488 (h!25697 (_ BitVec 64)) (t!35065 List!24492)) )
))
(declare-fun arrayNoDuplicates!0 (array!73103 (_ BitVec 32) List!24492) Bool)

(assert (=> b!1120739 (= res!748719 (arrayNoDuplicates!0 lt!498121 #b00000000000000000000000000000000 Nil!24489))))

(declare-fun b!1120740 () Bool)

(declare-fun res!748718 () Bool)

(declare-fun e!638162 () Bool)

(assert (=> b!1120740 (=> (not res!748718) (not e!638162))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120740 (= res!748718 (validMask!0 mask!1564))))

(declare-datatypes ((V!42609 0))(
  ( (V!42610 (val!14112 Int)) )
))
(declare-fun zeroValue!944 () V!42609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17708 0))(
  ( (tuple2!17709 (_1!8865 (_ BitVec 64)) (_2!8865 V!42609)) )
))
(declare-datatypes ((List!24493 0))(
  ( (Nil!24490) (Cons!24489 (h!25698 tuple2!17708) (t!35066 List!24493)) )
))
(declare-datatypes ((ListLongMap!15677 0))(
  ( (ListLongMap!15678 (toList!7854 List!24493)) )
))
(declare-fun call!47025 () ListLongMap!15677)

(declare-fun bm!47022 () Bool)

(declare-fun minValue!944 () V!42609)

(declare-datatypes ((ValueCell!13346 0))(
  ( (ValueCellFull!13346 (v!16745 V!42609)) (EmptyCell!13346) )
))
(declare-datatypes ((array!73105 0))(
  ( (array!73106 (arr!35205 (Array (_ BitVec 32) ValueCell!13346)) (size!35741 (_ BitVec 32))) )
))
(declare-fun lt!498123 () array!73105)

(declare-fun getCurrentListMapNoExtraKeys!4344 (array!73103 array!73105 (_ BitVec 32) (_ BitVec 32) V!42609 V!42609 (_ BitVec 32) Int) ListLongMap!15677)

(assert (=> bm!47022 (= call!47025 (getCurrentListMapNoExtraKeys!4344 lt!498121 lt!498123 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120741 () Bool)

(declare-fun e!638164 () Bool)

(declare-fun tp_is_empty!28111 () Bool)

(assert (=> b!1120741 (= e!638164 tp_is_empty!28111)))

(declare-fun b!1120742 () Bool)

(declare-fun res!748713 () Bool)

(assert (=> b!1120742 (=> (not res!748713) (not e!638162))))

(declare-fun _keys!1208 () array!73103)

(assert (=> b!1120742 (= res!748713 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24489))))

(declare-fun b!1120743 () Bool)

(declare-fun res!748712 () Bool)

(assert (=> b!1120743 (=> (not res!748712) (not e!638162))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120743 (= res!748712 (validKeyInArray!0 k!934))))

(declare-fun b!1120744 () Bool)

(assert (=> b!1120744 (= e!638162 e!638165)))

(declare-fun res!748714 () Bool)

(assert (=> b!1120744 (=> (not res!748714) (not e!638165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73103 (_ BitVec 32)) Bool)

(assert (=> b!1120744 (= res!748714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498121 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120744 (= lt!498121 (array!73104 (store (arr!35204 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35740 _keys!1208)))))

(declare-fun b!1120745 () Bool)

(declare-fun e!638160 () Bool)

(declare-fun call!47026 () ListLongMap!15677)

(assert (=> b!1120745 (= e!638160 (= call!47025 call!47026))))

(declare-fun b!1120746 () Bool)

(declare-fun -!1066 (ListLongMap!15677 (_ BitVec 64)) ListLongMap!15677)

(assert (=> b!1120746 (= e!638160 (= call!47025 (-!1066 call!47026 k!934)))))

(declare-fun b!1120747 () Bool)

(declare-fun res!748721 () Bool)

(assert (=> b!1120747 (=> (not res!748721) (not e!638162))))

(assert (=> b!1120747 (= res!748721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47023 () Bool)

(declare-fun _values!996 () array!73105)

(assert (=> bm!47023 (= call!47026 (getCurrentListMapNoExtraKeys!4344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!748720 () Bool)

(assert (=> start!97880 (=> (not res!748720) (not e!638162))))

(assert (=> start!97880 (= res!748720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35740 _keys!1208))))))

(assert (=> start!97880 e!638162))

(assert (=> start!97880 tp_is_empty!28111))

(declare-fun array_inv!27036 (array!73103) Bool)

(assert (=> start!97880 (array_inv!27036 _keys!1208)))

(assert (=> start!97880 true))

(assert (=> start!97880 tp!83446))

(declare-fun e!638161 () Bool)

(declare-fun array_inv!27037 (array!73105) Bool)

(assert (=> start!97880 (and (array_inv!27037 _values!996) e!638161)))

(declare-fun b!1120748 () Bool)

(declare-fun e!638158 () Bool)

(declare-fun e!638159 () Bool)

(assert (=> b!1120748 (= e!638158 e!638159)))

(declare-fun res!748717 () Bool)

(assert (=> b!1120748 (=> res!748717 e!638159)))

(assert (=> b!1120748 (= res!748717 (not (= from!1455 i!673)))))

(declare-fun lt!498120 () ListLongMap!15677)

(assert (=> b!1120748 (= lt!498120 (getCurrentListMapNoExtraKeys!4344 lt!498121 lt!498123 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2446 (Int (_ BitVec 64)) V!42609)

(assert (=> b!1120748 (= lt!498123 (array!73106 (store (arr!35205 _values!996) i!673 (ValueCellFull!13346 (dynLambda!2446 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35741 _values!996)))))

(declare-fun lt!498124 () ListLongMap!15677)

(assert (=> b!1120748 (= lt!498124 (getCurrentListMapNoExtraKeys!4344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120749 () Bool)

(declare-fun res!748722 () Bool)

(assert (=> b!1120749 (=> (not res!748722) (not e!638162))))

(assert (=> b!1120749 (= res!748722 (and (= (size!35741 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35740 _keys!1208) (size!35741 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43984 () Bool)

(declare-fun mapRes!43984 () Bool)

(declare-fun tp!83447 () Bool)

(declare-fun e!638166 () Bool)

(assert (=> mapNonEmpty!43984 (= mapRes!43984 (and tp!83447 e!638166))))

(declare-fun mapRest!43984 () (Array (_ BitVec 32) ValueCell!13346))

(declare-fun mapValue!43984 () ValueCell!13346)

(declare-fun mapKey!43984 () (_ BitVec 32))

(assert (=> mapNonEmpty!43984 (= (arr!35205 _values!996) (store mapRest!43984 mapKey!43984 mapValue!43984))))

(declare-fun b!1120750 () Bool)

(assert (=> b!1120750 (= e!638159 true)))

(assert (=> b!1120750 e!638160))

(declare-fun c!109362 () Bool)

(assert (=> b!1120750 (= c!109362 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36772 0))(
  ( (Unit!36773) )
))
(declare-fun lt!498125 () Unit!36772)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!316 (array!73103 array!73105 (_ BitVec 32) (_ BitVec 32) V!42609 V!42609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36772)

(assert (=> b!1120750 (= lt!498125 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43984 () Bool)

(assert (=> mapIsEmpty!43984 mapRes!43984))

(declare-fun b!1120751 () Bool)

(declare-fun res!748723 () Bool)

(assert (=> b!1120751 (=> (not res!748723) (not e!638162))))

(assert (=> b!1120751 (= res!748723 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35740 _keys!1208))))))

(declare-fun b!1120752 () Bool)

(assert (=> b!1120752 (= e!638161 (and e!638164 mapRes!43984))))

(declare-fun condMapEmpty!43984 () Bool)

(declare-fun mapDefault!43984 () ValueCell!13346)

