; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94628 () Bool)

(assert start!94628)

(declare-fun b_free!21911 () Bool)

(declare-fun b_next!21911 () Bool)

(assert (=> start!94628 (= b_free!21911 (not b_next!21911))))

(declare-fun tp!77185 () Bool)

(declare-fun b_and!34723 () Bool)

(assert (=> start!94628 (= tp!77185 b_and!34723)))

(declare-fun res!713843 () Bool)

(declare-fun e!610692 () Bool)

(assert (=> start!94628 (=> (not res!713843) (not e!610692))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94628 (= res!713843 (validMask!0 mask!1515))))

(assert (=> start!94628 e!610692))

(assert (=> start!94628 true))

(declare-fun tp_is_empty!25721 () Bool)

(assert (=> start!94628 tp_is_empty!25721))

(declare-datatypes ((V!39429 0))(
  ( (V!39430 (val!12911 Int)) )
))
(declare-datatypes ((ValueCell!12157 0))(
  ( (ValueCellFull!12157 (v!15527 V!39429)) (EmptyCell!12157) )
))
(declare-datatypes ((array!68419 0))(
  ( (array!68420 (arr!32907 (Array (_ BitVec 32) ValueCell!12157)) (size!33443 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68419)

(declare-fun e!610691 () Bool)

(declare-fun array_inv!25458 (array!68419) Bool)

(assert (=> start!94628 (and (array_inv!25458 _values!955) e!610691)))

(assert (=> start!94628 tp!77185))

(declare-datatypes ((array!68421 0))(
  ( (array!68422 (arr!32908 (Array (_ BitVec 32) (_ BitVec 64))) (size!33444 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68421)

(declare-fun array_inv!25459 (array!68421) Bool)

(assert (=> start!94628 (array_inv!25459 _keys!1163)))

(declare-fun mapIsEmpty!40282 () Bool)

(declare-fun mapRes!40282 () Bool)

(assert (=> mapIsEmpty!40282 mapRes!40282))

(declare-fun b!1069953 () Bool)

(declare-fun res!713846 () Bool)

(assert (=> b!1069953 (=> (not res!713846) (not e!610692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68421 (_ BitVec 32)) Bool)

(assert (=> b!1069953 (= res!713846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069954 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069954 (= e!610692 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33444 _keys!1163)))))))

(declare-datatypes ((tuple2!16414 0))(
  ( (tuple2!16415 (_1!8218 (_ BitVec 64)) (_2!8218 V!39429)) )
))
(declare-datatypes ((List!22957 0))(
  ( (Nil!22954) (Cons!22953 (h!24162 tuple2!16414) (t!32286 List!22957)) )
))
(declare-datatypes ((ListLongMap!14383 0))(
  ( (ListLongMap!14384 (toList!7207 List!22957)) )
))
(declare-fun lt!472832 () ListLongMap!14383)

(declare-fun lt!472833 () ListLongMap!14383)

(assert (=> b!1069954 (= lt!472832 lt!472833)))

(declare-fun zeroValueBefore!47 () V!39429)

(declare-fun minValue!907 () V!39429)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((Unit!35213 0))(
  ( (Unit!35214) )
))
(declare-fun lt!472831 () Unit!35213)

(declare-fun zeroValueAfter!47 () V!39429)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!820 (array!68421 array!68419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39429 V!39429 V!39429 V!39429 (_ BitVec 32) Int) Unit!35213)

(assert (=> b!1069954 (= lt!472831 (lemmaNoChangeToArrayThenSameMapNoExtras!820 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3783 (array!68421 array!68419 (_ BitVec 32) (_ BitVec 32) V!39429 V!39429 (_ BitVec 32) Int) ListLongMap!14383)

(assert (=> b!1069954 (= lt!472833 (getCurrentListMapNoExtraKeys!3783 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069954 (= lt!472832 (getCurrentListMapNoExtraKeys!3783 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069955 () Bool)

(declare-fun e!610688 () Bool)

(assert (=> b!1069955 (= e!610688 tp_is_empty!25721)))

(declare-fun b!1069956 () Bool)

(declare-fun res!713844 () Bool)

(assert (=> b!1069956 (=> (not res!713844) (not e!610692))))

(assert (=> b!1069956 (= res!713844 (and (= (size!33443 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33444 _keys!1163) (size!33443 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40282 () Bool)

(declare-fun tp!77186 () Bool)

(assert (=> mapNonEmpty!40282 (= mapRes!40282 (and tp!77186 e!610688))))

(declare-fun mapKey!40282 () (_ BitVec 32))

(declare-fun mapRest!40282 () (Array (_ BitVec 32) ValueCell!12157))

(declare-fun mapValue!40282 () ValueCell!12157)

(assert (=> mapNonEmpty!40282 (= (arr!32907 _values!955) (store mapRest!40282 mapKey!40282 mapValue!40282))))

(declare-fun b!1069957 () Bool)

(declare-fun e!610690 () Bool)

(assert (=> b!1069957 (= e!610690 tp_is_empty!25721)))

(declare-fun b!1069958 () Bool)

(declare-fun res!713845 () Bool)

(assert (=> b!1069958 (=> (not res!713845) (not e!610692))))

(declare-datatypes ((List!22958 0))(
  ( (Nil!22955) (Cons!22954 (h!24163 (_ BitVec 64)) (t!32287 List!22958)) )
))
(declare-fun arrayNoDuplicates!0 (array!68421 (_ BitVec 32) List!22958) Bool)

(assert (=> b!1069958 (= res!713845 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22955))))

(declare-fun b!1069959 () Bool)

(assert (=> b!1069959 (= e!610691 (and e!610690 mapRes!40282))))

(declare-fun condMapEmpty!40282 () Bool)

(declare-fun mapDefault!40282 () ValueCell!12157)

