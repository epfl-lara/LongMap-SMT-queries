; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132048 () Bool)

(assert start!132048)

(declare-fun b_free!31761 () Bool)

(declare-fun b_next!31761 () Bool)

(assert (=> start!132048 (= b_free!31761 (not b_next!31761))))

(declare-fun tp!111535 () Bool)

(declare-fun b_and!51171 () Bool)

(assert (=> start!132048 (= tp!111535 b_and!51171)))

(declare-fun b!1547705 () Bool)

(declare-fun res!1060803 () Bool)

(declare-fun e!861498 () Bool)

(assert (=> b!1547705 (=> (not res!1060803) (not e!861498))))

(declare-datatypes ((array!103274 0))(
  ( (array!103275 (arr!49839 (Array (_ BitVec 32) (_ BitVec 64))) (size!50389 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103274)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103274 (_ BitVec 32)) Bool)

(assert (=> b!1547705 (= res!1060803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1060797 () Bool)

(assert (=> start!132048 (=> (not res!1060797) (not e!861498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132048 (= res!1060797 (validMask!0 mask!926))))

(assert (=> start!132048 e!861498))

(declare-fun array_inv!38757 (array!103274) Bool)

(assert (=> start!132048 (array_inv!38757 _keys!618)))

(declare-fun tp_is_empty!38037 () Bool)

(assert (=> start!132048 tp_is_empty!38037))

(assert (=> start!132048 true))

(assert (=> start!132048 tp!111535))

(declare-datatypes ((V!59159 0))(
  ( (V!59160 (val!19096 Int)) )
))
(declare-datatypes ((ValueCell!18108 0))(
  ( (ValueCellFull!18108 (v!21897 V!59159)) (EmptyCell!18108) )
))
(declare-datatypes ((array!103276 0))(
  ( (array!103277 (arr!49840 (Array (_ BitVec 32) ValueCell!18108)) (size!50390 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103276)

(declare-fun e!861503 () Bool)

(declare-fun array_inv!38758 (array!103276) Bool)

(assert (=> start!132048 (and (array_inv!38758 _values!470) e!861503)))

(declare-fun b!1547706 () Bool)

(declare-fun c!142054 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666958 () Bool)

(assert (=> b!1547706 (= c!142054 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666958))))

(declare-datatypes ((tuple2!24572 0))(
  ( (tuple2!24573 (_1!12297 (_ BitVec 64)) (_2!12297 V!59159)) )
))
(declare-datatypes ((List!36068 0))(
  ( (Nil!36065) (Cons!36064 (h!37509 tuple2!24572) (t!50762 List!36068)) )
))
(declare-datatypes ((ListLongMap!22181 0))(
  ( (ListLongMap!22182 (toList!11106 List!36068)) )
))
(declare-fun e!861497 () ListLongMap!22181)

(declare-fun e!861499 () ListLongMap!22181)

(assert (=> b!1547706 (= e!861497 e!861499)))

(declare-fun b!1547707 () Bool)

(declare-fun e!861502 () Bool)

(declare-fun mapRes!58759 () Bool)

(assert (=> b!1547707 (= e!861503 (and e!861502 mapRes!58759))))

(declare-fun condMapEmpty!58759 () Bool)

(declare-fun mapDefault!58759 () ValueCell!18108)

(assert (=> b!1547707 (= condMapEmpty!58759 (= (arr!49840 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18108)) mapDefault!58759)))))

(declare-fun b!1547708 () Bool)

(declare-fun call!69939 () ListLongMap!22181)

(assert (=> b!1547708 (= e!861499 call!69939)))

(declare-fun zeroValue!436 () V!59159)

(declare-fun call!69935 () ListLongMap!22181)

(declare-fun call!69937 () ListLongMap!22181)

(declare-fun c!142053 () Bool)

(declare-fun bm!69932 () Bool)

(declare-fun call!69938 () ListLongMap!22181)

(declare-fun minValue!436 () V!59159)

(declare-fun c!142055 () Bool)

(declare-fun +!4937 (ListLongMap!22181 tuple2!24572) ListLongMap!22181)

(assert (=> bm!69932 (= call!69935 (+!4937 (ite c!142055 call!69938 (ite c!142053 call!69937 call!69939)) (ite (or c!142055 c!142053) (tuple2!24573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58759 () Bool)

(assert (=> mapIsEmpty!58759 mapRes!58759))

(declare-fun bm!69933 () Bool)

(assert (=> bm!69933 (= call!69937 call!69938)))

(declare-fun b!1547709 () Bool)

(declare-fun e!861496 () ListLongMap!22181)

(assert (=> b!1547709 (= e!861496 (+!4937 call!69935 (tuple2!24573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547710 () Bool)

(declare-fun call!69936 () ListLongMap!22181)

(assert (=> b!1547710 (= e!861497 call!69936)))

(declare-fun b!1547711 () Bool)

(declare-fun res!1060800 () Bool)

(assert (=> b!1547711 (=> (not res!1060800) (not e!861498))))

(assert (=> b!1547711 (= res!1060800 (and (= (size!50390 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50389 _keys!618) (size!50390 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547712 () Bool)

(declare-fun res!1060801 () Bool)

(assert (=> b!1547712 (=> (not res!1060801) (not e!861498))))

(declare-datatypes ((List!36069 0))(
  ( (Nil!36066) (Cons!36065 (h!37510 (_ BitVec 64)) (t!50763 List!36069)) )
))
(declare-fun arrayNoDuplicates!0 (array!103274 (_ BitVec 32) List!36069) Bool)

(assert (=> b!1547712 (= res!1060801 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36066))))

(declare-fun bm!69934 () Bool)

(assert (=> bm!69934 (= call!69939 call!69937)))

(declare-fun b!1547713 () Bool)

(declare-fun e!861501 () Bool)

(assert (=> b!1547713 (= e!861498 e!861501)))

(declare-fun res!1060799 () Bool)

(assert (=> b!1547713 (=> (not res!1060799) (not e!861501))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547713 (= res!1060799 (bvslt from!762 (size!50389 _keys!618)))))

(declare-fun lt!666961 () ListLongMap!22181)

(assert (=> b!1547713 (= lt!666961 e!861496)))

(assert (=> b!1547713 (= c!142055 (and (not lt!666958) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547713 (= lt!666958 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547714 () Bool)

(assert (=> b!1547714 (= e!861502 tp_is_empty!38037)))

(declare-fun mapNonEmpty!58759 () Bool)

(declare-fun tp!111534 () Bool)

(declare-fun e!861500 () Bool)

(assert (=> mapNonEmpty!58759 (= mapRes!58759 (and tp!111534 e!861500))))

(declare-fun mapValue!58759 () ValueCell!18108)

(declare-fun mapRest!58759 () (Array (_ BitVec 32) ValueCell!18108))

(declare-fun mapKey!58759 () (_ BitVec 32))

(assert (=> mapNonEmpty!58759 (= (arr!49840 _values!470) (store mapRest!58759 mapKey!58759 mapValue!58759))))

(declare-fun b!1547715 () Bool)

(declare-fun res!1060802 () Bool)

(assert (=> b!1547715 (=> (not res!1060802) (not e!861498))))

(assert (=> b!1547715 (= res!1060802 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50389 _keys!618))))))

(declare-fun b!1547716 () Bool)

(assert (=> b!1547716 (= e!861499 call!69936)))

(declare-fun b!1547717 () Bool)

(assert (=> b!1547717 (= e!861496 e!861497)))

(assert (=> b!1547717 (= c!142053 (and (not lt!666958) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69935 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6565 (array!103274 array!103276 (_ BitVec 32) (_ BitVec 32) V!59159 V!59159 (_ BitVec 32) Int) ListLongMap!22181)

(assert (=> bm!69935 (= call!69938 (getCurrentListMapNoExtraKeys!6565 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547718 () Bool)

(declare-fun res!1060798 () Bool)

(assert (=> b!1547718 (=> (not res!1060798) (not e!861501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547718 (= res!1060798 (validKeyInArray!0 (select (arr!49839 _keys!618) from!762)))))

(declare-fun b!1547719 () Bool)

(assert (=> b!1547719 (= e!861500 tp_is_empty!38037)))

(declare-fun bm!69936 () Bool)

(assert (=> bm!69936 (= call!69936 call!69935)))

(declare-fun b!1547720 () Bool)

(assert (=> b!1547720 (= e!861501 (not true))))

(declare-fun lt!666962 () ListLongMap!22181)

(declare-fun apply!1057 (ListLongMap!22181 (_ BitVec 64)) V!59159)

(assert (=> b!1547720 (= (apply!1057 (+!4937 lt!666962 (tuple2!24573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49839 _keys!618) from!762)) (apply!1057 lt!666962 (select (arr!49839 _keys!618) from!762)))))

(declare-datatypes ((Unit!51564 0))(
  ( (Unit!51565) )
))
(declare-fun lt!666959 () Unit!51564)

(declare-fun addApplyDifferent!599 (ListLongMap!22181 (_ BitVec 64) V!59159 (_ BitVec 64)) Unit!51564)

(assert (=> b!1547720 (= lt!666959 (addApplyDifferent!599 lt!666962 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49839 _keys!618) from!762)))))

(declare-fun contains!10064 (ListLongMap!22181 (_ BitVec 64)) Bool)

(assert (=> b!1547720 (contains!10064 (+!4937 lt!666962 (tuple2!24573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49839 _keys!618) from!762))))

(declare-fun lt!666960 () Unit!51564)

(declare-fun addStillContains!1252 (ListLongMap!22181 (_ BitVec 64) V!59159 (_ BitVec 64)) Unit!51564)

(assert (=> b!1547720 (= lt!666960 (addStillContains!1252 lt!666962 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49839 _keys!618) from!762)))))

(assert (=> b!1547720 (= lt!666962 (getCurrentListMapNoExtraKeys!6565 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132048 res!1060797) b!1547711))

(assert (= (and b!1547711 res!1060800) b!1547705))

(assert (= (and b!1547705 res!1060803) b!1547712))

(assert (= (and b!1547712 res!1060801) b!1547715))

(assert (= (and b!1547715 res!1060802) b!1547713))

(assert (= (and b!1547713 c!142055) b!1547709))

(assert (= (and b!1547713 (not c!142055)) b!1547717))

(assert (= (and b!1547717 c!142053) b!1547710))

(assert (= (and b!1547717 (not c!142053)) b!1547706))

(assert (= (and b!1547706 c!142054) b!1547716))

(assert (= (and b!1547706 (not c!142054)) b!1547708))

(assert (= (or b!1547716 b!1547708) bm!69934))

(assert (= (or b!1547710 bm!69934) bm!69933))

(assert (= (or b!1547710 b!1547716) bm!69936))

(assert (= (or b!1547709 bm!69933) bm!69935))

(assert (= (or b!1547709 bm!69936) bm!69932))

(assert (= (and b!1547713 res!1060799) b!1547718))

(assert (= (and b!1547718 res!1060798) b!1547720))

(assert (= (and b!1547707 condMapEmpty!58759) mapIsEmpty!58759))

(assert (= (and b!1547707 (not condMapEmpty!58759)) mapNonEmpty!58759))

(get-info :version)

(assert (= (and mapNonEmpty!58759 ((_ is ValueCellFull!18108) mapValue!58759)) b!1547719))

(assert (= (and b!1547707 ((_ is ValueCellFull!18108) mapDefault!58759)) b!1547714))

(assert (= start!132048 b!1547707))

(declare-fun m!1427257 () Bool)

(assert (=> b!1547718 m!1427257))

(assert (=> b!1547718 m!1427257))

(declare-fun m!1427259 () Bool)

(assert (=> b!1547718 m!1427259))

(declare-fun m!1427261 () Bool)

(assert (=> b!1547720 m!1427261))

(assert (=> b!1547720 m!1427257))

(assert (=> b!1547720 m!1427257))

(declare-fun m!1427263 () Bool)

(assert (=> b!1547720 m!1427263))

(declare-fun m!1427265 () Bool)

(assert (=> b!1547720 m!1427265))

(assert (=> b!1547720 m!1427257))

(declare-fun m!1427267 () Bool)

(assert (=> b!1547720 m!1427267))

(declare-fun m!1427269 () Bool)

(assert (=> b!1547720 m!1427269))

(assert (=> b!1547720 m!1427269))

(assert (=> b!1547720 m!1427257))

(declare-fun m!1427271 () Bool)

(assert (=> b!1547720 m!1427271))

(assert (=> b!1547720 m!1427257))

(declare-fun m!1427273 () Bool)

(assert (=> b!1547720 m!1427273))

(assert (=> b!1547720 m!1427257))

(declare-fun m!1427275 () Bool)

(assert (=> b!1547720 m!1427275))

(assert (=> b!1547720 m!1427265))

(declare-fun m!1427277 () Bool)

(assert (=> b!1547712 m!1427277))

(declare-fun m!1427279 () Bool)

(assert (=> start!132048 m!1427279))

(declare-fun m!1427281 () Bool)

(assert (=> start!132048 m!1427281))

(declare-fun m!1427283 () Bool)

(assert (=> start!132048 m!1427283))

(declare-fun m!1427285 () Bool)

(assert (=> mapNonEmpty!58759 m!1427285))

(declare-fun m!1427287 () Bool)

(assert (=> b!1547705 m!1427287))

(assert (=> bm!69935 m!1427261))

(declare-fun m!1427289 () Bool)

(assert (=> bm!69932 m!1427289))

(declare-fun m!1427291 () Bool)

(assert (=> b!1547709 m!1427291))

(check-sat (not b!1547705) (not mapNonEmpty!58759) (not b!1547718) (not bm!69935) (not start!132048) b_and!51171 tp_is_empty!38037 (not b!1547709) (not bm!69932) (not b!1547712) (not b_next!31761) (not b!1547720))
(check-sat b_and!51171 (not b_next!31761))
