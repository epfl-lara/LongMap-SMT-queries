; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23212 () Bool)

(assert start!23212)

(declare-fun b!243529 () Bool)

(declare-fun b_free!6523 () Bool)

(declare-fun b_next!6523 () Bool)

(assert (=> b!243529 (= b_free!6523 (not b_next!6523))))

(declare-fun tp!22792 () Bool)

(declare-fun b_and!13505 () Bool)

(assert (=> b!243529 (= tp!22792 b_and!13505)))

(declare-fun b!243511 () Bool)

(declare-fun res!119363 () Bool)

(declare-fun e!158041 () Bool)

(assert (=> b!243511 (=> (not res!119363) (not e!158041))))

(declare-datatypes ((List!3646 0))(
  ( (Nil!3643) (Cons!3642 (h!4299 (_ BitVec 64)) (t!8653 List!3646)) )
))
(declare-fun noDuplicate!96 (List!3646) Bool)

(assert (=> b!243511 (= res!119363 (noDuplicate!96 Nil!3643))))

(declare-fun mapNonEmpty!10828 () Bool)

(declare-fun mapRes!10828 () Bool)

(declare-fun tp!22791 () Bool)

(declare-fun e!158036 () Bool)

(assert (=> mapNonEmpty!10828 (= mapRes!10828 (and tp!22791 e!158036))))

(declare-datatypes ((V!8161 0))(
  ( (V!8162 (val!3237 Int)) )
))
(declare-datatypes ((ValueCell!2849 0))(
  ( (ValueCellFull!2849 (v!5284 V!8161)) (EmptyCell!2849) )
))
(declare-fun mapValue!10828 () ValueCell!2849)

(declare-fun mapRest!10828 () (Array (_ BitVec 32) ValueCell!2849))

(declare-datatypes ((array!12061 0))(
  ( (array!12062 (arr!5726 (Array (_ BitVec 32) ValueCell!2849)) (size!6068 (_ BitVec 32))) )
))
(declare-datatypes ((array!12063 0))(
  ( (array!12064 (arr!5727 (Array (_ BitVec 32) (_ BitVec 64))) (size!6069 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3598 0))(
  ( (LongMapFixedSize!3599 (defaultEntry!4512 Int) (mask!10605 (_ BitVec 32)) (extraKeys!4249 (_ BitVec 32)) (zeroValue!4353 V!8161) (minValue!4353 V!8161) (_size!1848 (_ BitVec 32)) (_keys!6623 array!12063) (_values!4495 array!12061) (_vacant!1848 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3598)

(declare-fun mapKey!10828 () (_ BitVec 32))

(assert (=> mapNonEmpty!10828 (= (arr!5726 (_values!4495 thiss!1504)) (store mapRest!10828 mapKey!10828 mapValue!10828))))

(declare-fun b!243512 () Bool)

(declare-fun res!119359 () Bool)

(declare-datatypes ((SeekEntryResult!1072 0))(
  ( (MissingZero!1072 (index!6458 (_ BitVec 32))) (Found!1072 (index!6459 (_ BitVec 32))) (Intermediate!1072 (undefined!1884 Bool) (index!6460 (_ BitVec 32)) (x!24332 (_ BitVec 32))) (Undefined!1072) (MissingVacant!1072 (index!6461 (_ BitVec 32))) )
))
(declare-fun lt!122215 () SeekEntryResult!1072)

(assert (=> b!243512 (= res!119359 (= (select (arr!5727 (_keys!6623 thiss!1504)) (index!6461 lt!122215)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158035 () Bool)

(assert (=> b!243512 (=> (not res!119359) (not e!158035))))

(declare-fun res!119371 () Bool)

(declare-fun e!158032 () Bool)

(assert (=> start!23212 (=> (not res!119371) (not e!158032))))

(declare-fun valid!1410 (LongMapFixedSize!3598) Bool)

(assert (=> start!23212 (= res!119371 (valid!1410 thiss!1504))))

(assert (=> start!23212 e!158032))

(declare-fun e!158034 () Bool)

(assert (=> start!23212 e!158034))

(assert (=> start!23212 true))

(declare-fun bm!22709 () Bool)

(declare-fun call!22713 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22709 (= call!22713 (arrayContainsKey!0 (_keys!6623 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243513 () Bool)

(assert (=> b!243513 (= e!158041 false)))

(declare-fun lt!122216 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12063 (_ BitVec 32) List!3646) Bool)

(assert (=> b!243513 (= lt!122216 (arrayNoDuplicates!0 (_keys!6623 thiss!1504) #b00000000000000000000000000000000 Nil!3643))))

(declare-fun b!243514 () Bool)

(assert (=> b!243514 (= e!158035 (not call!22713))))

(declare-fun b!243515 () Bool)

(declare-fun e!158031 () Bool)

(declare-fun e!158028 () Bool)

(assert (=> b!243515 (= e!158031 (and e!158028 mapRes!10828))))

(declare-fun condMapEmpty!10828 () Bool)

(declare-fun mapDefault!10828 () ValueCell!2849)

