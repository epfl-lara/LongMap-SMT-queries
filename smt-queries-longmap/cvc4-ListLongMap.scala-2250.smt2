; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36966 () Bool)

(assert start!36966)

(declare-fun b_free!8093 () Bool)

(declare-fun b_next!8093 () Bool)

(assert (=> start!36966 (= b_free!8093 (not b_next!8093))))

(declare-fun tp!28994 () Bool)

(declare-fun b_and!15335 () Bool)

(assert (=> start!36966 (= tp!28994 b_and!15335)))

(declare-fun mapNonEmpty!14676 () Bool)

(declare-fun mapRes!14676 () Bool)

(declare-fun tp!28995 () Bool)

(declare-fun e!226451 () Bool)

(assert (=> mapNonEmpty!14676 (= mapRes!14676 (and tp!28995 e!226451))))

(declare-datatypes ((V!12759 0))(
  ( (V!12760 (val!4415 Int)) )
))
(declare-datatypes ((ValueCell!4027 0))(
  ( (ValueCellFull!4027 (v!6612 V!12759)) (EmptyCell!4027) )
))
(declare-fun mapValue!14676 () ValueCell!4027)

(declare-datatypes ((array!21425 0))(
  ( (array!21426 (arr!10181 (Array (_ BitVec 32) ValueCell!4027)) (size!10533 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21425)

(declare-fun mapKey!14676 () (_ BitVec 32))

(declare-fun mapRest!14676 () (Array (_ BitVec 32) ValueCell!4027))

(assert (=> mapNonEmpty!14676 (= (arr!10181 _values!506) (store mapRest!14676 mapKey!14676 mapValue!14676))))

(declare-fun b!370853 () Bool)

(declare-fun res!208346 () Bool)

(declare-fun e!226447 () Bool)

(assert (=> b!370853 (=> (not res!208346) (not e!226447))))

(declare-datatypes ((array!21427 0))(
  ( (array!21428 (arr!10182 (Array (_ BitVec 32) (_ BitVec 64))) (size!10534 (_ BitVec 32))) )
))
(declare-fun lt!170063 () array!21427)

(declare-datatypes ((List!5695 0))(
  ( (Nil!5692) (Cons!5691 (h!6547 (_ BitVec 64)) (t!10845 List!5695)) )
))
(declare-fun arrayNoDuplicates!0 (array!21427 (_ BitVec 32) List!5695) Bool)

(assert (=> b!370853 (= res!208346 (arrayNoDuplicates!0 lt!170063 #b00000000000000000000000000000000 Nil!5692))))

(declare-fun b!370854 () Bool)

(declare-fun e!226448 () Bool)

(declare-fun e!226446 () Bool)

(assert (=> b!370854 (= e!226448 (and e!226446 mapRes!14676))))

(declare-fun condMapEmpty!14676 () Bool)

(declare-fun mapDefault!14676 () ValueCell!4027)

