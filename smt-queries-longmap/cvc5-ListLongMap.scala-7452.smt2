; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94606 () Bool)

(assert start!94606)

(declare-fun b_free!21889 () Bool)

(declare-fun b_next!21889 () Bool)

(assert (=> start!94606 (= b_free!21889 (not b_next!21889))))

(declare-fun tp!77120 () Bool)

(declare-fun b_and!34701 () Bool)

(assert (=> start!94606 (= tp!77120 b_and!34701)))

(declare-fun b!1069722 () Bool)

(declare-fun res!713712 () Bool)

(declare-fun e!610526 () Bool)

(assert (=> b!1069722 (=> (not res!713712) (not e!610526))))

(declare-datatypes ((array!68375 0))(
  ( (array!68376 (arr!32885 (Array (_ BitVec 32) (_ BitVec 64))) (size!33421 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68375)

(declare-datatypes ((List!22939 0))(
  ( (Nil!22936) (Cons!22935 (h!24144 (_ BitVec 64)) (t!32268 List!22939)) )
))
(declare-fun arrayNoDuplicates!0 (array!68375 (_ BitVec 32) List!22939) Bool)

(assert (=> b!1069722 (= res!713712 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22936))))

(declare-fun b!1069723 () Bool)

(assert (=> b!1069723 (= e!610526 (not true))))

(declare-datatypes ((V!39401 0))(
  ( (V!39402 (val!12900 Int)) )
))
(declare-datatypes ((tuple2!16396 0))(
  ( (tuple2!16397 (_1!8209 (_ BitVec 64)) (_2!8209 V!39401)) )
))
(declare-datatypes ((List!22940 0))(
  ( (Nil!22937) (Cons!22936 (h!24145 tuple2!16396) (t!32269 List!22940)) )
))
(declare-datatypes ((ListLongMap!14365 0))(
  ( (ListLongMap!14366 (toList!7198 List!22940)) )
))
(declare-fun lt!472734 () ListLongMap!14365)

(declare-fun lt!472733 () ListLongMap!14365)

(assert (=> b!1069723 (= lt!472734 lt!472733)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39401)

(declare-datatypes ((Unit!35195 0))(
  ( (Unit!35196) )
))
(declare-fun lt!472732 () Unit!35195)

(declare-datatypes ((ValueCell!12146 0))(
  ( (ValueCellFull!12146 (v!15516 V!39401)) (EmptyCell!12146) )
))
(declare-datatypes ((array!68377 0))(
  ( (array!68378 (arr!32886 (Array (_ BitVec 32) ValueCell!12146)) (size!33422 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68377)

(declare-fun minValue!907 () V!39401)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39401)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!811 (array!68375 array!68377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39401 V!39401 V!39401 V!39401 (_ BitVec 32) Int) Unit!35195)

(assert (=> b!1069723 (= lt!472732 (lemmaNoChangeToArrayThenSameMapNoExtras!811 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3774 (array!68375 array!68377 (_ BitVec 32) (_ BitVec 32) V!39401 V!39401 (_ BitVec 32) Int) ListLongMap!14365)

(assert (=> b!1069723 (= lt!472733 (getCurrentListMapNoExtraKeys!3774 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069723 (= lt!472734 (getCurrentListMapNoExtraKeys!3774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069724 () Bool)

(declare-fun e!610525 () Bool)

(declare-fun tp_is_empty!25699 () Bool)

(assert (=> b!1069724 (= e!610525 tp_is_empty!25699)))

(declare-fun b!1069725 () Bool)

(declare-fun res!713714 () Bool)

(assert (=> b!1069725 (=> (not res!713714) (not e!610526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68375 (_ BitVec 32)) Bool)

(assert (=> b!1069725 (= res!713714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40249 () Bool)

(declare-fun mapRes!40249 () Bool)

(declare-fun tp!77119 () Bool)

(assert (=> mapNonEmpty!40249 (= mapRes!40249 (and tp!77119 e!610525))))

(declare-fun mapValue!40249 () ValueCell!12146)

(declare-fun mapRest!40249 () (Array (_ BitVec 32) ValueCell!12146))

(declare-fun mapKey!40249 () (_ BitVec 32))

(assert (=> mapNonEmpty!40249 (= (arr!32886 _values!955) (store mapRest!40249 mapKey!40249 mapValue!40249))))

(declare-fun b!1069727 () Bool)

(declare-fun e!610527 () Bool)

(declare-fun e!610523 () Bool)

(assert (=> b!1069727 (= e!610527 (and e!610523 mapRes!40249))))

(declare-fun condMapEmpty!40249 () Bool)

(declare-fun mapDefault!40249 () ValueCell!12146)

