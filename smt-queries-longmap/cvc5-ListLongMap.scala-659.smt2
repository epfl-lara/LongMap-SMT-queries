; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16302 () Bool)

(assert start!16302)

(declare-fun b!162684 () Bool)

(declare-fun b_free!3763 () Bool)

(declare-fun b_next!3763 () Bool)

(assert (=> b!162684 (= b_free!3763 (not b_next!3763))))

(declare-fun tp!13859 () Bool)

(declare-fun b_and!10177 () Bool)

(assert (=> b!162684 (= tp!13859 b_and!10177)))

(declare-fun mapIsEmpty!6035 () Bool)

(declare-fun mapRes!6035 () Bool)

(assert (=> mapIsEmpty!6035 mapRes!6035))

(declare-fun b!162679 () Bool)

(declare-fun e!106679 () Bool)

(assert (=> b!162679 (= e!106679 false)))

(declare-fun lt!82522 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4401 0))(
  ( (V!4402 (val!1827 Int)) )
))
(declare-fun v!309 () V!4401)

(declare-datatypes ((ValueCell!1439 0))(
  ( (ValueCellFull!1439 (v!3692 V!4401)) (EmptyCell!1439) )
))
(declare-datatypes ((array!6209 0))(
  ( (array!6210 (arr!2949 (Array (_ BitVec 32) (_ BitVec 64))) (size!3233 (_ BitVec 32))) )
))
(declare-datatypes ((array!6211 0))(
  ( (array!6212 (arr!2950 (Array (_ BitVec 32) ValueCell!1439)) (size!3234 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1786 0))(
  ( (LongMapFixedSize!1787 (defaultEntry!3335 Int) (mask!7965 (_ BitVec 32)) (extraKeys!3076 (_ BitVec 32)) (zeroValue!3178 V!4401) (minValue!3178 V!4401) (_size!942 (_ BitVec 32)) (_keys!5136 array!6209) (_values!3318 array!6211) (_vacant!942 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1786)

(declare-datatypes ((SeekEntryResult!388 0))(
  ( (MissingZero!388 (index!3720 (_ BitVec 32))) (Found!388 (index!3721 (_ BitVec 32))) (Intermediate!388 (undefined!1200 Bool) (index!3722 (_ BitVec 32)) (x!18004 (_ BitVec 32))) (Undefined!388) (MissingVacant!388 (index!3723 (_ BitVec 32))) )
))
(declare-fun lt!82521 () SeekEntryResult!388)

(declare-fun valid!804 (LongMapFixedSize!1786) Bool)

(declare-datatypes ((tuple2!3008 0))(
  ( (tuple2!3009 (_1!1515 Bool) (_2!1515 LongMapFixedSize!1786)) )
))
(declare-fun updateHelperNewKey!84 (LongMapFixedSize!1786 (_ BitVec 64) V!4401 (_ BitVec 32)) tuple2!3008)

(assert (=> b!162679 (= lt!82522 (valid!804 (_2!1515 (updateHelperNewKey!84 thiss!1248 key!828 v!309 (index!3720 lt!82521)))))))

(declare-fun mapNonEmpty!6035 () Bool)

(declare-fun tp!13858 () Bool)

(declare-fun e!106683 () Bool)

(assert (=> mapNonEmpty!6035 (= mapRes!6035 (and tp!13858 e!106683))))

(declare-fun mapKey!6035 () (_ BitVec 32))

(declare-fun mapRest!6035 () (Array (_ BitVec 32) ValueCell!1439))

(declare-fun mapValue!6035 () ValueCell!1439)

(assert (=> mapNonEmpty!6035 (= (arr!2950 (_values!3318 thiss!1248)) (store mapRest!6035 mapKey!6035 mapValue!6035))))

(declare-fun b!162680 () Bool)

(declare-fun e!106678 () Bool)

(declare-fun e!106682 () Bool)

(assert (=> b!162680 (= e!106678 (and e!106682 mapRes!6035))))

(declare-fun condMapEmpty!6035 () Bool)

(declare-fun mapDefault!6035 () ValueCell!1439)

