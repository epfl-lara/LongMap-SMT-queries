; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16276 () Bool)

(assert start!16276)

(declare-fun b!162375 () Bool)

(declare-fun b_free!3737 () Bool)

(declare-fun b_next!3737 () Bool)

(assert (=> b!162375 (= b_free!3737 (not b_next!3737))))

(declare-fun tp!13781 () Bool)

(declare-fun b_and!10151 () Bool)

(assert (=> b!162375 (= tp!13781 b_and!10151)))

(declare-fun res!76892 () Bool)

(declare-fun e!106388 () Bool)

(assert (=> start!16276 (=> (not res!76892) (not e!106388))))

(declare-datatypes ((V!4365 0))(
  ( (V!4366 (val!1814 Int)) )
))
(declare-datatypes ((ValueCell!1426 0))(
  ( (ValueCellFull!1426 (v!3679 V!4365)) (EmptyCell!1426) )
))
(declare-datatypes ((array!6157 0))(
  ( (array!6158 (arr!2923 (Array (_ BitVec 32) (_ BitVec 64))) (size!3207 (_ BitVec 32))) )
))
(declare-datatypes ((array!6159 0))(
  ( (array!6160 (arr!2924 (Array (_ BitVec 32) ValueCell!1426)) (size!3208 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1760 0))(
  ( (LongMapFixedSize!1761 (defaultEntry!3322 Int) (mask!7942 (_ BitVec 32)) (extraKeys!3063 (_ BitVec 32)) (zeroValue!3165 V!4365) (minValue!3165 V!4365) (_size!929 (_ BitVec 32)) (_keys!5123 array!6157) (_values!3305 array!6159) (_vacant!929 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1760)

(declare-fun valid!796 (LongMapFixedSize!1760) Bool)

(assert (=> start!16276 (= res!76892 (valid!796 thiss!1248))))

(assert (=> start!16276 e!106388))

(declare-fun e!106391 () Bool)

(assert (=> start!16276 e!106391))

(assert (=> start!16276 true))

(declare-fun b!162371 () Bool)

(declare-fun e!106392 () Bool)

(declare-fun e!106390 () Bool)

(declare-fun mapRes!5996 () Bool)

(assert (=> b!162371 (= e!106392 (and e!106390 mapRes!5996))))

(declare-fun condMapEmpty!5996 () Bool)

(declare-fun mapDefault!5996 () ValueCell!1426)

