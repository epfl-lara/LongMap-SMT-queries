; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99728 () Bool)

(assert start!99728)

(declare-fun b_free!25307 () Bool)

(declare-fun b_next!25307 () Bool)

(assert (=> start!99728 (= b_free!25307 (not b_next!25307))))

(declare-fun tp!88634 () Bool)

(declare-fun b_and!41481 () Bool)

(assert (=> start!99728 (= tp!88634 b_and!41481)))

(declare-fun b!1183803 () Bool)

(declare-fun res!786819 () Bool)

(declare-fun e!673062 () Bool)

(assert (=> b!1183803 (=> (not res!786819) (not e!673062))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76475 0))(
  ( (array!76476 (arr!36887 (Array (_ BitVec 32) (_ BitVec 64))) (size!37423 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76475)

(assert (=> b!1183803 (= res!786819 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37423 _keys!1208))))))

(declare-fun b!1183804 () Bool)

(declare-datatypes ((Unit!39185 0))(
  ( (Unit!39186) )
))
(declare-fun e!673055 () Unit!39185)

(declare-fun Unit!39187 () Unit!39185)

(assert (=> b!1183804 (= e!673055 Unit!39187)))

(declare-fun lt!536515 () Unit!39185)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76475 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39185)

(assert (=> b!1183804 (= lt!536515 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183804 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536504 () Unit!39185)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76475 (_ BitVec 32) (_ BitVec 32)) Unit!39185)

(assert (=> b!1183804 (= lt!536504 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25939 0))(
  ( (Nil!25936) (Cons!25935 (h!27144 (_ BitVec 64)) (t!38238 List!25939)) )
))
(declare-fun arrayNoDuplicates!0 (array!76475 (_ BitVec 32) List!25939) Bool)

(assert (=> b!1183804 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25936)))

(declare-fun lt!536513 () Unit!39185)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76475 (_ BitVec 64) (_ BitVec 32) List!25939) Unit!39185)

(assert (=> b!1183804 (= lt!536513 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25936))))

(assert (=> b!1183804 false))

(declare-fun b!1183805 () Bool)

(declare-fun e!673059 () Bool)

(declare-fun e!673056 () Bool)

(assert (=> b!1183805 (= e!673059 e!673056)))

(declare-fun res!786822 () Bool)

(assert (=> b!1183805 (=> res!786822 e!673056)))

(assert (=> b!1183805 (= res!786822 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44909 0))(
  ( (V!44910 (val!14975 Int)) )
))
(declare-fun zeroValue!944 () V!44909)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!536505 () array!76475)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14209 0))(
  ( (ValueCellFull!14209 (v!17613 V!44909)) (EmptyCell!14209) )
))
(declare-datatypes ((array!76477 0))(
  ( (array!76478 (arr!36888 (Array (_ BitVec 32) ValueCell!14209)) (size!37424 (_ BitVec 32))) )
))
(declare-fun lt!536511 () array!76477)

(declare-datatypes ((tuple2!19200 0))(
  ( (tuple2!19201 (_1!9611 (_ BitVec 64)) (_2!9611 V!44909)) )
))
(declare-datatypes ((List!25940 0))(
  ( (Nil!25937) (Cons!25936 (h!27145 tuple2!19200) (t!38239 List!25940)) )
))
(declare-datatypes ((ListLongMap!17169 0))(
  ( (ListLongMap!17170 (toList!8600 List!25940)) )
))
(declare-fun lt!536509 () ListLongMap!17169)

(declare-fun minValue!944 () V!44909)

(declare-fun getCurrentListMapNoExtraKeys!5050 (array!76475 array!76477 (_ BitVec 32) (_ BitVec 32) V!44909 V!44909 (_ BitVec 32) Int) ListLongMap!17169)

