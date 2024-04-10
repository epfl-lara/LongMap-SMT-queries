; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89466 () Bool)

(assert start!89466)

(declare-fun b!1025996 () Bool)

(declare-fun b_free!20465 () Bool)

(declare-fun b_next!20465 () Bool)

(assert (=> b!1025996 (= b_free!20465 (not b_next!20465))))

(declare-fun tp!72441 () Bool)

(declare-fun b_and!32711 () Bool)

(assert (=> b!1025996 (= tp!72441 b_and!32711)))

(declare-fun b!1025995 () Bool)

(declare-fun res!686867 () Bool)

(declare-fun e!578637 () Bool)

(assert (=> b!1025995 (=> (not res!686867) (not e!578637))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025995 (= res!686867 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025997 () Bool)

(declare-fun e!578634 () Bool)

(declare-fun tp_is_empty!24185 () Bool)

(assert (=> b!1025997 (= e!578634 tp_is_empty!24185)))

(declare-fun mapNonEmpty!37706 () Bool)

(declare-fun mapRes!37706 () Bool)

(declare-fun tp!72440 () Bool)

(assert (=> mapNonEmpty!37706 (= mapRes!37706 (and tp!72440 e!578634))))

(declare-fun mapKey!37706 () (_ BitVec 32))

(declare-datatypes ((V!37119 0))(
  ( (V!37120 (val!12143 Int)) )
))
(declare-datatypes ((ValueCell!11389 0))(
  ( (ValueCellFull!11389 (v!14712 V!37119)) (EmptyCell!11389) )
))
(declare-datatypes ((array!64420 0))(
  ( (array!64421 (arr!31019 (Array (_ BitVec 32) (_ BitVec 64))) (size!31532 (_ BitVec 32))) )
))
(declare-datatypes ((array!64422 0))(
  ( (array!64423 (arr!31020 (Array (_ BitVec 32) ValueCell!11389)) (size!31533 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5372 0))(
  ( (LongMapFixedSize!5373 (defaultEntry!6038 Int) (mask!29720 (_ BitVec 32)) (extraKeys!5770 (_ BitVec 32)) (zeroValue!5874 V!37119) (minValue!5874 V!37119) (_size!2741 (_ BitVec 32)) (_keys!11185 array!64420) (_values!6061 array!64422) (_vacant!2741 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5372)

(declare-fun mapValue!37706 () ValueCell!11389)

(declare-fun mapRest!37706 () (Array (_ BitVec 32) ValueCell!11389))

(assert (=> mapNonEmpty!37706 (= (arr!31020 (_values!6061 thiss!1427)) (store mapRest!37706 mapKey!37706 mapValue!37706))))

(declare-fun b!1025998 () Bool)

(declare-fun e!578633 () Bool)

(assert (=> b!1025998 (= e!578637 e!578633)))

(declare-fun res!686869 () Bool)

(assert (=> b!1025998 (=> (not res!686869) (not e!578633))))

(declare-datatypes ((SeekEntryResult!9636 0))(
  ( (MissingZero!9636 (index!40915 (_ BitVec 32))) (Found!9636 (index!40916 (_ BitVec 32))) (Intermediate!9636 (undefined!10448 Bool) (index!40917 (_ BitVec 32)) (x!91250 (_ BitVec 32))) (Undefined!9636) (MissingVacant!9636 (index!40918 (_ BitVec 32))) )
))
(declare-fun lt!451233 () SeekEntryResult!9636)

(assert (=> b!1025998 (= res!686869 (is-Found!9636 lt!451233))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64420 (_ BitVec 32)) SeekEntryResult!9636)

(assert (=> b!1025998 (= lt!451233 (seekEntry!0 key!909 (_keys!11185 thiss!1427) (mask!29720 thiss!1427)))))

(declare-fun b!1025999 () Bool)

(declare-fun e!578635 () Bool)

(assert (=> b!1025999 (= e!578635 tp_is_empty!24185)))

(declare-fun b!1026000 () Bool)

(declare-fun e!578631 () Bool)

(assert (=> b!1026000 (= e!578631 (and e!578635 mapRes!37706))))

(declare-fun condMapEmpty!37706 () Bool)

(declare-fun mapDefault!37706 () ValueCell!11389)

