; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10134 () Bool)

(assert start!10134)

(declare-fun b!76773 () Bool)

(declare-fun b_free!2149 () Bool)

(declare-fun b_next!2149 () Bool)

(assert (=> b!76773 (= b_free!2149 (not b_next!2149))))

(declare-fun tp!8644 () Bool)

(declare-fun b_and!4677 () Bool)

(assert (=> b!76773 (= tp!8644 b_and!4677)))

(declare-fun b!76776 () Bool)

(declare-fun b_free!2151 () Bool)

(declare-fun b_next!2151 () Bool)

(assert (=> b!76776 (= b_free!2151 (not b_next!2151))))

(declare-fun tp!8645 () Bool)

(declare-fun b_and!4679 () Bool)

(assert (=> b!76776 (= tp!8645 b_and!4679)))

(declare-fun b!76767 () Bool)

(declare-fun res!40386 () Bool)

(declare-fun e!50115 () Bool)

(assert (=> b!76767 (=> (not res!40386) (not e!50115))))

(declare-datatypes ((V!2969 0))(
  ( (V!2970 (val!1290 Int)) )
))
(declare-datatypes ((array!3913 0))(
  ( (array!3914 (arr!1864 (Array (_ BitVec 32) (_ BitVec 64))) (size!2106 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!902 0))(
  ( (ValueCellFull!902 (v!2564 V!2969)) (EmptyCell!902) )
))
(declare-datatypes ((array!3915 0))(
  ( (array!3916 (arr!1865 (Array (_ BitVec 32) ValueCell!902)) (size!2107 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!712 0))(
  ( (LongMapFixedSize!713 (defaultEntry!2259 Int) (mask!6247 (_ BitVec 32)) (extraKeys!2110 (_ BitVec 32)) (zeroValue!2157 V!2969) (minValue!2157 V!2969) (_size!405 (_ BitVec 32)) (_keys!3918 array!3913) (_values!2242 array!3915) (_vacant!405 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!712)

(declare-fun valid!312 (LongMapFixedSize!712) Bool)

(assert (=> b!76767 (= res!40386 (valid!312 newMap!16))))

(declare-fun mapNonEmpty!3239 () Bool)

(declare-fun mapRes!3240 () Bool)

(declare-fun tp!8646 () Bool)

(declare-fun e!50124 () Bool)

(assert (=> mapNonEmpty!3239 (= mapRes!3240 (and tp!8646 e!50124))))

(declare-fun mapValue!3239 () ValueCell!902)

(declare-fun mapKey!3239 () (_ BitVec 32))

(declare-fun mapRest!3239 () (Array (_ BitVec 32) ValueCell!902))

(assert (=> mapNonEmpty!3239 (= (arr!1865 (_values!2242 newMap!16)) (store mapRest!3239 mapKey!3239 mapValue!3239))))

(declare-fun b!76768 () Bool)

(declare-datatypes ((Unit!2215 0))(
  ( (Unit!2216) )
))
(declare-fun e!50117 () Unit!2215)

(declare-fun Unit!2217 () Unit!2215)

(assert (=> b!76768 (= e!50117 Unit!2217)))

(declare-fun lt!35043 () Unit!2215)

(declare-datatypes ((Cell!508 0))(
  ( (Cell!509 (v!2565 LongMapFixedSize!712)) )
))
(declare-datatypes ((LongMap!508 0))(
  ( (LongMap!509 (underlying!265 Cell!508)) )
))
(declare-fun thiss!992 () LongMap!508)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!55 (array!3913 array!3915 (_ BitVec 32) (_ BitVec 32) V!2969 V!2969 (_ BitVec 64) (_ BitVec 32) Int) Unit!2215)

(assert (=> b!76768 (= lt!35043 (lemmaListMapContainsThenArrayContainsFrom!55 (_keys!3918 (v!2565 (underlying!265 thiss!992))) (_values!2242 (v!2565 (underlying!265 thiss!992))) (mask!6247 (v!2565 (underlying!265 thiss!992))) (extraKeys!2110 (v!2565 (underlying!265 thiss!992))) (zeroValue!2157 (v!2565 (underlying!265 thiss!992))) (minValue!2157 (v!2565 (underlying!265 thiss!992))) (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2259 (v!2565 (underlying!265 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!76768 (arrayContainsKey!0 (_keys!3918 (v!2565 (underlying!265 thiss!992))) (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35041 () Unit!2215)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3913 (_ BitVec 32) (_ BitVec 32)) Unit!2215)

(assert (=> b!76768 (= lt!35041 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3918 (v!2565 (underlying!265 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1499 0))(
  ( (Nil!1496) (Cons!1495 (h!2083 (_ BitVec 64)) (t!5100 List!1499)) )
))
(declare-fun arrayNoDuplicates!0 (array!3913 (_ BitVec 32) List!1499) Bool)

(assert (=> b!76768 (arrayNoDuplicates!0 (_keys!3918 (v!2565 (underlying!265 thiss!992))) from!355 Nil!1496)))

(declare-fun lt!35045 () Unit!2215)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3913 (_ BitVec 32) (_ BitVec 64) List!1499) Unit!2215)

(assert (=> b!76768 (= lt!35045 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3918 (v!2565 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) (Cons!1495 (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) Nil!1496)))))

(assert (=> b!76768 false))

(declare-fun b!76769 () Bool)

(declare-fun res!40379 () Bool)

(assert (=> b!76769 (=> (not res!40379) (not e!50115))))

(assert (=> b!76769 (= res!40379 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6247 newMap!16)) (_size!405 (v!2565 (underlying!265 thiss!992)))))))

(declare-fun b!76770 () Bool)

(declare-fun e!50127 () Bool)

(assert (=> b!76770 (= e!50115 e!50127)))

(declare-fun res!40384 () Bool)

(assert (=> b!76770 (=> (not res!40384) (not e!50127))))

(declare-datatypes ((tuple2!2150 0))(
  ( (tuple2!2151 (_1!1086 (_ BitVec 64)) (_2!1086 V!2969)) )
))
(declare-datatypes ((List!1500 0))(
  ( (Nil!1497) (Cons!1496 (h!2084 tuple2!2150) (t!5101 List!1500)) )
))
(declare-datatypes ((ListLongMap!1421 0))(
  ( (ListLongMap!1422 (toList!726 List!1500)) )
))
(declare-fun lt!35046 () ListLongMap!1421)

(declare-fun lt!35047 () ListLongMap!1421)

(assert (=> b!76770 (= res!40384 (= lt!35046 lt!35047))))

(declare-fun map!1162 (LongMapFixedSize!712) ListLongMap!1421)

(assert (=> b!76770 (= lt!35047 (map!1162 newMap!16))))

(declare-fun getCurrentListMap!416 (array!3913 array!3915 (_ BitVec 32) (_ BitVec 32) V!2969 V!2969 (_ BitVec 32) Int) ListLongMap!1421)

(assert (=> b!76770 (= lt!35046 (getCurrentListMap!416 (_keys!3918 (v!2565 (underlying!265 thiss!992))) (_values!2242 (v!2565 (underlying!265 thiss!992))) (mask!6247 (v!2565 (underlying!265 thiss!992))) (extraKeys!2110 (v!2565 (underlying!265 thiss!992))) (zeroValue!2157 (v!2565 (underlying!265 thiss!992))) (minValue!2157 (v!2565 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2259 (v!2565 (underlying!265 thiss!992)))))))

(declare-fun b!76771 () Bool)

(declare-fun res!40385 () Bool)

(declare-fun e!50125 () Bool)

(assert (=> b!76771 (=> res!40385 e!50125)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3913 (_ BitVec 32)) Bool)

(assert (=> b!76771 (= res!40385 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3918 (v!2565 (underlying!265 thiss!992))) (mask!6247 (v!2565 (underlying!265 thiss!992))))))))

(declare-fun mapNonEmpty!3240 () Bool)

(declare-fun mapRes!3239 () Bool)

(declare-fun tp!8643 () Bool)

(declare-fun e!50118 () Bool)

(assert (=> mapNonEmpty!3240 (= mapRes!3239 (and tp!8643 e!50118))))

(declare-fun mapKey!3240 () (_ BitVec 32))

(declare-fun mapValue!3240 () ValueCell!902)

(declare-fun mapRest!3240 () (Array (_ BitVec 32) ValueCell!902))

(assert (=> mapNonEmpty!3240 (= (arr!1865 (_values!2242 (v!2565 (underlying!265 thiss!992)))) (store mapRest!3240 mapKey!3240 mapValue!3240))))

(declare-fun b!76772 () Bool)

(declare-fun tp_is_empty!2491 () Bool)

(assert (=> b!76772 (= e!50118 tp_is_empty!2491)))

(declare-fun e!50122 () Bool)

(declare-fun e!50123 () Bool)

(declare-fun array_inv!1169 (array!3913) Bool)

(declare-fun array_inv!1170 (array!3915) Bool)

(assert (=> b!76773 (= e!50123 (and tp!8644 tp_is_empty!2491 (array_inv!1169 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) (array_inv!1170 (_values!2242 (v!2565 (underlying!265 thiss!992)))) e!50122))))

(declare-fun b!76774 () Bool)

(declare-fun res!40383 () Bool)

(assert (=> b!76774 (=> res!40383 e!50125)))

(assert (=> b!76774 (= res!40383 (not (arrayNoDuplicates!0 (_keys!3918 (v!2565 (underlying!265 thiss!992))) #b00000000000000000000000000000000 Nil!1496)))))

(declare-fun b!76775 () Bool)

(declare-fun e!50126 () Bool)

(assert (=> b!76775 (= e!50126 (not e!50125))))

(declare-fun res!40376 () Bool)

(assert (=> b!76775 (=> res!40376 e!50125)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!76775 (= res!40376 (not (validMask!0 (mask!6247 (v!2565 (underlying!265 thiss!992))))))))

(declare-fun lt!35040 () ListLongMap!1421)

(declare-fun lt!35048 () tuple2!2150)

(declare-fun lt!35044 () tuple2!2150)

(declare-fun +!98 (ListLongMap!1421 tuple2!2150) ListLongMap!1421)

(assert (=> b!76775 (= (+!98 (+!98 lt!35040 lt!35048) lt!35044) (+!98 (+!98 lt!35040 lt!35044) lt!35048))))

(assert (=> b!76775 (= lt!35044 (tuple2!2151 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2157 (v!2565 (underlying!265 thiss!992)))))))

(declare-fun lt!35037 () V!2969)

(assert (=> b!76775 (= lt!35048 (tuple2!2151 (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) lt!35037))))

(declare-fun lt!35042 () Unit!2215)

(declare-fun addCommutativeForDiffKeys!17 (ListLongMap!1421 (_ BitVec 64) V!2969 (_ BitVec 64) V!2969) Unit!2215)

(assert (=> b!76775 (= lt!35042 (addCommutativeForDiffKeys!17 lt!35040 (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) lt!35037 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2157 (v!2565 (underlying!265 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!62 (array!3913 array!3915 (_ BitVec 32) (_ BitVec 32) V!2969 V!2969 (_ BitVec 32) Int) ListLongMap!1421)

(assert (=> b!76775 (= lt!35040 (getCurrentListMapNoExtraKeys!62 (_keys!3918 (v!2565 (underlying!265 thiss!992))) (_values!2242 (v!2565 (underlying!265 thiss!992))) (mask!6247 (v!2565 (underlying!265 thiss!992))) (extraKeys!2110 (v!2565 (underlying!265 thiss!992))) (zeroValue!2157 (v!2565 (underlying!265 thiss!992))) (minValue!2157 (v!2565 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2259 (v!2565 (underlying!265 thiss!992)))))))

(declare-fun e!50129 () Bool)

(declare-fun e!50131 () Bool)

(assert (=> b!76776 (= e!50131 (and tp!8645 tp_is_empty!2491 (array_inv!1169 (_keys!3918 newMap!16)) (array_inv!1170 (_values!2242 newMap!16)) e!50129))))

(declare-fun b!76777 () Bool)

(declare-fun Unit!2218 () Unit!2215)

(assert (=> b!76777 (= e!50117 Unit!2218)))

(declare-fun b!76778 () Bool)

(declare-fun res!40378 () Bool)

(assert (=> b!76778 (=> res!40378 e!50125)))

(assert (=> b!76778 (= res!40378 (or (not (= (size!2107 (_values!2242 (v!2565 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6247 (v!2565 (underlying!265 thiss!992)))))) (not (= (size!2106 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) (size!2107 (_values!2242 (v!2565 (underlying!265 thiss!992)))))) (bvslt (mask!6247 (v!2565 (underlying!265 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2110 (v!2565 (underlying!265 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2110 (v!2565 (underlying!265 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!76779 () Bool)

(declare-fun e!50119 () Bool)

(assert (=> b!76779 (= e!50127 e!50119)))

(declare-fun res!40380 () Bool)

(assert (=> b!76779 (=> (not res!40380) (not e!50119))))

(assert (=> b!76779 (= res!40380 (and (not (= (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1163 (ValueCell!902 V!2969) V!2969)

(declare-fun dynLambda!331 (Int (_ BitVec 64)) V!2969)

(assert (=> b!76779 (= lt!35037 (get!1163 (select (arr!1865 (_values!2242 (v!2565 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2259 (v!2565 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76780 () Bool)

(assert (=> b!76780 (= e!50124 tp_is_empty!2491)))

(declare-fun b!76781 () Bool)

(assert (=> b!76781 (= e!50119 e!50126)))

(declare-fun res!40377 () Bool)

(assert (=> b!76781 (=> (not res!40377) (not e!50126))))

(declare-datatypes ((tuple2!2152 0))(
  ( (tuple2!2153 (_1!1087 Bool) (_2!1087 LongMapFixedSize!712)) )
))
(declare-fun lt!35038 () tuple2!2152)

(assert (=> b!76781 (= res!40377 (and (_1!1087 lt!35038) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35039 () Unit!2215)

(assert (=> b!76781 (= lt!35039 e!50117)))

(declare-fun c!11741 () Bool)

(declare-fun contains!731 (ListLongMap!1421 (_ BitVec 64)) Bool)

(assert (=> b!76781 (= c!11741 (contains!731 lt!35047 (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355)))))

(declare-fun update!109 (LongMapFixedSize!712 (_ BitVec 64) V!2969) tuple2!2152)

(assert (=> b!76781 (= lt!35038 (update!109 newMap!16 (select (arr!1864 (_keys!3918 (v!2565 (underlying!265 thiss!992)))) from!355) lt!35037))))

(declare-fun b!76782 () Bool)

(declare-fun e!50121 () Bool)

(assert (=> b!76782 (= e!50122 (and e!50121 mapRes!3239))))

(declare-fun condMapEmpty!3239 () Bool)

(declare-fun mapDefault!3240 () ValueCell!902)

(assert (=> b!76782 (= condMapEmpty!3239 (= (arr!1865 (_values!2242 (v!2565 (underlying!265 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!902)) mapDefault!3240)))))

(declare-fun res!40381 () Bool)

(assert (=> start!10134 (=> (not res!40381) (not e!50115))))

(declare-fun valid!313 (LongMap!508) Bool)

(assert (=> start!10134 (= res!40381 (valid!313 thiss!992))))

(assert (=> start!10134 e!50115))

(declare-fun e!50128 () Bool)

(assert (=> start!10134 e!50128))

(assert (=> start!10134 true))

(assert (=> start!10134 e!50131))

(declare-fun b!76783 () Bool)

(declare-fun e!50114 () Bool)

(assert (=> b!76783 (= e!50128 e!50114)))

(declare-fun b!76784 () Bool)

(declare-fun e!50120 () Bool)

(assert (=> b!76784 (= e!50129 (and e!50120 mapRes!3240))))

(declare-fun condMapEmpty!3240 () Bool)

(declare-fun mapDefault!3239 () ValueCell!902)

(assert (=> b!76784 (= condMapEmpty!3240 (= (arr!1865 (_values!2242 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!902)) mapDefault!3239)))))

(declare-fun b!76785 () Bool)

(assert (=> b!76785 (= e!50121 tp_is_empty!2491)))

(declare-fun b!76786 () Bool)

(declare-fun res!40382 () Bool)

(assert (=> b!76786 (=> (not res!40382) (not e!50115))))

(assert (=> b!76786 (= res!40382 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2106 (_keys!3918 (v!2565 (underlying!265 thiss!992)))))))))

(declare-fun b!76787 () Bool)

(assert (=> b!76787 (= e!50114 e!50123)))

(declare-fun mapIsEmpty!3239 () Bool)

(assert (=> mapIsEmpty!3239 mapRes!3240))

(declare-fun b!76788 () Bool)

(assert (=> b!76788 (= e!50120 tp_is_empty!2491)))

(declare-fun b!76789 () Bool)

(assert (=> b!76789 (= e!50125 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!3240 () Bool)

(assert (=> mapIsEmpty!3240 mapRes!3239))

(assert (= (and start!10134 res!40381) b!76786))

(assert (= (and b!76786 res!40382) b!76767))

(assert (= (and b!76767 res!40386) b!76769))

(assert (= (and b!76769 res!40379) b!76770))

(assert (= (and b!76770 res!40384) b!76779))

(assert (= (and b!76779 res!40380) b!76781))

(assert (= (and b!76781 c!11741) b!76768))

(assert (= (and b!76781 (not c!11741)) b!76777))

(assert (= (and b!76781 res!40377) b!76775))

(assert (= (and b!76775 (not res!40376)) b!76778))

(assert (= (and b!76778 (not res!40378)) b!76771))

(assert (= (and b!76771 (not res!40385)) b!76774))

(assert (= (and b!76774 (not res!40383)) b!76789))

(assert (= (and b!76782 condMapEmpty!3239) mapIsEmpty!3240))

(assert (= (and b!76782 (not condMapEmpty!3239)) mapNonEmpty!3240))

(get-info :version)

(assert (= (and mapNonEmpty!3240 ((_ is ValueCellFull!902) mapValue!3240)) b!76772))

(assert (= (and b!76782 ((_ is ValueCellFull!902) mapDefault!3240)) b!76785))

(assert (= b!76773 b!76782))

(assert (= b!76787 b!76773))

(assert (= b!76783 b!76787))

(assert (= start!10134 b!76783))

(assert (= (and b!76784 condMapEmpty!3240) mapIsEmpty!3239))

(assert (= (and b!76784 (not condMapEmpty!3240)) mapNonEmpty!3239))

(assert (= (and mapNonEmpty!3239 ((_ is ValueCellFull!902) mapValue!3239)) b!76780))

(assert (= (and b!76784 ((_ is ValueCellFull!902) mapDefault!3239)) b!76788))

(assert (= b!76776 b!76784))

(assert (= start!10134 b!76776))

(declare-fun b_lambda!3437 () Bool)

(assert (=> (not b_lambda!3437) (not b!76779)))

(declare-fun t!5097 () Bool)

(declare-fun tb!1573 () Bool)

(assert (=> (and b!76773 (= (defaultEntry!2259 (v!2565 (underlying!265 thiss!992))) (defaultEntry!2259 (v!2565 (underlying!265 thiss!992)))) t!5097) tb!1573))

(declare-fun result!2745 () Bool)

(assert (=> tb!1573 (= result!2745 tp_is_empty!2491)))

(assert (=> b!76779 t!5097))

(declare-fun b_and!4681 () Bool)

(assert (= b_and!4677 (and (=> t!5097 result!2745) b_and!4681)))

(declare-fun t!5099 () Bool)

(declare-fun tb!1575 () Bool)

(assert (=> (and b!76776 (= (defaultEntry!2259 newMap!16) (defaultEntry!2259 (v!2565 (underlying!265 thiss!992)))) t!5099) tb!1575))

(declare-fun result!2749 () Bool)

(assert (= result!2749 result!2745))

(assert (=> b!76779 t!5099))

(declare-fun b_and!4683 () Bool)

(assert (= b_and!4679 (and (=> t!5099 result!2749) b_and!4683)))

(declare-fun m!76645 () Bool)

(assert (=> b!76770 m!76645))

(declare-fun m!76647 () Bool)

(assert (=> b!76770 m!76647))

(declare-fun m!76649 () Bool)

(assert (=> b!76768 m!76649))

(declare-fun m!76651 () Bool)

(assert (=> b!76768 m!76651))

(declare-fun m!76653 () Bool)

(assert (=> b!76768 m!76653))

(declare-fun m!76655 () Bool)

(assert (=> b!76768 m!76655))

(assert (=> b!76768 m!76653))

(assert (=> b!76768 m!76653))

(declare-fun m!76657 () Bool)

(assert (=> b!76768 m!76657))

(assert (=> b!76768 m!76653))

(declare-fun m!76659 () Bool)

(assert (=> b!76768 m!76659))

(declare-fun m!76661 () Bool)

(assert (=> b!76774 m!76661))

(assert (=> b!76779 m!76653))

(declare-fun m!76663 () Bool)

(assert (=> b!76779 m!76663))

(declare-fun m!76665 () Bool)

(assert (=> b!76779 m!76665))

(assert (=> b!76779 m!76663))

(assert (=> b!76779 m!76665))

(declare-fun m!76667 () Bool)

(assert (=> b!76779 m!76667))

(declare-fun m!76669 () Bool)

(assert (=> start!10134 m!76669))

(declare-fun m!76671 () Bool)

(assert (=> b!76773 m!76671))

(declare-fun m!76673 () Bool)

(assert (=> b!76773 m!76673))

(declare-fun m!76675 () Bool)

(assert (=> b!76771 m!76675))

(declare-fun m!76677 () Bool)

(assert (=> mapNonEmpty!3239 m!76677))

(declare-fun m!76679 () Bool)

(assert (=> mapNonEmpty!3240 m!76679))

(declare-fun m!76681 () Bool)

(assert (=> b!76775 m!76681))

(assert (=> b!76775 m!76653))

(declare-fun m!76683 () Bool)

(assert (=> b!76775 m!76683))

(assert (=> b!76775 m!76653))

(declare-fun m!76685 () Bool)

(assert (=> b!76775 m!76685))

(assert (=> b!76775 m!76685))

(declare-fun m!76687 () Bool)

(assert (=> b!76775 m!76687))

(declare-fun m!76689 () Bool)

(assert (=> b!76775 m!76689))

(declare-fun m!76691 () Bool)

(assert (=> b!76775 m!76691))

(declare-fun m!76693 () Bool)

(assert (=> b!76775 m!76693))

(assert (=> b!76775 m!76691))

(declare-fun m!76695 () Bool)

(assert (=> b!76776 m!76695))

(declare-fun m!76697 () Bool)

(assert (=> b!76776 m!76697))

(assert (=> b!76781 m!76653))

(assert (=> b!76781 m!76653))

(declare-fun m!76699 () Bool)

(assert (=> b!76781 m!76699))

(assert (=> b!76781 m!76653))

(declare-fun m!76701 () Bool)

(assert (=> b!76781 m!76701))

(declare-fun m!76703 () Bool)

(assert (=> b!76767 m!76703))

(check-sat (not start!10134) (not mapNonEmpty!3240) b_and!4683 (not b!76767) (not b!76779) (not b!76773) (not b!76776) b_and!4681 (not b_next!2151) (not b!76771) (not b!76770) (not b!76768) (not mapNonEmpty!3239) (not b!76774) (not b_next!2149) (not b!76775) (not b!76781) (not b_lambda!3437) tp_is_empty!2491)
(check-sat b_and!4681 b_and!4683 (not b_next!2149) (not b_next!2151))
