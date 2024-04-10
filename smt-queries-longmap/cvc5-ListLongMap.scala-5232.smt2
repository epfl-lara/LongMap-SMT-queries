; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70456 () Bool)

(assert start!70456)

(declare-fun b_free!12799 () Bool)

(declare-fun b_next!12799 () Bool)

(assert (=> start!70456 (= b_free!12799 (not b_next!12799))))

(declare-fun tp!45127 () Bool)

(declare-fun b_and!21619 () Bool)

(assert (=> start!70456 (= tp!45127 b_and!21619)))

(declare-fun mapIsEmpty!23359 () Bool)

(declare-fun mapRes!23359 () Bool)

(assert (=> mapIsEmpty!23359 mapRes!23359))

(declare-fun b!818403 () Bool)

(declare-fun res!558548 () Bool)

(declare-fun e!454298 () Bool)

(assert (=> b!818403 (=> (not res!558548) (not e!454298))))

(declare-datatypes ((array!45216 0))(
  ( (array!45217 (arr!21663 (Array (_ BitVec 32) (_ BitVec 64))) (size!22084 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45216)

(declare-datatypes ((List!15430 0))(
  ( (Nil!15427) (Cons!15426 (h!16555 (_ BitVec 64)) (t!21757 List!15430)) )
))
(declare-fun arrayNoDuplicates!0 (array!45216 (_ BitVec 32) List!15430) Bool)

(assert (=> b!818403 (= res!558548 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15427))))

(declare-fun b!818404 () Bool)

(declare-fun e!454299 () Bool)

(declare-fun e!454296 () Bool)

(assert (=> b!818404 (= e!454299 (and e!454296 mapRes!23359))))

(declare-fun condMapEmpty!23359 () Bool)

(declare-datatypes ((V!24347 0))(
  ( (V!24348 (val!7302 Int)) )
))
(declare-datatypes ((ValueCell!6839 0))(
  ( (ValueCellFull!6839 (v!9731 V!24347)) (EmptyCell!6839) )
))
(declare-datatypes ((array!45218 0))(
  ( (array!45219 (arr!21664 (Array (_ BitVec 32) ValueCell!6839)) (size!22085 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45218)

(declare-fun mapDefault!23359 () ValueCell!6839)

