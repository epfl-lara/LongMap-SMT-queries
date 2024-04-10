; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94516 () Bool)

(assert start!94516)

(declare-fun b_free!21821 () Bool)

(declare-fun b_next!21821 () Bool)

(assert (=> start!94516 (= b_free!21821 (not b_next!21821))))

(declare-fun tp!76912 () Bool)

(declare-fun b_and!34623 () Bool)

(assert (=> start!94516 (= tp!76912 b_and!34623)))

(declare-fun b!1068741 () Bool)

(declare-fun e!609805 () Bool)

(declare-fun e!609804 () Bool)

(declare-fun mapRes!40144 () Bool)

(assert (=> b!1068741 (= e!609805 (and e!609804 mapRes!40144))))

(declare-fun condMapEmpty!40144 () Bool)

(declare-datatypes ((V!39309 0))(
  ( (V!39310 (val!12866 Int)) )
))
(declare-datatypes ((ValueCell!12112 0))(
  ( (ValueCellFull!12112 (v!15481 V!39309)) (EmptyCell!12112) )
))
(declare-datatypes ((array!68241 0))(
  ( (array!68242 (arr!32819 (Array (_ BitVec 32) ValueCell!12112)) (size!33355 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68241)

(declare-fun mapDefault!40144 () ValueCell!12112)