(assert (=> b!1183805 (= lt!536509 (getCurrentListMapNoExtraKeys!5050 lt!536505 lt!536511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536514 () V!44909)

(declare-fun _values!996 () array!76477)

(assert (=> b!1183805 (= lt!536511 (array!76478 (store (arr!36888 _values!996) i!673 (ValueCellFull!14209 lt!536514)) (size!37424 _values!996)))))

(declare-fun dynLambda!3001 (Int (_ BitVec 64)) V!44909)

(assert (=> b!1183805 (= lt!536514 (dynLambda!3001 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536519 () ListLongMap!17169)

(assert (=> b!1183805 (= lt!536519 (getCurrentListMapNoExtraKeys!5050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183806 () Bool)

(declare-fun e!673064 () Bool)

(assert (=> b!1183806 (= e!673062 e!673064)))

(declare-fun res!786813 () Bool)

(assert (=> b!1183806 (=> (not res!786813) (not e!673064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76475 (_ BitVec 32)) Bool)

(assert (=> b!1183806 (= res!786813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536505 mask!1564))))

(assert (=> b!1183806 (= lt!536505 (array!76476 (store (arr!36887 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37423 _keys!1208)))))

(declare-fun b!1183807 () Bool)

(declare-fun res!786821 () Bool)

(assert (=> b!1183807 (=> (not res!786821) (not e!673062))))

(assert (=> b!1183807 (= res!786821 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25936))))

(declare-fun b!1183808 () Bool)

(declare-fun res!786809 () Bool)

(assert (=> b!1183808 (=> (not res!786809) (not e!673062))))

(assert (=> b!1183808 (= res!786809 (and (= (size!37424 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37423 _keys!1208) (size!37424 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183809 () Bool)

(declare-fun e!673066 () Bool)

(declare-fun e!673063 () Bool)

(assert (=> b!1183809 (= e!673066 e!673063)))

(declare-fun res!786810 () Bool)

(assert (=> b!1183809 (=> res!786810 e!673063)))

(assert (=> b!1183809 (= res!786810 (not (= (select (arr!36887 _keys!1208) from!1455) k!934)))))

(declare-fun b!1183810 () Bool)

(declare-fun res!786811 () Bool)

(assert (=> b!1183810 (=> (not res!786811) (not e!673064))))

(assert (=> b!1183810 (= res!786811 (arrayNoDuplicates!0 lt!536505 #b00000000000000000000000000000000 Nil!25936))))

(declare-fun b!1183811 () Bool)

(declare-fun Unit!39188 () Unit!39185)

(assert (=> b!1183811 (= e!673055 Unit!39188)))

(declare-fun b!1183812 () Bool)

(declare-fun res!786820 () Bool)

(assert (=> b!1183812 (=> (not res!786820) (not e!673062))))

(assert (=> b!1183812 (= res!786820 (= (select (arr!36887 _keys!1208) i!673) k!934))))

(declare-fun b!1183813 () Bool)

(declare-fun e!673061 () Bool)

(declare-fun tp_is_empty!29837 () Bool)

(assert (=> b!1183813 (= e!673061 tp_is_empty!29837)))

(declare-fun b!1183814 () Bool)

(declare-fun res!786815 () Bool)

(assert (=> b!1183814 (=> (not res!786815) (not e!673062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183814 (= res!786815 (validMask!0 mask!1564))))

(declare-fun b!1183815 () Bool)

(declare-fun e!673057 () Bool)

(assert (=> b!1183815 (= e!673057 true)))

(declare-fun lt!536518 () ListLongMap!17169)

(declare-fun lt!536517 () ListLongMap!17169)

(declare-fun -!1635 (ListLongMap!17169 (_ BitVec 64)) ListLongMap!17169)

(assert (=> b!1183815 (= (-!1635 lt!536518 k!934) lt!536517)))

(declare-fun lt!536520 () ListLongMap!17169)

(declare-fun lt!536508 () Unit!39185)

(declare-fun lt!536516 () V!44909)

(declare-fun addRemoveCommutativeForDiffKeys!161 (ListLongMap!17169 (_ BitVec 64) V!44909 (_ BitVec 64)) Unit!39185)

(assert (=> b!1183815 (= lt!536508 (addRemoveCommutativeForDiffKeys!161 lt!536520 (select (arr!36887 _keys!1208) from!1455) lt!536516 k!934))))

(declare-fun lt!536510 () ListLongMap!17169)

(declare-fun lt!536512 () ListLongMap!17169)

(assert (=> b!1183815 (and (= lt!536519 lt!536518) (= lt!536512 lt!536510))))

(declare-fun lt!536507 () tuple2!19200)

(declare-fun +!3898 (ListLongMap!17169 tuple2!19200) ListLongMap!17169)

(assert (=> b!1183815 (= lt!536518 (+!3898 lt!536520 lt!536507))))

(assert (=> b!1183815 (not (= (select (arr!36887 _keys!1208) from!1455) k!934))))

(declare-fun lt!536503 () Unit!39185)

(assert (=> b!1183815 (= lt!536503 e!673055)))

(declare-fun c!117084 () Bool)

(assert (=> b!1183815 (= c!117084 (= (select (arr!36887 _keys!1208) from!1455) k!934))))

(assert (=> b!1183815 e!673066))

(declare-fun res!786816 () Bool)

(assert (=> b!1183815 (=> (not res!786816) (not e!673066))))

(assert (=> b!1183815 (= res!786816 (= lt!536509 lt!536517))))

(assert (=> b!1183815 (= lt!536517 (+!3898 lt!536512 lt!536507))))

(assert (=> b!1183815 (= lt!536507 (tuple2!19201 (select (arr!36887 _keys!1208) from!1455) lt!536516))))

(declare-fun get!18873 (ValueCell!14209 V!44909) V!44909)

(assert (=> b!1183815 (= lt!536516 (get!18873 (select (arr!36888 _values!996) from!1455) lt!536514))))

(declare-fun b!1183816 () Bool)

(assert (=> b!1183816 (= e!673064 (not e!673059))))

(declare-fun res!786817 () Bool)

(assert (=> b!1183816 (=> res!786817 e!673059)))

(assert (=> b!1183816 (= res!786817 (bvsgt from!1455 i!673))))

(assert (=> b!1183816 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!536506 () Unit!39185)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76475 (_ BitVec 64) (_ BitVec 32)) Unit!39185)

(assert (=> b!1183816 (= lt!536506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46583 () Bool)

(declare-fun mapRes!46583 () Bool)

(declare-fun tp!88635 () Bool)

(assert (=> mapNonEmpty!46583 (= mapRes!46583 (and tp!88635 e!673061))))

(declare-fun mapRest!46583 () (Array (_ BitVec 32) ValueCell!14209))

(declare-fun mapValue!46583 () ValueCell!14209)

(declare-fun mapKey!46583 () (_ BitVec 32))

(assert (=> mapNonEmpty!46583 (= (arr!36888 _values!996) (store mapRest!46583 mapKey!46583 mapValue!46583))))

(declare-fun b!1183817 () Bool)

(assert (=> b!1183817 (= e!673063 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183818 () Bool)

(declare-fun res!786823 () Bool)

(assert (=> b!1183818 (=> (not res!786823) (not e!673062))))

(assert (=> b!1183818 (= res!786823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183819 () Bool)

(assert (=> b!1183819 (= e!673056 e!673057)))

(declare-fun res!786814 () Bool)

(assert (=> b!1183819 (=> res!786814 e!673057)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183819 (= res!786814 (not (validKeyInArray!0 (select (arr!36887 _keys!1208) from!1455))))))

(assert (=> b!1183819 (= lt!536510 lt!536512)))

(assert (=> b!1183819 (= lt!536512 (-!1635 lt!536520 k!934))))

(assert (=> b!1183819 (= lt!536510 (getCurrentListMapNoExtraKeys!5050 lt!536505 lt!536511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183819 (= lt!536520 (getCurrentListMapNoExtraKeys!5050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536502 () Unit!39185)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!855 (array!76475 array!76477 (_ BitVec 32) (_ BitVec 32) V!44909 V!44909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39185)

(assert (=> b!1183819 (= lt!536502 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!855 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46583 () Bool)

(assert (=> mapIsEmpty!46583 mapRes!46583))

(declare-fun b!1183820 () Bool)

(declare-fun e!673065 () Bool)

(assert (=> b!1183820 (= e!673065 tp_is_empty!29837)))

(declare-fun res!786818 () Bool)

(assert (=> start!99728 (=> (not res!786818) (not e!673062))))

(assert (=> start!99728 (= res!786818 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37423 _keys!1208))))))

(assert (=> start!99728 e!673062))

(assert (=> start!99728 tp_is_empty!29837))

(declare-fun array_inv!28154 (array!76475) Bool)

(assert (=> start!99728 (array_inv!28154 _keys!1208)))

(assert (=> start!99728 true))

(assert (=> start!99728 tp!88634))

(declare-fun e!673060 () Bool)

(declare-fun array_inv!28155 (array!76477) Bool)

(assert (=> start!99728 (and (array_inv!28155 _values!996) e!673060)))

(declare-fun b!1183821 () Bool)

(assert (=> b!1183821 (= e!673060 (and e!673065 mapRes!46583))))

(declare-fun condMapEmpty!46583 () Bool)

(declare-fun mapDefault!46583 () ValueCell!14209)

