; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15698 () Bool)

(assert start!15698)

(declare-fun b!156534 () Bool)

(declare-fun b_free!3365 () Bool)

(declare-fun b_next!3365 () Bool)

(assert (=> b!156534 (= b_free!3365 (not b_next!3365))))

(declare-fun tp!12620 () Bool)

(declare-fun b_and!9779 () Bool)

(assert (=> b!156534 (= tp!12620 b_and!9779)))

(declare-fun e!102380 () Bool)

(declare-fun tp_is_empty!3167 () Bool)

(declare-datatypes ((V!3869 0))(
  ( (V!3870 (val!1628 Int)) )
))
(declare-datatypes ((ValueCell!1240 0))(
  ( (ValueCellFull!1240 (v!3493 V!3869)) (EmptyCell!1240) )
))
(declare-datatypes ((array!5387 0))(
  ( (array!5388 (arr!2551 (Array (_ BitVec 32) (_ BitVec 64))) (size!2829 (_ BitVec 32))) )
))
(declare-datatypes ((array!5389 0))(
  ( (array!5390 (arr!2552 (Array (_ BitVec 32) ValueCell!1240)) (size!2830 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1388 0))(
  ( (LongMapFixedSize!1389 (defaultEntry!3136 Int) (mask!7589 (_ BitVec 32)) (extraKeys!2877 (_ BitVec 32)) (zeroValue!2979 V!3869) (minValue!2979 V!3869) (_size!743 (_ BitVec 32)) (_keys!4911 array!5387) (_values!3119 array!5389) (_vacant!743 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1388)

(declare-fun e!102376 () Bool)

(declare-fun array_inv!1611 (array!5387) Bool)

(declare-fun array_inv!1612 (array!5389) Bool)

(assert (=> b!156534 (= e!102380 (and tp!12620 tp_is_empty!3167 (array_inv!1611 (_keys!4911 thiss!1248)) (array_inv!1612 (_values!3119 thiss!1248)) e!102376))))

(declare-fun b!156535 () Bool)

(declare-fun e!102381 () Bool)

(assert (=> b!156535 (= e!102381 tp_is_empty!3167)))

(declare-fun mapIsEmpty!5393 () Bool)

(declare-fun mapRes!5393 () Bool)

(assert (=> mapIsEmpty!5393 mapRes!5393))

(declare-fun b!156536 () Bool)

(declare-fun res!73972 () Bool)

(declare-fun e!102379 () Bool)

(assert (=> b!156536 (=> (not res!73972) (not e!102379))))

(assert (=> b!156536 (= res!73972 (and (= (size!2830 (_values!3119 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7589 thiss!1248))) (= (size!2829 (_keys!4911 thiss!1248)) (size!2830 (_values!3119 thiss!1248))) (bvsge (mask!7589 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2877 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2877 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2877 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2877 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2877 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2877 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2877 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156538 () Bool)

(declare-fun res!73971 () Bool)

(assert (=> b!156538 (=> (not res!73971) (not e!102379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156538 (= res!73971 (validMask!0 (mask!7589 thiss!1248)))))

(declare-fun b!156539 () Bool)

(declare-fun e!102377 () Bool)

(assert (=> b!156539 (= e!102377 tp_is_empty!3167)))

(declare-fun res!73969 () Bool)

(assert (=> start!15698 (=> (not res!73969) (not e!102379))))

(declare-fun valid!670 (LongMapFixedSize!1388) Bool)

(assert (=> start!15698 (= res!73969 (valid!670 thiss!1248))))

(assert (=> start!15698 e!102379))

(assert (=> start!15698 e!102380))

(assert (=> start!15698 true))

(declare-fun b!156537 () Bool)

(assert (=> b!156537 (= e!102379 false)))

(declare-fun lt!81562 () Bool)

(declare-datatypes ((List!1858 0))(
  ( (Nil!1855) (Cons!1854 (h!2463 (_ BitVec 64)) (t!6660 List!1858)) )
))
(declare-fun arrayNoDuplicates!0 (array!5387 (_ BitVec 32) List!1858) Bool)

(assert (=> b!156537 (= lt!81562 (arrayNoDuplicates!0 (_keys!4911 thiss!1248) #b00000000000000000000000000000000 Nil!1855))))

(declare-fun b!156540 () Bool)

(declare-fun res!73970 () Bool)

(assert (=> b!156540 (=> (not res!73970) (not e!102379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5387 (_ BitVec 32)) Bool)

(assert (=> b!156540 (= res!73970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4911 thiss!1248) (mask!7589 thiss!1248)))))

(declare-fun b!156541 () Bool)

(assert (=> b!156541 (= e!102376 (and e!102381 mapRes!5393))))

(declare-fun condMapEmpty!5393 () Bool)

(declare-fun mapDefault!5393 () ValueCell!1240)

