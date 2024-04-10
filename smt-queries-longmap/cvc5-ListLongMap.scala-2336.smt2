; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37478 () Bool)

(assert start!37478)

(declare-fun b_free!8605 () Bool)

(declare-fun b_next!8605 () Bool)

(assert (=> start!37478 (= b_free!8605 (not b_next!8605))))

(declare-fun tp!30530 () Bool)

(declare-fun b_and!15847 () Bool)

(assert (=> start!37478 (= tp!30530 b_and!15847)))

(declare-fun mapNonEmpty!15444 () Bool)

(declare-fun mapRes!15444 () Bool)

(declare-fun tp!30531 () Bool)

(declare-fun e!232173 () Bool)

(assert (=> mapNonEmpty!15444 (= mapRes!15444 (and tp!30531 e!232173))))

(declare-datatypes ((V!13443 0))(
  ( (V!13444 (val!4671 Int)) )
))
(declare-datatypes ((ValueCell!4283 0))(
  ( (ValueCellFull!4283 (v!6868 V!13443)) (EmptyCell!4283) )
))
(declare-fun mapRest!15444 () (Array (_ BitVec 32) ValueCell!4283))

(declare-fun mapValue!15444 () ValueCell!4283)

(declare-datatypes ((array!22417 0))(
  ( (array!22418 (arr!10677 (Array (_ BitVec 32) ValueCell!4283)) (size!11029 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22417)

(declare-fun mapKey!15444 () (_ BitVec 32))

(assert (=> mapNonEmpty!15444 (= (arr!10677 _values!506) (store mapRest!15444 mapKey!15444 mapValue!15444))))

(declare-fun b!381982 () Bool)

(declare-fun e!232176 () Bool)

(declare-fun e!232172 () Bool)

(assert (=> b!381982 (= e!232176 (and e!232172 mapRes!15444))))

(declare-fun condMapEmpty!15444 () Bool)

(declare-fun mapDefault!15444 () ValueCell!4283)

