; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16602 () Bool)

(assert start!16602)

(declare-fun b!165602 () Bool)

(declare-fun b_free!3907 () Bool)

(declare-fun b_next!3907 () Bool)

(assert (=> b!165602 (= b_free!3907 (not b_next!3907))))

(declare-fun tp!14322 () Bool)

(declare-fun b_and!10321 () Bool)

(assert (=> b!165602 (= tp!14322 b_and!10321)))

(declare-fun e!108626 () Bool)

(declare-fun tp_is_empty!3709 () Bool)

(declare-fun e!108628 () Bool)

(declare-datatypes ((V!4593 0))(
  ( (V!4594 (val!1899 Int)) )
))
(declare-datatypes ((ValueCell!1511 0))(
  ( (ValueCellFull!1511 (v!3764 V!4593)) (EmptyCell!1511) )
))
(declare-datatypes ((array!6515 0))(
  ( (array!6516 (arr!3093 (Array (_ BitVec 32) (_ BitVec 64))) (size!3381 (_ BitVec 32))) )
))
(declare-datatypes ((array!6517 0))(
  ( (array!6518 (arr!3094 (Array (_ BitVec 32) ValueCell!1511)) (size!3382 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1930 0))(
  ( (LongMapFixedSize!1931 (defaultEntry!3407 Int) (mask!8122 (_ BitVec 32)) (extraKeys!3148 (_ BitVec 32)) (zeroValue!3250 V!4593) (minValue!3250 V!4593) (_size!1014 (_ BitVec 32)) (_keys!5232 array!6515) (_values!3390 array!6517) (_vacant!1014 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1930)

(declare-fun array_inv!1987 (array!6515) Bool)

(declare-fun array_inv!1988 (array!6517) Bool)

(assert (=> b!165602 (= e!108626 (and tp!14322 tp_is_empty!3709 (array_inv!1987 (_keys!5232 thiss!1248)) (array_inv!1988 (_values!3390 thiss!1248)) e!108628))))

(declare-fun b!165603 () Bool)

(declare-fun e!108630 () Bool)

(declare-fun e!108627 () Bool)

(assert (=> b!165603 (= e!108630 e!108627)))

(declare-fun res!78598 () Bool)

(assert (=> b!165603 (=> (not res!78598) (not e!108627))))

(declare-datatypes ((SeekEntryResult!439 0))(
  ( (MissingZero!439 (index!3924 (_ BitVec 32))) (Found!439 (index!3925 (_ BitVec 32))) (Intermediate!439 (undefined!1251 Bool) (index!3926 (_ BitVec 32)) (x!18355 (_ BitVec 32))) (Undefined!439) (MissingVacant!439 (index!3927 (_ BitVec 32))) )
))
(declare-fun lt!83101 () SeekEntryResult!439)

(assert (=> b!165603 (= res!78598 (and (not (is-Undefined!439 lt!83101)) (not (is-MissingVacant!439 lt!83101)) (not (is-MissingZero!439 lt!83101)) (is-Found!439 lt!83101)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6515 (_ BitVec 32)) SeekEntryResult!439)

(assert (=> b!165603 (= lt!83101 (seekEntryOrOpen!0 key!828 (_keys!5232 thiss!1248) (mask!8122 thiss!1248)))))

(declare-fun res!78599 () Bool)

(assert (=> start!16602 (=> (not res!78599) (not e!108630))))

(declare-fun valid!853 (LongMapFixedSize!1930) Bool)

(assert (=> start!16602 (= res!78599 (valid!853 thiss!1248))))

(assert (=> start!16602 e!108630))

(assert (=> start!16602 e!108626))

(assert (=> start!16602 true))

(declare-fun mapIsEmpty!6282 () Bool)

(declare-fun mapRes!6282 () Bool)

(assert (=> mapIsEmpty!6282 mapRes!6282))

(declare-fun b!165604 () Bool)

(declare-fun e!108632 () Bool)

(assert (=> b!165604 (= e!108628 (and e!108632 mapRes!6282))))

(declare-fun condMapEmpty!6282 () Bool)

(declare-fun mapDefault!6282 () ValueCell!1511)

