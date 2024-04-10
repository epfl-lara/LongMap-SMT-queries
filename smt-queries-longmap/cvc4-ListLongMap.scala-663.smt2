; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16388 () Bool)

(assert start!16388)

(declare-fun b!163304 () Bool)

(declare-fun b_free!3791 () Bool)

(declare-fun b_next!3791 () Bool)

(assert (=> b!163304 (= b_free!3791 (not b_next!3791))))

(declare-fun tp!13954 () Bool)

(declare-fun b_and!10205 () Bool)

(assert (=> b!163304 (= tp!13954 b_and!10205)))

(declare-fun res!77297 () Bool)

(declare-fun e!107138 () Bool)

(assert (=> start!16388 (=> (not res!77297) (not e!107138))))

(declare-datatypes ((V!4437 0))(
  ( (V!4438 (val!1841 Int)) )
))
(declare-datatypes ((ValueCell!1453 0))(
  ( (ValueCellFull!1453 (v!3706 V!4437)) (EmptyCell!1453) )
))
(declare-datatypes ((array!6271 0))(
  ( (array!6272 (arr!2977 (Array (_ BitVec 32) (_ BitVec 64))) (size!3263 (_ BitVec 32))) )
))
(declare-datatypes ((array!6273 0))(
  ( (array!6274 (arr!2978 (Array (_ BitVec 32) ValueCell!1453)) (size!3264 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1814 0))(
  ( (LongMapFixedSize!1815 (defaultEntry!3349 Int) (mask!8001 (_ BitVec 32)) (extraKeys!3090 (_ BitVec 32)) (zeroValue!3192 V!4437) (minValue!3192 V!4437) (_size!956 (_ BitVec 32)) (_keys!5159 array!6271) (_values!3332 array!6273) (_vacant!956 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1814)

(declare-fun valid!814 (LongMapFixedSize!1814) Bool)

(assert (=> start!16388 (= res!77297 (valid!814 thiss!1248))))

(assert (=> start!16388 e!107138))

(declare-fun e!107143 () Bool)

(assert (=> start!16388 e!107143))

(assert (=> start!16388 true))

(declare-fun b!163300 () Bool)

(declare-fun e!107137 () Bool)

(assert (=> b!163300 (= e!107138 e!107137)))

(declare-fun res!77298 () Bool)

(assert (=> b!163300 (=> (not res!77298) (not e!107137))))

(declare-datatypes ((SeekEntryResult!398 0))(
  ( (MissingZero!398 (index!3760 (_ BitVec 32))) (Found!398 (index!3761 (_ BitVec 32))) (Intermediate!398 (undefined!1210 Bool) (index!3762 (_ BitVec 32)) (x!18088 (_ BitVec 32))) (Undefined!398) (MissingVacant!398 (index!3763 (_ BitVec 32))) )
))
(declare-fun lt!82657 () SeekEntryResult!398)

(assert (=> b!163300 (= res!77298 (and (not (is-Undefined!398 lt!82657)) (not (is-MissingVacant!398 lt!82657)) (not (is-MissingZero!398 lt!82657)) (is-Found!398 lt!82657)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6271 (_ BitVec 32)) SeekEntryResult!398)

(assert (=> b!163300 (= lt!82657 (seekEntryOrOpen!0 key!828 (_keys!5159 thiss!1248) (mask!8001 thiss!1248)))))

(declare-fun b!163301 () Bool)

(declare-fun res!77299 () Bool)

(assert (=> b!163301 (=> (not res!77299) (not e!107137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163301 (= res!77299 (validMask!0 (mask!8001 thiss!1248)))))

(declare-fun b!163302 () Bool)

(declare-fun res!77296 () Bool)

(assert (=> b!163302 (=> (not res!77296) (not e!107138))))

(assert (=> b!163302 (= res!77296 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163303 () Bool)

(declare-fun e!107142 () Bool)

(declare-fun tp_is_empty!3593 () Bool)

(assert (=> b!163303 (= e!107142 tp_is_empty!3593)))

(declare-fun e!107140 () Bool)

(declare-fun array_inv!1905 (array!6271) Bool)

(declare-fun array_inv!1906 (array!6273) Bool)

(assert (=> b!163304 (= e!107143 (and tp!13954 tp_is_empty!3593 (array_inv!1905 (_keys!5159 thiss!1248)) (array_inv!1906 (_values!3332 thiss!1248)) e!107140))))

(declare-fun mapIsEmpty!6088 () Bool)

(declare-fun mapRes!6088 () Bool)

(assert (=> mapIsEmpty!6088 mapRes!6088))

(declare-fun b!163305 () Bool)

(assert (=> b!163305 (= e!107140 (and e!107142 mapRes!6088))))

(declare-fun condMapEmpty!6088 () Bool)

(declare-fun mapDefault!6088 () ValueCell!1453)

