; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84384 () Bool)

(assert start!84384)

(declare-fun b_free!19971 () Bool)

(declare-fun b_next!19971 () Bool)

(assert (=> start!84384 (= b_free!19971 (not b_next!19971))))

(declare-fun tp!69688 () Bool)

(declare-fun b_and!32005 () Bool)

(assert (=> start!84384 (= tp!69688 b_and!32005)))

(declare-fun mapNonEmpty!36809 () Bool)

(declare-fun mapRes!36809 () Bool)

(declare-fun tp!69687 () Bool)

(declare-fun e!556614 () Bool)

(assert (=> mapNonEmpty!36809 (= mapRes!36809 (and tp!69687 e!556614))))

(declare-datatypes ((V!35899 0))(
  ( (V!35900 (val!11644 Int)) )
))
(declare-datatypes ((ValueCell!11112 0))(
  ( (ValueCellFull!11112 (v!14206 V!35899)) (EmptyCell!11112) )
))
(declare-datatypes ((array!62329 0))(
  ( (array!62330 (arr!30022 (Array (_ BitVec 32) ValueCell!11112)) (size!30501 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62329)

(declare-fun mapValue!36809 () ValueCell!11112)

(declare-fun mapKey!36809 () (_ BitVec 32))

(declare-fun mapRest!36809 () (Array (_ BitVec 32) ValueCell!11112))

(assert (=> mapNonEmpty!36809 (= (arr!30022 _values!1278) (store mapRest!36809 mapKey!36809 mapValue!36809))))

(declare-fun b!987075 () Bool)

(declare-fun res!660373 () Bool)

(declare-fun e!556617 () Bool)

(assert (=> b!987075 (=> (not res!660373) (not e!556617))))

(declare-datatypes ((array!62331 0))(
  ( (array!62332 (arr!30023 (Array (_ BitVec 32) (_ BitVec 64))) (size!30502 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62331)

(declare-datatypes ((List!20761 0))(
  ( (Nil!20758) (Cons!20757 (h!21919 (_ BitVec 64)) (t!29660 List!20761)) )
))
(declare-fun arrayNoDuplicates!0 (array!62331 (_ BitVec 32) List!20761) Bool)

(assert (=> b!987075 (= res!660373 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20758))))

(declare-fun b!987076 () Bool)

(declare-fun e!556615 () Bool)

(declare-fun tp_is_empty!23187 () Bool)

(assert (=> b!987076 (= e!556615 tp_is_empty!23187)))

(declare-fun b!987077 () Bool)

(assert (=> b!987077 (= e!556614 tp_is_empty!23187)))

(declare-fun b!987078 () Bool)

(declare-fun e!556613 () Bool)

(assert (=> b!987078 (= e!556613 (and e!556615 mapRes!36809))))

(declare-fun condMapEmpty!36809 () Bool)

(declare-fun mapDefault!36809 () ValueCell!11112)

(assert (=> b!987078 (= condMapEmpty!36809 (= (arr!30022 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11112)) mapDefault!36809)))))

(declare-fun b!987079 () Bool)

(declare-fun res!660372 () Bool)

(assert (=> b!987079 (=> (not res!660372) (not e!556617))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987079 (= res!660372 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30502 _keys!1544))))))

(declare-fun res!660374 () Bool)

(assert (=> start!84384 (=> (not res!660374) (not e!556617))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84384 (= res!660374 (validMask!0 mask!1948))))

(assert (=> start!84384 e!556617))

(assert (=> start!84384 true))

(assert (=> start!84384 tp_is_empty!23187))

(declare-fun array_inv!23199 (array!62329) Bool)

(assert (=> start!84384 (and (array_inv!23199 _values!1278) e!556613)))

(assert (=> start!84384 tp!69688))

(declare-fun array_inv!23200 (array!62331) Bool)

(assert (=> start!84384 (array_inv!23200 _keys!1544)))

(declare-fun b!987080 () Bool)

(assert (=> b!987080 (= e!556617 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30023 _keys!1544) from!1932)))))

