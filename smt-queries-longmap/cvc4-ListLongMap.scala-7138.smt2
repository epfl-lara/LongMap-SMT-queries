; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90670 () Bool)

(assert start!90670)

(declare-fun b!1037034 () Bool)

(declare-fun b_free!20885 () Bool)

(declare-fun b_next!20885 () Bool)

(assert (=> b!1037034 (= b_free!20885 (not b_next!20885))))

(declare-fun tp!73793 () Bool)

(declare-fun b_and!33417 () Bool)

(assert (=> b!1037034 (= tp!73793 b_and!33417)))

(declare-fun b!1037030 () Bool)

(declare-fun e!586556 () Bool)

(declare-fun e!586555 () Bool)

(assert (=> b!1037030 (= e!586556 e!586555)))

(declare-fun res!692027 () Bool)

(assert (=> b!1037030 (=> res!692027 e!586555)))

(declare-datatypes ((SeekEntryResult!9749 0))(
  ( (MissingZero!9749 (index!41367 (_ BitVec 32))) (Found!9749 (index!41368 (_ BitVec 32))) (Intermediate!9749 (undefined!10561 Bool) (index!41369 (_ BitVec 32)) (x!92491 (_ BitVec 32))) (Undefined!9749) (MissingVacant!9749 (index!41370 (_ BitVec 32))) )
))
(declare-fun lt!457372 () SeekEntryResult!9749)

(declare-datatypes ((V!37679 0))(
  ( (V!37680 (val!12353 Int)) )
))
(declare-datatypes ((ValueCell!11599 0))(
  ( (ValueCellFull!11599 (v!14936 V!37679)) (EmptyCell!11599) )
))
(declare-datatypes ((array!65310 0))(
  ( (array!65311 (arr!31439 (Array (_ BitVec 32) (_ BitVec 64))) (size!31968 (_ BitVec 32))) )
))
(declare-datatypes ((array!65312 0))(
  ( (array!65313 (arr!31440 (Array (_ BitVec 32) ValueCell!11599)) (size!31969 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5792 0))(
  ( (LongMapFixedSize!5793 (defaultEntry!6278 Int) (mask!30184 (_ BitVec 32)) (extraKeys!6006 (_ BitVec 32)) (zeroValue!6112 V!37679) (minValue!6112 V!37679) (_size!2951 (_ BitVec 32)) (_keys!11469 array!65310) (_values!6301 array!65312) (_vacant!2951 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5792)

(assert (=> b!1037030 (= res!692027 (or (bvslt (index!41368 lt!457372) #b00000000000000000000000000000000) (bvsge (index!41368 lt!457372) (size!31968 (_keys!11469 thiss!1427)))))))

(declare-fun mapIsEmpty!38429 () Bool)

(declare-fun mapRes!38429 () Bool)

(assert (=> mapIsEmpty!38429 mapRes!38429))

(declare-fun b!1037031 () Bool)

(declare-fun res!692028 () Bool)

(declare-fun e!586551 () Bool)

(assert (=> b!1037031 (=> (not res!692028) (not e!586551))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037031 (= res!692028 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037032 () Bool)

(declare-fun res!692026 () Bool)

(assert (=> b!1037032 (=> res!692026 e!586555)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037032 (= res!692026 (not (validKeyInArray!0 (select (arr!31439 (_keys!11469 thiss!1427)) (index!41368 lt!457372)))))))

(declare-fun mapNonEmpty!38429 () Bool)

(declare-fun tp!73794 () Bool)

(declare-fun e!586557 () Bool)

(assert (=> mapNonEmpty!38429 (= mapRes!38429 (and tp!73794 e!586557))))

(declare-fun mapRest!38429 () (Array (_ BitVec 32) ValueCell!11599))

(declare-fun mapValue!38429 () ValueCell!11599)

(declare-fun mapKey!38429 () (_ BitVec 32))

(assert (=> mapNonEmpty!38429 (= (arr!31440 (_values!6301 thiss!1427)) (store mapRest!38429 mapKey!38429 mapValue!38429))))

(declare-fun b!1037033 () Bool)

(assert (=> b!1037033 (= e!586555 (bvsge (size!31968 (_keys!11469 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun e!586550 () Bool)

(declare-fun e!586552 () Bool)

(declare-fun tp_is_empty!24605 () Bool)

(declare-fun array_inv!24319 (array!65310) Bool)

(declare-fun array_inv!24320 (array!65312) Bool)

(assert (=> b!1037034 (= e!586550 (and tp!73793 tp_is_empty!24605 (array_inv!24319 (_keys!11469 thiss!1427)) (array_inv!24320 (_values!6301 thiss!1427)) e!586552))))

(declare-fun res!692030 () Bool)

(assert (=> start!90670 (=> (not res!692030) (not e!586551))))

(declare-fun valid!2185 (LongMapFixedSize!5792) Bool)

(assert (=> start!90670 (= res!692030 (valid!2185 thiss!1427))))

(assert (=> start!90670 e!586551))

(assert (=> start!90670 e!586550))

(assert (=> start!90670 true))

(declare-fun b!1037035 () Bool)

(assert (=> b!1037035 (= e!586557 tp_is_empty!24605)))

(declare-fun b!1037036 () Bool)

(assert (=> b!1037036 (= e!586551 e!586556)))

(declare-fun res!692029 () Bool)

(assert (=> b!1037036 (=> (not res!692029) (not e!586556))))

(assert (=> b!1037036 (= res!692029 (is-Found!9749 lt!457372))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65310 (_ BitVec 32)) SeekEntryResult!9749)

(assert (=> b!1037036 (= lt!457372 (seekEntry!0 key!909 (_keys!11469 thiss!1427) (mask!30184 thiss!1427)))))

(declare-fun b!1037037 () Bool)

(declare-fun e!586553 () Bool)

(assert (=> b!1037037 (= e!586552 (and e!586553 mapRes!38429))))

(declare-fun condMapEmpty!38429 () Bool)

(declare-fun mapDefault!38429 () ValueCell!11599)

