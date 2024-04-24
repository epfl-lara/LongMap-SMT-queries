; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20956 () Bool)

(assert start!20956)

(declare-fun b_free!5545 () Bool)

(declare-fun b_next!5545 () Bool)

(assert (=> start!20956 (= b_free!5545 (not b_next!5545))))

(declare-fun tp!19685 () Bool)

(declare-fun b_and!12341 () Bool)

(assert (=> start!20956 (= tp!19685 b_and!12341)))

(declare-fun b!210528 () Bool)

(declare-fun res!102718 () Bool)

(declare-fun e!137086 () Bool)

(assert (=> b!210528 (=> (not res!102718) (not e!137086))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10007 0))(
  ( (array!10008 (arr!4751 (Array (_ BitVec 32) (_ BitVec 64))) (size!5076 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10007)

(assert (=> b!210528 (= res!102718 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5076 _keys!825))))))

(declare-fun mapNonEmpty!9188 () Bool)

(declare-fun mapRes!9188 () Bool)

(declare-fun tp!19684 () Bool)

(declare-fun e!137087 () Bool)

(assert (=> mapNonEmpty!9188 (= mapRes!9188 (and tp!19684 e!137087))))

(declare-datatypes ((V!6857 0))(
  ( (V!6858 (val!2748 Int)) )
))
(declare-datatypes ((ValueCell!2360 0))(
  ( (ValueCellFull!2360 (v!4731 V!6857)) (EmptyCell!2360) )
))
(declare-fun mapValue!9188 () ValueCell!2360)

(declare-datatypes ((array!10009 0))(
  ( (array!10010 (arr!4752 (Array (_ BitVec 32) ValueCell!2360)) (size!5077 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10009)

(declare-fun mapRest!9188 () (Array (_ BitVec 32) ValueCell!2360))

(declare-fun mapKey!9188 () (_ BitVec 32))

(assert (=> mapNonEmpty!9188 (= (arr!4752 _values!649) (store mapRest!9188 mapKey!9188 mapValue!9188))))

(declare-fun res!102719 () Bool)

(assert (=> start!20956 (=> (not res!102719) (not e!137086))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20956 (= res!102719 (validMask!0 mask!1149))))

(assert (=> start!20956 e!137086))

(declare-fun e!137088 () Bool)

(declare-fun array_inv!3117 (array!10009) Bool)

(assert (=> start!20956 (and (array_inv!3117 _values!649) e!137088)))

(assert (=> start!20956 true))

(declare-fun tp_is_empty!5407 () Bool)

(assert (=> start!20956 tp_is_empty!5407))

(declare-fun array_inv!3118 (array!10007) Bool)

(assert (=> start!20956 (array_inv!3118 _keys!825)))

(assert (=> start!20956 tp!19685))

(declare-fun b!210529 () Bool)

(assert (=> b!210529 (= e!137087 tp_is_empty!5407)))

(declare-fun mapIsEmpty!9188 () Bool)

(assert (=> mapIsEmpty!9188 mapRes!9188))

(declare-fun b!210530 () Bool)

(declare-fun e!137090 () Bool)

(assert (=> b!210530 (= e!137088 (and e!137090 mapRes!9188))))

(declare-fun condMapEmpty!9188 () Bool)

(declare-fun mapDefault!9188 () ValueCell!2360)

(assert (=> b!210530 (= condMapEmpty!9188 (= (arr!4752 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2360)) mapDefault!9188)))))

(declare-fun b!210531 () Bool)

(assert (=> b!210531 (= e!137090 tp_is_empty!5407)))

(declare-fun b!210532 () Bool)

(declare-fun res!102717 () Bool)

(assert (=> b!210532 (=> (not res!102717) (not e!137086))))

(declare-datatypes ((List!2983 0))(
  ( (Nil!2980) (Cons!2979 (h!3621 (_ BitVec 64)) (t!7912 List!2983)) )
))
(declare-fun arrayNoDuplicates!0 (array!10007 (_ BitVec 32) List!2983) Bool)

(assert (=> b!210532 (= res!102717 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2980))))

(declare-fun b!210533 () Bool)

(declare-fun e!137085 () Bool)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!210533 (= e!137085 (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4098 0))(
  ( (tuple2!4099 (_1!2060 (_ BitVec 64)) (_2!2060 V!6857)) )
))
(declare-datatypes ((List!2984 0))(
  ( (Nil!2981) (Cons!2980 (h!3622 tuple2!4098) (t!7913 List!2984)) )
))
(declare-datatypes ((ListLongMap!3013 0))(
  ( (ListLongMap!3014 (toList!1522 List!2984)) )
))
(declare-fun lt!107894 () ListLongMap!3013)

(declare-fun lt!107897 () ListLongMap!3013)

(declare-fun lt!107890 () tuple2!4098)

(declare-fun +!551 (ListLongMap!3013 tuple2!4098) ListLongMap!3013)

(assert (=> b!210533 (= lt!107894 (+!551 lt!107897 lt!107890))))

(declare-datatypes ((Unit!6382 0))(
  ( (Unit!6383) )
))
(declare-fun lt!107888 () Unit!6382)

(declare-fun lt!107893 () ListLongMap!3013)

(declare-fun v!520 () V!6857)

(declare-fun zeroValue!615 () V!6857)

(declare-fun addCommutativeForDiffKeys!201 (ListLongMap!3013 (_ BitVec 64) V!6857 (_ BitVec 64) V!6857) Unit!6382)

