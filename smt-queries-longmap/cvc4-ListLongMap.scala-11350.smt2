; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132008 () Bool)

(assert start!132008)

(declare-fun b_free!31721 () Bool)

(declare-fun b_next!31721 () Bool)

(assert (=> start!132008 (= b_free!31721 (not b_next!31721))))

(declare-fun tp!111415 () Bool)

(declare-fun b_and!51131 () Bool)

(assert (=> start!132008 (= tp!111415 b_and!51131)))

(declare-fun bm!69632 () Bool)

(declare-datatypes ((V!59105 0))(
  ( (V!59106 (val!19076 Int)) )
))
(declare-datatypes ((tuple2!24532 0))(
  ( (tuple2!24533 (_1!12277 (_ BitVec 64)) (_2!12277 V!59105)) )
))
(declare-datatypes ((List!36036 0))(
  ( (Nil!36033) (Cons!36032 (h!37477 tuple2!24532) (t!50730 List!36036)) )
))
(declare-datatypes ((ListLongMap!22141 0))(
  ( (ListLongMap!22142 (toList!11086 List!36036)) )
))
(declare-fun call!69635 () ListLongMap!22141)

(declare-fun call!69637 () ListLongMap!22141)

(assert (=> bm!69632 (= call!69635 call!69637)))

(declare-fun mapNonEmpty!58699 () Bool)

(declare-fun mapRes!58699 () Bool)

(declare-fun tp!111414 () Bool)

(declare-fun e!860962 () Bool)

(assert (=> mapNonEmpty!58699 (= mapRes!58699 (and tp!111414 e!860962))))

(declare-datatypes ((ValueCell!18088 0))(
  ( (ValueCellFull!18088 (v!21877 V!59105)) (EmptyCell!18088) )
))
(declare-datatypes ((array!103198 0))(
  ( (array!103199 (arr!49801 (Array (_ BitVec 32) ValueCell!18088)) (size!50351 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103198)

(declare-fun mapValue!58699 () ValueCell!18088)

(declare-fun mapKey!58699 () (_ BitVec 32))

(declare-fun mapRest!58699 () (Array (_ BitVec 32) ValueCell!18088))

(assert (=> mapNonEmpty!58699 (= (arr!49801 _values!470) (store mapRest!58699 mapKey!58699 mapValue!58699))))

(declare-fun b!1546746 () Bool)

(declare-fun e!860961 () Bool)

(declare-fun tp_is_empty!37997 () Bool)

(assert (=> b!1546746 (= e!860961 tp_is_empty!37997)))

(declare-fun bm!69633 () Bool)

(declare-fun call!69639 () ListLongMap!22141)

(declare-fun call!69636 () ListLongMap!22141)

(assert (=> bm!69633 (= call!69639 call!69636)))

(declare-fun b!1546747 () Bool)

(declare-fun e!860956 () Bool)

(assert (=> b!1546747 (= e!860956 (and e!860961 mapRes!58699))))

(declare-fun condMapEmpty!58699 () Bool)

(declare-fun mapDefault!58699 () ValueCell!18088)

