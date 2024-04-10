; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104708 () Bool)

(assert start!104708)

(declare-fun b_free!26525 () Bool)

(declare-fun b_next!26525 () Bool)

(assert (=> start!104708 (= b_free!26525 (not b_next!26525))))

(declare-fun tp!93062 () Bool)

(declare-fun b_and!44289 () Bool)

(assert (=> start!104708 (= tp!93062 b_and!44289)))

(declare-fun res!832846 () Bool)

(declare-fun e!708345 () Bool)

(assert (=> start!104708 (=> (not res!832846) (not e!708345))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104708 (= res!832846 (validMask!0 mask!1466))))

(assert (=> start!104708 e!708345))

(assert (=> start!104708 true))

(assert (=> start!104708 tp!93062))

(declare-fun tp_is_empty!31427 () Bool)

(assert (=> start!104708 tp_is_empty!31427))

(declare-datatypes ((array!80546 0))(
  ( (array!80547 (arr!38841 (Array (_ BitVec 32) (_ BitVec 64))) (size!39377 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80546)

(declare-fun array_inv!29647 (array!80546) Bool)

(assert (=> start!104708 (array_inv!29647 _keys!1118)))

(declare-datatypes ((V!47267 0))(
  ( (V!47268 (val!15776 Int)) )
))
(declare-datatypes ((ValueCell!14950 0))(
  ( (ValueCellFull!14950 (v!18472 V!47267)) (EmptyCell!14950) )
))
(declare-datatypes ((array!80548 0))(
  ( (array!80549 (arr!38842 (Array (_ BitVec 32) ValueCell!14950)) (size!39378 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80548)

(declare-fun e!708347 () Bool)

(declare-fun array_inv!29648 (array!80548) Bool)

(assert (=> start!104708 (and (array_inv!29648 _values!914) e!708347)))

(declare-fun b!1248329 () Bool)

(declare-fun res!832847 () Bool)

(assert (=> b!1248329 (=> (not res!832847) (not e!708345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80546 (_ BitVec 32)) Bool)

(assert (=> b!1248329 (= res!832847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248330 () Bool)

(declare-fun e!708349 () Bool)

(declare-fun mapRes!48898 () Bool)

(assert (=> b!1248330 (= e!708347 (and e!708349 mapRes!48898))))

(declare-fun condMapEmpty!48898 () Bool)

(declare-fun mapDefault!48898 () ValueCell!14950)

