; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15728 () Bool)

(assert start!15728)

(declare-fun b!156938 () Bool)

(declare-fun b_free!3391 () Bool)

(declare-fun b_next!3391 () Bool)

(assert (=> b!156938 (= b_free!3391 (not b_next!3391))))

(declare-fun tp!12698 () Bool)

(declare-fun b_and!9819 () Bool)

(assert (=> b!156938 (= tp!12698 b_and!9819)))

(declare-fun b!156932 () Bool)

(declare-fun e!102636 () Bool)

(declare-fun tp_is_empty!3193 () Bool)

(assert (=> b!156932 (= e!102636 tp_is_empty!3193)))

(declare-fun b!156933 () Bool)

(declare-fun e!102637 () Bool)

(declare-fun mapRes!5432 () Bool)

(assert (=> b!156933 (= e!102637 (and e!102636 mapRes!5432))))

(declare-fun condMapEmpty!5432 () Bool)

(declare-datatypes ((V!3905 0))(
  ( (V!3906 (val!1641 Int)) )
))
(declare-datatypes ((ValueCell!1253 0))(
  ( (ValueCellFull!1253 (v!3507 V!3905)) (EmptyCell!1253) )
))
(declare-datatypes ((array!5425 0))(
  ( (array!5426 (arr!2570 (Array (_ BitVec 32) (_ BitVec 64))) (size!2848 (_ BitVec 32))) )
))
(declare-datatypes ((array!5427 0))(
  ( (array!5428 (arr!2571 (Array (_ BitVec 32) ValueCell!1253)) (size!2849 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1414 0))(
  ( (LongMapFixedSize!1415 (defaultEntry!3149 Int) (mask!7612 (_ BitVec 32)) (extraKeys!2890 (_ BitVec 32)) (zeroValue!2992 V!3905) (minValue!2992 V!3905) (_size!756 (_ BitVec 32)) (_keys!4924 array!5425) (_values!3132 array!5427) (_vacant!756 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1414)

(declare-fun mapDefault!5432 () ValueCell!1253)

(assert (=> b!156933 (= condMapEmpty!5432 (= (arr!2571 (_values!3132 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1253)) mapDefault!5432)))))

(declare-fun res!74188 () Bool)

(declare-fun e!102638 () Bool)

(assert (=> start!15728 (=> (not res!74188) (not e!102638))))

(declare-fun valid!694 (LongMapFixedSize!1414) Bool)

(assert (=> start!15728 (= res!74188 (valid!694 thiss!1248))))

(assert (=> start!15728 e!102638))

(declare-fun e!102634 () Bool)

(assert (=> start!15728 e!102634))

(assert (=> start!15728 true))

(declare-fun mapNonEmpty!5432 () Bool)

(declare-fun tp!12697 () Bool)

(declare-fun e!102635 () Bool)

(assert (=> mapNonEmpty!5432 (= mapRes!5432 (and tp!12697 e!102635))))

(declare-fun mapValue!5432 () ValueCell!1253)

(declare-fun mapRest!5432 () (Array (_ BitVec 32) ValueCell!1253))

(declare-fun mapKey!5432 () (_ BitVec 32))

(assert (=> mapNonEmpty!5432 (= (arr!2571 (_values!3132 thiss!1248)) (store mapRest!5432 mapKey!5432 mapValue!5432))))

(declare-fun b!156934 () Bool)

(declare-fun res!74184 () Bool)

(assert (=> b!156934 (=> (not res!74184) (not e!102638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156934 (= res!74184 (validMask!0 (mask!7612 thiss!1248)))))

(declare-fun b!156935 () Bool)

(declare-fun res!74187 () Bool)

(assert (=> b!156935 (=> (not res!74187) (not e!102638))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156935 (= res!74187 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156936 () Bool)

(declare-fun res!74185 () Bool)

(assert (=> b!156936 (=> (not res!74185) (not e!102638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5425 (_ BitVec 32)) Bool)

(assert (=> b!156936 (= res!74185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4924 thiss!1248) (mask!7612 thiss!1248)))))

(declare-fun b!156937 () Bool)

(assert (=> b!156937 (= e!102638 false)))

(declare-fun lt!81660 () Bool)

(declare-datatypes ((List!1851 0))(
  ( (Nil!1848) (Cons!1847 (h!2456 (_ BitVec 64)) (t!6645 List!1851)) )
))
(declare-fun arrayNoDuplicates!0 (array!5425 (_ BitVec 32) List!1851) Bool)

(assert (=> b!156937 (= lt!81660 (arrayNoDuplicates!0 (_keys!4924 thiss!1248) #b00000000000000000000000000000000 Nil!1848))))

(declare-fun array_inv!1631 (array!5425) Bool)

(declare-fun array_inv!1632 (array!5427) Bool)

(assert (=> b!156938 (= e!102634 (and tp!12698 tp_is_empty!3193 (array_inv!1631 (_keys!4924 thiss!1248)) (array_inv!1632 (_values!3132 thiss!1248)) e!102637))))

(declare-fun mapIsEmpty!5432 () Bool)

(assert (=> mapIsEmpty!5432 mapRes!5432))

(declare-fun b!156939 () Bool)

(declare-fun res!74186 () Bool)

(assert (=> b!156939 (=> (not res!74186) (not e!102638))))

(assert (=> b!156939 (= res!74186 (and (= (size!2849 (_values!3132 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7612 thiss!1248))) (= (size!2848 (_keys!4924 thiss!1248)) (size!2849 (_values!3132 thiss!1248))) (bvsge (mask!7612 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2890 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2890 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2890 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156940 () Bool)

(assert (=> b!156940 (= e!102635 tp_is_empty!3193)))

(assert (= (and start!15728 res!74188) b!156935))

(assert (= (and b!156935 res!74187) b!156934))

(assert (= (and b!156934 res!74184) b!156939))

(assert (= (and b!156939 res!74186) b!156936))

(assert (= (and b!156936 res!74185) b!156937))

(assert (= (and b!156933 condMapEmpty!5432) mapIsEmpty!5432))

(assert (= (and b!156933 (not condMapEmpty!5432)) mapNonEmpty!5432))

(get-info :version)

(assert (= (and mapNonEmpty!5432 ((_ is ValueCellFull!1253) mapValue!5432)) b!156940))

(assert (= (and b!156933 ((_ is ValueCellFull!1253) mapDefault!5432)) b!156932))

(assert (= b!156938 b!156933))

(assert (= start!15728 b!156938))

(declare-fun m!190415 () Bool)

(assert (=> b!156937 m!190415))

(declare-fun m!190417 () Bool)

(assert (=> b!156936 m!190417))

(declare-fun m!190419 () Bool)

(assert (=> mapNonEmpty!5432 m!190419))

(declare-fun m!190421 () Bool)

(assert (=> start!15728 m!190421))

(declare-fun m!190423 () Bool)

(assert (=> b!156938 m!190423))

(declare-fun m!190425 () Bool)

(assert (=> b!156938 m!190425))

(declare-fun m!190427 () Bool)

(assert (=> b!156934 m!190427))

(check-sat tp_is_empty!3193 (not b!156936) (not b!156937) (not b!156934) (not mapNonEmpty!5432) (not b!156938) b_and!9819 (not b_next!3391) (not start!15728))
(check-sat b_and!9819 (not b_next!3391))
