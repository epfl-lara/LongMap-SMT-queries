; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43382 () Bool)

(assert start!43382)

(declare-fun b_free!12209 () Bool)

(declare-fun b_next!12209 () Bool)

(assert (=> start!43382 (= b_free!12209 (not b_next!12209))))

(declare-fun tp!42903 () Bool)

(declare-fun b_and!20965 () Bool)

(assert (=> start!43382 (= tp!42903 b_and!20965)))

(declare-fun res!286636 () Bool)

(declare-fun e!282814 () Bool)

(assert (=> start!43382 (=> (not res!286636) (not e!282814))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43382 (= res!286636 (validMask!0 mask!2352))))

(assert (=> start!43382 e!282814))

(assert (=> start!43382 true))

(declare-fun tp_is_empty!13721 () Bool)

(assert (=> start!43382 tp_is_empty!13721))

(declare-datatypes ((V!19365 0))(
  ( (V!19366 (val!6908 Int)) )
))
(declare-datatypes ((ValueCell!6499 0))(
  ( (ValueCellFull!6499 (v!9199 V!19365)) (EmptyCell!6499) )
))
(declare-datatypes ((array!31107 0))(
  ( (array!31108 (arr!14958 (Array (_ BitVec 32) ValueCell!6499)) (size!15316 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31107)

(declare-fun e!282819 () Bool)

(declare-fun array_inv!10788 (array!31107) Bool)

(assert (=> start!43382 (and (array_inv!10788 _values!1516) e!282819)))

(assert (=> start!43382 tp!42903))

(declare-datatypes ((array!31109 0))(
  ( (array!31110 (arr!14959 (Array (_ BitVec 32) (_ BitVec 64))) (size!15317 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31109)

(declare-fun array_inv!10789 (array!31109) Bool)

(assert (=> start!43382 (array_inv!10789 _keys!1874)))

(declare-fun b!480660 () Bool)

(declare-fun e!282817 () Bool)

(assert (=> b!480660 (= e!282817 tp_is_empty!13721)))

(declare-fun b!480661 () Bool)

(declare-fun mapRes!22285 () Bool)

(assert (=> b!480661 (= e!282819 (and e!282817 mapRes!22285))))

(declare-fun condMapEmpty!22285 () Bool)

(declare-fun mapDefault!22285 () ValueCell!6499)

