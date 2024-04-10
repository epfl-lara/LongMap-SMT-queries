; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95184 () Bool)

(assert start!95184)

(declare-fun b_free!22223 () Bool)

(declare-fun b_next!22223 () Bool)

(assert (=> start!95184 (= b_free!22223 (not b_next!22223))))

(declare-fun tp!78160 () Bool)

(declare-fun b_and!35177 () Bool)

(assert (=> start!95184 (= tp!78160 b_and!35177)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39845 0))(
  ( (V!39846 (val!13067 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39845)

(declare-datatypes ((ValueCell!12313 0))(
  ( (ValueCellFull!12313 (v!15693 V!39845)) (EmptyCell!12313) )
))
(declare-datatypes ((array!69035 0))(
  ( (array!69036 (arr!33202 (Array (_ BitVec 32) ValueCell!12313)) (size!33738 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69035)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39845)

(declare-fun e!614952 () Bool)

(declare-fun b!1075912 () Bool)

(declare-datatypes ((tuple2!16646 0))(
  ( (tuple2!16647 (_1!8334 (_ BitVec 64)) (_2!8334 V!39845)) )
))
(declare-datatypes ((List!23182 0))(
  ( (Nil!23179) (Cons!23178 (h!24387 tuple2!16646) (t!32537 List!23182)) )
))
(declare-datatypes ((ListLongMap!14615 0))(
  ( (ListLongMap!14616 (toList!7323 List!23182)) )
))
(declare-fun lt!477699 () ListLongMap!14615)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69037 0))(
  ( (array!69038 (arr!33203 (Array (_ BitVec 32) (_ BitVec 64))) (size!33739 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69037)

(declare-fun getCurrentListMap!4192 (array!69037 array!69035 (_ BitVec 32) (_ BitVec 32) V!39845 V!39845 (_ BitVec 32) Int) ListLongMap!14615)

(declare-fun +!3229 (ListLongMap!14615 tuple2!16646) ListLongMap!14615)

(assert (=> b!1075912 (= e!614952 (= (getCurrentListMap!4192 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3229 (+!3229 lt!477699 (tuple2!16647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075913 () Bool)

(declare-fun res!717178 () Bool)

(declare-fun e!614954 () Bool)

(assert (=> b!1075913 (=> (not res!717178) (not e!614954))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1075913 (= res!717178 (and (= (size!33738 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33739 _keys!1163) (size!33738 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40789 () Bool)

(declare-fun mapRes!40789 () Bool)

(assert (=> mapIsEmpty!40789 mapRes!40789))

(declare-fun b!1075914 () Bool)

(declare-fun e!614951 () Bool)

(assert (=> b!1075914 (= e!614954 (not e!614951))))

(declare-fun res!717176 () Bool)

(assert (=> b!1075914 (=> res!717176 e!614951)))

(assert (=> b!1075914 (= res!717176 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614957 () Bool)

(assert (=> b!1075914 e!614957))

(declare-fun res!717180 () Bool)

(assert (=> b!1075914 (=> (not res!717180) (not e!614957))))

(declare-fun lt!477700 () ListLongMap!14615)

(assert (=> b!1075914 (= res!717180 (= lt!477699 lt!477700))))

(declare-datatypes ((Unit!35419 0))(
  ( (Unit!35420) )
))
(declare-fun lt!477701 () Unit!35419)

(declare-fun zeroValueAfter!47 () V!39845)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!901 (array!69037 array!69035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39845 V!39845 V!39845 V!39845 (_ BitVec 32) Int) Unit!35419)

(assert (=> b!1075914 (= lt!477701 (lemmaNoChangeToArrayThenSameMapNoExtras!901 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3885 (array!69037 array!69035 (_ BitVec 32) (_ BitVec 32) V!39845 V!39845 (_ BitVec 32) Int) ListLongMap!14615)

(assert (=> b!1075914 (= lt!477700 (getCurrentListMapNoExtraKeys!3885 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075914 (= lt!477699 (getCurrentListMapNoExtraKeys!3885 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075915 () Bool)

(declare-fun e!614958 () Bool)

(declare-fun e!614953 () Bool)

(assert (=> b!1075915 (= e!614958 (and e!614953 mapRes!40789))))

(declare-fun condMapEmpty!40789 () Bool)

(declare-fun mapDefault!40789 () ValueCell!12313)

