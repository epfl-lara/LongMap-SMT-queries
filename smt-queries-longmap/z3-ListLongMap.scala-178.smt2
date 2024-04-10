; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3468 () Bool)

(assert start!3468)

(declare-fun b!22692 () Bool)

(declare-fun b_free!747 () Bool)

(declare-fun b_next!747 () Bool)

(assert (=> b!22692 (= b_free!747 (not b_next!747))))

(declare-fun tp!3485 () Bool)

(declare-fun b_and!1465 () Bool)

(assert (=> b!22692 (= tp!3485 b_and!1465)))

(declare-fun res!14229 () Bool)

(declare-fun e!14725 () Bool)

(assert (=> start!3468 (=> (not res!14229) (not e!14725))))

(declare-datatypes ((V!1173 0))(
  ( (V!1174 (val!532 Int)) )
))
(declare-datatypes ((ValueCell!306 0))(
  ( (ValueCellFull!306 (v!1590 V!1173)) (EmptyCell!306) )
))
(declare-datatypes ((array!1257 0))(
  ( (array!1258 (arr!595 (Array (_ BitVec 32) ValueCell!306)) (size!691 (_ BitVec 32))) )
))
(declare-datatypes ((array!1259 0))(
  ( (array!1260 (arr!596 (Array (_ BitVec 32) (_ BitVec 64))) (size!692 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!198 0))(
  ( (LongMapFixedSize!199 (defaultEntry!1736 Int) (mask!4718 (_ BitVec 32)) (extraKeys!1635 (_ BitVec 32)) (zeroValue!1660 V!1173) (minValue!1660 V!1173) (_size!143 (_ BitVec 32)) (_keys!3158 array!1259) (_values!1723 array!1257) (_vacant!143 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!198 0))(
  ( (Cell!199 (v!1591 LongMapFixedSize!198)) )
))
(declare-datatypes ((LongMap!198 0))(
  ( (LongMap!199 (underlying!110 Cell!198)) )
))
(declare-fun thiss!938 () LongMap!198)

(declare-fun valid!98 (LongMap!198) Bool)

(assert (=> start!3468 (= res!14229 (valid!98 thiss!938))))

(assert (=> start!3468 e!14725))

(declare-fun e!14730 () Bool)

(assert (=> start!3468 e!14730))

(declare-fun mapNonEmpty!1004 () Bool)

(declare-fun mapRes!1004 () Bool)

(declare-fun tp!3484 () Bool)

(declare-fun e!14733 () Bool)

(assert (=> mapNonEmpty!1004 (= mapRes!1004 (and tp!3484 e!14733))))

(declare-fun mapValue!1004 () ValueCell!306)

(declare-fun mapRest!1004 () (Array (_ BitVec 32) ValueCell!306))

(declare-fun mapKey!1004 () (_ BitVec 32))

(assert (=> mapNonEmpty!1004 (= (arr!595 (_values!1723 (v!1591 (underlying!110 thiss!938)))) (store mapRest!1004 mapKey!1004 mapValue!1004))))

(declare-fun b!22678 () Bool)

(declare-fun tp_is_empty!1011 () Bool)

(assert (=> b!22678 (= e!14733 tp_is_empty!1011)))

(declare-fun b!22679 () Bool)

(declare-datatypes ((tuple2!930 0))(
  ( (tuple2!931 (_1!472 Bool) (_2!472 LongMapFixedSize!198)) )
))
(declare-fun lt!7853 () tuple2!930)

(declare-fun call!1723 () tuple2!930)

(assert (=> b!22679 (= lt!7853 call!1723)))

(declare-datatypes ((tuple2!932 0))(
  ( (tuple2!933 (_1!473 Bool) (_2!473 Cell!198)) )
))
(declare-fun e!14727 () tuple2!932)

(assert (=> b!22679 (= e!14727 (tuple2!933 (_1!472 lt!7853) (Cell!199 (_2!472 lt!7853))))))

(declare-fun b!22680 () Bool)

(declare-fun e!14734 () Bool)

(declare-fun e!14732 () Bool)

(assert (=> b!22680 (= e!14734 e!14732)))

(declare-fun mapIsEmpty!1004 () Bool)

(assert (=> mapIsEmpty!1004 mapRes!1004))

(declare-fun b!22681 () Bool)

(declare-fun e!14726 () tuple2!932)

(declare-fun lt!7854 () tuple2!930)

(declare-fun lt!7858 () tuple2!930)

(assert (=> b!22681 (= e!14726 (tuple2!933 (and (_1!472 lt!7854) (_1!472 lt!7858)) (Cell!199 (_2!472 lt!7858))))))

(declare-fun call!1724 () tuple2!930)

(assert (=> b!22681 (= lt!7854 call!1724)))

(declare-fun update!28 (LongMapFixedSize!198 (_ BitVec 64) V!1173) tuple2!930)

(assert (=> b!22681 (= lt!7858 (update!28 (_2!472 lt!7854) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1660 (v!1591 (underlying!110 thiss!938)))))))

(declare-fun b!22682 () Bool)

(declare-fun e!14723 () tuple2!932)

(declare-fun lt!7852 () tuple2!930)

(assert (=> b!22682 (= e!14723 (tuple2!933 (_1!472 lt!7852) (Cell!199 (_2!472 lt!7852))))))

(assert (=> b!22682 (= lt!7852 call!1723)))

(declare-fun b!22683 () Bool)

(declare-fun lt!7860 () LongMapFixedSize!198)

(assert (=> b!22683 (= e!14723 (tuple2!933 true (Cell!199 lt!7860)))))

(declare-fun bm!1720 () Bool)

(assert (=> bm!1720 (= call!1723 call!1724)))

(declare-fun b!22684 () Bool)

(declare-fun e!14731 () Bool)

(assert (=> b!22684 (= e!14731 tp_is_empty!1011)))

(declare-fun b!22685 () Bool)

(assert (=> b!22685 (= e!14726 e!14727)))

(declare-fun c!2815 () Bool)

(declare-fun lt!7855 () Bool)

(assert (=> b!22685 (= c!2815 (and (not lt!7855) (= (bvand (extraKeys!1635 (v!1591 (underlying!110 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22686 () Bool)

(declare-datatypes ((tuple3!14 0))(
  ( (tuple3!15 (_1!474 Bool) (_2!474 Cell!198) (_3!7 LongMap!198)) )
))
(declare-fun e!14729 () tuple3!14)

(declare-fun lt!7857 () tuple2!932)

(assert (=> b!22686 (= e!14729 (tuple3!15 false (_2!473 lt!7857) thiss!938))))

(declare-fun b!22687 () Bool)

(declare-fun e!14724 () Bool)

(assert (=> b!22687 (= e!14724 (and e!14731 mapRes!1004))))

(declare-fun condMapEmpty!1004 () Bool)

(declare-fun mapDefault!1004 () ValueCell!306)

(assert (=> b!22687 (= condMapEmpty!1004 (= (arr!595 (_values!1723 (v!1591 (underlying!110 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!306)) mapDefault!1004)))))

(declare-fun c!2814 () Bool)

(declare-fun bm!1721 () Bool)

(assert (=> bm!1721 (= call!1724 (update!28 lt!7860 (ite (or c!2814 c!2815) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2814 c!2815) (zeroValue!1660 (v!1591 (underlying!110 thiss!938))) (minValue!1660 (v!1591 (underlying!110 thiss!938))))))))

(declare-fun b!22688 () Bool)

(assert (=> b!22688 (= e!14730 e!14734)))

(declare-fun lt!7856 () tuple2!930)

(declare-fun lt!7859 () Cell!198)

(declare-fun b!22689 () Bool)

(assert (=> b!22689 (= e!14729 (ite (_1!472 lt!7856) (tuple3!15 true (underlying!110 thiss!938) (LongMap!199 lt!7859)) (tuple3!15 false lt!7859 thiss!938)))))

(declare-fun repackFrom!7 (LongMap!198 LongMapFixedSize!198 (_ BitVec 32)) tuple2!930)

(assert (=> b!22689 (= lt!7856 (repackFrom!7 thiss!938 (v!1591 (_2!473 lt!7857)) (bvsub (size!692 (_keys!3158 (v!1591 (underlying!110 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22689 (= lt!7859 (Cell!199 (_2!472 lt!7856)))))

(declare-fun b!22690 () Bool)

(assert (=> b!22690 (= e!14725 false)))

(declare-fun lt!7851 () tuple3!14)

(assert (=> b!22690 (= lt!7851 e!14729)))

(declare-fun c!2813 () Bool)

(assert (=> b!22690 (= c!2813 (not (_1!473 lt!7857)))))

(assert (=> b!22690 (= lt!7857 e!14726)))

(assert (=> b!22690 (= c!2814 (and (not lt!7855) (not (= (bvand (extraKeys!1635 (v!1591 (underlying!110 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22690 (= lt!7855 (= (bvand (extraKeys!1635 (v!1591 (underlying!110 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!29 ((_ BitVec 32) Int) LongMapFixedSize!198)

(declare-fun computeNewMask!25 (LongMap!198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22690 (= lt!7860 (getNewLongMapFixedSize!29 (computeNewMask!25 thiss!938 (mask!4718 (v!1591 (underlying!110 thiss!938))) (_vacant!143 (v!1591 (underlying!110 thiss!938))) (_size!143 (v!1591 (underlying!110 thiss!938)))) (defaultEntry!1736 (v!1591 (underlying!110 thiss!938)))))))

(declare-fun b!22691 () Bool)

(declare-fun c!2816 () Bool)

(assert (=> b!22691 (= c!2816 (and (not (= (bvand (extraKeys!1635 (v!1591 (underlying!110 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7855))))

(assert (=> b!22691 (= e!14727 e!14723)))

(declare-fun array_inv!401 (array!1259) Bool)

(declare-fun array_inv!402 (array!1257) Bool)

(assert (=> b!22692 (= e!14732 (and tp!3485 tp_is_empty!1011 (array_inv!401 (_keys!3158 (v!1591 (underlying!110 thiss!938)))) (array_inv!402 (_values!1723 (v!1591 (underlying!110 thiss!938)))) e!14724))))

(assert (= (and start!3468 res!14229) b!22690))

(assert (= (and b!22690 c!2814) b!22681))

(assert (= (and b!22690 (not c!2814)) b!22685))

(assert (= (and b!22685 c!2815) b!22679))

(assert (= (and b!22685 (not c!2815)) b!22691))

(assert (= (and b!22691 c!2816) b!22682))

(assert (= (and b!22691 (not c!2816)) b!22683))

(assert (= (or b!22679 b!22682) bm!1720))

(assert (= (or b!22681 bm!1720) bm!1721))

(assert (= (and b!22690 c!2813) b!22686))

(assert (= (and b!22690 (not c!2813)) b!22689))

(assert (= (and b!22687 condMapEmpty!1004) mapIsEmpty!1004))

(assert (= (and b!22687 (not condMapEmpty!1004)) mapNonEmpty!1004))

(get-info :version)

(assert (= (and mapNonEmpty!1004 ((_ is ValueCellFull!306) mapValue!1004)) b!22678))

(assert (= (and b!22687 ((_ is ValueCellFull!306) mapDefault!1004)) b!22684))

(assert (= b!22692 b!22687))

(assert (= b!22680 b!22692))

(assert (= b!22688 b!22680))

(assert (= start!3468 b!22688))

(declare-fun m!16476 () Bool)

(assert (=> bm!1721 m!16476))

(declare-fun m!16478 () Bool)

(assert (=> b!22689 m!16478))

(declare-fun m!16480 () Bool)

(assert (=> b!22681 m!16480))

(declare-fun m!16482 () Bool)

(assert (=> b!22692 m!16482))

(declare-fun m!16484 () Bool)

(assert (=> b!22692 m!16484))

(declare-fun m!16486 () Bool)

(assert (=> b!22690 m!16486))

(assert (=> b!22690 m!16486))

(declare-fun m!16488 () Bool)

(assert (=> b!22690 m!16488))

(declare-fun m!16490 () Bool)

(assert (=> mapNonEmpty!1004 m!16490))

(declare-fun m!16492 () Bool)

(assert (=> start!3468 m!16492))

(check-sat (not b_next!747) (not mapNonEmpty!1004) (not b!22689) (not start!3468) tp_is_empty!1011 (not b!22681) (not b!22692) b_and!1465 (not bm!1721) (not b!22690))
(check-sat b_and!1465 (not b_next!747))
