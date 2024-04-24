; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79488 () Bool)

(assert start!79488)

(declare-fun b_free!17533 () Bool)

(declare-fun b_next!17533 () Bool)

(assert (=> start!79488 (= b_free!17533 (not b_next!17533))))

(declare-fun tp!61040 () Bool)

(declare-fun b_and!28627 () Bool)

(assert (=> start!79488 (= tp!61040 b_and!28627)))

(declare-fun b!932645 () Bool)

(declare-fun e!523837 () Bool)

(declare-datatypes ((array!56079 0))(
  ( (array!56080 (arr!26980 (Array (_ BitVec 32) (_ BitVec 64))) (size!27440 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56079)

(assert (=> b!932645 (= e!523837 (not (bvslt (size!27440 _keys!1487) #b01111111111111111111111111111111)))))

(declare-datatypes ((V!31687 0))(
  ( (V!31688 (val!10071 Int)) )
))
(declare-datatypes ((tuple2!13182 0))(
  ( (tuple2!13183 (_1!6602 (_ BitVec 64)) (_2!6602 V!31687)) )
))
(declare-datatypes ((List!18966 0))(
  ( (Nil!18963) (Cons!18962 (h!20114 tuple2!13182) (t!27035 List!18966)) )
))
(declare-datatypes ((ListLongMap!11881 0))(
  ( (ListLongMap!11882 (toList!5956 List!18966)) )
))
(declare-fun lt!419867 () ListLongMap!11881)

(declare-fun lt!419866 () tuple2!13182)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5020 (ListLongMap!11881 (_ BitVec 64)) Bool)

(declare-fun +!2786 (ListLongMap!11881 tuple2!13182) ListLongMap!11881)

(assert (=> b!932645 (contains!5020 (+!2786 lt!419867 lt!419866) k0!1099)))

(declare-datatypes ((Unit!31437 0))(
  ( (Unit!31438) )
))
(declare-fun lt!419870 () Unit!31437)

(declare-fun lt!419865 () V!31687)

(declare-fun lt!419868 () (_ BitVec 64))

(declare-fun addStillContains!489 (ListLongMap!11881 (_ BitVec 64) V!31687 (_ BitVec 64)) Unit!31437)

(assert (=> b!932645 (= lt!419870 (addStillContains!489 lt!419867 lt!419868 lt!419865 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9539 0))(
  ( (ValueCellFull!9539 (v!12586 V!31687)) (EmptyCell!9539) )
))
(declare-datatypes ((array!56081 0))(
  ( (array!56082 (arr!26981 (Array (_ BitVec 32) ValueCell!9539)) (size!27441 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56081)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31687)

(declare-fun minValue!1173 () V!31687)

(declare-fun getCurrentListMap!3199 (array!56079 array!56081 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) ListLongMap!11881)

(assert (=> b!932645 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2786 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419866))))

(assert (=> b!932645 (= lt!419866 (tuple2!13183 lt!419868 lt!419865))))

(declare-fun get!14199 (ValueCell!9539 V!31687) V!31687)

(declare-fun dynLambda!1583 (Int (_ BitVec 64)) V!31687)

(assert (=> b!932645 (= lt!419865 (get!14199 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419869 () Unit!31437)

(declare-fun lemmaListMapRecursiveValidKeyArray!166 (array!56079 array!56081 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) Unit!31437)

(assert (=> b!932645 (= lt!419869 (lemmaListMapRecursiveValidKeyArray!166 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31818 () Bool)

(declare-fun mapRes!31818 () Bool)

(assert (=> mapIsEmpty!31818 mapRes!31818))

(declare-fun b!932646 () Bool)

(declare-fun res!627872 () Bool)

(declare-fun e!523834 () Bool)

(assert (=> b!932646 (=> (not res!627872) (not e!523834))))

(assert (=> b!932646 (= res!627872 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932647 () Bool)

(declare-fun res!627873 () Bool)

(assert (=> b!932647 (=> (not res!627873) (not e!523834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932647 (= res!627873 (validKeyInArray!0 k0!1099))))

(declare-fun b!932648 () Bool)

(assert (=> b!932648 (= e!523834 e!523837)))

(declare-fun res!627869 () Bool)

(assert (=> b!932648 (=> (not res!627869) (not e!523837))))

(assert (=> b!932648 (= res!627869 (validKeyInArray!0 lt!419868))))

(assert (=> b!932648 (= lt!419868 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932649 () Bool)

(declare-fun res!627871 () Bool)

(declare-fun e!523835 () Bool)

(assert (=> b!932649 (=> (not res!627871) (not e!523835))))

(assert (=> b!932649 (= res!627871 (and (= (size!27441 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27440 _keys!1487) (size!27441 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932650 () Bool)

(declare-fun res!627866 () Bool)

(assert (=> b!932650 (=> (not res!627866) (not e!523835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56079 (_ BitVec 32)) Bool)

(assert (=> b!932650 (= res!627866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31818 () Bool)

(declare-fun tp!61041 () Bool)

(declare-fun e!523832 () Bool)

(assert (=> mapNonEmpty!31818 (= mapRes!31818 (and tp!61041 e!523832))))

(declare-fun mapRest!31818 () (Array (_ BitVec 32) ValueCell!9539))

(declare-fun mapKey!31818 () (_ BitVec 32))

(declare-fun mapValue!31818 () ValueCell!9539)

(assert (=> mapNonEmpty!31818 (= (arr!26981 _values!1231) (store mapRest!31818 mapKey!31818 mapValue!31818))))

(declare-fun b!932651 () Bool)

(declare-fun res!627865 () Bool)

(assert (=> b!932651 (=> (not res!627865) (not e!523834))))

(declare-fun v!791 () V!31687)

(declare-fun apply!785 (ListLongMap!11881 (_ BitVec 64)) V!31687)

(assert (=> b!932651 (= res!627865 (= (apply!785 lt!419867 k0!1099) v!791))))

(declare-fun b!932652 () Bool)

(assert (=> b!932652 (= e!523835 e!523834)))

(declare-fun res!627867 () Bool)

(assert (=> b!932652 (=> (not res!627867) (not e!523834))))

(assert (=> b!932652 (= res!627867 (contains!5020 lt!419867 k0!1099))))

(assert (=> b!932652 (= lt!419867 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932653 () Bool)

(declare-fun res!627868 () Bool)

(assert (=> b!932653 (=> (not res!627868) (not e!523835))))

(assert (=> b!932653 (= res!627868 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27440 _keys!1487))))))

(declare-fun res!627870 () Bool)

(assert (=> start!79488 (=> (not res!627870) (not e!523835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79488 (= res!627870 (validMask!0 mask!1881))))

(assert (=> start!79488 e!523835))

(assert (=> start!79488 true))

(declare-fun tp_is_empty!20041 () Bool)

(assert (=> start!79488 tp_is_empty!20041))

(declare-fun e!523831 () Bool)

(declare-fun array_inv!21086 (array!56081) Bool)

(assert (=> start!79488 (and (array_inv!21086 _values!1231) e!523831)))

(assert (=> start!79488 tp!61040))

(declare-fun array_inv!21087 (array!56079) Bool)

(assert (=> start!79488 (array_inv!21087 _keys!1487)))

(declare-fun b!932654 () Bool)

(declare-fun res!627864 () Bool)

(assert (=> b!932654 (=> (not res!627864) (not e!523835))))

(declare-datatypes ((List!18967 0))(
  ( (Nil!18964) (Cons!18963 (h!20115 (_ BitVec 64)) (t!27036 List!18967)) )
))
(declare-fun arrayNoDuplicates!0 (array!56079 (_ BitVec 32) List!18967) Bool)

(assert (=> b!932654 (= res!627864 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18964))))

(declare-fun b!932655 () Bool)

(declare-fun e!523836 () Bool)

(assert (=> b!932655 (= e!523831 (and e!523836 mapRes!31818))))

(declare-fun condMapEmpty!31818 () Bool)

(declare-fun mapDefault!31818 () ValueCell!9539)

(assert (=> b!932655 (= condMapEmpty!31818 (= (arr!26981 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9539)) mapDefault!31818)))))

(declare-fun b!932656 () Bool)

(assert (=> b!932656 (= e!523832 tp_is_empty!20041)))

(declare-fun b!932657 () Bool)

(assert (=> b!932657 (= e!523836 tp_is_empty!20041)))

(assert (= (and start!79488 res!627870) b!932649))

(assert (= (and b!932649 res!627871) b!932650))

(assert (= (and b!932650 res!627866) b!932654))

(assert (= (and b!932654 res!627864) b!932653))

(assert (= (and b!932653 res!627868) b!932652))

(assert (= (and b!932652 res!627867) b!932651))

(assert (= (and b!932651 res!627865) b!932646))

(assert (= (and b!932646 res!627872) b!932647))

(assert (= (and b!932647 res!627873) b!932648))

(assert (= (and b!932648 res!627869) b!932645))

(assert (= (and b!932655 condMapEmpty!31818) mapIsEmpty!31818))

(assert (= (and b!932655 (not condMapEmpty!31818)) mapNonEmpty!31818))

(get-info :version)

(assert (= (and mapNonEmpty!31818 ((_ is ValueCellFull!9539) mapValue!31818)) b!932656))

(assert (= (and b!932655 ((_ is ValueCellFull!9539) mapDefault!31818)) b!932657))

(assert (= start!79488 b!932655))

(declare-fun b_lambda!13863 () Bool)

(assert (=> (not b_lambda!13863) (not b!932645)))

(declare-fun t!27034 () Bool)

(declare-fun tb!5919 () Bool)

(assert (=> (and start!79488 (= defaultEntry!1235 defaultEntry!1235) t!27034) tb!5919))

(declare-fun result!11669 () Bool)

(assert (=> tb!5919 (= result!11669 tp_is_empty!20041)))

(assert (=> b!932645 t!27034))

(declare-fun b_and!28629 () Bool)

(assert (= b_and!28627 (and (=> t!27034 result!11669) b_and!28629)))

(declare-fun m!866899 () Bool)

(assert (=> b!932652 m!866899))

(declare-fun m!866901 () Bool)

(assert (=> b!932652 m!866901))

(declare-fun m!866903 () Bool)

(assert (=> start!79488 m!866903))

(declare-fun m!866905 () Bool)

(assert (=> start!79488 m!866905))

(declare-fun m!866907 () Bool)

(assert (=> start!79488 m!866907))

(declare-fun m!866909 () Bool)

(assert (=> b!932650 m!866909))

(declare-fun m!866911 () Bool)

(assert (=> b!932647 m!866911))

(declare-fun m!866913 () Bool)

(assert (=> mapNonEmpty!31818 m!866913))

(declare-fun m!866915 () Bool)

(assert (=> b!932645 m!866915))

(declare-fun m!866917 () Bool)

(assert (=> b!932645 m!866917))

(declare-fun m!866919 () Bool)

(assert (=> b!932645 m!866919))

(declare-fun m!866921 () Bool)

(assert (=> b!932645 m!866921))

(declare-fun m!866923 () Bool)

(assert (=> b!932645 m!866923))

(declare-fun m!866925 () Bool)

(assert (=> b!932645 m!866925))

(declare-fun m!866927 () Bool)

(assert (=> b!932645 m!866927))

(declare-fun m!866929 () Bool)

(assert (=> b!932645 m!866929))

(declare-fun m!866931 () Bool)

(assert (=> b!932645 m!866931))

(assert (=> b!932645 m!866915))

(assert (=> b!932645 m!866925))

(declare-fun m!866933 () Bool)

(assert (=> b!932645 m!866933))

(assert (=> b!932645 m!866927))

(assert (=> b!932645 m!866919))

(declare-fun m!866935 () Bool)

(assert (=> b!932654 m!866935))

(declare-fun m!866937 () Bool)

(assert (=> b!932648 m!866937))

(declare-fun m!866939 () Bool)

(assert (=> b!932648 m!866939))

(declare-fun m!866941 () Bool)

(assert (=> b!932651 m!866941))

(check-sat (not b!932650) (not b_next!17533) (not start!79488) b_and!28629 (not b!932652) (not b!932645) (not mapNonEmpty!31818) (not b!932648) (not b!932654) tp_is_empty!20041 (not b!932651) (not b!932647) (not b_lambda!13863))
(check-sat b_and!28629 (not b_next!17533))
(get-model)

(declare-fun b_lambda!13869 () Bool)

(assert (= b_lambda!13863 (or (and start!79488 b_free!17533) b_lambda!13869)))

(check-sat (not b!932650) (not b_next!17533) (not start!79488) (not b_lambda!13869) b_and!28629 (not b!932652) (not b!932645) (not mapNonEmpty!31818) (not b!932648) (not b!932654) tp_is_empty!20041 (not b!932651) (not b!932647))
(check-sat b_and!28629 (not b_next!17533))
(get-model)

(declare-fun d!113349 () Bool)

(assert (=> d!113349 (= (validKeyInArray!0 lt!419868) (and (not (= lt!419868 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!419868 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!932648 d!113349))

(declare-fun d!113351 () Bool)

(declare-fun e!523885 () Bool)

(assert (=> d!113351 e!523885))

(declare-fun res!627936 () Bool)

(assert (=> d!113351 (=> res!627936 e!523885)))

(declare-fun lt!419917 () Bool)

(assert (=> d!113351 (= res!627936 (not lt!419917))))

(declare-fun lt!419918 () Bool)

(assert (=> d!113351 (= lt!419917 lt!419918)))

(declare-fun lt!419915 () Unit!31437)

(declare-fun e!523884 () Unit!31437)

(assert (=> d!113351 (= lt!419915 e!523884)))

(declare-fun c!97317 () Bool)

(assert (=> d!113351 (= c!97317 lt!419918)))

(declare-fun containsKey!447 (List!18966 (_ BitVec 64)) Bool)

(assert (=> d!113351 (= lt!419918 (containsKey!447 (toList!5956 lt!419867) k0!1099))))

(assert (=> d!113351 (= (contains!5020 lt!419867 k0!1099) lt!419917)))

(declare-fun b!932748 () Bool)

(declare-fun lt!419916 () Unit!31437)

(assert (=> b!932748 (= e!523884 lt!419916)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!341 (List!18966 (_ BitVec 64)) Unit!31437)

(assert (=> b!932748 (= lt!419916 (lemmaContainsKeyImpliesGetValueByKeyDefined!341 (toList!5956 lt!419867) k0!1099))))

(declare-datatypes ((Option!482 0))(
  ( (Some!481 (v!12589 V!31687)) (None!480) )
))
(declare-fun isDefined!349 (Option!482) Bool)

(declare-fun getValueByKey!476 (List!18966 (_ BitVec 64)) Option!482)

(assert (=> b!932748 (isDefined!349 (getValueByKey!476 (toList!5956 lt!419867) k0!1099))))

(declare-fun b!932749 () Bool)

(declare-fun Unit!31441 () Unit!31437)

(assert (=> b!932749 (= e!523884 Unit!31441)))

(declare-fun b!932750 () Bool)

(assert (=> b!932750 (= e!523885 (isDefined!349 (getValueByKey!476 (toList!5956 lt!419867) k0!1099)))))

(assert (= (and d!113351 c!97317) b!932748))

(assert (= (and d!113351 (not c!97317)) b!932749))

(assert (= (and d!113351 (not res!627936)) b!932750))

(declare-fun m!867031 () Bool)

(assert (=> d!113351 m!867031))

(declare-fun m!867033 () Bool)

(assert (=> b!932748 m!867033))

(declare-fun m!867035 () Bool)

(assert (=> b!932748 m!867035))

(assert (=> b!932748 m!867035))

(declare-fun m!867037 () Bool)

(assert (=> b!932748 m!867037))

(assert (=> b!932750 m!867035))

(assert (=> b!932750 m!867035))

(assert (=> b!932750 m!867037))

(assert (=> b!932652 d!113351))

(declare-fun b!932793 () Bool)

(declare-fun e!523916 () ListLongMap!11881)

(declare-fun call!40611 () ListLongMap!11881)

(assert (=> b!932793 (= e!523916 call!40611)))

(declare-fun b!932794 () Bool)

(declare-fun res!627962 () Bool)

(declare-fun e!523913 () Bool)

(assert (=> b!932794 (=> (not res!627962) (not e!523913))))

(declare-fun e!523918 () Bool)

(assert (=> b!932794 (= res!627962 e!523918)))

(declare-fun res!627957 () Bool)

(assert (=> b!932794 (=> res!627957 e!523918)))

(declare-fun e!523922 () Bool)

(assert (=> b!932794 (= res!627957 (not e!523922))))

(declare-fun res!627963 () Bool)

(assert (=> b!932794 (=> (not res!627963) (not e!523922))))

(assert (=> b!932794 (= res!627963 (bvslt from!1844 (size!27440 _keys!1487)))))

(declare-fun b!932795 () Bool)

(declare-fun e!523919 () Bool)

(declare-fun e!523912 () Bool)

(assert (=> b!932795 (= e!523919 e!523912)))

(declare-fun res!627960 () Bool)

(declare-fun call!40613 () Bool)

(assert (=> b!932795 (= res!627960 call!40613)))

(assert (=> b!932795 (=> (not res!627960) (not e!523912))))

(declare-fun b!932796 () Bool)

(assert (=> b!932796 (= e!523922 (validKeyInArray!0 (select (arr!26980 _keys!1487) from!1844)))))

(declare-fun bm!40606 () Bool)

(declare-fun call!40615 () ListLongMap!11881)

(declare-fun call!40609 () ListLongMap!11881)

(assert (=> bm!40606 (= call!40615 call!40609)))

(declare-fun call!40610 () ListLongMap!11881)

(declare-fun bm!40607 () Bool)

(declare-fun c!97332 () Bool)

(declare-fun c!97330 () Bool)

(assert (=> bm!40607 (= call!40610 (+!2786 (ite c!97332 call!40609 (ite c!97330 call!40615 call!40611)) (ite (or c!97332 c!97330) (tuple2!13183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!932797 () Bool)

(declare-fun call!40614 () ListLongMap!11881)

(assert (=> b!932797 (= e!523916 call!40614)))

(declare-fun b!932798 () Bool)

(declare-fun res!627955 () Bool)

(assert (=> b!932798 (=> (not res!627955) (not e!523913))))

(declare-fun e!523915 () Bool)

(assert (=> b!932798 (= res!627955 e!523915)))

(declare-fun c!97334 () Bool)

(assert (=> b!932798 (= c!97334 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!932799 () Bool)

(declare-fun e!523924 () Bool)

(declare-fun lt!419982 () ListLongMap!11881)

(assert (=> b!932799 (= e!523924 (= (apply!785 lt!419982 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!932800 () Bool)

(declare-fun e!523921 () Unit!31437)

(declare-fun lt!419981 () Unit!31437)

(assert (=> b!932800 (= e!523921 lt!419981)))

(declare-fun lt!419966 () ListLongMap!11881)

(declare-fun getCurrentListMapNoExtraKeys!3342 (array!56079 array!56081 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) ListLongMap!11881)

(assert (=> b!932800 (= lt!419966 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419965 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419968 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419968 (select (arr!26980 _keys!1487) from!1844))))

(declare-fun lt!419967 () Unit!31437)

(assert (=> b!932800 (= lt!419967 (addStillContains!489 lt!419966 lt!419965 zeroValue!1173 lt!419968))))

(assert (=> b!932800 (contains!5020 (+!2786 lt!419966 (tuple2!13183 lt!419965 zeroValue!1173)) lt!419968)))

(declare-fun lt!419978 () Unit!31437)

(assert (=> b!932800 (= lt!419978 lt!419967)))

(declare-fun lt!419963 () ListLongMap!11881)

(assert (=> b!932800 (= lt!419963 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419984 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419984 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419979 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419979 (select (arr!26980 _keys!1487) from!1844))))

(declare-fun lt!419973 () Unit!31437)

(declare-fun addApplyDifferent!416 (ListLongMap!11881 (_ BitVec 64) V!31687 (_ BitVec 64)) Unit!31437)

(assert (=> b!932800 (= lt!419973 (addApplyDifferent!416 lt!419963 lt!419984 minValue!1173 lt!419979))))

(assert (=> b!932800 (= (apply!785 (+!2786 lt!419963 (tuple2!13183 lt!419984 minValue!1173)) lt!419979) (apply!785 lt!419963 lt!419979))))

(declare-fun lt!419976 () Unit!31437)

(assert (=> b!932800 (= lt!419976 lt!419973)))

(declare-fun lt!419969 () ListLongMap!11881)

(assert (=> b!932800 (= lt!419969 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419980 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419970 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419970 (select (arr!26980 _keys!1487) from!1844))))

(declare-fun lt!419983 () Unit!31437)

(assert (=> b!932800 (= lt!419983 (addApplyDifferent!416 lt!419969 lt!419980 zeroValue!1173 lt!419970))))

(assert (=> b!932800 (= (apply!785 (+!2786 lt!419969 (tuple2!13183 lt!419980 zeroValue!1173)) lt!419970) (apply!785 lt!419969 lt!419970))))

(declare-fun lt!419974 () Unit!31437)

(assert (=> b!932800 (= lt!419974 lt!419983)))

(declare-fun lt!419972 () ListLongMap!11881)

(assert (=> b!932800 (= lt!419972 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419964 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419975 () (_ BitVec 64))

(assert (=> b!932800 (= lt!419975 (select (arr!26980 _keys!1487) from!1844))))

(assert (=> b!932800 (= lt!419981 (addApplyDifferent!416 lt!419972 lt!419964 minValue!1173 lt!419975))))

(assert (=> b!932800 (= (apply!785 (+!2786 lt!419972 (tuple2!13183 lt!419964 minValue!1173)) lt!419975) (apply!785 lt!419972 lt!419975))))

(declare-fun bm!40608 () Bool)

(assert (=> bm!40608 (= call!40613 (contains!5020 lt!419982 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!932801 () Bool)

(declare-fun Unit!31442 () Unit!31437)

(assert (=> b!932801 (= e!523921 Unit!31442)))

(declare-fun b!932802 () Bool)

(assert (=> b!932802 (= e!523915 e!523924)))

(declare-fun res!627961 () Bool)

(declare-fun call!40612 () Bool)

(assert (=> b!932802 (= res!627961 call!40612)))

(assert (=> b!932802 (=> (not res!627961) (not e!523924))))

(declare-fun b!932803 () Bool)

(declare-fun c!97331 () Bool)

(assert (=> b!932803 (= c!97331 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!523923 () ListLongMap!11881)

(assert (=> b!932803 (= e!523923 e!523916)))

(declare-fun bm!40609 () Bool)

(assert (=> bm!40609 (= call!40611 call!40615)))

(declare-fun bm!40610 () Bool)

(assert (=> bm!40610 (= call!40609 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932804 () Bool)

(declare-fun e!523917 () Bool)

(assert (=> b!932804 (= e!523918 e!523917)))

(declare-fun res!627956 () Bool)

(assert (=> b!932804 (=> (not res!627956) (not e!523917))))

(assert (=> b!932804 (= res!627956 (contains!5020 lt!419982 (select (arr!26980 _keys!1487) from!1844)))))

(assert (=> b!932804 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27440 _keys!1487)))))

(declare-fun b!932805 () Bool)

(declare-fun e!523914 () Bool)

(assert (=> b!932805 (= e!523914 (validKeyInArray!0 (select (arr!26980 _keys!1487) from!1844)))))

(declare-fun b!932806 () Bool)

(assert (=> b!932806 (= e!523912 (= (apply!785 lt!419982 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!932807 () Bool)

(assert (=> b!932807 (= e!523913 e!523919)))

(declare-fun c!97333 () Bool)

(assert (=> b!932807 (= c!97333 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!932808 () Bool)

(declare-fun e!523920 () ListLongMap!11881)

(assert (=> b!932808 (= e!523920 e!523923)))

(assert (=> b!932808 (= c!97330 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!932809 () Bool)

(assert (=> b!932809 (= e!523917 (= (apply!785 lt!419982 (select (arr!26980 _keys!1487) from!1844)) (get!14199 (select (arr!26981 _values!1231) from!1844) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!932809 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27441 _values!1231)))))

(assert (=> b!932809 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27440 _keys!1487)))))

(declare-fun b!932810 () Bool)

(assert (=> b!932810 (= e!523915 (not call!40612))))

(declare-fun bm!40611 () Bool)

(assert (=> bm!40611 (= call!40614 call!40610)))

(declare-fun b!932811 () Bool)

(assert (=> b!932811 (= e!523919 (not call!40613))))

(declare-fun bm!40612 () Bool)

(assert (=> bm!40612 (= call!40612 (contains!5020 lt!419982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113353 () Bool)

(assert (=> d!113353 e!523913))

(declare-fun res!627958 () Bool)

(assert (=> d!113353 (=> (not res!627958) (not e!523913))))

(assert (=> d!113353 (= res!627958 (or (bvsge from!1844 (size!27440 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27440 _keys!1487)))))))

(declare-fun lt!419971 () ListLongMap!11881)

(assert (=> d!113353 (= lt!419982 lt!419971)))

(declare-fun lt!419977 () Unit!31437)

(assert (=> d!113353 (= lt!419977 e!523921)))

(declare-fun c!97335 () Bool)

(assert (=> d!113353 (= c!97335 e!523914)))

(declare-fun res!627959 () Bool)

(assert (=> d!113353 (=> (not res!627959) (not e!523914))))

(assert (=> d!113353 (= res!627959 (bvslt from!1844 (size!27440 _keys!1487)))))

(assert (=> d!113353 (= lt!419971 e!523920)))

(assert (=> d!113353 (= c!97332 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113353 (validMask!0 mask!1881)))

(assert (=> d!113353 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!419982)))

(declare-fun b!932812 () Bool)

(assert (=> b!932812 (= e!523923 call!40614)))

(declare-fun b!932813 () Bool)

(assert (=> b!932813 (= e!523920 (+!2786 call!40610 (tuple2!13183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113353 c!97332) b!932813))

(assert (= (and d!113353 (not c!97332)) b!932808))

(assert (= (and b!932808 c!97330) b!932812))

(assert (= (and b!932808 (not c!97330)) b!932803))

(assert (= (and b!932803 c!97331) b!932797))

(assert (= (and b!932803 (not c!97331)) b!932793))

(assert (= (or b!932797 b!932793) bm!40609))

(assert (= (or b!932812 bm!40609) bm!40606))

(assert (= (or b!932812 b!932797) bm!40611))

(assert (= (or b!932813 bm!40606) bm!40610))

(assert (= (or b!932813 bm!40611) bm!40607))

(assert (= (and d!113353 res!627959) b!932805))

(assert (= (and d!113353 c!97335) b!932800))

(assert (= (and d!113353 (not c!97335)) b!932801))

(assert (= (and d!113353 res!627958) b!932794))

(assert (= (and b!932794 res!627963) b!932796))

(assert (= (and b!932794 (not res!627957)) b!932804))

(assert (= (and b!932804 res!627956) b!932809))

(assert (= (and b!932794 res!627962) b!932798))

(assert (= (and b!932798 c!97334) b!932802))

(assert (= (and b!932798 (not c!97334)) b!932810))

(assert (= (and b!932802 res!627961) b!932799))

(assert (= (or b!932802 b!932810) bm!40612))

(assert (= (and b!932798 res!627955) b!932807))

(assert (= (and b!932807 c!97333) b!932795))

(assert (= (and b!932807 (not c!97333)) b!932811))

(assert (= (and b!932795 res!627960) b!932806))

(assert (= (or b!932795 b!932811) bm!40608))

(declare-fun b_lambda!13871 () Bool)

(assert (=> (not b_lambda!13871) (not b!932809)))

(assert (=> b!932809 t!27034))

(declare-fun b_and!28639 () Bool)

(assert (= b_and!28629 (and (=> t!27034 result!11669) b_and!28639)))

(declare-fun m!867039 () Bool)

(assert (=> b!932804 m!867039))

(assert (=> b!932804 m!867039))

(declare-fun m!867041 () Bool)

(assert (=> b!932804 m!867041))

(assert (=> b!932809 m!866925))

(declare-fun m!867043 () Bool)

(assert (=> b!932809 m!867043))

(assert (=> b!932809 m!867039))

(assert (=> b!932809 m!867043))

(assert (=> b!932809 m!866925))

(declare-fun m!867045 () Bool)

(assert (=> b!932809 m!867045))

(assert (=> b!932809 m!867039))

(declare-fun m!867047 () Bool)

(assert (=> b!932809 m!867047))

(declare-fun m!867049 () Bool)

(assert (=> bm!40612 m!867049))

(assert (=> b!932805 m!867039))

(assert (=> b!932805 m!867039))

(declare-fun m!867051 () Bool)

(assert (=> b!932805 m!867051))

(declare-fun m!867053 () Bool)

(assert (=> b!932799 m!867053))

(declare-fun m!867055 () Bool)

(assert (=> bm!40608 m!867055))

(declare-fun m!867057 () Bool)

(assert (=> b!932806 m!867057))

(declare-fun m!867059 () Bool)

(assert (=> b!932813 m!867059))

(declare-fun m!867061 () Bool)

(assert (=> b!932800 m!867061))

(assert (=> b!932800 m!867039))

(declare-fun m!867063 () Bool)

(assert (=> b!932800 m!867063))

(declare-fun m!867065 () Bool)

(assert (=> b!932800 m!867065))

(declare-fun m!867067 () Bool)

(assert (=> b!932800 m!867067))

(declare-fun m!867069 () Bool)

(assert (=> b!932800 m!867069))

(assert (=> b!932800 m!867063))

(declare-fun m!867071 () Bool)

(assert (=> b!932800 m!867071))

(declare-fun m!867073 () Bool)

(assert (=> b!932800 m!867073))

(declare-fun m!867075 () Bool)

(assert (=> b!932800 m!867075))

(assert (=> b!932800 m!867067))

(declare-fun m!867077 () Bool)

(assert (=> b!932800 m!867077))

(declare-fun m!867079 () Bool)

(assert (=> b!932800 m!867079))

(assert (=> b!932800 m!867061))

(declare-fun m!867081 () Bool)

(assert (=> b!932800 m!867081))

(declare-fun m!867083 () Bool)

(assert (=> b!932800 m!867083))

(declare-fun m!867085 () Bool)

(assert (=> b!932800 m!867085))

(declare-fun m!867087 () Bool)

(assert (=> b!932800 m!867087))

(assert (=> b!932800 m!867085))

(declare-fun m!867089 () Bool)

(assert (=> b!932800 m!867089))

(declare-fun m!867091 () Bool)

(assert (=> b!932800 m!867091))

(assert (=> bm!40610 m!867079))

(assert (=> d!113353 m!866903))

(assert (=> b!932796 m!867039))

(assert (=> b!932796 m!867039))

(assert (=> b!932796 m!867051))

(declare-fun m!867093 () Bool)

(assert (=> bm!40607 m!867093))

(assert (=> b!932652 d!113353))

(declare-fun d!113355 () Bool)

(assert (=> d!113355 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!932647 d!113355))

(declare-fun b!932814 () Bool)

(declare-fun e!523929 () ListLongMap!11881)

(declare-fun call!40618 () ListLongMap!11881)

(assert (=> b!932814 (= e!523929 call!40618)))

(declare-fun b!932815 () Bool)

(declare-fun res!627971 () Bool)

(declare-fun e!523926 () Bool)

(assert (=> b!932815 (=> (not res!627971) (not e!523926))))

(declare-fun e!523931 () Bool)

(assert (=> b!932815 (= res!627971 e!523931)))

(declare-fun res!627966 () Bool)

(assert (=> b!932815 (=> res!627966 e!523931)))

(declare-fun e!523935 () Bool)

(assert (=> b!932815 (= res!627966 (not e!523935))))

(declare-fun res!627972 () Bool)

(assert (=> b!932815 (=> (not res!627972) (not e!523935))))

(assert (=> b!932815 (= res!627972 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)))))

(declare-fun b!932816 () Bool)

(declare-fun e!523932 () Bool)

(declare-fun e!523925 () Bool)

(assert (=> b!932816 (= e!523932 e!523925)))

(declare-fun res!627969 () Bool)

(declare-fun call!40620 () Bool)

(assert (=> b!932816 (= res!627969 call!40620)))

(assert (=> b!932816 (=> (not res!627969) (not e!523925))))

(declare-fun b!932817 () Bool)

(assert (=> b!932817 (= e!523935 (validKeyInArray!0 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40613 () Bool)

(declare-fun call!40622 () ListLongMap!11881)

(declare-fun call!40616 () ListLongMap!11881)

(assert (=> bm!40613 (= call!40622 call!40616)))

(declare-fun c!97338 () Bool)

(declare-fun call!40617 () ListLongMap!11881)

(declare-fun c!97336 () Bool)

(declare-fun bm!40614 () Bool)

(assert (=> bm!40614 (= call!40617 (+!2786 (ite c!97338 call!40616 (ite c!97336 call!40622 call!40618)) (ite (or c!97338 c!97336) (tuple2!13183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!932818 () Bool)

(declare-fun call!40621 () ListLongMap!11881)

(assert (=> b!932818 (= e!523929 call!40621)))

(declare-fun b!932819 () Bool)

(declare-fun res!627964 () Bool)

(assert (=> b!932819 (=> (not res!627964) (not e!523926))))

(declare-fun e!523928 () Bool)

(assert (=> b!932819 (= res!627964 e!523928)))

(declare-fun c!97340 () Bool)

(assert (=> b!932819 (= c!97340 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!932820 () Bool)

(declare-fun e!523937 () Bool)

(declare-fun lt!420004 () ListLongMap!11881)

(assert (=> b!932820 (= e!523937 (= (apply!785 lt!420004 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!932821 () Bool)

(declare-fun e!523934 () Unit!31437)

(declare-fun lt!420003 () Unit!31437)

(assert (=> b!932821 (= e!523934 lt!420003)))

(declare-fun lt!419988 () ListLongMap!11881)

(assert (=> b!932821 (= lt!419988 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419987 () (_ BitVec 64))

(assert (=> b!932821 (= lt!419987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419990 () (_ BitVec 64))

(assert (=> b!932821 (= lt!419990 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419989 () Unit!31437)

(assert (=> b!932821 (= lt!419989 (addStillContains!489 lt!419988 lt!419987 zeroValue!1173 lt!419990))))

(assert (=> b!932821 (contains!5020 (+!2786 lt!419988 (tuple2!13183 lt!419987 zeroValue!1173)) lt!419990)))

(declare-fun lt!420000 () Unit!31437)

(assert (=> b!932821 (= lt!420000 lt!419989)))

(declare-fun lt!419985 () ListLongMap!11881)

(assert (=> b!932821 (= lt!419985 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420006 () (_ BitVec 64))

(assert (=> b!932821 (= lt!420006 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420001 () (_ BitVec 64))

(assert (=> b!932821 (= lt!420001 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419995 () Unit!31437)

(assert (=> b!932821 (= lt!419995 (addApplyDifferent!416 lt!419985 lt!420006 minValue!1173 lt!420001))))

(assert (=> b!932821 (= (apply!785 (+!2786 lt!419985 (tuple2!13183 lt!420006 minValue!1173)) lt!420001) (apply!785 lt!419985 lt!420001))))

(declare-fun lt!419998 () Unit!31437)

(assert (=> b!932821 (= lt!419998 lt!419995)))

(declare-fun lt!419991 () ListLongMap!11881)

(assert (=> b!932821 (= lt!419991 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420002 () (_ BitVec 64))

(assert (=> b!932821 (= lt!420002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419992 () (_ BitVec 64))

(assert (=> b!932821 (= lt!419992 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420005 () Unit!31437)

(assert (=> b!932821 (= lt!420005 (addApplyDifferent!416 lt!419991 lt!420002 zeroValue!1173 lt!419992))))

(assert (=> b!932821 (= (apply!785 (+!2786 lt!419991 (tuple2!13183 lt!420002 zeroValue!1173)) lt!419992) (apply!785 lt!419991 lt!419992))))

(declare-fun lt!419996 () Unit!31437)

(assert (=> b!932821 (= lt!419996 lt!420005)))

(declare-fun lt!419994 () ListLongMap!11881)

(assert (=> b!932821 (= lt!419994 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419986 () (_ BitVec 64))

(assert (=> b!932821 (= lt!419986 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419997 () (_ BitVec 64))

(assert (=> b!932821 (= lt!419997 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!932821 (= lt!420003 (addApplyDifferent!416 lt!419994 lt!419986 minValue!1173 lt!419997))))

(assert (=> b!932821 (= (apply!785 (+!2786 lt!419994 (tuple2!13183 lt!419986 minValue!1173)) lt!419997) (apply!785 lt!419994 lt!419997))))

(declare-fun bm!40615 () Bool)

(assert (=> bm!40615 (= call!40620 (contains!5020 lt!420004 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!932822 () Bool)

(declare-fun Unit!31443 () Unit!31437)

(assert (=> b!932822 (= e!523934 Unit!31443)))

(declare-fun b!932823 () Bool)

(assert (=> b!932823 (= e!523928 e!523937)))

(declare-fun res!627970 () Bool)

(declare-fun call!40619 () Bool)

(assert (=> b!932823 (= res!627970 call!40619)))

(assert (=> b!932823 (=> (not res!627970) (not e!523937))))

(declare-fun b!932824 () Bool)

(declare-fun c!97337 () Bool)

(assert (=> b!932824 (= c!97337 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!523936 () ListLongMap!11881)

(assert (=> b!932824 (= e!523936 e!523929)))

(declare-fun bm!40616 () Bool)

(assert (=> bm!40616 (= call!40618 call!40622)))

(declare-fun bm!40617 () Bool)

(assert (=> bm!40617 (= call!40616 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932825 () Bool)

(declare-fun e!523930 () Bool)

(assert (=> b!932825 (= e!523931 e!523930)))

(declare-fun res!627965 () Bool)

(assert (=> b!932825 (=> (not res!627965) (not e!523930))))

(assert (=> b!932825 (= res!627965 (contains!5020 lt!420004 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!932825 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)))))

(declare-fun b!932826 () Bool)

(declare-fun e!523927 () Bool)

(assert (=> b!932826 (= e!523927 (validKeyInArray!0 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!932827 () Bool)

(assert (=> b!932827 (= e!523925 (= (apply!785 lt!420004 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!932828 () Bool)

(assert (=> b!932828 (= e!523926 e!523932)))

(declare-fun c!97339 () Bool)

(assert (=> b!932828 (= c!97339 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!932829 () Bool)

(declare-fun e!523933 () ListLongMap!11881)

(assert (=> b!932829 (= e!523933 e!523936)))

(assert (=> b!932829 (= c!97336 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!932830 () Bool)

(assert (=> b!932830 (= e!523930 (= (apply!785 lt!420004 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14199 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!932830 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27441 _values!1231)))))

(assert (=> b!932830 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)))))

(declare-fun b!932831 () Bool)

(assert (=> b!932831 (= e!523928 (not call!40619))))

(declare-fun bm!40618 () Bool)

(assert (=> bm!40618 (= call!40621 call!40617)))

(declare-fun b!932832 () Bool)

(assert (=> b!932832 (= e!523932 (not call!40620))))

(declare-fun bm!40619 () Bool)

(assert (=> bm!40619 (= call!40619 (contains!5020 lt!420004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113357 () Bool)

(assert (=> d!113357 e!523926))

(declare-fun res!627967 () Bool)

(assert (=> d!113357 (=> (not res!627967) (not e!523926))))

(assert (=> d!113357 (= res!627967 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)))))))

(declare-fun lt!419993 () ListLongMap!11881)

(assert (=> d!113357 (= lt!420004 lt!419993)))

(declare-fun lt!419999 () Unit!31437)

(assert (=> d!113357 (= lt!419999 e!523934)))

(declare-fun c!97341 () Bool)

(assert (=> d!113357 (= c!97341 e!523927)))

(declare-fun res!627968 () Bool)

(assert (=> d!113357 (=> (not res!627968) (not e!523927))))

(assert (=> d!113357 (= res!627968 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)))))

(assert (=> d!113357 (= lt!419993 e!523933)))

(assert (=> d!113357 (= c!97338 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113357 (validMask!0 mask!1881)))

(assert (=> d!113357 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420004)))

(declare-fun b!932833 () Bool)

(assert (=> b!932833 (= e!523936 call!40621)))

(declare-fun b!932834 () Bool)

(assert (=> b!932834 (= e!523933 (+!2786 call!40617 (tuple2!13183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113357 c!97338) b!932834))

(assert (= (and d!113357 (not c!97338)) b!932829))

(assert (= (and b!932829 c!97336) b!932833))

(assert (= (and b!932829 (not c!97336)) b!932824))

(assert (= (and b!932824 c!97337) b!932818))

(assert (= (and b!932824 (not c!97337)) b!932814))

(assert (= (or b!932818 b!932814) bm!40616))

(assert (= (or b!932833 bm!40616) bm!40613))

(assert (= (or b!932833 b!932818) bm!40618))

(assert (= (or b!932834 bm!40613) bm!40617))

(assert (= (or b!932834 bm!40618) bm!40614))

(assert (= (and d!113357 res!627968) b!932826))

(assert (= (and d!113357 c!97341) b!932821))

(assert (= (and d!113357 (not c!97341)) b!932822))

(assert (= (and d!113357 res!627967) b!932815))

(assert (= (and b!932815 res!627972) b!932817))

(assert (= (and b!932815 (not res!627966)) b!932825))

(assert (= (and b!932825 res!627965) b!932830))

(assert (= (and b!932815 res!627971) b!932819))

(assert (= (and b!932819 c!97340) b!932823))

(assert (= (and b!932819 (not c!97340)) b!932831))

(assert (= (and b!932823 res!627970) b!932820))

(assert (= (or b!932823 b!932831) bm!40619))

(assert (= (and b!932819 res!627964) b!932828))

(assert (= (and b!932828 c!97339) b!932816))

(assert (= (and b!932828 (not c!97339)) b!932832))

(assert (= (and b!932816 res!627969) b!932827))

(assert (= (or b!932816 b!932832) bm!40615))

(declare-fun b_lambda!13873 () Bool)

(assert (=> (not b_lambda!13873) (not b!932830)))

(assert (=> b!932830 t!27034))

(declare-fun b_and!28641 () Bool)

(assert (= b_and!28639 (and (=> t!27034 result!11669) b_and!28641)))

(assert (=> b!932825 m!866939))

(assert (=> b!932825 m!866939))

(declare-fun m!867095 () Bool)

(assert (=> b!932825 m!867095))

(assert (=> b!932830 m!866925))

(assert (=> b!932830 m!866915))

(assert (=> b!932830 m!866939))

(assert (=> b!932830 m!866915))

(assert (=> b!932830 m!866925))

(assert (=> b!932830 m!866933))

(assert (=> b!932830 m!866939))

(declare-fun m!867097 () Bool)

(assert (=> b!932830 m!867097))

(declare-fun m!867099 () Bool)

(assert (=> bm!40619 m!867099))

(assert (=> b!932826 m!866939))

(assert (=> b!932826 m!866939))

(declare-fun m!867101 () Bool)

(assert (=> b!932826 m!867101))

(declare-fun m!867103 () Bool)

(assert (=> b!932820 m!867103))

(declare-fun m!867105 () Bool)

(assert (=> bm!40615 m!867105))

(declare-fun m!867107 () Bool)

(assert (=> b!932827 m!867107))

(declare-fun m!867109 () Bool)

(assert (=> b!932834 m!867109))

(declare-fun m!867111 () Bool)

(assert (=> b!932821 m!867111))

(assert (=> b!932821 m!866939))

(declare-fun m!867113 () Bool)

(assert (=> b!932821 m!867113))

(declare-fun m!867115 () Bool)

(assert (=> b!932821 m!867115))

(declare-fun m!867117 () Bool)

(assert (=> b!932821 m!867117))

(declare-fun m!867119 () Bool)

(assert (=> b!932821 m!867119))

(assert (=> b!932821 m!867113))

(declare-fun m!867121 () Bool)

(assert (=> b!932821 m!867121))

(declare-fun m!867123 () Bool)

(assert (=> b!932821 m!867123))

(declare-fun m!867125 () Bool)

(assert (=> b!932821 m!867125))

(assert (=> b!932821 m!867117))

(declare-fun m!867127 () Bool)

(assert (=> b!932821 m!867127))

(declare-fun m!867129 () Bool)

(assert (=> b!932821 m!867129))

(assert (=> b!932821 m!867111))

(declare-fun m!867131 () Bool)

(assert (=> b!932821 m!867131))

(declare-fun m!867133 () Bool)

(assert (=> b!932821 m!867133))

(declare-fun m!867135 () Bool)

(assert (=> b!932821 m!867135))

(declare-fun m!867137 () Bool)

(assert (=> b!932821 m!867137))

(assert (=> b!932821 m!867135))

(declare-fun m!867139 () Bool)

(assert (=> b!932821 m!867139))

(declare-fun m!867141 () Bool)

(assert (=> b!932821 m!867141))

(assert (=> bm!40617 m!867129))

(assert (=> d!113357 m!866903))

(assert (=> b!932817 m!866939))

(assert (=> b!932817 m!866939))

(assert (=> b!932817 m!867101))

(declare-fun m!867143 () Bool)

(assert (=> bm!40614 m!867143))

(assert (=> b!932645 d!113357))

(declare-fun b!932835 () Bool)

(declare-fun e!523942 () ListLongMap!11881)

(declare-fun call!40625 () ListLongMap!11881)

(assert (=> b!932835 (= e!523942 call!40625)))

(declare-fun b!932836 () Bool)

(declare-fun res!627980 () Bool)

(declare-fun e!523939 () Bool)

(assert (=> b!932836 (=> (not res!627980) (not e!523939))))

(declare-fun e!523944 () Bool)

(assert (=> b!932836 (= res!627980 e!523944)))

(declare-fun res!627975 () Bool)

(assert (=> b!932836 (=> res!627975 e!523944)))

(declare-fun e!523948 () Bool)

(assert (=> b!932836 (= res!627975 (not e!523948))))

(declare-fun res!627981 () Bool)

(assert (=> b!932836 (=> (not res!627981) (not e!523948))))

(assert (=> b!932836 (= res!627981 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27440 _keys!1487)))))

(declare-fun b!932837 () Bool)

(declare-fun e!523945 () Bool)

(declare-fun e!523938 () Bool)

(assert (=> b!932837 (= e!523945 e!523938)))

(declare-fun res!627978 () Bool)

(declare-fun call!40627 () Bool)

(assert (=> b!932837 (= res!627978 call!40627)))

(assert (=> b!932837 (=> (not res!627978) (not e!523938))))

(declare-fun b!932838 () Bool)

(assert (=> b!932838 (= e!523948 (validKeyInArray!0 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bm!40620 () Bool)

(declare-fun call!40629 () ListLongMap!11881)

(declare-fun call!40623 () ListLongMap!11881)

(assert (=> bm!40620 (= call!40629 call!40623)))

(declare-fun c!97344 () Bool)

(declare-fun bm!40621 () Bool)

(declare-fun c!97342 () Bool)

(declare-fun call!40624 () ListLongMap!11881)

(assert (=> bm!40621 (= call!40624 (+!2786 (ite c!97344 call!40623 (ite c!97342 call!40629 call!40625)) (ite (or c!97344 c!97342) (tuple2!13183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!932839 () Bool)

(declare-fun call!40628 () ListLongMap!11881)

(assert (=> b!932839 (= e!523942 call!40628)))

(declare-fun b!932840 () Bool)

(declare-fun res!627973 () Bool)

(assert (=> b!932840 (=> (not res!627973) (not e!523939))))

(declare-fun e!523941 () Bool)

(assert (=> b!932840 (= res!627973 e!523941)))

(declare-fun c!97346 () Bool)

(assert (=> b!932840 (= c!97346 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!932841 () Bool)

(declare-fun e!523950 () Bool)

(declare-fun lt!420026 () ListLongMap!11881)

(assert (=> b!932841 (= e!523950 (= (apply!785 lt!420026 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!932842 () Bool)

(declare-fun e!523947 () Unit!31437)

(declare-fun lt!420025 () Unit!31437)

(assert (=> b!932842 (= e!523947 lt!420025)))

(declare-fun lt!420010 () ListLongMap!11881)

(assert (=> b!932842 (= lt!420010 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420009 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420012 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420012 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420011 () Unit!31437)

(assert (=> b!932842 (= lt!420011 (addStillContains!489 lt!420010 lt!420009 zeroValue!1173 lt!420012))))

(assert (=> b!932842 (contains!5020 (+!2786 lt!420010 (tuple2!13183 lt!420009 zeroValue!1173)) lt!420012)))

(declare-fun lt!420022 () Unit!31437)

(assert (=> b!932842 (= lt!420022 lt!420011)))

(declare-fun lt!420007 () ListLongMap!11881)

(assert (=> b!932842 (= lt!420007 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420028 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420028 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420023 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420023 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420017 () Unit!31437)

(assert (=> b!932842 (= lt!420017 (addApplyDifferent!416 lt!420007 lt!420028 minValue!1173 lt!420023))))

(assert (=> b!932842 (= (apply!785 (+!2786 lt!420007 (tuple2!13183 lt!420028 minValue!1173)) lt!420023) (apply!785 lt!420007 lt!420023))))

(declare-fun lt!420020 () Unit!31437)

(assert (=> b!932842 (= lt!420020 lt!420017)))

(declare-fun lt!420013 () ListLongMap!11881)

(assert (=> b!932842 (= lt!420013 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420024 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420014 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420014 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420027 () Unit!31437)

(assert (=> b!932842 (= lt!420027 (addApplyDifferent!416 lt!420013 lt!420024 zeroValue!1173 lt!420014))))

(assert (=> b!932842 (= (apply!785 (+!2786 lt!420013 (tuple2!13183 lt!420024 zeroValue!1173)) lt!420014) (apply!785 lt!420013 lt!420014))))

(declare-fun lt!420018 () Unit!31437)

(assert (=> b!932842 (= lt!420018 lt!420027)))

(declare-fun lt!420016 () ListLongMap!11881)

(assert (=> b!932842 (= lt!420016 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420008 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420008 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420019 () (_ BitVec 64))

(assert (=> b!932842 (= lt!420019 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!932842 (= lt!420025 (addApplyDifferent!416 lt!420016 lt!420008 minValue!1173 lt!420019))))

(assert (=> b!932842 (= (apply!785 (+!2786 lt!420016 (tuple2!13183 lt!420008 minValue!1173)) lt!420019) (apply!785 lt!420016 lt!420019))))

(declare-fun bm!40622 () Bool)

(assert (=> bm!40622 (= call!40627 (contains!5020 lt!420026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!932843 () Bool)

(declare-fun Unit!31444 () Unit!31437)

(assert (=> b!932843 (= e!523947 Unit!31444)))

(declare-fun b!932844 () Bool)

(assert (=> b!932844 (= e!523941 e!523950)))

(declare-fun res!627979 () Bool)

(declare-fun call!40626 () Bool)

(assert (=> b!932844 (= res!627979 call!40626)))

(assert (=> b!932844 (=> (not res!627979) (not e!523950))))

(declare-fun b!932845 () Bool)

(declare-fun c!97343 () Bool)

(assert (=> b!932845 (= c!97343 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!523949 () ListLongMap!11881)

(assert (=> b!932845 (= e!523949 e!523942)))

(declare-fun bm!40623 () Bool)

(assert (=> bm!40623 (= call!40625 call!40629)))

(declare-fun bm!40624 () Bool)

(assert (=> bm!40624 (= call!40623 (getCurrentListMapNoExtraKeys!3342 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!932846 () Bool)

(declare-fun e!523943 () Bool)

(assert (=> b!932846 (= e!523944 e!523943)))

(declare-fun res!627974 () Bool)

(assert (=> b!932846 (=> (not res!627974) (not e!523943))))

(assert (=> b!932846 (= res!627974 (contains!5020 lt!420026 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!932846 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27440 _keys!1487)))))

(declare-fun b!932847 () Bool)

(declare-fun e!523940 () Bool)

(assert (=> b!932847 (= e!523940 (validKeyInArray!0 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!932848 () Bool)

(assert (=> b!932848 (= e!523938 (= (apply!785 lt!420026 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!932849 () Bool)

(assert (=> b!932849 (= e!523939 e!523945)))

(declare-fun c!97345 () Bool)

(assert (=> b!932849 (= c!97345 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!932850 () Bool)

(declare-fun e!523946 () ListLongMap!11881)

(assert (=> b!932850 (= e!523946 e!523949)))

(assert (=> b!932850 (= c!97342 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!932851 () Bool)

(assert (=> b!932851 (= e!523943 (= (apply!785 lt!420026 (select (arr!26980 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14199 (select (arr!26981 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!932851 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27441 _values!1231)))))

(assert (=> b!932851 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27440 _keys!1487)))))

(declare-fun b!932852 () Bool)

(assert (=> b!932852 (= e!523941 (not call!40626))))

(declare-fun bm!40625 () Bool)

(assert (=> bm!40625 (= call!40628 call!40624)))

(declare-fun b!932853 () Bool)

(assert (=> b!932853 (= e!523945 (not call!40627))))

(declare-fun bm!40626 () Bool)

(assert (=> bm!40626 (= call!40626 (contains!5020 lt!420026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113359 () Bool)

(assert (=> d!113359 e!523939))

(declare-fun res!627976 () Bool)

(assert (=> d!113359 (=> (not res!627976) (not e!523939))))

(assert (=> d!113359 (= res!627976 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27440 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27440 _keys!1487)))))))

(declare-fun lt!420015 () ListLongMap!11881)

(assert (=> d!113359 (= lt!420026 lt!420015)))

(declare-fun lt!420021 () Unit!31437)

(assert (=> d!113359 (= lt!420021 e!523947)))

(declare-fun c!97347 () Bool)

(assert (=> d!113359 (= c!97347 e!523940)))

(declare-fun res!627977 () Bool)

(assert (=> d!113359 (=> (not res!627977) (not e!523940))))

(assert (=> d!113359 (= res!627977 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27440 _keys!1487)))))

(assert (=> d!113359 (= lt!420015 e!523946)))

(assert (=> d!113359 (= c!97344 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113359 (validMask!0 mask!1881)))

(assert (=> d!113359 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420026)))

(declare-fun b!932854 () Bool)

(assert (=> b!932854 (= e!523949 call!40628)))

(declare-fun b!932855 () Bool)

(assert (=> b!932855 (= e!523946 (+!2786 call!40624 (tuple2!13183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113359 c!97344) b!932855))

(assert (= (and d!113359 (not c!97344)) b!932850))

(assert (= (and b!932850 c!97342) b!932854))

(assert (= (and b!932850 (not c!97342)) b!932845))

(assert (= (and b!932845 c!97343) b!932839))

(assert (= (and b!932845 (not c!97343)) b!932835))

(assert (= (or b!932839 b!932835) bm!40623))

(assert (= (or b!932854 bm!40623) bm!40620))

(assert (= (or b!932854 b!932839) bm!40625))

(assert (= (or b!932855 bm!40620) bm!40624))

(assert (= (or b!932855 bm!40625) bm!40621))

(assert (= (and d!113359 res!627977) b!932847))

(assert (= (and d!113359 c!97347) b!932842))

(assert (= (and d!113359 (not c!97347)) b!932843))

(assert (= (and d!113359 res!627976) b!932836))

(assert (= (and b!932836 res!627981) b!932838))

(assert (= (and b!932836 (not res!627975)) b!932846))

(assert (= (and b!932846 res!627974) b!932851))

(assert (= (and b!932836 res!627980) b!932840))

(assert (= (and b!932840 c!97346) b!932844))

(assert (= (and b!932840 (not c!97346)) b!932852))

(assert (= (and b!932844 res!627979) b!932841))

(assert (= (or b!932844 b!932852) bm!40626))

(assert (= (and b!932840 res!627973) b!932849))

(assert (= (and b!932849 c!97345) b!932837))

(assert (= (and b!932849 (not c!97345)) b!932853))

(assert (= (and b!932837 res!627978) b!932848))

(assert (= (or b!932837 b!932853) bm!40622))

(declare-fun b_lambda!13875 () Bool)

(assert (=> (not b_lambda!13875) (not b!932851)))

(assert (=> b!932851 t!27034))

(declare-fun b_and!28643 () Bool)

(assert (= b_and!28641 (and (=> t!27034 result!11669) b_and!28643)))

(declare-fun m!867145 () Bool)

(assert (=> b!932846 m!867145))

(assert (=> b!932846 m!867145))

(declare-fun m!867147 () Bool)

(assert (=> b!932846 m!867147))

(assert (=> b!932851 m!866925))

(declare-fun m!867149 () Bool)

(assert (=> b!932851 m!867149))

(assert (=> b!932851 m!867145))

(assert (=> b!932851 m!867149))

(assert (=> b!932851 m!866925))

(declare-fun m!867151 () Bool)

(assert (=> b!932851 m!867151))

(assert (=> b!932851 m!867145))

(declare-fun m!867153 () Bool)

(assert (=> b!932851 m!867153))

(declare-fun m!867155 () Bool)

(assert (=> bm!40626 m!867155))

(assert (=> b!932847 m!867145))

(assert (=> b!932847 m!867145))

(declare-fun m!867157 () Bool)

(assert (=> b!932847 m!867157))

(declare-fun m!867159 () Bool)

(assert (=> b!932841 m!867159))

(declare-fun m!867161 () Bool)

(assert (=> bm!40622 m!867161))

(declare-fun m!867163 () Bool)

(assert (=> b!932848 m!867163))

(declare-fun m!867165 () Bool)

(assert (=> b!932855 m!867165))

(declare-fun m!867167 () Bool)

(assert (=> b!932842 m!867167))

(assert (=> b!932842 m!867145))

(declare-fun m!867169 () Bool)

(assert (=> b!932842 m!867169))

(declare-fun m!867171 () Bool)

(assert (=> b!932842 m!867171))

(declare-fun m!867173 () Bool)

(assert (=> b!932842 m!867173))

(declare-fun m!867175 () Bool)

(assert (=> b!932842 m!867175))

(assert (=> b!932842 m!867169))

(declare-fun m!867177 () Bool)

(assert (=> b!932842 m!867177))

(declare-fun m!867179 () Bool)

(assert (=> b!932842 m!867179))

(declare-fun m!867181 () Bool)

(assert (=> b!932842 m!867181))

(assert (=> b!932842 m!867173))

(declare-fun m!867183 () Bool)

(assert (=> b!932842 m!867183))

(declare-fun m!867185 () Bool)

(assert (=> b!932842 m!867185))

(assert (=> b!932842 m!867167))

(declare-fun m!867187 () Bool)

(assert (=> b!932842 m!867187))

(declare-fun m!867189 () Bool)

(assert (=> b!932842 m!867189))

(declare-fun m!867191 () Bool)

(assert (=> b!932842 m!867191))

(declare-fun m!867193 () Bool)

(assert (=> b!932842 m!867193))

(assert (=> b!932842 m!867191))

(declare-fun m!867195 () Bool)

(assert (=> b!932842 m!867195))

(declare-fun m!867197 () Bool)

(assert (=> b!932842 m!867197))

(assert (=> bm!40624 m!867185))

(assert (=> d!113359 m!866903))

(assert (=> b!932838 m!867145))

(assert (=> b!932838 m!867145))

(assert (=> b!932838 m!867157))

(declare-fun m!867199 () Bool)

(assert (=> bm!40621 m!867199))

(assert (=> b!932645 d!113359))

(declare-fun d!113361 () Bool)

(declare-fun e!523952 () Bool)

(assert (=> d!113361 e!523952))

(declare-fun res!627982 () Bool)

(assert (=> d!113361 (=> res!627982 e!523952)))

(declare-fun lt!420031 () Bool)

(assert (=> d!113361 (= res!627982 (not lt!420031))))

(declare-fun lt!420032 () Bool)

(assert (=> d!113361 (= lt!420031 lt!420032)))

(declare-fun lt!420029 () Unit!31437)

(declare-fun e!523951 () Unit!31437)

(assert (=> d!113361 (= lt!420029 e!523951)))

(declare-fun c!97348 () Bool)

(assert (=> d!113361 (= c!97348 lt!420032)))

(assert (=> d!113361 (= lt!420032 (containsKey!447 (toList!5956 (+!2786 lt!419867 lt!419866)) k0!1099))))

(assert (=> d!113361 (= (contains!5020 (+!2786 lt!419867 lt!419866) k0!1099) lt!420031)))

(declare-fun b!932856 () Bool)

(declare-fun lt!420030 () Unit!31437)

(assert (=> b!932856 (= e!523951 lt!420030)))

(assert (=> b!932856 (= lt!420030 (lemmaContainsKeyImpliesGetValueByKeyDefined!341 (toList!5956 (+!2786 lt!419867 lt!419866)) k0!1099))))

(assert (=> b!932856 (isDefined!349 (getValueByKey!476 (toList!5956 (+!2786 lt!419867 lt!419866)) k0!1099))))

(declare-fun b!932857 () Bool)

(declare-fun Unit!31445 () Unit!31437)

(assert (=> b!932857 (= e!523951 Unit!31445)))

(declare-fun b!932858 () Bool)

(assert (=> b!932858 (= e!523952 (isDefined!349 (getValueByKey!476 (toList!5956 (+!2786 lt!419867 lt!419866)) k0!1099)))))

(assert (= (and d!113361 c!97348) b!932856))

(assert (= (and d!113361 (not c!97348)) b!932857))

(assert (= (and d!113361 (not res!627982)) b!932858))

(declare-fun m!867201 () Bool)

(assert (=> d!113361 m!867201))

(declare-fun m!867203 () Bool)

(assert (=> b!932856 m!867203))

(declare-fun m!867205 () Bool)

(assert (=> b!932856 m!867205))

(assert (=> b!932856 m!867205))

(declare-fun m!867207 () Bool)

(assert (=> b!932856 m!867207))

(assert (=> b!932858 m!867205))

(assert (=> b!932858 m!867205))

(assert (=> b!932858 m!867207))

(assert (=> b!932645 d!113361))

(declare-fun d!113363 () Bool)

(declare-fun e!523955 () Bool)

(assert (=> d!113363 e!523955))

(declare-fun res!627985 () Bool)

(assert (=> d!113363 (=> (not res!627985) (not e!523955))))

(assert (=> d!113363 (= res!627985 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27440 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27441 _values!1231))))))

(declare-fun lt!420035 () Unit!31437)

(declare-fun choose!1545 (array!56079 array!56081 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) Unit!31437)

(assert (=> d!113363 (= lt!420035 (choose!1545 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113363 (validMask!0 mask!1881)))

(assert (=> d!113363 (= (lemmaListMapRecursiveValidKeyArray!166 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420035)))

(declare-fun b!932861 () Bool)

(assert (=> b!932861 (= e!523955 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2786 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13183 (select (arr!26980 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14199 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113363 res!627985) b!932861))

(declare-fun b_lambda!13877 () Bool)

(assert (=> (not b_lambda!13877) (not b!932861)))

(assert (=> b!932861 t!27034))

(declare-fun b_and!28645 () Bool)

(assert (= b_and!28643 (and (=> t!27034 result!11669) b_and!28645)))

(declare-fun m!867209 () Bool)

(assert (=> d!113363 m!867209))

(assert (=> d!113363 m!866903))

(assert (=> b!932861 m!866917))

(assert (=> b!932861 m!866939))

(declare-fun m!867211 () Bool)

(assert (=> b!932861 m!867211))

(declare-fun m!867213 () Bool)

(assert (=> b!932861 m!867213))

(assert (=> b!932861 m!866925))

(assert (=> b!932861 m!866915))

(assert (=> b!932861 m!866925))

(assert (=> b!932861 m!866933))

(assert (=> b!932861 m!866915))

(assert (=> b!932861 m!867211))

(assert (=> b!932645 d!113363))

(declare-fun d!113365 () Bool)

(declare-fun e!523958 () Bool)

(assert (=> d!113365 e!523958))

(declare-fun res!627990 () Bool)

(assert (=> d!113365 (=> (not res!627990) (not e!523958))))

(declare-fun lt!420044 () ListLongMap!11881)

(assert (=> d!113365 (= res!627990 (contains!5020 lt!420044 (_1!6602 lt!419866)))))

(declare-fun lt!420045 () List!18966)

(assert (=> d!113365 (= lt!420044 (ListLongMap!11882 lt!420045))))

(declare-fun lt!420046 () Unit!31437)

(declare-fun lt!420047 () Unit!31437)

(assert (=> d!113365 (= lt!420046 lt!420047)))

(assert (=> d!113365 (= (getValueByKey!476 lt!420045 (_1!6602 lt!419866)) (Some!481 (_2!6602 lt!419866)))))

(declare-fun lemmaContainsTupThenGetReturnValue!255 (List!18966 (_ BitVec 64) V!31687) Unit!31437)

(assert (=> d!113365 (= lt!420047 (lemmaContainsTupThenGetReturnValue!255 lt!420045 (_1!6602 lt!419866) (_2!6602 lt!419866)))))

(declare-fun insertStrictlySorted!312 (List!18966 (_ BitVec 64) V!31687) List!18966)

(assert (=> d!113365 (= lt!420045 (insertStrictlySorted!312 (toList!5956 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6602 lt!419866) (_2!6602 lt!419866)))))

(assert (=> d!113365 (= (+!2786 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419866) lt!420044)))

(declare-fun b!932866 () Bool)

(declare-fun res!627991 () Bool)

(assert (=> b!932866 (=> (not res!627991) (not e!523958))))

(assert (=> b!932866 (= res!627991 (= (getValueByKey!476 (toList!5956 lt!420044) (_1!6602 lt!419866)) (Some!481 (_2!6602 lt!419866))))))

(declare-fun b!932867 () Bool)

(declare-fun contains!5022 (List!18966 tuple2!13182) Bool)

(assert (=> b!932867 (= e!523958 (contains!5022 (toList!5956 lt!420044) lt!419866))))

(assert (= (and d!113365 res!627990) b!932866))

(assert (= (and b!932866 res!627991) b!932867))

(declare-fun m!867215 () Bool)

(assert (=> d!113365 m!867215))

(declare-fun m!867217 () Bool)

(assert (=> d!113365 m!867217))

(declare-fun m!867219 () Bool)

(assert (=> d!113365 m!867219))

(declare-fun m!867221 () Bool)

(assert (=> d!113365 m!867221))

(declare-fun m!867223 () Bool)

(assert (=> b!932866 m!867223))

(declare-fun m!867225 () Bool)

(assert (=> b!932867 m!867225))

(assert (=> b!932645 d!113365))

(declare-fun d!113367 () Bool)

(declare-fun e!523959 () Bool)

(assert (=> d!113367 e!523959))

(declare-fun res!627992 () Bool)

(assert (=> d!113367 (=> (not res!627992) (not e!523959))))

(declare-fun lt!420048 () ListLongMap!11881)

(assert (=> d!113367 (= res!627992 (contains!5020 lt!420048 (_1!6602 lt!419866)))))

(declare-fun lt!420049 () List!18966)

(assert (=> d!113367 (= lt!420048 (ListLongMap!11882 lt!420049))))

(declare-fun lt!420050 () Unit!31437)

(declare-fun lt!420051 () Unit!31437)

(assert (=> d!113367 (= lt!420050 lt!420051)))

(assert (=> d!113367 (= (getValueByKey!476 lt!420049 (_1!6602 lt!419866)) (Some!481 (_2!6602 lt!419866)))))

(assert (=> d!113367 (= lt!420051 (lemmaContainsTupThenGetReturnValue!255 lt!420049 (_1!6602 lt!419866) (_2!6602 lt!419866)))))

(assert (=> d!113367 (= lt!420049 (insertStrictlySorted!312 (toList!5956 lt!419867) (_1!6602 lt!419866) (_2!6602 lt!419866)))))

(assert (=> d!113367 (= (+!2786 lt!419867 lt!419866) lt!420048)))

(declare-fun b!932868 () Bool)

(declare-fun res!627993 () Bool)

(assert (=> b!932868 (=> (not res!627993) (not e!523959))))

(assert (=> b!932868 (= res!627993 (= (getValueByKey!476 (toList!5956 lt!420048) (_1!6602 lt!419866)) (Some!481 (_2!6602 lt!419866))))))

(declare-fun b!932869 () Bool)

(assert (=> b!932869 (= e!523959 (contains!5022 (toList!5956 lt!420048) lt!419866))))

(assert (= (and d!113367 res!627992) b!932868))

(assert (= (and b!932868 res!627993) b!932869))

(declare-fun m!867227 () Bool)

(assert (=> d!113367 m!867227))

(declare-fun m!867229 () Bool)

(assert (=> d!113367 m!867229))

(declare-fun m!867231 () Bool)

(assert (=> d!113367 m!867231))

(declare-fun m!867233 () Bool)

(assert (=> d!113367 m!867233))

(declare-fun m!867235 () Bool)

(assert (=> b!932868 m!867235))

(declare-fun m!867237 () Bool)

(assert (=> b!932869 m!867237))

(assert (=> b!932645 d!113367))

(declare-fun d!113369 () Bool)

(assert (=> d!113369 (contains!5020 (+!2786 lt!419867 (tuple2!13183 lt!419868 lt!419865)) k0!1099)))

(declare-fun lt!420054 () Unit!31437)

(declare-fun choose!1546 (ListLongMap!11881 (_ BitVec 64) V!31687 (_ BitVec 64)) Unit!31437)

(assert (=> d!113369 (= lt!420054 (choose!1546 lt!419867 lt!419868 lt!419865 k0!1099))))

(assert (=> d!113369 (contains!5020 lt!419867 k0!1099)))

(assert (=> d!113369 (= (addStillContains!489 lt!419867 lt!419868 lt!419865 k0!1099) lt!420054)))

(declare-fun bs!26193 () Bool)

(assert (= bs!26193 d!113369))

(declare-fun m!867239 () Bool)

(assert (=> bs!26193 m!867239))

(assert (=> bs!26193 m!867239))

(declare-fun m!867241 () Bool)

(assert (=> bs!26193 m!867241))

(declare-fun m!867243 () Bool)

(assert (=> bs!26193 m!867243))

(assert (=> bs!26193 m!866899))

(assert (=> b!932645 d!113369))

(declare-fun d!113371 () Bool)

(declare-fun c!97351 () Bool)

(assert (=> d!113371 (= c!97351 ((_ is ValueCellFull!9539) (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!523962 () V!31687)

(assert (=> d!113371 (= (get!14199 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!523962)))

(declare-fun b!932875 () Bool)

(declare-fun get!14201 (ValueCell!9539 V!31687) V!31687)

(assert (=> b!932875 (= e!523962 (get!14201 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!932876 () Bool)

(declare-fun get!14202 (ValueCell!9539 V!31687) V!31687)

(assert (=> b!932876 (= e!523962 (get!14202 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113371 c!97351) b!932875))

(assert (= (and d!113371 (not c!97351)) b!932876))

(assert (=> b!932875 m!866915))

(assert (=> b!932875 m!866925))

(declare-fun m!867245 () Bool)

(assert (=> b!932875 m!867245))

(assert (=> b!932876 m!866915))

(assert (=> b!932876 m!866925))

(declare-fun m!867247 () Bool)

(assert (=> b!932876 m!867247))

(assert (=> b!932645 d!113371))

(declare-fun b!932885 () Bool)

(declare-fun e!523969 () Bool)

(declare-fun e!523971 () Bool)

(assert (=> b!932885 (= e!523969 e!523971)))

(declare-fun lt!420063 () (_ BitVec 64))

(assert (=> b!932885 (= lt!420063 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!420062 () Unit!31437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56079 (_ BitVec 64) (_ BitVec 32)) Unit!31437)

(assert (=> b!932885 (= lt!420062 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!420063 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!932885 (arrayContainsKey!0 _keys!1487 lt!420063 #b00000000000000000000000000000000)))

(declare-fun lt!420061 () Unit!31437)

(assert (=> b!932885 (= lt!420061 lt!420062)))

(declare-fun res!627999 () Bool)

(declare-datatypes ((SeekEntryResult!8930 0))(
  ( (MissingZero!8930 (index!38091 (_ BitVec 32))) (Found!8930 (index!38092 (_ BitVec 32))) (Intermediate!8930 (undefined!9742 Bool) (index!38093 (_ BitVec 32)) (x!79841 (_ BitVec 32))) (Undefined!8930) (MissingVacant!8930 (index!38094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56079 (_ BitVec 32)) SeekEntryResult!8930)

(assert (=> b!932885 (= res!627999 (= (seekEntryOrOpen!0 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8930 #b00000000000000000000000000000000)))))

(assert (=> b!932885 (=> (not res!627999) (not e!523971))))

(declare-fun bm!40629 () Bool)

(declare-fun call!40632 () Bool)

(assert (=> bm!40629 (= call!40632 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!932886 () Bool)

(declare-fun e!523970 () Bool)

(assert (=> b!932886 (= e!523970 e!523969)))

(declare-fun c!97354 () Bool)

(assert (=> b!932886 (= c!97354 (validKeyInArray!0 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113373 () Bool)

(declare-fun res!627998 () Bool)

(assert (=> d!113373 (=> res!627998 e!523970)))

(assert (=> d!113373 (= res!627998 (bvsge #b00000000000000000000000000000000 (size!27440 _keys!1487)))))

(assert (=> d!113373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!523970)))

(declare-fun b!932887 () Bool)

(assert (=> b!932887 (= e!523971 call!40632)))

(declare-fun b!932888 () Bool)

(assert (=> b!932888 (= e!523969 call!40632)))

(assert (= (and d!113373 (not res!627998)) b!932886))

(assert (= (and b!932886 c!97354) b!932885))

(assert (= (and b!932886 (not c!97354)) b!932888))

(assert (= (and b!932885 res!627999) b!932887))

(assert (= (or b!932887 b!932888) bm!40629))

(declare-fun m!867249 () Bool)

(assert (=> b!932885 m!867249))

(declare-fun m!867251 () Bool)

(assert (=> b!932885 m!867251))

(declare-fun m!867253 () Bool)

(assert (=> b!932885 m!867253))

(assert (=> b!932885 m!867249))

(declare-fun m!867255 () Bool)

(assert (=> b!932885 m!867255))

(declare-fun m!867257 () Bool)

(assert (=> bm!40629 m!867257))

(assert (=> b!932886 m!867249))

(assert (=> b!932886 m!867249))

(declare-fun m!867259 () Bool)

(assert (=> b!932886 m!867259))

(assert (=> b!932650 d!113373))

(declare-fun b!932899 () Bool)

(declare-fun e!523982 () Bool)

(declare-fun call!40635 () Bool)

(assert (=> b!932899 (= e!523982 call!40635)))

(declare-fun b!932900 () Bool)

(declare-fun e!523981 () Bool)

(assert (=> b!932900 (= e!523981 e!523982)))

(declare-fun c!97357 () Bool)

(assert (=> b!932900 (= c!97357 (validKeyInArray!0 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!932902 () Bool)

(assert (=> b!932902 (= e!523982 call!40635)))

(declare-fun b!932903 () Bool)

(declare-fun e!523980 () Bool)

(assert (=> b!932903 (= e!523980 e!523981)))

(declare-fun res!628007 () Bool)

(assert (=> b!932903 (=> (not res!628007) (not e!523981))))

(declare-fun e!523983 () Bool)

(assert (=> b!932903 (= res!628007 (not e!523983))))

(declare-fun res!628008 () Bool)

(assert (=> b!932903 (=> (not res!628008) (not e!523983))))

(assert (=> b!932903 (= res!628008 (validKeyInArray!0 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40632 () Bool)

(assert (=> bm!40632 (= call!40635 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97357 (Cons!18963 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000) Nil!18964) Nil!18964)))))

(declare-fun d!113375 () Bool)

(declare-fun res!628006 () Bool)

(assert (=> d!113375 (=> res!628006 e!523980)))

(assert (=> d!113375 (= res!628006 (bvsge #b00000000000000000000000000000000 (size!27440 _keys!1487)))))

(assert (=> d!113375 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18964) e!523980)))

(declare-fun b!932901 () Bool)

(declare-fun contains!5023 (List!18967 (_ BitVec 64)) Bool)

(assert (=> b!932901 (= e!523983 (contains!5023 Nil!18964 (select (arr!26980 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113375 (not res!628006)) b!932903))

(assert (= (and b!932903 res!628008) b!932901))

(assert (= (and b!932903 res!628007) b!932900))

(assert (= (and b!932900 c!97357) b!932899))

(assert (= (and b!932900 (not c!97357)) b!932902))

(assert (= (or b!932899 b!932902) bm!40632))

(assert (=> b!932900 m!867249))

(assert (=> b!932900 m!867249))

(assert (=> b!932900 m!867259))

(assert (=> b!932903 m!867249))

(assert (=> b!932903 m!867249))

(assert (=> b!932903 m!867259))

(assert (=> bm!40632 m!867249))

(declare-fun m!867261 () Bool)

(assert (=> bm!40632 m!867261))

(assert (=> b!932901 m!867249))

(assert (=> b!932901 m!867249))

(declare-fun m!867263 () Bool)

(assert (=> b!932901 m!867263))

(assert (=> b!932654 d!113375))

(declare-fun d!113377 () Bool)

(declare-fun get!14203 (Option!482) V!31687)

(assert (=> d!113377 (= (apply!785 lt!419867 k0!1099) (get!14203 (getValueByKey!476 (toList!5956 lt!419867) k0!1099)))))

(declare-fun bs!26194 () Bool)

(assert (= bs!26194 d!113377))

(assert (=> bs!26194 m!867035))

(assert (=> bs!26194 m!867035))

(declare-fun m!867265 () Bool)

(assert (=> bs!26194 m!867265))

(assert (=> b!932651 d!113377))

(declare-fun d!113379 () Bool)

(assert (=> d!113379 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79488 d!113379))

(declare-fun d!113381 () Bool)

(assert (=> d!113381 (= (array_inv!21086 _values!1231) (bvsge (size!27441 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79488 d!113381))

(declare-fun d!113383 () Bool)

(assert (=> d!113383 (= (array_inv!21087 _keys!1487) (bvsge (size!27440 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79488 d!113383))

(declare-fun b!932911 () Bool)

(declare-fun e!523988 () Bool)

(assert (=> b!932911 (= e!523988 tp_is_empty!20041)))

(declare-fun condMapEmpty!31827 () Bool)

(declare-fun mapDefault!31827 () ValueCell!9539)

(assert (=> mapNonEmpty!31818 (= condMapEmpty!31827 (= mapRest!31818 ((as const (Array (_ BitVec 32) ValueCell!9539)) mapDefault!31827)))))

(declare-fun mapRes!31827 () Bool)

(assert (=> mapNonEmpty!31818 (= tp!61041 (and e!523988 mapRes!31827))))

(declare-fun mapIsEmpty!31827 () Bool)

(assert (=> mapIsEmpty!31827 mapRes!31827))

(declare-fun b!932910 () Bool)

(declare-fun e!523989 () Bool)

(assert (=> b!932910 (= e!523989 tp_is_empty!20041)))

(declare-fun mapNonEmpty!31827 () Bool)

(declare-fun tp!61056 () Bool)

(assert (=> mapNonEmpty!31827 (= mapRes!31827 (and tp!61056 e!523989))))

(declare-fun mapKey!31827 () (_ BitVec 32))

(declare-fun mapRest!31827 () (Array (_ BitVec 32) ValueCell!9539))

(declare-fun mapValue!31827 () ValueCell!9539)

(assert (=> mapNonEmpty!31827 (= mapRest!31818 (store mapRest!31827 mapKey!31827 mapValue!31827))))

(assert (= (and mapNonEmpty!31818 condMapEmpty!31827) mapIsEmpty!31827))

(assert (= (and mapNonEmpty!31818 (not condMapEmpty!31827)) mapNonEmpty!31827))

(assert (= (and mapNonEmpty!31827 ((_ is ValueCellFull!9539) mapValue!31827)) b!932910))

(assert (= (and mapNonEmpty!31818 ((_ is ValueCellFull!9539) mapDefault!31827)) b!932911))

(declare-fun m!867267 () Bool)

(assert (=> mapNonEmpty!31827 m!867267))

(declare-fun b_lambda!13879 () Bool)

(assert (= b_lambda!13875 (or (and start!79488 b_free!17533) b_lambda!13879)))

(declare-fun b_lambda!13881 () Bool)

(assert (= b_lambda!13873 (or (and start!79488 b_free!17533) b_lambda!13881)))

(declare-fun b_lambda!13883 () Bool)

(assert (= b_lambda!13871 (or (and start!79488 b_free!17533) b_lambda!13883)))

(declare-fun b_lambda!13885 () Bool)

(assert (= b_lambda!13877 (or (and start!79488 b_free!17533) b_lambda!13885)))

(check-sat (not bm!40610) (not b!932885) (not b!932748) (not d!113367) (not b!932901) (not b!932869) (not d!113353) (not b!932825) (not b!932868) (not bm!40617) (not b_next!17533) (not b!932827) (not b!932830) b_and!28645 (not b!932796) (not b!932800) (not b!932841) (not b!932821) (not b!932838) (not b!932900) (not b!932804) (not b_lambda!13869) (not b!932875) (not b!932851) (not bm!40607) (not bm!40632) (not b!932805) (not b_lambda!13881) (not bm!40612) (not d!113361) (not bm!40621) (not b!932861) (not d!113365) (not bm!40614) (not d!113359) (not b!932855) (not d!113351) (not b!932820) (not d!113363) (not b!932886) (not bm!40624) (not bm!40619) (not bm!40615) (not b_lambda!13883) (not b_lambda!13879) (not d!113369) (not b!932903) (not b!932876) (not b!932856) (not b_lambda!13885) (not b!932799) (not d!113377) tp_is_empty!20041 (not d!113357) (not b!932847) (not b!932806) (not bm!40608) (not bm!40622) (not b!932809) (not b!932813) (not b!932834) (not bm!40629) (not b!932867) (not b!932842) (not b!932817) (not b!932848) (not b!932750) (not b!932826) (not b!932858) (not b!932846) (not mapNonEmpty!31827) (not b!932866) (not bm!40626))
(check-sat b_and!28645 (not b_next!17533))
