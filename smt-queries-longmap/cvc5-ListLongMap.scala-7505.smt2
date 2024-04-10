; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95128 () Bool)

(assert start!95128)

(declare-fun b_free!22207 () Bool)

(declare-fun b_next!22207 () Bool)

(assert (=> start!95128 (= b_free!22207 (not b_next!22207))))

(declare-fun tp!78107 () Bool)

(declare-fun b_and!35137 () Bool)

(assert (=> start!95128 (= tp!78107 b_and!35137)))

(declare-fun b!1075342 () Bool)

(declare-fun e!614562 () Bool)

(declare-fun tp_is_empty!26017 () Bool)

(assert (=> b!1075342 (= e!614562 tp_is_empty!26017)))

(declare-fun b!1075343 () Bool)

(declare-fun res!716891 () Bool)

(declare-fun e!614561 () Bool)

(assert (=> b!1075343 (=> (not res!716891) (not e!614561))))

(declare-datatypes ((array!69003 0))(
  ( (array!69004 (arr!33188 (Array (_ BitVec 32) (_ BitVec 64))) (size!33724 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69003)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69003 (_ BitVec 32)) Bool)

(assert (=> b!1075343 (= res!716891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075344 () Bool)

(declare-fun e!614560 () Bool)

(assert (=> b!1075344 (= e!614560 tp_is_empty!26017)))

(declare-fun mapIsEmpty!40759 () Bool)

(declare-fun mapRes!40759 () Bool)

(assert (=> mapIsEmpty!40759 mapRes!40759))

(declare-fun res!716886 () Bool)

(assert (=> start!95128 (=> (not res!716886) (not e!614561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95128 (= res!716886 (validMask!0 mask!1515))))

(assert (=> start!95128 e!614561))

(assert (=> start!95128 true))

(assert (=> start!95128 tp_is_empty!26017))

(declare-datatypes ((V!39825 0))(
  ( (V!39826 (val!13059 Int)) )
))
(declare-datatypes ((ValueCell!12305 0))(
  ( (ValueCellFull!12305 (v!15683 V!39825)) (EmptyCell!12305) )
))
(declare-datatypes ((array!69005 0))(
  ( (array!69006 (arr!33189 (Array (_ BitVec 32) ValueCell!12305)) (size!33725 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69005)

(declare-fun e!614563 () Bool)

(declare-fun array_inv!25646 (array!69005) Bool)

(assert (=> start!95128 (and (array_inv!25646 _values!955) e!614563)))

(assert (=> start!95128 tp!78107))

(declare-fun array_inv!25647 (array!69003) Bool)

(assert (=> start!95128 (array_inv!25647 _keys!1163)))

(declare-fun b!1075345 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39825)

(declare-fun minValue!907 () V!39825)

(declare-datatypes ((tuple2!16638 0))(
  ( (tuple2!16639 (_1!8330 (_ BitVec 64)) (_2!8330 V!39825)) )
))
(declare-datatypes ((List!23174 0))(
  ( (Nil!23171) (Cons!23170 (h!24379 tuple2!16638) (t!32525 List!23174)) )
))
(declare-datatypes ((ListLongMap!14607 0))(
  ( (ListLongMap!14608 (toList!7319 List!23174)) )
))
(declare-fun lt!477312 () ListLongMap!14607)

(declare-fun e!614565 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun getCurrentListMap!4188 (array!69003 array!69005 (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 (_ BitVec 32) Int) ListLongMap!14607)

(assert (=> b!1075345 (= e!614565 (= lt!477312 (getCurrentListMap!4188 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!477308 () ListLongMap!14607)

(assert (=> b!1075345 (= lt!477312 lt!477308)))

(declare-fun -!713 (ListLongMap!14607 (_ BitVec 64)) ListLongMap!14607)

(assert (=> b!1075345 (= lt!477312 (-!713 lt!477308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35406 0))(
  ( (Unit!35407) )
))
(declare-fun lt!477307 () Unit!35406)

(declare-fun removeNotPresentStillSame!81 (ListLongMap!14607 (_ BitVec 64)) Unit!35406)

(assert (=> b!1075345 (= lt!477307 (removeNotPresentStillSame!81 lt!477308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075346 () Bool)

(declare-fun res!716888 () Bool)

(assert (=> b!1075346 (=> (not res!716888) (not e!614561))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075346 (= res!716888 (and (= (size!33725 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33724 _keys!1163) (size!33725 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075347 () Bool)

(declare-fun e!614566 () Bool)

(assert (=> b!1075347 (= e!614566 e!614565)))

(declare-fun res!716887 () Bool)

(assert (=> b!1075347 (=> res!716887 e!614565)))

(declare-fun contains!6347 (ListLongMap!14607 (_ BitVec 64)) Bool)

(assert (=> b!1075347 (= res!716887 (contains!6347 lt!477308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39825)

(assert (=> b!1075347 (= lt!477308 (getCurrentListMap!4188 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075348 () Bool)

(assert (=> b!1075348 (= e!614561 (not e!614566))))

(declare-fun res!716890 () Bool)

(assert (=> b!1075348 (=> res!716890 e!614566)))

(assert (=> b!1075348 (= res!716890 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!477309 () ListLongMap!14607)

(declare-fun lt!477310 () ListLongMap!14607)

(assert (=> b!1075348 (= lt!477309 lt!477310)))

(declare-fun lt!477311 () Unit!35406)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!897 (array!69003 array!69005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 V!39825 V!39825 (_ BitVec 32) Int) Unit!35406)

(assert (=> b!1075348 (= lt!477311 (lemmaNoChangeToArrayThenSameMapNoExtras!897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3881 (array!69003 array!69005 (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 (_ BitVec 32) Int) ListLongMap!14607)

(assert (=> b!1075348 (= lt!477310 (getCurrentListMapNoExtraKeys!3881 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075348 (= lt!477309 (getCurrentListMapNoExtraKeys!3881 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40759 () Bool)

(declare-fun tp!78106 () Bool)

(assert (=> mapNonEmpty!40759 (= mapRes!40759 (and tp!78106 e!614560))))

(declare-fun mapRest!40759 () (Array (_ BitVec 32) ValueCell!12305))

(declare-fun mapValue!40759 () ValueCell!12305)

(declare-fun mapKey!40759 () (_ BitVec 32))

(assert (=> mapNonEmpty!40759 (= (arr!33189 _values!955) (store mapRest!40759 mapKey!40759 mapValue!40759))))

(declare-fun b!1075349 () Bool)

(assert (=> b!1075349 (= e!614563 (and e!614562 mapRes!40759))))

(declare-fun condMapEmpty!40759 () Bool)

(declare-fun mapDefault!40759 () ValueCell!12305)

