; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37160 () Bool)

(assert start!37160)

(declare-fun b_free!8287 () Bool)

(declare-fun b_next!8287 () Bool)

(assert (=> start!37160 (= b_free!8287 (not b_next!8287))))

(declare-fun tp!29577 () Bool)

(declare-fun b_and!15529 () Bool)

(assert (=> start!37160 (= tp!29577 b_and!15529)))

(declare-fun mapNonEmpty!14967 () Bool)

(declare-fun mapRes!14967 () Bool)

(declare-fun tp!29576 () Bool)

(declare-fun e!228444 () Bool)

(assert (=> mapNonEmpty!14967 (= mapRes!14967 (and tp!29576 e!228444))))

(declare-datatypes ((V!13019 0))(
  ( (V!13020 (val!4512 Int)) )
))
(declare-datatypes ((ValueCell!4124 0))(
  ( (ValueCellFull!4124 (v!6709 V!13019)) (EmptyCell!4124) )
))
(declare-fun mapValue!14967 () ValueCell!4124)

(declare-datatypes ((array!21809 0))(
  ( (array!21810 (arr!10373 (Array (_ BitVec 32) ValueCell!4124)) (size!10725 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21809)

(declare-fun mapRest!14967 () (Array (_ BitVec 32) ValueCell!4124))

(declare-fun mapKey!14967 () (_ BitVec 32))

(assert (=> mapNonEmpty!14967 (= (arr!10373 _values!506) (store mapRest!14967 mapKey!14967 mapValue!14967))))

(declare-fun b!374892 () Bool)

(declare-fun e!228445 () Bool)

(declare-fun e!228440 () Bool)

(assert (=> b!374892 (= e!228445 (and e!228440 mapRes!14967))))

(declare-fun condMapEmpty!14967 () Bool)

(declare-fun mapDefault!14967 () ValueCell!4124)

