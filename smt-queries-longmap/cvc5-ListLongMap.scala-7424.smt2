; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94380 () Bool)

(assert start!94380)

(declare-fun b_free!21721 () Bool)

(declare-fun b_next!21721 () Bool)

(assert (=> start!94380 (= b_free!21721 (not b_next!21721))))

(declare-fun tp!76607 () Bool)

(declare-fun b_and!34505 () Bool)

(assert (=> start!94380 (= tp!76607 b_and!34505)))

(declare-fun b!1067226 () Bool)

(declare-fun res!712219 () Bool)

(declare-fun e!608675 () Bool)

(assert (=> b!1067226 (=> (not res!712219) (not e!608675))))

(declare-datatypes ((array!68045 0))(
  ( (array!68046 (arr!32723 (Array (_ BitVec 32) (_ BitVec 64))) (size!33259 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68045)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68045 (_ BitVec 32)) Bool)

(assert (=> b!1067226 (= res!712219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067227 () Bool)

(declare-fun e!608678 () Bool)

(declare-fun e!608679 () Bool)

(declare-fun mapRes!39988 () Bool)

(assert (=> b!1067227 (= e!608678 (and e!608679 mapRes!39988))))

(declare-fun condMapEmpty!39988 () Bool)

(declare-datatypes ((V!39177 0))(
  ( (V!39178 (val!12816 Int)) )
))
(declare-datatypes ((ValueCell!12062 0))(
  ( (ValueCellFull!12062 (v!15430 V!39177)) (EmptyCell!12062) )
))
(declare-datatypes ((array!68047 0))(
  ( (array!68048 (arr!32724 (Array (_ BitVec 32) ValueCell!12062)) (size!33260 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68047)

(declare-fun mapDefault!39988 () ValueCell!12062)

