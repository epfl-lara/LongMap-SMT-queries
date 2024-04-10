; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70890 () Bool)

(assert start!70890)

(declare-fun b_free!13127 () Bool)

(declare-fun b_next!13127 () Bool)

(assert (=> start!70890 (= b_free!13127 (not b_next!13127))))

(declare-fun tp!46129 () Bool)

(declare-fun b_and!22011 () Bool)

(assert (=> start!70890 (= tp!46129 b_and!22011)))

(declare-fun b!823379 () Bool)

(declare-fun e!457942 () Bool)

(declare-fun tp_is_empty!14837 () Bool)

(assert (=> b!823379 (= e!457942 tp_is_empty!14837)))

(declare-fun b!823380 () Bool)

(declare-fun res!561507 () Bool)

(declare-fun e!457943 () Bool)

(assert (=> b!823380 (=> (not res!561507) (not e!457943))))

(declare-datatypes ((array!45864 0))(
  ( (array!45865 (arr!21981 (Array (_ BitVec 32) (_ BitVec 64))) (size!22402 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45864)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24783 0))(
  ( (V!24784 (val!7466 Int)) )
))
(declare-datatypes ((ValueCell!7003 0))(
  ( (ValueCellFull!7003 (v!9898 V!24783)) (EmptyCell!7003) )
))
(declare-datatypes ((array!45866 0))(
  ( (array!45867 (arr!21982 (Array (_ BitVec 32) ValueCell!7003)) (size!22403 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45866)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823380 (= res!561507 (and (= (size!22403 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22402 _keys!976) (size!22403 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823381 () Bool)

(declare-fun res!561508 () Bool)

(assert (=> b!823381 (=> (not res!561508) (not e!457943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45864 (_ BitVec 32)) Bool)

(assert (=> b!823381 (= res!561508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23869 () Bool)

(declare-fun mapRes!23869 () Bool)

(declare-fun tp!46128 () Bool)

(assert (=> mapNonEmpty!23869 (= mapRes!23869 (and tp!46128 e!457942))))

(declare-fun mapRest!23869 () (Array (_ BitVec 32) ValueCell!7003))

(declare-fun mapKey!23869 () (_ BitVec 32))

(declare-fun mapValue!23869 () ValueCell!7003)

(assert (=> mapNonEmpty!23869 (= (arr!21982 _values!788) (store mapRest!23869 mapKey!23869 mapValue!23869))))

(declare-fun b!823382 () Bool)

(declare-fun res!561506 () Bool)

(assert (=> b!823382 (=> (not res!561506) (not e!457943))))

(declare-datatypes ((List!15686 0))(
  ( (Nil!15683) (Cons!15682 (h!16811 (_ BitVec 64)) (t!22025 List!15686)) )
))
(declare-fun arrayNoDuplicates!0 (array!45864 (_ BitVec 32) List!15686) Bool)

(assert (=> b!823382 (= res!561506 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15683))))

(declare-fun b!823383 () Bool)

(declare-fun e!457944 () Bool)

(declare-fun e!457941 () Bool)

(assert (=> b!823383 (= e!457944 (and e!457941 mapRes!23869))))

(declare-fun condMapEmpty!23869 () Bool)

(declare-fun mapDefault!23869 () ValueCell!7003)

