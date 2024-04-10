; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94470 () Bool)

(assert start!94470)

(declare-fun b_free!21797 () Bool)

(declare-fun b_next!21797 () Bool)

(assert (=> start!94470 (= b_free!21797 (not b_next!21797))))

(declare-fun tp!76837 () Bool)

(declare-fun b_and!34589 () Bool)

(assert (=> start!94470 (= tp!76837 b_and!34589)))

(declare-fun b!1068260 () Bool)

(declare-fun e!609451 () Bool)

(declare-fun e!609455 () Bool)

(assert (=> b!1068260 (= e!609451 (not e!609455))))

(declare-fun res!712857 () Bool)

(assert (=> b!1068260 (=> res!712857 e!609455)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068260 (= res!712857 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39277 0))(
  ( (V!39278 (val!12854 Int)) )
))
(declare-datatypes ((tuple2!16326 0))(
  ( (tuple2!16327 (_1!8174 (_ BitVec 64)) (_2!8174 V!39277)) )
))
(declare-datatypes ((List!22878 0))(
  ( (Nil!22875) (Cons!22874 (h!24083 tuple2!16326) (t!32203 List!22878)) )
))
(declare-datatypes ((ListLongMap!14295 0))(
  ( (ListLongMap!14296 (toList!7163 List!22878)) )
))
(declare-fun lt!471890 () ListLongMap!14295)

(declare-fun lt!471888 () ListLongMap!14295)

(assert (=> b!1068260 (= lt!471890 lt!471888)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39277)

(declare-datatypes ((Unit!35123 0))(
  ( (Unit!35124) )
))
(declare-fun lt!471889 () Unit!35123)

(declare-datatypes ((ValueCell!12100 0))(
  ( (ValueCellFull!12100 (v!15468 V!39277)) (EmptyCell!12100) )
))
(declare-datatypes ((array!68195 0))(
  ( (array!68196 (arr!32797 (Array (_ BitVec 32) ValueCell!12100)) (size!33333 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68195)

(declare-fun minValue!907 () V!39277)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39277)

(declare-datatypes ((array!68197 0))(
  ( (array!68198 (arr!32798 (Array (_ BitVec 32) (_ BitVec 64))) (size!33334 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68197)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!780 (array!68197 array!68195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39277 V!39277 V!39277 V!39277 (_ BitVec 32) Int) Unit!35123)

(assert (=> b!1068260 (= lt!471889 (lemmaNoChangeToArrayThenSameMapNoExtras!780 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3743 (array!68197 array!68195 (_ BitVec 32) (_ BitVec 32) V!39277 V!39277 (_ BitVec 32) Int) ListLongMap!14295)

(assert (=> b!1068260 (= lt!471888 (getCurrentListMapNoExtraKeys!3743 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068260 (= lt!471890 (getCurrentListMapNoExtraKeys!3743 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068261 () Bool)

(declare-fun res!712859 () Bool)

(assert (=> b!1068261 (=> (not res!712859) (not e!609451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68197 (_ BitVec 32)) Bool)

(assert (=> b!1068261 (= res!712859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068262 () Bool)

(declare-fun e!609456 () Bool)

(assert (=> b!1068262 (= e!609455 e!609456)))

(declare-fun res!712855 () Bool)

(assert (=> b!1068262 (=> res!712855 e!609456)))

(declare-fun lt!471891 () ListLongMap!14295)

(declare-fun contains!6294 (ListLongMap!14295 (_ BitVec 64)) Bool)

(assert (=> b!1068262 (= res!712855 (contains!6294 lt!471891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4091 (array!68197 array!68195 (_ BitVec 32) (_ BitVec 32) V!39277 V!39277 (_ BitVec 32) Int) ListLongMap!14295)

(assert (=> b!1068262 (= lt!471891 (getCurrentListMap!4091 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068263 () Bool)

(assert (=> b!1068263 (= e!609456 true)))

(declare-fun -!646 (ListLongMap!14295 (_ BitVec 64)) ListLongMap!14295)

(assert (=> b!1068263 (= (-!646 lt!471891 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471891)))

(declare-fun lt!471892 () Unit!35123)

(declare-fun removeNotPresentStillSame!56 (ListLongMap!14295 (_ BitVec 64)) Unit!35123)

(assert (=> b!1068263 (= lt!471892 (removeNotPresentStillSame!56 lt!471891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!40105 () Bool)

(declare-fun mapRes!40105 () Bool)

(declare-fun tp!76838 () Bool)

(declare-fun e!609454 () Bool)

(assert (=> mapNonEmpty!40105 (= mapRes!40105 (and tp!76838 e!609454))))

(declare-fun mapKey!40105 () (_ BitVec 32))

(declare-fun mapValue!40105 () ValueCell!12100)

(declare-fun mapRest!40105 () (Array (_ BitVec 32) ValueCell!12100))

(assert (=> mapNonEmpty!40105 (= (arr!32797 _values!955) (store mapRest!40105 mapKey!40105 mapValue!40105))))

(declare-fun b!1068264 () Bool)

(declare-fun e!609457 () Bool)

(declare-fun e!609453 () Bool)

(assert (=> b!1068264 (= e!609457 (and e!609453 mapRes!40105))))

(declare-fun condMapEmpty!40105 () Bool)

(declare-fun mapDefault!40105 () ValueCell!12100)

