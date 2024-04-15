; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84542 () Bool)

(assert start!84542)

(declare-fun b_free!20041 () Bool)

(declare-fun b_next!20041 () Bool)

(assert (=> start!84542 (= b_free!20041 (not b_next!20041))))

(declare-fun tp!69912 () Bool)

(declare-fun b_and!32125 () Bool)

(assert (=> start!84542 (= tp!69912 b_and!32125)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35993 0))(
  ( (V!35994 (val!11679 Int)) )
))
(declare-datatypes ((ValueCell!11147 0))(
  ( (ValueCellFull!11147 (v!14245 V!35993)) (EmptyCell!11147) )
))
(declare-datatypes ((array!62408 0))(
  ( (array!62409 (arr!30058 (Array (_ BitVec 32) ValueCell!11147)) (size!30539 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62408)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35993)

(declare-fun e!557549 () Bool)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14966 0))(
  ( (tuple2!14967 (_1!7494 (_ BitVec 64)) (_2!7494 V!35993)) )
))
(declare-fun lt!438464 () tuple2!14966)

(declare-datatypes ((array!62410 0))(
  ( (array!62411 (arr!30059 (Array (_ BitVec 32) (_ BitVec 64))) (size!30540 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62410)

(declare-fun minValue!1220 () V!35993)

(declare-fun b!988809 () Bool)

(declare-datatypes ((List!20850 0))(
  ( (Nil!20847) (Cons!20846 (h!22008 tuple2!14966) (t!29794 List!20850)) )
))
(declare-datatypes ((ListLongMap!13653 0))(
  ( (ListLongMap!13654 (toList!6842 List!20850)) )
))
(declare-fun getCurrentListMap!3819 (array!62410 array!62408 (_ BitVec 32) (_ BitVec 32) V!35993 V!35993 (_ BitVec 32) Int) ListLongMap!13653)

(declare-fun +!3111 (ListLongMap!13653 tuple2!14966) ListLongMap!13653)

(assert (=> b!988809 (= e!557549 (not (= (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3111 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438464))))))

(declare-fun lt!438460 () ListLongMap!13653)

(declare-fun lt!438462 () tuple2!14966)

(assert (=> b!988809 (= (+!3111 (+!3111 lt!438460 lt!438462) lt!438464) (+!3111 (+!3111 lt!438460 lt!438464) lt!438462))))

(declare-fun lt!438461 () V!35993)

(assert (=> b!988809 (= lt!438464 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))

(assert (=> b!988809 (= lt!438462 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32696 0))(
  ( (Unit!32697) )
))
(declare-fun lt!438463 () Unit!32696)

(declare-fun addCommutativeForDiffKeys!706 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64) V!35993) Unit!32696)

(assert (=> b!988809 (= lt!438463 (addCommutativeForDiffKeys!706 lt!438460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30059 _keys!1544) from!1932) lt!438461))))

(declare-fun mapNonEmpty!36927 () Bool)

(declare-fun mapRes!36927 () Bool)

(declare-fun tp!69911 () Bool)

(declare-fun e!557545 () Bool)

(assert (=> mapNonEmpty!36927 (= mapRes!36927 (and tp!69911 e!557545))))

(declare-fun mapKey!36927 () (_ BitVec 32))

(declare-fun mapValue!36927 () ValueCell!11147)

(declare-fun mapRest!36927 () (Array (_ BitVec 32) ValueCell!11147))

(assert (=> mapNonEmpty!36927 (= (arr!30058 _values!1278) (store mapRest!36927 mapKey!36927 mapValue!36927))))

(declare-fun b!988810 () Bool)

(declare-fun e!557548 () Bool)

(assert (=> b!988810 (= e!557548 e!557549)))

(declare-fun res!661388 () Bool)

(assert (=> b!988810 (=> (not res!661388) (not e!557549))))

(assert (=> b!988810 (= res!661388 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30059 _keys!1544) from!1932))))))

(declare-fun get!15613 (ValueCell!11147 V!35993) V!35993)

(declare-fun dynLambda!1856 (Int (_ BitVec 64)) V!35993)

