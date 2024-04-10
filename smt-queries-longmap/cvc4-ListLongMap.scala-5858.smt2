; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75682 () Bool)

(assert start!75682)

(declare-fun b!889825 () Bool)

(declare-fun b_free!15653 () Bool)

(declare-fun b_next!15653 () Bool)

(assert (=> b!889825 (= b_free!15653 (not b_next!15653))))

(declare-fun tp!54927 () Bool)

(declare-fun b_and!25893 () Bool)

(assert (=> b!889825 (= tp!54927 b_and!25893)))

(declare-fun b!889822 () Bool)

(declare-fun e!496088 () Bool)

(declare-fun e!496089 () Bool)

(assert (=> b!889822 (= e!496088 e!496089)))

(declare-fun res!602995 () Bool)

(assert (=> b!889822 (=> (not res!602995) (not e!496089))))

(declare-datatypes ((array!51942 0))(
  ( (array!51943 (arr!24977 (Array (_ BitVec 32) (_ BitVec 64))) (size!25421 (_ BitVec 32))) )
))
(declare-datatypes ((V!28939 0))(
  ( (V!28940 (val!9041 Int)) )
))
(declare-datatypes ((ValueCell!8509 0))(
  ( (ValueCellFull!8509 (v!11519 V!28939)) (EmptyCell!8509) )
))
(declare-datatypes ((array!51944 0))(
  ( (array!51945 (arr!24978 (Array (_ BitVec 32) ValueCell!8509)) (size!25422 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4034 0))(
  ( (LongMapFixedSize!4035 (defaultEntry!5214 Int) (mask!25671 (_ BitVec 32)) (extraKeys!4908 (_ BitVec 32)) (zeroValue!5012 V!28939) (minValue!5012 V!28939) (_size!2072 (_ BitVec 32)) (_keys!9897 array!51942) (_values!5199 array!51944) (_vacant!2072 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4034)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889822 (= res!602995 (validMask!0 (mask!25671 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8784 0))(
  ( (MissingZero!8784 (index!37507 (_ BitVec 32))) (Found!8784 (index!37508 (_ BitVec 32))) (Intermediate!8784 (undefined!9596 Bool) (index!37509 (_ BitVec 32)) (x!75560 (_ BitVec 32))) (Undefined!8784) (MissingVacant!8784 (index!37510 (_ BitVec 32))) )
))
(declare-fun lt!402118 () SeekEntryResult!8784)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51942 (_ BitVec 32)) SeekEntryResult!8784)

(assert (=> b!889822 (= lt!402118 (seekEntry!0 key!785 (_keys!9897 thiss!1181) (mask!25671 thiss!1181)))))

(declare-fun b!889823 () Bool)

(declare-fun e!496083 () Bool)

(declare-fun tp_is_empty!17981 () Bool)

(assert (=> b!889823 (= e!496083 tp_is_empty!17981)))

(declare-fun b!889824 () Bool)

(declare-fun e!496085 () Bool)

(declare-fun mapRes!28526 () Bool)

(assert (=> b!889824 (= e!496085 (and e!496083 mapRes!28526))))

(declare-fun condMapEmpty!28526 () Bool)

(declare-fun mapDefault!28526 () ValueCell!8509)

