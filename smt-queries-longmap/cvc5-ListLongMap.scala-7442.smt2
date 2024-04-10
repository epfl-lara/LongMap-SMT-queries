; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94524 () Bool)

(assert start!94524)

(declare-fun b_free!21829 () Bool)

(declare-fun b_next!21829 () Bool)

(assert (=> start!94524 (= b_free!21829 (not b_next!21829))))

(declare-fun tp!76936 () Bool)

(declare-fun b_and!34631 () Bool)

(assert (=> start!94524 (= tp!76936 b_and!34631)))

(declare-fun b!1068849 () Bool)

(declare-fun res!713205 () Bool)

(declare-fun e!609893 () Bool)

(assert (=> b!1068849 (=> (not res!713205) (not e!609893))))

(declare-datatypes ((array!68255 0))(
  ( (array!68256 (arr!32826 (Array (_ BitVec 32) (_ BitVec 64))) (size!33362 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68255)

(declare-datatypes ((List!22899 0))(
  ( (Nil!22896) (Cons!22895 (h!24104 (_ BitVec 64)) (t!32226 List!22899)) )
))
(declare-fun arrayNoDuplicates!0 (array!68255 (_ BitVec 32) List!22899) Bool)

(assert (=> b!1068849 (= res!713205 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22896))))

(declare-fun b!1068850 () Bool)

(declare-fun e!609890 () Bool)

(declare-fun tp_is_empty!25639 () Bool)

(assert (=> b!1068850 (= e!609890 tp_is_empty!25639)))

(declare-fun b!1068851 () Bool)

(declare-fun e!609891 () Bool)

(assert (=> b!1068851 (= e!609891 tp_is_empty!25639)))

(declare-fun b!1068852 () Bool)

(declare-fun res!713206 () Bool)

(assert (=> b!1068852 (=> (not res!713206) (not e!609893))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68255 (_ BitVec 32)) Bool)

(assert (=> b!1068852 (= res!713206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!713204 () Bool)

(assert (=> start!94524 (=> (not res!713204) (not e!609893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94524 (= res!713204 (validMask!0 mask!1515))))

(assert (=> start!94524 e!609893))

(assert (=> start!94524 true))

(assert (=> start!94524 tp_is_empty!25639))

(declare-datatypes ((V!39321 0))(
  ( (V!39322 (val!12870 Int)) )
))
(declare-datatypes ((ValueCell!12116 0))(
  ( (ValueCellFull!12116 (v!15485 V!39321)) (EmptyCell!12116) )
))
(declare-datatypes ((array!68257 0))(
  ( (array!68258 (arr!32827 (Array (_ BitVec 32) ValueCell!12116)) (size!33363 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68257)

(declare-fun e!609888 () Bool)

(declare-fun array_inv!25408 (array!68257) Bool)

(assert (=> start!94524 (and (array_inv!25408 _values!955) e!609888)))

(assert (=> start!94524 tp!76936))

(declare-fun array_inv!25409 (array!68255) Bool)

(assert (=> start!94524 (array_inv!25409 _keys!1163)))

(declare-fun b!1068853 () Bool)

(declare-fun e!609892 () Bool)

(assert (=> b!1068853 (= e!609892 true)))

(declare-datatypes ((tuple2!16352 0))(
  ( (tuple2!16353 (_1!8187 (_ BitVec 64)) (_2!8187 V!39321)) )
))
(declare-datatypes ((List!22900 0))(
  ( (Nil!22897) (Cons!22896 (h!24105 tuple2!16352) (t!32227 List!22900)) )
))
(declare-datatypes ((ListLongMap!14321 0))(
  ( (ListLongMap!14322 (toList!7176 List!22900)) )
))
(declare-fun lt!472254 () ListLongMap!14321)

(declare-fun -!657 (ListLongMap!14321 (_ BitVec 64)) ListLongMap!14321)

(assert (=> b!1068853 (= (-!657 lt!472254 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472254)))

(declare-datatypes ((Unit!35151 0))(
  ( (Unit!35152) )
))
(declare-fun lt!472252 () Unit!35151)

(declare-fun removeNotPresentStillSame!67 (ListLongMap!14321 (_ BitVec 64)) Unit!35151)

(assert (=> b!1068853 (= lt!472252 (removeNotPresentStillSame!67 lt!472254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068854 () Bool)

(declare-fun e!609887 () Bool)

(assert (=> b!1068854 (= e!609887 e!609892)))

(declare-fun res!713207 () Bool)

(assert (=> b!1068854 (=> res!713207 e!609892)))

(declare-fun contains!6304 (ListLongMap!14321 (_ BitVec 64)) Bool)

(assert (=> b!1068854 (= res!713207 (contains!6304 lt!472254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39321)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39321)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4100 (array!68255 array!68257 (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 (_ BitVec 32) Int) ListLongMap!14321)

(assert (=> b!1068854 (= lt!472254 (getCurrentListMap!4100 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068855 () Bool)

(declare-fun res!713209 () Bool)

(assert (=> b!1068855 (=> (not res!713209) (not e!609893))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1068855 (= res!713209 (and (= (size!33363 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33362 _keys!1163) (size!33363 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40156 () Bool)

(declare-fun mapRes!40156 () Bool)

(declare-fun tp!76937 () Bool)

(assert (=> mapNonEmpty!40156 (= mapRes!40156 (and tp!76937 e!609891))))

(declare-fun mapValue!40156 () ValueCell!12116)

(declare-fun mapRest!40156 () (Array (_ BitVec 32) ValueCell!12116))

(declare-fun mapKey!40156 () (_ BitVec 32))

(assert (=> mapNonEmpty!40156 (= (arr!32827 _values!955) (store mapRest!40156 mapKey!40156 mapValue!40156))))

(declare-fun b!1068856 () Bool)

(assert (=> b!1068856 (= e!609888 (and e!609890 mapRes!40156))))

(declare-fun condMapEmpty!40156 () Bool)

(declare-fun mapDefault!40156 () ValueCell!12116)

