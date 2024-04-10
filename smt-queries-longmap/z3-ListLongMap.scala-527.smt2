; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13154 () Bool)

(assert start!13154)

(declare-fun b!115667 () Bool)

(declare-fun b_free!2717 () Bool)

(declare-fun b_next!2717 () Bool)

(assert (=> b!115667 (= b_free!2717 (not b_next!2717))))

(declare-fun tp!10513 () Bool)

(declare-fun b_and!7187 () Bool)

(assert (=> b!115667 (= tp!10513 b_and!7187)))

(declare-fun b!115666 () Bool)

(declare-fun b_free!2719 () Bool)

(declare-fun b_next!2719 () Bool)

(assert (=> b!115666 (= b_free!2719 (not b_next!2719))))

(declare-fun tp!10516 () Bool)

(declare-fun b_and!7189 () Bool)

(assert (=> b!115666 (= tp!10516 b_and!7189)))

(declare-fun mapIsEmpty!4257 () Bool)

(declare-fun mapRes!4257 () Bool)

(assert (=> mapIsEmpty!4257 mapRes!4257))

(declare-fun b!115653 () Bool)

(declare-fun e!75480 () Bool)

(declare-fun tp_is_empty!2775 () Bool)

(assert (=> b!115653 (= e!75480 tp_is_empty!2775)))

(declare-fun b!115654 () Bool)

(declare-fun e!75476 () Bool)

(assert (=> b!115654 (= e!75476 tp_is_empty!2775)))

(declare-fun mapNonEmpty!4257 () Bool)

(declare-fun tp!10515 () Bool)

(assert (=> mapNonEmpty!4257 (= mapRes!4257 (and tp!10515 e!75480))))

(declare-fun mapKey!4258 () (_ BitVec 32))

(declare-datatypes ((V!3347 0))(
  ( (V!3348 (val!1432 Int)) )
))
(declare-datatypes ((ValueCell!1044 0))(
  ( (ValueCellFull!1044 (v!3032 V!3347)) (EmptyCell!1044) )
))
(declare-fun mapRest!4257 () (Array (_ BitVec 32) ValueCell!1044))

