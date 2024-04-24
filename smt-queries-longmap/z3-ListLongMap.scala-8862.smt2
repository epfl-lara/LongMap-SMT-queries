; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107768 () Bool)

(assert start!107768)

(declare-fun b!1274667 () Bool)

(declare-fun b_free!27715 () Bool)

(declare-fun b_next!27715 () Bool)

(assert (=> b!1274667 (= b_free!27715 (not b_next!27715))))

(declare-fun tp!97688 () Bool)

(declare-fun b_and!45773 () Bool)

(assert (=> b!1274667 (= tp!97688 b_and!45773)))

(declare-fun e!727315 () Bool)

(declare-fun e!727319 () Bool)

(declare-fun tp_is_empty!33085 () Bool)

(declare-datatypes ((V!49307 0))(
  ( (V!49308 (val!16617 Int)) )
))
(declare-datatypes ((ValueCell!15689 0))(
  ( (ValueCellFull!15689 (v!19249 V!49307)) (EmptyCell!15689) )
))
(declare-datatypes ((array!83457 0))(
  ( (array!83458 (arr!40250 (Array (_ BitVec 32) ValueCell!15689)) (size!40792 (_ BitVec 32))) )
))
(declare-datatypes ((array!83459 0))(
  ( (array!83460 (arr!40251 (Array (_ BitVec 32) (_ BitVec 64))) (size!40793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6142 0))(
  ( (LongMapFixedSize!6143 (defaultEntry!6717 Int) (mask!34556 (_ BitVec 32)) (extraKeys!6396 (_ BitVec 32)) (zeroValue!6502 V!49307) (minValue!6502 V!49307) (_size!3126 (_ BitVec 32)) (_keys!12169 array!83459) (_values!6740 array!83457) (_vacant!3126 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6142)

(declare-fun array_inv!30779 (array!83459) Bool)

(declare-fun array_inv!30780 (array!83457) Bool)

(assert (=> b!1274667 (= e!727315 (and tp!97688 tp_is_empty!33085 (array_inv!30779 (_keys!12169 thiss!1551)) (array_inv!30780 (_values!6740 thiss!1551)) e!727319))))

(declare-fun b!1274668 () Bool)

(declare-fun e!727317 () Bool)

(declare-fun mapRes!51246 () Bool)

(assert (=> b!1274668 (= e!727319 (and e!727317 mapRes!51246))))

(declare-fun condMapEmpty!51246 () Bool)

(declare-fun mapDefault!51246 () ValueCell!15689)

(assert (=> b!1274668 (= condMapEmpty!51246 (= (arr!40250 (_values!6740 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15689)) mapDefault!51246)))))

(declare-fun res!847342 () Bool)

(declare-fun e!727318 () Bool)

(assert (=> start!107768 (=> (not res!847342) (not e!727318))))

(declare-fun simpleValid!464 (LongMapFixedSize!6142) Bool)

(assert (=> start!107768 (= res!847342 (simpleValid!464 thiss!1551))))

(assert (=> start!107768 e!727318))

(assert (=> start!107768 e!727315))

(declare-fun mapIsEmpty!51246 () Bool)

(assert (=> mapIsEmpty!51246 mapRes!51246))

(declare-fun b!1274669 () Bool)

(assert (=> b!1274669 (= e!727318 (bvsgt #b00000000000000000000000000000000 (size!40793 (_keys!12169 thiss!1551))))))

(declare-fun b!1274670 () Bool)

(declare-fun e!727320 () Bool)

(assert (=> b!1274670 (= e!727320 tp_is_empty!33085)))

(declare-fun mapNonEmpty!51246 () Bool)

(declare-fun tp!97689 () Bool)

(assert (=> mapNonEmpty!51246 (= mapRes!51246 (and tp!97689 e!727320))))

(declare-fun mapKey!51246 () (_ BitVec 32))

(declare-fun mapRest!51246 () (Array (_ BitVec 32) ValueCell!15689))

(declare-fun mapValue!51246 () ValueCell!15689)

(assert (=> mapNonEmpty!51246 (= (arr!40250 (_values!6740 thiss!1551)) (store mapRest!51246 mapKey!51246 mapValue!51246))))

(declare-fun b!1274671 () Bool)

(assert (=> b!1274671 (= e!727317 tp_is_empty!33085)))

(assert (= (and start!107768 res!847342) b!1274669))

(assert (= (and b!1274668 condMapEmpty!51246) mapIsEmpty!51246))

(assert (= (and b!1274668 (not condMapEmpty!51246)) mapNonEmpty!51246))

(get-info :version)

(assert (= (and mapNonEmpty!51246 ((_ is ValueCellFull!15689) mapValue!51246)) b!1274670))

(assert (= (and b!1274668 ((_ is ValueCellFull!15689) mapDefault!51246)) b!1274671))

(assert (= b!1274667 b!1274668))

(assert (= start!107768 b!1274667))

(declare-fun m!1172205 () Bool)

(assert (=> b!1274667 m!1172205))

(declare-fun m!1172207 () Bool)

(assert (=> b!1274667 m!1172207))

(declare-fun m!1172209 () Bool)

(assert (=> start!107768 m!1172209))

(declare-fun m!1172211 () Bool)

(assert (=> mapNonEmpty!51246 m!1172211))

(check-sat b_and!45773 (not b_next!27715) tp_is_empty!33085 (not start!107768) (not mapNonEmpty!51246) (not b!1274667))
(check-sat b_and!45773 (not b_next!27715))
(get-model)

(declare-fun d!140433 () Bool)

(assert (=> d!140433 (= (array_inv!30779 (_keys!12169 thiss!1551)) (bvsge (size!40793 (_keys!12169 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274667 d!140433))

(declare-fun d!140435 () Bool)

(assert (=> d!140435 (= (array_inv!30780 (_values!6740 thiss!1551)) (bvsge (size!40792 (_values!6740 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274667 d!140435))

(declare-fun b!1274711 () Bool)

(declare-fun res!847359 () Bool)

(declare-fun e!727359 () Bool)

(assert (=> b!1274711 (=> (not res!847359) (not e!727359))))

(declare-fun size!40798 (LongMapFixedSize!6142) (_ BitVec 32))

(assert (=> b!1274711 (= res!847359 (bvsge (size!40798 thiss!1551) (_size!3126 thiss!1551)))))

(declare-fun b!1274713 () Bool)

(assert (=> b!1274713 (= e!727359 (and (bvsge (extraKeys!6396 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6396 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3126 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1274712 () Bool)

(declare-fun res!847358 () Bool)

(assert (=> b!1274712 (=> (not res!847358) (not e!727359))))

(assert (=> b!1274712 (= res!847358 (= (size!40798 thiss!1551) (bvadd (_size!3126 thiss!1551) (bvsdiv (bvadd (extraKeys!6396 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!140437 () Bool)

(declare-fun res!847360 () Bool)

(assert (=> d!140437 (=> (not res!847360) (not e!727359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140437 (= res!847360 (validMask!0 (mask!34556 thiss!1551)))))

(assert (=> d!140437 (= (simpleValid!464 thiss!1551) e!727359)))

(declare-fun b!1274710 () Bool)

(declare-fun res!847357 () Bool)

(assert (=> b!1274710 (=> (not res!847357) (not e!727359))))

(assert (=> b!1274710 (= res!847357 (and (= (size!40792 (_values!6740 thiss!1551)) (bvadd (mask!34556 thiss!1551) #b00000000000000000000000000000001)) (= (size!40793 (_keys!12169 thiss!1551)) (size!40792 (_values!6740 thiss!1551))) (bvsge (_size!3126 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3126 thiss!1551) (bvadd (mask!34556 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!140437 res!847360) b!1274710))

(assert (= (and b!1274710 res!847357) b!1274711))

(assert (= (and b!1274711 res!847359) b!1274712))

(assert (= (and b!1274712 res!847358) b!1274713))

(declare-fun m!1172229 () Bool)

(assert (=> b!1274711 m!1172229))

(assert (=> b!1274712 m!1172229))

(declare-fun m!1172231 () Bool)

(assert (=> d!140437 m!1172231))

(assert (=> start!107768 d!140437))

(declare-fun mapIsEmpty!51255 () Bool)

(declare-fun mapRes!51255 () Bool)

(assert (=> mapIsEmpty!51255 mapRes!51255))

(declare-fun b!1274721 () Bool)

(declare-fun e!727365 () Bool)

(assert (=> b!1274721 (= e!727365 tp_is_empty!33085)))

(declare-fun condMapEmpty!51255 () Bool)

(declare-fun mapDefault!51255 () ValueCell!15689)

(assert (=> mapNonEmpty!51246 (= condMapEmpty!51255 (= mapRest!51246 ((as const (Array (_ BitVec 32) ValueCell!15689)) mapDefault!51255)))))

(assert (=> mapNonEmpty!51246 (= tp!97689 (and e!727365 mapRes!51255))))

(declare-fun b!1274720 () Bool)

(declare-fun e!727364 () Bool)

(assert (=> b!1274720 (= e!727364 tp_is_empty!33085)))

(declare-fun mapNonEmpty!51255 () Bool)

(declare-fun tp!97704 () Bool)

(assert (=> mapNonEmpty!51255 (= mapRes!51255 (and tp!97704 e!727364))))

(declare-fun mapKey!51255 () (_ BitVec 32))

(declare-fun mapValue!51255 () ValueCell!15689)

(declare-fun mapRest!51255 () (Array (_ BitVec 32) ValueCell!15689))

(assert (=> mapNonEmpty!51255 (= mapRest!51246 (store mapRest!51255 mapKey!51255 mapValue!51255))))

(assert (= (and mapNonEmpty!51246 condMapEmpty!51255) mapIsEmpty!51255))

(assert (= (and mapNonEmpty!51246 (not condMapEmpty!51255)) mapNonEmpty!51255))

(assert (= (and mapNonEmpty!51255 ((_ is ValueCellFull!15689) mapValue!51255)) b!1274720))

(assert (= (and mapNonEmpty!51246 ((_ is ValueCellFull!15689) mapDefault!51255)) b!1274721))

(declare-fun m!1172233 () Bool)

(assert (=> mapNonEmpty!51255 m!1172233))

(check-sat b_and!45773 (not b!1274711) (not b_next!27715) (not d!140437) tp_is_empty!33085 (not mapNonEmpty!51255) (not b!1274712))
(check-sat b_and!45773 (not b_next!27715))
