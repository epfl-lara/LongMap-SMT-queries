; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94604 () Bool)

(assert start!94604)

(declare-fun b_free!21887 () Bool)

(declare-fun b_next!21887 () Bool)

(assert (=> start!94604 (= b_free!21887 (not b_next!21887))))

(declare-fun tp!77113 () Bool)

(declare-fun b_and!34699 () Bool)

(assert (=> start!94604 (= tp!77113 b_and!34699)))

(declare-fun res!713700 () Bool)

(declare-fun e!610511 () Bool)

(assert (=> start!94604 (=> (not res!713700) (not e!610511))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94604 (= res!713700 (validMask!0 mask!1515))))

(assert (=> start!94604 e!610511))

(assert (=> start!94604 true))

(declare-fun tp_is_empty!25697 () Bool)

(assert (=> start!94604 tp_is_empty!25697))

(declare-datatypes ((V!39397 0))(
  ( (V!39398 (val!12899 Int)) )
))
(declare-datatypes ((ValueCell!12145 0))(
  ( (ValueCellFull!12145 (v!15515 V!39397)) (EmptyCell!12145) )
))
(declare-datatypes ((array!68371 0))(
  ( (array!68372 (arr!32883 (Array (_ BitVec 32) ValueCell!12145)) (size!33419 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68371)

(declare-fun e!610508 () Bool)

(declare-fun array_inv!25444 (array!68371) Bool)

(assert (=> start!94604 (and (array_inv!25444 _values!955) e!610508)))

(assert (=> start!94604 tp!77113))

(declare-datatypes ((array!68373 0))(
  ( (array!68374 (arr!32884 (Array (_ BitVec 32) (_ BitVec 64))) (size!33420 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68373)

(declare-fun array_inv!25445 (array!68373) Bool)

(assert (=> start!94604 (array_inv!25445 _keys!1163)))

(declare-fun b!1069701 () Bool)

(declare-fun e!610510 () Bool)

(declare-fun mapRes!40246 () Bool)

(assert (=> b!1069701 (= e!610508 (and e!610510 mapRes!40246))))

(declare-fun condMapEmpty!40246 () Bool)

(declare-fun mapDefault!40246 () ValueCell!12145)

