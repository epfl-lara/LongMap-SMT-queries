; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42686 () Bool)

(assert start!42686)

(declare-fun b_free!12067 () Bool)

(declare-fun b_next!12067 () Bool)

(assert (=> start!42686 (= b_free!12067 (not b_next!12067))))

(declare-fun tp!42252 () Bool)

(declare-fun b_and!20565 () Bool)

(assert (=> start!42686 (= tp!42252 b_and!20565)))

(declare-fun b!475975 () Bool)

(declare-fun res!284187 () Bool)

(declare-fun e!279539 () Bool)

(assert (=> b!475975 (=> (not res!284187) (not e!279539))))

(declare-datatypes ((array!30723 0))(
  ( (array!30724 (arr!14775 (Array (_ BitVec 32) (_ BitVec 64))) (size!15128 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30723)

(declare-datatypes ((List!9079 0))(
  ( (Nil!9076) (Cons!9075 (h!9931 (_ BitVec 64)) (t!15052 List!9079)) )
))
(declare-fun arrayNoDuplicates!0 (array!30723 (_ BitVec 32) List!9079) Bool)

(assert (=> b!475975 (= res!284187 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9076))))

(declare-fun b!475976 () Bool)

(declare-fun e!279537 () Bool)

(declare-fun tp_is_empty!13495 () Bool)

(assert (=> b!475976 (= e!279537 tp_is_empty!13495)))

(declare-fun b!475977 () Bool)

(declare-fun e!279536 () Bool)

(declare-fun mapRes!21973 () Bool)

(assert (=> b!475977 (= e!279536 (and e!279537 mapRes!21973))))

(declare-fun condMapEmpty!21973 () Bool)

(declare-datatypes ((V!19099 0))(
  ( (V!19100 (val!6792 Int)) )
))
(declare-datatypes ((ValueCell!6404 0))(
  ( (ValueCellFull!6404 (v!9082 V!19099)) (EmptyCell!6404) )
))
(declare-datatypes ((array!30725 0))(
  ( (array!30726 (arr!14776 (Array (_ BitVec 32) ValueCell!6404)) (size!15129 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30725)

(declare-fun mapDefault!21973 () ValueCell!6404)

(assert (=> b!475977 (= condMapEmpty!21973 (= (arr!14776 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6404)) mapDefault!21973)))))

(declare-fun e!279540 () Bool)

(declare-datatypes ((tuple2!9018 0))(
  ( (tuple2!9019 (_1!4520 (_ BitVec 64)) (_2!4520 V!19099)) )
))
(declare-fun lt!216852 () tuple2!9018)

(declare-fun zeroValue!794 () V!19099)

(declare-fun defaultEntry!841 () Int)

(declare-fun b!475978 () Bool)

(declare-datatypes ((List!9080 0))(
  ( (Nil!9077) (Cons!9076 (h!9932 tuple2!9018) (t!15053 List!9080)) )
))
(declare-datatypes ((ListLongMap!7921 0))(
  ( (ListLongMap!7922 (toList!3976 List!9080)) )
))
(declare-fun lt!216854 () ListLongMap!7921)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19099)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun +!1799 (ListLongMap!7921 tuple2!9018) ListLongMap!7921)

(declare-fun getCurrentListMap!2250 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 (_ BitVec 32) Int) ListLongMap!7921)

(assert (=> b!475978 (= e!279540 (= (+!1799 lt!216854 lt!216852) (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun lt!216850 () ListLongMap!7921)

(declare-fun minValueBefore!38 () V!19099)

(assert (=> b!475978 (= (+!1799 lt!216850 lt!216852) (+!1799 (+!1799 lt!216850 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216852))))

(assert (=> b!475978 (= lt!216852 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!14008 0))(
  ( (Unit!14009) )
))
(declare-fun lt!216853 () Unit!14008)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!169 (ListLongMap!7921 (_ BitVec 64) V!19099 V!19099) Unit!14008)

(assert (=> b!475978 (= lt!216853 (addSameAsAddTwiceSameKeyDiffValues!169 lt!216850 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!216851 () ListLongMap!7921)

(assert (=> b!475978 (= lt!216850 (+!1799 lt!216851 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475978 (= lt!216854 (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475979 () Bool)

(declare-fun e!279538 () Bool)

(assert (=> b!475979 (= e!279538 tp_is_empty!13495)))

(declare-fun mapNonEmpty!21973 () Bool)

(declare-fun tp!42253 () Bool)

(assert (=> mapNonEmpty!21973 (= mapRes!21973 (and tp!42253 e!279538))))

(declare-fun mapValue!21973 () ValueCell!6404)

(declare-fun mapKey!21973 () (_ BitVec 32))

(declare-fun mapRest!21973 () (Array (_ BitVec 32) ValueCell!6404))

(assert (=> mapNonEmpty!21973 (= (arr!14776 _values!833) (store mapRest!21973 mapKey!21973 mapValue!21973))))

(declare-fun mapIsEmpty!21973 () Bool)

(assert (=> mapIsEmpty!21973 mapRes!21973))

(declare-fun b!475980 () Bool)

(assert (=> b!475980 (= e!279539 (not e!279540))))

(declare-fun res!284185 () Bool)

(assert (=> b!475980 (=> res!284185 e!279540)))

(assert (=> b!475980 (= res!284185 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!216855 () ListLongMap!7921)

(assert (=> b!475980 (= lt!216851 lt!216855)))

(declare-fun lt!216849 () Unit!14008)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!275 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 V!19099 V!19099 (_ BitVec 32) Int) Unit!14008)

(assert (=> b!475980 (= lt!216849 (lemmaNoChangeToArrayThenSameMapNoExtras!275 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2141 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 (_ BitVec 32) Int) ListLongMap!7921)

(assert (=> b!475980 (= lt!216855 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475980 (= lt!216851 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!284186 () Bool)

(assert (=> start!42686 (=> (not res!284186) (not e!279539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42686 (= res!284186 (validMask!0 mask!1365))))

(assert (=> start!42686 e!279539))

(assert (=> start!42686 tp_is_empty!13495))

(assert (=> start!42686 tp!42252))

(assert (=> start!42686 true))

(declare-fun array_inv!10744 (array!30723) Bool)

(assert (=> start!42686 (array_inv!10744 _keys!1025)))

(declare-fun array_inv!10745 (array!30725) Bool)

(assert (=> start!42686 (and (array_inv!10745 _values!833) e!279536)))

(declare-fun b!475981 () Bool)

(declare-fun res!284184 () Bool)

(assert (=> b!475981 (=> (not res!284184) (not e!279539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30723 (_ BitVec 32)) Bool)

(assert (=> b!475981 (= res!284184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475982 () Bool)

(declare-fun res!284188 () Bool)

(assert (=> b!475982 (=> (not res!284188) (not e!279539))))

(assert (=> b!475982 (= res!284188 (and (= (size!15129 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15128 _keys!1025) (size!15129 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42686 res!284186) b!475982))

(assert (= (and b!475982 res!284188) b!475981))

(assert (= (and b!475981 res!284184) b!475975))

(assert (= (and b!475975 res!284187) b!475980))

(assert (= (and b!475980 (not res!284185)) b!475978))

(assert (= (and b!475977 condMapEmpty!21973) mapIsEmpty!21973))

(assert (= (and b!475977 (not condMapEmpty!21973)) mapNonEmpty!21973))

(get-info :version)

(assert (= (and mapNonEmpty!21973 ((_ is ValueCellFull!6404) mapValue!21973)) b!475979))

(assert (= (and b!475977 ((_ is ValueCellFull!6404) mapDefault!21973)) b!475976))

(assert (= start!42686 b!475977))

(declare-fun m!457737 () Bool)

(assert (=> mapNonEmpty!21973 m!457737))

(declare-fun m!457739 () Bool)

(assert (=> b!475981 m!457739))

(declare-fun m!457741 () Bool)

(assert (=> b!475980 m!457741))

(declare-fun m!457743 () Bool)

(assert (=> b!475980 m!457743))

(declare-fun m!457745 () Bool)

(assert (=> b!475980 m!457745))

(declare-fun m!457747 () Bool)

(assert (=> b!475975 m!457747))

(declare-fun m!457749 () Bool)

(assert (=> b!475978 m!457749))

(declare-fun m!457751 () Bool)

(assert (=> b!475978 m!457751))

(declare-fun m!457753 () Bool)

(assert (=> b!475978 m!457753))

(declare-fun m!457755 () Bool)

(assert (=> b!475978 m!457755))

(assert (=> b!475978 m!457753))

(declare-fun m!457757 () Bool)

(assert (=> b!475978 m!457757))

(declare-fun m!457759 () Bool)

(assert (=> b!475978 m!457759))

(declare-fun m!457761 () Bool)

(assert (=> b!475978 m!457761))

(declare-fun m!457763 () Bool)

(assert (=> b!475978 m!457763))

(declare-fun m!457765 () Bool)

(assert (=> start!42686 m!457765))

(declare-fun m!457767 () Bool)

(assert (=> start!42686 m!457767))

(declare-fun m!457769 () Bool)

(assert (=> start!42686 m!457769))

(check-sat (not b!475975) (not b!475980) (not mapNonEmpty!21973) (not start!42686) (not b!475981) tp_is_empty!13495 (not b_next!12067) (not b!475978) b_and!20565)
(check-sat b_and!20565 (not b_next!12067))
(get-model)

(declare-fun d!75499 () Bool)

(assert (=> d!75499 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42686 d!75499))

(declare-fun d!75501 () Bool)

(assert (=> d!75501 (= (array_inv!10744 _keys!1025) (bvsge (size!15128 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42686 d!75501))

(declare-fun d!75503 () Bool)

(assert (=> d!75503 (= (array_inv!10745 _values!833) (bvsge (size!15129 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42686 d!75503))

(declare-fun b!476041 () Bool)

(declare-fun e!279589 () Bool)

(declare-fun call!30670 () Bool)

(assert (=> b!476041 (= e!279589 call!30670)))

(declare-fun b!476042 () Bool)

(assert (=> b!476042 (= e!279589 call!30670)))

(declare-fun b!476043 () Bool)

(declare-fun e!279587 () Bool)

(assert (=> b!476043 (= e!279587 e!279589)))

(declare-fun c!57232 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!476043 (= c!57232 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30667 () Bool)

(assert (=> bm!30667 (= call!30670 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57232 (Cons!9075 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) Nil!9076) Nil!9076)))))

(declare-fun b!476044 () Bool)

(declare-fun e!279586 () Bool)

(declare-fun contains!2556 (List!9079 (_ BitVec 64)) Bool)

(assert (=> b!476044 (= e!279586 (contains!2556 Nil!9076 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476045 () Bool)

(declare-fun e!279588 () Bool)

(assert (=> b!476045 (= e!279588 e!279587)))

(declare-fun res!284227 () Bool)

(assert (=> b!476045 (=> (not res!284227) (not e!279587))))

(assert (=> b!476045 (= res!284227 (not e!279586))))

(declare-fun res!284225 () Bool)

(assert (=> b!476045 (=> (not res!284225) (not e!279586))))

(assert (=> b!476045 (= res!284225 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75505 () Bool)

(declare-fun res!284226 () Bool)

(assert (=> d!75505 (=> res!284226 e!279588)))

(assert (=> d!75505 (= res!284226 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75505 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9076) e!279588)))

(assert (= (and d!75505 (not res!284226)) b!476045))

(assert (= (and b!476045 res!284225) b!476044))

(assert (= (and b!476045 res!284227) b!476043))

(assert (= (and b!476043 c!57232) b!476042))

(assert (= (and b!476043 (not c!57232)) b!476041))

(assert (= (or b!476042 b!476041) bm!30667))

(declare-fun m!457839 () Bool)

(assert (=> b!476043 m!457839))

(assert (=> b!476043 m!457839))

(declare-fun m!457841 () Bool)

(assert (=> b!476043 m!457841))

(assert (=> bm!30667 m!457839))

(declare-fun m!457843 () Bool)

(assert (=> bm!30667 m!457843))

(assert (=> b!476044 m!457839))

(assert (=> b!476044 m!457839))

(declare-fun m!457845 () Bool)

(assert (=> b!476044 m!457845))

(assert (=> b!476045 m!457839))

(assert (=> b!476045 m!457839))

(assert (=> b!476045 m!457841))

(assert (=> b!475975 d!75505))

(declare-fun d!75507 () Bool)

(assert (=> d!75507 (= (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216900 () Unit!14008)

(declare-fun choose!1366 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 V!19099 V!19099 (_ BitVec 32) Int) Unit!14008)

(assert (=> d!75507 (= lt!216900 (choose!1366 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75507 (validMask!0 mask!1365)))

(assert (=> d!75507 (= (lemmaNoChangeToArrayThenSameMapNoExtras!275 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216900)))

(declare-fun bs!15088 () Bool)

(assert (= bs!15088 d!75507))

(assert (=> bs!15088 m!457745))

(assert (=> bs!15088 m!457743))

(declare-fun m!457847 () Bool)

(assert (=> bs!15088 m!457847))

(assert (=> bs!15088 m!457765))

(assert (=> b!475980 d!75507))

(declare-fun d!75509 () Bool)

(declare-fun e!279607 () Bool)

(assert (=> d!75509 e!279607))

(declare-fun res!284239 () Bool)

(assert (=> d!75509 (=> (not res!284239) (not e!279607))))

(declare-fun lt!216918 () ListLongMap!7921)

(declare-fun contains!2557 (ListLongMap!7921 (_ BitVec 64)) Bool)

(assert (=> d!75509 (= res!284239 (not (contains!2557 lt!216918 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279606 () ListLongMap!7921)

(assert (=> d!75509 (= lt!216918 e!279606)))

(declare-fun c!57241 () Bool)

(assert (=> d!75509 (= c!57241 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75509 (validMask!0 mask!1365)))

(assert (=> d!75509 (= (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216918)))

(declare-fun b!476070 () Bool)

(declare-fun res!284236 () Bool)

(assert (=> b!476070 (=> (not res!284236) (not e!279607))))

(assert (=> b!476070 (= res!284236 (not (contains!2557 lt!216918 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476071 () Bool)

(assert (=> b!476071 (= e!279606 (ListLongMap!7922 Nil!9077))))

(declare-fun b!476072 () Bool)

(declare-fun e!279608 () Bool)

(assert (=> b!476072 (= e!279607 e!279608)))

(declare-fun c!57242 () Bool)

(declare-fun e!279605 () Bool)

(assert (=> b!476072 (= c!57242 e!279605)))

(declare-fun res!284238 () Bool)

(assert (=> b!476072 (=> (not res!284238) (not e!279605))))

(assert (=> b!476072 (= res!284238 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476073 () Bool)

(declare-fun e!279610 () Bool)

(assert (=> b!476073 (= e!279610 (= lt!216918 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!476074 () Bool)

(declare-fun e!279609 () ListLongMap!7921)

(declare-fun call!30673 () ListLongMap!7921)

(assert (=> b!476074 (= e!279609 call!30673)))

(declare-fun b!476075 () Bool)

(assert (=> b!476075 (= e!279606 e!279609)))

(declare-fun c!57244 () Bool)

(assert (=> b!476075 (= c!57244 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30670 () Bool)

(assert (=> bm!30670 (= call!30673 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476076 () Bool)

(assert (=> b!476076 (= e!279605 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476076 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!476077 () Bool)

(assert (=> b!476077 (= e!279608 e!279610)))

(declare-fun c!57243 () Bool)

(assert (=> b!476077 (= c!57243 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476078 () Bool)

(declare-fun lt!216917 () Unit!14008)

(declare-fun lt!216919 () Unit!14008)

(assert (=> b!476078 (= lt!216917 lt!216919)))

(declare-fun lt!216921 () V!19099)

(declare-fun lt!216916 () (_ BitVec 64))

(declare-fun lt!216920 () (_ BitVec 64))

(declare-fun lt!216915 () ListLongMap!7921)

(assert (=> b!476078 (not (contains!2557 (+!1799 lt!216915 (tuple2!9019 lt!216920 lt!216921)) lt!216916))))

(declare-fun addStillNotContains!172 (ListLongMap!7921 (_ BitVec 64) V!19099 (_ BitVec 64)) Unit!14008)

(assert (=> b!476078 (= lt!216919 (addStillNotContains!172 lt!216915 lt!216920 lt!216921 lt!216916))))

(assert (=> b!476078 (= lt!216916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7179 (ValueCell!6404 V!19099) V!19099)

(declare-fun dynLambda!934 (Int (_ BitVec 64)) V!19099)

(assert (=> b!476078 (= lt!216921 (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476078 (= lt!216920 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476078 (= lt!216915 call!30673)))

(assert (=> b!476078 (= e!279609 (+!1799 call!30673 (tuple2!9019 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476079 () Bool)

(assert (=> b!476079 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> b!476079 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(declare-fun e!279604 () Bool)

(declare-fun apply!338 (ListLongMap!7921 (_ BitVec 64)) V!19099)

(assert (=> b!476079 (= e!279604 (= (apply!338 lt!216918 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476080 () Bool)

(assert (=> b!476080 (= e!279608 e!279604)))

(assert (=> b!476080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun res!284237 () Bool)

(assert (=> b!476080 (= res!284237 (contains!2557 lt!216918 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476080 (=> (not res!284237) (not e!279604))))

(declare-fun b!476081 () Bool)

(declare-fun isEmpty!589 (ListLongMap!7921) Bool)

(assert (=> b!476081 (= e!279610 (isEmpty!589 lt!216918))))

(assert (= (and d!75509 c!57241) b!476071))

(assert (= (and d!75509 (not c!57241)) b!476075))

(assert (= (and b!476075 c!57244) b!476078))

(assert (= (and b!476075 (not c!57244)) b!476074))

(assert (= (or b!476078 b!476074) bm!30670))

(assert (= (and d!75509 res!284239) b!476070))

(assert (= (and b!476070 res!284236) b!476072))

(assert (= (and b!476072 res!284238) b!476076))

(assert (= (and b!476072 c!57242) b!476080))

(assert (= (and b!476072 (not c!57242)) b!476077))

(assert (= (and b!476080 res!284237) b!476079))

(assert (= (and b!476077 c!57243) b!476073))

(assert (= (and b!476077 (not c!57243)) b!476081))

(declare-fun b_lambda!10323 () Bool)

(assert (=> (not b_lambda!10323) (not b!476078)))

(declare-fun t!15057 () Bool)

(declare-fun tb!3933 () Bool)

(assert (=> (and start!42686 (= defaultEntry!841 defaultEntry!841) t!15057) tb!3933))

(declare-fun result!7473 () Bool)

(assert (=> tb!3933 (= result!7473 tp_is_empty!13495)))

(assert (=> b!476078 t!15057))

(declare-fun b_and!20571 () Bool)

(assert (= b_and!20565 (and (=> t!15057 result!7473) b_and!20571)))

(declare-fun b_lambda!10325 () Bool)

(assert (=> (not b_lambda!10325) (not b!476079)))

(assert (=> b!476079 t!15057))

(declare-fun b_and!20573 () Bool)

(assert (= b_and!20571 (and (=> t!15057 result!7473) b_and!20573)))

(declare-fun m!457849 () Bool)

(assert (=> d!75509 m!457849))

(assert (=> d!75509 m!457765))

(declare-fun m!457851 () Bool)

(assert (=> b!476078 m!457851))

(declare-fun m!457853 () Bool)

(assert (=> b!476078 m!457853))

(assert (=> b!476078 m!457853))

(declare-fun m!457855 () Bool)

(assert (=> b!476078 m!457855))

(declare-fun m!457857 () Bool)

(assert (=> b!476078 m!457857))

(assert (=> b!476078 m!457855))

(declare-fun m!457859 () Bool)

(assert (=> b!476078 m!457859))

(assert (=> b!476078 m!457851))

(declare-fun m!457861 () Bool)

(assert (=> b!476078 m!457861))

(assert (=> b!476078 m!457839))

(declare-fun m!457863 () Bool)

(assert (=> b!476078 m!457863))

(declare-fun m!457865 () Bool)

(assert (=> bm!30670 m!457865))

(assert (=> b!476080 m!457839))

(assert (=> b!476080 m!457839))

(declare-fun m!457867 () Bool)

(assert (=> b!476080 m!457867))

(assert (=> b!476073 m!457865))

(declare-fun m!457869 () Bool)

(assert (=> b!476081 m!457869))

(assert (=> b!476079 m!457839))

(declare-fun m!457871 () Bool)

(assert (=> b!476079 m!457871))

(assert (=> b!476079 m!457853))

(assert (=> b!476079 m!457853))

(assert (=> b!476079 m!457855))

(assert (=> b!476079 m!457857))

(assert (=> b!476079 m!457855))

(assert (=> b!476079 m!457839))

(assert (=> b!476076 m!457839))

(assert (=> b!476076 m!457839))

(assert (=> b!476076 m!457841))

(declare-fun m!457873 () Bool)

(assert (=> b!476070 m!457873))

(assert (=> b!476075 m!457839))

(assert (=> b!476075 m!457839))

(assert (=> b!476075 m!457841))

(assert (=> b!475980 d!75509))

(declare-fun d!75511 () Bool)

(declare-fun e!279614 () Bool)

(assert (=> d!75511 e!279614))

(declare-fun res!284243 () Bool)

(assert (=> d!75511 (=> (not res!284243) (not e!279614))))

(declare-fun lt!216925 () ListLongMap!7921)

(assert (=> d!75511 (= res!284243 (not (contains!2557 lt!216925 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279613 () ListLongMap!7921)

(assert (=> d!75511 (= lt!216925 e!279613)))

(declare-fun c!57245 () Bool)

(assert (=> d!75511 (= c!57245 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75511 (validMask!0 mask!1365)))

(assert (=> d!75511 (= (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216925)))

(declare-fun b!476084 () Bool)

(declare-fun res!284240 () Bool)

(assert (=> b!476084 (=> (not res!284240) (not e!279614))))

(assert (=> b!476084 (= res!284240 (not (contains!2557 lt!216925 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476085 () Bool)

(assert (=> b!476085 (= e!279613 (ListLongMap!7922 Nil!9077))))

(declare-fun b!476086 () Bool)

(declare-fun e!279615 () Bool)

(assert (=> b!476086 (= e!279614 e!279615)))

(declare-fun c!57246 () Bool)

(declare-fun e!279612 () Bool)

(assert (=> b!476086 (= c!57246 e!279612)))

(declare-fun res!284242 () Bool)

(assert (=> b!476086 (=> (not res!284242) (not e!279612))))

(assert (=> b!476086 (= res!284242 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476087 () Bool)

(declare-fun e!279617 () Bool)

(assert (=> b!476087 (= e!279617 (= lt!216925 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!476088 () Bool)

(declare-fun e!279616 () ListLongMap!7921)

(declare-fun call!30674 () ListLongMap!7921)

(assert (=> b!476088 (= e!279616 call!30674)))

(declare-fun b!476089 () Bool)

(assert (=> b!476089 (= e!279613 e!279616)))

(declare-fun c!57248 () Bool)

(assert (=> b!476089 (= c!57248 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30671 () Bool)

(assert (=> bm!30671 (= call!30674 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476090 () Bool)

(assert (=> b!476090 (= e!279612 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476090 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!476091 () Bool)

(assert (=> b!476091 (= e!279615 e!279617)))

(declare-fun c!57247 () Bool)

(assert (=> b!476091 (= c!57247 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476092 () Bool)

(declare-fun lt!216924 () Unit!14008)

(declare-fun lt!216926 () Unit!14008)

(assert (=> b!476092 (= lt!216924 lt!216926)))

(declare-fun lt!216922 () ListLongMap!7921)

(declare-fun lt!216923 () (_ BitVec 64))

(declare-fun lt!216927 () (_ BitVec 64))

(declare-fun lt!216928 () V!19099)

(assert (=> b!476092 (not (contains!2557 (+!1799 lt!216922 (tuple2!9019 lt!216927 lt!216928)) lt!216923))))

(assert (=> b!476092 (= lt!216926 (addStillNotContains!172 lt!216922 lt!216927 lt!216928 lt!216923))))

(assert (=> b!476092 (= lt!216923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476092 (= lt!216928 (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476092 (= lt!216927 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476092 (= lt!216922 call!30674)))

(assert (=> b!476092 (= e!279616 (+!1799 call!30674 (tuple2!9019 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476093 () Bool)

(assert (=> b!476093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> b!476093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(declare-fun e!279611 () Bool)

(assert (=> b!476093 (= e!279611 (= (apply!338 lt!216925 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476094 () Bool)

(assert (=> b!476094 (= e!279615 e!279611)))

(assert (=> b!476094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun res!284241 () Bool)

(assert (=> b!476094 (= res!284241 (contains!2557 lt!216925 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476094 (=> (not res!284241) (not e!279611))))

(declare-fun b!476095 () Bool)

(assert (=> b!476095 (= e!279617 (isEmpty!589 lt!216925))))

(assert (= (and d!75511 c!57245) b!476085))

(assert (= (and d!75511 (not c!57245)) b!476089))

(assert (= (and b!476089 c!57248) b!476092))

(assert (= (and b!476089 (not c!57248)) b!476088))

(assert (= (or b!476092 b!476088) bm!30671))

(assert (= (and d!75511 res!284243) b!476084))

(assert (= (and b!476084 res!284240) b!476086))

(assert (= (and b!476086 res!284242) b!476090))

(assert (= (and b!476086 c!57246) b!476094))

(assert (= (and b!476086 (not c!57246)) b!476091))

(assert (= (and b!476094 res!284241) b!476093))

(assert (= (and b!476091 c!57247) b!476087))

(assert (= (and b!476091 (not c!57247)) b!476095))

(declare-fun b_lambda!10327 () Bool)

(assert (=> (not b_lambda!10327) (not b!476092)))

(assert (=> b!476092 t!15057))

(declare-fun b_and!20575 () Bool)

(assert (= b_and!20573 (and (=> t!15057 result!7473) b_and!20575)))

(declare-fun b_lambda!10329 () Bool)

(assert (=> (not b_lambda!10329) (not b!476093)))

(assert (=> b!476093 t!15057))

(declare-fun b_and!20577 () Bool)

(assert (= b_and!20575 (and (=> t!15057 result!7473) b_and!20577)))

(declare-fun m!457875 () Bool)

(assert (=> d!75511 m!457875))

(assert (=> d!75511 m!457765))

(declare-fun m!457877 () Bool)

(assert (=> b!476092 m!457877))

(assert (=> b!476092 m!457853))

(assert (=> b!476092 m!457853))

(assert (=> b!476092 m!457855))

(assert (=> b!476092 m!457857))

(assert (=> b!476092 m!457855))

(declare-fun m!457879 () Bool)

(assert (=> b!476092 m!457879))

(assert (=> b!476092 m!457877))

(declare-fun m!457881 () Bool)

(assert (=> b!476092 m!457881))

(assert (=> b!476092 m!457839))

(declare-fun m!457883 () Bool)

(assert (=> b!476092 m!457883))

(declare-fun m!457885 () Bool)

(assert (=> bm!30671 m!457885))

(assert (=> b!476094 m!457839))

(assert (=> b!476094 m!457839))

(declare-fun m!457887 () Bool)

(assert (=> b!476094 m!457887))

(assert (=> b!476087 m!457885))

(declare-fun m!457889 () Bool)

(assert (=> b!476095 m!457889))

(assert (=> b!476093 m!457839))

(declare-fun m!457891 () Bool)

(assert (=> b!476093 m!457891))

(assert (=> b!476093 m!457853))

(assert (=> b!476093 m!457853))

(assert (=> b!476093 m!457855))

(assert (=> b!476093 m!457857))

(assert (=> b!476093 m!457855))

(assert (=> b!476093 m!457839))

(assert (=> b!476090 m!457839))

(assert (=> b!476090 m!457839))

(assert (=> b!476090 m!457841))

(declare-fun m!457893 () Bool)

(assert (=> b!476084 m!457893))

(assert (=> b!476089 m!457839))

(assert (=> b!476089 m!457839))

(assert (=> b!476089 m!457841))

(assert (=> b!475980 d!75511))

(declare-fun b!476138 () Bool)

(declare-fun e!279650 () Bool)

(declare-fun lt!216979 () ListLongMap!7921)

(assert (=> b!476138 (= e!279650 (= (apply!338 lt!216979 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30686 () Bool)

(declare-fun call!30694 () ListLongMap!7921)

(assert (=> bm!30686 (= call!30694 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476139 () Bool)

(declare-fun e!279647 () Unit!14008)

(declare-fun lt!216982 () Unit!14008)

(assert (=> b!476139 (= e!279647 lt!216982)))

(declare-fun lt!216976 () ListLongMap!7921)

(assert (=> b!476139 (= lt!216976 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216993 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216974 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216974 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216977 () Unit!14008)

(declare-fun addStillContains!296 (ListLongMap!7921 (_ BitVec 64) V!19099 (_ BitVec 64)) Unit!14008)

(assert (=> b!476139 (= lt!216977 (addStillContains!296 lt!216976 lt!216993 zeroValue!794 lt!216974))))

(assert (=> b!476139 (contains!2557 (+!1799 lt!216976 (tuple2!9019 lt!216993 zeroValue!794)) lt!216974)))

(declare-fun lt!216978 () Unit!14008)

(assert (=> b!476139 (= lt!216978 lt!216977)))

(declare-fun lt!216985 () ListLongMap!7921)

(assert (=> b!476139 (= lt!216985 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216994 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216994 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216984 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216984 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216975 () Unit!14008)

(declare-fun addApplyDifferent!296 (ListLongMap!7921 (_ BitVec 64) V!19099 (_ BitVec 64)) Unit!14008)

(assert (=> b!476139 (= lt!216975 (addApplyDifferent!296 lt!216985 lt!216994 minValueAfter!38 lt!216984))))

(assert (=> b!476139 (= (apply!338 (+!1799 lt!216985 (tuple2!9019 lt!216994 minValueAfter!38)) lt!216984) (apply!338 lt!216985 lt!216984))))

(declare-fun lt!216987 () Unit!14008)

(assert (=> b!476139 (= lt!216987 lt!216975)))

(declare-fun lt!216990 () ListLongMap!7921)

(assert (=> b!476139 (= lt!216990 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216992 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216980 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216980 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216988 () Unit!14008)

(assert (=> b!476139 (= lt!216988 (addApplyDifferent!296 lt!216990 lt!216992 zeroValue!794 lt!216980))))

(assert (=> b!476139 (= (apply!338 (+!1799 lt!216990 (tuple2!9019 lt!216992 zeroValue!794)) lt!216980) (apply!338 lt!216990 lt!216980))))

(declare-fun lt!216986 () Unit!14008)

(assert (=> b!476139 (= lt!216986 lt!216988)))

(declare-fun lt!216989 () ListLongMap!7921)

(assert (=> b!476139 (= lt!216989 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216983 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216991 () (_ BitVec 64))

(assert (=> b!476139 (= lt!216991 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476139 (= lt!216982 (addApplyDifferent!296 lt!216989 lt!216983 minValueAfter!38 lt!216991))))

(assert (=> b!476139 (= (apply!338 (+!1799 lt!216989 (tuple2!9019 lt!216983 minValueAfter!38)) lt!216991) (apply!338 lt!216989 lt!216991))))

(declare-fun bm!30687 () Bool)

(declare-fun call!30695 () Bool)

(assert (=> bm!30687 (= call!30695 (contains!2557 lt!216979 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476140 () Bool)

(declare-fun c!57265 () Bool)

(assert (=> b!476140 (= c!57265 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279653 () ListLongMap!7921)

(declare-fun e!279654 () ListLongMap!7921)

(assert (=> b!476140 (= e!279653 e!279654)))

(declare-fun bm!30688 () Bool)

(declare-fun call!30693 () ListLongMap!7921)

(declare-fun c!57266 () Bool)

(declare-fun c!57261 () Bool)

(declare-fun call!30691 () ListLongMap!7921)

(declare-fun call!30689 () ListLongMap!7921)

(assert (=> bm!30688 (= call!30691 (+!1799 (ite c!57266 call!30694 (ite c!57261 call!30689 call!30693)) (ite (or c!57266 c!57261) (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!476141 () Bool)

(declare-fun e!279649 () Bool)

(declare-fun e!279648 () Bool)

(assert (=> b!476141 (= e!279649 e!279648)))

(declare-fun res!284270 () Bool)

(assert (=> b!476141 (=> (not res!284270) (not e!279648))))

(assert (=> b!476141 (= res!284270 (contains!2557 lt!216979 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun bm!30689 () Bool)

(assert (=> bm!30689 (= call!30689 call!30694)))

(declare-fun b!476142 () Bool)

(assert (=> b!476142 (= e!279648 (= (apply!338 lt!216979 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(assert (=> b!476142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun d!75513 () Bool)

(declare-fun e!279646 () Bool)

(assert (=> d!75513 e!279646))

(declare-fun res!284268 () Bool)

(assert (=> d!75513 (=> (not res!284268) (not e!279646))))

(assert (=> d!75513 (= res!284268 (or (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))))

(declare-fun lt!216973 () ListLongMap!7921)

(assert (=> d!75513 (= lt!216979 lt!216973)))

(declare-fun lt!216981 () Unit!14008)

(assert (=> d!75513 (= lt!216981 e!279647)))

(declare-fun c!57263 () Bool)

(declare-fun e!279655 () Bool)

(assert (=> d!75513 (= c!57263 e!279655)))

(declare-fun res!284267 () Bool)

(assert (=> d!75513 (=> (not res!284267) (not e!279655))))

(assert (=> d!75513 (= res!284267 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun e!279645 () ListLongMap!7921)

(assert (=> d!75513 (= lt!216973 e!279645)))

(assert (=> d!75513 (= c!57266 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75513 (validMask!0 mask!1365)))

(assert (=> d!75513 (= (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216979)))

(declare-fun bm!30690 () Bool)

(declare-fun call!30692 () ListLongMap!7921)

(assert (=> bm!30690 (= call!30692 call!30691)))

(declare-fun b!476143 () Bool)

(declare-fun e!279651 () Bool)

(assert (=> b!476143 (= e!279646 e!279651)))

(declare-fun c!57264 () Bool)

(assert (=> b!476143 (= c!57264 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476144 () Bool)

(assert (=> b!476144 (= e!279651 (not call!30695))))

(declare-fun b!476145 () Bool)

(assert (=> b!476145 (= e!279653 call!30692)))

(declare-fun b!476146 () Bool)

(declare-fun res!284265 () Bool)

(assert (=> b!476146 (=> (not res!284265) (not e!279646))))

(assert (=> b!476146 (= res!284265 e!279649)))

(declare-fun res!284269 () Bool)

(assert (=> b!476146 (=> res!284269 e!279649)))

(declare-fun e!279644 () Bool)

(assert (=> b!476146 (= res!284269 (not e!279644))))

(declare-fun res!284266 () Bool)

(assert (=> b!476146 (=> (not res!284266) (not e!279644))))

(assert (=> b!476146 (= res!284266 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476147 () Bool)

(declare-fun e!279652 () Bool)

(assert (=> b!476147 (= e!279651 e!279652)))

(declare-fun res!284264 () Bool)

(assert (=> b!476147 (= res!284264 call!30695)))

(assert (=> b!476147 (=> (not res!284264) (not e!279652))))

(declare-fun b!476148 () Bool)

(declare-fun Unit!14012 () Unit!14008)

(assert (=> b!476148 (= e!279647 Unit!14012)))

(declare-fun b!476149 () Bool)

(assert (=> b!476149 (= e!279645 e!279653)))

(assert (=> b!476149 (= c!57261 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476150 () Bool)

(assert (=> b!476150 (= e!279645 (+!1799 call!30691 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!476151 () Bool)

(declare-fun res!284262 () Bool)

(assert (=> b!476151 (=> (not res!284262) (not e!279646))))

(declare-fun e!279656 () Bool)

(assert (=> b!476151 (= res!284262 e!279656)))

(declare-fun c!57262 () Bool)

(assert (=> b!476151 (= c!57262 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!476152 () Bool)

(assert (=> b!476152 (= e!279655 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30691 () Bool)

(declare-fun call!30690 () Bool)

(assert (=> bm!30691 (= call!30690 (contains!2557 lt!216979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476153 () Bool)

(assert (=> b!476153 (= e!279656 e!279650)))

(declare-fun res!284263 () Bool)

(assert (=> b!476153 (= res!284263 call!30690)))

(assert (=> b!476153 (=> (not res!284263) (not e!279650))))

(declare-fun bm!30692 () Bool)

(assert (=> bm!30692 (= call!30693 call!30689)))

(declare-fun b!476154 () Bool)

(assert (=> b!476154 (= e!279656 (not call!30690))))

(declare-fun b!476155 () Bool)

(assert (=> b!476155 (= e!279652 (= (apply!338 lt!216979 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!476156 () Bool)

(assert (=> b!476156 (= e!279654 call!30693)))

(declare-fun b!476157 () Bool)

(assert (=> b!476157 (= e!279654 call!30692)))

(declare-fun b!476158 () Bool)

(assert (=> b!476158 (= e!279644 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75513 c!57266) b!476150))

(assert (= (and d!75513 (not c!57266)) b!476149))

(assert (= (and b!476149 c!57261) b!476145))

(assert (= (and b!476149 (not c!57261)) b!476140))

(assert (= (and b!476140 c!57265) b!476157))

(assert (= (and b!476140 (not c!57265)) b!476156))

(assert (= (or b!476157 b!476156) bm!30692))

(assert (= (or b!476145 bm!30692) bm!30689))

(assert (= (or b!476145 b!476157) bm!30690))

(assert (= (or b!476150 bm!30689) bm!30686))

(assert (= (or b!476150 bm!30690) bm!30688))

(assert (= (and d!75513 res!284267) b!476152))

(assert (= (and d!75513 c!57263) b!476139))

(assert (= (and d!75513 (not c!57263)) b!476148))

(assert (= (and d!75513 res!284268) b!476146))

(assert (= (and b!476146 res!284266) b!476158))

(assert (= (and b!476146 (not res!284269)) b!476141))

(assert (= (and b!476141 res!284270) b!476142))

(assert (= (and b!476146 res!284265) b!476151))

(assert (= (and b!476151 c!57262) b!476153))

(assert (= (and b!476151 (not c!57262)) b!476154))

(assert (= (and b!476153 res!284263) b!476138))

(assert (= (or b!476153 b!476154) bm!30691))

(assert (= (and b!476151 res!284262) b!476143))

(assert (= (and b!476143 c!57264) b!476147))

(assert (= (and b!476143 (not c!57264)) b!476144))

(assert (= (and b!476147 res!284264) b!476155))

(assert (= (or b!476147 b!476144) bm!30687))

(declare-fun b_lambda!10331 () Bool)

(assert (=> (not b_lambda!10331) (not b!476142)))

(assert (=> b!476142 t!15057))

(declare-fun b_and!20579 () Bool)

(assert (= b_and!20577 (and (=> t!15057 result!7473) b_and!20579)))

(assert (=> bm!30686 m!457743))

(assert (=> b!476158 m!457839))

(assert (=> b!476158 m!457839))

(assert (=> b!476158 m!457841))

(declare-fun m!457895 () Bool)

(assert (=> bm!30687 m!457895))

(assert (=> b!476139 m!457839))

(declare-fun m!457897 () Bool)

(assert (=> b!476139 m!457897))

(declare-fun m!457899 () Bool)

(assert (=> b!476139 m!457899))

(declare-fun m!457901 () Bool)

(assert (=> b!476139 m!457901))

(assert (=> b!476139 m!457743))

(declare-fun m!457903 () Bool)

(assert (=> b!476139 m!457903))

(declare-fun m!457905 () Bool)

(assert (=> b!476139 m!457905))

(declare-fun m!457907 () Bool)

(assert (=> b!476139 m!457907))

(declare-fun m!457909 () Bool)

(assert (=> b!476139 m!457909))

(declare-fun m!457911 () Bool)

(assert (=> b!476139 m!457911))

(assert (=> b!476139 m!457901))

(declare-fun m!457913 () Bool)

(assert (=> b!476139 m!457913))

(declare-fun m!457915 () Bool)

(assert (=> b!476139 m!457915))

(declare-fun m!457917 () Bool)

(assert (=> b!476139 m!457917))

(assert (=> b!476139 m!457909))

(declare-fun m!457919 () Bool)

(assert (=> b!476139 m!457919))

(declare-fun m!457921 () Bool)

(assert (=> b!476139 m!457921))

(declare-fun m!457923 () Bool)

(assert (=> b!476139 m!457923))

(declare-fun m!457925 () Bool)

(assert (=> b!476139 m!457925))

(assert (=> b!476139 m!457903))

(assert (=> b!476139 m!457923))

(declare-fun m!457927 () Bool)

(assert (=> b!476138 m!457927))

(declare-fun m!457929 () Bool)

(assert (=> bm!30691 m!457929))

(declare-fun m!457931 () Bool)

(assert (=> b!476155 m!457931))

(assert (=> b!476152 m!457839))

(assert (=> b!476152 m!457839))

(assert (=> b!476152 m!457841))

(assert (=> b!476141 m!457839))

(assert (=> b!476141 m!457839))

(declare-fun m!457933 () Bool)

(assert (=> b!476141 m!457933))

(declare-fun m!457935 () Bool)

(assert (=> b!476150 m!457935))

(assert (=> b!476142 m!457839))

(assert (=> b!476142 m!457855))

(assert (=> b!476142 m!457839))

(declare-fun m!457937 () Bool)

(assert (=> b!476142 m!457937))

(assert (=> b!476142 m!457853))

(assert (=> b!476142 m!457853))

(assert (=> b!476142 m!457855))

(assert (=> b!476142 m!457857))

(assert (=> d!75513 m!457765))

(declare-fun m!457939 () Bool)

(assert (=> bm!30688 m!457939))

(assert (=> b!475978 d!75513))

(declare-fun d!75515 () Bool)

(assert (=> d!75515 (= (+!1799 lt!216850 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1799 (+!1799 lt!216850 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!216997 () Unit!14008)

(declare-fun choose!1367 (ListLongMap!7921 (_ BitVec 64) V!19099 V!19099) Unit!14008)

(assert (=> d!75515 (= lt!216997 (choose!1367 lt!216850 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75515 (= (addSameAsAddTwiceSameKeyDiffValues!169 lt!216850 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!216997)))

(declare-fun bs!15089 () Bool)

(assert (= bs!15089 d!75515))

(declare-fun m!457941 () Bool)

(assert (=> bs!15089 m!457941))

(assert (=> bs!15089 m!457753))

(assert (=> bs!15089 m!457753))

(declare-fun m!457943 () Bool)

(assert (=> bs!15089 m!457943))

(declare-fun m!457945 () Bool)

(assert (=> bs!15089 m!457945))

(assert (=> b!475978 d!75515))

(declare-fun d!75517 () Bool)

(declare-fun e!279659 () Bool)

(assert (=> d!75517 e!279659))

(declare-fun res!284275 () Bool)

(assert (=> d!75517 (=> (not res!284275) (not e!279659))))

(declare-fun lt!217008 () ListLongMap!7921)

(assert (=> d!75517 (= res!284275 (contains!2557 lt!217008 (_1!4520 lt!216852)))))

(declare-fun lt!217009 () List!9080)

(assert (=> d!75517 (= lt!217008 (ListLongMap!7922 lt!217009))))

(declare-fun lt!217007 () Unit!14008)

(declare-fun lt!217006 () Unit!14008)

(assert (=> d!75517 (= lt!217007 lt!217006)))

(declare-datatypes ((Option!389 0))(
  ( (Some!388 (v!9085 V!19099)) (None!387) )
))
(declare-fun getValueByKey!383 (List!9080 (_ BitVec 64)) Option!389)

(assert (=> d!75517 (= (getValueByKey!383 lt!217009 (_1!4520 lt!216852)) (Some!388 (_2!4520 lt!216852)))))

(declare-fun lemmaContainsTupThenGetReturnValue!208 (List!9080 (_ BitVec 64) V!19099) Unit!14008)

(assert (=> d!75517 (= lt!217006 (lemmaContainsTupThenGetReturnValue!208 lt!217009 (_1!4520 lt!216852) (_2!4520 lt!216852)))))

(declare-fun insertStrictlySorted!211 (List!9080 (_ BitVec 64) V!19099) List!9080)

(assert (=> d!75517 (= lt!217009 (insertStrictlySorted!211 (toList!3976 lt!216850) (_1!4520 lt!216852) (_2!4520 lt!216852)))))

(assert (=> d!75517 (= (+!1799 lt!216850 lt!216852) lt!217008)))

(declare-fun b!476163 () Bool)

(declare-fun res!284276 () Bool)

(assert (=> b!476163 (=> (not res!284276) (not e!279659))))

(assert (=> b!476163 (= res!284276 (= (getValueByKey!383 (toList!3976 lt!217008) (_1!4520 lt!216852)) (Some!388 (_2!4520 lt!216852))))))

(declare-fun b!476164 () Bool)

(declare-fun contains!2558 (List!9080 tuple2!9018) Bool)

(assert (=> b!476164 (= e!279659 (contains!2558 (toList!3976 lt!217008) lt!216852))))

(assert (= (and d!75517 res!284275) b!476163))

(assert (= (and b!476163 res!284276) b!476164))

(declare-fun m!457947 () Bool)

(assert (=> d!75517 m!457947))

(declare-fun m!457949 () Bool)

(assert (=> d!75517 m!457949))

(declare-fun m!457951 () Bool)

(assert (=> d!75517 m!457951))

(declare-fun m!457953 () Bool)

(assert (=> d!75517 m!457953))

(declare-fun m!457955 () Bool)

(assert (=> b!476163 m!457955))

(declare-fun m!457957 () Bool)

(assert (=> b!476164 m!457957))

(assert (=> b!475978 d!75517))

(declare-fun d!75519 () Bool)

(declare-fun e!279660 () Bool)

(assert (=> d!75519 e!279660))

(declare-fun res!284277 () Bool)

(assert (=> d!75519 (=> (not res!284277) (not e!279660))))

(declare-fun lt!217012 () ListLongMap!7921)

(assert (=> d!75519 (= res!284277 (contains!2557 lt!217012 (_1!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!217013 () List!9080)

(assert (=> d!75519 (= lt!217012 (ListLongMap!7922 lt!217013))))

(declare-fun lt!217011 () Unit!14008)

(declare-fun lt!217010 () Unit!14008)

(assert (=> d!75519 (= lt!217011 lt!217010)))

(assert (=> d!75519 (= (getValueByKey!383 lt!217013 (_1!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!388 (_2!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75519 (= lt!217010 (lemmaContainsTupThenGetReturnValue!208 lt!217013 (_1!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75519 (= lt!217013 (insertStrictlySorted!211 (toList!3976 lt!216850) (_1!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75519 (= (+!1799 lt!216850 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217012)))

(declare-fun b!476165 () Bool)

(declare-fun res!284278 () Bool)

(assert (=> b!476165 (=> (not res!284278) (not e!279660))))

(assert (=> b!476165 (= res!284278 (= (getValueByKey!383 (toList!3976 lt!217012) (_1!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!388 (_2!4520 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!476166 () Bool)

(assert (=> b!476166 (= e!279660 (contains!2558 (toList!3976 lt!217012) (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75519 res!284277) b!476165))

(assert (= (and b!476165 res!284278) b!476166))

(declare-fun m!457959 () Bool)

(assert (=> d!75519 m!457959))

(declare-fun m!457961 () Bool)

(assert (=> d!75519 m!457961))

(declare-fun m!457963 () Bool)

(assert (=> d!75519 m!457963))

(declare-fun m!457965 () Bool)

(assert (=> d!75519 m!457965))

(declare-fun m!457967 () Bool)

(assert (=> b!476165 m!457967))

(declare-fun m!457969 () Bool)

(assert (=> b!476166 m!457969))

(assert (=> b!475978 d!75519))

(declare-fun d!75521 () Bool)

(declare-fun e!279661 () Bool)

(assert (=> d!75521 e!279661))

(declare-fun res!284279 () Bool)

(assert (=> d!75521 (=> (not res!284279) (not e!279661))))

(declare-fun lt!217016 () ListLongMap!7921)

(assert (=> d!75521 (= res!284279 (contains!2557 lt!217016 (_1!4520 lt!216852)))))

(declare-fun lt!217017 () List!9080)

(assert (=> d!75521 (= lt!217016 (ListLongMap!7922 lt!217017))))

(declare-fun lt!217015 () Unit!14008)

(declare-fun lt!217014 () Unit!14008)

(assert (=> d!75521 (= lt!217015 lt!217014)))

(assert (=> d!75521 (= (getValueByKey!383 lt!217017 (_1!4520 lt!216852)) (Some!388 (_2!4520 lt!216852)))))

(assert (=> d!75521 (= lt!217014 (lemmaContainsTupThenGetReturnValue!208 lt!217017 (_1!4520 lt!216852) (_2!4520 lt!216852)))))

(assert (=> d!75521 (= lt!217017 (insertStrictlySorted!211 (toList!3976 lt!216854) (_1!4520 lt!216852) (_2!4520 lt!216852)))))

(assert (=> d!75521 (= (+!1799 lt!216854 lt!216852) lt!217016)))

(declare-fun b!476167 () Bool)

(declare-fun res!284280 () Bool)

(assert (=> b!476167 (=> (not res!284280) (not e!279661))))

(assert (=> b!476167 (= res!284280 (= (getValueByKey!383 (toList!3976 lt!217016) (_1!4520 lt!216852)) (Some!388 (_2!4520 lt!216852))))))

(declare-fun b!476168 () Bool)

(assert (=> b!476168 (= e!279661 (contains!2558 (toList!3976 lt!217016) lt!216852))))

(assert (= (and d!75521 res!284279) b!476167))

(assert (= (and b!476167 res!284280) b!476168))

(declare-fun m!457971 () Bool)

(assert (=> d!75521 m!457971))

(declare-fun m!457973 () Bool)

(assert (=> d!75521 m!457973))

(declare-fun m!457975 () Bool)

(assert (=> d!75521 m!457975))

(declare-fun m!457977 () Bool)

(assert (=> d!75521 m!457977))

(declare-fun m!457979 () Bool)

(assert (=> b!476167 m!457979))

(declare-fun m!457981 () Bool)

(assert (=> b!476168 m!457981))

(assert (=> b!475978 d!75521))

(declare-fun d!75523 () Bool)

(declare-fun e!279662 () Bool)

(assert (=> d!75523 e!279662))

(declare-fun res!284281 () Bool)

(assert (=> d!75523 (=> (not res!284281) (not e!279662))))

(declare-fun lt!217020 () ListLongMap!7921)

(assert (=> d!75523 (= res!284281 (contains!2557 lt!217020 (_1!4520 lt!216852)))))

(declare-fun lt!217021 () List!9080)

(assert (=> d!75523 (= lt!217020 (ListLongMap!7922 lt!217021))))

(declare-fun lt!217019 () Unit!14008)

(declare-fun lt!217018 () Unit!14008)

(assert (=> d!75523 (= lt!217019 lt!217018)))

(assert (=> d!75523 (= (getValueByKey!383 lt!217021 (_1!4520 lt!216852)) (Some!388 (_2!4520 lt!216852)))))

(assert (=> d!75523 (= lt!217018 (lemmaContainsTupThenGetReturnValue!208 lt!217021 (_1!4520 lt!216852) (_2!4520 lt!216852)))))

(assert (=> d!75523 (= lt!217021 (insertStrictlySorted!211 (toList!3976 (+!1799 lt!216850 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4520 lt!216852) (_2!4520 lt!216852)))))

(assert (=> d!75523 (= (+!1799 (+!1799 lt!216850 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216852) lt!217020)))

(declare-fun b!476169 () Bool)

(declare-fun res!284282 () Bool)

(assert (=> b!476169 (=> (not res!284282) (not e!279662))))

(assert (=> b!476169 (= res!284282 (= (getValueByKey!383 (toList!3976 lt!217020) (_1!4520 lt!216852)) (Some!388 (_2!4520 lt!216852))))))

(declare-fun b!476170 () Bool)

(assert (=> b!476170 (= e!279662 (contains!2558 (toList!3976 lt!217020) lt!216852))))

(assert (= (and d!75523 res!284281) b!476169))

(assert (= (and b!476169 res!284282) b!476170))

(declare-fun m!457983 () Bool)

(assert (=> d!75523 m!457983))

(declare-fun m!457985 () Bool)

(assert (=> d!75523 m!457985))

(declare-fun m!457987 () Bool)

(assert (=> d!75523 m!457987))

(declare-fun m!457989 () Bool)

(assert (=> d!75523 m!457989))

(declare-fun m!457991 () Bool)

(assert (=> b!476169 m!457991))

(declare-fun m!457993 () Bool)

(assert (=> b!476170 m!457993))

(assert (=> b!475978 d!75523))

(declare-fun b!476171 () Bool)

(declare-fun e!279669 () Bool)

(declare-fun lt!217028 () ListLongMap!7921)

(assert (=> b!476171 (= e!279669 (= (apply!338 lt!217028 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30693 () Bool)

(declare-fun call!30701 () ListLongMap!7921)

(assert (=> bm!30693 (= call!30701 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476172 () Bool)

(declare-fun e!279666 () Unit!14008)

(declare-fun lt!217031 () Unit!14008)

(assert (=> b!476172 (= e!279666 lt!217031)))

(declare-fun lt!217025 () ListLongMap!7921)

(assert (=> b!476172 (= lt!217025 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217042 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217023 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217023 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217026 () Unit!14008)

(assert (=> b!476172 (= lt!217026 (addStillContains!296 lt!217025 lt!217042 zeroValue!794 lt!217023))))

(assert (=> b!476172 (contains!2557 (+!1799 lt!217025 (tuple2!9019 lt!217042 zeroValue!794)) lt!217023)))

(declare-fun lt!217027 () Unit!14008)

(assert (=> b!476172 (= lt!217027 lt!217026)))

(declare-fun lt!217034 () ListLongMap!7921)

(assert (=> b!476172 (= lt!217034 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217043 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217043 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217033 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217033 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217024 () Unit!14008)

(assert (=> b!476172 (= lt!217024 (addApplyDifferent!296 lt!217034 lt!217043 minValueBefore!38 lt!217033))))

(assert (=> b!476172 (= (apply!338 (+!1799 lt!217034 (tuple2!9019 lt!217043 minValueBefore!38)) lt!217033) (apply!338 lt!217034 lt!217033))))

(declare-fun lt!217036 () Unit!14008)

(assert (=> b!476172 (= lt!217036 lt!217024)))

(declare-fun lt!217039 () ListLongMap!7921)

(assert (=> b!476172 (= lt!217039 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217041 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217029 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217029 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217037 () Unit!14008)

(assert (=> b!476172 (= lt!217037 (addApplyDifferent!296 lt!217039 lt!217041 zeroValue!794 lt!217029))))

(assert (=> b!476172 (= (apply!338 (+!1799 lt!217039 (tuple2!9019 lt!217041 zeroValue!794)) lt!217029) (apply!338 lt!217039 lt!217029))))

(declare-fun lt!217035 () Unit!14008)

(assert (=> b!476172 (= lt!217035 lt!217037)))

(declare-fun lt!217038 () ListLongMap!7921)

(assert (=> b!476172 (= lt!217038 (getCurrentListMapNoExtraKeys!2141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217032 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217032 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217040 () (_ BitVec 64))

(assert (=> b!476172 (= lt!217040 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476172 (= lt!217031 (addApplyDifferent!296 lt!217038 lt!217032 minValueBefore!38 lt!217040))))

(assert (=> b!476172 (= (apply!338 (+!1799 lt!217038 (tuple2!9019 lt!217032 minValueBefore!38)) lt!217040) (apply!338 lt!217038 lt!217040))))

(declare-fun bm!30694 () Bool)

(declare-fun call!30702 () Bool)

(assert (=> bm!30694 (= call!30702 (contains!2557 lt!217028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476173 () Bool)

(declare-fun c!57271 () Bool)

(assert (=> b!476173 (= c!57271 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279672 () ListLongMap!7921)

(declare-fun e!279673 () ListLongMap!7921)

(assert (=> b!476173 (= e!279672 e!279673)))

(declare-fun c!57272 () Bool)

(declare-fun c!57267 () Bool)

(declare-fun call!30700 () ListLongMap!7921)

(declare-fun call!30696 () ListLongMap!7921)

(declare-fun bm!30695 () Bool)

(declare-fun call!30698 () ListLongMap!7921)

(assert (=> bm!30695 (= call!30698 (+!1799 (ite c!57272 call!30701 (ite c!57267 call!30696 call!30700)) (ite (or c!57272 c!57267) (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!476174 () Bool)

(declare-fun e!279668 () Bool)

(declare-fun e!279667 () Bool)

(assert (=> b!476174 (= e!279668 e!279667)))

(declare-fun res!284291 () Bool)

(assert (=> b!476174 (=> (not res!284291) (not e!279667))))

(assert (=> b!476174 (= res!284291 (contains!2557 lt!217028 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476174 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun bm!30696 () Bool)

(assert (=> bm!30696 (= call!30696 call!30701)))

(declare-fun b!476175 () Bool)

(assert (=> b!476175 (= e!279667 (= (apply!338 lt!217028 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7179 (select (arr!14776 _values!833) #b00000000000000000000000000000000) (dynLambda!934 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(assert (=> b!476175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun d!75525 () Bool)

(declare-fun e!279665 () Bool)

(assert (=> d!75525 e!279665))

(declare-fun res!284289 () Bool)

(assert (=> d!75525 (=> (not res!284289) (not e!279665))))

(assert (=> d!75525 (= res!284289 (or (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))))

(declare-fun lt!217022 () ListLongMap!7921)

(assert (=> d!75525 (= lt!217028 lt!217022)))

(declare-fun lt!217030 () Unit!14008)

(assert (=> d!75525 (= lt!217030 e!279666)))

(declare-fun c!57269 () Bool)

(declare-fun e!279674 () Bool)

(assert (=> d!75525 (= c!57269 e!279674)))

(declare-fun res!284288 () Bool)

(assert (=> d!75525 (=> (not res!284288) (not e!279674))))

(assert (=> d!75525 (= res!284288 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun e!279664 () ListLongMap!7921)

(assert (=> d!75525 (= lt!217022 e!279664)))

(assert (=> d!75525 (= c!57272 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75525 (validMask!0 mask!1365)))

(assert (=> d!75525 (= (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217028)))

(declare-fun bm!30697 () Bool)

(declare-fun call!30699 () ListLongMap!7921)

(assert (=> bm!30697 (= call!30699 call!30698)))

(declare-fun b!476176 () Bool)

(declare-fun e!279670 () Bool)

(assert (=> b!476176 (= e!279665 e!279670)))

(declare-fun c!57270 () Bool)

(assert (=> b!476176 (= c!57270 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476177 () Bool)

(assert (=> b!476177 (= e!279670 (not call!30702))))

(declare-fun b!476178 () Bool)

(assert (=> b!476178 (= e!279672 call!30699)))

(declare-fun b!476179 () Bool)

(declare-fun res!284286 () Bool)

(assert (=> b!476179 (=> (not res!284286) (not e!279665))))

(assert (=> b!476179 (= res!284286 e!279668)))

(declare-fun res!284290 () Bool)

(assert (=> b!476179 (=> res!284290 e!279668)))

(declare-fun e!279663 () Bool)

(assert (=> b!476179 (= res!284290 (not e!279663))))

(declare-fun res!284287 () Bool)

(assert (=> b!476179 (=> (not res!284287) (not e!279663))))

(assert (=> b!476179 (= res!284287 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476180 () Bool)

(declare-fun e!279671 () Bool)

(assert (=> b!476180 (= e!279670 e!279671)))

(declare-fun res!284285 () Bool)

(assert (=> b!476180 (= res!284285 call!30702)))

(assert (=> b!476180 (=> (not res!284285) (not e!279671))))

(declare-fun b!476181 () Bool)

(declare-fun Unit!14013 () Unit!14008)

(assert (=> b!476181 (= e!279666 Unit!14013)))

(declare-fun b!476182 () Bool)

(assert (=> b!476182 (= e!279664 e!279672)))

(assert (=> b!476182 (= c!57267 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476183 () Bool)

(assert (=> b!476183 (= e!279664 (+!1799 call!30698 (tuple2!9019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!476184 () Bool)

(declare-fun res!284283 () Bool)

(assert (=> b!476184 (=> (not res!284283) (not e!279665))))

(declare-fun e!279675 () Bool)

(assert (=> b!476184 (= res!284283 e!279675)))

(declare-fun c!57268 () Bool)

(assert (=> b!476184 (= c!57268 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!476185 () Bool)

(assert (=> b!476185 (= e!279674 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30698 () Bool)

(declare-fun call!30697 () Bool)

(assert (=> bm!30698 (= call!30697 (contains!2557 lt!217028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476186 () Bool)

(assert (=> b!476186 (= e!279675 e!279669)))

(declare-fun res!284284 () Bool)

(assert (=> b!476186 (= res!284284 call!30697)))

(assert (=> b!476186 (=> (not res!284284) (not e!279669))))

(declare-fun bm!30699 () Bool)

(assert (=> bm!30699 (= call!30700 call!30696)))

(declare-fun b!476187 () Bool)

(assert (=> b!476187 (= e!279675 (not call!30697))))

(declare-fun b!476188 () Bool)

(assert (=> b!476188 (= e!279671 (= (apply!338 lt!217028 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!476189 () Bool)

(assert (=> b!476189 (= e!279673 call!30700)))

(declare-fun b!476190 () Bool)

(assert (=> b!476190 (= e!279673 call!30699)))

(declare-fun b!476191 () Bool)

(assert (=> b!476191 (= e!279663 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75525 c!57272) b!476183))

(assert (= (and d!75525 (not c!57272)) b!476182))

(assert (= (and b!476182 c!57267) b!476178))

(assert (= (and b!476182 (not c!57267)) b!476173))

(assert (= (and b!476173 c!57271) b!476190))

(assert (= (and b!476173 (not c!57271)) b!476189))

(assert (= (or b!476190 b!476189) bm!30699))

(assert (= (or b!476178 bm!30699) bm!30696))

(assert (= (or b!476178 b!476190) bm!30697))

(assert (= (or b!476183 bm!30696) bm!30693))

(assert (= (or b!476183 bm!30697) bm!30695))

(assert (= (and d!75525 res!284288) b!476185))

(assert (= (and d!75525 c!57269) b!476172))

(assert (= (and d!75525 (not c!57269)) b!476181))

(assert (= (and d!75525 res!284289) b!476179))

(assert (= (and b!476179 res!284287) b!476191))

(assert (= (and b!476179 (not res!284290)) b!476174))

(assert (= (and b!476174 res!284291) b!476175))

(assert (= (and b!476179 res!284286) b!476184))

(assert (= (and b!476184 c!57268) b!476186))

(assert (= (and b!476184 (not c!57268)) b!476187))

(assert (= (and b!476186 res!284284) b!476171))

(assert (= (or b!476186 b!476187) bm!30698))

(assert (= (and b!476184 res!284283) b!476176))

(assert (= (and b!476176 c!57270) b!476180))

(assert (= (and b!476176 (not c!57270)) b!476177))

(assert (= (and b!476180 res!284285) b!476188))

(assert (= (or b!476180 b!476177) bm!30694))

(declare-fun b_lambda!10333 () Bool)

(assert (=> (not b_lambda!10333) (not b!476175)))

(assert (=> b!476175 t!15057))

(declare-fun b_and!20581 () Bool)

(assert (= b_and!20579 (and (=> t!15057 result!7473) b_and!20581)))

(assert (=> bm!30693 m!457745))

(assert (=> b!476191 m!457839))

(assert (=> b!476191 m!457839))

(assert (=> b!476191 m!457841))

(declare-fun m!457995 () Bool)

(assert (=> bm!30694 m!457995))

(assert (=> b!476172 m!457839))

(declare-fun m!457997 () Bool)

(assert (=> b!476172 m!457997))

(declare-fun m!457999 () Bool)

(assert (=> b!476172 m!457999))

(declare-fun m!458001 () Bool)

(assert (=> b!476172 m!458001))

(assert (=> b!476172 m!457745))

(declare-fun m!458003 () Bool)

(assert (=> b!476172 m!458003))

(declare-fun m!458005 () Bool)

(assert (=> b!476172 m!458005))

(declare-fun m!458007 () Bool)

(assert (=> b!476172 m!458007))

(declare-fun m!458009 () Bool)

(assert (=> b!476172 m!458009))

(declare-fun m!458011 () Bool)

(assert (=> b!476172 m!458011))

(assert (=> b!476172 m!458001))

(declare-fun m!458013 () Bool)

(assert (=> b!476172 m!458013))

(declare-fun m!458015 () Bool)

(assert (=> b!476172 m!458015))

(declare-fun m!458017 () Bool)

(assert (=> b!476172 m!458017))

(assert (=> b!476172 m!458009))

(declare-fun m!458019 () Bool)

(assert (=> b!476172 m!458019))

(declare-fun m!458021 () Bool)

(assert (=> b!476172 m!458021))

(declare-fun m!458023 () Bool)

(assert (=> b!476172 m!458023))

(declare-fun m!458025 () Bool)

(assert (=> b!476172 m!458025))

(assert (=> b!476172 m!458003))

(assert (=> b!476172 m!458023))

(declare-fun m!458027 () Bool)

(assert (=> b!476171 m!458027))

(declare-fun m!458029 () Bool)

(assert (=> bm!30698 m!458029))

(declare-fun m!458031 () Bool)

(assert (=> b!476188 m!458031))

(assert (=> b!476185 m!457839))

(assert (=> b!476185 m!457839))

(assert (=> b!476185 m!457841))

(assert (=> b!476174 m!457839))

(assert (=> b!476174 m!457839))

(declare-fun m!458033 () Bool)

(assert (=> b!476174 m!458033))

(declare-fun m!458035 () Bool)

(assert (=> b!476183 m!458035))

(assert (=> b!476175 m!457839))

(assert (=> b!476175 m!457855))

(assert (=> b!476175 m!457839))

(declare-fun m!458037 () Bool)

(assert (=> b!476175 m!458037))

(assert (=> b!476175 m!457853))

(assert (=> b!476175 m!457853))

(assert (=> b!476175 m!457855))

(assert (=> b!476175 m!457857))

(assert (=> d!75525 m!457765))

(declare-fun m!458039 () Bool)

(assert (=> bm!30695 m!458039))

(assert (=> b!475978 d!75525))

(declare-fun d!75527 () Bool)

(declare-fun e!279676 () Bool)

(assert (=> d!75527 e!279676))

(declare-fun res!284292 () Bool)

(assert (=> d!75527 (=> (not res!284292) (not e!279676))))

(declare-fun lt!217046 () ListLongMap!7921)

(assert (=> d!75527 (= res!284292 (contains!2557 lt!217046 (_1!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!217047 () List!9080)

(assert (=> d!75527 (= lt!217046 (ListLongMap!7922 lt!217047))))

(declare-fun lt!217045 () Unit!14008)

(declare-fun lt!217044 () Unit!14008)

(assert (=> d!75527 (= lt!217045 lt!217044)))

(assert (=> d!75527 (= (getValueByKey!383 lt!217047 (_1!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!388 (_2!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75527 (= lt!217044 (lemmaContainsTupThenGetReturnValue!208 lt!217047 (_1!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75527 (= lt!217047 (insertStrictlySorted!211 (toList!3976 lt!216851) (_1!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75527 (= (+!1799 lt!216851 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!217046)))

(declare-fun b!476192 () Bool)

(declare-fun res!284293 () Bool)

(assert (=> b!476192 (=> (not res!284293) (not e!279676))))

(assert (=> b!476192 (= res!284293 (= (getValueByKey!383 (toList!3976 lt!217046) (_1!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!388 (_2!4520 (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!476193 () Bool)

(assert (=> b!476193 (= e!279676 (contains!2558 (toList!3976 lt!217046) (tuple2!9019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75527 res!284292) b!476192))

(assert (= (and b!476192 res!284293) b!476193))

(declare-fun m!458041 () Bool)

(assert (=> d!75527 m!458041))

(declare-fun m!458043 () Bool)

(assert (=> d!75527 m!458043))

(declare-fun m!458045 () Bool)

(assert (=> d!75527 m!458045))

(declare-fun m!458047 () Bool)

(assert (=> d!75527 m!458047))

(declare-fun m!458049 () Bool)

(assert (=> b!476192 m!458049))

(declare-fun m!458051 () Bool)

(assert (=> b!476193 m!458051))

(assert (=> b!475978 d!75527))

(declare-fun b!476202 () Bool)

(declare-fun e!279683 () Bool)

(declare-fun e!279685 () Bool)

(assert (=> b!476202 (= e!279683 e!279685)))

(declare-fun lt!217056 () (_ BitVec 64))

(assert (=> b!476202 (= lt!217056 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217054 () Unit!14008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30723 (_ BitVec 64) (_ BitVec 32)) Unit!14008)

(assert (=> b!476202 (= lt!217054 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!217056 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!476202 (arrayContainsKey!0 _keys!1025 lt!217056 #b00000000000000000000000000000000)))

(declare-fun lt!217055 () Unit!14008)

(assert (=> b!476202 (= lt!217055 lt!217054)))

(declare-fun res!284298 () Bool)

(declare-datatypes ((SeekEntryResult!3557 0))(
  ( (MissingZero!3557 (index!16407 (_ BitVec 32))) (Found!3557 (index!16408 (_ BitVec 32))) (Intermediate!3557 (undefined!4369 Bool) (index!16409 (_ BitVec 32)) (x!44694 (_ BitVec 32))) (Undefined!3557) (MissingVacant!3557 (index!16410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30723 (_ BitVec 32)) SeekEntryResult!3557)

(assert (=> b!476202 (= res!284298 (= (seekEntryOrOpen!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3557 #b00000000000000000000000000000000)))))

(assert (=> b!476202 (=> (not res!284298) (not e!279685))))

(declare-fun b!476203 () Bool)

(declare-fun call!30705 () Bool)

(assert (=> b!476203 (= e!279685 call!30705)))

(declare-fun bm!30702 () Bool)

(assert (=> bm!30702 (= call!30705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75529 () Bool)

(declare-fun res!284299 () Bool)

(declare-fun e!279684 () Bool)

(assert (=> d!75529 (=> res!284299 e!279684)))

(assert (=> d!75529 (= res!284299 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279684)))

(declare-fun b!476204 () Bool)

(assert (=> b!476204 (= e!279684 e!279683)))

(declare-fun c!57275 () Bool)

(assert (=> b!476204 (= c!57275 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476205 () Bool)

(assert (=> b!476205 (= e!279683 call!30705)))

(assert (= (and d!75529 (not res!284299)) b!476204))

(assert (= (and b!476204 c!57275) b!476202))

(assert (= (and b!476204 (not c!57275)) b!476205))

(assert (= (and b!476202 res!284298) b!476203))

(assert (= (or b!476203 b!476205) bm!30702))

(assert (=> b!476202 m!457839))

(declare-fun m!458053 () Bool)

(assert (=> b!476202 m!458053))

(declare-fun m!458055 () Bool)

(assert (=> b!476202 m!458055))

(assert (=> b!476202 m!457839))

(declare-fun m!458057 () Bool)

(assert (=> b!476202 m!458057))

(declare-fun m!458059 () Bool)

(assert (=> bm!30702 m!458059))

(assert (=> b!476204 m!457839))

(assert (=> b!476204 m!457839))

(assert (=> b!476204 m!457841))

(assert (=> b!475981 d!75529))

(declare-fun condMapEmpty!21982 () Bool)

(declare-fun mapDefault!21982 () ValueCell!6404)

(assert (=> mapNonEmpty!21973 (= condMapEmpty!21982 (= mapRest!21973 ((as const (Array (_ BitVec 32) ValueCell!6404)) mapDefault!21982)))))

(declare-fun e!279691 () Bool)

(declare-fun mapRes!21982 () Bool)

(assert (=> mapNonEmpty!21973 (= tp!42253 (and e!279691 mapRes!21982))))

(declare-fun mapIsEmpty!21982 () Bool)

(assert (=> mapIsEmpty!21982 mapRes!21982))

(declare-fun b!476212 () Bool)

(declare-fun e!279690 () Bool)

(assert (=> b!476212 (= e!279690 tp_is_empty!13495)))

(declare-fun b!476213 () Bool)

(assert (=> b!476213 (= e!279691 tp_is_empty!13495)))

(declare-fun mapNonEmpty!21982 () Bool)

(declare-fun tp!42268 () Bool)

(assert (=> mapNonEmpty!21982 (= mapRes!21982 (and tp!42268 e!279690))))

(declare-fun mapKey!21982 () (_ BitVec 32))

(declare-fun mapRest!21982 () (Array (_ BitVec 32) ValueCell!6404))

(declare-fun mapValue!21982 () ValueCell!6404)

(assert (=> mapNonEmpty!21982 (= mapRest!21973 (store mapRest!21982 mapKey!21982 mapValue!21982))))

(assert (= (and mapNonEmpty!21973 condMapEmpty!21982) mapIsEmpty!21982))

(assert (= (and mapNonEmpty!21973 (not condMapEmpty!21982)) mapNonEmpty!21982))

(assert (= (and mapNonEmpty!21982 ((_ is ValueCellFull!6404) mapValue!21982)) b!476212))

(assert (= (and mapNonEmpty!21973 ((_ is ValueCellFull!6404) mapDefault!21982)) b!476213))

(declare-fun m!458061 () Bool)

(assert (=> mapNonEmpty!21982 m!458061))

(declare-fun b_lambda!10335 () Bool)

(assert (= b_lambda!10327 (or (and start!42686 b_free!12067) b_lambda!10335)))

(declare-fun b_lambda!10337 () Bool)

(assert (= b_lambda!10323 (or (and start!42686 b_free!12067) b_lambda!10337)))

(declare-fun b_lambda!10339 () Bool)

(assert (= b_lambda!10333 (or (and start!42686 b_free!12067) b_lambda!10339)))

(declare-fun b_lambda!10341 () Bool)

(assert (= b_lambda!10331 (or (and start!42686 b_free!12067) b_lambda!10341)))

(declare-fun b_lambda!10343 () Bool)

(assert (= b_lambda!10325 (or (and start!42686 b_free!12067) b_lambda!10343)))

(declare-fun b_lambda!10345 () Bool)

(assert (= b_lambda!10329 (or (and start!42686 b_free!12067) b_lambda!10345)))

(check-sat (not b!476171) (not b_lambda!10343) (not b!476158) (not b!476084) (not b_lambda!10341) (not d!75515) (not b!476170) (not b!476183) (not b!476080) (not bm!30694) (not b!476093) (not b!476045) (not b!476169) (not b!476094) b_and!20581 (not d!75519) (not d!75523) (not b!476165) (not b!476174) (not b!476191) (not b!476139) (not b!476073) (not b!476090) (not d!75511) (not b!476150) (not b!476076) (not b!476168) (not b!476142) (not b!476166) (not b!476188) (not b!476043) (not bm!30693) (not b!476175) (not bm!30688) (not b!476087) (not b!476185) (not b!476078) (not d!75509) (not bm!30686) (not b_lambda!10345) (not b!476152) (not bm!30670) (not b!476167) (not d!75527) (not bm!30698) (not b!476089) (not bm!30695) (not b!476095) (not b!476141) (not b!476204) (not b!476075) (not b!476092) (not b!476164) (not b!476070) (not d!75521) (not bm!30671) (not d!75507) (not bm!30687) tp_is_empty!13495 (not bm!30691) (not bm!30667) (not b!476155) (not b!476079) (not b!476163) (not b_next!12067) (not b!476202) (not bm!30702) (not b!476081) (not b!476044) (not d!75513) (not mapNonEmpty!21982) (not b!476192) (not d!75525) (not b!476172) (not b_lambda!10339) (not b_lambda!10335) (not b!476193) (not b_lambda!10337) (not b!476138) (not d!75517))
(check-sat b_and!20581 (not b_next!12067))
