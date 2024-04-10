; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100312 () Bool)

(assert start!100312)

(declare-fun b_free!25699 () Bool)

(declare-fun b_next!25699 () Bool)

(assert (=> start!100312 (= b_free!25699 (not b_next!25699))))

(declare-fun tp!90045 () Bool)

(declare-fun b_and!42265 () Bool)

(assert (=> start!100312 (= tp!90045 b_and!42265)))

(declare-fun b!1197063 () Bool)

(declare-fun e!680064 () Bool)

(declare-fun tp_is_empty!30379 () Bool)

(assert (=> b!1197063 (= e!680064 tp_is_empty!30379)))

(declare-fun res!796664 () Bool)

(declare-fun e!680067 () Bool)

(assert (=> start!100312 (=> (not res!796664) (not e!680067))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77537 0))(
  ( (array!77538 (arr!37415 (Array (_ BitVec 32) (_ BitVec 64))) (size!37951 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77537)

(assert (=> start!100312 (= res!796664 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37951 _keys!1208))))))

(assert (=> start!100312 e!680067))

(assert (=> start!100312 tp_is_empty!30379))

(declare-fun array_inv!28514 (array!77537) Bool)

(assert (=> start!100312 (array_inv!28514 _keys!1208)))

(assert (=> start!100312 true))

(assert (=> start!100312 tp!90045))

(declare-datatypes ((V!45633 0))(
  ( (V!45634 (val!15246 Int)) )
))
(declare-datatypes ((ValueCell!14480 0))(
  ( (ValueCellFull!14480 (v!17884 V!45633)) (EmptyCell!14480) )
))
(declare-datatypes ((array!77539 0))(
  ( (array!77540 (arr!37416 (Array (_ BitVec 32) ValueCell!14480)) (size!37952 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77539)

(declare-fun e!680069 () Bool)

(declare-fun array_inv!28515 (array!77539) Bool)

(assert (=> start!100312 (and (array_inv!28515 _values!996) e!680069)))

(declare-fun b!1197064 () Bool)

(declare-fun res!796660 () Bool)

(assert (=> b!1197064 (=> (not res!796660) (not e!680067))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197064 (= res!796660 (validKeyInArray!0 k!934))))

(declare-fun zeroValue!944 () V!45633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!543191 () array!77537)

(declare-fun minValue!944 () V!45633)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!57215 () Bool)

(declare-datatypes ((tuple2!19514 0))(
  ( (tuple2!19515 (_1!9768 (_ BitVec 64)) (_2!9768 V!45633)) )
))
(declare-datatypes ((List!26323 0))(
  ( (Nil!26320) (Cons!26319 (h!27528 tuple2!19514) (t!39014 List!26323)) )
))
(declare-datatypes ((ListLongMap!17483 0))(
  ( (ListLongMap!17484 (toList!8757 List!26323)) )
))
(declare-fun call!57218 () ListLongMap!17483)

(declare-fun getCurrentListMapNoExtraKeys!5197 (array!77537 array!77539 (_ BitVec 32) (_ BitVec 32) V!45633 V!45633 (_ BitVec 32) Int) ListLongMap!17483)

(declare-fun dynLambda!3122 (Int (_ BitVec 64)) V!45633)

(assert (=> bm!57215 (= call!57218 (getCurrentListMapNoExtraKeys!5197 lt!543191 (array!77540 (store (arr!37416 _values!996) i!673 (ValueCellFull!14480 (dynLambda!3122 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37952 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197065 () Bool)

(declare-fun res!796665 () Bool)

(declare-fun e!680071 () Bool)

(assert (=> b!1197065 (=> (not res!796665) (not e!680071))))

(declare-datatypes ((List!26324 0))(
  ( (Nil!26321) (Cons!26320 (h!27529 (_ BitVec 64)) (t!39015 List!26324)) )
))
(declare-fun arrayNoDuplicates!0 (array!77537 (_ BitVec 32) List!26324) Bool)

(assert (=> b!1197065 (= res!796665 (arrayNoDuplicates!0 lt!543191 #b00000000000000000000000000000000 Nil!26321))))

(declare-fun b!1197066 () Bool)

(declare-fun res!796661 () Bool)

(assert (=> b!1197066 (=> (not res!796661) (not e!680067))))

(assert (=> b!1197066 (= res!796661 (and (= (size!37952 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37951 _keys!1208) (size!37952 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197067 () Bool)

(declare-fun res!796662 () Bool)

(assert (=> b!1197067 (=> (not res!796662) (not e!680067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197067 (= res!796662 (validMask!0 mask!1564))))

(declare-fun call!57219 () ListLongMap!17483)

(declare-fun b!1197068 () Bool)

(declare-fun e!680066 () Bool)

(declare-fun -!1775 (ListLongMap!17483 (_ BitVec 64)) ListLongMap!17483)

(assert (=> b!1197068 (= e!680066 (= call!57218 (-!1775 call!57219 k!934)))))

(declare-fun b!1197069 () Bool)

(declare-fun e!680068 () Bool)

(assert (=> b!1197069 (= e!680068 (bvslt i!673 (size!37952 _values!996)))))

(assert (=> b!1197069 e!680066))

(declare-fun c!117363 () Bool)

(assert (=> b!1197069 (= c!117363 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39694 0))(
  ( (Unit!39695) )
))
(declare-fun lt!543190 () Unit!39694)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!984 (array!77537 array!77539 (_ BitVec 32) (_ BitVec 32) V!45633 V!45633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39694)

(assert (=> b!1197069 (= lt!543190 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197070 () Bool)

(declare-fun res!796659 () Bool)

(assert (=> b!1197070 (=> (not res!796659) (not e!680067))))

(assert (=> b!1197070 (= res!796659 (= (select (arr!37415 _keys!1208) i!673) k!934))))

(declare-fun b!1197071 () Bool)

(assert (=> b!1197071 (= e!680067 e!680071)))

(declare-fun res!796656 () Bool)

(assert (=> b!1197071 (=> (not res!796656) (not e!680071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77537 (_ BitVec 32)) Bool)

(assert (=> b!1197071 (= res!796656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543191 mask!1564))))

(assert (=> b!1197071 (= lt!543191 (array!77538 (store (arr!37415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37951 _keys!1208)))))

(declare-fun b!1197072 () Bool)

(declare-fun res!796663 () Bool)

(assert (=> b!1197072 (=> (not res!796663) (not e!680067))))

(assert (=> b!1197072 (= res!796663 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37951 _keys!1208))))))

(declare-fun bm!57216 () Bool)

(assert (=> bm!57216 (= call!57219 (getCurrentListMapNoExtraKeys!5197 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47405 () Bool)

(declare-fun mapRes!47405 () Bool)

(assert (=> mapIsEmpty!47405 mapRes!47405))

(declare-fun b!1197073 () Bool)

(assert (=> b!1197073 (= e!680066 (= call!57218 call!57219))))

(declare-fun b!1197074 () Bool)

(assert (=> b!1197074 (= e!680071 (not e!680068))))

(declare-fun res!796658 () Bool)

(assert (=> b!1197074 (=> res!796658 e!680068)))

(assert (=> b!1197074 (= res!796658 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37951 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197074 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!543192 () Unit!39694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77537 (_ BitVec 64) (_ BitVec 32)) Unit!39694)

(assert (=> b!1197074 (= lt!543192 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1197075 () Bool)

(assert (=> b!1197075 (= e!680069 (and e!680064 mapRes!47405))))

(declare-fun condMapEmpty!47405 () Bool)

(declare-fun mapDefault!47405 () ValueCell!14480)

