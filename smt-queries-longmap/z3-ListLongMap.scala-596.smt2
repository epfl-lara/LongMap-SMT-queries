; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15722 () Bool)

(assert start!15722)

(declare-fun b!156853 () Bool)

(declare-fun b_free!3385 () Bool)

(declare-fun b_next!3385 () Bool)

(assert (=> b!156853 (= b_free!3385 (not b_next!3385))))

(declare-fun tp!12679 () Bool)

(declare-fun b_and!9813 () Bool)

(assert (=> b!156853 (= tp!12679 b_and!9813)))

(declare-fun b!156851 () Bool)

(declare-fun res!74142 () Bool)

(declare-fun e!102583 () Bool)

(assert (=> b!156851 (=> (not res!74142) (not e!102583))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156851 (= res!74142 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156852 () Bool)

(assert (=> b!156852 (= e!102583 false)))

(declare-fun lt!81651 () Bool)

(declare-datatypes ((V!3897 0))(
  ( (V!3898 (val!1638 Int)) )
))
(declare-datatypes ((ValueCell!1250 0))(
  ( (ValueCellFull!1250 (v!3504 V!3897)) (EmptyCell!1250) )
))
(declare-datatypes ((array!5413 0))(
  ( (array!5414 (arr!2564 (Array (_ BitVec 32) (_ BitVec 64))) (size!2842 (_ BitVec 32))) )
))
(declare-datatypes ((array!5415 0))(
  ( (array!5416 (arr!2565 (Array (_ BitVec 32) ValueCell!1250)) (size!2843 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1408 0))(
  ( (LongMapFixedSize!1409 (defaultEntry!3146 Int) (mask!7607 (_ BitVec 32)) (extraKeys!2887 (_ BitVec 32)) (zeroValue!2989 V!3897) (minValue!2989 V!3897) (_size!753 (_ BitVec 32)) (_keys!4921 array!5413) (_values!3129 array!5415) (_vacant!753 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1408)

(declare-datatypes ((List!1849 0))(
  ( (Nil!1846) (Cons!1845 (h!2454 (_ BitVec 64)) (t!6643 List!1849)) )
))
(declare-fun arrayNoDuplicates!0 (array!5413 (_ BitVec 32) List!1849) Bool)

(assert (=> b!156852 (= lt!81651 (arrayNoDuplicates!0 (_keys!4921 thiss!1248) #b00000000000000000000000000000000 Nil!1846))))

(declare-fun e!102582 () Bool)

(declare-fun e!102580 () Bool)

(declare-fun tp_is_empty!3187 () Bool)

(declare-fun array_inv!1627 (array!5413) Bool)

(declare-fun array_inv!1628 (array!5415) Bool)

(assert (=> b!156853 (= e!102582 (and tp!12679 tp_is_empty!3187 (array_inv!1627 (_keys!4921 thiss!1248)) (array_inv!1628 (_values!3129 thiss!1248)) e!102580))))

(declare-fun b!156854 () Bool)

(declare-fun res!74143 () Bool)

(assert (=> b!156854 (=> (not res!74143) (not e!102583))))

(assert (=> b!156854 (= res!74143 (and (= (size!2843 (_values!3129 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7607 thiss!1248))) (= (size!2842 (_keys!4921 thiss!1248)) (size!2843 (_values!3129 thiss!1248))) (bvsge (mask!7607 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2887 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2887 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2887 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156855 () Bool)

(declare-fun e!102581 () Bool)

(assert (=> b!156855 (= e!102581 tp_is_empty!3187)))

(declare-fun res!74140 () Bool)

(assert (=> start!15722 (=> (not res!74140) (not e!102583))))

(declare-fun valid!692 (LongMapFixedSize!1408) Bool)

(assert (=> start!15722 (= res!74140 (valid!692 thiss!1248))))

(assert (=> start!15722 e!102583))

(assert (=> start!15722 e!102582))

(assert (=> start!15722 true))

(declare-fun b!156856 () Bool)

(declare-fun res!74141 () Bool)

(assert (=> b!156856 (=> (not res!74141) (not e!102583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5413 (_ BitVec 32)) Bool)

(assert (=> b!156856 (= res!74141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4921 thiss!1248) (mask!7607 thiss!1248)))))

(declare-fun b!156857 () Bool)

(declare-fun mapRes!5423 () Bool)

(assert (=> b!156857 (= e!102580 (and e!102581 mapRes!5423))))

(declare-fun condMapEmpty!5423 () Bool)

(declare-fun mapDefault!5423 () ValueCell!1250)

(assert (=> b!156857 (= condMapEmpty!5423 (= (arr!2565 (_values!3129 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1250)) mapDefault!5423)))))

(declare-fun b!156858 () Bool)

(declare-fun e!102584 () Bool)

(assert (=> b!156858 (= e!102584 tp_is_empty!3187)))

(declare-fun b!156859 () Bool)

(declare-fun res!74139 () Bool)

(assert (=> b!156859 (=> (not res!74139) (not e!102583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156859 (= res!74139 (validMask!0 (mask!7607 thiss!1248)))))

(declare-fun mapNonEmpty!5423 () Bool)

(declare-fun tp!12680 () Bool)

(assert (=> mapNonEmpty!5423 (= mapRes!5423 (and tp!12680 e!102584))))

(declare-fun mapRest!5423 () (Array (_ BitVec 32) ValueCell!1250))

(declare-fun mapValue!5423 () ValueCell!1250)

(declare-fun mapKey!5423 () (_ BitVec 32))

(assert (=> mapNonEmpty!5423 (= (arr!2565 (_values!3129 thiss!1248)) (store mapRest!5423 mapKey!5423 mapValue!5423))))

(declare-fun mapIsEmpty!5423 () Bool)

(assert (=> mapIsEmpty!5423 mapRes!5423))

(assert (= (and start!15722 res!74140) b!156851))

(assert (= (and b!156851 res!74142) b!156859))

(assert (= (and b!156859 res!74139) b!156854))

(assert (= (and b!156854 res!74143) b!156856))

(assert (= (and b!156856 res!74141) b!156852))

(assert (= (and b!156857 condMapEmpty!5423) mapIsEmpty!5423))

(assert (= (and b!156857 (not condMapEmpty!5423)) mapNonEmpty!5423))

(get-info :version)

(assert (= (and mapNonEmpty!5423 ((_ is ValueCellFull!1250) mapValue!5423)) b!156858))

(assert (= (and b!156857 ((_ is ValueCellFull!1250) mapDefault!5423)) b!156855))

(assert (= b!156853 b!156857))

(assert (= start!15722 b!156853))

(declare-fun m!190373 () Bool)

(assert (=> b!156853 m!190373))

(declare-fun m!190375 () Bool)

(assert (=> b!156853 m!190375))

(declare-fun m!190377 () Bool)

(assert (=> start!15722 m!190377))

(declare-fun m!190379 () Bool)

(assert (=> mapNonEmpty!5423 m!190379))

(declare-fun m!190381 () Bool)

(assert (=> b!156856 m!190381))

(declare-fun m!190383 () Bool)

(assert (=> b!156859 m!190383))

(declare-fun m!190385 () Bool)

(assert (=> b!156852 m!190385))

(check-sat (not b!156856) (not b!156852) (not b!156853) b_and!9813 (not b!156859) (not start!15722) (not mapNonEmpty!5423) (not b_next!3385) tp_is_empty!3187)
(check-sat b_and!9813 (not b_next!3385))
