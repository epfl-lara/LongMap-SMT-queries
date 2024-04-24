; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113900 () Bool)

(assert start!113900)

(declare-fun b_free!31585 () Bool)

(declare-fun b_next!31585 () Bool)

(assert (=> start!113900 (= b_free!31585 (not b_next!31585))))

(declare-fun tp!110571 () Bool)

(declare-fun b_and!50971 () Bool)

(assert (=> start!113900 (= tp!110571 b_and!50971)))

(declare-fun b!1350560 () Bool)

(declare-fun res!895671 () Bool)

(declare-fun e!768384 () Bool)

(assert (=> b!1350560 (=> (not res!895671) (not e!768384))))

(declare-datatypes ((V!55217 0))(
  ( (V!55218 (val!18867 Int)) )
))
(declare-fun minValue!1245 () V!55217)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92115 0))(
  ( (array!92116 (arr!44506 (Array (_ BitVec 32) (_ BitVec 64))) (size!45057 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92115)

(declare-fun zeroValue!1245 () V!55217)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17894 0))(
  ( (ValueCellFull!17894 (v!21517 V!55217)) (EmptyCell!17894) )
))
(declare-datatypes ((array!92117 0))(
  ( (array!92118 (arr!44507 (Array (_ BitVec 32) ValueCell!17894)) (size!45058 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92117)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24386 0))(
  ( (tuple2!24387 (_1!12204 (_ BitVec 64)) (_2!12204 V!55217)) )
))
(declare-datatypes ((List!31523 0))(
  ( (Nil!31520) (Cons!31519 (h!32737 tuple2!24386) (t!46167 List!31523)) )
))
(declare-datatypes ((ListLongMap!22051 0))(
  ( (ListLongMap!22052 (toList!11041 List!31523)) )
))
(declare-fun contains!9234 (ListLongMap!22051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5978 (array!92115 array!92117 (_ BitVec 32) (_ BitVec 32) V!55217 V!55217 (_ BitVec 32) Int) ListLongMap!22051)

(assert (=> b!1350560 (= res!895671 (contains!9234 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1350561 () Bool)

(declare-fun res!895677 () Bool)

(assert (=> b!1350561 (=> (not res!895677) (not e!768384))))

(assert (=> b!1350561 (= res!895677 (and (= (size!45058 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45057 _keys!1571) (size!45058 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1350562 () Bool)

(declare-fun e!768383 () Bool)

(assert (=> b!1350562 (= e!768384 e!768383)))

(declare-fun res!895672 () Bool)

(assert (=> b!1350562 (=> (not res!895672) (not e!768383))))

(declare-fun lt!596909 () V!55217)

(declare-fun lt!596910 () ListLongMap!22051)

(declare-fun +!4894 (ListLongMap!22051 tuple2!24386) ListLongMap!22051)

(assert (=> b!1350562 (= res!895672 (contains!9234 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6547 (array!92115 array!92117 (_ BitVec 32) (_ BitVec 32) V!55217 V!55217 (_ BitVec 32) Int) ListLongMap!22051)

(assert (=> b!1350562 (= lt!596910 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22506 (ValueCell!17894 V!55217) V!55217)

(declare-fun dynLambda!3848 (Int (_ BitVec 64)) V!55217)

(assert (=> b!1350562 (= lt!596909 (get!22506 (select (arr!44507 _values!1303) from!1960) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350563 () Bool)

(declare-fun res!895673 () Bool)

(assert (=> b!1350563 (=> (not res!895673) (not e!768384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350563 (= res!895673 (validKeyInArray!0 (select (arr!44506 _keys!1571) from!1960)))))

(declare-fun b!1350564 () Bool)

(assert (=> b!1350564 (= e!768383 (not (contains!9234 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(assert (=> b!1350564 (contains!9234 lt!596910 k0!1142)))

(declare-datatypes ((Unit!44134 0))(
  ( (Unit!44135) )
))
(declare-fun lt!596908 () Unit!44134)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!405 ((_ BitVec 64) (_ BitVec 64) V!55217 ListLongMap!22051) Unit!44134)

(assert (=> b!1350564 (= lt!596908 (lemmaInListMapAfterAddingDiffThenInBefore!405 k0!1142 (select (arr!44506 _keys!1571) from!1960) lt!596909 lt!596910))))

(declare-fun b!1350565 () Bool)

(declare-fun res!895667 () Bool)

(assert (=> b!1350565 (=> (not res!895667) (not e!768384))))

(assert (=> b!1350565 (= res!895667 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1350566 () Bool)

(declare-fun e!768382 () Bool)

(declare-fun tp_is_empty!37585 () Bool)

(assert (=> b!1350566 (= e!768382 tp_is_empty!37585)))

(declare-fun b!1350567 () Bool)

(declare-fun e!768386 () Bool)

(assert (=> b!1350567 (= e!768386 tp_is_empty!37585)))

(declare-fun b!1350568 () Bool)

(declare-fun res!895668 () Bool)

(assert (=> b!1350568 (=> (not res!895668) (not e!768384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92115 (_ BitVec 32)) Bool)

(assert (=> b!1350568 (= res!895668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1350569 () Bool)

(declare-fun res!895674 () Bool)

(assert (=> b!1350569 (=> (not res!895674) (not e!768384))))

(assert (=> b!1350569 (= res!895674 (not (= (select (arr!44506 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!58095 () Bool)

(declare-fun mapRes!58095 () Bool)

(assert (=> mapIsEmpty!58095 mapRes!58095))

(declare-fun res!895670 () Bool)

(assert (=> start!113900 (=> (not res!895670) (not e!768384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113900 (= res!895670 (validMask!0 mask!1977))))

(assert (=> start!113900 e!768384))

(assert (=> start!113900 tp_is_empty!37585))

(assert (=> start!113900 true))

(declare-fun array_inv!33789 (array!92115) Bool)

(assert (=> start!113900 (array_inv!33789 _keys!1571)))

(declare-fun e!768385 () Bool)

(declare-fun array_inv!33790 (array!92117) Bool)

(assert (=> start!113900 (and (array_inv!33790 _values!1303) e!768385)))

(assert (=> start!113900 tp!110571))

(declare-fun b!1350570 () Bool)

(declare-fun res!895676 () Bool)

(assert (=> b!1350570 (=> (not res!895676) (not e!768384))))

(declare-datatypes ((List!31524 0))(
  ( (Nil!31521) (Cons!31520 (h!32738 (_ BitVec 64)) (t!46168 List!31524)) )
))
(declare-fun arrayNoDuplicates!0 (array!92115 (_ BitVec 32) List!31524) Bool)

(assert (=> b!1350570 (= res!895676 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31521))))

(declare-fun b!1350571 () Bool)

(declare-fun res!895675 () Bool)

(assert (=> b!1350571 (=> (not res!895675) (not e!768383))))

(assert (=> b!1350571 (= res!895675 (not (= k0!1142 (select (arr!44506 _keys!1571) from!1960))))))

(declare-fun b!1350572 () Bool)

(declare-fun res!895669 () Bool)

(assert (=> b!1350572 (=> (not res!895669) (not e!768384))))

(assert (=> b!1350572 (= res!895669 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45057 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1350573 () Bool)

(assert (=> b!1350573 (= e!768385 (and e!768386 mapRes!58095))))

(declare-fun condMapEmpty!58095 () Bool)

(declare-fun mapDefault!58095 () ValueCell!17894)

(assert (=> b!1350573 (= condMapEmpty!58095 (= (arr!44507 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17894)) mapDefault!58095)))))

(declare-fun mapNonEmpty!58095 () Bool)

(declare-fun tp!110570 () Bool)

(assert (=> mapNonEmpty!58095 (= mapRes!58095 (and tp!110570 e!768382))))

(declare-fun mapKey!58095 () (_ BitVec 32))

(declare-fun mapRest!58095 () (Array (_ BitVec 32) ValueCell!17894))

(declare-fun mapValue!58095 () ValueCell!17894)

(assert (=> mapNonEmpty!58095 (= (arr!44507 _values!1303) (store mapRest!58095 mapKey!58095 mapValue!58095))))

(assert (= (and start!113900 res!895670) b!1350561))

(assert (= (and b!1350561 res!895677) b!1350568))

(assert (= (and b!1350568 res!895668) b!1350570))

(assert (= (and b!1350570 res!895676) b!1350572))

(assert (= (and b!1350572 res!895669) b!1350560))

(assert (= (and b!1350560 res!895671) b!1350569))

(assert (= (and b!1350569 res!895674) b!1350563))

(assert (= (and b!1350563 res!895673) b!1350565))

(assert (= (and b!1350565 res!895667) b!1350562))

(assert (= (and b!1350562 res!895672) b!1350571))

(assert (= (and b!1350571 res!895675) b!1350564))

(assert (= (and b!1350573 condMapEmpty!58095) mapIsEmpty!58095))

(assert (= (and b!1350573 (not condMapEmpty!58095)) mapNonEmpty!58095))

(get-info :version)

(assert (= (and mapNonEmpty!58095 ((_ is ValueCellFull!17894) mapValue!58095)) b!1350566))

(assert (= (and b!1350573 ((_ is ValueCellFull!17894) mapDefault!58095)) b!1350567))

(assert (= start!113900 b!1350573))

(declare-fun b_lambda!24689 () Bool)

(assert (=> (not b_lambda!24689) (not b!1350562)))

(declare-fun t!46166 () Bool)

(declare-fun tb!12447 () Bool)

(assert (=> (and start!113900 (= defaultEntry!1306 defaultEntry!1306) t!46166) tb!12447))

(declare-fun result!25999 () Bool)

(assert (=> tb!12447 (= result!25999 tp_is_empty!37585)))

(assert (=> b!1350562 t!46166))

(declare-fun b_and!50973 () Bool)

(assert (= b_and!50971 (and (=> t!46166 result!25999) b_and!50973)))

(declare-fun m!1237959 () Bool)

(assert (=> b!1350569 m!1237959))

(assert (=> b!1350563 m!1237959))

(assert (=> b!1350563 m!1237959))

(declare-fun m!1237961 () Bool)

(assert (=> b!1350563 m!1237961))

(declare-fun m!1237963 () Bool)

(assert (=> b!1350560 m!1237963))

(assert (=> b!1350560 m!1237963))

(declare-fun m!1237965 () Bool)

(assert (=> b!1350560 m!1237965))

(declare-fun m!1237967 () Bool)

(assert (=> b!1350564 m!1237967))

(declare-fun m!1237969 () Bool)

(assert (=> b!1350564 m!1237969))

(assert (=> b!1350564 m!1237969))

(declare-fun m!1237971 () Bool)

(assert (=> b!1350564 m!1237971))

(assert (=> b!1350564 m!1237959))

(declare-fun m!1237973 () Bool)

(assert (=> b!1350564 m!1237973))

(assert (=> b!1350564 m!1237959))

(declare-fun m!1237975 () Bool)

(assert (=> b!1350562 m!1237975))

(declare-fun m!1237977 () Bool)

(assert (=> b!1350562 m!1237977))

(declare-fun m!1237979 () Bool)

(assert (=> b!1350562 m!1237979))

(declare-fun m!1237981 () Bool)

(assert (=> b!1350562 m!1237981))

(declare-fun m!1237983 () Bool)

(assert (=> b!1350562 m!1237983))

(declare-fun m!1237985 () Bool)

(assert (=> b!1350562 m!1237985))

(assert (=> b!1350562 m!1237977))

(assert (=> b!1350562 m!1237981))

(assert (=> b!1350562 m!1237983))

(assert (=> b!1350562 m!1237959))

(declare-fun m!1237987 () Bool)

(assert (=> mapNonEmpty!58095 m!1237987))

(declare-fun m!1237989 () Bool)

(assert (=> b!1350568 m!1237989))

(declare-fun m!1237991 () Bool)

(assert (=> start!113900 m!1237991))

(declare-fun m!1237993 () Bool)

(assert (=> start!113900 m!1237993))

(declare-fun m!1237995 () Bool)

(assert (=> start!113900 m!1237995))

(assert (=> b!1350571 m!1237959))

(declare-fun m!1237997 () Bool)

(assert (=> b!1350570 m!1237997))

(check-sat (not b!1350564) (not b!1350570) tp_is_empty!37585 (not b!1350562) (not b!1350560) (not b_lambda!24689) (not b_next!31585) (not mapNonEmpty!58095) b_and!50973 (not b!1350563) (not start!113900) (not b!1350568))
(check-sat b_and!50973 (not b_next!31585))
(get-model)

(declare-fun b_lambda!24695 () Bool)

(assert (= b_lambda!24689 (or (and start!113900 b_free!31585) b_lambda!24695)))

(check-sat (not b!1350564) (not b!1350570) tp_is_empty!37585 (not b!1350562) (not b!1350560) (not b_lambda!24695) (not b_next!31585) (not mapNonEmpty!58095) b_and!50973 (not b!1350563) (not start!113900) (not b!1350568))
(check-sat b_and!50973 (not b_next!31585))
(get-model)

(declare-fun d!145101 () Bool)

(declare-fun e!768428 () Bool)

(assert (=> d!145101 e!768428))

(declare-fun res!895746 () Bool)

(assert (=> d!145101 (=> res!895746 e!768428)))

(declare-fun lt!596938 () Bool)

(assert (=> d!145101 (= res!895746 (not lt!596938))))

(declare-fun lt!596939 () Bool)

(assert (=> d!145101 (= lt!596938 lt!596939)))

(declare-fun lt!596940 () Unit!44134)

(declare-fun e!768429 () Unit!44134)

(assert (=> d!145101 (= lt!596940 e!768429)))

(declare-fun c!126952 () Bool)

(assert (=> d!145101 (= c!126952 lt!596939)))

(declare-fun containsKey!745 (List!31523 (_ BitVec 64)) Bool)

(assert (=> d!145101 (= lt!596939 (containsKey!745 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!145101 (= (contains!9234 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596938)))

(declare-fun b!1350670 () Bool)

(declare-fun lt!596937 () Unit!44134)

(assert (=> b!1350670 (= e!768429 lt!596937)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!491 (List!31523 (_ BitVec 64)) Unit!44134)

(assert (=> b!1350670 (= lt!596937 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!770 0))(
  ( (Some!769 (v!21520 V!55217)) (None!768) )
))
(declare-fun isDefined!528 (Option!770) Bool)

(declare-fun getValueByKey!719 (List!31523 (_ BitVec 64)) Option!770)

(assert (=> b!1350670 (isDefined!528 (getValueByKey!719 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1350671 () Bool)

(declare-fun Unit!44136 () Unit!44134)

(assert (=> b!1350671 (= e!768429 Unit!44136)))

(declare-fun b!1350672 () Bool)

(assert (=> b!1350672 (= e!768428 (isDefined!528 (getValueByKey!719 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!145101 c!126952) b!1350670))

(assert (= (and d!145101 (not c!126952)) b!1350671))

(assert (= (and d!145101 (not res!895746)) b!1350672))

(declare-fun m!1238079 () Bool)

(assert (=> d!145101 m!1238079))

(declare-fun m!1238081 () Bool)

(assert (=> b!1350670 m!1238081))

(declare-fun m!1238083 () Bool)

(assert (=> b!1350670 m!1238083))

(assert (=> b!1350670 m!1238083))

(declare-fun m!1238085 () Bool)

(assert (=> b!1350670 m!1238085))

(assert (=> b!1350672 m!1238083))

(assert (=> b!1350672 m!1238083))

(assert (=> b!1350672 m!1238085))

(assert (=> b!1350560 d!145101))

(declare-fun b!1350715 () Bool)

(declare-fun e!768467 () Unit!44134)

(declare-fun lt!597001 () Unit!44134)

(assert (=> b!1350715 (= e!768467 lt!597001)))

(declare-fun lt!597005 () ListLongMap!22051)

(assert (=> b!1350715 (= lt!597005 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596999 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!596999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597000 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!597000 (select (arr!44506 _keys!1571) from!1960))))

(declare-fun lt!597002 () Unit!44134)

(declare-fun addStillContains!1217 (ListLongMap!22051 (_ BitVec 64) V!55217 (_ BitVec 64)) Unit!44134)

(assert (=> b!1350715 (= lt!597002 (addStillContains!1217 lt!597005 lt!596999 zeroValue!1245 lt!597000))))

(assert (=> b!1350715 (contains!9234 (+!4894 lt!597005 (tuple2!24387 lt!596999 zeroValue!1245)) lt!597000)))

(declare-fun lt!596991 () Unit!44134)

(assert (=> b!1350715 (= lt!596991 lt!597002)))

(declare-fun lt!596995 () ListLongMap!22051)

(assert (=> b!1350715 (= lt!596995 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596993 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!596993 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596994 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!596994 (select (arr!44506 _keys!1571) from!1960))))

(declare-fun lt!596985 () Unit!44134)

(declare-fun addApplyDifferent!578 (ListLongMap!22051 (_ BitVec 64) V!55217 (_ BitVec 64)) Unit!44134)

(assert (=> b!1350715 (= lt!596985 (addApplyDifferent!578 lt!596995 lt!596993 minValue!1245 lt!596994))))

(declare-fun apply!1049 (ListLongMap!22051 (_ BitVec 64)) V!55217)

(assert (=> b!1350715 (= (apply!1049 (+!4894 lt!596995 (tuple2!24387 lt!596993 minValue!1245)) lt!596994) (apply!1049 lt!596995 lt!596994))))

(declare-fun lt!596992 () Unit!44134)

(assert (=> b!1350715 (= lt!596992 lt!596985)))

(declare-fun lt!596989 () ListLongMap!22051)

(assert (=> b!1350715 (= lt!596989 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596986 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!596986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597006 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!597006 (select (arr!44506 _keys!1571) from!1960))))

(declare-fun lt!596987 () Unit!44134)

(assert (=> b!1350715 (= lt!596987 (addApplyDifferent!578 lt!596989 lt!596986 zeroValue!1245 lt!597006))))

(assert (=> b!1350715 (= (apply!1049 (+!4894 lt!596989 (tuple2!24387 lt!596986 zeroValue!1245)) lt!597006) (apply!1049 lt!596989 lt!597006))))

(declare-fun lt!596998 () Unit!44134)

(assert (=> b!1350715 (= lt!596998 lt!596987)))

(declare-fun lt!596997 () ListLongMap!22051)

(assert (=> b!1350715 (= lt!596997 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596996 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!596996 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596988 () (_ BitVec 64))

(assert (=> b!1350715 (= lt!596988 (select (arr!44506 _keys!1571) from!1960))))

(assert (=> b!1350715 (= lt!597001 (addApplyDifferent!578 lt!596997 lt!596996 minValue!1245 lt!596988))))

(assert (=> b!1350715 (= (apply!1049 (+!4894 lt!596997 (tuple2!24387 lt!596996 minValue!1245)) lt!596988) (apply!1049 lt!596997 lt!596988))))

(declare-fun b!1350716 () Bool)

(declare-fun e!768456 () ListLongMap!22051)

(declare-fun call!65245 () ListLongMap!22051)

(assert (=> b!1350716 (= e!768456 call!65245)))

(declare-fun b!1350717 () Bool)

(declare-fun res!895772 () Bool)

(declare-fun e!768466 () Bool)

(assert (=> b!1350717 (=> (not res!895772) (not e!768466))))

(declare-fun e!768463 () Bool)

(assert (=> b!1350717 (= res!895772 e!768463)))

(declare-fun c!126968 () Bool)

(assert (=> b!1350717 (= c!126968 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1350718 () Bool)

(declare-fun e!768459 () Bool)

(assert (=> b!1350718 (= e!768466 e!768459)))

(declare-fun c!126965 () Bool)

(assert (=> b!1350718 (= c!126965 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1350719 () Bool)

(declare-fun call!65249 () Bool)

(assert (=> b!1350719 (= e!768463 (not call!65249))))

(declare-fun b!1350720 () Bool)

(declare-fun e!768464 () Bool)

(assert (=> b!1350720 (= e!768463 e!768464)))

(declare-fun res!895767 () Bool)

(assert (=> b!1350720 (= res!895767 call!65249)))

(assert (=> b!1350720 (=> (not res!895767) (not e!768464))))

(declare-fun bm!65240 () Bool)

(declare-fun call!65244 () ListLongMap!22051)

(declare-fun call!65247 () ListLongMap!22051)

(assert (=> bm!65240 (= call!65244 call!65247)))

(declare-fun b!1350721 () Bool)

(declare-fun Unit!44137 () Unit!44134)

(assert (=> b!1350721 (= e!768467 Unit!44137)))

(declare-fun bm!65241 () Bool)

(declare-fun call!65246 () Bool)

(declare-fun lt!596990 () ListLongMap!22051)

(assert (=> bm!65241 (= call!65246 (contains!9234 lt!596990 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65242 () Bool)

(declare-fun call!65243 () ListLongMap!22051)

(declare-fun call!65248 () ListLongMap!22051)

(assert (=> bm!65242 (= call!65243 call!65248)))

(declare-fun b!1350722 () Bool)

(declare-fun c!126966 () Bool)

(assert (=> b!1350722 (= c!126966 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!768468 () ListLongMap!22051)

(assert (=> b!1350722 (= e!768468 e!768456)))

(declare-fun b!1350723 () Bool)

(declare-fun e!768465 () Bool)

(assert (=> b!1350723 (= e!768465 (validKeyInArray!0 (select (arr!44506 _keys!1571) from!1960)))))

(declare-fun c!126970 () Bool)

(declare-fun c!126967 () Bool)

(declare-fun bm!65243 () Bool)

(assert (=> bm!65243 (= call!65247 (+!4894 (ite c!126970 call!65248 (ite c!126967 call!65243 call!65245)) (ite (or c!126970 c!126967) (tuple2!24387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1350724 () Bool)

(declare-fun e!768458 () Bool)

(declare-fun e!768457 () Bool)

(assert (=> b!1350724 (= e!768458 e!768457)))

(declare-fun res!895765 () Bool)

(assert (=> b!1350724 (=> (not res!895765) (not e!768457))))

(assert (=> b!1350724 (= res!895765 (contains!9234 lt!596990 (select (arr!44506 _keys!1571) from!1960)))))

(assert (=> b!1350724 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45057 _keys!1571)))))

(declare-fun d!145103 () Bool)

(assert (=> d!145103 e!768466))

(declare-fun res!895770 () Bool)

(assert (=> d!145103 (=> (not res!895770) (not e!768466))))

(assert (=> d!145103 (= res!895770 (or (bvsge from!1960 (size!45057 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45057 _keys!1571)))))))

(declare-fun lt!597003 () ListLongMap!22051)

(assert (=> d!145103 (= lt!596990 lt!597003)))

(declare-fun lt!597004 () Unit!44134)

(assert (=> d!145103 (= lt!597004 e!768467)))

(declare-fun c!126969 () Bool)

(declare-fun e!768461 () Bool)

(assert (=> d!145103 (= c!126969 e!768461)))

(declare-fun res!895769 () Bool)

(assert (=> d!145103 (=> (not res!895769) (not e!768461))))

(assert (=> d!145103 (= res!895769 (bvslt from!1960 (size!45057 _keys!1571)))))

(declare-fun e!768462 () ListLongMap!22051)

(assert (=> d!145103 (= lt!597003 e!768462)))

(assert (=> d!145103 (= c!126970 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!145103 (validMask!0 mask!1977)))

(assert (=> d!145103 (= (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596990)))

(declare-fun b!1350725 () Bool)

(assert (=> b!1350725 (= e!768468 call!65244)))

(declare-fun b!1350726 () Bool)

(assert (=> b!1350726 (= e!768456 call!65244)))

(declare-fun b!1350727 () Bool)

(assert (=> b!1350727 (= e!768462 e!768468)))

(assert (=> b!1350727 (= c!126967 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1350728 () Bool)

(declare-fun res!895766 () Bool)

(assert (=> b!1350728 (=> (not res!895766) (not e!768466))))

(assert (=> b!1350728 (= res!895766 e!768458)))

(declare-fun res!895768 () Bool)

(assert (=> b!1350728 (=> res!895768 e!768458)))

(assert (=> b!1350728 (= res!895768 (not e!768465))))

(declare-fun res!895773 () Bool)

(assert (=> b!1350728 (=> (not res!895773) (not e!768465))))

(assert (=> b!1350728 (= res!895773 (bvslt from!1960 (size!45057 _keys!1571)))))

(declare-fun b!1350729 () Bool)

(assert (=> b!1350729 (= e!768461 (validKeyInArray!0 (select (arr!44506 _keys!1571) from!1960)))))

(declare-fun b!1350730 () Bool)

(declare-fun e!768460 () Bool)

(assert (=> b!1350730 (= e!768459 e!768460)))

(declare-fun res!895771 () Bool)

(assert (=> b!1350730 (= res!895771 call!65246)))

(assert (=> b!1350730 (=> (not res!895771) (not e!768460))))

(declare-fun bm!65244 () Bool)

(assert (=> bm!65244 (= call!65245 call!65243)))

(declare-fun bm!65245 () Bool)

(assert (=> bm!65245 (= call!65249 (contains!9234 lt!596990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350731 () Bool)

(assert (=> b!1350731 (= e!768459 (not call!65246))))

(declare-fun bm!65246 () Bool)

(assert (=> bm!65246 (= call!65248 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1350732 () Bool)

(assert (=> b!1350732 (= e!768460 (= (apply!1049 lt!596990 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1350733 () Bool)

(assert (=> b!1350733 (= e!768457 (= (apply!1049 lt!596990 (select (arr!44506 _keys!1571) from!1960)) (get!22506 (select (arr!44507 _values!1303) from!1960) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350733 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45058 _values!1303)))))

(assert (=> b!1350733 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45057 _keys!1571)))))

(declare-fun b!1350734 () Bool)

(assert (=> b!1350734 (= e!768462 (+!4894 call!65247 (tuple2!24387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1350735 () Bool)

(assert (=> b!1350735 (= e!768464 (= (apply!1049 lt!596990 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(assert (= (and d!145103 c!126970) b!1350734))

(assert (= (and d!145103 (not c!126970)) b!1350727))

(assert (= (and b!1350727 c!126967) b!1350725))

(assert (= (and b!1350727 (not c!126967)) b!1350722))

(assert (= (and b!1350722 c!126966) b!1350726))

(assert (= (and b!1350722 (not c!126966)) b!1350716))

(assert (= (or b!1350726 b!1350716) bm!65244))

(assert (= (or b!1350725 bm!65244) bm!65242))

(assert (= (or b!1350725 b!1350726) bm!65240))

(assert (= (or b!1350734 bm!65242) bm!65246))

(assert (= (or b!1350734 bm!65240) bm!65243))

(assert (= (and d!145103 res!895769) b!1350729))

(assert (= (and d!145103 c!126969) b!1350715))

(assert (= (and d!145103 (not c!126969)) b!1350721))

(assert (= (and d!145103 res!895770) b!1350728))

(assert (= (and b!1350728 res!895773) b!1350723))

(assert (= (and b!1350728 (not res!895768)) b!1350724))

(assert (= (and b!1350724 res!895765) b!1350733))

(assert (= (and b!1350728 res!895766) b!1350717))

(assert (= (and b!1350717 c!126968) b!1350720))

(assert (= (and b!1350717 (not c!126968)) b!1350719))

(assert (= (and b!1350720 res!895767) b!1350735))

(assert (= (or b!1350720 b!1350719) bm!65245))

(assert (= (and b!1350717 res!895772) b!1350718))

(assert (= (and b!1350718 c!126965) b!1350730))

(assert (= (and b!1350718 (not c!126965)) b!1350731))

(assert (= (and b!1350730 res!895771) b!1350732))

(assert (= (or b!1350730 b!1350731) bm!65241))

(declare-fun b_lambda!24697 () Bool)

(assert (=> (not b_lambda!24697) (not b!1350733)))

(assert (=> b!1350733 t!46166))

(declare-fun b_and!50983 () Bool)

(assert (= b_and!50973 (and (=> t!46166 result!25999) b_and!50983)))

(assert (=> d!145103 m!1237991))

(assert (=> b!1350724 m!1237959))

(assert (=> b!1350724 m!1237959))

(declare-fun m!1238087 () Bool)

(assert (=> b!1350724 m!1238087))

(declare-fun m!1238089 () Bool)

(assert (=> bm!65241 m!1238089))

(declare-fun m!1238091 () Bool)

(assert (=> b!1350735 m!1238091))

(assert (=> b!1350723 m!1237959))

(assert (=> b!1350723 m!1237959))

(assert (=> b!1350723 m!1237961))

(declare-fun m!1238093 () Bool)

(assert (=> bm!65243 m!1238093))

(assert (=> b!1350733 m!1237981))

(assert (=> b!1350733 m!1237959))

(assert (=> b!1350733 m!1237959))

(declare-fun m!1238095 () Bool)

(assert (=> b!1350733 m!1238095))

(assert (=> b!1350733 m!1237983))

(assert (=> b!1350733 m!1237981))

(assert (=> b!1350733 m!1237983))

(assert (=> b!1350733 m!1237985))

(assert (=> b!1350729 m!1237959))

(assert (=> b!1350729 m!1237959))

(assert (=> b!1350729 m!1237961))

(declare-fun m!1238097 () Bool)

(assert (=> b!1350715 m!1238097))

(declare-fun m!1238099 () Bool)

(assert (=> b!1350715 m!1238099))

(declare-fun m!1238101 () Bool)

(assert (=> b!1350715 m!1238101))

(declare-fun m!1238103 () Bool)

(assert (=> b!1350715 m!1238103))

(assert (=> b!1350715 m!1237959))

(declare-fun m!1238105 () Bool)

(assert (=> b!1350715 m!1238105))

(declare-fun m!1238107 () Bool)

(assert (=> b!1350715 m!1238107))

(declare-fun m!1238109 () Bool)

(assert (=> b!1350715 m!1238109))

(declare-fun m!1238111 () Bool)

(assert (=> b!1350715 m!1238111))

(assert (=> b!1350715 m!1238103))

(declare-fun m!1238113 () Bool)

(assert (=> b!1350715 m!1238113))

(declare-fun m!1238115 () Bool)

(assert (=> b!1350715 m!1238115))

(declare-fun m!1238117 () Bool)

(assert (=> b!1350715 m!1238117))

(declare-fun m!1238119 () Bool)

(assert (=> b!1350715 m!1238119))

(declare-fun m!1238121 () Bool)

(assert (=> b!1350715 m!1238121))

(assert (=> b!1350715 m!1238097))

(assert (=> b!1350715 m!1238105))

(declare-fun m!1238123 () Bool)

(assert (=> b!1350715 m!1238123))

(assert (=> b!1350715 m!1238109))

(declare-fun m!1238125 () Bool)

(assert (=> b!1350715 m!1238125))

(declare-fun m!1238127 () Bool)

(assert (=> b!1350715 m!1238127))

(declare-fun m!1238129 () Bool)

(assert (=> b!1350734 m!1238129))

(assert (=> bm!65246 m!1238121))

(declare-fun m!1238131 () Bool)

(assert (=> bm!65245 m!1238131))

(declare-fun m!1238133 () Bool)

(assert (=> b!1350732 m!1238133))

(assert (=> b!1350560 d!145103))

(declare-fun b!1350746 () Bool)

(declare-fun e!768478 () Bool)

(declare-fun call!65252 () Bool)

(assert (=> b!1350746 (= e!768478 call!65252)))

(declare-fun b!1350747 () Bool)

(assert (=> b!1350747 (= e!768478 call!65252)))

(declare-fun b!1350748 () Bool)

(declare-fun e!768477 () Bool)

(declare-fun contains!9237 (List!31524 (_ BitVec 64)) Bool)

(assert (=> b!1350748 (= e!768477 (contains!9237 Nil!31521 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65249 () Bool)

(declare-fun c!126973 () Bool)

(assert (=> bm!65249 (= call!65252 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126973 (Cons!31520 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000) Nil!31521) Nil!31521)))))

(declare-fun d!145105 () Bool)

(declare-fun res!895780 () Bool)

(declare-fun e!768480 () Bool)

(assert (=> d!145105 (=> res!895780 e!768480)))

(assert (=> d!145105 (= res!895780 (bvsge #b00000000000000000000000000000000 (size!45057 _keys!1571)))))

(assert (=> d!145105 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31521) e!768480)))

(declare-fun b!1350749 () Bool)

(declare-fun e!768479 () Bool)

(assert (=> b!1350749 (= e!768480 e!768479)))

(declare-fun res!895781 () Bool)

(assert (=> b!1350749 (=> (not res!895781) (not e!768479))))

(assert (=> b!1350749 (= res!895781 (not e!768477))))

(declare-fun res!895782 () Bool)

(assert (=> b!1350749 (=> (not res!895782) (not e!768477))))

(assert (=> b!1350749 (= res!895782 (validKeyInArray!0 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350750 () Bool)

(assert (=> b!1350750 (= e!768479 e!768478)))

(assert (=> b!1350750 (= c!126973 (validKeyInArray!0 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!145105 (not res!895780)) b!1350749))

(assert (= (and b!1350749 res!895782) b!1350748))

(assert (= (and b!1350749 res!895781) b!1350750))

(assert (= (and b!1350750 c!126973) b!1350747))

(assert (= (and b!1350750 (not c!126973)) b!1350746))

(assert (= (or b!1350747 b!1350746) bm!65249))

(declare-fun m!1238135 () Bool)

(assert (=> b!1350748 m!1238135))

(assert (=> b!1350748 m!1238135))

(declare-fun m!1238137 () Bool)

(assert (=> b!1350748 m!1238137))

(assert (=> bm!65249 m!1238135))

(declare-fun m!1238139 () Bool)

(assert (=> bm!65249 m!1238139))

(assert (=> b!1350749 m!1238135))

(assert (=> b!1350749 m!1238135))

(declare-fun m!1238141 () Bool)

(assert (=> b!1350749 m!1238141))

(assert (=> b!1350750 m!1238135))

(assert (=> b!1350750 m!1238135))

(assert (=> b!1350750 m!1238141))

(assert (=> b!1350570 d!145105))

(declare-fun d!145107 () Bool)

(declare-fun e!768481 () Bool)

(assert (=> d!145107 e!768481))

(declare-fun res!895783 () Bool)

(assert (=> d!145107 (=> res!895783 e!768481)))

(declare-fun lt!597008 () Bool)

(assert (=> d!145107 (= res!895783 (not lt!597008))))

(declare-fun lt!597009 () Bool)

(assert (=> d!145107 (= lt!597008 lt!597009)))

(declare-fun lt!597010 () Unit!44134)

(declare-fun e!768482 () Unit!44134)

(assert (=> d!145107 (= lt!597010 e!768482)))

(declare-fun c!126974 () Bool)

(assert (=> d!145107 (= c!126974 lt!597009)))

(assert (=> d!145107 (= lt!597009 (containsKey!745 (toList!11041 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))) k0!1142))))

(assert (=> d!145107 (= (contains!9234 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)) k0!1142) lt!597008)))

(declare-fun b!1350751 () Bool)

(declare-fun lt!597007 () Unit!44134)

(assert (=> b!1350751 (= e!768482 lt!597007)))

(assert (=> b!1350751 (= lt!597007 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11041 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))) k0!1142))))

(assert (=> b!1350751 (isDefined!528 (getValueByKey!719 (toList!11041 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))) k0!1142))))

(declare-fun b!1350752 () Bool)

(declare-fun Unit!44138 () Unit!44134)

(assert (=> b!1350752 (= e!768482 Unit!44138)))

(declare-fun b!1350753 () Bool)

(assert (=> b!1350753 (= e!768481 (isDefined!528 (getValueByKey!719 (toList!11041 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))) k0!1142)))))

(assert (= (and d!145107 c!126974) b!1350751))

(assert (= (and d!145107 (not c!126974)) b!1350752))

(assert (= (and d!145107 (not res!895783)) b!1350753))

(declare-fun m!1238143 () Bool)

(assert (=> d!145107 m!1238143))

(declare-fun m!1238145 () Bool)

(assert (=> b!1350751 m!1238145))

(declare-fun m!1238147 () Bool)

(assert (=> b!1350751 m!1238147))

(assert (=> b!1350751 m!1238147))

(declare-fun m!1238149 () Bool)

(assert (=> b!1350751 m!1238149))

(assert (=> b!1350753 m!1238147))

(assert (=> b!1350753 m!1238147))

(assert (=> b!1350753 m!1238149))

(assert (=> b!1350562 d!145107))

(declare-fun d!145109 () Bool)

(declare-fun e!768485 () Bool)

(assert (=> d!145109 e!768485))

(declare-fun res!895788 () Bool)

(assert (=> d!145109 (=> (not res!895788) (not e!768485))))

(declare-fun lt!597021 () ListLongMap!22051)

(assert (=> d!145109 (= res!895788 (contains!9234 lt!597021 (_1!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))))))

(declare-fun lt!597019 () List!31523)

(assert (=> d!145109 (= lt!597021 (ListLongMap!22052 lt!597019))))

(declare-fun lt!597022 () Unit!44134)

(declare-fun lt!597020 () Unit!44134)

(assert (=> d!145109 (= lt!597022 lt!597020)))

(assert (=> d!145109 (= (getValueByKey!719 lt!597019 (_1!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))) (Some!769 (_2!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))))))

(declare-fun lemmaContainsTupThenGetReturnValue!369 (List!31523 (_ BitVec 64) V!55217) Unit!44134)

(assert (=> d!145109 (= lt!597020 (lemmaContainsTupThenGetReturnValue!369 lt!597019 (_1!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)) (_2!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))))))

(declare-fun insertStrictlySorted!498 (List!31523 (_ BitVec 64) V!55217) List!31523)

(assert (=> d!145109 (= lt!597019 (insertStrictlySorted!498 (toList!11041 lt!596910) (_1!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)) (_2!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))))))

(assert (=> d!145109 (= (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)) lt!597021)))

(declare-fun b!1350758 () Bool)

(declare-fun res!895789 () Bool)

(assert (=> b!1350758 (=> (not res!895789) (not e!768485))))

(assert (=> b!1350758 (= res!895789 (= (getValueByKey!719 (toList!11041 lt!597021) (_1!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909))) (Some!769 (_2!12204 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)))))))

(declare-fun b!1350759 () Bool)

(declare-fun contains!9238 (List!31523 tuple2!24386) Bool)

(assert (=> b!1350759 (= e!768485 (contains!9238 (toList!11041 lt!597021) (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)))))

(assert (= (and d!145109 res!895788) b!1350758))

(assert (= (and b!1350758 res!895789) b!1350759))

(declare-fun m!1238151 () Bool)

(assert (=> d!145109 m!1238151))

(declare-fun m!1238153 () Bool)

(assert (=> d!145109 m!1238153))

(declare-fun m!1238155 () Bool)

(assert (=> d!145109 m!1238155))

(declare-fun m!1238157 () Bool)

(assert (=> d!145109 m!1238157))

(declare-fun m!1238159 () Bool)

(assert (=> b!1350758 m!1238159))

(declare-fun m!1238161 () Bool)

(assert (=> b!1350759 m!1238161))

(assert (=> b!1350562 d!145109))

(declare-fun b!1350784 () Bool)

(declare-fun e!768504 () Bool)

(declare-fun e!768501 () Bool)

(assert (=> b!1350784 (= e!768504 e!768501)))

(assert (=> b!1350784 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun res!895801 () Bool)

(declare-fun lt!597040 () ListLongMap!22051)

(assert (=> b!1350784 (= res!895801 (contains!9234 lt!597040 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1350784 (=> (not res!895801) (not e!768501))))

(declare-fun b!1350785 () Bool)

(declare-fun e!768500 () ListLongMap!22051)

(declare-fun e!768506 () ListLongMap!22051)

(assert (=> b!1350785 (= e!768500 e!768506)))

(declare-fun c!126984 () Bool)

(assert (=> b!1350785 (= c!126984 (validKeyInArray!0 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1350786 () Bool)

(declare-fun e!768502 () Bool)

(assert (=> b!1350786 (= e!768502 e!768504)))

(declare-fun c!126986 () Bool)

(declare-fun e!768503 () Bool)

(assert (=> b!1350786 (= c!126986 e!768503)))

(declare-fun res!895798 () Bool)

(assert (=> b!1350786 (=> (not res!895798) (not e!768503))))

(assert (=> b!1350786 (= res!895798 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun b!1350787 () Bool)

(declare-fun e!768505 () Bool)

(assert (=> b!1350787 (= e!768504 e!768505)))

(declare-fun c!126985 () Bool)

(assert (=> b!1350787 (= c!126985 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun b!1350788 () Bool)

(declare-fun lt!597037 () Unit!44134)

(declare-fun lt!597038 () Unit!44134)

(assert (=> b!1350788 (= lt!597037 lt!597038)))

(declare-fun lt!597041 () (_ BitVec 64))

(declare-fun lt!597043 () ListLongMap!22051)

(declare-fun lt!597042 () (_ BitVec 64))

(declare-fun lt!597039 () V!55217)

(assert (=> b!1350788 (not (contains!9234 (+!4894 lt!597043 (tuple2!24387 lt!597041 lt!597039)) lt!597042))))

(declare-fun addStillNotContains!505 (ListLongMap!22051 (_ BitVec 64) V!55217 (_ BitVec 64)) Unit!44134)

(assert (=> b!1350788 (= lt!597038 (addStillNotContains!505 lt!597043 lt!597041 lt!597039 lt!597042))))

(assert (=> b!1350788 (= lt!597042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1350788 (= lt!597039 (get!22506 (select (arr!44507 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1350788 (= lt!597041 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun call!65255 () ListLongMap!22051)

(assert (=> b!1350788 (= lt!597043 call!65255)))

(assert (=> b!1350788 (= e!768506 (+!4894 call!65255 (tuple2!24387 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22506 (select (arr!44507 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1350789 () Bool)

(declare-fun res!895800 () Bool)

(assert (=> b!1350789 (=> (not res!895800) (not e!768502))))

(assert (=> b!1350789 (= res!895800 (not (contains!9234 lt!597040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!145111 () Bool)

(assert (=> d!145111 e!768502))

(declare-fun res!895799 () Bool)

(assert (=> d!145111 (=> (not res!895799) (not e!768502))))

(assert (=> d!145111 (= res!895799 (not (contains!9234 lt!597040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!145111 (= lt!597040 e!768500)))

(declare-fun c!126983 () Bool)

(assert (=> d!145111 (= c!126983 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(assert (=> d!145111 (validMask!0 mask!1977)))

(assert (=> d!145111 (= (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!597040)))

(declare-fun b!1350790 () Bool)

(assert (=> b!1350790 (= e!768503 (validKeyInArray!0 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1350790 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1350791 () Bool)

(declare-fun isEmpty!1102 (ListLongMap!22051) Bool)

(assert (=> b!1350791 (= e!768505 (isEmpty!1102 lt!597040))))

(declare-fun b!1350792 () Bool)

(assert (=> b!1350792 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(assert (=> b!1350792 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45058 _values!1303)))))

(assert (=> b!1350792 (= e!768501 (= (apply!1049 lt!597040 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22506 (select (arr!44507 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!65252 () Bool)

(assert (=> bm!65252 (= call!65255 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1350793 () Bool)

(assert (=> b!1350793 (= e!768500 (ListLongMap!22052 Nil!31520))))

(declare-fun b!1350794 () Bool)

(assert (=> b!1350794 (= e!768506 call!65255)))

(declare-fun b!1350795 () Bool)

(assert (=> b!1350795 (= e!768505 (= lt!597040 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(assert (= (and d!145111 c!126983) b!1350793))

(assert (= (and d!145111 (not c!126983)) b!1350785))

(assert (= (and b!1350785 c!126984) b!1350788))

(assert (= (and b!1350785 (not c!126984)) b!1350794))

(assert (= (or b!1350788 b!1350794) bm!65252))

(assert (= (and d!145111 res!895799) b!1350789))

(assert (= (and b!1350789 res!895800) b!1350786))

(assert (= (and b!1350786 res!895798) b!1350790))

(assert (= (and b!1350786 c!126986) b!1350784))

(assert (= (and b!1350786 (not c!126986)) b!1350787))

(assert (= (and b!1350784 res!895801) b!1350792))

(assert (= (and b!1350787 c!126985) b!1350795))

(assert (= (and b!1350787 (not c!126985)) b!1350791))

(declare-fun b_lambda!24699 () Bool)

(assert (=> (not b_lambda!24699) (not b!1350788)))

(assert (=> b!1350788 t!46166))

(declare-fun b_and!50985 () Bool)

(assert (= b_and!50983 (and (=> t!46166 result!25999) b_and!50985)))

(declare-fun b_lambda!24701 () Bool)

(assert (=> (not b_lambda!24701) (not b!1350792)))

(assert (=> b!1350792 t!46166))

(declare-fun b_and!50987 () Bool)

(assert (= b_and!50985 (and (=> t!46166 result!25999) b_and!50987)))

(declare-fun m!1238163 () Bool)

(assert (=> bm!65252 m!1238163))

(declare-fun m!1238165 () Bool)

(assert (=> b!1350791 m!1238165))

(assert (=> b!1350795 m!1238163))

(declare-fun m!1238167 () Bool)

(assert (=> b!1350790 m!1238167))

(assert (=> b!1350790 m!1238167))

(declare-fun m!1238169 () Bool)

(assert (=> b!1350790 m!1238169))

(assert (=> b!1350788 m!1237983))

(declare-fun m!1238171 () Bool)

(assert (=> b!1350788 m!1238171))

(declare-fun m!1238173 () Bool)

(assert (=> b!1350788 m!1238173))

(declare-fun m!1238175 () Bool)

(assert (=> b!1350788 m!1238175))

(declare-fun m!1238177 () Bool)

(assert (=> b!1350788 m!1238177))

(declare-fun m!1238179 () Bool)

(assert (=> b!1350788 m!1238179))

(assert (=> b!1350788 m!1238175))

(assert (=> b!1350788 m!1237983))

(declare-fun m!1238181 () Bool)

(assert (=> b!1350788 m!1238181))

(assert (=> b!1350788 m!1238167))

(assert (=> b!1350788 m!1238177))

(assert (=> b!1350792 m!1237983))

(assert (=> b!1350792 m!1238175))

(assert (=> b!1350792 m!1238167))

(declare-fun m!1238183 () Bool)

(assert (=> b!1350792 m!1238183))

(assert (=> b!1350792 m!1238175))

(assert (=> b!1350792 m!1237983))

(assert (=> b!1350792 m!1238181))

(assert (=> b!1350792 m!1238167))

(assert (=> b!1350784 m!1238167))

(assert (=> b!1350784 m!1238167))

(declare-fun m!1238185 () Bool)

(assert (=> b!1350784 m!1238185))

(assert (=> b!1350785 m!1238167))

(assert (=> b!1350785 m!1238167))

(assert (=> b!1350785 m!1238169))

(declare-fun m!1238187 () Bool)

(assert (=> d!145111 m!1238187))

(assert (=> d!145111 m!1237991))

(declare-fun m!1238189 () Bool)

(assert (=> b!1350789 m!1238189))

(assert (=> b!1350562 d!145111))

(declare-fun d!145113 () Bool)

(declare-fun c!126989 () Bool)

(assert (=> d!145113 (= c!126989 ((_ is ValueCellFull!17894) (select (arr!44507 _values!1303) from!1960)))))

(declare-fun e!768509 () V!55217)

(assert (=> d!145113 (= (get!22506 (select (arr!44507 _values!1303) from!1960) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!768509)))

(declare-fun b!1350800 () Bool)

(declare-fun get!22508 (ValueCell!17894 V!55217) V!55217)

(assert (=> b!1350800 (= e!768509 (get!22508 (select (arr!44507 _values!1303) from!1960) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350801 () Bool)

(declare-fun get!22509 (ValueCell!17894 V!55217) V!55217)

(assert (=> b!1350801 (= e!768509 (get!22509 (select (arr!44507 _values!1303) from!1960) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145113 c!126989) b!1350800))

(assert (= (and d!145113 (not c!126989)) b!1350801))

(assert (=> b!1350800 m!1237981))

(assert (=> b!1350800 m!1237983))

(declare-fun m!1238191 () Bool)

(assert (=> b!1350800 m!1238191))

(assert (=> b!1350801 m!1237981))

(assert (=> b!1350801 m!1237983))

(declare-fun m!1238193 () Bool)

(assert (=> b!1350801 m!1238193))

(assert (=> b!1350562 d!145113))

(declare-fun b!1350810 () Bool)

(declare-fun e!768517 () Bool)

(declare-fun e!768516 () Bool)

(assert (=> b!1350810 (= e!768517 e!768516)))

(declare-fun c!126992 () Bool)

(assert (=> b!1350810 (= c!126992 (validKeyInArray!0 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!145115 () Bool)

(declare-fun res!895806 () Bool)

(assert (=> d!145115 (=> res!895806 e!768517)))

(assert (=> d!145115 (= res!895806 (bvsge #b00000000000000000000000000000000 (size!45057 _keys!1571)))))

(assert (=> d!145115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!768517)))

(declare-fun b!1350811 () Bool)

(declare-fun call!65258 () Bool)

(assert (=> b!1350811 (= e!768516 call!65258)))

(declare-fun b!1350812 () Bool)

(declare-fun e!768518 () Bool)

(assert (=> b!1350812 (= e!768518 call!65258)))

(declare-fun bm!65255 () Bool)

(assert (=> bm!65255 (= call!65258 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1350813 () Bool)

(assert (=> b!1350813 (= e!768516 e!768518)))

(declare-fun lt!597050 () (_ BitVec 64))

(assert (=> b!1350813 (= lt!597050 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!597051 () Unit!44134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!92115 (_ BitVec 64) (_ BitVec 32)) Unit!44134)

(assert (=> b!1350813 (= lt!597051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!597050 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!92115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1350813 (arrayContainsKey!0 _keys!1571 lt!597050 #b00000000000000000000000000000000)))

(declare-fun lt!597052 () Unit!44134)

(assert (=> b!1350813 (= lt!597052 lt!597051)))

(declare-fun res!895807 () Bool)

(declare-datatypes ((SeekEntryResult!10015 0))(
  ( (MissingZero!10015 (index!42431 (_ BitVec 32))) (Found!10015 (index!42432 (_ BitVec 32))) (Intermediate!10015 (undefined!10827 Bool) (index!42433 (_ BitVec 32)) (x!120738 (_ BitVec 32))) (Undefined!10015) (MissingVacant!10015 (index!42434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!92115 (_ BitVec 32)) SeekEntryResult!10015)

(assert (=> b!1350813 (= res!895807 (= (seekEntryOrOpen!0 (select (arr!44506 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10015 #b00000000000000000000000000000000)))))

(assert (=> b!1350813 (=> (not res!895807) (not e!768518))))

(assert (= (and d!145115 (not res!895806)) b!1350810))

(assert (= (and b!1350810 c!126992) b!1350813))

(assert (= (and b!1350810 (not c!126992)) b!1350811))

(assert (= (and b!1350813 res!895807) b!1350812))

(assert (= (or b!1350812 b!1350811) bm!65255))

(assert (=> b!1350810 m!1238135))

(assert (=> b!1350810 m!1238135))

(assert (=> b!1350810 m!1238141))

(declare-fun m!1238195 () Bool)

(assert (=> bm!65255 m!1238195))

(assert (=> b!1350813 m!1238135))

(declare-fun m!1238197 () Bool)

(assert (=> b!1350813 m!1238197))

(declare-fun m!1238199 () Bool)

(assert (=> b!1350813 m!1238199))

(assert (=> b!1350813 m!1238135))

(declare-fun m!1238201 () Bool)

(assert (=> b!1350813 m!1238201))

(assert (=> b!1350568 d!145115))

(declare-fun d!145117 () Bool)

(assert (=> d!145117 (= (validKeyInArray!0 (select (arr!44506 _keys!1571) from!1960)) (and (not (= (select (arr!44506 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44506 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350563 d!145117))

(declare-fun d!145119 () Bool)

(assert (=> d!145119 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113900 d!145119))

(declare-fun d!145121 () Bool)

(assert (=> d!145121 (= (array_inv!33789 _keys!1571) (bvsge (size!45057 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113900 d!145121))

(declare-fun d!145123 () Bool)

(assert (=> d!145123 (= (array_inv!33790 _values!1303) (bvsge (size!45058 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113900 d!145123))

(declare-fun d!145125 () Bool)

(declare-fun e!768519 () Bool)

(assert (=> d!145125 e!768519))

(declare-fun res!895808 () Bool)

(assert (=> d!145125 (=> res!895808 e!768519)))

(declare-fun lt!597054 () Bool)

(assert (=> d!145125 (= res!895808 (not lt!597054))))

(declare-fun lt!597055 () Bool)

(assert (=> d!145125 (= lt!597054 lt!597055)))

(declare-fun lt!597056 () Unit!44134)

(declare-fun e!768520 () Unit!44134)

(assert (=> d!145125 (= lt!597056 e!768520)))

(declare-fun c!126993 () Bool)

(assert (=> d!145125 (= c!126993 lt!597055)))

(assert (=> d!145125 (= lt!597055 (containsKey!745 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!145125 (= (contains!9234 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!597054)))

(declare-fun b!1350814 () Bool)

(declare-fun lt!597053 () Unit!44134)

(assert (=> b!1350814 (= e!768520 lt!597053)))

(assert (=> b!1350814 (= lt!597053 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1350814 (isDefined!528 (getValueByKey!719 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1350815 () Bool)

(declare-fun Unit!44139 () Unit!44134)

(assert (=> b!1350815 (= e!768520 Unit!44139)))

(declare-fun b!1350816 () Bool)

(assert (=> b!1350816 (= e!768519 (isDefined!528 (getValueByKey!719 (toList!11041 (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!145125 c!126993) b!1350814))

(assert (= (and d!145125 (not c!126993)) b!1350815))

(assert (= (and d!145125 (not res!895808)) b!1350816))

(declare-fun m!1238203 () Bool)

(assert (=> d!145125 m!1238203))

(declare-fun m!1238205 () Bool)

(assert (=> b!1350814 m!1238205))

(declare-fun m!1238207 () Bool)

(assert (=> b!1350814 m!1238207))

(assert (=> b!1350814 m!1238207))

(declare-fun m!1238209 () Bool)

(assert (=> b!1350814 m!1238209))

(assert (=> b!1350816 m!1238207))

(assert (=> b!1350816 m!1238207))

(assert (=> b!1350816 m!1238209))

(assert (=> b!1350564 d!145125))

(declare-fun b!1350817 () Bool)

(declare-fun e!768532 () Unit!44134)

(declare-fun lt!597073 () Unit!44134)

(assert (=> b!1350817 (= e!768532 lt!597073)))

(declare-fun lt!597077 () ListLongMap!22051)

(assert (=> b!1350817 (= lt!597077 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597071 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597071 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597072 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597072 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!597074 () Unit!44134)

(assert (=> b!1350817 (= lt!597074 (addStillContains!1217 lt!597077 lt!597071 zeroValue!1245 lt!597072))))

(assert (=> b!1350817 (contains!9234 (+!4894 lt!597077 (tuple2!24387 lt!597071 zeroValue!1245)) lt!597072)))

(declare-fun lt!597063 () Unit!44134)

(assert (=> b!1350817 (= lt!597063 lt!597074)))

(declare-fun lt!597067 () ListLongMap!22051)

(assert (=> b!1350817 (= lt!597067 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597065 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597065 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597066 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597066 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!597057 () Unit!44134)

(assert (=> b!1350817 (= lt!597057 (addApplyDifferent!578 lt!597067 lt!597065 minValue!1245 lt!597066))))

(assert (=> b!1350817 (= (apply!1049 (+!4894 lt!597067 (tuple2!24387 lt!597065 minValue!1245)) lt!597066) (apply!1049 lt!597067 lt!597066))))

(declare-fun lt!597064 () Unit!44134)

(assert (=> b!1350817 (= lt!597064 lt!597057)))

(declare-fun lt!597061 () ListLongMap!22051)

(assert (=> b!1350817 (= lt!597061 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597058 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597078 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597078 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!597059 () Unit!44134)

(assert (=> b!1350817 (= lt!597059 (addApplyDifferent!578 lt!597061 lt!597058 zeroValue!1245 lt!597078))))

(assert (=> b!1350817 (= (apply!1049 (+!4894 lt!597061 (tuple2!24387 lt!597058 zeroValue!1245)) lt!597078) (apply!1049 lt!597061 lt!597078))))

(declare-fun lt!597070 () Unit!44134)

(assert (=> b!1350817 (= lt!597070 lt!597059)))

(declare-fun lt!597069 () ListLongMap!22051)

(assert (=> b!1350817 (= lt!597069 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597068 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597060 () (_ BitVec 64))

(assert (=> b!1350817 (= lt!597060 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1350817 (= lt!597073 (addApplyDifferent!578 lt!597069 lt!597068 minValue!1245 lt!597060))))

(assert (=> b!1350817 (= (apply!1049 (+!4894 lt!597069 (tuple2!24387 lt!597068 minValue!1245)) lt!597060) (apply!1049 lt!597069 lt!597060))))

(declare-fun b!1350818 () Bool)

(declare-fun e!768521 () ListLongMap!22051)

(declare-fun call!65261 () ListLongMap!22051)

(assert (=> b!1350818 (= e!768521 call!65261)))

(declare-fun b!1350819 () Bool)

(declare-fun res!895816 () Bool)

(declare-fun e!768531 () Bool)

(assert (=> b!1350819 (=> (not res!895816) (not e!768531))))

(declare-fun e!768528 () Bool)

(assert (=> b!1350819 (= res!895816 e!768528)))

(declare-fun c!126997 () Bool)

(assert (=> b!1350819 (= c!126997 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1350820 () Bool)

(declare-fun e!768524 () Bool)

(assert (=> b!1350820 (= e!768531 e!768524)))

(declare-fun c!126994 () Bool)

(assert (=> b!1350820 (= c!126994 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1350821 () Bool)

(declare-fun call!65265 () Bool)

(assert (=> b!1350821 (= e!768528 (not call!65265))))

(declare-fun b!1350822 () Bool)

(declare-fun e!768529 () Bool)

(assert (=> b!1350822 (= e!768528 e!768529)))

(declare-fun res!895811 () Bool)

(assert (=> b!1350822 (= res!895811 call!65265)))

(assert (=> b!1350822 (=> (not res!895811) (not e!768529))))

(declare-fun bm!65256 () Bool)

(declare-fun call!65260 () ListLongMap!22051)

(declare-fun call!65263 () ListLongMap!22051)

(assert (=> bm!65256 (= call!65260 call!65263)))

(declare-fun b!1350823 () Bool)

(declare-fun Unit!44140 () Unit!44134)

(assert (=> b!1350823 (= e!768532 Unit!44140)))

(declare-fun bm!65257 () Bool)

(declare-fun call!65262 () Bool)

(declare-fun lt!597062 () ListLongMap!22051)

(assert (=> bm!65257 (= call!65262 (contains!9234 lt!597062 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65258 () Bool)

(declare-fun call!65259 () ListLongMap!22051)

(declare-fun call!65264 () ListLongMap!22051)

(assert (=> bm!65258 (= call!65259 call!65264)))

(declare-fun b!1350824 () Bool)

(declare-fun c!126995 () Bool)

(assert (=> b!1350824 (= c!126995 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!768533 () ListLongMap!22051)

(assert (=> b!1350824 (= e!768533 e!768521)))

(declare-fun b!1350825 () Bool)

(declare-fun e!768530 () Bool)

(assert (=> b!1350825 (= e!768530 (validKeyInArray!0 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun bm!65259 () Bool)

(declare-fun c!126999 () Bool)

(declare-fun c!126996 () Bool)

(assert (=> bm!65259 (= call!65263 (+!4894 (ite c!126999 call!65264 (ite c!126996 call!65259 call!65261)) (ite (or c!126999 c!126996) (tuple2!24387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1350826 () Bool)

(declare-fun e!768523 () Bool)

(declare-fun e!768522 () Bool)

(assert (=> b!1350826 (= e!768523 e!768522)))

(declare-fun res!895809 () Bool)

(assert (=> b!1350826 (=> (not res!895809) (not e!768522))))

(assert (=> b!1350826 (= res!895809 (contains!9234 lt!597062 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1350826 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun d!145127 () Bool)

(assert (=> d!145127 e!768531))

(declare-fun res!895814 () Bool)

(assert (=> d!145127 (=> (not res!895814) (not e!768531))))

(assert (=> d!145127 (= res!895814 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))))

(declare-fun lt!597075 () ListLongMap!22051)

(assert (=> d!145127 (= lt!597062 lt!597075)))

(declare-fun lt!597076 () Unit!44134)

(assert (=> d!145127 (= lt!597076 e!768532)))

(declare-fun c!126998 () Bool)

(declare-fun e!768526 () Bool)

(assert (=> d!145127 (= c!126998 e!768526)))

(declare-fun res!895813 () Bool)

(assert (=> d!145127 (=> (not res!895813) (not e!768526))))

(assert (=> d!145127 (= res!895813 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun e!768527 () ListLongMap!22051)

(assert (=> d!145127 (= lt!597075 e!768527)))

(assert (=> d!145127 (= c!126999 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!145127 (validMask!0 mask!1977)))

(assert (=> d!145127 (= (getCurrentListMap!5978 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!597062)))

(declare-fun b!1350827 () Bool)

(assert (=> b!1350827 (= e!768533 call!65260)))

(declare-fun b!1350828 () Bool)

(assert (=> b!1350828 (= e!768521 call!65260)))

(declare-fun b!1350829 () Bool)

(assert (=> b!1350829 (= e!768527 e!768533)))

(assert (=> b!1350829 (= c!126996 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1350830 () Bool)

(declare-fun res!895810 () Bool)

(assert (=> b!1350830 (=> (not res!895810) (not e!768531))))

(assert (=> b!1350830 (= res!895810 e!768523)))

(declare-fun res!895812 () Bool)

(assert (=> b!1350830 (=> res!895812 e!768523)))

(assert (=> b!1350830 (= res!895812 (not e!768530))))

(declare-fun res!895817 () Bool)

(assert (=> b!1350830 (=> (not res!895817) (not e!768530))))

(assert (=> b!1350830 (= res!895817 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun b!1350831 () Bool)

(assert (=> b!1350831 (= e!768526 (validKeyInArray!0 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1350832 () Bool)

(declare-fun e!768525 () Bool)

(assert (=> b!1350832 (= e!768524 e!768525)))

(declare-fun res!895815 () Bool)

(assert (=> b!1350832 (= res!895815 call!65262)))

(assert (=> b!1350832 (=> (not res!895815) (not e!768525))))

(declare-fun bm!65260 () Bool)

(assert (=> bm!65260 (= call!65261 call!65259)))

(declare-fun bm!65261 () Bool)

(assert (=> bm!65261 (= call!65265 (contains!9234 lt!597062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350833 () Bool)

(assert (=> b!1350833 (= e!768524 (not call!65262))))

(declare-fun bm!65262 () Bool)

(assert (=> bm!65262 (= call!65264 (getCurrentListMapNoExtraKeys!6547 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1350834 () Bool)

(assert (=> b!1350834 (= e!768525 (= (apply!1049 lt!597062 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1350835 () Bool)

(assert (=> b!1350835 (= e!768522 (= (apply!1049 lt!597062 (select (arr!44506 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22506 (select (arr!44507 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3848 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350835 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45058 _values!1303)))))

(assert (=> b!1350835 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45057 _keys!1571)))))

(declare-fun b!1350836 () Bool)

(assert (=> b!1350836 (= e!768527 (+!4894 call!65263 (tuple2!24387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1350837 () Bool)

(assert (=> b!1350837 (= e!768529 (= (apply!1049 lt!597062 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(assert (= (and d!145127 c!126999) b!1350836))

(assert (= (and d!145127 (not c!126999)) b!1350829))

(assert (= (and b!1350829 c!126996) b!1350827))

(assert (= (and b!1350829 (not c!126996)) b!1350824))

(assert (= (and b!1350824 c!126995) b!1350828))

(assert (= (and b!1350824 (not c!126995)) b!1350818))

(assert (= (or b!1350828 b!1350818) bm!65260))

(assert (= (or b!1350827 bm!65260) bm!65258))

(assert (= (or b!1350827 b!1350828) bm!65256))

(assert (= (or b!1350836 bm!65258) bm!65262))

(assert (= (or b!1350836 bm!65256) bm!65259))

(assert (= (and d!145127 res!895813) b!1350831))

(assert (= (and d!145127 c!126998) b!1350817))

(assert (= (and d!145127 (not c!126998)) b!1350823))

(assert (= (and d!145127 res!895814) b!1350830))

(assert (= (and b!1350830 res!895817) b!1350825))

(assert (= (and b!1350830 (not res!895812)) b!1350826))

(assert (= (and b!1350826 res!895809) b!1350835))

(assert (= (and b!1350830 res!895810) b!1350819))

(assert (= (and b!1350819 c!126997) b!1350822))

(assert (= (and b!1350819 (not c!126997)) b!1350821))

(assert (= (and b!1350822 res!895811) b!1350837))

(assert (= (or b!1350822 b!1350821) bm!65261))

(assert (= (and b!1350819 res!895816) b!1350820))

(assert (= (and b!1350820 c!126994) b!1350832))

(assert (= (and b!1350820 (not c!126994)) b!1350833))

(assert (= (and b!1350832 res!895815) b!1350834))

(assert (= (or b!1350832 b!1350833) bm!65257))

(declare-fun b_lambda!24703 () Bool)

(assert (=> (not b_lambda!24703) (not b!1350835)))

(assert (=> b!1350835 t!46166))

(declare-fun b_and!50989 () Bool)

(assert (= b_and!50987 (and (=> t!46166 result!25999) b_and!50989)))

(assert (=> d!145127 m!1237991))

(assert (=> b!1350826 m!1238167))

(assert (=> b!1350826 m!1238167))

(declare-fun m!1238211 () Bool)

(assert (=> b!1350826 m!1238211))

(declare-fun m!1238213 () Bool)

(assert (=> bm!65257 m!1238213))

(declare-fun m!1238215 () Bool)

(assert (=> b!1350837 m!1238215))

(assert (=> b!1350825 m!1238167))

(assert (=> b!1350825 m!1238167))

(assert (=> b!1350825 m!1238169))

(declare-fun m!1238217 () Bool)

(assert (=> bm!65259 m!1238217))

(assert (=> b!1350835 m!1238175))

(assert (=> b!1350835 m!1238167))

(assert (=> b!1350835 m!1238167))

(declare-fun m!1238219 () Bool)

(assert (=> b!1350835 m!1238219))

(assert (=> b!1350835 m!1237983))

(assert (=> b!1350835 m!1238175))

(assert (=> b!1350835 m!1237983))

(assert (=> b!1350835 m!1238181))

(assert (=> b!1350831 m!1238167))

(assert (=> b!1350831 m!1238167))

(assert (=> b!1350831 m!1238169))

(declare-fun m!1238221 () Bool)

(assert (=> b!1350817 m!1238221))

(declare-fun m!1238223 () Bool)

(assert (=> b!1350817 m!1238223))

(declare-fun m!1238225 () Bool)

(assert (=> b!1350817 m!1238225))

(declare-fun m!1238227 () Bool)

(assert (=> b!1350817 m!1238227))

(assert (=> b!1350817 m!1238167))

(declare-fun m!1238229 () Bool)

(assert (=> b!1350817 m!1238229))

(declare-fun m!1238231 () Bool)

(assert (=> b!1350817 m!1238231))

(declare-fun m!1238233 () Bool)

(assert (=> b!1350817 m!1238233))

(declare-fun m!1238235 () Bool)

(assert (=> b!1350817 m!1238235))

(assert (=> b!1350817 m!1238227))

(declare-fun m!1238237 () Bool)

(assert (=> b!1350817 m!1238237))

(declare-fun m!1238239 () Bool)

(assert (=> b!1350817 m!1238239))

(declare-fun m!1238241 () Bool)

(assert (=> b!1350817 m!1238241))

(declare-fun m!1238243 () Bool)

(assert (=> b!1350817 m!1238243))

(assert (=> b!1350817 m!1237975))

(assert (=> b!1350817 m!1238221))

(assert (=> b!1350817 m!1238229))

(declare-fun m!1238245 () Bool)

(assert (=> b!1350817 m!1238245))

(assert (=> b!1350817 m!1238233))

(declare-fun m!1238247 () Bool)

(assert (=> b!1350817 m!1238247))

(declare-fun m!1238249 () Bool)

(assert (=> b!1350817 m!1238249))

(declare-fun m!1238251 () Bool)

(assert (=> b!1350836 m!1238251))

(assert (=> bm!65262 m!1237975))

(declare-fun m!1238253 () Bool)

(assert (=> bm!65261 m!1238253))

(declare-fun m!1238255 () Bool)

(assert (=> b!1350834 m!1238255))

(assert (=> b!1350564 d!145127))

(declare-fun d!145129 () Bool)

(declare-fun e!768534 () Bool)

(assert (=> d!145129 e!768534))

(declare-fun res!895818 () Bool)

(assert (=> d!145129 (=> res!895818 e!768534)))

(declare-fun lt!597080 () Bool)

(assert (=> d!145129 (= res!895818 (not lt!597080))))

(declare-fun lt!597081 () Bool)

(assert (=> d!145129 (= lt!597080 lt!597081)))

(declare-fun lt!597082 () Unit!44134)

(declare-fun e!768535 () Unit!44134)

(assert (=> d!145129 (= lt!597082 e!768535)))

(declare-fun c!127000 () Bool)

(assert (=> d!145129 (= c!127000 lt!597081)))

(assert (=> d!145129 (= lt!597081 (containsKey!745 (toList!11041 lt!596910) k0!1142))))

(assert (=> d!145129 (= (contains!9234 lt!596910 k0!1142) lt!597080)))

(declare-fun b!1350838 () Bool)

(declare-fun lt!597079 () Unit!44134)

(assert (=> b!1350838 (= e!768535 lt!597079)))

(assert (=> b!1350838 (= lt!597079 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11041 lt!596910) k0!1142))))

(assert (=> b!1350838 (isDefined!528 (getValueByKey!719 (toList!11041 lt!596910) k0!1142))))

(declare-fun b!1350839 () Bool)

(declare-fun Unit!44141 () Unit!44134)

(assert (=> b!1350839 (= e!768535 Unit!44141)))

(declare-fun b!1350840 () Bool)

(assert (=> b!1350840 (= e!768534 (isDefined!528 (getValueByKey!719 (toList!11041 lt!596910) k0!1142)))))

(assert (= (and d!145129 c!127000) b!1350838))

(assert (= (and d!145129 (not c!127000)) b!1350839))

(assert (= (and d!145129 (not res!895818)) b!1350840))

(declare-fun m!1238257 () Bool)

(assert (=> d!145129 m!1238257))

(declare-fun m!1238259 () Bool)

(assert (=> b!1350838 m!1238259))

(declare-fun m!1238261 () Bool)

(assert (=> b!1350838 m!1238261))

(assert (=> b!1350838 m!1238261))

(declare-fun m!1238263 () Bool)

(assert (=> b!1350838 m!1238263))

(assert (=> b!1350840 m!1238261))

(assert (=> b!1350840 m!1238261))

(assert (=> b!1350840 m!1238263))

(assert (=> b!1350564 d!145129))

(declare-fun d!145131 () Bool)

(assert (=> d!145131 (contains!9234 lt!596910 k0!1142)))

(declare-fun lt!597085 () Unit!44134)

(declare-fun choose!1986 ((_ BitVec 64) (_ BitVec 64) V!55217 ListLongMap!22051) Unit!44134)

(assert (=> d!145131 (= lt!597085 (choose!1986 k0!1142 (select (arr!44506 _keys!1571) from!1960) lt!596909 lt!596910))))

(assert (=> d!145131 (contains!9234 (+!4894 lt!596910 (tuple2!24387 (select (arr!44506 _keys!1571) from!1960) lt!596909)) k0!1142)))

(assert (=> d!145131 (= (lemmaInListMapAfterAddingDiffThenInBefore!405 k0!1142 (select (arr!44506 _keys!1571) from!1960) lt!596909 lt!596910) lt!597085)))

(declare-fun bs!38698 () Bool)

(assert (= bs!38698 d!145131))

(assert (=> bs!38698 m!1237967))

(assert (=> bs!38698 m!1237959))

(declare-fun m!1238265 () Bool)

(assert (=> bs!38698 m!1238265))

(assert (=> bs!38698 m!1237977))

(assert (=> bs!38698 m!1237977))

(assert (=> bs!38698 m!1237979))

(assert (=> b!1350564 d!145131))

(declare-fun b!1350847 () Bool)

(declare-fun e!768541 () Bool)

(assert (=> b!1350847 (= e!768541 tp_is_empty!37585)))

(declare-fun b!1350848 () Bool)

(declare-fun e!768540 () Bool)

(assert (=> b!1350848 (= e!768540 tp_is_empty!37585)))

(declare-fun mapNonEmpty!58104 () Bool)

(declare-fun mapRes!58104 () Bool)

(declare-fun tp!110586 () Bool)

(assert (=> mapNonEmpty!58104 (= mapRes!58104 (and tp!110586 e!768541))))

(declare-fun mapRest!58104 () (Array (_ BitVec 32) ValueCell!17894))

(declare-fun mapValue!58104 () ValueCell!17894)

(declare-fun mapKey!58104 () (_ BitVec 32))

(assert (=> mapNonEmpty!58104 (= mapRest!58095 (store mapRest!58104 mapKey!58104 mapValue!58104))))

(declare-fun mapIsEmpty!58104 () Bool)

(assert (=> mapIsEmpty!58104 mapRes!58104))

(declare-fun condMapEmpty!58104 () Bool)

(declare-fun mapDefault!58104 () ValueCell!17894)

(assert (=> mapNonEmpty!58095 (= condMapEmpty!58104 (= mapRest!58095 ((as const (Array (_ BitVec 32) ValueCell!17894)) mapDefault!58104)))))

(assert (=> mapNonEmpty!58095 (= tp!110570 (and e!768540 mapRes!58104))))

(assert (= (and mapNonEmpty!58095 condMapEmpty!58104) mapIsEmpty!58104))

(assert (= (and mapNonEmpty!58095 (not condMapEmpty!58104)) mapNonEmpty!58104))

(assert (= (and mapNonEmpty!58104 ((_ is ValueCellFull!17894) mapValue!58104)) b!1350847))

(assert (= (and mapNonEmpty!58095 ((_ is ValueCellFull!17894) mapDefault!58104)) b!1350848))

(declare-fun m!1238267 () Bool)

(assert (=> mapNonEmpty!58104 m!1238267))

(declare-fun b_lambda!24705 () Bool)

(assert (= b_lambda!24697 (or (and start!113900 b_free!31585) b_lambda!24705)))

(declare-fun b_lambda!24707 () Bool)

(assert (= b_lambda!24699 (or (and start!113900 b_free!31585) b_lambda!24707)))

(declare-fun b_lambda!24709 () Bool)

(assert (= b_lambda!24703 (or (and start!113900 b_free!31585) b_lambda!24709)))

(declare-fun b_lambda!24711 () Bool)

(assert (= b_lambda!24701 (or (and start!113900 b_free!31585) b_lambda!24711)))

(check-sat (not b!1350715) (not b!1350835) (not b!1350825) (not b!1350791) (not b!1350790) (not d!145125) (not b!1350750) (not b!1350813) (not b!1350784) (not b!1350801) (not b!1350748) (not b_lambda!24709) (not bm!65252) (not d!145107) (not b!1350838) (not b!1350672) (not d!145129) (not d!145103) (not b!1350785) (not b!1350724) (not d!145131) (not b!1350831) (not d!145101) (not bm!65245) (not d!145109) (not bm!65249) (not b!1350795) (not b!1350734) (not d!145111) (not b_lambda!24705) (not b!1350789) tp_is_empty!37585 (not bm!65261) (not b!1350810) (not b!1350836) (not b!1350749) (not d!145127) (not bm!65246) (not bm!65255) (not b!1350817) (not bm!65241) (not b!1350826) (not b!1350840) (not b!1350788) (not b_lambda!24695) (not mapNonEmpty!58104) (not b!1350729) (not b!1350732) (not b_next!31585) (not b!1350670) (not b!1350816) b_and!50989 (not b!1350837) (not bm!65243) (not bm!65257) (not b!1350723) (not bm!65262) (not b!1350792) (not b!1350759) (not bm!65259) (not b!1350814) (not b!1350751) (not b!1350753) (not b!1350735) (not b!1350800) (not b_lambda!24707) (not b!1350733) (not b_lambda!24711) (not b!1350758) (not b!1350834))
(check-sat b_and!50989 (not b_next!31585))
