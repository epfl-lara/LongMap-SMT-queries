; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21678 () Bool)

(assert start!21678)

(declare-fun b!217659 () Bool)

(declare-fun b_free!5827 () Bool)

(declare-fun b_next!5827 () Bool)

(assert (=> b!217659 (= b_free!5827 (not b_next!5827))))

(declare-fun tp!20615 () Bool)

(declare-fun b_and!12717 () Bool)

(assert (=> b!217659 (= tp!20615 b_and!12717)))

(declare-fun b!217657 () Bool)

(declare-fun res!106610 () Bool)

(declare-fun e!141597 () Bool)

(assert (=> b!217657 (=> (not res!106610) (not e!141597))))

(declare-datatypes ((V!7233 0))(
  ( (V!7234 (val!2889 Int)) )
))
(declare-datatypes ((ValueCell!2501 0))(
  ( (ValueCellFull!2501 (v!4907 V!7233)) (EmptyCell!2501) )
))
(declare-datatypes ((array!10617 0))(
  ( (array!10618 (arr!5030 (Array (_ BitVec 32) ValueCell!2501)) (size!5362 (_ BitVec 32))) )
))
(declare-datatypes ((array!10619 0))(
  ( (array!10620 (arr!5031 (Array (_ BitVec 32) (_ BitVec 64))) (size!5363 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2902 0))(
  ( (LongMapFixedSize!2903 (defaultEntry!4101 Int) (mask!9862 (_ BitVec 32)) (extraKeys!3838 (_ BitVec 32)) (zeroValue!3942 V!7233) (minValue!3942 V!7233) (_size!1500 (_ BitVec 32)) (_keys!6150 array!10619) (_values!4084 array!10617) (_vacant!1500 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2902)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10619 (_ BitVec 32)) Bool)

(assert (=> b!217657 (= res!106610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6150 thiss!1504) (mask!9862 thiss!1504)))))

(declare-fun b!217658 () Bool)

(declare-fun res!106613 () Bool)

(assert (=> b!217658 (=> (not res!106613) (not e!141597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217658 (= res!106613 (validMask!0 (mask!9862 thiss!1504)))))

(declare-fun res!106611 () Bool)

(declare-fun e!141592 () Bool)

(assert (=> start!21678 (=> (not res!106611) (not e!141592))))

(declare-fun valid!1177 (LongMapFixedSize!2902) Bool)

(assert (=> start!21678 (= res!106611 (valid!1177 thiss!1504))))

(assert (=> start!21678 e!141592))

(declare-fun e!141593 () Bool)

(assert (=> start!21678 e!141593))

(assert (=> start!21678 true))

(declare-fun e!141596 () Bool)

(declare-fun tp_is_empty!5689 () Bool)

(declare-fun array_inv!3331 (array!10619) Bool)

(declare-fun array_inv!3332 (array!10617) Bool)

(assert (=> b!217659 (= e!141593 (and tp!20615 tp_is_empty!5689 (array_inv!3331 (_keys!6150 thiss!1504)) (array_inv!3332 (_values!4084 thiss!1504)) e!141596))))

(declare-fun b!217660 () Bool)

(declare-fun res!106614 () Bool)

(assert (=> b!217660 (=> (not res!106614) (not e!141597))))

(assert (=> b!217660 (= res!106614 (and (= (size!5362 (_values!4084 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9862 thiss!1504))) (= (size!5363 (_keys!6150 thiss!1504)) (size!5362 (_values!4084 thiss!1504))) (bvsge (mask!9862 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3838 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3838 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217661 () Bool)

(declare-fun e!141594 () Bool)

(declare-fun mapRes!9696 () Bool)

(assert (=> b!217661 (= e!141596 (and e!141594 mapRes!9696))))

(declare-fun condMapEmpty!9696 () Bool)

(declare-fun mapDefault!9696 () ValueCell!2501)

