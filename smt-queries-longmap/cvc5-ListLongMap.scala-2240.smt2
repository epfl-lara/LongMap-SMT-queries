; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36902 () Bool)

(assert start!36902)

(declare-fun b_free!8029 () Bool)

(declare-fun b_next!8029 () Bool)

(assert (=> start!36902 (= b_free!8029 (not b_next!8029))))

(declare-fun tp!28803 () Bool)

(declare-fun b_and!15271 () Bool)

(assert (=> start!36902 (= tp!28803 b_and!15271)))

(declare-fun b!369606 () Bool)

(declare-fun res!207381 () Bool)

(declare-fun e!225872 () Bool)

(assert (=> b!369606 (=> (not res!207381) (not e!225872))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369606 (= res!207381 (validKeyInArray!0 k!778))))

(declare-fun b!369607 () Bool)

(declare-fun e!225875 () Bool)

(declare-fun e!225870 () Bool)

(declare-fun mapRes!14580 () Bool)

(assert (=> b!369607 (= e!225875 (and e!225870 mapRes!14580))))

(declare-fun condMapEmpty!14580 () Bool)

(declare-datatypes ((V!12675 0))(
  ( (V!12676 (val!4383 Int)) )
))
(declare-datatypes ((ValueCell!3995 0))(
  ( (ValueCellFull!3995 (v!6580 V!12675)) (EmptyCell!3995) )
))
(declare-datatypes ((array!21303 0))(
  ( (array!21304 (arr!10120 (Array (_ BitVec 32) ValueCell!3995)) (size!10472 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21303)

(declare-fun mapDefault!14580 () ValueCell!3995)

