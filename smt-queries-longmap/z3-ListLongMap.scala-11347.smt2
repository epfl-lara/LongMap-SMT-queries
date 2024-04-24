; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132398 () Bool)

(assert start!132398)

(declare-fun b_free!31699 () Bool)

(declare-fun b_next!31699 () Bool)

(assert (=> start!132398 (= b_free!31699 (not b_next!31699))))

(declare-fun tp!111348 () Bool)

(declare-fun b_and!51111 () Bool)

(assert (=> start!132398 (= tp!111348 b_and!51111)))

(declare-fun res!1061009 () Bool)

(declare-fun e!862169 () Bool)

(assert (=> start!132398 (=> (not res!1061009) (not e!862169))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132398 (= res!1061009 (validMask!0 mask!926))))

(assert (=> start!132398 e!862169))

(declare-datatypes ((array!103278 0))(
  ( (array!103279 (arr!49834 (Array (_ BitVec 32) (_ BitVec 64))) (size!50385 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103278)

(declare-fun array_inv!39029 (array!103278) Bool)

(assert (=> start!132398 (array_inv!39029 _keys!618)))

(declare-fun tp_is_empty!37975 () Bool)

(assert (=> start!132398 tp_is_empty!37975))

(assert (=> start!132398 true))

(assert (=> start!132398 tp!111348))

(declare-datatypes ((V!59077 0))(
  ( (V!59078 (val!19065 Int)) )
))
(declare-datatypes ((ValueCell!18077 0))(
  ( (ValueCellFull!18077 (v!21858 V!59077)) (EmptyCell!18077) )
))
(declare-datatypes ((array!103280 0))(
  ( (array!103281 (arr!49835 (Array (_ BitVec 32) ValueCell!18077)) (size!50386 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103280)

(declare-fun e!862175 () Bool)

(declare-fun array_inv!39030 (array!103280) Bool)

(assert (=> start!132398 (and (array_inv!39030 _values!470) e!862175)))

(declare-fun b!1548653 () Bool)

(declare-fun res!1061011 () Bool)

(assert (=> b!1548653 (=> (not res!1061011) (not e!862169))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1548653 (= res!1061011 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50385 _keys!618))))))

(declare-fun b!1548654 () Bool)

(declare-datatypes ((tuple2!24572 0))(
  ( (tuple2!24573 (_1!12297 (_ BitVec 64)) (_2!12297 V!59077)) )
))
(declare-datatypes ((List!36059 0))(
  ( (Nil!36056) (Cons!36055 (h!37518 tuple2!24572) (t!50745 List!36059)) )
))
(declare-datatypes ((ListLongMap!22189 0))(
  ( (ListLongMap!22190 (toList!11110 List!36059)) )
))
(declare-fun e!862172 () ListLongMap!22189)

(declare-fun call!69622 () ListLongMap!22189)

(assert (=> b!1548654 (= e!862172 call!69622)))

(declare-fun b!1548655 () Bool)

(declare-fun res!1061006 () Bool)

(assert (=> b!1548655 (=> (not res!1061006) (not e!862169))))

(declare-datatypes ((List!36060 0))(
  ( (Nil!36057) (Cons!36056 (h!37519 (_ BitVec 64)) (t!50746 List!36060)) )
))
(declare-fun arrayNoDuplicates!0 (array!103278 (_ BitVec 32) List!36060) Bool)

(assert (=> b!1548655 (= res!1061006 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36057))))

(declare-fun b!1548656 () Bool)

(declare-fun e!862168 () Bool)

(assert (=> b!1548656 (= e!862168 (not true))))

(declare-fun zeroValue!436 () V!59077)

(declare-fun lt!667420 () ListLongMap!22189)

(declare-fun contains!10093 (ListLongMap!22189 (_ BitVec 64)) Bool)

(declare-fun +!4955 (ListLongMap!22189 tuple2!24572) ListLongMap!22189)

(assert (=> b!1548656 (contains!10093 (+!4955 lt!667420 (tuple2!24573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49834 _keys!618) from!762))))

(declare-datatypes ((Unit!51455 0))(
  ( (Unit!51456) )
))
(declare-fun lt!667418 () Unit!51455)

(declare-fun addStillContains!1235 (ListLongMap!22189 (_ BitVec 64) V!59077 (_ BitVec 64)) Unit!51455)

(assert (=> b!1548656 (= lt!667418 (addStillContains!1235 lt!667420 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49834 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun minValue!436 () V!59077)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6591 (array!103278 array!103280 (_ BitVec 32) (_ BitVec 32) V!59077 V!59077 (_ BitVec 32) Int) ListLongMap!22189)

(assert (=> b!1548656 (= lt!667420 (getCurrentListMapNoExtraKeys!6591 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58666 () Bool)

(declare-fun mapRes!58666 () Bool)

(declare-fun tp!111349 () Bool)

(declare-fun e!862171 () Bool)

(assert (=> mapNonEmpty!58666 (= mapRes!58666 (and tp!111349 e!862171))))

(declare-fun mapValue!58666 () ValueCell!18077)

(declare-fun mapKey!58666 () (_ BitVec 32))

(declare-fun mapRest!58666 () (Array (_ BitVec 32) ValueCell!18077))

(assert (=> mapNonEmpty!58666 (= (arr!49835 _values!470) (store mapRest!58666 mapKey!58666 mapValue!58666))))

(declare-fun b!1548657 () Bool)

(declare-fun e!862176 () Bool)

(assert (=> b!1548657 (= e!862176 tp_is_empty!37975)))

(declare-fun b!1548658 () Bool)

(declare-fun e!862174 () ListLongMap!22189)

(assert (=> b!1548658 (= e!862174 e!862172)))

(declare-fun c!142575 () Bool)

(declare-fun lt!667419 () Bool)

(assert (=> b!1548658 (= c!142575 (and (not lt!667419) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548659 () Bool)

(declare-fun c!142574 () Bool)

(assert (=> b!1548659 (= c!142574 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667419))))

(declare-fun e!862173 () ListLongMap!22189)

(assert (=> b!1548659 (= e!862172 e!862173)))

(declare-fun bm!69617 () Bool)

(declare-fun call!69620 () ListLongMap!22189)

(assert (=> bm!69617 (= call!69620 (getCurrentListMapNoExtraKeys!6591 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548660 () Bool)

(assert (=> b!1548660 (= e!862173 call!69622)))

(declare-fun b!1548661 () Bool)

(declare-fun res!1061010 () Bool)

(assert (=> b!1548661 (=> (not res!1061010) (not e!862168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548661 (= res!1061010 (validKeyInArray!0 (select (arr!49834 _keys!618) from!762)))))

(declare-fun b!1548662 () Bool)

(assert (=> b!1548662 (= e!862171 tp_is_empty!37975)))

(declare-fun bm!69618 () Bool)

(declare-fun call!69624 () ListLongMap!22189)

(assert (=> bm!69618 (= call!69624 call!69620)))

(declare-fun mapIsEmpty!58666 () Bool)

(assert (=> mapIsEmpty!58666 mapRes!58666))

(declare-fun b!1548663 () Bool)

(declare-fun call!69623 () ListLongMap!22189)

(assert (=> b!1548663 (= e!862173 call!69623)))

(declare-fun bm!69619 () Bool)

(assert (=> bm!69619 (= call!69623 call!69624)))

(declare-fun b!1548664 () Bool)

(declare-fun res!1061007 () Bool)

(assert (=> b!1548664 (=> (not res!1061007) (not e!862169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103278 (_ BitVec 32)) Bool)

(assert (=> b!1548664 (= res!1061007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69620 () Bool)

(declare-fun call!69621 () ListLongMap!22189)

(assert (=> bm!69620 (= call!69622 call!69621)))

(declare-fun b!1548665 () Bool)

(assert (=> b!1548665 (= e!862174 (+!4955 call!69621 (tuple2!24573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun c!142576 () Bool)

(declare-fun bm!69621 () Bool)

(assert (=> bm!69621 (= call!69621 (+!4955 (ite c!142576 call!69620 (ite c!142575 call!69624 call!69623)) (ite (or c!142576 c!142575) (tuple2!24573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548666 () Bool)

(declare-fun res!1061008 () Bool)

(assert (=> b!1548666 (=> (not res!1061008) (not e!862169))))

(assert (=> b!1548666 (= res!1061008 (and (= (size!50386 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50385 _keys!618) (size!50386 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548667 () Bool)

(assert (=> b!1548667 (= e!862175 (and e!862176 mapRes!58666))))

(declare-fun condMapEmpty!58666 () Bool)

(declare-fun mapDefault!58666 () ValueCell!18077)

(assert (=> b!1548667 (= condMapEmpty!58666 (= (arr!49835 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18077)) mapDefault!58666)))))

(declare-fun b!1548668 () Bool)

(assert (=> b!1548668 (= e!862169 e!862168)))

(declare-fun res!1061012 () Bool)

(assert (=> b!1548668 (=> (not res!1061012) (not e!862168))))

(assert (=> b!1548668 (= res!1061012 (bvslt from!762 (size!50385 _keys!618)))))

(declare-fun lt!667417 () ListLongMap!22189)

(assert (=> b!1548668 (= lt!667417 e!862174)))

(assert (=> b!1548668 (= c!142576 (and (not lt!667419) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548668 (= lt!667419 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!132398 res!1061009) b!1548666))

(assert (= (and b!1548666 res!1061008) b!1548664))

(assert (= (and b!1548664 res!1061007) b!1548655))

(assert (= (and b!1548655 res!1061006) b!1548653))

(assert (= (and b!1548653 res!1061011) b!1548668))

(assert (= (and b!1548668 c!142576) b!1548665))

(assert (= (and b!1548668 (not c!142576)) b!1548658))

(assert (= (and b!1548658 c!142575) b!1548654))

(assert (= (and b!1548658 (not c!142575)) b!1548659))

(assert (= (and b!1548659 c!142574) b!1548660))

(assert (= (and b!1548659 (not c!142574)) b!1548663))

(assert (= (or b!1548660 b!1548663) bm!69619))

(assert (= (or b!1548654 bm!69619) bm!69618))

(assert (= (or b!1548654 b!1548660) bm!69620))

(assert (= (or b!1548665 bm!69618) bm!69617))

(assert (= (or b!1548665 bm!69620) bm!69621))

(assert (= (and b!1548668 res!1061012) b!1548661))

(assert (= (and b!1548661 res!1061010) b!1548656))

(assert (= (and b!1548667 condMapEmpty!58666) mapIsEmpty!58666))

(assert (= (and b!1548667 (not condMapEmpty!58666)) mapNonEmpty!58666))

(get-info :version)

(assert (= (and mapNonEmpty!58666 ((_ is ValueCellFull!18077) mapValue!58666)) b!1548662))

(assert (= (and b!1548667 ((_ is ValueCellFull!18077) mapDefault!58666)) b!1548657))

(assert (= start!132398 b!1548667))

(declare-fun m!1428465 () Bool)

(assert (=> bm!69621 m!1428465))

(declare-fun m!1428467 () Bool)

(assert (=> start!132398 m!1428467))

(declare-fun m!1428469 () Bool)

(assert (=> start!132398 m!1428469))

(declare-fun m!1428471 () Bool)

(assert (=> start!132398 m!1428471))

(declare-fun m!1428473 () Bool)

(assert (=> b!1548656 m!1428473))

(declare-fun m!1428475 () Bool)

(assert (=> b!1548656 m!1428475))

(declare-fun m!1428477 () Bool)

(assert (=> b!1548656 m!1428477))

(assert (=> b!1548656 m!1428473))

(declare-fun m!1428479 () Bool)

(assert (=> b!1548656 m!1428479))

(assert (=> b!1548656 m!1428473))

(declare-fun m!1428481 () Bool)

(assert (=> b!1548656 m!1428481))

(assert (=> b!1548656 m!1428479))

(declare-fun m!1428483 () Bool)

(assert (=> b!1548664 m!1428483))

(declare-fun m!1428485 () Bool)

(assert (=> b!1548665 m!1428485))

(declare-fun m!1428487 () Bool)

(assert (=> mapNonEmpty!58666 m!1428487))

(assert (=> bm!69617 m!1428477))

(declare-fun m!1428489 () Bool)

(assert (=> b!1548655 m!1428489))

(assert (=> b!1548661 m!1428473))

(assert (=> b!1548661 m!1428473))

(declare-fun m!1428491 () Bool)

(assert (=> b!1548661 m!1428491))

(check-sat tp_is_empty!37975 (not b_next!31699) (not b!1548664) (not b!1548661) (not b!1548656) (not b!1548655) b_and!51111 (not mapNonEmpty!58666) (not b!1548665) (not start!132398) (not bm!69617) (not bm!69621))
(check-sat b_and!51111 (not b_next!31699))
