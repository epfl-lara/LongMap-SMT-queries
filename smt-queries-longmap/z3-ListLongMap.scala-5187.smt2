; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70110 () Bool)

(assert start!70110)

(declare-fun b_free!12531 () Bool)

(declare-fun b_next!12531 () Bool)

(assert (=> start!70110 (= b_free!12531 (not b_next!12531))))

(declare-fun tp!44308 () Bool)

(declare-fun b_and!21303 () Bool)

(assert (=> start!70110 (= tp!44308 b_and!21303)))

(declare-fun b!814730 () Bool)

(declare-fun res!556445 () Bool)

(declare-fun e!451666 () Bool)

(assert (=> b!814730 (=> (not res!556445) (not e!451666))))

(declare-datatypes ((array!44684 0))(
  ( (array!44685 (arr!21402 (Array (_ BitVec 32) (_ BitVec 64))) (size!21823 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44684)

(declare-datatypes ((List!15228 0))(
  ( (Nil!15225) (Cons!15224 (h!16353 (_ BitVec 64)) (t!21545 List!15228)) )
))
(declare-fun arrayNoDuplicates!0 (array!44684 (_ BitVec 32) List!15228) Bool)

(assert (=> b!814730 (= res!556445 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15225))))

(declare-fun b!814731 () Bool)

(declare-fun res!556444 () Bool)

(assert (=> b!814731 (=> (not res!556444) (not e!451666))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23989 0))(
  ( (V!23990 (val!7168 Int)) )
))
(declare-datatypes ((ValueCell!6705 0))(
  ( (ValueCellFull!6705 (v!9595 V!23989)) (EmptyCell!6705) )
))
(declare-datatypes ((array!44686 0))(
  ( (array!44687 (arr!21403 (Array (_ BitVec 32) ValueCell!6705)) (size!21824 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44686)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814731 (= res!556444 (and (= (size!21824 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21823 _keys!976) (size!21824 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814732 () Bool)

(declare-fun e!451667 () Bool)

(declare-fun tp_is_empty!14241 () Bool)

(assert (=> b!814732 (= e!451667 tp_is_empty!14241)))

(declare-fun b!814733 () Bool)

(declare-fun e!451665 () Bool)

(assert (=> b!814733 (= e!451665 tp_is_empty!14241)))

(declare-fun b!814734 () Bool)

(assert (=> b!814734 (= e!451666 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21823 _keys!976)))))))

(declare-datatypes ((tuple2!9396 0))(
  ( (tuple2!9397 (_1!4709 (_ BitVec 64)) (_2!4709 V!23989)) )
))
(declare-datatypes ((List!15229 0))(
  ( (Nil!15226) (Cons!15225 (h!16354 tuple2!9396) (t!21546 List!15229)) )
))
(declare-datatypes ((ListLongMap!8219 0))(
  ( (ListLongMap!8220 (toList!4125 List!15229)) )
))
(declare-fun lt!364742 () ListLongMap!8219)

(declare-fun lt!364743 () ListLongMap!8219)

(assert (=> b!814734 (= lt!364742 lt!364743)))

(declare-fun zeroValueBefore!34 () V!23989)

(declare-fun zeroValueAfter!34 () V!23989)

(declare-fun minValue!754 () V!23989)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27748 0))(
  ( (Unit!27749) )
))
(declare-fun lt!364741 () Unit!27748)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!285 (array!44684 array!44686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23989 V!23989 V!23989 V!23989 (_ BitVec 32) Int) Unit!27748)

(assert (=> b!814734 (= lt!364741 (lemmaNoChangeToArrayThenSameMapNoExtras!285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2175 (array!44684 array!44686 (_ BitVec 32) (_ BitVec 32) V!23989 V!23989 (_ BitVec 32) Int) ListLongMap!8219)

(assert (=> b!814734 (= lt!364743 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814734 (= lt!364742 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814735 () Bool)

(declare-fun res!556446 () Bool)

(assert (=> b!814735 (=> (not res!556446) (not e!451666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44684 (_ BitVec 32)) Bool)

(assert (=> b!814735 (= res!556446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814736 () Bool)

(declare-fun e!451664 () Bool)

(declare-fun mapRes!22942 () Bool)

(assert (=> b!814736 (= e!451664 (and e!451667 mapRes!22942))))

(declare-fun condMapEmpty!22942 () Bool)

(declare-fun mapDefault!22942 () ValueCell!6705)

(assert (=> b!814736 (= condMapEmpty!22942 (= (arr!21403 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6705)) mapDefault!22942)))))

(declare-fun mapIsEmpty!22942 () Bool)

(assert (=> mapIsEmpty!22942 mapRes!22942))

(declare-fun mapNonEmpty!22942 () Bool)

(declare-fun tp!44307 () Bool)

(assert (=> mapNonEmpty!22942 (= mapRes!22942 (and tp!44307 e!451665))))

(declare-fun mapKey!22942 () (_ BitVec 32))

(declare-fun mapRest!22942 () (Array (_ BitVec 32) ValueCell!6705))

(declare-fun mapValue!22942 () ValueCell!6705)

(assert (=> mapNonEmpty!22942 (= (arr!21403 _values!788) (store mapRest!22942 mapKey!22942 mapValue!22942))))

(declare-fun res!556443 () Bool)

(assert (=> start!70110 (=> (not res!556443) (not e!451666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70110 (= res!556443 (validMask!0 mask!1312))))

(assert (=> start!70110 e!451666))

(assert (=> start!70110 tp_is_empty!14241))

(declare-fun array_inv!17121 (array!44684) Bool)

(assert (=> start!70110 (array_inv!17121 _keys!976)))

(assert (=> start!70110 true))

(declare-fun array_inv!17122 (array!44686) Bool)

(assert (=> start!70110 (and (array_inv!17122 _values!788) e!451664)))

(assert (=> start!70110 tp!44308))

(assert (= (and start!70110 res!556443) b!814731))

(assert (= (and b!814731 res!556444) b!814735))

(assert (= (and b!814735 res!556446) b!814730))

(assert (= (and b!814730 res!556445) b!814734))

(assert (= (and b!814736 condMapEmpty!22942) mapIsEmpty!22942))

(assert (= (and b!814736 (not condMapEmpty!22942)) mapNonEmpty!22942))

(get-info :version)

(assert (= (and mapNonEmpty!22942 ((_ is ValueCellFull!6705) mapValue!22942)) b!814733))

(assert (= (and b!814736 ((_ is ValueCellFull!6705) mapDefault!22942)) b!814732))

(assert (= start!70110 b!814736))

(declare-fun m!756503 () Bool)

(assert (=> b!814734 m!756503))

(declare-fun m!756505 () Bool)

(assert (=> b!814734 m!756505))

(declare-fun m!756507 () Bool)

(assert (=> b!814734 m!756507))

(declare-fun m!756509 () Bool)

(assert (=> b!814730 m!756509))

(declare-fun m!756511 () Bool)

(assert (=> mapNonEmpty!22942 m!756511))

(declare-fun m!756513 () Bool)

(assert (=> start!70110 m!756513))

(declare-fun m!756515 () Bool)

(assert (=> start!70110 m!756515))

(declare-fun m!756517 () Bool)

(assert (=> start!70110 m!756517))

(declare-fun m!756519 () Bool)

(assert (=> b!814735 m!756519))

(check-sat (not b!814735) tp_is_empty!14241 (not start!70110) (not b!814730) (not mapNonEmpty!22942) (not b_next!12531) (not b!814734) b_and!21303)
(check-sat b_and!21303 (not b_next!12531))
(get-model)

(declare-fun d!104435 () Bool)

(assert (=> d!104435 (= (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364755 () Unit!27748)

(declare-fun choose!1387 (array!44684 array!44686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23989 V!23989 V!23989 V!23989 (_ BitVec 32) Int) Unit!27748)

(assert (=> d!104435 (= lt!364755 (choose!1387 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104435 (validMask!0 mask!1312)))

(assert (=> d!104435 (= (lemmaNoChangeToArrayThenSameMapNoExtras!285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364755)))

(declare-fun bs!22672 () Bool)

(assert (= bs!22672 d!104435))

(assert (=> bs!22672 m!756507))

(assert (=> bs!22672 m!756505))

(declare-fun m!756539 () Bool)

(assert (=> bs!22672 m!756539))

(assert (=> bs!22672 m!756513))

(assert (=> b!814734 d!104435))

(declare-fun b!814782 () Bool)

(declare-fun e!451700 () ListLongMap!8219)

(assert (=> b!814782 (= e!451700 (ListLongMap!8220 Nil!15226))))

(declare-fun d!104437 () Bool)

(declare-fun e!451704 () Bool)

(assert (=> d!104437 e!451704))

(declare-fun res!556469 () Bool)

(assert (=> d!104437 (=> (not res!556469) (not e!451704))))

(declare-fun lt!364773 () ListLongMap!8219)

(declare-fun contains!4145 (ListLongMap!8219 (_ BitVec 64)) Bool)

(assert (=> d!104437 (= res!556469 (not (contains!4145 lt!364773 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104437 (= lt!364773 e!451700)))

(declare-fun c!88933 () Bool)

(assert (=> d!104437 (= c!88933 (bvsge #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(assert (=> d!104437 (validMask!0 mask!1312)))

(assert (=> d!104437 (= (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364773)))

(declare-fun e!451701 () Bool)

(declare-fun b!814783 () Bool)

(assert (=> b!814783 (= e!451701 (= lt!364773 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!814784 () Bool)

(declare-fun lt!364775 () Unit!27748)

(declare-fun lt!364771 () Unit!27748)

(assert (=> b!814784 (= lt!364775 lt!364771)))

(declare-fun lt!364772 () (_ BitVec 64))

(declare-fun lt!364774 () ListLongMap!8219)

(declare-fun lt!364770 () V!23989)

(declare-fun lt!364776 () (_ BitVec 64))

(declare-fun +!1780 (ListLongMap!8219 tuple2!9396) ListLongMap!8219)

(assert (=> b!814784 (not (contains!4145 (+!1780 lt!364774 (tuple2!9397 lt!364772 lt!364770)) lt!364776))))

(declare-fun addStillNotContains!173 (ListLongMap!8219 (_ BitVec 64) V!23989 (_ BitVec 64)) Unit!27748)

(assert (=> b!814784 (= lt!364771 (addStillNotContains!173 lt!364774 lt!364772 lt!364770 lt!364776))))

(assert (=> b!814784 (= lt!364776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11471 (ValueCell!6705 V!23989) V!23989)

(declare-fun dynLambda!959 (Int (_ BitVec 64)) V!23989)

(assert (=> b!814784 (= lt!364770 (get!11471 (select (arr!21403 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!814784 (= lt!364772 (select (arr!21402 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35502 () ListLongMap!8219)

(assert (=> b!814784 (= lt!364774 call!35502)))

(declare-fun e!451702 () ListLongMap!8219)

(assert (=> b!814784 (= e!451702 (+!1780 call!35502 (tuple2!9397 (select (arr!21402 _keys!976) #b00000000000000000000000000000000) (get!11471 (select (arr!21403 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!814785 () Bool)

(declare-fun res!556468 () Bool)

(assert (=> b!814785 (=> (not res!556468) (not e!451704))))

(assert (=> b!814785 (= res!556468 (not (contains!4145 lt!364773 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!814786 () Bool)

(assert (=> b!814786 (= e!451700 e!451702)))

(declare-fun c!88936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!814786 (= c!88936 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814787 () Bool)

(declare-fun isEmpty!630 (ListLongMap!8219) Bool)

(assert (=> b!814787 (= e!451701 (isEmpty!630 lt!364773))))

(declare-fun b!814788 () Bool)

(declare-fun e!451699 () Bool)

(assert (=> b!814788 (= e!451699 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814788 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!814789 () Bool)

(assert (=> b!814789 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(assert (=> b!814789 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21824 _values!788)))))

(declare-fun e!451698 () Bool)

(declare-fun apply!348 (ListLongMap!8219 (_ BitVec 64)) V!23989)

(assert (=> b!814789 (= e!451698 (= (apply!348 lt!364773 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)) (get!11471 (select (arr!21403 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!814790 () Bool)

(declare-fun e!451703 () Bool)

(assert (=> b!814790 (= e!451703 e!451701)))

(declare-fun c!88935 () Bool)

(assert (=> b!814790 (= c!88935 (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(declare-fun bm!35499 () Bool)

(assert (=> bm!35499 (= call!35502 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!814791 () Bool)

(assert (=> b!814791 (= e!451704 e!451703)))

(declare-fun c!88934 () Bool)

(assert (=> b!814791 (= c!88934 e!451699)))

(declare-fun res!556470 () Bool)

(assert (=> b!814791 (=> (not res!556470) (not e!451699))))

(assert (=> b!814791 (= res!556470 (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(declare-fun b!814792 () Bool)

(assert (=> b!814792 (= e!451703 e!451698)))

(assert (=> b!814792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(declare-fun res!556467 () Bool)

(assert (=> b!814792 (= res!556467 (contains!4145 lt!364773 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814792 (=> (not res!556467) (not e!451698))))

(declare-fun b!814793 () Bool)

(assert (=> b!814793 (= e!451702 call!35502)))

(assert (= (and d!104437 c!88933) b!814782))

(assert (= (and d!104437 (not c!88933)) b!814786))

(assert (= (and b!814786 c!88936) b!814784))

(assert (= (and b!814786 (not c!88936)) b!814793))

(assert (= (or b!814784 b!814793) bm!35499))

(assert (= (and d!104437 res!556469) b!814785))

(assert (= (and b!814785 res!556468) b!814791))

(assert (= (and b!814791 res!556470) b!814788))

(assert (= (and b!814791 c!88934) b!814792))

(assert (= (and b!814791 (not c!88934)) b!814790))

(assert (= (and b!814792 res!556467) b!814789))

(assert (= (and b!814790 c!88935) b!814783))

(assert (= (and b!814790 (not c!88935)) b!814787))

(declare-fun b_lambda!10831 () Bool)

(assert (=> (not b_lambda!10831) (not b!814784)))

(declare-fun t!21549 () Bool)

(declare-fun tb!4177 () Bool)

(assert (=> (and start!70110 (= defaultEntry!796 defaultEntry!796) t!21549) tb!4177))

(declare-fun result!7871 () Bool)

(assert (=> tb!4177 (= result!7871 tp_is_empty!14241)))

(assert (=> b!814784 t!21549))

(declare-fun b_and!21307 () Bool)

(assert (= b_and!21303 (and (=> t!21549 result!7871) b_and!21307)))

(declare-fun b_lambda!10833 () Bool)

(assert (=> (not b_lambda!10833) (not b!814789)))

(assert (=> b!814789 t!21549))

(declare-fun b_and!21309 () Bool)

(assert (= b_and!21307 (and (=> t!21549 result!7871) b_and!21309)))

(declare-fun m!756541 () Bool)

(assert (=> b!814789 m!756541))

(declare-fun m!756543 () Bool)

(assert (=> b!814789 m!756543))

(declare-fun m!756545 () Bool)

(assert (=> b!814789 m!756545))

(declare-fun m!756547 () Bool)

(assert (=> b!814789 m!756547))

(assert (=> b!814789 m!756541))

(declare-fun m!756549 () Bool)

(assert (=> b!814789 m!756549))

(assert (=> b!814789 m!756543))

(assert (=> b!814789 m!756547))

(assert (=> b!814788 m!756543))

(assert (=> b!814788 m!756543))

(declare-fun m!756551 () Bool)

(assert (=> b!814788 m!756551))

(declare-fun m!756553 () Bool)

(assert (=> d!104437 m!756553))

(assert (=> d!104437 m!756513))

(assert (=> b!814786 m!756543))

(assert (=> b!814786 m!756543))

(assert (=> b!814786 m!756551))

(declare-fun m!756555 () Bool)

(assert (=> b!814787 m!756555))

(declare-fun m!756557 () Bool)

(assert (=> bm!35499 m!756557))

(declare-fun m!756559 () Bool)

(assert (=> b!814785 m!756559))

(assert (=> b!814783 m!756557))

(assert (=> b!814792 m!756543))

(assert (=> b!814792 m!756543))

(declare-fun m!756561 () Bool)

(assert (=> b!814792 m!756561))

(declare-fun m!756563 () Bool)

(assert (=> b!814784 m!756563))

(assert (=> b!814784 m!756541))

(declare-fun m!756565 () Bool)

(assert (=> b!814784 m!756565))

(assert (=> b!814784 m!756547))

(assert (=> b!814784 m!756541))

(assert (=> b!814784 m!756549))

(assert (=> b!814784 m!756543))

(assert (=> b!814784 m!756565))

(declare-fun m!756567 () Bool)

(assert (=> b!814784 m!756567))

(assert (=> b!814784 m!756547))

(declare-fun m!756569 () Bool)

(assert (=> b!814784 m!756569))

(assert (=> b!814734 d!104437))

(declare-fun b!814796 () Bool)

(declare-fun e!451707 () ListLongMap!8219)

(assert (=> b!814796 (= e!451707 (ListLongMap!8220 Nil!15226))))

(declare-fun d!104439 () Bool)

(declare-fun e!451711 () Bool)

(assert (=> d!104439 e!451711))

(declare-fun res!556473 () Bool)

(assert (=> d!104439 (=> (not res!556473) (not e!451711))))

(declare-fun lt!364780 () ListLongMap!8219)

(assert (=> d!104439 (= res!556473 (not (contains!4145 lt!364780 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104439 (= lt!364780 e!451707)))

(declare-fun c!88937 () Bool)

(assert (=> d!104439 (= c!88937 (bvsge #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(assert (=> d!104439 (validMask!0 mask!1312)))

(assert (=> d!104439 (= (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364780)))

(declare-fun e!451708 () Bool)

(declare-fun b!814797 () Bool)

(assert (=> b!814797 (= e!451708 (= lt!364780 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!814798 () Bool)

(declare-fun lt!364782 () Unit!27748)

(declare-fun lt!364778 () Unit!27748)

(assert (=> b!814798 (= lt!364782 lt!364778)))

(declare-fun lt!364777 () V!23989)

(declare-fun lt!364779 () (_ BitVec 64))

(declare-fun lt!364781 () ListLongMap!8219)

(declare-fun lt!364783 () (_ BitVec 64))

(assert (=> b!814798 (not (contains!4145 (+!1780 lt!364781 (tuple2!9397 lt!364779 lt!364777)) lt!364783))))

(assert (=> b!814798 (= lt!364778 (addStillNotContains!173 lt!364781 lt!364779 lt!364777 lt!364783))))

(assert (=> b!814798 (= lt!364783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!814798 (= lt!364777 (get!11471 (select (arr!21403 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!814798 (= lt!364779 (select (arr!21402 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35503 () ListLongMap!8219)

(assert (=> b!814798 (= lt!364781 call!35503)))

(declare-fun e!451709 () ListLongMap!8219)

(assert (=> b!814798 (= e!451709 (+!1780 call!35503 (tuple2!9397 (select (arr!21402 _keys!976) #b00000000000000000000000000000000) (get!11471 (select (arr!21403 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!814799 () Bool)

(declare-fun res!556472 () Bool)

(assert (=> b!814799 (=> (not res!556472) (not e!451711))))

(assert (=> b!814799 (= res!556472 (not (contains!4145 lt!364780 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!814800 () Bool)

(assert (=> b!814800 (= e!451707 e!451709)))

(declare-fun c!88940 () Bool)

(assert (=> b!814800 (= c!88940 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814801 () Bool)

(assert (=> b!814801 (= e!451708 (isEmpty!630 lt!364780))))

(declare-fun b!814802 () Bool)

(declare-fun e!451706 () Bool)

(assert (=> b!814802 (= e!451706 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814802 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!814803 () Bool)

(assert (=> b!814803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(assert (=> b!814803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21824 _values!788)))))

(declare-fun e!451705 () Bool)

(assert (=> b!814803 (= e!451705 (= (apply!348 lt!364780 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)) (get!11471 (select (arr!21403 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!814804 () Bool)

(declare-fun e!451710 () Bool)

(assert (=> b!814804 (= e!451710 e!451708)))

(declare-fun c!88939 () Bool)

(assert (=> b!814804 (= c!88939 (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(declare-fun bm!35500 () Bool)

(assert (=> bm!35500 (= call!35503 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!814805 () Bool)

(assert (=> b!814805 (= e!451711 e!451710)))

(declare-fun c!88938 () Bool)

(assert (=> b!814805 (= c!88938 e!451706)))

(declare-fun res!556474 () Bool)

(assert (=> b!814805 (=> (not res!556474) (not e!451706))))

(assert (=> b!814805 (= res!556474 (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(declare-fun b!814806 () Bool)

(assert (=> b!814806 (= e!451710 e!451705)))

(assert (=> b!814806 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(declare-fun res!556471 () Bool)

(assert (=> b!814806 (= res!556471 (contains!4145 lt!364780 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814806 (=> (not res!556471) (not e!451705))))

(declare-fun b!814807 () Bool)

(assert (=> b!814807 (= e!451709 call!35503)))

(assert (= (and d!104439 c!88937) b!814796))

(assert (= (and d!104439 (not c!88937)) b!814800))

(assert (= (and b!814800 c!88940) b!814798))

(assert (= (and b!814800 (not c!88940)) b!814807))

(assert (= (or b!814798 b!814807) bm!35500))

(assert (= (and d!104439 res!556473) b!814799))

(assert (= (and b!814799 res!556472) b!814805))

(assert (= (and b!814805 res!556474) b!814802))

(assert (= (and b!814805 c!88938) b!814806))

(assert (= (and b!814805 (not c!88938)) b!814804))

(assert (= (and b!814806 res!556471) b!814803))

(assert (= (and b!814804 c!88939) b!814797))

(assert (= (and b!814804 (not c!88939)) b!814801))

(declare-fun b_lambda!10835 () Bool)

(assert (=> (not b_lambda!10835) (not b!814798)))

(assert (=> b!814798 t!21549))

(declare-fun b_and!21311 () Bool)

(assert (= b_and!21309 (and (=> t!21549 result!7871) b_and!21311)))

(declare-fun b_lambda!10837 () Bool)

(assert (=> (not b_lambda!10837) (not b!814803)))

(assert (=> b!814803 t!21549))

(declare-fun b_and!21313 () Bool)

(assert (= b_and!21311 (and (=> t!21549 result!7871) b_and!21313)))

(assert (=> b!814803 m!756541))

(assert (=> b!814803 m!756543))

(declare-fun m!756571 () Bool)

(assert (=> b!814803 m!756571))

(assert (=> b!814803 m!756547))

(assert (=> b!814803 m!756541))

(assert (=> b!814803 m!756549))

(assert (=> b!814803 m!756543))

(assert (=> b!814803 m!756547))

(assert (=> b!814802 m!756543))

(assert (=> b!814802 m!756543))

(assert (=> b!814802 m!756551))

(declare-fun m!756573 () Bool)

(assert (=> d!104439 m!756573))

(assert (=> d!104439 m!756513))

(assert (=> b!814800 m!756543))

(assert (=> b!814800 m!756543))

(assert (=> b!814800 m!756551))

(declare-fun m!756575 () Bool)

(assert (=> b!814801 m!756575))

(declare-fun m!756577 () Bool)

(assert (=> bm!35500 m!756577))

(declare-fun m!756579 () Bool)

(assert (=> b!814799 m!756579))

(assert (=> b!814797 m!756577))

(assert (=> b!814806 m!756543))

(assert (=> b!814806 m!756543))

(declare-fun m!756581 () Bool)

(assert (=> b!814806 m!756581))

(declare-fun m!756583 () Bool)

(assert (=> b!814798 m!756583))

(assert (=> b!814798 m!756541))

(declare-fun m!756585 () Bool)

(assert (=> b!814798 m!756585))

(assert (=> b!814798 m!756547))

(assert (=> b!814798 m!756541))

(assert (=> b!814798 m!756549))

(assert (=> b!814798 m!756543))

(assert (=> b!814798 m!756585))

(declare-fun m!756587 () Bool)

(assert (=> b!814798 m!756587))

(assert (=> b!814798 m!756547))

(declare-fun m!756589 () Bool)

(assert (=> b!814798 m!756589))

(assert (=> b!814734 d!104439))

(declare-fun d!104441 () Bool)

(assert (=> d!104441 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70110 d!104441))

(declare-fun d!104443 () Bool)

(assert (=> d!104443 (= (array_inv!17121 _keys!976) (bvsge (size!21823 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70110 d!104443))

(declare-fun d!104445 () Bool)

(assert (=> d!104445 (= (array_inv!17122 _values!788) (bvsge (size!21824 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70110 d!104445))

(declare-fun b!814816 () Bool)

(declare-fun e!451720 () Bool)

(declare-fun call!35506 () Bool)

(assert (=> b!814816 (= e!451720 call!35506)))

(declare-fun d!104447 () Bool)

(declare-fun res!556480 () Bool)

(declare-fun e!451718 () Bool)

(assert (=> d!104447 (=> res!556480 e!451718)))

(assert (=> d!104447 (= res!556480 (bvsge #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(assert (=> d!104447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!451718)))

(declare-fun bm!35503 () Bool)

(assert (=> bm!35503 (= call!35506 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!814817 () Bool)

(declare-fun e!451719 () Bool)

(assert (=> b!814817 (= e!451719 call!35506)))

(declare-fun b!814818 () Bool)

(assert (=> b!814818 (= e!451718 e!451719)))

(declare-fun c!88943 () Bool)

(assert (=> b!814818 (= c!88943 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814819 () Bool)

(assert (=> b!814819 (= e!451719 e!451720)))

(declare-fun lt!364791 () (_ BitVec 64))

(assert (=> b!814819 (= lt!364791 (select (arr!21402 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!364792 () Unit!27748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44684 (_ BitVec 64) (_ BitVec 32)) Unit!27748)

(assert (=> b!814819 (= lt!364792 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364791 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!814819 (arrayContainsKey!0 _keys!976 lt!364791 #b00000000000000000000000000000000)))

(declare-fun lt!364790 () Unit!27748)

(assert (=> b!814819 (= lt!364790 lt!364792)))

(declare-fun res!556479 () Bool)

(declare-datatypes ((SeekEntryResult!8720 0))(
  ( (MissingZero!8720 (index!37251 (_ BitVec 32))) (Found!8720 (index!37252 (_ BitVec 32))) (Intermediate!8720 (undefined!9532 Bool) (index!37253 (_ BitVec 32)) (x!68533 (_ BitVec 32))) (Undefined!8720) (MissingVacant!8720 (index!37254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44684 (_ BitVec 32)) SeekEntryResult!8720)

(assert (=> b!814819 (= res!556479 (= (seekEntryOrOpen!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8720 #b00000000000000000000000000000000)))))

(assert (=> b!814819 (=> (not res!556479) (not e!451720))))

(assert (= (and d!104447 (not res!556480)) b!814818))

(assert (= (and b!814818 c!88943) b!814819))

(assert (= (and b!814818 (not c!88943)) b!814817))

(assert (= (and b!814819 res!556479) b!814816))

(assert (= (or b!814816 b!814817) bm!35503))

(declare-fun m!756591 () Bool)

(assert (=> bm!35503 m!756591))

(assert (=> b!814818 m!756543))

(assert (=> b!814818 m!756543))

(assert (=> b!814818 m!756551))

(assert (=> b!814819 m!756543))

(declare-fun m!756593 () Bool)

(assert (=> b!814819 m!756593))

(declare-fun m!756595 () Bool)

(assert (=> b!814819 m!756595))

(assert (=> b!814819 m!756543))

(declare-fun m!756597 () Bool)

(assert (=> b!814819 m!756597))

(assert (=> b!814735 d!104447))

(declare-fun b!814830 () Bool)

(declare-fun e!451732 () Bool)

(declare-fun contains!4146 (List!15228 (_ BitVec 64)) Bool)

(assert (=> b!814830 (= e!451732 (contains!4146 Nil!15225 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104449 () Bool)

(declare-fun res!556487 () Bool)

(declare-fun e!451731 () Bool)

(assert (=> d!104449 (=> res!556487 e!451731)))

(assert (=> d!104449 (= res!556487 (bvsge #b00000000000000000000000000000000 (size!21823 _keys!976)))))

(assert (=> d!104449 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15225) e!451731)))

(declare-fun b!814831 () Bool)

(declare-fun e!451729 () Bool)

(declare-fun e!451730 () Bool)

(assert (=> b!814831 (= e!451729 e!451730)))

(declare-fun c!88946 () Bool)

(assert (=> b!814831 (= c!88946 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814832 () Bool)

(declare-fun call!35509 () Bool)

(assert (=> b!814832 (= e!451730 call!35509)))

(declare-fun bm!35506 () Bool)

(assert (=> bm!35506 (= call!35509 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88946 (Cons!15224 (select (arr!21402 _keys!976) #b00000000000000000000000000000000) Nil!15225) Nil!15225)))))

(declare-fun b!814833 () Bool)

(assert (=> b!814833 (= e!451730 call!35509)))

(declare-fun b!814834 () Bool)

(assert (=> b!814834 (= e!451731 e!451729)))

(declare-fun res!556489 () Bool)

(assert (=> b!814834 (=> (not res!556489) (not e!451729))))

(assert (=> b!814834 (= res!556489 (not e!451732))))

(declare-fun res!556488 () Bool)

(assert (=> b!814834 (=> (not res!556488) (not e!451732))))

(assert (=> b!814834 (= res!556488 (validKeyInArray!0 (select (arr!21402 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104449 (not res!556487)) b!814834))

(assert (= (and b!814834 res!556488) b!814830))

(assert (= (and b!814834 res!556489) b!814831))

(assert (= (and b!814831 c!88946) b!814832))

(assert (= (and b!814831 (not c!88946)) b!814833))

(assert (= (or b!814832 b!814833) bm!35506))

(assert (=> b!814830 m!756543))

(assert (=> b!814830 m!756543))

(declare-fun m!756599 () Bool)

(assert (=> b!814830 m!756599))

(assert (=> b!814831 m!756543))

(assert (=> b!814831 m!756543))

(assert (=> b!814831 m!756551))

(assert (=> bm!35506 m!756543))

(declare-fun m!756601 () Bool)

(assert (=> bm!35506 m!756601))

(assert (=> b!814834 m!756543))

(assert (=> b!814834 m!756543))

(assert (=> b!814834 m!756551))

(assert (=> b!814730 d!104449))

(declare-fun mapIsEmpty!22948 () Bool)

(declare-fun mapRes!22948 () Bool)

(assert (=> mapIsEmpty!22948 mapRes!22948))

(declare-fun mapNonEmpty!22948 () Bool)

(declare-fun tp!44317 () Bool)

(declare-fun e!451738 () Bool)

(assert (=> mapNonEmpty!22948 (= mapRes!22948 (and tp!44317 e!451738))))

(declare-fun mapKey!22948 () (_ BitVec 32))

(declare-fun mapValue!22948 () ValueCell!6705)

(declare-fun mapRest!22948 () (Array (_ BitVec 32) ValueCell!6705))

(assert (=> mapNonEmpty!22948 (= mapRest!22942 (store mapRest!22948 mapKey!22948 mapValue!22948))))

(declare-fun b!814841 () Bool)

(assert (=> b!814841 (= e!451738 tp_is_empty!14241)))

(declare-fun condMapEmpty!22948 () Bool)

(declare-fun mapDefault!22948 () ValueCell!6705)

(assert (=> mapNonEmpty!22942 (= condMapEmpty!22948 (= mapRest!22942 ((as const (Array (_ BitVec 32) ValueCell!6705)) mapDefault!22948)))))

(declare-fun e!451737 () Bool)

(assert (=> mapNonEmpty!22942 (= tp!44307 (and e!451737 mapRes!22948))))

(declare-fun b!814842 () Bool)

(assert (=> b!814842 (= e!451737 tp_is_empty!14241)))

(assert (= (and mapNonEmpty!22942 condMapEmpty!22948) mapIsEmpty!22948))

(assert (= (and mapNonEmpty!22942 (not condMapEmpty!22948)) mapNonEmpty!22948))

(assert (= (and mapNonEmpty!22948 ((_ is ValueCellFull!6705) mapValue!22948)) b!814841))

(assert (= (and mapNonEmpty!22942 ((_ is ValueCellFull!6705) mapDefault!22948)) b!814842))

(declare-fun m!756603 () Bool)

(assert (=> mapNonEmpty!22948 m!756603))

(declare-fun b_lambda!10839 () Bool)

(assert (= b_lambda!10831 (or (and start!70110 b_free!12531) b_lambda!10839)))

(declare-fun b_lambda!10841 () Bool)

(assert (= b_lambda!10833 (or (and start!70110 b_free!12531) b_lambda!10841)))

(declare-fun b_lambda!10843 () Bool)

(assert (= b_lambda!10835 (or (and start!70110 b_free!12531) b_lambda!10843)))

(declare-fun b_lambda!10845 () Bool)

(assert (= b_lambda!10837 (or (and start!70110 b_free!12531) b_lambda!10845)))

(check-sat (not b!814834) (not b_lambda!10839) (not b!814785) tp_is_empty!14241 (not b!814784) (not b!814783) (not b!814800) (not b!814819) (not b_lambda!10843) (not b!814787) (not b!814802) (not b!814801) b_and!21313 (not b!814792) (not b!814789) (not bm!35500) (not b!814798) (not bm!35503) (not d!104437) (not b!814803) (not b!814831) (not b!814818) (not mapNonEmpty!22948) (not b!814806) (not b!814788) (not b!814786) (not b_lambda!10845) (not b!814797) (not bm!35506) (not b_next!12531) (not d!104435) (not b_lambda!10841) (not d!104439) (not b!814830) (not bm!35499) (not b!814799))
(check-sat b_and!21313 (not b_next!12531))
