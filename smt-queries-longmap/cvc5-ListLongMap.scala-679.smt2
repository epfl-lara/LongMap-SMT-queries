; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16578 () Bool)

(assert start!16578)

(declare-fun b!165214 () Bool)

(declare-fun b_free!3883 () Bool)

(declare-fun b_next!3883 () Bool)

(assert (=> b!165214 (= b_free!3883 (not b_next!3883))))

(declare-fun tp!14250 () Bool)

(declare-fun b_and!10297 () Bool)

(assert (=> b!165214 (= tp!14250 b_and!10297)))

(declare-fun b!165206 () Bool)

(declare-fun e!108379 () Bool)

(assert (=> b!165206 (= e!108379 false)))

(declare-fun lt!83029 () Bool)

(declare-datatypes ((V!4561 0))(
  ( (V!4562 (val!1887 Int)) )
))
(declare-datatypes ((ValueCell!1499 0))(
  ( (ValueCellFull!1499 (v!3752 V!4561)) (EmptyCell!1499) )
))
(declare-datatypes ((array!6467 0))(
  ( (array!6468 (arr!3069 (Array (_ BitVec 32) (_ BitVec 64))) (size!3357 (_ BitVec 32))) )
))
(declare-datatypes ((array!6469 0))(
  ( (array!6470 (arr!3070 (Array (_ BitVec 32) ValueCell!1499)) (size!3358 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1906 0))(
  ( (LongMapFixedSize!1907 (defaultEntry!3395 Int) (mask!8102 (_ BitVec 32)) (extraKeys!3136 (_ BitVec 32)) (zeroValue!3238 V!4561) (minValue!3238 V!4561) (_size!1002 (_ BitVec 32)) (_keys!5220 array!6467) (_values!3378 array!6469) (_vacant!1002 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1906)

(declare-datatypes ((List!2040 0))(
  ( (Nil!2037) (Cons!2036 (h!2653 (_ BitVec 64)) (t!6842 List!2040)) )
))
(declare-fun arrayNoDuplicates!0 (array!6467 (_ BitVec 32) List!2040) Bool)

(assert (=> b!165206 (= lt!83029 (arrayNoDuplicates!0 (_keys!5220 thiss!1248) #b00000000000000000000000000000000 Nil!2037))))

(declare-fun b!165207 () Bool)

(declare-fun res!78344 () Bool)

(assert (=> b!165207 (=> (not res!78344) (not e!108379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165207 (= res!78344 (validMask!0 (mask!8102 thiss!1248)))))

(declare-fun b!165208 () Bool)

(declare-fun e!108380 () Bool)

(declare-fun e!108374 () Bool)

(declare-fun mapRes!6246 () Bool)

(assert (=> b!165208 (= e!108380 (and e!108374 mapRes!6246))))

(declare-fun condMapEmpty!6246 () Bool)

(declare-fun mapDefault!6246 () ValueCell!1499)

