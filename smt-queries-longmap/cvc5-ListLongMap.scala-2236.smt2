; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36878 () Bool)

(assert start!36878)

(declare-fun b_free!8005 () Bool)

(declare-fun b_next!8005 () Bool)

(assert (=> start!36878 (= b_free!8005 (not b_next!8005))))

(declare-fun tp!28730 () Bool)

(declare-fun b_and!15247 () Bool)

(assert (=> start!36878 (= tp!28730 b_and!15247)))

(declare-fun b!369138 () Bool)

(declare-fun res!207023 () Bool)

(declare-fun e!225656 () Bool)

(assert (=> b!369138 (=> (not res!207023) (not e!225656))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369138 (= res!207023 (validKeyInArray!0 k!778))))

(declare-fun b!369139 () Bool)

(declare-fun e!225659 () Bool)

(declare-fun e!225655 () Bool)

(declare-fun mapRes!14544 () Bool)

(assert (=> b!369139 (= e!225659 (and e!225655 mapRes!14544))))

(declare-fun condMapEmpty!14544 () Bool)

(declare-datatypes ((V!12643 0))(
  ( (V!12644 (val!4371 Int)) )
))
(declare-datatypes ((ValueCell!3983 0))(
  ( (ValueCellFull!3983 (v!6568 V!12643)) (EmptyCell!3983) )
))
(declare-datatypes ((array!21259 0))(
  ( (array!21260 (arr!10098 (Array (_ BitVec 32) ValueCell!3983)) (size!10450 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21259)

(declare-fun mapDefault!14544 () ValueCell!3983)

