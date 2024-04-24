; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101694 () Bool)

(assert start!101694)

(declare-fun b_free!26275 () Bool)

(declare-fun b_next!26275 () Bool)

(assert (=> start!101694 (= b_free!26275 (not b_next!26275))))

(declare-fun tp!91858 () Bool)

(declare-fun b_and!43741 () Bool)

(assert (=> start!101694 (= tp!91858 b_and!43741)))

(declare-fun b!1220597 () Bool)

(declare-fun e!693147 () Bool)

(declare-fun e!693142 () Bool)

(assert (=> b!1220597 (= e!693147 e!693142)))

(declare-fun res!810325 () Bool)

(assert (=> b!1220597 (=> res!810325 e!693142)))

(declare-datatypes ((array!78775 0))(
  ( (array!78776 (arr!38012 (Array (_ BitVec 32) (_ BitVec 64))) (size!38549 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78775)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220597 (= res!810325 (not (= (select (arr!38012 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!48355 () Bool)

(declare-fun mapRes!48355 () Bool)

(declare-fun tp!91859 () Bool)

(declare-fun e!693148 () Bool)

(assert (=> mapNonEmpty!48355 (= mapRes!48355 (and tp!91859 e!693148))))

(declare-fun mapKey!48355 () (_ BitVec 32))

(declare-datatypes ((V!46433 0))(
  ( (V!46434 (val!15546 Int)) )
))
(declare-datatypes ((ValueCell!14780 0))(
  ( (ValueCellFull!14780 (v!18199 V!46433)) (EmptyCell!14780) )
))
(declare-fun mapValue!48355 () ValueCell!14780)

(declare-fun mapRest!48355 () (Array (_ BitVec 32) ValueCell!14780))

(declare-datatypes ((array!78777 0))(
  ( (array!78778 (arr!38013 (Array (_ BitVec 32) ValueCell!14780)) (size!38550 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78777)

(assert (=> mapNonEmpty!48355 (= (arr!38013 _values!996) (store mapRest!48355 mapKey!48355 mapValue!48355))))

(declare-fun b!1220598 () Bool)

(declare-fun e!693151 () Bool)

(declare-fun tp_is_empty!30979 () Bool)

(assert (=> b!1220598 (= e!693151 tp_is_empty!30979)))

(declare-fun b!1220599 () Bool)

(declare-fun res!810326 () Bool)

(declare-fun e!693141 () Bool)

(assert (=> b!1220599 (=> (not res!810326) (not e!693141))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78775 (_ BitVec 32)) Bool)

(assert (=> b!1220599 (= res!810326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220600 () Bool)

(declare-fun res!810334 () Bool)

(declare-fun e!693149 () Bool)

(assert (=> b!1220600 (=> (not res!810334) (not e!693149))))

(declare-fun lt!554838 () array!78775)

(declare-datatypes ((List!26824 0))(
  ( (Nil!26821) (Cons!26820 (h!28038 (_ BitVec 64)) (t!40071 List!26824)) )
))
(declare-fun arrayNoDuplicates!0 (array!78775 (_ BitVec 32) List!26824) Bool)

(assert (=> b!1220600 (= res!810334 (arrayNoDuplicates!0 lt!554838 #b00000000000000000000000000000000 Nil!26821))))

(declare-fun res!810338 () Bool)

(assert (=> start!101694 (=> (not res!810338) (not e!693141))))

(assert (=> start!101694 (= res!810338 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38549 _keys!1208))))))

(assert (=> start!101694 e!693141))

(assert (=> start!101694 tp_is_empty!30979))

(declare-fun array_inv!29000 (array!78775) Bool)

(assert (=> start!101694 (array_inv!29000 _keys!1208)))

(assert (=> start!101694 true))

(assert (=> start!101694 tp!91858))

(declare-fun e!693146 () Bool)

(declare-fun array_inv!29001 (array!78777) Bool)

(assert (=> start!101694 (and (array_inv!29001 _values!996) e!693146)))

(declare-fun mapIsEmpty!48355 () Bool)

(assert (=> mapIsEmpty!48355 mapRes!48355))

(declare-fun b!1220601 () Bool)

(declare-fun e!693145 () Bool)

(declare-fun e!693150 () Bool)

(assert (=> b!1220601 (= e!693145 e!693150)))

(declare-fun res!810323 () Bool)

(assert (=> b!1220601 (=> res!810323 e!693150)))

(assert (=> b!1220601 (= res!810323 (not (= (select (arr!38012 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220601 e!693147))

(declare-fun res!810328 () Bool)

(assert (=> b!1220601 (=> (not res!810328) (not e!693147))))

(declare-datatypes ((tuple2!20014 0))(
  ( (tuple2!20015 (_1!10018 (_ BitVec 64)) (_2!10018 V!46433)) )
))
(declare-datatypes ((List!26825 0))(
  ( (Nil!26822) (Cons!26821 (h!28039 tuple2!20014) (t!40072 List!26825)) )
))
(declare-datatypes ((ListLongMap!17991 0))(
  ( (ListLongMap!17992 (toList!9011 List!26825)) )
))
(declare-fun lt!554840 () ListLongMap!17991)

(declare-fun lt!554843 () ListLongMap!17991)

(declare-fun lt!554837 () V!46433)

(declare-fun +!4121 (ListLongMap!17991 tuple2!20014) ListLongMap!17991)

(declare-fun get!19425 (ValueCell!14780 V!46433) V!46433)

(assert (=> b!1220601 (= res!810328 (= lt!554840 (+!4121 lt!554843 (tuple2!20015 (select (arr!38012 _keys!1208) from!1455) (get!19425 (select (arr!38013 _values!996) from!1455) lt!554837)))))))

(declare-fun b!1220602 () Bool)

(declare-fun e!693143 () Bool)

(assert (=> b!1220602 (= e!693143 e!693145)))

(declare-fun res!810324 () Bool)

(assert (=> b!1220602 (=> res!810324 e!693145)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220602 (= res!810324 (not (validKeyInArray!0 (select (arr!38012 _keys!1208) from!1455))))))

(declare-fun lt!554846 () ListLongMap!17991)

(assert (=> b!1220602 (= lt!554846 lt!554843)))

(declare-fun lt!554847 () ListLongMap!17991)

(declare-fun -!1898 (ListLongMap!17991 (_ BitVec 64)) ListLongMap!17991)

(assert (=> b!1220602 (= lt!554843 (-!1898 lt!554847 k0!934))))

(declare-fun zeroValue!944 () V!46433)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!554839 () array!78777)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46433)

(declare-fun getCurrentListMapNoExtraKeys!5467 (array!78775 array!78777 (_ BitVec 32) (_ BitVec 32) V!46433 V!46433 (_ BitVec 32) Int) ListLongMap!17991)

(assert (=> b!1220602 (= lt!554846 (getCurrentListMapNoExtraKeys!5467 lt!554838 lt!554839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220602 (= lt!554847 (getCurrentListMapNoExtraKeys!5467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40380 0))(
  ( (Unit!40381) )
))
(declare-fun lt!554842 () Unit!40380)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1113 (array!78775 array!78777 (_ BitVec 32) (_ BitVec 32) V!46433 V!46433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40380)

(assert (=> b!1220602 (= lt!554842 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220603 () Bool)

(declare-fun res!810330 () Bool)

(assert (=> b!1220603 (=> (not res!810330) (not e!693141))))

(assert (=> b!1220603 (= res!810330 (= (select (arr!38012 _keys!1208) i!673) k0!934))))

(declare-fun b!1220604 () Bool)

(declare-fun arrayContainsKey!0 (array!78775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220604 (= e!693142 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220605 () Bool)

(declare-fun e!693144 () Bool)

(assert (=> b!1220605 (= e!693149 (not e!693144))))

(declare-fun res!810336 () Bool)

(assert (=> b!1220605 (=> res!810336 e!693144)))

(assert (=> b!1220605 (= res!810336 (bvsgt from!1455 i!673))))

(assert (=> b!1220605 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554844 () Unit!40380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78775 (_ BitVec 64) (_ BitVec 32)) Unit!40380)

(assert (=> b!1220605 (= lt!554844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220606 () Bool)

(declare-fun res!810333 () Bool)

(assert (=> b!1220606 (=> (not res!810333) (not e!693141))))

(assert (=> b!1220606 (= res!810333 (and (= (size!38550 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38549 _keys!1208) (size!38550 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220607 () Bool)

(assert (=> b!1220607 (= e!693146 (and e!693151 mapRes!48355))))

(declare-fun condMapEmpty!48355 () Bool)

(declare-fun mapDefault!48355 () ValueCell!14780)

(assert (=> b!1220607 (= condMapEmpty!48355 (= (arr!38013 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14780)) mapDefault!48355)))))

(declare-fun b!1220608 () Bool)

(declare-fun res!810331 () Bool)

(assert (=> b!1220608 (=> (not res!810331) (not e!693141))))

(assert (=> b!1220608 (= res!810331 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26821))))

(declare-fun b!1220609 () Bool)

(assert (=> b!1220609 (= e!693148 tp_is_empty!30979)))

(declare-fun b!1220610 () Bool)

(assert (=> b!1220610 (= e!693144 e!693143)))

(declare-fun res!810335 () Bool)

(assert (=> b!1220610 (=> res!810335 e!693143)))

(assert (=> b!1220610 (= res!810335 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1220610 (= lt!554840 (getCurrentListMapNoExtraKeys!5467 lt!554838 lt!554839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220610 (= lt!554839 (array!78778 (store (arr!38013 _values!996) i!673 (ValueCellFull!14780 lt!554837)) (size!38550 _values!996)))))

(declare-fun dynLambda!3369 (Int (_ BitVec 64)) V!46433)

(assert (=> b!1220610 (= lt!554837 (dynLambda!3369 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554841 () ListLongMap!17991)

(assert (=> b!1220610 (= lt!554841 (getCurrentListMapNoExtraKeys!5467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220611 () Bool)

(assert (=> b!1220611 (= e!693150 true)))

(assert (=> b!1220611 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554845 () Unit!40380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78775 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40380)

(assert (=> b!1220611 (= lt!554845 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220612 () Bool)

(declare-fun res!810332 () Bool)

(assert (=> b!1220612 (=> (not res!810332) (not e!693141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220612 (= res!810332 (validMask!0 mask!1564))))

(declare-fun b!1220613 () Bool)

(declare-fun res!810329 () Bool)

(assert (=> b!1220613 (=> (not res!810329) (not e!693141))))

(assert (=> b!1220613 (= res!810329 (validKeyInArray!0 k0!934))))

(declare-fun b!1220614 () Bool)

(assert (=> b!1220614 (= e!693141 e!693149)))

(declare-fun res!810327 () Bool)

(assert (=> b!1220614 (=> (not res!810327) (not e!693149))))

(assert (=> b!1220614 (= res!810327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554838 mask!1564))))

(assert (=> b!1220614 (= lt!554838 (array!78776 (store (arr!38012 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38549 _keys!1208)))))

(declare-fun b!1220615 () Bool)

(declare-fun res!810337 () Bool)

(assert (=> b!1220615 (=> (not res!810337) (not e!693141))))

(assert (=> b!1220615 (= res!810337 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38549 _keys!1208))))))

(assert (= (and start!101694 res!810338) b!1220612))

(assert (= (and b!1220612 res!810332) b!1220606))

(assert (= (and b!1220606 res!810333) b!1220599))

(assert (= (and b!1220599 res!810326) b!1220608))

(assert (= (and b!1220608 res!810331) b!1220615))

(assert (= (and b!1220615 res!810337) b!1220613))

(assert (= (and b!1220613 res!810329) b!1220603))

(assert (= (and b!1220603 res!810330) b!1220614))

(assert (= (and b!1220614 res!810327) b!1220600))

(assert (= (and b!1220600 res!810334) b!1220605))

(assert (= (and b!1220605 (not res!810336)) b!1220610))

(assert (= (and b!1220610 (not res!810335)) b!1220602))

(assert (= (and b!1220602 (not res!810324)) b!1220601))

(assert (= (and b!1220601 res!810328) b!1220597))

(assert (= (and b!1220597 (not res!810325)) b!1220604))

(assert (= (and b!1220601 (not res!810323)) b!1220611))

(assert (= (and b!1220607 condMapEmpty!48355) mapIsEmpty!48355))

(assert (= (and b!1220607 (not condMapEmpty!48355)) mapNonEmpty!48355))

(get-info :version)

(assert (= (and mapNonEmpty!48355 ((_ is ValueCellFull!14780) mapValue!48355)) b!1220609))

(assert (= (and b!1220607 ((_ is ValueCellFull!14780) mapDefault!48355)) b!1220598))

(assert (= start!101694 b!1220607))

(declare-fun b_lambda!22097 () Bool)

(assert (=> (not b_lambda!22097) (not b!1220610)))

(declare-fun t!40070 () Bool)

(declare-fun tb!11067 () Bool)

(assert (=> (and start!101694 (= defaultEntry!1004 defaultEntry!1004) t!40070) tb!11067))

(declare-fun result!22747 () Bool)

(assert (=> tb!11067 (= result!22747 tp_is_empty!30979)))

(assert (=> b!1220610 t!40070))

(declare-fun b_and!43743 () Bool)

(assert (= b_and!43741 (and (=> t!40070 result!22747) b_and!43743)))

(declare-fun m!1125683 () Bool)

(assert (=> b!1220599 m!1125683))

(declare-fun m!1125685 () Bool)

(assert (=> b!1220602 m!1125685))

(declare-fun m!1125687 () Bool)

(assert (=> b!1220602 m!1125687))

(declare-fun m!1125689 () Bool)

(assert (=> b!1220602 m!1125689))

(declare-fun m!1125691 () Bool)

(assert (=> b!1220602 m!1125691))

(declare-fun m!1125693 () Bool)

(assert (=> b!1220602 m!1125693))

(declare-fun m!1125695 () Bool)

(assert (=> b!1220602 m!1125695))

(assert (=> b!1220602 m!1125693))

(declare-fun m!1125697 () Bool)

(assert (=> b!1220605 m!1125697))

(declare-fun m!1125699 () Bool)

(assert (=> b!1220605 m!1125699))

(declare-fun m!1125701 () Bool)

(assert (=> b!1220612 m!1125701))

(declare-fun m!1125703 () Bool)

(assert (=> b!1220604 m!1125703))

(declare-fun m!1125705 () Bool)

(assert (=> mapNonEmpty!48355 m!1125705))

(declare-fun m!1125707 () Bool)

(assert (=> b!1220608 m!1125707))

(declare-fun m!1125709 () Bool)

(assert (=> b!1220610 m!1125709))

(declare-fun m!1125711 () Bool)

(assert (=> b!1220610 m!1125711))

(declare-fun m!1125713 () Bool)

(assert (=> b!1220610 m!1125713))

(declare-fun m!1125715 () Bool)

(assert (=> b!1220610 m!1125715))

(declare-fun m!1125717 () Bool)

(assert (=> b!1220600 m!1125717))

(assert (=> b!1220597 m!1125693))

(assert (=> b!1220601 m!1125693))

(declare-fun m!1125719 () Bool)

(assert (=> b!1220601 m!1125719))

(assert (=> b!1220601 m!1125719))

(declare-fun m!1125721 () Bool)

(assert (=> b!1220601 m!1125721))

(declare-fun m!1125723 () Bool)

(assert (=> b!1220601 m!1125723))

(declare-fun m!1125725 () Bool)

(assert (=> start!101694 m!1125725))

(declare-fun m!1125727 () Bool)

(assert (=> start!101694 m!1125727))

(declare-fun m!1125729 () Bool)

(assert (=> b!1220611 m!1125729))

(declare-fun m!1125731 () Bool)

(assert (=> b!1220611 m!1125731))

(declare-fun m!1125733 () Bool)

(assert (=> b!1220613 m!1125733))

(declare-fun m!1125735 () Bool)

(assert (=> b!1220603 m!1125735))

(declare-fun m!1125737 () Bool)

(assert (=> b!1220614 m!1125737))

(declare-fun m!1125739 () Bool)

(assert (=> b!1220614 m!1125739))

(check-sat (not b!1220612) tp_is_empty!30979 (not b!1220601) (not b!1220604) (not start!101694) (not b!1220605) (not b!1220608) (not b!1220600) (not b_lambda!22097) (not mapNonEmpty!48355) (not b!1220599) (not b!1220610) (not b!1220614) (not b!1220602) (not b!1220611) (not b_next!26275) (not b!1220613) b_and!43743)
(check-sat b_and!43743 (not b_next!26275))
