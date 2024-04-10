; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94946 () Bool)

(assert start!94946)

(declare-fun b_free!22151 () Bool)

(declare-fun b_next!22151 () Bool)

(assert (=> start!94946 (= b_free!22151 (not b_next!22151))))

(declare-fun tp!77918 () Bool)

(declare-fun b_and!35005 () Bool)

(assert (=> start!94946 (= tp!77918 b_and!35005)))

(declare-fun b!1073531 () Bool)

(declare-fun e!613327 () Bool)

(declare-fun tp_is_empty!25961 () Bool)

(assert (=> b!1073531 (= e!613327 tp_is_empty!25961)))

(declare-fun b!1073532 () Bool)

(declare-fun res!715993 () Bool)

(declare-fun e!613328 () Bool)

(assert (=> b!1073532 (=> (not res!715993) (not e!613328))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39749 0))(
  ( (V!39750 (val!13031 Int)) )
))
(declare-datatypes ((ValueCell!12277 0))(
  ( (ValueCellFull!12277 (v!15649 V!39749)) (EmptyCell!12277) )
))
(declare-datatypes ((array!68883 0))(
  ( (array!68884 (arr!33135 (Array (_ BitVec 32) ValueCell!12277)) (size!33671 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68883)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68885 0))(
  ( (array!68886 (arr!33136 (Array (_ BitVec 32) (_ BitVec 64))) (size!33672 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68885)

(assert (=> b!1073532 (= res!715993 (and (= (size!33671 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33672 _keys!1163) (size!33671 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073533 () Bool)

(declare-fun e!613324 () Bool)

(declare-fun mapRes!40654 () Bool)

(assert (=> b!1073533 (= e!613324 (and e!613327 mapRes!40654))))

(declare-fun condMapEmpty!40654 () Bool)

(declare-fun mapDefault!40654 () ValueCell!12277)

