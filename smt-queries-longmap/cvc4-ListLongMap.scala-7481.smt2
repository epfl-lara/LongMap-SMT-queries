; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94838 () Bool)

(assert start!94838)

(declare-fun b_free!22067 () Bool)

(declare-fun b_next!22067 () Bool)

(assert (=> start!94838 (= b_free!22067 (not b_next!22067))))

(declare-fun tp!77663 () Bool)

(declare-fun b_and!34909 () Bool)

(assert (=> start!94838 (= tp!77663 b_and!34909)))

(declare-fun b!1072401 () Bool)

(declare-fun res!715348 () Bool)

(declare-fun e!612519 () Bool)

(assert (=> b!1072401 (=> (not res!715348) (not e!612519))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39637 0))(
  ( (V!39638 (val!12989 Int)) )
))
(declare-datatypes ((ValueCell!12235 0))(
  ( (ValueCellFull!12235 (v!15606 V!39637)) (EmptyCell!12235) )
))
(declare-datatypes ((array!68723 0))(
  ( (array!68724 (arr!33056 (Array (_ BitVec 32) ValueCell!12235)) (size!33592 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68723)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68725 0))(
  ( (array!68726 (arr!33057 (Array (_ BitVec 32) (_ BitVec 64))) (size!33593 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68725)

(assert (=> b!1072401 (= res!715348 (and (= (size!33592 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33593 _keys!1163) (size!33592 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072402 () Bool)

(declare-fun e!612517 () Bool)

(declare-fun tp_is_empty!25877 () Bool)

(assert (=> b!1072402 (= e!612517 tp_is_empty!25877)))

(declare-fun b!1072403 () Bool)

(declare-fun res!715345 () Bool)

(assert (=> b!1072403 (=> (not res!715345) (not e!612519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68725 (_ BitVec 32)) Bool)

(assert (=> b!1072403 (= res!715345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072404 () Bool)

(declare-fun e!612516 () Bool)

(declare-fun e!612521 () Bool)

(declare-fun mapRes!40525 () Bool)

(assert (=> b!1072404 (= e!612516 (and e!612521 mapRes!40525))))

(declare-fun condMapEmpty!40525 () Bool)

(declare-fun mapDefault!40525 () ValueCell!12235)

