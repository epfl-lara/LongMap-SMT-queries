; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94686 () Bool)

(assert start!94686)

(declare-fun b_free!21955 () Bool)

(declare-fun b_next!21955 () Bool)

(assert (=> start!94686 (= b_free!21955 (not b_next!21955))))

(declare-fun tp!77320 () Bool)

(declare-fun b_and!34775 () Bool)

(assert (=> start!94686 (= tp!77320 b_and!34775)))

(declare-fun b!1070565 () Bool)

(declare-fun res!714206 () Bool)

(declare-fun e!611140 () Bool)

(assert (=> b!1070565 (=> (not res!714206) (not e!611140))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((V!39489 0))(
  ( (V!39490 (val!12933 Int)) )
))
(declare-datatypes ((ValueCell!12179 0))(
  ( (ValueCellFull!12179 (v!15549 V!39489)) (EmptyCell!12179) )
))
(declare-datatypes ((array!68505 0))(
  ( (array!68506 (arr!32949 (Array (_ BitVec 32) ValueCell!12179)) (size!33485 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68505)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68507 0))(
  ( (array!68508 (arr!32950 (Array (_ BitVec 32) (_ BitVec 64))) (size!33486 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68507)

(assert (=> b!1070565 (= res!714206 (and (= (size!33485 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33486 _keys!1163) (size!33485 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070566 () Bool)

(declare-fun res!714203 () Bool)

(assert (=> b!1070566 (=> (not res!714203) (not e!611140))))

(declare-datatypes ((List!22992 0))(
  ( (Nil!22989) (Cons!22988 (h!24197 (_ BitVec 64)) (t!32323 List!22992)) )
))
(declare-fun arrayNoDuplicates!0 (array!68507 (_ BitVec 32) List!22992) Bool)

(assert (=> b!1070566 (= res!714203 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22989))))

(declare-fun res!714205 () Bool)

(assert (=> start!94686 (=> (not res!714205) (not e!611140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94686 (= res!714205 (validMask!0 mask!1515))))

(assert (=> start!94686 e!611140))

(assert (=> start!94686 true))

(declare-fun tp_is_empty!25765 () Bool)

(assert (=> start!94686 tp_is_empty!25765))

(declare-fun e!611143 () Bool)

(declare-fun array_inv!25484 (array!68505) Bool)

(assert (=> start!94686 (and (array_inv!25484 _values!955) e!611143)))

(assert (=> start!94686 tp!77320))

(declare-fun array_inv!25485 (array!68507) Bool)

(assert (=> start!94686 (array_inv!25485 _keys!1163)))

(declare-fun mapNonEmpty!40351 () Bool)

(declare-fun mapRes!40351 () Bool)

(declare-fun tp!77321 () Bool)

(declare-fun e!611141 () Bool)

(assert (=> mapNonEmpty!40351 (= mapRes!40351 (and tp!77321 e!611141))))

(declare-fun mapRest!40351 () (Array (_ BitVec 32) ValueCell!12179))

(declare-fun mapValue!40351 () ValueCell!12179)

(declare-fun mapKey!40351 () (_ BitVec 32))

(assert (=> mapNonEmpty!40351 (= (arr!32949 _values!955) (store mapRest!40351 mapKey!40351 mapValue!40351))))

(declare-fun b!1070567 () Bool)

(assert (=> b!1070567 (= e!611141 tp_is_empty!25765)))

(declare-fun b!1070568 () Bool)

(declare-fun e!611142 () Bool)

(assert (=> b!1070568 (= e!611140 (not e!611142))))

(declare-fun res!714204 () Bool)

(assert (=> b!1070568 (=> res!714204 e!611142)))

(assert (=> b!1070568 (= res!714204 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16448 0))(
  ( (tuple2!16449 (_1!8235 (_ BitVec 64)) (_2!8235 V!39489)) )
))
(declare-datatypes ((List!22993 0))(
  ( (Nil!22990) (Cons!22989 (h!24198 tuple2!16448) (t!32324 List!22993)) )
))
(declare-datatypes ((ListLongMap!14417 0))(
  ( (ListLongMap!14418 (toList!7224 List!22993)) )
))
(declare-fun lt!473137 () ListLongMap!14417)

(declare-fun lt!473135 () ListLongMap!14417)

(assert (=> b!1070568 (= lt!473137 lt!473135)))

(declare-fun zeroValueBefore!47 () V!39489)

(declare-datatypes ((Unit!35247 0))(
  ( (Unit!35248) )
))
(declare-fun lt!473134 () Unit!35247)

(declare-fun minValue!907 () V!39489)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39489)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!837 (array!68507 array!68505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 V!39489 V!39489 (_ BitVec 32) Int) Unit!35247)

(assert (=> b!1070568 (= lt!473134 (lemmaNoChangeToArrayThenSameMapNoExtras!837 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3800 (array!68507 array!68505 (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 (_ BitVec 32) Int) ListLongMap!14417)

(assert (=> b!1070568 (= lt!473135 (getCurrentListMapNoExtraKeys!3800 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070568 (= lt!473137 (getCurrentListMapNoExtraKeys!3800 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40351 () Bool)

(assert (=> mapIsEmpty!40351 mapRes!40351))

(declare-fun b!1070569 () Bool)

(assert (=> b!1070569 (= e!611142 true)))

(declare-fun lt!473136 () ListLongMap!14417)

(declare-fun getCurrentListMap!4127 (array!68507 array!68505 (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 (_ BitVec 32) Int) ListLongMap!14417)

(assert (=> b!1070569 (= lt!473136 (getCurrentListMap!4127 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070570 () Bool)

(declare-fun e!611139 () Bool)

(assert (=> b!1070570 (= e!611143 (and e!611139 mapRes!40351))))

(declare-fun condMapEmpty!40351 () Bool)

(declare-fun mapDefault!40351 () ValueCell!12179)

