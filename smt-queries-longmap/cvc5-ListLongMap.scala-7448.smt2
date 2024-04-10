; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94582 () Bool)

(assert start!94582)

(declare-fun b_free!21865 () Bool)

(declare-fun b_next!21865 () Bool)

(assert (=> start!94582 (= b_free!21865 (not b_next!21865))))

(declare-fun tp!77047 () Bool)

(declare-fun b_and!34677 () Bool)

(assert (=> start!94582 (= tp!77047 b_and!34677)))

(declare-fun res!713568 () Bool)

(declare-fun e!610347 () Bool)

(assert (=> start!94582 (=> (not res!713568) (not e!610347))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94582 (= res!713568 (validMask!0 mask!1515))))

(assert (=> start!94582 e!610347))

(assert (=> start!94582 true))

(declare-fun tp_is_empty!25675 () Bool)

(assert (=> start!94582 tp_is_empty!25675))

(declare-datatypes ((V!39369 0))(
  ( (V!39370 (val!12888 Int)) )
))
(declare-datatypes ((ValueCell!12134 0))(
  ( (ValueCellFull!12134 (v!15504 V!39369)) (EmptyCell!12134) )
))
(declare-datatypes ((array!68329 0))(
  ( (array!68330 (arr!32862 (Array (_ BitVec 32) ValueCell!12134)) (size!33398 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68329)

(declare-fun e!610345 () Bool)

(declare-fun array_inv!25432 (array!68329) Bool)

(assert (=> start!94582 (and (array_inv!25432 _values!955) e!610345)))

(assert (=> start!94582 tp!77047))

(declare-datatypes ((array!68331 0))(
  ( (array!68332 (arr!32863 (Array (_ BitVec 32) (_ BitVec 64))) (size!33399 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68331)

(declare-fun array_inv!25433 (array!68331) Bool)

(assert (=> start!94582 (array_inv!25433 _keys!1163)))

(declare-fun mapIsEmpty!40213 () Bool)

(declare-fun mapRes!40213 () Bool)

(assert (=> mapIsEmpty!40213 mapRes!40213))

(declare-fun b!1069470 () Bool)

(declare-fun res!713569 () Bool)

(assert (=> b!1069470 (=> (not res!713569) (not e!610347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68331 (_ BitVec 32)) Bool)

(assert (=> b!1069470 (= res!713569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069471 () Bool)

(declare-fun e!610343 () Bool)

(assert (=> b!1069471 (= e!610345 (and e!610343 mapRes!40213))))

(declare-fun condMapEmpty!40213 () Bool)

(declare-fun mapDefault!40213 () ValueCell!12134)

