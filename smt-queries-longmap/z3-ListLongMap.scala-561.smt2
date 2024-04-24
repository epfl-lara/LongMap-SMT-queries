; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15212 () Bool)

(assert start!15212)

(declare-fun b!146351 () Bool)

(declare-fun b_free!3121 () Bool)

(declare-fun b_next!3121 () Bool)

(assert (=> b!146351 (= b_free!3121 (not b_next!3121))))

(declare-fun tp!11868 () Bool)

(declare-fun b_and!9161 () Bool)

(assert (=> b!146351 (= tp!11868 b_and!9161)))

(declare-fun b!146339 () Bool)

(declare-fun b_free!3123 () Bool)

(declare-fun b_next!3123 () Bool)

(assert (=> b!146339 (= b_free!3123 (not b_next!3123))))

(declare-fun tp!11865 () Bool)

(declare-fun b_and!9163 () Bool)

(assert (=> b!146339 (= tp!11865 b_and!9163)))

(declare-fun res!69624 () Bool)

(declare-fun e!95481 () Bool)

(assert (=> start!15212 (=> (not res!69624) (not e!95481))))

(declare-datatypes ((V!3617 0))(
  ( (V!3618 (val!1533 Int)) )
))
(declare-datatypes ((array!4985 0))(
  ( (array!4986 (arr!2354 (Array (_ BitVec 32) (_ BitVec 64))) (size!2630 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1145 0))(
  ( (ValueCellFull!1145 (v!3358 V!3617)) (EmptyCell!1145) )
))
(declare-datatypes ((array!4987 0))(
  ( (array!4988 (arr!2355 (Array (_ BitVec 32) ValueCell!1145)) (size!2631 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1198 0))(
  ( (LongMapFixedSize!1199 (defaultEntry!3015 Int) (mask!7393 (_ BitVec 32)) (extraKeys!2760 (_ BitVec 32)) (zeroValue!2860 V!3617) (minValue!2860 V!3617) (_size!648 (_ BitVec 32)) (_keys!4784 array!4985) (_values!2998 array!4987) (_vacant!648 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!984 0))(
  ( (Cell!985 (v!3359 LongMapFixedSize!1198)) )
))
(declare-datatypes ((LongMap!984 0))(
  ( (LongMap!985 (underlying!503 Cell!984)) )
))
(declare-fun thiss!992 () LongMap!984)

(declare-fun valid!602 (LongMap!984) Bool)

(assert (=> start!15212 (= res!69624 (valid!602 thiss!992))))

(assert (=> start!15212 e!95481))

(declare-fun e!95486 () Bool)

(assert (=> start!15212 e!95486))

(assert (=> start!15212 true))

(declare-fun e!95475 () Bool)

(assert (=> start!15212 e!95475))

(declare-fun b!146337 () Bool)

(declare-datatypes ((Unit!4622 0))(
  ( (Unit!4623) )
))
(declare-fun e!95478 () Unit!4622)

(declare-fun Unit!4624 () Unit!4622)

(assert (=> b!146337 (= e!95478 Unit!4624)))

(declare-fun b!146338 () Bool)

(declare-fun e!95479 () Bool)

(declare-fun e!95471 () Bool)

(assert (=> b!146338 (= e!95479 e!95471)))

(declare-fun tp_is_empty!2977 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1198)

(declare-fun e!95469 () Bool)

(declare-fun array_inv!1475 (array!4985) Bool)

(declare-fun array_inv!1476 (array!4987) Bool)

(assert (=> b!146339 (= e!95475 (and tp!11865 tp_is_empty!2977 (array_inv!1475 (_keys!4784 newMap!16)) (array_inv!1476 (_values!2998 newMap!16)) e!95469))))

(declare-fun b!146340 () Bool)

(declare-fun res!69627 () Bool)

(assert (=> b!146340 (=> (not res!69627) (not e!95481))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146340 (= res!69627 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2630 (_keys!4784 (v!3359 (underlying!503 thiss!992)))))))))

(declare-fun b!146341 () Bool)

(declare-fun e!95470 () Bool)

(declare-fun e!95476 () Bool)

(declare-fun mapRes!5003 () Bool)

(assert (=> b!146341 (= e!95470 (and e!95476 mapRes!5003))))

(declare-fun condMapEmpty!5004 () Bool)

(declare-fun mapDefault!5004 () ValueCell!1145)

(assert (=> b!146341 (= condMapEmpty!5004 (= (arr!2355 (_values!2998 (v!3359 (underlying!503 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1145)) mapDefault!5004)))))

(declare-fun b!146342 () Bool)

(declare-fun e!95485 () Bool)

(assert (=> b!146342 (= e!95485 tp_is_empty!2977)))

(declare-fun b!146343 () Bool)

(declare-fun e!95472 () Bool)

(declare-fun e!95484 () Bool)

(assert (=> b!146343 (= e!95472 (not e!95484))))

(declare-fun res!69628 () Bool)

(assert (=> b!146343 (=> res!69628 e!95484)))

(declare-datatypes ((tuple2!2690 0))(
  ( (tuple2!2691 (_1!1356 Bool) (_2!1356 LongMapFixedSize!1198)) )
))
(declare-fun lt!76961 () tuple2!2690)

(declare-datatypes ((tuple2!2692 0))(
  ( (tuple2!2693 (_1!1357 (_ BitVec 64)) (_2!1357 V!3617)) )
))
(declare-datatypes ((List!1758 0))(
  ( (Nil!1755) (Cons!1754 (h!2362 tuple2!2692) (t!6455 List!1758)) )
))
(declare-datatypes ((ListLongMap!1721 0))(
  ( (ListLongMap!1722 (toList!876 List!1758)) )
))
(declare-fun getCurrentListMap!546 (array!4985 array!4987 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 32) Int) ListLongMap!1721)

(declare-fun map!1460 (LongMapFixedSize!1198) ListLongMap!1721)

(assert (=> b!146343 (= res!69628 (not (= (getCurrentListMap!546 (_keys!4784 (v!3359 (underlying!503 thiss!992))) (_values!2998 (v!3359 (underlying!503 thiss!992))) (mask!7393 (v!3359 (underlying!503 thiss!992))) (extraKeys!2760 (v!3359 (underlying!503 thiss!992))) (zeroValue!2860 (v!3359 (underlying!503 thiss!992))) (minValue!2860 (v!3359 (underlying!503 thiss!992))) from!355 (defaultEntry!3015 (v!3359 (underlying!503 thiss!992)))) (map!1460 (_2!1356 lt!76961)))))))

(declare-fun lt!76969 () tuple2!2692)

(declare-fun lt!76967 () ListLongMap!1721)

(declare-fun lt!76963 () ListLongMap!1721)

(declare-fun lt!76955 () tuple2!2692)

(declare-fun +!181 (ListLongMap!1721 tuple2!2692) ListLongMap!1721)

(assert (=> b!146343 (= (+!181 lt!76967 lt!76969) (+!181 (+!181 lt!76963 lt!76969) lt!76955))))

(assert (=> b!146343 (= lt!76969 (tuple2!2693 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2860 (v!3359 (underlying!503 thiss!992)))))))

(declare-fun lt!76970 () V!3617)

(declare-fun lt!76960 () Unit!4622)

(declare-fun addCommutativeForDiffKeys!75 (ListLongMap!1721 (_ BitVec 64) V!3617 (_ BitVec 64) V!3617) Unit!4622)

(assert (=> b!146343 (= lt!76960 (addCommutativeForDiffKeys!75 lt!76963 (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) lt!76970 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2860 (v!3359 (underlying!503 thiss!992)))))))

(declare-fun lt!76971 () ListLongMap!1721)

(assert (=> b!146343 (= lt!76971 lt!76967)))

(assert (=> b!146343 (= lt!76967 (+!181 lt!76963 lt!76955))))

(declare-fun lt!76965 () ListLongMap!1721)

(declare-fun lt!76956 () tuple2!2692)

(assert (=> b!146343 (= lt!76971 (+!181 lt!76965 lt!76956))))

(declare-fun lt!76968 () ListLongMap!1721)

(assert (=> b!146343 (= lt!76963 (+!181 lt!76968 lt!76956))))

(assert (=> b!146343 (= lt!76956 (tuple2!2693 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2860 (v!3359 (underlying!503 thiss!992)))))))

