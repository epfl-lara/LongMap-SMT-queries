; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42584 () Bool)

(assert start!42584)

(declare-fun b_free!12019 () Bool)

(declare-fun b_next!12019 () Bool)

(assert (=> start!42584 (= b_free!12019 (not b_next!12019))))

(declare-fun tp!42096 () Bool)

(declare-fun b_and!20499 () Bool)

(assert (=> start!42584 (= tp!42096 b_and!20499)))

(declare-fun mapIsEmpty!21889 () Bool)

(declare-fun mapRes!21889 () Bool)

(assert (=> mapIsEmpty!21889 mapRes!21889))

(declare-fun res!283732 () Bool)

(declare-fun e!278927 () Bool)

(assert (=> start!42584 (=> (not res!283732) (not e!278927))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42584 (= res!283732 (validMask!0 mask!1365))))

(assert (=> start!42584 e!278927))

(declare-fun tp_is_empty!13447 () Bool)

(assert (=> start!42584 tp_is_empty!13447))

(assert (=> start!42584 tp!42096))

(assert (=> start!42584 true))

(declare-datatypes ((array!30633 0))(
  ( (array!30634 (arr!14734 (Array (_ BitVec 32) (_ BitVec 64))) (size!15086 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30633)

(declare-fun array_inv!10630 (array!30633) Bool)

(assert (=> start!42584 (array_inv!10630 _keys!1025)))

(declare-datatypes ((V!19035 0))(
  ( (V!19036 (val!6768 Int)) )
))
(declare-datatypes ((ValueCell!6380 0))(
  ( (ValueCellFull!6380 (v!9061 V!19035)) (EmptyCell!6380) )
))
(declare-datatypes ((array!30635 0))(
  ( (array!30636 (arr!14735 (Array (_ BitVec 32) ValueCell!6380)) (size!15087 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30635)

(declare-fun e!278924 () Bool)

(declare-fun array_inv!10631 (array!30635) Bool)

(assert (=> start!42584 (and (array_inv!10631 _values!833) e!278924)))

(declare-fun b!475088 () Bool)

(declare-fun res!283734 () Bool)

(assert (=> b!475088 (=> (not res!283734) (not e!278927))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475088 (= res!283734 (and (= (size!15087 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15086 _keys!1025) (size!15087 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475089 () Bool)

(declare-fun res!283733 () Bool)

(assert (=> b!475089 (=> (not res!283733) (not e!278927))))

(declare-datatypes ((List!9003 0))(
  ( (Nil!9000) (Cons!8999 (h!9855 (_ BitVec 64)) (t!14977 List!9003)) )
))
(declare-fun arrayNoDuplicates!0 (array!30633 (_ BitVec 32) List!9003) Bool)

(assert (=> b!475089 (= res!283733 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9000))))

(declare-fun b!475090 () Bool)

(declare-fun e!278925 () Bool)

(assert (=> b!475090 (= e!278924 (and e!278925 mapRes!21889))))

(declare-fun condMapEmpty!21889 () Bool)

(declare-fun mapDefault!21889 () ValueCell!6380)

