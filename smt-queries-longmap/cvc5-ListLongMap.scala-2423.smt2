; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38274 () Bool)

(assert start!38274)

(declare-fun b!394848 () Bool)

(declare-fun e!239048 () Bool)

(declare-datatypes ((List!6497 0))(
  ( (Nil!6494) (Cons!6493 (h!7349 (_ BitVec 64)) (t!11671 List!6497)) )
))
(declare-fun noDuplicate!193 (List!6497) Bool)

(assert (=> b!394848 (= e!239048 (not (noDuplicate!193 Nil!6494)))))

(declare-fun mapIsEmpty!16266 () Bool)

(declare-fun mapRes!16266 () Bool)

(assert (=> mapIsEmpty!16266 mapRes!16266))

(declare-fun b!394849 () Bool)

(declare-fun e!239050 () Bool)

(declare-fun e!239047 () Bool)

(assert (=> b!394849 (= e!239050 (and e!239047 mapRes!16266))))

(declare-fun condMapEmpty!16266 () Bool)

(declare-datatypes ((V!14139 0))(
  ( (V!14140 (val!4932 Int)) )
))
(declare-datatypes ((ValueCell!4544 0))(
  ( (ValueCellFull!4544 (v!7177 V!14139)) (EmptyCell!4544) )
))
(declare-datatypes ((array!23457 0))(
  ( (array!23458 (arr!11184 (Array (_ BitVec 32) ValueCell!4544)) (size!11536 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23457)

(declare-fun mapDefault!16266 () ValueCell!4544)

