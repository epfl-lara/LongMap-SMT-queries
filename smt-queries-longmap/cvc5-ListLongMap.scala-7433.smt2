; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94448 () Bool)

(assert start!94448)

(declare-fun b_free!21775 () Bool)

(declare-fun b_next!21775 () Bool)

(assert (=> start!94448 (= b_free!21775 (not b_next!21775))))

(declare-fun tp!76772 () Bool)

(declare-fun b_and!34567 () Bool)

(assert (=> start!94448 (= tp!76772 b_and!34567)))

(declare-fun mapIsEmpty!40072 () Bool)

(declare-fun mapRes!40072 () Bool)

(assert (=> mapIsEmpty!40072 mapRes!40072))

(declare-fun b!1067963 () Bool)

(declare-fun res!712662 () Bool)

(declare-fun e!609224 () Bool)

(assert (=> b!1067963 (=> (not res!712662) (not e!609224))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39249 0))(
  ( (V!39250 (val!12843 Int)) )
))
(declare-datatypes ((ValueCell!12089 0))(
  ( (ValueCellFull!12089 (v!15457 V!39249)) (EmptyCell!12089) )
))
(declare-datatypes ((array!68153 0))(
  ( (array!68154 (arr!32776 (Array (_ BitVec 32) ValueCell!12089)) (size!33312 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68153)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68155 0))(
  ( (array!68156 (arr!32777 (Array (_ BitVec 32) (_ BitVec 64))) (size!33313 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68155)

(assert (=> b!1067963 (= res!712662 (and (= (size!33312 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33313 _keys!1163) (size!33312 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712661 () Bool)

(assert (=> start!94448 (=> (not res!712661) (not e!609224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94448 (= res!712661 (validMask!0 mask!1515))))

(assert (=> start!94448 e!609224))

(assert (=> start!94448 true))

(declare-fun tp_is_empty!25585 () Bool)

(assert (=> start!94448 tp_is_empty!25585))

(declare-fun e!609223 () Bool)

(declare-fun array_inv!25376 (array!68153) Bool)

(assert (=> start!94448 (and (array_inv!25376 _values!955) e!609223)))

(assert (=> start!94448 tp!76772))

(declare-fun array_inv!25377 (array!68155) Bool)

(assert (=> start!94448 (array_inv!25377 _keys!1163)))

(declare-fun b!1067964 () Bool)

(declare-fun e!609220 () Bool)

(assert (=> b!1067964 (= e!609224 (not e!609220))))

(declare-fun res!712659 () Bool)

(assert (=> b!1067964 (=> res!712659 e!609220)))

(assert (=> b!1067964 (= res!712659 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16306 0))(
  ( (tuple2!16307 (_1!8164 (_ BitVec 64)) (_2!8164 V!39249)) )
))
(declare-datatypes ((List!22860 0))(
  ( (Nil!22857) (Cons!22856 (h!24065 tuple2!16306) (t!32185 List!22860)) )
))
(declare-datatypes ((ListLongMap!14275 0))(
  ( (ListLongMap!14276 (toList!7153 List!22860)) )
))
(declare-fun lt!471724 () ListLongMap!14275)

(declare-fun lt!471725 () ListLongMap!14275)

(assert (=> b!1067964 (= lt!471724 lt!471725)))

(declare-datatypes ((Unit!35103 0))(
  ( (Unit!35104) )
))
(declare-fun lt!471723 () Unit!35103)

(declare-fun zeroValueBefore!47 () V!39249)

(declare-fun minValue!907 () V!39249)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39249)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!771 (array!68155 array!68153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 V!39249 V!39249 (_ BitVec 32) Int) Unit!35103)

(assert (=> b!1067964 (= lt!471723 (lemmaNoChangeToArrayThenSameMapNoExtras!771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3734 (array!68155 array!68153 (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 (_ BitVec 32) Int) ListLongMap!14275)

(assert (=> b!1067964 (= lt!471725 (getCurrentListMapNoExtraKeys!3734 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067964 (= lt!471724 (getCurrentListMapNoExtraKeys!3734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40072 () Bool)

(declare-fun tp!76771 () Bool)

(declare-fun e!609225 () Bool)

(assert (=> mapNonEmpty!40072 (= mapRes!40072 (and tp!76771 e!609225))))

(declare-fun mapValue!40072 () ValueCell!12089)

(declare-fun mapRest!40072 () (Array (_ BitVec 32) ValueCell!12089))

(declare-fun mapKey!40072 () (_ BitVec 32))

(assert (=> mapNonEmpty!40072 (= (arr!32776 _values!955) (store mapRest!40072 mapKey!40072 mapValue!40072))))

(declare-fun b!1067965 () Bool)

(declare-fun e!609221 () Bool)

(assert (=> b!1067965 (= e!609220 e!609221)))

(declare-fun res!712657 () Bool)

(assert (=> b!1067965 (=> res!712657 e!609221)))

(declare-fun lt!471726 () ListLongMap!14275)

(declare-fun contains!6288 (ListLongMap!14275 (_ BitVec 64)) Bool)

(assert (=> b!1067965 (= res!712657 (contains!6288 lt!471726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4085 (array!68155 array!68153 (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 (_ BitVec 32) Int) ListLongMap!14275)

(assert (=> b!1067965 (= lt!471726 (getCurrentListMap!4085 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067966 () Bool)

(declare-fun e!609222 () Bool)

(assert (=> b!1067966 (= e!609222 tp_is_empty!25585)))

(declare-fun b!1067967 () Bool)

(assert (=> b!1067967 (= e!609221 true)))

(declare-fun -!638 (ListLongMap!14275 (_ BitVec 64)) ListLongMap!14275)

(assert (=> b!1067967 (= (-!638 lt!471726 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471726)))

(declare-fun lt!471727 () Unit!35103)

(declare-fun removeNotPresentStillSame!48 (ListLongMap!14275 (_ BitVec 64)) Unit!35103)

(assert (=> b!1067967 (= lt!471727 (removeNotPresentStillSame!48 lt!471726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067968 () Bool)

(assert (=> b!1067968 (= e!609225 tp_is_empty!25585)))

(declare-fun b!1067969 () Bool)

(declare-fun res!712660 () Bool)

(assert (=> b!1067969 (=> (not res!712660) (not e!609224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68155 (_ BitVec 32)) Bool)

(assert (=> b!1067969 (= res!712660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067970 () Bool)

(declare-fun res!712658 () Bool)

(assert (=> b!1067970 (=> (not res!712658) (not e!609224))))

(declare-datatypes ((List!22861 0))(
  ( (Nil!22858) (Cons!22857 (h!24066 (_ BitVec 64)) (t!32186 List!22861)) )
))
(declare-fun arrayNoDuplicates!0 (array!68155 (_ BitVec 32) List!22861) Bool)

(assert (=> b!1067970 (= res!712658 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22858))))

(declare-fun b!1067971 () Bool)

(assert (=> b!1067971 (= e!609223 (and e!609222 mapRes!40072))))

(declare-fun condMapEmpty!40072 () Bool)

(declare-fun mapDefault!40072 () ValueCell!12089)

