; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15664 () Bool)

(assert start!15664)

(declare-fun b!156081 () Bool)

(declare-fun b_free!3331 () Bool)

(declare-fun b_next!3331 () Bool)

(assert (=> b!156081 (= b_free!3331 (not b_next!3331))))

(declare-fun tp!12518 () Bool)

(declare-fun b_and!9745 () Bool)

(assert (=> b!156081 (= tp!12518 b_and!9745)))

(declare-fun b!156075 () Bool)

(declare-fun e!102071 () Bool)

(assert (=> b!156075 (= e!102071 false)))

(declare-fun lt!81511 () Bool)

(declare-datatypes ((V!3825 0))(
  ( (V!3826 (val!1611 Int)) )
))
(declare-datatypes ((ValueCell!1223 0))(
  ( (ValueCellFull!1223 (v!3476 V!3825)) (EmptyCell!1223) )
))
(declare-datatypes ((array!5319 0))(
  ( (array!5320 (arr!2517 (Array (_ BitVec 32) (_ BitVec 64))) (size!2795 (_ BitVec 32))) )
))
(declare-datatypes ((array!5321 0))(
  ( (array!5322 (arr!2518 (Array (_ BitVec 32) ValueCell!1223)) (size!2796 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1354 0))(
  ( (LongMapFixedSize!1355 (defaultEntry!3119 Int) (mask!7562 (_ BitVec 32)) (extraKeys!2860 (_ BitVec 32)) (zeroValue!2962 V!3825) (minValue!2962 V!3825) (_size!726 (_ BitVec 32)) (_keys!4894 array!5319) (_values!3102 array!5321) (_vacant!726 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1354)

(declare-datatypes ((List!1845 0))(
  ( (Nil!1842) (Cons!1841 (h!2450 (_ BitVec 64)) (t!6647 List!1845)) )
))
(declare-fun arrayNoDuplicates!0 (array!5319 (_ BitVec 32) List!1845) Bool)

(assert (=> b!156075 (= lt!81511 (arrayNoDuplicates!0 (_keys!4894 thiss!1248) #b00000000000000000000000000000000 Nil!1842))))

(declare-fun b!156076 () Bool)

(declare-fun res!73717 () Bool)

(assert (=> b!156076 (=> (not res!73717) (not e!102071))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156076 (= res!73717 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156077 () Bool)

(declare-fun res!73713 () Bool)

(assert (=> b!156077 (=> (not res!73713) (not e!102071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5319 (_ BitVec 32)) Bool)

(assert (=> b!156077 (= res!73713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4894 thiss!1248) (mask!7562 thiss!1248)))))

(declare-fun mapIsEmpty!5342 () Bool)

(declare-fun mapRes!5342 () Bool)

(assert (=> mapIsEmpty!5342 mapRes!5342))

(declare-fun b!156078 () Bool)

(declare-fun res!73716 () Bool)

(assert (=> b!156078 (=> (not res!73716) (not e!102071))))

(assert (=> b!156078 (= res!73716 (and (= (size!2796 (_values!3102 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7562 thiss!1248))) (= (size!2795 (_keys!4894 thiss!1248)) (size!2796 (_values!3102 thiss!1248))) (bvsge (mask!7562 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2860 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2860 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2860 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156079 () Bool)

(declare-fun e!102070 () Bool)

(declare-fun e!102072 () Bool)

(assert (=> b!156079 (= e!102070 (and e!102072 mapRes!5342))))

(declare-fun condMapEmpty!5342 () Bool)

(declare-fun mapDefault!5342 () ValueCell!1223)

