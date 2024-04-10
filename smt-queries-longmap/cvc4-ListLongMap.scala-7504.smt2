; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95108 () Bool)

(assert start!95108)

(declare-fun b_free!22205 () Bool)

(declare-fun b_next!22205 () Bool)

(assert (=> start!95108 (= b_free!22205 (not b_next!22205))))

(declare-fun tp!78097 () Bool)

(declare-fun b_and!35125 () Bool)

(assert (=> start!95108 (= tp!78097 b_and!35125)))

(declare-fun b!1075159 () Bool)

(declare-fun res!716812 () Bool)

(declare-fun e!614443 () Bool)

(assert (=> b!1075159 (=> (not res!716812) (not e!614443))))

(declare-datatypes ((array!68997 0))(
  ( (array!68998 (arr!33186 (Array (_ BitVec 32) (_ BitVec 64))) (size!33722 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68997)

(declare-datatypes ((List!23173 0))(
  ( (Nil!23170) (Cons!23169 (h!24378 (_ BitVec 64)) (t!32522 List!23173)) )
))
(declare-fun arrayNoDuplicates!0 (array!68997 (_ BitVec 32) List!23173) Bool)

(assert (=> b!1075159 (= res!716812 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23170))))

(declare-fun b!1075160 () Bool)

(declare-fun res!716808 () Bool)

(assert (=> b!1075160 (=> (not res!716808) (not e!614443))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39821 0))(
  ( (V!39822 (val!13058 Int)) )
))
(declare-datatypes ((ValueCell!12304 0))(
  ( (ValueCellFull!12304 (v!15681 V!39821)) (EmptyCell!12304) )
))
(declare-datatypes ((array!68999 0))(
  ( (array!69000 (arr!33187 (Array (_ BitVec 32) ValueCell!12304)) (size!33723 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68999)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075160 (= res!716808 (and (= (size!33723 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33722 _keys!1163) (size!33723 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40753 () Bool)

(declare-fun mapRes!40753 () Bool)

(assert (=> mapIsEmpty!40753 mapRes!40753))

(declare-fun mapNonEmpty!40753 () Bool)

(declare-fun tp!78098 () Bool)

(declare-fun e!614440 () Bool)

(assert (=> mapNonEmpty!40753 (= mapRes!40753 (and tp!78098 e!614440))))

(declare-fun mapRest!40753 () (Array (_ BitVec 32) ValueCell!12304))

(declare-fun mapKey!40753 () (_ BitVec 32))

(declare-fun mapValue!40753 () ValueCell!12304)

(assert (=> mapNonEmpty!40753 (= (arr!33187 _values!955) (store mapRest!40753 mapKey!40753 mapValue!40753))))

(declare-fun b!1075161 () Bool)

(declare-fun e!614441 () Bool)

(declare-fun tp_is_empty!26015 () Bool)

(assert (=> b!1075161 (= e!614441 tp_is_empty!26015)))

(declare-fun b!1075163 () Bool)

(assert (=> b!1075163 (= e!614440 tp_is_empty!26015)))

(declare-fun b!1075164 () Bool)

(declare-fun e!614445 () Bool)

(assert (=> b!1075164 (= e!614445 (and e!614441 mapRes!40753))))

(declare-fun condMapEmpty!40753 () Bool)

(declare-fun mapDefault!40753 () ValueCell!12304)

