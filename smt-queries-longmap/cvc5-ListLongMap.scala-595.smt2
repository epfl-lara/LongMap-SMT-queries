; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15712 () Bool)

(assert start!15712)

(declare-fun b!156726 () Bool)

(declare-fun b_free!3379 () Bool)

(declare-fun b_next!3379 () Bool)

(assert (=> b!156726 (= b_free!3379 (not b_next!3379))))

(declare-fun tp!12661 () Bool)

(declare-fun b_and!9793 () Bool)

(assert (=> b!156726 (= tp!12661 b_and!9793)))

(declare-fun b!156723 () Bool)

(declare-fun res!74076 () Bool)

(declare-fun e!102506 () Bool)

(assert (=> b!156723 (=> (not res!74076) (not e!102506))))

(declare-datatypes ((V!3889 0))(
  ( (V!3890 (val!1635 Int)) )
))
(declare-datatypes ((ValueCell!1247 0))(
  ( (ValueCellFull!1247 (v!3500 V!3889)) (EmptyCell!1247) )
))
(declare-datatypes ((array!5415 0))(
  ( (array!5416 (arr!2565 (Array (_ BitVec 32) (_ BitVec 64))) (size!2843 (_ BitVec 32))) )
))
(declare-datatypes ((array!5417 0))(
  ( (array!5418 (arr!2566 (Array (_ BitVec 32) ValueCell!1247)) (size!2844 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1402 0))(
  ( (LongMapFixedSize!1403 (defaultEntry!3143 Int) (mask!7602 (_ BitVec 32)) (extraKeys!2884 (_ BitVec 32)) (zeroValue!2986 V!3889) (minValue!2986 V!3889) (_size!750 (_ BitVec 32)) (_keys!4918 array!5415) (_values!3126 array!5417) (_vacant!750 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1402)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156723 (= res!74076 (validMask!0 (mask!7602 thiss!1248)))))

(declare-fun b!156724 () Bool)

(declare-fun e!102505 () Bool)

(declare-fun tp_is_empty!3181 () Bool)

(assert (=> b!156724 (= e!102505 tp_is_empty!3181)))

(declare-fun b!156725 () Bool)

(assert (=> b!156725 (= e!102506 false)))

(declare-fun lt!81583 () Bool)

(declare-datatypes ((List!1861 0))(
  ( (Nil!1858) (Cons!1857 (h!2466 (_ BitVec 64)) (t!6663 List!1861)) )
))
(declare-fun arrayNoDuplicates!0 (array!5415 (_ BitVec 32) List!1861) Bool)

(assert (=> b!156725 (= lt!81583 (arrayNoDuplicates!0 (_keys!4918 thiss!1248) #b00000000000000000000000000000000 Nil!1858))))

(declare-fun e!102502 () Bool)

(declare-fun e!102507 () Bool)

(declare-fun array_inv!1619 (array!5415) Bool)

(declare-fun array_inv!1620 (array!5417) Bool)

(assert (=> b!156726 (= e!102507 (and tp!12661 tp_is_empty!3181 (array_inv!1619 (_keys!4918 thiss!1248)) (array_inv!1620 (_values!3126 thiss!1248)) e!102502))))

(declare-fun b!156727 () Bool)

(declare-fun res!74074 () Bool)

(assert (=> b!156727 (=> (not res!74074) (not e!102506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5415 (_ BitVec 32)) Bool)

(assert (=> b!156727 (= res!74074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4918 thiss!1248) (mask!7602 thiss!1248)))))

(declare-fun mapNonEmpty!5414 () Bool)

(declare-fun mapRes!5414 () Bool)

(declare-fun tp!12662 () Bool)

(declare-fun e!102504 () Bool)

(assert (=> mapNonEmpty!5414 (= mapRes!5414 (and tp!12662 e!102504))))

(declare-fun mapKey!5414 () (_ BitVec 32))

(declare-fun mapValue!5414 () ValueCell!1247)

(declare-fun mapRest!5414 () (Array (_ BitVec 32) ValueCell!1247))

(assert (=> mapNonEmpty!5414 (= (arr!2566 (_values!3126 thiss!1248)) (store mapRest!5414 mapKey!5414 mapValue!5414))))

(declare-fun b!156729 () Bool)

(assert (=> b!156729 (= e!102502 (and e!102505 mapRes!5414))))

(declare-fun condMapEmpty!5414 () Bool)

(declare-fun mapDefault!5414 () ValueCell!1247)