(declare-fun minValue!1220 () V!35899)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14830 0))(
  ( (tuple2!14831 (_1!7426 (_ BitVec 64)) (_2!7426 V!35899)) )
))
(declare-datatypes ((List!20762 0))(
  ( (Nil!20759) (Cons!20758 (h!21920 tuple2!14830) (t!29661 List!20762)) )
))
(declare-datatypes ((ListLongMap!13527 0))(
  ( (ListLongMap!13528 (toList!6779 List!20762)) )
))
(declare-fun lt!437576 () ListLongMap!13527)

(declare-fun zeroValue!1220 () V!35899)

(declare-fun defaultEntry!1281 () Int)

(declare-fun +!3064 (ListLongMap!13527 tuple2!14830) ListLongMap!13527)

(declare-fun getCurrentListMapNoExtraKeys!3470 (array!62331 array!62329 (_ BitVec 32) (_ BitVec 32) V!35899 V!35899 (_ BitVec 32) Int) ListLongMap!13527)

(assert (=> b!987080 (= lt!437576 (+!3064 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987081 () Bool)

(declare-fun res!660369 () Bool)

(assert (=> b!987081 (=> (not res!660369) (not e!556617))))

(assert (=> b!987081 (= res!660369 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987082 () Bool)

(declare-fun res!660371 () Bool)

(assert (=> b!987082 (=> (not res!660371) (not e!556617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62331 (_ BitVec 32)) Bool)

(assert (=> b!987082 (= res!660371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987083 () Bool)

(declare-fun res!660368 () Bool)

(assert (=> b!987083 (=> (not res!660368) (not e!556617))))

(assert (=> b!987083 (= res!660368 (and (= (size!30501 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30502 _keys!1544) (size!30501 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36809 () Bool)

(assert (=> mapIsEmpty!36809 mapRes!36809))

(declare-fun b!987084 () Bool)

(declare-fun res!660370 () Bool)

(assert (=> b!987084 (=> (not res!660370) (not e!556617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987084 (= res!660370 (validKeyInArray!0 (select (arr!30023 _keys!1544) from!1932)))))

(assert (= (and start!84384 res!660374) b!987083))

(assert (= (and b!987083 res!660368) b!987082))

(assert (= (and b!987082 res!660371) b!987075))

(assert (= (and b!987075 res!660373) b!987079))

(assert (= (and b!987079 res!660372) b!987084))

(assert (= (and b!987084 res!660370) b!987081))

(assert (= (and b!987081 res!660369) b!987080))

(assert (= (and b!987078 condMapEmpty!36809) mapIsEmpty!36809))

(assert (= (and b!987078 (not condMapEmpty!36809)) mapNonEmpty!36809))

(get-info :version)

(assert (= (and mapNonEmpty!36809 ((_ is ValueCellFull!11112) mapValue!36809)) b!987077))

(assert (= (and b!987078 ((_ is ValueCellFull!11112) mapDefault!36809)) b!987076))

(assert (= start!84384 b!987078))

(declare-fun m!913683 () Bool)

(assert (=> b!987075 m!913683))

(declare-fun m!913685 () Bool)

(assert (=> b!987082 m!913685))

(declare-fun m!913687 () Bool)

(assert (=> mapNonEmpty!36809 m!913687))

(declare-fun m!913689 () Bool)

(assert (=> start!84384 m!913689))

(declare-fun m!913691 () Bool)

(assert (=> start!84384 m!913691))

(declare-fun m!913693 () Bool)

(assert (=> start!84384 m!913693))

(declare-fun m!913695 () Bool)

(assert (=> b!987080 m!913695))

(declare-fun m!913697 () Bool)

(assert (=> b!987080 m!913697))

(assert (=> b!987080 m!913697))

(declare-fun m!913699 () Bool)

(assert (=> b!987080 m!913699))

(assert (=> b!987084 m!913695))

(assert (=> b!987084 m!913695))

(declare-fun m!913701 () Bool)

(assert (=> b!987084 m!913701))

(check-sat (not b!987084) (not b!987080) (not start!84384) (not mapNonEmpty!36809) b_and!32005 (not b!987075) tp_is_empty!23187 (not b_next!19971) (not b!987082))
(check-sat b_and!32005 (not b_next!19971))
(get-model)

(declare-fun b!987125 () Bool)

(declare-fun e!556642 () Bool)

(declare-fun e!556643 () Bool)

(assert (=> b!987125 (= e!556642 e!556643)))

(declare-fun c!100025 () Bool)

(assert (=> b!987125 (= c!100025 (validKeyInArray!0 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987126 () Bool)

(declare-fun call!41796 () Bool)

(assert (=> b!987126 (= e!556643 call!41796)))

(declare-fun b!987127 () Bool)

(declare-fun e!556641 () Bool)

(declare-fun contains!5707 (List!20761 (_ BitVec 64)) Bool)

(assert (=> b!987127 (= e!556641 (contains!5707 Nil!20758 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987128 () Bool)

(declare-fun e!556644 () Bool)

(assert (=> b!987128 (= e!556644 e!556642)))

(declare-fun res!660402 () Bool)

(assert (=> b!987128 (=> (not res!660402) (not e!556642))))

(assert (=> b!987128 (= res!660402 (not e!556641))))

(declare-fun res!660403 () Bool)

(assert (=> b!987128 (=> (not res!660403) (not e!556641))))

(assert (=> b!987128 (= res!660403 (validKeyInArray!0 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987129 () Bool)

(assert (=> b!987129 (= e!556643 call!41796)))

(declare-fun d!116903 () Bool)

(declare-fun res!660404 () Bool)

(assert (=> d!116903 (=> res!660404 e!556644)))

(assert (=> d!116903 (= res!660404 (bvsge #b00000000000000000000000000000000 (size!30502 _keys!1544)))))

(assert (=> d!116903 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20758) e!556644)))

(declare-fun bm!41793 () Bool)

(assert (=> bm!41793 (= call!41796 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100025 (Cons!20757 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000) Nil!20758) Nil!20758)))))

(assert (= (and d!116903 (not res!660404)) b!987128))

(assert (= (and b!987128 res!660403) b!987127))

(assert (= (and b!987128 res!660402) b!987125))

(assert (= (and b!987125 c!100025) b!987126))

(assert (= (and b!987125 (not c!100025)) b!987129))

(assert (= (or b!987126 b!987129) bm!41793))

(declare-fun m!913723 () Bool)

(assert (=> b!987125 m!913723))

(assert (=> b!987125 m!913723))

(declare-fun m!913725 () Bool)

(assert (=> b!987125 m!913725))

(assert (=> b!987127 m!913723))

(assert (=> b!987127 m!913723))

(declare-fun m!913727 () Bool)

(assert (=> b!987127 m!913727))

(assert (=> b!987128 m!913723))

(assert (=> b!987128 m!913723))

(assert (=> b!987128 m!913725))

(assert (=> bm!41793 m!913723))

(declare-fun m!913729 () Bool)

(assert (=> bm!41793 m!913729))

(assert (=> b!987075 d!116903))

(declare-fun d!116905 () Bool)

(declare-fun e!556647 () Bool)

(assert (=> d!116905 e!556647))

(declare-fun res!660410 () Bool)

(assert (=> d!116905 (=> (not res!660410) (not e!556647))))

(declare-fun lt!437588 () ListLongMap!13527)

(declare-fun contains!5708 (ListLongMap!13527 (_ BitVec 64)) Bool)

(assert (=> d!116905 (= res!660410 (contains!5708 lt!437588 (_1!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!437591 () List!20762)

(assert (=> d!116905 (= lt!437588 (ListLongMap!13528 lt!437591))))

(declare-datatypes ((Unit!32761 0))(
  ( (Unit!32762) )
))
(declare-fun lt!437589 () Unit!32761)

(declare-fun lt!437590 () Unit!32761)

(assert (=> d!116905 (= lt!437589 lt!437590)))

(declare-datatypes ((Option!516 0))(
  ( (Some!515 (v!14208 V!35899)) (None!514) )
))
(declare-fun getValueByKey!510 (List!20762 (_ BitVec 64)) Option!516)

(assert (=> d!116905 (= (getValueByKey!510 lt!437591 (_1!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!515 (_2!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lemmaContainsTupThenGetReturnValue!269 (List!20762 (_ BitVec 64) V!35899) Unit!32761)

(assert (=> d!116905 (= lt!437590 (lemmaContainsTupThenGetReturnValue!269 lt!437591 (_1!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun insertStrictlySorted!326 (List!20762 (_ BitVec 64) V!35899) List!20762)

(assert (=> d!116905 (= lt!437591 (insertStrictlySorted!326 (toList!6779 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116905 (= (+!3064 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!437588)))

(declare-fun b!987134 () Bool)

(declare-fun res!660409 () Bool)

(assert (=> b!987134 (=> (not res!660409) (not e!556647))))

(assert (=> b!987134 (= res!660409 (= (getValueByKey!510 (toList!6779 lt!437588) (_1!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!515 (_2!7426 (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!987135 () Bool)

(declare-fun contains!5709 (List!20762 tuple2!14830) Bool)

(assert (=> b!987135 (= e!556647 (contains!5709 (toList!6779 lt!437588) (tuple2!14831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!116905 res!660410) b!987134))

(assert (= (and b!987134 res!660409) b!987135))

(declare-fun m!913731 () Bool)

(assert (=> d!116905 m!913731))

(declare-fun m!913733 () Bool)

(assert (=> d!116905 m!913733))

(declare-fun m!913735 () Bool)

(assert (=> d!116905 m!913735))

(declare-fun m!913737 () Bool)

(assert (=> d!116905 m!913737))

(declare-fun m!913739 () Bool)

(assert (=> b!987134 m!913739))

(declare-fun m!913741 () Bool)

(assert (=> b!987135 m!913741))

(assert (=> b!987080 d!116905))

(declare-fun call!41799 () ListLongMap!13527)

(declare-fun bm!41796 () Bool)

(assert (=> bm!41796 (= call!41799 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun lt!437610 () ListLongMap!13527)

(declare-fun b!987160 () Bool)

(declare-fun e!556667 () Bool)

(assert (=> b!987160 (= e!556667 (= lt!437610 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!987161 () Bool)

(declare-fun e!556668 () Bool)

(assert (=> b!987161 (= e!556668 e!556667)))

(declare-fun c!100034 () Bool)

(assert (=> b!987161 (= c!100034 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30502 _keys!1544)))))

(declare-fun b!987162 () Bool)

(declare-fun lt!437608 () Unit!32761)

(declare-fun lt!437609 () Unit!32761)

(assert (=> b!987162 (= lt!437608 lt!437609)))

(declare-fun lt!437606 () ListLongMap!13527)

(declare-fun lt!437607 () V!35899)

(declare-fun lt!437612 () (_ BitVec 64))

(declare-fun lt!437611 () (_ BitVec 64))

(assert (=> b!987162 (not (contains!5708 (+!3064 lt!437606 (tuple2!14831 lt!437612 lt!437607)) lt!437611))))

(declare-fun addStillNotContains!230 (ListLongMap!13527 (_ BitVec 64) V!35899 (_ BitVec 64)) Unit!32761)

(assert (=> b!987162 (= lt!437609 (addStillNotContains!230 lt!437606 lt!437612 lt!437607 lt!437611))))

(assert (=> b!987162 (= lt!437611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!15570 (ValueCell!11112 V!35899) V!35899)

(declare-fun dynLambda!1847 (Int (_ BitVec 64)) V!35899)

(assert (=> b!987162 (= lt!437607 (get!15570 (select (arr!30022 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1847 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987162 (= lt!437612 (select (arr!30023 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!987162 (= lt!437606 call!41799)))

(declare-fun e!556663 () ListLongMap!13527)

(assert (=> b!987162 (= e!556663 (+!3064 call!41799 (tuple2!14831 (select (arr!30023 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15570 (select (arr!30022 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1847 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!987163 () Bool)

(declare-fun e!556662 () ListLongMap!13527)

(assert (=> b!987163 (= e!556662 e!556663)))

(declare-fun c!100036 () Bool)

(assert (=> b!987163 (= c!100036 (validKeyInArray!0 (select (arr!30023 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987164 () Bool)

(declare-fun e!556666 () Bool)

(assert (=> b!987164 (= e!556666 (validKeyInArray!0 (select (arr!30023 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987164 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!987165 () Bool)

(assert (=> b!987165 (= e!556662 (ListLongMap!13528 Nil!20759))))

(declare-fun b!987166 () Bool)

(declare-fun isEmpty!718 (ListLongMap!13527) Bool)

(assert (=> b!987166 (= e!556667 (isEmpty!718 lt!437610))))

(declare-fun b!987168 () Bool)

(declare-fun res!660422 () Bool)

(declare-fun e!556664 () Bool)

(assert (=> b!987168 (=> (not res!660422) (not e!556664))))

(assert (=> b!987168 (= res!660422 (not (contains!5708 lt!437610 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987169 () Bool)

(assert (=> b!987169 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30502 _keys!1544)))))

(assert (=> b!987169 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30501 _values!1278)))))

(declare-fun e!556665 () Bool)

(declare-fun apply!891 (ListLongMap!13527 (_ BitVec 64)) V!35899)

(assert (=> b!987169 (= e!556665 (= (apply!891 lt!437610 (select (arr!30023 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15570 (select (arr!30022 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1847 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!987170 () Bool)

(assert (=> b!987170 (= e!556664 e!556668)))

(declare-fun c!100035 () Bool)

(assert (=> b!987170 (= c!100035 e!556666)))

(declare-fun res!660421 () Bool)

(assert (=> b!987170 (=> (not res!660421) (not e!556666))))

(assert (=> b!987170 (= res!660421 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30502 _keys!1544)))))

(declare-fun b!987171 () Bool)

(assert (=> b!987171 (= e!556668 e!556665)))

(assert (=> b!987171 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30502 _keys!1544)))))

(declare-fun res!660419 () Bool)

(assert (=> b!987171 (= res!660419 (contains!5708 lt!437610 (select (arr!30023 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987171 (=> (not res!660419) (not e!556665))))

(declare-fun d!116907 () Bool)

(assert (=> d!116907 e!556664))

(declare-fun res!660420 () Bool)

(assert (=> d!116907 (=> (not res!660420) (not e!556664))))

(assert (=> d!116907 (= res!660420 (not (contains!5708 lt!437610 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116907 (= lt!437610 e!556662)))

(declare-fun c!100037 () Bool)

(assert (=> d!116907 (= c!100037 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30502 _keys!1544)))))

(assert (=> d!116907 (validMask!0 mask!1948)))

(assert (=> d!116907 (= (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437610)))

(declare-fun b!987167 () Bool)

(assert (=> b!987167 (= e!556663 call!41799)))

(assert (= (and d!116907 c!100037) b!987165))

(assert (= (and d!116907 (not c!100037)) b!987163))

(assert (= (and b!987163 c!100036) b!987162))

(assert (= (and b!987163 (not c!100036)) b!987167))

(assert (= (or b!987162 b!987167) bm!41796))

(assert (= (and d!116907 res!660420) b!987168))

(assert (= (and b!987168 res!660422) b!987170))

(assert (= (and b!987170 res!660421) b!987164))

(assert (= (and b!987170 c!100035) b!987171))

(assert (= (and b!987170 (not c!100035)) b!987161))

(assert (= (and b!987171 res!660419) b!987169))

(assert (= (and b!987161 c!100034) b!987160))

(assert (= (and b!987161 (not c!100034)) b!987166))

(declare-fun b_lambda!14989 () Bool)

(assert (=> (not b_lambda!14989) (not b!987162)))

(declare-fun t!29663 () Bool)

(declare-fun tb!6751 () Bool)

(assert (=> (and start!84384 (= defaultEntry!1281 defaultEntry!1281) t!29663) tb!6751))

(declare-fun result!13491 () Bool)

(assert (=> tb!6751 (= result!13491 tp_is_empty!23187)))

(assert (=> b!987162 t!29663))

(declare-fun b_and!32009 () Bool)

(assert (= b_and!32005 (and (=> t!29663 result!13491) b_and!32009)))

(declare-fun b_lambda!14991 () Bool)

(assert (=> (not b_lambda!14991) (not b!987169)))

(assert (=> b!987169 t!29663))

(declare-fun b_and!32011 () Bool)

(assert (= b_and!32009 (and (=> t!29663 result!13491) b_and!32011)))

(declare-fun m!913743 () Bool)

(assert (=> b!987163 m!913743))

(assert (=> b!987163 m!913743))

(declare-fun m!913745 () Bool)

(assert (=> b!987163 m!913745))

(declare-fun m!913747 () Bool)

(assert (=> b!987166 m!913747))

(assert (=> b!987171 m!913743))

(assert (=> b!987171 m!913743))

(declare-fun m!913749 () Bool)

(assert (=> b!987171 m!913749))

(declare-fun m!913751 () Bool)

(assert (=> d!116907 m!913751))

(assert (=> d!116907 m!913689))

(declare-fun m!913753 () Bool)

(assert (=> bm!41796 m!913753))

(declare-fun m!913755 () Bool)

(assert (=> b!987169 m!913755))

(declare-fun m!913757 () Bool)

(assert (=> b!987169 m!913757))

(declare-fun m!913759 () Bool)

(assert (=> b!987169 m!913759))

(assert (=> b!987169 m!913755))

(assert (=> b!987169 m!913743))

(declare-fun m!913761 () Bool)

(assert (=> b!987169 m!913761))

(assert (=> b!987169 m!913757))

(assert (=> b!987169 m!913743))

(declare-fun m!913763 () Bool)

(assert (=> b!987168 m!913763))

(declare-fun m!913765 () Bool)

(assert (=> b!987162 m!913765))

(assert (=> b!987162 m!913765))

(declare-fun m!913767 () Bool)

(assert (=> b!987162 m!913767))

(assert (=> b!987162 m!913755))

(assert (=> b!987162 m!913757))

(assert (=> b!987162 m!913759))

(assert (=> b!987162 m!913755))

(declare-fun m!913769 () Bool)

(assert (=> b!987162 m!913769))

(assert (=> b!987162 m!913757))

(declare-fun m!913771 () Bool)

(assert (=> b!987162 m!913771))

(assert (=> b!987162 m!913743))

(assert (=> b!987164 m!913743))

(assert (=> b!987164 m!913743))

(assert (=> b!987164 m!913745))

(assert (=> b!987160 m!913753))

(assert (=> b!987080 d!116907))

(declare-fun d!116909 () Bool)

(assert (=> d!116909 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84384 d!116909))

(declare-fun d!116911 () Bool)

(assert (=> d!116911 (= (array_inv!23199 _values!1278) (bvsge (size!30501 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84384 d!116911))

(declare-fun d!116913 () Bool)

(assert (=> d!116913 (= (array_inv!23200 _keys!1544) (bvsge (size!30502 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84384 d!116913))

(declare-fun d!116915 () Bool)

(assert (=> d!116915 (= (validKeyInArray!0 (select (arr!30023 _keys!1544) from!1932)) (and (not (= (select (arr!30023 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30023 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987084 d!116915))

(declare-fun b!987182 () Bool)

(declare-fun e!556675 () Bool)

(declare-fun call!41802 () Bool)

(assert (=> b!987182 (= e!556675 call!41802)))

(declare-fun b!987183 () Bool)

(declare-fun e!556677 () Bool)

(assert (=> b!987183 (= e!556675 e!556677)))

(declare-fun lt!437621 () (_ BitVec 64))

(assert (=> b!987183 (= lt!437621 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!437619 () Unit!32761)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62331 (_ BitVec 64) (_ BitVec 32)) Unit!32761)

(assert (=> b!987183 (= lt!437619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437621 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!987183 (arrayContainsKey!0 _keys!1544 lt!437621 #b00000000000000000000000000000000)))

(declare-fun lt!437620 () Unit!32761)

(assert (=> b!987183 (= lt!437620 lt!437619)))

(declare-fun res!660428 () Bool)

(declare-datatypes ((SeekEntryResult!9206 0))(
  ( (MissingZero!9206 (index!39195 (_ BitVec 32))) (Found!9206 (index!39196 (_ BitVec 32))) (Intermediate!9206 (undefined!10018 Bool) (index!39197 (_ BitVec 32)) (x!85890 (_ BitVec 32))) (Undefined!9206) (MissingVacant!9206 (index!39198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62331 (_ BitVec 32)) SeekEntryResult!9206)

(assert (=> b!987183 (= res!660428 (= (seekEntryOrOpen!0 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9206 #b00000000000000000000000000000000)))))

(assert (=> b!987183 (=> (not res!660428) (not e!556677))))

(declare-fun d!116917 () Bool)

(declare-fun res!660427 () Bool)

(declare-fun e!556676 () Bool)

(assert (=> d!116917 (=> res!660427 e!556676)))

(assert (=> d!116917 (= res!660427 (bvsge #b00000000000000000000000000000000 (size!30502 _keys!1544)))))

(assert (=> d!116917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!556676)))

(declare-fun b!987184 () Bool)

(assert (=> b!987184 (= e!556677 call!41802)))

(declare-fun b!987185 () Bool)

(assert (=> b!987185 (= e!556676 e!556675)))

(declare-fun c!100040 () Bool)

(assert (=> b!987185 (= c!100040 (validKeyInArray!0 (select (arr!30023 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41799 () Bool)

(assert (=> bm!41799 (= call!41802 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116917 (not res!660427)) b!987185))

(assert (= (and b!987185 c!100040) b!987183))

(assert (= (and b!987185 (not c!100040)) b!987182))

(assert (= (and b!987183 res!660428) b!987184))

(assert (= (or b!987184 b!987182) bm!41799))

(assert (=> b!987183 m!913723))

(declare-fun m!913773 () Bool)

(assert (=> b!987183 m!913773))

(declare-fun m!913775 () Bool)

(assert (=> b!987183 m!913775))

(assert (=> b!987183 m!913723))

(declare-fun m!913777 () Bool)

(assert (=> b!987183 m!913777))

(assert (=> b!987185 m!913723))

(assert (=> b!987185 m!913723))

(assert (=> b!987185 m!913725))

(declare-fun m!913779 () Bool)

(assert (=> bm!41799 m!913779))

(assert (=> b!987082 d!116917))

(declare-fun mapNonEmpty!36815 () Bool)

(declare-fun mapRes!36815 () Bool)

(declare-fun tp!69697 () Bool)

(declare-fun e!556682 () Bool)

(assert (=> mapNonEmpty!36815 (= mapRes!36815 (and tp!69697 e!556682))))

(declare-fun mapRest!36815 () (Array (_ BitVec 32) ValueCell!11112))

(declare-fun mapValue!36815 () ValueCell!11112)

(declare-fun mapKey!36815 () (_ BitVec 32))

(assert (=> mapNonEmpty!36815 (= mapRest!36809 (store mapRest!36815 mapKey!36815 mapValue!36815))))

(declare-fun condMapEmpty!36815 () Bool)

(declare-fun mapDefault!36815 () ValueCell!11112)

(assert (=> mapNonEmpty!36809 (= condMapEmpty!36815 (= mapRest!36809 ((as const (Array (_ BitVec 32) ValueCell!11112)) mapDefault!36815)))))

(declare-fun e!556683 () Bool)

(assert (=> mapNonEmpty!36809 (= tp!69687 (and e!556683 mapRes!36815))))

(declare-fun b!987193 () Bool)

(assert (=> b!987193 (= e!556683 tp_is_empty!23187)))

(declare-fun mapIsEmpty!36815 () Bool)

(assert (=> mapIsEmpty!36815 mapRes!36815))

(declare-fun b!987192 () Bool)

(assert (=> b!987192 (= e!556682 tp_is_empty!23187)))

(assert (= (and mapNonEmpty!36809 condMapEmpty!36815) mapIsEmpty!36815))

(assert (= (and mapNonEmpty!36809 (not condMapEmpty!36815)) mapNonEmpty!36815))

(assert (= (and mapNonEmpty!36815 ((_ is ValueCellFull!11112) mapValue!36815)) b!987192))

(assert (= (and mapNonEmpty!36809 ((_ is ValueCellFull!11112) mapDefault!36815)) b!987193))

(declare-fun m!913781 () Bool)

(assert (=> mapNonEmpty!36815 m!913781))

(declare-fun b_lambda!14993 () Bool)

(assert (= b_lambda!14989 (or (and start!84384 b_free!19971) b_lambda!14993)))

(declare-fun b_lambda!14995 () Bool)

(assert (= b_lambda!14991 (or (and start!84384 b_free!19971) b_lambda!14995)))

(check-sat (not b!987162) (not b_lambda!14993) (not d!116905) b_and!32011 (not b!987166) (not b!987183) (not b!987128) (not b_lambda!14995) (not d!116907) (not b!987171) (not bm!41796) (not b!987164) (not mapNonEmpty!36815) (not b!987185) tp_is_empty!23187 (not b!987163) (not b!987135) (not b!987125) (not b!987127) (not bm!41793) (not b!987168) (not b!987169) (not bm!41799) (not b!987160) (not b!987134) (not b_next!19971))
(check-sat b_and!32011 (not b_next!19971))
