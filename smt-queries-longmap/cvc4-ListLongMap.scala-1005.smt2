; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21634 () Bool)

(assert start!21634)

(declare-fun b!216936 () Bool)

(declare-fun b_free!5783 () Bool)

(declare-fun b_next!5783 () Bool)

(assert (=> b!216936 (= b_free!5783 (not b_next!5783))))

(declare-fun tp!20484 () Bool)

(declare-fun b_and!12673 () Bool)

(assert (=> b!216936 (= tp!20484 b_and!12673)))

(declare-fun b!216931 () Bool)

(declare-fun e!141132 () Bool)

(declare-fun e!141135 () Bool)

(assert (=> b!216931 (= e!141132 e!141135)))

(declare-fun res!106147 () Bool)

(assert (=> b!216931 (=> (not res!106147) (not e!141135))))

(declare-datatypes ((SeekEntryResult!755 0))(
  ( (MissingZero!755 (index!5190 (_ BitVec 32))) (Found!755 (index!5191 (_ BitVec 32))) (Intermediate!755 (undefined!1567 Bool) (index!5192 (_ BitVec 32)) (x!22683 (_ BitVec 32))) (Undefined!755) (MissingVacant!755 (index!5193 (_ BitVec 32))) )
))
(declare-fun lt!111254 () SeekEntryResult!755)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216931 (= res!106147 (or (= lt!111254 (MissingZero!755 index!297)) (= lt!111254 (MissingVacant!755 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7173 0))(
  ( (V!7174 (val!2867 Int)) )
))
(declare-datatypes ((ValueCell!2479 0))(
  ( (ValueCellFull!2479 (v!4885 V!7173)) (EmptyCell!2479) )
))
(declare-datatypes ((array!10529 0))(
  ( (array!10530 (arr!4986 (Array (_ BitVec 32) ValueCell!2479)) (size!5318 (_ BitVec 32))) )
))
(declare-datatypes ((array!10531 0))(
  ( (array!10532 (arr!4987 (Array (_ BitVec 32) (_ BitVec 64))) (size!5319 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2858 0))(
  ( (LongMapFixedSize!2859 (defaultEntry!4079 Int) (mask!9824 (_ BitVec 32)) (extraKeys!3816 (_ BitVec 32)) (zeroValue!3920 V!7173) (minValue!3920 V!7173) (_size!1478 (_ BitVec 32)) (_keys!6128 array!10531) (_values!4062 array!10529) (_vacant!1478 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2858)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10531 (_ BitVec 32)) SeekEntryResult!755)

(assert (=> b!216931 (= lt!111254 (seekEntryOrOpen!0 key!932 (_keys!6128 thiss!1504) (mask!9824 thiss!1504)))))

(declare-fun b!216932 () Bool)

(declare-fun res!106150 () Bool)

(assert (=> b!216932 (=> (not res!106150) (not e!141135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10531 (_ BitVec 32)) Bool)

(assert (=> b!216932 (= res!106150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6128 thiss!1504) (mask!9824 thiss!1504)))))

(declare-fun b!216933 () Bool)

(declare-fun res!106151 () Bool)

(assert (=> b!216933 (=> (not res!106151) (not e!141132))))

(assert (=> b!216933 (= res!106151 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216934 () Bool)

(declare-fun e!141133 () Bool)

(declare-fun tp_is_empty!5645 () Bool)

(assert (=> b!216934 (= e!141133 tp_is_empty!5645)))

(declare-fun b!216935 () Bool)

(declare-fun e!141134 () Bool)

(assert (=> b!216935 (= e!141134 tp_is_empty!5645)))

(declare-fun mapNonEmpty!9630 () Bool)

(declare-fun mapRes!9630 () Bool)

(declare-fun tp!20483 () Bool)

(assert (=> mapNonEmpty!9630 (= mapRes!9630 (and tp!20483 e!141134))))

(declare-fun mapValue!9630 () ValueCell!2479)

(declare-fun mapRest!9630 () (Array (_ BitVec 32) ValueCell!2479))

(declare-fun mapKey!9630 () (_ BitVec 32))

(assert (=> mapNonEmpty!9630 (= (arr!4986 (_values!4062 thiss!1504)) (store mapRest!9630 mapKey!9630 mapValue!9630))))

(declare-fun e!141136 () Bool)

(declare-fun e!141131 () Bool)

(declare-fun array_inv!3297 (array!10531) Bool)

(declare-fun array_inv!3298 (array!10529) Bool)

(assert (=> b!216936 (= e!141136 (and tp!20484 tp_is_empty!5645 (array_inv!3297 (_keys!6128 thiss!1504)) (array_inv!3298 (_values!4062 thiss!1504)) e!141131))))

(declare-fun res!106148 () Bool)

(assert (=> start!21634 (=> (not res!106148) (not e!141132))))

(declare-fun valid!1161 (LongMapFixedSize!2858) Bool)

(assert (=> start!21634 (= res!106148 (valid!1161 thiss!1504))))

(assert (=> start!21634 e!141132))

(assert (=> start!21634 e!141136))

(assert (=> start!21634 true))

(declare-fun b!216937 () Bool)

(assert (=> b!216937 (= e!141131 (and e!141133 mapRes!9630))))

(declare-fun condMapEmpty!9630 () Bool)

(declare-fun mapDefault!9630 () ValueCell!2479)

