; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107330 () Bool)

(assert start!107330)

(declare-fun b_free!27649 () Bool)

(declare-fun b_next!27649 () Bool)

(assert (=> start!107330 (= b_free!27649 (not b_next!27649))))

(declare-fun tp!97453 () Bool)

(declare-fun b_and!45663 () Bool)

(assert (=> start!107330 (= tp!97453 b_and!45663)))

(declare-fun b!1271951 () Bool)

(declare-fun res!846188 () Bool)

(declare-fun e!725448 () Bool)

(assert (=> b!1271951 (=> (not res!846188) (not e!725448))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!83187 0))(
  ( (array!83188 (arr!40131 (Array (_ BitVec 32) (_ BitVec 64))) (size!40669 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83187)

(assert (=> b!1271951 (= res!846188 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40669 _keys!1364)) (bvslt from!1698 (size!40669 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271952 () Bool)

(declare-fun e!725445 () Bool)

(declare-fun e!725446 () Bool)

(declare-fun mapRes!51109 () Bool)

(assert (=> b!1271952 (= e!725445 (and e!725446 mapRes!51109))))

(declare-fun condMapEmpty!51109 () Bool)

(declare-datatypes ((V!49219 0))(
  ( (V!49220 (val!16584 Int)) )
))
(declare-datatypes ((ValueCell!15656 0))(
  ( (ValueCellFull!15656 (v!19220 V!49219)) (EmptyCell!15656) )
))
(declare-datatypes ((array!83189 0))(
  ( (array!83190 (arr!40132 (Array (_ BitVec 32) ValueCell!15656)) (size!40670 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83189)

(declare-fun mapDefault!51109 () ValueCell!15656)

(assert (=> b!1271952 (= condMapEmpty!51109 (= (arr!40132 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15656)) mapDefault!51109)))))

(declare-fun b!1271954 () Bool)

(declare-fun res!846184 () Bool)

(assert (=> b!1271954 (=> (not res!846184) (not e!725448))))

(declare-datatypes ((List!28621 0))(
  ( (Nil!28618) (Cons!28617 (h!29826 (_ BitVec 64)) (t!42142 List!28621)) )
))
(declare-fun arrayNoDuplicates!0 (array!83187 (_ BitVec 32) List!28621) Bool)

(assert (=> b!1271954 (= res!846184 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28618))))

(declare-fun mapIsEmpty!51109 () Bool)

(assert (=> mapIsEmpty!51109 mapRes!51109))

(declare-fun b!1271955 () Bool)

(declare-fun res!846186 () Bool)

(assert (=> b!1271955 (=> (not res!846186) (not e!725448))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271955 (= res!846186 (and (= (size!40670 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40669 _keys!1364) (size!40670 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271956 () Bool)

(declare-fun e!725447 () Bool)

(declare-fun tp_is_empty!33019 () Bool)

(assert (=> b!1271956 (= e!725447 tp_is_empty!33019)))

(declare-fun b!1271957 () Bool)

(declare-fun minValueAfter!52 () V!49219)

(declare-fun minValueBefore!52 () V!49219)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49219)

(declare-fun zeroValueBefore!52 () V!49219)

(declare-datatypes ((tuple2!21442 0))(
  ( (tuple2!21443 (_1!10732 (_ BitVec 64)) (_2!10732 V!49219)) )
))
(declare-datatypes ((List!28622 0))(
  ( (Nil!28619) (Cons!28618 (h!29827 tuple2!21442) (t!42143 List!28622)) )
))
(declare-datatypes ((ListLongMap!19171 0))(
  ( (ListLongMap!19172 (toList!9601 List!28622)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5934 (array!83187 array!83189 (_ BitVec 32) (_ BitVec 32) V!49219 V!49219 (_ BitVec 32) Int) ListLongMap!19171)

(assert (=> b!1271957 (= e!725448 (not (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(assert (=> b!1271957 (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42156 0))(
  ( (Unit!42157) )
))
(declare-fun lt!574769 () Unit!42156)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1234 (array!83187 array!83189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49219 V!49219 V!49219 V!49219 (_ BitVec 32) Int) Unit!42156)

(assert (=> b!1271957 (= lt!574769 (lemmaNoChangeToArrayThenSameMapNoExtras!1234 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!51109 () Bool)

(declare-fun tp!97454 () Bool)

(assert (=> mapNonEmpty!51109 (= mapRes!51109 (and tp!97454 e!725447))))

(declare-fun mapRest!51109 () (Array (_ BitVec 32) ValueCell!15656))

(declare-fun mapValue!51109 () ValueCell!15656)

(declare-fun mapKey!51109 () (_ BitVec 32))

(assert (=> mapNonEmpty!51109 (= (arr!40132 _values!1134) (store mapRest!51109 mapKey!51109 mapValue!51109))))

(declare-fun b!1271958 () Bool)

(assert (=> b!1271958 (= e!725446 tp_is_empty!33019)))

(declare-fun b!1271953 () Bool)

(declare-fun res!846185 () Bool)

(assert (=> b!1271953 (=> (not res!846185) (not e!725448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83187 (_ BitVec 32)) Bool)

(assert (=> b!1271953 (= res!846185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846187 () Bool)

(assert (=> start!107330 (=> (not res!846187) (not e!725448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107330 (= res!846187 (validMask!0 mask!1730))))

(assert (=> start!107330 e!725448))

(declare-fun array_inv!30675 (array!83189) Bool)

(assert (=> start!107330 (and (array_inv!30675 _values!1134) e!725445)))

(assert (=> start!107330 true))

(declare-fun array_inv!30676 (array!83187) Bool)

(assert (=> start!107330 (array_inv!30676 _keys!1364)))

(assert (=> start!107330 tp_is_empty!33019))

(assert (=> start!107330 tp!97453))

(assert (= (and start!107330 res!846187) b!1271955))

(assert (= (and b!1271955 res!846186) b!1271953))

(assert (= (and b!1271953 res!846185) b!1271954))

(assert (= (and b!1271954 res!846184) b!1271951))

(assert (= (and b!1271951 res!846188) b!1271957))

(assert (= (and b!1271952 condMapEmpty!51109) mapIsEmpty!51109))

(assert (= (and b!1271952 (not condMapEmpty!51109)) mapNonEmpty!51109))

(get-info :version)

(assert (= (and mapNonEmpty!51109 ((_ is ValueCellFull!15656) mapValue!51109)) b!1271956))

(assert (= (and b!1271952 ((_ is ValueCellFull!15656) mapDefault!51109)) b!1271958))

(assert (= start!107330 b!1271952))

(declare-fun m!1169259 () Bool)

(assert (=> b!1271954 m!1169259))

(declare-fun m!1169261 () Bool)

(assert (=> start!107330 m!1169261))

(declare-fun m!1169263 () Bool)

(assert (=> start!107330 m!1169263))

(declare-fun m!1169265 () Bool)

(assert (=> start!107330 m!1169265))

(declare-fun m!1169267 () Bool)

(assert (=> mapNonEmpty!51109 m!1169267))

(declare-fun m!1169269 () Bool)

(assert (=> b!1271957 m!1169269))

(declare-fun m!1169271 () Bool)

(assert (=> b!1271957 m!1169271))

(declare-fun m!1169273 () Bool)

(assert (=> b!1271957 m!1169273))

(declare-fun m!1169275 () Bool)

(assert (=> b!1271957 m!1169275))

(declare-fun m!1169277 () Bool)

(assert (=> b!1271957 m!1169277))

(declare-fun m!1169279 () Bool)

(assert (=> b!1271953 m!1169279))

(check-sat b_and!45663 tp_is_empty!33019 (not b_next!27649) (not start!107330) (not b!1271953) (not b!1271954) (not mapNonEmpty!51109) (not b!1271957))
(check-sat b_and!45663 (not b_next!27649))
(get-model)

(declare-fun b!1272015 () Bool)

(declare-fun e!725487 () Bool)

(declare-fun call!62499 () Bool)

(assert (=> b!1272015 (= e!725487 call!62499)))

(declare-fun b!1272016 () Bool)

(declare-fun e!725488 () Bool)

(assert (=> b!1272016 (= e!725488 e!725487)))

(declare-fun lt!574782 () (_ BitVec 64))

(assert (=> b!1272016 (= lt!574782 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000))))

(declare-fun lt!574783 () Unit!42156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83187 (_ BitVec 64) (_ BitVec 32)) Unit!42156)

(assert (=> b!1272016 (= lt!574783 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574782 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272016 (arrayContainsKey!0 _keys!1364 lt!574782 #b00000000000000000000000000000000)))

(declare-fun lt!574784 () Unit!42156)

(assert (=> b!1272016 (= lt!574784 lt!574783)))

(declare-fun res!846224 () Bool)

(declare-datatypes ((SeekEntryResult!9986 0))(
  ( (MissingZero!9986 (index!42315 (_ BitVec 32))) (Found!9986 (index!42316 (_ BitVec 32))) (Intermediate!9986 (undefined!10798 Bool) (index!42317 (_ BitVec 32)) (x!112363 (_ BitVec 32))) (Undefined!9986) (MissingVacant!9986 (index!42318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83187 (_ BitVec 32)) SeekEntryResult!9986)

(assert (=> b!1272016 (= res!846224 (= (seekEntryOrOpen!0 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9986 #b00000000000000000000000000000000)))))

(assert (=> b!1272016 (=> (not res!846224) (not e!725487))))

(declare-fun bm!62496 () Bool)

(assert (=> bm!62496 (= call!62499 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1272017 () Bool)

(assert (=> b!1272017 (= e!725488 call!62499)))

(declare-fun d!139695 () Bool)

(declare-fun res!846223 () Bool)

(declare-fun e!725486 () Bool)

(assert (=> d!139695 (=> res!846223 e!725486)))

(assert (=> d!139695 (= res!846223 (bvsge #b00000000000000000000000000000000 (size!40669 _keys!1364)))))

(assert (=> d!139695 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!725486)))

(declare-fun b!1272018 () Bool)

(assert (=> b!1272018 (= e!725486 e!725488)))

(declare-fun c!123619 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272018 (= c!123619 (validKeyInArray!0 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!139695 (not res!846223)) b!1272018))

(assert (= (and b!1272018 c!123619) b!1272016))

(assert (= (and b!1272018 (not c!123619)) b!1272017))

(assert (= (and b!1272016 res!846224) b!1272015))

(assert (= (or b!1272015 b!1272017) bm!62496))

(declare-fun m!1169325 () Bool)

(assert (=> b!1272016 m!1169325))

(declare-fun m!1169327 () Bool)

(assert (=> b!1272016 m!1169327))

(declare-fun m!1169329 () Bool)

(assert (=> b!1272016 m!1169329))

(assert (=> b!1272016 m!1169325))

(declare-fun m!1169331 () Bool)

(assert (=> b!1272016 m!1169331))

(declare-fun m!1169333 () Bool)

(assert (=> bm!62496 m!1169333))

(assert (=> b!1272018 m!1169325))

(assert (=> b!1272018 m!1169325))

(declare-fun m!1169335 () Bool)

(assert (=> b!1272018 m!1169335))

(assert (=> b!1271953 d!139695))

(declare-fun b!1272043 () Bool)

(declare-fun lt!574802 () Unit!42156)

(declare-fun lt!574804 () Unit!42156)

(assert (=> b!1272043 (= lt!574802 lt!574804)))

(declare-fun lt!574799 () ListLongMap!19171)

(declare-fun lt!574800 () (_ BitVec 64))

(declare-fun lt!574805 () (_ BitVec 64))

(declare-fun lt!574801 () V!49219)

(declare-fun contains!7633 (ListLongMap!19171 (_ BitVec 64)) Bool)

(declare-fun +!4306 (ListLongMap!19171 tuple2!21442) ListLongMap!19171)

(assert (=> b!1272043 (not (contains!7633 (+!4306 lt!574799 (tuple2!21443 lt!574805 lt!574801)) lt!574800))))

(declare-fun addStillNotContains!334 (ListLongMap!19171 (_ BitVec 64) V!49219 (_ BitVec 64)) Unit!42156)

(assert (=> b!1272043 (= lt!574804 (addStillNotContains!334 lt!574799 lt!574805 lt!574801 lt!574800))))

(assert (=> b!1272043 (= lt!574800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20505 (ValueCell!15656 V!49219) V!49219)

(declare-fun dynLambda!3428 (Int (_ BitVec 64)) V!49219)

(assert (=> b!1272043 (= lt!574801 (get!20505 (select (arr!40132 _values!1134) from!1698) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272043 (= lt!574805 (select (arr!40131 _keys!1364) from!1698))))

(declare-fun call!62502 () ListLongMap!19171)

(assert (=> b!1272043 (= lt!574799 call!62502)))

(declare-fun e!725507 () ListLongMap!19171)

(assert (=> b!1272043 (= e!725507 (+!4306 call!62502 (tuple2!21443 (select (arr!40131 _keys!1364) from!1698) (get!20505 (select (arr!40132 _values!1134) from!1698) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62499 () Bool)

(assert (=> bm!62499 (= call!62502 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun lt!574803 () ListLongMap!19171)

(declare-fun b!1272044 () Bool)

(declare-fun e!725503 () Bool)

(assert (=> b!1272044 (= e!725503 (= lt!574803 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272045 () Bool)

(declare-fun e!725509 () Bool)

(declare-fun e!725505 () Bool)

(assert (=> b!1272045 (= e!725509 e!725505)))

(assert (=> b!1272045 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40669 _keys!1364)))))

(declare-fun res!846233 () Bool)

(assert (=> b!1272045 (= res!846233 (contains!7633 lt!574803 (select (arr!40131 _keys!1364) from!1698)))))

(assert (=> b!1272045 (=> (not res!846233) (not e!725505))))

(declare-fun b!1272046 () Bool)

(assert (=> b!1272046 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40669 _keys!1364)))))

(assert (=> b!1272046 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40670 _values!1134)))))

(declare-fun apply!998 (ListLongMap!19171 (_ BitVec 64)) V!49219)

(assert (=> b!1272046 (= e!725505 (= (apply!998 lt!574803 (select (arr!40131 _keys!1364) from!1698)) (get!20505 (select (arr!40132 _values!1134) from!1698) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!139697 () Bool)

(declare-fun e!725508 () Bool)

(assert (=> d!139697 e!725508))

(declare-fun res!846234 () Bool)

(assert (=> d!139697 (=> (not res!846234) (not e!725508))))

(assert (=> d!139697 (= res!846234 (not (contains!7633 lt!574803 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725506 () ListLongMap!19171)

(assert (=> d!139697 (= lt!574803 e!725506)))

(declare-fun c!123628 () Bool)

(assert (=> d!139697 (= c!123628 (bvsge from!1698 (size!40669 _keys!1364)))))

(assert (=> d!139697 (validMask!0 mask!1730)))

(assert (=> d!139697 (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) lt!574803)))

(declare-fun b!1272047 () Bool)

(assert (=> b!1272047 (= e!725506 (ListLongMap!19172 Nil!28619))))

(declare-fun b!1272048 () Bool)

(assert (=> b!1272048 (= e!725507 call!62502)))

(declare-fun b!1272049 () Bool)

(assert (=> b!1272049 (= e!725506 e!725507)))

(declare-fun c!123630 () Bool)

(assert (=> b!1272049 (= c!123630 (validKeyInArray!0 (select (arr!40131 _keys!1364) from!1698)))))

(declare-fun b!1272050 () Bool)

(declare-fun res!846235 () Bool)

(assert (=> b!1272050 (=> (not res!846235) (not e!725508))))

(assert (=> b!1272050 (= res!846235 (not (contains!7633 lt!574803 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272051 () Bool)

(assert (=> b!1272051 (= e!725508 e!725509)))

(declare-fun c!123629 () Bool)

(declare-fun e!725504 () Bool)

(assert (=> b!1272051 (= c!123629 e!725504)))

(declare-fun res!846236 () Bool)

(assert (=> b!1272051 (=> (not res!846236) (not e!725504))))

(assert (=> b!1272051 (= res!846236 (bvslt from!1698 (size!40669 _keys!1364)))))

(declare-fun b!1272052 () Bool)

(assert (=> b!1272052 (= e!725504 (validKeyInArray!0 (select (arr!40131 _keys!1364) from!1698)))))

(assert (=> b!1272052 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun b!1272053 () Bool)

(assert (=> b!1272053 (= e!725509 e!725503)))

(declare-fun c!123631 () Bool)

(assert (=> b!1272053 (= c!123631 (bvslt from!1698 (size!40669 _keys!1364)))))

(declare-fun b!1272054 () Bool)

(declare-fun isEmpty!1053 (ListLongMap!19171) Bool)

(assert (=> b!1272054 (= e!725503 (isEmpty!1053 lt!574803))))

(assert (= (and d!139697 c!123628) b!1272047))

(assert (= (and d!139697 (not c!123628)) b!1272049))

(assert (= (and b!1272049 c!123630) b!1272043))

(assert (= (and b!1272049 (not c!123630)) b!1272048))

(assert (= (or b!1272043 b!1272048) bm!62499))

(assert (= (and d!139697 res!846234) b!1272050))

(assert (= (and b!1272050 res!846235) b!1272051))

(assert (= (and b!1272051 res!846236) b!1272052))

(assert (= (and b!1272051 c!123629) b!1272045))

(assert (= (and b!1272051 (not c!123629)) b!1272053))

(assert (= (and b!1272045 res!846233) b!1272046))

(assert (= (and b!1272053 c!123631) b!1272044))

(assert (= (and b!1272053 (not c!123631)) b!1272054))

(declare-fun b_lambda!23029 () Bool)

(assert (=> (not b_lambda!23029) (not b!1272043)))

(declare-fun t!42148 () Bool)

(declare-fun tb!11329 () Bool)

(assert (=> (and start!107330 (= defaultEntry!1142 defaultEntry!1142) t!42148) tb!11329))

(declare-fun result!23541 () Bool)

(assert (=> tb!11329 (= result!23541 tp_is_empty!33019)))

(assert (=> b!1272043 t!42148))

(declare-fun b_and!45669 () Bool)

(assert (= b_and!45663 (and (=> t!42148 result!23541) b_and!45669)))

(declare-fun b_lambda!23031 () Bool)

(assert (=> (not b_lambda!23031) (not b!1272046)))

(assert (=> b!1272046 t!42148))

(declare-fun b_and!45671 () Bool)

(assert (= b_and!45669 (and (=> t!42148 result!23541) b_and!45671)))

(declare-fun m!1169337 () Bool)

(assert (=> b!1272054 m!1169337))

(declare-fun m!1169339 () Bool)

(assert (=> b!1272050 m!1169339))

(declare-fun m!1169341 () Bool)

(assert (=> b!1272043 m!1169341))

(declare-fun m!1169343 () Bool)

(assert (=> b!1272043 m!1169343))

(declare-fun m!1169345 () Bool)

(assert (=> b!1272043 m!1169345))

(declare-fun m!1169347 () Bool)

(assert (=> b!1272043 m!1169347))

(declare-fun m!1169349 () Bool)

(assert (=> b!1272043 m!1169349))

(assert (=> b!1272043 m!1169341))

(declare-fun m!1169351 () Bool)

(assert (=> b!1272043 m!1169351))

(declare-fun m!1169353 () Bool)

(assert (=> b!1272043 m!1169353))

(assert (=> b!1272043 m!1169345))

(assert (=> b!1272043 m!1169353))

(declare-fun m!1169355 () Bool)

(assert (=> b!1272043 m!1169355))

(assert (=> b!1272046 m!1169351))

(assert (=> b!1272046 m!1169351))

(declare-fun m!1169357 () Bool)

(assert (=> b!1272046 m!1169357))

(assert (=> b!1272046 m!1169345))

(assert (=> b!1272046 m!1169353))

(assert (=> b!1272046 m!1169345))

(assert (=> b!1272046 m!1169353))

(assert (=> b!1272046 m!1169355))

(declare-fun m!1169359 () Bool)

(assert (=> d!139697 m!1169359))

(assert (=> d!139697 m!1169261))

(declare-fun m!1169361 () Bool)

(assert (=> b!1272044 m!1169361))

(assert (=> b!1272052 m!1169351))

(assert (=> b!1272052 m!1169351))

(declare-fun m!1169363 () Bool)

(assert (=> b!1272052 m!1169363))

(assert (=> bm!62499 m!1169361))

(assert (=> b!1272049 m!1169351))

(assert (=> b!1272049 m!1169351))

(assert (=> b!1272049 m!1169363))

(assert (=> b!1272045 m!1169351))

(assert (=> b!1272045 m!1169351))

(declare-fun m!1169365 () Bool)

(assert (=> b!1272045 m!1169365))

(assert (=> b!1271957 d!139697))

(declare-fun d!139699 () Bool)

(assert (=> d!139699 (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun lt!574808 () Unit!42156)

(declare-fun choose!1904 (array!83187 array!83189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49219 V!49219 V!49219 V!49219 (_ BitVec 32) Int) Unit!42156)

(assert (=> d!139699 (= lt!574808 (choose!1904 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(assert (=> d!139699 (validMask!0 mask!1730)))

(assert (=> d!139699 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1234 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!574808)))

(declare-fun bs!36085 () Bool)

(assert (= bs!36085 d!139699))

(assert (=> bs!36085 m!1169277))

(assert (=> bs!36085 m!1169273))

(declare-fun m!1169367 () Bool)

(assert (=> bs!36085 m!1169367))

(assert (=> bs!36085 m!1169261))

(assert (=> b!1271957 d!139699))

(declare-fun b!1272057 () Bool)

(declare-fun lt!574812 () Unit!42156)

(declare-fun lt!574814 () Unit!42156)

(assert (=> b!1272057 (= lt!574812 lt!574814)))

(declare-fun lt!574815 () (_ BitVec 64))

(declare-fun lt!574810 () (_ BitVec 64))

(declare-fun lt!574811 () V!49219)

(declare-fun lt!574809 () ListLongMap!19171)

(assert (=> b!1272057 (not (contains!7633 (+!4306 lt!574809 (tuple2!21443 lt!574815 lt!574811)) lt!574810))))

(assert (=> b!1272057 (= lt!574814 (addStillNotContains!334 lt!574809 lt!574815 lt!574811 lt!574810))))

(assert (=> b!1272057 (= lt!574810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272057 (= lt!574811 (get!20505 (select (arr!40132 _values!1134) from!1698) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272057 (= lt!574815 (select (arr!40131 _keys!1364) from!1698))))

(declare-fun call!62503 () ListLongMap!19171)

(assert (=> b!1272057 (= lt!574809 call!62503)))

(declare-fun e!725514 () ListLongMap!19171)

(assert (=> b!1272057 (= e!725514 (+!4306 call!62503 (tuple2!21443 (select (arr!40131 _keys!1364) from!1698) (get!20505 (select (arr!40132 _values!1134) from!1698) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62500 () Bool)

(assert (=> bm!62500 (= call!62503 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272058 () Bool)

(declare-fun e!725510 () Bool)

(declare-fun lt!574813 () ListLongMap!19171)

(assert (=> b!1272058 (= e!725510 (= lt!574813 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272059 () Bool)

(declare-fun e!725516 () Bool)

(declare-fun e!725512 () Bool)

(assert (=> b!1272059 (= e!725516 e!725512)))

(assert (=> b!1272059 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40669 _keys!1364)))))

(declare-fun res!846237 () Bool)

(assert (=> b!1272059 (= res!846237 (contains!7633 lt!574813 (select (arr!40131 _keys!1364) from!1698)))))

(assert (=> b!1272059 (=> (not res!846237) (not e!725512))))

(declare-fun b!1272060 () Bool)

(assert (=> b!1272060 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40669 _keys!1364)))))

(assert (=> b!1272060 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40670 _values!1134)))))

(assert (=> b!1272060 (= e!725512 (= (apply!998 lt!574813 (select (arr!40131 _keys!1364) from!1698)) (get!20505 (select (arr!40132 _values!1134) from!1698) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!139701 () Bool)

(declare-fun e!725515 () Bool)

(assert (=> d!139701 e!725515))

(declare-fun res!846238 () Bool)

(assert (=> d!139701 (=> (not res!846238) (not e!725515))))

(assert (=> d!139701 (= res!846238 (not (contains!7633 lt!574813 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725513 () ListLongMap!19171)

(assert (=> d!139701 (= lt!574813 e!725513)))

(declare-fun c!123632 () Bool)

(assert (=> d!139701 (= c!123632 (bvsge from!1698 (size!40669 _keys!1364)))))

(assert (=> d!139701 (validMask!0 mask!1730)))

(assert (=> d!139701 (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142) lt!574813)))

(declare-fun b!1272061 () Bool)

(assert (=> b!1272061 (= e!725513 (ListLongMap!19172 Nil!28619))))

(declare-fun b!1272062 () Bool)

(assert (=> b!1272062 (= e!725514 call!62503)))

(declare-fun b!1272063 () Bool)

(assert (=> b!1272063 (= e!725513 e!725514)))

(declare-fun c!123634 () Bool)

(assert (=> b!1272063 (= c!123634 (validKeyInArray!0 (select (arr!40131 _keys!1364) from!1698)))))

(declare-fun b!1272064 () Bool)

(declare-fun res!846239 () Bool)

(assert (=> b!1272064 (=> (not res!846239) (not e!725515))))

(assert (=> b!1272064 (= res!846239 (not (contains!7633 lt!574813 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272065 () Bool)

(assert (=> b!1272065 (= e!725515 e!725516)))

(declare-fun c!123633 () Bool)

(declare-fun e!725511 () Bool)

(assert (=> b!1272065 (= c!123633 e!725511)))

(declare-fun res!846240 () Bool)

(assert (=> b!1272065 (=> (not res!846240) (not e!725511))))

(assert (=> b!1272065 (= res!846240 (bvslt from!1698 (size!40669 _keys!1364)))))

(declare-fun b!1272066 () Bool)

(assert (=> b!1272066 (= e!725511 (validKeyInArray!0 (select (arr!40131 _keys!1364) from!1698)))))

(assert (=> b!1272066 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun b!1272067 () Bool)

(assert (=> b!1272067 (= e!725516 e!725510)))

(declare-fun c!123635 () Bool)

(assert (=> b!1272067 (= c!123635 (bvslt from!1698 (size!40669 _keys!1364)))))

(declare-fun b!1272068 () Bool)

(assert (=> b!1272068 (= e!725510 (isEmpty!1053 lt!574813))))

(assert (= (and d!139701 c!123632) b!1272061))

(assert (= (and d!139701 (not c!123632)) b!1272063))

(assert (= (and b!1272063 c!123634) b!1272057))

(assert (= (and b!1272063 (not c!123634)) b!1272062))

(assert (= (or b!1272057 b!1272062) bm!62500))

(assert (= (and d!139701 res!846238) b!1272064))

(assert (= (and b!1272064 res!846239) b!1272065))

(assert (= (and b!1272065 res!846240) b!1272066))

(assert (= (and b!1272065 c!123633) b!1272059))

(assert (= (and b!1272065 (not c!123633)) b!1272067))

(assert (= (and b!1272059 res!846237) b!1272060))

(assert (= (and b!1272067 c!123635) b!1272058))

(assert (= (and b!1272067 (not c!123635)) b!1272068))

(declare-fun b_lambda!23033 () Bool)

(assert (=> (not b_lambda!23033) (not b!1272057)))

(assert (=> b!1272057 t!42148))

(declare-fun b_and!45673 () Bool)

(assert (= b_and!45671 (and (=> t!42148 result!23541) b_and!45673)))

(declare-fun b_lambda!23035 () Bool)

(assert (=> (not b_lambda!23035) (not b!1272060)))

(assert (=> b!1272060 t!42148))

(declare-fun b_and!45675 () Bool)

(assert (= b_and!45673 (and (=> t!42148 result!23541) b_and!45675)))

(declare-fun m!1169369 () Bool)

(assert (=> b!1272068 m!1169369))

(declare-fun m!1169371 () Bool)

(assert (=> b!1272064 m!1169371))

(declare-fun m!1169373 () Bool)

(assert (=> b!1272057 m!1169373))

(declare-fun m!1169375 () Bool)

(assert (=> b!1272057 m!1169375))

(assert (=> b!1272057 m!1169345))

(declare-fun m!1169377 () Bool)

(assert (=> b!1272057 m!1169377))

(declare-fun m!1169379 () Bool)

(assert (=> b!1272057 m!1169379))

(assert (=> b!1272057 m!1169373))

(assert (=> b!1272057 m!1169351))

(assert (=> b!1272057 m!1169353))

(assert (=> b!1272057 m!1169345))

(assert (=> b!1272057 m!1169353))

(assert (=> b!1272057 m!1169355))

(assert (=> b!1272060 m!1169351))

(assert (=> b!1272060 m!1169351))

(declare-fun m!1169381 () Bool)

(assert (=> b!1272060 m!1169381))

(assert (=> b!1272060 m!1169345))

(assert (=> b!1272060 m!1169353))

(assert (=> b!1272060 m!1169345))

(assert (=> b!1272060 m!1169353))

(assert (=> b!1272060 m!1169355))

(declare-fun m!1169383 () Bool)

(assert (=> d!139701 m!1169383))

(assert (=> d!139701 m!1169261))

(declare-fun m!1169385 () Bool)

(assert (=> b!1272058 m!1169385))

(assert (=> b!1272066 m!1169351))

(assert (=> b!1272066 m!1169351))

(assert (=> b!1272066 m!1169363))

(assert (=> bm!62500 m!1169385))

(assert (=> b!1272063 m!1169351))

(assert (=> b!1272063 m!1169351))

(assert (=> b!1272063 m!1169363))

(assert (=> b!1272059 m!1169351))

(assert (=> b!1272059 m!1169351))

(declare-fun m!1169387 () Bool)

(assert (=> b!1272059 m!1169387))

(assert (=> b!1271957 d!139701))

(declare-fun b!1272069 () Bool)

(declare-fun lt!574819 () Unit!42156)

(declare-fun lt!574821 () Unit!42156)

(assert (=> b!1272069 (= lt!574819 lt!574821)))

(declare-fun lt!574818 () V!49219)

(declare-fun lt!574817 () (_ BitVec 64))

(declare-fun lt!574822 () (_ BitVec 64))

(declare-fun lt!574816 () ListLongMap!19171)

(assert (=> b!1272069 (not (contains!7633 (+!4306 lt!574816 (tuple2!21443 lt!574822 lt!574818)) lt!574817))))

(assert (=> b!1272069 (= lt!574821 (addStillNotContains!334 lt!574816 lt!574822 lt!574818 lt!574817))))

(assert (=> b!1272069 (= lt!574817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272069 (= lt!574818 (get!20505 (select (arr!40132 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272069 (= lt!574822 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)))))

(declare-fun call!62504 () ListLongMap!19171)

(assert (=> b!1272069 (= lt!574816 call!62504)))

(declare-fun e!725521 () ListLongMap!19171)

(assert (=> b!1272069 (= e!725521 (+!4306 call!62504 (tuple2!21443 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (get!20505 (select (arr!40132 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62501 () Bool)

(assert (=> bm!62501 (= call!62504 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun lt!574820 () ListLongMap!19171)

(declare-fun b!1272070 () Bool)

(declare-fun e!725517 () Bool)

(assert (=> b!1272070 (= e!725517 (= lt!574820 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272071 () Bool)

(declare-fun e!725523 () Bool)

(declare-fun e!725519 () Bool)

(assert (=> b!1272071 (= e!725523 e!725519)))

(assert (=> b!1272071 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(declare-fun res!846241 () Bool)

(assert (=> b!1272071 (= res!846241 (contains!7633 lt!574820 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272071 (=> (not res!846241) (not e!725519))))

(declare-fun b!1272072 () Bool)

(assert (=> b!1272072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(assert (=> b!1272072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40670 _values!1134)))))

(assert (=> b!1272072 (= e!725519 (= (apply!998 lt!574820 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))) (get!20505 (select (arr!40132 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!139703 () Bool)

(declare-fun e!725522 () Bool)

(assert (=> d!139703 e!725522))

(declare-fun res!846242 () Bool)

(assert (=> d!139703 (=> (not res!846242) (not e!725522))))

(assert (=> d!139703 (= res!846242 (not (contains!7633 lt!574820 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725520 () ListLongMap!19171)

(assert (=> d!139703 (= lt!574820 e!725520)))

(declare-fun c!123636 () Bool)

(assert (=> d!139703 (= c!123636 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(assert (=> d!139703 (validMask!0 mask!1730)))

(assert (=> d!139703 (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!574820)))

(declare-fun b!1272073 () Bool)

(assert (=> b!1272073 (= e!725520 (ListLongMap!19172 Nil!28619))))

(declare-fun b!1272074 () Bool)

(assert (=> b!1272074 (= e!725521 call!62504)))

(declare-fun b!1272075 () Bool)

(assert (=> b!1272075 (= e!725520 e!725521)))

(declare-fun c!123638 () Bool)

(assert (=> b!1272075 (= c!123638 (validKeyInArray!0 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(declare-fun b!1272076 () Bool)

(declare-fun res!846243 () Bool)

(assert (=> b!1272076 (=> (not res!846243) (not e!725522))))

(assert (=> b!1272076 (= res!846243 (not (contains!7633 lt!574820 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272077 () Bool)

(assert (=> b!1272077 (= e!725522 e!725523)))

(declare-fun c!123637 () Bool)

(declare-fun e!725518 () Bool)

(assert (=> b!1272077 (= c!123637 e!725518)))

(declare-fun res!846244 () Bool)

(assert (=> b!1272077 (=> (not res!846244) (not e!725518))))

(assert (=> b!1272077 (= res!846244 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(declare-fun b!1272078 () Bool)

(assert (=> b!1272078 (= e!725518 (validKeyInArray!0 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272078 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))

(declare-fun b!1272079 () Bool)

(assert (=> b!1272079 (= e!725523 e!725517)))

(declare-fun c!123639 () Bool)

(assert (=> b!1272079 (= c!123639 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(declare-fun b!1272080 () Bool)

(assert (=> b!1272080 (= e!725517 (isEmpty!1053 lt!574820))))

(assert (= (and d!139703 c!123636) b!1272073))

(assert (= (and d!139703 (not c!123636)) b!1272075))

(assert (= (and b!1272075 c!123638) b!1272069))

(assert (= (and b!1272075 (not c!123638)) b!1272074))

(assert (= (or b!1272069 b!1272074) bm!62501))

(assert (= (and d!139703 res!846242) b!1272076))

(assert (= (and b!1272076 res!846243) b!1272077))

(assert (= (and b!1272077 res!846244) b!1272078))

(assert (= (and b!1272077 c!123637) b!1272071))

(assert (= (and b!1272077 (not c!123637)) b!1272079))

(assert (= (and b!1272071 res!846241) b!1272072))

(assert (= (and b!1272079 c!123639) b!1272070))

(assert (= (and b!1272079 (not c!123639)) b!1272080))

(declare-fun b_lambda!23037 () Bool)

(assert (=> (not b_lambda!23037) (not b!1272069)))

(assert (=> b!1272069 t!42148))

(declare-fun b_and!45677 () Bool)

(assert (= b_and!45675 (and (=> t!42148 result!23541) b_and!45677)))

(declare-fun b_lambda!23039 () Bool)

(assert (=> (not b_lambda!23039) (not b!1272072)))

(assert (=> b!1272072 t!42148))

(declare-fun b_and!45679 () Bool)

(assert (= b_and!45677 (and (=> t!42148 result!23541) b_and!45679)))

(declare-fun m!1169389 () Bool)

(assert (=> b!1272080 m!1169389))

(declare-fun m!1169391 () Bool)

(assert (=> b!1272076 m!1169391))

(declare-fun m!1169393 () Bool)

(assert (=> b!1272069 m!1169393))

(declare-fun m!1169395 () Bool)

(assert (=> b!1272069 m!1169395))

(declare-fun m!1169397 () Bool)

(assert (=> b!1272069 m!1169397))

(declare-fun m!1169399 () Bool)

(assert (=> b!1272069 m!1169399))

(declare-fun m!1169401 () Bool)

(assert (=> b!1272069 m!1169401))

(assert (=> b!1272069 m!1169393))

(declare-fun m!1169403 () Bool)

(assert (=> b!1272069 m!1169403))

(assert (=> b!1272069 m!1169353))

(assert (=> b!1272069 m!1169397))

(assert (=> b!1272069 m!1169353))

(declare-fun m!1169405 () Bool)

(assert (=> b!1272069 m!1169405))

(assert (=> b!1272072 m!1169403))

(assert (=> b!1272072 m!1169403))

(declare-fun m!1169407 () Bool)

(assert (=> b!1272072 m!1169407))

(assert (=> b!1272072 m!1169397))

(assert (=> b!1272072 m!1169353))

(assert (=> b!1272072 m!1169397))

(assert (=> b!1272072 m!1169353))

(assert (=> b!1272072 m!1169405))

(declare-fun m!1169409 () Bool)

(assert (=> d!139703 m!1169409))

(assert (=> d!139703 m!1169261))

(declare-fun m!1169411 () Bool)

(assert (=> b!1272070 m!1169411))

(assert (=> b!1272078 m!1169403))

(assert (=> b!1272078 m!1169403))

(declare-fun m!1169413 () Bool)

(assert (=> b!1272078 m!1169413))

(assert (=> bm!62501 m!1169411))

(assert (=> b!1272075 m!1169403))

(assert (=> b!1272075 m!1169403))

(assert (=> b!1272075 m!1169413))

(assert (=> b!1272071 m!1169403))

(assert (=> b!1272071 m!1169403))

(declare-fun m!1169415 () Bool)

(assert (=> b!1272071 m!1169415))

(assert (=> b!1271957 d!139703))

(declare-fun b!1272081 () Bool)

(declare-fun lt!574826 () Unit!42156)

(declare-fun lt!574828 () Unit!42156)

(assert (=> b!1272081 (= lt!574826 lt!574828)))

(declare-fun lt!574824 () (_ BitVec 64))

(declare-fun lt!574825 () V!49219)

(declare-fun lt!574823 () ListLongMap!19171)

(declare-fun lt!574829 () (_ BitVec 64))

(assert (=> b!1272081 (not (contains!7633 (+!4306 lt!574823 (tuple2!21443 lt!574829 lt!574825)) lt!574824))))

(assert (=> b!1272081 (= lt!574828 (addStillNotContains!334 lt!574823 lt!574829 lt!574825 lt!574824))))

(assert (=> b!1272081 (= lt!574824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272081 (= lt!574825 (get!20505 (select (arr!40132 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272081 (= lt!574829 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)))))

(declare-fun call!62505 () ListLongMap!19171)

(assert (=> b!1272081 (= lt!574823 call!62505)))

(declare-fun e!725528 () ListLongMap!19171)

(assert (=> b!1272081 (= e!725528 (+!4306 call!62505 (tuple2!21443 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (get!20505 (select (arr!40132 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62502 () Bool)

(assert (=> bm!62502 (= call!62505 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun lt!574827 () ListLongMap!19171)

(declare-fun b!1272082 () Bool)

(declare-fun e!725524 () Bool)

(assert (=> b!1272082 (= e!725524 (= lt!574827 (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272083 () Bool)

(declare-fun e!725530 () Bool)

(declare-fun e!725526 () Bool)

(assert (=> b!1272083 (= e!725530 e!725526)))

(assert (=> b!1272083 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(declare-fun res!846245 () Bool)

(assert (=> b!1272083 (= res!846245 (contains!7633 lt!574827 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272083 (=> (not res!846245) (not e!725526))))

(declare-fun b!1272084 () Bool)

(assert (=> b!1272084 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(assert (=> b!1272084 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40670 _values!1134)))))

(assert (=> b!1272084 (= e!725526 (= (apply!998 lt!574827 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))) (get!20505 (select (arr!40132 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3428 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!139705 () Bool)

(declare-fun e!725529 () Bool)

(assert (=> d!139705 e!725529))

(declare-fun res!846246 () Bool)

(assert (=> d!139705 (=> (not res!846246) (not e!725529))))

(assert (=> d!139705 (= res!846246 (not (contains!7633 lt!574827 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725527 () ListLongMap!19171)

(assert (=> d!139705 (= lt!574827 e!725527)))

(declare-fun c!123640 () Bool)

(assert (=> d!139705 (= c!123640 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(assert (=> d!139705 (validMask!0 mask!1730)))

(assert (=> d!139705 (= (getCurrentListMapNoExtraKeys!5934 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!574827)))

(declare-fun b!1272085 () Bool)

(assert (=> b!1272085 (= e!725527 (ListLongMap!19172 Nil!28619))))

(declare-fun b!1272086 () Bool)

(assert (=> b!1272086 (= e!725528 call!62505)))

(declare-fun b!1272087 () Bool)

(assert (=> b!1272087 (= e!725527 e!725528)))

(declare-fun c!123642 () Bool)

(assert (=> b!1272087 (= c!123642 (validKeyInArray!0 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(declare-fun b!1272088 () Bool)

(declare-fun res!846247 () Bool)

(assert (=> b!1272088 (=> (not res!846247) (not e!725529))))

(assert (=> b!1272088 (= res!846247 (not (contains!7633 lt!574827 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272089 () Bool)

(assert (=> b!1272089 (= e!725529 e!725530)))

(declare-fun c!123641 () Bool)

(declare-fun e!725525 () Bool)

(assert (=> b!1272089 (= c!123641 e!725525)))

(declare-fun res!846248 () Bool)

(assert (=> b!1272089 (=> (not res!846248) (not e!725525))))

(assert (=> b!1272089 (= res!846248 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(declare-fun b!1272090 () Bool)

(assert (=> b!1272090 (= e!725525 (validKeyInArray!0 (select (arr!40131 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272090 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))

(declare-fun b!1272091 () Bool)

(assert (=> b!1272091 (= e!725530 e!725524)))

(declare-fun c!123643 () Bool)

(assert (=> b!1272091 (= c!123643 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40669 _keys!1364)))))

(declare-fun b!1272092 () Bool)

(assert (=> b!1272092 (= e!725524 (isEmpty!1053 lt!574827))))

(assert (= (and d!139705 c!123640) b!1272085))

(assert (= (and d!139705 (not c!123640)) b!1272087))

(assert (= (and b!1272087 c!123642) b!1272081))

(assert (= (and b!1272087 (not c!123642)) b!1272086))

(assert (= (or b!1272081 b!1272086) bm!62502))

(assert (= (and d!139705 res!846246) b!1272088))

(assert (= (and b!1272088 res!846247) b!1272089))

(assert (= (and b!1272089 res!846248) b!1272090))

(assert (= (and b!1272089 c!123641) b!1272083))

(assert (= (and b!1272089 (not c!123641)) b!1272091))

(assert (= (and b!1272083 res!846245) b!1272084))

(assert (= (and b!1272091 c!123643) b!1272082))

(assert (= (and b!1272091 (not c!123643)) b!1272092))

(declare-fun b_lambda!23041 () Bool)

(assert (=> (not b_lambda!23041) (not b!1272081)))

(assert (=> b!1272081 t!42148))

(declare-fun b_and!45681 () Bool)

(assert (= b_and!45679 (and (=> t!42148 result!23541) b_and!45681)))

(declare-fun b_lambda!23043 () Bool)

(assert (=> (not b_lambda!23043) (not b!1272084)))

(assert (=> b!1272084 t!42148))

(declare-fun b_and!45683 () Bool)

(assert (= b_and!45681 (and (=> t!42148 result!23541) b_and!45683)))

(declare-fun m!1169417 () Bool)

(assert (=> b!1272092 m!1169417))

(declare-fun m!1169419 () Bool)

(assert (=> b!1272088 m!1169419))

(declare-fun m!1169421 () Bool)

(assert (=> b!1272081 m!1169421))

(declare-fun m!1169423 () Bool)

(assert (=> b!1272081 m!1169423))

(assert (=> b!1272081 m!1169397))

(declare-fun m!1169425 () Bool)

(assert (=> b!1272081 m!1169425))

(declare-fun m!1169427 () Bool)

(assert (=> b!1272081 m!1169427))

(assert (=> b!1272081 m!1169421))

(assert (=> b!1272081 m!1169403))

(assert (=> b!1272081 m!1169353))

(assert (=> b!1272081 m!1169397))

(assert (=> b!1272081 m!1169353))

(assert (=> b!1272081 m!1169405))

(assert (=> b!1272084 m!1169403))

(assert (=> b!1272084 m!1169403))

(declare-fun m!1169429 () Bool)

(assert (=> b!1272084 m!1169429))

(assert (=> b!1272084 m!1169397))

(assert (=> b!1272084 m!1169353))

(assert (=> b!1272084 m!1169397))

(assert (=> b!1272084 m!1169353))

(assert (=> b!1272084 m!1169405))

(declare-fun m!1169431 () Bool)

(assert (=> d!139705 m!1169431))

(assert (=> d!139705 m!1169261))

(declare-fun m!1169433 () Bool)

(assert (=> b!1272082 m!1169433))

(assert (=> b!1272090 m!1169403))

(assert (=> b!1272090 m!1169403))

(assert (=> b!1272090 m!1169413))

(assert (=> bm!62502 m!1169433))

(assert (=> b!1272087 m!1169403))

(assert (=> b!1272087 m!1169403))

(assert (=> b!1272087 m!1169413))

(assert (=> b!1272083 m!1169403))

(assert (=> b!1272083 m!1169403))

(declare-fun m!1169435 () Bool)

(assert (=> b!1272083 m!1169435))

(assert (=> b!1271957 d!139705))

(declare-fun d!139707 () Bool)

(assert (=> d!139707 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107330 d!139707))

(declare-fun d!139709 () Bool)

(assert (=> d!139709 (= (array_inv!30675 _values!1134) (bvsge (size!40670 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107330 d!139709))

(declare-fun d!139711 () Bool)

(assert (=> d!139711 (= (array_inv!30676 _keys!1364) (bvsge (size!40669 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107330 d!139711))

(declare-fun bm!62505 () Bool)

(declare-fun call!62508 () Bool)

(declare-fun c!123646 () Bool)

(assert (=> bm!62505 (= call!62508 (arrayNoDuplicates!0 _keys!1364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123646 (Cons!28617 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000) Nil!28618) Nil!28618)))))

(declare-fun b!1272103 () Bool)

(declare-fun e!725542 () Bool)

(declare-fun e!725539 () Bool)

(assert (=> b!1272103 (= e!725542 e!725539)))

(assert (=> b!1272103 (= c!123646 (validKeyInArray!0 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272104 () Bool)

(declare-fun e!725541 () Bool)

(declare-fun contains!7634 (List!28621 (_ BitVec 64)) Bool)

(assert (=> b!1272104 (= e!725541 (contains!7634 Nil!28618 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272105 () Bool)

(assert (=> b!1272105 (= e!725539 call!62508)))

(declare-fun b!1272106 () Bool)

(declare-fun e!725540 () Bool)

(assert (=> b!1272106 (= e!725540 e!725542)))

(declare-fun res!846256 () Bool)

(assert (=> b!1272106 (=> (not res!846256) (not e!725542))))

(assert (=> b!1272106 (= res!846256 (not e!725541))))

(declare-fun res!846255 () Bool)

(assert (=> b!1272106 (=> (not res!846255) (not e!725541))))

(assert (=> b!1272106 (= res!846255 (validKeyInArray!0 (select (arr!40131 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272107 () Bool)

(assert (=> b!1272107 (= e!725539 call!62508)))

(declare-fun d!139713 () Bool)

(declare-fun res!846257 () Bool)

(assert (=> d!139713 (=> res!846257 e!725540)))

(assert (=> d!139713 (= res!846257 (bvsge #b00000000000000000000000000000000 (size!40669 _keys!1364)))))

(assert (=> d!139713 (= (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28618) e!725540)))

(assert (= (and d!139713 (not res!846257)) b!1272106))

(assert (= (and b!1272106 res!846255) b!1272104))

(assert (= (and b!1272106 res!846256) b!1272103))

(assert (= (and b!1272103 c!123646) b!1272107))

(assert (= (and b!1272103 (not c!123646)) b!1272105))

(assert (= (or b!1272107 b!1272105) bm!62505))

(assert (=> bm!62505 m!1169325))

(declare-fun m!1169437 () Bool)

(assert (=> bm!62505 m!1169437))

(assert (=> b!1272103 m!1169325))

(assert (=> b!1272103 m!1169325))

(assert (=> b!1272103 m!1169335))

(assert (=> b!1272104 m!1169325))

(assert (=> b!1272104 m!1169325))

(declare-fun m!1169439 () Bool)

(assert (=> b!1272104 m!1169439))

(assert (=> b!1272106 m!1169325))

(assert (=> b!1272106 m!1169325))

(assert (=> b!1272106 m!1169335))

(assert (=> b!1271954 d!139713))

(declare-fun mapIsEmpty!51118 () Bool)

(declare-fun mapRes!51118 () Bool)

(assert (=> mapIsEmpty!51118 mapRes!51118))

(declare-fun b!1272115 () Bool)

(declare-fun e!725548 () Bool)

(assert (=> b!1272115 (= e!725548 tp_is_empty!33019)))

(declare-fun condMapEmpty!51118 () Bool)

(declare-fun mapDefault!51118 () ValueCell!15656)

(assert (=> mapNonEmpty!51109 (= condMapEmpty!51118 (= mapRest!51109 ((as const (Array (_ BitVec 32) ValueCell!15656)) mapDefault!51118)))))

(assert (=> mapNonEmpty!51109 (= tp!97454 (and e!725548 mapRes!51118))))

(declare-fun b!1272114 () Bool)

(declare-fun e!725547 () Bool)

(assert (=> b!1272114 (= e!725547 tp_is_empty!33019)))

(declare-fun mapNonEmpty!51118 () Bool)

(declare-fun tp!97469 () Bool)

(assert (=> mapNonEmpty!51118 (= mapRes!51118 (and tp!97469 e!725547))))

(declare-fun mapRest!51118 () (Array (_ BitVec 32) ValueCell!15656))

(declare-fun mapKey!51118 () (_ BitVec 32))

(declare-fun mapValue!51118 () ValueCell!15656)

(assert (=> mapNonEmpty!51118 (= mapRest!51109 (store mapRest!51118 mapKey!51118 mapValue!51118))))

(assert (= (and mapNonEmpty!51109 condMapEmpty!51118) mapIsEmpty!51118))

(assert (= (and mapNonEmpty!51109 (not condMapEmpty!51118)) mapNonEmpty!51118))

(assert (= (and mapNonEmpty!51118 ((_ is ValueCellFull!15656) mapValue!51118)) b!1272114))

(assert (= (and mapNonEmpty!51109 ((_ is ValueCellFull!15656) mapDefault!51118)) b!1272115))

(declare-fun m!1169441 () Bool)

(assert (=> mapNonEmpty!51118 m!1169441))

(declare-fun b_lambda!23045 () Bool)

(assert (= b_lambda!23041 (or (and start!107330 b_free!27649) b_lambda!23045)))

(declare-fun b_lambda!23047 () Bool)

(assert (= b_lambda!23039 (or (and start!107330 b_free!27649) b_lambda!23047)))

(declare-fun b_lambda!23049 () Bool)

(assert (= b_lambda!23037 (or (and start!107330 b_free!27649) b_lambda!23049)))

(declare-fun b_lambda!23051 () Bool)

(assert (= b_lambda!23031 (or (and start!107330 b_free!27649) b_lambda!23051)))

(declare-fun b_lambda!23053 () Bool)

(assert (= b_lambda!23033 (or (and start!107330 b_free!27649) b_lambda!23053)))

(declare-fun b_lambda!23055 () Bool)

(assert (= b_lambda!23029 (or (and start!107330 b_free!27649) b_lambda!23055)))

(declare-fun b_lambda!23057 () Bool)

(assert (= b_lambda!23035 (or (and start!107330 b_free!27649) b_lambda!23057)))

(declare-fun b_lambda!23059 () Bool)

(assert (= b_lambda!23043 (or (and start!107330 b_free!27649) b_lambda!23059)))

(check-sat (not b!1272106) tp_is_empty!33019 (not b!1272043) (not b!1272072) (not b!1272075) (not b_lambda!23053) (not b!1272069) (not b!1272060) (not b!1272045) (not b!1272052) (not bm!62502) (not bm!62501) (not b!1272103) (not b_lambda!23047) (not b_lambda!23049) (not d!139701) (not b!1272063) (not d!139699) (not b!1272044) (not b!1272058) (not b_lambda!23057) (not b!1272066) (not b_next!27649) (not b!1272054) (not b!1272080) (not b!1272071) (not d!139705) (not bm!62499) (not b!1272046) (not b!1272087) (not b!1272078) (not b_lambda!23051) (not d!139703) (not b!1272070) (not b!1272088) (not b!1272083) (not bm!62505) (not b_lambda!23045) (not b_lambda!23055) (not b!1272104) (not b_lambda!23059) b_and!45683 (not b!1272068) (not b!1272059) (not b!1272076) (not b!1272092) (not b!1272084) (not d!139697) (not b!1272049) (not b!1272090) (not b!1272081) (not bm!62496) (not b!1272050) (not bm!62500) (not b!1272064) (not b!1272018) (not b!1272016) (not b!1272057) (not mapNonEmpty!51118) (not b!1272082))
(check-sat b_and!45683 (not b_next!27649))
