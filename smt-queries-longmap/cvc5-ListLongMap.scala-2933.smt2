; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41786 () Bool)

(assert start!41786)

(declare-fun b_free!11407 () Bool)

(declare-fun b_next!11407 () Bool)

(assert (=> start!41786 (= b_free!11407 (not b_next!11407))))

(declare-fun tp!40227 () Bool)

(declare-fun b_and!19775 () Bool)

(assert (=> start!41786 (= tp!40227 b_and!19775)))

(declare-fun b!466602 () Bool)

(declare-fun res!278907 () Bool)

(declare-fun e!272849 () Bool)

(assert (=> b!466602 (=> (not res!278907) (not e!272849))))

(declare-datatypes ((array!29451 0))(
  ( (array!29452 (arr!14154 (Array (_ BitVec 32) (_ BitVec 64))) (size!14506 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29451)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29451 (_ BitVec 32)) Bool)

(assert (=> b!466602 (= res!278907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278905 () Bool)

(assert (=> start!41786 (=> (not res!278905) (not e!272849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41786 (= res!278905 (validMask!0 mask!1365))))

(assert (=> start!41786 e!272849))

(declare-fun tp_is_empty!12835 () Bool)

(assert (=> start!41786 tp_is_empty!12835))

(assert (=> start!41786 tp!40227))

(assert (=> start!41786 true))

(declare-fun array_inv!10220 (array!29451) Bool)

(assert (=> start!41786 (array_inv!10220 _keys!1025)))

(declare-datatypes ((V!18219 0))(
  ( (V!18220 (val!6462 Int)) )
))
(declare-datatypes ((ValueCell!6074 0))(
  ( (ValueCellFull!6074 (v!8750 V!18219)) (EmptyCell!6074) )
))
(declare-datatypes ((array!29453 0))(
  ( (array!29454 (arr!14155 (Array (_ BitVec 32) ValueCell!6074)) (size!14507 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29453)

(declare-fun e!272851 () Bool)

(declare-fun array_inv!10221 (array!29453) Bool)

(assert (=> start!41786 (and (array_inv!10221 _values!833) e!272851)))

(declare-fun b!466603 () Bool)

(declare-fun e!272850 () Bool)

(declare-fun mapRes!20938 () Bool)

(assert (=> b!466603 (= e!272851 (and e!272850 mapRes!20938))))

(declare-fun condMapEmpty!20938 () Bool)

(declare-fun mapDefault!20938 () ValueCell!6074)

