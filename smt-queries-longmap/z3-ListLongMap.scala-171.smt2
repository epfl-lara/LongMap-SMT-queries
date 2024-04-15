; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3264 () Bool)

(assert start!3264)

(declare-fun b!19982 () Bool)

(declare-fun b_free!703 () Bool)

(declare-fun b_next!703 () Bool)

(assert (=> b!19982 (= b_free!703 (not b_next!703))))

(declare-fun tp!3334 () Bool)

(declare-fun b_and!1369 () Bool)

(assert (=> b!19982 (= tp!3334 b_and!1369)))

(declare-fun b!19976 () Bool)

(declare-fun e!13005 () Bool)

(declare-fun tp_is_empty!967 () Bool)

(assert (=> b!19976 (= e!13005 tp_is_empty!967)))

(declare-fun b!19977 () Bool)

(declare-fun e!12999 () Bool)

(declare-fun mapRes!919 () Bool)

(assert (=> b!19977 (= e!12999 (and e!13005 mapRes!919))))

(declare-fun condMapEmpty!919 () Bool)

(declare-datatypes ((V!1115 0))(
  ( (V!1116 (val!510 Int)) )
))
(declare-datatypes ((ValueCell!284 0))(
  ( (ValueCellFull!284 (v!1536 V!1115)) (EmptyCell!284) )
))
(declare-datatypes ((array!1139 0))(
  ( (array!1140 (arr!542 (Array (_ BitVec 32) ValueCell!284)) (size!635 (_ BitVec 32))) )
))
(declare-datatypes ((array!1141 0))(
  ( (array!1142 (arr!543 (Array (_ BitVec 32) (_ BitVec 64))) (size!636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!154 0))(
  ( (LongMapFixedSize!155 (defaultEntry!1699 Int) (mask!4659 (_ BitVec 32)) (extraKeys!1606 (_ BitVec 32)) (zeroValue!1630 V!1115) (minValue!1630 V!1115) (_size!114 (_ BitVec 32)) (_keys!3124 array!1141) (_values!1692 array!1139) (_vacant!114 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!154 0))(
  ( (Cell!155 (v!1537 LongMapFixedSize!154)) )
))
(declare-datatypes ((LongMap!154 0))(
  ( (LongMap!155 (underlying!88 Cell!154)) )
))
(declare-fun thiss!938 () LongMap!154)

(declare-fun mapDefault!919 () ValueCell!284)

(assert (=> b!19977 (= condMapEmpty!919 (= (arr!542 (_values!1692 (v!1537 (underlying!88 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!284)) mapDefault!919)))))

(declare-fun b!19978 () Bool)

(declare-fun e!13000 () Bool)

(declare-fun e!13006 () Bool)

(assert (=> b!19978 (= e!13000 e!13006)))

(declare-fun b!19979 () Bool)

(declare-fun e!13001 () Bool)

(assert (=> b!19979 (= e!13006 e!13001)))

(declare-fun mapIsEmpty!919 () Bool)

(assert (=> mapIsEmpty!919 mapRes!919))

(declare-fun b!19980 () Bool)

(declare-fun e!13004 () Bool)

(declare-fun lt!5762 () LongMapFixedSize!154)

(declare-fun valid!85 (LongMapFixedSize!154) Bool)

(assert (=> b!19980 (= e!13004 (not (valid!85 lt!5762)))))

(declare-fun b!19981 () Bool)

(declare-fun e!13003 () Bool)

(assert (=> b!19981 (= e!13003 e!13004)))

(declare-fun res!13342 () Bool)

(assert (=> b!19981 (=> (not res!13342) (not e!13004))))

(assert (=> b!19981 (= res!13342 (and (= (bvand (extraKeys!1606 (v!1537 (underlying!88 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1606 (v!1537 (underlying!88 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!15 ((_ BitVec 32) Int) LongMapFixedSize!154)

(declare-fun computeNewMask!12 (LongMap!154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19981 (= lt!5762 (getNewLongMapFixedSize!15 (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) (defaultEntry!1699 (v!1537 (underlying!88 thiss!938)))))))

(declare-fun res!13343 () Bool)

(assert (=> start!3264 (=> (not res!13343) (not e!13003))))

(declare-fun valid!86 (LongMap!154) Bool)

(assert (=> start!3264 (= res!13343 (valid!86 thiss!938))))

(assert (=> start!3264 e!13003))

(assert (=> start!3264 e!13000))

(declare-fun b!19975 () Bool)

(declare-fun e!13002 () Bool)

(assert (=> b!19975 (= e!13002 tp_is_empty!967)))

(declare-fun mapNonEmpty!919 () Bool)

(declare-fun tp!3333 () Bool)

(assert (=> mapNonEmpty!919 (= mapRes!919 (and tp!3333 e!13002))))

(declare-fun mapRest!919 () (Array (_ BitVec 32) ValueCell!284))

(declare-fun mapKey!919 () (_ BitVec 32))

(declare-fun mapValue!919 () ValueCell!284)

(assert (=> mapNonEmpty!919 (= (arr!542 (_values!1692 (v!1537 (underlying!88 thiss!938)))) (store mapRest!919 mapKey!919 mapValue!919))))

(declare-fun array_inv!381 (array!1141) Bool)

(declare-fun array_inv!382 (array!1139) Bool)

(assert (=> b!19982 (= e!13001 (and tp!3334 tp_is_empty!967 (array_inv!381 (_keys!3124 (v!1537 (underlying!88 thiss!938)))) (array_inv!382 (_values!1692 (v!1537 (underlying!88 thiss!938)))) e!12999))))

(assert (= (and start!3264 res!13343) b!19981))

(assert (= (and b!19981 res!13342) b!19980))

(assert (= (and b!19977 condMapEmpty!919) mapIsEmpty!919))

(assert (= (and b!19977 (not condMapEmpty!919)) mapNonEmpty!919))

(get-info :version)

(assert (= (and mapNonEmpty!919 ((_ is ValueCellFull!284) mapValue!919)) b!19975))

(assert (= (and b!19977 ((_ is ValueCellFull!284) mapDefault!919)) b!19976))

(assert (= b!19982 b!19977))

(assert (= b!19979 b!19982))

(assert (= b!19978 b!19979))

(assert (= start!3264 b!19978))

(declare-fun m!14027 () Bool)

(assert (=> b!19982 m!14027))

(declare-fun m!14029 () Bool)

(assert (=> b!19982 m!14029))

(declare-fun m!14031 () Bool)

(assert (=> mapNonEmpty!919 m!14031))

(declare-fun m!14033 () Bool)

(assert (=> b!19980 m!14033))

(declare-fun m!14035 () Bool)

(assert (=> start!3264 m!14035))

(declare-fun m!14037 () Bool)

(assert (=> b!19981 m!14037))

(assert (=> b!19981 m!14037))

(declare-fun m!14039 () Bool)

(assert (=> b!19981 m!14039))

(check-sat (not start!3264) (not b!19981) (not mapNonEmpty!919) (not b!19980) (not b!19982) b_and!1369 (not b_next!703) tp_is_empty!967)
(check-sat b_and!1369 (not b_next!703))
(get-model)

(declare-fun d!3625 () Bool)

(assert (=> d!3625 (= (array_inv!381 (_keys!3124 (v!1537 (underlying!88 thiss!938)))) (bvsge (size!636 (_keys!3124 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19982 d!3625))

(declare-fun d!3627 () Bool)

(assert (=> d!3627 (= (array_inv!382 (_values!1692 (v!1537 (underlying!88 thiss!938)))) (bvsge (size!635 (_values!1692 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19982 d!3627))

(declare-fun b!20043 () Bool)

(declare-fun res!13361 () Bool)

(declare-fun e!13067 () Bool)

(assert (=> b!20043 (=> (not res!13361) (not e!13067))))

(declare-fun lt!5827 () LongMapFixedSize!154)

(assert (=> b!20043 (= res!13361 (= (mask!4659 lt!5827) (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938))))))))

(declare-fun b!20044 () Bool)

(declare-fun e!13069 () Bool)

(declare-datatypes ((tuple2!838 0))(
  ( (tuple2!839 (_1!422 (_ BitVec 64)) (_2!422 V!1115)) )
))
(declare-fun lt!5835 () tuple2!838)

(declare-fun lt!5815 () (_ BitVec 32))

(assert (=> b!20044 (= e!13069 (ite (= (_1!422 lt!5835) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5815 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5815 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!20045 () Bool)

(declare-datatypes ((List!549 0))(
  ( (Nil!546) (Cons!545 (h!1111 tuple2!838) (t!3193 List!549)) )
))
(declare-datatypes ((ListLongMap!547 0))(
  ( (ListLongMap!548 (toList!289 List!549)) )
))
(declare-fun map!381 (LongMapFixedSize!154) ListLongMap!547)

(assert (=> b!20045 (= e!13067 (= (map!381 lt!5827) (ListLongMap!548 Nil!546)))))

(declare-fun b!20046 () Bool)

(declare-fun lt!5819 () array!1141)

(declare-fun arrayContainsKey!0 (array!1141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!20046 (= e!13069 (arrayContainsKey!0 lt!5819 (_1!422 lt!5835) #b00000000000000000000000000000000))))

(declare-fun b!20047 () Bool)

(declare-datatypes ((Unit!419 0))(
  ( (Unit!420) )
))
(declare-fun e!13068 () Unit!419)

(declare-fun Unit!421 () Unit!419)

(assert (=> b!20047 (= e!13068 Unit!421)))

(declare-fun lt!5818 () LongMapFixedSize!154)

(declare-fun head!823 (List!549) tuple2!838)

(assert (=> b!20047 (= lt!5835 (head!823 (toList!289 (map!381 lt!5818))))))

(assert (=> b!20047 (= lt!5819 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!20047 (= lt!5815 #b00000000000000000000000000000000)))

(declare-fun lt!5836 () Unit!419)

(declare-fun lemmaKeyInListMapIsInArray!90 (array!1141 array!1139 (_ BitVec 32) (_ BitVec 32) V!1115 V!1115 (_ BitVec 64) Int) Unit!419)

(declare-fun dynLambda!136 (Int (_ BitVec 64)) V!1115)

(assert (=> b!20047 (= lt!5836 (lemmaKeyInListMapIsInArray!90 lt!5819 (array!1140 ((as const (Array (_ BitVec 32) ValueCell!284)) EmptyCell!284) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) lt!5815 (dynLambda!136 (defaultEntry!1699 (v!1537 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!136 (defaultEntry!1699 (v!1537 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!422 lt!5835) (defaultEntry!1699 (v!1537 (underlying!88 thiss!938)))))))

(declare-fun c!2140 () Bool)

(assert (=> b!20047 (= c!2140 (and (not (= (_1!422 lt!5835) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!422 lt!5835) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20047 e!13069))

(declare-fun lt!5823 () Unit!419)

(assert (=> b!20047 (= lt!5823 lt!5836)))

(declare-fun lt!5820 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1141 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20047 (= lt!5820 (arrayScanForKey!0 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) (_1!422 lt!5835) #b00000000000000000000000000000000))))

(assert (=> b!20047 false))

(declare-fun b!20048 () Bool)

(declare-fun Unit!422 () Unit!419)

(assert (=> b!20048 (= e!13068 Unit!422)))

(declare-fun d!3629 () Bool)

(assert (=> d!3629 e!13067))

(declare-fun res!13360 () Bool)

(assert (=> d!3629 (=> (not res!13360) (not e!13067))))

(assert (=> d!3629 (= res!13360 (valid!85 lt!5827))))

(assert (=> d!3629 (= lt!5827 lt!5818)))

(declare-fun lt!5832 () Unit!419)

(assert (=> d!3629 (= lt!5832 e!13068)))

(declare-fun c!2139 () Bool)

(assert (=> d!3629 (= c!2139 (not (= (map!381 lt!5818) (ListLongMap!548 Nil!546))))))

(declare-fun lt!5817 () Unit!419)

(declare-fun lt!5821 () Unit!419)

(assert (=> d!3629 (= lt!5817 lt!5821)))

(declare-fun lt!5830 () array!1141)

(declare-fun lt!5824 () (_ BitVec 32))

(declare-datatypes ((List!550 0))(
  ( (Nil!547) (Cons!546 (h!1112 (_ BitVec 64)) (t!3194 List!550)) )
))
(declare-fun lt!5829 () List!550)

(declare-fun arrayNoDuplicates!0 (array!1141 (_ BitVec 32) List!550) Bool)

(assert (=> d!3629 (arrayNoDuplicates!0 lt!5830 lt!5824 lt!5829)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1141 (_ BitVec 32) (_ BitVec 32) List!550) Unit!419)

(assert (=> d!3629 (= lt!5821 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5830 lt!5824 (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001) lt!5829))))

(assert (=> d!3629 (= lt!5829 Nil!547)))

(assert (=> d!3629 (= lt!5824 #b00000000000000000000000000000000)))

(assert (=> d!3629 (= lt!5830 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5828 () Unit!419)

(declare-fun lt!5831 () Unit!419)

(assert (=> d!3629 (= lt!5828 lt!5831)))

(declare-fun lt!5837 () (_ BitVec 32))

(declare-fun lt!5822 () array!1141)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1141 (_ BitVec 32)) Bool)

(assert (=> d!3629 (arrayForallSeekEntryOrOpenFound!0 lt!5837 lt!5822 (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1141 (_ BitVec 32) (_ BitVec 32)) Unit!419)

(assert (=> d!3629 (= lt!5831 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5822 (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) lt!5837))))

(assert (=> d!3629 (= lt!5837 #b00000000000000000000000000000000)))

(assert (=> d!3629 (= lt!5822 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5825 () Unit!419)

(declare-fun lt!5834 () Unit!419)

(assert (=> d!3629 (= lt!5825 lt!5834)))

(declare-fun lt!5826 () array!1141)

(declare-fun lt!5816 () (_ BitVec 32))

(declare-fun lt!5833 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1141 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3629 (= (arrayCountValidKeys!0 lt!5826 lt!5816 lt!5833) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1141 (_ BitVec 32) (_ BitVec 32)) Unit!419)

(assert (=> d!3629 (= lt!5834 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5826 lt!5816 lt!5833))))

(assert (=> d!3629 (= lt!5833 (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3629 (= lt!5816 #b00000000000000000000000000000000)))

(assert (=> d!3629 (= lt!5826 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3629 (= lt!5818 (LongMapFixedSize!155 (defaultEntry!1699 (v!1537 (underlying!88 thiss!938))) (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!136 (defaultEntry!1699 (v!1537 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!136 (defaultEntry!1699 (v!1537 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) (array!1140 ((as const (Array (_ BitVec 32) ValueCell!284)) EmptyCell!284) (bvadd (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3629 (validMask!0 (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))))))

(assert (=> d!3629 (= (getNewLongMapFixedSize!15 (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) (defaultEntry!1699 (v!1537 (underlying!88 thiss!938)))) lt!5827)))

(assert (= (and d!3629 c!2139) b!20047))

(assert (= (and d!3629 (not c!2139)) b!20048))

(assert (= (and b!20047 c!2140) b!20046))

(assert (= (and b!20047 (not c!2140)) b!20044))

(assert (= (and d!3629 res!13360) b!20043))

(assert (= (and b!20043 res!13361) b!20045))

(declare-fun b_lambda!1477 () Bool)

(assert (=> (not b_lambda!1477) (not b!20047)))

(declare-fun t!3192 () Bool)

(declare-fun tb!631 () Bool)

(assert (=> (and b!19982 (= (defaultEntry!1699 (v!1537 (underlying!88 thiss!938))) (defaultEntry!1699 (v!1537 (underlying!88 thiss!938)))) t!3192) tb!631))

(declare-fun result!1039 () Bool)

(assert (=> tb!631 (= result!1039 tp_is_empty!967)))

(assert (=> b!20047 t!3192))

(declare-fun b_and!1375 () Bool)

(assert (= b_and!1369 (and (=> t!3192 result!1039) b_and!1375)))

(declare-fun b_lambda!1479 () Bool)

(assert (=> (not b_lambda!1479) (not d!3629)))

(assert (=> d!3629 t!3192))

(declare-fun b_and!1377 () Bool)

(assert (= b_and!1375 (and (=> t!3192 result!1039) b_and!1377)))

(declare-fun m!14069 () Bool)

(assert (=> b!20045 m!14069))

(declare-fun m!14071 () Bool)

(assert (=> b!20046 m!14071))

(declare-fun m!14073 () Bool)

(assert (=> b!20047 m!14073))

(declare-fun m!14075 () Bool)

(assert (=> b!20047 m!14075))

(declare-fun m!14077 () Bool)

(assert (=> b!20047 m!14077))

(assert (=> b!20047 m!14037))

(assert (=> b!20047 m!14073))

(assert (=> b!20047 m!14073))

(declare-fun m!14079 () Bool)

(assert (=> b!20047 m!14079))

(declare-fun m!14081 () Bool)

(assert (=> b!20047 m!14081))

(declare-fun m!14083 () Bool)

(assert (=> d!3629 m!14083))

(declare-fun m!14085 () Bool)

(assert (=> d!3629 m!14085))

(declare-fun m!14087 () Bool)

(assert (=> d!3629 m!14087))

(assert (=> d!3629 m!14037))

(declare-fun m!14089 () Bool)

(assert (=> d!3629 m!14089))

(declare-fun m!14091 () Bool)

(assert (=> d!3629 m!14091))

(declare-fun m!14093 () Bool)

(assert (=> d!3629 m!14093))

(assert (=> d!3629 m!14073))

(assert (=> d!3629 m!14075))

(assert (=> d!3629 m!14037))

(declare-fun m!14095 () Bool)

(assert (=> d!3629 m!14095))

(assert (=> d!3629 m!14037))

(declare-fun m!14097 () Bool)

(assert (=> d!3629 m!14097))

(assert (=> b!19981 d!3629))

(declare-fun d!3631 () Bool)

(declare-fun e!13075 () Bool)

(assert (=> d!3631 e!13075))

(declare-fun res!13364 () Bool)

(assert (=> d!3631 (=> (not res!13364) (not e!13075))))

(declare-fun lt!5843 () (_ BitVec 32))

(assert (=> d!3631 (= res!13364 (validMask!0 lt!5843))))

(declare-datatypes ((tuple2!840 0))(
  ( (tuple2!841 (_1!423 Unit!419) (_2!423 (_ BitVec 32))) )
))
(declare-fun e!13074 () tuple2!840)

(assert (=> d!3631 (= lt!5843 (_2!423 e!13074))))

(declare-fun c!2143 () Bool)

(declare-fun lt!5842 () tuple2!840)

(assert (=> d!3631 (= c!2143 (and (bvsgt (_2!423 lt!5842) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!114 (v!1537 (underlying!88 thiss!938)))) (_2!423 lt!5842)) (bvsge (bvadd (bvand (bvashr (_2!423 lt!5842) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!114 (v!1537 (underlying!88 thiss!938))))))))

(declare-fun Unit!423 () Unit!419)

(declare-fun Unit!424 () Unit!419)

(assert (=> d!3631 (= lt!5842 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!114 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))))) (mask!4659 (v!1537 (underlying!88 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!114 (v!1537 (underlying!88 thiss!938)))) (mask!4659 (v!1537 (underlying!88 thiss!938))))) (tuple2!841 Unit!423 (bvand (bvadd (bvshl (mask!4659 (v!1537 (underlying!88 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!841 Unit!424 (mask!4659 (v!1537 (underlying!88 thiss!938))))))))

(assert (=> d!3631 (validMask!0 (mask!4659 (v!1537 (underlying!88 thiss!938))))))

(assert (=> d!3631 (= (computeNewMask!12 thiss!938 (mask!4659 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (_size!114 (v!1537 (underlying!88 thiss!938)))) lt!5843)))

(declare-fun b!20057 () Bool)

(declare-fun computeNewMaskWhile!7 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!840)

(assert (=> b!20057 (= e!13074 (computeNewMaskWhile!7 (_size!114 (v!1537 (underlying!88 thiss!938))) (_vacant!114 (v!1537 (underlying!88 thiss!938))) (mask!4659 (v!1537 (underlying!88 thiss!938))) (_2!423 lt!5842)))))

(declare-fun b!20058 () Bool)

(declare-fun Unit!425 () Unit!419)

(assert (=> b!20058 (= e!13074 (tuple2!841 Unit!425 (_2!423 lt!5842)))))

(declare-fun b!20059 () Bool)

(assert (=> b!20059 (= e!13075 (bvsle (_size!114 (v!1537 (underlying!88 thiss!938))) (bvadd lt!5843 #b00000000000000000000000000000001)))))

(assert (= (and d!3631 c!2143) b!20057))

(assert (= (and d!3631 (not c!2143)) b!20058))

(assert (= (and d!3631 res!13364) b!20059))

(declare-fun m!14099 () Bool)

(assert (=> d!3631 m!14099))

(declare-fun m!14101 () Bool)

(assert (=> d!3631 m!14101))

(declare-fun m!14103 () Bool)

(assert (=> b!20057 m!14103))

(assert (=> b!19981 d!3631))

(declare-fun d!3633 () Bool)

(assert (=> d!3633 (= (valid!86 thiss!938) (valid!85 (v!1537 (underlying!88 thiss!938))))))

(declare-fun bs!888 () Bool)

(assert (= bs!888 d!3633))

(declare-fun m!14105 () Bool)

(assert (=> bs!888 m!14105))

(assert (=> start!3264 d!3633))

(declare-fun d!3635 () Bool)

(declare-fun res!13371 () Bool)

(declare-fun e!13078 () Bool)

(assert (=> d!3635 (=> (not res!13371) (not e!13078))))

(declare-fun simpleValid!16 (LongMapFixedSize!154) Bool)

(assert (=> d!3635 (= res!13371 (simpleValid!16 lt!5762))))

(assert (=> d!3635 (= (valid!85 lt!5762) e!13078)))

(declare-fun b!20066 () Bool)

(declare-fun res!13372 () Bool)

(assert (=> b!20066 (=> (not res!13372) (not e!13078))))

(assert (=> b!20066 (= res!13372 (= (arrayCountValidKeys!0 (_keys!3124 lt!5762) #b00000000000000000000000000000000 (size!636 (_keys!3124 lt!5762))) (_size!114 lt!5762)))))

(declare-fun b!20067 () Bool)

(declare-fun res!13373 () Bool)

(assert (=> b!20067 (=> (not res!13373) (not e!13078))))

(assert (=> b!20067 (= res!13373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3124 lt!5762) (mask!4659 lt!5762)))))

(declare-fun b!20068 () Bool)

(assert (=> b!20068 (= e!13078 (arrayNoDuplicates!0 (_keys!3124 lt!5762) #b00000000000000000000000000000000 Nil!547))))

(assert (= (and d!3635 res!13371) b!20066))

(assert (= (and b!20066 res!13372) b!20067))

(assert (= (and b!20067 res!13373) b!20068))

(declare-fun m!14107 () Bool)

(assert (=> d!3635 m!14107))

(declare-fun m!14109 () Bool)

(assert (=> b!20066 m!14109))

(declare-fun m!14111 () Bool)

(assert (=> b!20067 m!14111))

(declare-fun m!14113 () Bool)

(assert (=> b!20068 m!14113))

(assert (=> b!19980 d!3635))

(declare-fun mapIsEmpty!928 () Bool)

(declare-fun mapRes!928 () Bool)

(assert (=> mapIsEmpty!928 mapRes!928))

(declare-fun b!20076 () Bool)

(declare-fun e!13083 () Bool)

(assert (=> b!20076 (= e!13083 tp_is_empty!967)))

(declare-fun mapNonEmpty!928 () Bool)

(declare-fun tp!3349 () Bool)

(declare-fun e!13084 () Bool)

(assert (=> mapNonEmpty!928 (= mapRes!928 (and tp!3349 e!13084))))

(declare-fun mapRest!928 () (Array (_ BitVec 32) ValueCell!284))

(declare-fun mapValue!928 () ValueCell!284)

(declare-fun mapKey!928 () (_ BitVec 32))

(assert (=> mapNonEmpty!928 (= mapRest!919 (store mapRest!928 mapKey!928 mapValue!928))))

(declare-fun b!20075 () Bool)

(assert (=> b!20075 (= e!13084 tp_is_empty!967)))

(declare-fun condMapEmpty!928 () Bool)

(declare-fun mapDefault!928 () ValueCell!284)

(assert (=> mapNonEmpty!919 (= condMapEmpty!928 (= mapRest!919 ((as const (Array (_ BitVec 32) ValueCell!284)) mapDefault!928)))))

(assert (=> mapNonEmpty!919 (= tp!3333 (and e!13083 mapRes!928))))

(assert (= (and mapNonEmpty!919 condMapEmpty!928) mapIsEmpty!928))

(assert (= (and mapNonEmpty!919 (not condMapEmpty!928)) mapNonEmpty!928))

(assert (= (and mapNonEmpty!928 ((_ is ValueCellFull!284) mapValue!928)) b!20075))

(assert (= (and mapNonEmpty!919 ((_ is ValueCellFull!284) mapDefault!928)) b!20076))

(declare-fun m!14115 () Bool)

(assert (=> mapNonEmpty!928 m!14115))

(declare-fun b_lambda!1481 () Bool)

(assert (= b_lambda!1477 (or (and b!19982 b_free!703) b_lambda!1481)))

(declare-fun b_lambda!1483 () Bool)

(assert (= b_lambda!1479 (or (and b!19982 b_free!703) b_lambda!1483)))

(check-sat b_and!1377 (not b!20068) (not b!20057) (not d!3629) (not d!3635) (not mapNonEmpty!928) (not d!3631) (not b!20047) (not b!20067) (not b!20066) (not d!3633) (not b!20046) (not b_lambda!1483) (not b!20045) (not b_lambda!1481) (not b_next!703) tp_is_empty!967)
(check-sat b_and!1377 (not b_next!703))
