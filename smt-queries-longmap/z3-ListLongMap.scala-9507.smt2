; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112958 () Bool)

(assert start!112958)

(declare-fun b_free!31045 () Bool)

(declare-fun b_next!31045 () Bool)

(assert (=> start!112958 (= b_free!31045 (not b_next!31045))))

(declare-fun tp!108779 () Bool)

(declare-fun b_and!50025 () Bool)

(assert (=> start!112958 (= tp!108779 b_and!50025)))

(declare-fun b!1338598 () Bool)

(declare-fun res!887975 () Bool)

(declare-fun e!762328 () Bool)

(assert (=> b!1338598 (=> (not res!887975) (not e!762328))))

(declare-datatypes ((array!90885 0))(
  ( (array!90886 (arr!43902 (Array (_ BitVec 32) (_ BitVec 64))) (size!44453 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90885)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338598 (= res!887975 (validKeyInArray!0 (select (arr!43902 _keys!1590) from!1980)))))

(declare-fun b!1338599 () Bool)

(declare-fun res!887979 () Bool)

(assert (=> b!1338599 (=> (not res!887979) (not e!762328))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1338599 (= res!887979 (not (= (select (arr!43902 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!887972 () Bool)

(assert (=> start!112958 (=> (not res!887972) (not e!762328))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112958 (= res!887972 (validMask!0 mask!1998))))

(assert (=> start!112958 e!762328))

(declare-datatypes ((V!54377 0))(
  ( (V!54378 (val!18552 Int)) )
))
(declare-datatypes ((ValueCell!17579 0))(
  ( (ValueCellFull!17579 (v!21188 V!54377)) (EmptyCell!17579) )
))
(declare-datatypes ((array!90887 0))(
  ( (array!90888 (arr!43903 (Array (_ BitVec 32) ValueCell!17579)) (size!44454 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90887)

(declare-fun e!762327 () Bool)

(declare-fun array_inv!33371 (array!90887) Bool)

(assert (=> start!112958 (and (array_inv!33371 _values!1320) e!762327)))

(assert (=> start!112958 true))

(declare-fun array_inv!33372 (array!90885) Bool)

(assert (=> start!112958 (array_inv!33372 _keys!1590)))

(assert (=> start!112958 tp!108779))

(declare-fun tp_is_empty!36955 () Bool)

(assert (=> start!112958 tp_is_empty!36955))

(declare-fun b!1338600 () Bool)

(declare-fun res!887976 () Bool)

(assert (=> b!1338600 (=> (not res!887976) (not e!762328))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1338600 (= res!887976 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44453 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338601 () Bool)

(declare-fun res!887974 () Bool)

(assert (=> b!1338601 (=> (not res!887974) (not e!762328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90885 (_ BitVec 32)) Bool)

(assert (=> b!1338601 (= res!887974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1338602 () Bool)

(declare-fun e!762326 () Bool)

(declare-fun mapRes!57113 () Bool)

(assert (=> b!1338602 (= e!762327 (and e!762326 mapRes!57113))))

(declare-fun condMapEmpty!57113 () Bool)

(declare-fun mapDefault!57113 () ValueCell!17579)

(assert (=> b!1338602 (= condMapEmpty!57113 (= (arr!43903 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17579)) mapDefault!57113)))))

(declare-fun b!1338603 () Bool)

(declare-fun res!887980 () Bool)

(assert (=> b!1338603 (=> (not res!887980) (not e!762328))))

(declare-datatypes ((List!31117 0))(
  ( (Nil!31114) (Cons!31113 (h!32331 (_ BitVec 64)) (t!45423 List!31117)) )
))
(declare-fun arrayNoDuplicates!0 (array!90885 (_ BitVec 32) List!31117) Bool)

(assert (=> b!1338603 (= res!887980 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31114))))

(declare-fun b!1338604 () Bool)

(declare-fun res!887977 () Bool)

(assert (=> b!1338604 (=> (not res!887977) (not e!762328))))

(assert (=> b!1338604 (= res!887977 (and (= (size!44454 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44453 _keys!1590) (size!44454 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57113 () Bool)

(assert (=> mapIsEmpty!57113 mapRes!57113))

(declare-fun b!1338605 () Bool)

(declare-fun res!887973 () Bool)

(assert (=> b!1338605 (=> (not res!887973) (not e!762328))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54377)

(declare-fun zeroValue!1262 () V!54377)

(declare-datatypes ((tuple2!23978 0))(
  ( (tuple2!23979 (_1!12000 (_ BitVec 64)) (_2!12000 V!54377)) )
))
(declare-datatypes ((List!31118 0))(
  ( (Nil!31115) (Cons!31114 (h!32332 tuple2!23978) (t!45424 List!31118)) )
))
(declare-datatypes ((ListLongMap!21643 0))(
  ( (ListLongMap!21644 (toList!10837 List!31118)) )
))
(declare-fun contains!9016 (ListLongMap!21643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5791 (array!90885 array!90887 (_ BitVec 32) (_ BitVec 32) V!54377 V!54377 (_ BitVec 32) Int) ListLongMap!21643)

(assert (=> b!1338605 (= res!887973 (contains!9016 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1338606 () Bool)

(assert (=> b!1338606 (= e!762326 tp_is_empty!36955)))

(declare-fun b!1338607 () Bool)

(declare-fun +!4782 (ListLongMap!21643 tuple2!23978) ListLongMap!21643)

(declare-fun getCurrentListMapNoExtraKeys!6431 (array!90885 array!90887 (_ BitVec 32) (_ BitVec 32) V!54377 V!54377 (_ BitVec 32) Int) ListLongMap!21643)

(declare-fun get!22168 (ValueCell!17579 V!54377) V!54377)

(declare-fun dynLambda!3736 (Int (_ BitVec 64)) V!54377)

(assert (=> b!1338607 (= e!762328 (not (contains!9016 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153)))))

(declare-fun b!1338608 () Bool)

(declare-fun res!887978 () Bool)

(assert (=> b!1338608 (=> (not res!887978) (not e!762328))))

(assert (=> b!1338608 (= res!887978 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1338609 () Bool)

(declare-fun e!762325 () Bool)

(assert (=> b!1338609 (= e!762325 tp_is_empty!36955)))

(declare-fun mapNonEmpty!57113 () Bool)

(declare-fun tp!108778 () Bool)

(assert (=> mapNonEmpty!57113 (= mapRes!57113 (and tp!108778 e!762325))))

(declare-fun mapRest!57113 () (Array (_ BitVec 32) ValueCell!17579))

(declare-fun mapKey!57113 () (_ BitVec 32))

(declare-fun mapValue!57113 () ValueCell!17579)

(assert (=> mapNonEmpty!57113 (= (arr!43903 _values!1320) (store mapRest!57113 mapKey!57113 mapValue!57113))))

(assert (= (and start!112958 res!887972) b!1338604))

(assert (= (and b!1338604 res!887977) b!1338601))

(assert (= (and b!1338601 res!887974) b!1338603))

(assert (= (and b!1338603 res!887980) b!1338600))

(assert (= (and b!1338600 res!887976) b!1338605))

(assert (= (and b!1338605 res!887973) b!1338599))

(assert (= (and b!1338599 res!887979) b!1338598))

(assert (= (and b!1338598 res!887975) b!1338608))

(assert (= (and b!1338608 res!887978) b!1338607))

(assert (= (and b!1338602 condMapEmpty!57113) mapIsEmpty!57113))

(assert (= (and b!1338602 (not condMapEmpty!57113)) mapNonEmpty!57113))

(get-info :version)

(assert (= (and mapNonEmpty!57113 ((_ is ValueCellFull!17579) mapValue!57113)) b!1338609))

(assert (= (and b!1338602 ((_ is ValueCellFull!17579) mapDefault!57113)) b!1338606))

(assert (= start!112958 b!1338602))

(declare-fun b_lambda!24203 () Bool)

(assert (=> (not b_lambda!24203) (not b!1338607)))

(declare-fun t!45422 () Bool)

(declare-fun tb!12109 () Bool)

(assert (=> (and start!112958 (= defaultEntry!1323 defaultEntry!1323) t!45422) tb!12109))

(declare-fun result!25301 () Bool)

(assert (=> tb!12109 (= result!25301 tp_is_empty!36955)))

(assert (=> b!1338607 t!45422))

(declare-fun b_and!50027 () Bool)

(assert (= b_and!50025 (and (=> t!45422 result!25301) b_and!50027)))

(declare-fun m!1226953 () Bool)

(assert (=> b!1338599 m!1226953))

(declare-fun m!1226955 () Bool)

(assert (=> b!1338603 m!1226955))

(declare-fun m!1226957 () Bool)

(assert (=> mapNonEmpty!57113 m!1226957))

(assert (=> b!1338598 m!1226953))

(assert (=> b!1338598 m!1226953))

(declare-fun m!1226959 () Bool)

(assert (=> b!1338598 m!1226959))

(declare-fun m!1226961 () Bool)

(assert (=> b!1338601 m!1226961))

(declare-fun m!1226963 () Bool)

(assert (=> b!1338605 m!1226963))

(assert (=> b!1338605 m!1226963))

(declare-fun m!1226965 () Bool)

(assert (=> b!1338605 m!1226965))

(declare-fun m!1226967 () Bool)

(assert (=> start!112958 m!1226967))

(declare-fun m!1226969 () Bool)

(assert (=> start!112958 m!1226969))

(declare-fun m!1226971 () Bool)

(assert (=> start!112958 m!1226971))

(declare-fun m!1226973 () Bool)

(assert (=> b!1338607 m!1226973))

(declare-fun m!1226975 () Bool)

(assert (=> b!1338607 m!1226975))

(declare-fun m!1226977 () Bool)

(assert (=> b!1338607 m!1226977))

(declare-fun m!1226979 () Bool)

(assert (=> b!1338607 m!1226979))

(assert (=> b!1338607 m!1226973))

(declare-fun m!1226981 () Bool)

(assert (=> b!1338607 m!1226981))

(assert (=> b!1338607 m!1226977))

(declare-fun m!1226983 () Bool)

(assert (=> b!1338607 m!1226983))

(assert (=> b!1338607 m!1226975))

(assert (=> b!1338607 m!1226979))

(assert (=> b!1338607 m!1226953))

(check-sat (not b!1338598) (not start!112958) (not b!1338601) tp_is_empty!36955 (not b_lambda!24203) (not b!1338603) (not b!1338607) (not b!1338605) (not b_next!31045) (not mapNonEmpty!57113) b_and!50027)
(check-sat b_and!50027 (not b_next!31045))
(get-model)

(declare-fun b_lambda!24209 () Bool)

(assert (= b_lambda!24203 (or (and start!112958 b_free!31045) b_lambda!24209)))

(check-sat (not b!1338598) (not b!1338601) tp_is_empty!36955 (not b!1338603) (not b!1338607) (not b!1338605) (not b_next!31045) (not mapNonEmpty!57113) b_and!50027 (not b_lambda!24209) (not start!112958))
(check-sat b_and!50027 (not b_next!31045))
(get-model)

(declare-fun d!144181 () Bool)

(declare-fun e!762365 () Bool)

(assert (=> d!144181 e!762365))

(declare-fun res!888037 () Bool)

(assert (=> d!144181 (=> res!888037 e!762365)))

(declare-fun lt!593574 () Bool)

(assert (=> d!144181 (= res!888037 (not lt!593574))))

(declare-fun lt!593576 () Bool)

(assert (=> d!144181 (= lt!593574 lt!593576)))

(declare-datatypes ((Unit!43880 0))(
  ( (Unit!43881) )
))
(declare-fun lt!593573 () Unit!43880)

(declare-fun e!762364 () Unit!43880)

(assert (=> d!144181 (= lt!593573 e!762364)))

(declare-fun c!126459 () Bool)

(assert (=> d!144181 (= c!126459 lt!593576)))

(declare-fun containsKey!739 (List!31118 (_ BitVec 64)) Bool)

(assert (=> d!144181 (= lt!593576 (containsKey!739 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (=> d!144181 (= (contains!9016 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153) lt!593574)))

(declare-fun b!1338694 () Bool)

(declare-fun lt!593575 () Unit!43880)

(assert (=> b!1338694 (= e!762364 lt!593575)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!485 (List!31118 (_ BitVec 64)) Unit!43880)

(assert (=> b!1338694 (= lt!593575 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-datatypes ((Option!764 0))(
  ( (Some!763 (v!21191 V!54377)) (None!762) )
))
(declare-fun isDefined!522 (Option!764) Bool)

(declare-fun getValueByKey!713 (List!31118 (_ BitVec 64)) Option!764)

(assert (=> b!1338694 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun b!1338695 () Bool)

(declare-fun Unit!43882 () Unit!43880)

(assert (=> b!1338695 (= e!762364 Unit!43882)))

(declare-fun b!1338696 () Bool)

(assert (=> b!1338696 (= e!762365 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153)))))

(assert (= (and d!144181 c!126459) b!1338694))

(assert (= (and d!144181 (not c!126459)) b!1338695))

(assert (= (and d!144181 (not res!888037)) b!1338696))

(declare-fun m!1227049 () Bool)

(assert (=> d!144181 m!1227049))

(declare-fun m!1227051 () Bool)

(assert (=> b!1338694 m!1227051))

(declare-fun m!1227053 () Bool)

(assert (=> b!1338694 m!1227053))

(assert (=> b!1338694 m!1227053))

(declare-fun m!1227055 () Bool)

(assert (=> b!1338694 m!1227055))

(assert (=> b!1338696 m!1227053))

(assert (=> b!1338696 m!1227053))

(assert (=> b!1338696 m!1227055))

(assert (=> b!1338607 d!144181))

(declare-fun d!144183 () Bool)

(declare-fun e!762368 () Bool)

(assert (=> d!144183 e!762368))

(declare-fun res!888042 () Bool)

(assert (=> d!144183 (=> (not res!888042) (not e!762368))))

(declare-fun lt!593585 () ListLongMap!21643)

(assert (=> d!144183 (= res!888042 (contains!9016 lt!593585 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593587 () List!31118)

(assert (=> d!144183 (= lt!593585 (ListLongMap!21644 lt!593587))))

(declare-fun lt!593586 () Unit!43880)

(declare-fun lt!593588 () Unit!43880)

(assert (=> d!144183 (= lt!593586 lt!593588)))

(assert (=> d!144183 (= (getValueByKey!713 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!363 (List!31118 (_ BitVec 64) V!54377) Unit!43880)

(assert (=> d!144183 (= lt!593588 (lemmaContainsTupThenGetReturnValue!363 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!492 (List!31118 (_ BitVec 64) V!54377) List!31118)

(assert (=> d!144183 (= lt!593587 (insertStrictlySorted!492 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144183 (= (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593585)))

(declare-fun b!1338701 () Bool)

(declare-fun res!888043 () Bool)

(assert (=> b!1338701 (=> (not res!888043) (not e!762368))))

(assert (=> b!1338701 (= res!888043 (= (getValueByKey!713 (toList!10837 lt!593585) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1338702 () Bool)

(declare-fun contains!9018 (List!31118 tuple2!23978) Bool)

(assert (=> b!1338702 (= e!762368 (contains!9018 (toList!10837 lt!593585) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144183 res!888042) b!1338701))

(assert (= (and b!1338701 res!888043) b!1338702))

(declare-fun m!1227057 () Bool)

(assert (=> d!144183 m!1227057))

(declare-fun m!1227059 () Bool)

(assert (=> d!144183 m!1227059))

(declare-fun m!1227061 () Bool)

(assert (=> d!144183 m!1227061))

(declare-fun m!1227063 () Bool)

(assert (=> d!144183 m!1227063))

(declare-fun m!1227065 () Bool)

(assert (=> b!1338701 m!1227065))

(declare-fun m!1227067 () Bool)

(assert (=> b!1338702 m!1227067))

(assert (=> b!1338607 d!144183))

(declare-fun bm!64970 () Bool)

(declare-fun call!64973 () ListLongMap!21643)

(assert (=> bm!64970 (= call!64973 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338728 () Bool)

(declare-fun res!888054 () Bool)

(declare-fun e!762387 () Bool)

(assert (=> b!1338728 (=> (not res!888054) (not e!762387))))

(declare-fun lt!593605 () ListLongMap!21643)

(assert (=> b!1338728 (= res!888054 (not (contains!9016 lt!593605 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338729 () Bool)

(declare-fun e!762386 () Bool)

(assert (=> b!1338729 (= e!762387 e!762386)))

(declare-fun c!126470 () Bool)

(declare-fun e!762383 () Bool)

(assert (=> b!1338729 (= c!126470 e!762383)))

(declare-fun res!888052 () Bool)

(assert (=> b!1338729 (=> (not res!888052) (not e!762383))))

(assert (=> b!1338729 (= res!888052 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44453 _keys!1590)))))

(declare-fun b!1338730 () Bool)

(assert (=> b!1338730 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44453 _keys!1590)))))

(assert (=> b!1338730 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44454 _values!1320)))))

(declare-fun e!762385 () Bool)

(declare-fun apply!1043 (ListLongMap!21643 (_ BitVec 64)) V!54377)

(assert (=> b!1338730 (= e!762385 (= (apply!1043 lt!593605 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!144185 () Bool)

(assert (=> d!144185 e!762387))

(declare-fun res!888053 () Bool)

(assert (=> d!144185 (=> (not res!888053) (not e!762387))))

(assert (=> d!144185 (= res!888053 (not (contains!9016 lt!593605 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762389 () ListLongMap!21643)

(assert (=> d!144185 (= lt!593605 e!762389)))

(declare-fun c!126468 () Bool)

(assert (=> d!144185 (= c!126468 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44453 _keys!1590)))))

(assert (=> d!144185 (validMask!0 mask!1998)))

(assert (=> d!144185 (= (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593605)))

(declare-fun b!1338727 () Bool)

(declare-fun e!762388 () Bool)

(assert (=> b!1338727 (= e!762388 (= lt!593605 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1338731 () Bool)

(declare-fun e!762384 () ListLongMap!21643)

(assert (=> b!1338731 (= e!762389 e!762384)))

(declare-fun c!126471 () Bool)

(assert (=> b!1338731 (= c!126471 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338732 () Bool)

(declare-fun isEmpty!1089 (ListLongMap!21643) Bool)

(assert (=> b!1338732 (= e!762388 (isEmpty!1089 lt!593605))))

(declare-fun b!1338733 () Bool)

(assert (=> b!1338733 (= e!762389 (ListLongMap!21644 Nil!31115))))

(declare-fun b!1338734 () Bool)

(declare-fun lt!593607 () Unit!43880)

(declare-fun lt!593609 () Unit!43880)

(assert (=> b!1338734 (= lt!593607 lt!593609)))

(declare-fun lt!593608 () ListLongMap!21643)

(declare-fun lt!593606 () (_ BitVec 64))

(declare-fun lt!593604 () V!54377)

(declare-fun lt!593603 () (_ BitVec 64))

(assert (=> b!1338734 (not (contains!9016 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604)) lt!593603))))

(declare-fun addStillNotContains!499 (ListLongMap!21643 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43880)

(assert (=> b!1338734 (= lt!593609 (addStillNotContains!499 lt!593608 lt!593606 lt!593604 lt!593603))))

(assert (=> b!1338734 (= lt!593603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338734 (= lt!593604 (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338734 (= lt!593606 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338734 (= lt!593608 call!64973)))

(assert (=> b!1338734 (= e!762384 (+!4782 call!64973 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338735 () Bool)

(assert (=> b!1338735 (= e!762384 call!64973)))

(declare-fun b!1338736 () Bool)

(assert (=> b!1338736 (= e!762383 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338736 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1338737 () Bool)

(assert (=> b!1338737 (= e!762386 e!762388)))

(declare-fun c!126469 () Bool)

(assert (=> b!1338737 (= c!126469 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44453 _keys!1590)))))

(declare-fun b!1338738 () Bool)

(assert (=> b!1338738 (= e!762386 e!762385)))

(assert (=> b!1338738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44453 _keys!1590)))))

(declare-fun res!888055 () Bool)

(assert (=> b!1338738 (= res!888055 (contains!9016 lt!593605 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338738 (=> (not res!888055) (not e!762385))))

(assert (= (and d!144185 c!126468) b!1338733))

(assert (= (and d!144185 (not c!126468)) b!1338731))

(assert (= (and b!1338731 c!126471) b!1338734))

(assert (= (and b!1338731 (not c!126471)) b!1338735))

(assert (= (or b!1338734 b!1338735) bm!64970))

(assert (= (and d!144185 res!888053) b!1338728))

(assert (= (and b!1338728 res!888054) b!1338729))

(assert (= (and b!1338729 res!888052) b!1338736))

(assert (= (and b!1338729 c!126470) b!1338738))

(assert (= (and b!1338729 (not c!126470)) b!1338737))

(assert (= (and b!1338738 res!888055) b!1338730))

(assert (= (and b!1338737 c!126469) b!1338727))

(assert (= (and b!1338737 (not c!126469)) b!1338732))

(declare-fun b_lambda!24211 () Bool)

(assert (=> (not b_lambda!24211) (not b!1338730)))

(assert (=> b!1338730 t!45422))

(declare-fun b_and!50037 () Bool)

(assert (= b_and!50027 (and (=> t!45422 result!25301) b_and!50037)))

(declare-fun b_lambda!24213 () Bool)

(assert (=> (not b_lambda!24213) (not b!1338734)))

(assert (=> b!1338734 t!45422))

(declare-fun b_and!50039 () Bool)

(assert (= b_and!50037 (and (=> t!45422 result!25301) b_and!50039)))

(declare-fun m!1227069 () Bool)

(assert (=> bm!64970 m!1227069))

(declare-fun m!1227071 () Bool)

(assert (=> b!1338736 m!1227071))

(assert (=> b!1338736 m!1227071))

(declare-fun m!1227073 () Bool)

(assert (=> b!1338736 m!1227073))

(declare-fun m!1227075 () Bool)

(assert (=> d!144185 m!1227075))

(assert (=> d!144185 m!1226967))

(assert (=> b!1338731 m!1227071))

(assert (=> b!1338731 m!1227071))

(assert (=> b!1338731 m!1227073))

(assert (=> b!1338738 m!1227071))

(assert (=> b!1338738 m!1227071))

(declare-fun m!1227077 () Bool)

(assert (=> b!1338738 m!1227077))

(declare-fun m!1227079 () Bool)

(assert (=> b!1338728 m!1227079))

(assert (=> b!1338727 m!1227069))

(declare-fun m!1227081 () Bool)

(assert (=> b!1338734 m!1227081))

(declare-fun m!1227083 () Bool)

(assert (=> b!1338734 m!1227083))

(declare-fun m!1227085 () Bool)

(assert (=> b!1338734 m!1227085))

(declare-fun m!1227087 () Bool)

(assert (=> b!1338734 m!1227087))

(assert (=> b!1338734 m!1227083))

(assert (=> b!1338734 m!1226973))

(declare-fun m!1227089 () Bool)

(assert (=> b!1338734 m!1227089))

(declare-fun m!1227091 () Bool)

(assert (=> b!1338734 m!1227091))

(assert (=> b!1338734 m!1227085))

(assert (=> b!1338734 m!1226973))

(assert (=> b!1338734 m!1227071))

(assert (=> b!1338730 m!1227083))

(assert (=> b!1338730 m!1227083))

(assert (=> b!1338730 m!1226973))

(assert (=> b!1338730 m!1227089))

(assert (=> b!1338730 m!1227071))

(declare-fun m!1227093 () Bool)

(assert (=> b!1338730 m!1227093))

(assert (=> b!1338730 m!1226973))

(assert (=> b!1338730 m!1227071))

(declare-fun m!1227095 () Bool)

(assert (=> b!1338732 m!1227095))

(assert (=> b!1338607 d!144185))

(declare-fun d!144187 () Bool)

(declare-fun c!126474 () Bool)

(assert (=> d!144187 (= c!126474 ((_ is ValueCellFull!17579) (select (arr!43903 _values!1320) from!1980)))))

(declare-fun e!762392 () V!54377)

(assert (=> d!144187 (= (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762392)))

(declare-fun b!1338743 () Bool)

(declare-fun get!22170 (ValueCell!17579 V!54377) V!54377)

(assert (=> b!1338743 (= e!762392 (get!22170 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338744 () Bool)

(declare-fun get!22171 (ValueCell!17579 V!54377) V!54377)

(assert (=> b!1338744 (= e!762392 (get!22171 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144187 c!126474) b!1338743))

(assert (= (and d!144187 (not c!126474)) b!1338744))

(assert (=> b!1338743 m!1226979))

(assert (=> b!1338743 m!1226973))

(declare-fun m!1227097 () Bool)

(assert (=> b!1338743 m!1227097))

(assert (=> b!1338744 m!1226979))

(assert (=> b!1338744 m!1226973))

(declare-fun m!1227099 () Bool)

(assert (=> b!1338744 m!1227099))

(assert (=> b!1338607 d!144187))

(declare-fun d!144189 () Bool)

(assert (=> d!144189 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112958 d!144189))

(declare-fun d!144191 () Bool)

(assert (=> d!144191 (= (array_inv!33371 _values!1320) (bvsge (size!44454 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112958 d!144191))

(declare-fun d!144193 () Bool)

(assert (=> d!144193 (= (array_inv!33372 _keys!1590) (bvsge (size!44453 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112958 d!144193))

(declare-fun d!144195 () Bool)

(assert (=> d!144195 (= (validKeyInArray!0 (select (arr!43902 _keys!1590) from!1980)) (and (not (= (select (arr!43902 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43902 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338598 d!144195))

(declare-fun b!1338755 () Bool)

(declare-fun e!762401 () Bool)

(declare-fun e!762402 () Bool)

(assert (=> b!1338755 (= e!762401 e!762402)))

(declare-fun c!126477 () Bool)

(assert (=> b!1338755 (= c!126477 (validKeyInArray!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!144197 () Bool)

(declare-fun res!888064 () Bool)

(declare-fun e!762403 () Bool)

(assert (=> d!144197 (=> res!888064 e!762403)))

(assert (=> d!144197 (= res!888064 (bvsge #b00000000000000000000000000000000 (size!44453 _keys!1590)))))

(assert (=> d!144197 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31114) e!762403)))

(declare-fun b!1338756 () Bool)

(declare-fun call!64976 () Bool)

(assert (=> b!1338756 (= e!762402 call!64976)))

(declare-fun b!1338757 () Bool)

(assert (=> b!1338757 (= e!762402 call!64976)))

(declare-fun bm!64973 () Bool)

(assert (=> bm!64973 (= call!64976 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126477 (Cons!31113 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) Nil!31114) Nil!31114)))))

(declare-fun b!1338758 () Bool)

(assert (=> b!1338758 (= e!762403 e!762401)))

(declare-fun res!888063 () Bool)

(assert (=> b!1338758 (=> (not res!888063) (not e!762401))))

(declare-fun e!762404 () Bool)

(assert (=> b!1338758 (= res!888063 (not e!762404))))

(declare-fun res!888062 () Bool)

(assert (=> b!1338758 (=> (not res!888062) (not e!762404))))

(assert (=> b!1338758 (= res!888062 (validKeyInArray!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338759 () Bool)

(declare-fun contains!9019 (List!31117 (_ BitVec 64)) Bool)

(assert (=> b!1338759 (= e!762404 (contains!9019 Nil!31114 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144197 (not res!888064)) b!1338758))

(assert (= (and b!1338758 res!888062) b!1338759))

(assert (= (and b!1338758 res!888063) b!1338755))

(assert (= (and b!1338755 c!126477) b!1338757))

(assert (= (and b!1338755 (not c!126477)) b!1338756))

(assert (= (or b!1338757 b!1338756) bm!64973))

(declare-fun m!1227101 () Bool)

(assert (=> b!1338755 m!1227101))

(assert (=> b!1338755 m!1227101))

(declare-fun m!1227103 () Bool)

(assert (=> b!1338755 m!1227103))

(assert (=> bm!64973 m!1227101))

(declare-fun m!1227105 () Bool)

(assert (=> bm!64973 m!1227105))

(assert (=> b!1338758 m!1227101))

(assert (=> b!1338758 m!1227101))

(assert (=> b!1338758 m!1227103))

(assert (=> b!1338759 m!1227101))

(assert (=> b!1338759 m!1227101))

(declare-fun m!1227107 () Bool)

(assert (=> b!1338759 m!1227107))

(assert (=> b!1338603 d!144197))

(declare-fun b!1338768 () Bool)

(declare-fun e!762413 () Bool)

(declare-fun call!64979 () Bool)

(assert (=> b!1338768 (= e!762413 call!64979)))

(declare-fun d!144199 () Bool)

(declare-fun res!888069 () Bool)

(declare-fun e!762411 () Bool)

(assert (=> d!144199 (=> res!888069 e!762411)))

(assert (=> d!144199 (= res!888069 (bvsge #b00000000000000000000000000000000 (size!44453 _keys!1590)))))

(assert (=> d!144199 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!762411)))

(declare-fun bm!64976 () Bool)

(assert (=> bm!64976 (= call!64979 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1338769 () Bool)

(declare-fun e!762412 () Bool)

(assert (=> b!1338769 (= e!762412 call!64979)))

(declare-fun b!1338770 () Bool)

(assert (=> b!1338770 (= e!762413 e!762412)))

(declare-fun lt!593617 () (_ BitVec 64))

(assert (=> b!1338770 (= lt!593617 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593616 () Unit!43880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90885 (_ BitVec 64) (_ BitVec 32)) Unit!43880)

(assert (=> b!1338770 (= lt!593616 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593617 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338770 (arrayContainsKey!0 _keys!1590 lt!593617 #b00000000000000000000000000000000)))

(declare-fun lt!593618 () Unit!43880)

(assert (=> b!1338770 (= lt!593618 lt!593616)))

(declare-fun res!888070 () Bool)

(declare-datatypes ((SeekEntryResult!10005 0))(
  ( (MissingZero!10005 (index!42391 (_ BitVec 32))) (Found!10005 (index!42392 (_ BitVec 32))) (Intermediate!10005 (undefined!10817 Bool) (index!42393 (_ BitVec 32)) (x!119460 (_ BitVec 32))) (Undefined!10005) (MissingVacant!10005 (index!42394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90885 (_ BitVec 32)) SeekEntryResult!10005)

(assert (=> b!1338770 (= res!888070 (= (seekEntryOrOpen!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10005 #b00000000000000000000000000000000)))))

(assert (=> b!1338770 (=> (not res!888070) (not e!762412))))

(declare-fun b!1338771 () Bool)

(assert (=> b!1338771 (= e!762411 e!762413)))

(declare-fun c!126480 () Bool)

(assert (=> b!1338771 (= c!126480 (validKeyInArray!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144199 (not res!888069)) b!1338771))

(assert (= (and b!1338771 c!126480) b!1338770))

(assert (= (and b!1338771 (not c!126480)) b!1338768))

(assert (= (and b!1338770 res!888070) b!1338769))

(assert (= (or b!1338769 b!1338768) bm!64976))

(declare-fun m!1227109 () Bool)

(assert (=> bm!64976 m!1227109))

(assert (=> b!1338770 m!1227101))

(declare-fun m!1227111 () Bool)

(assert (=> b!1338770 m!1227111))

(declare-fun m!1227113 () Bool)

(assert (=> b!1338770 m!1227113))

(assert (=> b!1338770 m!1227101))

(declare-fun m!1227115 () Bool)

(assert (=> b!1338770 m!1227115))

(assert (=> b!1338771 m!1227101))

(assert (=> b!1338771 m!1227101))

(assert (=> b!1338771 m!1227103))

(assert (=> b!1338601 d!144199))

(declare-fun d!144201 () Bool)

(declare-fun e!762415 () Bool)

(assert (=> d!144201 e!762415))

(declare-fun res!888071 () Bool)

(assert (=> d!144201 (=> res!888071 e!762415)))

(declare-fun lt!593620 () Bool)

(assert (=> d!144201 (= res!888071 (not lt!593620))))

(declare-fun lt!593622 () Bool)

(assert (=> d!144201 (= lt!593620 lt!593622)))

(declare-fun lt!593619 () Unit!43880)

(declare-fun e!762414 () Unit!43880)

(assert (=> d!144201 (= lt!593619 e!762414)))

(declare-fun c!126481 () Bool)

(assert (=> d!144201 (= c!126481 lt!593622)))

(assert (=> d!144201 (= lt!593622 (containsKey!739 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!144201 (= (contains!9016 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593620)))

(declare-fun b!1338772 () Bool)

(declare-fun lt!593621 () Unit!43880)

(assert (=> b!1338772 (= e!762414 lt!593621)))

(assert (=> b!1338772 (= lt!593621 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1338772 (isDefined!522 (getValueByKey!713 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1338773 () Bool)

(declare-fun Unit!43883 () Unit!43880)

(assert (=> b!1338773 (= e!762414 Unit!43883)))

(declare-fun b!1338774 () Bool)

(assert (=> b!1338774 (= e!762415 (isDefined!522 (getValueByKey!713 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144201 c!126481) b!1338772))

(assert (= (and d!144201 (not c!126481)) b!1338773))

(assert (= (and d!144201 (not res!888071)) b!1338774))

(declare-fun m!1227117 () Bool)

(assert (=> d!144201 m!1227117))

(declare-fun m!1227119 () Bool)

(assert (=> b!1338772 m!1227119))

(declare-fun m!1227121 () Bool)

(assert (=> b!1338772 m!1227121))

(assert (=> b!1338772 m!1227121))

(declare-fun m!1227123 () Bool)

(assert (=> b!1338772 m!1227123))

(assert (=> b!1338774 m!1227121))

(assert (=> b!1338774 m!1227121))

(assert (=> b!1338774 m!1227123))

(assert (=> b!1338605 d!144201))

(declare-fun b!1338817 () Bool)

(declare-fun e!762450 () Bool)

(declare-fun call!64999 () Bool)

(assert (=> b!1338817 (= e!762450 (not call!64999))))

(declare-fun call!64997 () ListLongMap!21643)

(declare-fun bm!64991 () Bool)

(assert (=> bm!64991 (= call!64997 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1338818 () Bool)

(declare-fun e!762443 () Bool)

(assert (=> b!1338818 (= e!762443 e!762450)))

(declare-fun c!126497 () Bool)

(assert (=> b!1338818 (= c!126497 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338819 () Bool)

(declare-fun e!762451 () Bool)

(declare-fun e!762442 () Bool)

(assert (=> b!1338819 (= e!762451 e!762442)))

(declare-fun res!888092 () Bool)

(declare-fun call!64994 () Bool)

(assert (=> b!1338819 (= res!888092 call!64994)))

(assert (=> b!1338819 (=> (not res!888092) (not e!762442))))

(declare-fun b!1338820 () Bool)

(declare-fun e!762445 () ListLongMap!21643)

(declare-fun call!64998 () ListLongMap!21643)

(assert (=> b!1338820 (= e!762445 (+!4782 call!64998 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1338821 () Bool)

(declare-fun e!762452 () ListLongMap!21643)

(assert (=> b!1338821 (= e!762445 e!762452)))

(declare-fun c!126494 () Bool)

(assert (=> b!1338821 (= c!126494 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!144203 () Bool)

(assert (=> d!144203 e!762443))

(declare-fun res!888091 () Bool)

(assert (=> d!144203 (=> (not res!888091) (not e!762443))))

(assert (=> d!144203 (= res!888091 (or (bvsge from!1980 (size!44453 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44453 _keys!1590)))))))

(declare-fun lt!593681 () ListLongMap!21643)

(declare-fun lt!593682 () ListLongMap!21643)

(assert (=> d!144203 (= lt!593681 lt!593682)))

(declare-fun lt!593680 () Unit!43880)

(declare-fun e!762444 () Unit!43880)

(assert (=> d!144203 (= lt!593680 e!762444)))

(declare-fun c!126499 () Bool)

(declare-fun e!762446 () Bool)

(assert (=> d!144203 (= c!126499 e!762446)))

(declare-fun res!888095 () Bool)

(assert (=> d!144203 (=> (not res!888095) (not e!762446))))

(assert (=> d!144203 (= res!888095 (bvslt from!1980 (size!44453 _keys!1590)))))

(assert (=> d!144203 (= lt!593682 e!762445)))

(declare-fun c!126498 () Bool)

(assert (=> d!144203 (= c!126498 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144203 (validMask!0 mask!1998)))

(assert (=> d!144203 (= (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593681)))

(declare-fun b!1338822 () Bool)

(declare-fun call!64996 () ListLongMap!21643)

(assert (=> b!1338822 (= e!762452 call!64996)))

(declare-fun bm!64992 () Bool)

(assert (=> bm!64992 (= call!64994 (contains!9016 lt!593681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338823 () Bool)

(assert (=> b!1338823 (= e!762446 (validKeyInArray!0 (select (arr!43902 _keys!1590) from!1980)))))

(declare-fun b!1338824 () Bool)

(declare-fun e!762447 () Bool)

(assert (=> b!1338824 (= e!762450 e!762447)))

(declare-fun res!888093 () Bool)

(assert (=> b!1338824 (= res!888093 call!64999)))

(assert (=> b!1338824 (=> (not res!888093) (not e!762447))))

(declare-fun b!1338825 () Bool)

(declare-fun e!762449 () Bool)

(assert (=> b!1338825 (= e!762449 (= (apply!1043 lt!593681 (select (arr!43902 _keys!1590) from!1980)) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338825 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44454 _values!1320)))))

(assert (=> b!1338825 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44453 _keys!1590)))))

(declare-fun b!1338826 () Bool)

(declare-fun lt!593686 () Unit!43880)

(assert (=> b!1338826 (= e!762444 lt!593686)))

(declare-fun lt!593675 () ListLongMap!21643)

(assert (=> b!1338826 (= lt!593675 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593677 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593676 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593676 (select (arr!43902 _keys!1590) from!1980))))

(declare-fun lt!593671 () Unit!43880)

(declare-fun addStillContains!1195 (ListLongMap!21643 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43880)

(assert (=> b!1338826 (= lt!593671 (addStillContains!1195 lt!593675 lt!593677 zeroValue!1262 lt!593676))))

(assert (=> b!1338826 (contains!9016 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262)) lt!593676)))

(declare-fun lt!593673 () Unit!43880)

(assert (=> b!1338826 (= lt!593673 lt!593671)))

(declare-fun lt!593667 () ListLongMap!21643)

(assert (=> b!1338826 (= lt!593667 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593669 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593683 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593683 (select (arr!43902 _keys!1590) from!1980))))

(declare-fun lt!593674 () Unit!43880)

(declare-fun addApplyDifferent!572 (ListLongMap!21643 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43880)

(assert (=> b!1338826 (= lt!593674 (addApplyDifferent!572 lt!593667 lt!593669 minValue!1262 lt!593683))))

(assert (=> b!1338826 (= (apply!1043 (+!4782 lt!593667 (tuple2!23979 lt!593669 minValue!1262)) lt!593683) (apply!1043 lt!593667 lt!593683))))

(declare-fun lt!593687 () Unit!43880)

(assert (=> b!1338826 (= lt!593687 lt!593674)))

(declare-fun lt!593670 () ListLongMap!21643)

(assert (=> b!1338826 (= lt!593670 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593672 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593685 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593685 (select (arr!43902 _keys!1590) from!1980))))

(declare-fun lt!593668 () Unit!43880)

(assert (=> b!1338826 (= lt!593668 (addApplyDifferent!572 lt!593670 lt!593672 zeroValue!1262 lt!593685))))

(assert (=> b!1338826 (= (apply!1043 (+!4782 lt!593670 (tuple2!23979 lt!593672 zeroValue!1262)) lt!593685) (apply!1043 lt!593670 lt!593685))))

(declare-fun lt!593679 () Unit!43880)

(assert (=> b!1338826 (= lt!593679 lt!593668)))

(declare-fun lt!593684 () ListLongMap!21643)

(assert (=> b!1338826 (= lt!593684 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593678 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593678 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593688 () (_ BitVec 64))

(assert (=> b!1338826 (= lt!593688 (select (arr!43902 _keys!1590) from!1980))))

(assert (=> b!1338826 (= lt!593686 (addApplyDifferent!572 lt!593684 lt!593678 minValue!1262 lt!593688))))

(assert (=> b!1338826 (= (apply!1043 (+!4782 lt!593684 (tuple2!23979 lt!593678 minValue!1262)) lt!593688) (apply!1043 lt!593684 lt!593688))))

(declare-fun b!1338827 () Bool)

(declare-fun e!762448 () Bool)

(assert (=> b!1338827 (= e!762448 e!762449)))

(declare-fun res!888090 () Bool)

(assert (=> b!1338827 (=> (not res!888090) (not e!762449))))

(assert (=> b!1338827 (= res!888090 (contains!9016 lt!593681 (select (arr!43902 _keys!1590) from!1980)))))

(assert (=> b!1338827 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44453 _keys!1590)))))

(declare-fun b!1338828 () Bool)

(assert (=> b!1338828 (= e!762451 (not call!64994))))

(declare-fun b!1338829 () Bool)

(declare-fun e!762454 () Bool)

(assert (=> b!1338829 (= e!762454 (validKeyInArray!0 (select (arr!43902 _keys!1590) from!1980)))))

(declare-fun b!1338830 () Bool)

(declare-fun e!762453 () ListLongMap!21643)

(declare-fun call!64995 () ListLongMap!21643)

(assert (=> b!1338830 (= e!762453 call!64995)))

(declare-fun bm!64993 () Bool)

(declare-fun call!65000 () ListLongMap!21643)

(assert (=> bm!64993 (= call!64998 (+!4782 (ite c!126498 call!64997 (ite c!126494 call!65000 call!64995)) (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338831 () Bool)

(assert (=> b!1338831 (= e!762453 call!64996)))

(declare-fun bm!64994 () Bool)

(assert (=> bm!64994 (= call!64995 call!65000)))

(declare-fun b!1338832 () Bool)

(declare-fun Unit!43884 () Unit!43880)

(assert (=> b!1338832 (= e!762444 Unit!43884)))

(declare-fun b!1338833 () Bool)

(declare-fun c!126495 () Bool)

(assert (=> b!1338833 (= c!126495 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1338833 (= e!762452 e!762453)))

(declare-fun bm!64995 () Bool)

(assert (=> bm!64995 (= call!65000 call!64997)))

(declare-fun b!1338834 () Bool)

(declare-fun res!888098 () Bool)

(assert (=> b!1338834 (=> (not res!888098) (not e!762443))))

(assert (=> b!1338834 (= res!888098 e!762448)))

(declare-fun res!888097 () Bool)

(assert (=> b!1338834 (=> res!888097 e!762448)))

(assert (=> b!1338834 (= res!888097 (not e!762454))))

(declare-fun res!888096 () Bool)

(assert (=> b!1338834 (=> (not res!888096) (not e!762454))))

(assert (=> b!1338834 (= res!888096 (bvslt from!1980 (size!44453 _keys!1590)))))

(declare-fun bm!64996 () Bool)

(assert (=> bm!64996 (= call!64996 call!64998)))

(declare-fun b!1338835 () Bool)

(assert (=> b!1338835 (= e!762447 (= (apply!1043 lt!593681 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1338836 () Bool)

(declare-fun res!888094 () Bool)

(assert (=> b!1338836 (=> (not res!888094) (not e!762443))))

(assert (=> b!1338836 (= res!888094 e!762451)))

(declare-fun c!126496 () Bool)

(assert (=> b!1338836 (= c!126496 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64997 () Bool)

(assert (=> bm!64997 (= call!64999 (contains!9016 lt!593681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338837 () Bool)

(assert (=> b!1338837 (= e!762442 (= (apply!1043 lt!593681 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(assert (= (and d!144203 c!126498) b!1338820))

(assert (= (and d!144203 (not c!126498)) b!1338821))

(assert (= (and b!1338821 c!126494) b!1338822))

(assert (= (and b!1338821 (not c!126494)) b!1338833))

(assert (= (and b!1338833 c!126495) b!1338831))

(assert (= (and b!1338833 (not c!126495)) b!1338830))

(assert (= (or b!1338831 b!1338830) bm!64994))

(assert (= (or b!1338822 bm!64994) bm!64995))

(assert (= (or b!1338822 b!1338831) bm!64996))

(assert (= (or b!1338820 bm!64995) bm!64991))

(assert (= (or b!1338820 bm!64996) bm!64993))

(assert (= (and d!144203 res!888095) b!1338823))

(assert (= (and d!144203 c!126499) b!1338826))

(assert (= (and d!144203 (not c!126499)) b!1338832))

(assert (= (and d!144203 res!888091) b!1338834))

(assert (= (and b!1338834 res!888096) b!1338829))

(assert (= (and b!1338834 (not res!888097)) b!1338827))

(assert (= (and b!1338827 res!888090) b!1338825))

(assert (= (and b!1338834 res!888098) b!1338836))

(assert (= (and b!1338836 c!126496) b!1338819))

(assert (= (and b!1338836 (not c!126496)) b!1338828))

(assert (= (and b!1338819 res!888092) b!1338837))

(assert (= (or b!1338819 b!1338828) bm!64992))

(assert (= (and b!1338836 res!888094) b!1338818))

(assert (= (and b!1338818 c!126497) b!1338824))

(assert (= (and b!1338818 (not c!126497)) b!1338817))

(assert (= (and b!1338824 res!888093) b!1338835))

(assert (= (or b!1338824 b!1338817) bm!64997))

(declare-fun b_lambda!24215 () Bool)

(assert (=> (not b_lambda!24215) (not b!1338825)))

(assert (=> b!1338825 t!45422))

(declare-fun b_and!50041 () Bool)

(assert (= b_and!50039 (and (=> t!45422 result!25301) b_and!50041)))

(declare-fun m!1227125 () Bool)

(assert (=> bm!64997 m!1227125))

(declare-fun m!1227127 () Bool)

(assert (=> b!1338820 m!1227127))

(assert (=> b!1338827 m!1226953))

(assert (=> b!1338827 m!1226953))

(declare-fun m!1227129 () Bool)

(assert (=> b!1338827 m!1227129))

(assert (=> d!144203 m!1226967))

(declare-fun m!1227131 () Bool)

(assert (=> b!1338835 m!1227131))

(assert (=> b!1338825 m!1226953))

(assert (=> b!1338825 m!1226979))

(assert (=> b!1338825 m!1226973))

(assert (=> b!1338825 m!1226981))

(assert (=> b!1338825 m!1226979))

(assert (=> b!1338825 m!1226973))

(assert (=> b!1338825 m!1226953))

(declare-fun m!1227133 () Bool)

(assert (=> b!1338825 m!1227133))

(declare-fun m!1227135 () Bool)

(assert (=> bm!64993 m!1227135))

(declare-fun m!1227137 () Bool)

(assert (=> bm!64992 m!1227137))

(declare-fun m!1227139 () Bool)

(assert (=> b!1338837 m!1227139))

(assert (=> b!1338829 m!1226953))

(assert (=> b!1338829 m!1226953))

(assert (=> b!1338829 m!1226959))

(assert (=> b!1338823 m!1226953))

(assert (=> b!1338823 m!1226953))

(assert (=> b!1338823 m!1226959))

(declare-fun m!1227141 () Bool)

(assert (=> b!1338826 m!1227141))

(declare-fun m!1227143 () Bool)

(assert (=> b!1338826 m!1227143))

(declare-fun m!1227145 () Bool)

(assert (=> b!1338826 m!1227145))

(declare-fun m!1227147 () Bool)

(assert (=> b!1338826 m!1227147))

(declare-fun m!1227149 () Bool)

(assert (=> b!1338826 m!1227149))

(assert (=> b!1338826 m!1227145))

(assert (=> b!1338826 m!1227141))

(declare-fun m!1227151 () Bool)

(assert (=> b!1338826 m!1227151))

(declare-fun m!1227153 () Bool)

(assert (=> b!1338826 m!1227153))

(declare-fun m!1227155 () Bool)

(assert (=> b!1338826 m!1227155))

(assert (=> b!1338826 m!1227151))

(declare-fun m!1227157 () Bool)

(assert (=> b!1338826 m!1227157))

(declare-fun m!1227159 () Bool)

(assert (=> b!1338826 m!1227159))

(declare-fun m!1227161 () Bool)

(assert (=> b!1338826 m!1227161))

(assert (=> b!1338826 m!1226953))

(declare-fun m!1227163 () Bool)

(assert (=> b!1338826 m!1227163))

(declare-fun m!1227165 () Bool)

(assert (=> b!1338826 m!1227165))

(declare-fun m!1227167 () Bool)

(assert (=> b!1338826 m!1227167))

(assert (=> b!1338826 m!1227165))

(declare-fun m!1227169 () Bool)

(assert (=> b!1338826 m!1227169))

(declare-fun m!1227171 () Bool)

(assert (=> b!1338826 m!1227171))

(assert (=> bm!64991 m!1227169))

(assert (=> b!1338605 d!144203))

(declare-fun mapNonEmpty!57122 () Bool)

(declare-fun mapRes!57122 () Bool)

(declare-fun tp!108794 () Bool)

(declare-fun e!762459 () Bool)

(assert (=> mapNonEmpty!57122 (= mapRes!57122 (and tp!108794 e!762459))))

(declare-fun mapValue!57122 () ValueCell!17579)

(declare-fun mapKey!57122 () (_ BitVec 32))

(declare-fun mapRest!57122 () (Array (_ BitVec 32) ValueCell!17579))

(assert (=> mapNonEmpty!57122 (= mapRest!57113 (store mapRest!57122 mapKey!57122 mapValue!57122))))

(declare-fun b!1338845 () Bool)

(declare-fun e!762460 () Bool)

(assert (=> b!1338845 (= e!762460 tp_is_empty!36955)))

(declare-fun condMapEmpty!57122 () Bool)

(declare-fun mapDefault!57122 () ValueCell!17579)

(assert (=> mapNonEmpty!57113 (= condMapEmpty!57122 (= mapRest!57113 ((as const (Array (_ BitVec 32) ValueCell!17579)) mapDefault!57122)))))

(assert (=> mapNonEmpty!57113 (= tp!108778 (and e!762460 mapRes!57122))))

(declare-fun mapIsEmpty!57122 () Bool)

(assert (=> mapIsEmpty!57122 mapRes!57122))

(declare-fun b!1338844 () Bool)

(assert (=> b!1338844 (= e!762459 tp_is_empty!36955)))

(assert (= (and mapNonEmpty!57113 condMapEmpty!57122) mapIsEmpty!57122))

(assert (= (and mapNonEmpty!57113 (not condMapEmpty!57122)) mapNonEmpty!57122))

(assert (= (and mapNonEmpty!57122 ((_ is ValueCellFull!17579) mapValue!57122)) b!1338844))

(assert (= (and mapNonEmpty!57113 ((_ is ValueCellFull!17579) mapDefault!57122)) b!1338845))

(declare-fun m!1227173 () Bool)

(assert (=> mapNonEmpty!57122 m!1227173))

(declare-fun b_lambda!24217 () Bool)

(assert (= b_lambda!24211 (or (and start!112958 b_free!31045) b_lambda!24217)))

(declare-fun b_lambda!24219 () Bool)

(assert (= b_lambda!24215 (or (and start!112958 b_free!31045) b_lambda!24219)))

(declare-fun b_lambda!24221 () Bool)

(assert (= b_lambda!24213 (or (and start!112958 b_free!31045) b_lambda!24221)))

(check-sat (not b!1338758) (not b!1338825) (not bm!64970) (not b!1338827) (not b!1338728) (not d!144183) (not b!1338829) (not b!1338772) (not b!1338736) (not d!144201) (not bm!64992) (not bm!64997) (not d!144185) (not b!1338759) (not bm!64973) (not b!1338755) (not b!1338694) (not b!1338696) (not b!1338835) (not b_lambda!24209) (not b_lambda!24219) (not d!144181) (not b!1338732) (not b_lambda!24217) (not b!1338743) (not bm!64976) (not b!1338744) (not b!1338823) (not b!1338727) (not b!1338774) (not b!1338701) (not b!1338826) tp_is_empty!36955 (not b!1338734) (not b!1338820) (not b!1338738) (not b_lambda!24221) (not b!1338702) (not b!1338837) (not mapNonEmpty!57122) (not b!1338771) (not bm!64993) (not d!144203) (not bm!64991) (not b_next!31045) (not b!1338770) b_and!50041 (not b!1338730) (not b!1338731))
(check-sat b_and!50041 (not b_next!31045))
(get-model)

(declare-fun bm!64998 () Bool)

(declare-fun call!65001 () ListLongMap!21643)

(assert (=> bm!64998 (= call!65001 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338847 () Bool)

(declare-fun res!888101 () Bool)

(declare-fun e!762465 () Bool)

(assert (=> b!1338847 (=> (not res!888101) (not e!762465))))

(declare-fun lt!593691 () ListLongMap!21643)

(assert (=> b!1338847 (= res!888101 (not (contains!9016 lt!593691 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338848 () Bool)

(declare-fun e!762464 () Bool)

(assert (=> b!1338848 (= e!762465 e!762464)))

(declare-fun c!126502 () Bool)

(declare-fun e!762461 () Bool)

(assert (=> b!1338848 (= c!126502 e!762461)))

(declare-fun res!888099 () Bool)

(assert (=> b!1338848 (=> (not res!888099) (not e!762461))))

(assert (=> b!1338848 (= res!888099 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(declare-fun b!1338849 () Bool)

(assert (=> b!1338849 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(assert (=> b!1338849 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44454 _values!1320)))))

(declare-fun e!762463 () Bool)

(assert (=> b!1338849 (= e!762463 (= (apply!1043 lt!593691 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!144205 () Bool)

(assert (=> d!144205 e!762465))

(declare-fun res!888100 () Bool)

(assert (=> d!144205 (=> (not res!888100) (not e!762465))))

(assert (=> d!144205 (= res!888100 (not (contains!9016 lt!593691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762467 () ListLongMap!21643)

(assert (=> d!144205 (= lt!593691 e!762467)))

(declare-fun c!126500 () Bool)

(assert (=> d!144205 (= c!126500 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(assert (=> d!144205 (validMask!0 mask!1998)))

(assert (=> d!144205 (= (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323) lt!593691)))

(declare-fun b!1338846 () Bool)

(declare-fun e!762466 () Bool)

(assert (=> b!1338846 (= e!762466 (= lt!593691 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1338850 () Bool)

(declare-fun e!762462 () ListLongMap!21643)

(assert (=> b!1338850 (= e!762467 e!762462)))

(declare-fun c!126503 () Bool)

(assert (=> b!1338850 (= c!126503 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(declare-fun b!1338851 () Bool)

(assert (=> b!1338851 (= e!762466 (isEmpty!1089 lt!593691))))

(declare-fun b!1338852 () Bool)

(assert (=> b!1338852 (= e!762467 (ListLongMap!21644 Nil!31115))))

(declare-fun b!1338853 () Bool)

(declare-fun lt!593693 () Unit!43880)

(declare-fun lt!593695 () Unit!43880)

(assert (=> b!1338853 (= lt!593693 lt!593695)))

(declare-fun lt!593689 () (_ BitVec 64))

(declare-fun lt!593690 () V!54377)

(declare-fun lt!593694 () ListLongMap!21643)

(declare-fun lt!593692 () (_ BitVec 64))

(assert (=> b!1338853 (not (contains!9016 (+!4782 lt!593694 (tuple2!23979 lt!593692 lt!593690)) lt!593689))))

(assert (=> b!1338853 (= lt!593695 (addStillNotContains!499 lt!593694 lt!593692 lt!593690 lt!593689))))

(assert (=> b!1338853 (= lt!593689 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338853 (= lt!593690 (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338853 (= lt!593692 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)))))

(assert (=> b!1338853 (= lt!593694 call!65001)))

(assert (=> b!1338853 (= e!762462 (+!4782 call!65001 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338854 () Bool)

(assert (=> b!1338854 (= e!762462 call!65001)))

(declare-fun b!1338855 () Bool)

(assert (=> b!1338855 (= e!762461 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1338855 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1338856 () Bool)

(assert (=> b!1338856 (= e!762464 e!762466)))

(declare-fun c!126501 () Bool)

(assert (=> b!1338856 (= c!126501 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(declare-fun b!1338857 () Bool)

(assert (=> b!1338857 (= e!762464 e!762463)))

(assert (=> b!1338857 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(declare-fun res!888102 () Bool)

(assert (=> b!1338857 (= res!888102 (contains!9016 lt!593691 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1338857 (=> (not res!888102) (not e!762463))))

(assert (= (and d!144205 c!126500) b!1338852))

(assert (= (and d!144205 (not c!126500)) b!1338850))

(assert (= (and b!1338850 c!126503) b!1338853))

(assert (= (and b!1338850 (not c!126503)) b!1338854))

(assert (= (or b!1338853 b!1338854) bm!64998))

(assert (= (and d!144205 res!888100) b!1338847))

(assert (= (and b!1338847 res!888101) b!1338848))

(assert (= (and b!1338848 res!888099) b!1338855))

(assert (= (and b!1338848 c!126502) b!1338857))

(assert (= (and b!1338848 (not c!126502)) b!1338856))

(assert (= (and b!1338857 res!888102) b!1338849))

(assert (= (and b!1338856 c!126501) b!1338846))

(assert (= (and b!1338856 (not c!126501)) b!1338851))

(declare-fun b_lambda!24223 () Bool)

(assert (=> (not b_lambda!24223) (not b!1338849)))

(assert (=> b!1338849 t!45422))

(declare-fun b_and!50043 () Bool)

(assert (= b_and!50041 (and (=> t!45422 result!25301) b_and!50043)))

(declare-fun b_lambda!24225 () Bool)

(assert (=> (not b_lambda!24225) (not b!1338853)))

(assert (=> b!1338853 t!45422))

(declare-fun b_and!50045 () Bool)

(assert (= b_and!50043 (and (=> t!45422 result!25301) b_and!50045)))

(declare-fun m!1227175 () Bool)

(assert (=> bm!64998 m!1227175))

(declare-fun m!1227177 () Bool)

(assert (=> b!1338855 m!1227177))

(assert (=> b!1338855 m!1227177))

(declare-fun m!1227179 () Bool)

(assert (=> b!1338855 m!1227179))

(declare-fun m!1227181 () Bool)

(assert (=> d!144205 m!1227181))

(assert (=> d!144205 m!1226967))

(assert (=> b!1338850 m!1227177))

(assert (=> b!1338850 m!1227177))

(assert (=> b!1338850 m!1227179))

(assert (=> b!1338857 m!1227177))

(assert (=> b!1338857 m!1227177))

(declare-fun m!1227183 () Bool)

(assert (=> b!1338857 m!1227183))

(declare-fun m!1227185 () Bool)

(assert (=> b!1338847 m!1227185))

(assert (=> b!1338846 m!1227175))

(declare-fun m!1227187 () Bool)

(assert (=> b!1338853 m!1227187))

(declare-fun m!1227189 () Bool)

(assert (=> b!1338853 m!1227189))

(declare-fun m!1227191 () Bool)

(assert (=> b!1338853 m!1227191))

(declare-fun m!1227193 () Bool)

(assert (=> b!1338853 m!1227193))

(assert (=> b!1338853 m!1227189))

(assert (=> b!1338853 m!1226973))

(declare-fun m!1227195 () Bool)

(assert (=> b!1338853 m!1227195))

(declare-fun m!1227197 () Bool)

(assert (=> b!1338853 m!1227197))

(assert (=> b!1338853 m!1227191))

(assert (=> b!1338853 m!1226973))

(assert (=> b!1338853 m!1227177))

(assert (=> b!1338849 m!1227189))

(assert (=> b!1338849 m!1227189))

(assert (=> b!1338849 m!1226973))

(assert (=> b!1338849 m!1227195))

(assert (=> b!1338849 m!1227177))

(declare-fun m!1227199 () Bool)

(assert (=> b!1338849 m!1227199))

(assert (=> b!1338849 m!1226973))

(assert (=> b!1338849 m!1227177))

(declare-fun m!1227201 () Bool)

(assert (=> b!1338851 m!1227201))

(assert (=> bm!64970 d!144205))

(assert (=> b!1338727 d!144205))

(declare-fun d!144207 () Bool)

(assert (=> d!144207 (= (get!22170 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21188 (select (arr!43903 _values!1320) from!1980)))))

(assert (=> b!1338743 d!144207))

(declare-fun d!144209 () Bool)

(declare-fun res!888107 () Bool)

(declare-fun e!762472 () Bool)

(assert (=> d!144209 (=> res!888107 e!762472)))

(assert (=> d!144209 (= res!888107 (and ((_ is Cons!31114) (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12000 (h!32332 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144209 (= (containsKey!739 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762472)))

(declare-fun b!1338862 () Bool)

(declare-fun e!762473 () Bool)

(assert (=> b!1338862 (= e!762472 e!762473)))

(declare-fun res!888108 () Bool)

(assert (=> b!1338862 (=> (not res!888108) (not e!762473))))

(assert (=> b!1338862 (= res!888108 (and (or (not ((_ is Cons!31114) (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!12000 (h!32332 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31114) (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!12000 (h!32332 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1338863 () Bool)

(assert (=> b!1338863 (= e!762473 (containsKey!739 (t!45424 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!144209 (not res!888107)) b!1338862))

(assert (= (and b!1338862 res!888108) b!1338863))

(declare-fun m!1227203 () Bool)

(assert (=> b!1338863 m!1227203))

(assert (=> d!144201 d!144209))

(declare-fun d!144211 () Bool)

(declare-fun e!762475 () Bool)

(assert (=> d!144211 e!762475))

(declare-fun res!888109 () Bool)

(assert (=> d!144211 (=> res!888109 e!762475)))

(declare-fun lt!593697 () Bool)

(assert (=> d!144211 (= res!888109 (not lt!593697))))

(declare-fun lt!593699 () Bool)

(assert (=> d!144211 (= lt!593697 lt!593699)))

(declare-fun lt!593696 () Unit!43880)

(declare-fun e!762474 () Unit!43880)

(assert (=> d!144211 (= lt!593696 e!762474)))

(declare-fun c!126504 () Bool)

(assert (=> d!144211 (= c!126504 lt!593699)))

(assert (=> d!144211 (= lt!593699 (containsKey!739 (toList!10837 lt!593605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144211 (= (contains!9016 lt!593605 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593697)))

(declare-fun b!1338864 () Bool)

(declare-fun lt!593698 () Unit!43880)

(assert (=> b!1338864 (= e!762474 lt!593698)))

(assert (=> b!1338864 (= lt!593698 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338864 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338865 () Bool)

(declare-fun Unit!43885 () Unit!43880)

(assert (=> b!1338865 (= e!762474 Unit!43885)))

(declare-fun b!1338866 () Bool)

(assert (=> b!1338866 (= e!762475 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593605) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144211 c!126504) b!1338864))

(assert (= (and d!144211 (not c!126504)) b!1338865))

(assert (= (and d!144211 (not res!888109)) b!1338866))

(declare-fun m!1227205 () Bool)

(assert (=> d!144211 m!1227205))

(declare-fun m!1227207 () Bool)

(assert (=> b!1338864 m!1227207))

(declare-fun m!1227209 () Bool)

(assert (=> b!1338864 m!1227209))

(assert (=> b!1338864 m!1227209))

(declare-fun m!1227211 () Bool)

(assert (=> b!1338864 m!1227211))

(assert (=> b!1338866 m!1227209))

(assert (=> b!1338866 m!1227209))

(assert (=> b!1338866 m!1227211))

(assert (=> d!144185 d!144211))

(assert (=> d!144185 d!144189))

(declare-fun bm!64999 () Bool)

(declare-fun call!65002 () ListLongMap!21643)

(assert (=> bm!64999 (= call!65002 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338868 () Bool)

(declare-fun res!888112 () Bool)

(declare-fun e!762480 () Bool)

(assert (=> b!1338868 (=> (not res!888112) (not e!762480))))

(declare-fun lt!593702 () ListLongMap!21643)

(assert (=> b!1338868 (= res!888112 (not (contains!9016 lt!593702 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338869 () Bool)

(declare-fun e!762479 () Bool)

(assert (=> b!1338869 (= e!762480 e!762479)))

(declare-fun c!126507 () Bool)

(declare-fun e!762476 () Bool)

(assert (=> b!1338869 (= c!126507 e!762476)))

(declare-fun res!888110 () Bool)

(assert (=> b!1338869 (=> (not res!888110) (not e!762476))))

(assert (=> b!1338869 (= res!888110 (bvslt from!1980 (size!44453 _keys!1590)))))

(declare-fun b!1338870 () Bool)

(assert (=> b!1338870 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44453 _keys!1590)))))

(assert (=> b!1338870 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44454 _values!1320)))))

(declare-fun e!762478 () Bool)

(assert (=> b!1338870 (= e!762478 (= (apply!1043 lt!593702 (select (arr!43902 _keys!1590) from!1980)) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!144213 () Bool)

(assert (=> d!144213 e!762480))

(declare-fun res!888111 () Bool)

(assert (=> d!144213 (=> (not res!888111) (not e!762480))))

(assert (=> d!144213 (= res!888111 (not (contains!9016 lt!593702 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!762482 () ListLongMap!21643)

(assert (=> d!144213 (= lt!593702 e!762482)))

(declare-fun c!126505 () Bool)

(assert (=> d!144213 (= c!126505 (bvsge from!1980 (size!44453 _keys!1590)))))

(assert (=> d!144213 (validMask!0 mask!1998)))

(assert (=> d!144213 (= (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593702)))

(declare-fun e!762481 () Bool)

(declare-fun b!1338867 () Bool)

(assert (=> b!1338867 (= e!762481 (= lt!593702 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1338871 () Bool)

(declare-fun e!762477 () ListLongMap!21643)

(assert (=> b!1338871 (= e!762482 e!762477)))

(declare-fun c!126508 () Bool)

(assert (=> b!1338871 (= c!126508 (validKeyInArray!0 (select (arr!43902 _keys!1590) from!1980)))))

(declare-fun b!1338872 () Bool)

(assert (=> b!1338872 (= e!762481 (isEmpty!1089 lt!593702))))

(declare-fun b!1338873 () Bool)

(assert (=> b!1338873 (= e!762482 (ListLongMap!21644 Nil!31115))))

(declare-fun b!1338874 () Bool)

(declare-fun lt!593704 () Unit!43880)

(declare-fun lt!593706 () Unit!43880)

(assert (=> b!1338874 (= lt!593704 lt!593706)))

(declare-fun lt!593703 () (_ BitVec 64))

(declare-fun lt!593705 () ListLongMap!21643)

(declare-fun lt!593700 () (_ BitVec 64))

(declare-fun lt!593701 () V!54377)

(assert (=> b!1338874 (not (contains!9016 (+!4782 lt!593705 (tuple2!23979 lt!593703 lt!593701)) lt!593700))))

(assert (=> b!1338874 (= lt!593706 (addStillNotContains!499 lt!593705 lt!593703 lt!593701 lt!593700))))

(assert (=> b!1338874 (= lt!593700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338874 (= lt!593701 (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338874 (= lt!593703 (select (arr!43902 _keys!1590) from!1980))))

(assert (=> b!1338874 (= lt!593705 call!65002)))

(assert (=> b!1338874 (= e!762477 (+!4782 call!65002 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338875 () Bool)

(assert (=> b!1338875 (= e!762477 call!65002)))

(declare-fun b!1338876 () Bool)

(assert (=> b!1338876 (= e!762476 (validKeyInArray!0 (select (arr!43902 _keys!1590) from!1980)))))

(assert (=> b!1338876 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1338877 () Bool)

(assert (=> b!1338877 (= e!762479 e!762481)))

(declare-fun c!126506 () Bool)

(assert (=> b!1338877 (= c!126506 (bvslt from!1980 (size!44453 _keys!1590)))))

(declare-fun b!1338878 () Bool)

(assert (=> b!1338878 (= e!762479 e!762478)))

(assert (=> b!1338878 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44453 _keys!1590)))))

(declare-fun res!888113 () Bool)

(assert (=> b!1338878 (= res!888113 (contains!9016 lt!593702 (select (arr!43902 _keys!1590) from!1980)))))

(assert (=> b!1338878 (=> (not res!888113) (not e!762478))))

(assert (= (and d!144213 c!126505) b!1338873))

(assert (= (and d!144213 (not c!126505)) b!1338871))

(assert (= (and b!1338871 c!126508) b!1338874))

(assert (= (and b!1338871 (not c!126508)) b!1338875))

(assert (= (or b!1338874 b!1338875) bm!64999))

(assert (= (and d!144213 res!888111) b!1338868))

(assert (= (and b!1338868 res!888112) b!1338869))

(assert (= (and b!1338869 res!888110) b!1338876))

(assert (= (and b!1338869 c!126507) b!1338878))

(assert (= (and b!1338869 (not c!126507)) b!1338877))

(assert (= (and b!1338878 res!888113) b!1338870))

(assert (= (and b!1338877 c!126506) b!1338867))

(assert (= (and b!1338877 (not c!126506)) b!1338872))

(declare-fun b_lambda!24227 () Bool)

(assert (=> (not b_lambda!24227) (not b!1338870)))

(assert (=> b!1338870 t!45422))

(declare-fun b_and!50047 () Bool)

(assert (= b_and!50045 (and (=> t!45422 result!25301) b_and!50047)))

(declare-fun b_lambda!24229 () Bool)

(assert (=> (not b_lambda!24229) (not b!1338874)))

(assert (=> b!1338874 t!45422))

(declare-fun b_and!50049 () Bool)

(assert (= b_and!50047 (and (=> t!45422 result!25301) b_and!50049)))

(declare-fun m!1227213 () Bool)

(assert (=> bm!64999 m!1227213))

(assert (=> b!1338876 m!1226953))

(assert (=> b!1338876 m!1226953))

(assert (=> b!1338876 m!1226959))

(declare-fun m!1227215 () Bool)

(assert (=> d!144213 m!1227215))

(assert (=> d!144213 m!1226967))

(assert (=> b!1338871 m!1226953))

(assert (=> b!1338871 m!1226953))

(assert (=> b!1338871 m!1226959))

(assert (=> b!1338878 m!1226953))

(assert (=> b!1338878 m!1226953))

(declare-fun m!1227217 () Bool)

(assert (=> b!1338878 m!1227217))

(declare-fun m!1227219 () Bool)

(assert (=> b!1338868 m!1227219))

(assert (=> b!1338867 m!1227213))

(declare-fun m!1227221 () Bool)

(assert (=> b!1338874 m!1227221))

(assert (=> b!1338874 m!1226979))

(declare-fun m!1227223 () Bool)

(assert (=> b!1338874 m!1227223))

(declare-fun m!1227225 () Bool)

(assert (=> b!1338874 m!1227225))

(assert (=> b!1338874 m!1226979))

(assert (=> b!1338874 m!1226973))

(assert (=> b!1338874 m!1226981))

(declare-fun m!1227227 () Bool)

(assert (=> b!1338874 m!1227227))

(assert (=> b!1338874 m!1227223))

(assert (=> b!1338874 m!1226973))

(assert (=> b!1338874 m!1226953))

(assert (=> b!1338870 m!1226979))

(assert (=> b!1338870 m!1226979))

(assert (=> b!1338870 m!1226973))

(assert (=> b!1338870 m!1226981))

(assert (=> b!1338870 m!1226953))

(declare-fun m!1227229 () Bool)

(assert (=> b!1338870 m!1227229))

(assert (=> b!1338870 m!1226973))

(assert (=> b!1338870 m!1226953))

(declare-fun m!1227231 () Bool)

(assert (=> b!1338872 m!1227231))

(assert (=> bm!64991 d!144213))

(declare-fun d!144215 () Bool)

(declare-fun e!762484 () Bool)

(assert (=> d!144215 e!762484))

(declare-fun res!888114 () Bool)

(assert (=> d!144215 (=> res!888114 e!762484)))

(declare-fun lt!593708 () Bool)

(assert (=> d!144215 (= res!888114 (not lt!593708))))

(declare-fun lt!593710 () Bool)

(assert (=> d!144215 (= lt!593708 lt!593710)))

(declare-fun lt!593707 () Unit!43880)

(declare-fun e!762483 () Unit!43880)

(assert (=> d!144215 (= lt!593707 e!762483)))

(declare-fun c!126509 () Bool)

(assert (=> d!144215 (= c!126509 lt!593710)))

(assert (=> d!144215 (= lt!593710 (containsKey!739 (toList!10837 lt!593605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144215 (= (contains!9016 lt!593605 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593708)))

(declare-fun b!1338879 () Bool)

(declare-fun lt!593709 () Unit!43880)

(assert (=> b!1338879 (= e!762483 lt!593709)))

(assert (=> b!1338879 (= lt!593709 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338879 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338880 () Bool)

(declare-fun Unit!43886 () Unit!43880)

(assert (=> b!1338880 (= e!762483 Unit!43886)))

(declare-fun b!1338881 () Bool)

(assert (=> b!1338881 (= e!762484 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144215 c!126509) b!1338879))

(assert (= (and d!144215 (not c!126509)) b!1338880))

(assert (= (and d!144215 (not res!888114)) b!1338881))

(declare-fun m!1227233 () Bool)

(assert (=> d!144215 m!1227233))

(declare-fun m!1227235 () Bool)

(assert (=> b!1338879 m!1227235))

(declare-fun m!1227237 () Bool)

(assert (=> b!1338879 m!1227237))

(assert (=> b!1338879 m!1227237))

(declare-fun m!1227239 () Bool)

(assert (=> b!1338879 m!1227239))

(assert (=> b!1338881 m!1227237))

(assert (=> b!1338881 m!1227237))

(assert (=> b!1338881 m!1227239))

(assert (=> b!1338728 d!144215))

(declare-fun d!144217 () Bool)

(assert (=> d!144217 (= (get!22171 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338744 d!144217))

(assert (=> b!1338829 d!144195))

(declare-fun d!144219 () Bool)

(declare-fun e!762486 () Bool)

(assert (=> d!144219 e!762486))

(declare-fun res!888115 () Bool)

(assert (=> d!144219 (=> res!888115 e!762486)))

(declare-fun lt!593712 () Bool)

(assert (=> d!144219 (= res!888115 (not lt!593712))))

(declare-fun lt!593714 () Bool)

(assert (=> d!144219 (= lt!593712 lt!593714)))

(declare-fun lt!593711 () Unit!43880)

(declare-fun e!762485 () Unit!43880)

(assert (=> d!144219 (= lt!593711 e!762485)))

(declare-fun c!126510 () Bool)

(assert (=> d!144219 (= c!126510 lt!593714)))

(assert (=> d!144219 (= lt!593714 (containsKey!739 (toList!10837 lt!593585) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144219 (= (contains!9016 lt!593585 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593712)))

(declare-fun b!1338882 () Bool)

(declare-fun lt!593713 () Unit!43880)

(assert (=> b!1338882 (= e!762485 lt!593713)))

(assert (=> b!1338882 (= lt!593713 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593585) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1338882 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593585) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1338883 () Bool)

(declare-fun Unit!43887 () Unit!43880)

(assert (=> b!1338883 (= e!762485 Unit!43887)))

(declare-fun b!1338884 () Bool)

(assert (=> b!1338884 (= e!762486 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593585) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144219 c!126510) b!1338882))

(assert (= (and d!144219 (not c!126510)) b!1338883))

(assert (= (and d!144219 (not res!888115)) b!1338884))

(declare-fun m!1227241 () Bool)

(assert (=> d!144219 m!1227241))

(declare-fun m!1227243 () Bool)

(assert (=> b!1338882 m!1227243))

(assert (=> b!1338882 m!1227065))

(assert (=> b!1338882 m!1227065))

(declare-fun m!1227245 () Bool)

(assert (=> b!1338882 m!1227245))

(assert (=> b!1338884 m!1227065))

(assert (=> b!1338884 m!1227065))

(assert (=> b!1338884 m!1227245))

(assert (=> d!144183 d!144219))

(declare-fun b!1338893 () Bool)

(declare-fun e!762491 () Option!764)

(assert (=> b!1338893 (= e!762491 (Some!763 (_2!12000 (h!32332 lt!593587))))))

(declare-fun c!126515 () Bool)

(declare-fun d!144221 () Bool)

(assert (=> d!144221 (= c!126515 (and ((_ is Cons!31114) lt!593587) (= (_1!12000 (h!32332 lt!593587)) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144221 (= (getValueByKey!713 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!762491)))

(declare-fun b!1338894 () Bool)

(declare-fun e!762492 () Option!764)

(assert (=> b!1338894 (= e!762491 e!762492)))

(declare-fun c!126516 () Bool)

(assert (=> b!1338894 (= c!126516 (and ((_ is Cons!31114) lt!593587) (not (= (_1!12000 (h!32332 lt!593587)) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1338895 () Bool)

(assert (=> b!1338895 (= e!762492 (getValueByKey!713 (t!45424 lt!593587) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1338896 () Bool)

(assert (=> b!1338896 (= e!762492 None!762)))

(assert (= (and d!144221 c!126515) b!1338893))

(assert (= (and d!144221 (not c!126515)) b!1338894))

(assert (= (and b!1338894 c!126516) b!1338895))

(assert (= (and b!1338894 (not c!126516)) b!1338896))

(declare-fun m!1227247 () Bool)

(assert (=> b!1338895 m!1227247))

(assert (=> d!144183 d!144221))

(declare-fun d!144223 () Bool)

(assert (=> d!144223 (= (getValueByKey!713 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593717 () Unit!43880)

(declare-fun choose!1965 (List!31118 (_ BitVec 64) V!54377) Unit!43880)

(assert (=> d!144223 (= lt!593717 (choose!1965 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!762495 () Bool)

(assert (=> d!144223 e!762495))

(declare-fun res!888120 () Bool)

(assert (=> d!144223 (=> (not res!888120) (not e!762495))))

(declare-fun isStrictlySorted!868 (List!31118) Bool)

(assert (=> d!144223 (= res!888120 (isStrictlySorted!868 lt!593587))))

(assert (=> d!144223 (= (lemmaContainsTupThenGetReturnValue!363 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593717)))

(declare-fun b!1338901 () Bool)

(declare-fun res!888121 () Bool)

(assert (=> b!1338901 (=> (not res!888121) (not e!762495))))

(assert (=> b!1338901 (= res!888121 (containsKey!739 lt!593587 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1338902 () Bool)

(assert (=> b!1338902 (= e!762495 (contains!9018 lt!593587 (tuple2!23979 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144223 res!888120) b!1338901))

(assert (= (and b!1338901 res!888121) b!1338902))

(assert (=> d!144223 m!1227059))

(declare-fun m!1227249 () Bool)

(assert (=> d!144223 m!1227249))

(declare-fun m!1227251 () Bool)

(assert (=> d!144223 m!1227251))

(declare-fun m!1227253 () Bool)

(assert (=> b!1338901 m!1227253))

(declare-fun m!1227255 () Bool)

(assert (=> b!1338902 m!1227255))

(assert (=> d!144183 d!144223))

(declare-fun b!1338923 () Bool)

(declare-fun e!762507 () List!31118)

(declare-fun call!65011 () List!31118)

(assert (=> b!1338923 (= e!762507 call!65011)))

(declare-fun b!1338924 () Bool)

(declare-fun e!762508 () List!31118)

(declare-fun call!65010 () List!31118)

(assert (=> b!1338924 (= e!762508 call!65010)))

(declare-fun d!144225 () Bool)

(declare-fun e!762506 () Bool)

(assert (=> d!144225 e!762506))

(declare-fun res!888126 () Bool)

(assert (=> d!144225 (=> (not res!888126) (not e!762506))))

(declare-fun lt!593720 () List!31118)

(assert (=> d!144225 (= res!888126 (isStrictlySorted!868 lt!593720))))

(declare-fun e!762510 () List!31118)

(assert (=> d!144225 (= lt!593720 e!762510)))

(declare-fun c!126527 () Bool)

(assert (=> d!144225 (= c!126527 (and ((_ is Cons!31114) (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!12000 (h!32332 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144225 (isStrictlySorted!868 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))))

(assert (=> d!144225 (= (insertStrictlySorted!492 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593720)))

(declare-fun bm!65006 () Bool)

(declare-fun call!65009 () List!31118)

(assert (=> bm!65006 (= call!65011 call!65009)))

(declare-fun b!1338925 () Bool)

(declare-fun c!126525 () Bool)

(assert (=> b!1338925 (= c!126525 (and ((_ is Cons!31114) (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvsgt (_1!12000 (h!32332 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1338925 (= e!762507 e!762508)))

(declare-fun b!1338926 () Bool)

(assert (=> b!1338926 (= e!762506 (contains!9018 lt!593720 (tuple2!23979 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1338927 () Bool)

(assert (=> b!1338927 (= e!762508 call!65010)))

(declare-fun b!1338928 () Bool)

(declare-fun e!762509 () List!31118)

(declare-fun c!126528 () Bool)

(assert (=> b!1338928 (= e!762509 (ite c!126528 (t!45424 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (ite c!126525 (Cons!31114 (h!32332 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (t!45424 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) Nil!31115)))))

(declare-fun b!1338929 () Bool)

(assert (=> b!1338929 (= e!762510 call!65009)))

(declare-fun bm!65007 () Bool)

(assert (=> bm!65007 (= call!65010 call!65011)))

(declare-fun b!1338930 () Bool)

(assert (=> b!1338930 (= e!762509 (insertStrictlySorted!492 (t!45424 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1338931 () Bool)

(assert (=> b!1338931 (= e!762510 e!762507)))

(assert (=> b!1338931 (= c!126528 (and ((_ is Cons!31114) (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!12000 (h!32332 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!65008 () Bool)

(declare-fun $colon$colon!670 (List!31118 tuple2!23978) List!31118)

(assert (=> bm!65008 (= call!65009 ($colon$colon!670 e!762509 (ite c!126527 (h!32332 (toList!10837 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (tuple2!23979 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126526 () Bool)

(assert (=> bm!65008 (= c!126526 c!126527)))

(declare-fun b!1338932 () Bool)

(declare-fun res!888127 () Bool)

(assert (=> b!1338932 (=> (not res!888127) (not e!762506))))

(assert (=> b!1338932 (= res!888127 (containsKey!739 lt!593720 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!144225 c!126527) b!1338929))

(assert (= (and d!144225 (not c!126527)) b!1338931))

(assert (= (and b!1338931 c!126528) b!1338923))

(assert (= (and b!1338931 (not c!126528)) b!1338925))

(assert (= (and b!1338925 c!126525) b!1338927))

(assert (= (and b!1338925 (not c!126525)) b!1338924))

(assert (= (or b!1338927 b!1338924) bm!65007))

(assert (= (or b!1338923 bm!65007) bm!65006))

(assert (= (or b!1338929 bm!65006) bm!65008))

(assert (= (and bm!65008 c!126526) b!1338930))

(assert (= (and bm!65008 (not c!126526)) b!1338928))

(assert (= (and d!144225 res!888126) b!1338932))

(assert (= (and b!1338932 res!888127) b!1338926))

(declare-fun m!1227257 () Bool)

(assert (=> b!1338930 m!1227257))

(declare-fun m!1227259 () Bool)

(assert (=> d!144225 m!1227259))

(declare-fun m!1227261 () Bool)

(assert (=> d!144225 m!1227261))

(declare-fun m!1227263 () Bool)

(assert (=> b!1338926 m!1227263))

(declare-fun m!1227265 () Bool)

(assert (=> bm!65008 m!1227265))

(declare-fun m!1227267 () Bool)

(assert (=> b!1338932 m!1227267))

(assert (=> d!144183 d!144225))

(assert (=> d!144203 d!144189))

(declare-fun d!144227 () Bool)

(declare-fun e!762511 () Bool)

(assert (=> d!144227 e!762511))

(declare-fun res!888128 () Bool)

(assert (=> d!144227 (=> (not res!888128) (not e!762511))))

(declare-fun lt!593721 () ListLongMap!21643)

(assert (=> d!144227 (= res!888128 (contains!9016 lt!593721 (_1!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593723 () List!31118)

(assert (=> d!144227 (= lt!593721 (ListLongMap!21644 lt!593723))))

(declare-fun lt!593722 () Unit!43880)

(declare-fun lt!593724 () Unit!43880)

(assert (=> d!144227 (= lt!593722 lt!593724)))

(assert (=> d!144227 (= (getValueByKey!713 lt!593723 (_1!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!763 (_2!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144227 (= lt!593724 (lemmaContainsTupThenGetReturnValue!363 lt!593723 (_1!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144227 (= lt!593723 (insertStrictlySorted!492 (toList!10837 (ite c!126498 call!64997 (ite c!126494 call!65000 call!64995))) (_1!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144227 (= (+!4782 (ite c!126498 call!64997 (ite c!126494 call!65000 call!64995)) (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593721)))

(declare-fun b!1338933 () Bool)

(declare-fun res!888129 () Bool)

(assert (=> b!1338933 (=> (not res!888129) (not e!762511))))

(assert (=> b!1338933 (= res!888129 (= (getValueByKey!713 (toList!10837 lt!593721) (_1!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!763 (_2!12000 (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1338934 () Bool)

(assert (=> b!1338934 (= e!762511 (contains!9018 (toList!10837 lt!593721) (ite (or c!126498 c!126494) (tuple2!23979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!144227 res!888128) b!1338933))

(assert (= (and b!1338933 res!888129) b!1338934))

(declare-fun m!1227269 () Bool)

(assert (=> d!144227 m!1227269))

(declare-fun m!1227271 () Bool)

(assert (=> d!144227 m!1227271))

(declare-fun m!1227273 () Bool)

(assert (=> d!144227 m!1227273))

(declare-fun m!1227275 () Bool)

(assert (=> d!144227 m!1227275))

(declare-fun m!1227277 () Bool)

(assert (=> b!1338933 m!1227277))

(declare-fun m!1227279 () Bool)

(assert (=> b!1338934 m!1227279))

(assert (=> bm!64993 d!144227))

(declare-fun d!144229 () Bool)

(declare-fun get!22172 (Option!764) V!54377)

(assert (=> d!144229 (= (apply!1043 lt!593681 (select (arr!43902 _keys!1590) from!1980)) (get!22172 (getValueByKey!713 (toList!10837 lt!593681) (select (arr!43902 _keys!1590) from!1980))))))

(declare-fun bs!38311 () Bool)

(assert (= bs!38311 d!144229))

(assert (=> bs!38311 m!1226953))

(declare-fun m!1227281 () Bool)

(assert (=> bs!38311 m!1227281))

(assert (=> bs!38311 m!1227281))

(declare-fun m!1227283 () Bool)

(assert (=> bs!38311 m!1227283))

(assert (=> b!1338825 d!144229))

(assert (=> b!1338825 d!144187))

(declare-fun d!144231 () Bool)

(declare-fun isEmpty!1090 (Option!764) Bool)

(assert (=> d!144231 (= (isDefined!522 (getValueByKey!713 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1090 (getValueByKey!713 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38312 () Bool)

(assert (= bs!38312 d!144231))

(assert (=> bs!38312 m!1227121))

(declare-fun m!1227285 () Bool)

(assert (=> bs!38312 m!1227285))

(assert (=> b!1338774 d!144231))

(declare-fun e!762512 () Option!764)

(declare-fun b!1338935 () Bool)

(assert (=> b!1338935 (= e!762512 (Some!763 (_2!12000 (h!32332 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun d!144233 () Bool)

(declare-fun c!126529 () Bool)

(assert (=> d!144233 (= c!126529 (and ((_ is Cons!31114) (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12000 (h!32332 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144233 (= (getValueByKey!713 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!762512)))

(declare-fun b!1338936 () Bool)

(declare-fun e!762513 () Option!764)

(assert (=> b!1338936 (= e!762512 e!762513)))

(declare-fun c!126530 () Bool)

(assert (=> b!1338936 (= c!126530 (and ((_ is Cons!31114) (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!12000 (h!32332 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1338937 () Bool)

(assert (=> b!1338937 (= e!762513 (getValueByKey!713 (t!45424 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1338938 () Bool)

(assert (=> b!1338938 (= e!762513 None!762)))

(assert (= (and d!144233 c!126529) b!1338935))

(assert (= (and d!144233 (not c!126529)) b!1338936))

(assert (= (and b!1338936 c!126530) b!1338937))

(assert (= (and b!1338936 (not c!126530)) b!1338938))

(declare-fun m!1227287 () Bool)

(assert (=> b!1338937 m!1227287))

(assert (=> b!1338774 d!144233))

(assert (=> b!1338823 d!144195))

(declare-fun d!144235 () Bool)

(assert (=> d!144235 (= (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338736 d!144235))

(declare-fun d!144237 () Bool)

(assert (=> d!144237 (= (validKeyInArray!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338771 d!144237))

(declare-fun d!144239 () Bool)

(declare-fun e!762515 () Bool)

(assert (=> d!144239 e!762515))

(declare-fun res!888130 () Bool)

(assert (=> d!144239 (=> res!888130 e!762515)))

(declare-fun lt!593726 () Bool)

(assert (=> d!144239 (= res!888130 (not lt!593726))))

(declare-fun lt!593728 () Bool)

(assert (=> d!144239 (= lt!593726 lt!593728)))

(declare-fun lt!593725 () Unit!43880)

(declare-fun e!762514 () Unit!43880)

(assert (=> d!144239 (= lt!593725 e!762514)))

(declare-fun c!126531 () Bool)

(assert (=> d!144239 (= c!126531 lt!593728)))

(assert (=> d!144239 (= lt!593728 (containsKey!739 (toList!10837 lt!593681) (select (arr!43902 _keys!1590) from!1980)))))

(assert (=> d!144239 (= (contains!9016 lt!593681 (select (arr!43902 _keys!1590) from!1980)) lt!593726)))

(declare-fun b!1338939 () Bool)

(declare-fun lt!593727 () Unit!43880)

(assert (=> b!1338939 (= e!762514 lt!593727)))

(assert (=> b!1338939 (= lt!593727 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593681) (select (arr!43902 _keys!1590) from!1980)))))

(assert (=> b!1338939 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593681) (select (arr!43902 _keys!1590) from!1980)))))

(declare-fun b!1338940 () Bool)

(declare-fun Unit!43888 () Unit!43880)

(assert (=> b!1338940 (= e!762514 Unit!43888)))

(declare-fun b!1338941 () Bool)

(assert (=> b!1338941 (= e!762515 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593681) (select (arr!43902 _keys!1590) from!1980))))))

(assert (= (and d!144239 c!126531) b!1338939))

(assert (= (and d!144239 (not c!126531)) b!1338940))

(assert (= (and d!144239 (not res!888130)) b!1338941))

(assert (=> d!144239 m!1226953))

(declare-fun m!1227289 () Bool)

(assert (=> d!144239 m!1227289))

(assert (=> b!1338939 m!1226953))

(declare-fun m!1227291 () Bool)

(assert (=> b!1338939 m!1227291))

(assert (=> b!1338939 m!1226953))

(assert (=> b!1338939 m!1227281))

(assert (=> b!1338939 m!1227281))

(declare-fun m!1227293 () Bool)

(assert (=> b!1338939 m!1227293))

(assert (=> b!1338941 m!1226953))

(assert (=> b!1338941 m!1227281))

(assert (=> b!1338941 m!1227281))

(assert (=> b!1338941 m!1227293))

(assert (=> b!1338827 d!144239))

(declare-fun d!144241 () Bool)

(declare-fun res!888131 () Bool)

(declare-fun e!762516 () Bool)

(assert (=> d!144241 (=> res!888131 e!762516)))

(assert (=> d!144241 (= res!888131 (and ((_ is Cons!31114) (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12000 (h!32332 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(assert (=> d!144241 (= (containsKey!739 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) e!762516)))

(declare-fun b!1338942 () Bool)

(declare-fun e!762517 () Bool)

(assert (=> b!1338942 (= e!762516 e!762517)))

(declare-fun res!888132 () Bool)

(assert (=> b!1338942 (=> (not res!888132) (not e!762517))))

(assert (=> b!1338942 (= res!888132 (and (or (not ((_ is Cons!31114) (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (bvsle (_1!12000 (h!32332 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)) ((_ is Cons!31114) (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12000 (h!32332 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(declare-fun b!1338943 () Bool)

(assert (=> b!1338943 (= e!762517 (containsKey!739 (t!45424 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1153))))

(assert (= (and d!144241 (not res!888131)) b!1338942))

(assert (= (and b!1338942 res!888132) b!1338943))

(declare-fun m!1227295 () Bool)

(assert (=> b!1338943 m!1227295))

(assert (=> d!144181 d!144241))

(declare-fun d!144243 () Bool)

(declare-fun lt!593731 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!658 (List!31117) (InoxSet (_ BitVec 64)))

(assert (=> d!144243 (= lt!593731 (select (content!658 Nil!31114) (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!762523 () Bool)

(assert (=> d!144243 (= lt!593731 e!762523)))

(declare-fun res!888137 () Bool)

(assert (=> d!144243 (=> (not res!888137) (not e!762523))))

(assert (=> d!144243 (= res!888137 ((_ is Cons!31113) Nil!31114))))

(assert (=> d!144243 (= (contains!9019 Nil!31114 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)) lt!593731)))

(declare-fun b!1338948 () Bool)

(declare-fun e!762522 () Bool)

(assert (=> b!1338948 (= e!762523 e!762522)))

(declare-fun res!888138 () Bool)

(assert (=> b!1338948 (=> res!888138 e!762522)))

(assert (=> b!1338948 (= res!888138 (= (h!32331 Nil!31114) (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338949 () Bool)

(assert (=> b!1338949 (= e!762522 (contains!9019 (t!45423 Nil!31114) (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144243 res!888137) b!1338948))

(assert (= (and b!1338948 (not res!888138)) b!1338949))

(declare-fun m!1227297 () Bool)

(assert (=> d!144243 m!1227297))

(assert (=> d!144243 m!1227101))

(declare-fun m!1227299 () Bool)

(assert (=> d!144243 m!1227299))

(assert (=> b!1338949 m!1227101))

(declare-fun m!1227301 () Bool)

(assert (=> b!1338949 m!1227301))

(assert (=> b!1338759 d!144243))

(declare-fun d!144245 () Bool)

(declare-fun e!762525 () Bool)

(assert (=> d!144245 e!762525))

(declare-fun res!888139 () Bool)

(assert (=> d!144245 (=> res!888139 e!762525)))

(declare-fun lt!593733 () Bool)

(assert (=> d!144245 (= res!888139 (not lt!593733))))

(declare-fun lt!593735 () Bool)

(assert (=> d!144245 (= lt!593733 lt!593735)))

(declare-fun lt!593732 () Unit!43880)

(declare-fun e!762524 () Unit!43880)

(assert (=> d!144245 (= lt!593732 e!762524)))

(declare-fun c!126532 () Bool)

(assert (=> d!144245 (= c!126532 lt!593735)))

(assert (=> d!144245 (= lt!593735 (containsKey!739 (toList!10837 lt!593605) (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!144245 (= (contains!9016 lt!593605 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!593733)))

(declare-fun b!1338950 () Bool)

(declare-fun lt!593734 () Unit!43880)

(assert (=> b!1338950 (= e!762524 lt!593734)))

(assert (=> b!1338950 (= lt!593734 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593605) (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338950 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593605) (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338951 () Bool)

(declare-fun Unit!43889 () Unit!43880)

(assert (=> b!1338951 (= e!762524 Unit!43889)))

(declare-fun b!1338952 () Bool)

(assert (=> b!1338952 (= e!762525 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593605) (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!144245 c!126532) b!1338950))

(assert (= (and d!144245 (not c!126532)) b!1338951))

(assert (= (and d!144245 (not res!888139)) b!1338952))

(assert (=> d!144245 m!1227071))

(declare-fun m!1227303 () Bool)

(assert (=> d!144245 m!1227303))

(assert (=> b!1338950 m!1227071))

(declare-fun m!1227305 () Bool)

(assert (=> b!1338950 m!1227305))

(assert (=> b!1338950 m!1227071))

(declare-fun m!1227307 () Bool)

(assert (=> b!1338950 m!1227307))

(assert (=> b!1338950 m!1227307))

(declare-fun m!1227309 () Bool)

(assert (=> b!1338950 m!1227309))

(assert (=> b!1338952 m!1227071))

(assert (=> b!1338952 m!1227307))

(assert (=> b!1338952 m!1227307))

(assert (=> b!1338952 m!1227309))

(assert (=> b!1338738 d!144245))

(declare-fun b!1338953 () Bool)

(declare-fun e!762526 () Bool)

(declare-fun e!762527 () Bool)

(assert (=> b!1338953 (= e!762526 e!762527)))

(declare-fun c!126533 () Bool)

(assert (=> b!1338953 (= c!126533 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!144247 () Bool)

(declare-fun res!888142 () Bool)

(declare-fun e!762528 () Bool)

(assert (=> d!144247 (=> res!888142 e!762528)))

(assert (=> d!144247 (= res!888142 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(assert (=> d!144247 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126477 (Cons!31113 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) Nil!31114) Nil!31114)) e!762528)))

(declare-fun b!1338954 () Bool)

(declare-fun call!65012 () Bool)

(assert (=> b!1338954 (= e!762527 call!65012)))

(declare-fun b!1338955 () Bool)

(assert (=> b!1338955 (= e!762527 call!65012)))

(declare-fun bm!65009 () Bool)

(assert (=> bm!65009 (= call!65012 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126533 (Cons!31113 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126477 (Cons!31113 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) Nil!31114) Nil!31114)) (ite c!126477 (Cons!31113 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) Nil!31114) Nil!31114))))))

(declare-fun b!1338956 () Bool)

(assert (=> b!1338956 (= e!762528 e!762526)))

(declare-fun res!888141 () Bool)

(assert (=> b!1338956 (=> (not res!888141) (not e!762526))))

(declare-fun e!762529 () Bool)

(assert (=> b!1338956 (= res!888141 (not e!762529))))

(declare-fun res!888140 () Bool)

(assert (=> b!1338956 (=> (not res!888140) (not e!762529))))

(assert (=> b!1338956 (= res!888140 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1338957 () Bool)

(assert (=> b!1338957 (= e!762529 (contains!9019 (ite c!126477 (Cons!31113 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) Nil!31114) Nil!31114) (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144247 (not res!888142)) b!1338956))

(assert (= (and b!1338956 res!888140) b!1338957))

(assert (= (and b!1338956 res!888141) b!1338953))

(assert (= (and b!1338953 c!126533) b!1338955))

(assert (= (and b!1338953 (not c!126533)) b!1338954))

(assert (= (or b!1338955 b!1338954) bm!65009))

(declare-fun m!1227311 () Bool)

(assert (=> b!1338953 m!1227311))

(assert (=> b!1338953 m!1227311))

(declare-fun m!1227313 () Bool)

(assert (=> b!1338953 m!1227313))

(assert (=> bm!65009 m!1227311))

(declare-fun m!1227315 () Bool)

(assert (=> bm!65009 m!1227315))

(assert (=> b!1338956 m!1227311))

(assert (=> b!1338956 m!1227311))

(assert (=> b!1338956 m!1227313))

(assert (=> b!1338957 m!1227311))

(assert (=> b!1338957 m!1227311))

(declare-fun m!1227317 () Bool)

(assert (=> b!1338957 m!1227317))

(assert (=> bm!64973 d!144247))

(declare-fun d!144249 () Bool)

(assert (=> d!144249 (contains!9016 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262)) lt!593676)))

(declare-fun lt!593738 () Unit!43880)

(declare-fun choose!1966 (ListLongMap!21643 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43880)

(assert (=> d!144249 (= lt!593738 (choose!1966 lt!593675 lt!593677 zeroValue!1262 lt!593676))))

(assert (=> d!144249 (contains!9016 lt!593675 lt!593676)))

(assert (=> d!144249 (= (addStillContains!1195 lt!593675 lt!593677 zeroValue!1262 lt!593676) lt!593738)))

(declare-fun bs!38313 () Bool)

(assert (= bs!38313 d!144249))

(assert (=> bs!38313 m!1227141))

(assert (=> bs!38313 m!1227141))

(assert (=> bs!38313 m!1227143))

(declare-fun m!1227319 () Bool)

(assert (=> bs!38313 m!1227319))

(declare-fun m!1227321 () Bool)

(assert (=> bs!38313 m!1227321))

(assert (=> b!1338826 d!144249))

(declare-fun d!144251 () Bool)

(declare-fun e!762531 () Bool)

(assert (=> d!144251 e!762531))

(declare-fun res!888143 () Bool)

(assert (=> d!144251 (=> res!888143 e!762531)))

(declare-fun lt!593740 () Bool)

(assert (=> d!144251 (= res!888143 (not lt!593740))))

(declare-fun lt!593742 () Bool)

(assert (=> d!144251 (= lt!593740 lt!593742)))

(declare-fun lt!593739 () Unit!43880)

(declare-fun e!762530 () Unit!43880)

(assert (=> d!144251 (= lt!593739 e!762530)))

(declare-fun c!126534 () Bool)

(assert (=> d!144251 (= c!126534 lt!593742)))

(assert (=> d!144251 (= lt!593742 (containsKey!739 (toList!10837 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262))) lt!593676))))

(assert (=> d!144251 (= (contains!9016 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262)) lt!593676) lt!593740)))

(declare-fun b!1338959 () Bool)

(declare-fun lt!593741 () Unit!43880)

(assert (=> b!1338959 (= e!762530 lt!593741)))

(assert (=> b!1338959 (= lt!593741 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262))) lt!593676))))

(assert (=> b!1338959 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262))) lt!593676))))

(declare-fun b!1338960 () Bool)

(declare-fun Unit!43890 () Unit!43880)

(assert (=> b!1338960 (= e!762530 Unit!43890)))

(declare-fun b!1338961 () Bool)

(assert (=> b!1338961 (= e!762531 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262))) lt!593676)))))

(assert (= (and d!144251 c!126534) b!1338959))

(assert (= (and d!144251 (not c!126534)) b!1338960))

(assert (= (and d!144251 (not res!888143)) b!1338961))

(declare-fun m!1227323 () Bool)

(assert (=> d!144251 m!1227323))

(declare-fun m!1227325 () Bool)

(assert (=> b!1338959 m!1227325))

(declare-fun m!1227327 () Bool)

(assert (=> b!1338959 m!1227327))

(assert (=> b!1338959 m!1227327))

(declare-fun m!1227329 () Bool)

(assert (=> b!1338959 m!1227329))

(assert (=> b!1338961 m!1227327))

(assert (=> b!1338961 m!1227327))

(assert (=> b!1338961 m!1227329))

(assert (=> b!1338826 d!144251))

(declare-fun d!144253 () Bool)

(assert (=> d!144253 (= (apply!1043 (+!4782 lt!593667 (tuple2!23979 lt!593669 minValue!1262)) lt!593683) (get!22172 (getValueByKey!713 (toList!10837 (+!4782 lt!593667 (tuple2!23979 lt!593669 minValue!1262))) lt!593683)))))

(declare-fun bs!38314 () Bool)

(assert (= bs!38314 d!144253))

(declare-fun m!1227331 () Bool)

(assert (=> bs!38314 m!1227331))

(assert (=> bs!38314 m!1227331))

(declare-fun m!1227333 () Bool)

(assert (=> bs!38314 m!1227333))

(assert (=> b!1338826 d!144253))

(assert (=> b!1338826 d!144213))

(declare-fun d!144255 () Bool)

(declare-fun e!762532 () Bool)

(assert (=> d!144255 e!762532))

(declare-fun res!888144 () Bool)

(assert (=> d!144255 (=> (not res!888144) (not e!762532))))

(declare-fun lt!593743 () ListLongMap!21643)

(assert (=> d!144255 (= res!888144 (contains!9016 lt!593743 (_1!12000 (tuple2!23979 lt!593672 zeroValue!1262))))))

(declare-fun lt!593745 () List!31118)

(assert (=> d!144255 (= lt!593743 (ListLongMap!21644 lt!593745))))

(declare-fun lt!593744 () Unit!43880)

(declare-fun lt!593746 () Unit!43880)

(assert (=> d!144255 (= lt!593744 lt!593746)))

(assert (=> d!144255 (= (getValueByKey!713 lt!593745 (_1!12000 (tuple2!23979 lt!593672 zeroValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593672 zeroValue!1262))))))

(assert (=> d!144255 (= lt!593746 (lemmaContainsTupThenGetReturnValue!363 lt!593745 (_1!12000 (tuple2!23979 lt!593672 zeroValue!1262)) (_2!12000 (tuple2!23979 lt!593672 zeroValue!1262))))))

(assert (=> d!144255 (= lt!593745 (insertStrictlySorted!492 (toList!10837 lt!593670) (_1!12000 (tuple2!23979 lt!593672 zeroValue!1262)) (_2!12000 (tuple2!23979 lt!593672 zeroValue!1262))))))

(assert (=> d!144255 (= (+!4782 lt!593670 (tuple2!23979 lt!593672 zeroValue!1262)) lt!593743)))

(declare-fun b!1338962 () Bool)

(declare-fun res!888145 () Bool)

(assert (=> b!1338962 (=> (not res!888145) (not e!762532))))

(assert (=> b!1338962 (= res!888145 (= (getValueByKey!713 (toList!10837 lt!593743) (_1!12000 (tuple2!23979 lt!593672 zeroValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593672 zeroValue!1262)))))))

(declare-fun b!1338963 () Bool)

(assert (=> b!1338963 (= e!762532 (contains!9018 (toList!10837 lt!593743) (tuple2!23979 lt!593672 zeroValue!1262)))))

(assert (= (and d!144255 res!888144) b!1338962))

(assert (= (and b!1338962 res!888145) b!1338963))

(declare-fun m!1227335 () Bool)

(assert (=> d!144255 m!1227335))

(declare-fun m!1227337 () Bool)

(assert (=> d!144255 m!1227337))

(declare-fun m!1227339 () Bool)

(assert (=> d!144255 m!1227339))

(declare-fun m!1227341 () Bool)

(assert (=> d!144255 m!1227341))

(declare-fun m!1227343 () Bool)

(assert (=> b!1338962 m!1227343))

(declare-fun m!1227345 () Bool)

(assert (=> b!1338963 m!1227345))

(assert (=> b!1338826 d!144255))

(declare-fun d!144257 () Bool)

(assert (=> d!144257 (= (apply!1043 (+!4782 lt!593684 (tuple2!23979 lt!593678 minValue!1262)) lt!593688) (get!22172 (getValueByKey!713 (toList!10837 (+!4782 lt!593684 (tuple2!23979 lt!593678 minValue!1262))) lt!593688)))))

(declare-fun bs!38315 () Bool)

(assert (= bs!38315 d!144257))

(declare-fun m!1227347 () Bool)

(assert (=> bs!38315 m!1227347))

(assert (=> bs!38315 m!1227347))

(declare-fun m!1227349 () Bool)

(assert (=> bs!38315 m!1227349))

(assert (=> b!1338826 d!144257))

(declare-fun d!144259 () Bool)

(assert (=> d!144259 (= (apply!1043 (+!4782 lt!593670 (tuple2!23979 lt!593672 zeroValue!1262)) lt!593685) (apply!1043 lt!593670 lt!593685))))

(declare-fun lt!593749 () Unit!43880)

(declare-fun choose!1967 (ListLongMap!21643 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43880)

(assert (=> d!144259 (= lt!593749 (choose!1967 lt!593670 lt!593672 zeroValue!1262 lt!593685))))

(declare-fun e!762535 () Bool)

(assert (=> d!144259 e!762535))

(declare-fun res!888148 () Bool)

(assert (=> d!144259 (=> (not res!888148) (not e!762535))))

(assert (=> d!144259 (= res!888148 (contains!9016 lt!593670 lt!593685))))

(assert (=> d!144259 (= (addApplyDifferent!572 lt!593670 lt!593672 zeroValue!1262 lt!593685) lt!593749)))

(declare-fun b!1338967 () Bool)

(assert (=> b!1338967 (= e!762535 (not (= lt!593685 lt!593672)))))

(assert (= (and d!144259 res!888148) b!1338967))

(assert (=> d!144259 m!1227145))

(declare-fun m!1227351 () Bool)

(assert (=> d!144259 m!1227351))

(declare-fun m!1227353 () Bool)

(assert (=> d!144259 m!1227353))

(assert (=> d!144259 m!1227145))

(assert (=> d!144259 m!1227147))

(assert (=> d!144259 m!1227171))

(assert (=> b!1338826 d!144259))

(declare-fun d!144261 () Bool)

(declare-fun e!762536 () Bool)

(assert (=> d!144261 e!762536))

(declare-fun res!888149 () Bool)

(assert (=> d!144261 (=> (not res!888149) (not e!762536))))

(declare-fun lt!593750 () ListLongMap!21643)

(assert (=> d!144261 (= res!888149 (contains!9016 lt!593750 (_1!12000 (tuple2!23979 lt!593669 minValue!1262))))))

(declare-fun lt!593752 () List!31118)

(assert (=> d!144261 (= lt!593750 (ListLongMap!21644 lt!593752))))

(declare-fun lt!593751 () Unit!43880)

(declare-fun lt!593753 () Unit!43880)

(assert (=> d!144261 (= lt!593751 lt!593753)))

(assert (=> d!144261 (= (getValueByKey!713 lt!593752 (_1!12000 (tuple2!23979 lt!593669 minValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593669 minValue!1262))))))

(assert (=> d!144261 (= lt!593753 (lemmaContainsTupThenGetReturnValue!363 lt!593752 (_1!12000 (tuple2!23979 lt!593669 minValue!1262)) (_2!12000 (tuple2!23979 lt!593669 minValue!1262))))))

(assert (=> d!144261 (= lt!593752 (insertStrictlySorted!492 (toList!10837 lt!593667) (_1!12000 (tuple2!23979 lt!593669 minValue!1262)) (_2!12000 (tuple2!23979 lt!593669 minValue!1262))))))

(assert (=> d!144261 (= (+!4782 lt!593667 (tuple2!23979 lt!593669 minValue!1262)) lt!593750)))

(declare-fun b!1338968 () Bool)

(declare-fun res!888150 () Bool)

(assert (=> b!1338968 (=> (not res!888150) (not e!762536))))

(assert (=> b!1338968 (= res!888150 (= (getValueByKey!713 (toList!10837 lt!593750) (_1!12000 (tuple2!23979 lt!593669 minValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593669 minValue!1262)))))))

(declare-fun b!1338969 () Bool)

(assert (=> b!1338969 (= e!762536 (contains!9018 (toList!10837 lt!593750) (tuple2!23979 lt!593669 minValue!1262)))))

(assert (= (and d!144261 res!888149) b!1338968))

(assert (= (and b!1338968 res!888150) b!1338969))

(declare-fun m!1227355 () Bool)

(assert (=> d!144261 m!1227355))

(declare-fun m!1227357 () Bool)

(assert (=> d!144261 m!1227357))

(declare-fun m!1227359 () Bool)

(assert (=> d!144261 m!1227359))

(declare-fun m!1227361 () Bool)

(assert (=> d!144261 m!1227361))

(declare-fun m!1227363 () Bool)

(assert (=> b!1338968 m!1227363))

(declare-fun m!1227365 () Bool)

(assert (=> b!1338969 m!1227365))

(assert (=> b!1338826 d!144261))

(declare-fun d!144263 () Bool)

(assert (=> d!144263 (= (apply!1043 lt!593684 lt!593688) (get!22172 (getValueByKey!713 (toList!10837 lt!593684) lt!593688)))))

(declare-fun bs!38316 () Bool)

(assert (= bs!38316 d!144263))

(declare-fun m!1227367 () Bool)

(assert (=> bs!38316 m!1227367))

(assert (=> bs!38316 m!1227367))

(declare-fun m!1227369 () Bool)

(assert (=> bs!38316 m!1227369))

(assert (=> b!1338826 d!144263))

(declare-fun d!144265 () Bool)

(assert (=> d!144265 (= (apply!1043 (+!4782 lt!593684 (tuple2!23979 lt!593678 minValue!1262)) lt!593688) (apply!1043 lt!593684 lt!593688))))

(declare-fun lt!593754 () Unit!43880)

(assert (=> d!144265 (= lt!593754 (choose!1967 lt!593684 lt!593678 minValue!1262 lt!593688))))

(declare-fun e!762537 () Bool)

(assert (=> d!144265 e!762537))

(declare-fun res!888151 () Bool)

(assert (=> d!144265 (=> (not res!888151) (not e!762537))))

(assert (=> d!144265 (= res!888151 (contains!9016 lt!593684 lt!593688))))

(assert (=> d!144265 (= (addApplyDifferent!572 lt!593684 lt!593678 minValue!1262 lt!593688) lt!593754)))

(declare-fun b!1338970 () Bool)

(assert (=> b!1338970 (= e!762537 (not (= lt!593688 lt!593678)))))

(assert (= (and d!144265 res!888151) b!1338970))

(assert (=> d!144265 m!1227151))

(declare-fun m!1227371 () Bool)

(assert (=> d!144265 m!1227371))

(declare-fun m!1227373 () Bool)

(assert (=> d!144265 m!1227373))

(assert (=> d!144265 m!1227151))

(assert (=> d!144265 m!1227157))

(assert (=> d!144265 m!1227149))

(assert (=> b!1338826 d!144265))

(declare-fun d!144267 () Bool)

(assert (=> d!144267 (= (apply!1043 (+!4782 lt!593667 (tuple2!23979 lt!593669 minValue!1262)) lt!593683) (apply!1043 lt!593667 lt!593683))))

(declare-fun lt!593755 () Unit!43880)

(assert (=> d!144267 (= lt!593755 (choose!1967 lt!593667 lt!593669 minValue!1262 lt!593683))))

(declare-fun e!762538 () Bool)

(assert (=> d!144267 e!762538))

(declare-fun res!888152 () Bool)

(assert (=> d!144267 (=> (not res!888152) (not e!762538))))

(assert (=> d!144267 (= res!888152 (contains!9016 lt!593667 lt!593683))))

(assert (=> d!144267 (= (addApplyDifferent!572 lt!593667 lt!593669 minValue!1262 lt!593683) lt!593755)))

(declare-fun b!1338971 () Bool)

(assert (=> b!1338971 (= e!762538 (not (= lt!593683 lt!593669)))))

(assert (= (and d!144267 res!888152) b!1338971))

(assert (=> d!144267 m!1227165))

(declare-fun m!1227375 () Bool)

(assert (=> d!144267 m!1227375))

(declare-fun m!1227377 () Bool)

(assert (=> d!144267 m!1227377))

(assert (=> d!144267 m!1227165))

(assert (=> d!144267 m!1227167))

(assert (=> d!144267 m!1227161))

(assert (=> b!1338826 d!144267))

(declare-fun d!144269 () Bool)

(assert (=> d!144269 (= (apply!1043 lt!593667 lt!593683) (get!22172 (getValueByKey!713 (toList!10837 lt!593667) lt!593683)))))

(declare-fun bs!38317 () Bool)

(assert (= bs!38317 d!144269))

(declare-fun m!1227379 () Bool)

(assert (=> bs!38317 m!1227379))

(assert (=> bs!38317 m!1227379))

(declare-fun m!1227381 () Bool)

(assert (=> bs!38317 m!1227381))

(assert (=> b!1338826 d!144269))

(declare-fun d!144271 () Bool)

(declare-fun e!762539 () Bool)

(assert (=> d!144271 e!762539))

(declare-fun res!888153 () Bool)

(assert (=> d!144271 (=> (not res!888153) (not e!762539))))

(declare-fun lt!593756 () ListLongMap!21643)

(assert (=> d!144271 (= res!888153 (contains!9016 lt!593756 (_1!12000 (tuple2!23979 lt!593678 minValue!1262))))))

(declare-fun lt!593758 () List!31118)

(assert (=> d!144271 (= lt!593756 (ListLongMap!21644 lt!593758))))

(declare-fun lt!593757 () Unit!43880)

(declare-fun lt!593759 () Unit!43880)

(assert (=> d!144271 (= lt!593757 lt!593759)))

(assert (=> d!144271 (= (getValueByKey!713 lt!593758 (_1!12000 (tuple2!23979 lt!593678 minValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593678 minValue!1262))))))

(assert (=> d!144271 (= lt!593759 (lemmaContainsTupThenGetReturnValue!363 lt!593758 (_1!12000 (tuple2!23979 lt!593678 minValue!1262)) (_2!12000 (tuple2!23979 lt!593678 minValue!1262))))))

(assert (=> d!144271 (= lt!593758 (insertStrictlySorted!492 (toList!10837 lt!593684) (_1!12000 (tuple2!23979 lt!593678 minValue!1262)) (_2!12000 (tuple2!23979 lt!593678 minValue!1262))))))

(assert (=> d!144271 (= (+!4782 lt!593684 (tuple2!23979 lt!593678 minValue!1262)) lt!593756)))

(declare-fun b!1338972 () Bool)

(declare-fun res!888154 () Bool)

(assert (=> b!1338972 (=> (not res!888154) (not e!762539))))

(assert (=> b!1338972 (= res!888154 (= (getValueByKey!713 (toList!10837 lt!593756) (_1!12000 (tuple2!23979 lt!593678 minValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593678 minValue!1262)))))))

(declare-fun b!1338973 () Bool)

(assert (=> b!1338973 (= e!762539 (contains!9018 (toList!10837 lt!593756) (tuple2!23979 lt!593678 minValue!1262)))))

(assert (= (and d!144271 res!888153) b!1338972))

(assert (= (and b!1338972 res!888154) b!1338973))

(declare-fun m!1227383 () Bool)

(assert (=> d!144271 m!1227383))

(declare-fun m!1227385 () Bool)

(assert (=> d!144271 m!1227385))

(declare-fun m!1227387 () Bool)

(assert (=> d!144271 m!1227387))

(declare-fun m!1227389 () Bool)

(assert (=> d!144271 m!1227389))

(declare-fun m!1227391 () Bool)

(assert (=> b!1338972 m!1227391))

(declare-fun m!1227393 () Bool)

(assert (=> b!1338973 m!1227393))

(assert (=> b!1338826 d!144271))

(declare-fun d!144273 () Bool)

(assert (=> d!144273 (= (apply!1043 (+!4782 lt!593670 (tuple2!23979 lt!593672 zeroValue!1262)) lt!593685) (get!22172 (getValueByKey!713 (toList!10837 (+!4782 lt!593670 (tuple2!23979 lt!593672 zeroValue!1262))) lt!593685)))))

(declare-fun bs!38318 () Bool)

(assert (= bs!38318 d!144273))

(declare-fun m!1227395 () Bool)

(assert (=> bs!38318 m!1227395))

(assert (=> bs!38318 m!1227395))

(declare-fun m!1227397 () Bool)

(assert (=> bs!38318 m!1227397))

(assert (=> b!1338826 d!144273))

(declare-fun d!144275 () Bool)

(declare-fun e!762540 () Bool)

(assert (=> d!144275 e!762540))

(declare-fun res!888155 () Bool)

(assert (=> d!144275 (=> (not res!888155) (not e!762540))))

(declare-fun lt!593760 () ListLongMap!21643)

(assert (=> d!144275 (= res!888155 (contains!9016 lt!593760 (_1!12000 (tuple2!23979 lt!593677 zeroValue!1262))))))

(declare-fun lt!593762 () List!31118)

(assert (=> d!144275 (= lt!593760 (ListLongMap!21644 lt!593762))))

(declare-fun lt!593761 () Unit!43880)

(declare-fun lt!593763 () Unit!43880)

(assert (=> d!144275 (= lt!593761 lt!593763)))

(assert (=> d!144275 (= (getValueByKey!713 lt!593762 (_1!12000 (tuple2!23979 lt!593677 zeroValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593677 zeroValue!1262))))))

(assert (=> d!144275 (= lt!593763 (lemmaContainsTupThenGetReturnValue!363 lt!593762 (_1!12000 (tuple2!23979 lt!593677 zeroValue!1262)) (_2!12000 (tuple2!23979 lt!593677 zeroValue!1262))))))

(assert (=> d!144275 (= lt!593762 (insertStrictlySorted!492 (toList!10837 lt!593675) (_1!12000 (tuple2!23979 lt!593677 zeroValue!1262)) (_2!12000 (tuple2!23979 lt!593677 zeroValue!1262))))))

(assert (=> d!144275 (= (+!4782 lt!593675 (tuple2!23979 lt!593677 zeroValue!1262)) lt!593760)))

(declare-fun b!1338974 () Bool)

(declare-fun res!888156 () Bool)

(assert (=> b!1338974 (=> (not res!888156) (not e!762540))))

(assert (=> b!1338974 (= res!888156 (= (getValueByKey!713 (toList!10837 lt!593760) (_1!12000 (tuple2!23979 lt!593677 zeroValue!1262))) (Some!763 (_2!12000 (tuple2!23979 lt!593677 zeroValue!1262)))))))

(declare-fun b!1338975 () Bool)

(assert (=> b!1338975 (= e!762540 (contains!9018 (toList!10837 lt!593760) (tuple2!23979 lt!593677 zeroValue!1262)))))

(assert (= (and d!144275 res!888155) b!1338974))

(assert (= (and b!1338974 res!888156) b!1338975))

(declare-fun m!1227399 () Bool)

(assert (=> d!144275 m!1227399))

(declare-fun m!1227401 () Bool)

(assert (=> d!144275 m!1227401))

(declare-fun m!1227403 () Bool)

(assert (=> d!144275 m!1227403))

(declare-fun m!1227405 () Bool)

(assert (=> d!144275 m!1227405))

(declare-fun m!1227407 () Bool)

(assert (=> b!1338974 m!1227407))

(declare-fun m!1227409 () Bool)

(assert (=> b!1338975 m!1227409))

(assert (=> b!1338826 d!144275))

(declare-fun d!144277 () Bool)

(assert (=> d!144277 (= (apply!1043 lt!593670 lt!593685) (get!22172 (getValueByKey!713 (toList!10837 lt!593670) lt!593685)))))

(declare-fun bs!38319 () Bool)

(assert (= bs!38319 d!144277))

(declare-fun m!1227411 () Bool)

(assert (=> bs!38319 m!1227411))

(assert (=> bs!38319 m!1227411))

(declare-fun m!1227413 () Bool)

(assert (=> bs!38319 m!1227413))

(assert (=> b!1338826 d!144277))

(assert (=> b!1338758 d!144237))

(declare-fun d!144279 () Bool)

(declare-fun e!762541 () Bool)

(assert (=> d!144279 e!762541))

(declare-fun res!888157 () Bool)

(assert (=> d!144279 (=> (not res!888157) (not e!762541))))

(declare-fun lt!593764 () ListLongMap!21643)

(assert (=> d!144279 (= res!888157 (contains!9016 lt!593764 (_1!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593766 () List!31118)

(assert (=> d!144279 (= lt!593764 (ListLongMap!21644 lt!593766))))

(declare-fun lt!593765 () Unit!43880)

(declare-fun lt!593767 () Unit!43880)

(assert (=> d!144279 (= lt!593765 lt!593767)))

(assert (=> d!144279 (= (getValueByKey!713 lt!593766 (_1!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!763 (_2!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144279 (= lt!593767 (lemmaContainsTupThenGetReturnValue!363 lt!593766 (_1!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144279 (= lt!593766 (insertStrictlySorted!492 (toList!10837 call!64998) (_1!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144279 (= (+!4782 call!64998 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593764)))

(declare-fun b!1338976 () Bool)

(declare-fun res!888158 () Bool)

(assert (=> b!1338976 (=> (not res!888158) (not e!762541))))

(assert (=> b!1338976 (= res!888158 (= (getValueByKey!713 (toList!10837 lt!593764) (_1!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!763 (_2!12000 (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1338977 () Bool)

(assert (=> b!1338977 (= e!762541 (contains!9018 (toList!10837 lt!593764) (tuple2!23979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144279 res!888157) b!1338976))

(assert (= (and b!1338976 res!888158) b!1338977))

(declare-fun m!1227415 () Bool)

(assert (=> d!144279 m!1227415))

(declare-fun m!1227417 () Bool)

(assert (=> d!144279 m!1227417))

(declare-fun m!1227419 () Bool)

(assert (=> d!144279 m!1227419))

(declare-fun m!1227421 () Bool)

(assert (=> d!144279 m!1227421))

(declare-fun m!1227423 () Bool)

(assert (=> b!1338976 m!1227423))

(declare-fun m!1227425 () Bool)

(assert (=> b!1338977 m!1227425))

(assert (=> b!1338820 d!144279))

(declare-fun d!144281 () Bool)

(declare-fun isEmpty!1091 (List!31118) Bool)

(assert (=> d!144281 (= (isEmpty!1089 lt!593605) (isEmpty!1091 (toList!10837 lt!593605)))))

(declare-fun bs!38320 () Bool)

(assert (= bs!38320 d!144281))

(declare-fun m!1227427 () Bool)

(assert (=> bs!38320 m!1227427))

(assert (=> b!1338732 d!144281))

(declare-fun b!1338978 () Bool)

(declare-fun e!762542 () Option!764)

(assert (=> b!1338978 (= e!762542 (Some!763 (_2!12000 (h!32332 (toList!10837 lt!593585)))))))

(declare-fun d!144283 () Bool)

(declare-fun c!126535 () Bool)

(assert (=> d!144283 (= c!126535 (and ((_ is Cons!31114) (toList!10837 lt!593585)) (= (_1!12000 (h!32332 (toList!10837 lt!593585))) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144283 (= (getValueByKey!713 (toList!10837 lt!593585) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!762542)))

(declare-fun b!1338979 () Bool)

(declare-fun e!762543 () Option!764)

(assert (=> b!1338979 (= e!762542 e!762543)))

(declare-fun c!126536 () Bool)

(assert (=> b!1338979 (= c!126536 (and ((_ is Cons!31114) (toList!10837 lt!593585)) (not (= (_1!12000 (h!32332 (toList!10837 lt!593585))) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1338980 () Bool)

(assert (=> b!1338980 (= e!762543 (getValueByKey!713 (t!45424 (toList!10837 lt!593585)) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1338981 () Bool)

(assert (=> b!1338981 (= e!762543 None!762)))

(assert (= (and d!144283 c!126535) b!1338978))

(assert (= (and d!144283 (not c!126535)) b!1338979))

(assert (= (and b!1338979 c!126536) b!1338980))

(assert (= (and b!1338979 (not c!126536)) b!1338981))

(declare-fun m!1227429 () Bool)

(assert (=> b!1338980 m!1227429))

(assert (=> b!1338701 d!144283))

(declare-fun d!144285 () Bool)

(declare-fun e!762545 () Bool)

(assert (=> d!144285 e!762545))

(declare-fun res!888159 () Bool)

(assert (=> d!144285 (=> res!888159 e!762545)))

(declare-fun lt!593769 () Bool)

(assert (=> d!144285 (= res!888159 (not lt!593769))))

(declare-fun lt!593771 () Bool)

(assert (=> d!144285 (= lt!593769 lt!593771)))

(declare-fun lt!593768 () Unit!43880)

(declare-fun e!762544 () Unit!43880)

(assert (=> d!144285 (= lt!593768 e!762544)))

(declare-fun c!126537 () Bool)

(assert (=> d!144285 (= c!126537 lt!593771)))

(assert (=> d!144285 (= lt!593771 (containsKey!739 (toList!10837 lt!593681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144285 (= (contains!9016 lt!593681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593769)))

(declare-fun b!1338982 () Bool)

(declare-fun lt!593770 () Unit!43880)

(assert (=> b!1338982 (= e!762544 lt!593770)))

(assert (=> b!1338982 (= lt!593770 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338982 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338983 () Bool)

(declare-fun Unit!43891 () Unit!43880)

(assert (=> b!1338983 (= e!762544 Unit!43891)))

(declare-fun b!1338984 () Bool)

(assert (=> b!1338984 (= e!762545 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144285 c!126537) b!1338982))

(assert (= (and d!144285 (not c!126537)) b!1338983))

(assert (= (and d!144285 (not res!888159)) b!1338984))

(declare-fun m!1227431 () Bool)

(assert (=> d!144285 m!1227431))

(declare-fun m!1227433 () Bool)

(assert (=> b!1338982 m!1227433))

(declare-fun m!1227435 () Bool)

(assert (=> b!1338982 m!1227435))

(assert (=> b!1338982 m!1227435))

(declare-fun m!1227437 () Bool)

(assert (=> b!1338982 m!1227437))

(assert (=> b!1338984 m!1227435))

(assert (=> b!1338984 m!1227435))

(assert (=> b!1338984 m!1227437))

(assert (=> bm!64997 d!144285))

(declare-fun d!144287 () Bool)

(assert (=> d!144287 (= (apply!1043 lt!593605 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22172 (getValueByKey!713 (toList!10837 lt!593605) (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38321 () Bool)

(assert (= bs!38321 d!144287))

(assert (=> bs!38321 m!1227071))

(assert (=> bs!38321 m!1227307))

(assert (=> bs!38321 m!1227307))

(declare-fun m!1227439 () Bool)

(assert (=> bs!38321 m!1227439))

(assert (=> b!1338730 d!144287))

(declare-fun d!144289 () Bool)

(declare-fun c!126538 () Bool)

(assert (=> d!144289 (= c!126538 ((_ is ValueCellFull!17579) (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!762546 () V!54377)

(assert (=> d!144289 (= (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762546)))

(declare-fun b!1338985 () Bool)

(assert (=> b!1338985 (= e!762546 (get!22170 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338986 () Bool)

(assert (=> b!1338986 (= e!762546 (get!22171 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144289 c!126538) b!1338985))

(assert (= (and d!144289 (not c!126538)) b!1338986))

(assert (=> b!1338985 m!1227083))

(assert (=> b!1338985 m!1226973))

(declare-fun m!1227441 () Bool)

(assert (=> b!1338985 m!1227441))

(assert (=> b!1338986 m!1227083))

(assert (=> b!1338986 m!1226973))

(declare-fun m!1227443 () Bool)

(assert (=> b!1338986 m!1227443))

(assert (=> b!1338730 d!144289))

(declare-fun d!144291 () Bool)

(assert (=> d!144291 (= (apply!1043 lt!593681 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22172 (getValueByKey!713 (toList!10837 lt!593681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38322 () Bool)

(assert (= bs!38322 d!144291))

(assert (=> bs!38322 m!1227435))

(assert (=> bs!38322 m!1227435))

(declare-fun m!1227445 () Bool)

(assert (=> bs!38322 m!1227445))

(assert (=> b!1338835 d!144291))

(assert (=> b!1338731 d!144235))

(declare-fun d!144293 () Bool)

(assert (=> d!144293 (not (contains!9016 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604)) lt!593603))))

(declare-fun lt!593774 () Unit!43880)

(declare-fun choose!1968 (ListLongMap!21643 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43880)

(assert (=> d!144293 (= lt!593774 (choose!1968 lt!593608 lt!593606 lt!593604 lt!593603))))

(declare-fun e!762549 () Bool)

(assert (=> d!144293 e!762549))

(declare-fun res!888162 () Bool)

(assert (=> d!144293 (=> (not res!888162) (not e!762549))))

(assert (=> d!144293 (= res!888162 (not (contains!9016 lt!593608 lt!593603)))))

(assert (=> d!144293 (= (addStillNotContains!499 lt!593608 lt!593606 lt!593604 lt!593603) lt!593774)))

(declare-fun b!1338990 () Bool)

(assert (=> b!1338990 (= e!762549 (not (= lt!593606 lt!593603)))))

(assert (= (and d!144293 res!888162) b!1338990))

(assert (=> d!144293 m!1227085))

(assert (=> d!144293 m!1227085))

(assert (=> d!144293 m!1227087))

(declare-fun m!1227447 () Bool)

(assert (=> d!144293 m!1227447))

(declare-fun m!1227449 () Bool)

(assert (=> d!144293 m!1227449))

(assert (=> b!1338734 d!144293))

(assert (=> b!1338734 d!144289))

(declare-fun d!144295 () Bool)

(declare-fun e!762550 () Bool)

(assert (=> d!144295 e!762550))

(declare-fun res!888163 () Bool)

(assert (=> d!144295 (=> (not res!888163) (not e!762550))))

(declare-fun lt!593775 () ListLongMap!21643)

(assert (=> d!144295 (= res!888163 (contains!9016 lt!593775 (_1!12000 (tuple2!23979 lt!593606 lt!593604))))))

(declare-fun lt!593777 () List!31118)

(assert (=> d!144295 (= lt!593775 (ListLongMap!21644 lt!593777))))

(declare-fun lt!593776 () Unit!43880)

(declare-fun lt!593778 () Unit!43880)

(assert (=> d!144295 (= lt!593776 lt!593778)))

(assert (=> d!144295 (= (getValueByKey!713 lt!593777 (_1!12000 (tuple2!23979 lt!593606 lt!593604))) (Some!763 (_2!12000 (tuple2!23979 lt!593606 lt!593604))))))

(assert (=> d!144295 (= lt!593778 (lemmaContainsTupThenGetReturnValue!363 lt!593777 (_1!12000 (tuple2!23979 lt!593606 lt!593604)) (_2!12000 (tuple2!23979 lt!593606 lt!593604))))))

(assert (=> d!144295 (= lt!593777 (insertStrictlySorted!492 (toList!10837 lt!593608) (_1!12000 (tuple2!23979 lt!593606 lt!593604)) (_2!12000 (tuple2!23979 lt!593606 lt!593604))))))

(assert (=> d!144295 (= (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604)) lt!593775)))

(declare-fun b!1338991 () Bool)

(declare-fun res!888164 () Bool)

(assert (=> b!1338991 (=> (not res!888164) (not e!762550))))

(assert (=> b!1338991 (= res!888164 (= (getValueByKey!713 (toList!10837 lt!593775) (_1!12000 (tuple2!23979 lt!593606 lt!593604))) (Some!763 (_2!12000 (tuple2!23979 lt!593606 lt!593604)))))))

(declare-fun b!1338992 () Bool)

(assert (=> b!1338992 (= e!762550 (contains!9018 (toList!10837 lt!593775) (tuple2!23979 lt!593606 lt!593604)))))

(assert (= (and d!144295 res!888163) b!1338991))

(assert (= (and b!1338991 res!888164) b!1338992))

(declare-fun m!1227451 () Bool)

(assert (=> d!144295 m!1227451))

(declare-fun m!1227453 () Bool)

(assert (=> d!144295 m!1227453))

(declare-fun m!1227455 () Bool)

(assert (=> d!144295 m!1227455))

(declare-fun m!1227457 () Bool)

(assert (=> d!144295 m!1227457))

(declare-fun m!1227459 () Bool)

(assert (=> b!1338991 m!1227459))

(declare-fun m!1227461 () Bool)

(assert (=> b!1338992 m!1227461))

(assert (=> b!1338734 d!144295))

(declare-fun d!144297 () Bool)

(declare-fun e!762551 () Bool)

(assert (=> d!144297 e!762551))

(declare-fun res!888165 () Bool)

(assert (=> d!144297 (=> (not res!888165) (not e!762551))))

(declare-fun lt!593779 () ListLongMap!21643)

(assert (=> d!144297 (= res!888165 (contains!9016 lt!593779 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593781 () List!31118)

(assert (=> d!144297 (= lt!593779 (ListLongMap!21644 lt!593781))))

(declare-fun lt!593780 () Unit!43880)

(declare-fun lt!593782 () Unit!43880)

(assert (=> d!144297 (= lt!593780 lt!593782)))

(assert (=> d!144297 (= (getValueByKey!713 lt!593781 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144297 (= lt!593782 (lemmaContainsTupThenGetReturnValue!363 lt!593781 (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144297 (= lt!593781 (insertStrictlySorted!492 (toList!10837 call!64973) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144297 (= (+!4782 call!64973 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593779)))

(declare-fun b!1338993 () Bool)

(declare-fun res!888166 () Bool)

(assert (=> b!1338993 (=> (not res!888166) (not e!762551))))

(assert (=> b!1338993 (= res!888166 (= (getValueByKey!713 (toList!10837 lt!593779) (_1!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!12000 (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1338994 () Bool)

(assert (=> b!1338994 (= e!762551 (contains!9018 (toList!10837 lt!593779) (tuple2!23979 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22168 (select (arr!43903 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144297 res!888165) b!1338993))

(assert (= (and b!1338993 res!888166) b!1338994))

(declare-fun m!1227463 () Bool)

(assert (=> d!144297 m!1227463))

(declare-fun m!1227465 () Bool)

(assert (=> d!144297 m!1227465))

(declare-fun m!1227467 () Bool)

(assert (=> d!144297 m!1227467))

(declare-fun m!1227469 () Bool)

(assert (=> d!144297 m!1227469))

(declare-fun m!1227471 () Bool)

(assert (=> b!1338993 m!1227471))

(declare-fun m!1227473 () Bool)

(assert (=> b!1338994 m!1227473))

(assert (=> b!1338734 d!144297))

(declare-fun d!144299 () Bool)

(declare-fun e!762553 () Bool)

(assert (=> d!144299 e!762553))

(declare-fun res!888167 () Bool)

(assert (=> d!144299 (=> res!888167 e!762553)))

(declare-fun lt!593784 () Bool)

(assert (=> d!144299 (= res!888167 (not lt!593784))))

(declare-fun lt!593786 () Bool)

(assert (=> d!144299 (= lt!593784 lt!593786)))

(declare-fun lt!593783 () Unit!43880)

(declare-fun e!762552 () Unit!43880)

(assert (=> d!144299 (= lt!593783 e!762552)))

(declare-fun c!126539 () Bool)

(assert (=> d!144299 (= c!126539 lt!593786)))

(assert (=> d!144299 (= lt!593786 (containsKey!739 (toList!10837 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604))) lt!593603))))

(assert (=> d!144299 (= (contains!9016 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604)) lt!593603) lt!593784)))

(declare-fun b!1338995 () Bool)

(declare-fun lt!593785 () Unit!43880)

(assert (=> b!1338995 (= e!762552 lt!593785)))

(assert (=> b!1338995 (= lt!593785 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604))) lt!593603))))

(assert (=> b!1338995 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604))) lt!593603))))

(declare-fun b!1338996 () Bool)

(declare-fun Unit!43892 () Unit!43880)

(assert (=> b!1338996 (= e!762552 Unit!43892)))

(declare-fun b!1338997 () Bool)

(assert (=> b!1338997 (= e!762553 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 lt!593608 (tuple2!23979 lt!593606 lt!593604))) lt!593603)))))

(assert (= (and d!144299 c!126539) b!1338995))

(assert (= (and d!144299 (not c!126539)) b!1338996))

(assert (= (and d!144299 (not res!888167)) b!1338997))

(declare-fun m!1227475 () Bool)

(assert (=> d!144299 m!1227475))

(declare-fun m!1227477 () Bool)

(assert (=> b!1338995 m!1227477))

(declare-fun m!1227479 () Bool)

(assert (=> b!1338995 m!1227479))

(assert (=> b!1338995 m!1227479))

(declare-fun m!1227481 () Bool)

(assert (=> b!1338995 m!1227481))

(assert (=> b!1338997 m!1227479))

(assert (=> b!1338997 m!1227479))

(assert (=> b!1338997 m!1227481))

(assert (=> b!1338734 d!144299))

(declare-fun d!144301 () Bool)

(declare-fun e!762555 () Bool)

(assert (=> d!144301 e!762555))

(declare-fun res!888168 () Bool)

(assert (=> d!144301 (=> res!888168 e!762555)))

(declare-fun lt!593788 () Bool)

(assert (=> d!144301 (= res!888168 (not lt!593788))))

(declare-fun lt!593790 () Bool)

(assert (=> d!144301 (= lt!593788 lt!593790)))

(declare-fun lt!593787 () Unit!43880)

(declare-fun e!762554 () Unit!43880)

(assert (=> d!144301 (= lt!593787 e!762554)))

(declare-fun c!126540 () Bool)

(assert (=> d!144301 (= c!126540 lt!593790)))

(assert (=> d!144301 (= lt!593790 (containsKey!739 (toList!10837 lt!593681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144301 (= (contains!9016 lt!593681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593788)))

(declare-fun b!1338998 () Bool)

(declare-fun lt!593789 () Unit!43880)

(assert (=> b!1338998 (= e!762554 lt!593789)))

(assert (=> b!1338998 (= lt!593789 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 lt!593681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1338998 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338999 () Bool)

(declare-fun Unit!43893 () Unit!43880)

(assert (=> b!1338999 (= e!762554 Unit!43893)))

(declare-fun b!1339000 () Bool)

(assert (=> b!1339000 (= e!762555 (isDefined!522 (getValueByKey!713 (toList!10837 lt!593681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144301 c!126540) b!1338998))

(assert (= (and d!144301 (not c!126540)) b!1338999))

(assert (= (and d!144301 (not res!888168)) b!1339000))

(declare-fun m!1227483 () Bool)

(assert (=> d!144301 m!1227483))

(declare-fun m!1227485 () Bool)

(assert (=> b!1338998 m!1227485))

(declare-fun m!1227487 () Bool)

(assert (=> b!1338998 m!1227487))

(assert (=> b!1338998 m!1227487))

(declare-fun m!1227489 () Bool)

(assert (=> b!1338998 m!1227489))

(assert (=> b!1339000 m!1227487))

(assert (=> b!1339000 m!1227487))

(assert (=> b!1339000 m!1227489))

(assert (=> bm!64992 d!144301))

(declare-fun d!144303 () Bool)

(assert (=> d!144303 (= (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153)) (not (isEmpty!1090 (getValueByKey!713 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))))

(declare-fun bs!38323 () Bool)

(assert (= bs!38323 d!144303))

(assert (=> bs!38323 m!1227053))

(declare-fun m!1227491 () Bool)

(assert (=> bs!38323 m!1227491))

(assert (=> b!1338696 d!144303))

(declare-fun b!1339001 () Bool)

(declare-fun e!762556 () Option!764)

(assert (=> b!1339001 (= e!762556 (Some!763 (_2!12000 (h!32332 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun d!144305 () Bool)

(declare-fun c!126541 () Bool)

(assert (=> d!144305 (= c!126541 (and ((_ is Cons!31114) (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12000 (h!32332 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(assert (=> d!144305 (= (getValueByKey!713 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) e!762556)))

(declare-fun b!1339002 () Bool)

(declare-fun e!762557 () Option!764)

(assert (=> b!1339002 (= e!762556 e!762557)))

(declare-fun c!126542 () Bool)

(assert (=> b!1339002 (= c!126542 (and ((_ is Cons!31114) (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (not (= (_1!12000 (h!32332 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153))))))

(declare-fun b!1339003 () Bool)

(assert (=> b!1339003 (= e!762557 (getValueByKey!713 (t!45424 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1153))))

(declare-fun b!1339004 () Bool)

(assert (=> b!1339004 (= e!762557 None!762)))

(assert (= (and d!144305 c!126541) b!1339001))

(assert (= (and d!144305 (not c!126541)) b!1339002))

(assert (= (and b!1339002 c!126542) b!1339003))

(assert (= (and b!1339002 (not c!126542)) b!1339004))

(declare-fun m!1227493 () Bool)

(assert (=> b!1339003 m!1227493))

(assert (=> b!1338696 d!144305))

(assert (=> b!1338755 d!144237))

(declare-fun d!144307 () Bool)

(assert (=> d!144307 (arrayContainsKey!0 _keys!1590 lt!593617 #b00000000000000000000000000000000)))

(declare-fun lt!593793 () Unit!43880)

(declare-fun choose!13 (array!90885 (_ BitVec 64) (_ BitVec 32)) Unit!43880)

(assert (=> d!144307 (= lt!593793 (choose!13 _keys!1590 lt!593617 #b00000000000000000000000000000000))))

(assert (=> d!144307 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144307 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593617 #b00000000000000000000000000000000) lt!593793)))

(declare-fun bs!38324 () Bool)

(assert (= bs!38324 d!144307))

(assert (=> bs!38324 m!1227113))

(declare-fun m!1227495 () Bool)

(assert (=> bs!38324 m!1227495))

(assert (=> b!1338770 d!144307))

(declare-fun d!144309 () Bool)

(declare-fun res!888173 () Bool)

(declare-fun e!762562 () Bool)

(assert (=> d!144309 (=> res!888173 e!762562)))

(assert (=> d!144309 (= res!888173 (= (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) lt!593617))))

(assert (=> d!144309 (= (arrayContainsKey!0 _keys!1590 lt!593617 #b00000000000000000000000000000000) e!762562)))

(declare-fun b!1339009 () Bool)

(declare-fun e!762563 () Bool)

(assert (=> b!1339009 (= e!762562 e!762563)))

(declare-fun res!888174 () Bool)

(assert (=> b!1339009 (=> (not res!888174) (not e!762563))))

(assert (=> b!1339009 (= res!888174 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(declare-fun b!1339010 () Bool)

(assert (=> b!1339010 (= e!762563 (arrayContainsKey!0 _keys!1590 lt!593617 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144309 (not res!888173)) b!1339009))

(assert (= (and b!1339009 res!888174) b!1339010))

(assert (=> d!144309 m!1227101))

(declare-fun m!1227497 () Bool)

(assert (=> b!1339010 m!1227497))

(assert (=> b!1338770 d!144309))

(declare-fun lt!593800 () SeekEntryResult!10005)

(declare-fun b!1339023 () Bool)

(declare-fun e!762571 () SeekEntryResult!10005)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90885 (_ BitVec 32)) SeekEntryResult!10005)

(assert (=> b!1339023 (= e!762571 (seekKeyOrZeroReturnVacant!0 (x!119460 lt!593800) (index!42393 lt!593800) (index!42393 lt!593800) (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1339024 () Bool)

(declare-fun e!762570 () SeekEntryResult!10005)

(assert (=> b!1339024 (= e!762570 Undefined!10005)))

(declare-fun b!1339025 () Bool)

(declare-fun c!126550 () Bool)

(declare-fun lt!593801 () (_ BitVec 64))

(assert (=> b!1339025 (= c!126550 (= lt!593801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!762572 () SeekEntryResult!10005)

(assert (=> b!1339025 (= e!762572 e!762571)))

(declare-fun b!1339026 () Bool)

(assert (=> b!1339026 (= e!762572 (Found!10005 (index!42393 lt!593800)))))

(declare-fun b!1339027 () Bool)

(assert (=> b!1339027 (= e!762571 (MissingZero!10005 (index!42393 lt!593800)))))

(declare-fun d!144311 () Bool)

(declare-fun lt!593802 () SeekEntryResult!10005)

(assert (=> d!144311 (and (or ((_ is Undefined!10005) lt!593802) (not ((_ is Found!10005) lt!593802)) (and (bvsge (index!42392 lt!593802) #b00000000000000000000000000000000) (bvslt (index!42392 lt!593802) (size!44453 _keys!1590)))) (or ((_ is Undefined!10005) lt!593802) ((_ is Found!10005) lt!593802) (not ((_ is MissingZero!10005) lt!593802)) (and (bvsge (index!42391 lt!593802) #b00000000000000000000000000000000) (bvslt (index!42391 lt!593802) (size!44453 _keys!1590)))) (or ((_ is Undefined!10005) lt!593802) ((_ is Found!10005) lt!593802) ((_ is MissingZero!10005) lt!593802) (not ((_ is MissingVacant!10005) lt!593802)) (and (bvsge (index!42394 lt!593802) #b00000000000000000000000000000000) (bvslt (index!42394 lt!593802) (size!44453 _keys!1590)))) (or ((_ is Undefined!10005) lt!593802) (ite ((_ is Found!10005) lt!593802) (= (select (arr!43902 _keys!1590) (index!42392 lt!593802)) (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10005) lt!593802) (= (select (arr!43902 _keys!1590) (index!42391 lt!593802)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10005) lt!593802) (= (select (arr!43902 _keys!1590) (index!42394 lt!593802)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144311 (= lt!593802 e!762570)))

(declare-fun c!126551 () Bool)

(assert (=> d!144311 (= c!126551 (and ((_ is Intermediate!10005) lt!593800) (undefined!10817 lt!593800)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90885 (_ BitVec 32)) SeekEntryResult!10005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144311 (= lt!593800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!144311 (validMask!0 mask!1998)))

(assert (=> d!144311 (= (seekEntryOrOpen!0 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!593802)))

(declare-fun b!1339028 () Bool)

(assert (=> b!1339028 (= e!762570 e!762572)))

(assert (=> b!1339028 (= lt!593801 (select (arr!43902 _keys!1590) (index!42393 lt!593800)))))

(declare-fun c!126549 () Bool)

(assert (=> b!1339028 (= c!126549 (= lt!593801 (select (arr!43902 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144311 c!126551) b!1339024))

(assert (= (and d!144311 (not c!126551)) b!1339028))

(assert (= (and b!1339028 c!126549) b!1339026))

(assert (= (and b!1339028 (not c!126549)) b!1339025))

(assert (= (and b!1339025 c!126550) b!1339027))

(assert (= (and b!1339025 (not c!126550)) b!1339023))

(assert (=> b!1339023 m!1227101))

(declare-fun m!1227499 () Bool)

(assert (=> b!1339023 m!1227499))

(declare-fun m!1227501 () Bool)

(assert (=> d!144311 m!1227501))

(declare-fun m!1227503 () Bool)

(assert (=> d!144311 m!1227503))

(declare-fun m!1227505 () Bool)

(assert (=> d!144311 m!1227505))

(assert (=> d!144311 m!1227101))

(declare-fun m!1227507 () Bool)

(assert (=> d!144311 m!1227507))

(declare-fun m!1227509 () Bool)

(assert (=> d!144311 m!1227509))

(assert (=> d!144311 m!1226967))

(assert (=> d!144311 m!1227101))

(assert (=> d!144311 m!1227505))

(declare-fun m!1227511 () Bool)

(assert (=> b!1339028 m!1227511))

(assert (=> b!1338770 d!144311))

(declare-fun lt!593805 () Bool)

(declare-fun d!144313 () Bool)

(declare-fun content!659 (List!31118) (InoxSet tuple2!23978))

(assert (=> d!144313 (= lt!593805 (select (content!659 (toList!10837 lt!593585)) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!762578 () Bool)

(assert (=> d!144313 (= lt!593805 e!762578)))

(declare-fun res!888179 () Bool)

(assert (=> d!144313 (=> (not res!888179) (not e!762578))))

(assert (=> d!144313 (= res!888179 ((_ is Cons!31114) (toList!10837 lt!593585)))))

(assert (=> d!144313 (= (contains!9018 (toList!10837 lt!593585) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593805)))

(declare-fun b!1339033 () Bool)

(declare-fun e!762577 () Bool)

(assert (=> b!1339033 (= e!762578 e!762577)))

(declare-fun res!888180 () Bool)

(assert (=> b!1339033 (=> res!888180 e!762577)))

(assert (=> b!1339033 (= res!888180 (= (h!32332 (toList!10837 lt!593585)) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1339034 () Bool)

(assert (=> b!1339034 (= e!762577 (contains!9018 (t!45424 (toList!10837 lt!593585)) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144313 res!888179) b!1339033))

(assert (= (and b!1339033 (not res!888180)) b!1339034))

(declare-fun m!1227513 () Bool)

(assert (=> d!144313 m!1227513))

(declare-fun m!1227515 () Bool)

(assert (=> d!144313 m!1227515))

(declare-fun m!1227517 () Bool)

(assert (=> b!1339034 m!1227517))

(assert (=> b!1338702 d!144313))

(declare-fun d!144315 () Bool)

(assert (=> d!144315 (isDefined!522 (getValueByKey!713 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun lt!593808 () Unit!43880)

(declare-fun choose!1969 (List!31118 (_ BitVec 64)) Unit!43880)

(assert (=> d!144315 (= lt!593808 (choose!1969 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun e!762581 () Bool)

(assert (=> d!144315 e!762581))

(declare-fun res!888183 () Bool)

(assert (=> d!144315 (=> (not res!888183) (not e!762581))))

(assert (=> d!144315 (= res!888183 (isStrictlySorted!868 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144315 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) lt!593808)))

(declare-fun b!1339037 () Bool)

(assert (=> b!1339037 (= e!762581 (containsKey!739 (toList!10837 (+!4782 (getCurrentListMapNoExtraKeys!6431 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23979 (select (arr!43902 _keys!1590) from!1980) (get!22168 (select (arr!43903 _values!1320) from!1980) (dynLambda!3736 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (= (and d!144315 res!888183) b!1339037))

(assert (=> d!144315 m!1227053))

(assert (=> d!144315 m!1227053))

(assert (=> d!144315 m!1227055))

(declare-fun m!1227519 () Bool)

(assert (=> d!144315 m!1227519))

(declare-fun m!1227521 () Bool)

(assert (=> d!144315 m!1227521))

(assert (=> b!1339037 m!1227049))

(assert (=> b!1338694 d!144315))

(assert (=> b!1338694 d!144303))

(assert (=> b!1338694 d!144305))

(declare-fun b!1339038 () Bool)

(declare-fun e!762584 () Bool)

(declare-fun call!65013 () Bool)

(assert (=> b!1339038 (= e!762584 call!65013)))

(declare-fun d!144317 () Bool)

(declare-fun res!888184 () Bool)

(declare-fun e!762582 () Bool)

(assert (=> d!144317 (=> res!888184 e!762582)))

(assert (=> d!144317 (= res!888184 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44453 _keys!1590)))))

(assert (=> d!144317 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!762582)))

(declare-fun bm!65010 () Bool)

(assert (=> bm!65010 (= call!65013 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1339039 () Bool)

(declare-fun e!762583 () Bool)

(assert (=> b!1339039 (= e!762583 call!65013)))

(declare-fun b!1339040 () Bool)

(assert (=> b!1339040 (= e!762584 e!762583)))

(declare-fun lt!593810 () (_ BitVec 64))

(assert (=> b!1339040 (= lt!593810 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!593809 () Unit!43880)

(assert (=> b!1339040 (= lt!593809 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593810 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1339040 (arrayContainsKey!0 _keys!1590 lt!593810 #b00000000000000000000000000000000)))

(declare-fun lt!593811 () Unit!43880)

(assert (=> b!1339040 (= lt!593811 lt!593809)))

(declare-fun res!888185 () Bool)

(assert (=> b!1339040 (= res!888185 (= (seekEntryOrOpen!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1339040 (=> (not res!888185) (not e!762583))))

(declare-fun b!1339041 () Bool)

(assert (=> b!1339041 (= e!762582 e!762584)))

(declare-fun c!126552 () Bool)

(assert (=> b!1339041 (= c!126552 (validKeyInArray!0 (select (arr!43902 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144317 (not res!888184)) b!1339041))

(assert (= (and b!1339041 c!126552) b!1339040))

(assert (= (and b!1339041 (not c!126552)) b!1339038))

(assert (= (and b!1339040 res!888185) b!1339039))

(assert (= (or b!1339039 b!1339038) bm!65010))

(declare-fun m!1227523 () Bool)

(assert (=> bm!65010 m!1227523))

(assert (=> b!1339040 m!1227311))

(declare-fun m!1227525 () Bool)

(assert (=> b!1339040 m!1227525))

(declare-fun m!1227527 () Bool)

(assert (=> b!1339040 m!1227527))

(assert (=> b!1339040 m!1227311))

(declare-fun m!1227529 () Bool)

(assert (=> b!1339040 m!1227529))

(assert (=> b!1339041 m!1227311))

(assert (=> b!1339041 m!1227311))

(assert (=> b!1339041 m!1227313))

(assert (=> bm!64976 d!144317))

(declare-fun d!144319 () Bool)

(assert (=> d!144319 (= (apply!1043 lt!593681 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22172 (getValueByKey!713 (toList!10837 lt!593681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38325 () Bool)

(assert (= bs!38325 d!144319))

(assert (=> bs!38325 m!1227487))

(assert (=> bs!38325 m!1227487))

(declare-fun m!1227531 () Bool)

(assert (=> bs!38325 m!1227531))

(assert (=> b!1338837 d!144319))

(declare-fun d!144321 () Bool)

(assert (=> d!144321 (isDefined!522 (getValueByKey!713 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!593812 () Unit!43880)

(assert (=> d!144321 (= lt!593812 (choose!1969 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!762585 () Bool)

(assert (=> d!144321 e!762585))

(declare-fun res!888186 () Bool)

(assert (=> d!144321 (=> (not res!888186) (not e!762585))))

(assert (=> d!144321 (= res!888186 (isStrictlySorted!868 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!144321 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!593812)))

(declare-fun b!1339042 () Bool)

(assert (=> b!1339042 (= e!762585 (containsKey!739 (toList!10837 (getCurrentListMap!5791 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!144321 res!888186) b!1339042))

(assert (=> d!144321 m!1227121))

(assert (=> d!144321 m!1227121))

(assert (=> d!144321 m!1227123))

(declare-fun m!1227533 () Bool)

(assert (=> d!144321 m!1227533))

(declare-fun m!1227535 () Bool)

(assert (=> d!144321 m!1227535))

(assert (=> b!1339042 m!1227117))

(assert (=> b!1338772 d!144321))

(assert (=> b!1338772 d!144231))

(assert (=> b!1338772 d!144233))

(declare-fun mapNonEmpty!57123 () Bool)

(declare-fun mapRes!57123 () Bool)

(declare-fun tp!108795 () Bool)

(declare-fun e!762586 () Bool)

(assert (=> mapNonEmpty!57123 (= mapRes!57123 (and tp!108795 e!762586))))

(declare-fun mapKey!57123 () (_ BitVec 32))

(declare-fun mapValue!57123 () ValueCell!17579)

(declare-fun mapRest!57123 () (Array (_ BitVec 32) ValueCell!17579))

(assert (=> mapNonEmpty!57123 (= mapRest!57122 (store mapRest!57123 mapKey!57123 mapValue!57123))))

(declare-fun b!1339044 () Bool)

(declare-fun e!762587 () Bool)

(assert (=> b!1339044 (= e!762587 tp_is_empty!36955)))

(declare-fun condMapEmpty!57123 () Bool)

(declare-fun mapDefault!57123 () ValueCell!17579)

(assert (=> mapNonEmpty!57122 (= condMapEmpty!57123 (= mapRest!57122 ((as const (Array (_ BitVec 32) ValueCell!17579)) mapDefault!57123)))))

(assert (=> mapNonEmpty!57122 (= tp!108794 (and e!762587 mapRes!57123))))

(declare-fun mapIsEmpty!57123 () Bool)

(assert (=> mapIsEmpty!57123 mapRes!57123))

(declare-fun b!1339043 () Bool)

(assert (=> b!1339043 (= e!762586 tp_is_empty!36955)))

(assert (= (and mapNonEmpty!57122 condMapEmpty!57123) mapIsEmpty!57123))

(assert (= (and mapNonEmpty!57122 (not condMapEmpty!57123)) mapNonEmpty!57123))

(assert (= (and mapNonEmpty!57123 ((_ is ValueCellFull!17579) mapValue!57123)) b!1339043))

(assert (= (and mapNonEmpty!57122 ((_ is ValueCellFull!17579) mapDefault!57123)) b!1339044))

(declare-fun m!1227537 () Bool)

(assert (=> mapNonEmpty!57123 m!1227537))

(declare-fun b_lambda!24231 () Bool)

(assert (= b_lambda!24227 (or (and start!112958 b_free!31045) b_lambda!24231)))

(declare-fun b_lambda!24233 () Bool)

(assert (= b_lambda!24223 (or (and start!112958 b_free!31045) b_lambda!24233)))

(declare-fun b_lambda!24235 () Bool)

(assert (= b_lambda!24225 (or (and start!112958 b_free!31045) b_lambda!24235)))

(declare-fun b_lambda!24237 () Bool)

(assert (= b_lambda!24229 (or (and start!112958 b_free!31045) b_lambda!24237)))

(check-sat (not b!1338986) (not b!1338937) (not b!1338868) (not b!1338972) (not b!1338974) (not b!1338926) b_and!50049 (not b!1338870) (not d!144285) (not d!144287) (not b!1338882) (not b!1339034) (not d!144277) (not d!144261) (not d!144319) (not b!1338847) (not b!1338876) (not b!1338871) (not d!144259) (not d!144257) (not b!1338853) (not b!1338933) (not b!1338991) (not b_lambda!24209) (not b_lambda!24219) (not b!1338952) (not d!144249) (not d!144243) (not b_lambda!24235) (not d!144205) (not b_lambda!24231) (not d!144273) (not d!144227) (not b!1338930) (not d!144315) (not b!1338863) (not b_lambda!24233) (not d!144211) (not d!144313) (not d!144239) (not b!1338976) (not b_lambda!24217) (not b!1338962) (not mapNonEmpty!57123) (not b!1339023) (not bm!65010) (not d!144281) (not b!1339003) (not b!1338953) (not b!1338895) (not b!1339042) (not b!1339041) (not d!144265) (not b!1338939) tp_is_empty!36955 (not d!144291) (not b!1338932) (not b!1338866) (not b!1338901) (not bm!64999) (not b!1338867) (not d!144245) (not b!1338851) (not b!1338878) (not d!144279) (not d!144255) (not d!144297) (not b!1338957) (not b!1338949) (not d!144225) (not b_lambda!24237) (not d!144311) (not b!1338975) (not b!1339000) (not b!1338864) (not b!1338941) (not d!144275) (not d!144301) (not b!1338980) (not b!1338963) (not b!1338855) (not b!1338872) (not bm!64998) (not d!144307) (not d!144213) (not b!1338977) (not d!144263) (not b!1338993) (not d!144219) (not d!144321) (not b!1338884) (not b!1338998) (not d!144215) (not b!1338959) (not d!144253) (not b!1338850) (not b!1339010) (not b!1338961) (not b_lambda!24221) (not b!1338992) (not b!1338874) (not b!1338934) (not d!144251) (not b!1338973) (not d!144267) (not b!1339040) (not b!1338997) (not bm!65009) (not b!1338849) (not b!1338950) (not b!1338879) (not b!1338956) (not b!1338995) (not b!1338982) (not b!1338969) (not d!144223) (not b!1339037) (not b_next!31045) (not b!1338846) (not d!144299) (not b!1338943) (not b!1338984) (not bm!65008) (not d!144231) (not b!1338985) (not d!144303) (not d!144271) (not b!1338881) (not d!144293) (not b!1338857) (not d!144229) (not b!1338968) (not b!1338902) (not b!1338994) (not d!144295) (not d!144269))
(check-sat b_and!50049 (not b_next!31045))
