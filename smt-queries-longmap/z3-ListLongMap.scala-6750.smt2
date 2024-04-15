; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84616 () Bool)

(assert start!84616)

(declare-fun b_free!20059 () Bool)

(declare-fun b_next!20059 () Bool)

(assert (=> start!84616 (= b_free!20059 (not b_next!20059))))

(declare-fun tp!69970 () Bool)

(declare-fun b_and!32165 () Bool)

(assert (=> start!84616 (= tp!69970 b_and!32165)))

(declare-fun b!989586 () Bool)

(declare-fun res!661798 () Bool)

(declare-fun e!557989 () Bool)

(assert (=> b!989586 (=> (not res!661798) (not e!557989))))

(declare-datatypes ((array!62444 0))(
  ( (array!62445 (arr!30075 (Array (_ BitVec 32) (_ BitVec 64))) (size!30556 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62444)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62444 (_ BitVec 32)) Bool)

(assert (=> b!989586 (= res!661798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989587 () Bool)

(declare-fun e!557993 () Bool)

(declare-fun tp_is_empty!23275 () Bool)

(assert (=> b!989587 (= e!557993 tp_is_empty!23275)))

(declare-fun b!989588 () Bool)

(declare-fun e!557990 () Bool)

(declare-fun mapRes!36958 () Bool)

(assert (=> b!989588 (= e!557990 (and e!557993 mapRes!36958))))

(declare-fun condMapEmpty!36958 () Bool)

(declare-datatypes ((V!36017 0))(
  ( (V!36018 (val!11688 Int)) )
))
(declare-datatypes ((ValueCell!11156 0))(
  ( (ValueCellFull!11156 (v!14257 V!36017)) (EmptyCell!11156) )
))
(declare-datatypes ((array!62446 0))(
  ( (array!62447 (arr!30076 (Array (_ BitVec 32) ValueCell!11156)) (size!30557 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62446)

(declare-fun mapDefault!36958 () ValueCell!11156)

(assert (=> b!989588 (= condMapEmpty!36958 (= (arr!30076 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11156)) mapDefault!36958)))))

(declare-fun b!989589 () Bool)

(declare-fun res!661794 () Bool)

(assert (=> b!989589 (=> (not res!661794) (not e!557989))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989589 (= res!661794 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!989590 () Bool)

(declare-fun res!661797 () Bool)

(assert (=> b!989590 (=> (not res!661797) (not e!557989))))

(assert (=> b!989590 (= res!661797 (and (= (size!30557 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30556 _keys!1544) (size!30557 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989591 () Bool)

(declare-fun res!661793 () Bool)

(assert (=> b!989591 (=> (not res!661793) (not e!557989))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989591 (= res!661793 (validKeyInArray!0 (select (arr!30075 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36958 () Bool)

(declare-fun tp!69969 () Bool)

(declare-fun e!557992 () Bool)

(assert (=> mapNonEmpty!36958 (= mapRes!36958 (and tp!69969 e!557992))))

(declare-fun mapValue!36958 () ValueCell!11156)

(declare-fun mapKey!36958 () (_ BitVec 32))

(declare-fun mapRest!36958 () (Array (_ BitVec 32) ValueCell!11156))

(assert (=> mapNonEmpty!36958 (= (arr!30076 _values!1278) (store mapRest!36958 mapKey!36958 mapValue!36958))))

(declare-fun b!989592 () Bool)

(declare-fun res!661795 () Bool)

(assert (=> b!989592 (=> (not res!661795) (not e!557989))))

(declare-datatypes ((List!20861 0))(
  ( (Nil!20858) (Cons!20857 (h!22019 (_ BitVec 64)) (t!29809 List!20861)) )
))
(declare-fun arrayNoDuplicates!0 (array!62444 (_ BitVec 32) List!20861) Bool)

(assert (=> b!989592 (= res!661795 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20858))))

(declare-fun res!661792 () Bool)

(assert (=> start!84616 (=> (not res!661792) (not e!557989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84616 (= res!661792 (validMask!0 mask!1948))))

(assert (=> start!84616 e!557989))

(assert (=> start!84616 true))

(assert (=> start!84616 tp_is_empty!23275))

(declare-fun array_inv!23241 (array!62446) Bool)

(assert (=> start!84616 (and (array_inv!23241 _values!1278) e!557990)))

(assert (=> start!84616 tp!69970))

(declare-fun array_inv!23242 (array!62444) Bool)

(assert (=> start!84616 (array_inv!23242 _keys!1544)))

(declare-fun b!989593 () Bool)

(assert (=> b!989593 (= e!557989 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30075 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14978 0))(
  ( (tuple2!14979 (_1!7500 (_ BitVec 64)) (_2!7500 V!36017)) )
))
(declare-datatypes ((List!20862 0))(
  ( (Nil!20859) (Cons!20858 (h!22020 tuple2!14978) (t!29810 List!20862)) )
))
(declare-datatypes ((ListLongMap!13665 0))(
  ( (ListLongMap!13666 (toList!6848 List!20862)) )
))
(declare-fun lt!438880 () ListLongMap!13665)

(declare-fun minValue!1220 () V!36017)

(declare-fun zeroValue!1220 () V!36017)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3548 (array!62444 array!62446 (_ BitVec 32) (_ BitVec 32) V!36017 V!36017 (_ BitVec 32) Int) ListLongMap!13665)

(assert (=> b!989593 (= lt!438880 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989594 () Bool)

(assert (=> b!989594 (= e!557992 tp_is_empty!23275)))

(declare-fun mapIsEmpty!36958 () Bool)

(assert (=> mapIsEmpty!36958 mapRes!36958))

(declare-fun b!989595 () Bool)

(declare-fun res!661796 () Bool)

(assert (=> b!989595 (=> (not res!661796) (not e!557989))))

(assert (=> b!989595 (= res!661796 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30556 _keys!1544))))))

(assert (= (and start!84616 res!661792) b!989590))

(assert (= (and b!989590 res!661797) b!989586))

(assert (= (and b!989586 res!661798) b!989592))

(assert (= (and b!989592 res!661795) b!989595))

(assert (= (and b!989595 res!661796) b!989591))

(assert (= (and b!989591 res!661793) b!989589))

(assert (= (and b!989589 res!661794) b!989593))

(assert (= (and b!989588 condMapEmpty!36958) mapIsEmpty!36958))

(assert (= (and b!989588 (not condMapEmpty!36958)) mapNonEmpty!36958))

(get-info :version)

(assert (= (and mapNonEmpty!36958 ((_ is ValueCellFull!11156) mapValue!36958)) b!989594))

(assert (= (and b!989588 ((_ is ValueCellFull!11156) mapDefault!36958)) b!989587))

(assert (= start!84616 b!989588))

(declare-fun m!916527 () Bool)

(assert (=> b!989586 m!916527))

(declare-fun m!916529 () Bool)

(assert (=> start!84616 m!916529))

(declare-fun m!916531 () Bool)

(assert (=> start!84616 m!916531))

(declare-fun m!916533 () Bool)

(assert (=> start!84616 m!916533))

(declare-fun m!916535 () Bool)

(assert (=> b!989591 m!916535))

(assert (=> b!989591 m!916535))

(declare-fun m!916537 () Bool)

(assert (=> b!989591 m!916537))

(declare-fun m!916539 () Bool)

(assert (=> b!989592 m!916539))

(assert (=> b!989593 m!916535))

(declare-fun m!916541 () Bool)

(assert (=> b!989593 m!916541))

(declare-fun m!916543 () Bool)

(assert (=> mapNonEmpty!36958 m!916543))

(check-sat (not b_next!20059) (not b!989592) tp_is_empty!23275 (not b!989593) (not mapNonEmpty!36958) (not start!84616) (not b!989591) b_and!32165 (not b!989586))
(check-sat b_and!32165 (not b_next!20059))
(get-model)

(declare-fun b!989680 () Bool)

(declare-fun e!558043 () Bool)

(assert (=> b!989680 (= e!558043 (validKeyInArray!0 (select (arr!30075 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989680 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!989681 () Bool)

(assert (=> b!989681 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30556 _keys!1544)))))

(assert (=> b!989681 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30557 _values!1278)))))

(declare-fun lt!438902 () ListLongMap!13665)

(declare-fun e!558044 () Bool)

(declare-fun apply!889 (ListLongMap!13665 (_ BitVec 64)) V!36017)

(declare-fun get!15624 (ValueCell!11156 V!36017) V!36017)

(declare-fun dynLambda!1858 (Int (_ BitVec 64)) V!36017)

(assert (=> b!989681 (= e!558044 (= (apply!889 lt!438902 (select (arr!30075 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15624 (select (arr!30076 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1858 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!117323 () Bool)

(declare-fun e!558039 () Bool)

(assert (=> d!117323 e!558039))

(declare-fun res!661852 () Bool)

(assert (=> d!117323 (=> (not res!661852) (not e!558039))))

(declare-fun contains!5693 (ListLongMap!13665 (_ BitVec 64)) Bool)

(assert (=> d!117323 (= res!661852 (not (contains!5693 lt!438902 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!558038 () ListLongMap!13665)

(assert (=> d!117323 (= lt!438902 e!558038)))

(declare-fun c!100324 () Bool)

(assert (=> d!117323 (= c!100324 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30556 _keys!1544)))))

(assert (=> d!117323 (validMask!0 mask!1948)))

(assert (=> d!117323 (= (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438902)))

(declare-fun b!989682 () Bool)

(declare-fun e!558041 () Bool)

(assert (=> b!989682 (= e!558041 e!558044)))

(assert (=> b!989682 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30556 _keys!1544)))))

(declare-fun res!661851 () Bool)

(assert (=> b!989682 (= res!661851 (contains!5693 lt!438902 (select (arr!30075 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989682 (=> (not res!661851) (not e!558044))))

(declare-fun b!989683 () Bool)

(declare-fun e!558042 () ListLongMap!13665)

(assert (=> b!989683 (= e!558038 e!558042)))

(declare-fun c!100323 () Bool)

(assert (=> b!989683 (= c!100323 (validKeyInArray!0 (select (arr!30075 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989684 () Bool)

(declare-datatypes ((Unit!32719 0))(
  ( (Unit!32720) )
))
(declare-fun lt!438906 () Unit!32719)

(declare-fun lt!438901 () Unit!32719)

(assert (=> b!989684 (= lt!438906 lt!438901)))

(declare-fun lt!438905 () (_ BitVec 64))

(declare-fun lt!438907 () (_ BitVec 64))

(declare-fun lt!438904 () V!36017)

(declare-fun lt!438903 () ListLongMap!13665)

(declare-fun +!3113 (ListLongMap!13665 tuple2!14978) ListLongMap!13665)

(assert (=> b!989684 (not (contains!5693 (+!3113 lt!438903 (tuple2!14979 lt!438905 lt!438904)) lt!438907))))

(declare-fun addStillNotContains!236 (ListLongMap!13665 (_ BitVec 64) V!36017 (_ BitVec 64)) Unit!32719)

(assert (=> b!989684 (= lt!438901 (addStillNotContains!236 lt!438903 lt!438905 lt!438904 lt!438907))))

(assert (=> b!989684 (= lt!438907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989684 (= lt!438904 (get!15624 (select (arr!30076 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1858 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989684 (= lt!438905 (select (arr!30075 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!41930 () ListLongMap!13665)

(assert (=> b!989684 (= lt!438903 call!41930)))

(assert (=> b!989684 (= e!558042 (+!3113 call!41930 (tuple2!14979 (select (arr!30075 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15624 (select (arr!30076 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1858 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989685 () Bool)

(declare-fun e!558040 () Bool)

(assert (=> b!989685 (= e!558041 e!558040)))

(declare-fun c!100322 () Bool)

(assert (=> b!989685 (= c!100322 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30556 _keys!1544)))))

(declare-fun b!989686 () Bool)

(assert (=> b!989686 (= e!558042 call!41930)))

(declare-fun b!989687 () Bool)

(assert (=> b!989687 (= e!558038 (ListLongMap!13666 Nil!20859))))

(declare-fun b!989688 () Bool)

(declare-fun res!661850 () Bool)

(assert (=> b!989688 (=> (not res!661850) (not e!558039))))

(assert (=> b!989688 (= res!661850 (not (contains!5693 lt!438902 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989689 () Bool)

(declare-fun isEmpty!730 (ListLongMap!13665) Bool)

(assert (=> b!989689 (= e!558040 (isEmpty!730 lt!438902))))

(declare-fun bm!41927 () Bool)

(assert (=> bm!41927 (= call!41930 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989690 () Bool)

(assert (=> b!989690 (= e!558040 (= lt!438902 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989691 () Bool)

(assert (=> b!989691 (= e!558039 e!558041)))

(declare-fun c!100325 () Bool)

(assert (=> b!989691 (= c!100325 e!558043)))

(declare-fun res!661849 () Bool)

(assert (=> b!989691 (=> (not res!661849) (not e!558043))))

(assert (=> b!989691 (= res!661849 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30556 _keys!1544)))))

(assert (= (and d!117323 c!100324) b!989687))

(assert (= (and d!117323 (not c!100324)) b!989683))

(assert (= (and b!989683 c!100323) b!989684))

(assert (= (and b!989683 (not c!100323)) b!989686))

(assert (= (or b!989684 b!989686) bm!41927))

(assert (= (and d!117323 res!661852) b!989688))

(assert (= (and b!989688 res!661850) b!989691))

(assert (= (and b!989691 res!661849) b!989680))

(assert (= (and b!989691 c!100325) b!989682))

(assert (= (and b!989691 (not c!100325)) b!989685))

(assert (= (and b!989682 res!661851) b!989681))

(assert (= (and b!989685 c!100322) b!989690))

(assert (= (and b!989685 (not c!100322)) b!989689))

(declare-fun b_lambda!15119 () Bool)

(assert (=> (not b_lambda!15119) (not b!989681)))

(declare-fun t!29814 () Bool)

(declare-fun tb!6801 () Bool)

(assert (=> (and start!84616 (= defaultEntry!1281 defaultEntry!1281) t!29814) tb!6801))

(declare-fun result!13609 () Bool)

(assert (=> tb!6801 (= result!13609 tp_is_empty!23275)))

(assert (=> b!989681 t!29814))

(declare-fun b_and!32171 () Bool)

(assert (= b_and!32165 (and (=> t!29814 result!13609) b_and!32171)))

(declare-fun b_lambda!15121 () Bool)

(assert (=> (not b_lambda!15121) (not b!989684)))

(assert (=> b!989684 t!29814))

(declare-fun b_and!32173 () Bool)

(assert (= b_and!32171 (and (=> t!29814 result!13609) b_and!32173)))

(declare-fun m!916581 () Bool)

(assert (=> b!989680 m!916581))

(assert (=> b!989680 m!916581))

(declare-fun m!916583 () Bool)

(assert (=> b!989680 m!916583))

(assert (=> b!989683 m!916581))

(assert (=> b!989683 m!916581))

(assert (=> b!989683 m!916583))

(declare-fun m!916585 () Bool)

(assert (=> b!989684 m!916585))

(assert (=> b!989684 m!916585))

(declare-fun m!916587 () Bool)

(assert (=> b!989684 m!916587))

(declare-fun m!916589 () Bool)

(assert (=> b!989684 m!916589))

(declare-fun m!916591 () Bool)

(assert (=> b!989684 m!916591))

(assert (=> b!989684 m!916591))

(declare-fun m!916593 () Bool)

(assert (=> b!989684 m!916593))

(declare-fun m!916595 () Bool)

(assert (=> b!989684 m!916595))

(assert (=> b!989684 m!916581))

(assert (=> b!989684 m!916593))

(declare-fun m!916597 () Bool)

(assert (=> b!989684 m!916597))

(declare-fun m!916599 () Bool)

(assert (=> bm!41927 m!916599))

(declare-fun m!916601 () Bool)

(assert (=> b!989688 m!916601))

(declare-fun m!916603 () Bool)

(assert (=> b!989689 m!916603))

(assert (=> b!989681 m!916593))

(assert (=> b!989681 m!916591))

(assert (=> b!989681 m!916591))

(assert (=> b!989681 m!916593))

(assert (=> b!989681 m!916595))

(assert (=> b!989681 m!916581))

(declare-fun m!916605 () Bool)

(assert (=> b!989681 m!916605))

(assert (=> b!989681 m!916581))

(assert (=> b!989682 m!916581))

(assert (=> b!989682 m!916581))

(declare-fun m!916607 () Bool)

(assert (=> b!989682 m!916607))

(declare-fun m!916609 () Bool)

(assert (=> d!117323 m!916609))

(assert (=> d!117323 m!916529))

(assert (=> b!989690 m!916599))

(assert (=> b!989593 d!117323))

(declare-fun b!989704 () Bool)

(declare-fun e!558053 () Bool)

(declare-fun call!41933 () Bool)

(assert (=> b!989704 (= e!558053 call!41933)))

(declare-fun b!989705 () Bool)

(declare-fun e!558054 () Bool)

(declare-fun contains!5694 (List!20861 (_ BitVec 64)) Bool)

(assert (=> b!989705 (= e!558054 (contains!5694 Nil!20858 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117325 () Bool)

(declare-fun res!661860 () Bool)

(declare-fun e!558055 () Bool)

(assert (=> d!117325 (=> res!661860 e!558055)))

(assert (=> d!117325 (= res!661860 (bvsge #b00000000000000000000000000000000 (size!30556 _keys!1544)))))

(assert (=> d!117325 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20858) e!558055)))

(declare-fun bm!41930 () Bool)

(declare-fun c!100328 () Bool)

(assert (=> bm!41930 (= call!41933 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100328 (Cons!20857 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000) Nil!20858) Nil!20858)))))

(declare-fun b!989706 () Bool)

(declare-fun e!558056 () Bool)

(assert (=> b!989706 (= e!558056 e!558053)))

(assert (=> b!989706 (= c!100328 (validKeyInArray!0 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989707 () Bool)

(assert (=> b!989707 (= e!558053 call!41933)))

(declare-fun b!989708 () Bool)

(assert (=> b!989708 (= e!558055 e!558056)))

(declare-fun res!661861 () Bool)

(assert (=> b!989708 (=> (not res!661861) (not e!558056))))

(assert (=> b!989708 (= res!661861 (not e!558054))))

(declare-fun res!661859 () Bool)

(assert (=> b!989708 (=> (not res!661859) (not e!558054))))

(assert (=> b!989708 (= res!661859 (validKeyInArray!0 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117325 (not res!661860)) b!989708))

(assert (= (and b!989708 res!661859) b!989705))

(assert (= (and b!989708 res!661861) b!989706))

(assert (= (and b!989706 c!100328) b!989704))

(assert (= (and b!989706 (not c!100328)) b!989707))

(assert (= (or b!989704 b!989707) bm!41930))

(declare-fun m!916611 () Bool)

(assert (=> b!989705 m!916611))

(assert (=> b!989705 m!916611))

(declare-fun m!916613 () Bool)

(assert (=> b!989705 m!916613))

(assert (=> bm!41930 m!916611))

(declare-fun m!916615 () Bool)

(assert (=> bm!41930 m!916615))

(assert (=> b!989706 m!916611))

(assert (=> b!989706 m!916611))

(declare-fun m!916617 () Bool)

(assert (=> b!989706 m!916617))

(assert (=> b!989708 m!916611))

(assert (=> b!989708 m!916611))

(assert (=> b!989708 m!916617))

(assert (=> b!989592 d!117325))

(declare-fun d!117327 () Bool)

(assert (=> d!117327 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84616 d!117327))

(declare-fun d!117329 () Bool)

(assert (=> d!117329 (= (array_inv!23241 _values!1278) (bvsge (size!30557 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84616 d!117329))

(declare-fun d!117331 () Bool)

(assert (=> d!117331 (= (array_inv!23242 _keys!1544) (bvsge (size!30556 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84616 d!117331))

(declare-fun b!989717 () Bool)

(declare-fun e!558065 () Bool)

(declare-fun e!558064 () Bool)

(assert (=> b!989717 (= e!558065 e!558064)))

(declare-fun c!100331 () Bool)

(assert (=> b!989717 (= c!100331 (validKeyInArray!0 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989718 () Bool)

(declare-fun e!558063 () Bool)

(declare-fun call!41936 () Bool)

(assert (=> b!989718 (= e!558063 call!41936)))

(declare-fun d!117333 () Bool)

(declare-fun res!661867 () Bool)

(assert (=> d!117333 (=> res!661867 e!558065)))

(assert (=> d!117333 (= res!661867 (bvsge #b00000000000000000000000000000000 (size!30556 _keys!1544)))))

(assert (=> d!117333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558065)))

(declare-fun b!989719 () Bool)

(assert (=> b!989719 (= e!558064 e!558063)))

(declare-fun lt!438914 () (_ BitVec 64))

(assert (=> b!989719 (= lt!438914 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!438915 () Unit!32719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62444 (_ BitVec 64) (_ BitVec 32)) Unit!32719)

(assert (=> b!989719 (= lt!438915 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438914 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!989719 (arrayContainsKey!0 _keys!1544 lt!438914 #b00000000000000000000000000000000)))

(declare-fun lt!438916 () Unit!32719)

(assert (=> b!989719 (= lt!438916 lt!438915)))

(declare-fun res!661866 () Bool)

(declare-datatypes ((SeekEntryResult!9206 0))(
  ( (MissingZero!9206 (index!39195 (_ BitVec 32))) (Found!9206 (index!39196 (_ BitVec 32))) (Intermediate!9206 (undefined!10018 Bool) (index!39197 (_ BitVec 32)) (x!86122 (_ BitVec 32))) (Undefined!9206) (MissingVacant!9206 (index!39198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62444 (_ BitVec 32)) SeekEntryResult!9206)

(assert (=> b!989719 (= res!661866 (= (seekEntryOrOpen!0 (select (arr!30075 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9206 #b00000000000000000000000000000000)))))

(assert (=> b!989719 (=> (not res!661866) (not e!558063))))

(declare-fun b!989720 () Bool)

(assert (=> b!989720 (= e!558064 call!41936)))

(declare-fun bm!41933 () Bool)

(assert (=> bm!41933 (= call!41936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!117333 (not res!661867)) b!989717))

(assert (= (and b!989717 c!100331) b!989719))

(assert (= (and b!989717 (not c!100331)) b!989720))

(assert (= (and b!989719 res!661866) b!989718))

(assert (= (or b!989718 b!989720) bm!41933))

(assert (=> b!989717 m!916611))

(assert (=> b!989717 m!916611))

(assert (=> b!989717 m!916617))

(assert (=> b!989719 m!916611))

(declare-fun m!916619 () Bool)

(assert (=> b!989719 m!916619))

(declare-fun m!916621 () Bool)

(assert (=> b!989719 m!916621))

(assert (=> b!989719 m!916611))

(declare-fun m!916623 () Bool)

(assert (=> b!989719 m!916623))

(declare-fun m!916625 () Bool)

(assert (=> bm!41933 m!916625))

(assert (=> b!989586 d!117333))

(declare-fun d!117335 () Bool)

(assert (=> d!117335 (= (validKeyInArray!0 (select (arr!30075 _keys!1544) from!1932)) (and (not (= (select (arr!30075 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30075 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989591 d!117335))

(declare-fun condMapEmpty!36967 () Bool)

(declare-fun mapDefault!36967 () ValueCell!11156)

(assert (=> mapNonEmpty!36958 (= condMapEmpty!36967 (= mapRest!36958 ((as const (Array (_ BitVec 32) ValueCell!11156)) mapDefault!36967)))))

(declare-fun e!558071 () Bool)

(declare-fun mapRes!36967 () Bool)

(assert (=> mapNonEmpty!36958 (= tp!69969 (and e!558071 mapRes!36967))))

(declare-fun mapIsEmpty!36967 () Bool)

(assert (=> mapIsEmpty!36967 mapRes!36967))

(declare-fun b!989727 () Bool)

(declare-fun e!558070 () Bool)

(assert (=> b!989727 (= e!558070 tp_is_empty!23275)))

(declare-fun b!989728 () Bool)

(assert (=> b!989728 (= e!558071 tp_is_empty!23275)))

(declare-fun mapNonEmpty!36967 () Bool)

(declare-fun tp!69985 () Bool)

(assert (=> mapNonEmpty!36967 (= mapRes!36967 (and tp!69985 e!558070))))

(declare-fun mapKey!36967 () (_ BitVec 32))

(declare-fun mapRest!36967 () (Array (_ BitVec 32) ValueCell!11156))

(declare-fun mapValue!36967 () ValueCell!11156)

(assert (=> mapNonEmpty!36967 (= mapRest!36958 (store mapRest!36967 mapKey!36967 mapValue!36967))))

(assert (= (and mapNonEmpty!36958 condMapEmpty!36967) mapIsEmpty!36967))

(assert (= (and mapNonEmpty!36958 (not condMapEmpty!36967)) mapNonEmpty!36967))

(assert (= (and mapNonEmpty!36967 ((_ is ValueCellFull!11156) mapValue!36967)) b!989727))

(assert (= (and mapNonEmpty!36958 ((_ is ValueCellFull!11156) mapDefault!36967)) b!989728))

(declare-fun m!916627 () Bool)

(assert (=> mapNonEmpty!36967 m!916627))

(declare-fun b_lambda!15123 () Bool)

(assert (= b_lambda!15121 (or (and start!84616 b_free!20059) b_lambda!15123)))

(declare-fun b_lambda!15125 () Bool)

(assert (= b_lambda!15119 (or (and start!84616 b_free!20059) b_lambda!15125)))

(check-sat (not b_next!20059) (not b!989684) (not b!989705) b_and!32173 tp_is_empty!23275 (not b!989717) (not bm!41930) (not b!989689) (not bm!41927) (not b_lambda!15125) (not b!989681) (not d!117323) (not b!989682) (not b!989680) (not bm!41933) (not mapNonEmpty!36967) (not b!989708) (not b_lambda!15123) (not b!989706) (not b!989719) (not b!989688) (not b!989683) (not b!989690))
(check-sat b_and!32173 (not b_next!20059))
