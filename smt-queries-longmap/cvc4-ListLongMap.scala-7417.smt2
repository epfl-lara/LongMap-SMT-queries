; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94320 () Bool)

(assert start!94320)

(declare-fun b_free!21683 () Bool)

(declare-fun b_next!21683 () Bool)

(assert (=> start!94320 (= b_free!21683 (not b_next!21683))))

(declare-fun tp!76489 () Bool)

(declare-fun b_and!34455 () Bool)

(assert (=> start!94320 (= tp!76489 b_and!34455)))

(declare-fun b!1066633 () Bool)

(declare-fun e!608265 () Bool)

(declare-fun e!608261 () Bool)

(assert (=> b!1066633 (= e!608265 (not e!608261))))

(declare-fun res!711898 () Bool)

(assert (=> b!1066633 (=> res!711898 e!608261)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066633 (= res!711898 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39125 0))(
  ( (V!39126 (val!12797 Int)) )
))
(declare-datatypes ((tuple2!16232 0))(
  ( (tuple2!16233 (_1!8127 (_ BitVec 64)) (_2!8127 V!39125)) )
))
(declare-datatypes ((List!22795 0))(
  ( (Nil!22792) (Cons!22791 (h!24000 tuple2!16232) (t!32116 List!22795)) )
))
(declare-datatypes ((ListLongMap!14201 0))(
  ( (ListLongMap!14202 (toList!7116 List!22795)) )
))
(declare-fun lt!470998 () ListLongMap!14201)

(declare-fun lt!471000 () ListLongMap!14201)

(assert (=> b!1066633 (= lt!470998 lt!471000)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39125)

(declare-datatypes ((Unit!35027 0))(
  ( (Unit!35028) )
))
(declare-fun lt!471001 () Unit!35027)

(declare-datatypes ((ValueCell!12043 0))(
  ( (ValueCellFull!12043 (v!15410 V!39125)) (EmptyCell!12043) )
))
(declare-datatypes ((array!67971 0))(
  ( (array!67972 (arr!32687 (Array (_ BitVec 32) ValueCell!12043)) (size!33223 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67971)

(declare-fun minValue!907 () V!39125)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39125)

(declare-datatypes ((array!67973 0))(
  ( (array!67974 (arr!32688 (Array (_ BitVec 32) (_ BitVec 64))) (size!33224 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67973)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!738 (array!67973 array!67971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39125 V!39125 V!39125 V!39125 (_ BitVec 32) Int) Unit!35027)

(assert (=> b!1066633 (= lt!471001 (lemmaNoChangeToArrayThenSameMapNoExtras!738 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3701 (array!67973 array!67971 (_ BitVec 32) (_ BitVec 32) V!39125 V!39125 (_ BitVec 32) Int) ListLongMap!14201)

(assert (=> b!1066633 (= lt!471000 (getCurrentListMapNoExtraKeys!3701 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066633 (= lt!470998 (getCurrentListMapNoExtraKeys!3701 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066634 () Bool)

(declare-fun res!711901 () Bool)

(assert (=> b!1066634 (=> (not res!711901) (not e!608265))))

(declare-datatypes ((List!22796 0))(
  ( (Nil!22793) (Cons!22792 (h!24001 (_ BitVec 64)) (t!32117 List!22796)) )
))
(declare-fun arrayNoDuplicates!0 (array!67973 (_ BitVec 32) List!22796) Bool)

(assert (=> b!1066634 (= res!711901 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22793))))

(declare-fun b!1066635 () Bool)

(declare-fun e!608263 () Bool)

(declare-fun e!608264 () Bool)

(declare-fun mapRes!39928 () Bool)

(assert (=> b!1066635 (= e!608263 (and e!608264 mapRes!39928))))

(declare-fun condMapEmpty!39928 () Bool)

(declare-fun mapDefault!39928 () ValueCell!12043)

