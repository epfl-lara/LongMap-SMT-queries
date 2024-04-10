; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95242 () Bool)

(assert start!95242)

(declare-fun b_free!22243 () Bool)

(declare-fun b_next!22243 () Bool)

(assert (=> start!95242 (= b_free!22243 (not b_next!22243))))

(declare-fun tp!78227 () Bool)

(declare-fun b_and!35221 () Bool)

(assert (=> start!95242 (= tp!78227 b_and!35221)))

(declare-fun b!1076552 () Bool)

(declare-fun e!615394 () Bool)

(declare-fun tp_is_empty!26053 () Bool)

(assert (=> b!1076552 (= e!615394 tp_is_empty!26053)))

(declare-fun b!1076553 () Bool)

(declare-fun e!615393 () Bool)

(assert (=> b!1076553 (= e!615393 tp_is_empty!26053)))

(declare-fun b!1076554 () Bool)

(declare-fun e!615397 () Bool)

(declare-fun e!615399 () Bool)

(assert (=> b!1076554 (= e!615397 (not e!615399))))

(declare-fun res!717518 () Bool)

(assert (=> b!1076554 (=> res!717518 e!615399)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076554 (= res!717518 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39873 0))(
  ( (V!39874 (val!13077 Int)) )
))
(declare-datatypes ((tuple2!16664 0))(
  ( (tuple2!16665 (_1!8343 (_ BitVec 64)) (_2!8343 V!39873)) )
))
(declare-datatypes ((List!23197 0))(
  ( (Nil!23194) (Cons!23193 (h!24402 tuple2!16664) (t!32556 List!23197)) )
))
(declare-datatypes ((ListLongMap!14633 0))(
  ( (ListLongMap!14634 (toList!7332 List!23197)) )
))
(declare-fun lt!478285 () ListLongMap!14633)

(declare-fun lt!478287 () ListLongMap!14633)

(assert (=> b!1076554 (= lt!478285 lt!478287)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39873)

(declare-datatypes ((Unit!35440 0))(
  ( (Unit!35441) )
))
(declare-fun lt!478295 () Unit!35440)

(declare-datatypes ((ValueCell!12323 0))(
  ( (ValueCellFull!12323 (v!15705 V!39873)) (EmptyCell!12323) )
))
(declare-datatypes ((array!69077 0))(
  ( (array!69078 (arr!33221 (Array (_ BitVec 32) ValueCell!12323)) (size!33757 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69077)

(declare-fun minValue!907 () V!39873)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39873)

(declare-datatypes ((array!69079 0))(
  ( (array!69080 (arr!33222 (Array (_ BitVec 32) (_ BitVec 64))) (size!33758 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69079)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!908 (array!69079 array!69077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 V!39873 V!39873 (_ BitVec 32) Int) Unit!35440)

(assert (=> b!1076554 (= lt!478295 (lemmaNoChangeToArrayThenSameMapNoExtras!908 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3892 (array!69079 array!69077 (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 (_ BitVec 32) Int) ListLongMap!14633)

(assert (=> b!1076554 (= lt!478287 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076554 (= lt!478285 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076555 () Bool)

(declare-fun res!717517 () Bool)

(assert (=> b!1076555 (=> (not res!717517) (not e!615397))))

(assert (=> b!1076555 (= res!717517 (and (= (size!33757 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33758 _keys!1163) (size!33757 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076556 () Bool)

(declare-fun res!717515 () Bool)

(assert (=> b!1076556 (=> (not res!717515) (not e!615397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69079 (_ BitVec 32)) Bool)

(assert (=> b!1076556 (= res!717515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!717514 () Bool)

(assert (=> start!95242 (=> (not res!717514) (not e!615397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95242 (= res!717514 (validMask!0 mask!1515))))

(assert (=> start!95242 e!615397))

(assert (=> start!95242 true))

(assert (=> start!95242 tp_is_empty!26053))

(declare-fun e!615396 () Bool)

(declare-fun array_inv!25666 (array!69077) Bool)

(assert (=> start!95242 (and (array_inv!25666 _values!955) e!615396)))

(assert (=> start!95242 tp!78227))

(declare-fun array_inv!25667 (array!69079) Bool)

(assert (=> start!95242 (array_inv!25667 _keys!1163)))

(declare-fun mapIsEmpty!40825 () Bool)

(declare-fun mapRes!40825 () Bool)

(assert (=> mapIsEmpty!40825 mapRes!40825))

(declare-fun b!1076557 () Bool)

(assert (=> b!1076557 (= e!615396 (and e!615394 mapRes!40825))))

(declare-fun condMapEmpty!40825 () Bool)

(declare-fun mapDefault!40825 () ValueCell!12323)

