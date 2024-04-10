; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94374 () Bool)

(assert start!94374)

(declare-fun b_free!21715 () Bool)

(declare-fun b_next!21715 () Bool)

(assert (=> start!94374 (= b_free!21715 (not b_next!21715))))

(declare-fun tp!76589 () Bool)

(declare-fun b_and!34499 () Bool)

(assert (=> start!94374 (= tp!76589 b_and!34499)))

(declare-fun b!1067163 () Bool)

(declare-fun res!712184 () Bool)

(declare-fun e!608631 () Bool)

(assert (=> b!1067163 (=> (not res!712184) (not e!608631))))

(declare-datatypes ((array!68035 0))(
  ( (array!68036 (arr!32718 (Array (_ BitVec 32) (_ BitVec 64))) (size!33254 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68035)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68035 (_ BitVec 32)) Bool)

(assert (=> b!1067163 (= res!712184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067164 () Bool)

(declare-fun e!608634 () Bool)

(declare-fun tp_is_empty!25525 () Bool)

(assert (=> b!1067164 (= e!608634 tp_is_empty!25525)))

(declare-fun b!1067165 () Bool)

(declare-fun res!712182 () Bool)

(assert (=> b!1067165 (=> (not res!712182) (not e!608631))))

(declare-datatypes ((V!39169 0))(
  ( (V!39170 (val!12813 Int)) )
))
(declare-datatypes ((ValueCell!12059 0))(
  ( (ValueCellFull!12059 (v!15427 V!39169)) (EmptyCell!12059) )
))
(declare-datatypes ((array!68037 0))(
  ( (array!68038 (arr!32719 (Array (_ BitVec 32) ValueCell!12059)) (size!33255 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68037)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067165 (= res!712182 (and (= (size!33255 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33254 _keys!1163) (size!33255 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067166 () Bool)

(declare-fun e!608633 () Bool)

(declare-fun mapRes!39979 () Bool)

(assert (=> b!1067166 (= e!608633 (and e!608634 mapRes!39979))))

(declare-fun condMapEmpty!39979 () Bool)

(declare-fun mapDefault!39979 () ValueCell!12059)

