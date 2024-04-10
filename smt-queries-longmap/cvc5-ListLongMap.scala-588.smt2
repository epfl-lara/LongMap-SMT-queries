; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15670 () Bool)

(assert start!15670)

(declare-fun b!156157 () Bool)

(declare-fun b_free!3337 () Bool)

(declare-fun b_next!3337 () Bool)

(assert (=> b!156157 (= b_free!3337 (not b_next!3337))))

(declare-fun tp!12535 () Bool)

(declare-fun b_and!9751 () Bool)

(assert (=> b!156157 (= tp!12535 b_and!9751)))

(declare-fun b!156156 () Bool)

(declare-fun e!102128 () Bool)

(declare-fun tp_is_empty!3139 () Bool)

(assert (=> b!156156 (= e!102128 tp_is_empty!3139)))

(declare-fun e!102127 () Bool)

(declare-fun e!102124 () Bool)

(declare-datatypes ((V!3833 0))(
  ( (V!3834 (val!1614 Int)) )
))
(declare-datatypes ((ValueCell!1226 0))(
  ( (ValueCellFull!1226 (v!3479 V!3833)) (EmptyCell!1226) )
))
(declare-datatypes ((array!5331 0))(
  ( (array!5332 (arr!2523 (Array (_ BitVec 32) (_ BitVec 64))) (size!2801 (_ BitVec 32))) )
))
(declare-datatypes ((array!5333 0))(
  ( (array!5334 (arr!2524 (Array (_ BitVec 32) ValueCell!1226)) (size!2802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1360 0))(
  ( (LongMapFixedSize!1361 (defaultEntry!3122 Int) (mask!7567 (_ BitVec 32)) (extraKeys!2863 (_ BitVec 32)) (zeroValue!2965 V!3833) (minValue!2965 V!3833) (_size!729 (_ BitVec 32)) (_keys!4897 array!5331) (_values!3105 array!5333) (_vacant!729 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1360)

(declare-fun array_inv!1593 (array!5331) Bool)

(declare-fun array_inv!1594 (array!5333) Bool)

(assert (=> b!156157 (= e!102124 (and tp!12535 tp_is_empty!3139 (array_inv!1593 (_keys!4897 thiss!1248)) (array_inv!1594 (_values!3105 thiss!1248)) e!102127))))

(declare-fun b!156158 () Bool)

(declare-fun res!73762 () Bool)

(declare-fun e!102129 () Bool)

(assert (=> b!156158 (=> (not res!73762) (not e!102129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156158 (= res!73762 (validMask!0 (mask!7567 thiss!1248)))))

(declare-fun b!156159 () Bool)

(declare-fun res!73760 () Bool)

(assert (=> b!156159 (=> (not res!73760) (not e!102129))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156159 (= res!73760 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156160 () Bool)

(assert (=> b!156160 (= e!102129 false)))

(declare-fun lt!81520 () Bool)

(declare-datatypes ((List!1848 0))(
  ( (Nil!1845) (Cons!1844 (h!2453 (_ BitVec 64)) (t!6650 List!1848)) )
))
(declare-fun arrayNoDuplicates!0 (array!5331 (_ BitVec 32) List!1848) Bool)

(assert (=> b!156160 (= lt!81520 (arrayNoDuplicates!0 (_keys!4897 thiss!1248) #b00000000000000000000000000000000 Nil!1845))))

(declare-fun b!156161 () Bool)

(declare-fun mapRes!5351 () Bool)

(assert (=> b!156161 (= e!102127 (and e!102128 mapRes!5351))))

(declare-fun condMapEmpty!5351 () Bool)

(declare-fun mapDefault!5351 () ValueCell!1226)

