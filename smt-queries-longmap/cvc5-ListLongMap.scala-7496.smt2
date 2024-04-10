; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94948 () Bool)

(assert start!94948)

(declare-fun b_free!22153 () Bool)

(declare-fun b_next!22153 () Bool)

(assert (=> start!94948 (= b_free!22153 (not b_next!22153))))

(declare-fun tp!77924 () Bool)

(declare-fun b_and!35007 () Bool)

(assert (=> start!94948 (= tp!77924 b_and!35007)))

(declare-fun b!1073552 () Bool)

(declare-fun e!613342 () Bool)

(declare-fun tp_is_empty!25963 () Bool)

(assert (=> b!1073552 (= e!613342 tp_is_empty!25963)))

(declare-fun mapNonEmpty!40657 () Bool)

(declare-fun mapRes!40657 () Bool)

(declare-fun tp!77923 () Bool)

(assert (=> mapNonEmpty!40657 (= mapRes!40657 (and tp!77923 e!613342))))

(declare-datatypes ((V!39753 0))(
  ( (V!39754 (val!13032 Int)) )
))
(declare-datatypes ((ValueCell!12278 0))(
  ( (ValueCellFull!12278 (v!15650 V!39753)) (EmptyCell!12278) )
))
(declare-fun mapValue!40657 () ValueCell!12278)

(declare-fun mapRest!40657 () (Array (_ BitVec 32) ValueCell!12278))

(declare-datatypes ((array!68887 0))(
  ( (array!68888 (arr!33137 (Array (_ BitVec 32) ValueCell!12278)) (size!33673 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68887)

(declare-fun mapKey!40657 () (_ BitVec 32))

(assert (=> mapNonEmpty!40657 (= (arr!33137 _values!955) (store mapRest!40657 mapKey!40657 mapValue!40657))))

(declare-fun b!1073553 () Bool)

(declare-fun res!716006 () Bool)

(declare-fun e!613340 () Bool)

(assert (=> b!1073553 (=> (not res!716006) (not e!613340))))

(declare-datatypes ((array!68889 0))(
  ( (array!68890 (arr!33138 (Array (_ BitVec 32) (_ BitVec 64))) (size!33674 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68889)

(declare-datatypes ((List!23132 0))(
  ( (Nil!23129) (Cons!23128 (h!24337 (_ BitVec 64)) (t!32469 List!23132)) )
))
(declare-fun arrayNoDuplicates!0 (array!68889 (_ BitVec 32) List!23132) Bool)

(assert (=> b!1073553 (= res!716006 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23129))))

(declare-fun b!1073554 () Bool)

(declare-fun res!716005 () Bool)

(assert (=> b!1073554 (=> (not res!716005) (not e!613340))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68889 (_ BitVec 32)) Bool)

(assert (=> b!1073554 (= res!716005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073555 () Bool)

(declare-fun res!716007 () Bool)

(assert (=> b!1073555 (=> (not res!716007) (not e!613340))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073555 (= res!716007 (and (= (size!33673 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33674 _keys!1163) (size!33673 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073556 () Bool)

(assert (=> b!1073556 (= e!613340 (bvsgt #b00000000000000000000000000000000 (size!33674 _keys!1163)))))

(declare-fun minValue!907 () V!39753)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39753)

(declare-datatypes ((tuple2!16594 0))(
  ( (tuple2!16595 (_1!8308 (_ BitVec 64)) (_2!8308 V!39753)) )
))
(declare-datatypes ((List!23133 0))(
  ( (Nil!23130) (Cons!23129 (h!24338 tuple2!16594) (t!32470 List!23133)) )
))
(declare-datatypes ((ListLongMap!14563 0))(
  ( (ListLongMap!14564 (toList!7297 List!23133)) )
))
(declare-fun lt!476079 () ListLongMap!14563)

(declare-fun getCurrentListMapNoExtraKeys!3861 (array!68889 array!68887 (_ BitVec 32) (_ BitVec 32) V!39753 V!39753 (_ BitVec 32) Int) ListLongMap!14563)

(assert (=> b!1073556 (= lt!476079 (getCurrentListMapNoExtraKeys!3861 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39753)

(declare-fun lt!476080 () ListLongMap!14563)

(assert (=> b!1073556 (= lt!476080 (getCurrentListMapNoExtraKeys!3861 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716008 () Bool)

(assert (=> start!94948 (=> (not res!716008) (not e!613340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94948 (= res!716008 (validMask!0 mask!1515))))

(assert (=> start!94948 e!613340))

(assert (=> start!94948 true))

(assert (=> start!94948 tp_is_empty!25963))

(declare-fun e!613341 () Bool)

(declare-fun array_inv!25610 (array!68887) Bool)

(assert (=> start!94948 (and (array_inv!25610 _values!955) e!613341)))

(assert (=> start!94948 tp!77924))

(declare-fun array_inv!25611 (array!68889) Bool)

(assert (=> start!94948 (array_inv!25611 _keys!1163)))

(declare-fun mapIsEmpty!40657 () Bool)

(assert (=> mapIsEmpty!40657 mapRes!40657))

(declare-fun b!1073557 () Bool)

(declare-fun e!613339 () Bool)

(assert (=> b!1073557 (= e!613339 tp_is_empty!25963)))

(declare-fun b!1073558 () Bool)

(assert (=> b!1073558 (= e!613341 (and e!613339 mapRes!40657))))

(declare-fun condMapEmpty!40657 () Bool)

(declare-fun mapDefault!40657 () ValueCell!12278)