(assert (=> b!146343 (= lt!76965 (+!181 lt!76968 lt!76955))))

(assert (=> b!146343 (= lt!76955 (tuple2!2693 (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) lt!76970))))

(declare-fun lt!76964 () Unit!4622)

(assert (=> b!146343 (= lt!76964 (addCommutativeForDiffKeys!75 lt!76968 (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) lt!76970 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2860 (v!3359 (underlying!503 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!149 (array!4985 array!4987 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 32) Int) ListLongMap!1721)

(assert (=> b!146343 (= lt!76968 (getCurrentListMapNoExtraKeys!149 (_keys!4784 (v!3359 (underlying!503 thiss!992))) (_values!2998 (v!3359 (underlying!503 thiss!992))) (mask!7393 (v!3359 (underlying!503 thiss!992))) (extraKeys!2760 (v!3359 (underlying!503 thiss!992))) (zeroValue!2860 (v!3359 (underlying!503 thiss!992))) (minValue!2860 (v!3359 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3359 (underlying!503 thiss!992)))))))

(declare-fun b!146344 () Bool)

(declare-fun e!95473 () Bool)

(assert (=> b!146344 (= e!95473 tp_is_empty!2977)))

(declare-fun mapNonEmpty!5003 () Bool)

(declare-fun tp!11867 () Bool)

(assert (=> mapNonEmpty!5003 (= mapRes!5003 (and tp!11867 e!95485))))

(declare-fun mapKey!5003 () (_ BitVec 32))

(declare-fun mapValue!5004 () ValueCell!1145)

(declare-fun mapRest!5004 () (Array (_ BitVec 32) ValueCell!1145))

(assert (=> mapNonEmpty!5003 (= (arr!2355 (_values!2998 (v!3359 (underlying!503 thiss!992)))) (store mapRest!5004 mapKey!5003 mapValue!5004))))

(declare-fun b!146345 () Bool)

(declare-fun Unit!4625 () Unit!4622)

(assert (=> b!146345 (= e!95478 Unit!4625)))

(declare-fun lt!76954 () Unit!4622)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!154 (array!4985 array!4987 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 64) (_ BitVec 32) Int) Unit!4622)

(assert (=> b!146345 (= lt!76954 (lemmaListMapContainsThenArrayContainsFrom!154 (_keys!4784 (v!3359 (underlying!503 thiss!992))) (_values!2998 (v!3359 (underlying!503 thiss!992))) (mask!7393 (v!3359 (underlying!503 thiss!992))) (extraKeys!2760 (v!3359 (underlying!503 thiss!992))) (zeroValue!2860 (v!3359 (underlying!503 thiss!992))) (minValue!2860 (v!3359 (underlying!503 thiss!992))) (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3359 (underlying!503 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146345 (arrayContainsKey!0 (_keys!4784 (v!3359 (underlying!503 thiss!992))) (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76962 () Unit!4622)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4985 (_ BitVec 32) (_ BitVec 32)) Unit!4622)

(assert (=> b!146345 (= lt!76962 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4784 (v!3359 (underlying!503 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1759 0))(
  ( (Nil!1756) (Cons!1755 (h!2363 (_ BitVec 64)) (t!6456 List!1759)) )
))
(declare-fun arrayNoDuplicates!0 (array!4985 (_ BitVec 32) List!1759) Bool)

(assert (=> b!146345 (arrayNoDuplicates!0 (_keys!4784 (v!3359 (underlying!503 thiss!992))) from!355 Nil!1756)))

(declare-fun lt!76958 () Unit!4622)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4985 (_ BitVec 32) (_ BitVec 64) List!1759) Unit!4622)

(assert (=> b!146345 (= lt!76958 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4784 (v!3359 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) (Cons!1755 (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) Nil!1756)))))

(assert (=> b!146345 false))

(declare-fun mapIsEmpty!5003 () Bool)

(declare-fun mapRes!5004 () Bool)

(assert (=> mapIsEmpty!5003 mapRes!5004))

(declare-fun b!146346 () Bool)

(assert (=> b!146346 (= e!95476 tp_is_empty!2977)))

(declare-fun b!146347 () Bool)

(declare-fun res!69625 () Bool)

(assert (=> b!146347 (=> (not res!69625) (not e!95481))))

(declare-fun valid!603 (LongMapFixedSize!1198) Bool)

(assert (=> b!146347 (= res!69625 (valid!603 newMap!16))))

(declare-fun b!146348 () Bool)

(assert (=> b!146348 (= e!95486 e!95479)))

(declare-fun b!146349 () Bool)

(declare-fun e!95483 () Bool)

(declare-fun e!95477 () Bool)

(assert (=> b!146349 (= e!95483 e!95477)))

(declare-fun res!69623 () Bool)

(assert (=> b!146349 (=> (not res!69623) (not e!95477))))

(assert (=> b!146349 (= res!69623 (and (not (= (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1579 (ValueCell!1145 V!3617) V!3617)

(declare-fun dynLambda!457 (Int (_ BitVec 64)) V!3617)

(assert (=> b!146349 (= lt!76970 (get!1579 (select (arr!2355 (_values!2998 (v!3359 (underlying!503 thiss!992)))) from!355) (dynLambda!457 (defaultEntry!3015 (v!3359 (underlying!503 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146350 () Bool)

(declare-fun e!95474 () Bool)

(assert (=> b!146350 (= e!95474 tp_is_empty!2977)))

(assert (=> b!146351 (= e!95471 (and tp!11868 tp_is_empty!2977 (array_inv!1475 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) (array_inv!1476 (_values!2998 (v!3359 (underlying!503 thiss!992)))) e!95470))))

(declare-fun b!146352 () Bool)

(assert (=> b!146352 (= e!95481 e!95483)))

(declare-fun res!69622 () Bool)

(assert (=> b!146352 (=> (not res!69622) (not e!95483))))

(declare-fun lt!76959 () ListLongMap!1721)

(declare-fun lt!76957 () ListLongMap!1721)

(assert (=> b!146352 (= res!69622 (= lt!76959 lt!76957))))

(assert (=> b!146352 (= lt!76957 (map!1460 newMap!16))))

(assert (=> b!146352 (= lt!76959 (getCurrentListMap!546 (_keys!4784 (v!3359 (underlying!503 thiss!992))) (_values!2998 (v!3359 (underlying!503 thiss!992))) (mask!7393 (v!3359 (underlying!503 thiss!992))) (extraKeys!2760 (v!3359 (underlying!503 thiss!992))) (zeroValue!2860 (v!3359 (underlying!503 thiss!992))) (minValue!2860 (v!3359 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3359 (underlying!503 thiss!992)))))))

(declare-fun mapNonEmpty!5004 () Bool)

(declare-fun tp!11866 () Bool)

(assert (=> mapNonEmpty!5004 (= mapRes!5004 (and tp!11866 e!95474))))

(declare-fun mapValue!5003 () ValueCell!1145)

(declare-fun mapKey!5004 () (_ BitVec 32))

(declare-fun mapRest!5003 () (Array (_ BitVec 32) ValueCell!1145))

(assert (=> mapNonEmpty!5004 (= (arr!2355 (_values!2998 newMap!16)) (store mapRest!5003 mapKey!5004 mapValue!5003))))

(declare-fun b!146353 () Bool)

(assert (=> b!146353 (= e!95477 e!95472)))

(declare-fun res!69621 () Bool)

(assert (=> b!146353 (=> (not res!69621) (not e!95472))))

(assert (=> b!146353 (= res!69621 (and (_1!1356 lt!76961) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!76966 () Unit!4622)

(assert (=> b!146353 (= lt!76966 e!95478)))

(declare-fun c!27630 () Bool)

(declare-fun contains!932 (ListLongMap!1721 (_ BitVec 64)) Bool)

(assert (=> b!146353 (= c!27630 (contains!932 lt!76957 (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355)))))

(declare-fun update!225 (LongMapFixedSize!1198 (_ BitVec 64) V!3617) tuple2!2690)

(assert (=> b!146353 (= lt!76961 (update!225 newMap!16 (select (arr!2354 (_keys!4784 (v!3359 (underlying!503 thiss!992)))) from!355) lt!76970))))

(declare-fun b!146354 () Bool)

(assert (=> b!146354 (= e!95469 (and e!95473 mapRes!5004))))

(declare-fun condMapEmpty!5003 () Bool)

(declare-fun mapDefault!5003 () ValueCell!1145)

(assert (=> b!146354 (= condMapEmpty!5003 (= (arr!2355 (_values!2998 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1145)) mapDefault!5003)))))

(declare-fun mapIsEmpty!5004 () Bool)

(assert (=> mapIsEmpty!5004 mapRes!5003))

(declare-fun b!146355 () Bool)

(assert (=> b!146355 (= e!95484 (bvslt (bvsub from!355 #b00000000000000000000000000000001) from!355))))

(declare-fun b!146356 () Bool)

(declare-fun res!69626 () Bool)

(assert (=> b!146356 (=> (not res!69626) (not e!95481))))

(assert (=> b!146356 (= res!69626 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7393 newMap!16)) (_size!648 (v!3359 (underlying!503 thiss!992)))))))

(assert (= (and start!15212 res!69624) b!146340))

(assert (= (and b!146340 res!69627) b!146347))

(assert (= (and b!146347 res!69625) b!146356))

(assert (= (and b!146356 res!69626) b!146352))

(assert (= (and b!146352 res!69622) b!146349))

(assert (= (and b!146349 res!69623) b!146353))

(assert (= (and b!146353 c!27630) b!146345))

(assert (= (and b!146353 (not c!27630)) b!146337))

(assert (= (and b!146353 res!69621) b!146343))

(assert (= (and b!146343 (not res!69628)) b!146355))

(assert (= (and b!146341 condMapEmpty!5004) mapIsEmpty!5004))

(assert (= (and b!146341 (not condMapEmpty!5004)) mapNonEmpty!5003))

(get-info :version)

(assert (= (and mapNonEmpty!5003 ((_ is ValueCellFull!1145) mapValue!5004)) b!146342))

(assert (= (and b!146341 ((_ is ValueCellFull!1145) mapDefault!5004)) b!146346))

(assert (= b!146351 b!146341))

(assert (= b!146338 b!146351))

(assert (= b!146348 b!146338))

(assert (= start!15212 b!146348))

(assert (= (and b!146354 condMapEmpty!5003) mapIsEmpty!5003))

(assert (= (and b!146354 (not condMapEmpty!5003)) mapNonEmpty!5004))

(assert (= (and mapNonEmpty!5004 ((_ is ValueCellFull!1145) mapValue!5003)) b!146350))

(assert (= (and b!146354 ((_ is ValueCellFull!1145) mapDefault!5003)) b!146344))

(assert (= b!146339 b!146354))

(assert (= start!15212 b!146339))

(declare-fun b_lambda!6563 () Bool)

(assert (=> (not b_lambda!6563) (not b!146349)))

(declare-fun t!6452 () Bool)

(declare-fun tb!2657 () Bool)

(assert (=> (and b!146351 (= (defaultEntry!3015 (v!3359 (underlying!503 thiss!992))) (defaultEntry!3015 (v!3359 (underlying!503 thiss!992)))) t!6452) tb!2657))

(declare-fun result!4345 () Bool)

(assert (=> tb!2657 (= result!4345 tp_is_empty!2977)))

(assert (=> b!146349 t!6452))

(declare-fun b_and!9165 () Bool)

(assert (= b_and!9161 (and (=> t!6452 result!4345) b_and!9165)))

(declare-fun t!6454 () Bool)

(declare-fun tb!2659 () Bool)

(assert (=> (and b!146339 (= (defaultEntry!3015 newMap!16) (defaultEntry!3015 (v!3359 (underlying!503 thiss!992)))) t!6454) tb!2659))

(declare-fun result!4349 () Bool)

(assert (= result!4349 result!4345))

(assert (=> b!146349 t!6454))

(declare-fun b_and!9167 () Bool)

(assert (= b_and!9163 (and (=> t!6454 result!4349) b_and!9167)))

(declare-fun m!176073 () Bool)

(assert (=> mapNonEmpty!5003 m!176073))

(declare-fun m!176075 () Bool)

(assert (=> b!146347 m!176075))

(declare-fun m!176077 () Bool)

(assert (=> b!146349 m!176077))

(declare-fun m!176079 () Bool)

(assert (=> b!146349 m!176079))

(declare-fun m!176081 () Bool)

(assert (=> b!146349 m!176081))

(assert (=> b!146349 m!176079))

(assert (=> b!146349 m!176081))

(declare-fun m!176083 () Bool)

(assert (=> b!146349 m!176083))

(declare-fun m!176085 () Bool)

(assert (=> b!146351 m!176085))

(declare-fun m!176087 () Bool)

(assert (=> b!146351 m!176087))

(declare-fun m!176089 () Bool)

(assert (=> b!146352 m!176089))

(declare-fun m!176091 () Bool)

(assert (=> b!146352 m!176091))

(declare-fun m!176093 () Bool)

(assert (=> b!146345 m!176093))

(declare-fun m!176095 () Bool)

(assert (=> b!146345 m!176095))

(assert (=> b!146345 m!176077))

(declare-fun m!176097 () Bool)

(assert (=> b!146345 m!176097))

(assert (=> b!146345 m!176077))

(assert (=> b!146345 m!176077))

(declare-fun m!176099 () Bool)

(assert (=> b!146345 m!176099))

(assert (=> b!146345 m!176077))

(declare-fun m!176101 () Bool)

(assert (=> b!146345 m!176101))

(declare-fun m!176103 () Bool)

(assert (=> mapNonEmpty!5004 m!176103))

(declare-fun m!176105 () Bool)

(assert (=> b!146339 m!176105))

(declare-fun m!176107 () Bool)

(assert (=> b!146339 m!176107))

(assert (=> b!146353 m!176077))

(assert (=> b!146353 m!176077))

(declare-fun m!176109 () Bool)

(assert (=> b!146353 m!176109))

(assert (=> b!146353 m!176077))

(declare-fun m!176111 () Bool)

(assert (=> b!146353 m!176111))

(declare-fun m!176113 () Bool)

(assert (=> start!15212 m!176113))

(declare-fun m!176115 () Bool)

(assert (=> b!146343 m!176115))

(declare-fun m!176117 () Bool)

(assert (=> b!146343 m!176117))

(assert (=> b!146343 m!176077))

(assert (=> b!146343 m!176077))

(declare-fun m!176119 () Bool)

(assert (=> b!146343 m!176119))

(declare-fun m!176121 () Bool)

(assert (=> b!146343 m!176121))

(declare-fun m!176123 () Bool)

(assert (=> b!146343 m!176123))

(declare-fun m!176125 () Bool)

(assert (=> b!146343 m!176125))

(declare-fun m!176127 () Bool)

(assert (=> b!146343 m!176127))

(declare-fun m!176129 () Bool)

(assert (=> b!146343 m!176129))

(declare-fun m!176131 () Bool)

(assert (=> b!146343 m!176131))

(assert (=> b!146343 m!176123))

(declare-fun m!176133 () Bool)

(assert (=> b!146343 m!176133))

(assert (=> b!146343 m!176077))

(declare-fun m!176135 () Bool)

(assert (=> b!146343 m!176135))

(declare-fun m!176137 () Bool)

(assert (=> b!146343 m!176137))

(check-sat (not b_lambda!6563) b_and!9165 (not b_next!3121) (not mapNonEmpty!5003) (not b!146352) (not b!146345) (not mapNonEmpty!5004) tp_is_empty!2977 (not b!146349) (not b!146339) (not start!15212) (not b!146347) (not b!146351) (not b_next!3123) (not b!146343) (not b!146353) b_and!9167)
(check-sat b_and!9165 b_and!9167 (not b_next!3121) (not b_next!3123))
