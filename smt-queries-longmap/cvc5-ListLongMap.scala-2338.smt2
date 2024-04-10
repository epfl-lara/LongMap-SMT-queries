; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37490 () Bool)

(assert start!37490)

(declare-fun b_free!8617 () Bool)

(declare-fun b_next!8617 () Bool)

(assert (=> start!37490 (= b_free!8617 (not b_next!8617))))

(declare-fun tp!30566 () Bool)

(declare-fun b_and!15859 () Bool)

(assert (=> start!37490 (= tp!30566 b_and!15859)))

(declare-fun b!382234 () Bool)

(declare-fun res!217368 () Bool)

(declare-fun e!232299 () Bool)

(assert (=> b!382234 (=> (not res!217368) (not e!232299))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382234 (= res!217368 (validKeyInArray!0 k!778))))

(declare-fun b!382235 () Bool)

(declare-fun res!217370 () Bool)

(assert (=> b!382235 (=> (not res!217370) (not e!232299))))

(declare-datatypes ((array!22439 0))(
  ( (array!22440 (arr!10688 (Array (_ BitVec 32) (_ BitVec 64))) (size!11040 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22439)

(declare-fun arrayContainsKey!0 (array!22439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382235 (= res!217370 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382236 () Bool)

(declare-fun res!217367 () Bool)

(declare-fun e!232298 () Bool)

(assert (=> b!382236 (=> (not res!217367) (not e!232298))))

(declare-fun lt!179297 () array!22439)

(declare-datatypes ((List!6118 0))(
  ( (Nil!6115) (Cons!6114 (h!6970 (_ BitVec 64)) (t!11268 List!6118)) )
))
(declare-fun arrayNoDuplicates!0 (array!22439 (_ BitVec 32) List!6118) Bool)

(assert (=> b!382236 (= res!217367 (arrayNoDuplicates!0 lt!179297 #b00000000000000000000000000000000 Nil!6115))))

(declare-fun b!382237 () Bool)

(declare-fun e!232302 () Bool)

(declare-fun e!232304 () Bool)

(declare-fun mapRes!15462 () Bool)

(assert (=> b!382237 (= e!232302 (and e!232304 mapRes!15462))))

(declare-fun condMapEmpty!15462 () Bool)

(declare-datatypes ((V!13459 0))(
  ( (V!13460 (val!4677 Int)) )
))
(declare-datatypes ((ValueCell!4289 0))(
  ( (ValueCellFull!4289 (v!6874 V!13459)) (EmptyCell!4289) )
))
(declare-datatypes ((array!22441 0))(
  ( (array!22442 (arr!10689 (Array (_ BitVec 32) ValueCell!4289)) (size!11041 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22441)

(declare-fun mapDefault!15462 () ValueCell!4289)

