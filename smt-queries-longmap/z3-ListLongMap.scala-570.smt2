; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15566 () Bool)

(assert start!15566)

(declare-fun b!154670 () Bool)

(declare-fun b_free!3229 () Bool)

(declare-fun b_next!3229 () Bool)

(assert (=> b!154670 (= b_free!3229 (not b_next!3229))))

(declare-fun tp!12211 () Bool)

(declare-fun b_and!9617 () Bool)

(assert (=> b!154670 (= tp!12211 b_and!9617)))

(declare-fun b!154668 () Bool)

(declare-fun e!101035 () Bool)

(declare-fun tp_is_empty!3031 () Bool)

(assert (=> b!154668 (= e!101035 tp_is_empty!3031)))

(declare-fun b!154669 () Bool)

(declare-fun e!101038 () Bool)

(assert (=> b!154669 (= e!101038 tp_is_empty!3031)))

(declare-fun e!101036 () Bool)

(declare-fun e!101037 () Bool)

(declare-datatypes ((V!3689 0))(
  ( (V!3690 (val!1560 Int)) )
))
(declare-datatypes ((ValueCell!1172 0))(
  ( (ValueCellFull!1172 (v!3419 V!3689)) (EmptyCell!1172) )
))
(declare-datatypes ((array!5095 0))(
  ( (array!5096 (arr!2404 (Array (_ BitVec 32) (_ BitVec 64))) (size!2683 (_ BitVec 32))) )
))
(declare-datatypes ((array!5097 0))(
  ( (array!5098 (arr!2405 (Array (_ BitVec 32) ValueCell!1172)) (size!2684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1252 0))(
  ( (LongMapFixedSize!1253 (defaultEntry!3068 Int) (mask!7476 (_ BitVec 32)) (extraKeys!2809 (_ BitVec 32)) (zeroValue!2911 V!3689) (minValue!2911 V!3689) (_size!675 (_ BitVec 32)) (_keys!4842 array!5095) (_values!3051 array!5097) (_vacant!675 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1252)

(declare-fun array_inv!1541 (array!5095) Bool)

(declare-fun array_inv!1542 (array!5097) Bool)

(assert (=> b!154670 (= e!101036 (and tp!12211 tp_is_empty!3031 (array_inv!1541 (_keys!4842 thiss!1248)) (array_inv!1542 (_values!3051 thiss!1248)) e!101037))))

(declare-fun mapNonEmpty!5189 () Bool)

(declare-fun mapRes!5189 () Bool)

(declare-fun tp!12212 () Bool)

(assert (=> mapNonEmpty!5189 (= mapRes!5189 (and tp!12212 e!101038))))

(declare-fun mapValue!5189 () ValueCell!1172)

(declare-fun mapKey!5189 () (_ BitVec 32))

(declare-fun mapRest!5189 () (Array (_ BitVec 32) ValueCell!1172))

(assert (=> mapNonEmpty!5189 (= (arr!2405 (_values!3051 thiss!1248)) (store mapRest!5189 mapKey!5189 mapValue!5189))))

(declare-fun b!154672 () Bool)

(declare-fun res!72970 () Bool)

(declare-fun e!101033 () Bool)

(assert (=> b!154672 (=> (not res!72970) (not e!101033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5095 (_ BitVec 32)) Bool)

(assert (=> b!154672 (= res!72970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4842 thiss!1248) (mask!7476 thiss!1248)))))

(declare-fun b!154673 () Bool)

(declare-fun res!72974 () Bool)

(assert (=> b!154673 (=> (not res!72974) (not e!101033))))

(assert (=> b!154673 (= res!72974 (and (= (size!2684 (_values!3051 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7476 thiss!1248))) (= (size!2683 (_keys!4842 thiss!1248)) (size!2684 (_values!3051 thiss!1248))) (bvsge (mask!7476 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2809 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2809 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2809 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!72973 () Bool)

(assert (=> start!15566 (=> (not res!72973) (not e!101033))))

(declare-fun valid!628 (LongMapFixedSize!1252) Bool)

(assert (=> start!15566 (= res!72973 (valid!628 thiss!1248))))

(assert (=> start!15566 e!101033))

(assert (=> start!15566 e!101036))

(assert (=> start!15566 true))

(declare-fun b!154671 () Bool)

(assert (=> b!154671 (= e!101033 false)))

(declare-fun lt!81114 () Bool)

(declare-datatypes ((List!1811 0))(
  ( (Nil!1808) (Cons!1807 (h!2416 (_ BitVec 64)) (t!6604 List!1811)) )
))
(declare-fun arrayNoDuplicates!0 (array!5095 (_ BitVec 32) List!1811) Bool)

(assert (=> b!154671 (= lt!81114 (arrayNoDuplicates!0 (_keys!4842 thiss!1248) #b00000000000000000000000000000000 Nil!1808))))

(declare-fun b!154674 () Bool)

(assert (=> b!154674 (= e!101037 (and e!101035 mapRes!5189))))

(declare-fun condMapEmpty!5189 () Bool)

(declare-fun mapDefault!5189 () ValueCell!1172)

(assert (=> b!154674 (= condMapEmpty!5189 (= (arr!2405 (_values!3051 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1172)) mapDefault!5189)))))

(declare-fun b!154675 () Bool)

(declare-fun res!72972 () Bool)

(assert (=> b!154675 (=> (not res!72972) (not e!101033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154675 (= res!72972 (validMask!0 (mask!7476 thiss!1248)))))

(declare-fun mapIsEmpty!5189 () Bool)

(assert (=> mapIsEmpty!5189 mapRes!5189))

(declare-fun b!154676 () Bool)

(declare-fun res!72971 () Bool)

(assert (=> b!154676 (=> (not res!72971) (not e!101033))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154676 (= res!72971 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!15566 res!72973) b!154676))

(assert (= (and b!154676 res!72971) b!154675))

(assert (= (and b!154675 res!72972) b!154673))

(assert (= (and b!154673 res!72974) b!154672))

(assert (= (and b!154672 res!72970) b!154671))

(assert (= (and b!154674 condMapEmpty!5189) mapIsEmpty!5189))

(assert (= (and b!154674 (not condMapEmpty!5189)) mapNonEmpty!5189))

(get-info :version)

(assert (= (and mapNonEmpty!5189 ((_ is ValueCellFull!1172) mapValue!5189)) b!154669))

(assert (= (and b!154674 ((_ is ValueCellFull!1172) mapDefault!5189)) b!154668))

(assert (= b!154670 b!154674))

(assert (= start!15566 b!154670))

(declare-fun m!188395 () Bool)

(assert (=> b!154671 m!188395))

(declare-fun m!188397 () Bool)

(assert (=> start!15566 m!188397))

(declare-fun m!188399 () Bool)

(assert (=> b!154675 m!188399))

(declare-fun m!188401 () Bool)

(assert (=> mapNonEmpty!5189 m!188401))

(declare-fun m!188403 () Bool)

(assert (=> b!154672 m!188403))

(declare-fun m!188405 () Bool)

(assert (=> b!154670 m!188405))

(declare-fun m!188407 () Bool)

(assert (=> b!154670 m!188407))

(check-sat (not b!154672) (not b!154671) (not mapNonEmpty!5189) (not b!154675) tp_is_empty!3031 b_and!9617 (not start!15566) (not b_next!3229) (not b!154670))
(check-sat b_and!9617 (not b_next!3229))
