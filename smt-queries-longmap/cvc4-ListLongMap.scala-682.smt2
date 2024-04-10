; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16600 () Bool)

(assert start!16600)

(declare-fun b!165575 () Bool)

(declare-fun b_free!3905 () Bool)

(declare-fun b_next!3905 () Bool)

(assert (=> b!165575 (= b_free!3905 (not b_next!3905))))

(declare-fun tp!14315 () Bool)

(declare-fun b_and!10319 () Bool)

(assert (=> b!165575 (= tp!14315 b_and!10319)))

(declare-fun b!165569 () Bool)

(declare-fun res!78575 () Bool)

(declare-fun e!108609 () Bool)

(assert (=> b!165569 (=> (not res!78575) (not e!108609))))

(declare-datatypes ((V!4589 0))(
  ( (V!4590 (val!1898 Int)) )
))
(declare-datatypes ((ValueCell!1510 0))(
  ( (ValueCellFull!1510 (v!3763 V!4589)) (EmptyCell!1510) )
))
(declare-datatypes ((array!6511 0))(
  ( (array!6512 (arr!3091 (Array (_ BitVec 32) (_ BitVec 64))) (size!3379 (_ BitVec 32))) )
))
(declare-datatypes ((array!6513 0))(
  ( (array!6514 (arr!3092 (Array (_ BitVec 32) ValueCell!1510)) (size!3380 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1928 0))(
  ( (LongMapFixedSize!1929 (defaultEntry!3406 Int) (mask!8119 (_ BitVec 32)) (extraKeys!3147 (_ BitVec 32)) (zeroValue!3249 V!4589) (minValue!3249 V!4589) (_size!1013 (_ BitVec 32)) (_keys!5231 array!6511) (_values!3389 array!6513) (_vacant!1013 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1928)

(assert (=> b!165569 (= res!78575 (and (= (size!3380 (_values!3389 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8119 thiss!1248))) (= (size!3379 (_keys!5231 thiss!1248)) (size!3380 (_values!3389 thiss!1248))) (bvsge (mask!8119 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3147 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3147 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165570 () Bool)

(assert (=> b!165570 (= e!108609 false)))

(declare-fun lt!83094 () Bool)

(declare-datatypes ((List!2060 0))(
  ( (Nil!2057) (Cons!2056 (h!2673 (_ BitVec 64)) (t!6862 List!2060)) )
))
(declare-fun arrayNoDuplicates!0 (array!6511 (_ BitVec 32) List!2060) Bool)

(assert (=> b!165570 (= lt!83094 (arrayNoDuplicates!0 (_keys!5231 thiss!1248) #b00000000000000000000000000000000 Nil!2057))))

(declare-fun b!165571 () Bool)

(declare-fun e!108608 () Bool)

(declare-fun tp_is_empty!3707 () Bool)

(assert (=> b!165571 (= e!108608 tp_is_empty!3707)))

(declare-fun b!165572 () Bool)

(declare-fun res!78574 () Bool)

(declare-fun e!108610 () Bool)

(assert (=> b!165572 (=> (not res!78574) (not e!108610))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165572 (= res!78574 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165573 () Bool)

(declare-fun e!108605 () Bool)

(declare-fun e!108611 () Bool)

(declare-fun mapRes!6279 () Bool)

(assert (=> b!165573 (= e!108605 (and e!108611 mapRes!6279))))

(declare-fun condMapEmpty!6279 () Bool)

(declare-fun mapDefault!6279 () ValueCell!1510)