(declare-datatypes ((array!4553 0))(
  ( (array!4554 (arr!2159 (Array (_ BitVec 32) (_ BitVec 64))) (size!2419 (_ BitVec 32))) )
))
(declare-datatypes ((array!4555 0))(
  ( (array!4556 (arr!2160 (Array (_ BitVec 32) ValueCell!1044)) (size!2420 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!996 0))(
  ( (LongMapFixedSize!997 (defaultEntry!2707 Int) (mask!6917 (_ BitVec 32)) (extraKeys!2496 (_ BitVec 32)) (zeroValue!2574 V!3347) (minValue!2574 V!3347) (_size!547 (_ BitVec 32)) (_keys!4429 array!4553) (_values!2690 array!4555) (_vacant!547 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!996)

(declare-fun mapValue!4258 () ValueCell!1044)

(assert (=> mapNonEmpty!4257 (= (arr!2160 (_values!2690 newMap!16)) (store mapRest!4257 mapKey!4258 mapValue!4258))))

(declare-fun b!115655 () Bool)

(declare-fun res!56715 () Bool)

(declare-fun e!75478 () Bool)

(assert (=> b!115655 (=> (not res!56715) (not e!75478))))

(declare-fun valid!472 (LongMapFixedSize!996) Bool)

(assert (=> b!115655 (= res!56715 (valid!472 newMap!16))))

(declare-fun b!115656 () Bool)

(declare-datatypes ((Cell!794 0))(
  ( (Cell!795 (v!3033 LongMapFixedSize!996)) )
))
(declare-datatypes ((LongMap!794 0))(
  ( (LongMap!795 (underlying!408 Cell!794)) )
))
(declare-fun thiss!992 () LongMap!794)

(declare-datatypes ((tuple2!2524 0))(
  ( (tuple2!2525 (_1!1273 (_ BitVec 64)) (_2!1273 V!3347)) )
))
(declare-datatypes ((List!1674 0))(
  ( (Nil!1671) (Cons!1670 (h!2270 tuple2!2524) (t!5928 List!1674)) )
))
(declare-datatypes ((ListLongMap!1647 0))(
  ( (ListLongMap!1648 (toList!839 List!1674)) )
))
(declare-fun lt!60024 () ListLongMap!1647)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun e!75481 () Bool)

(declare-fun getCurrentListMap!520 (array!4553 array!4555 (_ BitVec 32) (_ BitVec 32) V!3347 V!3347 (_ BitVec 32) Int) ListLongMap!1647)

(assert (=> b!115656 (= e!75481 (not (= (getCurrentListMap!520 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) lt!60024)))))

(declare-fun mapNonEmpty!4258 () Bool)

(declare-fun mapRes!4258 () Bool)

(declare-fun tp!10514 () Bool)

(assert (=> mapNonEmpty!4258 (= mapRes!4258 (and tp!10514 e!75476))))

(declare-fun mapKey!4257 () (_ BitVec 32))

(declare-fun mapValue!4257 () ValueCell!1044)

(declare-fun mapRest!4258 () (Array (_ BitVec 32) ValueCell!1044))

(assert (=> mapNonEmpty!4258 (= (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (store mapRest!4258 mapKey!4257 mapValue!4257))))

(declare-fun b!115657 () Bool)

(declare-fun e!75484 () Bool)

(assert (=> b!115657 (= e!75484 tp_is_empty!2775)))

(declare-fun b!115658 () Bool)

(declare-fun e!75477 () Bool)

(declare-fun e!75482 () Bool)

(assert (=> b!115658 (= e!75477 (and e!75482 mapRes!4258))))

(declare-fun condMapEmpty!4258 () Bool)

(declare-fun mapDefault!4257 () ValueCell!1044)

(assert (=> b!115658 (= condMapEmpty!4258 (= (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1044)) mapDefault!4257)))))

(declare-fun b!115659 () Bool)

(declare-fun e!75485 () Bool)

(declare-fun e!75483 () Bool)

(assert (=> b!115659 (= e!75485 e!75483)))

(declare-fun b!115660 () Bool)

(declare-fun res!56717 () Bool)

(assert (=> b!115660 (=> (not res!56717) (not e!75478))))

(assert (=> b!115660 (= res!56717 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun b!115661 () Bool)

(assert (=> b!115661 (= e!75482 tp_is_empty!2775)))

(declare-fun b!115663 () Bool)

(declare-fun e!75486 () Bool)

(assert (=> b!115663 (= e!75486 (and e!75484 mapRes!4257))))

(declare-fun condMapEmpty!4257 () Bool)

(declare-fun mapDefault!4258 () ValueCell!1044)

(assert (=> b!115663 (= condMapEmpty!4257 (= (arr!2160 (_values!2690 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1044)) mapDefault!4258)))))

(declare-fun b!115664 () Bool)

(declare-fun res!56716 () Bool)

(assert (=> b!115664 (=> (not res!56716) (not e!75478))))

(assert (=> b!115664 (= res!56716 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6917 newMap!16)) (_size!547 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115665 () Bool)

(assert (=> b!115665 (= e!75478 e!75481)))

(declare-fun res!56719 () Bool)

(assert (=> b!115665 (=> (not res!56719) (not e!75481))))

(declare-fun lt!60023 () ListLongMap!1647)

(assert (=> b!115665 (= res!56719 (and (= lt!60023 lt!60024) (or (= (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun map!1349 (LongMapFixedSize!996) ListLongMap!1647)

(assert (=> b!115665 (= lt!60024 (map!1349 newMap!16))))

(assert (=> b!115665 (= lt!60023 (getCurrentListMap!520 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun res!56718 () Bool)

(assert (=> start!13154 (=> (not res!56718) (not e!75478))))

(declare-fun valid!473 (LongMap!794) Bool)

(assert (=> start!13154 (= res!56718 (valid!473 thiss!992))))

(assert (=> start!13154 e!75478))

(assert (=> start!13154 e!75485))

(assert (=> start!13154 true))

(declare-fun e!75489 () Bool)

(assert (=> start!13154 e!75489))

(declare-fun b!115662 () Bool)

(declare-fun e!75479 () Bool)

(assert (=> b!115662 (= e!75483 e!75479)))

(declare-fun mapIsEmpty!4258 () Bool)

(assert (=> mapIsEmpty!4258 mapRes!4258))

(declare-fun array_inv!1359 (array!4553) Bool)

(declare-fun array_inv!1360 (array!4555) Bool)

(assert (=> b!115666 (= e!75489 (and tp!10516 tp_is_empty!2775 (array_inv!1359 (_keys!4429 newMap!16)) (array_inv!1360 (_values!2690 newMap!16)) e!75486))))

(assert (=> b!115667 (= e!75479 (and tp!10513 tp_is_empty!2775 (array_inv!1359 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (array_inv!1360 (_values!2690 (v!3033 (underlying!408 thiss!992)))) e!75477))))

(assert (= (and start!13154 res!56718) b!115660))

(assert (= (and b!115660 res!56717) b!115655))

(assert (= (and b!115655 res!56715) b!115664))

(assert (= (and b!115664 res!56716) b!115665))

(assert (= (and b!115665 res!56719) b!115656))

(assert (= (and b!115658 condMapEmpty!4258) mapIsEmpty!4258))

(assert (= (and b!115658 (not condMapEmpty!4258)) mapNonEmpty!4258))

(get-info :version)

(assert (= (and mapNonEmpty!4258 ((_ is ValueCellFull!1044) mapValue!4257)) b!115654))

(assert (= (and b!115658 ((_ is ValueCellFull!1044) mapDefault!4257)) b!115661))

(assert (= b!115667 b!115658))

(assert (= b!115662 b!115667))

(assert (= b!115659 b!115662))

(assert (= start!13154 b!115659))

(assert (= (and b!115663 condMapEmpty!4257) mapIsEmpty!4257))

(assert (= (and b!115663 (not condMapEmpty!4257)) mapNonEmpty!4257))

(assert (= (and mapNonEmpty!4257 ((_ is ValueCellFull!1044) mapValue!4258)) b!115653))

(assert (= (and b!115663 ((_ is ValueCellFull!1044) mapDefault!4258)) b!115657))

(assert (= b!115666 b!115663))

(assert (= start!13154 b!115666))

(declare-fun m!131677 () Bool)

(assert (=> b!115655 m!131677))

(declare-fun m!131679 () Bool)

(assert (=> mapNonEmpty!4258 m!131679))

(declare-fun m!131681 () Bool)

(assert (=> b!115667 m!131681))

(declare-fun m!131683 () Bool)

(assert (=> b!115667 m!131683))

(declare-fun m!131685 () Bool)

(assert (=> b!115666 m!131685))

(declare-fun m!131687 () Bool)

(assert (=> b!115666 m!131687))

(declare-fun m!131689 () Bool)

(assert (=> mapNonEmpty!4257 m!131689))

(declare-fun m!131691 () Bool)

(assert (=> b!115656 m!131691))

(declare-fun m!131693 () Bool)

(assert (=> start!13154 m!131693))

(declare-fun m!131695 () Bool)

(assert (=> b!115665 m!131695))

(declare-fun m!131697 () Bool)

(assert (=> b!115665 m!131697))

(declare-fun m!131699 () Bool)

(assert (=> b!115665 m!131699))

(check-sat (not b!115656) (not b!115667) (not mapNonEmpty!4257) tp_is_empty!2775 (not start!13154) (not b_next!2719) (not b!115665) b_and!7187 (not mapNonEmpty!4258) b_and!7189 (not b!115666) (not b!115655) (not b_next!2717))
(check-sat b_and!7187 b_and!7189 (not b_next!2717) (not b_next!2719))
(get-model)

(declare-fun b!115755 () Bool)

(declare-datatypes ((Unit!3602 0))(
  ( (Unit!3603) )
))
(declare-fun e!75567 () Unit!3602)

(declare-fun lt!60089 () Unit!3602)

(assert (=> b!115755 (= e!75567 lt!60089)))

(declare-fun lt!60075 () ListLongMap!1647)

(declare-fun getCurrentListMapNoExtraKeys!128 (array!4553 array!4555 (_ BitVec 32) (_ BitVec 32) V!3347 V!3347 (_ BitVec 32) Int) ListLongMap!1647)

(assert (=> b!115755 (= lt!60075 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60077 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60086 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60086 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60091 () Unit!3602)

(declare-fun addStillContains!80 (ListLongMap!1647 (_ BitVec 64) V!3347 (_ BitVec 64)) Unit!3602)

(assert (=> b!115755 (= lt!60091 (addStillContains!80 lt!60075 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60086))))

(declare-fun contains!861 (ListLongMap!1647 (_ BitVec 64)) Bool)

(declare-fun +!162 (ListLongMap!1647 tuple2!2524) ListLongMap!1647)

(assert (=> b!115755 (contains!861 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60086)))

(declare-fun lt!60094 () Unit!3602)

(assert (=> b!115755 (= lt!60094 lt!60091)))

(declare-fun lt!60081 () ListLongMap!1647)

(assert (=> b!115755 (= lt!60081 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60082 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60082 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60080 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60080 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60083 () Unit!3602)

(declare-fun addApplyDifferent!80 (ListLongMap!1647 (_ BitVec 64) V!3347 (_ BitVec 64)) Unit!3602)

(assert (=> b!115755 (= lt!60083 (addApplyDifferent!80 lt!60081 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60080))))

(declare-fun apply!104 (ListLongMap!1647 (_ BitVec 64)) V!3347)

(assert (=> b!115755 (= (apply!104 (+!162 lt!60081 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60080) (apply!104 lt!60081 lt!60080))))

(declare-fun lt!60079 () Unit!3602)

(assert (=> b!115755 (= lt!60079 lt!60083)))

(declare-fun lt!60096 () ListLongMap!1647)

(assert (=> b!115755 (= lt!60096 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60084 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60093 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60093 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!60095 () Unit!3602)

(assert (=> b!115755 (= lt!60095 (addApplyDifferent!80 lt!60096 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60093))))

(assert (=> b!115755 (= (apply!104 (+!162 lt!60096 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60093) (apply!104 lt!60096 lt!60093))))

(declare-fun lt!60087 () Unit!3602)

(assert (=> b!115755 (= lt!60087 lt!60095)))

(declare-fun lt!60085 () ListLongMap!1647)

(assert (=> b!115755 (= lt!60085 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60076 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60076 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60090 () (_ BitVec 64))

(assert (=> b!115755 (= lt!60090 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(assert (=> b!115755 (= lt!60089 (addApplyDifferent!80 lt!60085 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60090))))

(assert (=> b!115755 (= (apply!104 (+!162 lt!60085 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60090) (apply!104 lt!60085 lt!60090))))

(declare-fun b!115756 () Bool)

(declare-fun Unit!3604 () Unit!3602)

(assert (=> b!115756 (= e!75567 Unit!3604)))

(declare-fun b!115757 () Bool)

(declare-fun e!75568 () ListLongMap!1647)

(declare-fun call!12391 () ListLongMap!1647)

(assert (=> b!115757 (= e!75568 call!12391)))

(declare-fun b!115758 () Bool)

(declare-fun res!56761 () Bool)

(declare-fun e!75561 () Bool)

(assert (=> b!115758 (=> (not res!56761) (not e!75561))))

(declare-fun e!75569 () Bool)

(assert (=> b!115758 (= res!56761 e!75569)))

(declare-fun res!56754 () Bool)

(assert (=> b!115758 (=> res!56754 e!75569)))

(declare-fun e!75562 () Bool)

(assert (=> b!115758 (= res!56754 (not e!75562))))

(declare-fun res!56759 () Bool)

(assert (=> b!115758 (=> (not res!56759) (not e!75562))))

(assert (=> b!115758 (= res!56759 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115759 () Bool)

(declare-fun e!75564 () Bool)

(declare-fun lt!60078 () ListLongMap!1647)

(assert (=> b!115759 (= e!75564 (= (apply!104 lt!60078 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115760 () Bool)

(declare-fun call!12385 () ListLongMap!1647)

(assert (=> b!115760 (= e!75568 call!12385)))

(declare-fun d!32447 () Bool)

(assert (=> d!32447 e!75561))

(declare-fun res!56760 () Bool)

(assert (=> d!32447 (=> (not res!56760) (not e!75561))))

(assert (=> d!32447 (= res!56760 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60092 () ListLongMap!1647)

(assert (=> d!32447 (= lt!60078 lt!60092)))

(declare-fun lt!60088 () Unit!3602)

(assert (=> d!32447 (= lt!60088 e!75567)))

(declare-fun c!20538 () Bool)

(declare-fun e!75559 () Bool)

(assert (=> d!32447 (= c!20538 e!75559)))

(declare-fun res!56756 () Bool)

(assert (=> d!32447 (=> (not res!56756) (not e!75559))))

(assert (=> d!32447 (= res!56756 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun e!75570 () ListLongMap!1647)

(assert (=> d!32447 (= lt!60092 e!75570)))

(declare-fun c!20543 () Bool)

(assert (=> d!32447 (= c!20543 (and (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32447 (validMask!0 (mask!6917 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32447 (= (getCurrentListMap!520 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) lt!60078)))

(declare-fun bm!12382 () Bool)

(declare-fun call!12388 () ListLongMap!1647)

(assert (=> bm!12382 (= call!12391 call!12388)))

(declare-fun b!115761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!115761 (= e!75559 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115762 () Bool)

(declare-fun e!75566 () ListLongMap!1647)

(assert (=> b!115762 (= e!75566 call!12391)))

(declare-fun b!115763 () Bool)

(assert (=> b!115763 (= e!75570 e!75566)))

(declare-fun c!20540 () Bool)

(assert (=> b!115763 (= c!20540 (and (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115764 () Bool)

(assert (=> b!115764 (= e!75570 (+!162 call!12388 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115765 () Bool)

(declare-fun e!75565 () Bool)

(assert (=> b!115765 (= e!75569 e!75565)))

(declare-fun res!56757 () Bool)

(assert (=> b!115765 (=> (not res!56757) (not e!75565))))

(assert (=> b!115765 (= res!56757 (contains!861 lt!60078 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115765 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115766 () Bool)

(declare-fun e!75563 () Bool)

(assert (=> b!115766 (= e!75563 e!75564)))

(declare-fun res!56755 () Bool)

(declare-fun call!12389 () Bool)

(assert (=> b!115766 (= res!56755 call!12389)))

(assert (=> b!115766 (=> (not res!56755) (not e!75564))))

(declare-fun b!115767 () Bool)

(declare-fun e!75558 () Bool)

(assert (=> b!115767 (= e!75558 (= (apply!104 lt!60078 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun bm!12383 () Bool)

(declare-fun call!12390 () Bool)

(assert (=> bm!12383 (= call!12390 (contains!861 lt!60078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12384 () Bool)

(declare-fun call!12386 () ListLongMap!1647)

(declare-fun call!12387 () ListLongMap!1647)

(assert (=> bm!12384 (= call!12386 call!12387)))

(declare-fun b!115768 () Bool)

(assert (=> b!115768 (= e!75563 (not call!12389))))

(declare-fun b!115769 () Bool)

(declare-fun get!1398 (ValueCell!1044 V!3347) V!3347)

(declare-fun dynLambda!404 (Int (_ BitVec 64)) V!3347)

(assert (=> b!115769 (= e!75565 (= (apply!104 lt!60078 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115769 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2420 (_values!2690 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115769 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115770 () Bool)

(declare-fun res!56753 () Bool)

(assert (=> b!115770 (=> (not res!56753) (not e!75561))))

(assert (=> b!115770 (= res!56753 e!75563)))

(declare-fun c!20542 () Bool)

(assert (=> b!115770 (= c!20542 (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!115771 () Bool)

(declare-fun e!75560 () Bool)

(assert (=> b!115771 (= e!75560 (not call!12390))))

(declare-fun b!115772 () Bool)

(assert (=> b!115772 (= e!75561 e!75560)))

(declare-fun c!20541 () Bool)

(assert (=> b!115772 (= c!20541 (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115773 () Bool)

(assert (=> b!115773 (= e!75562 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun bm!12385 () Bool)

(assert (=> bm!12385 (= call!12387 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun bm!12386 () Bool)

(assert (=> bm!12386 (= call!12385 call!12386)))

(declare-fun bm!12387 () Bool)

(assert (=> bm!12387 (= call!12389 (contains!861 lt!60078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115774 () Bool)

(assert (=> b!115774 (= e!75560 e!75558)))

(declare-fun res!56758 () Bool)

(assert (=> b!115774 (= res!56758 call!12390)))

(assert (=> b!115774 (=> (not res!56758) (not e!75558))))

(declare-fun b!115775 () Bool)

(declare-fun c!20539 () Bool)

(assert (=> b!115775 (= c!20539 (and (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!115775 (= e!75566 e!75568)))

(declare-fun bm!12388 () Bool)

(assert (=> bm!12388 (= call!12388 (+!162 (ite c!20543 call!12387 (ite c!20540 call!12386 call!12385)) (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (= (and d!32447 c!20543) b!115764))

(assert (= (and d!32447 (not c!20543)) b!115763))

(assert (= (and b!115763 c!20540) b!115762))

(assert (= (and b!115763 (not c!20540)) b!115775))

(assert (= (and b!115775 c!20539) b!115757))

(assert (= (and b!115775 (not c!20539)) b!115760))

(assert (= (or b!115757 b!115760) bm!12386))

(assert (= (or b!115762 bm!12386) bm!12384))

(assert (= (or b!115762 b!115757) bm!12382))

(assert (= (or b!115764 bm!12384) bm!12385))

(assert (= (or b!115764 bm!12382) bm!12388))

(assert (= (and d!32447 res!56756) b!115761))

(assert (= (and d!32447 c!20538) b!115755))

(assert (= (and d!32447 (not c!20538)) b!115756))

(assert (= (and d!32447 res!56760) b!115758))

(assert (= (and b!115758 res!56759) b!115773))

(assert (= (and b!115758 (not res!56754)) b!115765))

(assert (= (and b!115765 res!56757) b!115769))

(assert (= (and b!115758 res!56761) b!115770))

(assert (= (and b!115770 c!20542) b!115766))

(assert (= (and b!115770 (not c!20542)) b!115768))

(assert (= (and b!115766 res!56755) b!115759))

(assert (= (or b!115766 b!115768) bm!12387))

(assert (= (and b!115770 res!56753) b!115772))

(assert (= (and b!115772 c!20541) b!115774))

(assert (= (and b!115772 (not c!20541)) b!115771))

(assert (= (and b!115774 res!56758) b!115767))

(assert (= (or b!115774 b!115771) bm!12383))

(declare-fun b_lambda!5143 () Bool)

(assert (=> (not b_lambda!5143) (not b!115769)))

(declare-fun t!5930 () Bool)

(declare-fun tb!2221 () Bool)

(assert (=> (and b!115667 (= (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) t!5930) tb!2221))

(declare-fun result!3703 () Bool)

(assert (=> tb!2221 (= result!3703 tp_is_empty!2775)))

(assert (=> b!115769 t!5930))

(declare-fun b_and!7195 () Bool)

(assert (= b_and!7187 (and (=> t!5930 result!3703) b_and!7195)))

(declare-fun tb!2223 () Bool)

(declare-fun t!5932 () Bool)

(assert (=> (and b!115666 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) t!5932) tb!2223))

(declare-fun result!3707 () Bool)

(assert (= result!3707 result!3703))

(assert (=> b!115769 t!5932))

(declare-fun b_and!7197 () Bool)

(assert (= b_and!7189 (and (=> t!5932 result!3707) b_and!7197)))

(declare-fun m!131725 () Bool)

(assert (=> b!115755 m!131725))

(declare-fun m!131727 () Bool)

(assert (=> b!115755 m!131727))

(declare-fun m!131729 () Bool)

(assert (=> b!115755 m!131729))

(assert (=> b!115755 m!131725))

(declare-fun m!131731 () Bool)

(assert (=> b!115755 m!131731))

(declare-fun m!131733 () Bool)

(assert (=> b!115755 m!131733))

(declare-fun m!131735 () Bool)

(assert (=> b!115755 m!131735))

(assert (=> b!115755 m!131733))

(declare-fun m!131737 () Bool)

(assert (=> b!115755 m!131737))

(declare-fun m!131739 () Bool)

(assert (=> b!115755 m!131739))

(declare-fun m!131741 () Bool)

(assert (=> b!115755 m!131741))

(declare-fun m!131743 () Bool)

(assert (=> b!115755 m!131743))

(declare-fun m!131745 () Bool)

(assert (=> b!115755 m!131745))

(declare-fun m!131747 () Bool)

(assert (=> b!115755 m!131747))

(assert (=> b!115755 m!131735))

(declare-fun m!131749 () Bool)

(assert (=> b!115755 m!131749))

(assert (=> b!115755 m!131743))

(declare-fun m!131751 () Bool)

(assert (=> b!115755 m!131751))

(declare-fun m!131753 () Bool)

(assert (=> b!115755 m!131753))

(declare-fun m!131755 () Bool)

(assert (=> b!115755 m!131755))

(declare-fun m!131757 () Bool)

(assert (=> b!115755 m!131757))

(declare-fun m!131759 () Bool)

(assert (=> bm!12383 m!131759))

(assert (=> bm!12385 m!131755))

(declare-fun m!131761 () Bool)

(assert (=> bm!12388 m!131761))

(assert (=> b!115769 m!131751))

(declare-fun m!131763 () Bool)

(assert (=> b!115769 m!131763))

(declare-fun m!131765 () Bool)

(assert (=> b!115769 m!131765))

(assert (=> b!115769 m!131765))

(declare-fun m!131767 () Bool)

(assert (=> b!115769 m!131767))

(declare-fun m!131769 () Bool)

(assert (=> b!115769 m!131769))

(assert (=> b!115769 m!131751))

(assert (=> b!115769 m!131767))

(declare-fun m!131771 () Bool)

(assert (=> b!115764 m!131771))

(declare-fun m!131773 () Bool)

(assert (=> d!32447 m!131773))

(assert (=> b!115773 m!131751))

(assert (=> b!115773 m!131751))

(declare-fun m!131775 () Bool)

(assert (=> b!115773 m!131775))

(declare-fun m!131777 () Bool)

(assert (=> bm!12387 m!131777))

(declare-fun m!131779 () Bool)

(assert (=> b!115759 m!131779))

(assert (=> b!115761 m!131751))

(assert (=> b!115761 m!131751))

(assert (=> b!115761 m!131775))

(declare-fun m!131781 () Bool)

(assert (=> b!115767 m!131781))

(assert (=> b!115765 m!131751))

(assert (=> b!115765 m!131751))

(declare-fun m!131783 () Bool)

(assert (=> b!115765 m!131783))

(assert (=> b!115656 d!32447))

(declare-fun d!32449 () Bool)

(assert (=> d!32449 (= (map!1349 newMap!16) (getCurrentListMap!520 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)))))

(declare-fun bs!4706 () Bool)

(assert (= bs!4706 d!32449))

(declare-fun m!131785 () Bool)

(assert (=> bs!4706 m!131785))

(assert (=> b!115665 d!32449))

(declare-fun b!115778 () Bool)

(declare-fun e!75580 () Unit!3602)

(declare-fun lt!60111 () Unit!3602)

(assert (=> b!115778 (= e!75580 lt!60111)))

(declare-fun lt!60097 () ListLongMap!1647)

(assert (=> b!115778 (= lt!60097 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60099 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60108 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60108 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60113 () Unit!3602)

(assert (=> b!115778 (= lt!60113 (addStillContains!80 lt!60097 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60108))))

(assert (=> b!115778 (contains!861 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60108)))

(declare-fun lt!60116 () Unit!3602)

(assert (=> b!115778 (= lt!60116 lt!60113)))

(declare-fun lt!60103 () ListLongMap!1647)

(assert (=> b!115778 (= lt!60103 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60104 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60104 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60102 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60102 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60105 () Unit!3602)

(assert (=> b!115778 (= lt!60105 (addApplyDifferent!80 lt!60103 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60102))))

(assert (=> b!115778 (= (apply!104 (+!162 lt!60103 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60102) (apply!104 lt!60103 lt!60102))))

(declare-fun lt!60101 () Unit!3602)

(assert (=> b!115778 (= lt!60101 lt!60105)))

(declare-fun lt!60118 () ListLongMap!1647)

(assert (=> b!115778 (= lt!60118 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60106 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60115 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60115 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60117 () Unit!3602)

(assert (=> b!115778 (= lt!60117 (addApplyDifferent!80 lt!60118 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60115))))

(assert (=> b!115778 (= (apply!104 (+!162 lt!60118 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60115) (apply!104 lt!60118 lt!60115))))

(declare-fun lt!60109 () Unit!3602)

(assert (=> b!115778 (= lt!60109 lt!60117)))

(declare-fun lt!60107 () ListLongMap!1647)

(assert (=> b!115778 (= lt!60107 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun lt!60098 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60098 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60112 () (_ BitVec 64))

(assert (=> b!115778 (= lt!60112 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!115778 (= lt!60111 (addApplyDifferent!80 lt!60107 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60112))))

(assert (=> b!115778 (= (apply!104 (+!162 lt!60107 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60112) (apply!104 lt!60107 lt!60112))))

(declare-fun b!115779 () Bool)

(declare-fun Unit!3605 () Unit!3602)

(assert (=> b!115779 (= e!75580 Unit!3605)))

(declare-fun b!115780 () Bool)

(declare-fun e!75581 () ListLongMap!1647)

(declare-fun call!12398 () ListLongMap!1647)

(assert (=> b!115780 (= e!75581 call!12398)))

(declare-fun b!115781 () Bool)

(declare-fun res!56770 () Bool)

(declare-fun e!75574 () Bool)

(assert (=> b!115781 (=> (not res!56770) (not e!75574))))

(declare-fun e!75582 () Bool)

(assert (=> b!115781 (= res!56770 e!75582)))

(declare-fun res!56763 () Bool)

(assert (=> b!115781 (=> res!56763 e!75582)))

(declare-fun e!75575 () Bool)

(assert (=> b!115781 (= res!56763 (not e!75575))))

(declare-fun res!56768 () Bool)

(assert (=> b!115781 (=> (not res!56768) (not e!75575))))

(assert (=> b!115781 (= res!56768 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115782 () Bool)

(declare-fun e!75577 () Bool)

(declare-fun lt!60100 () ListLongMap!1647)

(assert (=> b!115782 (= e!75577 (= (apply!104 lt!60100 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115783 () Bool)

(declare-fun call!12392 () ListLongMap!1647)

(assert (=> b!115783 (= e!75581 call!12392)))

(declare-fun d!32451 () Bool)

(assert (=> d!32451 e!75574))

(declare-fun res!56769 () Bool)

(assert (=> d!32451 (=> (not res!56769) (not e!75574))))

(assert (=> d!32451 (= res!56769 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60114 () ListLongMap!1647)

(assert (=> d!32451 (= lt!60100 lt!60114)))

(declare-fun lt!60110 () Unit!3602)

(assert (=> d!32451 (= lt!60110 e!75580)))

(declare-fun c!20544 () Bool)

(declare-fun e!75572 () Bool)

(assert (=> d!32451 (= c!20544 e!75572)))

(declare-fun res!56765 () Bool)

(assert (=> d!32451 (=> (not res!56765) (not e!75572))))

(assert (=> d!32451 (= res!56765 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun e!75583 () ListLongMap!1647)

(assert (=> d!32451 (= lt!60114 e!75583)))

(declare-fun c!20549 () Bool)

(assert (=> d!32451 (= c!20549 (and (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32451 (validMask!0 (mask!6917 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32451 (= (getCurrentListMap!520 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) lt!60100)))

(declare-fun bm!12389 () Bool)

(declare-fun call!12395 () ListLongMap!1647)

(assert (=> bm!12389 (= call!12398 call!12395)))

(declare-fun b!115784 () Bool)

(assert (=> b!115784 (= e!75572 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115785 () Bool)

(declare-fun e!75579 () ListLongMap!1647)

(assert (=> b!115785 (= e!75579 call!12398)))

(declare-fun b!115786 () Bool)

(assert (=> b!115786 (= e!75583 e!75579)))

(declare-fun c!20546 () Bool)

(assert (=> b!115786 (= c!20546 (and (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115787 () Bool)

(assert (=> b!115787 (= e!75583 (+!162 call!12395 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115788 () Bool)

(declare-fun e!75578 () Bool)

(assert (=> b!115788 (= e!75582 e!75578)))

(declare-fun res!56766 () Bool)

(assert (=> b!115788 (=> (not res!56766) (not e!75578))))

(assert (=> b!115788 (= res!56766 (contains!861 lt!60100 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115788 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115789 () Bool)

(declare-fun e!75576 () Bool)

(assert (=> b!115789 (= e!75576 e!75577)))

(declare-fun res!56764 () Bool)

(declare-fun call!12396 () Bool)

(assert (=> b!115789 (= res!56764 call!12396)))

(assert (=> b!115789 (=> (not res!56764) (not e!75577))))

(declare-fun b!115790 () Bool)

(declare-fun e!75571 () Bool)

(assert (=> b!115790 (= e!75571 (= (apply!104 lt!60100 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun bm!12390 () Bool)

(declare-fun call!12397 () Bool)

(assert (=> bm!12390 (= call!12397 (contains!861 lt!60100 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12391 () Bool)

(declare-fun call!12393 () ListLongMap!1647)

(declare-fun call!12394 () ListLongMap!1647)

(assert (=> bm!12391 (= call!12393 call!12394)))

(declare-fun b!115791 () Bool)

(assert (=> b!115791 (= e!75576 (not call!12396))))

(declare-fun b!115792 () Bool)

(assert (=> b!115792 (= e!75578 (= (apply!104 lt!60100 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115792 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_values!2690 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115792 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115793 () Bool)

(declare-fun res!56762 () Bool)

(assert (=> b!115793 (=> (not res!56762) (not e!75574))))

(assert (=> b!115793 (= res!56762 e!75576)))

(declare-fun c!20548 () Bool)

(assert (=> b!115793 (= c!20548 (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!115794 () Bool)

(declare-fun e!75573 () Bool)

(assert (=> b!115794 (= e!75573 (not call!12397))))

(declare-fun b!115795 () Bool)

(assert (=> b!115795 (= e!75574 e!75573)))

(declare-fun c!20547 () Bool)

(assert (=> b!115795 (= c!20547 (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115796 () Bool)

(assert (=> b!115796 (= e!75575 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!12392 () Bool)

(assert (=> bm!12392 (= call!12394 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun bm!12393 () Bool)

(assert (=> bm!12393 (= call!12392 call!12393)))

(declare-fun bm!12394 () Bool)

(assert (=> bm!12394 (= call!12396 (contains!861 lt!60100 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115797 () Bool)

(assert (=> b!115797 (= e!75573 e!75571)))

(declare-fun res!56767 () Bool)

(assert (=> b!115797 (= res!56767 call!12397)))

(assert (=> b!115797 (=> (not res!56767) (not e!75571))))

(declare-fun b!115798 () Bool)

(declare-fun c!20545 () Bool)

(assert (=> b!115798 (= c!20545 (and (not (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!115798 (= e!75579 e!75581)))

(declare-fun bm!12395 () Bool)

(assert (=> bm!12395 (= call!12395 (+!162 (ite c!20549 call!12394 (ite c!20546 call!12393 call!12392)) (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (= (and d!32451 c!20549) b!115787))

(assert (= (and d!32451 (not c!20549)) b!115786))

(assert (= (and b!115786 c!20546) b!115785))

(assert (= (and b!115786 (not c!20546)) b!115798))

(assert (= (and b!115798 c!20545) b!115780))

(assert (= (and b!115798 (not c!20545)) b!115783))

(assert (= (or b!115780 b!115783) bm!12393))

(assert (= (or b!115785 bm!12393) bm!12391))

(assert (= (or b!115785 b!115780) bm!12389))

(assert (= (or b!115787 bm!12391) bm!12392))

(assert (= (or b!115787 bm!12389) bm!12395))

(assert (= (and d!32451 res!56765) b!115784))

(assert (= (and d!32451 c!20544) b!115778))

(assert (= (and d!32451 (not c!20544)) b!115779))

(assert (= (and d!32451 res!56769) b!115781))

(assert (= (and b!115781 res!56768) b!115796))

(assert (= (and b!115781 (not res!56763)) b!115788))

(assert (= (and b!115788 res!56766) b!115792))

(assert (= (and b!115781 res!56770) b!115793))

(assert (= (and b!115793 c!20548) b!115789))

(assert (= (and b!115793 (not c!20548)) b!115791))

(assert (= (and b!115789 res!56764) b!115782))

(assert (= (or b!115789 b!115791) bm!12394))

(assert (= (and b!115793 res!56762) b!115795))

(assert (= (and b!115795 c!20547) b!115797))

(assert (= (and b!115795 (not c!20547)) b!115794))

(assert (= (and b!115797 res!56767) b!115790))

(assert (= (or b!115797 b!115794) bm!12390))

(declare-fun b_lambda!5145 () Bool)

(assert (=> (not b_lambda!5145) (not b!115792)))

(assert (=> b!115792 t!5930))

(declare-fun b_and!7199 () Bool)

(assert (= b_and!7195 (and (=> t!5930 result!3703) b_and!7199)))

(assert (=> b!115792 t!5932))

(declare-fun b_and!7201 () Bool)

(assert (= b_and!7197 (and (=> t!5932 result!3707) b_and!7201)))

(declare-fun m!131787 () Bool)

(assert (=> b!115778 m!131787))

(declare-fun m!131789 () Bool)

(assert (=> b!115778 m!131789))

(declare-fun m!131791 () Bool)

(assert (=> b!115778 m!131791))

(assert (=> b!115778 m!131787))

(declare-fun m!131793 () Bool)

(assert (=> b!115778 m!131793))

(declare-fun m!131795 () Bool)

(assert (=> b!115778 m!131795))

(declare-fun m!131797 () Bool)

(assert (=> b!115778 m!131797))

(assert (=> b!115778 m!131795))

(declare-fun m!131799 () Bool)

(assert (=> b!115778 m!131799))

(declare-fun m!131801 () Bool)

(assert (=> b!115778 m!131801))

(declare-fun m!131803 () Bool)

(assert (=> b!115778 m!131803))

(declare-fun m!131805 () Bool)

(assert (=> b!115778 m!131805))

(declare-fun m!131807 () Bool)

(assert (=> b!115778 m!131807))

(declare-fun m!131809 () Bool)

(assert (=> b!115778 m!131809))

(assert (=> b!115778 m!131797))

(declare-fun m!131811 () Bool)

(assert (=> b!115778 m!131811))

(assert (=> b!115778 m!131805))

(declare-fun m!131813 () Bool)

(assert (=> b!115778 m!131813))

(declare-fun m!131815 () Bool)

(assert (=> b!115778 m!131815))

(declare-fun m!131817 () Bool)

(assert (=> b!115778 m!131817))

(declare-fun m!131819 () Bool)

(assert (=> b!115778 m!131819))

(declare-fun m!131821 () Bool)

(assert (=> bm!12390 m!131821))

(assert (=> bm!12392 m!131817))

(declare-fun m!131823 () Bool)

(assert (=> bm!12395 m!131823))

(assert (=> b!115792 m!131813))

(declare-fun m!131825 () Bool)

(assert (=> b!115792 m!131825))

(declare-fun m!131827 () Bool)

(assert (=> b!115792 m!131827))

(assert (=> b!115792 m!131827))

(assert (=> b!115792 m!131767))

(declare-fun m!131829 () Bool)

(assert (=> b!115792 m!131829))

(assert (=> b!115792 m!131813))

(assert (=> b!115792 m!131767))

(declare-fun m!131831 () Bool)

(assert (=> b!115787 m!131831))

(assert (=> d!32451 m!131773))

(assert (=> b!115796 m!131813))

(assert (=> b!115796 m!131813))

(declare-fun m!131833 () Bool)

(assert (=> b!115796 m!131833))

(declare-fun m!131835 () Bool)

(assert (=> bm!12394 m!131835))

(declare-fun m!131837 () Bool)

(assert (=> b!115782 m!131837))

(assert (=> b!115784 m!131813))

(assert (=> b!115784 m!131813))

(assert (=> b!115784 m!131833))

(declare-fun m!131839 () Bool)

(assert (=> b!115790 m!131839))

(assert (=> b!115788 m!131813))

(assert (=> b!115788 m!131813))

(declare-fun m!131841 () Bool)

(assert (=> b!115788 m!131841))

(assert (=> b!115665 d!32451))

(declare-fun d!32453 () Bool)

(declare-fun res!56777 () Bool)

(declare-fun e!75586 () Bool)

(assert (=> d!32453 (=> (not res!56777) (not e!75586))))

(declare-fun simpleValid!80 (LongMapFixedSize!996) Bool)

(assert (=> d!32453 (= res!56777 (simpleValid!80 newMap!16))))

(assert (=> d!32453 (= (valid!472 newMap!16) e!75586)))

(declare-fun b!115805 () Bool)

(declare-fun res!56778 () Bool)

(assert (=> b!115805 (=> (not res!56778) (not e!75586))))

(declare-fun arrayCountValidKeys!0 (array!4553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!115805 (= res!56778 (= (arrayCountValidKeys!0 (_keys!4429 newMap!16) #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))) (_size!547 newMap!16)))))

(declare-fun b!115806 () Bool)

(declare-fun res!56779 () Bool)

(assert (=> b!115806 (=> (not res!56779) (not e!75586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4553 (_ BitVec 32)) Bool)

(assert (=> b!115806 (= res!56779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4429 newMap!16) (mask!6917 newMap!16)))))

(declare-fun b!115807 () Bool)

(declare-datatypes ((List!1675 0))(
  ( (Nil!1672) (Cons!1671 (h!2271 (_ BitVec 64)) (t!5933 List!1675)) )
))
(declare-fun arrayNoDuplicates!0 (array!4553 (_ BitVec 32) List!1675) Bool)

(assert (=> b!115807 (= e!75586 (arrayNoDuplicates!0 (_keys!4429 newMap!16) #b00000000000000000000000000000000 Nil!1672))))

(assert (= (and d!32453 res!56777) b!115805))

(assert (= (and b!115805 res!56778) b!115806))

(assert (= (and b!115806 res!56779) b!115807))

(declare-fun m!131843 () Bool)

(assert (=> d!32453 m!131843))

(declare-fun m!131845 () Bool)

(assert (=> b!115805 m!131845))

(declare-fun m!131847 () Bool)

(assert (=> b!115806 m!131847))

(declare-fun m!131849 () Bool)

(assert (=> b!115807 m!131849))

(assert (=> b!115655 d!32453))

(declare-fun d!32455 () Bool)

(assert (=> d!32455 (= (array_inv!1359 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvsge (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!115667 d!32455))

(declare-fun d!32457 () Bool)

(assert (=> d!32457 (= (array_inv!1360 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvsge (size!2420 (_values!2690 (v!3033 (underlying!408 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!115667 d!32457))

(declare-fun d!32459 () Bool)

(assert (=> d!32459 (= (valid!473 thiss!992) (valid!472 (v!3033 (underlying!408 thiss!992))))))

(declare-fun bs!4707 () Bool)

(assert (= bs!4707 d!32459))

(declare-fun m!131851 () Bool)

(assert (=> bs!4707 m!131851))

(assert (=> start!13154 d!32459))

(declare-fun d!32461 () Bool)

(assert (=> d!32461 (= (array_inv!1359 (_keys!4429 newMap!16)) (bvsge (size!2419 (_keys!4429 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115666 d!32461))

(declare-fun d!32463 () Bool)

(assert (=> d!32463 (= (array_inv!1360 (_values!2690 newMap!16)) (bvsge (size!2420 (_values!2690 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115666 d!32463))

(declare-fun b!115815 () Bool)

(declare-fun e!75591 () Bool)

(assert (=> b!115815 (= e!75591 tp_is_empty!2775)))

(declare-fun mapNonEmpty!4267 () Bool)

(declare-fun mapRes!4267 () Bool)

(declare-fun tp!10531 () Bool)

(declare-fun e!75592 () Bool)

(assert (=> mapNonEmpty!4267 (= mapRes!4267 (and tp!10531 e!75592))))

(declare-fun mapRest!4267 () (Array (_ BitVec 32) ValueCell!1044))

(declare-fun mapKey!4267 () (_ BitVec 32))

(declare-fun mapValue!4267 () ValueCell!1044)

(assert (=> mapNonEmpty!4267 (= mapRest!4257 (store mapRest!4267 mapKey!4267 mapValue!4267))))

(declare-fun mapIsEmpty!4267 () Bool)

(assert (=> mapIsEmpty!4267 mapRes!4267))

(declare-fun condMapEmpty!4267 () Bool)

(declare-fun mapDefault!4267 () ValueCell!1044)

(assert (=> mapNonEmpty!4257 (= condMapEmpty!4267 (= mapRest!4257 ((as const (Array (_ BitVec 32) ValueCell!1044)) mapDefault!4267)))))

(assert (=> mapNonEmpty!4257 (= tp!10515 (and e!75591 mapRes!4267))))

(declare-fun b!115814 () Bool)

(assert (=> b!115814 (= e!75592 tp_is_empty!2775)))

(assert (= (and mapNonEmpty!4257 condMapEmpty!4267) mapIsEmpty!4267))

(assert (= (and mapNonEmpty!4257 (not condMapEmpty!4267)) mapNonEmpty!4267))

(assert (= (and mapNonEmpty!4267 ((_ is ValueCellFull!1044) mapValue!4267)) b!115814))

(assert (= (and mapNonEmpty!4257 ((_ is ValueCellFull!1044) mapDefault!4267)) b!115815))

(declare-fun m!131853 () Bool)

(assert (=> mapNonEmpty!4267 m!131853))

(declare-fun b!115817 () Bool)

(declare-fun e!75593 () Bool)

(assert (=> b!115817 (= e!75593 tp_is_empty!2775)))

(declare-fun mapNonEmpty!4268 () Bool)

(declare-fun mapRes!4268 () Bool)

(declare-fun tp!10532 () Bool)

(declare-fun e!75594 () Bool)

(assert (=> mapNonEmpty!4268 (= mapRes!4268 (and tp!10532 e!75594))))

(declare-fun mapKey!4268 () (_ BitVec 32))

(declare-fun mapRest!4268 () (Array (_ BitVec 32) ValueCell!1044))

(declare-fun mapValue!4268 () ValueCell!1044)

(assert (=> mapNonEmpty!4268 (= mapRest!4258 (store mapRest!4268 mapKey!4268 mapValue!4268))))

(declare-fun mapIsEmpty!4268 () Bool)

(assert (=> mapIsEmpty!4268 mapRes!4268))

(declare-fun condMapEmpty!4268 () Bool)

(declare-fun mapDefault!4268 () ValueCell!1044)

(assert (=> mapNonEmpty!4258 (= condMapEmpty!4268 (= mapRest!4258 ((as const (Array (_ BitVec 32) ValueCell!1044)) mapDefault!4268)))))

(assert (=> mapNonEmpty!4258 (= tp!10514 (and e!75593 mapRes!4268))))

(declare-fun b!115816 () Bool)

(assert (=> b!115816 (= e!75594 tp_is_empty!2775)))

(assert (= (and mapNonEmpty!4258 condMapEmpty!4268) mapIsEmpty!4268))

(assert (= (and mapNonEmpty!4258 (not condMapEmpty!4268)) mapNonEmpty!4268))

(assert (= (and mapNonEmpty!4268 ((_ is ValueCellFull!1044) mapValue!4268)) b!115816))

(assert (= (and mapNonEmpty!4258 ((_ is ValueCellFull!1044) mapDefault!4268)) b!115817))

(declare-fun m!131855 () Bool)

(assert (=> mapNonEmpty!4268 m!131855))

(declare-fun b_lambda!5147 () Bool)

(assert (= b_lambda!5145 (or (and b!115667 b_free!2717) (and b!115666 b_free!2719 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))) b_lambda!5147)))

(declare-fun b_lambda!5149 () Bool)

(assert (= b_lambda!5143 (or (and b!115667 b_free!2717) (and b!115666 b_free!2719 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))) b_lambda!5149)))

(check-sat (not b!115773) b_and!7199 (not d!32459) (not b!115769) (not bm!12390) (not bm!12385) (not b!115807) (not d!32451) (not b!115790) (not b!115792) (not mapNonEmpty!4268) (not b!115767) (not b!115761) (not mapNonEmpty!4267) (not b_next!2717) (not bm!12395) (not b!115764) (not b_lambda!5149) (not bm!12392) (not b!115778) (not d!32449) (not bm!12383) (not b!115765) (not bm!12388) (not b!115806) (not b!115782) (not b!115787) (not bm!12394) (not b!115796) b_and!7201 (not b!115755) (not d!32447) tp_is_empty!2775 (not b!115788) (not b!115784) (not b!115805) (not b_lambda!5147) (not b_next!2719) (not b!115759) (not bm!12387) (not d!32453))
(check-sat b_and!7199 b_and!7201 (not b_next!2717) (not b_next!2719))
(get-model)

(declare-fun d!32465 () Bool)

(declare-datatypes ((Option!168 0))(
  ( (Some!167 (v!3036 V!3347)) (None!166) )
))
(declare-fun get!1399 (Option!168) V!3347)

(declare-fun getValueByKey!162 (List!1674 (_ BitVec 64)) Option!168)

(assert (=> d!32465 (= (apply!104 lt!60078 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1399 (getValueByKey!162 (toList!839 lt!60078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4708 () Bool)

(assert (= bs!4708 d!32465))

(declare-fun m!131857 () Bool)

(assert (=> bs!4708 m!131857))

(assert (=> bs!4708 m!131857))

(declare-fun m!131859 () Bool)

(assert (=> bs!4708 m!131859))

(assert (=> b!115767 d!32465))

(declare-fun d!32467 () Bool)

(assert (=> d!32467 (= (apply!104 lt!60100 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1399 (getValueByKey!162 (toList!839 lt!60100) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4709 () Bool)

(assert (= bs!4709 d!32467))

(declare-fun m!131861 () Bool)

(assert (=> bs!4709 m!131861))

(assert (=> bs!4709 m!131861))

(declare-fun m!131863 () Bool)

(assert (=> bs!4709 m!131863))

(assert (=> b!115782 d!32467))

(declare-fun d!32469 () Bool)

(declare-fun res!56780 () Bool)

(declare-fun e!75595 () Bool)

(assert (=> d!32469 (=> (not res!56780) (not e!75595))))

(assert (=> d!32469 (= res!56780 (simpleValid!80 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32469 (= (valid!472 (v!3033 (underlying!408 thiss!992))) e!75595)))

(declare-fun b!115818 () Bool)

(declare-fun res!56781 () Bool)

(assert (=> b!115818 (=> (not res!56781) (not e!75595))))

(assert (=> b!115818 (= res!56781 (= (arrayCountValidKeys!0 (_keys!4429 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000000 (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))) (_size!547 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115819 () Bool)

(declare-fun res!56782 () Bool)

(assert (=> b!115819 (=> (not res!56782) (not e!75595))))

(assert (=> b!115819 (= res!56782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun b!115820 () Bool)

(assert (=> b!115820 (= e!75595 (arrayNoDuplicates!0 (_keys!4429 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000000 Nil!1672))))

(assert (= (and d!32469 res!56780) b!115818))

(assert (= (and b!115818 res!56781) b!115819))

(assert (= (and b!115819 res!56782) b!115820))

(declare-fun m!131865 () Bool)

(assert (=> d!32469 m!131865))

(declare-fun m!131867 () Bool)

(assert (=> b!115818 m!131867))

(declare-fun m!131869 () Bool)

(assert (=> b!115819 m!131869))

(declare-fun m!131871 () Bool)

(assert (=> b!115820 m!131871))

(assert (=> d!32459 d!32469))

(declare-fun d!32471 () Bool)

(assert (=> d!32471 (= (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115784 d!32471))

(declare-fun b!115829 () Bool)

(declare-fun e!75603 () Bool)

(declare-fun e!75602 () Bool)

(assert (=> b!115829 (= e!75603 e!75602)))

(declare-fun lt!60125 () (_ BitVec 64))

(assert (=> b!115829 (= lt!60125 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60127 () Unit!3602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4553 (_ BitVec 64) (_ BitVec 32)) Unit!3602)

(assert (=> b!115829 (= lt!60127 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4429 newMap!16) lt!60125 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!115829 (arrayContainsKey!0 (_keys!4429 newMap!16) lt!60125 #b00000000000000000000000000000000)))

(declare-fun lt!60126 () Unit!3602)

(assert (=> b!115829 (= lt!60126 lt!60127)))

(declare-fun res!56787 () Bool)

(declare-datatypes ((SeekEntryResult!265 0))(
  ( (MissingZero!265 (index!3213 (_ BitVec 32))) (Found!265 (index!3214 (_ BitVec 32))) (Intermediate!265 (undefined!1077 Bool) (index!3215 (_ BitVec 32)) (x!14410 (_ BitVec 32))) (Undefined!265) (MissingVacant!265 (index!3216 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4553 (_ BitVec 32)) SeekEntryResult!265)

(assert (=> b!115829 (= res!56787 (= (seekEntryOrOpen!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000) (_keys!4429 newMap!16) (mask!6917 newMap!16)) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!115829 (=> (not res!56787) (not e!75602))))

(declare-fun bm!12398 () Bool)

(declare-fun call!12401 () Bool)

(assert (=> bm!12398 (= call!12401 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4429 newMap!16) (mask!6917 newMap!16)))))

(declare-fun b!115830 () Bool)

(assert (=> b!115830 (= e!75603 call!12401)))

(declare-fun d!32473 () Bool)

(declare-fun res!56788 () Bool)

(declare-fun e!75604 () Bool)

(assert (=> d!32473 (=> res!56788 e!75604)))

(assert (=> d!32473 (= res!56788 (bvsge #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(assert (=> d!32473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4429 newMap!16) (mask!6917 newMap!16)) e!75604)))

(declare-fun b!115831 () Bool)

(assert (=> b!115831 (= e!75604 e!75603)))

(declare-fun c!20552 () Bool)

(assert (=> b!115831 (= c!20552 (validKeyInArray!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115832 () Bool)

(assert (=> b!115832 (= e!75602 call!12401)))

(assert (= (and d!32473 (not res!56788)) b!115831))

(assert (= (and b!115831 c!20552) b!115829))

(assert (= (and b!115831 (not c!20552)) b!115830))

(assert (= (and b!115829 res!56787) b!115832))

(assert (= (or b!115832 b!115830) bm!12398))

(declare-fun m!131873 () Bool)

(assert (=> b!115829 m!131873))

(declare-fun m!131875 () Bool)

(assert (=> b!115829 m!131875))

(declare-fun m!131877 () Bool)

(assert (=> b!115829 m!131877))

(assert (=> b!115829 m!131873))

(declare-fun m!131879 () Bool)

(assert (=> b!115829 m!131879))

(declare-fun m!131881 () Bool)

(assert (=> bm!12398 m!131881))

(assert (=> b!115831 m!131873))

(assert (=> b!115831 m!131873))

(declare-fun m!131883 () Bool)

(assert (=> b!115831 m!131883))

(assert (=> b!115806 d!32473))

(declare-fun d!32475 () Bool)

(assert (=> d!32475 (= (validMask!0 (mask!6917 (v!3033 (underlying!408 thiss!992)))) (and (or (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000000111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000001111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000011111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000000111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000001111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000011111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000000111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000001111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000011111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000000111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000001111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000011111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000000111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000001111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000011111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000000111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000001111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000011111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000000111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000001111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000011111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000000111111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000001111111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000011111111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00000111111111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00001111111111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00011111111111111111111111111111) (= (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6917 (v!3033 (underlying!408 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!32451 d!32475))

(declare-fun b!115841 () Bool)

(declare-fun res!56797 () Bool)

(declare-fun e!75607 () Bool)

(assert (=> b!115841 (=> (not res!56797) (not e!75607))))

(assert (=> b!115841 (= res!56797 (and (= (size!2420 (_values!2690 newMap!16)) (bvadd (mask!6917 newMap!16) #b00000000000000000000000000000001)) (= (size!2419 (_keys!4429 newMap!16)) (size!2420 (_values!2690 newMap!16))) (bvsge (_size!547 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!547 newMap!16) (bvadd (mask!6917 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!115844 () Bool)

(assert (=> b!115844 (= e!75607 (and (bvsge (extraKeys!2496 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2496 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!547 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!115842 () Bool)

(declare-fun res!56799 () Bool)

(assert (=> b!115842 (=> (not res!56799) (not e!75607))))

(declare-fun size!2423 (LongMapFixedSize!996) (_ BitVec 32))

(assert (=> b!115842 (= res!56799 (bvsge (size!2423 newMap!16) (_size!547 newMap!16)))))

(declare-fun b!115843 () Bool)

(declare-fun res!56798 () Bool)

(assert (=> b!115843 (=> (not res!56798) (not e!75607))))

(assert (=> b!115843 (= res!56798 (= (size!2423 newMap!16) (bvadd (_size!547 newMap!16) (bvsdiv (bvadd (extraKeys!2496 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!32477 () Bool)

(declare-fun res!56800 () Bool)

(assert (=> d!32477 (=> (not res!56800) (not e!75607))))

(assert (=> d!32477 (= res!56800 (validMask!0 (mask!6917 newMap!16)))))

(assert (=> d!32477 (= (simpleValid!80 newMap!16) e!75607)))

(assert (= (and d!32477 res!56800) b!115841))

(assert (= (and b!115841 res!56797) b!115842))

(assert (= (and b!115842 res!56799) b!115843))

(assert (= (and b!115843 res!56798) b!115844))

(declare-fun m!131885 () Bool)

(assert (=> b!115842 m!131885))

(assert (=> b!115843 m!131885))

(declare-fun m!131887 () Bool)

(assert (=> d!32477 m!131887))

(assert (=> d!32453 d!32477))

(declare-fun d!32479 () Bool)

(declare-fun e!75610 () Bool)

(assert (=> d!32479 e!75610))

(declare-fun res!56805 () Bool)

(assert (=> d!32479 (=> (not res!56805) (not e!75610))))

(declare-fun lt!60137 () ListLongMap!1647)

(assert (=> d!32479 (= res!56805 (contains!861 lt!60137 (_1!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60139 () List!1674)

(assert (=> d!32479 (= lt!60137 (ListLongMap!1648 lt!60139))))

(declare-fun lt!60138 () Unit!3602)

(declare-fun lt!60136 () Unit!3602)

(assert (=> d!32479 (= lt!60138 lt!60136)))

(assert (=> d!32479 (= (getValueByKey!162 lt!60139 (_1!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!78 (List!1674 (_ BitVec 64) V!3347) Unit!3602)

(assert (=> d!32479 (= lt!60136 (lemmaContainsTupThenGetReturnValue!78 lt!60139 (_1!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (_2!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun insertStrictlySorted!81 (List!1674 (_ BitVec 64) V!3347) List!1674)

(assert (=> d!32479 (= lt!60139 (insertStrictlySorted!81 (toList!839 (ite c!20549 call!12394 (ite c!20546 call!12393 call!12392))) (_1!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (_2!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32479 (= (+!162 (ite c!20549 call!12394 (ite c!20546 call!12393 call!12392)) (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60137)))

(declare-fun b!115849 () Bool)

(declare-fun res!56806 () Bool)

(assert (=> b!115849 (=> (not res!56806) (not e!75610))))

(assert (=> b!115849 (= res!56806 (= (getValueByKey!162 (toList!839 lt!60137) (_1!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))))

(declare-fun b!115850 () Bool)

(declare-fun contains!862 (List!1674 tuple2!2524) Bool)

(assert (=> b!115850 (= e!75610 (contains!862 (toList!839 lt!60137) (ite (or c!20549 c!20546) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (= (and d!32479 res!56805) b!115849))

(assert (= (and b!115849 res!56806) b!115850))

(declare-fun m!131889 () Bool)

(assert (=> d!32479 m!131889))

(declare-fun m!131891 () Bool)

(assert (=> d!32479 m!131891))

(declare-fun m!131893 () Bool)

(assert (=> d!32479 m!131893))

(declare-fun m!131895 () Bool)

(assert (=> d!32479 m!131895))

(declare-fun m!131897 () Bool)

(assert (=> b!115849 m!131897))

(declare-fun m!131899 () Bool)

(assert (=> b!115850 m!131899))

(assert (=> bm!12395 d!32479))

(declare-fun d!32481 () Bool)

(declare-fun e!75616 () Bool)

(assert (=> d!32481 e!75616))

(declare-fun res!56809 () Bool)

(assert (=> d!32481 (=> res!56809 e!75616)))

(declare-fun lt!60150 () Bool)

(assert (=> d!32481 (= res!56809 (not lt!60150))))

(declare-fun lt!60151 () Bool)

(assert (=> d!32481 (= lt!60150 lt!60151)))

(declare-fun lt!60149 () Unit!3602)

(declare-fun e!75615 () Unit!3602)

(assert (=> d!32481 (= lt!60149 e!75615)))

(declare-fun c!20555 () Bool)

(assert (=> d!32481 (= c!20555 lt!60151)))

(declare-fun containsKey!166 (List!1674 (_ BitVec 64)) Bool)

(assert (=> d!32481 (= lt!60151 (containsKey!166 (toList!839 lt!60078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32481 (= (contains!861 lt!60078 #b1000000000000000000000000000000000000000000000000000000000000000) lt!60150)))

(declare-fun b!115857 () Bool)

(declare-fun lt!60148 () Unit!3602)

(assert (=> b!115857 (= e!75615 lt!60148)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!114 (List!1674 (_ BitVec 64)) Unit!3602)

(assert (=> b!115857 (= lt!60148 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 lt!60078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!115 (Option!168) Bool)

(assert (=> b!115857 (isDefined!115 (getValueByKey!162 (toList!839 lt!60078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115858 () Bool)

(declare-fun Unit!3606 () Unit!3602)

(assert (=> b!115858 (= e!75615 Unit!3606)))

(declare-fun b!115859 () Bool)

(assert (=> b!115859 (= e!75616 (isDefined!115 (getValueByKey!162 (toList!839 lt!60078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32481 c!20555) b!115857))

(assert (= (and d!32481 (not c!20555)) b!115858))

(assert (= (and d!32481 (not res!56809)) b!115859))

(declare-fun m!131901 () Bool)

(assert (=> d!32481 m!131901))

(declare-fun m!131903 () Bool)

(assert (=> b!115857 m!131903))

(assert (=> b!115857 m!131857))

(assert (=> b!115857 m!131857))

(declare-fun m!131905 () Bool)

(assert (=> b!115857 m!131905))

(assert (=> b!115859 m!131857))

(assert (=> b!115859 m!131857))

(assert (=> b!115859 m!131905))

(assert (=> bm!12383 d!32481))

(declare-fun b!115868 () Bool)

(declare-fun e!75622 () (_ BitVec 32))

(declare-fun e!75621 () (_ BitVec 32))

(assert (=> b!115868 (= e!75622 e!75621)))

(declare-fun c!20560 () Bool)

(assert (=> b!115868 (= c!20560 (validKeyInArray!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32483 () Bool)

(declare-fun lt!60154 () (_ BitVec 32))

(assert (=> d!32483 (and (bvsge lt!60154 #b00000000000000000000000000000000) (bvsle lt!60154 (bvsub (size!2419 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!32483 (= lt!60154 e!75622)))

(declare-fun c!20561 () Bool)

(assert (=> d!32483 (= c!20561 (bvsge #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(assert (=> d!32483 (and (bvsle #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2419 (_keys!4429 newMap!16)) (size!2419 (_keys!4429 newMap!16))))))

(assert (=> d!32483 (= (arrayCountValidKeys!0 (_keys!4429 newMap!16) #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))) lt!60154)))

(declare-fun bm!12401 () Bool)

(declare-fun call!12404 () (_ BitVec 32))

(assert (=> bm!12401 (= call!12404 (arrayCountValidKeys!0 (_keys!4429 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2419 (_keys!4429 newMap!16))))))

(declare-fun b!115869 () Bool)

(assert (=> b!115869 (= e!75622 #b00000000000000000000000000000000)))

(declare-fun b!115870 () Bool)

(assert (=> b!115870 (= e!75621 call!12404)))

(declare-fun b!115871 () Bool)

(assert (=> b!115871 (= e!75621 (bvadd #b00000000000000000000000000000001 call!12404))))

(assert (= (and d!32483 c!20561) b!115869))

(assert (= (and d!32483 (not c!20561)) b!115868))

(assert (= (and b!115868 c!20560) b!115871))

(assert (= (and b!115868 (not c!20560)) b!115870))

(assert (= (or b!115871 b!115870) bm!12401))

(assert (=> b!115868 m!131873))

(assert (=> b!115868 m!131873))

(assert (=> b!115868 m!131883))

(declare-fun m!131907 () Bool)

(assert (=> bm!12401 m!131907))

(assert (=> b!115805 d!32483))

(assert (=> b!115796 d!32471))

(declare-fun d!32485 () Bool)

(assert (=> d!32485 (= (apply!104 lt!60103 lt!60102) (get!1399 (getValueByKey!162 (toList!839 lt!60103) lt!60102)))))

(declare-fun bs!4710 () Bool)

(assert (= bs!4710 d!32485))

(declare-fun m!131909 () Bool)

(assert (=> bs!4710 m!131909))

(assert (=> bs!4710 m!131909))

(declare-fun m!131911 () Bool)

(assert (=> bs!4710 m!131911))

(assert (=> b!115778 d!32485))

(declare-fun d!32487 () Bool)

(declare-fun e!75623 () Bool)

(assert (=> d!32487 e!75623))

(declare-fun res!56810 () Bool)

(assert (=> d!32487 (=> (not res!56810) (not e!75623))))

(declare-fun lt!60156 () ListLongMap!1647)

(assert (=> d!32487 (= res!56810 (contains!861 lt!60156 (_1!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60158 () List!1674)

(assert (=> d!32487 (= lt!60156 (ListLongMap!1648 lt!60158))))

(declare-fun lt!60157 () Unit!3602)

(declare-fun lt!60155 () Unit!3602)

(assert (=> d!32487 (= lt!60157 lt!60155)))

(assert (=> d!32487 (= (getValueByKey!162 lt!60158 (_1!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32487 (= lt!60155 (lemmaContainsTupThenGetReturnValue!78 lt!60158 (_1!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32487 (= lt!60158 (insertStrictlySorted!81 (toList!839 lt!60103) (_1!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32487 (= (+!162 lt!60103 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60156)))

(declare-fun b!115872 () Bool)

(declare-fun res!56811 () Bool)

(assert (=> b!115872 (=> (not res!56811) (not e!75623))))

(assert (=> b!115872 (= res!56811 (= (getValueByKey!162 (toList!839 lt!60156) (_1!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115873 () Bool)

(assert (=> b!115873 (= e!75623 (contains!862 (toList!839 lt!60156) (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32487 res!56810) b!115872))

(assert (= (and b!115872 res!56811) b!115873))

(declare-fun m!131913 () Bool)

(assert (=> d!32487 m!131913))

(declare-fun m!131915 () Bool)

(assert (=> d!32487 m!131915))

(declare-fun m!131917 () Bool)

(assert (=> d!32487 m!131917))

(declare-fun m!131919 () Bool)

(assert (=> d!32487 m!131919))

(declare-fun m!131921 () Bool)

(assert (=> b!115872 m!131921))

(declare-fun m!131923 () Bool)

(assert (=> b!115873 m!131923))

(assert (=> b!115778 d!32487))

(declare-fun d!32489 () Bool)

(declare-fun e!75624 () Bool)

(assert (=> d!32489 e!75624))

(declare-fun res!56812 () Bool)

(assert (=> d!32489 (=> (not res!56812) (not e!75624))))

(declare-fun lt!60160 () ListLongMap!1647)

(assert (=> d!32489 (= res!56812 (contains!861 lt!60160 (_1!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60162 () List!1674)

(assert (=> d!32489 (= lt!60160 (ListLongMap!1648 lt!60162))))

(declare-fun lt!60161 () Unit!3602)

(declare-fun lt!60159 () Unit!3602)

(assert (=> d!32489 (= lt!60161 lt!60159)))

(assert (=> d!32489 (= (getValueByKey!162 lt!60162 (_1!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32489 (= lt!60159 (lemmaContainsTupThenGetReturnValue!78 lt!60162 (_1!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32489 (= lt!60162 (insertStrictlySorted!81 (toList!839 lt!60097) (_1!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32489 (= (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60160)))

(declare-fun b!115874 () Bool)

(declare-fun res!56813 () Bool)

(assert (=> b!115874 (=> (not res!56813) (not e!75624))))

(assert (=> b!115874 (= res!56813 (= (getValueByKey!162 (toList!839 lt!60160) (_1!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115875 () Bool)

(assert (=> b!115875 (= e!75624 (contains!862 (toList!839 lt!60160) (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32489 res!56812) b!115874))

(assert (= (and b!115874 res!56813) b!115875))

(declare-fun m!131925 () Bool)

(assert (=> d!32489 m!131925))

(declare-fun m!131927 () Bool)

(assert (=> d!32489 m!131927))

(declare-fun m!131929 () Bool)

(assert (=> d!32489 m!131929))

(declare-fun m!131931 () Bool)

(assert (=> d!32489 m!131931))

(declare-fun m!131933 () Bool)

(assert (=> b!115874 m!131933))

(declare-fun m!131935 () Bool)

(assert (=> b!115875 m!131935))

(assert (=> b!115778 d!32489))

(declare-fun d!32491 () Bool)

(declare-fun e!75625 () Bool)

(assert (=> d!32491 e!75625))

(declare-fun res!56814 () Bool)

(assert (=> d!32491 (=> (not res!56814) (not e!75625))))

(declare-fun lt!60164 () ListLongMap!1647)

(assert (=> d!32491 (= res!56814 (contains!861 lt!60164 (_1!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60166 () List!1674)

(assert (=> d!32491 (= lt!60164 (ListLongMap!1648 lt!60166))))

(declare-fun lt!60165 () Unit!3602)

(declare-fun lt!60163 () Unit!3602)

(assert (=> d!32491 (= lt!60165 lt!60163)))

(assert (=> d!32491 (= (getValueByKey!162 lt!60166 (_1!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32491 (= lt!60163 (lemmaContainsTupThenGetReturnValue!78 lt!60166 (_1!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32491 (= lt!60166 (insertStrictlySorted!81 (toList!839 lt!60107) (_1!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32491 (= (+!162 lt!60107 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60164)))

(declare-fun b!115876 () Bool)

(declare-fun res!56815 () Bool)

(assert (=> b!115876 (=> (not res!56815) (not e!75625))))

(assert (=> b!115876 (= res!56815 (= (getValueByKey!162 (toList!839 lt!60164) (_1!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115877 () Bool)

(assert (=> b!115877 (= e!75625 (contains!862 (toList!839 lt!60164) (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32491 res!56814) b!115876))

(assert (= (and b!115876 res!56815) b!115877))

(declare-fun m!131937 () Bool)

(assert (=> d!32491 m!131937))

(declare-fun m!131939 () Bool)

(assert (=> d!32491 m!131939))

(declare-fun m!131941 () Bool)

(assert (=> d!32491 m!131941))

(declare-fun m!131943 () Bool)

(assert (=> d!32491 m!131943))

(declare-fun m!131945 () Bool)

(assert (=> b!115876 m!131945))

(declare-fun m!131947 () Bool)

(assert (=> b!115877 m!131947))

(assert (=> b!115778 d!32491))

(declare-fun d!32493 () Bool)

(assert (=> d!32493 (contains!861 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60108)))

(declare-fun lt!60169 () Unit!3602)

(declare-fun choose!725 (ListLongMap!1647 (_ BitVec 64) V!3347 (_ BitVec 64)) Unit!3602)

(assert (=> d!32493 (= lt!60169 (choose!725 lt!60097 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60108))))

(assert (=> d!32493 (contains!861 lt!60097 lt!60108)))

(assert (=> d!32493 (= (addStillContains!80 lt!60097 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60108) lt!60169)))

(declare-fun bs!4711 () Bool)

(assert (= bs!4711 d!32493))

(assert (=> bs!4711 m!131795))

(assert (=> bs!4711 m!131795))

(assert (=> bs!4711 m!131799))

(declare-fun m!131949 () Bool)

(assert (=> bs!4711 m!131949))

(declare-fun m!131951 () Bool)

(assert (=> bs!4711 m!131951))

(assert (=> b!115778 d!32493))

(declare-fun d!32495 () Bool)

(assert (=> d!32495 (= (apply!104 (+!162 lt!60118 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60115) (get!1399 (getValueByKey!162 (toList!839 (+!162 lt!60118 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60115)))))

(declare-fun bs!4712 () Bool)

(assert (= bs!4712 d!32495))

(declare-fun m!131953 () Bool)

(assert (=> bs!4712 m!131953))

(assert (=> bs!4712 m!131953))

(declare-fun m!131955 () Bool)

(assert (=> bs!4712 m!131955))

(assert (=> b!115778 d!32495))

(declare-fun d!32497 () Bool)

(assert (=> d!32497 (= (apply!104 lt!60118 lt!60115) (get!1399 (getValueByKey!162 (toList!839 lt!60118) lt!60115)))))

(declare-fun bs!4713 () Bool)

(assert (= bs!4713 d!32497))

(declare-fun m!131957 () Bool)

(assert (=> bs!4713 m!131957))

(assert (=> bs!4713 m!131957))

(declare-fun m!131959 () Bool)

(assert (=> bs!4713 m!131959))

(assert (=> b!115778 d!32497))

(declare-fun b!115903 () Bool)

(declare-fun e!75644 () ListLongMap!1647)

(assert (=> b!115903 (= e!75644 (ListLongMap!1648 Nil!1671))))

(declare-fun b!115904 () Bool)

(declare-fun e!75642 () Bool)

(declare-fun e!75645 () Bool)

(assert (=> b!115904 (= e!75642 e!75645)))

(declare-fun c!20572 () Bool)

(declare-fun e!75643 () Bool)

(assert (=> b!115904 (= c!20572 e!75643)))

(declare-fun res!56827 () Bool)

(assert (=> b!115904 (=> (not res!56827) (not e!75643))))

(assert (=> b!115904 (= res!56827 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115905 () Bool)

(declare-fun e!75646 () ListLongMap!1647)

(assert (=> b!115905 (= e!75644 e!75646)))

(declare-fun c!20571 () Bool)

(assert (=> b!115905 (= c!20571 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!115906 () Bool)

(declare-fun call!12407 () ListLongMap!1647)

(assert (=> b!115906 (= e!75646 call!12407)))

(declare-fun b!115907 () Bool)

(declare-fun e!75641 () Bool)

(assert (=> b!115907 (= e!75645 e!75641)))

(assert (=> b!115907 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun lt!60184 () ListLongMap!1647)

(declare-fun res!56825 () Bool)

(assert (=> b!115907 (= res!56825 (contains!861 lt!60184 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115907 (=> (not res!56825) (not e!75641))))

(declare-fun b!115908 () Bool)

(declare-fun e!75640 () Bool)

(assert (=> b!115908 (= e!75645 e!75640)))

(declare-fun c!20573 () Bool)

(assert (=> b!115908 (= c!20573 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115909 () Bool)

(declare-fun lt!60187 () Unit!3602)

(declare-fun lt!60190 () Unit!3602)

(assert (=> b!115909 (= lt!60187 lt!60190)))

(declare-fun lt!60186 () ListLongMap!1647)

(declare-fun lt!60185 () (_ BitVec 64))

(declare-fun lt!60189 () (_ BitVec 64))

(declare-fun lt!60188 () V!3347)

(assert (=> b!115909 (not (contains!861 (+!162 lt!60186 (tuple2!2525 lt!60189 lt!60188)) lt!60185))))

(declare-fun addStillNotContains!52 (ListLongMap!1647 (_ BitVec 64) V!3347 (_ BitVec 64)) Unit!3602)

(assert (=> b!115909 (= lt!60190 (addStillNotContains!52 lt!60186 lt!60189 lt!60188 lt!60185))))

(assert (=> b!115909 (= lt!60185 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!115909 (= lt!60188 (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115909 (= lt!60189 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!115909 (= lt!60186 call!12407)))

(assert (=> b!115909 (= e!75646 (+!162 call!12407 (tuple2!2525 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!12404 () Bool)

(assert (=> bm!12404 (= call!12407 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun d!32499 () Bool)

(assert (=> d!32499 e!75642))

(declare-fun res!56824 () Bool)

(assert (=> d!32499 (=> (not res!56824) (not e!75642))))

(assert (=> d!32499 (= res!56824 (not (contains!861 lt!60184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32499 (= lt!60184 e!75644)))

(declare-fun c!20570 () Bool)

(assert (=> d!32499 (= c!20570 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> d!32499 (validMask!0 (mask!6917 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32499 (= (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) lt!60184)))

(declare-fun b!115910 () Bool)

(declare-fun res!56826 () Bool)

(assert (=> b!115910 (=> (not res!56826) (not e!75642))))

(assert (=> b!115910 (= res!56826 (not (contains!861 lt!60184 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115911 () Bool)

(assert (=> b!115911 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115911 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_values!2690 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115911 (= e!75641 (= (apply!104 lt!60184 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115912 () Bool)

(declare-fun isEmpty!386 (ListLongMap!1647) Bool)

(assert (=> b!115912 (= e!75640 (isEmpty!386 lt!60184))))

(declare-fun b!115913 () Bool)

(assert (=> b!115913 (= e!75643 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!115913 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!115914 () Bool)

(assert (=> b!115914 (= e!75640 (= lt!60184 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32499 c!20570) b!115903))

(assert (= (and d!32499 (not c!20570)) b!115905))

(assert (= (and b!115905 c!20571) b!115909))

(assert (= (and b!115905 (not c!20571)) b!115906))

(assert (= (or b!115909 b!115906) bm!12404))

(assert (= (and d!32499 res!56824) b!115910))

(assert (= (and b!115910 res!56826) b!115904))

(assert (= (and b!115904 res!56827) b!115913))

(assert (= (and b!115904 c!20572) b!115907))

(assert (= (and b!115904 (not c!20572)) b!115908))

(assert (= (and b!115907 res!56825) b!115911))

(assert (= (and b!115908 c!20573) b!115914))

(assert (= (and b!115908 (not c!20573)) b!115912))

(declare-fun b_lambda!5151 () Bool)

(assert (=> (not b_lambda!5151) (not b!115909)))

(assert (=> b!115909 t!5930))

(declare-fun b_and!7203 () Bool)

(assert (= b_and!7199 (and (=> t!5930 result!3703) b_and!7203)))

(assert (=> b!115909 t!5932))

(declare-fun b_and!7205 () Bool)

(assert (= b_and!7201 (and (=> t!5932 result!3707) b_and!7205)))

(declare-fun b_lambda!5153 () Bool)

(assert (=> (not b_lambda!5153) (not b!115911)))

(assert (=> b!115911 t!5930))

(declare-fun b_and!7207 () Bool)

(assert (= b_and!7203 (and (=> t!5930 result!3703) b_and!7207)))

(assert (=> b!115911 t!5932))

(declare-fun b_and!7209 () Bool)

(assert (= b_and!7205 (and (=> t!5932 result!3707) b_and!7209)))

(assert (=> b!115911 m!131827))

(assert (=> b!115911 m!131827))

(assert (=> b!115911 m!131767))

(assert (=> b!115911 m!131829))

(assert (=> b!115911 m!131813))

(assert (=> b!115911 m!131813))

(declare-fun m!131961 () Bool)

(assert (=> b!115911 m!131961))

(assert (=> b!115911 m!131767))

(declare-fun m!131963 () Bool)

(assert (=> b!115912 m!131963))

(declare-fun m!131965 () Bool)

(assert (=> b!115914 m!131965))

(declare-fun m!131967 () Bool)

(assert (=> d!32499 m!131967))

(assert (=> d!32499 m!131773))

(assert (=> b!115907 m!131813))

(assert (=> b!115907 m!131813))

(declare-fun m!131969 () Bool)

(assert (=> b!115907 m!131969))

(assert (=> b!115909 m!131827))

(assert (=> b!115909 m!131827))

(assert (=> b!115909 m!131767))

(assert (=> b!115909 m!131829))

(declare-fun m!131971 () Bool)

(assert (=> b!115909 m!131971))

(assert (=> b!115909 m!131813))

(declare-fun m!131973 () Bool)

(assert (=> b!115909 m!131973))

(assert (=> b!115909 m!131971))

(declare-fun m!131975 () Bool)

(assert (=> b!115909 m!131975))

(assert (=> b!115909 m!131767))

(declare-fun m!131977 () Bool)

(assert (=> b!115909 m!131977))

(declare-fun m!131979 () Bool)

(assert (=> b!115910 m!131979))

(assert (=> bm!12404 m!131965))

(assert (=> b!115913 m!131813))

(assert (=> b!115913 m!131813))

(assert (=> b!115913 m!131833))

(assert (=> b!115905 m!131813))

(assert (=> b!115905 m!131813))

(assert (=> b!115905 m!131833))

(assert (=> b!115778 d!32499))

(declare-fun d!32501 () Bool)

(assert (=> d!32501 (= (apply!104 (+!162 lt!60118 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60115) (apply!104 lt!60118 lt!60115))))

(declare-fun lt!60193 () Unit!3602)

(declare-fun choose!726 (ListLongMap!1647 (_ BitVec 64) V!3347 (_ BitVec 64)) Unit!3602)

(assert (=> d!32501 (= lt!60193 (choose!726 lt!60118 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60115))))

(declare-fun e!75649 () Bool)

(assert (=> d!32501 e!75649))

(declare-fun res!56830 () Bool)

(assert (=> d!32501 (=> (not res!56830) (not e!75649))))

(assert (=> d!32501 (= res!56830 (contains!861 lt!60118 lt!60115))))

(assert (=> d!32501 (= (addApplyDifferent!80 lt!60118 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60115) lt!60193)))

(declare-fun b!115918 () Bool)

(assert (=> b!115918 (= e!75649 (not (= lt!60115 lt!60106)))))

(assert (= (and d!32501 res!56830) b!115918))

(assert (=> d!32501 m!131805))

(assert (=> d!32501 m!131803))

(assert (=> d!32501 m!131805))

(assert (=> d!32501 m!131807))

(declare-fun m!131981 () Bool)

(assert (=> d!32501 m!131981))

(declare-fun m!131983 () Bool)

(assert (=> d!32501 m!131983))

(assert (=> b!115778 d!32501))

(declare-fun d!32503 () Bool)

(assert (=> d!32503 (= (apply!104 (+!162 lt!60103 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60102) (apply!104 lt!60103 lt!60102))))

(declare-fun lt!60194 () Unit!3602)

(assert (=> d!32503 (= lt!60194 (choose!726 lt!60103 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60102))))

(declare-fun e!75650 () Bool)

(assert (=> d!32503 e!75650))

(declare-fun res!56831 () Bool)

(assert (=> d!32503 (=> (not res!56831) (not e!75650))))

(assert (=> d!32503 (= res!56831 (contains!861 lt!60103 lt!60102))))

(assert (=> d!32503 (= (addApplyDifferent!80 lt!60103 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60102) lt!60194)))

(declare-fun b!115919 () Bool)

(assert (=> b!115919 (= e!75650 (not (= lt!60102 lt!60104)))))

(assert (= (and d!32503 res!56831) b!115919))

(assert (=> d!32503 m!131797))

(assert (=> d!32503 m!131809))

(assert (=> d!32503 m!131797))

(assert (=> d!32503 m!131811))

(declare-fun m!131985 () Bool)

(assert (=> d!32503 m!131985))

(declare-fun m!131987 () Bool)

(assert (=> d!32503 m!131987))

(assert (=> b!115778 d!32503))

(declare-fun d!32505 () Bool)

(assert (=> d!32505 (= (apply!104 (+!162 lt!60107 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60112) (apply!104 lt!60107 lt!60112))))

(declare-fun lt!60195 () Unit!3602)

(assert (=> d!32505 (= lt!60195 (choose!726 lt!60107 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60112))))

(declare-fun e!75651 () Bool)

(assert (=> d!32505 e!75651))

(declare-fun res!56832 () Bool)

(assert (=> d!32505 (=> (not res!56832) (not e!75651))))

(assert (=> d!32505 (= res!56832 (contains!861 lt!60107 lt!60112))))

(assert (=> d!32505 (= (addApplyDifferent!80 lt!60107 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60112) lt!60195)))

(declare-fun b!115920 () Bool)

(assert (=> b!115920 (= e!75651 (not (= lt!60112 lt!60098)))))

(assert (= (and d!32505 res!56832) b!115920))

(assert (=> d!32505 m!131787))

(assert (=> d!32505 m!131819))

(assert (=> d!32505 m!131787))

(assert (=> d!32505 m!131789))

(declare-fun m!131989 () Bool)

(assert (=> d!32505 m!131989))

(declare-fun m!131991 () Bool)

(assert (=> d!32505 m!131991))

(assert (=> b!115778 d!32505))

(declare-fun d!32507 () Bool)

(assert (=> d!32507 (= (apply!104 (+!162 lt!60103 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60102) (get!1399 (getValueByKey!162 (toList!839 (+!162 lt!60103 (tuple2!2525 lt!60104 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60102)))))

(declare-fun bs!4714 () Bool)

(assert (= bs!4714 d!32507))

(declare-fun m!131993 () Bool)

(assert (=> bs!4714 m!131993))

(assert (=> bs!4714 m!131993))

(declare-fun m!131995 () Bool)

(assert (=> bs!4714 m!131995))

(assert (=> b!115778 d!32507))

(declare-fun d!32509 () Bool)

(declare-fun e!75652 () Bool)

(assert (=> d!32509 e!75652))

(declare-fun res!56833 () Bool)

(assert (=> d!32509 (=> (not res!56833) (not e!75652))))

(declare-fun lt!60197 () ListLongMap!1647)

(assert (=> d!32509 (= res!56833 (contains!861 lt!60197 (_1!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60199 () List!1674)

(assert (=> d!32509 (= lt!60197 (ListLongMap!1648 lt!60199))))

(declare-fun lt!60198 () Unit!3602)

(declare-fun lt!60196 () Unit!3602)

(assert (=> d!32509 (= lt!60198 lt!60196)))

(assert (=> d!32509 (= (getValueByKey!162 lt!60199 (_1!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32509 (= lt!60196 (lemmaContainsTupThenGetReturnValue!78 lt!60199 (_1!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32509 (= lt!60199 (insertStrictlySorted!81 (toList!839 lt!60118) (_1!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32509 (= (+!162 lt!60118 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60197)))

(declare-fun b!115921 () Bool)

(declare-fun res!56834 () Bool)

(assert (=> b!115921 (=> (not res!56834) (not e!75652))))

(assert (=> b!115921 (= res!56834 (= (getValueByKey!162 (toList!839 lt!60197) (_1!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115922 () Bool)

(assert (=> b!115922 (= e!75652 (contains!862 (toList!839 lt!60197) (tuple2!2525 lt!60106 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32509 res!56833) b!115921))

(assert (= (and b!115921 res!56834) b!115922))

(declare-fun m!131997 () Bool)

(assert (=> d!32509 m!131997))

(declare-fun m!131999 () Bool)

(assert (=> d!32509 m!131999))

(declare-fun m!132001 () Bool)

(assert (=> d!32509 m!132001))

(declare-fun m!132003 () Bool)

(assert (=> d!32509 m!132003))

(declare-fun m!132005 () Bool)

(assert (=> b!115921 m!132005))

(declare-fun m!132007 () Bool)

(assert (=> b!115922 m!132007))

(assert (=> b!115778 d!32509))

(declare-fun d!32511 () Bool)

(declare-fun e!75654 () Bool)

(assert (=> d!32511 e!75654))

(declare-fun res!56835 () Bool)

(assert (=> d!32511 (=> res!56835 e!75654)))

(declare-fun lt!60202 () Bool)

(assert (=> d!32511 (= res!56835 (not lt!60202))))

(declare-fun lt!60203 () Bool)

(assert (=> d!32511 (= lt!60202 lt!60203)))

(declare-fun lt!60201 () Unit!3602)

(declare-fun e!75653 () Unit!3602)

(assert (=> d!32511 (= lt!60201 e!75653)))

(declare-fun c!20574 () Bool)

(assert (=> d!32511 (= c!20574 lt!60203)))

(assert (=> d!32511 (= lt!60203 (containsKey!166 (toList!839 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60108))))

(assert (=> d!32511 (= (contains!861 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60108) lt!60202)))

(declare-fun b!115923 () Bool)

(declare-fun lt!60200 () Unit!3602)

(assert (=> b!115923 (= e!75653 lt!60200)))

(assert (=> b!115923 (= lt!60200 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60108))))

(assert (=> b!115923 (isDefined!115 (getValueByKey!162 (toList!839 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60108))))

(declare-fun b!115924 () Bool)

(declare-fun Unit!3607 () Unit!3602)

(assert (=> b!115924 (= e!75653 Unit!3607)))

(declare-fun b!115925 () Bool)

(assert (=> b!115925 (= e!75654 (isDefined!115 (getValueByKey!162 (toList!839 (+!162 lt!60097 (tuple2!2525 lt!60099 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60108)))))

(assert (= (and d!32511 c!20574) b!115923))

(assert (= (and d!32511 (not c!20574)) b!115924))

(assert (= (and d!32511 (not res!56835)) b!115925))

(declare-fun m!132009 () Bool)

(assert (=> d!32511 m!132009))

(declare-fun m!132011 () Bool)

(assert (=> b!115923 m!132011))

(declare-fun m!132013 () Bool)

(assert (=> b!115923 m!132013))

(assert (=> b!115923 m!132013))

(declare-fun m!132015 () Bool)

(assert (=> b!115923 m!132015))

(assert (=> b!115925 m!132013))

(assert (=> b!115925 m!132013))

(assert (=> b!115925 m!132015))

(assert (=> b!115778 d!32511))

(declare-fun d!32513 () Bool)

(assert (=> d!32513 (= (apply!104 (+!162 lt!60107 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60112) (get!1399 (getValueByKey!162 (toList!839 (+!162 lt!60107 (tuple2!2525 lt!60098 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60112)))))

(declare-fun bs!4715 () Bool)

(assert (= bs!4715 d!32513))

(declare-fun m!132017 () Bool)

(assert (=> bs!4715 m!132017))

(assert (=> bs!4715 m!132017))

(declare-fun m!132019 () Bool)

(assert (=> bs!4715 m!132019))

(assert (=> b!115778 d!32513))

(declare-fun d!32515 () Bool)

(assert (=> d!32515 (= (apply!104 lt!60107 lt!60112) (get!1399 (getValueByKey!162 (toList!839 lt!60107) lt!60112)))))

(declare-fun bs!4716 () Bool)

(assert (= bs!4716 d!32515))

(declare-fun m!132021 () Bool)

(assert (=> bs!4716 m!132021))

(assert (=> bs!4716 m!132021))

(declare-fun m!132023 () Bool)

(assert (=> bs!4716 m!132023))

(assert (=> b!115778 d!32515))

(declare-fun b!115926 () Bool)

(declare-fun e!75664 () Unit!3602)

(declare-fun lt!60218 () Unit!3602)

(assert (=> b!115926 (= e!75664 lt!60218)))

(declare-fun lt!60204 () ListLongMap!1647)

(assert (=> b!115926 (= lt!60204 (getCurrentListMapNoExtraKeys!128 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)))))

(declare-fun lt!60206 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60215 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60215 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60220 () Unit!3602)

(assert (=> b!115926 (= lt!60220 (addStillContains!80 lt!60204 lt!60206 (zeroValue!2574 newMap!16) lt!60215))))

(assert (=> b!115926 (contains!861 (+!162 lt!60204 (tuple2!2525 lt!60206 (zeroValue!2574 newMap!16))) lt!60215)))

(declare-fun lt!60223 () Unit!3602)

(assert (=> b!115926 (= lt!60223 lt!60220)))

(declare-fun lt!60210 () ListLongMap!1647)

(assert (=> b!115926 (= lt!60210 (getCurrentListMapNoExtraKeys!128 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)))))

(declare-fun lt!60211 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60211 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60209 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60209 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60212 () Unit!3602)

(assert (=> b!115926 (= lt!60212 (addApplyDifferent!80 lt!60210 lt!60211 (minValue!2574 newMap!16) lt!60209))))

(assert (=> b!115926 (= (apply!104 (+!162 lt!60210 (tuple2!2525 lt!60211 (minValue!2574 newMap!16))) lt!60209) (apply!104 lt!60210 lt!60209))))

(declare-fun lt!60208 () Unit!3602)

(assert (=> b!115926 (= lt!60208 lt!60212)))

(declare-fun lt!60225 () ListLongMap!1647)

(assert (=> b!115926 (= lt!60225 (getCurrentListMapNoExtraKeys!128 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)))))

(declare-fun lt!60213 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60222 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60222 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!60224 () Unit!3602)

(assert (=> b!115926 (= lt!60224 (addApplyDifferent!80 lt!60225 lt!60213 (zeroValue!2574 newMap!16) lt!60222))))

(assert (=> b!115926 (= (apply!104 (+!162 lt!60225 (tuple2!2525 lt!60213 (zeroValue!2574 newMap!16))) lt!60222) (apply!104 lt!60225 lt!60222))))

(declare-fun lt!60216 () Unit!3602)

(assert (=> b!115926 (= lt!60216 lt!60224)))

(declare-fun lt!60214 () ListLongMap!1647)

(assert (=> b!115926 (= lt!60214 (getCurrentListMapNoExtraKeys!128 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)))))

(declare-fun lt!60205 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60219 () (_ BitVec 64))

(assert (=> b!115926 (= lt!60219 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!115926 (= lt!60218 (addApplyDifferent!80 lt!60214 lt!60205 (minValue!2574 newMap!16) lt!60219))))

(assert (=> b!115926 (= (apply!104 (+!162 lt!60214 (tuple2!2525 lt!60205 (minValue!2574 newMap!16))) lt!60219) (apply!104 lt!60214 lt!60219))))

(declare-fun b!115927 () Bool)

(declare-fun Unit!3608 () Unit!3602)

(assert (=> b!115927 (= e!75664 Unit!3608)))

(declare-fun b!115928 () Bool)

(declare-fun e!75665 () ListLongMap!1647)

(declare-fun call!12414 () ListLongMap!1647)

(assert (=> b!115928 (= e!75665 call!12414)))

(declare-fun b!115929 () Bool)

(declare-fun res!56844 () Bool)

(declare-fun e!75658 () Bool)

(assert (=> b!115929 (=> (not res!56844) (not e!75658))))

(declare-fun e!75666 () Bool)

(assert (=> b!115929 (= res!56844 e!75666)))

(declare-fun res!56837 () Bool)

(assert (=> b!115929 (=> res!56837 e!75666)))

(declare-fun e!75659 () Bool)

(assert (=> b!115929 (= res!56837 (not e!75659))))

(declare-fun res!56842 () Bool)

(assert (=> b!115929 (=> (not res!56842) (not e!75659))))

(assert (=> b!115929 (= res!56842 (bvslt #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(declare-fun b!115930 () Bool)

(declare-fun e!75661 () Bool)

(declare-fun lt!60207 () ListLongMap!1647)

(assert (=> b!115930 (= e!75661 (= (apply!104 lt!60207 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2574 newMap!16)))))

(declare-fun b!115931 () Bool)

(declare-fun call!12408 () ListLongMap!1647)

(assert (=> b!115931 (= e!75665 call!12408)))

(declare-fun d!32517 () Bool)

(assert (=> d!32517 e!75658))

(declare-fun res!56843 () Bool)

(assert (=> d!32517 (=> (not res!56843) (not e!75658))))

(assert (=> d!32517 (= res!56843 (or (bvsge #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))))

(declare-fun lt!60221 () ListLongMap!1647)

(assert (=> d!32517 (= lt!60207 lt!60221)))

(declare-fun lt!60217 () Unit!3602)

(assert (=> d!32517 (= lt!60217 e!75664)))

(declare-fun c!20575 () Bool)

(declare-fun e!75656 () Bool)

(assert (=> d!32517 (= c!20575 e!75656)))

(declare-fun res!56839 () Bool)

(assert (=> d!32517 (=> (not res!56839) (not e!75656))))

(assert (=> d!32517 (= res!56839 (bvslt #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(declare-fun e!75667 () ListLongMap!1647)

(assert (=> d!32517 (= lt!60221 e!75667)))

(declare-fun c!20580 () Bool)

(assert (=> d!32517 (= c!20580 (and (not (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32517 (validMask!0 (mask!6917 newMap!16))))

(assert (=> d!32517 (= (getCurrentListMap!520 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)) lt!60207)))

(declare-fun bm!12405 () Bool)

(declare-fun call!12411 () ListLongMap!1647)

(assert (=> bm!12405 (= call!12414 call!12411)))

(declare-fun b!115932 () Bool)

(assert (=> b!115932 (= e!75656 (validKeyInArray!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115933 () Bool)

(declare-fun e!75663 () ListLongMap!1647)

(assert (=> b!115933 (= e!75663 call!12414)))

(declare-fun b!115934 () Bool)

(assert (=> b!115934 (= e!75667 e!75663)))

(declare-fun c!20577 () Bool)

(assert (=> b!115934 (= c!20577 (and (not (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115935 () Bool)

(assert (=> b!115935 (= e!75667 (+!162 call!12411 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 newMap!16))))))

(declare-fun b!115936 () Bool)

(declare-fun e!75662 () Bool)

(assert (=> b!115936 (= e!75666 e!75662)))

(declare-fun res!56840 () Bool)

(assert (=> b!115936 (=> (not res!56840) (not e!75662))))

(assert (=> b!115936 (= res!56840 (contains!861 lt!60207 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!115936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(declare-fun b!115937 () Bool)

(declare-fun e!75660 () Bool)

(assert (=> b!115937 (= e!75660 e!75661)))

(declare-fun res!56838 () Bool)

(declare-fun call!12412 () Bool)

(assert (=> b!115937 (= res!56838 call!12412)))

(assert (=> b!115937 (=> (not res!56838) (not e!75661))))

(declare-fun b!115938 () Bool)

(declare-fun e!75655 () Bool)

(assert (=> b!115938 (= e!75655 (= (apply!104 lt!60207 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2574 newMap!16)))))

(declare-fun bm!12406 () Bool)

(declare-fun call!12413 () Bool)

(assert (=> bm!12406 (= call!12413 (contains!861 lt!60207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12407 () Bool)

(declare-fun call!12409 () ListLongMap!1647)

(declare-fun call!12410 () ListLongMap!1647)

(assert (=> bm!12407 (= call!12409 call!12410)))

(declare-fun b!115939 () Bool)

(assert (=> b!115939 (= e!75660 (not call!12412))))

(declare-fun b!115940 () Bool)

(assert (=> b!115940 (= e!75662 (= (apply!104 lt!60207 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)) (get!1398 (select (arr!2160 (_values!2690 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2707 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2420 (_values!2690 newMap!16))))))

(assert (=> b!115940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(declare-fun b!115941 () Bool)

(declare-fun res!56836 () Bool)

(assert (=> b!115941 (=> (not res!56836) (not e!75658))))

(assert (=> b!115941 (= res!56836 e!75660)))

(declare-fun c!20579 () Bool)

(assert (=> b!115941 (= c!20579 (not (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!115942 () Bool)

(declare-fun e!75657 () Bool)

(assert (=> b!115942 (= e!75657 (not call!12413))))

(declare-fun b!115943 () Bool)

(assert (=> b!115943 (= e!75658 e!75657)))

(declare-fun c!20578 () Bool)

(assert (=> b!115943 (= c!20578 (not (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!115944 () Bool)

(assert (=> b!115944 (= e!75659 (validKeyInArray!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12408 () Bool)

(assert (=> bm!12408 (= call!12410 (getCurrentListMapNoExtraKeys!128 (_keys!4429 newMap!16) (_values!2690 newMap!16) (mask!6917 newMap!16) (extraKeys!2496 newMap!16) (zeroValue!2574 newMap!16) (minValue!2574 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2707 newMap!16)))))

(declare-fun bm!12409 () Bool)

(assert (=> bm!12409 (= call!12408 call!12409)))

(declare-fun bm!12410 () Bool)

(assert (=> bm!12410 (= call!12412 (contains!861 lt!60207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115945 () Bool)

(assert (=> b!115945 (= e!75657 e!75655)))

(declare-fun res!56841 () Bool)

(assert (=> b!115945 (= res!56841 call!12413)))

(assert (=> b!115945 (=> (not res!56841) (not e!75655))))

(declare-fun b!115946 () Bool)

(declare-fun c!20576 () Bool)

(assert (=> b!115946 (= c!20576 (and (not (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2496 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!115946 (= e!75663 e!75665)))

(declare-fun bm!12411 () Bool)

(assert (=> bm!12411 (= call!12411 (+!162 (ite c!20580 call!12410 (ite c!20577 call!12409 call!12408)) (ite (or c!20580 c!20577) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 newMap!16)))))))

(assert (= (and d!32517 c!20580) b!115935))

(assert (= (and d!32517 (not c!20580)) b!115934))

(assert (= (and b!115934 c!20577) b!115933))

(assert (= (and b!115934 (not c!20577)) b!115946))

(assert (= (and b!115946 c!20576) b!115928))

(assert (= (and b!115946 (not c!20576)) b!115931))

(assert (= (or b!115928 b!115931) bm!12409))

(assert (= (or b!115933 bm!12409) bm!12407))

(assert (= (or b!115933 b!115928) bm!12405))

(assert (= (or b!115935 bm!12407) bm!12408))

(assert (= (or b!115935 bm!12405) bm!12411))

(assert (= (and d!32517 res!56839) b!115932))

(assert (= (and d!32517 c!20575) b!115926))

(assert (= (and d!32517 (not c!20575)) b!115927))

(assert (= (and d!32517 res!56843) b!115929))

(assert (= (and b!115929 res!56842) b!115944))

(assert (= (and b!115929 (not res!56837)) b!115936))

(assert (= (and b!115936 res!56840) b!115940))

(assert (= (and b!115929 res!56844) b!115941))

(assert (= (and b!115941 c!20579) b!115937))

(assert (= (and b!115941 (not c!20579)) b!115939))

(assert (= (and b!115937 res!56838) b!115930))

(assert (= (or b!115937 b!115939) bm!12410))

(assert (= (and b!115941 res!56836) b!115943))

(assert (= (and b!115943 c!20578) b!115945))

(assert (= (and b!115943 (not c!20578)) b!115942))

(assert (= (and b!115945 res!56841) b!115938))

(assert (= (or b!115945 b!115942) bm!12406))

(declare-fun b_lambda!5155 () Bool)

(assert (=> (not b_lambda!5155) (not b!115940)))

(declare-fun tb!2225 () Bool)

(declare-fun t!5935 () Bool)

(assert (=> (and b!115667 (= (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) (defaultEntry!2707 newMap!16)) t!5935) tb!2225))

(declare-fun result!3711 () Bool)

(assert (=> tb!2225 (= result!3711 tp_is_empty!2775)))

(assert (=> b!115940 t!5935))

(declare-fun b_and!7211 () Bool)

(assert (= b_and!7207 (and (=> t!5935 result!3711) b_and!7211)))

(declare-fun t!5937 () Bool)

(declare-fun tb!2227 () Bool)

(assert (=> (and b!115666 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 newMap!16)) t!5937) tb!2227))

(declare-fun result!3713 () Bool)

(assert (= result!3713 result!3711))

(assert (=> b!115940 t!5937))

(declare-fun b_and!7213 () Bool)

(assert (= b_and!7209 (and (=> t!5937 result!3713) b_and!7213)))

(declare-fun m!132025 () Bool)

(assert (=> b!115926 m!132025))

(declare-fun m!132027 () Bool)

(assert (=> b!115926 m!132027))

(declare-fun m!132029 () Bool)

(assert (=> b!115926 m!132029))

(assert (=> b!115926 m!132025))

(declare-fun m!132031 () Bool)

(assert (=> b!115926 m!132031))

(declare-fun m!132033 () Bool)

(assert (=> b!115926 m!132033))

(declare-fun m!132035 () Bool)

(assert (=> b!115926 m!132035))

(assert (=> b!115926 m!132033))

(declare-fun m!132037 () Bool)

(assert (=> b!115926 m!132037))

(declare-fun m!132039 () Bool)

(assert (=> b!115926 m!132039))

(declare-fun m!132041 () Bool)

(assert (=> b!115926 m!132041))

(declare-fun m!132043 () Bool)

(assert (=> b!115926 m!132043))

(declare-fun m!132045 () Bool)

(assert (=> b!115926 m!132045))

(declare-fun m!132047 () Bool)

(assert (=> b!115926 m!132047))

(assert (=> b!115926 m!132035))

(declare-fun m!132049 () Bool)

(assert (=> b!115926 m!132049))

(assert (=> b!115926 m!132043))

(assert (=> b!115926 m!131873))

(declare-fun m!132051 () Bool)

(assert (=> b!115926 m!132051))

(declare-fun m!132053 () Bool)

(assert (=> b!115926 m!132053))

(declare-fun m!132055 () Bool)

(assert (=> b!115926 m!132055))

(declare-fun m!132057 () Bool)

(assert (=> bm!12406 m!132057))

(assert (=> bm!12408 m!132053))

(declare-fun m!132059 () Bool)

(assert (=> bm!12411 m!132059))

(assert (=> b!115940 m!131873))

(declare-fun m!132061 () Bool)

(assert (=> b!115940 m!132061))

(declare-fun m!132063 () Bool)

(assert (=> b!115940 m!132063))

(assert (=> b!115940 m!132063))

(declare-fun m!132065 () Bool)

(assert (=> b!115940 m!132065))

(declare-fun m!132067 () Bool)

(assert (=> b!115940 m!132067))

(assert (=> b!115940 m!131873))

(assert (=> b!115940 m!132065))

(declare-fun m!132069 () Bool)

(assert (=> b!115935 m!132069))

(assert (=> d!32517 m!131887))

(assert (=> b!115944 m!131873))

(assert (=> b!115944 m!131873))

(assert (=> b!115944 m!131883))

(declare-fun m!132071 () Bool)

(assert (=> bm!12410 m!132071))

(declare-fun m!132073 () Bool)

(assert (=> b!115930 m!132073))

(assert (=> b!115932 m!131873))

(assert (=> b!115932 m!131873))

(assert (=> b!115932 m!131883))

(declare-fun m!132075 () Bool)

(assert (=> b!115938 m!132075))

(assert (=> b!115936 m!131873))

(assert (=> b!115936 m!131873))

(declare-fun m!132077 () Bool)

(assert (=> b!115936 m!132077))

(assert (=> d!32449 d!32517))

(declare-fun d!32519 () Bool)

(assert (=> d!32519 (= (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (and (not (= (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!115761 d!32519))

(declare-fun d!32521 () Bool)

(declare-fun e!75668 () Bool)

(assert (=> d!32521 e!75668))

(declare-fun res!56845 () Bool)

(assert (=> d!32521 (=> (not res!56845) (not e!75668))))

(declare-fun lt!60227 () ListLongMap!1647)

(assert (=> d!32521 (= res!56845 (contains!861 lt!60227 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60229 () List!1674)

(assert (=> d!32521 (= lt!60227 (ListLongMap!1648 lt!60229))))

(declare-fun lt!60228 () Unit!3602)

(declare-fun lt!60226 () Unit!3602)

(assert (=> d!32521 (= lt!60228 lt!60226)))

(assert (=> d!32521 (= (getValueByKey!162 lt!60229 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32521 (= lt!60226 (lemmaContainsTupThenGetReturnValue!78 lt!60229 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32521 (= lt!60229 (insertStrictlySorted!81 (toList!839 call!12388) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32521 (= (+!162 call!12388 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60227)))

(declare-fun b!115947 () Bool)

(declare-fun res!56846 () Bool)

(assert (=> b!115947 (=> (not res!56846) (not e!75668))))

(assert (=> b!115947 (= res!56846 (= (getValueByKey!162 (toList!839 lt!60227) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115948 () Bool)

(assert (=> b!115948 (= e!75668 (contains!862 (toList!839 lt!60227) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32521 res!56845) b!115947))

(assert (= (and b!115947 res!56846) b!115948))

(declare-fun m!132079 () Bool)

(assert (=> d!32521 m!132079))

(declare-fun m!132081 () Bool)

(assert (=> d!32521 m!132081))

(declare-fun m!132083 () Bool)

(assert (=> d!32521 m!132083))

(declare-fun m!132085 () Bool)

(assert (=> d!32521 m!132085))

(declare-fun m!132087 () Bool)

(assert (=> b!115947 m!132087))

(declare-fun m!132089 () Bool)

(assert (=> b!115948 m!132089))

(assert (=> b!115764 d!32521))

(declare-fun d!32523 () Bool)

(declare-fun e!75670 () Bool)

(assert (=> d!32523 e!75670))

(declare-fun res!56847 () Bool)

(assert (=> d!32523 (=> res!56847 e!75670)))

(declare-fun lt!60232 () Bool)

(assert (=> d!32523 (= res!56847 (not lt!60232))))

(declare-fun lt!60233 () Bool)

(assert (=> d!32523 (= lt!60232 lt!60233)))

(declare-fun lt!60231 () Unit!3602)

(declare-fun e!75669 () Unit!3602)

(assert (=> d!32523 (= lt!60231 e!75669)))

(declare-fun c!20581 () Bool)

(assert (=> d!32523 (= c!20581 lt!60233)))

(assert (=> d!32523 (= lt!60233 (containsKey!166 (toList!839 lt!60078) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> d!32523 (= (contains!861 lt!60078 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) lt!60232)))

(declare-fun b!115949 () Bool)

(declare-fun lt!60230 () Unit!3602)

(assert (=> b!115949 (= e!75669 lt!60230)))

(assert (=> b!115949 (= lt!60230 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 lt!60078) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115949 (isDefined!115 (getValueByKey!162 (toList!839 lt!60078) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115950 () Bool)

(declare-fun Unit!3609 () Unit!3602)

(assert (=> b!115950 (= e!75669 Unit!3609)))

(declare-fun b!115951 () Bool)

(assert (=> b!115951 (= e!75670 (isDefined!115 (getValueByKey!162 (toList!839 lt!60078) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))))

(assert (= (and d!32523 c!20581) b!115949))

(assert (= (and d!32523 (not c!20581)) b!115950))

(assert (= (and d!32523 (not res!56847)) b!115951))

(assert (=> d!32523 m!131751))

(declare-fun m!132091 () Bool)

(assert (=> d!32523 m!132091))

(assert (=> b!115949 m!131751))

(declare-fun m!132093 () Bool)

(assert (=> b!115949 m!132093))

(assert (=> b!115949 m!131751))

(declare-fun m!132095 () Bool)

(assert (=> b!115949 m!132095))

(assert (=> b!115949 m!132095))

(declare-fun m!132097 () Bool)

(assert (=> b!115949 m!132097))

(assert (=> b!115951 m!131751))

(assert (=> b!115951 m!132095))

(assert (=> b!115951 m!132095))

(assert (=> b!115951 m!132097))

(assert (=> b!115765 d!32523))

(declare-fun d!32525 () Bool)

(declare-fun e!75672 () Bool)

(assert (=> d!32525 e!75672))

(declare-fun res!56848 () Bool)

(assert (=> d!32525 (=> res!56848 e!75672)))

(declare-fun lt!60236 () Bool)

(assert (=> d!32525 (= res!56848 (not lt!60236))))

(declare-fun lt!60237 () Bool)

(assert (=> d!32525 (= lt!60236 lt!60237)))

(declare-fun lt!60235 () Unit!3602)

(declare-fun e!75671 () Unit!3602)

(assert (=> d!32525 (= lt!60235 e!75671)))

(declare-fun c!20582 () Bool)

(assert (=> d!32525 (= c!20582 lt!60237)))

(assert (=> d!32525 (= lt!60237 (containsKey!166 (toList!839 lt!60100) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32525 (= (contains!861 lt!60100 #b0000000000000000000000000000000000000000000000000000000000000000) lt!60236)))

(declare-fun b!115952 () Bool)

(declare-fun lt!60234 () Unit!3602)

(assert (=> b!115952 (= e!75671 lt!60234)))

(assert (=> b!115952 (= lt!60234 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 lt!60100) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115952 (isDefined!115 (getValueByKey!162 (toList!839 lt!60100) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115953 () Bool)

(declare-fun Unit!3610 () Unit!3602)

(assert (=> b!115953 (= e!75671 Unit!3610)))

(declare-fun b!115954 () Bool)

(assert (=> b!115954 (= e!75672 (isDefined!115 (getValueByKey!162 (toList!839 lt!60100) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32525 c!20582) b!115952))

(assert (= (and d!32525 (not c!20582)) b!115953))

(assert (= (and d!32525 (not res!56848)) b!115954))

(declare-fun m!132099 () Bool)

(assert (=> d!32525 m!132099))

(declare-fun m!132101 () Bool)

(assert (=> b!115952 m!132101))

(assert (=> b!115952 m!131861))

(assert (=> b!115952 m!131861))

(declare-fun m!132103 () Bool)

(assert (=> b!115952 m!132103))

(assert (=> b!115954 m!131861))

(assert (=> b!115954 m!131861))

(assert (=> b!115954 m!132103))

(assert (=> bm!12394 d!32525))

(assert (=> bm!12392 d!32499))

(declare-fun d!32527 () Bool)

(declare-fun e!75674 () Bool)

(assert (=> d!32527 e!75674))

(declare-fun res!56849 () Bool)

(assert (=> d!32527 (=> res!56849 e!75674)))

(declare-fun lt!60240 () Bool)

(assert (=> d!32527 (= res!56849 (not lt!60240))))

(declare-fun lt!60241 () Bool)

(assert (=> d!32527 (= lt!60240 lt!60241)))

(declare-fun lt!60239 () Unit!3602)

(declare-fun e!75673 () Unit!3602)

(assert (=> d!32527 (= lt!60239 e!75673)))

(declare-fun c!20583 () Bool)

(assert (=> d!32527 (= c!20583 lt!60241)))

(assert (=> d!32527 (= lt!60241 (containsKey!166 (toList!839 lt!60078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32527 (= (contains!861 lt!60078 #b0000000000000000000000000000000000000000000000000000000000000000) lt!60240)))

(declare-fun b!115955 () Bool)

(declare-fun lt!60238 () Unit!3602)

(assert (=> b!115955 (= e!75673 lt!60238)))

(assert (=> b!115955 (= lt!60238 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 lt!60078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115955 (isDefined!115 (getValueByKey!162 (toList!839 lt!60078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115956 () Bool)

(declare-fun Unit!3611 () Unit!3602)

(assert (=> b!115956 (= e!75673 Unit!3611)))

(declare-fun b!115957 () Bool)

(assert (=> b!115957 (= e!75674 (isDefined!115 (getValueByKey!162 (toList!839 lt!60078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32527 c!20583) b!115955))

(assert (= (and d!32527 (not c!20583)) b!115956))

(assert (= (and d!32527 (not res!56849)) b!115957))

(declare-fun m!132105 () Bool)

(assert (=> d!32527 m!132105))

(declare-fun m!132107 () Bool)

(assert (=> b!115955 m!132107))

(declare-fun m!132109 () Bool)

(assert (=> b!115955 m!132109))

(assert (=> b!115955 m!132109))

(declare-fun m!132111 () Bool)

(assert (=> b!115955 m!132111))

(assert (=> b!115957 m!132109))

(assert (=> b!115957 m!132109))

(assert (=> b!115957 m!132111))

(assert (=> bm!12387 d!32527))

(declare-fun b!115958 () Bool)

(declare-fun e!75679 () ListLongMap!1647)

(assert (=> b!115958 (= e!75679 (ListLongMap!1648 Nil!1671))))

(declare-fun b!115959 () Bool)

(declare-fun e!75677 () Bool)

(declare-fun e!75680 () Bool)

(assert (=> b!115959 (= e!75677 e!75680)))

(declare-fun c!20586 () Bool)

(declare-fun e!75678 () Bool)

(assert (=> b!115959 (= c!20586 e!75678)))

(declare-fun res!56853 () Bool)

(assert (=> b!115959 (=> (not res!56853) (not e!75678))))

(assert (=> b!115959 (= res!56853 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115960 () Bool)

(declare-fun e!75681 () ListLongMap!1647)

(assert (=> b!115960 (= e!75679 e!75681)))

(declare-fun c!20585 () Bool)

(assert (=> b!115960 (= c!20585 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun b!115961 () Bool)

(declare-fun call!12415 () ListLongMap!1647)

(assert (=> b!115961 (= e!75681 call!12415)))

(declare-fun b!115962 () Bool)

(declare-fun e!75676 () Bool)

(assert (=> b!115962 (= e!75680 e!75676)))

(assert (=> b!115962 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun res!56851 () Bool)

(declare-fun lt!60242 () ListLongMap!1647)

(assert (=> b!115962 (= res!56851 (contains!861 lt!60242 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115962 (=> (not res!56851) (not e!75676))))

(declare-fun b!115963 () Bool)

(declare-fun e!75675 () Bool)

(assert (=> b!115963 (= e!75680 e!75675)))

(declare-fun c!20587 () Bool)

(assert (=> b!115963 (= c!20587 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(declare-fun b!115964 () Bool)

(declare-fun lt!60245 () Unit!3602)

(declare-fun lt!60248 () Unit!3602)

(assert (=> b!115964 (= lt!60245 lt!60248)))

(declare-fun lt!60244 () ListLongMap!1647)

(declare-fun lt!60243 () (_ BitVec 64))

(declare-fun lt!60246 () V!3347)

(declare-fun lt!60247 () (_ BitVec 64))

(assert (=> b!115964 (not (contains!861 (+!162 lt!60244 (tuple2!2525 lt!60247 lt!60246)) lt!60243))))

(assert (=> b!115964 (= lt!60248 (addStillNotContains!52 lt!60244 lt!60247 lt!60246 lt!60243))))

(assert (=> b!115964 (= lt!60243 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!115964 (= lt!60246 (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115964 (= lt!60247 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))

(assert (=> b!115964 (= lt!60244 call!12415)))

(assert (=> b!115964 (= e!75681 (+!162 call!12415 (tuple2!2525 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!12412 () Bool)

(assert (=> bm!12412 (= call!12415 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))))))

(declare-fun d!32529 () Bool)

(assert (=> d!32529 e!75677))

(declare-fun res!56850 () Bool)

(assert (=> d!32529 (=> (not res!56850) (not e!75677))))

(assert (=> d!32529 (= res!56850 (not (contains!861 lt!60242 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32529 (= lt!60242 e!75679)))

(declare-fun c!20584 () Bool)

(assert (=> d!32529 (= c!20584 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> d!32529 (validMask!0 (mask!6917 (v!3033 (underlying!408 thiss!992))))))

(assert (=> d!32529 (= (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992)))) lt!60242)))

(declare-fun b!115965 () Bool)

(declare-fun res!56852 () Bool)

(assert (=> b!115965 (=> (not res!56852) (not e!75677))))

(assert (=> b!115965 (= res!56852 (not (contains!861 lt!60242 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115966 () Bool)

(assert (=> b!115966 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2419 (_keys!4429 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115966 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (size!2420 (_values!2690 (v!3033 (underlying!408 thiss!992))))))))

(assert (=> b!115966 (= e!75676 (= (apply!104 lt!60242 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!115967 () Bool)

(assert (=> b!115967 (= e!75675 (isEmpty!386 lt!60242))))

(declare-fun b!115968 () Bool)

(assert (=> b!115968 (= e!75678 (validKeyInArray!0 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(assert (=> b!115968 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!115969 () Bool)

(assert (=> b!115969 (= e!75675 (= lt!60242 (getCurrentListMapNoExtraKeys!128 (_keys!4429 (v!3033 (underlying!408 thiss!992))) (_values!2690 (v!3033 (underlying!408 thiss!992))) (mask!6917 (v!3033 (underlying!408 thiss!992))) (extraKeys!2496 (v!3033 (underlying!408 thiss!992))) (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) (minValue!2574 (v!3033 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32529 c!20584) b!115958))

(assert (= (and d!32529 (not c!20584)) b!115960))

(assert (= (and b!115960 c!20585) b!115964))

(assert (= (and b!115960 (not c!20585)) b!115961))

(assert (= (or b!115964 b!115961) bm!12412))

(assert (= (and d!32529 res!56850) b!115965))

(assert (= (and b!115965 res!56852) b!115959))

(assert (= (and b!115959 res!56853) b!115968))

(assert (= (and b!115959 c!20586) b!115962))

(assert (= (and b!115959 (not c!20586)) b!115963))

(assert (= (and b!115962 res!56851) b!115966))

(assert (= (and b!115963 c!20587) b!115969))

(assert (= (and b!115963 (not c!20587)) b!115967))

(declare-fun b_lambda!5157 () Bool)

(assert (=> (not b_lambda!5157) (not b!115964)))

(assert (=> b!115964 t!5930))

(declare-fun b_and!7215 () Bool)

(assert (= b_and!7211 (and (=> t!5930 result!3703) b_and!7215)))

(assert (=> b!115964 t!5932))

(declare-fun b_and!7217 () Bool)

(assert (= b_and!7213 (and (=> t!5932 result!3707) b_and!7217)))

(declare-fun b_lambda!5159 () Bool)

(assert (=> (not b_lambda!5159) (not b!115966)))

(assert (=> b!115966 t!5930))

(declare-fun b_and!7219 () Bool)

(assert (= b_and!7215 (and (=> t!5930 result!3703) b_and!7219)))

(assert (=> b!115966 t!5932))

(declare-fun b_and!7221 () Bool)

(assert (= b_and!7217 (and (=> t!5932 result!3707) b_and!7221)))

(assert (=> b!115966 m!131765))

(assert (=> b!115966 m!131765))

(assert (=> b!115966 m!131767))

(assert (=> b!115966 m!131769))

(assert (=> b!115966 m!131751))

(assert (=> b!115966 m!131751))

(declare-fun m!132113 () Bool)

(assert (=> b!115966 m!132113))

(assert (=> b!115966 m!131767))

(declare-fun m!132115 () Bool)

(assert (=> b!115967 m!132115))

(declare-fun m!132117 () Bool)

(assert (=> b!115969 m!132117))

(declare-fun m!132119 () Bool)

(assert (=> d!32529 m!132119))

(assert (=> d!32529 m!131773))

(assert (=> b!115962 m!131751))

(assert (=> b!115962 m!131751))

(declare-fun m!132121 () Bool)

(assert (=> b!115962 m!132121))

(assert (=> b!115964 m!131765))

(assert (=> b!115964 m!131765))

(assert (=> b!115964 m!131767))

(assert (=> b!115964 m!131769))

(declare-fun m!132123 () Bool)

(assert (=> b!115964 m!132123))

(assert (=> b!115964 m!131751))

(declare-fun m!132125 () Bool)

(assert (=> b!115964 m!132125))

(assert (=> b!115964 m!132123))

(declare-fun m!132127 () Bool)

(assert (=> b!115964 m!132127))

(assert (=> b!115964 m!131767))

(declare-fun m!132129 () Bool)

(assert (=> b!115964 m!132129))

(declare-fun m!132131 () Bool)

(assert (=> b!115965 m!132131))

(assert (=> bm!12412 m!132117))

(assert (=> b!115968 m!131751))

(assert (=> b!115968 m!131751))

(assert (=> b!115968 m!131775))

(assert (=> b!115960 m!131751))

(assert (=> b!115960 m!131751))

(assert (=> b!115960 m!131775))

(assert (=> bm!12385 d!32529))

(declare-fun d!32531 () Bool)

(declare-fun e!75683 () Bool)

(assert (=> d!32531 e!75683))

(declare-fun res!56854 () Bool)

(assert (=> d!32531 (=> res!56854 e!75683)))

(declare-fun lt!60251 () Bool)

(assert (=> d!32531 (= res!56854 (not lt!60251))))

(declare-fun lt!60252 () Bool)

(assert (=> d!32531 (= lt!60251 lt!60252)))

(declare-fun lt!60250 () Unit!3602)

(declare-fun e!75682 () Unit!3602)

(assert (=> d!32531 (= lt!60250 e!75682)))

(declare-fun c!20588 () Bool)

(assert (=> d!32531 (= c!20588 lt!60252)))

(assert (=> d!32531 (= lt!60252 (containsKey!166 (toList!839 lt!60100) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32531 (= (contains!861 lt!60100 #b1000000000000000000000000000000000000000000000000000000000000000) lt!60251)))

(declare-fun b!115970 () Bool)

(declare-fun lt!60249 () Unit!3602)

(assert (=> b!115970 (= e!75682 lt!60249)))

(assert (=> b!115970 (= lt!60249 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 lt!60100) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!115970 (isDefined!115 (getValueByKey!162 (toList!839 lt!60100) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!115971 () Bool)

(declare-fun Unit!3612 () Unit!3602)

(assert (=> b!115971 (= e!75682 Unit!3612)))

(declare-fun b!115972 () Bool)

(assert (=> b!115972 (= e!75683 (isDefined!115 (getValueByKey!162 (toList!839 lt!60100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32531 c!20588) b!115970))

(assert (= (and d!32531 (not c!20588)) b!115971))

(assert (= (and d!32531 (not res!56854)) b!115972))

(declare-fun m!132133 () Bool)

(assert (=> d!32531 m!132133))

(declare-fun m!132135 () Bool)

(assert (=> b!115970 m!132135))

(declare-fun m!132137 () Bool)

(assert (=> b!115970 m!132137))

(assert (=> b!115970 m!132137))

(declare-fun m!132139 () Bool)

(assert (=> b!115970 m!132139))

(assert (=> b!115972 m!132137))

(assert (=> b!115972 m!132137))

(assert (=> b!115972 m!132139))

(assert (=> bm!12390 d!32531))

(declare-fun d!32533 () Bool)

(declare-fun e!75684 () Bool)

(assert (=> d!32533 e!75684))

(declare-fun res!56855 () Bool)

(assert (=> d!32533 (=> (not res!56855) (not e!75684))))

(declare-fun lt!60254 () ListLongMap!1647)

(assert (=> d!32533 (= res!56855 (contains!861 lt!60254 (_1!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun lt!60256 () List!1674)

(assert (=> d!32533 (= lt!60254 (ListLongMap!1648 lt!60256))))

(declare-fun lt!60255 () Unit!3602)

(declare-fun lt!60253 () Unit!3602)

(assert (=> d!32533 (= lt!60255 lt!60253)))

(assert (=> d!32533 (= (getValueByKey!162 lt!60256 (_1!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32533 (= lt!60253 (lemmaContainsTupThenGetReturnValue!78 lt!60256 (_1!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (_2!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32533 (= lt!60256 (insertStrictlySorted!81 (toList!839 (ite c!20543 call!12387 (ite c!20540 call!12386 call!12385))) (_1!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (_2!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(assert (=> d!32533 (= (+!162 (ite c!20543 call!12387 (ite c!20540 call!12386 call!12385)) (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60254)))

(declare-fun b!115973 () Bool)

(declare-fun res!56856 () Bool)

(assert (=> b!115973 (=> (not res!56856) (not e!75684))))

(assert (=> b!115973 (= res!56856 (= (getValueByKey!162 (toList!839 lt!60254) (_1!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))))

(declare-fun b!115974 () Bool)

(assert (=> b!115974 (= e!75684 (contains!862 (toList!839 lt!60254) (ite (or c!20543 c!20540) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (= (and d!32533 res!56855) b!115973))

(assert (= (and b!115973 res!56856) b!115974))

(declare-fun m!132141 () Bool)

(assert (=> d!32533 m!132141))

(declare-fun m!132143 () Bool)

(assert (=> d!32533 m!132143))

(declare-fun m!132145 () Bool)

(assert (=> d!32533 m!132145))

(declare-fun m!132147 () Bool)

(assert (=> d!32533 m!132147))

(declare-fun m!132149 () Bool)

(assert (=> b!115973 m!132149))

(declare-fun m!132151 () Bool)

(assert (=> b!115974 m!132151))

(assert (=> bm!12388 d!32533))

(declare-fun d!32535 () Bool)

(assert (=> d!32535 (= (apply!104 lt!60100 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1399 (getValueByKey!162 (toList!839 lt!60100) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4717 () Bool)

(assert (= bs!4717 d!32535))

(assert (=> bs!4717 m!131813))

(declare-fun m!132153 () Bool)

(assert (=> bs!4717 m!132153))

(assert (=> bs!4717 m!132153))

(declare-fun m!132155 () Bool)

(assert (=> bs!4717 m!132155))

(assert (=> b!115792 d!32535))

(declare-fun d!32537 () Bool)

(declare-fun c!20591 () Bool)

(assert (=> d!32537 (= c!20591 ((_ is ValueCellFull!1044) (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!75687 () V!3347)

(assert (=> d!32537 (= (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!75687)))

(declare-fun b!115979 () Bool)

(declare-fun get!1400 (ValueCell!1044 V!3347) V!3347)

(assert (=> b!115979 (= e!75687 (get!1400 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115980 () Bool)

(declare-fun get!1401 (ValueCell!1044 V!3347) V!3347)

(assert (=> b!115980 (= e!75687 (get!1401 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32537 c!20591) b!115979))

(assert (= (and d!32537 (not c!20591)) b!115980))

(assert (=> b!115979 m!131827))

(assert (=> b!115979 m!131767))

(declare-fun m!132157 () Bool)

(assert (=> b!115979 m!132157))

(assert (=> b!115980 m!131827))

(assert (=> b!115980 m!131767))

(declare-fun m!132159 () Bool)

(assert (=> b!115980 m!132159))

(assert (=> b!115792 d!32537))

(declare-fun d!32539 () Bool)

(assert (=> d!32539 (= (apply!104 lt!60078 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1399 (getValueByKey!162 (toList!839 lt!60078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4718 () Bool)

(assert (= bs!4718 d!32539))

(assert (=> bs!4718 m!132109))

(assert (=> bs!4718 m!132109))

(declare-fun m!132161 () Bool)

(assert (=> bs!4718 m!132161))

(assert (=> b!115759 d!32539))

(assert (=> d!32447 d!32475))

(declare-fun d!32541 () Bool)

(declare-fun e!75688 () Bool)

(assert (=> d!32541 e!75688))

(declare-fun res!56857 () Bool)

(assert (=> d!32541 (=> (not res!56857) (not e!75688))))

(declare-fun lt!60258 () ListLongMap!1647)

(assert (=> d!32541 (= res!56857 (contains!861 lt!60258 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60260 () List!1674)

(assert (=> d!32541 (= lt!60258 (ListLongMap!1648 lt!60260))))

(declare-fun lt!60259 () Unit!3602)

(declare-fun lt!60257 () Unit!3602)

(assert (=> d!32541 (= lt!60259 lt!60257)))

(assert (=> d!32541 (= (getValueByKey!162 lt!60260 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32541 (= lt!60257 (lemmaContainsTupThenGetReturnValue!78 lt!60260 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32541 (= lt!60260 (insertStrictlySorted!81 (toList!839 call!12395) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32541 (= (+!162 call!12395 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60258)))

(declare-fun b!115981 () Bool)

(declare-fun res!56858 () Bool)

(assert (=> b!115981 (=> (not res!56858) (not e!75688))))

(assert (=> b!115981 (= res!56858 (= (getValueByKey!162 (toList!839 lt!60258) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!115982 () Bool)

(assert (=> b!115982 (= e!75688 (contains!862 (toList!839 lt!60258) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32541 res!56857) b!115981))

(assert (= (and b!115981 res!56858) b!115982))

(declare-fun m!132163 () Bool)

(assert (=> d!32541 m!132163))

(declare-fun m!132165 () Bool)

(assert (=> d!32541 m!132165))

(declare-fun m!132167 () Bool)

(assert (=> d!32541 m!132167))

(declare-fun m!132169 () Bool)

(assert (=> d!32541 m!132169))

(declare-fun m!132171 () Bool)

(assert (=> b!115981 m!132171))

(declare-fun m!132173 () Bool)

(assert (=> b!115982 m!132173))

(assert (=> b!115787 d!32541))

(declare-fun d!32543 () Bool)

(assert (=> d!32543 (= (apply!104 lt!60078 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))) (get!1399 (getValueByKey!162 (toList!839 lt!60078) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))))))))

(declare-fun bs!4719 () Bool)

(assert (= bs!4719 d!32543))

(assert (=> bs!4719 m!131751))

(assert (=> bs!4719 m!132095))

(assert (=> bs!4719 m!132095))

(declare-fun m!132175 () Bool)

(assert (=> bs!4719 m!132175))

(assert (=> b!115769 d!32543))

(declare-fun d!32545 () Bool)

(declare-fun c!20592 () Bool)

(assert (=> d!32545 (= c!20592 ((_ is ValueCellFull!1044) (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)))))))

(declare-fun e!75689 () V!3347)

(assert (=> d!32545 (= (get!1398 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!75689)))

(declare-fun b!115983 () Bool)

(assert (=> b!115983 (= e!75689 (get!1400 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115984 () Bool)

(assert (=> b!115984 (= e!75689 (get!1401 (select (arr!2160 (_values!2690 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001))) (dynLambda!404 (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32545 c!20592) b!115983))

(assert (= (and d!32545 (not c!20592)) b!115984))

(assert (=> b!115983 m!131765))

(assert (=> b!115983 m!131767))

(declare-fun m!132177 () Bool)

(assert (=> b!115983 m!132177))

(assert (=> b!115984 m!131765))

(assert (=> b!115984 m!131767))

(declare-fun m!132179 () Bool)

(assert (=> b!115984 m!132179))

(assert (=> b!115769 d!32545))

(declare-fun b!115995 () Bool)

(declare-fun e!75699 () Bool)

(declare-fun call!12418 () Bool)

(assert (=> b!115995 (= e!75699 call!12418)))

(declare-fun bm!12415 () Bool)

(declare-fun c!20595 () Bool)

(assert (=> bm!12415 (= call!12418 (arrayNoDuplicates!0 (_keys!4429 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20595 (Cons!1671 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000) Nil!1672) Nil!1672)))))

(declare-fun b!115996 () Bool)

(assert (=> b!115996 (= e!75699 call!12418)))

(declare-fun b!115997 () Bool)

(declare-fun e!75701 () Bool)

(declare-fun contains!863 (List!1675 (_ BitVec 64)) Bool)

(assert (=> b!115997 (= e!75701 (contains!863 Nil!1672 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!115998 () Bool)

(declare-fun e!75698 () Bool)

(assert (=> b!115998 (= e!75698 e!75699)))

(assert (=> b!115998 (= c!20595 (validKeyInArray!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32547 () Bool)

(declare-fun res!56866 () Bool)

(declare-fun e!75700 () Bool)

(assert (=> d!32547 (=> res!56866 e!75700)))

(assert (=> d!32547 (= res!56866 (bvsge #b00000000000000000000000000000000 (size!2419 (_keys!4429 newMap!16))))))

(assert (=> d!32547 (= (arrayNoDuplicates!0 (_keys!4429 newMap!16) #b00000000000000000000000000000000 Nil!1672) e!75700)))

(declare-fun b!115999 () Bool)

(assert (=> b!115999 (= e!75700 e!75698)))

(declare-fun res!56865 () Bool)

(assert (=> b!115999 (=> (not res!56865) (not e!75698))))

(assert (=> b!115999 (= res!56865 (not e!75701))))

(declare-fun res!56867 () Bool)

(assert (=> b!115999 (=> (not res!56867) (not e!75701))))

(assert (=> b!115999 (= res!56867 (validKeyInArray!0 (select (arr!2159 (_keys!4429 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32547 (not res!56866)) b!115999))

(assert (= (and b!115999 res!56867) b!115997))

(assert (= (and b!115999 res!56865) b!115998))

(assert (= (and b!115998 c!20595) b!115996))

(assert (= (and b!115998 (not c!20595)) b!115995))

(assert (= (or b!115996 b!115995) bm!12415))

(assert (=> bm!12415 m!131873))

(declare-fun m!132181 () Bool)

(assert (=> bm!12415 m!132181))

(assert (=> b!115997 m!131873))

(assert (=> b!115997 m!131873))

(declare-fun m!132183 () Bool)

(assert (=> b!115997 m!132183))

(assert (=> b!115998 m!131873))

(assert (=> b!115998 m!131873))

(assert (=> b!115998 m!131883))

(assert (=> b!115999 m!131873))

(assert (=> b!115999 m!131873))

(assert (=> b!115999 m!131883))

(assert (=> b!115807 d!32547))

(assert (=> b!115773 d!32519))

(declare-fun d!32549 () Bool)

(assert (=> d!32549 (= (apply!104 lt!60100 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1399 (getValueByKey!162 (toList!839 lt!60100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4720 () Bool)

(assert (= bs!4720 d!32549))

(assert (=> bs!4720 m!132137))

(assert (=> bs!4720 m!132137))

(declare-fun m!132185 () Bool)

(assert (=> bs!4720 m!132185))

(assert (=> b!115790 d!32549))

(declare-fun d!32551 () Bool)

(assert (=> d!32551 (= (apply!104 (+!162 lt!60085 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60090) (apply!104 lt!60085 lt!60090))))

(declare-fun lt!60261 () Unit!3602)

(assert (=> d!32551 (= lt!60261 (choose!726 lt!60085 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60090))))

(declare-fun e!75702 () Bool)

(assert (=> d!32551 e!75702))

(declare-fun res!56868 () Bool)

(assert (=> d!32551 (=> (not res!56868) (not e!75702))))

(assert (=> d!32551 (= res!56868 (contains!861 lt!60085 lt!60090))))

(assert (=> d!32551 (= (addApplyDifferent!80 lt!60085 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60090) lt!60261)))

(declare-fun b!116000 () Bool)

(assert (=> b!116000 (= e!75702 (not (= lt!60090 lt!60076)))))

(assert (= (and d!32551 res!56868) b!116000))

(assert (=> d!32551 m!131725))

(assert (=> d!32551 m!131757))

(assert (=> d!32551 m!131725))

(assert (=> d!32551 m!131727))

(declare-fun m!132187 () Bool)

(assert (=> d!32551 m!132187))

(declare-fun m!132189 () Bool)

(assert (=> d!32551 m!132189))

(assert (=> b!115755 d!32551))

(declare-fun d!32553 () Bool)

(declare-fun e!75703 () Bool)

(assert (=> d!32553 e!75703))

(declare-fun res!56869 () Bool)

(assert (=> d!32553 (=> (not res!56869) (not e!75703))))

(declare-fun lt!60263 () ListLongMap!1647)

(assert (=> d!32553 (= res!56869 (contains!861 lt!60263 (_1!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60265 () List!1674)

(assert (=> d!32553 (= lt!60263 (ListLongMap!1648 lt!60265))))

(declare-fun lt!60264 () Unit!3602)

(declare-fun lt!60262 () Unit!3602)

(assert (=> d!32553 (= lt!60264 lt!60262)))

(assert (=> d!32553 (= (getValueByKey!162 lt!60265 (_1!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32553 (= lt!60262 (lemmaContainsTupThenGetReturnValue!78 lt!60265 (_1!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32553 (= lt!60265 (insertStrictlySorted!81 (toList!839 lt!60085) (_1!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32553 (= (+!162 lt!60085 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60263)))

(declare-fun b!116001 () Bool)

(declare-fun res!56870 () Bool)

(assert (=> b!116001 (=> (not res!56870) (not e!75703))))

(assert (=> b!116001 (= res!56870 (= (getValueByKey!162 (toList!839 lt!60263) (_1!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!116002 () Bool)

(assert (=> b!116002 (= e!75703 (contains!862 (toList!839 lt!60263) (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32553 res!56869) b!116001))

(assert (= (and b!116001 res!56870) b!116002))

(declare-fun m!132191 () Bool)

(assert (=> d!32553 m!132191))

(declare-fun m!132193 () Bool)

(assert (=> d!32553 m!132193))

(declare-fun m!132195 () Bool)

(assert (=> d!32553 m!132195))

(declare-fun m!132197 () Bool)

(assert (=> d!32553 m!132197))

(declare-fun m!132199 () Bool)

(assert (=> b!116001 m!132199))

(declare-fun m!132201 () Bool)

(assert (=> b!116002 m!132201))

(assert (=> b!115755 d!32553))

(declare-fun d!32555 () Bool)

(assert (=> d!32555 (= (apply!104 (+!162 lt!60081 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60080) (apply!104 lt!60081 lt!60080))))

(declare-fun lt!60266 () Unit!3602)

(assert (=> d!32555 (= lt!60266 (choose!726 lt!60081 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60080))))

(declare-fun e!75704 () Bool)

(assert (=> d!32555 e!75704))

(declare-fun res!56871 () Bool)

(assert (=> d!32555 (=> (not res!56871) (not e!75704))))

(assert (=> d!32555 (= res!56871 (contains!861 lt!60081 lt!60080))))

(assert (=> d!32555 (= (addApplyDifferent!80 lt!60081 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60080) lt!60266)))

(declare-fun b!116003 () Bool)

(assert (=> b!116003 (= e!75704 (not (= lt!60080 lt!60082)))))

(assert (= (and d!32555 res!56871) b!116003))

(assert (=> d!32555 m!131735))

(assert (=> d!32555 m!131747))

(assert (=> d!32555 m!131735))

(assert (=> d!32555 m!131749))

(declare-fun m!132203 () Bool)

(assert (=> d!32555 m!132203))

(declare-fun m!132205 () Bool)

(assert (=> d!32555 m!132205))

(assert (=> b!115755 d!32555))

(declare-fun d!32557 () Bool)

(declare-fun e!75705 () Bool)

(assert (=> d!32557 e!75705))

(declare-fun res!56872 () Bool)

(assert (=> d!32557 (=> (not res!56872) (not e!75705))))

(declare-fun lt!60268 () ListLongMap!1647)

(assert (=> d!32557 (= res!56872 (contains!861 lt!60268 (_1!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60270 () List!1674)

(assert (=> d!32557 (= lt!60268 (ListLongMap!1648 lt!60270))))

(declare-fun lt!60269 () Unit!3602)

(declare-fun lt!60267 () Unit!3602)

(assert (=> d!32557 (= lt!60269 lt!60267)))

(assert (=> d!32557 (= (getValueByKey!162 lt!60270 (_1!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32557 (= lt!60267 (lemmaContainsTupThenGetReturnValue!78 lt!60270 (_1!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32557 (= lt!60270 (insertStrictlySorted!81 (toList!839 lt!60096) (_1!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32557 (= (+!162 lt!60096 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60268)))

(declare-fun b!116004 () Bool)

(declare-fun res!56873 () Bool)

(assert (=> b!116004 (=> (not res!56873) (not e!75705))))

(assert (=> b!116004 (= res!56873 (= (getValueByKey!162 (toList!839 lt!60268) (_1!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!116005 () Bool)

(assert (=> b!116005 (= e!75705 (contains!862 (toList!839 lt!60268) (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32557 res!56872) b!116004))

(assert (= (and b!116004 res!56873) b!116005))

(declare-fun m!132207 () Bool)

(assert (=> d!32557 m!132207))

(declare-fun m!132209 () Bool)

(assert (=> d!32557 m!132209))

(declare-fun m!132211 () Bool)

(assert (=> d!32557 m!132211))

(declare-fun m!132213 () Bool)

(assert (=> d!32557 m!132213))

(declare-fun m!132215 () Bool)

(assert (=> b!116004 m!132215))

(declare-fun m!132217 () Bool)

(assert (=> b!116005 m!132217))

(assert (=> b!115755 d!32557))

(declare-fun d!32559 () Bool)

(assert (=> d!32559 (= (apply!104 lt!60085 lt!60090) (get!1399 (getValueByKey!162 (toList!839 lt!60085) lt!60090)))))

(declare-fun bs!4721 () Bool)

(assert (= bs!4721 d!32559))

(declare-fun m!132219 () Bool)

(assert (=> bs!4721 m!132219))

(assert (=> bs!4721 m!132219))

(declare-fun m!132221 () Bool)

(assert (=> bs!4721 m!132221))

(assert (=> b!115755 d!32559))

(declare-fun d!32561 () Bool)

(assert (=> d!32561 (= (apply!104 lt!60096 lt!60093) (get!1399 (getValueByKey!162 (toList!839 lt!60096) lt!60093)))))

(declare-fun bs!4722 () Bool)

(assert (= bs!4722 d!32561))

(declare-fun m!132223 () Bool)

(assert (=> bs!4722 m!132223))

(assert (=> bs!4722 m!132223))

(declare-fun m!132225 () Bool)

(assert (=> bs!4722 m!132225))

(assert (=> b!115755 d!32561))

(declare-fun d!32563 () Bool)

(declare-fun e!75707 () Bool)

(assert (=> d!32563 e!75707))

(declare-fun res!56874 () Bool)

(assert (=> d!32563 (=> res!56874 e!75707)))

(declare-fun lt!60273 () Bool)

(assert (=> d!32563 (= res!56874 (not lt!60273))))

(declare-fun lt!60274 () Bool)

(assert (=> d!32563 (= lt!60273 lt!60274)))

(declare-fun lt!60272 () Unit!3602)

(declare-fun e!75706 () Unit!3602)

(assert (=> d!32563 (= lt!60272 e!75706)))

(declare-fun c!20596 () Bool)

(assert (=> d!32563 (= c!20596 lt!60274)))

(assert (=> d!32563 (= lt!60274 (containsKey!166 (toList!839 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60086))))

(assert (=> d!32563 (= (contains!861 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60086) lt!60273)))

(declare-fun b!116006 () Bool)

(declare-fun lt!60271 () Unit!3602)

(assert (=> b!116006 (= e!75706 lt!60271)))

(assert (=> b!116006 (= lt!60271 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60086))))

(assert (=> b!116006 (isDefined!115 (getValueByKey!162 (toList!839 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60086))))

(declare-fun b!116007 () Bool)

(declare-fun Unit!3613 () Unit!3602)

(assert (=> b!116007 (= e!75706 Unit!3613)))

(declare-fun b!116008 () Bool)

(assert (=> b!116008 (= e!75707 (isDefined!115 (getValueByKey!162 (toList!839 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60086)))))

(assert (= (and d!32563 c!20596) b!116006))

(assert (= (and d!32563 (not c!20596)) b!116007))

(assert (= (and d!32563 (not res!56874)) b!116008))

(declare-fun m!132227 () Bool)

(assert (=> d!32563 m!132227))

(declare-fun m!132229 () Bool)

(assert (=> b!116006 m!132229))

(declare-fun m!132231 () Bool)

(assert (=> b!116006 m!132231))

(assert (=> b!116006 m!132231))

(declare-fun m!132233 () Bool)

(assert (=> b!116006 m!132233))

(assert (=> b!116008 m!132231))

(assert (=> b!116008 m!132231))

(assert (=> b!116008 m!132233))

(assert (=> b!115755 d!32563))

(declare-fun d!32565 () Bool)

(declare-fun e!75708 () Bool)

(assert (=> d!32565 e!75708))

(declare-fun res!56875 () Bool)

(assert (=> d!32565 (=> (not res!56875) (not e!75708))))

(declare-fun lt!60276 () ListLongMap!1647)

(assert (=> d!32565 (= res!56875 (contains!861 lt!60276 (_1!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60278 () List!1674)

(assert (=> d!32565 (= lt!60276 (ListLongMap!1648 lt!60278))))

(declare-fun lt!60277 () Unit!3602)

(declare-fun lt!60275 () Unit!3602)

(assert (=> d!32565 (= lt!60277 lt!60275)))

(assert (=> d!32565 (= (getValueByKey!162 lt!60278 (_1!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32565 (= lt!60275 (lemmaContainsTupThenGetReturnValue!78 lt!60278 (_1!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32565 (= lt!60278 (insertStrictlySorted!81 (toList!839 lt!60081) (_1!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32565 (= (+!162 lt!60081 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60276)))

(declare-fun b!116009 () Bool)

(declare-fun res!56876 () Bool)

(assert (=> b!116009 (=> (not res!56876) (not e!75708))))

(assert (=> b!116009 (= res!56876 (= (getValueByKey!162 (toList!839 lt!60276) (_1!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!116010 () Bool)

(assert (=> b!116010 (= e!75708 (contains!862 (toList!839 lt!60276) (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32565 res!56875) b!116009))

(assert (= (and b!116009 res!56876) b!116010))

(declare-fun m!132235 () Bool)

(assert (=> d!32565 m!132235))

(declare-fun m!132237 () Bool)

(assert (=> d!32565 m!132237))

(declare-fun m!132239 () Bool)

(assert (=> d!32565 m!132239))

(declare-fun m!132241 () Bool)

(assert (=> d!32565 m!132241))

(declare-fun m!132243 () Bool)

(assert (=> b!116009 m!132243))

(declare-fun m!132245 () Bool)

(assert (=> b!116010 m!132245))

(assert (=> b!115755 d!32565))

(declare-fun d!32567 () Bool)

(assert (=> d!32567 (= (apply!104 (+!162 lt!60085 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60090) (get!1399 (getValueByKey!162 (toList!839 (+!162 lt!60085 (tuple2!2525 lt!60076 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60090)))))

(declare-fun bs!4723 () Bool)

(assert (= bs!4723 d!32567))

(declare-fun m!132247 () Bool)

(assert (=> bs!4723 m!132247))

(assert (=> bs!4723 m!132247))

(declare-fun m!132249 () Bool)

(assert (=> bs!4723 m!132249))

(assert (=> b!115755 d!32567))

(declare-fun d!32569 () Bool)

(assert (=> d!32569 (= (apply!104 (+!162 lt!60081 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60080) (get!1399 (getValueByKey!162 (toList!839 (+!162 lt!60081 (tuple2!2525 lt!60082 (minValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60080)))))

(declare-fun bs!4724 () Bool)

(assert (= bs!4724 d!32569))

(declare-fun m!132251 () Bool)

(assert (=> bs!4724 m!132251))

(assert (=> bs!4724 m!132251))

(declare-fun m!132253 () Bool)

(assert (=> bs!4724 m!132253))

(assert (=> b!115755 d!32569))

(declare-fun d!32571 () Bool)

(assert (=> d!32571 (contains!861 (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60086)))

(declare-fun lt!60279 () Unit!3602)

(assert (=> d!32571 (= lt!60279 (choose!725 lt!60075 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60086))))

(assert (=> d!32571 (contains!861 lt!60075 lt!60086)))

(assert (=> d!32571 (= (addStillContains!80 lt!60075 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60086) lt!60279)))

(declare-fun bs!4725 () Bool)

(assert (= bs!4725 d!32571))

(assert (=> bs!4725 m!131733))

(assert (=> bs!4725 m!131733))

(assert (=> bs!4725 m!131737))

(declare-fun m!132255 () Bool)

(assert (=> bs!4725 m!132255))

(declare-fun m!132257 () Bool)

(assert (=> bs!4725 m!132257))

(assert (=> b!115755 d!32571))

(declare-fun d!32573 () Bool)

(assert (=> d!32573 (= (apply!104 lt!60081 lt!60080) (get!1399 (getValueByKey!162 (toList!839 lt!60081) lt!60080)))))

(declare-fun bs!4726 () Bool)

(assert (= bs!4726 d!32573))

(declare-fun m!132259 () Bool)

(assert (=> bs!4726 m!132259))

(assert (=> bs!4726 m!132259))

(declare-fun m!132261 () Bool)

(assert (=> bs!4726 m!132261))

(assert (=> b!115755 d!32573))

(assert (=> b!115755 d!32529))

(declare-fun d!32575 () Bool)

(declare-fun e!75709 () Bool)

(assert (=> d!32575 e!75709))

(declare-fun res!56877 () Bool)

(assert (=> d!32575 (=> (not res!56877) (not e!75709))))

(declare-fun lt!60281 () ListLongMap!1647)

(assert (=> d!32575 (= res!56877 (contains!861 lt!60281 (_1!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(declare-fun lt!60283 () List!1674)

(assert (=> d!32575 (= lt!60281 (ListLongMap!1648 lt!60283))))

(declare-fun lt!60282 () Unit!3602)

(declare-fun lt!60280 () Unit!3602)

(assert (=> d!32575 (= lt!60282 lt!60280)))

(assert (=> d!32575 (= (getValueByKey!162 lt!60283 (_1!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32575 (= lt!60280 (lemmaContainsTupThenGetReturnValue!78 lt!60283 (_1!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32575 (= lt!60283 (insertStrictlySorted!81 (toList!839 lt!60075) (_1!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) (_2!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))))))

(assert (=> d!32575 (= (+!162 lt!60075 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60281)))

(declare-fun b!116011 () Bool)

(declare-fun res!56878 () Bool)

(assert (=> b!116011 (=> (not res!56878) (not e!75709))))

(assert (=> b!116011 (= res!56878 (= (getValueByKey!162 (toList!839 lt!60281) (_1!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))))

(declare-fun b!116012 () Bool)

(assert (=> b!116012 (= e!75709 (contains!862 (toList!839 lt!60281) (tuple2!2525 lt!60077 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))))))

(assert (= (and d!32575 res!56877) b!116011))

(assert (= (and b!116011 res!56878) b!116012))

(declare-fun m!132263 () Bool)

(assert (=> d!32575 m!132263))

(declare-fun m!132265 () Bool)

(assert (=> d!32575 m!132265))

(declare-fun m!132267 () Bool)

(assert (=> d!32575 m!132267))

(declare-fun m!132269 () Bool)

(assert (=> d!32575 m!132269))

(declare-fun m!132271 () Bool)

(assert (=> b!116011 m!132271))

(declare-fun m!132273 () Bool)

(assert (=> b!116012 m!132273))

(assert (=> b!115755 d!32575))

(declare-fun d!32577 () Bool)

(assert (=> d!32577 (= (apply!104 (+!162 lt!60096 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60093) (get!1399 (getValueByKey!162 (toList!839 (+!162 lt!60096 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992)))))) lt!60093)))))

(declare-fun bs!4727 () Bool)

(assert (= bs!4727 d!32577))

(declare-fun m!132275 () Bool)

(assert (=> bs!4727 m!132275))

(assert (=> bs!4727 m!132275))

(declare-fun m!132277 () Bool)

(assert (=> bs!4727 m!132277))

(assert (=> b!115755 d!32577))

(declare-fun d!32579 () Bool)

(assert (=> d!32579 (= (apply!104 (+!162 lt!60096 (tuple2!2525 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))))) lt!60093) (apply!104 lt!60096 lt!60093))))

(declare-fun lt!60284 () Unit!3602)

(assert (=> d!32579 (= lt!60284 (choose!726 lt!60096 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60093))))

(declare-fun e!75710 () Bool)

(assert (=> d!32579 e!75710))

(declare-fun res!56879 () Bool)

(assert (=> d!32579 (=> (not res!56879) (not e!75710))))

(assert (=> d!32579 (= res!56879 (contains!861 lt!60096 lt!60093))))

(assert (=> d!32579 (= (addApplyDifferent!80 lt!60096 lt!60084 (zeroValue!2574 (v!3033 (underlying!408 thiss!992))) lt!60093) lt!60284)))

(declare-fun b!116013 () Bool)

(assert (=> b!116013 (= e!75710 (not (= lt!60093 lt!60084)))))

(assert (= (and d!32579 res!56879) b!116013))

(assert (=> d!32579 m!131743))

(assert (=> d!32579 m!131741))

(assert (=> d!32579 m!131743))

(assert (=> d!32579 m!131745))

(declare-fun m!132279 () Bool)

(assert (=> d!32579 m!132279))

(declare-fun m!132281 () Bool)

(assert (=> d!32579 m!132281))

(assert (=> b!115755 d!32579))

(declare-fun d!32581 () Bool)

(declare-fun e!75712 () Bool)

(assert (=> d!32581 e!75712))

(declare-fun res!56880 () Bool)

(assert (=> d!32581 (=> res!56880 e!75712)))

(declare-fun lt!60287 () Bool)

(assert (=> d!32581 (= res!56880 (not lt!60287))))

(declare-fun lt!60288 () Bool)

(assert (=> d!32581 (= lt!60287 lt!60288)))

(declare-fun lt!60286 () Unit!3602)

(declare-fun e!75711 () Unit!3602)

(assert (=> d!32581 (= lt!60286 e!75711)))

(declare-fun c!20597 () Bool)

(assert (=> d!32581 (= c!20597 lt!60288)))

(assert (=> d!32581 (= lt!60288 (containsKey!166 (toList!839 lt!60100) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32581 (= (contains!861 lt!60100 (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!60287)))

(declare-fun b!116014 () Bool)

(declare-fun lt!60285 () Unit!3602)

(assert (=> b!116014 (= e!75711 lt!60285)))

(assert (=> b!116014 (= lt!60285 (lemmaContainsKeyImpliesGetValueByKeyDefined!114 (toList!839 lt!60100) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116014 (isDefined!115 (getValueByKey!162 (toList!839 lt!60100) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116015 () Bool)

(declare-fun Unit!3614 () Unit!3602)

(assert (=> b!116015 (= e!75711 Unit!3614)))

(declare-fun b!116016 () Bool)

(assert (=> b!116016 (= e!75712 (isDefined!115 (getValueByKey!162 (toList!839 lt!60100) (select (arr!2159 (_keys!4429 (v!3033 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32581 c!20597) b!116014))

(assert (= (and d!32581 (not c!20597)) b!116015))

(assert (= (and d!32581 (not res!56880)) b!116016))

(assert (=> d!32581 m!131813))

(declare-fun m!132283 () Bool)

(assert (=> d!32581 m!132283))

(assert (=> b!116014 m!131813))

(declare-fun m!132285 () Bool)

(assert (=> b!116014 m!132285))

(assert (=> b!116014 m!131813))

(assert (=> b!116014 m!132153))

(assert (=> b!116014 m!132153))

(declare-fun m!132287 () Bool)

(assert (=> b!116014 m!132287))

(assert (=> b!116016 m!131813))

(assert (=> b!116016 m!132153))

(assert (=> b!116016 m!132153))

(assert (=> b!116016 m!132287))

(assert (=> b!115788 d!32581))

(declare-fun b!116018 () Bool)

(declare-fun e!75713 () Bool)

(assert (=> b!116018 (= e!75713 tp_is_empty!2775)))

(declare-fun mapNonEmpty!4269 () Bool)

(declare-fun mapRes!4269 () Bool)

(declare-fun tp!10533 () Bool)

(declare-fun e!75714 () Bool)

(assert (=> mapNonEmpty!4269 (= mapRes!4269 (and tp!10533 e!75714))))

(declare-fun mapRest!4269 () (Array (_ BitVec 32) ValueCell!1044))

(declare-fun mapKey!4269 () (_ BitVec 32))

(declare-fun mapValue!4269 () ValueCell!1044)

(assert (=> mapNonEmpty!4269 (= mapRest!4268 (store mapRest!4269 mapKey!4269 mapValue!4269))))

(declare-fun mapIsEmpty!4269 () Bool)

(assert (=> mapIsEmpty!4269 mapRes!4269))

(declare-fun condMapEmpty!4269 () Bool)

(declare-fun mapDefault!4269 () ValueCell!1044)

(assert (=> mapNonEmpty!4268 (= condMapEmpty!4269 (= mapRest!4268 ((as const (Array (_ BitVec 32) ValueCell!1044)) mapDefault!4269)))))

(assert (=> mapNonEmpty!4268 (= tp!10532 (and e!75713 mapRes!4269))))

(declare-fun b!116017 () Bool)

(assert (=> b!116017 (= e!75714 tp_is_empty!2775)))

(assert (= (and mapNonEmpty!4268 condMapEmpty!4269) mapIsEmpty!4269))

(assert (= (and mapNonEmpty!4268 (not condMapEmpty!4269)) mapNonEmpty!4269))

(assert (= (and mapNonEmpty!4269 ((_ is ValueCellFull!1044) mapValue!4269)) b!116017))

(assert (= (and mapNonEmpty!4268 ((_ is ValueCellFull!1044) mapDefault!4269)) b!116018))

(declare-fun m!132289 () Bool)

(assert (=> mapNonEmpty!4269 m!132289))

(declare-fun b!116020 () Bool)

(declare-fun e!75715 () Bool)

(assert (=> b!116020 (= e!75715 tp_is_empty!2775)))

(declare-fun mapNonEmpty!4270 () Bool)

(declare-fun mapRes!4270 () Bool)

(declare-fun tp!10534 () Bool)

(declare-fun e!75716 () Bool)

(assert (=> mapNonEmpty!4270 (= mapRes!4270 (and tp!10534 e!75716))))

(declare-fun mapValue!4270 () ValueCell!1044)

(declare-fun mapRest!4270 () (Array (_ BitVec 32) ValueCell!1044))

(declare-fun mapKey!4270 () (_ BitVec 32))

(assert (=> mapNonEmpty!4270 (= mapRest!4267 (store mapRest!4270 mapKey!4270 mapValue!4270))))

(declare-fun mapIsEmpty!4270 () Bool)

(assert (=> mapIsEmpty!4270 mapRes!4270))

(declare-fun condMapEmpty!4270 () Bool)

(declare-fun mapDefault!4270 () ValueCell!1044)

(assert (=> mapNonEmpty!4267 (= condMapEmpty!4270 (= mapRest!4267 ((as const (Array (_ BitVec 32) ValueCell!1044)) mapDefault!4270)))))

(assert (=> mapNonEmpty!4267 (= tp!10531 (and e!75715 mapRes!4270))))

(declare-fun b!116019 () Bool)

(assert (=> b!116019 (= e!75716 tp_is_empty!2775)))

(assert (= (and mapNonEmpty!4267 condMapEmpty!4270) mapIsEmpty!4270))

(assert (= (and mapNonEmpty!4267 (not condMapEmpty!4270)) mapNonEmpty!4270))

(assert (= (and mapNonEmpty!4270 ((_ is ValueCellFull!1044) mapValue!4270)) b!116019))

(assert (= (and mapNonEmpty!4267 ((_ is ValueCellFull!1044) mapDefault!4270)) b!116020))

(declare-fun m!132291 () Bool)

(assert (=> mapNonEmpty!4270 m!132291))

(declare-fun b_lambda!5161 () Bool)

(assert (= b_lambda!5155 (or (and b!115667 b_free!2717 (= (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))) (defaultEntry!2707 newMap!16))) (and b!115666 b_free!2719) b_lambda!5161)))

(declare-fun b_lambda!5163 () Bool)

(assert (= b_lambda!5153 (or (and b!115667 b_free!2717) (and b!115666 b_free!2719 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))) b_lambda!5163)))

(declare-fun b_lambda!5165 () Bool)

(assert (= b_lambda!5151 (or (and b!115667 b_free!2717) (and b!115666 b_free!2719 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))) b_lambda!5165)))

(declare-fun b_lambda!5167 () Bool)

(assert (= b_lambda!5157 (or (and b!115667 b_free!2717) (and b!115666 b_free!2719 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))) b_lambda!5167)))

(declare-fun b_lambda!5169 () Bool)

(assert (= b_lambda!5159 (or (and b!115667 b_free!2717) (and b!115666 b_free!2719 (= (defaultEntry!2707 newMap!16) (defaultEntry!2707 (v!3033 (underlying!408 thiss!992))))) b_lambda!5169)))

(check-sat (not b!115979) (not d!32563) (not d!32551) (not d!32515) (not d!32501) (not b!115999) (not d!32531) (not bm!12412) (not b!115954) (not b!116008) (not d!32577) (not b!115842) (not b!115984) (not b!115868) (not b!115970) (not b!116010) (not bm!12406) (not b_lambda!5149) (not b!115874) (not d!32495) (not mapNonEmpty!4269) (not bm!12415) (not b!115932) (not d!32481) (not bm!12404) (not b!115820) (not b!115968) (not d!32527) (not d!32541) (not b!115843) (not d!32581) (not b!115982) (not b!116012) (not b!115849) (not d!32565) (not d!32513) (not d!32567) (not b!115875) (not b!115909) (not b!115923) (not b!115850) (not b!116016) (not d!32485) (not b!115957) (not b!115969) (not b!116011) (not b!115967) (not d!32517) (not b!116014) (not d!32525) (not d!32559) (not d!32521) (not b!115997) (not b!115907) (not b!115857) (not d!32491) (not d!32509) (not b!115905) (not d!32479) (not b!115925) (not b!115829) (not d!32573) (not b!115952) (not b_lambda!5163) b_and!7221 (not b!115940) (not b!115914) (not d!32497) (not d!32543) (not bm!12408) (not b!116001) (not b!115960) (not b!115872) (not b!115912) (not b!115962) (not d!32529) (not b!115951) (not b!115980) (not b!115981) (not b_lambda!5169) (not d!32493) (not d!32575) (not d!32555) tp_is_empty!2775 (not bm!12398) (not d!32477) (not b!115921) (not d!32571) (not b!116005) (not b!115947) (not bm!12401) (not d!32569) (not b!116002) (not b_lambda!5165) (not b!115913) (not b!115973) (not bm!12410) (not d!32465) (not b!115877) (not bm!12411) (not b!115818) (not b!115873) (not mapNonEmpty!4270) (not b!116009) (not b!115926) (not b!116004) (not d!32549) (not d!32523) (not d!32503) (not b!115831) (not d!32535) (not d!32469) (not b!115998) (not b_lambda!5161) (not b!115972) (not b!115964) (not b!115876) (not d!32505) (not b!115955) (not b_lambda!5147) (not b!115935) (not b_next!2719) (not d!32507) (not b!115930) (not d!32539) (not b!115910) (not d!32557) (not b!115819) (not b!115948) (not b!115936) (not d!32511) (not d!32467) (not b!115938) (not b!115983) (not b!115859) (not b!115949) (not b!115944) (not b!115974) (not b_lambda!5167) (not d!32487) (not b!115966) (not b!115911) (not b!116006) (not d!32499) (not d!32579) (not d!32489) (not d!32553) (not b!115922) (not d!32533) (not b_next!2717) b_and!7219 (not b!115965) (not d!32561))
(check-sat b_and!7219 b_and!7221 (not b_next!2717) (not b_next!2719))
