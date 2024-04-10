; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16614 () Bool)

(assert start!16614)

(declare-fun b!165805 () Bool)

(declare-fun b_free!3919 () Bool)

(declare-fun b_next!3919 () Bool)

(assert (=> b!165805 (= b_free!3919 (not b_next!3919))))

(declare-fun tp!14358 () Bool)

(declare-fun b_and!10333 () Bool)

(assert (=> b!165805 (= tp!14358 b_and!10333)))

(declare-fun b!165800 () Bool)

(declare-fun e!108754 () Bool)

(assert (=> b!165800 (= e!108754 false)))

(declare-fun lt!83137 () Bool)

(declare-datatypes ((V!4609 0))(
  ( (V!4610 (val!1905 Int)) )
))
(declare-datatypes ((ValueCell!1517 0))(
  ( (ValueCellFull!1517 (v!3770 V!4609)) (EmptyCell!1517) )
))
(declare-datatypes ((array!6539 0))(
  ( (array!6540 (arr!3105 (Array (_ BitVec 32) (_ BitVec 64))) (size!3393 (_ BitVec 32))) )
))
(declare-datatypes ((array!6541 0))(
  ( (array!6542 (arr!3106 (Array (_ BitVec 32) ValueCell!1517)) (size!3394 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1942 0))(
  ( (LongMapFixedSize!1943 (defaultEntry!3413 Int) (mask!8132 (_ BitVec 32)) (extraKeys!3154 (_ BitVec 32)) (zeroValue!3256 V!4609) (minValue!3256 V!4609) (_size!1020 (_ BitVec 32)) (_keys!5238 array!6539) (_values!3396 array!6541) (_vacant!1020 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1942)

(declare-datatypes ((List!2069 0))(
  ( (Nil!2066) (Cons!2065 (h!2682 (_ BitVec 64)) (t!6871 List!2069)) )
))
(declare-fun arrayNoDuplicates!0 (array!6539 (_ BitVec 32) List!2069) Bool)

(assert (=> b!165800 (= lt!83137 (arrayNoDuplicates!0 (_keys!5238 thiss!1248) #b00000000000000000000000000000000 Nil!2066))))

(declare-fun b!165801 () Bool)

(declare-fun e!108752 () Bool)

(declare-fun tp_is_empty!3721 () Bool)

(assert (=> b!165801 (= e!108752 tp_is_empty!3721)))

(declare-fun mapIsEmpty!6300 () Bool)

(declare-fun mapRes!6300 () Bool)

(assert (=> mapIsEmpty!6300 mapRes!6300))

(declare-fun b!165802 () Bool)

(declare-fun e!108757 () Bool)

(assert (=> b!165802 (= e!108757 tp_is_empty!3721)))

(declare-fun res!78722 () Bool)

(declare-fun e!108753 () Bool)

(assert (=> start!16614 (=> (not res!78722) (not e!108753))))

(declare-fun valid!857 (LongMapFixedSize!1942) Bool)

(assert (=> start!16614 (= res!78722 (valid!857 thiss!1248))))

(assert (=> start!16614 e!108753))

(declare-fun e!108758 () Bool)

(assert (=> start!16614 e!108758))

(assert (=> start!16614 true))

(declare-fun b!165803 () Bool)

(declare-fun res!78721 () Bool)

(assert (=> b!165803 (=> (not res!78721) (not e!108754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165803 (= res!78721 (validMask!0 (mask!8132 thiss!1248)))))

(declare-fun b!165804 () Bool)

(declare-fun e!108755 () Bool)

(assert (=> b!165804 (= e!108755 (and e!108752 mapRes!6300))))

(declare-fun condMapEmpty!6300 () Bool)

(declare-fun mapDefault!6300 () ValueCell!1517)

