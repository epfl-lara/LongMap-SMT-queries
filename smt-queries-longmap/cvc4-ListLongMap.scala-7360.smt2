; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93868 () Bool)

(assert start!93868)

(declare-fun b_free!21341 () Bool)

(declare-fun b_next!21341 () Bool)

(assert (=> start!93868 (= b_free!21341 (not b_next!21341))))

(declare-fun tp!75445 () Bool)

(declare-fun b_and!34055 () Bool)

(assert (=> start!93868 (= tp!75445 b_and!34055)))

(declare-fun b!1061642 () Bool)

(declare-fun res!708938 () Bool)

(declare-fun e!604593 () Bool)

(assert (=> b!1061642 (=> (not res!708938) (not e!604593))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38669 0))(
  ( (V!38670 (val!12626 Int)) )
))
(declare-datatypes ((ValueCell!11872 0))(
  ( (ValueCellFull!11872 (v!15236 V!38669)) (EmptyCell!11872) )
))
(declare-datatypes ((array!67305 0))(
  ( (array!67306 (arr!32360 (Array (_ BitVec 32) ValueCell!11872)) (size!32896 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67305)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67307 0))(
  ( (array!67308 (arr!32361 (Array (_ BitVec 32) (_ BitVec 64))) (size!32897 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67307)

(assert (=> b!1061642 (= res!708938 (and (= (size!32896 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32897 _keys!1163) (size!32896 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39397 () Bool)

(declare-fun mapRes!39397 () Bool)

(declare-fun tp!75446 () Bool)

(declare-fun e!604589 () Bool)

(assert (=> mapNonEmpty!39397 (= mapRes!39397 (and tp!75446 e!604589))))

(declare-fun mapValue!39397 () ValueCell!11872)

(declare-fun mapRest!39397 () (Array (_ BitVec 32) ValueCell!11872))

(declare-fun mapKey!39397 () (_ BitVec 32))

(assert (=> mapNonEmpty!39397 (= (arr!32360 _values!955) (store mapRest!39397 mapKey!39397 mapValue!39397))))

(declare-fun b!1061643 () Bool)

(declare-fun e!604590 () Bool)

(declare-fun e!604591 () Bool)

(assert (=> b!1061643 (= e!604590 (and e!604591 mapRes!39397))))

(declare-fun condMapEmpty!39397 () Bool)

(declare-fun mapDefault!39397 () ValueCell!11872)