(assert (=> b!210533 (= lt!107888 (addCommutativeForDiffKeys!201 lt!107893 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!107889 () ListLongMap!3013)

(declare-fun lt!107891 () tuple2!4098)

(assert (=> b!210533 (= lt!107889 (+!551 lt!107894 lt!107891))))

(declare-fun lt!107886 () ListLongMap!3013)

(declare-fun lt!107896 () tuple2!4098)

(assert (=> b!210533 (= lt!107894 (+!551 lt!107886 lt!107896))))

(declare-fun lt!107887 () ListLongMap!3013)

(assert (=> b!210533 (= lt!107887 (+!551 lt!107897 lt!107891))))

(assert (=> b!210533 (= lt!107897 (+!551 lt!107893 lt!107896))))

(declare-fun lt!107892 () ListLongMap!3013)

(assert (=> b!210533 (= lt!107889 (+!551 (+!551 lt!107892 lt!107896) lt!107891))))

(declare-fun minValue!615 () V!6857)

(assert (=> b!210533 (= lt!107891 (tuple2!4099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210533 (= lt!107896 (tuple2!4099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210534 () Bool)

(declare-fun res!102716 () Bool)

(assert (=> b!210534 (=> (not res!102716) (not e!137086))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210534 (= res!102716 (and (= (size!5077 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5076 _keys!825) (size!5077 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210535 () Bool)

(declare-fun res!102714 () Bool)

(assert (=> b!210535 (=> (not res!102714) (not e!137086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10007 (_ BitVec 32)) Bool)

(assert (=> b!210535 (= res!102714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210536 () Bool)

(assert (=> b!210536 (= e!137086 (not e!137085))))

(declare-fun res!102721 () Bool)

(assert (=> b!210536 (=> res!102721 e!137085)))

(assert (=> b!210536 (= res!102721 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1061 (array!10007 array!10009 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) Int) ListLongMap!3013)

(assert (=> b!210536 (= lt!107887 (getCurrentListMap!1061 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107895 () array!10009)

(assert (=> b!210536 (= lt!107889 (getCurrentListMap!1061 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210536 (and (= lt!107892 lt!107886) (= lt!107886 lt!107892))))

(assert (=> b!210536 (= lt!107886 (+!551 lt!107893 lt!107890))))

(assert (=> b!210536 (= lt!107890 (tuple2!4099 k0!843 v!520))))

(declare-fun lt!107885 () Unit!6382)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 (array!10007 array!10009 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) (_ BitVec 64) V!6857 (_ BitVec 32) Int) Unit!6382)

(assert (=> b!210536 (= lt!107885 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!484 (array!10007 array!10009 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) Int) ListLongMap!3013)

(assert (=> b!210536 (= lt!107892 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210536 (= lt!107895 (array!10010 (store (arr!4752 _values!649) i!601 (ValueCellFull!2360 v!520)) (size!5077 _values!649)))))

(assert (=> b!210536 (= lt!107893 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210537 () Bool)

(declare-fun res!102720 () Bool)

(assert (=> b!210537 (=> (not res!102720) (not e!137086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210537 (= res!102720 (validKeyInArray!0 k0!843))))

(declare-fun b!210538 () Bool)

(declare-fun res!102715 () Bool)

(assert (=> b!210538 (=> (not res!102715) (not e!137086))))

(assert (=> b!210538 (= res!102715 (= (select (arr!4751 _keys!825) i!601) k0!843))))

(assert (= (and start!20956 res!102719) b!210534))

(assert (= (and b!210534 res!102716) b!210535))

(assert (= (and b!210535 res!102714) b!210532))

(assert (= (and b!210532 res!102717) b!210528))

(assert (= (and b!210528 res!102718) b!210537))

(assert (= (and b!210537 res!102720) b!210538))

(assert (= (and b!210538 res!102715) b!210536))

(assert (= (and b!210536 (not res!102721)) b!210533))

(assert (= (and b!210530 condMapEmpty!9188) mapIsEmpty!9188))

(assert (= (and b!210530 (not condMapEmpty!9188)) mapNonEmpty!9188))

(get-info :version)

(assert (= (and mapNonEmpty!9188 ((_ is ValueCellFull!2360) mapValue!9188)) b!210529))

(assert (= (and b!210530 ((_ is ValueCellFull!2360) mapDefault!9188)) b!210531))

(assert (= start!20956 b!210530))

(declare-fun m!238185 () Bool)

(assert (=> start!20956 m!238185))

(declare-fun m!238187 () Bool)

(assert (=> start!20956 m!238187))

(declare-fun m!238189 () Bool)

(assert (=> start!20956 m!238189))

(declare-fun m!238191 () Bool)

(assert (=> b!210537 m!238191))

(declare-fun m!238193 () Bool)

(assert (=> b!210532 m!238193))

(declare-fun m!238195 () Bool)

(assert (=> b!210536 m!238195))

(declare-fun m!238197 () Bool)

(assert (=> b!210536 m!238197))

(declare-fun m!238199 () Bool)

(assert (=> b!210536 m!238199))

(declare-fun m!238201 () Bool)

(assert (=> b!210536 m!238201))

(declare-fun m!238203 () Bool)

(assert (=> b!210536 m!238203))

(declare-fun m!238205 () Bool)

(assert (=> b!210536 m!238205))

(declare-fun m!238207 () Bool)

(assert (=> b!210536 m!238207))

(declare-fun m!238209 () Bool)

(assert (=> b!210538 m!238209))

(declare-fun m!238211 () Bool)

(assert (=> b!210535 m!238211))

(declare-fun m!238213 () Bool)

(assert (=> b!210533 m!238213))

(declare-fun m!238215 () Bool)

(assert (=> b!210533 m!238215))

(declare-fun m!238217 () Bool)

(assert (=> b!210533 m!238217))

(declare-fun m!238219 () Bool)

(assert (=> b!210533 m!238219))

(declare-fun m!238221 () Bool)

(assert (=> b!210533 m!238221))

(declare-fun m!238223 () Bool)

(assert (=> b!210533 m!238223))

(assert (=> b!210533 m!238219))

(declare-fun m!238225 () Bool)

(assert (=> b!210533 m!238225))

(declare-fun m!238227 () Bool)

(assert (=> b!210533 m!238227))

(declare-fun m!238229 () Bool)

(assert (=> mapNonEmpty!9188 m!238229))

(check-sat (not b!210535) (not b!210533) b_and!12341 (not start!20956) tp_is_empty!5407 (not b!210537) (not b!210536) (not b_next!5545) (not b!210532) (not mapNonEmpty!9188))
(check-sat b_and!12341 (not b_next!5545))
(get-model)

(declare-fun d!58039 () Bool)

(declare-fun e!137129 () Bool)

(assert (=> d!58039 e!137129))

(declare-fun res!102774 () Bool)

(assert (=> d!58039 (=> (not res!102774) (not e!137129))))

(declare-fun lt!107985 () ListLongMap!3013)

(declare-fun contains!1381 (ListLongMap!3013 (_ BitVec 64)) Bool)

(assert (=> d!58039 (= res!102774 (contains!1381 lt!107985 (_1!2060 lt!107891)))))

(declare-fun lt!107987 () List!2984)

(assert (=> d!58039 (= lt!107985 (ListLongMap!3014 lt!107987))))

(declare-fun lt!107986 () Unit!6382)

(declare-fun lt!107984 () Unit!6382)

(assert (=> d!58039 (= lt!107986 lt!107984)))

(declare-datatypes ((Option!257 0))(
  ( (Some!256 (v!4737 V!6857)) (None!255) )
))
(declare-fun getValueByKey!251 (List!2984 (_ BitVec 64)) Option!257)

(assert (=> d!58039 (= (getValueByKey!251 lt!107987 (_1!2060 lt!107891)) (Some!256 (_2!2060 lt!107891)))))

(declare-fun lemmaContainsTupThenGetReturnValue!138 (List!2984 (_ BitVec 64) V!6857) Unit!6382)

(assert (=> d!58039 (= lt!107984 (lemmaContainsTupThenGetReturnValue!138 lt!107987 (_1!2060 lt!107891) (_2!2060 lt!107891)))))

(declare-fun insertStrictlySorted!141 (List!2984 (_ BitVec 64) V!6857) List!2984)

(assert (=> d!58039 (= lt!107987 (insertStrictlySorted!141 (toList!1522 lt!107897) (_1!2060 lt!107891) (_2!2060 lt!107891)))))

(assert (=> d!58039 (= (+!551 lt!107897 lt!107891) lt!107985)))

(declare-fun b!210609 () Bool)

(declare-fun res!102775 () Bool)

(assert (=> b!210609 (=> (not res!102775) (not e!137129))))

(assert (=> b!210609 (= res!102775 (= (getValueByKey!251 (toList!1522 lt!107985) (_1!2060 lt!107891)) (Some!256 (_2!2060 lt!107891))))))

(declare-fun b!210610 () Bool)

(declare-fun contains!1382 (List!2984 tuple2!4098) Bool)

(assert (=> b!210610 (= e!137129 (contains!1382 (toList!1522 lt!107985) lt!107891))))

(assert (= (and d!58039 res!102774) b!210609))

(assert (= (and b!210609 res!102775) b!210610))

(declare-fun m!238323 () Bool)

(assert (=> d!58039 m!238323))

(declare-fun m!238325 () Bool)

(assert (=> d!58039 m!238325))

(declare-fun m!238327 () Bool)

(assert (=> d!58039 m!238327))

(declare-fun m!238329 () Bool)

(assert (=> d!58039 m!238329))

(declare-fun m!238331 () Bool)

(assert (=> b!210609 m!238331))

(declare-fun m!238333 () Bool)

(assert (=> b!210610 m!238333))

(assert (=> b!210533 d!58039))

(declare-fun d!58041 () Bool)

(declare-fun e!137130 () Bool)

(assert (=> d!58041 e!137130))

(declare-fun res!102776 () Bool)

(assert (=> d!58041 (=> (not res!102776) (not e!137130))))

(declare-fun lt!107989 () ListLongMap!3013)

(assert (=> d!58041 (= res!102776 (contains!1381 lt!107989 (_1!2060 lt!107896)))))

(declare-fun lt!107991 () List!2984)

(assert (=> d!58041 (= lt!107989 (ListLongMap!3014 lt!107991))))

(declare-fun lt!107990 () Unit!6382)

(declare-fun lt!107988 () Unit!6382)

(assert (=> d!58041 (= lt!107990 lt!107988)))

(assert (=> d!58041 (= (getValueByKey!251 lt!107991 (_1!2060 lt!107896)) (Some!256 (_2!2060 lt!107896)))))

(assert (=> d!58041 (= lt!107988 (lemmaContainsTupThenGetReturnValue!138 lt!107991 (_1!2060 lt!107896) (_2!2060 lt!107896)))))

(assert (=> d!58041 (= lt!107991 (insertStrictlySorted!141 (toList!1522 lt!107892) (_1!2060 lt!107896) (_2!2060 lt!107896)))))

(assert (=> d!58041 (= (+!551 lt!107892 lt!107896) lt!107989)))

(declare-fun b!210611 () Bool)

(declare-fun res!102777 () Bool)

(assert (=> b!210611 (=> (not res!102777) (not e!137130))))

(assert (=> b!210611 (= res!102777 (= (getValueByKey!251 (toList!1522 lt!107989) (_1!2060 lt!107896)) (Some!256 (_2!2060 lt!107896))))))

(declare-fun b!210612 () Bool)

(assert (=> b!210612 (= e!137130 (contains!1382 (toList!1522 lt!107989) lt!107896))))

(assert (= (and d!58041 res!102776) b!210611))

(assert (= (and b!210611 res!102777) b!210612))

(declare-fun m!238335 () Bool)

(assert (=> d!58041 m!238335))

(declare-fun m!238337 () Bool)

(assert (=> d!58041 m!238337))

(declare-fun m!238339 () Bool)

(assert (=> d!58041 m!238339))

(declare-fun m!238341 () Bool)

(assert (=> d!58041 m!238341))

(declare-fun m!238343 () Bool)

(assert (=> b!210611 m!238343))

(declare-fun m!238345 () Bool)

(assert (=> b!210612 m!238345))

(assert (=> b!210533 d!58041))

(declare-fun d!58043 () Bool)

(declare-fun e!137131 () Bool)

(assert (=> d!58043 e!137131))

(declare-fun res!102778 () Bool)

(assert (=> d!58043 (=> (not res!102778) (not e!137131))))

(declare-fun lt!107993 () ListLongMap!3013)

(assert (=> d!58043 (= res!102778 (contains!1381 lt!107993 (_1!2060 lt!107891)))))

(declare-fun lt!107995 () List!2984)

(assert (=> d!58043 (= lt!107993 (ListLongMap!3014 lt!107995))))

(declare-fun lt!107994 () Unit!6382)

(declare-fun lt!107992 () Unit!6382)

(assert (=> d!58043 (= lt!107994 lt!107992)))

(assert (=> d!58043 (= (getValueByKey!251 lt!107995 (_1!2060 lt!107891)) (Some!256 (_2!2060 lt!107891)))))

(assert (=> d!58043 (= lt!107992 (lemmaContainsTupThenGetReturnValue!138 lt!107995 (_1!2060 lt!107891) (_2!2060 lt!107891)))))

(assert (=> d!58043 (= lt!107995 (insertStrictlySorted!141 (toList!1522 lt!107894) (_1!2060 lt!107891) (_2!2060 lt!107891)))))

(assert (=> d!58043 (= (+!551 lt!107894 lt!107891) lt!107993)))

(declare-fun b!210613 () Bool)

(declare-fun res!102779 () Bool)

(assert (=> b!210613 (=> (not res!102779) (not e!137131))))

(assert (=> b!210613 (= res!102779 (= (getValueByKey!251 (toList!1522 lt!107993) (_1!2060 lt!107891)) (Some!256 (_2!2060 lt!107891))))))

(declare-fun b!210614 () Bool)

(assert (=> b!210614 (= e!137131 (contains!1382 (toList!1522 lt!107993) lt!107891))))

(assert (= (and d!58043 res!102778) b!210613))

(assert (= (and b!210613 res!102779) b!210614))

(declare-fun m!238347 () Bool)

(assert (=> d!58043 m!238347))

(declare-fun m!238349 () Bool)

(assert (=> d!58043 m!238349))

(declare-fun m!238351 () Bool)

(assert (=> d!58043 m!238351))

(declare-fun m!238353 () Bool)

(assert (=> d!58043 m!238353))

(declare-fun m!238355 () Bool)

(assert (=> b!210613 m!238355))

(declare-fun m!238357 () Bool)

(assert (=> b!210614 m!238357))

(assert (=> b!210533 d!58043))

(declare-fun d!58045 () Bool)

(declare-fun e!137132 () Bool)

(assert (=> d!58045 e!137132))

(declare-fun res!102780 () Bool)

(assert (=> d!58045 (=> (not res!102780) (not e!137132))))

(declare-fun lt!107997 () ListLongMap!3013)

(assert (=> d!58045 (= res!102780 (contains!1381 lt!107997 (_1!2060 lt!107896)))))

(declare-fun lt!107999 () List!2984)

(assert (=> d!58045 (= lt!107997 (ListLongMap!3014 lt!107999))))

(declare-fun lt!107998 () Unit!6382)

(declare-fun lt!107996 () Unit!6382)

(assert (=> d!58045 (= lt!107998 lt!107996)))

(assert (=> d!58045 (= (getValueByKey!251 lt!107999 (_1!2060 lt!107896)) (Some!256 (_2!2060 lt!107896)))))

(assert (=> d!58045 (= lt!107996 (lemmaContainsTupThenGetReturnValue!138 lt!107999 (_1!2060 lt!107896) (_2!2060 lt!107896)))))

(assert (=> d!58045 (= lt!107999 (insertStrictlySorted!141 (toList!1522 lt!107886) (_1!2060 lt!107896) (_2!2060 lt!107896)))))

(assert (=> d!58045 (= (+!551 lt!107886 lt!107896) lt!107997)))

(declare-fun b!210615 () Bool)

(declare-fun res!102781 () Bool)

(assert (=> b!210615 (=> (not res!102781) (not e!137132))))

(assert (=> b!210615 (= res!102781 (= (getValueByKey!251 (toList!1522 lt!107997) (_1!2060 lt!107896)) (Some!256 (_2!2060 lt!107896))))))

(declare-fun b!210616 () Bool)

(assert (=> b!210616 (= e!137132 (contains!1382 (toList!1522 lt!107997) lt!107896))))

(assert (= (and d!58045 res!102780) b!210615))

(assert (= (and b!210615 res!102781) b!210616))

(declare-fun m!238359 () Bool)

(assert (=> d!58045 m!238359))

(declare-fun m!238361 () Bool)

(assert (=> d!58045 m!238361))

(declare-fun m!238363 () Bool)

(assert (=> d!58045 m!238363))

(declare-fun m!238365 () Bool)

(assert (=> d!58045 m!238365))

(declare-fun m!238367 () Bool)

(assert (=> b!210615 m!238367))

(declare-fun m!238369 () Bool)

(assert (=> b!210616 m!238369))

(assert (=> b!210533 d!58045))

(declare-fun d!58047 () Bool)

(declare-fun e!137133 () Bool)

(assert (=> d!58047 e!137133))

(declare-fun res!102782 () Bool)

(assert (=> d!58047 (=> (not res!102782) (not e!137133))))

(declare-fun lt!108001 () ListLongMap!3013)

(assert (=> d!58047 (= res!102782 (contains!1381 lt!108001 (_1!2060 lt!107896)))))

(declare-fun lt!108003 () List!2984)

(assert (=> d!58047 (= lt!108001 (ListLongMap!3014 lt!108003))))

(declare-fun lt!108002 () Unit!6382)

(declare-fun lt!108000 () Unit!6382)

(assert (=> d!58047 (= lt!108002 lt!108000)))

(assert (=> d!58047 (= (getValueByKey!251 lt!108003 (_1!2060 lt!107896)) (Some!256 (_2!2060 lt!107896)))))

(assert (=> d!58047 (= lt!108000 (lemmaContainsTupThenGetReturnValue!138 lt!108003 (_1!2060 lt!107896) (_2!2060 lt!107896)))))

(assert (=> d!58047 (= lt!108003 (insertStrictlySorted!141 (toList!1522 lt!107893) (_1!2060 lt!107896) (_2!2060 lt!107896)))))

(assert (=> d!58047 (= (+!551 lt!107893 lt!107896) lt!108001)))

(declare-fun b!210617 () Bool)

(declare-fun res!102783 () Bool)

(assert (=> b!210617 (=> (not res!102783) (not e!137133))))

(assert (=> b!210617 (= res!102783 (= (getValueByKey!251 (toList!1522 lt!108001) (_1!2060 lt!107896)) (Some!256 (_2!2060 lt!107896))))))

(declare-fun b!210618 () Bool)

(assert (=> b!210618 (= e!137133 (contains!1382 (toList!1522 lt!108001) lt!107896))))

(assert (= (and d!58047 res!102782) b!210617))

(assert (= (and b!210617 res!102783) b!210618))

(declare-fun m!238371 () Bool)

(assert (=> d!58047 m!238371))

(declare-fun m!238373 () Bool)

(assert (=> d!58047 m!238373))

(declare-fun m!238375 () Bool)

(assert (=> d!58047 m!238375))

(declare-fun m!238377 () Bool)

(assert (=> d!58047 m!238377))

(declare-fun m!238379 () Bool)

(assert (=> b!210617 m!238379))

(declare-fun m!238381 () Bool)

(assert (=> b!210618 m!238381))

(assert (=> b!210533 d!58047))

(declare-fun d!58049 () Bool)

(assert (=> d!58049 (= (+!551 (+!551 lt!107893 (tuple2!4099 k0!843 v!520)) (tuple2!4099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (+!551 (+!551 lt!107893 (tuple2!4099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4099 k0!843 v!520)))))

(declare-fun lt!108006 () Unit!6382)

(declare-fun choose!1082 (ListLongMap!3013 (_ BitVec 64) V!6857 (_ BitVec 64) V!6857) Unit!6382)

(assert (=> d!58049 (= lt!108006 (choose!1082 lt!107893 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> d!58049 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58049 (= (addCommutativeForDiffKeys!201 lt!107893 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) lt!108006)))

(declare-fun bs!8285 () Bool)

(assert (= bs!8285 d!58049))

(declare-fun m!238383 () Bool)

(assert (=> bs!8285 m!238383))

(declare-fun m!238385 () Bool)

(assert (=> bs!8285 m!238385))

(assert (=> bs!8285 m!238385))

(declare-fun m!238387 () Bool)

(assert (=> bs!8285 m!238387))

(declare-fun m!238389 () Bool)

(assert (=> bs!8285 m!238389))

(declare-fun m!238391 () Bool)

(assert (=> bs!8285 m!238391))

(assert (=> bs!8285 m!238389))

(assert (=> b!210533 d!58049))

(declare-fun d!58051 () Bool)

(declare-fun e!137134 () Bool)

(assert (=> d!58051 e!137134))

(declare-fun res!102784 () Bool)

(assert (=> d!58051 (=> (not res!102784) (not e!137134))))

(declare-fun lt!108008 () ListLongMap!3013)

(assert (=> d!58051 (= res!102784 (contains!1381 lt!108008 (_1!2060 lt!107891)))))

(declare-fun lt!108010 () List!2984)

(assert (=> d!58051 (= lt!108008 (ListLongMap!3014 lt!108010))))

(declare-fun lt!108009 () Unit!6382)

(declare-fun lt!108007 () Unit!6382)

(assert (=> d!58051 (= lt!108009 lt!108007)))

(assert (=> d!58051 (= (getValueByKey!251 lt!108010 (_1!2060 lt!107891)) (Some!256 (_2!2060 lt!107891)))))

(assert (=> d!58051 (= lt!108007 (lemmaContainsTupThenGetReturnValue!138 lt!108010 (_1!2060 lt!107891) (_2!2060 lt!107891)))))

(assert (=> d!58051 (= lt!108010 (insertStrictlySorted!141 (toList!1522 (+!551 lt!107892 lt!107896)) (_1!2060 lt!107891) (_2!2060 lt!107891)))))

(assert (=> d!58051 (= (+!551 (+!551 lt!107892 lt!107896) lt!107891) lt!108008)))

(declare-fun b!210619 () Bool)

(declare-fun res!102785 () Bool)

(assert (=> b!210619 (=> (not res!102785) (not e!137134))))

(assert (=> b!210619 (= res!102785 (= (getValueByKey!251 (toList!1522 lt!108008) (_1!2060 lt!107891)) (Some!256 (_2!2060 lt!107891))))))

(declare-fun b!210620 () Bool)

(assert (=> b!210620 (= e!137134 (contains!1382 (toList!1522 lt!108008) lt!107891))))

(assert (= (and d!58051 res!102784) b!210619))

(assert (= (and b!210619 res!102785) b!210620))

(declare-fun m!238393 () Bool)

(assert (=> d!58051 m!238393))

(declare-fun m!238395 () Bool)

(assert (=> d!58051 m!238395))

(declare-fun m!238397 () Bool)

(assert (=> d!58051 m!238397))

(declare-fun m!238399 () Bool)

(assert (=> d!58051 m!238399))

(declare-fun m!238401 () Bool)

(assert (=> b!210619 m!238401))

(declare-fun m!238403 () Bool)

(assert (=> b!210620 m!238403))

(assert (=> b!210533 d!58051))

(declare-fun d!58053 () Bool)

(declare-fun e!137135 () Bool)

(assert (=> d!58053 e!137135))

(declare-fun res!102786 () Bool)

(assert (=> d!58053 (=> (not res!102786) (not e!137135))))

(declare-fun lt!108012 () ListLongMap!3013)

(assert (=> d!58053 (= res!102786 (contains!1381 lt!108012 (_1!2060 lt!107890)))))

(declare-fun lt!108014 () List!2984)

(assert (=> d!58053 (= lt!108012 (ListLongMap!3014 lt!108014))))

(declare-fun lt!108013 () Unit!6382)

(declare-fun lt!108011 () Unit!6382)

(assert (=> d!58053 (= lt!108013 lt!108011)))

(assert (=> d!58053 (= (getValueByKey!251 lt!108014 (_1!2060 lt!107890)) (Some!256 (_2!2060 lt!107890)))))

(assert (=> d!58053 (= lt!108011 (lemmaContainsTupThenGetReturnValue!138 lt!108014 (_1!2060 lt!107890) (_2!2060 lt!107890)))))

(assert (=> d!58053 (= lt!108014 (insertStrictlySorted!141 (toList!1522 lt!107897) (_1!2060 lt!107890) (_2!2060 lt!107890)))))

(assert (=> d!58053 (= (+!551 lt!107897 lt!107890) lt!108012)))

(declare-fun b!210621 () Bool)

(declare-fun res!102787 () Bool)

(assert (=> b!210621 (=> (not res!102787) (not e!137135))))

(assert (=> b!210621 (= res!102787 (= (getValueByKey!251 (toList!1522 lt!108012) (_1!2060 lt!107890)) (Some!256 (_2!2060 lt!107890))))))

(declare-fun b!210622 () Bool)

(assert (=> b!210622 (= e!137135 (contains!1382 (toList!1522 lt!108012) lt!107890))))

(assert (= (and d!58053 res!102786) b!210621))

(assert (= (and b!210621 res!102787) b!210622))

(declare-fun m!238405 () Bool)

(assert (=> d!58053 m!238405))

(declare-fun m!238407 () Bool)

(assert (=> d!58053 m!238407))

(declare-fun m!238409 () Bool)

(assert (=> d!58053 m!238409))

(declare-fun m!238411 () Bool)

(assert (=> d!58053 m!238411))

(declare-fun m!238413 () Bool)

(assert (=> b!210621 m!238413))

(declare-fun m!238415 () Bool)

(assert (=> b!210622 m!238415))

(assert (=> b!210533 d!58053))

(declare-fun d!58055 () Bool)

(declare-fun res!102793 () Bool)

(declare-fun e!137142 () Bool)

(assert (=> d!58055 (=> res!102793 e!137142)))

(assert (=> d!58055 (= res!102793 (bvsge #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137142)))

(declare-fun b!210631 () Bool)

(declare-fun e!137143 () Bool)

(declare-fun call!19899 () Bool)

(assert (=> b!210631 (= e!137143 call!19899)))

(declare-fun bm!19896 () Bool)

(assert (=> bm!19896 (= call!19899 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!210632 () Bool)

(declare-fun e!137144 () Bool)

(assert (=> b!210632 (= e!137144 e!137143)))

(declare-fun lt!108023 () (_ BitVec 64))

(assert (=> b!210632 (= lt!108023 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108021 () Unit!6382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10007 (_ BitVec 64) (_ BitVec 32)) Unit!6382)

(assert (=> b!210632 (= lt!108021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108023 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210632 (arrayContainsKey!0 _keys!825 lt!108023 #b00000000000000000000000000000000)))

(declare-fun lt!108022 () Unit!6382)

(assert (=> b!210632 (= lt!108022 lt!108021)))

(declare-fun res!102792 () Bool)

(declare-datatypes ((SeekEntryResult!696 0))(
  ( (MissingZero!696 (index!4954 (_ BitVec 32))) (Found!696 (index!4955 (_ BitVec 32))) (Intermediate!696 (undefined!1508 Bool) (index!4956 (_ BitVec 32)) (x!22031 (_ BitVec 32))) (Undefined!696) (MissingVacant!696 (index!4957 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10007 (_ BitVec 32)) SeekEntryResult!696)

(assert (=> b!210632 (= res!102792 (= (seekEntryOrOpen!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!696 #b00000000000000000000000000000000)))))

(assert (=> b!210632 (=> (not res!102792) (not e!137143))))

(declare-fun b!210633 () Bool)

(assert (=> b!210633 (= e!137142 e!137144)))

(declare-fun c!35598 () Bool)

(assert (=> b!210633 (= c!35598 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210634 () Bool)

(assert (=> b!210634 (= e!137144 call!19899)))

(assert (= (and d!58055 (not res!102793)) b!210633))

(assert (= (and b!210633 c!35598) b!210632))

(assert (= (and b!210633 (not c!35598)) b!210634))

(assert (= (and b!210632 res!102792) b!210631))

(assert (= (or b!210631 b!210634) bm!19896))

(declare-fun m!238417 () Bool)

(assert (=> bm!19896 m!238417))

(declare-fun m!238419 () Bool)

(assert (=> b!210632 m!238419))

(declare-fun m!238421 () Bool)

(assert (=> b!210632 m!238421))

(declare-fun m!238423 () Bool)

(assert (=> b!210632 m!238423))

(assert (=> b!210632 m!238419))

(declare-fun m!238425 () Bool)

(assert (=> b!210632 m!238425))

(assert (=> b!210633 m!238419))

(assert (=> b!210633 m!238419))

(declare-fun m!238427 () Bool)

(assert (=> b!210633 m!238427))

(assert (=> b!210535 d!58055))

(declare-fun d!58057 () Bool)

(declare-fun e!137145 () Bool)

(assert (=> d!58057 e!137145))

(declare-fun res!102794 () Bool)

(assert (=> d!58057 (=> (not res!102794) (not e!137145))))

(declare-fun lt!108025 () ListLongMap!3013)

(assert (=> d!58057 (= res!102794 (contains!1381 lt!108025 (_1!2060 lt!107890)))))

(declare-fun lt!108027 () List!2984)

(assert (=> d!58057 (= lt!108025 (ListLongMap!3014 lt!108027))))

(declare-fun lt!108026 () Unit!6382)

(declare-fun lt!108024 () Unit!6382)

(assert (=> d!58057 (= lt!108026 lt!108024)))

(assert (=> d!58057 (= (getValueByKey!251 lt!108027 (_1!2060 lt!107890)) (Some!256 (_2!2060 lt!107890)))))

(assert (=> d!58057 (= lt!108024 (lemmaContainsTupThenGetReturnValue!138 lt!108027 (_1!2060 lt!107890) (_2!2060 lt!107890)))))

(assert (=> d!58057 (= lt!108027 (insertStrictlySorted!141 (toList!1522 lt!107893) (_1!2060 lt!107890) (_2!2060 lt!107890)))))

(assert (=> d!58057 (= (+!551 lt!107893 lt!107890) lt!108025)))

(declare-fun b!210635 () Bool)

(declare-fun res!102795 () Bool)

(assert (=> b!210635 (=> (not res!102795) (not e!137145))))

(assert (=> b!210635 (= res!102795 (= (getValueByKey!251 (toList!1522 lt!108025) (_1!2060 lt!107890)) (Some!256 (_2!2060 lt!107890))))))

(declare-fun b!210636 () Bool)

(assert (=> b!210636 (= e!137145 (contains!1382 (toList!1522 lt!108025) lt!107890))))

(assert (= (and d!58057 res!102794) b!210635))

(assert (= (and b!210635 res!102795) b!210636))

(declare-fun m!238429 () Bool)

(assert (=> d!58057 m!238429))

(declare-fun m!238431 () Bool)

(assert (=> d!58057 m!238431))

(declare-fun m!238433 () Bool)

(assert (=> d!58057 m!238433))

(declare-fun m!238435 () Bool)

(assert (=> d!58057 m!238435))

(declare-fun m!238437 () Bool)

(assert (=> b!210635 m!238437))

(declare-fun m!238439 () Bool)

(assert (=> b!210636 m!238439))

(assert (=> b!210536 d!58057))

(declare-fun b!210679 () Bool)

(declare-fun e!137179 () ListLongMap!3013)

(declare-fun e!137172 () ListLongMap!3013)

(assert (=> b!210679 (= e!137179 e!137172)))

(declare-fun c!35613 () Bool)

(assert (=> b!210679 (= c!35613 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210680 () Bool)

(declare-fun call!19915 () ListLongMap!3013)

(assert (=> b!210680 (= e!137179 (+!551 call!19915 (tuple2!4099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19911 () Bool)

(declare-fun call!19918 () ListLongMap!3013)

(assert (=> bm!19911 (= call!19918 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210681 () Bool)

(declare-fun e!137177 () Bool)

(declare-fun e!137175 () Bool)

(assert (=> b!210681 (= e!137177 e!137175)))

(declare-fun c!35616 () Bool)

(assert (=> b!210681 (= c!35616 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210682 () Bool)

(declare-fun call!19917 () Bool)

(assert (=> b!210682 (= e!137175 (not call!19917))))

(declare-fun b!210684 () Bool)

(declare-fun e!137182 () Bool)

(assert (=> b!210684 (= e!137182 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19912 () Bool)

(declare-fun lt!108088 () ListLongMap!3013)

(assert (=> bm!19912 (= call!19917 (contains!1381 lt!108088 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19913 () Bool)

(declare-fun call!19919 () ListLongMap!3013)

(assert (=> bm!19913 (= call!19919 call!19915)))

(declare-fun b!210685 () Bool)

(declare-fun e!137181 () Bool)

(declare-fun e!137184 () Bool)

(assert (=> b!210685 (= e!137181 e!137184)))

(declare-fun res!102816 () Bool)

(assert (=> b!210685 (=> (not res!102816) (not e!137184))))

(assert (=> b!210685 (= res!102816 (contains!1381 lt!108088 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210686 () Bool)

(declare-fun e!137176 () Bool)

(assert (=> b!210686 (= e!137175 e!137176)))

(declare-fun res!102817 () Bool)

(assert (=> b!210686 (= res!102817 call!19917)))

(assert (=> b!210686 (=> (not res!102817) (not e!137176))))

(declare-fun b!210687 () Bool)

(declare-fun e!137183 () ListLongMap!3013)

(assert (=> b!210687 (= e!137183 call!19919)))

(declare-fun call!19914 () ListLongMap!3013)

(declare-fun c!35611 () Bool)

(declare-fun call!19916 () ListLongMap!3013)

(declare-fun bm!19914 () Bool)

(assert (=> bm!19914 (= call!19915 (+!551 (ite c!35611 call!19918 (ite c!35613 call!19916 call!19914)) (ite (or c!35611 c!35613) (tuple2!4099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210688 () Bool)

(declare-fun e!137180 () Bool)

(declare-fun apply!192 (ListLongMap!3013 (_ BitVec 64)) V!6857)

(assert (=> b!210688 (= e!137180 (= (apply!192 lt!108088 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210689 () Bool)

(declare-fun res!102822 () Bool)

(assert (=> b!210689 (=> (not res!102822) (not e!137177))))

(assert (=> b!210689 (= res!102822 e!137181)))

(declare-fun res!102821 () Bool)

(assert (=> b!210689 (=> res!102821 e!137181)))

(assert (=> b!210689 (= res!102821 (not e!137182))))

(declare-fun res!102819 () Bool)

(assert (=> b!210689 (=> (not res!102819) (not e!137182))))

(assert (=> b!210689 (= res!102819 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210690 () Bool)

(declare-fun e!137174 () Unit!6382)

(declare-fun Unit!6386 () Unit!6382)

(assert (=> b!210690 (= e!137174 Unit!6386)))

(declare-fun d!58059 () Bool)

(assert (=> d!58059 e!137177))

(declare-fun res!102818 () Bool)

(assert (=> d!58059 (=> (not res!102818) (not e!137177))))

(assert (=> d!58059 (= res!102818 (or (bvsge #b00000000000000000000000000000000 (size!5076 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))))

(declare-fun lt!108073 () ListLongMap!3013)

(assert (=> d!58059 (= lt!108088 lt!108073)))

(declare-fun lt!108074 () Unit!6382)

(assert (=> d!58059 (= lt!108074 e!137174)))

(declare-fun c!35614 () Bool)

(declare-fun e!137173 () Bool)

(assert (=> d!58059 (= c!35614 e!137173)))

(declare-fun res!102814 () Bool)

(assert (=> d!58059 (=> (not res!102814) (not e!137173))))

(assert (=> d!58059 (= res!102814 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58059 (= lt!108073 e!137179)))

(assert (=> d!58059 (= c!35611 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58059 (validMask!0 mask!1149)))

(assert (=> d!58059 (= (getCurrentListMap!1061 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108088)))

(declare-fun b!210683 () Bool)

(declare-fun c!35612 () Bool)

(assert (=> b!210683 (= c!35612 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210683 (= e!137172 e!137183)))

(declare-fun b!210691 () Bool)

(assert (=> b!210691 (= e!137173 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210692 () Bool)

(declare-fun res!102820 () Bool)

(assert (=> b!210692 (=> (not res!102820) (not e!137177))))

(declare-fun e!137178 () Bool)

(assert (=> b!210692 (= res!102820 e!137178)))

(declare-fun c!35615 () Bool)

(assert (=> b!210692 (= c!35615 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210693 () Bool)

(declare-fun get!2556 (ValueCell!2360 V!6857) V!6857)

(declare-fun dynLambda!535 (Int (_ BitVec 64)) V!6857)

(assert (=> b!210693 (= e!137184 (= (apply!192 lt!108088 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)) (get!2556 (select (arr!4752 lt!107895) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 lt!107895)))))

(assert (=> b!210693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210694 () Bool)

(assert (=> b!210694 (= e!137183 call!19914)))

(declare-fun b!210695 () Bool)

(assert (=> b!210695 (= e!137176 (= (apply!192 lt!108088 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210696 () Bool)

(assert (=> b!210696 (= e!137178 e!137180)))

(declare-fun res!102815 () Bool)

(declare-fun call!19920 () Bool)

(assert (=> b!210696 (= res!102815 call!19920)))

(assert (=> b!210696 (=> (not res!102815) (not e!137180))))

(declare-fun b!210697 () Bool)

(assert (=> b!210697 (= e!137172 call!19919)))

(declare-fun bm!19915 () Bool)

(assert (=> bm!19915 (= call!19916 call!19918)))

(declare-fun bm!19916 () Bool)

(assert (=> bm!19916 (= call!19920 (contains!1381 lt!108088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210698 () Bool)

(declare-fun lt!108087 () Unit!6382)

(assert (=> b!210698 (= e!137174 lt!108087)))

(declare-fun lt!108081 () ListLongMap!3013)

(assert (=> b!210698 (= lt!108081 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108077 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108078 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108078 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108090 () Unit!6382)

(declare-fun addStillContains!168 (ListLongMap!3013 (_ BitVec 64) V!6857 (_ BitVec 64)) Unit!6382)

(assert (=> b!210698 (= lt!108090 (addStillContains!168 lt!108081 lt!108077 zeroValue!615 lt!108078))))

(assert (=> b!210698 (contains!1381 (+!551 lt!108081 (tuple2!4099 lt!108077 zeroValue!615)) lt!108078)))

(declare-fun lt!108076 () Unit!6382)

(assert (=> b!210698 (= lt!108076 lt!108090)))

(declare-fun lt!108079 () ListLongMap!3013)

(assert (=> b!210698 (= lt!108079 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108092 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108092 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108072 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108072 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108089 () Unit!6382)

(declare-fun addApplyDifferent!168 (ListLongMap!3013 (_ BitVec 64) V!6857 (_ BitVec 64)) Unit!6382)

(assert (=> b!210698 (= lt!108089 (addApplyDifferent!168 lt!108079 lt!108092 minValue!615 lt!108072))))

(assert (=> b!210698 (= (apply!192 (+!551 lt!108079 (tuple2!4099 lt!108092 minValue!615)) lt!108072) (apply!192 lt!108079 lt!108072))))

(declare-fun lt!108075 () Unit!6382)

(assert (=> b!210698 (= lt!108075 lt!108089)))

(declare-fun lt!108083 () ListLongMap!3013)

(assert (=> b!210698 (= lt!108083 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108091 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108085 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108085 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108086 () Unit!6382)

(assert (=> b!210698 (= lt!108086 (addApplyDifferent!168 lt!108083 lt!108091 zeroValue!615 lt!108085))))

(assert (=> b!210698 (= (apply!192 (+!551 lt!108083 (tuple2!4099 lt!108091 zeroValue!615)) lt!108085) (apply!192 lt!108083 lt!108085))))

(declare-fun lt!108080 () Unit!6382)

(assert (=> b!210698 (= lt!108080 lt!108086)))

(declare-fun lt!108084 () ListLongMap!3013)

(assert (=> b!210698 (= lt!108084 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108093 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108082 () (_ BitVec 64))

(assert (=> b!210698 (= lt!108082 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210698 (= lt!108087 (addApplyDifferent!168 lt!108084 lt!108093 minValue!615 lt!108082))))

(assert (=> b!210698 (= (apply!192 (+!551 lt!108084 (tuple2!4099 lt!108093 minValue!615)) lt!108082) (apply!192 lt!108084 lt!108082))))

(declare-fun bm!19917 () Bool)

(assert (=> bm!19917 (= call!19914 call!19916)))

(declare-fun b!210699 () Bool)

(assert (=> b!210699 (= e!137178 (not call!19920))))

(assert (= (and d!58059 c!35611) b!210680))

(assert (= (and d!58059 (not c!35611)) b!210679))

(assert (= (and b!210679 c!35613) b!210697))

(assert (= (and b!210679 (not c!35613)) b!210683))

(assert (= (and b!210683 c!35612) b!210687))

(assert (= (and b!210683 (not c!35612)) b!210694))

(assert (= (or b!210687 b!210694) bm!19917))

(assert (= (or b!210697 bm!19917) bm!19915))

(assert (= (or b!210697 b!210687) bm!19913))

(assert (= (or b!210680 bm!19915) bm!19911))

(assert (= (or b!210680 bm!19913) bm!19914))

(assert (= (and d!58059 res!102814) b!210691))

(assert (= (and d!58059 c!35614) b!210698))

(assert (= (and d!58059 (not c!35614)) b!210690))

(assert (= (and d!58059 res!102818) b!210689))

(assert (= (and b!210689 res!102819) b!210684))

(assert (= (and b!210689 (not res!102821)) b!210685))

(assert (= (and b!210685 res!102816) b!210693))

(assert (= (and b!210689 res!102822) b!210692))

(assert (= (and b!210692 c!35615) b!210696))

(assert (= (and b!210692 (not c!35615)) b!210699))

(assert (= (and b!210696 res!102815) b!210688))

(assert (= (or b!210696 b!210699) bm!19916))

(assert (= (and b!210692 res!102820) b!210681))

(assert (= (and b!210681 c!35616) b!210686))

(assert (= (and b!210681 (not c!35616)) b!210682))

(assert (= (and b!210686 res!102817) b!210695))

(assert (= (or b!210686 b!210682) bm!19912))

(declare-fun b_lambda!7633 () Bool)

(assert (=> (not b_lambda!7633) (not b!210693)))

(declare-fun t!7917 () Bool)

(declare-fun tb!2889 () Bool)

(assert (=> (and start!20956 (= defaultEntry!657 defaultEntry!657) t!7917) tb!2889))

(declare-fun result!4971 () Bool)

(assert (=> tb!2889 (= result!4971 tp_is_empty!5407)))

(assert (=> b!210693 t!7917))

(declare-fun b_and!12347 () Bool)

(assert (= b_and!12341 (and (=> t!7917 result!4971) b_and!12347)))

(assert (=> b!210684 m!238419))

(assert (=> b!210684 m!238419))

(assert (=> b!210684 m!238427))

(assert (=> d!58059 m!238185))

(declare-fun m!238441 () Bool)

(assert (=> bm!19912 m!238441))

(declare-fun m!238443 () Bool)

(assert (=> b!210698 m!238443))

(declare-fun m!238445 () Bool)

(assert (=> b!210698 m!238445))

(declare-fun m!238447 () Bool)

(assert (=> b!210698 m!238447))

(declare-fun m!238449 () Bool)

(assert (=> b!210698 m!238449))

(assert (=> b!210698 m!238419))

(assert (=> b!210698 m!238447))

(declare-fun m!238451 () Bool)

(assert (=> b!210698 m!238451))

(declare-fun m!238453 () Bool)

(assert (=> b!210698 m!238453))

(declare-fun m!238455 () Bool)

(assert (=> b!210698 m!238455))

(assert (=> b!210698 m!238195))

(declare-fun m!238457 () Bool)

(assert (=> b!210698 m!238457))

(declare-fun m!238459 () Bool)

(assert (=> b!210698 m!238459))

(assert (=> b!210698 m!238457))

(declare-fun m!238461 () Bool)

(assert (=> b!210698 m!238461))

(declare-fun m!238463 () Bool)

(assert (=> b!210698 m!238463))

(assert (=> b!210698 m!238455))

(declare-fun m!238465 () Bool)

(assert (=> b!210698 m!238465))

(declare-fun m!238467 () Bool)

(assert (=> b!210698 m!238467))

(declare-fun m!238469 () Bool)

(assert (=> b!210698 m!238469))

(assert (=> b!210698 m!238451))

(declare-fun m!238471 () Bool)

(assert (=> b!210698 m!238471))

(declare-fun m!238473 () Bool)

(assert (=> bm!19916 m!238473))

(assert (=> b!210691 m!238419))

(assert (=> b!210691 m!238419))

(assert (=> b!210691 m!238427))

(assert (=> b!210685 m!238419))

(assert (=> b!210685 m!238419))

(declare-fun m!238475 () Bool)

(assert (=> b!210685 m!238475))

(declare-fun m!238477 () Bool)

(assert (=> b!210688 m!238477))

(assert (=> b!210693 m!238419))

(assert (=> b!210693 m!238419))

(declare-fun m!238479 () Bool)

(assert (=> b!210693 m!238479))

(declare-fun m!238481 () Bool)

(assert (=> b!210693 m!238481))

(declare-fun m!238483 () Bool)

(assert (=> b!210693 m!238483))

(assert (=> b!210693 m!238481))

(declare-fun m!238485 () Bool)

(assert (=> b!210693 m!238485))

(assert (=> b!210693 m!238483))

(declare-fun m!238487 () Bool)

(assert (=> b!210695 m!238487))

(assert (=> bm!19911 m!238195))

(declare-fun m!238489 () Bool)

(assert (=> b!210680 m!238489))

(declare-fun m!238491 () Bool)

(assert (=> bm!19914 m!238491))

(assert (=> b!210536 d!58059))

(declare-fun bm!19920 () Bool)

(declare-fun call!19923 () ListLongMap!3013)

(assert (=> bm!19920 (= call!19923 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210726 () Bool)

(declare-fun e!137202 () Bool)

(declare-fun e!137201 () Bool)

(assert (=> b!210726 (= e!137202 e!137201)))

(declare-fun c!35625 () Bool)

(declare-fun e!137203 () Bool)

(assert (=> b!210726 (= c!35625 e!137203)))

(declare-fun res!102833 () Bool)

(assert (=> b!210726 (=> (not res!102833) (not e!137203))))

(assert (=> b!210726 (= res!102833 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210727 () Bool)

(declare-fun lt!108114 () Unit!6382)

(declare-fun lt!108112 () Unit!6382)

(assert (=> b!210727 (= lt!108114 lt!108112)))

(declare-fun lt!108111 () ListLongMap!3013)

(declare-fun lt!108110 () V!6857)

(declare-fun lt!108108 () (_ BitVec 64))

(declare-fun lt!108113 () (_ BitVec 64))

(assert (=> b!210727 (not (contains!1381 (+!551 lt!108111 (tuple2!4099 lt!108108 lt!108110)) lt!108113))))

(declare-fun addStillNotContains!103 (ListLongMap!3013 (_ BitVec 64) V!6857 (_ BitVec 64)) Unit!6382)

(assert (=> b!210727 (= lt!108112 (addStillNotContains!103 lt!108111 lt!108108 lt!108110 lt!108113))))

(assert (=> b!210727 (= lt!108113 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210727 (= lt!108110 (get!2556 (select (arr!4752 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210727 (= lt!108108 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210727 (= lt!108111 call!19923)))

(declare-fun e!137199 () ListLongMap!3013)

(assert (=> b!210727 (= e!137199 (+!551 call!19923 (tuple2!4099 (select (arr!4751 _keys!825) #b00000000000000000000000000000000) (get!2556 (select (arr!4752 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210728 () Bool)

(declare-fun e!137204 () Bool)

(assert (=> b!210728 (= e!137201 e!137204)))

(assert (=> b!210728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun res!102831 () Bool)

(declare-fun lt!108109 () ListLongMap!3013)

(assert (=> b!210728 (= res!102831 (contains!1381 lt!108109 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210728 (=> (not res!102831) (not e!137204))))

(declare-fun b!210729 () Bool)

(declare-fun e!137200 () Bool)

(declare-fun isEmpty!499 (ListLongMap!3013) Bool)

(assert (=> b!210729 (= e!137200 (isEmpty!499 lt!108109))))

(declare-fun b!210730 () Bool)

(assert (=> b!210730 (= e!137203 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210730 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210731 () Bool)

(declare-fun res!102834 () Bool)

(assert (=> b!210731 (=> (not res!102834) (not e!137202))))

(assert (=> b!210731 (= res!102834 (not (contains!1381 lt!108109 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!58061 () Bool)

(assert (=> d!58061 e!137202))

(declare-fun res!102832 () Bool)

(assert (=> d!58061 (=> (not res!102832) (not e!137202))))

(assert (=> d!58061 (= res!102832 (not (contains!1381 lt!108109 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!137205 () ListLongMap!3013)

(assert (=> d!58061 (= lt!108109 e!137205)))

(declare-fun c!35628 () Bool)

(assert (=> d!58061 (= c!35628 (bvsge #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58061 (validMask!0 mask!1149)))

(assert (=> d!58061 (= (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108109)))

(declare-fun b!210732 () Bool)

(assert (=> b!210732 (= e!137205 e!137199)))

(declare-fun c!35627 () Bool)

(assert (=> b!210732 (= c!35627 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210733 () Bool)

(assert (=> b!210733 (= e!137201 e!137200)))

(declare-fun c!35626 () Bool)

(assert (=> b!210733 (= c!35626 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210734 () Bool)

(assert (=> b!210734 (= e!137205 (ListLongMap!3014 Nil!2981))))

(declare-fun b!210735 () Bool)

(assert (=> b!210735 (= e!137199 call!19923)))

(declare-fun b!210736 () Bool)

(assert (=> b!210736 (= e!137200 (= lt!108109 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210737 () Bool)

(assert (=> b!210737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> b!210737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _values!649)))))

(assert (=> b!210737 (= e!137204 (= (apply!192 lt!108109 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)) (get!2556 (select (arr!4752 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!58061 c!35628) b!210734))

(assert (= (and d!58061 (not c!35628)) b!210732))

(assert (= (and b!210732 c!35627) b!210727))

(assert (= (and b!210732 (not c!35627)) b!210735))

(assert (= (or b!210727 b!210735) bm!19920))

(assert (= (and d!58061 res!102832) b!210731))

(assert (= (and b!210731 res!102834) b!210726))

(assert (= (and b!210726 res!102833) b!210730))

(assert (= (and b!210726 c!35625) b!210728))

(assert (= (and b!210726 (not c!35625)) b!210733))

(assert (= (and b!210728 res!102831) b!210737))

(assert (= (and b!210733 c!35626) b!210736))

(assert (= (and b!210733 (not c!35626)) b!210729))

(declare-fun b_lambda!7635 () Bool)

(assert (=> (not b_lambda!7635) (not b!210727)))

(assert (=> b!210727 t!7917))

(declare-fun b_and!12349 () Bool)

(assert (= b_and!12347 (and (=> t!7917 result!4971) b_and!12349)))

(declare-fun b_lambda!7637 () Bool)

(assert (=> (not b_lambda!7637) (not b!210737)))

(assert (=> b!210737 t!7917))

(declare-fun b_and!12351 () Bool)

(assert (= b_and!12349 (and (=> t!7917 result!4971) b_and!12351)))

(declare-fun m!238493 () Bool)

(assert (=> b!210731 m!238493))

(declare-fun m!238495 () Bool)

(assert (=> d!58061 m!238495))

(assert (=> d!58061 m!238185))

(declare-fun m!238497 () Bool)

(assert (=> bm!19920 m!238497))

(assert (=> b!210728 m!238419))

(assert (=> b!210728 m!238419))

(declare-fun m!238499 () Bool)

(assert (=> b!210728 m!238499))

(declare-fun m!238501 () Bool)

(assert (=> b!210727 m!238501))

(assert (=> b!210727 m!238481))

(assert (=> b!210727 m!238419))

(declare-fun m!238503 () Bool)

(assert (=> b!210727 m!238503))

(assert (=> b!210727 m!238501))

(assert (=> b!210727 m!238481))

(declare-fun m!238505 () Bool)

(assert (=> b!210727 m!238505))

(declare-fun m!238507 () Bool)

(assert (=> b!210727 m!238507))

(declare-fun m!238509 () Bool)

(assert (=> b!210727 m!238509))

(declare-fun m!238511 () Bool)

(assert (=> b!210727 m!238511))

(assert (=> b!210727 m!238507))

(assert (=> b!210730 m!238419))

(assert (=> b!210730 m!238419))

(assert (=> b!210730 m!238427))

(assert (=> b!210737 m!238501))

(assert (=> b!210737 m!238481))

(assert (=> b!210737 m!238419))

(assert (=> b!210737 m!238419))

(declare-fun m!238513 () Bool)

(assert (=> b!210737 m!238513))

(assert (=> b!210737 m!238501))

(assert (=> b!210737 m!238481))

(assert (=> b!210737 m!238505))

(assert (=> b!210736 m!238497))

(assert (=> b!210732 m!238419))

(assert (=> b!210732 m!238419))

(assert (=> b!210732 m!238427))

(declare-fun m!238515 () Bool)

(assert (=> b!210729 m!238515))

(assert (=> b!210536 d!58061))

(declare-fun call!19924 () ListLongMap!3013)

(declare-fun bm!19921 () Bool)

(assert (=> bm!19921 (= call!19924 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210738 () Bool)

(declare-fun e!137209 () Bool)

(declare-fun e!137208 () Bool)

(assert (=> b!210738 (= e!137209 e!137208)))

(declare-fun c!35629 () Bool)

(declare-fun e!137210 () Bool)

(assert (=> b!210738 (= c!35629 e!137210)))

(declare-fun res!102837 () Bool)

(assert (=> b!210738 (=> (not res!102837) (not e!137210))))

(assert (=> b!210738 (= res!102837 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210739 () Bool)

(declare-fun lt!108121 () Unit!6382)

(declare-fun lt!108119 () Unit!6382)

(assert (=> b!210739 (= lt!108121 lt!108119)))

(declare-fun lt!108117 () V!6857)

(declare-fun lt!108120 () (_ BitVec 64))

(declare-fun lt!108118 () ListLongMap!3013)

(declare-fun lt!108115 () (_ BitVec 64))

(assert (=> b!210739 (not (contains!1381 (+!551 lt!108118 (tuple2!4099 lt!108115 lt!108117)) lt!108120))))

(assert (=> b!210739 (= lt!108119 (addStillNotContains!103 lt!108118 lt!108115 lt!108117 lt!108120))))

(assert (=> b!210739 (= lt!108120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210739 (= lt!108117 (get!2556 (select (arr!4752 lt!107895) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210739 (= lt!108115 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210739 (= lt!108118 call!19924)))

(declare-fun e!137206 () ListLongMap!3013)

(assert (=> b!210739 (= e!137206 (+!551 call!19924 (tuple2!4099 (select (arr!4751 _keys!825) #b00000000000000000000000000000000) (get!2556 (select (arr!4752 lt!107895) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210740 () Bool)

(declare-fun e!137211 () Bool)

(assert (=> b!210740 (= e!137208 e!137211)))

(assert (=> b!210740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun res!102835 () Bool)

(declare-fun lt!108116 () ListLongMap!3013)

(assert (=> b!210740 (= res!102835 (contains!1381 lt!108116 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210740 (=> (not res!102835) (not e!137211))))

(declare-fun b!210741 () Bool)

(declare-fun e!137207 () Bool)

(assert (=> b!210741 (= e!137207 (isEmpty!499 lt!108116))))

(declare-fun b!210742 () Bool)

(assert (=> b!210742 (= e!137210 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210742 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210743 () Bool)

(declare-fun res!102838 () Bool)

(assert (=> b!210743 (=> (not res!102838) (not e!137209))))

(assert (=> b!210743 (= res!102838 (not (contains!1381 lt!108116 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!58063 () Bool)

(assert (=> d!58063 e!137209))

(declare-fun res!102836 () Bool)

(assert (=> d!58063 (=> (not res!102836) (not e!137209))))

(assert (=> d!58063 (= res!102836 (not (contains!1381 lt!108116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!137212 () ListLongMap!3013)

(assert (=> d!58063 (= lt!108116 e!137212)))

(declare-fun c!35632 () Bool)

(assert (=> d!58063 (= c!35632 (bvsge #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58063 (validMask!0 mask!1149)))

(assert (=> d!58063 (= (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108116)))

(declare-fun b!210744 () Bool)

(assert (=> b!210744 (= e!137212 e!137206)))

(declare-fun c!35631 () Bool)

(assert (=> b!210744 (= c!35631 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210745 () Bool)

(assert (=> b!210745 (= e!137208 e!137207)))

(declare-fun c!35630 () Bool)

(assert (=> b!210745 (= c!35630 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210746 () Bool)

(assert (=> b!210746 (= e!137212 (ListLongMap!3014 Nil!2981))))

(declare-fun b!210747 () Bool)

(assert (=> b!210747 (= e!137206 call!19924)))

(declare-fun b!210748 () Bool)

(assert (=> b!210748 (= e!137207 (= lt!108116 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210749 () Bool)

(assert (=> b!210749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> b!210749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 lt!107895)))))

(assert (=> b!210749 (= e!137211 (= (apply!192 lt!108116 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)) (get!2556 (select (arr!4752 lt!107895) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!58063 c!35632) b!210746))

(assert (= (and d!58063 (not c!35632)) b!210744))

(assert (= (and b!210744 c!35631) b!210739))

(assert (= (and b!210744 (not c!35631)) b!210747))

(assert (= (or b!210739 b!210747) bm!19921))

(assert (= (and d!58063 res!102836) b!210743))

(assert (= (and b!210743 res!102838) b!210738))

(assert (= (and b!210738 res!102837) b!210742))

(assert (= (and b!210738 c!35629) b!210740))

(assert (= (and b!210738 (not c!35629)) b!210745))

(assert (= (and b!210740 res!102835) b!210749))

(assert (= (and b!210745 c!35630) b!210748))

(assert (= (and b!210745 (not c!35630)) b!210741))

(declare-fun b_lambda!7639 () Bool)

(assert (=> (not b_lambda!7639) (not b!210739)))

(assert (=> b!210739 t!7917))

(declare-fun b_and!12353 () Bool)

(assert (= b_and!12351 (and (=> t!7917 result!4971) b_and!12353)))

(declare-fun b_lambda!7641 () Bool)

(assert (=> (not b_lambda!7641) (not b!210749)))

(assert (=> b!210749 t!7917))

(declare-fun b_and!12355 () Bool)

(assert (= b_and!12353 (and (=> t!7917 result!4971) b_and!12355)))

(declare-fun m!238517 () Bool)

(assert (=> b!210743 m!238517))

(declare-fun m!238519 () Bool)

(assert (=> d!58063 m!238519))

(assert (=> d!58063 m!238185))

(declare-fun m!238521 () Bool)

(assert (=> bm!19921 m!238521))

(assert (=> b!210740 m!238419))

(assert (=> b!210740 m!238419))

(declare-fun m!238523 () Bool)

(assert (=> b!210740 m!238523))

(assert (=> b!210739 m!238483))

(assert (=> b!210739 m!238481))

(assert (=> b!210739 m!238419))

(declare-fun m!238525 () Bool)

(assert (=> b!210739 m!238525))

(assert (=> b!210739 m!238483))

(assert (=> b!210739 m!238481))

(assert (=> b!210739 m!238485))

(declare-fun m!238527 () Bool)

(assert (=> b!210739 m!238527))

(declare-fun m!238529 () Bool)

(assert (=> b!210739 m!238529))

(declare-fun m!238531 () Bool)

(assert (=> b!210739 m!238531))

(assert (=> b!210739 m!238527))

(assert (=> b!210742 m!238419))

(assert (=> b!210742 m!238419))

(assert (=> b!210742 m!238427))

(assert (=> b!210749 m!238483))

(assert (=> b!210749 m!238481))

(assert (=> b!210749 m!238419))

(assert (=> b!210749 m!238419))

(declare-fun m!238533 () Bool)

(assert (=> b!210749 m!238533))

(assert (=> b!210749 m!238483))

(assert (=> b!210749 m!238481))

(assert (=> b!210749 m!238485))

(assert (=> b!210748 m!238521))

(assert (=> b!210744 m!238419))

(assert (=> b!210744 m!238419))

(assert (=> b!210744 m!238427))

(declare-fun m!238535 () Bool)

(assert (=> b!210741 m!238535))

(assert (=> b!210536 d!58063))

(declare-fun b!210756 () Bool)

(declare-fun e!137218 () Bool)

(declare-fun e!137217 () Bool)

(assert (=> b!210756 (= e!137218 e!137217)))

(declare-fun c!35635 () Bool)

(assert (=> b!210756 (= c!35635 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun call!19929 () ListLongMap!3013)

(declare-fun call!19930 () ListLongMap!3013)

(declare-fun b!210757 () Bool)

(assert (=> b!210757 (= e!137217 (= call!19929 (+!551 call!19930 (tuple2!4099 k0!843 v!520))))))

(declare-fun bm!19926 () Bool)

(assert (=> bm!19926 (= call!19929 (getCurrentListMapNoExtraKeys!484 _keys!825 (array!10010 (store (arr!4752 _values!649) i!601 (ValueCellFull!2360 v!520)) (size!5077 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19927 () Bool)

(assert (=> bm!19927 (= call!19930 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58065 () Bool)

(assert (=> d!58065 e!137218))

(declare-fun res!102841 () Bool)

(assert (=> d!58065 (=> (not res!102841) (not e!137218))))

(assert (=> d!58065 (= res!102841 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5077 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5077 _values!649))))))))

(declare-fun lt!108124 () Unit!6382)

(declare-fun choose!1083 (array!10007 array!10009 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) (_ BitVec 64) V!6857 (_ BitVec 32) Int) Unit!6382)

(assert (=> d!58065 (= lt!108124 (choose!1083 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58065 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108124)))

(declare-fun b!210758 () Bool)

(assert (=> b!210758 (= e!137217 (= call!19929 call!19930))))

(assert (= (and d!58065 res!102841) b!210756))

(assert (= (and b!210756 c!35635) b!210757))

(assert (= (and b!210756 (not c!35635)) b!210758))

(assert (= (or b!210757 b!210758) bm!19926))

(assert (= (or b!210757 b!210758) bm!19927))

(declare-fun m!238537 () Bool)

(assert (=> b!210757 m!238537))

(assert (=> bm!19926 m!238201))

(declare-fun m!238539 () Bool)

(assert (=> bm!19926 m!238539))

(assert (=> bm!19927 m!238207))

(declare-fun m!238541 () Bool)

(assert (=> d!58065 m!238541))

(assert (=> b!210536 d!58065))

(declare-fun b!210759 () Bool)

(declare-fun e!137226 () ListLongMap!3013)

(declare-fun e!137219 () ListLongMap!3013)

(assert (=> b!210759 (= e!137226 e!137219)))

(declare-fun c!35638 () Bool)

(assert (=> b!210759 (= c!35638 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210760 () Bool)

(declare-fun call!19932 () ListLongMap!3013)

(assert (=> b!210760 (= e!137226 (+!551 call!19932 (tuple2!4099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19928 () Bool)

(declare-fun call!19935 () ListLongMap!3013)

(assert (=> bm!19928 (= call!19935 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210761 () Bool)

(declare-fun e!137224 () Bool)

(declare-fun e!137222 () Bool)

(assert (=> b!210761 (= e!137224 e!137222)))

(declare-fun c!35641 () Bool)

(assert (=> b!210761 (= c!35641 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210762 () Bool)

(declare-fun call!19934 () Bool)

(assert (=> b!210762 (= e!137222 (not call!19934))))

(declare-fun b!210764 () Bool)

(declare-fun e!137229 () Bool)

(assert (=> b!210764 (= e!137229 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19929 () Bool)

(declare-fun lt!108141 () ListLongMap!3013)

(assert (=> bm!19929 (= call!19934 (contains!1381 lt!108141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19930 () Bool)

(declare-fun call!19936 () ListLongMap!3013)

(assert (=> bm!19930 (= call!19936 call!19932)))

(declare-fun b!210765 () Bool)

(declare-fun e!137228 () Bool)

(declare-fun e!137231 () Bool)

(assert (=> b!210765 (= e!137228 e!137231)))

(declare-fun res!102844 () Bool)

(assert (=> b!210765 (=> (not res!102844) (not e!137231))))

(assert (=> b!210765 (= res!102844 (contains!1381 lt!108141 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210766 () Bool)

(declare-fun e!137223 () Bool)

(assert (=> b!210766 (= e!137222 e!137223)))

(declare-fun res!102845 () Bool)

(assert (=> b!210766 (= res!102845 call!19934)))

(assert (=> b!210766 (=> (not res!102845) (not e!137223))))

(declare-fun b!210767 () Bool)

(declare-fun e!137230 () ListLongMap!3013)

(assert (=> b!210767 (= e!137230 call!19936)))

(declare-fun c!35636 () Bool)

(declare-fun bm!19931 () Bool)

(declare-fun call!19933 () ListLongMap!3013)

(declare-fun call!19931 () ListLongMap!3013)

(assert (=> bm!19931 (= call!19932 (+!551 (ite c!35636 call!19935 (ite c!35638 call!19933 call!19931)) (ite (or c!35636 c!35638) (tuple2!4099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210768 () Bool)

(declare-fun e!137227 () Bool)

(assert (=> b!210768 (= e!137227 (= (apply!192 lt!108141 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210769 () Bool)

(declare-fun res!102850 () Bool)

(assert (=> b!210769 (=> (not res!102850) (not e!137224))))

(assert (=> b!210769 (= res!102850 e!137228)))

(declare-fun res!102849 () Bool)

(assert (=> b!210769 (=> res!102849 e!137228)))

(assert (=> b!210769 (= res!102849 (not e!137229))))

(declare-fun res!102847 () Bool)

(assert (=> b!210769 (=> (not res!102847) (not e!137229))))

(assert (=> b!210769 (= res!102847 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210770 () Bool)

(declare-fun e!137221 () Unit!6382)

(declare-fun Unit!6387 () Unit!6382)

(assert (=> b!210770 (= e!137221 Unit!6387)))

(declare-fun d!58067 () Bool)

(assert (=> d!58067 e!137224))

(declare-fun res!102846 () Bool)

(assert (=> d!58067 (=> (not res!102846) (not e!137224))))

(assert (=> d!58067 (= res!102846 (or (bvsge #b00000000000000000000000000000000 (size!5076 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))))

(declare-fun lt!108126 () ListLongMap!3013)

(assert (=> d!58067 (= lt!108141 lt!108126)))

(declare-fun lt!108127 () Unit!6382)

(assert (=> d!58067 (= lt!108127 e!137221)))

(declare-fun c!35639 () Bool)

(declare-fun e!137220 () Bool)

(assert (=> d!58067 (= c!35639 e!137220)))

(declare-fun res!102842 () Bool)

(assert (=> d!58067 (=> (not res!102842) (not e!137220))))

(assert (=> d!58067 (= res!102842 (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58067 (= lt!108126 e!137226)))

(assert (=> d!58067 (= c!35636 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58067 (validMask!0 mask!1149)))

(assert (=> d!58067 (= (getCurrentListMap!1061 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108141)))

(declare-fun b!210763 () Bool)

(declare-fun c!35637 () Bool)

(assert (=> b!210763 (= c!35637 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210763 (= e!137219 e!137230)))

(declare-fun b!210771 () Bool)

(assert (=> b!210771 (= e!137220 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210772 () Bool)

(declare-fun res!102848 () Bool)

(assert (=> b!210772 (=> (not res!102848) (not e!137224))))

(declare-fun e!137225 () Bool)

(assert (=> b!210772 (= res!102848 e!137225)))

(declare-fun c!35640 () Bool)

(assert (=> b!210772 (= c!35640 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210773 () Bool)

(assert (=> b!210773 (= e!137231 (= (apply!192 lt!108141 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)) (get!2556 (select (arr!4752 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _values!649)))))

(assert (=> b!210773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(declare-fun b!210774 () Bool)

(assert (=> b!210774 (= e!137230 call!19931)))

(declare-fun b!210775 () Bool)

(assert (=> b!210775 (= e!137223 (= (apply!192 lt!108141 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210776 () Bool)

(assert (=> b!210776 (= e!137225 e!137227)))

(declare-fun res!102843 () Bool)

(declare-fun call!19937 () Bool)

(assert (=> b!210776 (= res!102843 call!19937)))

(assert (=> b!210776 (=> (not res!102843) (not e!137227))))

(declare-fun b!210777 () Bool)

(assert (=> b!210777 (= e!137219 call!19936)))

(declare-fun bm!19932 () Bool)

(assert (=> bm!19932 (= call!19933 call!19935)))

(declare-fun bm!19933 () Bool)

(assert (=> bm!19933 (= call!19937 (contains!1381 lt!108141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210778 () Bool)

(declare-fun lt!108140 () Unit!6382)

(assert (=> b!210778 (= e!137221 lt!108140)))

(declare-fun lt!108134 () ListLongMap!3013)

(assert (=> b!210778 (= lt!108134 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108130 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108131 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108131 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108143 () Unit!6382)

(assert (=> b!210778 (= lt!108143 (addStillContains!168 lt!108134 lt!108130 zeroValue!615 lt!108131))))

(assert (=> b!210778 (contains!1381 (+!551 lt!108134 (tuple2!4099 lt!108130 zeroValue!615)) lt!108131)))

(declare-fun lt!108129 () Unit!6382)

(assert (=> b!210778 (= lt!108129 lt!108143)))

(declare-fun lt!108132 () ListLongMap!3013)

(assert (=> b!210778 (= lt!108132 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108145 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108125 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108125 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108142 () Unit!6382)

(assert (=> b!210778 (= lt!108142 (addApplyDifferent!168 lt!108132 lt!108145 minValue!615 lt!108125))))

(assert (=> b!210778 (= (apply!192 (+!551 lt!108132 (tuple2!4099 lt!108145 minValue!615)) lt!108125) (apply!192 lt!108132 lt!108125))))

(declare-fun lt!108128 () Unit!6382)

(assert (=> b!210778 (= lt!108128 lt!108142)))

(declare-fun lt!108136 () ListLongMap!3013)

(assert (=> b!210778 (= lt!108136 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108144 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108138 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108138 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108139 () Unit!6382)

(assert (=> b!210778 (= lt!108139 (addApplyDifferent!168 lt!108136 lt!108144 zeroValue!615 lt!108138))))

(assert (=> b!210778 (= (apply!192 (+!551 lt!108136 (tuple2!4099 lt!108144 zeroValue!615)) lt!108138) (apply!192 lt!108136 lt!108138))))

(declare-fun lt!108133 () Unit!6382)

(assert (=> b!210778 (= lt!108133 lt!108139)))

(declare-fun lt!108137 () ListLongMap!3013)

(assert (=> b!210778 (= lt!108137 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108146 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108146 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108135 () (_ BitVec 64))

(assert (=> b!210778 (= lt!108135 (select (arr!4751 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210778 (= lt!108140 (addApplyDifferent!168 lt!108137 lt!108146 minValue!615 lt!108135))))

(assert (=> b!210778 (= (apply!192 (+!551 lt!108137 (tuple2!4099 lt!108146 minValue!615)) lt!108135) (apply!192 lt!108137 lt!108135))))

(declare-fun bm!19934 () Bool)

(assert (=> bm!19934 (= call!19931 call!19933)))

(declare-fun b!210779 () Bool)

(assert (=> b!210779 (= e!137225 (not call!19937))))

(assert (= (and d!58067 c!35636) b!210760))

(assert (= (and d!58067 (not c!35636)) b!210759))

(assert (= (and b!210759 c!35638) b!210777))

(assert (= (and b!210759 (not c!35638)) b!210763))

(assert (= (and b!210763 c!35637) b!210767))

(assert (= (and b!210763 (not c!35637)) b!210774))

(assert (= (or b!210767 b!210774) bm!19934))

(assert (= (or b!210777 bm!19934) bm!19932))

(assert (= (or b!210777 b!210767) bm!19930))

(assert (= (or b!210760 bm!19932) bm!19928))

(assert (= (or b!210760 bm!19930) bm!19931))

(assert (= (and d!58067 res!102842) b!210771))

(assert (= (and d!58067 c!35639) b!210778))

(assert (= (and d!58067 (not c!35639)) b!210770))

(assert (= (and d!58067 res!102846) b!210769))

(assert (= (and b!210769 res!102847) b!210764))

(assert (= (and b!210769 (not res!102849)) b!210765))

(assert (= (and b!210765 res!102844) b!210773))

(assert (= (and b!210769 res!102850) b!210772))

(assert (= (and b!210772 c!35640) b!210776))

(assert (= (and b!210772 (not c!35640)) b!210779))

(assert (= (and b!210776 res!102843) b!210768))

(assert (= (or b!210776 b!210779) bm!19933))

(assert (= (and b!210772 res!102848) b!210761))

(assert (= (and b!210761 c!35641) b!210766))

(assert (= (and b!210761 (not c!35641)) b!210762))

(assert (= (and b!210766 res!102845) b!210775))

(assert (= (or b!210766 b!210762) bm!19929))

(declare-fun b_lambda!7643 () Bool)

(assert (=> (not b_lambda!7643) (not b!210773)))

(assert (=> b!210773 t!7917))

(declare-fun b_and!12357 () Bool)

(assert (= b_and!12355 (and (=> t!7917 result!4971) b_and!12357)))

(assert (=> b!210764 m!238419))

(assert (=> b!210764 m!238419))

(assert (=> b!210764 m!238427))

(assert (=> d!58067 m!238185))

(declare-fun m!238543 () Bool)

(assert (=> bm!19929 m!238543))

(declare-fun m!238545 () Bool)

(assert (=> b!210778 m!238545))

(declare-fun m!238547 () Bool)

(assert (=> b!210778 m!238547))

(declare-fun m!238549 () Bool)

(assert (=> b!210778 m!238549))

(declare-fun m!238551 () Bool)

(assert (=> b!210778 m!238551))

(assert (=> b!210778 m!238419))

(assert (=> b!210778 m!238549))

(declare-fun m!238553 () Bool)

(assert (=> b!210778 m!238553))

(declare-fun m!238555 () Bool)

(assert (=> b!210778 m!238555))

(declare-fun m!238557 () Bool)

(assert (=> b!210778 m!238557))

(assert (=> b!210778 m!238207))

(declare-fun m!238559 () Bool)

(assert (=> b!210778 m!238559))

(declare-fun m!238561 () Bool)

(assert (=> b!210778 m!238561))

(assert (=> b!210778 m!238559))

(declare-fun m!238563 () Bool)

(assert (=> b!210778 m!238563))

(declare-fun m!238565 () Bool)

(assert (=> b!210778 m!238565))

(assert (=> b!210778 m!238557))

(declare-fun m!238567 () Bool)

(assert (=> b!210778 m!238567))

(declare-fun m!238569 () Bool)

(assert (=> b!210778 m!238569))

(declare-fun m!238571 () Bool)

(assert (=> b!210778 m!238571))

(assert (=> b!210778 m!238553))

(declare-fun m!238573 () Bool)

(assert (=> b!210778 m!238573))

(declare-fun m!238575 () Bool)

(assert (=> bm!19933 m!238575))

(assert (=> b!210771 m!238419))

(assert (=> b!210771 m!238419))

(assert (=> b!210771 m!238427))

(assert (=> b!210765 m!238419))

(assert (=> b!210765 m!238419))

(declare-fun m!238577 () Bool)

(assert (=> b!210765 m!238577))

(declare-fun m!238579 () Bool)

(assert (=> b!210768 m!238579))

(assert (=> b!210773 m!238419))

(assert (=> b!210773 m!238419))

(declare-fun m!238581 () Bool)

(assert (=> b!210773 m!238581))

(assert (=> b!210773 m!238481))

(assert (=> b!210773 m!238501))

(assert (=> b!210773 m!238481))

(assert (=> b!210773 m!238505))

(assert (=> b!210773 m!238501))

(declare-fun m!238583 () Bool)

(assert (=> b!210775 m!238583))

(assert (=> bm!19928 m!238207))

(declare-fun m!238585 () Bool)

(assert (=> b!210760 m!238585))

(declare-fun m!238587 () Bool)

(assert (=> bm!19931 m!238587))

(assert (=> b!210536 d!58067))

(declare-fun d!58069 () Bool)

(assert (=> d!58069 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20956 d!58069))

(declare-fun d!58071 () Bool)

(assert (=> d!58071 (= (array_inv!3117 _values!649) (bvsge (size!5077 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20956 d!58071))

(declare-fun d!58073 () Bool)

(assert (=> d!58073 (= (array_inv!3118 _keys!825) (bvsge (size!5076 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20956 d!58073))

(declare-fun d!58075 () Bool)

(assert (=> d!58075 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210537 d!58075))

(declare-fun b!210790 () Bool)

(declare-fun e!137243 () Bool)

(declare-fun e!137241 () Bool)

(assert (=> b!210790 (= e!137243 e!137241)))

(declare-fun res!102858 () Bool)

(assert (=> b!210790 (=> (not res!102858) (not e!137241))))

(declare-fun e!137240 () Bool)

(assert (=> b!210790 (= res!102858 (not e!137240))))

(declare-fun res!102859 () Bool)

(assert (=> b!210790 (=> (not res!102859) (not e!137240))))

(assert (=> b!210790 (= res!102859 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210791 () Bool)

(declare-fun e!137242 () Bool)

(assert (=> b!210791 (= e!137241 e!137242)))

(declare-fun c!35644 () Bool)

(assert (=> b!210791 (= c!35644 (validKeyInArray!0 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210792 () Bool)

(declare-fun call!19940 () Bool)

(assert (=> b!210792 (= e!137242 call!19940)))

(declare-fun b!210793 () Bool)

(declare-fun contains!1383 (List!2983 (_ BitVec 64)) Bool)

(assert (=> b!210793 (= e!137240 (contains!1383 Nil!2980 (select (arr!4751 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210794 () Bool)

(assert (=> b!210794 (= e!137242 call!19940)))

(declare-fun bm!19937 () Bool)

(assert (=> bm!19937 (= call!19940 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35644 (Cons!2979 (select (arr!4751 _keys!825) #b00000000000000000000000000000000) Nil!2980) Nil!2980)))))

(declare-fun d!58077 () Bool)

(declare-fun res!102857 () Bool)

(assert (=> d!58077 (=> res!102857 e!137243)))

(assert (=> d!58077 (= res!102857 (bvsge #b00000000000000000000000000000000 (size!5076 _keys!825)))))

(assert (=> d!58077 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2980) e!137243)))

(assert (= (and d!58077 (not res!102857)) b!210790))

(assert (= (and b!210790 res!102859) b!210793))

(assert (= (and b!210790 res!102858) b!210791))

(assert (= (and b!210791 c!35644) b!210792))

(assert (= (and b!210791 (not c!35644)) b!210794))

(assert (= (or b!210792 b!210794) bm!19937))

(assert (=> b!210790 m!238419))

(assert (=> b!210790 m!238419))

(assert (=> b!210790 m!238427))

(assert (=> b!210791 m!238419))

(assert (=> b!210791 m!238419))

(assert (=> b!210791 m!238427))

(assert (=> b!210793 m!238419))

(assert (=> b!210793 m!238419))

(declare-fun m!238589 () Bool)

(assert (=> b!210793 m!238589))

(assert (=> bm!19937 m!238419))

(declare-fun m!238591 () Bool)

(assert (=> bm!19937 m!238591))

(assert (=> b!210532 d!58077))

(declare-fun b!210801 () Bool)

(declare-fun e!137249 () Bool)

(assert (=> b!210801 (= e!137249 tp_is_empty!5407)))

(declare-fun mapNonEmpty!9197 () Bool)

(declare-fun mapRes!9197 () Bool)

(declare-fun tp!19700 () Bool)

(assert (=> mapNonEmpty!9197 (= mapRes!9197 (and tp!19700 e!137249))))

(declare-fun mapRest!9197 () (Array (_ BitVec 32) ValueCell!2360))

(declare-fun mapValue!9197 () ValueCell!2360)

(declare-fun mapKey!9197 () (_ BitVec 32))

(assert (=> mapNonEmpty!9197 (= mapRest!9188 (store mapRest!9197 mapKey!9197 mapValue!9197))))

(declare-fun condMapEmpty!9197 () Bool)

(declare-fun mapDefault!9197 () ValueCell!2360)

(assert (=> mapNonEmpty!9188 (= condMapEmpty!9197 (= mapRest!9188 ((as const (Array (_ BitVec 32) ValueCell!2360)) mapDefault!9197)))))

(declare-fun e!137248 () Bool)

(assert (=> mapNonEmpty!9188 (= tp!19684 (and e!137248 mapRes!9197))))

(declare-fun b!210802 () Bool)

(assert (=> b!210802 (= e!137248 tp_is_empty!5407)))

(declare-fun mapIsEmpty!9197 () Bool)

(assert (=> mapIsEmpty!9197 mapRes!9197))

(assert (= (and mapNonEmpty!9188 condMapEmpty!9197) mapIsEmpty!9197))

(assert (= (and mapNonEmpty!9188 (not condMapEmpty!9197)) mapNonEmpty!9197))

(assert (= (and mapNonEmpty!9197 ((_ is ValueCellFull!2360) mapValue!9197)) b!210801))

(assert (= (and mapNonEmpty!9188 ((_ is ValueCellFull!2360) mapDefault!9197)) b!210802))

(declare-fun m!238593 () Bool)

(assert (=> mapNonEmpty!9197 m!238593))

(declare-fun b_lambda!7645 () Bool)

(assert (= b_lambda!7635 (or (and start!20956 b_free!5545) b_lambda!7645)))

(declare-fun b_lambda!7647 () Bool)

(assert (= b_lambda!7633 (or (and start!20956 b_free!5545) b_lambda!7647)))

(declare-fun b_lambda!7649 () Bool)

(assert (= b_lambda!7639 (or (and start!20956 b_free!5545) b_lambda!7649)))

(declare-fun b_lambda!7651 () Bool)

(assert (= b_lambda!7637 (or (and start!20956 b_free!5545) b_lambda!7651)))

(declare-fun b_lambda!7653 () Bool)

(assert (= b_lambda!7641 (or (and start!20956 b_free!5545) b_lambda!7653)))

(declare-fun b_lambda!7655 () Bool)

(assert (= b_lambda!7643 (or (and start!20956 b_free!5545) b_lambda!7655)))

(check-sat (not b!210768) (not b!210622) (not b!210635) (not b!210765) (not b!210617) tp_is_empty!5407 (not b!210760) (not bm!19911) (not b!210680) (not b!210775) (not b_next!5545) (not b!210731) (not d!58043) (not bm!19931) (not b_lambda!7653) (not b!210618) (not bm!19921) (not b_lambda!7649) (not b!210613) (not d!58049) (not bm!19916) (not b!210732) (not b!210620) (not b!210685) (not bm!19926) (not d!58063) (not b!210793) (not b!210695) (not d!58051) (not b_lambda!7645) (not b!210632) (not bm!19928) (not d!58059) (not b!210773) (not d!58065) (not bm!19927) (not b!210636) (not d!58041) (not b!210730) (not b!210736) (not b!210791) (not b!210619) (not b_lambda!7647) (not b!210610) (not bm!19933) (not bm!19929) (not d!58039) (not b!210771) (not b!210739) (not b!210684) b_and!12357 (not b!210616) (not b!210614) (not b!210729) (not b!210691) (not b!210743) (not b_lambda!7655) (not bm!19914) (not b!210693) (not b!210633) (not b!210688) (not b!210621) (not bm!19912) (not b!210698) (not b!210609) (not b!210737) (not b!210612) (not b!210611) (not d!58067) (not bm!19920) (not b!210615) (not b!210757) (not b!210728) (not bm!19937) (not bm!19896) (not b!210764) (not b!210790) (not b!210744) (not d!58045) (not b!210749) (not b!210727) (not b!210742) (not d!58053) (not d!58047) (not b_lambda!7651) (not b!210741) (not d!58061) (not b!210740) (not d!58057) (not b!210748) (not mapNonEmpty!9197) (not b!210778))
(check-sat b_and!12357 (not b_next!5545))
