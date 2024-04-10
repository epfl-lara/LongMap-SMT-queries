; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36640 () Bool)

(assert start!36640)

(declare-fun b!365726 () Bool)

(declare-fun e!223964 () Bool)

(declare-fun e!223966 () Bool)

(declare-fun mapRes!14265 () Bool)

(assert (=> b!365726 (= e!223964 (and e!223966 mapRes!14265))))

(declare-fun condMapEmpty!14265 () Bool)

(declare-datatypes ((V!12405 0))(
  ( (V!12406 (val!4282 Int)) )
))
(declare-datatypes ((ValueCell!3894 0))(
  ( (ValueCellFull!3894 (v!6478 V!12405)) (EmptyCell!3894) )
))
(declare-datatypes ((array!20905 0))(
  ( (array!20906 (arr!9925 (Array (_ BitVec 32) ValueCell!3894)) (size!10277 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20905)

(declare-fun mapDefault!14265 () ValueCell!3894)

(assert (=> b!365726 (= condMapEmpty!14265 (= (arr!9925 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3894)) mapDefault!14265)))))

(declare-fun res!204500 () Bool)

(declare-fun e!223967 () Bool)

(assert (=> start!36640 (=> (not res!204500) (not e!223967))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36640 (= res!204500 (validMask!0 mask!970))))

(assert (=> start!36640 e!223967))

(assert (=> start!36640 true))

(declare-fun array_inv!7348 (array!20905) Bool)

(assert (=> start!36640 (and (array_inv!7348 _values!506) e!223964)))

(declare-datatypes ((array!20907 0))(
  ( (array!20908 (arr!9926 (Array (_ BitVec 32) (_ BitVec 64))) (size!10278 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20907)

(declare-fun array_inv!7349 (array!20907) Bool)

(assert (=> start!36640 (array_inv!7349 _keys!658)))

(declare-fun b!365727 () Bool)

(declare-fun res!204497 () Bool)

(assert (=> b!365727 (=> (not res!204497) (not e!223967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20907 (_ BitVec 32)) Bool)

(assert (=> b!365727 (= res!204497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14265 () Bool)

(declare-fun tp!28341 () Bool)

(declare-fun e!223965 () Bool)

(assert (=> mapNonEmpty!14265 (= mapRes!14265 (and tp!28341 e!223965))))

(declare-fun mapValue!14265 () ValueCell!3894)

(declare-fun mapKey!14265 () (_ BitVec 32))

(declare-fun mapRest!14265 () (Array (_ BitVec 32) ValueCell!3894))

(assert (=> mapNonEmpty!14265 (= (arr!9925 _values!506) (store mapRest!14265 mapKey!14265 mapValue!14265))))

(declare-fun b!365728 () Bool)

(declare-fun res!204498 () Bool)

(assert (=> b!365728 (=> (not res!204498) (not e!223967))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365728 (= res!204498 (and (= (size!10277 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10278 _keys!658) (size!10277 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365729 () Bool)

(declare-fun tp_is_empty!8475 () Bool)

(assert (=> b!365729 (= e!223966 tp_is_empty!8475)))

(declare-fun b!365730 () Bool)

(declare-fun res!204499 () Bool)

(assert (=> b!365730 (=> (not res!204499) (not e!223967))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365730 (= res!204499 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10278 _keys!658))))))

(declare-fun b!365731 () Bool)

(assert (=> b!365731 (= e!223965 tp_is_empty!8475)))

(declare-fun b!365732 () Bool)

(declare-fun res!204501 () Bool)

(assert (=> b!365732 (=> (not res!204501) (not e!223967))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365732 (= res!204501 (validKeyInArray!0 k0!778))))

(declare-fun b!365733 () Bool)

(declare-fun res!204496 () Bool)

(assert (=> b!365733 (=> (not res!204496) (not e!223967))))

(declare-datatypes ((List!5533 0))(
  ( (Nil!5530) (Cons!5529 (h!6385 (_ BitVec 64)) (t!10683 List!5533)) )
))
(declare-fun arrayNoDuplicates!0 (array!20907 (_ BitVec 32) List!5533) Bool)

(assert (=> b!365733 (= res!204496 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5530))))

(declare-fun b!365734 () Bool)

(assert (=> b!365734 (= e!223967 (and (or (= (select (arr!9926 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9926 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!10278 _keys!658)) (bvsge (size!10278 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!14265 () Bool)

(assert (=> mapIsEmpty!14265 mapRes!14265))

(assert (= (and start!36640 res!204500) b!365728))

(assert (= (and b!365728 res!204498) b!365727))

(assert (= (and b!365727 res!204497) b!365733))

(assert (= (and b!365733 res!204496) b!365730))

(assert (= (and b!365730 res!204499) b!365732))

(assert (= (and b!365732 res!204501) b!365734))

(assert (= (and b!365726 condMapEmpty!14265) mapIsEmpty!14265))

(assert (= (and b!365726 (not condMapEmpty!14265)) mapNonEmpty!14265))

(get-info :version)

(assert (= (and mapNonEmpty!14265 ((_ is ValueCellFull!3894) mapValue!14265)) b!365731))

(assert (= (and b!365726 ((_ is ValueCellFull!3894) mapDefault!14265)) b!365729))

(assert (= start!36640 b!365726))

(declare-fun m!363331 () Bool)

(assert (=> b!365733 m!363331))

(declare-fun m!363333 () Bool)

(assert (=> b!365732 m!363333))

(declare-fun m!363335 () Bool)

(assert (=> start!36640 m!363335))

(declare-fun m!363337 () Bool)

(assert (=> start!36640 m!363337))

(declare-fun m!363339 () Bool)

(assert (=> start!36640 m!363339))

(declare-fun m!363341 () Bool)

(assert (=> mapNonEmpty!14265 m!363341))

(declare-fun m!363343 () Bool)

(assert (=> b!365727 m!363343))

(declare-fun m!363345 () Bool)

(assert (=> b!365734 m!363345))

(check-sat (not b!365727) (not mapNonEmpty!14265) tp_is_empty!8475 (not start!36640) (not b!365732) (not b!365733))
(check-sat)
(get-model)

(declare-fun bm!27281 () Bool)

(declare-fun call!27284 () Bool)

(declare-fun c!53900 () Bool)

(assert (=> bm!27281 (= call!27284 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53900 (Cons!5529 (select (arr!9926 _keys!658) #b00000000000000000000000000000000) Nil!5530) Nil!5530)))))

(declare-fun b!365772 () Bool)

(declare-fun e!223992 () Bool)

(assert (=> b!365772 (= e!223992 call!27284)))

(declare-fun b!365774 () Bool)

(assert (=> b!365774 (= e!223992 call!27284)))

(declare-fun b!365773 () Bool)

(declare-fun e!223994 () Bool)

(declare-fun e!223993 () Bool)

(assert (=> b!365773 (= e!223994 e!223993)))

(declare-fun res!204528 () Bool)

(assert (=> b!365773 (=> (not res!204528) (not e!223993))))

(declare-fun e!223995 () Bool)

(assert (=> b!365773 (= res!204528 (not e!223995))))

(declare-fun res!204526 () Bool)

(assert (=> b!365773 (=> (not res!204526) (not e!223995))))

(assert (=> b!365773 (= res!204526 (validKeyInArray!0 (select (arr!9926 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72363 () Bool)

(declare-fun res!204527 () Bool)

(assert (=> d!72363 (=> res!204527 e!223994)))

(assert (=> d!72363 (= res!204527 (bvsge #b00000000000000000000000000000000 (size!10278 _keys!658)))))

(assert (=> d!72363 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5530) e!223994)))

(declare-fun b!365775 () Bool)

(declare-fun contains!2434 (List!5533 (_ BitVec 64)) Bool)

(assert (=> b!365775 (= e!223995 (contains!2434 Nil!5530 (select (arr!9926 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365776 () Bool)

(assert (=> b!365776 (= e!223993 e!223992)))

(assert (=> b!365776 (= c!53900 (validKeyInArray!0 (select (arr!9926 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72363 (not res!204527)) b!365773))

(assert (= (and b!365773 res!204526) b!365775))

(assert (= (and b!365773 res!204528) b!365776))

(assert (= (and b!365776 c!53900) b!365772))

(assert (= (and b!365776 (not c!53900)) b!365774))

(assert (= (or b!365772 b!365774) bm!27281))

(declare-fun m!363363 () Bool)

(assert (=> bm!27281 m!363363))

(declare-fun m!363365 () Bool)

(assert (=> bm!27281 m!363365))

(assert (=> b!365773 m!363363))

(assert (=> b!365773 m!363363))

(declare-fun m!363367 () Bool)

(assert (=> b!365773 m!363367))

(assert (=> b!365775 m!363363))

(assert (=> b!365775 m!363363))

(declare-fun m!363369 () Bool)

(assert (=> b!365775 m!363369))

(assert (=> b!365776 m!363363))

(assert (=> b!365776 m!363363))

(assert (=> b!365776 m!363367))

(assert (=> b!365733 d!72363))

(declare-fun bm!27284 () Bool)

(declare-fun call!27287 () Bool)

(assert (=> bm!27284 (= call!27287 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365785 () Bool)

(declare-fun e!224003 () Bool)

(declare-fun e!224004 () Bool)

(assert (=> b!365785 (= e!224003 e!224004)))

(declare-fun lt!169205 () (_ BitVec 64))

(assert (=> b!365785 (= lt!169205 (select (arr!9926 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11390 0))(
  ( (Unit!11391) )
))
(declare-fun lt!169204 () Unit!11390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20907 (_ BitVec 64) (_ BitVec 32)) Unit!11390)

(assert (=> b!365785 (= lt!169204 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169205 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365785 (arrayContainsKey!0 _keys!658 lt!169205 #b00000000000000000000000000000000)))

(declare-fun lt!169203 () Unit!11390)

(assert (=> b!365785 (= lt!169203 lt!169204)))

(declare-fun res!204534 () Bool)

(declare-datatypes ((SeekEntryResult!3504 0))(
  ( (MissingZero!3504 (index!16195 (_ BitVec 32))) (Found!3504 (index!16196 (_ BitVec 32))) (Intermediate!3504 (undefined!4316 Bool) (index!16197 (_ BitVec 32)) (x!36688 (_ BitVec 32))) (Undefined!3504) (MissingVacant!3504 (index!16198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20907 (_ BitVec 32)) SeekEntryResult!3504)

(assert (=> b!365785 (= res!204534 (= (seekEntryOrOpen!0 (select (arr!9926 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3504 #b00000000000000000000000000000000)))))

(assert (=> b!365785 (=> (not res!204534) (not e!224004))))

(declare-fun b!365786 () Bool)

(declare-fun e!224002 () Bool)

(assert (=> b!365786 (= e!224002 e!224003)))

(declare-fun c!53903 () Bool)

(assert (=> b!365786 (= c!53903 (validKeyInArray!0 (select (arr!9926 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72365 () Bool)

(declare-fun res!204533 () Bool)

(assert (=> d!72365 (=> res!204533 e!224002)))

(assert (=> d!72365 (= res!204533 (bvsge #b00000000000000000000000000000000 (size!10278 _keys!658)))))

(assert (=> d!72365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224002)))

(declare-fun b!365787 () Bool)

(assert (=> b!365787 (= e!224003 call!27287)))

(declare-fun b!365788 () Bool)

(assert (=> b!365788 (= e!224004 call!27287)))

(assert (= (and d!72365 (not res!204533)) b!365786))

(assert (= (and b!365786 c!53903) b!365785))

(assert (= (and b!365786 (not c!53903)) b!365787))

(assert (= (and b!365785 res!204534) b!365788))

(assert (= (or b!365788 b!365787) bm!27284))

(declare-fun m!363371 () Bool)

(assert (=> bm!27284 m!363371))

(assert (=> b!365785 m!363363))

(declare-fun m!363373 () Bool)

(assert (=> b!365785 m!363373))

(declare-fun m!363375 () Bool)

(assert (=> b!365785 m!363375))

(assert (=> b!365785 m!363363))

(declare-fun m!363377 () Bool)

(assert (=> b!365785 m!363377))

(assert (=> b!365786 m!363363))

(assert (=> b!365786 m!363363))

(assert (=> b!365786 m!363367))

(assert (=> b!365727 d!72365))

(declare-fun d!72367 () Bool)

(assert (=> d!72367 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36640 d!72367))

(declare-fun d!72369 () Bool)

(assert (=> d!72369 (= (array_inv!7348 _values!506) (bvsge (size!10277 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36640 d!72369))

(declare-fun d!72371 () Bool)

(assert (=> d!72371 (= (array_inv!7349 _keys!658) (bvsge (size!10278 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36640 d!72371))

(declare-fun d!72373 () Bool)

(assert (=> d!72373 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!365732 d!72373))

(declare-fun b!365795 () Bool)

(declare-fun e!224009 () Bool)

(assert (=> b!365795 (= e!224009 tp_is_empty!8475)))

(declare-fun b!365796 () Bool)

(declare-fun e!224010 () Bool)

(assert (=> b!365796 (= e!224010 tp_is_empty!8475)))

(declare-fun mapIsEmpty!14271 () Bool)

(declare-fun mapRes!14271 () Bool)

(assert (=> mapIsEmpty!14271 mapRes!14271))

(declare-fun mapNonEmpty!14271 () Bool)

(declare-fun tp!28347 () Bool)

(assert (=> mapNonEmpty!14271 (= mapRes!14271 (and tp!28347 e!224009))))

(declare-fun mapKey!14271 () (_ BitVec 32))

(declare-fun mapValue!14271 () ValueCell!3894)

(declare-fun mapRest!14271 () (Array (_ BitVec 32) ValueCell!3894))

(assert (=> mapNonEmpty!14271 (= mapRest!14265 (store mapRest!14271 mapKey!14271 mapValue!14271))))

(declare-fun condMapEmpty!14271 () Bool)

(declare-fun mapDefault!14271 () ValueCell!3894)

(assert (=> mapNonEmpty!14265 (= condMapEmpty!14271 (= mapRest!14265 ((as const (Array (_ BitVec 32) ValueCell!3894)) mapDefault!14271)))))

(assert (=> mapNonEmpty!14265 (= tp!28341 (and e!224010 mapRes!14271))))

(assert (= (and mapNonEmpty!14265 condMapEmpty!14271) mapIsEmpty!14271))

(assert (= (and mapNonEmpty!14265 (not condMapEmpty!14271)) mapNonEmpty!14271))

(assert (= (and mapNonEmpty!14271 ((_ is ValueCellFull!3894) mapValue!14271)) b!365795))

(assert (= (and mapNonEmpty!14265 ((_ is ValueCellFull!3894) mapDefault!14271)) b!365796))

(declare-fun m!363379 () Bool)

(assert (=> mapNonEmpty!14271 m!363379))

(check-sat (not b!365776) (not bm!27281) (not b!365773) (not mapNonEmpty!14271) (not b!365786) (not b!365775) tp_is_empty!8475 (not bm!27284) (not b!365785))
(check-sat)
