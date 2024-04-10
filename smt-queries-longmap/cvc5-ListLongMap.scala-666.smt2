; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16460 () Bool)

(assert start!16460)

(declare-fun b!163776 () Bool)

(declare-fun b_free!3805 () Bool)

(declare-fun b_next!3805 () Bool)

(assert (=> b!163776 (= b_free!3805 (not b_next!3805))))

(declare-fun tp!14006 () Bool)

(declare-fun b_and!10219 () Bool)

(assert (=> b!163776 (= tp!14006 b_and!10219)))

(declare-fun b!163771 () Bool)

(declare-fun e!107454 () Bool)

(declare-fun tp_is_empty!3607 () Bool)

(assert (=> b!163771 (= e!107454 tp_is_empty!3607)))

(declare-fun mapNonEmpty!6120 () Bool)

(declare-fun mapRes!6120 () Bool)

(declare-fun tp!14007 () Bool)

(assert (=> mapNonEmpty!6120 (= mapRes!6120 (and tp!14007 e!107454))))

(declare-datatypes ((V!4457 0))(
  ( (V!4458 (val!1848 Int)) )
))
(declare-datatypes ((ValueCell!1460 0))(
  ( (ValueCellFull!1460 (v!3713 V!4457)) (EmptyCell!1460) )
))
(declare-fun mapRest!6120 () (Array (_ BitVec 32) ValueCell!1460))

(declare-fun mapKey!6120 () (_ BitVec 32))

(declare-fun mapValue!6120 () ValueCell!1460)

(declare-datatypes ((array!6305 0))(
  ( (array!6306 (arr!2991 (Array (_ BitVec 32) (_ BitVec 64))) (size!3279 (_ BitVec 32))) )
))
(declare-datatypes ((array!6307 0))(
  ( (array!6308 (arr!2992 (Array (_ BitVec 32) ValueCell!1460)) (size!3280 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1828 0))(
  ( (LongMapFixedSize!1829 (defaultEntry!3356 Int) (mask!8028 (_ BitVec 32)) (extraKeys!3097 (_ BitVec 32)) (zeroValue!3199 V!4457) (minValue!3199 V!4457) (_size!963 (_ BitVec 32)) (_keys!5175 array!6305) (_values!3339 array!6307) (_vacant!963 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1828)

(assert (=> mapNonEmpty!6120 (= (arr!2992 (_values!3339 thiss!1248)) (store mapRest!6120 mapKey!6120 mapValue!6120))))

(declare-fun b!163772 () Bool)

(declare-fun res!77485 () Bool)

(declare-fun e!107452 () Bool)

(assert (=> b!163772 (=> (not res!77485) (not e!107452))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163772 (= res!77485 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163773 () Bool)

(declare-fun e!107456 () Bool)

(assert (=> b!163773 (= e!107456 tp_is_empty!3607)))

(declare-fun b!163774 () Bool)

(declare-fun e!107450 () Bool)

(assert (=> b!163774 (= e!107452 e!107450)))

(declare-fun res!77487 () Bool)

(assert (=> b!163774 (=> (not res!77487) (not e!107450))))

(declare-datatypes ((SeekEntryResult!403 0))(
  ( (MissingZero!403 (index!3780 (_ BitVec 32))) (Found!403 (index!3781 (_ BitVec 32))) (Intermediate!403 (undefined!1215 Bool) (index!3782 (_ BitVec 32)) (x!18159 (_ BitVec 32))) (Undefined!403) (MissingVacant!403 (index!3783 (_ BitVec 32))) )
))
(declare-fun lt!82765 () SeekEntryResult!403)

(assert (=> b!163774 (= res!77487 (and (not (is-Undefined!403 lt!82765)) (not (is-MissingVacant!403 lt!82765)) (not (is-MissingZero!403 lt!82765)) (is-Found!403 lt!82765)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6305 (_ BitVec 32)) SeekEntryResult!403)

(assert (=> b!163774 (= lt!82765 (seekEntryOrOpen!0 key!828 (_keys!5175 thiss!1248) (mask!8028 thiss!1248)))))

(declare-fun mapIsEmpty!6120 () Bool)

(assert (=> mapIsEmpty!6120 mapRes!6120))

(declare-fun b!163775 () Bool)

(declare-fun e!107455 () Bool)

(assert (=> b!163775 (= e!107455 (and e!107456 mapRes!6120))))

(declare-fun condMapEmpty!6120 () Bool)

(declare-fun mapDefault!6120 () ValueCell!1460)