(assert (=> b!988810 (= lt!438461 (get!15613 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3542 (array!62410 array!62408 (_ BitVec 32) (_ BitVec 32) V!35993 V!35993 (_ BitVec 32) Int) ListLongMap!13653)

(assert (=> b!988810 (= lt!438460 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988811 () Bool)

(declare-fun res!661393 () Bool)

(assert (=> b!988811 (=> (not res!661393) (not e!557548))))

(declare-datatypes ((List!20851 0))(
  ( (Nil!20848) (Cons!20847 (h!22009 (_ BitVec 64)) (t!29795 List!20851)) )
))
(declare-fun arrayNoDuplicates!0 (array!62410 (_ BitVec 32) List!20851) Bool)

(assert (=> b!988811 (= res!661393 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20848))))

(declare-fun mapIsEmpty!36927 () Bool)

(assert (=> mapIsEmpty!36927 mapRes!36927))

(declare-fun b!988812 () Bool)

(declare-fun res!661386 () Bool)

(assert (=> b!988812 (=> (not res!661386) (not e!557548))))

(assert (=> b!988812 (= res!661386 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988813 () Bool)

(declare-fun res!661387 () Bool)

(assert (=> b!988813 (=> (not res!661387) (not e!557548))))

(assert (=> b!988813 (= res!661387 (and (= (size!30539 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30540 _keys!1544) (size!30539 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988814 () Bool)

(declare-fun e!557547 () Bool)

(declare-fun tp_is_empty!23257 () Bool)

(assert (=> b!988814 (= e!557547 tp_is_empty!23257)))

(declare-fun b!988815 () Bool)

(declare-fun res!661391 () Bool)

(assert (=> b!988815 (=> (not res!661391) (not e!557548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988815 (= res!661391 (validKeyInArray!0 (select (arr!30059 _keys!1544) from!1932)))))

(declare-fun b!988816 () Bool)

(declare-fun e!557550 () Bool)

(assert (=> b!988816 (= e!557550 (and e!557547 mapRes!36927))))

(declare-fun condMapEmpty!36927 () Bool)

(declare-fun mapDefault!36927 () ValueCell!11147)

(assert (=> b!988816 (= condMapEmpty!36927 (= (arr!30058 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11147)) mapDefault!36927)))))

(declare-fun b!988817 () Bool)

(declare-fun res!661389 () Bool)

(assert (=> b!988817 (=> (not res!661389) (not e!557548))))

(assert (=> b!988817 (= res!661389 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30540 _keys!1544))))))

(declare-fun b!988818 () Bool)

(declare-fun res!661392 () Bool)

(assert (=> b!988818 (=> (not res!661392) (not e!557548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62410 (_ BitVec 32)) Bool)

(assert (=> b!988818 (= res!661392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988808 () Bool)

(assert (=> b!988808 (= e!557545 tp_is_empty!23257)))

(declare-fun res!661390 () Bool)

(assert (=> start!84542 (=> (not res!661390) (not e!557548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84542 (= res!661390 (validMask!0 mask!1948))))

(assert (=> start!84542 e!557548))

(assert (=> start!84542 true))

(assert (=> start!84542 tp_is_empty!23257))

(declare-fun array_inv!23229 (array!62408) Bool)

(assert (=> start!84542 (and (array_inv!23229 _values!1278) e!557550)))

(assert (=> start!84542 tp!69912))

(declare-fun array_inv!23230 (array!62410) Bool)

(assert (=> start!84542 (array_inv!23230 _keys!1544)))

(assert (= (and start!84542 res!661390) b!988813))

(assert (= (and b!988813 res!661387) b!988818))

(assert (= (and b!988818 res!661392) b!988811))

(assert (= (and b!988811 res!661393) b!988817))

(assert (= (and b!988817 res!661389) b!988815))

(assert (= (and b!988815 res!661391) b!988812))

(assert (= (and b!988812 res!661386) b!988810))

(assert (= (and b!988810 res!661388) b!988809))

(assert (= (and b!988816 condMapEmpty!36927) mapIsEmpty!36927))

(assert (= (and b!988816 (not condMapEmpty!36927)) mapNonEmpty!36927))

(get-info :version)

(assert (= (and mapNonEmpty!36927 ((_ is ValueCellFull!11147) mapValue!36927)) b!988808))

(assert (= (and b!988816 ((_ is ValueCellFull!11147) mapDefault!36927)) b!988814))

(assert (= start!84542 b!988816))

(declare-fun b_lambda!15079 () Bool)

(assert (=> (not b_lambda!15079) (not b!988810)))

(declare-fun t!29793 () Bool)

(declare-fun tb!6795 () Bool)

(assert (=> (and start!84542 (= defaultEntry!1281 defaultEntry!1281) t!29793) tb!6795))

(declare-fun result!13595 () Bool)

(assert (=> tb!6795 (= result!13595 tp_is_empty!23257)))

(assert (=> b!988810 t!29793))

(declare-fun b_and!32127 () Bool)

(assert (= b_and!32125 (and (=> t!29793 result!13595) b_and!32127)))

(declare-fun m!915401 () Bool)

(assert (=> b!988818 m!915401))

(declare-fun m!915403 () Bool)

(assert (=> b!988811 m!915403))

(declare-fun m!915405 () Bool)

(assert (=> start!84542 m!915405))

(declare-fun m!915407 () Bool)

(assert (=> start!84542 m!915407))

(declare-fun m!915409 () Bool)

(assert (=> start!84542 m!915409))

(declare-fun m!915411 () Bool)

(assert (=> b!988809 m!915411))

(declare-fun m!915413 () Bool)

(assert (=> b!988809 m!915413))

(declare-fun m!915415 () Bool)

(assert (=> b!988809 m!915415))

(declare-fun m!915417 () Bool)

(assert (=> b!988809 m!915417))

(declare-fun m!915419 () Bool)

(assert (=> b!988809 m!915419))

(assert (=> b!988809 m!915419))

(declare-fun m!915421 () Bool)

(assert (=> b!988809 m!915421))

(assert (=> b!988809 m!915411))

(assert (=> b!988809 m!915417))

(declare-fun m!915423 () Bool)

(assert (=> b!988809 m!915423))

(assert (=> b!988809 m!915415))

(declare-fun m!915425 () Bool)

(assert (=> b!988809 m!915425))

(declare-fun m!915427 () Bool)

(assert (=> b!988809 m!915427))

(assert (=> b!988815 m!915415))

(assert (=> b!988815 m!915415))

(declare-fun m!915429 () Bool)

(assert (=> b!988815 m!915429))

(declare-fun m!915431 () Bool)

(assert (=> mapNonEmpty!36927 m!915431))

(assert (=> b!988810 m!915415))

(declare-fun m!915433 () Bool)

(assert (=> b!988810 m!915433))

(declare-fun m!915435 () Bool)

(assert (=> b!988810 m!915435))

(declare-fun m!915437 () Bool)

(assert (=> b!988810 m!915437))

(assert (=> b!988810 m!915433))

(assert (=> b!988810 m!915437))

(declare-fun m!915439 () Bool)

(assert (=> b!988810 m!915439))

(check-sat tp_is_empty!23257 (not b!988811) (not start!84542) (not b!988815) (not b_lambda!15079) (not b!988810) (not b!988809) (not mapNonEmpty!36927) b_and!32127 (not b_next!20041) (not b!988818))
(check-sat b_and!32127 (not b_next!20041))
(get-model)

(declare-fun b_lambda!15085 () Bool)

(assert (= b_lambda!15079 (or (and start!84542 b_free!20041) b_lambda!15085)))

(check-sat tp_is_empty!23257 (not b!988811) (not start!84542) (not b!988815) (not b!988810) (not b!988809) (not mapNonEmpty!36927) b_and!32127 (not b_next!20041) (not b!988818) (not b_lambda!15085))
(check-sat b_and!32127 (not b_next!20041))
(get-model)

(declare-fun d!117079 () Bool)

(assert (=> d!117079 (= (validKeyInArray!0 (select (arr!30059 _keys!1544) from!1932)) (and (not (= (select (arr!30059 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30059 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988815 d!117079))

(declare-fun d!117081 () Bool)

(declare-fun c!100180 () Bool)

(assert (=> d!117081 (= c!100180 ((_ is ValueCellFull!11147) (select (arr!30058 _values!1278) from!1932)))))

(declare-fun e!557589 () V!35993)

(assert (=> d!117081 (= (get!15613 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557589)))

(declare-fun b!988895 () Bool)

(declare-fun get!15615 (ValueCell!11147 V!35993) V!35993)

(assert (=> b!988895 (= e!557589 (get!15615 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988896 () Bool)

(declare-fun get!15616 (ValueCell!11147 V!35993) V!35993)

(assert (=> b!988896 (= e!557589 (get!15616 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117081 c!100180) b!988895))

(assert (= (and d!117081 (not c!100180)) b!988896))

(assert (=> b!988895 m!915433))

(assert (=> b!988895 m!915437))

(declare-fun m!915521 () Bool)

(assert (=> b!988895 m!915521))

(assert (=> b!988896 m!915433))

(assert (=> b!988896 m!915437))

(declare-fun m!915523 () Bool)

(assert (=> b!988896 m!915523))

(assert (=> b!988810 d!117081))

(declare-fun b!988921 () Bool)

(declare-fun e!557609 () Bool)

(declare-fun e!557606 () Bool)

(assert (=> b!988921 (= e!557609 e!557606)))

(declare-fun c!100192 () Bool)

(assert (=> b!988921 (= c!100192 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(declare-fun b!988922 () Bool)

(declare-fun lt!438512 () ListLongMap!13653)

(assert (=> b!988922 (= e!557606 (= lt!438512 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!988923 () Bool)

(declare-fun e!557610 () Bool)

(assert (=> b!988923 (= e!557609 e!557610)))

(assert (=> b!988923 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(declare-fun res!661452 () Bool)

(declare-fun contains!5690 (ListLongMap!13653 (_ BitVec 64)) Bool)

(assert (=> b!988923 (= res!661452 (contains!5690 lt!438512 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988923 (=> (not res!661452) (not e!557610))))

(declare-fun d!117083 () Bool)

(declare-fun e!557608 () Bool)

(assert (=> d!117083 e!557608))

(declare-fun res!661453 () Bool)

(assert (=> d!117083 (=> (not res!661453) (not e!557608))))

(assert (=> d!117083 (= res!661453 (not (contains!5690 lt!438512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557604 () ListLongMap!13653)

(assert (=> d!117083 (= lt!438512 e!557604)))

(declare-fun c!100190 () Bool)

(assert (=> d!117083 (= c!100190 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(assert (=> d!117083 (validMask!0 mask!1948)))

(assert (=> d!117083 (= (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438512)))

(declare-fun b!988924 () Bool)

(declare-fun res!661450 () Bool)

(assert (=> b!988924 (=> (not res!661450) (not e!557608))))

(assert (=> b!988924 (= res!661450 (not (contains!5690 lt!438512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!41868 () ListLongMap!13653)

(declare-fun bm!41865 () Bool)

(assert (=> bm!41865 (= call!41868 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988925 () Bool)

(assert (=> b!988925 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(assert (=> b!988925 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30539 _values!1278)))))

(declare-fun apply!888 (ListLongMap!13653 (_ BitVec 64)) V!35993)

(assert (=> b!988925 (= e!557610 (= (apply!888 lt!438512 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!988926 () Bool)

(declare-fun lt!438513 () Unit!32696)

(declare-fun lt!438511 () Unit!32696)

(assert (=> b!988926 (= lt!438513 lt!438511)))

(declare-fun lt!438515 () V!35993)

(declare-fun lt!438514 () (_ BitVec 64))

(declare-fun lt!438509 () ListLongMap!13653)

(declare-fun lt!438510 () (_ BitVec 64))

(assert (=> b!988926 (not (contains!5690 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515)) lt!438510))))

(declare-fun addStillNotContains!235 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32696)

(assert (=> b!988926 (= lt!438511 (addStillNotContains!235 lt!438509 lt!438514 lt!438515 lt!438510))))

(assert (=> b!988926 (= lt!438510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988926 (= lt!438515 (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988926 (= lt!438514 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988926 (= lt!438509 call!41868)))

(declare-fun e!557605 () ListLongMap!13653)

(assert (=> b!988926 (= e!557605 (+!3111 call!41868 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988927 () Bool)

(assert (=> b!988927 (= e!557608 e!557609)))

(declare-fun c!100191 () Bool)

(declare-fun e!557607 () Bool)

(assert (=> b!988927 (= c!100191 e!557607)))

(declare-fun res!661451 () Bool)

(assert (=> b!988927 (=> (not res!661451) (not e!557607))))

(assert (=> b!988927 (= res!661451 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(declare-fun b!988928 () Bool)

(assert (=> b!988928 (= e!557604 (ListLongMap!13654 Nil!20847))))

(declare-fun b!988929 () Bool)

(assert (=> b!988929 (= e!557607 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988929 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!988930 () Bool)

(assert (=> b!988930 (= e!557604 e!557605)))

(declare-fun c!100189 () Bool)

(assert (=> b!988930 (= c!100189 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988931 () Bool)

(declare-fun isEmpty!728 (ListLongMap!13653) Bool)

(assert (=> b!988931 (= e!557606 (isEmpty!728 lt!438512))))

(declare-fun b!988932 () Bool)

(assert (=> b!988932 (= e!557605 call!41868)))

(assert (= (and d!117083 c!100190) b!988928))

(assert (= (and d!117083 (not c!100190)) b!988930))

(assert (= (and b!988930 c!100189) b!988926))

(assert (= (and b!988930 (not c!100189)) b!988932))

(assert (= (or b!988926 b!988932) bm!41865))

(assert (= (and d!117083 res!661453) b!988924))

(assert (= (and b!988924 res!661450) b!988927))

(assert (= (and b!988927 res!661451) b!988929))

(assert (= (and b!988927 c!100191) b!988923))

(assert (= (and b!988927 (not c!100191)) b!988921))

(assert (= (and b!988923 res!661452) b!988925))

(assert (= (and b!988921 c!100192) b!988922))

(assert (= (and b!988921 (not c!100192)) b!988931))

(declare-fun b_lambda!15087 () Bool)

(assert (=> (not b_lambda!15087) (not b!988925)))

(assert (=> b!988925 t!29793))

(declare-fun b_and!32137 () Bool)

(assert (= b_and!32127 (and (=> t!29793 result!13595) b_and!32137)))

(declare-fun b_lambda!15089 () Bool)

(assert (=> (not b_lambda!15089) (not b!988926)))

(assert (=> b!988926 t!29793))

(declare-fun b_and!32139 () Bool)

(assert (= b_and!32137 (and (=> t!29793 result!13595) b_and!32139)))

(declare-fun m!915525 () Bool)

(assert (=> b!988925 m!915525))

(declare-fun m!915527 () Bool)

(assert (=> b!988925 m!915527))

(assert (=> b!988925 m!915525))

(assert (=> b!988925 m!915437))

(declare-fun m!915529 () Bool)

(assert (=> b!988925 m!915529))

(assert (=> b!988925 m!915437))

(declare-fun m!915531 () Bool)

(assert (=> b!988925 m!915531))

(assert (=> b!988925 m!915529))

(assert (=> b!988930 m!915525))

(assert (=> b!988930 m!915525))

(declare-fun m!915533 () Bool)

(assert (=> b!988930 m!915533))

(assert (=> b!988929 m!915525))

(assert (=> b!988929 m!915525))

(assert (=> b!988929 m!915533))

(declare-fun m!915535 () Bool)

(assert (=> d!117083 m!915535))

(assert (=> d!117083 m!915405))

(declare-fun m!915537 () Bool)

(assert (=> bm!41865 m!915537))

(assert (=> b!988922 m!915537))

(assert (=> b!988926 m!915525))

(declare-fun m!915539 () Bool)

(assert (=> b!988926 m!915539))

(assert (=> b!988926 m!915529))

(assert (=> b!988926 m!915437))

(assert (=> b!988926 m!915531))

(declare-fun m!915541 () Bool)

(assert (=> b!988926 m!915541))

(assert (=> b!988926 m!915529))

(declare-fun m!915543 () Bool)

(assert (=> b!988926 m!915543))

(assert (=> b!988926 m!915437))

(assert (=> b!988926 m!915541))

(declare-fun m!915545 () Bool)

(assert (=> b!988926 m!915545))

(declare-fun m!915547 () Bool)

(assert (=> b!988931 m!915547))

(declare-fun m!915549 () Bool)

(assert (=> b!988924 m!915549))

(assert (=> b!988923 m!915525))

(assert (=> b!988923 m!915525))

(declare-fun m!915551 () Bool)

(assert (=> b!988923 m!915551))

(assert (=> b!988810 d!117083))

(declare-fun b!988943 () Bool)

(declare-fun e!557622 () Bool)

(declare-fun e!557619 () Bool)

(assert (=> b!988943 (= e!557622 e!557619)))

(declare-fun c!100195 () Bool)

(assert (=> b!988943 (= c!100195 (validKeyInArray!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117085 () Bool)

(declare-fun res!661460 () Bool)

(declare-fun e!557621 () Bool)

(assert (=> d!117085 (=> res!661460 e!557621)))

(assert (=> d!117085 (= res!661460 (bvsge #b00000000000000000000000000000000 (size!30540 _keys!1544)))))

(assert (=> d!117085 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20848) e!557621)))

(declare-fun b!988944 () Bool)

(declare-fun call!41871 () Bool)

(assert (=> b!988944 (= e!557619 call!41871)))

(declare-fun b!988945 () Bool)

(assert (=> b!988945 (= e!557621 e!557622)))

(declare-fun res!661462 () Bool)

(assert (=> b!988945 (=> (not res!661462) (not e!557622))))

(declare-fun e!557620 () Bool)

(assert (=> b!988945 (= res!661462 (not e!557620))))

(declare-fun res!661461 () Bool)

(assert (=> b!988945 (=> (not res!661461) (not e!557620))))

(assert (=> b!988945 (= res!661461 (validKeyInArray!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988946 () Bool)

(assert (=> b!988946 (= e!557619 call!41871)))

(declare-fun bm!41868 () Bool)

(assert (=> bm!41868 (= call!41871 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100195 (Cons!20847 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) Nil!20848) Nil!20848)))))

(declare-fun b!988947 () Bool)

(declare-fun contains!5691 (List!20851 (_ BitVec 64)) Bool)

(assert (=> b!988947 (= e!557620 (contains!5691 Nil!20848 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117085 (not res!661460)) b!988945))

(assert (= (and b!988945 res!661461) b!988947))

(assert (= (and b!988945 res!661462) b!988943))

(assert (= (and b!988943 c!100195) b!988946))

(assert (= (and b!988943 (not c!100195)) b!988944))

(assert (= (or b!988946 b!988944) bm!41868))

(declare-fun m!915553 () Bool)

(assert (=> b!988943 m!915553))

(assert (=> b!988943 m!915553))

(declare-fun m!915555 () Bool)

(assert (=> b!988943 m!915555))

(assert (=> b!988945 m!915553))

(assert (=> b!988945 m!915553))

(assert (=> b!988945 m!915555))

(assert (=> bm!41868 m!915553))

(declare-fun m!915557 () Bool)

(assert (=> bm!41868 m!915557))

(assert (=> b!988947 m!915553))

(assert (=> b!988947 m!915553))

(declare-fun m!915559 () Bool)

(assert (=> b!988947 m!915559))

(assert (=> b!988811 d!117085))

(declare-fun d!117087 () Bool)

(declare-fun e!557625 () Bool)

(assert (=> d!117087 e!557625))

(declare-fun res!661467 () Bool)

(assert (=> d!117087 (=> (not res!661467) (not e!557625))))

(declare-fun lt!438524 () ListLongMap!13653)

(assert (=> d!117087 (= res!661467 (contains!5690 lt!438524 (_1!7494 lt!438464)))))

(declare-fun lt!438527 () List!20850)

(assert (=> d!117087 (= lt!438524 (ListLongMap!13654 lt!438527))))

(declare-fun lt!438526 () Unit!32696)

(declare-fun lt!438525 () Unit!32696)

(assert (=> d!117087 (= lt!438526 lt!438525)))

(declare-datatypes ((Option!522 0))(
  ( (Some!521 (v!14248 V!35993)) (None!520) )
))
(declare-fun getValueByKey!516 (List!20850 (_ BitVec 64)) Option!522)

(assert (=> d!117087 (= (getValueByKey!516 lt!438527 (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464)))))

(declare-fun lemmaContainsTupThenGetReturnValue!273 (List!20850 (_ BitVec 64) V!35993) Unit!32696)

(assert (=> d!117087 (= lt!438525 (lemmaContainsTupThenGetReturnValue!273 lt!438527 (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun insertStrictlySorted!330 (List!20850 (_ BitVec 64) V!35993) List!20850)

(assert (=> d!117087 (= lt!438527 (insertStrictlySorted!330 (toList!6842 lt!438460) (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(assert (=> d!117087 (= (+!3111 lt!438460 lt!438464) lt!438524)))

(declare-fun b!988952 () Bool)

(declare-fun res!661468 () Bool)

(assert (=> b!988952 (=> (not res!661468) (not e!557625))))

(assert (=> b!988952 (= res!661468 (= (getValueByKey!516 (toList!6842 lt!438524) (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464))))))

(declare-fun b!988953 () Bool)

(declare-fun contains!5692 (List!20850 tuple2!14966) Bool)

(assert (=> b!988953 (= e!557625 (contains!5692 (toList!6842 lt!438524) lt!438464))))

(assert (= (and d!117087 res!661467) b!988952))

(assert (= (and b!988952 res!661468) b!988953))

(declare-fun m!915561 () Bool)

(assert (=> d!117087 m!915561))

(declare-fun m!915563 () Bool)

(assert (=> d!117087 m!915563))

(declare-fun m!915565 () Bool)

(assert (=> d!117087 m!915565))

(declare-fun m!915567 () Bool)

(assert (=> d!117087 m!915567))

(declare-fun m!915569 () Bool)

(assert (=> b!988952 m!915569))

(declare-fun m!915571 () Bool)

(assert (=> b!988953 m!915571))

(assert (=> b!988809 d!117087))

(declare-fun d!117089 () Bool)

(declare-fun e!557626 () Bool)

(assert (=> d!117089 e!557626))

(declare-fun res!661469 () Bool)

(assert (=> d!117089 (=> (not res!661469) (not e!557626))))

(declare-fun lt!438528 () ListLongMap!13653)

(assert (=> d!117089 (= res!661469 (contains!5690 lt!438528 (_1!7494 lt!438462)))))

(declare-fun lt!438531 () List!20850)

(assert (=> d!117089 (= lt!438528 (ListLongMap!13654 lt!438531))))

(declare-fun lt!438530 () Unit!32696)

(declare-fun lt!438529 () Unit!32696)

(assert (=> d!117089 (= lt!438530 lt!438529)))

(assert (=> d!117089 (= (getValueByKey!516 lt!438531 (_1!7494 lt!438462)) (Some!521 (_2!7494 lt!438462)))))

(assert (=> d!117089 (= lt!438529 (lemmaContainsTupThenGetReturnValue!273 lt!438531 (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(assert (=> d!117089 (= lt!438531 (insertStrictlySorted!330 (toList!6842 lt!438460) (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(assert (=> d!117089 (= (+!3111 lt!438460 lt!438462) lt!438528)))

(declare-fun b!988954 () Bool)

(declare-fun res!661470 () Bool)

(assert (=> b!988954 (=> (not res!661470) (not e!557626))))

(assert (=> b!988954 (= res!661470 (= (getValueByKey!516 (toList!6842 lt!438528) (_1!7494 lt!438462)) (Some!521 (_2!7494 lt!438462))))))

(declare-fun b!988955 () Bool)

(assert (=> b!988955 (= e!557626 (contains!5692 (toList!6842 lt!438528) lt!438462))))

(assert (= (and d!117089 res!661469) b!988954))

(assert (= (and b!988954 res!661470) b!988955))

(declare-fun m!915573 () Bool)

(assert (=> d!117089 m!915573))

(declare-fun m!915575 () Bool)

(assert (=> d!117089 m!915575))

(declare-fun m!915577 () Bool)

(assert (=> d!117089 m!915577))

(declare-fun m!915579 () Bool)

(assert (=> d!117089 m!915579))

(declare-fun m!915581 () Bool)

(assert (=> b!988954 m!915581))

(declare-fun m!915583 () Bool)

(assert (=> b!988955 m!915583))

(assert (=> b!988809 d!117089))

(declare-fun d!117091 () Bool)

(assert (=> d!117091 (= (+!3111 (+!3111 lt!438460 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (+!3111 (+!3111 lt!438460 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun lt!438534 () Unit!32696)

(declare-fun choose!1619 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64) V!35993) Unit!32696)

(assert (=> d!117091 (= lt!438534 (choose!1619 lt!438460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30059 _keys!1544) from!1932) lt!438461))))

(assert (=> d!117091 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30059 _keys!1544) from!1932)))))

(assert (=> d!117091 (= (addCommutativeForDiffKeys!706 lt!438460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30059 _keys!1544) from!1932) lt!438461) lt!438534)))

(declare-fun bs!28043 () Bool)

(assert (= bs!28043 d!117091))

(declare-fun m!915585 () Bool)

(assert (=> bs!28043 m!915585))

(assert (=> bs!28043 m!915415))

(declare-fun m!915587 () Bool)

(assert (=> bs!28043 m!915587))

(declare-fun m!915589 () Bool)

(assert (=> bs!28043 m!915589))

(assert (=> bs!28043 m!915585))

(declare-fun m!915591 () Bool)

(assert (=> bs!28043 m!915591))

(assert (=> bs!28043 m!915589))

(declare-fun m!915593 () Bool)

(assert (=> bs!28043 m!915593))

(assert (=> b!988809 d!117091))

(declare-fun b!988998 () Bool)

(declare-fun e!557658 () ListLongMap!13653)

(declare-fun e!557659 () ListLongMap!13653)

(assert (=> b!988998 (= e!557658 e!557659)))

(declare-fun c!100212 () Bool)

(assert (=> b!988998 (= c!100212 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41883 () Bool)

(declare-fun call!41889 () Bool)

(declare-fun lt!438580 () ListLongMap!13653)

(assert (=> bm!41883 (= call!41889 (contains!5690 lt!438580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988999 () Bool)

(declare-fun e!557661 () Bool)

(declare-fun e!557664 () Bool)

(assert (=> b!988999 (= e!557661 e!557664)))

(declare-fun res!661492 () Bool)

(assert (=> b!988999 (= res!661492 call!41889)))

(assert (=> b!988999 (=> (not res!661492) (not e!557664))))

(declare-fun b!989000 () Bool)

(declare-fun e!557662 () Bool)

(assert (=> b!989000 (= e!557662 (= (apply!888 lt!438580 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!989001 () Bool)

(declare-fun e!557653 () ListLongMap!13653)

(declare-fun call!41887 () ListLongMap!13653)

(assert (=> b!989001 (= e!557653 call!41887)))

(declare-fun c!100211 () Bool)

(declare-fun bm!41884 () Bool)

(declare-fun call!41891 () ListLongMap!13653)

(declare-fun call!41890 () ListLongMap!13653)

(declare-fun call!41892 () ListLongMap!13653)

(assert (=> bm!41884 (= call!41891 (+!3111 (ite c!100211 call!41890 (ite c!100212 call!41892 call!41887)) (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41885 () Bool)

(declare-fun call!41888 () Bool)

(assert (=> bm!41885 (= call!41888 (contains!5690 lt!438580 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989002 () Bool)

(declare-fun e!557665 () Bool)

(assert (=> b!989002 (= e!557665 (= (apply!888 lt!438580 (select (arr!30059 _keys!1544) from!1932)) (get!15613 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989002 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30539 _values!1278)))))

(assert (=> b!989002 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30540 _keys!1544)))))

(declare-fun b!989003 () Bool)

(declare-fun res!661490 () Bool)

(declare-fun e!557656 () Bool)

(assert (=> b!989003 (=> (not res!661490) (not e!557656))))

(assert (=> b!989003 (= res!661490 e!557661)))

(declare-fun c!100213 () Bool)

(assert (=> b!989003 (= c!100213 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!989004 () Bool)

(declare-fun e!557654 () Unit!32696)

(declare-fun Unit!32700 () Unit!32696)

(assert (=> b!989004 (= e!557654 Unit!32700)))

(declare-fun b!989005 () Bool)

(declare-fun call!41886 () ListLongMap!13653)

(assert (=> b!989005 (= e!557653 call!41886)))

(declare-fun b!989006 () Bool)

(declare-fun c!100209 () Bool)

(assert (=> b!989006 (= c!100209 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!989006 (= e!557659 e!557653)))

(declare-fun b!989007 () Bool)

(declare-fun e!557657 () Bool)

(assert (=> b!989007 (= e!557656 e!557657)))

(declare-fun c!100210 () Bool)

(assert (=> b!989007 (= c!100210 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!989008 () Bool)

(declare-fun e!557663 () Bool)

(assert (=> b!989008 (= e!557663 (validKeyInArray!0 (select (arr!30059 _keys!1544) from!1932)))))

(declare-fun b!989009 () Bool)

(assert (=> b!989009 (= e!557658 (+!3111 call!41891 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!989010 () Bool)

(assert (=> b!989010 (= e!557661 (not call!41889))))

(declare-fun b!989011 () Bool)

(assert (=> b!989011 (= e!557659 call!41886)))

(declare-fun bm!41887 () Bool)

(assert (=> bm!41887 (= call!41886 call!41891)))

(declare-fun b!989012 () Bool)

(declare-fun res!661494 () Bool)

(assert (=> b!989012 (=> (not res!661494) (not e!557656))))

(declare-fun e!557655 () Bool)

(assert (=> b!989012 (= res!661494 e!557655)))

(declare-fun res!661489 () Bool)

(assert (=> b!989012 (=> res!661489 e!557655)))

(assert (=> b!989012 (= res!661489 (not e!557663))))

(declare-fun res!661497 () Bool)

(assert (=> b!989012 (=> (not res!661497) (not e!557663))))

(assert (=> b!989012 (= res!661497 (bvslt from!1932 (size!30540 _keys!1544)))))

(declare-fun b!989013 () Bool)

(assert (=> b!989013 (= e!557657 (not call!41888))))

(declare-fun b!989014 () Bool)

(declare-fun lt!438591 () Unit!32696)

(assert (=> b!989014 (= e!557654 lt!438591)))

(declare-fun lt!438593 () ListLongMap!13653)

(assert (=> b!989014 (= lt!438593 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438600 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438586 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438586 (select (arr!30059 _keys!1544) from!1932))))

(declare-fun lt!438589 () Unit!32696)

(declare-fun addStillContains!608 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32696)

(assert (=> b!989014 (= lt!438589 (addStillContains!608 lt!438593 lt!438600 zeroValue!1220 lt!438586))))

(assert (=> b!989014 (contains!5690 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220)) lt!438586)))

(declare-fun lt!438599 () Unit!32696)

(assert (=> b!989014 (= lt!438599 lt!438589)))

(declare-fun lt!438594 () ListLongMap!13653)

(assert (=> b!989014 (= lt!438594 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438581 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438581 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438579 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438579 (select (arr!30059 _keys!1544) from!1932))))

(declare-fun lt!438587 () Unit!32696)

(declare-fun addApplyDifferent!464 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32696)

(assert (=> b!989014 (= lt!438587 (addApplyDifferent!464 lt!438594 lt!438581 minValue!1220 lt!438579))))

(assert (=> b!989014 (= (apply!888 (+!3111 lt!438594 (tuple2!14967 lt!438581 minValue!1220)) lt!438579) (apply!888 lt!438594 lt!438579))))

(declare-fun lt!438588 () Unit!32696)

(assert (=> b!989014 (= lt!438588 lt!438587)))

(declare-fun lt!438584 () ListLongMap!13653)

(assert (=> b!989014 (= lt!438584 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438583 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438590 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438590 (select (arr!30059 _keys!1544) from!1932))))

(declare-fun lt!438582 () Unit!32696)

(assert (=> b!989014 (= lt!438582 (addApplyDifferent!464 lt!438584 lt!438583 zeroValue!1220 lt!438590))))

(assert (=> b!989014 (= (apply!888 (+!3111 lt!438584 (tuple2!14967 lt!438583 zeroValue!1220)) lt!438590) (apply!888 lt!438584 lt!438590))))

(declare-fun lt!438596 () Unit!32696)

(assert (=> b!989014 (= lt!438596 lt!438582)))

(declare-fun lt!438595 () ListLongMap!13653)

(assert (=> b!989014 (= lt!438595 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438592 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438592 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438598 () (_ BitVec 64))

(assert (=> b!989014 (= lt!438598 (select (arr!30059 _keys!1544) from!1932))))

(assert (=> b!989014 (= lt!438591 (addApplyDifferent!464 lt!438595 lt!438592 minValue!1220 lt!438598))))

(assert (=> b!989014 (= (apply!888 (+!3111 lt!438595 (tuple2!14967 lt!438592 minValue!1220)) lt!438598) (apply!888 lt!438595 lt!438598))))

(declare-fun b!989015 () Bool)

(assert (=> b!989015 (= e!557657 e!557662)))

(declare-fun res!661495 () Bool)

(assert (=> b!989015 (= res!661495 call!41888)))

(assert (=> b!989015 (=> (not res!661495) (not e!557662))))

(declare-fun b!989016 () Bool)

(declare-fun e!557660 () Bool)

(assert (=> b!989016 (= e!557660 (validKeyInArray!0 (select (arr!30059 _keys!1544) from!1932)))))

(declare-fun bm!41888 () Bool)

(assert (=> bm!41888 (= call!41892 call!41890)))

(declare-fun b!989017 () Bool)

(assert (=> b!989017 (= e!557655 e!557665)))

(declare-fun res!661496 () Bool)

(assert (=> b!989017 (=> (not res!661496) (not e!557665))))

(assert (=> b!989017 (= res!661496 (contains!5690 lt!438580 (select (arr!30059 _keys!1544) from!1932)))))

(assert (=> b!989017 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30540 _keys!1544)))))

(declare-fun d!117093 () Bool)

(assert (=> d!117093 e!557656))

(declare-fun res!661493 () Bool)

(assert (=> d!117093 (=> (not res!661493) (not e!557656))))

(assert (=> d!117093 (= res!661493 (or (bvsge from!1932 (size!30540 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30540 _keys!1544)))))))

(declare-fun lt!438597 () ListLongMap!13653)

(assert (=> d!117093 (= lt!438580 lt!438597)))

(declare-fun lt!438585 () Unit!32696)

(assert (=> d!117093 (= lt!438585 e!557654)))

(declare-fun c!100208 () Bool)

(assert (=> d!117093 (= c!100208 e!557660)))

(declare-fun res!661491 () Bool)

(assert (=> d!117093 (=> (not res!661491) (not e!557660))))

(assert (=> d!117093 (= res!661491 (bvslt from!1932 (size!30540 _keys!1544)))))

(assert (=> d!117093 (= lt!438597 e!557658)))

(assert (=> d!117093 (= c!100211 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117093 (validMask!0 mask!1948)))

(assert (=> d!117093 (= (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438580)))

(declare-fun bm!41886 () Bool)

(assert (=> bm!41886 (= call!41887 call!41892)))

(declare-fun b!989018 () Bool)

(assert (=> b!989018 (= e!557664 (= (apply!888 lt!438580 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun bm!41889 () Bool)

(assert (=> bm!41889 (= call!41890 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(assert (= (and d!117093 c!100211) b!989009))

(assert (= (and d!117093 (not c!100211)) b!988998))

(assert (= (and b!988998 c!100212) b!989011))

(assert (= (and b!988998 (not c!100212)) b!989006))

(assert (= (and b!989006 c!100209) b!989005))

(assert (= (and b!989006 (not c!100209)) b!989001))

(assert (= (or b!989005 b!989001) bm!41886))

(assert (= (or b!989011 bm!41886) bm!41888))

(assert (= (or b!989011 b!989005) bm!41887))

(assert (= (or b!989009 bm!41888) bm!41889))

(assert (= (or b!989009 bm!41887) bm!41884))

(assert (= (and d!117093 res!661491) b!989016))

(assert (= (and d!117093 c!100208) b!989014))

(assert (= (and d!117093 (not c!100208)) b!989004))

(assert (= (and d!117093 res!661493) b!989012))

(assert (= (and b!989012 res!661497) b!989008))

(assert (= (and b!989012 (not res!661489)) b!989017))

(assert (= (and b!989017 res!661496) b!989002))

(assert (= (and b!989012 res!661494) b!989003))

(assert (= (and b!989003 c!100213) b!988999))

(assert (= (and b!989003 (not c!100213)) b!989010))

(assert (= (and b!988999 res!661492) b!989018))

(assert (= (or b!988999 b!989010) bm!41883))

(assert (= (and b!989003 res!661490) b!989007))

(assert (= (and b!989007 c!100210) b!989015))

(assert (= (and b!989007 (not c!100210)) b!989013))

(assert (= (and b!989015 res!661495) b!989000))

(assert (= (or b!989015 b!989013) bm!41885))

(declare-fun b_lambda!15091 () Bool)

(assert (=> (not b_lambda!15091) (not b!989002)))

(assert (=> b!989002 t!29793))

(declare-fun b_and!32141 () Bool)

(assert (= b_and!32139 (and (=> t!29793 result!13595) b_and!32141)))

(declare-fun m!915595 () Bool)

(assert (=> bm!41883 m!915595))

(declare-fun m!915597 () Bool)

(assert (=> bm!41885 m!915597))

(declare-fun m!915599 () Bool)

(assert (=> b!989009 m!915599))

(declare-fun m!915601 () Bool)

(assert (=> b!989018 m!915601))

(declare-fun m!915603 () Bool)

(assert (=> b!989000 m!915603))

(assert (=> b!989017 m!915415))

(assert (=> b!989017 m!915415))

(declare-fun m!915605 () Bool)

(assert (=> b!989017 m!915605))

(assert (=> b!989002 m!915437))

(assert (=> b!989002 m!915433))

(assert (=> b!989002 m!915437))

(assert (=> b!989002 m!915439))

(assert (=> b!989002 m!915415))

(declare-fun m!915607 () Bool)

(assert (=> b!989002 m!915607))

(assert (=> b!989002 m!915433))

(assert (=> b!989002 m!915415))

(assert (=> d!117093 m!915405))

(declare-fun m!915609 () Bool)

(assert (=> b!989014 m!915609))

(declare-fun m!915611 () Bool)

(assert (=> b!989014 m!915611))

(declare-fun m!915613 () Bool)

(assert (=> b!989014 m!915613))

(declare-fun m!915615 () Bool)

(assert (=> b!989014 m!915615))

(assert (=> b!989014 m!915415))

(declare-fun m!915617 () Bool)

(assert (=> b!989014 m!915617))

(assert (=> b!989014 m!915609))

(declare-fun m!915619 () Bool)

(assert (=> b!989014 m!915619))

(declare-fun m!915621 () Bool)

(assert (=> b!989014 m!915621))

(declare-fun m!915623 () Bool)

(assert (=> b!989014 m!915623))

(declare-fun m!915625 () Bool)

(assert (=> b!989014 m!915625))

(assert (=> b!989014 m!915625))

(declare-fun m!915627 () Bool)

(assert (=> b!989014 m!915627))

(assert (=> b!989014 m!915613))

(declare-fun m!915629 () Bool)

(assert (=> b!989014 m!915629))

(declare-fun m!915631 () Bool)

(assert (=> b!989014 m!915631))

(assert (=> b!989014 m!915611))

(declare-fun m!915633 () Bool)

(assert (=> b!989014 m!915633))

(declare-fun m!915635 () Bool)

(assert (=> b!989014 m!915635))

(declare-fun m!915637 () Bool)

(assert (=> b!989014 m!915637))

(declare-fun m!915639 () Bool)

(assert (=> b!989014 m!915639))

(declare-fun m!915641 () Bool)

(assert (=> bm!41884 m!915641))

(assert (=> b!989008 m!915415))

(assert (=> b!989008 m!915415))

(assert (=> b!989008 m!915429))

(assert (=> bm!41889 m!915631))

(assert (=> b!989016 m!915415))

(assert (=> b!989016 m!915415))

(assert (=> b!989016 m!915429))

(assert (=> b!988809 d!117093))

(declare-fun b!989019 () Bool)

(declare-fun e!557671 () ListLongMap!13653)

(declare-fun e!557672 () ListLongMap!13653)

(assert (=> b!989019 (= e!557671 e!557672)))

(declare-fun c!100218 () Bool)

(assert (=> b!989019 (= c!100218 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41890 () Bool)

(declare-fun call!41896 () Bool)

(declare-fun lt!438602 () ListLongMap!13653)

(assert (=> bm!41890 (= call!41896 (contains!5690 lt!438602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989020 () Bool)

(declare-fun e!557674 () Bool)

(declare-fun e!557677 () Bool)

(assert (=> b!989020 (= e!557674 e!557677)))

(declare-fun res!661501 () Bool)

(assert (=> b!989020 (= res!661501 call!41896)))

(assert (=> b!989020 (=> (not res!661501) (not e!557677))))

(declare-fun b!989021 () Bool)

(declare-fun e!557675 () Bool)

(assert (=> b!989021 (= e!557675 (= (apply!888 lt!438602 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!989022 () Bool)

(declare-fun e!557666 () ListLongMap!13653)

(declare-fun call!41894 () ListLongMap!13653)

(assert (=> b!989022 (= e!557666 call!41894)))

(declare-fun bm!41891 () Bool)

(declare-fun call!41897 () ListLongMap!13653)

(declare-fun c!100217 () Bool)

(declare-fun call!41898 () ListLongMap!13653)

(declare-fun call!41899 () ListLongMap!13653)

(assert (=> bm!41891 (= call!41898 (+!3111 (ite c!100217 call!41897 (ite c!100218 call!41899 call!41894)) (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41892 () Bool)

(declare-fun call!41895 () Bool)

(assert (=> bm!41892 (= call!41895 (contains!5690 lt!438602 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989023 () Bool)

(declare-fun e!557678 () Bool)

(assert (=> b!989023 (= e!557678 (= (apply!888 lt!438602 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989023 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30539 _values!1278)))))

(assert (=> b!989023 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(declare-fun b!989024 () Bool)

(declare-fun res!661499 () Bool)

(declare-fun e!557669 () Bool)

(assert (=> b!989024 (=> (not res!661499) (not e!557669))))

(assert (=> b!989024 (= res!661499 e!557674)))

(declare-fun c!100219 () Bool)

(assert (=> b!989024 (= c!100219 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!989025 () Bool)

(declare-fun e!557667 () Unit!32696)

(declare-fun Unit!32701 () Unit!32696)

(assert (=> b!989025 (= e!557667 Unit!32701)))

(declare-fun b!989026 () Bool)

(declare-fun call!41893 () ListLongMap!13653)

(assert (=> b!989026 (= e!557666 call!41893)))

(declare-fun b!989027 () Bool)

(declare-fun c!100215 () Bool)

(assert (=> b!989027 (= c!100215 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!989027 (= e!557672 e!557666)))

(declare-fun b!989028 () Bool)

(declare-fun e!557670 () Bool)

(assert (=> b!989028 (= e!557669 e!557670)))

(declare-fun c!100216 () Bool)

(assert (=> b!989028 (= c!100216 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!989029 () Bool)

(declare-fun e!557676 () Bool)

(assert (=> b!989029 (= e!557676 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989030 () Bool)

(assert (=> b!989030 (= e!557671 (+!3111 call!41898 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!989031 () Bool)

(assert (=> b!989031 (= e!557674 (not call!41896))))

(declare-fun b!989032 () Bool)

(assert (=> b!989032 (= e!557672 call!41893)))

(declare-fun bm!41894 () Bool)

(assert (=> bm!41894 (= call!41893 call!41898)))

(declare-fun b!989033 () Bool)

(declare-fun res!661503 () Bool)

(assert (=> b!989033 (=> (not res!661503) (not e!557669))))

(declare-fun e!557668 () Bool)

(assert (=> b!989033 (= res!661503 e!557668)))

(declare-fun res!661498 () Bool)

(assert (=> b!989033 (=> res!661498 e!557668)))

(assert (=> b!989033 (= res!661498 (not e!557676))))

(declare-fun res!661506 () Bool)

(assert (=> b!989033 (=> (not res!661506) (not e!557676))))

(assert (=> b!989033 (= res!661506 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(declare-fun b!989034 () Bool)

(assert (=> b!989034 (= e!557670 (not call!41895))))

(declare-fun b!989035 () Bool)

(declare-fun lt!438613 () Unit!32696)

(assert (=> b!989035 (= e!557667 lt!438613)))

(declare-fun lt!438615 () ListLongMap!13653)

(assert (=> b!989035 (= lt!438615 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438622 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438608 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438608 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438611 () Unit!32696)

(assert (=> b!989035 (= lt!438611 (addStillContains!608 lt!438615 lt!438622 zeroValue!1220 lt!438608))))

(assert (=> b!989035 (contains!5690 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220)) lt!438608)))

(declare-fun lt!438621 () Unit!32696)

(assert (=> b!989035 (= lt!438621 lt!438611)))

(declare-fun lt!438616 () ListLongMap!13653)

(assert (=> b!989035 (= lt!438616 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438603 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438601 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438601 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438609 () Unit!32696)

(assert (=> b!989035 (= lt!438609 (addApplyDifferent!464 lt!438616 lt!438603 minValue!1220 lt!438601))))

(assert (=> b!989035 (= (apply!888 (+!3111 lt!438616 (tuple2!14967 lt!438603 minValue!1220)) lt!438601) (apply!888 lt!438616 lt!438601))))

(declare-fun lt!438610 () Unit!32696)

(assert (=> b!989035 (= lt!438610 lt!438609)))

(declare-fun lt!438606 () ListLongMap!13653)

(assert (=> b!989035 (= lt!438606 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438605 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438612 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438612 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438604 () Unit!32696)

(assert (=> b!989035 (= lt!438604 (addApplyDifferent!464 lt!438606 lt!438605 zeroValue!1220 lt!438612))))

(assert (=> b!989035 (= (apply!888 (+!3111 lt!438606 (tuple2!14967 lt!438605 zeroValue!1220)) lt!438612) (apply!888 lt!438606 lt!438612))))

(declare-fun lt!438618 () Unit!32696)

(assert (=> b!989035 (= lt!438618 lt!438604)))

(declare-fun lt!438617 () ListLongMap!13653)

(assert (=> b!989035 (= lt!438617 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438614 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438614 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438620 () (_ BitVec 64))

(assert (=> b!989035 (= lt!438620 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!989035 (= lt!438613 (addApplyDifferent!464 lt!438617 lt!438614 minValue!1220 lt!438620))))

(assert (=> b!989035 (= (apply!888 (+!3111 lt!438617 (tuple2!14967 lt!438614 minValue!1220)) lt!438620) (apply!888 lt!438617 lt!438620))))

(declare-fun b!989036 () Bool)

(assert (=> b!989036 (= e!557670 e!557675)))

(declare-fun res!661504 () Bool)

(assert (=> b!989036 (= res!661504 call!41895)))

(assert (=> b!989036 (=> (not res!661504) (not e!557675))))

(declare-fun b!989037 () Bool)

(declare-fun e!557673 () Bool)

(assert (=> b!989037 (= e!557673 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun bm!41895 () Bool)

(assert (=> bm!41895 (= call!41899 call!41897)))

(declare-fun b!989038 () Bool)

(assert (=> b!989038 (= e!557668 e!557678)))

(declare-fun res!661505 () Bool)

(assert (=> b!989038 (=> (not res!661505) (not e!557678))))

(assert (=> b!989038 (= res!661505 (contains!5690 lt!438602 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989038 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(declare-fun d!117095 () Bool)

(assert (=> d!117095 e!557669))

(declare-fun res!661502 () Bool)

(assert (=> d!117095 (=> (not res!661502) (not e!557669))))

(assert (=> d!117095 (= res!661502 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))))

(declare-fun lt!438619 () ListLongMap!13653)

(assert (=> d!117095 (= lt!438602 lt!438619)))

(declare-fun lt!438607 () Unit!32696)

(assert (=> d!117095 (= lt!438607 e!557667)))

(declare-fun c!100214 () Bool)

(assert (=> d!117095 (= c!100214 e!557673)))

(declare-fun res!661500 () Bool)

(assert (=> d!117095 (=> (not res!661500) (not e!557673))))

(assert (=> d!117095 (= res!661500 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30540 _keys!1544)))))

(assert (=> d!117095 (= lt!438619 e!557671)))

(assert (=> d!117095 (= c!100217 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117095 (validMask!0 mask!1948)))

(assert (=> d!117095 (= (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438602)))

(declare-fun bm!41893 () Bool)

(assert (=> bm!41893 (= call!41894 call!41899)))

(declare-fun b!989039 () Bool)

(assert (=> b!989039 (= e!557677 (= (apply!888 lt!438602 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun bm!41896 () Bool)

(assert (=> bm!41896 (= call!41897 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and d!117095 c!100217) b!989030))

(assert (= (and d!117095 (not c!100217)) b!989019))

(assert (= (and b!989019 c!100218) b!989032))

(assert (= (and b!989019 (not c!100218)) b!989027))

(assert (= (and b!989027 c!100215) b!989026))

(assert (= (and b!989027 (not c!100215)) b!989022))

(assert (= (or b!989026 b!989022) bm!41893))

(assert (= (or b!989032 bm!41893) bm!41895))

(assert (= (or b!989032 b!989026) bm!41894))

(assert (= (or b!989030 bm!41895) bm!41896))

(assert (= (or b!989030 bm!41894) bm!41891))

(assert (= (and d!117095 res!661500) b!989037))

(assert (= (and d!117095 c!100214) b!989035))

(assert (= (and d!117095 (not c!100214)) b!989025))

(assert (= (and d!117095 res!661502) b!989033))

(assert (= (and b!989033 res!661506) b!989029))

(assert (= (and b!989033 (not res!661498)) b!989038))

(assert (= (and b!989038 res!661505) b!989023))

(assert (= (and b!989033 res!661503) b!989024))

(assert (= (and b!989024 c!100219) b!989020))

(assert (= (and b!989024 (not c!100219)) b!989031))

(assert (= (and b!989020 res!661501) b!989039))

(assert (= (or b!989020 b!989031) bm!41890))

(assert (= (and b!989024 res!661499) b!989028))

(assert (= (and b!989028 c!100216) b!989036))

(assert (= (and b!989028 (not c!100216)) b!989034))

(assert (= (and b!989036 res!661504) b!989021))

(assert (= (or b!989036 b!989034) bm!41892))

(declare-fun b_lambda!15093 () Bool)

(assert (=> (not b_lambda!15093) (not b!989023)))

(assert (=> b!989023 t!29793))

(declare-fun b_and!32143 () Bool)

(assert (= b_and!32141 (and (=> t!29793 result!13595) b_and!32143)))

(declare-fun m!915643 () Bool)

(assert (=> bm!41890 m!915643))

(declare-fun m!915645 () Bool)

(assert (=> bm!41892 m!915645))

(declare-fun m!915647 () Bool)

(assert (=> b!989030 m!915647))

(declare-fun m!915649 () Bool)

(assert (=> b!989039 m!915649))

(declare-fun m!915651 () Bool)

(assert (=> b!989021 m!915651))

(assert (=> b!989038 m!915525))

(assert (=> b!989038 m!915525))

(declare-fun m!915653 () Bool)

(assert (=> b!989038 m!915653))

(assert (=> b!989023 m!915437))

(assert (=> b!989023 m!915529))

(assert (=> b!989023 m!915437))

(assert (=> b!989023 m!915531))

(assert (=> b!989023 m!915525))

(declare-fun m!915655 () Bool)

(assert (=> b!989023 m!915655))

(assert (=> b!989023 m!915529))

(assert (=> b!989023 m!915525))

(assert (=> d!117095 m!915405))

(declare-fun m!915657 () Bool)

(assert (=> b!989035 m!915657))

(declare-fun m!915659 () Bool)

(assert (=> b!989035 m!915659))

(declare-fun m!915661 () Bool)

(assert (=> b!989035 m!915661))

(declare-fun m!915663 () Bool)

(assert (=> b!989035 m!915663))

(assert (=> b!989035 m!915525))

(declare-fun m!915665 () Bool)

(assert (=> b!989035 m!915665))

(assert (=> b!989035 m!915657))

(declare-fun m!915667 () Bool)

(assert (=> b!989035 m!915667))

(declare-fun m!915669 () Bool)

(assert (=> b!989035 m!915669))

(declare-fun m!915671 () Bool)

(assert (=> b!989035 m!915671))

(declare-fun m!915673 () Bool)

(assert (=> b!989035 m!915673))

(assert (=> b!989035 m!915673))

(declare-fun m!915675 () Bool)

(assert (=> b!989035 m!915675))

(assert (=> b!989035 m!915661))

(declare-fun m!915677 () Bool)

(assert (=> b!989035 m!915677))

(assert (=> b!989035 m!915435))

(assert (=> b!989035 m!915659))

(declare-fun m!915679 () Bool)

(assert (=> b!989035 m!915679))

(declare-fun m!915681 () Bool)

(assert (=> b!989035 m!915681))

(declare-fun m!915683 () Bool)

(assert (=> b!989035 m!915683))

(declare-fun m!915685 () Bool)

(assert (=> b!989035 m!915685))

(declare-fun m!915687 () Bool)

(assert (=> bm!41891 m!915687))

(assert (=> b!989029 m!915525))

(assert (=> b!989029 m!915525))

(assert (=> b!989029 m!915533))

(assert (=> bm!41896 m!915435))

(assert (=> b!989037 m!915525))

(assert (=> b!989037 m!915525))

(assert (=> b!989037 m!915533))

(assert (=> b!988809 d!117095))

(declare-fun d!117097 () Bool)

(declare-fun e!557679 () Bool)

(assert (=> d!117097 e!557679))

(declare-fun res!661507 () Bool)

(assert (=> d!117097 (=> (not res!661507) (not e!557679))))

(declare-fun lt!438623 () ListLongMap!13653)

(assert (=> d!117097 (= res!661507 (contains!5690 lt!438623 (_1!7494 lt!438464)))))

(declare-fun lt!438626 () List!20850)

(assert (=> d!117097 (= lt!438623 (ListLongMap!13654 lt!438626))))

(declare-fun lt!438625 () Unit!32696)

(declare-fun lt!438624 () Unit!32696)

(assert (=> d!117097 (= lt!438625 lt!438624)))

(assert (=> d!117097 (= (getValueByKey!516 lt!438626 (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464)))))

(assert (=> d!117097 (= lt!438624 (lemmaContainsTupThenGetReturnValue!273 lt!438626 (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(assert (=> d!117097 (= lt!438626 (insertStrictlySorted!330 (toList!6842 (+!3111 lt!438460 lt!438462)) (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(assert (=> d!117097 (= (+!3111 (+!3111 lt!438460 lt!438462) lt!438464) lt!438623)))

(declare-fun b!989040 () Bool)

(declare-fun res!661508 () Bool)

(assert (=> b!989040 (=> (not res!661508) (not e!557679))))

(assert (=> b!989040 (= res!661508 (= (getValueByKey!516 (toList!6842 lt!438623) (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464))))))

(declare-fun b!989041 () Bool)

(assert (=> b!989041 (= e!557679 (contains!5692 (toList!6842 lt!438623) lt!438464))))

(assert (= (and d!117097 res!661507) b!989040))

(assert (= (and b!989040 res!661508) b!989041))

(declare-fun m!915689 () Bool)

(assert (=> d!117097 m!915689))

(declare-fun m!915691 () Bool)

(assert (=> d!117097 m!915691))

(declare-fun m!915693 () Bool)

(assert (=> d!117097 m!915693))

(declare-fun m!915695 () Bool)

(assert (=> d!117097 m!915695))

(declare-fun m!915697 () Bool)

(assert (=> b!989040 m!915697))

(declare-fun m!915699 () Bool)

(assert (=> b!989041 m!915699))

(assert (=> b!988809 d!117097))

(declare-fun d!117099 () Bool)

(declare-fun e!557680 () Bool)

(assert (=> d!117099 e!557680))

(declare-fun res!661509 () Bool)

(assert (=> d!117099 (=> (not res!661509) (not e!557680))))

(declare-fun lt!438627 () ListLongMap!13653)

(assert (=> d!117099 (= res!661509 (contains!5690 lt!438627 (_1!7494 lt!438462)))))

(declare-fun lt!438630 () List!20850)

(assert (=> d!117099 (= lt!438627 (ListLongMap!13654 lt!438630))))

(declare-fun lt!438629 () Unit!32696)

(declare-fun lt!438628 () Unit!32696)

(assert (=> d!117099 (= lt!438629 lt!438628)))

(assert (=> d!117099 (= (getValueByKey!516 lt!438630 (_1!7494 lt!438462)) (Some!521 (_2!7494 lt!438462)))))

(assert (=> d!117099 (= lt!438628 (lemmaContainsTupThenGetReturnValue!273 lt!438630 (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(assert (=> d!117099 (= lt!438630 (insertStrictlySorted!330 (toList!6842 (+!3111 lt!438460 lt!438464)) (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(assert (=> d!117099 (= (+!3111 (+!3111 lt!438460 lt!438464) lt!438462) lt!438627)))

(declare-fun b!989042 () Bool)

(declare-fun res!661510 () Bool)

(assert (=> b!989042 (=> (not res!661510) (not e!557680))))

(assert (=> b!989042 (= res!661510 (= (getValueByKey!516 (toList!6842 lt!438627) (_1!7494 lt!438462)) (Some!521 (_2!7494 lt!438462))))))

(declare-fun b!989043 () Bool)

(assert (=> b!989043 (= e!557680 (contains!5692 (toList!6842 lt!438627) lt!438462))))

(assert (= (and d!117099 res!661509) b!989042))

(assert (= (and b!989042 res!661510) b!989043))

(declare-fun m!915701 () Bool)

(assert (=> d!117099 m!915701))

(declare-fun m!915703 () Bool)

(assert (=> d!117099 m!915703))

(declare-fun m!915705 () Bool)

(assert (=> d!117099 m!915705))

(declare-fun m!915707 () Bool)

(assert (=> d!117099 m!915707))

(declare-fun m!915709 () Bool)

(assert (=> b!989042 m!915709))

(declare-fun m!915711 () Bool)

(assert (=> b!989043 m!915711))

(assert (=> b!988809 d!117099))

(declare-fun d!117101 () Bool)

(declare-fun e!557681 () Bool)

(assert (=> d!117101 e!557681))

(declare-fun res!661511 () Bool)

(assert (=> d!117101 (=> (not res!661511) (not e!557681))))

(declare-fun lt!438631 () ListLongMap!13653)

(assert (=> d!117101 (= res!661511 (contains!5690 lt!438631 (_1!7494 lt!438464)))))

(declare-fun lt!438634 () List!20850)

(assert (=> d!117101 (= lt!438631 (ListLongMap!13654 lt!438634))))

(declare-fun lt!438633 () Unit!32696)

(declare-fun lt!438632 () Unit!32696)

(assert (=> d!117101 (= lt!438633 lt!438632)))

(assert (=> d!117101 (= (getValueByKey!516 lt!438634 (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464)))))

(assert (=> d!117101 (= lt!438632 (lemmaContainsTupThenGetReturnValue!273 lt!438634 (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(assert (=> d!117101 (= lt!438634 (insertStrictlySorted!330 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(assert (=> d!117101 (= (+!3111 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438464) lt!438631)))

(declare-fun b!989044 () Bool)

(declare-fun res!661512 () Bool)

(assert (=> b!989044 (=> (not res!661512) (not e!557681))))

(assert (=> b!989044 (= res!661512 (= (getValueByKey!516 (toList!6842 lt!438631) (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464))))))

(declare-fun b!989045 () Bool)

(assert (=> b!989045 (= e!557681 (contains!5692 (toList!6842 lt!438631) lt!438464))))

(assert (= (and d!117101 res!661511) b!989044))

(assert (= (and b!989044 res!661512) b!989045))

(declare-fun m!915713 () Bool)

(assert (=> d!117101 m!915713))

(declare-fun m!915715 () Bool)

(assert (=> d!117101 m!915715))

(declare-fun m!915717 () Bool)

(assert (=> d!117101 m!915717))

(declare-fun m!915719 () Bool)

(assert (=> d!117101 m!915719))

(declare-fun m!915721 () Bool)

(assert (=> b!989044 m!915721))

(declare-fun m!915723 () Bool)

(assert (=> b!989045 m!915723))

(assert (=> b!988809 d!117101))

(declare-fun d!117103 () Bool)

(assert (=> d!117103 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84542 d!117103))

(declare-fun d!117105 () Bool)

(assert (=> d!117105 (= (array_inv!23229 _values!1278) (bvsge (size!30539 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84542 d!117105))

(declare-fun d!117107 () Bool)

(assert (=> d!117107 (= (array_inv!23230 _keys!1544) (bvsge (size!30540 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84542 d!117107))

(declare-fun b!989054 () Bool)

(declare-fun e!557689 () Bool)

(declare-fun e!557688 () Bool)

(assert (=> b!989054 (= e!557689 e!557688)))

(declare-fun lt!438643 () (_ BitVec 64))

(assert (=> b!989054 (= lt!438643 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!438641 () Unit!32696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62410 (_ BitVec 64) (_ BitVec 32)) Unit!32696)

(assert (=> b!989054 (= lt!438641 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438643 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!989054 (arrayContainsKey!0 _keys!1544 lt!438643 #b00000000000000000000000000000000)))

(declare-fun lt!438642 () Unit!32696)

(assert (=> b!989054 (= lt!438642 lt!438641)))

(declare-fun res!661517 () Bool)

(declare-datatypes ((SeekEntryResult!9205 0))(
  ( (MissingZero!9205 (index!39191 (_ BitVec 32))) (Found!9205 (index!39192 (_ BitVec 32))) (Intermediate!9205 (undefined!10017 Bool) (index!39193 (_ BitVec 32)) (x!86082 (_ BitVec 32))) (Undefined!9205) (MissingVacant!9205 (index!39194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62410 (_ BitVec 32)) SeekEntryResult!9205)

(assert (=> b!989054 (= res!661517 (= (seekEntryOrOpen!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9205 #b00000000000000000000000000000000)))))

(assert (=> b!989054 (=> (not res!661517) (not e!557688))))

(declare-fun bm!41899 () Bool)

(declare-fun call!41902 () Bool)

(assert (=> bm!41899 (= call!41902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!989055 () Bool)

(assert (=> b!989055 (= e!557688 call!41902)))

(declare-fun b!989056 () Bool)

(assert (=> b!989056 (= e!557689 call!41902)))

(declare-fun b!989057 () Bool)

(declare-fun e!557690 () Bool)

(assert (=> b!989057 (= e!557690 e!557689)))

(declare-fun c!100222 () Bool)

(assert (=> b!989057 (= c!100222 (validKeyInArray!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117109 () Bool)

(declare-fun res!661518 () Bool)

(assert (=> d!117109 (=> res!661518 e!557690)))

(assert (=> d!117109 (= res!661518 (bvsge #b00000000000000000000000000000000 (size!30540 _keys!1544)))))

(assert (=> d!117109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557690)))

(assert (= (and d!117109 (not res!661518)) b!989057))

(assert (= (and b!989057 c!100222) b!989054))

(assert (= (and b!989057 (not c!100222)) b!989056))

(assert (= (and b!989054 res!661517) b!989055))

(assert (= (or b!989055 b!989056) bm!41899))

(assert (=> b!989054 m!915553))

(declare-fun m!915725 () Bool)

(assert (=> b!989054 m!915725))

(declare-fun m!915727 () Bool)

(assert (=> b!989054 m!915727))

(assert (=> b!989054 m!915553))

(declare-fun m!915729 () Bool)

(assert (=> b!989054 m!915729))

(declare-fun m!915731 () Bool)

(assert (=> bm!41899 m!915731))

(assert (=> b!989057 m!915553))

(assert (=> b!989057 m!915553))

(assert (=> b!989057 m!915555))

(assert (=> b!988818 d!117109))

(declare-fun b!989064 () Bool)

(declare-fun e!557695 () Bool)

(assert (=> b!989064 (= e!557695 tp_is_empty!23257)))

(declare-fun mapIsEmpty!36936 () Bool)

(declare-fun mapRes!36936 () Bool)

(assert (=> mapIsEmpty!36936 mapRes!36936))

(declare-fun condMapEmpty!36936 () Bool)

(declare-fun mapDefault!36936 () ValueCell!11147)

(assert (=> mapNonEmpty!36927 (= condMapEmpty!36936 (= mapRest!36927 ((as const (Array (_ BitVec 32) ValueCell!11147)) mapDefault!36936)))))

(declare-fun e!557696 () Bool)

(assert (=> mapNonEmpty!36927 (= tp!69911 (and e!557696 mapRes!36936))))

(declare-fun mapNonEmpty!36936 () Bool)

(declare-fun tp!69927 () Bool)

(assert (=> mapNonEmpty!36936 (= mapRes!36936 (and tp!69927 e!557695))))

(declare-fun mapKey!36936 () (_ BitVec 32))

(declare-fun mapValue!36936 () ValueCell!11147)

(declare-fun mapRest!36936 () (Array (_ BitVec 32) ValueCell!11147))

(assert (=> mapNonEmpty!36936 (= mapRest!36927 (store mapRest!36936 mapKey!36936 mapValue!36936))))

(declare-fun b!989065 () Bool)

(assert (=> b!989065 (= e!557696 tp_is_empty!23257)))

(assert (= (and mapNonEmpty!36927 condMapEmpty!36936) mapIsEmpty!36936))

(assert (= (and mapNonEmpty!36927 (not condMapEmpty!36936)) mapNonEmpty!36936))

(assert (= (and mapNonEmpty!36936 ((_ is ValueCellFull!11147) mapValue!36936)) b!989064))

(assert (= (and mapNonEmpty!36927 ((_ is ValueCellFull!11147) mapDefault!36936)) b!989065))

(declare-fun m!915733 () Bool)

(assert (=> mapNonEmpty!36936 m!915733))

(declare-fun b_lambda!15095 () Bool)

(assert (= b_lambda!15093 (or (and start!84542 b_free!20041) b_lambda!15095)))

(declare-fun b_lambda!15097 () Bool)

(assert (= b_lambda!15091 (or (and start!84542 b_free!20041) b_lambda!15097)))

(declare-fun b_lambda!15099 () Bool)

(assert (= b_lambda!15087 (or (and start!84542 b_free!20041) b_lambda!15099)))

(declare-fun b_lambda!15101 () Bool)

(assert (= b_lambda!15089 (or (and start!84542 b_free!20041) b_lambda!15101)))

(check-sat (not b!988929) (not b_lambda!15099) (not bm!41899) (not b!989030) (not mapNonEmpty!36936) (not b!989002) (not d!117099) (not b!989009) (not bm!41865) (not b!988945) (not bm!41889) (not b!989014) (not b!989044) (not b!988931) (not b!989023) (not bm!41890) (not b!989042) (not b!988952) tp_is_empty!23257 (not b_lambda!15095) (not b!989016) b_and!32143 (not bm!41891) (not bm!41896) (not b!988930) (not d!117093) (not b!989041) (not bm!41892) (not b!988924) (not b!989057) (not b!988896) (not b!988923) (not b!989040) (not b!989035) (not bm!41884) (not b!988955) (not b!988947) (not b!989029) (not b!989037) (not b!988953) (not d!117097) (not d!117095) (not bm!41868) (not b!988925) (not b!989018) (not b!988943) (not d!117087) (not b!988926) (not d!117101) (not d!117089) (not d!117091) (not b!989045) (not bm!41883) (not b!989008) (not bm!41885) (not b!989043) (not b!989038) (not b_lambda!15101) (not b_next!20041) (not b!989054) (not b_lambda!15085) (not b_lambda!15097) (not b!989000) (not d!117083) (not b!989017) (not b!989021) (not b!988922) (not b!988895) (not b!988954) (not b!989039))
(check-sat b_and!32143 (not b_next!20041))
(get-model)

(declare-fun d!117111 () Bool)

(declare-fun e!557701 () Bool)

(assert (=> d!117111 e!557701))

(declare-fun res!661521 () Bool)

(assert (=> d!117111 (=> res!661521 e!557701)))

(declare-fun lt!438654 () Bool)

(assert (=> d!117111 (= res!661521 (not lt!438654))))

(declare-fun lt!438655 () Bool)

(assert (=> d!117111 (= lt!438654 lt!438655)))

(declare-fun lt!438652 () Unit!32696)

(declare-fun e!557702 () Unit!32696)

(assert (=> d!117111 (= lt!438652 e!557702)))

(declare-fun c!100225 () Bool)

(assert (=> d!117111 (= c!100225 lt!438655)))

(declare-fun containsKey!478 (List!20850 (_ BitVec 64)) Bool)

(assert (=> d!117111 (= lt!438655 (containsKey!478 (toList!6842 lt!438623) (_1!7494 lt!438464)))))

(assert (=> d!117111 (= (contains!5690 lt!438623 (_1!7494 lt!438464)) lt!438654)))

(declare-fun b!989072 () Bool)

(declare-fun lt!438653 () Unit!32696)

(assert (=> b!989072 (= e!557702 lt!438653)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!373 (List!20850 (_ BitVec 64)) Unit!32696)

(assert (=> b!989072 (= lt!438653 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438623) (_1!7494 lt!438464)))))

(declare-fun isDefined!386 (Option!522) Bool)

(assert (=> b!989072 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438623) (_1!7494 lt!438464)))))

(declare-fun b!989073 () Bool)

(declare-fun Unit!32702 () Unit!32696)

(assert (=> b!989073 (= e!557702 Unit!32702)))

(declare-fun b!989074 () Bool)

(assert (=> b!989074 (= e!557701 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438623) (_1!7494 lt!438464))))))

(assert (= (and d!117111 c!100225) b!989072))

(assert (= (and d!117111 (not c!100225)) b!989073))

(assert (= (and d!117111 (not res!661521)) b!989074))

(declare-fun m!915735 () Bool)

(assert (=> d!117111 m!915735))

(declare-fun m!915737 () Bool)

(assert (=> b!989072 m!915737))

(assert (=> b!989072 m!915697))

(assert (=> b!989072 m!915697))

(declare-fun m!915739 () Bool)

(assert (=> b!989072 m!915739))

(assert (=> b!989074 m!915697))

(assert (=> b!989074 m!915697))

(assert (=> b!989074 m!915739))

(assert (=> d!117097 d!117111))

(declare-fun b!989084 () Bool)

(declare-fun e!557707 () Option!522)

(declare-fun e!557708 () Option!522)

(assert (=> b!989084 (= e!557707 e!557708)))

(declare-fun c!100231 () Bool)

(assert (=> b!989084 (= c!100231 (and ((_ is Cons!20846) lt!438626) (not (= (_1!7494 (h!22008 lt!438626)) (_1!7494 lt!438464)))))))

(declare-fun b!989086 () Bool)

(assert (=> b!989086 (= e!557708 None!520)))

(declare-fun b!989085 () Bool)

(assert (=> b!989085 (= e!557708 (getValueByKey!516 (t!29794 lt!438626) (_1!7494 lt!438464)))))

(declare-fun d!117113 () Bool)

(declare-fun c!100230 () Bool)

(assert (=> d!117113 (= c!100230 (and ((_ is Cons!20846) lt!438626) (= (_1!7494 (h!22008 lt!438626)) (_1!7494 lt!438464))))))

(assert (=> d!117113 (= (getValueByKey!516 lt!438626 (_1!7494 lt!438464)) e!557707)))

(declare-fun b!989083 () Bool)

(assert (=> b!989083 (= e!557707 (Some!521 (_2!7494 (h!22008 lt!438626))))))

(assert (= (and d!117113 c!100230) b!989083))

(assert (= (and d!117113 (not c!100230)) b!989084))

(assert (= (and b!989084 c!100231) b!989085))

(assert (= (and b!989084 (not c!100231)) b!989086))

(declare-fun m!915741 () Bool)

(assert (=> b!989085 m!915741))

(assert (=> d!117097 d!117113))

(declare-fun d!117115 () Bool)

(assert (=> d!117115 (= (getValueByKey!516 lt!438626 (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464)))))

(declare-fun lt!438658 () Unit!32696)

(declare-fun choose!1620 (List!20850 (_ BitVec 64) V!35993) Unit!32696)

(assert (=> d!117115 (= lt!438658 (choose!1620 lt!438626 (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun e!557711 () Bool)

(assert (=> d!117115 e!557711))

(declare-fun res!661526 () Bool)

(assert (=> d!117115 (=> (not res!661526) (not e!557711))))

(declare-fun isStrictlySorted!512 (List!20850) Bool)

(assert (=> d!117115 (= res!661526 (isStrictlySorted!512 lt!438626))))

(assert (=> d!117115 (= (lemmaContainsTupThenGetReturnValue!273 lt!438626 (_1!7494 lt!438464) (_2!7494 lt!438464)) lt!438658)))

(declare-fun b!989091 () Bool)

(declare-fun res!661527 () Bool)

(assert (=> b!989091 (=> (not res!661527) (not e!557711))))

(assert (=> b!989091 (= res!661527 (containsKey!478 lt!438626 (_1!7494 lt!438464)))))

(declare-fun b!989092 () Bool)

(assert (=> b!989092 (= e!557711 (contains!5692 lt!438626 (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464))))))

(assert (= (and d!117115 res!661526) b!989091))

(assert (= (and b!989091 res!661527) b!989092))

(assert (=> d!117115 m!915691))

(declare-fun m!915743 () Bool)

(assert (=> d!117115 m!915743))

(declare-fun m!915745 () Bool)

(assert (=> d!117115 m!915745))

(declare-fun m!915747 () Bool)

(assert (=> b!989091 m!915747))

(declare-fun m!915749 () Bool)

(assert (=> b!989092 m!915749))

(assert (=> d!117097 d!117115))

(declare-fun b!989113 () Bool)

(declare-fun e!557724 () Bool)

(declare-fun lt!438661 () List!20850)

(assert (=> b!989113 (= e!557724 (contains!5692 lt!438661 (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464))))))

(declare-fun b!989114 () Bool)

(declare-fun res!661533 () Bool)

(assert (=> b!989114 (=> (not res!661533) (not e!557724))))

(assert (=> b!989114 (= res!661533 (containsKey!478 lt!438661 (_1!7494 lt!438464)))))

(declare-fun b!989115 () Bool)

(declare-fun e!557723 () List!20850)

(declare-fun call!41910 () List!20850)

(assert (=> b!989115 (= e!557723 call!41910)))

(declare-fun b!989116 () Bool)

(declare-fun c!100241 () Bool)

(declare-fun c!100243 () Bool)

(declare-fun e!557726 () List!20850)

(assert (=> b!989116 (= e!557726 (ite c!100243 (t!29794 (toList!6842 (+!3111 lt!438460 lt!438462))) (ite c!100241 (Cons!20846 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438462))) (t!29794 (toList!6842 (+!3111 lt!438460 lt!438462)))) Nil!20847)))))

(declare-fun b!989117 () Bool)

(declare-fun e!557725 () List!20850)

(declare-fun call!41911 () List!20850)

(assert (=> b!989117 (= e!557725 call!41911)))

(declare-fun b!989118 () Bool)

(declare-fun e!557722 () List!20850)

(assert (=> b!989118 (= e!557725 e!557722)))

(assert (=> b!989118 (= c!100243 (and ((_ is Cons!20846) (toList!6842 (+!3111 lt!438460 lt!438462))) (= (_1!7494 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438462)))) (_1!7494 lt!438464))))))

(declare-fun b!989119 () Bool)

(declare-fun call!41909 () List!20850)

(assert (=> b!989119 (= e!557722 call!41909)))

(declare-fun d!117117 () Bool)

(assert (=> d!117117 e!557724))

(declare-fun res!661532 () Bool)

(assert (=> d!117117 (=> (not res!661532) (not e!557724))))

(assert (=> d!117117 (= res!661532 (isStrictlySorted!512 lt!438661))))

(assert (=> d!117117 (= lt!438661 e!557725)))

(declare-fun c!100242 () Bool)

(assert (=> d!117117 (= c!100242 (and ((_ is Cons!20846) (toList!6842 (+!3111 lt!438460 lt!438462))) (bvslt (_1!7494 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438462)))) (_1!7494 lt!438464))))))

(assert (=> d!117117 (isStrictlySorted!512 (toList!6842 (+!3111 lt!438460 lt!438462)))))

(assert (=> d!117117 (= (insertStrictlySorted!330 (toList!6842 (+!3111 lt!438460 lt!438462)) (_1!7494 lt!438464) (_2!7494 lt!438464)) lt!438661)))

(declare-fun b!989120 () Bool)

(assert (=> b!989120 (= e!557726 (insertStrictlySorted!330 (t!29794 (toList!6842 (+!3111 lt!438460 lt!438462))) (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun b!989121 () Bool)

(assert (=> b!989121 (= e!557723 call!41910)))

(declare-fun bm!41906 () Bool)

(declare-fun $colon$colon!556 (List!20850 tuple2!14966) List!20850)

(assert (=> bm!41906 (= call!41911 ($colon$colon!556 e!557726 (ite c!100242 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438462))) (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464)))))))

(declare-fun c!100240 () Bool)

(assert (=> bm!41906 (= c!100240 c!100242)))

(declare-fun bm!41907 () Bool)

(assert (=> bm!41907 (= call!41910 call!41909)))

(declare-fun bm!41908 () Bool)

(assert (=> bm!41908 (= call!41909 call!41911)))

(declare-fun b!989122 () Bool)

(assert (=> b!989122 (= c!100241 (and ((_ is Cons!20846) (toList!6842 (+!3111 lt!438460 lt!438462))) (bvsgt (_1!7494 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438462)))) (_1!7494 lt!438464))))))

(assert (=> b!989122 (= e!557722 e!557723)))

(assert (= (and d!117117 c!100242) b!989117))

(assert (= (and d!117117 (not c!100242)) b!989118))

(assert (= (and b!989118 c!100243) b!989119))

(assert (= (and b!989118 (not c!100243)) b!989122))

(assert (= (and b!989122 c!100241) b!989115))

(assert (= (and b!989122 (not c!100241)) b!989121))

(assert (= (or b!989115 b!989121) bm!41907))

(assert (= (or b!989119 bm!41907) bm!41908))

(assert (= (or b!989117 bm!41908) bm!41906))

(assert (= (and bm!41906 c!100240) b!989120))

(assert (= (and bm!41906 (not c!100240)) b!989116))

(assert (= (and d!117117 res!661532) b!989114))

(assert (= (and b!989114 res!661533) b!989113))

(declare-fun m!915751 () Bool)

(assert (=> b!989120 m!915751))

(declare-fun m!915753 () Bool)

(assert (=> bm!41906 m!915753))

(declare-fun m!915755 () Bool)

(assert (=> b!989114 m!915755))

(declare-fun m!915757 () Bool)

(assert (=> d!117117 m!915757))

(declare-fun m!915759 () Bool)

(assert (=> d!117117 m!915759))

(declare-fun m!915761 () Bool)

(assert (=> b!989113 m!915761))

(assert (=> d!117097 d!117117))

(declare-fun d!117119 () Bool)

(declare-fun e!557727 () Bool)

(assert (=> d!117119 e!557727))

(declare-fun res!661534 () Bool)

(assert (=> d!117119 (=> res!661534 e!557727)))

(declare-fun lt!438664 () Bool)

(assert (=> d!117119 (= res!661534 (not lt!438664))))

(declare-fun lt!438665 () Bool)

(assert (=> d!117119 (= lt!438664 lt!438665)))

(declare-fun lt!438662 () Unit!32696)

(declare-fun e!557728 () Unit!32696)

(assert (=> d!117119 (= lt!438662 e!557728)))

(declare-fun c!100244 () Bool)

(assert (=> d!117119 (= c!100244 lt!438665)))

(assert (=> d!117119 (= lt!438665 (containsKey!478 (toList!6842 lt!438580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117119 (= (contains!5690 lt!438580 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438664)))

(declare-fun b!989123 () Bool)

(declare-fun lt!438663 () Unit!32696)

(assert (=> b!989123 (= e!557728 lt!438663)))

(assert (=> b!989123 (= lt!438663 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989123 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989124 () Bool)

(declare-fun Unit!32703 () Unit!32696)

(assert (=> b!989124 (= e!557728 Unit!32703)))

(declare-fun b!989125 () Bool)

(assert (=> b!989125 (= e!557727 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117119 c!100244) b!989123))

(assert (= (and d!117119 (not c!100244)) b!989124))

(assert (= (and d!117119 (not res!661534)) b!989125))

(declare-fun m!915763 () Bool)

(assert (=> d!117119 m!915763))

(declare-fun m!915765 () Bool)

(assert (=> b!989123 m!915765))

(declare-fun m!915767 () Bool)

(assert (=> b!989123 m!915767))

(assert (=> b!989123 m!915767))

(declare-fun m!915769 () Bool)

(assert (=> b!989123 m!915769))

(assert (=> b!989125 m!915767))

(assert (=> b!989125 m!915767))

(assert (=> b!989125 m!915769))

(assert (=> bm!41885 d!117119))

(declare-fun d!117121 () Bool)

(declare-fun e!557729 () Bool)

(assert (=> d!117121 e!557729))

(declare-fun res!661535 () Bool)

(assert (=> d!117121 (=> res!661535 e!557729)))

(declare-fun lt!438668 () Bool)

(assert (=> d!117121 (= res!661535 (not lt!438668))))

(declare-fun lt!438669 () Bool)

(assert (=> d!117121 (= lt!438668 lt!438669)))

(declare-fun lt!438666 () Unit!32696)

(declare-fun e!557730 () Unit!32696)

(assert (=> d!117121 (= lt!438666 e!557730)))

(declare-fun c!100245 () Bool)

(assert (=> d!117121 (= c!100245 lt!438669)))

(assert (=> d!117121 (= lt!438669 (containsKey!478 (toList!6842 lt!438627) (_1!7494 lt!438462)))))

(assert (=> d!117121 (= (contains!5690 lt!438627 (_1!7494 lt!438462)) lt!438668)))

(declare-fun b!989126 () Bool)

(declare-fun lt!438667 () Unit!32696)

(assert (=> b!989126 (= e!557730 lt!438667)))

(assert (=> b!989126 (= lt!438667 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438627) (_1!7494 lt!438462)))))

(assert (=> b!989126 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438627) (_1!7494 lt!438462)))))

(declare-fun b!989127 () Bool)

(declare-fun Unit!32704 () Unit!32696)

(assert (=> b!989127 (= e!557730 Unit!32704)))

(declare-fun b!989128 () Bool)

(assert (=> b!989128 (= e!557729 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438627) (_1!7494 lt!438462))))))

(assert (= (and d!117121 c!100245) b!989126))

(assert (= (and d!117121 (not c!100245)) b!989127))

(assert (= (and d!117121 (not res!661535)) b!989128))

(declare-fun m!915771 () Bool)

(assert (=> d!117121 m!915771))

(declare-fun m!915773 () Bool)

(assert (=> b!989126 m!915773))

(assert (=> b!989126 m!915709))

(assert (=> b!989126 m!915709))

(declare-fun m!915775 () Bool)

(assert (=> b!989126 m!915775))

(assert (=> b!989128 m!915709))

(assert (=> b!989128 m!915709))

(assert (=> b!989128 m!915775))

(assert (=> d!117099 d!117121))

(declare-fun b!989130 () Bool)

(declare-fun e!557731 () Option!522)

(declare-fun e!557732 () Option!522)

(assert (=> b!989130 (= e!557731 e!557732)))

(declare-fun c!100247 () Bool)

(assert (=> b!989130 (= c!100247 (and ((_ is Cons!20846) lt!438630) (not (= (_1!7494 (h!22008 lt!438630)) (_1!7494 lt!438462)))))))

(declare-fun b!989132 () Bool)

(assert (=> b!989132 (= e!557732 None!520)))

(declare-fun b!989131 () Bool)

(assert (=> b!989131 (= e!557732 (getValueByKey!516 (t!29794 lt!438630) (_1!7494 lt!438462)))))

(declare-fun d!117123 () Bool)

(declare-fun c!100246 () Bool)

(assert (=> d!117123 (= c!100246 (and ((_ is Cons!20846) lt!438630) (= (_1!7494 (h!22008 lt!438630)) (_1!7494 lt!438462))))))

(assert (=> d!117123 (= (getValueByKey!516 lt!438630 (_1!7494 lt!438462)) e!557731)))

(declare-fun b!989129 () Bool)

(assert (=> b!989129 (= e!557731 (Some!521 (_2!7494 (h!22008 lt!438630))))))

(assert (= (and d!117123 c!100246) b!989129))

(assert (= (and d!117123 (not c!100246)) b!989130))

(assert (= (and b!989130 c!100247) b!989131))

(assert (= (and b!989130 (not c!100247)) b!989132))

(declare-fun m!915777 () Bool)

(assert (=> b!989131 m!915777))

(assert (=> d!117099 d!117123))

(declare-fun d!117125 () Bool)

(assert (=> d!117125 (= (getValueByKey!516 lt!438630 (_1!7494 lt!438462)) (Some!521 (_2!7494 lt!438462)))))

(declare-fun lt!438670 () Unit!32696)

(assert (=> d!117125 (= lt!438670 (choose!1620 lt!438630 (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(declare-fun e!557733 () Bool)

(assert (=> d!117125 e!557733))

(declare-fun res!661536 () Bool)

(assert (=> d!117125 (=> (not res!661536) (not e!557733))))

(assert (=> d!117125 (= res!661536 (isStrictlySorted!512 lt!438630))))

(assert (=> d!117125 (= (lemmaContainsTupThenGetReturnValue!273 lt!438630 (_1!7494 lt!438462) (_2!7494 lt!438462)) lt!438670)))

(declare-fun b!989133 () Bool)

(declare-fun res!661537 () Bool)

(assert (=> b!989133 (=> (not res!661537) (not e!557733))))

(assert (=> b!989133 (= res!661537 (containsKey!478 lt!438630 (_1!7494 lt!438462)))))

(declare-fun b!989134 () Bool)

(assert (=> b!989134 (= e!557733 (contains!5692 lt!438630 (tuple2!14967 (_1!7494 lt!438462) (_2!7494 lt!438462))))))

(assert (= (and d!117125 res!661536) b!989133))

(assert (= (and b!989133 res!661537) b!989134))

(assert (=> d!117125 m!915703))

(declare-fun m!915779 () Bool)

(assert (=> d!117125 m!915779))

(declare-fun m!915781 () Bool)

(assert (=> d!117125 m!915781))

(declare-fun m!915783 () Bool)

(assert (=> b!989133 m!915783))

(declare-fun m!915785 () Bool)

(assert (=> b!989134 m!915785))

(assert (=> d!117099 d!117125))

(declare-fun b!989135 () Bool)

(declare-fun e!557736 () Bool)

(declare-fun lt!438671 () List!20850)

(assert (=> b!989135 (= e!557736 (contains!5692 lt!438671 (tuple2!14967 (_1!7494 lt!438462) (_2!7494 lt!438462))))))

(declare-fun b!989136 () Bool)

(declare-fun res!661539 () Bool)

(assert (=> b!989136 (=> (not res!661539) (not e!557736))))

(assert (=> b!989136 (= res!661539 (containsKey!478 lt!438671 (_1!7494 lt!438462)))))

(declare-fun b!989137 () Bool)

(declare-fun e!557735 () List!20850)

(declare-fun call!41913 () List!20850)

(assert (=> b!989137 (= e!557735 call!41913)))

(declare-fun e!557738 () List!20850)

(declare-fun c!100251 () Bool)

(declare-fun c!100249 () Bool)

(declare-fun b!989138 () Bool)

(assert (=> b!989138 (= e!557738 (ite c!100251 (t!29794 (toList!6842 (+!3111 lt!438460 lt!438464))) (ite c!100249 (Cons!20846 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438464))) (t!29794 (toList!6842 (+!3111 lt!438460 lt!438464)))) Nil!20847)))))

(declare-fun b!989139 () Bool)

(declare-fun e!557737 () List!20850)

(declare-fun call!41914 () List!20850)

(assert (=> b!989139 (= e!557737 call!41914)))

(declare-fun b!989140 () Bool)

(declare-fun e!557734 () List!20850)

(assert (=> b!989140 (= e!557737 e!557734)))

(assert (=> b!989140 (= c!100251 (and ((_ is Cons!20846) (toList!6842 (+!3111 lt!438460 lt!438464))) (= (_1!7494 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438464)))) (_1!7494 lt!438462))))))

(declare-fun b!989141 () Bool)

(declare-fun call!41912 () List!20850)

(assert (=> b!989141 (= e!557734 call!41912)))

(declare-fun d!117127 () Bool)

(assert (=> d!117127 e!557736))

(declare-fun res!661538 () Bool)

(assert (=> d!117127 (=> (not res!661538) (not e!557736))))

(assert (=> d!117127 (= res!661538 (isStrictlySorted!512 lt!438671))))

(assert (=> d!117127 (= lt!438671 e!557737)))

(declare-fun c!100250 () Bool)

(assert (=> d!117127 (= c!100250 (and ((_ is Cons!20846) (toList!6842 (+!3111 lt!438460 lt!438464))) (bvslt (_1!7494 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438464)))) (_1!7494 lt!438462))))))

(assert (=> d!117127 (isStrictlySorted!512 (toList!6842 (+!3111 lt!438460 lt!438464)))))

(assert (=> d!117127 (= (insertStrictlySorted!330 (toList!6842 (+!3111 lt!438460 lt!438464)) (_1!7494 lt!438462) (_2!7494 lt!438462)) lt!438671)))

(declare-fun b!989142 () Bool)

(assert (=> b!989142 (= e!557738 (insertStrictlySorted!330 (t!29794 (toList!6842 (+!3111 lt!438460 lt!438464))) (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(declare-fun b!989143 () Bool)

(assert (=> b!989143 (= e!557735 call!41913)))

(declare-fun bm!41909 () Bool)

(assert (=> bm!41909 (= call!41914 ($colon$colon!556 e!557738 (ite c!100250 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438464))) (tuple2!14967 (_1!7494 lt!438462) (_2!7494 lt!438462)))))))

(declare-fun c!100248 () Bool)

(assert (=> bm!41909 (= c!100248 c!100250)))

(declare-fun bm!41910 () Bool)

(assert (=> bm!41910 (= call!41913 call!41912)))

(declare-fun bm!41911 () Bool)

(assert (=> bm!41911 (= call!41912 call!41914)))

(declare-fun b!989144 () Bool)

(assert (=> b!989144 (= c!100249 (and ((_ is Cons!20846) (toList!6842 (+!3111 lt!438460 lt!438464))) (bvsgt (_1!7494 (h!22008 (toList!6842 (+!3111 lt!438460 lt!438464)))) (_1!7494 lt!438462))))))

(assert (=> b!989144 (= e!557734 e!557735)))

(assert (= (and d!117127 c!100250) b!989139))

(assert (= (and d!117127 (not c!100250)) b!989140))

(assert (= (and b!989140 c!100251) b!989141))

(assert (= (and b!989140 (not c!100251)) b!989144))

(assert (= (and b!989144 c!100249) b!989137))

(assert (= (and b!989144 (not c!100249)) b!989143))

(assert (= (or b!989137 b!989143) bm!41910))

(assert (= (or b!989141 bm!41910) bm!41911))

(assert (= (or b!989139 bm!41911) bm!41909))

(assert (= (and bm!41909 c!100248) b!989142))

(assert (= (and bm!41909 (not c!100248)) b!989138))

(assert (= (and d!117127 res!661538) b!989136))

(assert (= (and b!989136 res!661539) b!989135))

(declare-fun m!915787 () Bool)

(assert (=> b!989142 m!915787))

(declare-fun m!915789 () Bool)

(assert (=> bm!41909 m!915789))

(declare-fun m!915791 () Bool)

(assert (=> b!989136 m!915791))

(declare-fun m!915793 () Bool)

(assert (=> d!117127 m!915793))

(declare-fun m!915795 () Bool)

(assert (=> d!117127 m!915795))

(declare-fun m!915797 () Bool)

(assert (=> b!989135 m!915797))

(assert (=> d!117099 d!117127))

(declare-fun b!989145 () Bool)

(declare-fun e!557744 () Bool)

(declare-fun e!557741 () Bool)

(assert (=> b!989145 (= e!557744 e!557741)))

(declare-fun c!100255 () Bool)

(assert (=> b!989145 (= c!100255 (bvslt from!1932 (size!30540 _keys!1544)))))

(declare-fun b!989146 () Bool)

(declare-fun lt!438675 () ListLongMap!13653)

(assert (=> b!989146 (= e!557741 (= lt!438675 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989147 () Bool)

(declare-fun e!557745 () Bool)

(assert (=> b!989147 (= e!557744 e!557745)))

(assert (=> b!989147 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30540 _keys!1544)))))

(declare-fun res!661542 () Bool)

(assert (=> b!989147 (= res!661542 (contains!5690 lt!438675 (select (arr!30059 _keys!1544) from!1932)))))

(assert (=> b!989147 (=> (not res!661542) (not e!557745))))

(declare-fun d!117129 () Bool)

(declare-fun e!557743 () Bool)

(assert (=> d!117129 e!557743))

(declare-fun res!661543 () Bool)

(assert (=> d!117129 (=> (not res!661543) (not e!557743))))

(assert (=> d!117129 (= res!661543 (not (contains!5690 lt!438675 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557739 () ListLongMap!13653)

(assert (=> d!117129 (= lt!438675 e!557739)))

(declare-fun c!100253 () Bool)

(assert (=> d!117129 (= c!100253 (bvsge from!1932 (size!30540 _keys!1544)))))

(assert (=> d!117129 (validMask!0 mask!1948)))

(assert (=> d!117129 (= (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438675)))

(declare-fun b!989148 () Bool)

(declare-fun res!661540 () Bool)

(assert (=> b!989148 (=> (not res!661540) (not e!557743))))

(assert (=> b!989148 (= res!661540 (not (contains!5690 lt!438675 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!41915 () ListLongMap!13653)

(declare-fun bm!41912 () Bool)

(assert (=> bm!41912 (= call!41915 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989149 () Bool)

(assert (=> b!989149 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30540 _keys!1544)))))

(assert (=> b!989149 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30539 _values!1278)))))

(assert (=> b!989149 (= e!557745 (= (apply!888 lt!438675 (select (arr!30059 _keys!1544) from!1932)) (get!15613 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989150 () Bool)

(declare-fun lt!438676 () Unit!32696)

(declare-fun lt!438674 () Unit!32696)

(assert (=> b!989150 (= lt!438676 lt!438674)))

(declare-fun lt!438672 () ListLongMap!13653)

(declare-fun lt!438677 () (_ BitVec 64))

(declare-fun lt!438673 () (_ BitVec 64))

(declare-fun lt!438678 () V!35993)

(assert (=> b!989150 (not (contains!5690 (+!3111 lt!438672 (tuple2!14967 lt!438677 lt!438678)) lt!438673))))

(assert (=> b!989150 (= lt!438674 (addStillNotContains!235 lt!438672 lt!438677 lt!438678 lt!438673))))

(assert (=> b!989150 (= lt!438673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989150 (= lt!438678 (get!15613 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989150 (= lt!438677 (select (arr!30059 _keys!1544) from!1932))))

(assert (=> b!989150 (= lt!438672 call!41915)))

(declare-fun e!557740 () ListLongMap!13653)

(assert (=> b!989150 (= e!557740 (+!3111 call!41915 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) (get!15613 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989151 () Bool)

(assert (=> b!989151 (= e!557743 e!557744)))

(declare-fun c!100254 () Bool)

(declare-fun e!557742 () Bool)

(assert (=> b!989151 (= c!100254 e!557742)))

(declare-fun res!661541 () Bool)

(assert (=> b!989151 (=> (not res!661541) (not e!557742))))

(assert (=> b!989151 (= res!661541 (bvslt from!1932 (size!30540 _keys!1544)))))

(declare-fun b!989152 () Bool)

(assert (=> b!989152 (= e!557739 (ListLongMap!13654 Nil!20847))))

(declare-fun b!989153 () Bool)

(assert (=> b!989153 (= e!557742 (validKeyInArray!0 (select (arr!30059 _keys!1544) from!1932)))))

(assert (=> b!989153 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!989154 () Bool)

(assert (=> b!989154 (= e!557739 e!557740)))

(declare-fun c!100252 () Bool)

(assert (=> b!989154 (= c!100252 (validKeyInArray!0 (select (arr!30059 _keys!1544) from!1932)))))

(declare-fun b!989155 () Bool)

(assert (=> b!989155 (= e!557741 (isEmpty!728 lt!438675))))

(declare-fun b!989156 () Bool)

(assert (=> b!989156 (= e!557740 call!41915)))

(assert (= (and d!117129 c!100253) b!989152))

(assert (= (and d!117129 (not c!100253)) b!989154))

(assert (= (and b!989154 c!100252) b!989150))

(assert (= (and b!989154 (not c!100252)) b!989156))

(assert (= (or b!989150 b!989156) bm!41912))

(assert (= (and d!117129 res!661543) b!989148))

(assert (= (and b!989148 res!661540) b!989151))

(assert (= (and b!989151 res!661541) b!989153))

(assert (= (and b!989151 c!100254) b!989147))

(assert (= (and b!989151 (not c!100254)) b!989145))

(assert (= (and b!989147 res!661542) b!989149))

(assert (= (and b!989145 c!100255) b!989146))

(assert (= (and b!989145 (not c!100255)) b!989155))

(declare-fun b_lambda!15103 () Bool)

(assert (=> (not b_lambda!15103) (not b!989149)))

(assert (=> b!989149 t!29793))

(declare-fun b_and!32145 () Bool)

(assert (= b_and!32143 (and (=> t!29793 result!13595) b_and!32145)))

(declare-fun b_lambda!15105 () Bool)

(assert (=> (not b_lambda!15105) (not b!989150)))

(assert (=> b!989150 t!29793))

(declare-fun b_and!32147 () Bool)

(assert (= b_and!32145 (and (=> t!29793 result!13595) b_and!32147)))

(assert (=> b!989149 m!915415))

(declare-fun m!915799 () Bool)

(assert (=> b!989149 m!915799))

(assert (=> b!989149 m!915415))

(assert (=> b!989149 m!915437))

(assert (=> b!989149 m!915433))

(assert (=> b!989149 m!915437))

(assert (=> b!989149 m!915439))

(assert (=> b!989149 m!915433))

(assert (=> b!989154 m!915415))

(assert (=> b!989154 m!915415))

(assert (=> b!989154 m!915429))

(assert (=> b!989153 m!915415))

(assert (=> b!989153 m!915415))

(assert (=> b!989153 m!915429))

(declare-fun m!915801 () Bool)

(assert (=> d!117129 m!915801))

(assert (=> d!117129 m!915405))

(declare-fun m!915803 () Bool)

(assert (=> bm!41912 m!915803))

(assert (=> b!989146 m!915803))

(assert (=> b!989150 m!915415))

(declare-fun m!915805 () Bool)

(assert (=> b!989150 m!915805))

(assert (=> b!989150 m!915433))

(assert (=> b!989150 m!915437))

(assert (=> b!989150 m!915439))

(declare-fun m!915807 () Bool)

(assert (=> b!989150 m!915807))

(assert (=> b!989150 m!915433))

(declare-fun m!915809 () Bool)

(assert (=> b!989150 m!915809))

(assert (=> b!989150 m!915437))

(assert (=> b!989150 m!915807))

(declare-fun m!915811 () Bool)

(assert (=> b!989150 m!915811))

(declare-fun m!915813 () Bool)

(assert (=> b!989155 m!915813))

(declare-fun m!915815 () Bool)

(assert (=> b!989148 m!915815))

(assert (=> b!989147 m!915415))

(assert (=> b!989147 m!915415))

(declare-fun m!915817 () Bool)

(assert (=> b!989147 m!915817))

(assert (=> bm!41889 d!117129))

(declare-fun d!117131 () Bool)

(declare-fun lt!438681 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!418 (List!20850) (InoxSet tuple2!14966))

(assert (=> d!117131 (= lt!438681 (select (content!418 (toList!6842 lt!438528)) lt!438462))))

(declare-fun e!557750 () Bool)

(assert (=> d!117131 (= lt!438681 e!557750)))

(declare-fun res!661548 () Bool)

(assert (=> d!117131 (=> (not res!661548) (not e!557750))))

(assert (=> d!117131 (= res!661548 ((_ is Cons!20846) (toList!6842 lt!438528)))))

(assert (=> d!117131 (= (contains!5692 (toList!6842 lt!438528) lt!438462) lt!438681)))

(declare-fun b!989161 () Bool)

(declare-fun e!557751 () Bool)

(assert (=> b!989161 (= e!557750 e!557751)))

(declare-fun res!661549 () Bool)

(assert (=> b!989161 (=> res!661549 e!557751)))

(assert (=> b!989161 (= res!661549 (= (h!22008 (toList!6842 lt!438528)) lt!438462))))

(declare-fun b!989162 () Bool)

(assert (=> b!989162 (= e!557751 (contains!5692 (t!29794 (toList!6842 lt!438528)) lt!438462))))

(assert (= (and d!117131 res!661548) b!989161))

(assert (= (and b!989161 (not res!661549)) b!989162))

(declare-fun m!915819 () Bool)

(assert (=> d!117131 m!915819))

(declare-fun m!915821 () Bool)

(assert (=> d!117131 m!915821))

(declare-fun m!915823 () Bool)

(assert (=> b!989162 m!915823))

(assert (=> b!988955 d!117131))

(declare-fun b!989163 () Bool)

(declare-fun e!557755 () Bool)

(declare-fun e!557752 () Bool)

(assert (=> b!989163 (= e!557755 e!557752)))

(declare-fun c!100256 () Bool)

(assert (=> b!989163 (= c!100256 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117133 () Bool)

(declare-fun res!661550 () Bool)

(declare-fun e!557754 () Bool)

(assert (=> d!117133 (=> res!661550 e!557754)))

(assert (=> d!117133 (= res!661550 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(assert (=> d!117133 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100195 (Cons!20847 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) Nil!20848) Nil!20848)) e!557754)))

(declare-fun b!989164 () Bool)

(declare-fun call!41916 () Bool)

(assert (=> b!989164 (= e!557752 call!41916)))

(declare-fun b!989165 () Bool)

(assert (=> b!989165 (= e!557754 e!557755)))

(declare-fun res!661552 () Bool)

(assert (=> b!989165 (=> (not res!661552) (not e!557755))))

(declare-fun e!557753 () Bool)

(assert (=> b!989165 (= res!661552 (not e!557753))))

(declare-fun res!661551 () Bool)

(assert (=> b!989165 (=> (not res!661551) (not e!557753))))

(assert (=> b!989165 (= res!661551 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!989166 () Bool)

(assert (=> b!989166 (= e!557752 call!41916)))

(declare-fun bm!41913 () Bool)

(assert (=> bm!41913 (= call!41916 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100256 (Cons!20847 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100195 (Cons!20847 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) Nil!20848) Nil!20848)) (ite c!100195 (Cons!20847 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) Nil!20848) Nil!20848))))))

(declare-fun b!989167 () Bool)

(assert (=> b!989167 (= e!557753 (contains!5691 (ite c!100195 (Cons!20847 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) Nil!20848) Nil!20848) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!117133 (not res!661550)) b!989165))

(assert (= (and b!989165 res!661551) b!989167))

(assert (= (and b!989165 res!661552) b!989163))

(assert (= (and b!989163 c!100256) b!989166))

(assert (= (and b!989163 (not c!100256)) b!989164))

(assert (= (or b!989166 b!989164) bm!41913))

(declare-fun m!915825 () Bool)

(assert (=> b!989163 m!915825))

(assert (=> b!989163 m!915825))

(declare-fun m!915827 () Bool)

(assert (=> b!989163 m!915827))

(assert (=> b!989165 m!915825))

(assert (=> b!989165 m!915825))

(assert (=> b!989165 m!915827))

(assert (=> bm!41913 m!915825))

(declare-fun m!915829 () Bool)

(assert (=> bm!41913 m!915829))

(assert (=> b!989167 m!915825))

(assert (=> b!989167 m!915825))

(declare-fun m!915831 () Bool)

(assert (=> b!989167 m!915831))

(assert (=> bm!41868 d!117133))

(assert (=> b!989016 d!117079))

(declare-fun d!117135 () Bool)

(assert (=> d!117135 (= (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989029 d!117135))

(declare-fun d!117137 () Bool)

(declare-fun e!557756 () Bool)

(assert (=> d!117137 e!557756))

(declare-fun res!661553 () Bool)

(assert (=> d!117137 (=> res!661553 e!557756)))

(declare-fun lt!438684 () Bool)

(assert (=> d!117137 (= res!661553 (not lt!438684))))

(declare-fun lt!438685 () Bool)

(assert (=> d!117137 (= lt!438684 lt!438685)))

(declare-fun lt!438682 () Unit!32696)

(declare-fun e!557757 () Unit!32696)

(assert (=> d!117137 (= lt!438682 e!557757)))

(declare-fun c!100257 () Bool)

(assert (=> d!117137 (= c!100257 lt!438685)))

(assert (=> d!117137 (= lt!438685 (containsKey!478 (toList!6842 lt!438580) (select (arr!30059 _keys!1544) from!1932)))))

(assert (=> d!117137 (= (contains!5690 lt!438580 (select (arr!30059 _keys!1544) from!1932)) lt!438684)))

(declare-fun b!989168 () Bool)

(declare-fun lt!438683 () Unit!32696)

(assert (=> b!989168 (= e!557757 lt!438683)))

(assert (=> b!989168 (= lt!438683 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438580) (select (arr!30059 _keys!1544) from!1932)))))

(assert (=> b!989168 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438580) (select (arr!30059 _keys!1544) from!1932)))))

(declare-fun b!989169 () Bool)

(declare-fun Unit!32705 () Unit!32696)

(assert (=> b!989169 (= e!557757 Unit!32705)))

(declare-fun b!989170 () Bool)

(assert (=> b!989170 (= e!557756 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438580) (select (arr!30059 _keys!1544) from!1932))))))

(assert (= (and d!117137 c!100257) b!989168))

(assert (= (and d!117137 (not c!100257)) b!989169))

(assert (= (and d!117137 (not res!661553)) b!989170))

(assert (=> d!117137 m!915415))

(declare-fun m!915833 () Bool)

(assert (=> d!117137 m!915833))

(assert (=> b!989168 m!915415))

(declare-fun m!915835 () Bool)

(assert (=> b!989168 m!915835))

(assert (=> b!989168 m!915415))

(declare-fun m!915837 () Bool)

(assert (=> b!989168 m!915837))

(assert (=> b!989168 m!915837))

(declare-fun m!915839 () Bool)

(assert (=> b!989168 m!915839))

(assert (=> b!989170 m!915415))

(assert (=> b!989170 m!915837))

(assert (=> b!989170 m!915837))

(assert (=> b!989170 m!915839))

(assert (=> b!989017 d!117137))

(declare-fun d!117139 () Bool)

(assert (=> d!117139 (= (get!15616 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988896 d!117139))

(declare-fun d!117141 () Bool)

(declare-fun e!557758 () Bool)

(assert (=> d!117141 e!557758))

(declare-fun res!661554 () Bool)

(assert (=> d!117141 (=> res!661554 e!557758)))

(declare-fun lt!438688 () Bool)

(assert (=> d!117141 (= res!661554 (not lt!438688))))

(declare-fun lt!438689 () Bool)

(assert (=> d!117141 (= lt!438688 lt!438689)))

(declare-fun lt!438686 () Unit!32696)

(declare-fun e!557759 () Unit!32696)

(assert (=> d!117141 (= lt!438686 e!557759)))

(declare-fun c!100258 () Bool)

(assert (=> d!117141 (= c!100258 lt!438689)))

(assert (=> d!117141 (= lt!438689 (containsKey!478 (toList!6842 lt!438512) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117141 (= (contains!5690 lt!438512 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438688)))

(declare-fun b!989171 () Bool)

(declare-fun lt!438687 () Unit!32696)

(assert (=> b!989171 (= e!557759 lt!438687)))

(assert (=> b!989171 (= lt!438687 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438512) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989171 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438512) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989172 () Bool)

(declare-fun Unit!32706 () Unit!32696)

(assert (=> b!989172 (= e!557759 Unit!32706)))

(declare-fun b!989173 () Bool)

(assert (=> b!989173 (= e!557758 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438512) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117141 c!100258) b!989171))

(assert (= (and d!117141 (not c!100258)) b!989172))

(assert (= (and d!117141 (not res!661554)) b!989173))

(assert (=> d!117141 m!915525))

(declare-fun m!915841 () Bool)

(assert (=> d!117141 m!915841))

(assert (=> b!989171 m!915525))

(declare-fun m!915843 () Bool)

(assert (=> b!989171 m!915843))

(assert (=> b!989171 m!915525))

(declare-fun m!915845 () Bool)

(assert (=> b!989171 m!915845))

(assert (=> b!989171 m!915845))

(declare-fun m!915847 () Bool)

(assert (=> b!989171 m!915847))

(assert (=> b!989173 m!915525))

(assert (=> b!989173 m!915845))

(assert (=> b!989173 m!915845))

(assert (=> b!989173 m!915847))

(assert (=> b!988923 d!117141))

(declare-fun d!117143 () Bool)

(assert (=> d!117143 (= (validKeyInArray!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989057 d!117143))

(declare-fun d!117145 () Bool)

(assert (=> d!117145 (arrayContainsKey!0 _keys!1544 lt!438643 #b00000000000000000000000000000000)))

(declare-fun lt!438692 () Unit!32696)

(declare-fun choose!13 (array!62410 (_ BitVec 64) (_ BitVec 32)) Unit!32696)

(assert (=> d!117145 (= lt!438692 (choose!13 _keys!1544 lt!438643 #b00000000000000000000000000000000))))

(assert (=> d!117145 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117145 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438643 #b00000000000000000000000000000000) lt!438692)))

(declare-fun bs!28044 () Bool)

(assert (= bs!28044 d!117145))

(assert (=> bs!28044 m!915727))

(declare-fun m!915849 () Bool)

(assert (=> bs!28044 m!915849))

(assert (=> b!989054 d!117145))

(declare-fun d!117147 () Bool)

(declare-fun res!661559 () Bool)

(declare-fun e!557764 () Bool)

(assert (=> d!117147 (=> res!661559 e!557764)))

(assert (=> d!117147 (= res!661559 (= (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) lt!438643))))

(assert (=> d!117147 (= (arrayContainsKey!0 _keys!1544 lt!438643 #b00000000000000000000000000000000) e!557764)))

(declare-fun b!989178 () Bool)

(declare-fun e!557765 () Bool)

(assert (=> b!989178 (= e!557764 e!557765)))

(declare-fun res!661560 () Bool)

(assert (=> b!989178 (=> (not res!661560) (not e!557765))))

(assert (=> b!989178 (= res!661560 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(declare-fun b!989179 () Bool)

(assert (=> b!989179 (= e!557765 (arrayContainsKey!0 _keys!1544 lt!438643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117147 (not res!661559)) b!989178))

(assert (= (and b!989178 res!661560) b!989179))

(assert (=> d!117147 m!915553))

(declare-fun m!915851 () Bool)

(assert (=> b!989179 m!915851))

(assert (=> b!989054 d!117147))

(declare-fun b!989192 () Bool)

(declare-fun e!557772 () SeekEntryResult!9205)

(declare-fun lt!438701 () SeekEntryResult!9205)

(assert (=> b!989192 (= e!557772 (Found!9205 (index!39193 lt!438701)))))

(declare-fun b!989193 () Bool)

(declare-fun c!100266 () Bool)

(declare-fun lt!438700 () (_ BitVec 64))

(assert (=> b!989193 (= c!100266 (= lt!438700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!557773 () SeekEntryResult!9205)

(assert (=> b!989193 (= e!557772 e!557773)))

(declare-fun d!117149 () Bool)

(declare-fun lt!438699 () SeekEntryResult!9205)

(assert (=> d!117149 (and (or ((_ is Undefined!9205) lt!438699) (not ((_ is Found!9205) lt!438699)) (and (bvsge (index!39192 lt!438699) #b00000000000000000000000000000000) (bvslt (index!39192 lt!438699) (size!30540 _keys!1544)))) (or ((_ is Undefined!9205) lt!438699) ((_ is Found!9205) lt!438699) (not ((_ is MissingZero!9205) lt!438699)) (and (bvsge (index!39191 lt!438699) #b00000000000000000000000000000000) (bvslt (index!39191 lt!438699) (size!30540 _keys!1544)))) (or ((_ is Undefined!9205) lt!438699) ((_ is Found!9205) lt!438699) ((_ is MissingZero!9205) lt!438699) (not ((_ is MissingVacant!9205) lt!438699)) (and (bvsge (index!39194 lt!438699) #b00000000000000000000000000000000) (bvslt (index!39194 lt!438699) (size!30540 _keys!1544)))) (or ((_ is Undefined!9205) lt!438699) (ite ((_ is Found!9205) lt!438699) (= (select (arr!30059 _keys!1544) (index!39192 lt!438699)) (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9205) lt!438699) (= (select (arr!30059 _keys!1544) (index!39191 lt!438699)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9205) lt!438699) (= (select (arr!30059 _keys!1544) (index!39194 lt!438699)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!557774 () SeekEntryResult!9205)

(assert (=> d!117149 (= lt!438699 e!557774)))

(declare-fun c!100265 () Bool)

(assert (=> d!117149 (= c!100265 (and ((_ is Intermediate!9205) lt!438701) (undefined!10017 lt!438701)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62410 (_ BitVec 32)) SeekEntryResult!9205)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117149 (= lt!438701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117149 (validMask!0 mask!1948)))

(assert (=> d!117149 (= (seekEntryOrOpen!0 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!438699)))

(declare-fun b!989194 () Bool)

(assert (=> b!989194 (= e!557774 e!557772)))

(assert (=> b!989194 (= lt!438700 (select (arr!30059 _keys!1544) (index!39193 lt!438701)))))

(declare-fun c!100267 () Bool)

(assert (=> b!989194 (= c!100267 (= lt!438700 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989195 () Bool)

(assert (=> b!989195 (= e!557774 Undefined!9205)))

(declare-fun b!989196 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62410 (_ BitVec 32)) SeekEntryResult!9205)

(assert (=> b!989196 (= e!557773 (seekKeyOrZeroReturnVacant!0 (x!86082 lt!438701) (index!39193 lt!438701) (index!39193 lt!438701) (select (arr!30059 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!989197 () Bool)

(assert (=> b!989197 (= e!557773 (MissingZero!9205 (index!39193 lt!438701)))))

(assert (= (and d!117149 c!100265) b!989195))

(assert (= (and d!117149 (not c!100265)) b!989194))

(assert (= (and b!989194 c!100267) b!989192))

(assert (= (and b!989194 (not c!100267)) b!989193))

(assert (= (and b!989193 c!100266) b!989197))

(assert (= (and b!989193 (not c!100266)) b!989196))

(assert (=> d!117149 m!915553))

(declare-fun m!915853 () Bool)

(assert (=> d!117149 m!915853))

(declare-fun m!915855 () Bool)

(assert (=> d!117149 m!915855))

(declare-fun m!915857 () Bool)

(assert (=> d!117149 m!915857))

(assert (=> d!117149 m!915405))

(declare-fun m!915859 () Bool)

(assert (=> d!117149 m!915859))

(assert (=> d!117149 m!915853))

(assert (=> d!117149 m!915553))

(declare-fun m!915861 () Bool)

(assert (=> d!117149 m!915861))

(declare-fun m!915863 () Bool)

(assert (=> b!989194 m!915863))

(assert (=> b!989196 m!915553))

(declare-fun m!915865 () Bool)

(assert (=> b!989196 m!915865))

(assert (=> b!989054 d!117149))

(declare-fun d!117151 () Bool)

(declare-fun e!557775 () Bool)

(assert (=> d!117151 e!557775))

(declare-fun res!661561 () Bool)

(assert (=> d!117151 (=> res!661561 e!557775)))

(declare-fun lt!438704 () Bool)

(assert (=> d!117151 (= res!661561 (not lt!438704))))

(declare-fun lt!438705 () Bool)

(assert (=> d!117151 (= lt!438704 lt!438705)))

(declare-fun lt!438702 () Unit!32696)

(declare-fun e!557776 () Unit!32696)

(assert (=> d!117151 (= lt!438702 e!557776)))

(declare-fun c!100268 () Bool)

(assert (=> d!117151 (= c!100268 lt!438705)))

(assert (=> d!117151 (= lt!438705 (containsKey!478 (toList!6842 lt!438512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117151 (= (contains!5690 lt!438512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438704)))

(declare-fun b!989198 () Bool)

(declare-fun lt!438703 () Unit!32696)

(assert (=> b!989198 (= e!557776 lt!438703)))

(assert (=> b!989198 (= lt!438703 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989198 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989199 () Bool)

(declare-fun Unit!32707 () Unit!32696)

(assert (=> b!989199 (= e!557776 Unit!32707)))

(declare-fun b!989200 () Bool)

(assert (=> b!989200 (= e!557775 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117151 c!100268) b!989198))

(assert (= (and d!117151 (not c!100268)) b!989199))

(assert (= (and d!117151 (not res!661561)) b!989200))

(declare-fun m!915867 () Bool)

(assert (=> d!117151 m!915867))

(declare-fun m!915869 () Bool)

(assert (=> b!989198 m!915869))

(declare-fun m!915871 () Bool)

(assert (=> b!989198 m!915871))

(assert (=> b!989198 m!915871))

(declare-fun m!915873 () Bool)

(assert (=> b!989198 m!915873))

(assert (=> b!989200 m!915871))

(assert (=> b!989200 m!915871))

(assert (=> b!989200 m!915873))

(assert (=> d!117083 d!117151))

(assert (=> d!117083 d!117103))

(declare-fun d!117153 () Bool)

(declare-fun e!557777 () Bool)

(assert (=> d!117153 e!557777))

(declare-fun res!661562 () Bool)

(assert (=> d!117153 (=> res!661562 e!557777)))

(declare-fun lt!438708 () Bool)

(assert (=> d!117153 (= res!661562 (not lt!438708))))

(declare-fun lt!438709 () Bool)

(assert (=> d!117153 (= lt!438708 lt!438709)))

(declare-fun lt!438706 () Unit!32696)

(declare-fun e!557778 () Unit!32696)

(assert (=> d!117153 (= lt!438706 e!557778)))

(declare-fun c!100269 () Bool)

(assert (=> d!117153 (= c!100269 lt!438709)))

(assert (=> d!117153 (= lt!438709 (containsKey!478 (toList!6842 lt!438631) (_1!7494 lt!438464)))))

(assert (=> d!117153 (= (contains!5690 lt!438631 (_1!7494 lt!438464)) lt!438708)))

(declare-fun b!989201 () Bool)

(declare-fun lt!438707 () Unit!32696)

(assert (=> b!989201 (= e!557778 lt!438707)))

(assert (=> b!989201 (= lt!438707 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438631) (_1!7494 lt!438464)))))

(assert (=> b!989201 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438631) (_1!7494 lt!438464)))))

(declare-fun b!989202 () Bool)

(declare-fun Unit!32708 () Unit!32696)

(assert (=> b!989202 (= e!557778 Unit!32708)))

(declare-fun b!989203 () Bool)

(assert (=> b!989203 (= e!557777 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438631) (_1!7494 lt!438464))))))

(assert (= (and d!117153 c!100269) b!989201))

(assert (= (and d!117153 (not c!100269)) b!989202))

(assert (= (and d!117153 (not res!661562)) b!989203))

(declare-fun m!915875 () Bool)

(assert (=> d!117153 m!915875))

(declare-fun m!915877 () Bool)

(assert (=> b!989201 m!915877))

(assert (=> b!989201 m!915721))

(assert (=> b!989201 m!915721))

(declare-fun m!915879 () Bool)

(assert (=> b!989201 m!915879))

(assert (=> b!989203 m!915721))

(assert (=> b!989203 m!915721))

(assert (=> b!989203 m!915879))

(assert (=> d!117101 d!117153))

(declare-fun b!989205 () Bool)

(declare-fun e!557779 () Option!522)

(declare-fun e!557780 () Option!522)

(assert (=> b!989205 (= e!557779 e!557780)))

(declare-fun c!100271 () Bool)

(assert (=> b!989205 (= c!100271 (and ((_ is Cons!20846) lt!438634) (not (= (_1!7494 (h!22008 lt!438634)) (_1!7494 lt!438464)))))))

(declare-fun b!989207 () Bool)

(assert (=> b!989207 (= e!557780 None!520)))

(declare-fun b!989206 () Bool)

(assert (=> b!989206 (= e!557780 (getValueByKey!516 (t!29794 lt!438634) (_1!7494 lt!438464)))))

(declare-fun d!117155 () Bool)

(declare-fun c!100270 () Bool)

(assert (=> d!117155 (= c!100270 (and ((_ is Cons!20846) lt!438634) (= (_1!7494 (h!22008 lt!438634)) (_1!7494 lt!438464))))))

(assert (=> d!117155 (= (getValueByKey!516 lt!438634 (_1!7494 lt!438464)) e!557779)))

(declare-fun b!989204 () Bool)

(assert (=> b!989204 (= e!557779 (Some!521 (_2!7494 (h!22008 lt!438634))))))

(assert (= (and d!117155 c!100270) b!989204))

(assert (= (and d!117155 (not c!100270)) b!989205))

(assert (= (and b!989205 c!100271) b!989206))

(assert (= (and b!989205 (not c!100271)) b!989207))

(declare-fun m!915881 () Bool)

(assert (=> b!989206 m!915881))

(assert (=> d!117101 d!117155))

(declare-fun d!117157 () Bool)

(assert (=> d!117157 (= (getValueByKey!516 lt!438634 (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464)))))

(declare-fun lt!438710 () Unit!32696)

(assert (=> d!117157 (= lt!438710 (choose!1620 lt!438634 (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun e!557781 () Bool)

(assert (=> d!117157 e!557781))

(declare-fun res!661563 () Bool)

(assert (=> d!117157 (=> (not res!661563) (not e!557781))))

(assert (=> d!117157 (= res!661563 (isStrictlySorted!512 lt!438634))))

(assert (=> d!117157 (= (lemmaContainsTupThenGetReturnValue!273 lt!438634 (_1!7494 lt!438464) (_2!7494 lt!438464)) lt!438710)))

(declare-fun b!989208 () Bool)

(declare-fun res!661564 () Bool)

(assert (=> b!989208 (=> (not res!661564) (not e!557781))))

(assert (=> b!989208 (= res!661564 (containsKey!478 lt!438634 (_1!7494 lt!438464)))))

(declare-fun b!989209 () Bool)

(assert (=> b!989209 (= e!557781 (contains!5692 lt!438634 (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464))))))

(assert (= (and d!117157 res!661563) b!989208))

(assert (= (and b!989208 res!661564) b!989209))

(assert (=> d!117157 m!915715))

(declare-fun m!915883 () Bool)

(assert (=> d!117157 m!915883))

(declare-fun m!915885 () Bool)

(assert (=> d!117157 m!915885))

(declare-fun m!915887 () Bool)

(assert (=> b!989208 m!915887))

(declare-fun m!915889 () Bool)

(assert (=> b!989209 m!915889))

(assert (=> d!117101 d!117157))

(declare-fun b!989210 () Bool)

(declare-fun e!557784 () Bool)

(declare-fun lt!438711 () List!20850)

(assert (=> b!989210 (= e!557784 (contains!5692 lt!438711 (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464))))))

(declare-fun b!989211 () Bool)

(declare-fun res!661566 () Bool)

(assert (=> b!989211 (=> (not res!661566) (not e!557784))))

(assert (=> b!989211 (= res!661566 (containsKey!478 lt!438711 (_1!7494 lt!438464)))))

(declare-fun b!989212 () Bool)

(declare-fun e!557783 () List!20850)

(declare-fun call!41918 () List!20850)

(assert (=> b!989212 (= e!557783 call!41918)))

(declare-fun e!557786 () List!20850)

(declare-fun b!989213 () Bool)

(declare-fun c!100273 () Bool)

(declare-fun c!100275 () Bool)

(assert (=> b!989213 (= e!557786 (ite c!100275 (t!29794 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100273 (Cons!20846 (h!22008 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29794 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20847)))))

(declare-fun b!989214 () Bool)

(declare-fun e!557785 () List!20850)

(declare-fun call!41919 () List!20850)

(assert (=> b!989214 (= e!557785 call!41919)))

(declare-fun b!989215 () Bool)

(declare-fun e!557782 () List!20850)

(assert (=> b!989215 (= e!557785 e!557782)))

(assert (=> b!989215 (= c!100275 (and ((_ is Cons!20846) (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7494 (h!22008 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7494 lt!438464))))))

(declare-fun b!989216 () Bool)

(declare-fun call!41917 () List!20850)

(assert (=> b!989216 (= e!557782 call!41917)))

(declare-fun d!117159 () Bool)

(assert (=> d!117159 e!557784))

(declare-fun res!661565 () Bool)

(assert (=> d!117159 (=> (not res!661565) (not e!557784))))

(assert (=> d!117159 (= res!661565 (isStrictlySorted!512 lt!438711))))

(assert (=> d!117159 (= lt!438711 e!557785)))

(declare-fun c!100274 () Bool)

(assert (=> d!117159 (= c!100274 (and ((_ is Cons!20846) (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7494 (h!22008 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7494 lt!438464))))))

(assert (=> d!117159 (isStrictlySorted!512 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117159 (= (insertStrictlySorted!330 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7494 lt!438464) (_2!7494 lt!438464)) lt!438711)))

(declare-fun b!989217 () Bool)

(assert (=> b!989217 (= e!557786 (insertStrictlySorted!330 (t!29794 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun b!989218 () Bool)

(assert (=> b!989218 (= e!557783 call!41918)))

(declare-fun bm!41914 () Bool)

(assert (=> bm!41914 (= call!41919 ($colon$colon!556 e!557786 (ite c!100274 (h!22008 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464)))))))

(declare-fun c!100272 () Bool)

(assert (=> bm!41914 (= c!100272 c!100274)))

(declare-fun bm!41915 () Bool)

(assert (=> bm!41915 (= call!41918 call!41917)))

(declare-fun bm!41916 () Bool)

(assert (=> bm!41916 (= call!41917 call!41919)))

(declare-fun b!989219 () Bool)

(assert (=> b!989219 (= c!100273 (and ((_ is Cons!20846) (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7494 (h!22008 (toList!6842 (getCurrentListMap!3819 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7494 lt!438464))))))

(assert (=> b!989219 (= e!557782 e!557783)))

(assert (= (and d!117159 c!100274) b!989214))

(assert (= (and d!117159 (not c!100274)) b!989215))

(assert (= (and b!989215 c!100275) b!989216))

(assert (= (and b!989215 (not c!100275)) b!989219))

(assert (= (and b!989219 c!100273) b!989212))

(assert (= (and b!989219 (not c!100273)) b!989218))

(assert (= (or b!989212 b!989218) bm!41915))

(assert (= (or b!989216 bm!41915) bm!41916))

(assert (= (or b!989214 bm!41916) bm!41914))

(assert (= (and bm!41914 c!100272) b!989217))

(assert (= (and bm!41914 (not c!100272)) b!989213))

(assert (= (and d!117159 res!661565) b!989211))

(assert (= (and b!989211 res!661566) b!989210))

(declare-fun m!915891 () Bool)

(assert (=> b!989217 m!915891))

(declare-fun m!915893 () Bool)

(assert (=> bm!41914 m!915893))

(declare-fun m!915895 () Bool)

(assert (=> b!989211 m!915895))

(declare-fun m!915897 () Bool)

(assert (=> d!117159 m!915897))

(declare-fun m!915899 () Bool)

(assert (=> d!117159 m!915899))

(declare-fun m!915901 () Bool)

(assert (=> b!989210 m!915901))

(assert (=> d!117101 d!117159))

(declare-fun d!117161 () Bool)

(declare-fun get!15617 (Option!522) V!35993)

(assert (=> d!117161 (= (apply!888 lt!438602 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15617 (getValueByKey!516 (toList!6842 lt!438602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28045 () Bool)

(assert (= bs!28045 d!117161))

(declare-fun m!915903 () Bool)

(assert (=> bs!28045 m!915903))

(assert (=> bs!28045 m!915903))

(declare-fun m!915905 () Bool)

(assert (=> bs!28045 m!915905))

(assert (=> b!989039 d!117161))

(declare-fun d!117163 () Bool)

(assert (=> d!117163 (not (contains!5690 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515)) lt!438510))))

(declare-fun lt!438714 () Unit!32696)

(declare-fun choose!1621 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32696)

(assert (=> d!117163 (= lt!438714 (choose!1621 lt!438509 lt!438514 lt!438515 lt!438510))))

(declare-fun e!557789 () Bool)

(assert (=> d!117163 e!557789))

(declare-fun res!661569 () Bool)

(assert (=> d!117163 (=> (not res!661569) (not e!557789))))

(assert (=> d!117163 (= res!661569 (not (contains!5690 lt!438509 lt!438510)))))

(assert (=> d!117163 (= (addStillNotContains!235 lt!438509 lt!438514 lt!438515 lt!438510) lt!438714)))

(declare-fun b!989223 () Bool)

(assert (=> b!989223 (= e!557789 (not (= lt!438514 lt!438510)))))

(assert (= (and d!117163 res!661569) b!989223))

(assert (=> d!117163 m!915541))

(assert (=> d!117163 m!915541))

(assert (=> d!117163 m!915545))

(declare-fun m!915907 () Bool)

(assert (=> d!117163 m!915907))

(declare-fun m!915909 () Bool)

(assert (=> d!117163 m!915909))

(assert (=> b!988926 d!117163))

(declare-fun d!117165 () Bool)

(declare-fun c!100276 () Bool)

(assert (=> d!117165 (= c!100276 ((_ is ValueCellFull!11147) (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!557790 () V!35993)

(assert (=> d!117165 (= (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557790)))

(declare-fun b!989224 () Bool)

(assert (=> b!989224 (= e!557790 (get!15615 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989225 () Bool)

(assert (=> b!989225 (= e!557790 (get!15616 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117165 c!100276) b!989224))

(assert (= (and d!117165 (not c!100276)) b!989225))

(assert (=> b!989224 m!915529))

(assert (=> b!989224 m!915437))

(declare-fun m!915911 () Bool)

(assert (=> b!989224 m!915911))

(assert (=> b!989225 m!915529))

(assert (=> b!989225 m!915437))

(declare-fun m!915913 () Bool)

(assert (=> b!989225 m!915913))

(assert (=> b!988926 d!117165))

(declare-fun d!117167 () Bool)

(declare-fun e!557791 () Bool)

(assert (=> d!117167 e!557791))

(declare-fun res!661570 () Bool)

(assert (=> d!117167 (=> (not res!661570) (not e!557791))))

(declare-fun lt!438715 () ListLongMap!13653)

(assert (=> d!117167 (= res!661570 (contains!5690 lt!438715 (_1!7494 (tuple2!14967 lt!438514 lt!438515))))))

(declare-fun lt!438718 () List!20850)

(assert (=> d!117167 (= lt!438715 (ListLongMap!13654 lt!438718))))

(declare-fun lt!438717 () Unit!32696)

(declare-fun lt!438716 () Unit!32696)

(assert (=> d!117167 (= lt!438717 lt!438716)))

(assert (=> d!117167 (= (getValueByKey!516 lt!438718 (_1!7494 (tuple2!14967 lt!438514 lt!438515))) (Some!521 (_2!7494 (tuple2!14967 lt!438514 lt!438515))))))

(assert (=> d!117167 (= lt!438716 (lemmaContainsTupThenGetReturnValue!273 lt!438718 (_1!7494 (tuple2!14967 lt!438514 lt!438515)) (_2!7494 (tuple2!14967 lt!438514 lt!438515))))))

(assert (=> d!117167 (= lt!438718 (insertStrictlySorted!330 (toList!6842 lt!438509) (_1!7494 (tuple2!14967 lt!438514 lt!438515)) (_2!7494 (tuple2!14967 lt!438514 lt!438515))))))

(assert (=> d!117167 (= (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515)) lt!438715)))

(declare-fun b!989226 () Bool)

(declare-fun res!661571 () Bool)

(assert (=> b!989226 (=> (not res!661571) (not e!557791))))

(assert (=> b!989226 (= res!661571 (= (getValueByKey!516 (toList!6842 lt!438715) (_1!7494 (tuple2!14967 lt!438514 lt!438515))) (Some!521 (_2!7494 (tuple2!14967 lt!438514 lt!438515)))))))

(declare-fun b!989227 () Bool)

(assert (=> b!989227 (= e!557791 (contains!5692 (toList!6842 lt!438715) (tuple2!14967 lt!438514 lt!438515)))))

(assert (= (and d!117167 res!661570) b!989226))

(assert (= (and b!989226 res!661571) b!989227))

(declare-fun m!915915 () Bool)

(assert (=> d!117167 m!915915))

(declare-fun m!915917 () Bool)

(assert (=> d!117167 m!915917))

(declare-fun m!915919 () Bool)

(assert (=> d!117167 m!915919))

(declare-fun m!915921 () Bool)

(assert (=> d!117167 m!915921))

(declare-fun m!915923 () Bool)

(assert (=> b!989226 m!915923))

(declare-fun m!915925 () Bool)

(assert (=> b!989227 m!915925))

(assert (=> b!988926 d!117167))

(declare-fun d!117169 () Bool)

(declare-fun e!557792 () Bool)

(assert (=> d!117169 e!557792))

(declare-fun res!661572 () Bool)

(assert (=> d!117169 (=> res!661572 e!557792)))

(declare-fun lt!438721 () Bool)

(assert (=> d!117169 (= res!661572 (not lt!438721))))

(declare-fun lt!438722 () Bool)

(assert (=> d!117169 (= lt!438721 lt!438722)))

(declare-fun lt!438719 () Unit!32696)

(declare-fun e!557793 () Unit!32696)

(assert (=> d!117169 (= lt!438719 e!557793)))

(declare-fun c!100277 () Bool)

(assert (=> d!117169 (= c!100277 lt!438722)))

(assert (=> d!117169 (= lt!438722 (containsKey!478 (toList!6842 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515))) lt!438510))))

(assert (=> d!117169 (= (contains!5690 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515)) lt!438510) lt!438721)))

(declare-fun b!989228 () Bool)

(declare-fun lt!438720 () Unit!32696)

(assert (=> b!989228 (= e!557793 lt!438720)))

(assert (=> b!989228 (= lt!438720 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515))) lt!438510))))

(assert (=> b!989228 (isDefined!386 (getValueByKey!516 (toList!6842 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515))) lt!438510))))

(declare-fun b!989229 () Bool)

(declare-fun Unit!32709 () Unit!32696)

(assert (=> b!989229 (= e!557793 Unit!32709)))

(declare-fun b!989230 () Bool)

(assert (=> b!989230 (= e!557792 (isDefined!386 (getValueByKey!516 (toList!6842 (+!3111 lt!438509 (tuple2!14967 lt!438514 lt!438515))) lt!438510)))))

(assert (= (and d!117169 c!100277) b!989228))

(assert (= (and d!117169 (not c!100277)) b!989229))

(assert (= (and d!117169 (not res!661572)) b!989230))

(declare-fun m!915927 () Bool)

(assert (=> d!117169 m!915927))

(declare-fun m!915929 () Bool)

(assert (=> b!989228 m!915929))

(declare-fun m!915931 () Bool)

(assert (=> b!989228 m!915931))

(assert (=> b!989228 m!915931))

(declare-fun m!915933 () Bool)

(assert (=> b!989228 m!915933))

(assert (=> b!989230 m!915931))

(assert (=> b!989230 m!915931))

(assert (=> b!989230 m!915933))

(assert (=> b!988926 d!117169))

(declare-fun d!117171 () Bool)

(declare-fun e!557794 () Bool)

(assert (=> d!117171 e!557794))

(declare-fun res!661573 () Bool)

(assert (=> d!117171 (=> (not res!661573) (not e!557794))))

(declare-fun lt!438723 () ListLongMap!13653)

(assert (=> d!117171 (= res!661573 (contains!5690 lt!438723 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!438726 () List!20850)

(assert (=> d!117171 (= lt!438723 (ListLongMap!13654 lt!438726))))

(declare-fun lt!438725 () Unit!32696)

(declare-fun lt!438724 () Unit!32696)

(assert (=> d!117171 (= lt!438725 lt!438724)))

(assert (=> d!117171 (= (getValueByKey!516 lt!438726 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!521 (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117171 (= lt!438724 (lemmaContainsTupThenGetReturnValue!273 lt!438726 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117171 (= lt!438726 (insertStrictlySorted!330 (toList!6842 call!41868) (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117171 (= (+!3111 call!41868 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!438723)))

(declare-fun b!989231 () Bool)

(declare-fun res!661574 () Bool)

(assert (=> b!989231 (=> (not res!661574) (not e!557794))))

(assert (=> b!989231 (= res!661574 (= (getValueByKey!516 (toList!6842 lt!438723) (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!521 (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!989232 () Bool)

(assert (=> b!989232 (= e!557794 (contains!5692 (toList!6842 lt!438723) (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117171 res!661573) b!989231))

(assert (= (and b!989231 res!661574) b!989232))

(declare-fun m!915935 () Bool)

(assert (=> d!117171 m!915935))

(declare-fun m!915937 () Bool)

(assert (=> d!117171 m!915937))

(declare-fun m!915939 () Bool)

(assert (=> d!117171 m!915939))

(declare-fun m!915941 () Bool)

(assert (=> d!117171 m!915941))

(declare-fun m!915943 () Bool)

(assert (=> b!989231 m!915943))

(declare-fun m!915945 () Bool)

(assert (=> b!989232 m!915945))

(assert (=> b!988926 d!117171))

(declare-fun d!117173 () Bool)

(declare-fun e!557795 () Bool)

(assert (=> d!117173 e!557795))

(declare-fun res!661575 () Bool)

(assert (=> d!117173 (=> res!661575 e!557795)))

(declare-fun lt!438729 () Bool)

(assert (=> d!117173 (= res!661575 (not lt!438729))))

(declare-fun lt!438730 () Bool)

(assert (=> d!117173 (= lt!438729 lt!438730)))

(declare-fun lt!438727 () Unit!32696)

(declare-fun e!557796 () Unit!32696)

(assert (=> d!117173 (= lt!438727 e!557796)))

(declare-fun c!100278 () Bool)

(assert (=> d!117173 (= c!100278 lt!438730)))

(assert (=> d!117173 (= lt!438730 (containsKey!478 (toList!6842 lt!438528) (_1!7494 lt!438462)))))

(assert (=> d!117173 (= (contains!5690 lt!438528 (_1!7494 lt!438462)) lt!438729)))

(declare-fun b!989233 () Bool)

(declare-fun lt!438728 () Unit!32696)

(assert (=> b!989233 (= e!557796 lt!438728)))

(assert (=> b!989233 (= lt!438728 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438528) (_1!7494 lt!438462)))))

(assert (=> b!989233 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438528) (_1!7494 lt!438462)))))

(declare-fun b!989234 () Bool)

(declare-fun Unit!32710 () Unit!32696)

(assert (=> b!989234 (= e!557796 Unit!32710)))

(declare-fun b!989235 () Bool)

(assert (=> b!989235 (= e!557795 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438528) (_1!7494 lt!438462))))))

(assert (= (and d!117173 c!100278) b!989233))

(assert (= (and d!117173 (not c!100278)) b!989234))

(assert (= (and d!117173 (not res!661575)) b!989235))

(declare-fun m!915947 () Bool)

(assert (=> d!117173 m!915947))

(declare-fun m!915949 () Bool)

(assert (=> b!989233 m!915949))

(assert (=> b!989233 m!915581))

(assert (=> b!989233 m!915581))

(declare-fun m!915951 () Bool)

(assert (=> b!989233 m!915951))

(assert (=> b!989235 m!915581))

(assert (=> b!989235 m!915581))

(assert (=> b!989235 m!915951))

(assert (=> d!117089 d!117173))

(declare-fun b!989237 () Bool)

(declare-fun e!557797 () Option!522)

(declare-fun e!557798 () Option!522)

(assert (=> b!989237 (= e!557797 e!557798)))

(declare-fun c!100280 () Bool)

(assert (=> b!989237 (= c!100280 (and ((_ is Cons!20846) lt!438531) (not (= (_1!7494 (h!22008 lt!438531)) (_1!7494 lt!438462)))))))

(declare-fun b!989239 () Bool)

(assert (=> b!989239 (= e!557798 None!520)))

(declare-fun b!989238 () Bool)

(assert (=> b!989238 (= e!557798 (getValueByKey!516 (t!29794 lt!438531) (_1!7494 lt!438462)))))

(declare-fun d!117175 () Bool)

(declare-fun c!100279 () Bool)

(assert (=> d!117175 (= c!100279 (and ((_ is Cons!20846) lt!438531) (= (_1!7494 (h!22008 lt!438531)) (_1!7494 lt!438462))))))

(assert (=> d!117175 (= (getValueByKey!516 lt!438531 (_1!7494 lt!438462)) e!557797)))

(declare-fun b!989236 () Bool)

(assert (=> b!989236 (= e!557797 (Some!521 (_2!7494 (h!22008 lt!438531))))))

(assert (= (and d!117175 c!100279) b!989236))

(assert (= (and d!117175 (not c!100279)) b!989237))

(assert (= (and b!989237 c!100280) b!989238))

(assert (= (and b!989237 (not c!100280)) b!989239))

(declare-fun m!915953 () Bool)

(assert (=> b!989238 m!915953))

(assert (=> d!117089 d!117175))

(declare-fun d!117177 () Bool)

(assert (=> d!117177 (= (getValueByKey!516 lt!438531 (_1!7494 lt!438462)) (Some!521 (_2!7494 lt!438462)))))

(declare-fun lt!438731 () Unit!32696)

(assert (=> d!117177 (= lt!438731 (choose!1620 lt!438531 (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(declare-fun e!557799 () Bool)

(assert (=> d!117177 e!557799))

(declare-fun res!661576 () Bool)

(assert (=> d!117177 (=> (not res!661576) (not e!557799))))

(assert (=> d!117177 (= res!661576 (isStrictlySorted!512 lt!438531))))

(assert (=> d!117177 (= (lemmaContainsTupThenGetReturnValue!273 lt!438531 (_1!7494 lt!438462) (_2!7494 lt!438462)) lt!438731)))

(declare-fun b!989240 () Bool)

(declare-fun res!661577 () Bool)

(assert (=> b!989240 (=> (not res!661577) (not e!557799))))

(assert (=> b!989240 (= res!661577 (containsKey!478 lt!438531 (_1!7494 lt!438462)))))

(declare-fun b!989241 () Bool)

(assert (=> b!989241 (= e!557799 (contains!5692 lt!438531 (tuple2!14967 (_1!7494 lt!438462) (_2!7494 lt!438462))))))

(assert (= (and d!117177 res!661576) b!989240))

(assert (= (and b!989240 res!661577) b!989241))

(assert (=> d!117177 m!915575))

(declare-fun m!915955 () Bool)

(assert (=> d!117177 m!915955))

(declare-fun m!915957 () Bool)

(assert (=> d!117177 m!915957))

(declare-fun m!915959 () Bool)

(assert (=> b!989240 m!915959))

(declare-fun m!915961 () Bool)

(assert (=> b!989241 m!915961))

(assert (=> d!117089 d!117177))

(declare-fun b!989242 () Bool)

(declare-fun e!557802 () Bool)

(declare-fun lt!438732 () List!20850)

(assert (=> b!989242 (= e!557802 (contains!5692 lt!438732 (tuple2!14967 (_1!7494 lt!438462) (_2!7494 lt!438462))))))

(declare-fun b!989243 () Bool)

(declare-fun res!661579 () Bool)

(assert (=> b!989243 (=> (not res!661579) (not e!557802))))

(assert (=> b!989243 (= res!661579 (containsKey!478 lt!438732 (_1!7494 lt!438462)))))

(declare-fun b!989244 () Bool)

(declare-fun e!557801 () List!20850)

(declare-fun call!41921 () List!20850)

(assert (=> b!989244 (= e!557801 call!41921)))

(declare-fun b!989245 () Bool)

(declare-fun e!557804 () List!20850)

(declare-fun c!100282 () Bool)

(declare-fun c!100284 () Bool)

(assert (=> b!989245 (= e!557804 (ite c!100284 (t!29794 (toList!6842 lt!438460)) (ite c!100282 (Cons!20846 (h!22008 (toList!6842 lt!438460)) (t!29794 (toList!6842 lt!438460))) Nil!20847)))))

(declare-fun b!989246 () Bool)

(declare-fun e!557803 () List!20850)

(declare-fun call!41922 () List!20850)

(assert (=> b!989246 (= e!557803 call!41922)))

(declare-fun b!989247 () Bool)

(declare-fun e!557800 () List!20850)

(assert (=> b!989247 (= e!557803 e!557800)))

(assert (=> b!989247 (= c!100284 (and ((_ is Cons!20846) (toList!6842 lt!438460)) (= (_1!7494 (h!22008 (toList!6842 lt!438460))) (_1!7494 lt!438462))))))

(declare-fun b!989248 () Bool)

(declare-fun call!41920 () List!20850)

(assert (=> b!989248 (= e!557800 call!41920)))

(declare-fun d!117179 () Bool)

(assert (=> d!117179 e!557802))

(declare-fun res!661578 () Bool)

(assert (=> d!117179 (=> (not res!661578) (not e!557802))))

(assert (=> d!117179 (= res!661578 (isStrictlySorted!512 lt!438732))))

(assert (=> d!117179 (= lt!438732 e!557803)))

(declare-fun c!100283 () Bool)

(assert (=> d!117179 (= c!100283 (and ((_ is Cons!20846) (toList!6842 lt!438460)) (bvslt (_1!7494 (h!22008 (toList!6842 lt!438460))) (_1!7494 lt!438462))))))

(assert (=> d!117179 (isStrictlySorted!512 (toList!6842 lt!438460))))

(assert (=> d!117179 (= (insertStrictlySorted!330 (toList!6842 lt!438460) (_1!7494 lt!438462) (_2!7494 lt!438462)) lt!438732)))

(declare-fun b!989249 () Bool)

(assert (=> b!989249 (= e!557804 (insertStrictlySorted!330 (t!29794 (toList!6842 lt!438460)) (_1!7494 lt!438462) (_2!7494 lt!438462)))))

(declare-fun b!989250 () Bool)

(assert (=> b!989250 (= e!557801 call!41921)))

(declare-fun bm!41917 () Bool)

(assert (=> bm!41917 (= call!41922 ($colon$colon!556 e!557804 (ite c!100283 (h!22008 (toList!6842 lt!438460)) (tuple2!14967 (_1!7494 lt!438462) (_2!7494 lt!438462)))))))

(declare-fun c!100281 () Bool)

(assert (=> bm!41917 (= c!100281 c!100283)))

(declare-fun bm!41918 () Bool)

(assert (=> bm!41918 (= call!41921 call!41920)))

(declare-fun bm!41919 () Bool)

(assert (=> bm!41919 (= call!41920 call!41922)))

(declare-fun b!989251 () Bool)

(assert (=> b!989251 (= c!100282 (and ((_ is Cons!20846) (toList!6842 lt!438460)) (bvsgt (_1!7494 (h!22008 (toList!6842 lt!438460))) (_1!7494 lt!438462))))))

(assert (=> b!989251 (= e!557800 e!557801)))

(assert (= (and d!117179 c!100283) b!989246))

(assert (= (and d!117179 (not c!100283)) b!989247))

(assert (= (and b!989247 c!100284) b!989248))

(assert (= (and b!989247 (not c!100284)) b!989251))

(assert (= (and b!989251 c!100282) b!989244))

(assert (= (and b!989251 (not c!100282)) b!989250))

(assert (= (or b!989244 b!989250) bm!41918))

(assert (= (or b!989248 bm!41918) bm!41919))

(assert (= (or b!989246 bm!41919) bm!41917))

(assert (= (and bm!41917 c!100281) b!989249))

(assert (= (and bm!41917 (not c!100281)) b!989245))

(assert (= (and d!117179 res!661578) b!989243))

(assert (= (and b!989243 res!661579) b!989242))

(declare-fun m!915963 () Bool)

(assert (=> b!989249 m!915963))

(declare-fun m!915965 () Bool)

(assert (=> bm!41917 m!915965))

(declare-fun m!915967 () Bool)

(assert (=> b!989243 m!915967))

(declare-fun m!915969 () Bool)

(assert (=> d!117179 m!915969))

(declare-fun m!915971 () Bool)

(assert (=> d!117179 m!915971))

(declare-fun m!915973 () Bool)

(assert (=> b!989242 m!915973))

(assert (=> d!117089 d!117179))

(assert (=> d!117095 d!117103))

(declare-fun d!117181 () Bool)

(declare-fun e!557805 () Bool)

(assert (=> d!117181 e!557805))

(declare-fun res!661580 () Bool)

(assert (=> d!117181 (=> (not res!661580) (not e!557805))))

(declare-fun lt!438733 () ListLongMap!13653)

(assert (=> d!117181 (= res!661580 (contains!5690 lt!438733 (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438736 () List!20850)

(assert (=> d!117181 (= lt!438733 (ListLongMap!13654 lt!438736))))

(declare-fun lt!438735 () Unit!32696)

(declare-fun lt!438734 () Unit!32696)

(assert (=> d!117181 (= lt!438735 lt!438734)))

(assert (=> d!117181 (= (getValueByKey!516 lt!438736 (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117181 (= lt!438734 (lemmaContainsTupThenGetReturnValue!273 lt!438736 (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117181 (= lt!438736 (insertStrictlySorted!330 (toList!6842 (+!3111 lt!438460 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))) (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117181 (= (+!3111 (+!3111 lt!438460 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438733)))

(declare-fun b!989252 () Bool)

(declare-fun res!661581 () Bool)

(assert (=> b!989252 (=> (not res!661581) (not e!557805))))

(assert (=> b!989252 (= res!661581 (= (getValueByKey!516 (toList!6842 lt!438733) (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!989253 () Bool)

(assert (=> b!989253 (= e!557805 (contains!5692 (toList!6842 lt!438733) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117181 res!661580) b!989252))

(assert (= (and b!989252 res!661581) b!989253))

(declare-fun m!915975 () Bool)

(assert (=> d!117181 m!915975))

(declare-fun m!915977 () Bool)

(assert (=> d!117181 m!915977))

(declare-fun m!915979 () Bool)

(assert (=> d!117181 m!915979))

(declare-fun m!915981 () Bool)

(assert (=> d!117181 m!915981))

(declare-fun m!915983 () Bool)

(assert (=> b!989252 m!915983))

(declare-fun m!915985 () Bool)

(assert (=> b!989253 m!915985))

(assert (=> d!117091 d!117181))

(declare-fun d!117183 () Bool)

(assert (=> d!117183 (= (+!3111 (+!3111 lt!438460 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (+!3111 (+!3111 lt!438460 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (=> d!117183 true))

(declare-fun _$28!188 () Unit!32696)

(assert (=> d!117183 (= (choose!1619 lt!438460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30059 _keys!1544) from!1932) lt!438461) _$28!188)))

(declare-fun bs!28046 () Bool)

(assert (= bs!28046 d!117183))

(assert (=> bs!28046 m!915585))

(assert (=> bs!28046 m!915585))

(assert (=> bs!28046 m!915591))

(assert (=> bs!28046 m!915589))

(assert (=> bs!28046 m!915589))

(assert (=> bs!28046 m!915593))

(assert (=> d!117091 d!117183))

(declare-fun d!117185 () Bool)

(declare-fun e!557806 () Bool)

(assert (=> d!117185 e!557806))

(declare-fun res!661582 () Bool)

(assert (=> d!117185 (=> (not res!661582) (not e!557806))))

(declare-fun lt!438737 () ListLongMap!13653)

(assert (=> d!117185 (= res!661582 (contains!5690 lt!438737 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(declare-fun lt!438740 () List!20850)

(assert (=> d!117185 (= lt!438737 (ListLongMap!13654 lt!438740))))

(declare-fun lt!438739 () Unit!32696)

(declare-fun lt!438738 () Unit!32696)

(assert (=> d!117185 (= lt!438739 lt!438738)))

(assert (=> d!117185 (= (getValueByKey!516 lt!438740 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))) (Some!521 (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(assert (=> d!117185 (= lt!438738 (lemmaContainsTupThenGetReturnValue!273 lt!438740 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(assert (=> d!117185 (= lt!438740 (insertStrictlySorted!330 (toList!6842 lt!438460) (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(assert (=> d!117185 (= (+!3111 lt!438460 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) lt!438737)))

(declare-fun b!989254 () Bool)

(declare-fun res!661583 () Bool)

(assert (=> b!989254 (=> (not res!661583) (not e!557806))))

(assert (=> b!989254 (= res!661583 (= (getValueByKey!516 (toList!6842 lt!438737) (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))) (Some!521 (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)))))))

(declare-fun b!989255 () Bool)

(assert (=> b!989255 (= e!557806 (contains!5692 (toList!6842 lt!438737) (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)))))

(assert (= (and d!117185 res!661582) b!989254))

(assert (= (and b!989254 res!661583) b!989255))

(declare-fun m!915987 () Bool)

(assert (=> d!117185 m!915987))

(declare-fun m!915989 () Bool)

(assert (=> d!117185 m!915989))

(declare-fun m!915991 () Bool)

(assert (=> d!117185 m!915991))

(declare-fun m!915993 () Bool)

(assert (=> d!117185 m!915993))

(declare-fun m!915995 () Bool)

(assert (=> b!989254 m!915995))

(declare-fun m!915997 () Bool)

(assert (=> b!989255 m!915997))

(assert (=> d!117091 d!117185))

(declare-fun d!117187 () Bool)

(declare-fun e!557807 () Bool)

(assert (=> d!117187 e!557807))

(declare-fun res!661584 () Bool)

(assert (=> d!117187 (=> (not res!661584) (not e!557807))))

(declare-fun lt!438741 () ListLongMap!13653)

(assert (=> d!117187 (= res!661584 (contains!5690 lt!438741 (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438744 () List!20850)

(assert (=> d!117187 (= lt!438741 (ListLongMap!13654 lt!438744))))

(declare-fun lt!438743 () Unit!32696)

(declare-fun lt!438742 () Unit!32696)

(assert (=> d!117187 (= lt!438743 lt!438742)))

(assert (=> d!117187 (= (getValueByKey!516 lt!438744 (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117187 (= lt!438742 (lemmaContainsTupThenGetReturnValue!273 lt!438744 (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117187 (= lt!438744 (insertStrictlySorted!330 (toList!6842 lt!438460) (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117187 (= (+!3111 lt!438460 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438741)))

(declare-fun b!989256 () Bool)

(declare-fun res!661585 () Bool)

(assert (=> b!989256 (=> (not res!661585) (not e!557807))))

(assert (=> b!989256 (= res!661585 (= (getValueByKey!516 (toList!6842 lt!438741) (_1!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!989257 () Bool)

(assert (=> b!989257 (= e!557807 (contains!5692 (toList!6842 lt!438741) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117187 res!661584) b!989256))

(assert (= (and b!989256 res!661585) b!989257))

(declare-fun m!915999 () Bool)

(assert (=> d!117187 m!915999))

(declare-fun m!916001 () Bool)

(assert (=> d!117187 m!916001))

(declare-fun m!916003 () Bool)

(assert (=> d!117187 m!916003))

(declare-fun m!916005 () Bool)

(assert (=> d!117187 m!916005))

(declare-fun m!916007 () Bool)

(assert (=> b!989256 m!916007))

(declare-fun m!916009 () Bool)

(assert (=> b!989257 m!916009))

(assert (=> d!117091 d!117187))

(declare-fun d!117189 () Bool)

(declare-fun e!557808 () Bool)

(assert (=> d!117189 e!557808))

(declare-fun res!661586 () Bool)

(assert (=> d!117189 (=> (not res!661586) (not e!557808))))

(declare-fun lt!438745 () ListLongMap!13653)

(assert (=> d!117189 (= res!661586 (contains!5690 lt!438745 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(declare-fun lt!438748 () List!20850)

(assert (=> d!117189 (= lt!438745 (ListLongMap!13654 lt!438748))))

(declare-fun lt!438747 () Unit!32696)

(declare-fun lt!438746 () Unit!32696)

(assert (=> d!117189 (= lt!438747 lt!438746)))

(assert (=> d!117189 (= (getValueByKey!516 lt!438748 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))) (Some!521 (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(assert (=> d!117189 (= lt!438746 (lemmaContainsTupThenGetReturnValue!273 lt!438748 (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(assert (=> d!117189 (= lt!438748 (insertStrictlySorted!330 (toList!6842 (+!3111 lt!438460 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))))))

(assert (=> d!117189 (= (+!3111 (+!3111 lt!438460 (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)) lt!438745)))

(declare-fun b!989258 () Bool)

(declare-fun res!661587 () Bool)

(assert (=> b!989258 (=> (not res!661587) (not e!557808))))

(assert (=> b!989258 (= res!661587 (= (getValueByKey!516 (toList!6842 lt!438745) (_1!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461))) (Some!521 (_2!7494 (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)))))))

(declare-fun b!989259 () Bool)

(assert (=> b!989259 (= e!557808 (contains!5692 (toList!6842 lt!438745) (tuple2!14967 (select (arr!30059 _keys!1544) from!1932) lt!438461)))))

(assert (= (and d!117189 res!661586) b!989258))

(assert (= (and b!989258 res!661587) b!989259))

(declare-fun m!916011 () Bool)

(assert (=> d!117189 m!916011))

(declare-fun m!916013 () Bool)

(assert (=> d!117189 m!916013))

(declare-fun m!916015 () Bool)

(assert (=> d!117189 m!916015))

(declare-fun m!916017 () Bool)

(assert (=> d!117189 m!916017))

(declare-fun m!916019 () Bool)

(assert (=> b!989258 m!916019))

(declare-fun m!916021 () Bool)

(assert (=> b!989259 m!916021))

(assert (=> d!117091 d!117189))

(declare-fun b!989261 () Bool)

(declare-fun e!557809 () Option!522)

(declare-fun e!557810 () Option!522)

(assert (=> b!989261 (= e!557809 e!557810)))

(declare-fun c!100286 () Bool)

(assert (=> b!989261 (= c!100286 (and ((_ is Cons!20846) (toList!6842 lt!438631)) (not (= (_1!7494 (h!22008 (toList!6842 lt!438631))) (_1!7494 lt!438464)))))))

(declare-fun b!989263 () Bool)

(assert (=> b!989263 (= e!557810 None!520)))

(declare-fun b!989262 () Bool)

(assert (=> b!989262 (= e!557810 (getValueByKey!516 (t!29794 (toList!6842 lt!438631)) (_1!7494 lt!438464)))))

(declare-fun d!117191 () Bool)

(declare-fun c!100285 () Bool)

(assert (=> d!117191 (= c!100285 (and ((_ is Cons!20846) (toList!6842 lt!438631)) (= (_1!7494 (h!22008 (toList!6842 lt!438631))) (_1!7494 lt!438464))))))

(assert (=> d!117191 (= (getValueByKey!516 (toList!6842 lt!438631) (_1!7494 lt!438464)) e!557809)))

(declare-fun b!989260 () Bool)

(assert (=> b!989260 (= e!557809 (Some!521 (_2!7494 (h!22008 (toList!6842 lt!438631)))))))

(assert (= (and d!117191 c!100285) b!989260))

(assert (= (and d!117191 (not c!100285)) b!989261))

(assert (= (and b!989261 c!100286) b!989262))

(assert (= (and b!989261 (not c!100286)) b!989263))

(declare-fun m!916023 () Bool)

(assert (=> b!989262 m!916023))

(assert (=> b!989044 d!117191))

(declare-fun d!117193 () Bool)

(declare-fun e!557811 () Bool)

(assert (=> d!117193 e!557811))

(declare-fun res!661588 () Bool)

(assert (=> d!117193 (=> (not res!661588) (not e!557811))))

(declare-fun lt!438749 () ListLongMap!13653)

(assert (=> d!117193 (= res!661588 (contains!5690 lt!438749 (_1!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438752 () List!20850)

(assert (=> d!117193 (= lt!438749 (ListLongMap!13654 lt!438752))))

(declare-fun lt!438751 () Unit!32696)

(declare-fun lt!438750 () Unit!32696)

(assert (=> d!117193 (= lt!438751 lt!438750)))

(assert (=> d!117193 (= (getValueByKey!516 lt!438752 (_1!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!521 (_2!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117193 (= lt!438750 (lemmaContainsTupThenGetReturnValue!273 lt!438752 (_1!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117193 (= lt!438752 (insertStrictlySorted!330 (toList!6842 (ite c!100217 call!41897 (ite c!100218 call!41899 call!41894))) (_1!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117193 (= (+!3111 (ite c!100217 call!41897 (ite c!100218 call!41899 call!41894)) (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438749)))

(declare-fun b!989264 () Bool)

(declare-fun res!661589 () Bool)

(assert (=> b!989264 (=> (not res!661589) (not e!557811))))

(assert (=> b!989264 (= res!661589 (= (getValueByKey!516 (toList!6842 lt!438749) (_1!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!521 (_2!7494 (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!989265 () Bool)

(assert (=> b!989265 (= e!557811 (contains!5692 (toList!6842 lt!438749) (ite (or c!100217 c!100218) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117193 res!661588) b!989264))

(assert (= (and b!989264 res!661589) b!989265))

(declare-fun m!916025 () Bool)

(assert (=> d!117193 m!916025))

(declare-fun m!916027 () Bool)

(assert (=> d!117193 m!916027))

(declare-fun m!916029 () Bool)

(assert (=> d!117193 m!916029))

(declare-fun m!916031 () Bool)

(assert (=> d!117193 m!916031))

(declare-fun m!916033 () Bool)

(assert (=> b!989264 m!916033))

(declare-fun m!916035 () Bool)

(assert (=> b!989265 m!916035))

(assert (=> bm!41891 d!117193))

(declare-fun b!989266 () Bool)

(declare-fun e!557817 () Bool)

(declare-fun e!557814 () Bool)

(assert (=> b!989266 (= e!557817 e!557814)))

(declare-fun c!100290 () Bool)

(assert (=> b!989266 (= c!100290 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(declare-fun lt!438756 () ListLongMap!13653)

(declare-fun b!989267 () Bool)

(assert (=> b!989267 (= e!557814 (= lt!438756 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989268 () Bool)

(declare-fun e!557818 () Bool)

(assert (=> b!989268 (= e!557817 e!557818)))

(assert (=> b!989268 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(declare-fun res!661592 () Bool)

(assert (=> b!989268 (= res!661592 (contains!5690 lt!438756 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!989268 (=> (not res!661592) (not e!557818))))

(declare-fun d!117195 () Bool)

(declare-fun e!557816 () Bool)

(assert (=> d!117195 e!557816))

(declare-fun res!661593 () Bool)

(assert (=> d!117195 (=> (not res!661593) (not e!557816))))

(assert (=> d!117195 (= res!661593 (not (contains!5690 lt!438756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557812 () ListLongMap!13653)

(assert (=> d!117195 (= lt!438756 e!557812)))

(declare-fun c!100288 () Bool)

(assert (=> d!117195 (= c!100288 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(assert (=> d!117195 (validMask!0 mask!1948)))

(assert (=> d!117195 (= (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!438756)))

(declare-fun b!989269 () Bool)

(declare-fun res!661590 () Bool)

(assert (=> b!989269 (=> (not res!661590) (not e!557816))))

(assert (=> b!989269 (= res!661590 (not (contains!5690 lt!438756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!41920 () Bool)

(declare-fun call!41923 () ListLongMap!13653)

(assert (=> bm!41920 (= call!41923 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989270 () Bool)

(assert (=> b!989270 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(assert (=> b!989270 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30539 _values!1278)))))

(assert (=> b!989270 (= e!557818 (= (apply!888 lt!438756 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989271 () Bool)

(declare-fun lt!438757 () Unit!32696)

(declare-fun lt!438755 () Unit!32696)

(assert (=> b!989271 (= lt!438757 lt!438755)))

(declare-fun lt!438753 () ListLongMap!13653)

(declare-fun lt!438758 () (_ BitVec 64))

(declare-fun lt!438759 () V!35993)

(declare-fun lt!438754 () (_ BitVec 64))

(assert (=> b!989271 (not (contains!5690 (+!3111 lt!438753 (tuple2!14967 lt!438758 lt!438759)) lt!438754))))

(assert (=> b!989271 (= lt!438755 (addStillNotContains!235 lt!438753 lt!438758 lt!438759 lt!438754))))

(assert (=> b!989271 (= lt!438754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989271 (= lt!438759 (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989271 (= lt!438758 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!989271 (= lt!438753 call!41923)))

(declare-fun e!557813 () ListLongMap!13653)

(assert (=> b!989271 (= e!557813 (+!3111 call!41923 (tuple2!14967 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15613 (select (arr!30058 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989272 () Bool)

(assert (=> b!989272 (= e!557816 e!557817)))

(declare-fun c!100289 () Bool)

(declare-fun e!557815 () Bool)

(assert (=> b!989272 (= c!100289 e!557815)))

(declare-fun res!661591 () Bool)

(assert (=> b!989272 (=> (not res!661591) (not e!557815))))

(assert (=> b!989272 (= res!661591 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(declare-fun b!989273 () Bool)

(assert (=> b!989273 (= e!557812 (ListLongMap!13654 Nil!20847))))

(declare-fun b!989274 () Bool)

(assert (=> b!989274 (= e!557815 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!989274 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!989275 () Bool)

(assert (=> b!989275 (= e!557812 e!557813)))

(declare-fun c!100287 () Bool)

(assert (=> b!989275 (= c!100287 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun b!989276 () Bool)

(assert (=> b!989276 (= e!557814 (isEmpty!728 lt!438756))))

(declare-fun b!989277 () Bool)

(assert (=> b!989277 (= e!557813 call!41923)))

(assert (= (and d!117195 c!100288) b!989273))

(assert (= (and d!117195 (not c!100288)) b!989275))

(assert (= (and b!989275 c!100287) b!989271))

(assert (= (and b!989275 (not c!100287)) b!989277))

(assert (= (or b!989271 b!989277) bm!41920))

(assert (= (and d!117195 res!661593) b!989269))

(assert (= (and b!989269 res!661590) b!989272))

(assert (= (and b!989272 res!661591) b!989274))

(assert (= (and b!989272 c!100289) b!989268))

(assert (= (and b!989272 (not c!100289)) b!989266))

(assert (= (and b!989268 res!661592) b!989270))

(assert (= (and b!989266 c!100290) b!989267))

(assert (= (and b!989266 (not c!100290)) b!989276))

(declare-fun b_lambda!15107 () Bool)

(assert (=> (not b_lambda!15107) (not b!989270)))

(assert (=> b!989270 t!29793))

(declare-fun b_and!32149 () Bool)

(assert (= b_and!32147 (and (=> t!29793 result!13595) b_and!32149)))

(declare-fun b_lambda!15109 () Bool)

(assert (=> (not b_lambda!15109) (not b!989271)))

(assert (=> b!989271 t!29793))

(declare-fun b_and!32151 () Bool)

(assert (= b_and!32149 (and (=> t!29793 result!13595) b_and!32151)))

(declare-fun m!916037 () Bool)

(assert (=> b!989270 m!916037))

(declare-fun m!916039 () Bool)

(assert (=> b!989270 m!916039))

(assert (=> b!989270 m!916037))

(assert (=> b!989270 m!915437))

(declare-fun m!916041 () Bool)

(assert (=> b!989270 m!916041))

(assert (=> b!989270 m!915437))

(declare-fun m!916043 () Bool)

(assert (=> b!989270 m!916043))

(assert (=> b!989270 m!916041))

(assert (=> b!989275 m!916037))

(assert (=> b!989275 m!916037))

(declare-fun m!916045 () Bool)

(assert (=> b!989275 m!916045))

(assert (=> b!989274 m!916037))

(assert (=> b!989274 m!916037))

(assert (=> b!989274 m!916045))

(declare-fun m!916047 () Bool)

(assert (=> d!117195 m!916047))

(assert (=> d!117195 m!915405))

(declare-fun m!916049 () Bool)

(assert (=> bm!41920 m!916049))

(assert (=> b!989267 m!916049))

(assert (=> b!989271 m!916037))

(declare-fun m!916051 () Bool)

(assert (=> b!989271 m!916051))

(assert (=> b!989271 m!916041))

(assert (=> b!989271 m!915437))

(assert (=> b!989271 m!916043))

(declare-fun m!916053 () Bool)

(assert (=> b!989271 m!916053))

(assert (=> b!989271 m!916041))

(declare-fun m!916055 () Bool)

(assert (=> b!989271 m!916055))

(assert (=> b!989271 m!915437))

(assert (=> b!989271 m!916053))

(declare-fun m!916057 () Bool)

(assert (=> b!989271 m!916057))

(declare-fun m!916059 () Bool)

(assert (=> b!989276 m!916059))

(declare-fun m!916061 () Bool)

(assert (=> b!989269 m!916061))

(assert (=> b!989268 m!916037))

(assert (=> b!989268 m!916037))

(declare-fun m!916063 () Bool)

(assert (=> b!989268 m!916063))

(assert (=> bm!41865 d!117195))

(declare-fun b!989279 () Bool)

(declare-fun e!557819 () Option!522)

(declare-fun e!557820 () Option!522)

(assert (=> b!989279 (= e!557819 e!557820)))

(declare-fun c!100292 () Bool)

(assert (=> b!989279 (= c!100292 (and ((_ is Cons!20846) (toList!6842 lt!438623)) (not (= (_1!7494 (h!22008 (toList!6842 lt!438623))) (_1!7494 lt!438464)))))))

(declare-fun b!989281 () Bool)

(assert (=> b!989281 (= e!557820 None!520)))

(declare-fun b!989280 () Bool)

(assert (=> b!989280 (= e!557820 (getValueByKey!516 (t!29794 (toList!6842 lt!438623)) (_1!7494 lt!438464)))))

(declare-fun d!117197 () Bool)

(declare-fun c!100291 () Bool)

(assert (=> d!117197 (= c!100291 (and ((_ is Cons!20846) (toList!6842 lt!438623)) (= (_1!7494 (h!22008 (toList!6842 lt!438623))) (_1!7494 lt!438464))))))

(assert (=> d!117197 (= (getValueByKey!516 (toList!6842 lt!438623) (_1!7494 lt!438464)) e!557819)))

(declare-fun b!989278 () Bool)

(assert (=> b!989278 (= e!557819 (Some!521 (_2!7494 (h!22008 (toList!6842 lt!438623)))))))

(assert (= (and d!117197 c!100291) b!989278))

(assert (= (and d!117197 (not c!100291)) b!989279))

(assert (= (and b!989279 c!100292) b!989280))

(assert (= (and b!989279 (not c!100292)) b!989281))

(declare-fun m!916065 () Bool)

(assert (=> b!989280 m!916065))

(assert (=> b!989040 d!117197))

(declare-fun d!117199 () Bool)

(declare-fun e!557821 () Bool)

(assert (=> d!117199 e!557821))

(declare-fun res!661594 () Bool)

(assert (=> d!117199 (=> res!661594 e!557821)))

(declare-fun lt!438762 () Bool)

(assert (=> d!117199 (= res!661594 (not lt!438762))))

(declare-fun lt!438763 () Bool)

(assert (=> d!117199 (= lt!438762 lt!438763)))

(declare-fun lt!438760 () Unit!32696)

(declare-fun e!557822 () Unit!32696)

(assert (=> d!117199 (= lt!438760 e!557822)))

(declare-fun c!100293 () Bool)

(assert (=> d!117199 (= c!100293 lt!438763)))

(assert (=> d!117199 (= lt!438763 (containsKey!478 (toList!6842 lt!438602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117199 (= (contains!5690 lt!438602 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438762)))

(declare-fun b!989282 () Bool)

(declare-fun lt!438761 () Unit!32696)

(assert (=> b!989282 (= e!557822 lt!438761)))

(assert (=> b!989282 (= lt!438761 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989282 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989283 () Bool)

(declare-fun Unit!32711 () Unit!32696)

(assert (=> b!989283 (= e!557822 Unit!32711)))

(declare-fun b!989284 () Bool)

(assert (=> b!989284 (= e!557821 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117199 c!100293) b!989282))

(assert (= (and d!117199 (not c!100293)) b!989283))

(assert (= (and d!117199 (not res!661594)) b!989284))

(declare-fun m!916067 () Bool)

(assert (=> d!117199 m!916067))

(declare-fun m!916069 () Bool)

(assert (=> b!989282 m!916069))

(assert (=> b!989282 m!915903))

(assert (=> b!989282 m!915903))

(declare-fun m!916071 () Bool)

(assert (=> b!989282 m!916071))

(assert (=> b!989284 m!915903))

(assert (=> b!989284 m!915903))

(assert (=> b!989284 m!916071))

(assert (=> bm!41890 d!117199))

(declare-fun d!117201 () Bool)

(assert (=> d!117201 (= (apply!888 lt!438602 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15617 (getValueByKey!516 (toList!6842 lt!438602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28047 () Bool)

(assert (= bs!28047 d!117201))

(declare-fun m!916073 () Bool)

(assert (=> bs!28047 m!916073))

(assert (=> bs!28047 m!916073))

(declare-fun m!916075 () Bool)

(assert (=> bs!28047 m!916075))

(assert (=> b!989021 d!117201))

(assert (=> b!989008 d!117079))

(declare-fun b!989286 () Bool)

(declare-fun e!557823 () Option!522)

(declare-fun e!557824 () Option!522)

(assert (=> b!989286 (= e!557823 e!557824)))

(declare-fun c!100295 () Bool)

(assert (=> b!989286 (= c!100295 (and ((_ is Cons!20846) (toList!6842 lt!438627)) (not (= (_1!7494 (h!22008 (toList!6842 lt!438627))) (_1!7494 lt!438462)))))))

(declare-fun b!989288 () Bool)

(assert (=> b!989288 (= e!557824 None!520)))

(declare-fun b!989287 () Bool)

(assert (=> b!989287 (= e!557824 (getValueByKey!516 (t!29794 (toList!6842 lt!438627)) (_1!7494 lt!438462)))))

(declare-fun d!117203 () Bool)

(declare-fun c!100294 () Bool)

(assert (=> d!117203 (= c!100294 (and ((_ is Cons!20846) (toList!6842 lt!438627)) (= (_1!7494 (h!22008 (toList!6842 lt!438627))) (_1!7494 lt!438462))))))

(assert (=> d!117203 (= (getValueByKey!516 (toList!6842 lt!438627) (_1!7494 lt!438462)) e!557823)))

(declare-fun b!989285 () Bool)

(assert (=> b!989285 (= e!557823 (Some!521 (_2!7494 (h!22008 (toList!6842 lt!438627)))))))

(assert (= (and d!117203 c!100294) b!989285))

(assert (= (and d!117203 (not c!100294)) b!989286))

(assert (= (and b!989286 c!100295) b!989287))

(assert (= (and b!989286 (not c!100295)) b!989288))

(declare-fun m!916077 () Bool)

(assert (=> b!989287 m!916077))

(assert (=> b!989042 d!117203))

(declare-fun b!989290 () Bool)

(declare-fun e!557825 () Option!522)

(declare-fun e!557826 () Option!522)

(assert (=> b!989290 (= e!557825 e!557826)))

(declare-fun c!100297 () Bool)

(assert (=> b!989290 (= c!100297 (and ((_ is Cons!20846) (toList!6842 lt!438524)) (not (= (_1!7494 (h!22008 (toList!6842 lt!438524))) (_1!7494 lt!438464)))))))

(declare-fun b!989292 () Bool)

(assert (=> b!989292 (= e!557826 None!520)))

(declare-fun b!989291 () Bool)

(assert (=> b!989291 (= e!557826 (getValueByKey!516 (t!29794 (toList!6842 lt!438524)) (_1!7494 lt!438464)))))

(declare-fun d!117205 () Bool)

(declare-fun c!100296 () Bool)

(assert (=> d!117205 (= c!100296 (and ((_ is Cons!20846) (toList!6842 lt!438524)) (= (_1!7494 (h!22008 (toList!6842 lt!438524))) (_1!7494 lt!438464))))))

(assert (=> d!117205 (= (getValueByKey!516 (toList!6842 lt!438524) (_1!7494 lt!438464)) e!557825)))

(declare-fun b!989289 () Bool)

(assert (=> b!989289 (= e!557825 (Some!521 (_2!7494 (h!22008 (toList!6842 lt!438524)))))))

(assert (= (and d!117205 c!100296) b!989289))

(assert (= (and d!117205 (not c!100296)) b!989290))

(assert (= (and b!989290 c!100297) b!989291))

(assert (= (and b!989290 (not c!100297)) b!989292))

(declare-fun m!916079 () Bool)

(assert (=> b!989291 m!916079))

(assert (=> b!988952 d!117205))

(declare-fun d!117207 () Bool)

(declare-fun e!557827 () Bool)

(assert (=> d!117207 e!557827))

(declare-fun res!661595 () Bool)

(assert (=> d!117207 (=> res!661595 e!557827)))

(declare-fun lt!438766 () Bool)

(assert (=> d!117207 (= res!661595 (not lt!438766))))

(declare-fun lt!438767 () Bool)

(assert (=> d!117207 (= lt!438766 lt!438767)))

(declare-fun lt!438764 () Unit!32696)

(declare-fun e!557828 () Unit!32696)

(assert (=> d!117207 (= lt!438764 e!557828)))

(declare-fun c!100298 () Bool)

(assert (=> d!117207 (= c!100298 lt!438767)))

(assert (=> d!117207 (= lt!438767 (containsKey!478 (toList!6842 lt!438580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117207 (= (contains!5690 lt!438580 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438766)))

(declare-fun b!989293 () Bool)

(declare-fun lt!438765 () Unit!32696)

(assert (=> b!989293 (= e!557828 lt!438765)))

(assert (=> b!989293 (= lt!438765 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989293 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989294 () Bool)

(declare-fun Unit!32712 () Unit!32696)

(assert (=> b!989294 (= e!557828 Unit!32712)))

(declare-fun b!989295 () Bool)

(assert (=> b!989295 (= e!557827 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117207 c!100298) b!989293))

(assert (= (and d!117207 (not c!100298)) b!989294))

(assert (= (and d!117207 (not res!661595)) b!989295))

(declare-fun m!916081 () Bool)

(assert (=> d!117207 m!916081))

(declare-fun m!916083 () Bool)

(assert (=> b!989293 m!916083))

(declare-fun m!916085 () Bool)

(assert (=> b!989293 m!916085))

(assert (=> b!989293 m!916085))

(declare-fun m!916087 () Bool)

(assert (=> b!989293 m!916087))

(assert (=> b!989295 m!916085))

(assert (=> b!989295 m!916085))

(assert (=> b!989295 m!916087))

(assert (=> bm!41883 d!117207))

(declare-fun d!117209 () Bool)

(assert (=> d!117209 (= (apply!888 lt!438602 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15617 (getValueByKey!516 (toList!6842 lt!438602) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28048 () Bool)

(assert (= bs!28048 d!117209))

(assert (=> bs!28048 m!915525))

(declare-fun m!916089 () Bool)

(assert (=> bs!28048 m!916089))

(assert (=> bs!28048 m!916089))

(declare-fun m!916091 () Bool)

(assert (=> bs!28048 m!916091))

(assert (=> b!989023 d!117209))

(assert (=> b!989023 d!117165))

(assert (=> d!117093 d!117103))

(assert (=> b!988930 d!117135))

(declare-fun d!117211 () Bool)

(declare-fun e!557829 () Bool)

(assert (=> d!117211 e!557829))

(declare-fun res!661596 () Bool)

(assert (=> d!117211 (=> (not res!661596) (not e!557829))))

(declare-fun lt!438768 () ListLongMap!13653)

(assert (=> d!117211 (= res!661596 (contains!5690 lt!438768 (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438771 () List!20850)

(assert (=> d!117211 (= lt!438768 (ListLongMap!13654 lt!438771))))

(declare-fun lt!438770 () Unit!32696)

(declare-fun lt!438769 () Unit!32696)

(assert (=> d!117211 (= lt!438770 lt!438769)))

(assert (=> d!117211 (= (getValueByKey!516 lt!438771 (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117211 (= lt!438769 (lemmaContainsTupThenGetReturnValue!273 lt!438771 (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117211 (= lt!438771 (insertStrictlySorted!330 (toList!6842 call!41898) (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117211 (= (+!3111 call!41898 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438768)))

(declare-fun b!989296 () Bool)

(declare-fun res!661597 () Bool)

(assert (=> b!989296 (=> (not res!661597) (not e!557829))))

(assert (=> b!989296 (= res!661597 (= (getValueByKey!516 (toList!6842 lt!438768) (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989297 () Bool)

(assert (=> b!989297 (= e!557829 (contains!5692 (toList!6842 lt!438768) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117211 res!661596) b!989296))

(assert (= (and b!989296 res!661597) b!989297))

(declare-fun m!916093 () Bool)

(assert (=> d!117211 m!916093))

(declare-fun m!916095 () Bool)

(assert (=> d!117211 m!916095))

(declare-fun m!916097 () Bool)

(assert (=> d!117211 m!916097))

(declare-fun m!916099 () Bool)

(assert (=> d!117211 m!916099))

(declare-fun m!916101 () Bool)

(assert (=> b!989296 m!916101))

(declare-fun m!916103 () Bool)

(assert (=> b!989297 m!916103))

(assert (=> b!989030 d!117211))

(declare-fun d!117213 () Bool)

(assert (=> d!117213 (= (apply!888 lt!438580 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15617 (getValueByKey!516 (toList!6842 lt!438580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28049 () Bool)

(assert (= bs!28049 d!117213))

(assert (=> bs!28049 m!916085))

(assert (=> bs!28049 m!916085))

(declare-fun m!916105 () Bool)

(assert (=> bs!28049 m!916105))

(assert (=> b!989018 d!117213))

(declare-fun d!117215 () Bool)

(declare-fun e!557830 () Bool)

(assert (=> d!117215 e!557830))

(declare-fun res!661598 () Bool)

(assert (=> d!117215 (=> (not res!661598) (not e!557830))))

(declare-fun lt!438772 () ListLongMap!13653)

(assert (=> d!117215 (= res!661598 (contains!5690 lt!438772 (_1!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438775 () List!20850)

(assert (=> d!117215 (= lt!438772 (ListLongMap!13654 lt!438775))))

(declare-fun lt!438774 () Unit!32696)

(declare-fun lt!438773 () Unit!32696)

(assert (=> d!117215 (= lt!438774 lt!438773)))

(assert (=> d!117215 (= (getValueByKey!516 lt!438775 (_1!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!521 (_2!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117215 (= lt!438773 (lemmaContainsTupThenGetReturnValue!273 lt!438775 (_1!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117215 (= lt!438775 (insertStrictlySorted!330 (toList!6842 (ite c!100211 call!41890 (ite c!100212 call!41892 call!41887))) (_1!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117215 (= (+!3111 (ite c!100211 call!41890 (ite c!100212 call!41892 call!41887)) (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438772)))

(declare-fun b!989298 () Bool)

(declare-fun res!661599 () Bool)

(assert (=> b!989298 (=> (not res!661599) (not e!557830))))

(assert (=> b!989298 (= res!661599 (= (getValueByKey!516 (toList!6842 lt!438772) (_1!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!521 (_2!7494 (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!989299 () Bool)

(assert (=> b!989299 (= e!557830 (contains!5692 (toList!6842 lt!438772) (ite (or c!100211 c!100212) (tuple2!14967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117215 res!661598) b!989298))

(assert (= (and b!989298 res!661599) b!989299))

(declare-fun m!916107 () Bool)

(assert (=> d!117215 m!916107))

(declare-fun m!916109 () Bool)

(assert (=> d!117215 m!916109))

(declare-fun m!916111 () Bool)

(assert (=> d!117215 m!916111))

(declare-fun m!916113 () Bool)

(assert (=> d!117215 m!916113))

(declare-fun m!916115 () Bool)

(assert (=> b!989298 m!916115))

(declare-fun m!916117 () Bool)

(assert (=> b!989299 m!916117))

(assert (=> bm!41884 d!117215))

(declare-fun d!117217 () Bool)

(declare-fun lt!438778 () Bool)

(declare-fun content!419 (List!20851) (InoxSet (_ BitVec 64)))

(assert (=> d!117217 (= lt!438778 (select (content!419 Nil!20848) (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!557836 () Bool)

(assert (=> d!117217 (= lt!438778 e!557836)))

(declare-fun res!661605 () Bool)

(assert (=> d!117217 (=> (not res!661605) (not e!557836))))

(assert (=> d!117217 (= res!661605 ((_ is Cons!20847) Nil!20848))))

(assert (=> d!117217 (= (contains!5691 Nil!20848 (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)) lt!438778)))

(declare-fun b!989304 () Bool)

(declare-fun e!557835 () Bool)

(assert (=> b!989304 (= e!557836 e!557835)))

(declare-fun res!661604 () Bool)

(assert (=> b!989304 (=> res!661604 e!557835)))

(assert (=> b!989304 (= res!661604 (= (h!22009 Nil!20848) (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989305 () Bool)

(assert (=> b!989305 (= e!557835 (contains!5691 (t!29795 Nil!20848) (select (arr!30059 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117217 res!661605) b!989304))

(assert (= (and b!989304 (not res!661604)) b!989305))

(declare-fun m!916119 () Bool)

(assert (=> d!117217 m!916119))

(assert (=> d!117217 m!915553))

(declare-fun m!916121 () Bool)

(assert (=> d!117217 m!916121))

(assert (=> b!989305 m!915553))

(declare-fun m!916123 () Bool)

(assert (=> b!989305 m!916123))

(assert (=> b!988947 d!117217))

(declare-fun d!117219 () Bool)

(assert (=> d!117219 (= (get!15615 (select (arr!30058 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14245 (select (arr!30058 _values!1278) from!1932)))))

(assert (=> b!988895 d!117219))

(declare-fun b!989307 () Bool)

(declare-fun e!557837 () Option!522)

(declare-fun e!557838 () Option!522)

(assert (=> b!989307 (= e!557837 e!557838)))

(declare-fun c!100300 () Bool)

(assert (=> b!989307 (= c!100300 (and ((_ is Cons!20846) (toList!6842 lt!438528)) (not (= (_1!7494 (h!22008 (toList!6842 lt!438528))) (_1!7494 lt!438462)))))))

(declare-fun b!989309 () Bool)

(assert (=> b!989309 (= e!557838 None!520)))

(declare-fun b!989308 () Bool)

(assert (=> b!989308 (= e!557838 (getValueByKey!516 (t!29794 (toList!6842 lt!438528)) (_1!7494 lt!438462)))))

(declare-fun d!117221 () Bool)

(declare-fun c!100299 () Bool)

(assert (=> d!117221 (= c!100299 (and ((_ is Cons!20846) (toList!6842 lt!438528)) (= (_1!7494 (h!22008 (toList!6842 lt!438528))) (_1!7494 lt!438462))))))

(assert (=> d!117221 (= (getValueByKey!516 (toList!6842 lt!438528) (_1!7494 lt!438462)) e!557837)))

(declare-fun b!989306 () Bool)

(assert (=> b!989306 (= e!557837 (Some!521 (_2!7494 (h!22008 (toList!6842 lt!438528)))))))

(assert (= (and d!117221 c!100299) b!989306))

(assert (= (and d!117221 (not c!100299)) b!989307))

(assert (= (and b!989307 c!100300) b!989308))

(assert (= (and b!989307 (not c!100300)) b!989309))

(declare-fun m!916125 () Bool)

(assert (=> b!989308 m!916125))

(assert (=> b!988954 d!117221))

(declare-fun d!117223 () Bool)

(assert (=> d!117223 (= (apply!888 lt!438580 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15617 (getValueByKey!516 (toList!6842 lt!438580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28050 () Bool)

(assert (= bs!28050 d!117223))

(assert (=> bs!28050 m!915767))

(assert (=> bs!28050 m!915767))

(declare-fun m!916127 () Bool)

(assert (=> bs!28050 m!916127))

(assert (=> b!989000 d!117223))

(assert (=> b!988922 d!117195))

(declare-fun d!117225 () Bool)

(declare-fun e!557839 () Bool)

(assert (=> d!117225 e!557839))

(declare-fun res!661606 () Bool)

(assert (=> d!117225 (=> res!661606 e!557839)))

(declare-fun lt!438781 () Bool)

(assert (=> d!117225 (= res!661606 (not lt!438781))))

(declare-fun lt!438782 () Bool)

(assert (=> d!117225 (= lt!438781 lt!438782)))

(declare-fun lt!438779 () Unit!32696)

(declare-fun e!557840 () Unit!32696)

(assert (=> d!117225 (= lt!438779 e!557840)))

(declare-fun c!100301 () Bool)

(assert (=> d!117225 (= c!100301 lt!438782)))

(assert (=> d!117225 (= lt!438782 (containsKey!478 (toList!6842 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220))) lt!438608))))

(assert (=> d!117225 (= (contains!5690 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220)) lt!438608) lt!438781)))

(declare-fun b!989310 () Bool)

(declare-fun lt!438780 () Unit!32696)

(assert (=> b!989310 (= e!557840 lt!438780)))

(assert (=> b!989310 (= lt!438780 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220))) lt!438608))))

(assert (=> b!989310 (isDefined!386 (getValueByKey!516 (toList!6842 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220))) lt!438608))))

(declare-fun b!989311 () Bool)

(declare-fun Unit!32713 () Unit!32696)

(assert (=> b!989311 (= e!557840 Unit!32713)))

(declare-fun b!989312 () Bool)

(assert (=> b!989312 (= e!557839 (isDefined!386 (getValueByKey!516 (toList!6842 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220))) lt!438608)))))

(assert (= (and d!117225 c!100301) b!989310))

(assert (= (and d!117225 (not c!100301)) b!989311))

(assert (= (and d!117225 (not res!661606)) b!989312))

(declare-fun m!916129 () Bool)

(assert (=> d!117225 m!916129))

(declare-fun m!916131 () Bool)

(assert (=> b!989310 m!916131))

(declare-fun m!916133 () Bool)

(assert (=> b!989310 m!916133))

(assert (=> b!989310 m!916133))

(declare-fun m!916135 () Bool)

(assert (=> b!989310 m!916135))

(assert (=> b!989312 m!916133))

(assert (=> b!989312 m!916133))

(assert (=> b!989312 m!916135))

(assert (=> b!989035 d!117225))

(declare-fun d!117227 () Bool)

(assert (=> d!117227 (= (apply!888 lt!438617 lt!438620) (get!15617 (getValueByKey!516 (toList!6842 lt!438617) lt!438620)))))

(declare-fun bs!28051 () Bool)

(assert (= bs!28051 d!117227))

(declare-fun m!916137 () Bool)

(assert (=> bs!28051 m!916137))

(assert (=> bs!28051 m!916137))

(declare-fun m!916139 () Bool)

(assert (=> bs!28051 m!916139))

(assert (=> b!989035 d!117227))

(declare-fun d!117229 () Bool)

(declare-fun e!557841 () Bool)

(assert (=> d!117229 e!557841))

(declare-fun res!661607 () Bool)

(assert (=> d!117229 (=> (not res!661607) (not e!557841))))

(declare-fun lt!438783 () ListLongMap!13653)

(assert (=> d!117229 (= res!661607 (contains!5690 lt!438783 (_1!7494 (tuple2!14967 lt!438622 zeroValue!1220))))))

(declare-fun lt!438786 () List!20850)

(assert (=> d!117229 (= lt!438783 (ListLongMap!13654 lt!438786))))

(declare-fun lt!438785 () Unit!32696)

(declare-fun lt!438784 () Unit!32696)

(assert (=> d!117229 (= lt!438785 lt!438784)))

(assert (=> d!117229 (= (getValueByKey!516 lt!438786 (_1!7494 (tuple2!14967 lt!438622 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438622 zeroValue!1220))))))

(assert (=> d!117229 (= lt!438784 (lemmaContainsTupThenGetReturnValue!273 lt!438786 (_1!7494 (tuple2!14967 lt!438622 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438622 zeroValue!1220))))))

(assert (=> d!117229 (= lt!438786 (insertStrictlySorted!330 (toList!6842 lt!438615) (_1!7494 (tuple2!14967 lt!438622 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438622 zeroValue!1220))))))

(assert (=> d!117229 (= (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220)) lt!438783)))

(declare-fun b!989313 () Bool)

(declare-fun res!661608 () Bool)

(assert (=> b!989313 (=> (not res!661608) (not e!557841))))

(assert (=> b!989313 (= res!661608 (= (getValueByKey!516 (toList!6842 lt!438783) (_1!7494 (tuple2!14967 lt!438622 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438622 zeroValue!1220)))))))

(declare-fun b!989314 () Bool)

(assert (=> b!989314 (= e!557841 (contains!5692 (toList!6842 lt!438783) (tuple2!14967 lt!438622 zeroValue!1220)))))

(assert (= (and d!117229 res!661607) b!989313))

(assert (= (and b!989313 res!661608) b!989314))

(declare-fun m!916141 () Bool)

(assert (=> d!117229 m!916141))

(declare-fun m!916143 () Bool)

(assert (=> d!117229 m!916143))

(declare-fun m!916145 () Bool)

(assert (=> d!117229 m!916145))

(declare-fun m!916147 () Bool)

(assert (=> d!117229 m!916147))

(declare-fun m!916149 () Bool)

(assert (=> b!989313 m!916149))

(declare-fun m!916151 () Bool)

(assert (=> b!989314 m!916151))

(assert (=> b!989035 d!117229))

(declare-fun d!117231 () Bool)

(assert (=> d!117231 (contains!5690 (+!3111 lt!438615 (tuple2!14967 lt!438622 zeroValue!1220)) lt!438608)))

(declare-fun lt!438789 () Unit!32696)

(declare-fun choose!1622 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32696)

(assert (=> d!117231 (= lt!438789 (choose!1622 lt!438615 lt!438622 zeroValue!1220 lt!438608))))

(assert (=> d!117231 (contains!5690 lt!438615 lt!438608)))

(assert (=> d!117231 (= (addStillContains!608 lt!438615 lt!438622 zeroValue!1220 lt!438608) lt!438789)))

(declare-fun bs!28052 () Bool)

(assert (= bs!28052 d!117231))

(assert (=> bs!28052 m!915657))

(assert (=> bs!28052 m!915657))

(assert (=> bs!28052 m!915667))

(declare-fun m!916153 () Bool)

(assert (=> bs!28052 m!916153))

(declare-fun m!916155 () Bool)

(assert (=> bs!28052 m!916155))

(assert (=> b!989035 d!117231))

(declare-fun d!117233 () Bool)

(assert (=> d!117233 (= (apply!888 (+!3111 lt!438617 (tuple2!14967 lt!438614 minValue!1220)) lt!438620) (apply!888 lt!438617 lt!438620))))

(declare-fun lt!438792 () Unit!32696)

(declare-fun choose!1623 (ListLongMap!13653 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32696)

(assert (=> d!117233 (= lt!438792 (choose!1623 lt!438617 lt!438614 minValue!1220 lt!438620))))

(declare-fun e!557844 () Bool)

(assert (=> d!117233 e!557844))

(declare-fun res!661611 () Bool)

(assert (=> d!117233 (=> (not res!661611) (not e!557844))))

(assert (=> d!117233 (= res!661611 (contains!5690 lt!438617 lt!438620))))

(assert (=> d!117233 (= (addApplyDifferent!464 lt!438617 lt!438614 minValue!1220 lt!438620) lt!438792)))

(declare-fun b!989319 () Bool)

(assert (=> b!989319 (= e!557844 (not (= lt!438620 lt!438614)))))

(assert (= (and d!117233 res!661611) b!989319))

(assert (=> d!117233 m!915673))

(assert (=> d!117233 m!915675))

(assert (=> d!117233 m!915673))

(assert (=> d!117233 m!915677))

(declare-fun m!916157 () Bool)

(assert (=> d!117233 m!916157))

(declare-fun m!916159 () Bool)

(assert (=> d!117233 m!916159))

(assert (=> b!989035 d!117233))

(declare-fun d!117235 () Bool)

(declare-fun e!557845 () Bool)

(assert (=> d!117235 e!557845))

(declare-fun res!661612 () Bool)

(assert (=> d!117235 (=> (not res!661612) (not e!557845))))

(declare-fun lt!438793 () ListLongMap!13653)

(assert (=> d!117235 (= res!661612 (contains!5690 lt!438793 (_1!7494 (tuple2!14967 lt!438605 zeroValue!1220))))))

(declare-fun lt!438796 () List!20850)

(assert (=> d!117235 (= lt!438793 (ListLongMap!13654 lt!438796))))

(declare-fun lt!438795 () Unit!32696)

(declare-fun lt!438794 () Unit!32696)

(assert (=> d!117235 (= lt!438795 lt!438794)))

(assert (=> d!117235 (= (getValueByKey!516 lt!438796 (_1!7494 (tuple2!14967 lt!438605 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438605 zeroValue!1220))))))

(assert (=> d!117235 (= lt!438794 (lemmaContainsTupThenGetReturnValue!273 lt!438796 (_1!7494 (tuple2!14967 lt!438605 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438605 zeroValue!1220))))))

(assert (=> d!117235 (= lt!438796 (insertStrictlySorted!330 (toList!6842 lt!438606) (_1!7494 (tuple2!14967 lt!438605 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438605 zeroValue!1220))))))

(assert (=> d!117235 (= (+!3111 lt!438606 (tuple2!14967 lt!438605 zeroValue!1220)) lt!438793)))

(declare-fun b!989320 () Bool)

(declare-fun res!661613 () Bool)

(assert (=> b!989320 (=> (not res!661613) (not e!557845))))

(assert (=> b!989320 (= res!661613 (= (getValueByKey!516 (toList!6842 lt!438793) (_1!7494 (tuple2!14967 lt!438605 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438605 zeroValue!1220)))))))

(declare-fun b!989321 () Bool)

(assert (=> b!989321 (= e!557845 (contains!5692 (toList!6842 lt!438793) (tuple2!14967 lt!438605 zeroValue!1220)))))

(assert (= (and d!117235 res!661612) b!989320))

(assert (= (and b!989320 res!661613) b!989321))

(declare-fun m!916161 () Bool)

(assert (=> d!117235 m!916161))

(declare-fun m!916163 () Bool)

(assert (=> d!117235 m!916163))

(declare-fun m!916165 () Bool)

(assert (=> d!117235 m!916165))

(declare-fun m!916167 () Bool)

(assert (=> d!117235 m!916167))

(declare-fun m!916169 () Bool)

(assert (=> b!989320 m!916169))

(declare-fun m!916171 () Bool)

(assert (=> b!989321 m!916171))

(assert (=> b!989035 d!117235))

(declare-fun d!117237 () Bool)

(assert (=> d!117237 (= (apply!888 (+!3111 lt!438617 (tuple2!14967 lt!438614 minValue!1220)) lt!438620) (get!15617 (getValueByKey!516 (toList!6842 (+!3111 lt!438617 (tuple2!14967 lt!438614 minValue!1220))) lt!438620)))))

(declare-fun bs!28053 () Bool)

(assert (= bs!28053 d!117237))

(declare-fun m!916173 () Bool)

(assert (=> bs!28053 m!916173))

(assert (=> bs!28053 m!916173))

(declare-fun m!916175 () Bool)

(assert (=> bs!28053 m!916175))

(assert (=> b!989035 d!117237))

(declare-fun d!117239 () Bool)

(assert (=> d!117239 (= (apply!888 (+!3111 lt!438616 (tuple2!14967 lt!438603 minValue!1220)) lt!438601) (apply!888 lt!438616 lt!438601))))

(declare-fun lt!438797 () Unit!32696)

(assert (=> d!117239 (= lt!438797 (choose!1623 lt!438616 lt!438603 minValue!1220 lt!438601))))

(declare-fun e!557846 () Bool)

(assert (=> d!117239 e!557846))

(declare-fun res!661614 () Bool)

(assert (=> d!117239 (=> (not res!661614) (not e!557846))))

(assert (=> d!117239 (= res!661614 (contains!5690 lt!438616 lt!438601))))

(assert (=> d!117239 (= (addApplyDifferent!464 lt!438616 lt!438603 minValue!1220 lt!438601) lt!438797)))

(declare-fun b!989322 () Bool)

(assert (=> b!989322 (= e!557846 (not (= lt!438601 lt!438603)))))

(assert (= (and d!117239 res!661614) b!989322))

(assert (=> d!117239 m!915661))

(assert (=> d!117239 m!915663))

(assert (=> d!117239 m!915661))

(assert (=> d!117239 m!915685))

(declare-fun m!916177 () Bool)

(assert (=> d!117239 m!916177))

(declare-fun m!916179 () Bool)

(assert (=> d!117239 m!916179))

(assert (=> b!989035 d!117239))

(declare-fun d!117241 () Bool)

(assert (=> d!117241 (= (apply!888 (+!3111 lt!438606 (tuple2!14967 lt!438605 zeroValue!1220)) lt!438612) (apply!888 lt!438606 lt!438612))))

(declare-fun lt!438798 () Unit!32696)

(assert (=> d!117241 (= lt!438798 (choose!1623 lt!438606 lt!438605 zeroValue!1220 lt!438612))))

(declare-fun e!557847 () Bool)

(assert (=> d!117241 e!557847))

(declare-fun res!661615 () Bool)

(assert (=> d!117241 (=> (not res!661615) (not e!557847))))

(assert (=> d!117241 (= res!661615 (contains!5690 lt!438606 lt!438612))))

(assert (=> d!117241 (= (addApplyDifferent!464 lt!438606 lt!438605 zeroValue!1220 lt!438612) lt!438798)))

(declare-fun b!989323 () Bool)

(assert (=> b!989323 (= e!557847 (not (= lt!438612 lt!438605)))))

(assert (= (and d!117241 res!661615) b!989323))

(assert (=> d!117241 m!915659))

(assert (=> d!117241 m!915679))

(assert (=> d!117241 m!915659))

(assert (=> d!117241 m!915683))

(declare-fun m!916181 () Bool)

(assert (=> d!117241 m!916181))

(declare-fun m!916183 () Bool)

(assert (=> d!117241 m!916183))

(assert (=> b!989035 d!117241))

(declare-fun d!117243 () Bool)

(assert (=> d!117243 (= (apply!888 lt!438616 lt!438601) (get!15617 (getValueByKey!516 (toList!6842 lt!438616) lt!438601)))))

(declare-fun bs!28054 () Bool)

(assert (= bs!28054 d!117243))

(declare-fun m!916185 () Bool)

(assert (=> bs!28054 m!916185))

(assert (=> bs!28054 m!916185))

(declare-fun m!916187 () Bool)

(assert (=> bs!28054 m!916187))

(assert (=> b!989035 d!117243))

(declare-fun d!117245 () Bool)

(assert (=> d!117245 (= (apply!888 (+!3111 lt!438606 (tuple2!14967 lt!438605 zeroValue!1220)) lt!438612) (get!15617 (getValueByKey!516 (toList!6842 (+!3111 lt!438606 (tuple2!14967 lt!438605 zeroValue!1220))) lt!438612)))))

(declare-fun bs!28055 () Bool)

(assert (= bs!28055 d!117245))

(declare-fun m!916189 () Bool)

(assert (=> bs!28055 m!916189))

(assert (=> bs!28055 m!916189))

(declare-fun m!916191 () Bool)

(assert (=> bs!28055 m!916191))

(assert (=> b!989035 d!117245))

(declare-fun d!117247 () Bool)

(declare-fun e!557848 () Bool)

(assert (=> d!117247 e!557848))

(declare-fun res!661616 () Bool)

(assert (=> d!117247 (=> (not res!661616) (not e!557848))))

(declare-fun lt!438799 () ListLongMap!13653)

(assert (=> d!117247 (= res!661616 (contains!5690 lt!438799 (_1!7494 (tuple2!14967 lt!438603 minValue!1220))))))

(declare-fun lt!438802 () List!20850)

(assert (=> d!117247 (= lt!438799 (ListLongMap!13654 lt!438802))))

(declare-fun lt!438801 () Unit!32696)

(declare-fun lt!438800 () Unit!32696)

(assert (=> d!117247 (= lt!438801 lt!438800)))

(assert (=> d!117247 (= (getValueByKey!516 lt!438802 (_1!7494 (tuple2!14967 lt!438603 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438603 minValue!1220))))))

(assert (=> d!117247 (= lt!438800 (lemmaContainsTupThenGetReturnValue!273 lt!438802 (_1!7494 (tuple2!14967 lt!438603 minValue!1220)) (_2!7494 (tuple2!14967 lt!438603 minValue!1220))))))

(assert (=> d!117247 (= lt!438802 (insertStrictlySorted!330 (toList!6842 lt!438616) (_1!7494 (tuple2!14967 lt!438603 minValue!1220)) (_2!7494 (tuple2!14967 lt!438603 minValue!1220))))))

(assert (=> d!117247 (= (+!3111 lt!438616 (tuple2!14967 lt!438603 minValue!1220)) lt!438799)))

(declare-fun b!989324 () Bool)

(declare-fun res!661617 () Bool)

(assert (=> b!989324 (=> (not res!661617) (not e!557848))))

(assert (=> b!989324 (= res!661617 (= (getValueByKey!516 (toList!6842 lt!438799) (_1!7494 (tuple2!14967 lt!438603 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438603 minValue!1220)))))))

(declare-fun b!989325 () Bool)

(assert (=> b!989325 (= e!557848 (contains!5692 (toList!6842 lt!438799) (tuple2!14967 lt!438603 minValue!1220)))))

(assert (= (and d!117247 res!661616) b!989324))

(assert (= (and b!989324 res!661617) b!989325))

(declare-fun m!916193 () Bool)

(assert (=> d!117247 m!916193))

(declare-fun m!916195 () Bool)

(assert (=> d!117247 m!916195))

(declare-fun m!916197 () Bool)

(assert (=> d!117247 m!916197))

(declare-fun m!916199 () Bool)

(assert (=> d!117247 m!916199))

(declare-fun m!916201 () Bool)

(assert (=> b!989324 m!916201))

(declare-fun m!916203 () Bool)

(assert (=> b!989325 m!916203))

(assert (=> b!989035 d!117247))

(declare-fun d!117249 () Bool)

(assert (=> d!117249 (= (apply!888 (+!3111 lt!438616 (tuple2!14967 lt!438603 minValue!1220)) lt!438601) (get!15617 (getValueByKey!516 (toList!6842 (+!3111 lt!438616 (tuple2!14967 lt!438603 minValue!1220))) lt!438601)))))

(declare-fun bs!28056 () Bool)

(assert (= bs!28056 d!117249))

(declare-fun m!916205 () Bool)

(assert (=> bs!28056 m!916205))

(assert (=> bs!28056 m!916205))

(declare-fun m!916207 () Bool)

(assert (=> bs!28056 m!916207))

(assert (=> b!989035 d!117249))

(assert (=> b!989035 d!117083))

(declare-fun d!117251 () Bool)

(declare-fun e!557849 () Bool)

(assert (=> d!117251 e!557849))

(declare-fun res!661618 () Bool)

(assert (=> d!117251 (=> (not res!661618) (not e!557849))))

(declare-fun lt!438803 () ListLongMap!13653)

(assert (=> d!117251 (= res!661618 (contains!5690 lt!438803 (_1!7494 (tuple2!14967 lt!438614 minValue!1220))))))

(declare-fun lt!438806 () List!20850)

(assert (=> d!117251 (= lt!438803 (ListLongMap!13654 lt!438806))))

(declare-fun lt!438805 () Unit!32696)

(declare-fun lt!438804 () Unit!32696)

(assert (=> d!117251 (= lt!438805 lt!438804)))

(assert (=> d!117251 (= (getValueByKey!516 lt!438806 (_1!7494 (tuple2!14967 lt!438614 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438614 minValue!1220))))))

(assert (=> d!117251 (= lt!438804 (lemmaContainsTupThenGetReturnValue!273 lt!438806 (_1!7494 (tuple2!14967 lt!438614 minValue!1220)) (_2!7494 (tuple2!14967 lt!438614 minValue!1220))))))

(assert (=> d!117251 (= lt!438806 (insertStrictlySorted!330 (toList!6842 lt!438617) (_1!7494 (tuple2!14967 lt!438614 minValue!1220)) (_2!7494 (tuple2!14967 lt!438614 minValue!1220))))))

(assert (=> d!117251 (= (+!3111 lt!438617 (tuple2!14967 lt!438614 minValue!1220)) lt!438803)))

(declare-fun b!989326 () Bool)

(declare-fun res!661619 () Bool)

(assert (=> b!989326 (=> (not res!661619) (not e!557849))))

(assert (=> b!989326 (= res!661619 (= (getValueByKey!516 (toList!6842 lt!438803) (_1!7494 (tuple2!14967 lt!438614 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438614 minValue!1220)))))))

(declare-fun b!989327 () Bool)

(assert (=> b!989327 (= e!557849 (contains!5692 (toList!6842 lt!438803) (tuple2!14967 lt!438614 minValue!1220)))))

(assert (= (and d!117251 res!661618) b!989326))

(assert (= (and b!989326 res!661619) b!989327))

(declare-fun m!916209 () Bool)

(assert (=> d!117251 m!916209))

(declare-fun m!916211 () Bool)

(assert (=> d!117251 m!916211))

(declare-fun m!916213 () Bool)

(assert (=> d!117251 m!916213))

(declare-fun m!916215 () Bool)

(assert (=> d!117251 m!916215))

(declare-fun m!916217 () Bool)

(assert (=> b!989326 m!916217))

(declare-fun m!916219 () Bool)

(assert (=> b!989327 m!916219))

(assert (=> b!989035 d!117251))

(declare-fun d!117253 () Bool)

(assert (=> d!117253 (= (apply!888 lt!438606 lt!438612) (get!15617 (getValueByKey!516 (toList!6842 lt!438606) lt!438612)))))

(declare-fun bs!28057 () Bool)

(assert (= bs!28057 d!117253))

(declare-fun m!916221 () Bool)

(assert (=> bs!28057 m!916221))

(assert (=> bs!28057 m!916221))

(declare-fun m!916223 () Bool)

(assert (=> bs!28057 m!916223))

(assert (=> b!989035 d!117253))

(declare-fun b!989328 () Bool)

(declare-fun e!557851 () Bool)

(declare-fun e!557850 () Bool)

(assert (=> b!989328 (= e!557851 e!557850)))

(declare-fun lt!438809 () (_ BitVec 64))

(assert (=> b!989328 (= lt!438809 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!438807 () Unit!32696)

(assert (=> b!989328 (= lt!438807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438809 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!989328 (arrayContainsKey!0 _keys!1544 lt!438809 #b00000000000000000000000000000000)))

(declare-fun lt!438808 () Unit!32696)

(assert (=> b!989328 (= lt!438808 lt!438807)))

(declare-fun res!661620 () Bool)

(assert (=> b!989328 (= res!661620 (= (seekEntryOrOpen!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9205 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!989328 (=> (not res!661620) (not e!557850))))

(declare-fun bm!41921 () Bool)

(declare-fun call!41924 () Bool)

(assert (=> bm!41921 (= call!41924 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!989329 () Bool)

(assert (=> b!989329 (= e!557850 call!41924)))

(declare-fun b!989330 () Bool)

(assert (=> b!989330 (= e!557851 call!41924)))

(declare-fun b!989331 () Bool)

(declare-fun e!557852 () Bool)

(assert (=> b!989331 (= e!557852 e!557851)))

(declare-fun c!100302 () Bool)

(assert (=> b!989331 (= c!100302 (validKeyInArray!0 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117255 () Bool)

(declare-fun res!661621 () Bool)

(assert (=> d!117255 (=> res!661621 e!557852)))

(assert (=> d!117255 (= res!661621 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30540 _keys!1544)))))

(assert (=> d!117255 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!557852)))

(assert (= (and d!117255 (not res!661621)) b!989331))

(assert (= (and b!989331 c!100302) b!989328))

(assert (= (and b!989331 (not c!100302)) b!989330))

(assert (= (and b!989328 res!661620) b!989329))

(assert (= (or b!989329 b!989330) bm!41921))

(assert (=> b!989328 m!915825))

(declare-fun m!916225 () Bool)

(assert (=> b!989328 m!916225))

(declare-fun m!916227 () Bool)

(assert (=> b!989328 m!916227))

(assert (=> b!989328 m!915825))

(declare-fun m!916229 () Bool)

(assert (=> b!989328 m!916229))

(declare-fun m!916231 () Bool)

(assert (=> bm!41921 m!916231))

(assert (=> b!989331 m!915825))

(assert (=> b!989331 m!915825))

(assert (=> b!989331 m!915827))

(assert (=> bm!41899 d!117255))

(declare-fun d!117257 () Bool)

(assert (=> d!117257 (= (apply!888 lt!438580 (select (arr!30059 _keys!1544) from!1932)) (get!15617 (getValueByKey!516 (toList!6842 lt!438580) (select (arr!30059 _keys!1544) from!1932))))))

(declare-fun bs!28058 () Bool)

(assert (= bs!28058 d!117257))

(assert (=> bs!28058 m!915415))

(assert (=> bs!28058 m!915837))

(assert (=> bs!28058 m!915837))

(declare-fun m!916233 () Bool)

(assert (=> bs!28058 m!916233))

(assert (=> b!989002 d!117257))

(assert (=> b!989002 d!117081))

(declare-fun d!117259 () Bool)

(declare-fun lt!438810 () Bool)

(assert (=> d!117259 (= lt!438810 (select (content!418 (toList!6842 lt!438627)) lt!438462))))

(declare-fun e!557853 () Bool)

(assert (=> d!117259 (= lt!438810 e!557853)))

(declare-fun res!661622 () Bool)

(assert (=> d!117259 (=> (not res!661622) (not e!557853))))

(assert (=> d!117259 (= res!661622 ((_ is Cons!20846) (toList!6842 lt!438627)))))

(assert (=> d!117259 (= (contains!5692 (toList!6842 lt!438627) lt!438462) lt!438810)))

(declare-fun b!989332 () Bool)

(declare-fun e!557854 () Bool)

(assert (=> b!989332 (= e!557853 e!557854)))

(declare-fun res!661623 () Bool)

(assert (=> b!989332 (=> res!661623 e!557854)))

(assert (=> b!989332 (= res!661623 (= (h!22008 (toList!6842 lt!438627)) lt!438462))))

(declare-fun b!989333 () Bool)

(assert (=> b!989333 (= e!557854 (contains!5692 (t!29794 (toList!6842 lt!438627)) lt!438462))))

(assert (= (and d!117259 res!661622) b!989332))

(assert (= (and b!989332 (not res!661623)) b!989333))

(declare-fun m!916235 () Bool)

(assert (=> d!117259 m!916235))

(declare-fun m!916237 () Bool)

(assert (=> d!117259 m!916237))

(declare-fun m!916239 () Bool)

(assert (=> b!989333 m!916239))

(assert (=> b!989043 d!117259))

(declare-fun d!117261 () Bool)

(declare-fun e!557855 () Bool)

(assert (=> d!117261 e!557855))

(declare-fun res!661624 () Bool)

(assert (=> d!117261 (=> res!661624 e!557855)))

(declare-fun lt!438813 () Bool)

(assert (=> d!117261 (= res!661624 (not lt!438813))))

(declare-fun lt!438814 () Bool)

(assert (=> d!117261 (= lt!438813 lt!438814)))

(declare-fun lt!438811 () Unit!32696)

(declare-fun e!557856 () Unit!32696)

(assert (=> d!117261 (= lt!438811 e!557856)))

(declare-fun c!100303 () Bool)

(assert (=> d!117261 (= c!100303 lt!438814)))

(assert (=> d!117261 (= lt!438814 (containsKey!478 (toList!6842 lt!438602) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117261 (= (contains!5690 lt!438602 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438813)))

(declare-fun b!989334 () Bool)

(declare-fun lt!438812 () Unit!32696)

(assert (=> b!989334 (= e!557856 lt!438812)))

(assert (=> b!989334 (= lt!438812 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438602) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989334 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438602) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989335 () Bool)

(declare-fun Unit!32714 () Unit!32696)

(assert (=> b!989335 (= e!557856 Unit!32714)))

(declare-fun b!989336 () Bool)

(assert (=> b!989336 (= e!557855 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438602) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117261 c!100303) b!989334))

(assert (= (and d!117261 (not c!100303)) b!989335))

(assert (= (and d!117261 (not res!661624)) b!989336))

(assert (=> d!117261 m!915525))

(declare-fun m!916241 () Bool)

(assert (=> d!117261 m!916241))

(assert (=> b!989334 m!915525))

(declare-fun m!916243 () Bool)

(assert (=> b!989334 m!916243))

(assert (=> b!989334 m!915525))

(assert (=> b!989334 m!916089))

(assert (=> b!989334 m!916089))

(declare-fun m!916245 () Bool)

(assert (=> b!989334 m!916245))

(assert (=> b!989336 m!915525))

(assert (=> b!989336 m!916089))

(assert (=> b!989336 m!916089))

(assert (=> b!989336 m!916245))

(assert (=> b!989038 d!117261))

(declare-fun d!117263 () Bool)

(declare-fun e!557857 () Bool)

(assert (=> d!117263 e!557857))

(declare-fun res!661625 () Bool)

(assert (=> d!117263 (=> (not res!661625) (not e!557857))))

(declare-fun lt!438815 () ListLongMap!13653)

(assert (=> d!117263 (= res!661625 (contains!5690 lt!438815 (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438818 () List!20850)

(assert (=> d!117263 (= lt!438815 (ListLongMap!13654 lt!438818))))

(declare-fun lt!438817 () Unit!32696)

(declare-fun lt!438816 () Unit!32696)

(assert (=> d!117263 (= lt!438817 lt!438816)))

(assert (=> d!117263 (= (getValueByKey!516 lt!438818 (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117263 (= lt!438816 (lemmaContainsTupThenGetReturnValue!273 lt!438818 (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117263 (= lt!438818 (insertStrictlySorted!330 (toList!6842 call!41891) (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117263 (= (+!3111 call!41891 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438815)))

(declare-fun b!989337 () Bool)

(declare-fun res!661626 () Bool)

(assert (=> b!989337 (=> (not res!661626) (not e!557857))))

(assert (=> b!989337 (= res!661626 (= (getValueByKey!516 (toList!6842 lt!438815) (_1!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989338 () Bool)

(assert (=> b!989338 (= e!557857 (contains!5692 (toList!6842 lt!438815) (tuple2!14967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117263 res!661625) b!989337))

(assert (= (and b!989337 res!661626) b!989338))

(declare-fun m!916247 () Bool)

(assert (=> d!117263 m!916247))

(declare-fun m!916249 () Bool)

(assert (=> d!117263 m!916249))

(declare-fun m!916251 () Bool)

(assert (=> d!117263 m!916251))

(declare-fun m!916253 () Bool)

(assert (=> d!117263 m!916253))

(declare-fun m!916255 () Bool)

(assert (=> b!989337 m!916255))

(declare-fun m!916257 () Bool)

(assert (=> b!989338 m!916257))

(assert (=> b!989009 d!117263))

(assert (=> bm!41896 d!117083))

(declare-fun d!117265 () Bool)

(declare-fun lt!438819 () Bool)

(assert (=> d!117265 (= lt!438819 (select (content!418 (toList!6842 lt!438631)) lt!438464))))

(declare-fun e!557858 () Bool)

(assert (=> d!117265 (= lt!438819 e!557858)))

(declare-fun res!661627 () Bool)

(assert (=> d!117265 (=> (not res!661627) (not e!557858))))

(assert (=> d!117265 (= res!661627 ((_ is Cons!20846) (toList!6842 lt!438631)))))

(assert (=> d!117265 (= (contains!5692 (toList!6842 lt!438631) lt!438464) lt!438819)))

(declare-fun b!989339 () Bool)

(declare-fun e!557859 () Bool)

(assert (=> b!989339 (= e!557858 e!557859)))

(declare-fun res!661628 () Bool)

(assert (=> b!989339 (=> res!661628 e!557859)))

(assert (=> b!989339 (= res!661628 (= (h!22008 (toList!6842 lt!438631)) lt!438464))))

(declare-fun b!989340 () Bool)

(assert (=> b!989340 (= e!557859 (contains!5692 (t!29794 (toList!6842 lt!438631)) lt!438464))))

(assert (= (and d!117265 res!661627) b!989339))

(assert (= (and b!989339 (not res!661628)) b!989340))

(declare-fun m!916259 () Bool)

(assert (=> d!117265 m!916259))

(declare-fun m!916261 () Bool)

(assert (=> d!117265 m!916261))

(declare-fun m!916263 () Bool)

(assert (=> b!989340 m!916263))

(assert (=> b!989045 d!117265))

(declare-fun d!117267 () Bool)

(declare-fun e!557860 () Bool)

(assert (=> d!117267 e!557860))

(declare-fun res!661629 () Bool)

(assert (=> d!117267 (=> res!661629 e!557860)))

(declare-fun lt!438822 () Bool)

(assert (=> d!117267 (= res!661629 (not lt!438822))))

(declare-fun lt!438823 () Bool)

(assert (=> d!117267 (= lt!438822 lt!438823)))

(declare-fun lt!438820 () Unit!32696)

(declare-fun e!557861 () Unit!32696)

(assert (=> d!117267 (= lt!438820 e!557861)))

(declare-fun c!100304 () Bool)

(assert (=> d!117267 (= c!100304 lt!438823)))

(assert (=> d!117267 (= lt!438823 (containsKey!478 (toList!6842 lt!438602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117267 (= (contains!5690 lt!438602 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438822)))

(declare-fun b!989341 () Bool)

(declare-fun lt!438821 () Unit!32696)

(assert (=> b!989341 (= e!557861 lt!438821)))

(assert (=> b!989341 (= lt!438821 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989341 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989342 () Bool)

(declare-fun Unit!32715 () Unit!32696)

(assert (=> b!989342 (= e!557861 Unit!32715)))

(declare-fun b!989343 () Bool)

(assert (=> b!989343 (= e!557860 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117267 c!100304) b!989341))

(assert (= (and d!117267 (not c!100304)) b!989342))

(assert (= (and d!117267 (not res!661629)) b!989343))

(declare-fun m!916265 () Bool)

(assert (=> d!117267 m!916265))

(declare-fun m!916267 () Bool)

(assert (=> b!989341 m!916267))

(assert (=> b!989341 m!916073))

(assert (=> b!989341 m!916073))

(declare-fun m!916269 () Bool)

(assert (=> b!989341 m!916269))

(assert (=> b!989343 m!916073))

(assert (=> b!989343 m!916073))

(assert (=> b!989343 m!916269))

(assert (=> bm!41892 d!117267))

(assert (=> b!989037 d!117135))

(declare-fun d!117269 () Bool)

(declare-fun e!557862 () Bool)

(assert (=> d!117269 e!557862))

(declare-fun res!661630 () Bool)

(assert (=> d!117269 (=> res!661630 e!557862)))

(declare-fun lt!438826 () Bool)

(assert (=> d!117269 (= res!661630 (not lt!438826))))

(declare-fun lt!438827 () Bool)

(assert (=> d!117269 (= lt!438826 lt!438827)))

(declare-fun lt!438824 () Unit!32696)

(declare-fun e!557863 () Unit!32696)

(assert (=> d!117269 (= lt!438824 e!557863)))

(declare-fun c!100305 () Bool)

(assert (=> d!117269 (= c!100305 lt!438827)))

(assert (=> d!117269 (= lt!438827 (containsKey!478 (toList!6842 lt!438524) (_1!7494 lt!438464)))))

(assert (=> d!117269 (= (contains!5690 lt!438524 (_1!7494 lt!438464)) lt!438826)))

(declare-fun b!989344 () Bool)

(declare-fun lt!438825 () Unit!32696)

(assert (=> b!989344 (= e!557863 lt!438825)))

(assert (=> b!989344 (= lt!438825 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438524) (_1!7494 lt!438464)))))

(assert (=> b!989344 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438524) (_1!7494 lt!438464)))))

(declare-fun b!989345 () Bool)

(declare-fun Unit!32716 () Unit!32696)

(assert (=> b!989345 (= e!557863 Unit!32716)))

(declare-fun b!989346 () Bool)

(assert (=> b!989346 (= e!557862 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438524) (_1!7494 lt!438464))))))

(assert (= (and d!117269 c!100305) b!989344))

(assert (= (and d!117269 (not c!100305)) b!989345))

(assert (= (and d!117269 (not res!661630)) b!989346))

(declare-fun m!916271 () Bool)

(assert (=> d!117269 m!916271))

(declare-fun m!916273 () Bool)

(assert (=> b!989344 m!916273))

(assert (=> b!989344 m!915569))

(assert (=> b!989344 m!915569))

(declare-fun m!916275 () Bool)

(assert (=> b!989344 m!916275))

(assert (=> b!989346 m!915569))

(assert (=> b!989346 m!915569))

(assert (=> b!989346 m!916275))

(assert (=> d!117087 d!117269))

(declare-fun b!989348 () Bool)

(declare-fun e!557864 () Option!522)

(declare-fun e!557865 () Option!522)

(assert (=> b!989348 (= e!557864 e!557865)))

(declare-fun c!100307 () Bool)

(assert (=> b!989348 (= c!100307 (and ((_ is Cons!20846) lt!438527) (not (= (_1!7494 (h!22008 lt!438527)) (_1!7494 lt!438464)))))))

(declare-fun b!989350 () Bool)

(assert (=> b!989350 (= e!557865 None!520)))

(declare-fun b!989349 () Bool)

(assert (=> b!989349 (= e!557865 (getValueByKey!516 (t!29794 lt!438527) (_1!7494 lt!438464)))))

(declare-fun d!117271 () Bool)

(declare-fun c!100306 () Bool)

(assert (=> d!117271 (= c!100306 (and ((_ is Cons!20846) lt!438527) (= (_1!7494 (h!22008 lt!438527)) (_1!7494 lt!438464))))))

(assert (=> d!117271 (= (getValueByKey!516 lt!438527 (_1!7494 lt!438464)) e!557864)))

(declare-fun b!989347 () Bool)

(assert (=> b!989347 (= e!557864 (Some!521 (_2!7494 (h!22008 lt!438527))))))

(assert (= (and d!117271 c!100306) b!989347))

(assert (= (and d!117271 (not c!100306)) b!989348))

(assert (= (and b!989348 c!100307) b!989349))

(assert (= (and b!989348 (not c!100307)) b!989350))

(declare-fun m!916277 () Bool)

(assert (=> b!989349 m!916277))

(assert (=> d!117087 d!117271))

(declare-fun d!117273 () Bool)

(assert (=> d!117273 (= (getValueByKey!516 lt!438527 (_1!7494 lt!438464)) (Some!521 (_2!7494 lt!438464)))))

(declare-fun lt!438828 () Unit!32696)

(assert (=> d!117273 (= lt!438828 (choose!1620 lt!438527 (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun e!557866 () Bool)

(assert (=> d!117273 e!557866))

(declare-fun res!661631 () Bool)

(assert (=> d!117273 (=> (not res!661631) (not e!557866))))

(assert (=> d!117273 (= res!661631 (isStrictlySorted!512 lt!438527))))

(assert (=> d!117273 (= (lemmaContainsTupThenGetReturnValue!273 lt!438527 (_1!7494 lt!438464) (_2!7494 lt!438464)) lt!438828)))

(declare-fun b!989351 () Bool)

(declare-fun res!661632 () Bool)

(assert (=> b!989351 (=> (not res!661632) (not e!557866))))

(assert (=> b!989351 (= res!661632 (containsKey!478 lt!438527 (_1!7494 lt!438464)))))

(declare-fun b!989352 () Bool)

(assert (=> b!989352 (= e!557866 (contains!5692 lt!438527 (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464))))))

(assert (= (and d!117273 res!661631) b!989351))

(assert (= (and b!989351 res!661632) b!989352))

(assert (=> d!117273 m!915563))

(declare-fun m!916279 () Bool)

(assert (=> d!117273 m!916279))

(declare-fun m!916281 () Bool)

(assert (=> d!117273 m!916281))

(declare-fun m!916283 () Bool)

(assert (=> b!989351 m!916283))

(declare-fun m!916285 () Bool)

(assert (=> b!989352 m!916285))

(assert (=> d!117087 d!117273))

(declare-fun b!989353 () Bool)

(declare-fun e!557869 () Bool)

(declare-fun lt!438829 () List!20850)

(assert (=> b!989353 (= e!557869 (contains!5692 lt!438829 (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464))))))

(declare-fun b!989354 () Bool)

(declare-fun res!661634 () Bool)

(assert (=> b!989354 (=> (not res!661634) (not e!557869))))

(assert (=> b!989354 (= res!661634 (containsKey!478 lt!438829 (_1!7494 lt!438464)))))

(declare-fun b!989355 () Bool)

(declare-fun e!557868 () List!20850)

(declare-fun call!41926 () List!20850)

(assert (=> b!989355 (= e!557868 call!41926)))

(declare-fun e!557871 () List!20850)

(declare-fun b!989356 () Bool)

(declare-fun c!100311 () Bool)

(declare-fun c!100309 () Bool)

(assert (=> b!989356 (= e!557871 (ite c!100311 (t!29794 (toList!6842 lt!438460)) (ite c!100309 (Cons!20846 (h!22008 (toList!6842 lt!438460)) (t!29794 (toList!6842 lt!438460))) Nil!20847)))))

(declare-fun b!989357 () Bool)

(declare-fun e!557870 () List!20850)

(declare-fun call!41927 () List!20850)

(assert (=> b!989357 (= e!557870 call!41927)))

(declare-fun b!989358 () Bool)

(declare-fun e!557867 () List!20850)

(assert (=> b!989358 (= e!557870 e!557867)))

(assert (=> b!989358 (= c!100311 (and ((_ is Cons!20846) (toList!6842 lt!438460)) (= (_1!7494 (h!22008 (toList!6842 lt!438460))) (_1!7494 lt!438464))))))

(declare-fun b!989359 () Bool)

(declare-fun call!41925 () List!20850)

(assert (=> b!989359 (= e!557867 call!41925)))

(declare-fun d!117275 () Bool)

(assert (=> d!117275 e!557869))

(declare-fun res!661633 () Bool)

(assert (=> d!117275 (=> (not res!661633) (not e!557869))))

(assert (=> d!117275 (= res!661633 (isStrictlySorted!512 lt!438829))))

(assert (=> d!117275 (= lt!438829 e!557870)))

(declare-fun c!100310 () Bool)

(assert (=> d!117275 (= c!100310 (and ((_ is Cons!20846) (toList!6842 lt!438460)) (bvslt (_1!7494 (h!22008 (toList!6842 lt!438460))) (_1!7494 lt!438464))))))

(assert (=> d!117275 (isStrictlySorted!512 (toList!6842 lt!438460))))

(assert (=> d!117275 (= (insertStrictlySorted!330 (toList!6842 lt!438460) (_1!7494 lt!438464) (_2!7494 lt!438464)) lt!438829)))

(declare-fun b!989360 () Bool)

(assert (=> b!989360 (= e!557871 (insertStrictlySorted!330 (t!29794 (toList!6842 lt!438460)) (_1!7494 lt!438464) (_2!7494 lt!438464)))))

(declare-fun b!989361 () Bool)

(assert (=> b!989361 (= e!557868 call!41926)))

(declare-fun bm!41922 () Bool)

(assert (=> bm!41922 (= call!41927 ($colon$colon!556 e!557871 (ite c!100310 (h!22008 (toList!6842 lt!438460)) (tuple2!14967 (_1!7494 lt!438464) (_2!7494 lt!438464)))))))

(declare-fun c!100308 () Bool)

(assert (=> bm!41922 (= c!100308 c!100310)))

(declare-fun bm!41923 () Bool)

(assert (=> bm!41923 (= call!41926 call!41925)))

(declare-fun bm!41924 () Bool)

(assert (=> bm!41924 (= call!41925 call!41927)))

(declare-fun b!989362 () Bool)

(assert (=> b!989362 (= c!100309 (and ((_ is Cons!20846) (toList!6842 lt!438460)) (bvsgt (_1!7494 (h!22008 (toList!6842 lt!438460))) (_1!7494 lt!438464))))))

(assert (=> b!989362 (= e!557867 e!557868)))

(assert (= (and d!117275 c!100310) b!989357))

(assert (= (and d!117275 (not c!100310)) b!989358))

(assert (= (and b!989358 c!100311) b!989359))

(assert (= (and b!989358 (not c!100311)) b!989362))

(assert (= (and b!989362 c!100309) b!989355))

(assert (= (and b!989362 (not c!100309)) b!989361))

(assert (= (or b!989355 b!989361) bm!41923))

(assert (= (or b!989359 bm!41923) bm!41924))

(assert (= (or b!989357 bm!41924) bm!41922))

(assert (= (and bm!41922 c!100308) b!989360))

(assert (= (and bm!41922 (not c!100308)) b!989356))

(assert (= (and d!117275 res!661633) b!989354))

(assert (= (and b!989354 res!661634) b!989353))

(declare-fun m!916287 () Bool)

(assert (=> b!989360 m!916287))

(declare-fun m!916289 () Bool)

(assert (=> bm!41922 m!916289))

(declare-fun m!916291 () Bool)

(assert (=> b!989354 m!916291))

(declare-fun m!916293 () Bool)

(assert (=> d!117275 m!916293))

(assert (=> d!117275 m!915971))

(declare-fun m!916295 () Bool)

(assert (=> b!989353 m!916295))

(assert (=> d!117087 d!117275))

(declare-fun d!117277 () Bool)

(declare-fun e!557872 () Bool)

(assert (=> d!117277 e!557872))

(declare-fun res!661635 () Bool)

(assert (=> d!117277 (=> res!661635 e!557872)))

(declare-fun lt!438832 () Bool)

(assert (=> d!117277 (= res!661635 (not lt!438832))))

(declare-fun lt!438833 () Bool)

(assert (=> d!117277 (= lt!438832 lt!438833)))

(declare-fun lt!438830 () Unit!32696)

(declare-fun e!557873 () Unit!32696)

(assert (=> d!117277 (= lt!438830 e!557873)))

(declare-fun c!100312 () Bool)

(assert (=> d!117277 (= c!100312 lt!438833)))

(assert (=> d!117277 (= lt!438833 (containsKey!478 (toList!6842 lt!438512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117277 (= (contains!5690 lt!438512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438832)))

(declare-fun b!989363 () Bool)

(declare-fun lt!438831 () Unit!32696)

(assert (=> b!989363 (= e!557873 lt!438831)))

(assert (=> b!989363 (= lt!438831 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 lt!438512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989363 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989364 () Bool)

(declare-fun Unit!32717 () Unit!32696)

(assert (=> b!989364 (= e!557873 Unit!32717)))

(declare-fun b!989365 () Bool)

(assert (=> b!989365 (= e!557872 (isDefined!386 (getValueByKey!516 (toList!6842 lt!438512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117277 c!100312) b!989363))

(assert (= (and d!117277 (not c!100312)) b!989364))

(assert (= (and d!117277 (not res!661635)) b!989365))

(declare-fun m!916297 () Bool)

(assert (=> d!117277 m!916297))

(declare-fun m!916299 () Bool)

(assert (=> b!989363 m!916299))

(declare-fun m!916301 () Bool)

(assert (=> b!989363 m!916301))

(assert (=> b!989363 m!916301))

(declare-fun m!916303 () Bool)

(assert (=> b!989363 m!916303))

(assert (=> b!989365 m!916301))

(assert (=> b!989365 m!916301))

(assert (=> b!989365 m!916303))

(assert (=> b!988924 d!117277))

(declare-fun d!117279 () Bool)

(assert (=> d!117279 (= (apply!888 lt!438512 (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15617 (getValueByKey!516 (toList!6842 lt!438512) (select (arr!30059 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28059 () Bool)

(assert (= bs!28059 d!117279))

(assert (=> bs!28059 m!915525))

(assert (=> bs!28059 m!915845))

(assert (=> bs!28059 m!915845))

(declare-fun m!916305 () Bool)

(assert (=> bs!28059 m!916305))

(assert (=> b!988925 d!117279))

(assert (=> b!988925 d!117165))

(declare-fun d!117281 () Bool)

(declare-fun lt!438834 () Bool)

(assert (=> d!117281 (= lt!438834 (select (content!418 (toList!6842 lt!438623)) lt!438464))))

(declare-fun e!557874 () Bool)

(assert (=> d!117281 (= lt!438834 e!557874)))

(declare-fun res!661636 () Bool)

(assert (=> d!117281 (=> (not res!661636) (not e!557874))))

(assert (=> d!117281 (= res!661636 ((_ is Cons!20846) (toList!6842 lt!438623)))))

(assert (=> d!117281 (= (contains!5692 (toList!6842 lt!438623) lt!438464) lt!438834)))

(declare-fun b!989366 () Bool)

(declare-fun e!557875 () Bool)

(assert (=> b!989366 (= e!557874 e!557875)))

(declare-fun res!661637 () Bool)

(assert (=> b!989366 (=> res!661637 e!557875)))

(assert (=> b!989366 (= res!661637 (= (h!22008 (toList!6842 lt!438623)) lt!438464))))

(declare-fun b!989367 () Bool)

(assert (=> b!989367 (= e!557875 (contains!5692 (t!29794 (toList!6842 lt!438623)) lt!438464))))

(assert (= (and d!117281 res!661636) b!989366))

(assert (= (and b!989366 (not res!661637)) b!989367))

(declare-fun m!916307 () Bool)

(assert (=> d!117281 m!916307))

(declare-fun m!916309 () Bool)

(assert (=> d!117281 m!916309))

(declare-fun m!916311 () Bool)

(assert (=> b!989367 m!916311))

(assert (=> b!989041 d!117281))

(assert (=> b!988945 d!117143))

(declare-fun d!117283 () Bool)

(assert (=> d!117283 (= (apply!888 lt!438594 lt!438579) (get!15617 (getValueByKey!516 (toList!6842 lt!438594) lt!438579)))))

(declare-fun bs!28060 () Bool)

(assert (= bs!28060 d!117283))

(declare-fun m!916313 () Bool)

(assert (=> bs!28060 m!916313))

(assert (=> bs!28060 m!916313))

(declare-fun m!916315 () Bool)

(assert (=> bs!28060 m!916315))

(assert (=> b!989014 d!117283))

(declare-fun d!117285 () Bool)

(assert (=> d!117285 (= (apply!888 lt!438595 lt!438598) (get!15617 (getValueByKey!516 (toList!6842 lt!438595) lt!438598)))))

(declare-fun bs!28061 () Bool)

(assert (= bs!28061 d!117285))

(declare-fun m!916317 () Bool)

(assert (=> bs!28061 m!916317))

(assert (=> bs!28061 m!916317))

(declare-fun m!916319 () Bool)

(assert (=> bs!28061 m!916319))

(assert (=> b!989014 d!117285))

(declare-fun d!117287 () Bool)

(assert (=> d!117287 (= (apply!888 (+!3111 lt!438595 (tuple2!14967 lt!438592 minValue!1220)) lt!438598) (get!15617 (getValueByKey!516 (toList!6842 (+!3111 lt!438595 (tuple2!14967 lt!438592 minValue!1220))) lt!438598)))))

(declare-fun bs!28062 () Bool)

(assert (= bs!28062 d!117287))

(declare-fun m!916321 () Bool)

(assert (=> bs!28062 m!916321))

(assert (=> bs!28062 m!916321))

(declare-fun m!916323 () Bool)

(assert (=> bs!28062 m!916323))

(assert (=> b!989014 d!117287))

(declare-fun d!117289 () Bool)

(declare-fun e!557876 () Bool)

(assert (=> d!117289 e!557876))

(declare-fun res!661638 () Bool)

(assert (=> d!117289 (=> (not res!661638) (not e!557876))))

(declare-fun lt!438835 () ListLongMap!13653)

(assert (=> d!117289 (= res!661638 (contains!5690 lt!438835 (_1!7494 (tuple2!14967 lt!438592 minValue!1220))))))

(declare-fun lt!438838 () List!20850)

(assert (=> d!117289 (= lt!438835 (ListLongMap!13654 lt!438838))))

(declare-fun lt!438837 () Unit!32696)

(declare-fun lt!438836 () Unit!32696)

(assert (=> d!117289 (= lt!438837 lt!438836)))

(assert (=> d!117289 (= (getValueByKey!516 lt!438838 (_1!7494 (tuple2!14967 lt!438592 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438592 minValue!1220))))))

(assert (=> d!117289 (= lt!438836 (lemmaContainsTupThenGetReturnValue!273 lt!438838 (_1!7494 (tuple2!14967 lt!438592 minValue!1220)) (_2!7494 (tuple2!14967 lt!438592 minValue!1220))))))

(assert (=> d!117289 (= lt!438838 (insertStrictlySorted!330 (toList!6842 lt!438595) (_1!7494 (tuple2!14967 lt!438592 minValue!1220)) (_2!7494 (tuple2!14967 lt!438592 minValue!1220))))))

(assert (=> d!117289 (= (+!3111 lt!438595 (tuple2!14967 lt!438592 minValue!1220)) lt!438835)))

(declare-fun b!989368 () Bool)

(declare-fun res!661639 () Bool)

(assert (=> b!989368 (=> (not res!661639) (not e!557876))))

(assert (=> b!989368 (= res!661639 (= (getValueByKey!516 (toList!6842 lt!438835) (_1!7494 (tuple2!14967 lt!438592 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438592 minValue!1220)))))))

(declare-fun b!989369 () Bool)

(assert (=> b!989369 (= e!557876 (contains!5692 (toList!6842 lt!438835) (tuple2!14967 lt!438592 minValue!1220)))))

(assert (= (and d!117289 res!661638) b!989368))

(assert (= (and b!989368 res!661639) b!989369))

(declare-fun m!916325 () Bool)

(assert (=> d!117289 m!916325))

(declare-fun m!916327 () Bool)

(assert (=> d!117289 m!916327))

(declare-fun m!916329 () Bool)

(assert (=> d!117289 m!916329))

(declare-fun m!916331 () Bool)

(assert (=> d!117289 m!916331))

(declare-fun m!916333 () Bool)

(assert (=> b!989368 m!916333))

(declare-fun m!916335 () Bool)

(assert (=> b!989369 m!916335))

(assert (=> b!989014 d!117289))

(declare-fun d!117291 () Bool)

(declare-fun e!557877 () Bool)

(assert (=> d!117291 e!557877))

(declare-fun res!661640 () Bool)

(assert (=> d!117291 (=> (not res!661640) (not e!557877))))

(declare-fun lt!438839 () ListLongMap!13653)

(assert (=> d!117291 (= res!661640 (contains!5690 lt!438839 (_1!7494 (tuple2!14967 lt!438600 zeroValue!1220))))))

(declare-fun lt!438842 () List!20850)

(assert (=> d!117291 (= lt!438839 (ListLongMap!13654 lt!438842))))

(declare-fun lt!438841 () Unit!32696)

(declare-fun lt!438840 () Unit!32696)

(assert (=> d!117291 (= lt!438841 lt!438840)))

(assert (=> d!117291 (= (getValueByKey!516 lt!438842 (_1!7494 (tuple2!14967 lt!438600 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438600 zeroValue!1220))))))

(assert (=> d!117291 (= lt!438840 (lemmaContainsTupThenGetReturnValue!273 lt!438842 (_1!7494 (tuple2!14967 lt!438600 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438600 zeroValue!1220))))))

(assert (=> d!117291 (= lt!438842 (insertStrictlySorted!330 (toList!6842 lt!438593) (_1!7494 (tuple2!14967 lt!438600 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438600 zeroValue!1220))))))

(assert (=> d!117291 (= (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220)) lt!438839)))

(declare-fun b!989370 () Bool)

(declare-fun res!661641 () Bool)

(assert (=> b!989370 (=> (not res!661641) (not e!557877))))

(assert (=> b!989370 (= res!661641 (= (getValueByKey!516 (toList!6842 lt!438839) (_1!7494 (tuple2!14967 lt!438600 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438600 zeroValue!1220)))))))

(declare-fun b!989371 () Bool)

(assert (=> b!989371 (= e!557877 (contains!5692 (toList!6842 lt!438839) (tuple2!14967 lt!438600 zeroValue!1220)))))

(assert (= (and d!117291 res!661640) b!989370))

(assert (= (and b!989370 res!661641) b!989371))

(declare-fun m!916337 () Bool)

(assert (=> d!117291 m!916337))

(declare-fun m!916339 () Bool)

(assert (=> d!117291 m!916339))

(declare-fun m!916341 () Bool)

(assert (=> d!117291 m!916341))

(declare-fun m!916343 () Bool)

(assert (=> d!117291 m!916343))

(declare-fun m!916345 () Bool)

(assert (=> b!989370 m!916345))

(declare-fun m!916347 () Bool)

(assert (=> b!989371 m!916347))

(assert (=> b!989014 d!117291))

(declare-fun d!117293 () Bool)

(assert (=> d!117293 (= (apply!888 (+!3111 lt!438594 (tuple2!14967 lt!438581 minValue!1220)) lt!438579) (get!15617 (getValueByKey!516 (toList!6842 (+!3111 lt!438594 (tuple2!14967 lt!438581 minValue!1220))) lt!438579)))))

(declare-fun bs!28063 () Bool)

(assert (= bs!28063 d!117293))

(declare-fun m!916349 () Bool)

(assert (=> bs!28063 m!916349))

(assert (=> bs!28063 m!916349))

(declare-fun m!916351 () Bool)

(assert (=> bs!28063 m!916351))

(assert (=> b!989014 d!117293))

(declare-fun d!117295 () Bool)

(declare-fun e!557878 () Bool)

(assert (=> d!117295 e!557878))

(declare-fun res!661642 () Bool)

(assert (=> d!117295 (=> (not res!661642) (not e!557878))))

(declare-fun lt!438843 () ListLongMap!13653)

(assert (=> d!117295 (= res!661642 (contains!5690 lt!438843 (_1!7494 (tuple2!14967 lt!438583 zeroValue!1220))))))

(declare-fun lt!438846 () List!20850)

(assert (=> d!117295 (= lt!438843 (ListLongMap!13654 lt!438846))))

(declare-fun lt!438845 () Unit!32696)

(declare-fun lt!438844 () Unit!32696)

(assert (=> d!117295 (= lt!438845 lt!438844)))

(assert (=> d!117295 (= (getValueByKey!516 lt!438846 (_1!7494 (tuple2!14967 lt!438583 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438583 zeroValue!1220))))))

(assert (=> d!117295 (= lt!438844 (lemmaContainsTupThenGetReturnValue!273 lt!438846 (_1!7494 (tuple2!14967 lt!438583 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438583 zeroValue!1220))))))

(assert (=> d!117295 (= lt!438846 (insertStrictlySorted!330 (toList!6842 lt!438584) (_1!7494 (tuple2!14967 lt!438583 zeroValue!1220)) (_2!7494 (tuple2!14967 lt!438583 zeroValue!1220))))))

(assert (=> d!117295 (= (+!3111 lt!438584 (tuple2!14967 lt!438583 zeroValue!1220)) lt!438843)))

(declare-fun b!989372 () Bool)

(declare-fun res!661643 () Bool)

(assert (=> b!989372 (=> (not res!661643) (not e!557878))))

(assert (=> b!989372 (= res!661643 (= (getValueByKey!516 (toList!6842 lt!438843) (_1!7494 (tuple2!14967 lt!438583 zeroValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438583 zeroValue!1220)))))))

(declare-fun b!989373 () Bool)

(assert (=> b!989373 (= e!557878 (contains!5692 (toList!6842 lt!438843) (tuple2!14967 lt!438583 zeroValue!1220)))))

(assert (= (and d!117295 res!661642) b!989372))

(assert (= (and b!989372 res!661643) b!989373))

(declare-fun m!916353 () Bool)

(assert (=> d!117295 m!916353))

(declare-fun m!916355 () Bool)

(assert (=> d!117295 m!916355))

(declare-fun m!916357 () Bool)

(assert (=> d!117295 m!916357))

(declare-fun m!916359 () Bool)

(assert (=> d!117295 m!916359))

(declare-fun m!916361 () Bool)

(assert (=> b!989372 m!916361))

(declare-fun m!916363 () Bool)

(assert (=> b!989373 m!916363))

(assert (=> b!989014 d!117295))

(declare-fun d!117297 () Bool)

(declare-fun e!557879 () Bool)

(assert (=> d!117297 e!557879))

(declare-fun res!661644 () Bool)

(assert (=> d!117297 (=> res!661644 e!557879)))

(declare-fun lt!438849 () Bool)

(assert (=> d!117297 (= res!661644 (not lt!438849))))

(declare-fun lt!438850 () Bool)

(assert (=> d!117297 (= lt!438849 lt!438850)))

(declare-fun lt!438847 () Unit!32696)

(declare-fun e!557880 () Unit!32696)

(assert (=> d!117297 (= lt!438847 e!557880)))

(declare-fun c!100313 () Bool)

(assert (=> d!117297 (= c!100313 lt!438850)))

(assert (=> d!117297 (= lt!438850 (containsKey!478 (toList!6842 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220))) lt!438586))))

(assert (=> d!117297 (= (contains!5690 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220)) lt!438586) lt!438849)))

(declare-fun b!989374 () Bool)

(declare-fun lt!438848 () Unit!32696)

(assert (=> b!989374 (= e!557880 lt!438848)))

(assert (=> b!989374 (= lt!438848 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6842 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220))) lt!438586))))

(assert (=> b!989374 (isDefined!386 (getValueByKey!516 (toList!6842 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220))) lt!438586))))

(declare-fun b!989375 () Bool)

(declare-fun Unit!32718 () Unit!32696)

(assert (=> b!989375 (= e!557880 Unit!32718)))

(declare-fun b!989376 () Bool)

(assert (=> b!989376 (= e!557879 (isDefined!386 (getValueByKey!516 (toList!6842 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220))) lt!438586)))))

(assert (= (and d!117297 c!100313) b!989374))

(assert (= (and d!117297 (not c!100313)) b!989375))

(assert (= (and d!117297 (not res!661644)) b!989376))

(declare-fun m!916365 () Bool)

(assert (=> d!117297 m!916365))

(declare-fun m!916367 () Bool)

(assert (=> b!989374 m!916367))

(declare-fun m!916369 () Bool)

(assert (=> b!989374 m!916369))

(assert (=> b!989374 m!916369))

(declare-fun m!916371 () Bool)

(assert (=> b!989374 m!916371))

(assert (=> b!989376 m!916369))

(assert (=> b!989376 m!916369))

(assert (=> b!989376 m!916371))

(assert (=> b!989014 d!117297))

(assert (=> b!989014 d!117129))

(declare-fun d!117299 () Bool)

(assert (=> d!117299 (= (apply!888 lt!438584 lt!438590) (get!15617 (getValueByKey!516 (toList!6842 lt!438584) lt!438590)))))

(declare-fun bs!28064 () Bool)

(assert (= bs!28064 d!117299))

(declare-fun m!916373 () Bool)

(assert (=> bs!28064 m!916373))

(assert (=> bs!28064 m!916373))

(declare-fun m!916375 () Bool)

(assert (=> bs!28064 m!916375))

(assert (=> b!989014 d!117299))

(declare-fun d!117301 () Bool)

(assert (=> d!117301 (= (apply!888 (+!3111 lt!438594 (tuple2!14967 lt!438581 minValue!1220)) lt!438579) (apply!888 lt!438594 lt!438579))))

(declare-fun lt!438851 () Unit!32696)

(assert (=> d!117301 (= lt!438851 (choose!1623 lt!438594 lt!438581 minValue!1220 lt!438579))))

(declare-fun e!557881 () Bool)

(assert (=> d!117301 e!557881))

(declare-fun res!661645 () Bool)

(assert (=> d!117301 (=> (not res!661645) (not e!557881))))

(assert (=> d!117301 (= res!661645 (contains!5690 lt!438594 lt!438579))))

(assert (=> d!117301 (= (addApplyDifferent!464 lt!438594 lt!438581 minValue!1220 lt!438579) lt!438851)))

(declare-fun b!989377 () Bool)

(assert (=> b!989377 (= e!557881 (not (= lt!438579 lt!438581)))))

(assert (= (and d!117301 res!661645) b!989377))

(assert (=> d!117301 m!915613))

(assert (=> d!117301 m!915615))

(assert (=> d!117301 m!915613))

(assert (=> d!117301 m!915639))

(declare-fun m!916377 () Bool)

(assert (=> d!117301 m!916377))

(declare-fun m!916379 () Bool)

(assert (=> d!117301 m!916379))

(assert (=> b!989014 d!117301))

(declare-fun d!117303 () Bool)

(assert (=> d!117303 (contains!5690 (+!3111 lt!438593 (tuple2!14967 lt!438600 zeroValue!1220)) lt!438586)))

(declare-fun lt!438852 () Unit!32696)

(assert (=> d!117303 (= lt!438852 (choose!1622 lt!438593 lt!438600 zeroValue!1220 lt!438586))))

(assert (=> d!117303 (contains!5690 lt!438593 lt!438586)))

(assert (=> d!117303 (= (addStillContains!608 lt!438593 lt!438600 zeroValue!1220 lt!438586) lt!438852)))

(declare-fun bs!28065 () Bool)

(assert (= bs!28065 d!117303))

(assert (=> bs!28065 m!915609))

(assert (=> bs!28065 m!915609))

(assert (=> bs!28065 m!915619))

(declare-fun m!916381 () Bool)

(assert (=> bs!28065 m!916381))

(declare-fun m!916383 () Bool)

(assert (=> bs!28065 m!916383))

(assert (=> b!989014 d!117303))

(declare-fun d!117305 () Bool)

(assert (=> d!117305 (= (apply!888 (+!3111 lt!438595 (tuple2!14967 lt!438592 minValue!1220)) lt!438598) (apply!888 lt!438595 lt!438598))))

(declare-fun lt!438853 () Unit!32696)

(assert (=> d!117305 (= lt!438853 (choose!1623 lt!438595 lt!438592 minValue!1220 lt!438598))))

(declare-fun e!557882 () Bool)

(assert (=> d!117305 e!557882))

(declare-fun res!661646 () Bool)

(assert (=> d!117305 (=> (not res!661646) (not e!557882))))

(assert (=> d!117305 (= res!661646 (contains!5690 lt!438595 lt!438598))))

(assert (=> d!117305 (= (addApplyDifferent!464 lt!438595 lt!438592 minValue!1220 lt!438598) lt!438853)))

(declare-fun b!989378 () Bool)

(assert (=> b!989378 (= e!557882 (not (= lt!438598 lt!438592)))))

(assert (= (and d!117305 res!661646) b!989378))

(assert (=> d!117305 m!915625))

(assert (=> d!117305 m!915627))

(assert (=> d!117305 m!915625))

(assert (=> d!117305 m!915629))

(declare-fun m!916385 () Bool)

(assert (=> d!117305 m!916385))

(declare-fun m!916387 () Bool)

(assert (=> d!117305 m!916387))

(assert (=> b!989014 d!117305))

(declare-fun d!117307 () Bool)

(declare-fun e!557883 () Bool)

(assert (=> d!117307 e!557883))

(declare-fun res!661647 () Bool)

(assert (=> d!117307 (=> (not res!661647) (not e!557883))))

(declare-fun lt!438854 () ListLongMap!13653)

(assert (=> d!117307 (= res!661647 (contains!5690 lt!438854 (_1!7494 (tuple2!14967 lt!438581 minValue!1220))))))

(declare-fun lt!438857 () List!20850)

(assert (=> d!117307 (= lt!438854 (ListLongMap!13654 lt!438857))))

(declare-fun lt!438856 () Unit!32696)

(declare-fun lt!438855 () Unit!32696)

(assert (=> d!117307 (= lt!438856 lt!438855)))

(assert (=> d!117307 (= (getValueByKey!516 lt!438857 (_1!7494 (tuple2!14967 lt!438581 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438581 minValue!1220))))))

(assert (=> d!117307 (= lt!438855 (lemmaContainsTupThenGetReturnValue!273 lt!438857 (_1!7494 (tuple2!14967 lt!438581 minValue!1220)) (_2!7494 (tuple2!14967 lt!438581 minValue!1220))))))

(assert (=> d!117307 (= lt!438857 (insertStrictlySorted!330 (toList!6842 lt!438594) (_1!7494 (tuple2!14967 lt!438581 minValue!1220)) (_2!7494 (tuple2!14967 lt!438581 minValue!1220))))))

(assert (=> d!117307 (= (+!3111 lt!438594 (tuple2!14967 lt!438581 minValue!1220)) lt!438854)))

(declare-fun b!989379 () Bool)

(declare-fun res!661648 () Bool)

(assert (=> b!989379 (=> (not res!661648) (not e!557883))))

(assert (=> b!989379 (= res!661648 (= (getValueByKey!516 (toList!6842 lt!438854) (_1!7494 (tuple2!14967 lt!438581 minValue!1220))) (Some!521 (_2!7494 (tuple2!14967 lt!438581 minValue!1220)))))))

(declare-fun b!989380 () Bool)

(assert (=> b!989380 (= e!557883 (contains!5692 (toList!6842 lt!438854) (tuple2!14967 lt!438581 minValue!1220)))))

(assert (= (and d!117307 res!661647) b!989379))

(assert (= (and b!989379 res!661648) b!989380))

(declare-fun m!916389 () Bool)

(assert (=> d!117307 m!916389))

(declare-fun m!916391 () Bool)

(assert (=> d!117307 m!916391))

(declare-fun m!916393 () Bool)

(assert (=> d!117307 m!916393))

(declare-fun m!916395 () Bool)

(assert (=> d!117307 m!916395))

(declare-fun m!916397 () Bool)

(assert (=> b!989379 m!916397))

(declare-fun m!916399 () Bool)

(assert (=> b!989380 m!916399))

(assert (=> b!989014 d!117307))

(declare-fun d!117309 () Bool)

(assert (=> d!117309 (= (apply!888 (+!3111 lt!438584 (tuple2!14967 lt!438583 zeroValue!1220)) lt!438590) (get!15617 (getValueByKey!516 (toList!6842 (+!3111 lt!438584 (tuple2!14967 lt!438583 zeroValue!1220))) lt!438590)))))

(declare-fun bs!28066 () Bool)

(assert (= bs!28066 d!117309))

(declare-fun m!916401 () Bool)

(assert (=> bs!28066 m!916401))

(assert (=> bs!28066 m!916401))

(declare-fun m!916403 () Bool)

(assert (=> bs!28066 m!916403))

(assert (=> b!989014 d!117309))

(declare-fun d!117311 () Bool)

(assert (=> d!117311 (= (apply!888 (+!3111 lt!438584 (tuple2!14967 lt!438583 zeroValue!1220)) lt!438590) (apply!888 lt!438584 lt!438590))))

(declare-fun lt!438858 () Unit!32696)

(assert (=> d!117311 (= lt!438858 (choose!1623 lt!438584 lt!438583 zeroValue!1220 lt!438590))))

(declare-fun e!557884 () Bool)

(assert (=> d!117311 e!557884))

(declare-fun res!661649 () Bool)

(assert (=> d!117311 (=> (not res!661649) (not e!557884))))

(assert (=> d!117311 (= res!661649 (contains!5690 lt!438584 lt!438590))))

(assert (=> d!117311 (= (addApplyDifferent!464 lt!438584 lt!438583 zeroValue!1220 lt!438590) lt!438858)))

(declare-fun b!989381 () Bool)

(assert (=> b!989381 (= e!557884 (not (= lt!438590 lt!438583)))))

(assert (= (and d!117311 res!661649) b!989381))

(assert (=> d!117311 m!915611))

(assert (=> d!117311 m!915633))

(assert (=> d!117311 m!915611))

(assert (=> d!117311 m!915637))

(declare-fun m!916405 () Bool)

(assert (=> d!117311 m!916405))

(declare-fun m!916407 () Bool)

(assert (=> d!117311 m!916407))

(assert (=> b!989014 d!117311))

(declare-fun d!117313 () Bool)

(declare-fun isEmpty!729 (List!20850) Bool)

(assert (=> d!117313 (= (isEmpty!728 lt!438512) (isEmpty!729 (toList!6842 lt!438512)))))

(declare-fun bs!28067 () Bool)

(assert (= bs!28067 d!117313))

(declare-fun m!916409 () Bool)

(assert (=> bs!28067 m!916409))

(assert (=> b!988931 d!117313))

(declare-fun d!117315 () Bool)

(declare-fun lt!438859 () Bool)

(assert (=> d!117315 (= lt!438859 (select (content!418 (toList!6842 lt!438524)) lt!438464))))

(declare-fun e!557885 () Bool)

(assert (=> d!117315 (= lt!438859 e!557885)))

(declare-fun res!661650 () Bool)

(assert (=> d!117315 (=> (not res!661650) (not e!557885))))

(assert (=> d!117315 (= res!661650 ((_ is Cons!20846) (toList!6842 lt!438524)))))

(assert (=> d!117315 (= (contains!5692 (toList!6842 lt!438524) lt!438464) lt!438859)))

(declare-fun b!989382 () Bool)

(declare-fun e!557886 () Bool)

(assert (=> b!989382 (= e!557885 e!557886)))

(declare-fun res!661651 () Bool)

(assert (=> b!989382 (=> res!661651 e!557886)))

(assert (=> b!989382 (= res!661651 (= (h!22008 (toList!6842 lt!438524)) lt!438464))))

(declare-fun b!989383 () Bool)

(assert (=> b!989383 (= e!557886 (contains!5692 (t!29794 (toList!6842 lt!438524)) lt!438464))))

(assert (= (and d!117315 res!661650) b!989382))

(assert (= (and b!989382 (not res!661651)) b!989383))

(declare-fun m!916411 () Bool)

(assert (=> d!117315 m!916411))

(declare-fun m!916413 () Bool)

(assert (=> d!117315 m!916413))

(declare-fun m!916415 () Bool)

(assert (=> b!989383 m!916415))

(assert (=> b!988953 d!117315))

(assert (=> b!988929 d!117135))

(assert (=> b!988943 d!117143))

(declare-fun b!989384 () Bool)

(declare-fun e!557887 () Bool)

(assert (=> b!989384 (= e!557887 tp_is_empty!23257)))

(declare-fun mapIsEmpty!36937 () Bool)

(declare-fun mapRes!36937 () Bool)

(assert (=> mapIsEmpty!36937 mapRes!36937))

(declare-fun condMapEmpty!36937 () Bool)

(declare-fun mapDefault!36937 () ValueCell!11147)

(assert (=> mapNonEmpty!36936 (= condMapEmpty!36937 (= mapRest!36936 ((as const (Array (_ BitVec 32) ValueCell!11147)) mapDefault!36937)))))

(declare-fun e!557888 () Bool)

(assert (=> mapNonEmpty!36936 (= tp!69927 (and e!557888 mapRes!36937))))

(declare-fun mapNonEmpty!36937 () Bool)

(declare-fun tp!69928 () Bool)

(assert (=> mapNonEmpty!36937 (= mapRes!36937 (and tp!69928 e!557887))))

(declare-fun mapKey!36937 () (_ BitVec 32))

(declare-fun mapValue!36937 () ValueCell!11147)

(declare-fun mapRest!36937 () (Array (_ BitVec 32) ValueCell!11147))

(assert (=> mapNonEmpty!36937 (= mapRest!36936 (store mapRest!36937 mapKey!36937 mapValue!36937))))

(declare-fun b!989385 () Bool)

(assert (=> b!989385 (= e!557888 tp_is_empty!23257)))

(assert (= (and mapNonEmpty!36936 condMapEmpty!36937) mapIsEmpty!36937))

(assert (= (and mapNonEmpty!36936 (not condMapEmpty!36937)) mapNonEmpty!36937))

(assert (= (and mapNonEmpty!36937 ((_ is ValueCellFull!11147) mapValue!36937)) b!989384))

(assert (= (and mapNonEmpty!36936 ((_ is ValueCellFull!11147) mapDefault!36937)) b!989385))

(declare-fun m!916417 () Bool)

(assert (=> mapNonEmpty!36937 m!916417))

(declare-fun b_lambda!15111 () Bool)

(assert (= b_lambda!15109 (or (and start!84542 b_free!20041) b_lambda!15111)))

(declare-fun b_lambda!15113 () Bool)

(assert (= b_lambda!15103 (or (and start!84542 b_free!20041) b_lambda!15113)))

(declare-fun b_lambda!15115 () Bool)

(assert (= b_lambda!15107 (or (and start!84542 b_free!20041) b_lambda!15115)))

(declare-fun b_lambda!15117 () Bool)

(assert (= b_lambda!15105 (or (and start!84542 b_free!20041) b_lambda!15117)))

(check-sat (not b!989344) (not d!117313) (not b!989217) (not b!989270) (not b!989255) (not b!989235) (not bm!41920) (not d!117247) (not b!989128) (not b!989370) (not d!117151) (not b!989131) (not b!989371) (not d!117129) (not b_lambda!15111) tp_is_empty!23257 (not d!117173) (not b!989352) (not d!117241) (not b_lambda!15099) (not b!989262) (not b!989136) (not b!989256) (not b!989238) (not b!989354) (not b!989360) (not b!989313) (not b!989271) (not b!989343) (not b!989179) (not b!989274) (not b!989208) (not b!989092) (not b!989308) (not bm!41906) (not d!117299) (not b!989135) (not d!117279) (not b!989340) (not d!117169) (not b_lambda!15095) (not d!117233) (not b!989134) (not b_lambda!15113) (not d!117137) (not d!117167) (not b_lambda!15117) (not b!989155) (not b!989171) (not d!117295) (not b!989276) (not b!989147) (not d!117125) (not b!989368) (not b!989365) (not d!117237) (not d!117285) (not b!989253) (not d!117111) (not d!117263) (not b!989173) (not b!989133) (not b!989198) (not bm!41912) (not d!117265) (not b!989211) (not b!989231) (not b!989325) (not b!989373) (not b!989287) (not d!117291) (not b!989206) (not b!989299) (not b!989367) (not d!117229) (not d!117199) (not b!989230) (not d!117201) (not d!117227) (not b!989310) (not d!117187) (not b!989148) (not b!989349) (not b!989295) (not b!989201) (not d!117275) (not d!117127) (not b!989210) (not b!989268) (not b!989091) (not b!989242) (not d!117297) (not d!117131) (not d!117305) (not b!989125) (not d!117273) (not b!989337) (not d!117189) (not d!117289) (not d!117261) (not b!989113) (not b!989200) (not b!989257) (not b!989126) (not d!117163) (not bm!41914) (not b!989165) (not d!117211) (not b!989314) (not d!117249) (not d!117293) (not b!989338) (not b!989297) (not b!989226) (not b!989225) (not b!989320) (not b!989326) (not b!989150) (not b!989074) (not b!989209) (not mapNonEmpty!36937) (not d!117301) (not b!989336) (not b!989305) (not b_lambda!15115) (not d!117185) (not b!989228) (not b!989167) (not b!989331) (not d!117153) (not b!989353) (not b!989196) (not b!989154) (not b!989265) (not b!989120) (not b!989333) (not b!989334) (not d!117243) (not d!117179) (not bm!41917) (not b!989293) (not b!989374) (not b!989328) (not b!989291) (not d!117257) (not d!117253) (not b!989123) (not b!989296) (not d!117159) (not d!117171) (not bm!41921) (not d!117283) (not b!989321) b_and!32151 (not d!117235) (not d!117225) (not d!117281) (not d!117181) (not d!117223) (not d!117183) (not b!989284) (not b!989280) (not b!989369) (not b!989072) (not d!117195) (not b!989282) (not d!117315) (not b!989380) (not b!989254) (not b!989379) (not b!989259) (not b!989346) (not d!117157) (not bm!41922) (not b!989170) (not b!989224) (not b!989312) (not b!989241) (not d!117231) (not b!989142) (not b!989153) (not d!117277) (not d!117269) (not b!989269) (not b!989149) (not bm!41913) (not d!117251) (not b!989146) (not b!989275) (not d!117209) (not d!117119) (not b!989264) (not b!989351) (not b!989203) (not b!989258) (not b!989233) (not b!989243) (not b!989363) (not b!989376) (not b!989168) (not b!989327) (not b!989324) (not bm!41909) (not d!117215) (not b!989372) (not d!117117) (not b!989162) (not b!989085) (not d!117287) (not d!117311) (not d!117115) (not d!117149) (not b!989341) (not d!117213) (not d!117145) (not d!117259) (not d!117161) (not d!117141) (not b!989227) (not d!117245) (not b!989232) (not b_lambda!15101) (not b!989114) (not d!117193) (not b_next!20041) (not b!989252) (not b!989163) (not d!117239) (not b_lambda!15085) (not d!117177) (not d!117303) (not b!989267) (not d!117207) (not b_lambda!15097) (not b!989240) (not b!989298) (not d!117309) (not d!117307) (not d!117267) (not d!117217) (not d!117121) (not b!989249) (not b!989383))
(check-sat b_and!32151 (not b_next!20041))
