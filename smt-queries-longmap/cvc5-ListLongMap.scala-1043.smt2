; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21940 () Bool)

(assert start!21940)

(declare-fun b!223801 () Bool)

(declare-fun b_free!6007 () Bool)

(declare-fun b_next!6007 () Bool)

(assert (=> b!223801 (= b_free!6007 (not b_next!6007))))

(declare-fun tp!21163 () Bool)

(declare-fun b_and!12905 () Bool)

(assert (=> b!223801 (= tp!21163 b_and!12905)))

(declare-fun b!223797 () Bool)

(declare-fun e!145345 () Bool)

(declare-fun tp_is_empty!5869 () Bool)

(assert (=> b!223797 (= e!145345 tp_is_empty!5869)))

(declare-fun b!223798 () Bool)

(declare-fun res!110039 () Bool)

(declare-fun e!145353 () Bool)

(assert (=> b!223798 (=> (not res!110039) (not e!145353))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7473 0))(
  ( (V!7474 (val!2979 Int)) )
))
(declare-datatypes ((ValueCell!2591 0))(
  ( (ValueCellFull!2591 (v!4999 V!7473)) (EmptyCell!2591) )
))
(declare-datatypes ((array!10981 0))(
  ( (array!10982 (arr!5210 (Array (_ BitVec 32) ValueCell!2591)) (size!5543 (_ BitVec 32))) )
))
(declare-datatypes ((array!10983 0))(
  ( (array!10984 (arr!5211 (Array (_ BitVec 32) (_ BitVec 64))) (size!5544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3082 0))(
  ( (LongMapFixedSize!3083 (defaultEntry!4200 Int) (mask!10030 (_ BitVec 32)) (extraKeys!3937 (_ BitVec 32)) (zeroValue!4041 V!7473) (minValue!4041 V!7473) (_size!1590 (_ BitVec 32)) (_keys!6254 array!10983) (_values!4183 array!10981) (_vacant!1590 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3082)

(assert (=> b!223798 (= res!110039 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5544 (_keys!6254 thiss!1504)))))))

(declare-fun b!223799 () Bool)

(declare-fun res!110034 () Bool)

(declare-fun e!145355 () Bool)

(assert (=> b!223799 (=> (not res!110034) (not e!145355))))

(declare-fun call!20856 () Bool)

(assert (=> b!223799 (= res!110034 call!20856)))

(declare-fun e!145354 () Bool)

(assert (=> b!223799 (= e!145354 e!145355)))

(declare-fun b!223800 () Bool)

(declare-fun res!110047 () Bool)

(assert (=> b!223800 (=> (not res!110047) (not e!145355))))

(declare-datatypes ((SeekEntryResult!852 0))(
  ( (MissingZero!852 (index!5578 (_ BitVec 32))) (Found!852 (index!5579 (_ BitVec 32))) (Intermediate!852 (undefined!1664 Bool) (index!5580 (_ BitVec 32)) (x!23112 (_ BitVec 32))) (Undefined!852) (MissingVacant!852 (index!5581 (_ BitVec 32))) )
))
(declare-fun lt!112991 () SeekEntryResult!852)

(assert (=> b!223800 (= res!110047 (= (select (arr!5211 (_keys!6254 thiss!1504)) (index!5578 lt!112991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145359 () Bool)

(declare-fun e!145360 () Bool)

(declare-fun array_inv!3447 (array!10983) Bool)

(declare-fun array_inv!3448 (array!10981) Bool)

(assert (=> b!223801 (= e!145359 (and tp!21163 tp_is_empty!5869 (array_inv!3447 (_keys!6254 thiss!1504)) (array_inv!3448 (_values!4183 thiss!1504)) e!145360))))

(declare-fun b!223802 () Bool)

(declare-fun e!145358 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3326 0))(
  ( (Nil!3323) (Cons!3322 (h!3970 (_ BitVec 64)) (t!8285 List!3326)) )
))
(declare-fun contains!1546 (List!3326 (_ BitVec 64)) Bool)

(assert (=> b!223802 (= e!145358 (contains!1546 Nil!3323 key!932))))

(declare-fun b!223803 () Bool)

(declare-fun e!145344 () Bool)

(assert (=> b!223803 (= e!145344 (not (contains!1546 Nil!3323 key!932)))))

(declare-fun res!110031 () Bool)

(declare-fun e!145346 () Bool)

(assert (=> start!21940 (=> (not res!110031) (not e!145346))))

(declare-fun valid!1242 (LongMapFixedSize!3082) Bool)

(assert (=> start!21940 (= res!110031 (valid!1242 thiss!1504))))

(assert (=> start!21940 e!145346))

(assert (=> start!21940 e!145359))

(assert (=> start!21940 true))

(declare-fun b!223804 () Bool)

(declare-fun mapRes!9973 () Bool)

(assert (=> b!223804 (= e!145360 (and e!145345 mapRes!9973))))

(declare-fun condMapEmpty!9973 () Bool)

(declare-fun mapDefault!9973 () ValueCell!2591)

