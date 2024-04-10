; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36972 () Bool)

(assert start!36972)

(declare-fun b_free!8099 () Bool)

(declare-fun b_next!8099 () Bool)

(assert (=> start!36972 (= b_free!8099 (not b_next!8099))))

(declare-fun tp!29012 () Bool)

(declare-fun b_and!15341 () Bool)

(assert (=> start!36972 (= tp!29012 b_and!15341)))

(declare-fun b!370970 () Bool)

(declare-fun res!208431 () Bool)

(declare-fun e!226500 () Bool)

(assert (=> b!370970 (=> (not res!208431) (not e!226500))))

(declare-datatypes ((array!21437 0))(
  ( (array!21438 (arr!10187 (Array (_ BitVec 32) (_ BitVec 64))) (size!10539 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21437)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370970 (= res!208431 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370971 () Bool)

(declare-fun res!208430 () Bool)

(assert (=> b!370971 (=> (not res!208430) (not e!226500))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21437 (_ BitVec 32)) Bool)

(assert (=> b!370971 (= res!208430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370972 () Bool)

(declare-fun e!226505 () Bool)

(declare-fun e!226504 () Bool)

(declare-fun mapRes!14685 () Bool)

(assert (=> b!370972 (= e!226505 (and e!226504 mapRes!14685))))

(declare-fun condMapEmpty!14685 () Bool)

(declare-datatypes ((V!12767 0))(
  ( (V!12768 (val!4418 Int)) )
))
(declare-datatypes ((ValueCell!4030 0))(
  ( (ValueCellFull!4030 (v!6615 V!12767)) (EmptyCell!4030) )
))
(declare-datatypes ((array!21439 0))(
  ( (array!21440 (arr!10188 (Array (_ BitVec 32) ValueCell!4030)) (size!10540 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21439)

(declare-fun mapDefault!14685 () ValueCell!4030)

