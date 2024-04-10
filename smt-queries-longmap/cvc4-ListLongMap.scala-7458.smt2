; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94660 () Bool)

(assert start!94660)

(declare-fun b_free!21929 () Bool)

(declare-fun b_next!21929 () Bool)

(assert (=> start!94660 (= b_free!21929 (not b_next!21929))))

(declare-fun tp!77243 () Bool)

(declare-fun b_and!34749 () Bool)

(assert (=> start!94660 (= tp!77243 b_and!34749)))

(declare-fun res!714009 () Bool)

(declare-fun e!610908 () Bool)

(assert (=> start!94660 (=> (not res!714009) (not e!610908))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94660 (= res!714009 (validMask!0 mask!1515))))

(assert (=> start!94660 e!610908))

(assert (=> start!94660 true))

(declare-fun tp_is_empty!25739 () Bool)

(assert (=> start!94660 tp_is_empty!25739))

(declare-datatypes ((V!39453 0))(
  ( (V!39454 (val!12920 Int)) )
))
(declare-datatypes ((ValueCell!12166 0))(
  ( (ValueCellFull!12166 (v!15536 V!39453)) (EmptyCell!12166) )
))
(declare-datatypes ((array!68453 0))(
  ( (array!68454 (arr!32923 (Array (_ BitVec 32) ValueCell!12166)) (size!33459 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68453)

(declare-fun e!610904 () Bool)

(declare-fun array_inv!25468 (array!68453) Bool)

(assert (=> start!94660 (and (array_inv!25468 _values!955) e!610904)))

(assert (=> start!94660 tp!77243))

(declare-datatypes ((array!68455 0))(
  ( (array!68456 (arr!32924 (Array (_ BitVec 32) (_ BitVec 64))) (size!33460 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68455)

(declare-fun array_inv!25469 (array!68455) Bool)

(assert (=> start!94660 (array_inv!25469 _keys!1163)))

(declare-fun b!1070253 () Bool)

(declare-fun res!714008 () Bool)

(assert (=> b!1070253 (=> (not res!714008) (not e!610908))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070253 (= res!714008 (and (= (size!33459 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33460 _keys!1163) (size!33459 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070254 () Bool)

(declare-fun res!714012 () Bool)

(assert (=> b!1070254 (=> (not res!714012) (not e!610908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68455 (_ BitVec 32)) Bool)

(assert (=> b!1070254 (= res!714012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070255 () Bool)

(declare-fun e!610907 () Bool)

(assert (=> b!1070255 (= e!610908 (not e!610907))))

(declare-fun res!714011 () Bool)

(assert (=> b!1070255 (=> res!714011 e!610907)))

(assert (=> b!1070255 (= res!714011 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16426 0))(
  ( (tuple2!16427 (_1!8224 (_ BitVec 64)) (_2!8224 V!39453)) )
))
(declare-datatypes ((List!22969 0))(
  ( (Nil!22966) (Cons!22965 (h!24174 tuple2!16426) (t!32300 List!22969)) )
))
(declare-datatypes ((ListLongMap!14395 0))(
  ( (ListLongMap!14396 (toList!7213 List!22969)) )
))
(declare-fun lt!472981 () ListLongMap!14395)

(declare-fun lt!472979 () ListLongMap!14395)

(assert (=> b!1070255 (= lt!472981 lt!472979)))

(declare-fun zeroValueBefore!47 () V!39453)

(declare-datatypes ((Unit!35225 0))(
  ( (Unit!35226) )
))
(declare-fun lt!472978 () Unit!35225)

(declare-fun minValue!907 () V!39453)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39453)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!826 (array!68455 array!68453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39453 V!39453 V!39453 V!39453 (_ BitVec 32) Int) Unit!35225)

(assert (=> b!1070255 (= lt!472978 (lemmaNoChangeToArrayThenSameMapNoExtras!826 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3789 (array!68455 array!68453 (_ BitVec 32) (_ BitVec 32) V!39453 V!39453 (_ BitVec 32) Int) ListLongMap!14395)

(assert (=> b!1070255 (= lt!472979 (getCurrentListMapNoExtraKeys!3789 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070255 (= lt!472981 (getCurrentListMapNoExtraKeys!3789 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070256 () Bool)

(assert (=> b!1070256 (= e!610907 true)))

(declare-fun lt!472980 () ListLongMap!14395)

(declare-fun getCurrentListMap!4116 (array!68455 array!68453 (_ BitVec 32) (_ BitVec 32) V!39453 V!39453 (_ BitVec 32) Int) ListLongMap!14395)

(assert (=> b!1070256 (= lt!472980 (getCurrentListMap!4116 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070257 () Bool)

(declare-fun e!610906 () Bool)

(assert (=> b!1070257 (= e!610906 tp_is_empty!25739)))

(declare-fun b!1070258 () Bool)

(declare-fun e!610905 () Bool)

(assert (=> b!1070258 (= e!610905 tp_is_empty!25739)))

(declare-fun mapIsEmpty!40312 () Bool)

(declare-fun mapRes!40312 () Bool)

(assert (=> mapIsEmpty!40312 mapRes!40312))

(declare-fun b!1070259 () Bool)

(assert (=> b!1070259 (= e!610904 (and e!610905 mapRes!40312))))

(declare-fun condMapEmpty!40312 () Bool)

(declare-fun mapDefault!40312 () ValueCell!12166)

