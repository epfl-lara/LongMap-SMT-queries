; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100298 () Bool)

(assert start!100298)

(declare-fun b_free!25685 () Bool)

(declare-fun b_next!25685 () Bool)

(assert (=> start!100298 (= b_free!25685 (not b_next!25685))))

(declare-fun tp!90002 () Bool)

(declare-fun b_and!42237 () Bool)

(assert (=> start!100298 (= tp!90002 b_and!42237)))

(declare-fun b!1196713 () Bool)

(declare-fun res!796426 () Bool)

(declare-fun e!679900 () Bool)

(assert (=> b!1196713 (=> (not res!796426) (not e!679900))))

(declare-datatypes ((array!77509 0))(
  ( (array!77510 (arr!37401 (Array (_ BitVec 32) (_ BitVec 64))) (size!37937 (_ BitVec 32))) )
))
(declare-fun lt!543127 () array!77509)

(declare-datatypes ((List!26311 0))(
  ( (Nil!26308) (Cons!26307 (h!27516 (_ BitVec 64)) (t!38988 List!26311)) )
))
(declare-fun arrayNoDuplicates!0 (array!77509 (_ BitVec 32) List!26311) Bool)

(assert (=> b!1196713 (= res!796426 (arrayNoDuplicates!0 lt!543127 #b00000000000000000000000000000000 Nil!26308))))

(declare-fun b!1196714 () Bool)

(declare-fun res!796431 () Bool)

(declare-fun e!679901 () Bool)

(assert (=> b!1196714 (=> (not res!796431) (not e!679901))))

(declare-fun _keys!1208 () array!77509)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45613 0))(
  ( (V!45614 (val!15239 Int)) )
))
(declare-datatypes ((ValueCell!14473 0))(
  ( (ValueCellFull!14473 (v!17877 V!45613)) (EmptyCell!14473) )
))
(declare-datatypes ((array!77511 0))(
  ( (array!77512 (arr!37402 (Array (_ BitVec 32) ValueCell!14473)) (size!37938 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77511)

(assert (=> b!1196714 (= res!796431 (and (= (size!37938 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37937 _keys!1208) (size!37938 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196715 () Bool)

(declare-fun res!796428 () Bool)

(assert (=> b!1196715 (=> (not res!796428) (not e!679901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196715 (= res!796428 (validMask!0 mask!1564))))

(declare-fun b!1196716 () Bool)

(declare-fun res!796432 () Bool)

(assert (=> b!1196716 (=> (not res!796432) (not e!679901))))

(assert (=> b!1196716 (= res!796432 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26308))))

(declare-fun b!1196717 () Bool)

(declare-fun res!796434 () Bool)

(assert (=> b!1196717 (=> (not res!796434) (not e!679901))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196717 (= res!796434 (validKeyInArray!0 k!934))))

(declare-fun b!1196718 () Bool)

(declare-fun e!679902 () Bool)

(declare-fun tp_is_empty!30365 () Bool)

(assert (=> b!1196718 (= e!679902 tp_is_empty!30365)))

(declare-fun b!1196719 () Bool)

(declare-fun res!796435 () Bool)

(assert (=> b!1196719 (=> (not res!796435) (not e!679901))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196719 (= res!796435 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37937 _keys!1208))))))

(declare-fun b!1196720 () Bool)

(declare-fun e!679898 () Bool)

(assert (=> b!1196720 (= e!679898 true)))

(declare-fun e!679897 () Bool)

(assert (=> b!1196720 e!679897))

(declare-fun c!117342 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1196720 (= c!117342 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45613)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!39684 0))(
  ( (Unit!39685) )
))
(declare-fun lt!543128 () Unit!39684)

(declare-fun minValue!944 () V!45613)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!980 (array!77509 array!77511 (_ BitVec 32) (_ BitVec 32) V!45613 V!45613 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39684)

(assert (=> b!1196720 (= lt!543128 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!980 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196721 () Bool)

(declare-datatypes ((tuple2!19500 0))(
  ( (tuple2!19501 (_1!9761 (_ BitVec 64)) (_2!9761 V!45613)) )
))
(declare-datatypes ((List!26312 0))(
  ( (Nil!26309) (Cons!26308 (h!27517 tuple2!19500) (t!38989 List!26312)) )
))
(declare-datatypes ((ListLongMap!17469 0))(
  ( (ListLongMap!17470 (toList!8750 List!26312)) )
))
(declare-fun call!57176 () ListLongMap!17469)

(declare-fun call!57177 () ListLongMap!17469)

(assert (=> b!1196721 (= e!679897 (= call!57176 call!57177))))

(declare-fun b!1196722 () Bool)

(declare-fun res!796425 () Bool)

(assert (=> b!1196722 (=> (not res!796425) (not e!679901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77509 (_ BitVec 32)) Bool)

(assert (=> b!1196722 (= res!796425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196723 () Bool)

(declare-fun res!796427 () Bool)

(assert (=> b!1196723 (=> (not res!796427) (not e!679901))))

(assert (=> b!1196723 (= res!796427 (= (select (arr!37401 _keys!1208) i!673) k!934))))

(declare-fun b!1196724 () Bool)

(assert (=> b!1196724 (= e!679901 e!679900)))

(declare-fun res!796429 () Bool)

(assert (=> b!1196724 (=> (not res!796429) (not e!679900))))

(assert (=> b!1196724 (= res!796429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543127 mask!1564))))

(assert (=> b!1196724 (= lt!543127 (array!77510 (store (arr!37401 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37937 _keys!1208)))))

(declare-fun b!1196725 () Bool)

(declare-fun e!679903 () Bool)

(assert (=> b!1196725 (= e!679903 tp_is_empty!30365)))

(declare-fun bm!57173 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5191 (array!77509 array!77511 (_ BitVec 32) (_ BitVec 32) V!45613 V!45613 (_ BitVec 32) Int) ListLongMap!17469)

(declare-fun dynLambda!3118 (Int (_ BitVec 64)) V!45613)

(assert (=> bm!57173 (= call!57176 (getCurrentListMapNoExtraKeys!5191 lt!543127 (array!77512 (store (arr!37402 _values!996) i!673 (ValueCellFull!14473 (dynLambda!3118 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37938 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!796430 () Bool)

(assert (=> start!100298 (=> (not res!796430) (not e!679901))))

(assert (=> start!100298 (= res!796430 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37937 _keys!1208))))))

(assert (=> start!100298 e!679901))

(assert (=> start!100298 tp_is_empty!30365))

(declare-fun array_inv!28506 (array!77509) Bool)

(assert (=> start!100298 (array_inv!28506 _keys!1208)))

(assert (=> start!100298 true))

(assert (=> start!100298 tp!90002))

(declare-fun e!679899 () Bool)

(declare-fun array_inv!28507 (array!77511) Bool)

(assert (=> start!100298 (and (array_inv!28507 _values!996) e!679899)))

(declare-fun b!1196726 () Bool)

(declare-fun mapRes!47384 () Bool)

(assert (=> b!1196726 (= e!679899 (and e!679902 mapRes!47384))))

(declare-fun condMapEmpty!47384 () Bool)

(declare-fun mapDefault!47384 () ValueCell!14473)

