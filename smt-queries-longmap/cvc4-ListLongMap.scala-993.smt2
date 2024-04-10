; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21416 () Bool)

(assert start!21416)

(declare-fun b!215149 () Bool)

(declare-fun b_free!5711 () Bool)

(declare-fun b_next!5711 () Bool)

(assert (=> b!215149 (= b_free!5711 (not b_next!5711))))

(declare-fun tp!20239 () Bool)

(declare-fun b_and!12601 () Bool)

(assert (=> b!215149 (= tp!20239 b_and!12601)))

(declare-fun b!215143 () Bool)

(declare-fun e!139958 () Bool)

(declare-fun tp_is_empty!5573 () Bool)

(assert (=> b!215143 (= e!139958 tp_is_empty!5573)))

(declare-fun mapIsEmpty!9494 () Bool)

(declare-fun mapRes!9494 () Bool)

(assert (=> mapIsEmpty!9494 mapRes!9494))

(declare-fun b!215144 () Bool)

(declare-fun res!105275 () Bool)

(declare-fun e!139955 () Bool)

(assert (=> b!215144 (=> (not res!105275) (not e!139955))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215144 (= res!105275 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215145 () Bool)

(declare-fun e!139959 () Bool)

(assert (=> b!215145 (= e!139955 e!139959)))

(declare-fun res!105274 () Bool)

(assert (=> b!215145 (=> (not res!105274) (not e!139959))))

(declare-datatypes ((SeekEntryResult!729 0))(
  ( (MissingZero!729 (index!5086 (_ BitVec 32))) (Found!729 (index!5087 (_ BitVec 32))) (Intermediate!729 (undefined!1541 Bool) (index!5088 (_ BitVec 32)) (x!22461 (_ BitVec 32))) (Undefined!729) (MissingVacant!729 (index!5089 (_ BitVec 32))) )
))
(declare-fun lt!110883 () SeekEntryResult!729)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215145 (= res!105274 (or (= lt!110883 (MissingZero!729 index!297)) (= lt!110883 (MissingVacant!729 index!297))))))

(declare-datatypes ((V!7077 0))(
  ( (V!7078 (val!2831 Int)) )
))
(declare-datatypes ((ValueCell!2443 0))(
  ( (ValueCellFull!2443 (v!4849 V!7077)) (EmptyCell!2443) )
))
(declare-datatypes ((array!10369 0))(
  ( (array!10370 (arr!4914 (Array (_ BitVec 32) ValueCell!2443)) (size!5242 (_ BitVec 32))) )
))
(declare-datatypes ((array!10371 0))(
  ( (array!10372 (arr!4915 (Array (_ BitVec 32) (_ BitVec 64))) (size!5243 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2786 0))(
  ( (LongMapFixedSize!2787 (defaultEntry!4043 Int) (mask!9729 (_ BitVec 32)) (extraKeys!3780 (_ BitVec 32)) (zeroValue!3884 V!7077) (minValue!3884 V!7077) (_size!1442 (_ BitVec 32)) (_keys!6069 array!10371) (_values!4026 array!10369) (_vacant!1442 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2786)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10371 (_ BitVec 32)) SeekEntryResult!729)

(assert (=> b!215145 (= lt!110883 (seekEntryOrOpen!0 key!932 (_keys!6069 thiss!1504) (mask!9729 thiss!1504)))))

(declare-fun b!215146 () Bool)

(assert (=> b!215146 (= e!139959 (not (= (size!5242 (_values!4026 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9729 thiss!1504)))))))

(declare-fun b!215147 () Bool)

(declare-fun e!139956 () Bool)

(declare-fun e!139961 () Bool)

(assert (=> b!215147 (= e!139956 (and e!139961 mapRes!9494))))

(declare-fun condMapEmpty!9494 () Bool)

(declare-fun mapDefault!9494 () ValueCell!2443)

