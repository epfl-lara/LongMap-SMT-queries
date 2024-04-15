; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94386 () Bool)

(assert start!94386)

(declare-fun b_free!21733 () Bool)

(declare-fun b_next!21733 () Bool)

(assert (=> start!94386 (= b_free!21733 (not b_next!21733))))

(declare-fun tp!76643 () Bool)

(declare-fun b_and!34491 () Bool)

(assert (=> start!94386 (= tp!76643 b_and!34491)))

(declare-fun b!1067199 () Bool)

(declare-fun res!712223 () Bool)

(declare-fun e!608672 () Bool)

(assert (=> b!1067199 (=> (not res!712223) (not e!608672))))

(declare-datatypes ((array!68014 0))(
  ( (array!68015 (arr!32708 (Array (_ BitVec 32) (_ BitVec 64))) (size!33246 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68014)

(declare-datatypes ((List!22869 0))(
  ( (Nil!22866) (Cons!22865 (h!24074 (_ BitVec 64)) (t!32183 List!22869)) )
))
(declare-fun arrayNoDuplicates!0 (array!68014 (_ BitVec 32) List!22869) Bool)

(assert (=> b!1067199 (= res!712223 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22866))))

(declare-fun res!712222 () Bool)

(assert (=> start!94386 (=> (not res!712222) (not e!608672))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94386 (= res!712222 (validMask!0 mask!1515))))

(assert (=> start!94386 e!608672))

(assert (=> start!94386 true))

(declare-fun tp_is_empty!25543 () Bool)

(assert (=> start!94386 tp_is_empty!25543))

(declare-datatypes ((V!39193 0))(
  ( (V!39194 (val!12822 Int)) )
))
(declare-datatypes ((ValueCell!12068 0))(
  ( (ValueCellFull!12068 (v!15435 V!39193)) (EmptyCell!12068) )
))
(declare-datatypes ((array!68016 0))(
  ( (array!68017 (arr!32709 (Array (_ BitVec 32) ValueCell!12068)) (size!33247 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68016)

(declare-fun e!608676 () Bool)

(declare-fun array_inv!25318 (array!68016) Bool)

(assert (=> start!94386 (and (array_inv!25318 _values!955) e!608676)))

(assert (=> start!94386 tp!76643))

(declare-fun array_inv!25319 (array!68014) Bool)

(assert (=> start!94386 (array_inv!25319 _keys!1163)))

(declare-fun mapIsEmpty!40006 () Bool)

(declare-fun mapRes!40006 () Bool)

(assert (=> mapIsEmpty!40006 mapRes!40006))

(declare-fun b!1067200 () Bool)

(declare-fun res!712221 () Bool)

(assert (=> b!1067200 (=> (not res!712221) (not e!608672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68014 (_ BitVec 32)) Bool)

(assert (=> b!1067200 (= res!712221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067201 () Bool)

(declare-fun res!712220 () Bool)

(assert (=> b!1067201 (=> (not res!712220) (not e!608672))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067201 (= res!712220 (and (= (size!33247 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33246 _keys!1163) (size!33247 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067202 () Bool)

(declare-fun e!608675 () Bool)

(assert (=> b!1067202 (= e!608675 tp_is_empty!25543)))

(declare-fun b!1067203 () Bool)

(declare-fun e!608674 () Bool)

(assert (=> b!1067203 (= e!608676 (and e!608674 mapRes!40006))))

(declare-fun condMapEmpty!40006 () Bool)

(declare-fun mapDefault!40006 () ValueCell!12068)

(assert (=> b!1067203 (= condMapEmpty!40006 (= (arr!32709 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12068)) mapDefault!40006)))))

(declare-fun mapNonEmpty!40006 () Bool)

(declare-fun tp!76642 () Bool)

(assert (=> mapNonEmpty!40006 (= mapRes!40006 (and tp!76642 e!608675))))

(declare-fun mapRest!40006 () (Array (_ BitVec 32) ValueCell!12068))

(declare-fun mapKey!40006 () (_ BitVec 32))

(declare-fun mapValue!40006 () ValueCell!12068)

(assert (=> mapNonEmpty!40006 (= (arr!32709 _values!955) (store mapRest!40006 mapKey!40006 mapValue!40006))))

(declare-fun b!1067204 () Bool)

(assert (=> b!1067204 (= e!608674 tp_is_empty!25543)))

(declare-fun b!1067205 () Bool)

(assert (=> b!1067205 (= e!608672 (not true))))

(declare-datatypes ((tuple2!16326 0))(
  ( (tuple2!16327 (_1!8174 (_ BitVec 64)) (_2!8174 V!39193)) )
))
(declare-datatypes ((List!22870 0))(
  ( (Nil!22867) (Cons!22866 (h!24075 tuple2!16326) (t!32184 List!22870)) )
))
(declare-datatypes ((ListLongMap!14295 0))(
  ( (ListLongMap!14296 (toList!7163 List!22870)) )
))
(declare-fun lt!471211 () ListLongMap!14295)

(declare-fun lt!471209 () ListLongMap!14295)

(assert (=> b!1067205 (= lt!471211 lt!471209)))

(declare-fun minValue!907 () V!39193)

(declare-datatypes ((Unit!34916 0))(
  ( (Unit!34917) )
))
(declare-fun lt!471210 () Unit!34916)

(declare-fun zeroValueBefore!47 () V!39193)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39193)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!753 (array!68014 array!68016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39193 V!39193 V!39193 V!39193 (_ BitVec 32) Int) Unit!34916)

(assert (=> b!1067205 (= lt!471210 (lemmaNoChangeToArrayThenSameMapNoExtras!753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3759 (array!68014 array!68016 (_ BitVec 32) (_ BitVec 32) V!39193 V!39193 (_ BitVec 32) Int) ListLongMap!14295)

(assert (=> b!1067205 (= lt!471209 (getCurrentListMapNoExtraKeys!3759 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067205 (= lt!471211 (getCurrentListMapNoExtraKeys!3759 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94386 res!712222) b!1067201))

(assert (= (and b!1067201 res!712220) b!1067200))

(assert (= (and b!1067200 res!712221) b!1067199))

(assert (= (and b!1067199 res!712223) b!1067205))

(assert (= (and b!1067203 condMapEmpty!40006) mapIsEmpty!40006))

(assert (= (and b!1067203 (not condMapEmpty!40006)) mapNonEmpty!40006))

(get-info :version)

(assert (= (and mapNonEmpty!40006 ((_ is ValueCellFull!12068) mapValue!40006)) b!1067202))

(assert (= (and b!1067203 ((_ is ValueCellFull!12068) mapDefault!40006)) b!1067204))

(assert (= start!94386 b!1067203))

(declare-fun m!985399 () Bool)

(assert (=> b!1067205 m!985399))

(declare-fun m!985401 () Bool)

(assert (=> b!1067205 m!985401))

(declare-fun m!985403 () Bool)

(assert (=> b!1067205 m!985403))

(declare-fun m!985405 () Bool)

(assert (=> b!1067199 m!985405))

(declare-fun m!985407 () Bool)

(assert (=> mapNonEmpty!40006 m!985407))

(declare-fun m!985409 () Bool)

(assert (=> start!94386 m!985409))

(declare-fun m!985411 () Bool)

(assert (=> start!94386 m!985411))

(declare-fun m!985413 () Bool)

(assert (=> start!94386 m!985413))

(declare-fun m!985415 () Bool)

(assert (=> b!1067200 m!985415))

(check-sat (not b_next!21733) (not b!1067199) (not mapNonEmpty!40006) tp_is_empty!25543 (not b!1067200) (not start!94386) b_and!34491 (not b!1067205))
(check-sat b_and!34491 (not b_next!21733))
