; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16892 () Bool)

(assert start!16892)

(declare-fun b!170056 () Bool)

(declare-fun b_free!4179 () Bool)

(declare-fun b_next!4179 () Bool)

(assert (=> b!170056 (= b_free!4179 (not b_next!4179))))

(declare-fun tp!15150 () Bool)

(declare-fun b_and!10593 () Bool)

(assert (=> b!170056 (= tp!15150 b_and!10593)))

(declare-fun b!170055 () Bool)

(declare-fun e!112181 () Bool)

(declare-fun tp_is_empty!3951 () Bool)

(assert (=> b!170055 (= e!112181 tp_is_empty!3951)))

(declare-fun res!80845 () Bool)

(declare-fun e!112177 () Bool)

(assert (=> start!16892 (=> (not res!80845) (not e!112177))))

(declare-datatypes ((V!4915 0))(
  ( (V!4916 (val!2020 Int)) )
))
(declare-datatypes ((ValueCell!1632 0))(
  ( (ValueCellFull!1632 (v!3885 V!4915)) (EmptyCell!1632) )
))
(declare-datatypes ((array!7005 0))(
  ( (array!7006 (arr!3335 (Array (_ BitVec 32) (_ BitVec 64))) (size!3626 (_ BitVec 32))) )
))
(declare-datatypes ((array!7007 0))(
  ( (array!7008 (arr!3336 (Array (_ BitVec 32) ValueCell!1632)) (size!3627 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2172 0))(
  ( (LongMapFixedSize!2173 (defaultEntry!3528 Int) (mask!8329 (_ BitVec 32)) (extraKeys!3269 (_ BitVec 32)) (zeroValue!3371 V!4915) (minValue!3371 V!4915) (_size!1135 (_ BitVec 32)) (_keys!5356 array!7005) (_values!3511 array!7007) (_vacant!1135 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2172)

(declare-fun valid!933 (LongMapFixedSize!2172) Bool)

(assert (=> start!16892 (= res!80845 (valid!933 thiss!1248))))

(assert (=> start!16892 e!112177))

(declare-fun e!112178 () Bool)

(assert (=> start!16892 e!112178))

(assert (=> start!16892 true))

(declare-fun e!112176 () Bool)

(declare-fun array_inv!2137 (array!7005) Bool)

(declare-fun array_inv!2138 (array!7007) Bool)

(assert (=> b!170056 (= e!112178 (and tp!15150 tp_is_empty!3951 (array_inv!2137 (_keys!5356 thiss!1248)) (array_inv!2138 (_values!3511 thiss!1248)) e!112176))))

(declare-fun mapNonEmpty!6702 () Bool)

(declare-fun mapRes!6702 () Bool)

(declare-fun tp!15149 () Bool)

(declare-fun e!112180 () Bool)

(assert (=> mapNonEmpty!6702 (= mapRes!6702 (and tp!15149 e!112180))))

(declare-fun mapValue!6702 () ValueCell!1632)

(declare-fun mapRest!6702 () (Array (_ BitVec 32) ValueCell!1632))

(declare-fun mapKey!6702 () (_ BitVec 32))

(assert (=> mapNonEmpty!6702 (= (arr!3336 (_values!3511 thiss!1248)) (store mapRest!6702 mapKey!6702 mapValue!6702))))

(declare-fun b!170057 () Bool)

(declare-fun res!80847 () Bool)

(assert (=> b!170057 (=> (not res!80847) (not e!112177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170057 (= res!80847 (validMask!0 (mask!8329 thiss!1248)))))

(declare-fun b!170058 () Bool)

(assert (=> b!170058 (= e!112176 (and e!112181 mapRes!6702))))

(declare-fun condMapEmpty!6702 () Bool)

(declare-fun mapDefault!6702 () ValueCell!1632)

(assert (=> b!170058 (= condMapEmpty!6702 (= (arr!3336 (_values!3511 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1632)) mapDefault!6702)))))

(declare-fun mapIsEmpty!6702 () Bool)

(assert (=> mapIsEmpty!6702 mapRes!6702))

(declare-fun b!170059 () Bool)

(declare-fun res!80846 () Bool)

(assert (=> b!170059 (=> (not res!80846) (not e!112177))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170059 (= res!80846 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170060 () Bool)

(assert (=> b!170060 (= e!112180 tp_is_empty!3951)))

(declare-fun b!170061 () Bool)

(assert (=> b!170061 (= e!112177 (and (= (size!3627 (_values!3511 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8329 thiss!1248))) (= (size!3626 (_keys!5356 thiss!1248)) (size!3627 (_values!3511 thiss!1248))) (bvslt (mask!8329 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and start!16892 res!80845) b!170059))

(assert (= (and b!170059 res!80846) b!170057))

(assert (= (and b!170057 res!80847) b!170061))

(assert (= (and b!170058 condMapEmpty!6702) mapIsEmpty!6702))

(assert (= (and b!170058 (not condMapEmpty!6702)) mapNonEmpty!6702))

(get-info :version)

(assert (= (and mapNonEmpty!6702 ((_ is ValueCellFull!1632) mapValue!6702)) b!170060))

(assert (= (and b!170058 ((_ is ValueCellFull!1632) mapDefault!6702)) b!170055))

(assert (= b!170056 b!170058))

(assert (= start!16892 b!170056))

(declare-fun m!198769 () Bool)

(assert (=> start!16892 m!198769))

(declare-fun m!198771 () Bool)

(assert (=> b!170056 m!198771))

(declare-fun m!198773 () Bool)

(assert (=> b!170056 m!198773))

(declare-fun m!198775 () Bool)

(assert (=> mapNonEmpty!6702 m!198775))

(declare-fun m!198777 () Bool)

(assert (=> b!170057 m!198777))

(check-sat b_and!10593 (not mapNonEmpty!6702) tp_is_empty!3951 (not b!170056) (not b_next!4179) (not b!170057) (not start!16892))
(check-sat b_and!10593 (not b_next!4179))
(get-model)

(declare-fun d!51687 () Bool)

(assert (=> d!51687 (= (validMask!0 (mask!8329 thiss!1248)) (and (or (= (mask!8329 thiss!1248) #b00000000000000000000000000000111) (= (mask!8329 thiss!1248) #b00000000000000000000000000001111) (= (mask!8329 thiss!1248) #b00000000000000000000000000011111) (= (mask!8329 thiss!1248) #b00000000000000000000000000111111) (= (mask!8329 thiss!1248) #b00000000000000000000000001111111) (= (mask!8329 thiss!1248) #b00000000000000000000000011111111) (= (mask!8329 thiss!1248) #b00000000000000000000000111111111) (= (mask!8329 thiss!1248) #b00000000000000000000001111111111) (= (mask!8329 thiss!1248) #b00000000000000000000011111111111) (= (mask!8329 thiss!1248) #b00000000000000000000111111111111) (= (mask!8329 thiss!1248) #b00000000000000000001111111111111) (= (mask!8329 thiss!1248) #b00000000000000000011111111111111) (= (mask!8329 thiss!1248) #b00000000000000000111111111111111) (= (mask!8329 thiss!1248) #b00000000000000001111111111111111) (= (mask!8329 thiss!1248) #b00000000000000011111111111111111) (= (mask!8329 thiss!1248) #b00000000000000111111111111111111) (= (mask!8329 thiss!1248) #b00000000000001111111111111111111) (= (mask!8329 thiss!1248) #b00000000000011111111111111111111) (= (mask!8329 thiss!1248) #b00000000000111111111111111111111) (= (mask!8329 thiss!1248) #b00000000001111111111111111111111) (= (mask!8329 thiss!1248) #b00000000011111111111111111111111) (= (mask!8329 thiss!1248) #b00000000111111111111111111111111) (= (mask!8329 thiss!1248) #b00000001111111111111111111111111) (= (mask!8329 thiss!1248) #b00000011111111111111111111111111) (= (mask!8329 thiss!1248) #b00000111111111111111111111111111) (= (mask!8329 thiss!1248) #b00001111111111111111111111111111) (= (mask!8329 thiss!1248) #b00011111111111111111111111111111) (= (mask!8329 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8329 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170057 d!51687))

(declare-fun d!51689 () Bool)

(declare-fun res!80863 () Bool)

(declare-fun e!112202 () Bool)

(assert (=> d!51689 (=> (not res!80863) (not e!112202))))

(declare-fun simpleValid!130 (LongMapFixedSize!2172) Bool)

(assert (=> d!51689 (= res!80863 (simpleValid!130 thiss!1248))))

(assert (=> d!51689 (= (valid!933 thiss!1248) e!112202)))

(declare-fun b!170089 () Bool)

(declare-fun res!80864 () Bool)

(assert (=> b!170089 (=> (not res!80864) (not e!112202))))

(declare-fun arrayCountValidKeys!0 (array!7005 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170089 (= res!80864 (= (arrayCountValidKeys!0 (_keys!5356 thiss!1248) #b00000000000000000000000000000000 (size!3626 (_keys!5356 thiss!1248))) (_size!1135 thiss!1248)))))

(declare-fun b!170090 () Bool)

(declare-fun res!80865 () Bool)

(assert (=> b!170090 (=> (not res!80865) (not e!112202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7005 (_ BitVec 32)) Bool)

(assert (=> b!170090 (= res!80865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5356 thiss!1248) (mask!8329 thiss!1248)))))

(declare-fun b!170091 () Bool)

(declare-datatypes ((List!2186 0))(
  ( (Nil!2183) (Cons!2182 (h!2799 (_ BitVec 64)) (t!6988 List!2186)) )
))
(declare-fun arrayNoDuplicates!0 (array!7005 (_ BitVec 32) List!2186) Bool)

(assert (=> b!170091 (= e!112202 (arrayNoDuplicates!0 (_keys!5356 thiss!1248) #b00000000000000000000000000000000 Nil!2183))))

(assert (= (and d!51689 res!80863) b!170089))

(assert (= (and b!170089 res!80864) b!170090))

(assert (= (and b!170090 res!80865) b!170091))

(declare-fun m!198789 () Bool)

(assert (=> d!51689 m!198789))

(declare-fun m!198791 () Bool)

(assert (=> b!170089 m!198791))

(declare-fun m!198793 () Bool)

(assert (=> b!170090 m!198793))

(declare-fun m!198795 () Bool)

(assert (=> b!170091 m!198795))

(assert (=> start!16892 d!51689))

(declare-fun d!51691 () Bool)

(assert (=> d!51691 (= (array_inv!2137 (_keys!5356 thiss!1248)) (bvsge (size!3626 (_keys!5356 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170056 d!51691))

(declare-fun d!51693 () Bool)

(assert (=> d!51693 (= (array_inv!2138 (_values!3511 thiss!1248)) (bvsge (size!3627 (_values!3511 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170056 d!51693))

(declare-fun mapIsEmpty!6708 () Bool)

(declare-fun mapRes!6708 () Bool)

(assert (=> mapIsEmpty!6708 mapRes!6708))

(declare-fun condMapEmpty!6708 () Bool)

(declare-fun mapDefault!6708 () ValueCell!1632)

(assert (=> mapNonEmpty!6702 (= condMapEmpty!6708 (= mapRest!6702 ((as const (Array (_ BitVec 32) ValueCell!1632)) mapDefault!6708)))))

(declare-fun e!112208 () Bool)

(assert (=> mapNonEmpty!6702 (= tp!15149 (and e!112208 mapRes!6708))))

(declare-fun mapNonEmpty!6708 () Bool)

(declare-fun tp!15159 () Bool)

(declare-fun e!112207 () Bool)

(assert (=> mapNonEmpty!6708 (= mapRes!6708 (and tp!15159 e!112207))))

(declare-fun mapRest!6708 () (Array (_ BitVec 32) ValueCell!1632))

(declare-fun mapKey!6708 () (_ BitVec 32))

(declare-fun mapValue!6708 () ValueCell!1632)

(assert (=> mapNonEmpty!6708 (= mapRest!6702 (store mapRest!6708 mapKey!6708 mapValue!6708))))

(declare-fun b!170099 () Bool)

(assert (=> b!170099 (= e!112208 tp_is_empty!3951)))

(declare-fun b!170098 () Bool)

(assert (=> b!170098 (= e!112207 tp_is_empty!3951)))

(assert (= (and mapNonEmpty!6702 condMapEmpty!6708) mapIsEmpty!6708))

(assert (= (and mapNonEmpty!6702 (not condMapEmpty!6708)) mapNonEmpty!6708))

(assert (= (and mapNonEmpty!6708 ((_ is ValueCellFull!1632) mapValue!6708)) b!170098))

(assert (= (and mapNonEmpty!6702 ((_ is ValueCellFull!1632) mapDefault!6708)) b!170099))

(declare-fun m!198797 () Bool)

(assert (=> mapNonEmpty!6708 m!198797))

(check-sat (not d!51689) (not mapNonEmpty!6708) b_and!10593 tp_is_empty!3951 (not b!170091) (not b!170090) (not b!170089) (not b_next!4179))
(check-sat b_and!10593 (not b_next!4179))
