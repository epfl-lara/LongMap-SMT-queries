; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16464 () Bool)

(assert start!16464)

(declare-fun b!163832 () Bool)

(declare-fun b_free!3809 () Bool)

(declare-fun b_next!3809 () Bool)

(assert (=> b!163832 (= b_free!3809 (not b_next!3809))))

(declare-fun tp!14018 () Bool)

(declare-fun b_and!10223 () Bool)

(assert (=> b!163832 (= tp!14018 b_and!10223)))

(declare-fun b!163825 () Bool)

(declare-fun e!107492 () Bool)

(declare-fun tp_is_empty!3611 () Bool)

(assert (=> b!163825 (= e!107492 tp_is_empty!3611)))

(declare-fun b!163826 () Bool)

(declare-fun e!107495 () Bool)

(declare-datatypes ((V!4461 0))(
  ( (V!4462 (val!1850 Int)) )
))
(declare-datatypes ((ValueCell!1462 0))(
  ( (ValueCellFull!1462 (v!3715 V!4461)) (EmptyCell!1462) )
))
(declare-datatypes ((array!6313 0))(
  ( (array!6314 (arr!2995 (Array (_ BitVec 32) (_ BitVec 64))) (size!3283 (_ BitVec 32))) )
))
(declare-datatypes ((array!6315 0))(
  ( (array!6316 (arr!2996 (Array (_ BitVec 32) ValueCell!1462)) (size!3284 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1832 0))(
  ( (LongMapFixedSize!1833 (defaultEntry!3358 Int) (mask!8030 (_ BitVec 32)) (extraKeys!3099 (_ BitVec 32)) (zeroValue!3201 V!4461) (minValue!3201 V!4461) (_size!965 (_ BitVec 32)) (_keys!5177 array!6313) (_values!3341 array!6315) (_vacant!965 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1832)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6313 (_ BitVec 32)) Bool)

(assert (=> b!163826 (= e!107495 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5177 thiss!1248) (mask!8030 thiss!1248))))))

(declare-fun b!163827 () Bool)

(declare-fun e!107494 () Bool)

(assert (=> b!163827 (= e!107494 e!107495)))

(declare-fun res!77515 () Bool)

(assert (=> b!163827 (=> (not res!77515) (not e!107495))))

(declare-datatypes ((SeekEntryResult!405 0))(
  ( (MissingZero!405 (index!3788 (_ BitVec 32))) (Found!405 (index!3789 (_ BitVec 32))) (Intermediate!405 (undefined!1217 Bool) (index!3790 (_ BitVec 32)) (x!18161 (_ BitVec 32))) (Undefined!405) (MissingVacant!405 (index!3791 (_ BitVec 32))) )
))
(declare-fun lt!82771 () SeekEntryResult!405)

(assert (=> b!163827 (= res!77515 (and (not (is-Undefined!405 lt!82771)) (not (is-MissingVacant!405 lt!82771)) (not (is-MissingZero!405 lt!82771)) (is-Found!405 lt!82771)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6313 (_ BitVec 32)) SeekEntryResult!405)

(assert (=> b!163827 (= lt!82771 (seekEntryOrOpen!0 key!828 (_keys!5177 thiss!1248) (mask!8030 thiss!1248)))))

(declare-fun b!163828 () Bool)

(declare-fun res!77513 () Bool)

(assert (=> b!163828 (=> (not res!77513) (not e!107495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163828 (= res!77513 (validMask!0 (mask!8030 thiss!1248)))))

(declare-fun mapIsEmpty!6126 () Bool)

(declare-fun mapRes!6126 () Bool)

(assert (=> mapIsEmpty!6126 mapRes!6126))

(declare-fun b!163829 () Bool)

(declare-fun res!77516 () Bool)

(assert (=> b!163829 (=> (not res!77516) (not e!107495))))

(assert (=> b!163829 (= res!77516 (and (= (size!3284 (_values!3341 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8030 thiss!1248))) (= (size!3283 (_keys!5177 thiss!1248)) (size!3284 (_values!3341 thiss!1248))) (bvsge (mask!8030 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3099 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3099 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6126 () Bool)

(declare-fun tp!14019 () Bool)

(assert (=> mapNonEmpty!6126 (= mapRes!6126 (and tp!14019 e!107492))))

(declare-fun mapValue!6126 () ValueCell!1462)

(declare-fun mapKey!6126 () (_ BitVec 32))

(declare-fun mapRest!6126 () (Array (_ BitVec 32) ValueCell!1462))

(assert (=> mapNonEmpty!6126 (= (arr!2996 (_values!3341 thiss!1248)) (store mapRest!6126 mapKey!6126 mapValue!6126))))

(declare-fun b!163830 () Bool)

(declare-fun e!107497 () Bool)

(assert (=> b!163830 (= e!107497 tp_is_empty!3611)))

(declare-fun b!163831 () Bool)

(declare-fun e!107496 () Bool)

(assert (=> b!163831 (= e!107496 (and e!107497 mapRes!6126))))

(declare-fun condMapEmpty!6126 () Bool)

(declare-fun mapDefault!6126 () ValueCell!1462)

