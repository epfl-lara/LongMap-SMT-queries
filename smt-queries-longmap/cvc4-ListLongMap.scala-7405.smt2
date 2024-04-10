; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94226 () Bool)

(assert start!94226)

(declare-fun b_free!21611 () Bool)

(declare-fun b_next!21611 () Bool)

(assert (=> start!94226 (= b_free!21611 (not b_next!21611))))

(declare-fun tp!76271 () Bool)

(declare-fun b_and!34371 () Bool)

(assert (=> start!94226 (= tp!76271 b_and!34371)))

(declare-fun b!1065585 () Bool)

(declare-fun e!607498 () Bool)

(declare-fun e!607496 () Bool)

(assert (=> b!1065585 (= e!607498 (not e!607496))))

(declare-fun res!711276 () Bool)

(assert (=> b!1065585 (=> res!711276 e!607496)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065585 (= res!711276 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39029 0))(
  ( (V!39030 (val!12761 Int)) )
))
(declare-datatypes ((tuple2!16176 0))(
  ( (tuple2!16177 (_1!8099 (_ BitVec 64)) (_2!8099 V!39029)) )
))
(declare-datatypes ((List!22742 0))(
  ( (Nil!22739) (Cons!22738 (h!23947 tuple2!16176) (t!32061 List!22742)) )
))
(declare-datatypes ((ListLongMap!14145 0))(
  ( (ListLongMap!14146 (toList!7088 List!22742)) )
))
(declare-fun lt!469995 () ListLongMap!14145)

(declare-fun lt!469997 () ListLongMap!14145)

(assert (=> b!1065585 (= lt!469995 lt!469997)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39029)

(declare-datatypes ((ValueCell!12007 0))(
  ( (ValueCellFull!12007 (v!15373 V!39029)) (EmptyCell!12007) )
))
(declare-datatypes ((array!67829 0))(
  ( (array!67830 (arr!32617 (Array (_ BitVec 32) ValueCell!12007)) (size!33153 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67829)

(declare-fun minValue!907 () V!39029)

(declare-datatypes ((Unit!34969 0))(
  ( (Unit!34970) )
))
(declare-fun lt!470000 () Unit!34969)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39029)

(declare-datatypes ((array!67831 0))(
  ( (array!67832 (arr!32618 (Array (_ BitVec 32) (_ BitVec 64))) (size!33154 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67831)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!711 (array!67831 array!67829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39029 V!39029 V!39029 V!39029 (_ BitVec 32) Int) Unit!34969)

(assert (=> b!1065585 (= lt!470000 (lemmaNoChangeToArrayThenSameMapNoExtras!711 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3674 (array!67831 array!67829 (_ BitVec 32) (_ BitVec 32) V!39029 V!39029 (_ BitVec 32) Int) ListLongMap!14145)

(assert (=> b!1065585 (= lt!469997 (getCurrentListMapNoExtraKeys!3674 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065585 (= lt!469995 (getCurrentListMapNoExtraKeys!3674 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39817 () Bool)

(declare-fun mapRes!39817 () Bool)

(assert (=> mapIsEmpty!39817 mapRes!39817))

(declare-fun b!1065586 () Bool)

(declare-fun res!711279 () Bool)

(assert (=> b!1065586 (=> (not res!711279) (not e!607498))))

(assert (=> b!1065586 (= res!711279 (and (= (size!33153 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33154 _keys!1163) (size!33153 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711275 () Bool)

(assert (=> start!94226 (=> (not res!711275) (not e!607498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94226 (= res!711275 (validMask!0 mask!1515))))

(assert (=> start!94226 e!607498))

(assert (=> start!94226 true))

(declare-fun tp_is_empty!25421 () Bool)

(assert (=> start!94226 tp_is_empty!25421))

(declare-fun e!607497 () Bool)

(declare-fun array_inv!25256 (array!67829) Bool)

(assert (=> start!94226 (and (array_inv!25256 _values!955) e!607497)))

(assert (=> start!94226 tp!76271))

(declare-fun array_inv!25257 (array!67831) Bool)

(assert (=> start!94226 (array_inv!25257 _keys!1163)))

(declare-fun mapNonEmpty!39817 () Bool)

(declare-fun tp!76270 () Bool)

(declare-fun e!607495 () Bool)

(assert (=> mapNonEmpty!39817 (= mapRes!39817 (and tp!76270 e!607495))))

(declare-fun mapValue!39817 () ValueCell!12007)

(declare-fun mapRest!39817 () (Array (_ BitVec 32) ValueCell!12007))

(declare-fun mapKey!39817 () (_ BitVec 32))

(assert (=> mapNonEmpty!39817 (= (arr!32617 _values!955) (store mapRest!39817 mapKey!39817 mapValue!39817))))

(declare-fun b!1065587 () Bool)

(assert (=> b!1065587 (= e!607496 true)))

(declare-fun lt!469994 () ListLongMap!14145)

(declare-fun lt!469999 () ListLongMap!14145)

(declare-fun -!603 (ListLongMap!14145 (_ BitVec 64)) ListLongMap!14145)

(assert (=> b!1065587 (= lt!469994 (-!603 lt!469999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469996 () ListLongMap!14145)

(assert (=> b!1065587 (= (-!603 lt!469996 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469995)))

(declare-fun lt!470001 () Unit!34969)

(declare-fun addThenRemoveForNewKeyIsSame!12 (ListLongMap!14145 (_ BitVec 64) V!39029) Unit!34969)

(assert (=> b!1065587 (= lt!470001 (addThenRemoveForNewKeyIsSame!12 lt!469995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469998 () ListLongMap!14145)

(assert (=> b!1065587 (and (= lt!469999 lt!469996) (= lt!469998 lt!469997))))

(declare-fun +!3134 (ListLongMap!14145 tuple2!16176) ListLongMap!14145)

(assert (=> b!1065587 (= lt!469996 (+!3134 lt!469995 (tuple2!16177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4047 (array!67831 array!67829 (_ BitVec 32) (_ BitVec 32) V!39029 V!39029 (_ BitVec 32) Int) ListLongMap!14145)

(assert (=> b!1065587 (= lt!469998 (getCurrentListMap!4047 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065587 (= lt!469999 (getCurrentListMap!4047 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065588 () Bool)

(declare-fun res!711277 () Bool)

(assert (=> b!1065588 (=> (not res!711277) (not e!607498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67831 (_ BitVec 32)) Bool)

(assert (=> b!1065588 (= res!711277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065589 () Bool)

(assert (=> b!1065589 (= e!607495 tp_is_empty!25421)))

(declare-fun b!1065590 () Bool)

(declare-fun e!607499 () Bool)

(assert (=> b!1065590 (= e!607499 tp_is_empty!25421)))

(declare-fun b!1065591 () Bool)

(declare-fun res!711278 () Bool)

(assert (=> b!1065591 (=> (not res!711278) (not e!607498))))

(declare-datatypes ((List!22743 0))(
  ( (Nil!22740) (Cons!22739 (h!23948 (_ BitVec 64)) (t!32062 List!22743)) )
))
(declare-fun arrayNoDuplicates!0 (array!67831 (_ BitVec 32) List!22743) Bool)

(assert (=> b!1065591 (= res!711278 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22740))))

(declare-fun b!1065592 () Bool)

(assert (=> b!1065592 (= e!607497 (and e!607499 mapRes!39817))))

(declare-fun condMapEmpty!39817 () Bool)

(declare-fun mapDefault!39817 () ValueCell!12007)

