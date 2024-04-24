; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15716 () Bool)

(assert start!15716)

(declare-fun b!156775 () Bool)

(declare-fun b_free!3379 () Bool)

(declare-fun b_next!3379 () Bool)

(assert (=> b!156775 (= b_free!3379 (not b_next!3379))))

(declare-fun tp!12661 () Bool)

(declare-fun b_and!9807 () Bool)

(assert (=> b!156775 (= tp!12661 b_and!9807)))

(declare-fun b!156770 () Bool)

(declare-fun e!102529 () Bool)

(declare-fun e!102527 () Bool)

(declare-fun mapRes!5414 () Bool)

(assert (=> b!156770 (= e!102529 (and e!102527 mapRes!5414))))

(declare-fun condMapEmpty!5414 () Bool)

(declare-datatypes ((V!3889 0))(
  ( (V!3890 (val!1635 Int)) )
))
(declare-datatypes ((ValueCell!1247 0))(
  ( (ValueCellFull!1247 (v!3501 V!3889)) (EmptyCell!1247) )
))
(declare-datatypes ((array!5401 0))(
  ( (array!5402 (arr!2558 (Array (_ BitVec 32) (_ BitVec 64))) (size!2836 (_ BitVec 32))) )
))
(declare-datatypes ((array!5403 0))(
  ( (array!5404 (arr!2559 (Array (_ BitVec 32) ValueCell!1247)) (size!2837 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1402 0))(
  ( (LongMapFixedSize!1403 (defaultEntry!3143 Int) (mask!7602 (_ BitVec 32)) (extraKeys!2884 (_ BitVec 32)) (zeroValue!2986 V!3889) (minValue!2986 V!3889) (_size!750 (_ BitVec 32)) (_keys!4918 array!5401) (_values!3126 array!5403) (_vacant!750 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1402)

(declare-fun mapDefault!5414 () ValueCell!1247)

(assert (=> b!156770 (= condMapEmpty!5414 (= (arr!2559 (_values!3126 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1247)) mapDefault!5414)))))

(declare-fun b!156771 () Bool)

(declare-fun tp_is_empty!3181 () Bool)

(assert (=> b!156771 (= e!102527 tp_is_empty!3181)))

(declare-fun b!156772 () Bool)

(declare-fun res!74097 () Bool)

(declare-fun e!102531 () Bool)

(assert (=> b!156772 (=> (not res!74097) (not e!102531))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156772 (= res!74097 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156773 () Bool)

(declare-fun res!74094 () Bool)

(assert (=> b!156773 (=> (not res!74094) (not e!102531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156773 (= res!74094 (validMask!0 (mask!7602 thiss!1248)))))

(declare-fun b!156774 () Bool)

(assert (=> b!156774 (= e!102531 false)))

(declare-fun lt!81642 () Bool)

(declare-datatypes ((List!1847 0))(
  ( (Nil!1844) (Cons!1843 (h!2452 (_ BitVec 64)) (t!6641 List!1847)) )
))
(declare-fun arrayNoDuplicates!0 (array!5401 (_ BitVec 32) List!1847) Bool)

(assert (=> b!156774 (= lt!81642 (arrayNoDuplicates!0 (_keys!4918 thiss!1248) #b00000000000000000000000000000000 Nil!1844))))

(declare-fun res!74098 () Bool)

(assert (=> start!15716 (=> (not res!74098) (not e!102531))))

(declare-fun valid!690 (LongMapFixedSize!1402) Bool)

(assert (=> start!15716 (= res!74098 (valid!690 thiss!1248))))

(assert (=> start!15716 e!102531))

(declare-fun e!102526 () Bool)

(assert (=> start!15716 e!102526))

(assert (=> start!15716 true))

(declare-fun array_inv!1623 (array!5401) Bool)

(declare-fun array_inv!1624 (array!5403) Bool)

(assert (=> b!156775 (= e!102526 (and tp!12661 tp_is_empty!3181 (array_inv!1623 (_keys!4918 thiss!1248)) (array_inv!1624 (_values!3126 thiss!1248)) e!102529))))

(declare-fun b!156776 () Bool)

(declare-fun e!102530 () Bool)

(assert (=> b!156776 (= e!102530 tp_is_empty!3181)))

(declare-fun mapNonEmpty!5414 () Bool)

(declare-fun tp!12662 () Bool)

(assert (=> mapNonEmpty!5414 (= mapRes!5414 (and tp!12662 e!102530))))

(declare-fun mapValue!5414 () ValueCell!1247)

(declare-fun mapRest!5414 () (Array (_ BitVec 32) ValueCell!1247))

(declare-fun mapKey!5414 () (_ BitVec 32))

(assert (=> mapNonEmpty!5414 (= (arr!2559 (_values!3126 thiss!1248)) (store mapRest!5414 mapKey!5414 mapValue!5414))))

(declare-fun mapIsEmpty!5414 () Bool)

(assert (=> mapIsEmpty!5414 mapRes!5414))

(declare-fun b!156777 () Bool)

(declare-fun res!74095 () Bool)

(assert (=> b!156777 (=> (not res!74095) (not e!102531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5401 (_ BitVec 32)) Bool)

(assert (=> b!156777 (= res!74095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4918 thiss!1248) (mask!7602 thiss!1248)))))

(declare-fun b!156778 () Bool)

(declare-fun res!74096 () Bool)

(assert (=> b!156778 (=> (not res!74096) (not e!102531))))

(assert (=> b!156778 (= res!74096 (and (= (size!2837 (_values!3126 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7602 thiss!1248))) (= (size!2836 (_keys!4918 thiss!1248)) (size!2837 (_values!3126 thiss!1248))) (bvsge (mask!7602 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2884 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2884 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2884 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!15716 res!74098) b!156772))

(assert (= (and b!156772 res!74097) b!156773))

(assert (= (and b!156773 res!74094) b!156778))

(assert (= (and b!156778 res!74096) b!156777))

(assert (= (and b!156777 res!74095) b!156774))

(assert (= (and b!156770 condMapEmpty!5414) mapIsEmpty!5414))

(assert (= (and b!156770 (not condMapEmpty!5414)) mapNonEmpty!5414))

(get-info :version)

(assert (= (and mapNonEmpty!5414 ((_ is ValueCellFull!1247) mapValue!5414)) b!156776))

(assert (= (and b!156770 ((_ is ValueCellFull!1247) mapDefault!5414)) b!156771))

(assert (= b!156775 b!156770))

(assert (= start!15716 b!156775))

(declare-fun m!190331 () Bool)

(assert (=> b!156773 m!190331))

(declare-fun m!190333 () Bool)

(assert (=> b!156774 m!190333))

(declare-fun m!190335 () Bool)

(assert (=> mapNonEmpty!5414 m!190335))

(declare-fun m!190337 () Bool)

(assert (=> b!156775 m!190337))

(declare-fun m!190339 () Bool)

(assert (=> b!156775 m!190339))

(declare-fun m!190341 () Bool)

(assert (=> start!15716 m!190341))

(declare-fun m!190343 () Bool)

(assert (=> b!156777 m!190343))

(check-sat b_and!9807 (not start!15716) (not b!156777) (not b!156775) (not b!156773) (not b!156774) (not mapNonEmpty!5414) (not b_next!3379) tp_is_empty!3181)
(check-sat b_and!9807 (not b_next!3379))
