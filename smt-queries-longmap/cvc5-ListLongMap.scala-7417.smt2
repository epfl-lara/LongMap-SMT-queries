; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94316 () Bool)

(assert start!94316)

(declare-fun b_free!21679 () Bool)

(declare-fun b_next!21679 () Bool)

(assert (=> start!94316 (= b_free!21679 (not b_next!21679))))

(declare-fun tp!76477 () Bool)

(declare-fun b_and!34451 () Bool)

(assert (=> start!94316 (= tp!76477 b_and!34451)))

(declare-fun b!1066585 () Bool)

(declare-fun res!711867 () Bool)

(declare-fun e!608228 () Bool)

(assert (=> b!1066585 (=> (not res!711867) (not e!608228))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39121 0))(
  ( (V!39122 (val!12795 Int)) )
))
(declare-datatypes ((ValueCell!12041 0))(
  ( (ValueCellFull!12041 (v!15408 V!39121)) (EmptyCell!12041) )
))
(declare-datatypes ((array!67963 0))(
  ( (array!67964 (arr!32683 (Array (_ BitVec 32) ValueCell!12041)) (size!33219 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67963)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67965 0))(
  ( (array!67966 (arr!32684 (Array (_ BitVec 32) (_ BitVec 64))) (size!33220 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67965)

(assert (=> b!1066585 (= res!711867 (and (= (size!33219 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33220 _keys!1163) (size!33219 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066586 () Bool)

(declare-fun res!711871 () Bool)

(assert (=> b!1066586 (=> (not res!711871) (not e!608228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67965 (_ BitVec 32)) Bool)

(assert (=> b!1066586 (= res!711871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066587 () Bool)

(declare-fun e!608227 () Bool)

(declare-fun e!608229 () Bool)

(declare-fun mapRes!39922 () Bool)

(assert (=> b!1066587 (= e!608227 (and e!608229 mapRes!39922))))

(declare-fun condMapEmpty!39922 () Bool)

(declare-fun mapDefault!39922 () ValueCell!12041)

