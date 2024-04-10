; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93996 () Bool)

(assert start!93996)

(declare-fun b_free!21433 () Bool)

(declare-fun b_next!21433 () Bool)

(assert (=> start!93996 (= b_free!21433 (not b_next!21433))))

(declare-fun tp!75728 () Bool)

(declare-fun b_and!34165 () Bool)

(assert (=> start!93996 (= tp!75728 b_and!34165)))

(declare-fun b!1063079 () Bool)

(declare-fun res!709810 () Bool)

(declare-fun e!605668 () Bool)

(assert (=> b!1063079 (=> (not res!709810) (not e!605668))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38793 0))(
  ( (V!38794 (val!12672 Int)) )
))
(declare-datatypes ((ValueCell!11918 0))(
  ( (ValueCellFull!11918 (v!15283 V!38793)) (EmptyCell!11918) )
))
(declare-datatypes ((array!67485 0))(
  ( (array!67486 (arr!32448 (Array (_ BitVec 32) ValueCell!11918)) (size!32984 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67485)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67487 0))(
  ( (array!67488 (arr!32449 (Array (_ BitVec 32) (_ BitVec 64))) (size!32985 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67487)

(assert (=> b!1063079 (= res!709810 (and (= (size!32984 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32985 _keys!1163) (size!32984 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063080 () Bool)

(declare-fun e!605669 () Bool)

(declare-fun tp_is_empty!25243 () Bool)

(assert (=> b!1063080 (= e!605669 tp_is_empty!25243)))

(declare-fun b!1063081 () Bool)

(declare-fun e!605663 () Bool)

(declare-fun e!605664 () Bool)

(declare-fun mapRes!39541 () Bool)

(assert (=> b!1063081 (= e!605663 (and e!605664 mapRes!39541))))

(declare-fun condMapEmpty!39541 () Bool)

(declare-fun mapDefault!39541 () ValueCell!11918)

