; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94520 () Bool)

(assert start!94520)

(declare-fun b_free!21825 () Bool)

(declare-fun b_next!21825 () Bool)

(assert (=> start!94520 (= b_free!21825 (not b_next!21825))))

(declare-fun tp!76925 () Bool)

(declare-fun b_and!34627 () Bool)

(assert (=> start!94520 (= tp!76925 b_and!34627)))

(declare-fun b!1068795 () Bool)

(declare-fun res!713172 () Bool)

(declare-fun e!609845 () Bool)

(assert (=> b!1068795 (=> (not res!713172) (not e!609845))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((V!39315 0))(
  ( (V!39316 (val!12868 Int)) )
))
(declare-datatypes ((ValueCell!12114 0))(
  ( (ValueCellFull!12114 (v!15483 V!39315)) (EmptyCell!12114) )
))
(declare-datatypes ((array!68247 0))(
  ( (array!68248 (arr!32822 (Array (_ BitVec 32) ValueCell!12114)) (size!33358 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68247)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68249 0))(
  ( (array!68250 (arr!32823 (Array (_ BitVec 32) (_ BitVec 64))) (size!33359 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68249)

(assert (=> b!1068795 (= res!713172 (and (= (size!33358 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33359 _keys!1163) (size!33358 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068796 () Bool)

(declare-fun e!609850 () Bool)

(declare-fun tp_is_empty!25635 () Bool)

(assert (=> b!1068796 (= e!609850 tp_is_empty!25635)))

(declare-fun b!1068797 () Bool)

(declare-fun res!713173 () Bool)

(assert (=> b!1068797 (=> (not res!713173) (not e!609845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68249 (_ BitVec 32)) Bool)

(assert (=> b!1068797 (= res!713173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068798 () Bool)

(declare-fun e!609848 () Bool)

(assert (=> b!1068798 (= e!609845 (not e!609848))))

(declare-fun res!713171 () Bool)

(assert (=> b!1068798 (=> res!713171 e!609848)))

(assert (=> b!1068798 (= res!713171 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16348 0))(
  ( (tuple2!16349 (_1!8185 (_ BitVec 64)) (_2!8185 V!39315)) )
))
(declare-datatypes ((List!22895 0))(
  ( (Nil!22892) (Cons!22891 (h!24100 tuple2!16348) (t!32222 List!22895)) )
))
(declare-datatypes ((ListLongMap!14317 0))(
  ( (ListLongMap!14318 (toList!7174 List!22895)) )
))
(declare-fun lt!472225 () ListLongMap!14317)

(declare-fun lt!472223 () ListLongMap!14317)

(assert (=> b!1068798 (= lt!472225 lt!472223)))

(declare-fun zeroValueBefore!47 () V!39315)

(declare-datatypes ((Unit!35147 0))(
  ( (Unit!35148) )
))
(declare-fun lt!472224 () Unit!35147)

(declare-fun minValue!907 () V!39315)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39315)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!790 (array!68249 array!68247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39315 V!39315 V!39315 V!39315 (_ BitVec 32) Int) Unit!35147)

(assert (=> b!1068798 (= lt!472224 (lemmaNoChangeToArrayThenSameMapNoExtras!790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3753 (array!68249 array!68247 (_ BitVec 32) (_ BitVec 32) V!39315 V!39315 (_ BitVec 32) Int) ListLongMap!14317)

(assert (=> b!1068798 (= lt!472223 (getCurrentListMapNoExtraKeys!3753 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068798 (= lt!472225 (getCurrentListMapNoExtraKeys!3753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713170 () Bool)

(assert (=> start!94520 (=> (not res!713170) (not e!609845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94520 (= res!713170 (validMask!0 mask!1515))))

(assert (=> start!94520 e!609845))

(assert (=> start!94520 true))

(assert (=> start!94520 tp_is_empty!25635))

(declare-fun e!609849 () Bool)

(declare-fun array_inv!25406 (array!68247) Bool)

(assert (=> start!94520 (and (array_inv!25406 _values!955) e!609849)))

(assert (=> start!94520 tp!76925))

(declare-fun array_inv!25407 (array!68249) Bool)

(assert (=> start!94520 (array_inv!25407 _keys!1163)))

(declare-fun mapNonEmpty!40150 () Bool)

(declare-fun mapRes!40150 () Bool)

(declare-fun tp!76924 () Bool)

(assert (=> mapNonEmpty!40150 (= mapRes!40150 (and tp!76924 e!609850))))

(declare-fun mapValue!40150 () ValueCell!12114)

(declare-fun mapKey!40150 () (_ BitVec 32))

(declare-fun mapRest!40150 () (Array (_ BitVec 32) ValueCell!12114))

(assert (=> mapNonEmpty!40150 (= (arr!32822 _values!955) (store mapRest!40150 mapKey!40150 mapValue!40150))))

(declare-fun mapIsEmpty!40150 () Bool)

(assert (=> mapIsEmpty!40150 mapRes!40150))

(declare-fun b!1068799 () Bool)

(declare-fun res!713169 () Bool)

(assert (=> b!1068799 (=> (not res!713169) (not e!609845))))

(declare-datatypes ((List!22896 0))(
  ( (Nil!22893) (Cons!22892 (h!24101 (_ BitVec 64)) (t!32223 List!22896)) )
))
(declare-fun arrayNoDuplicates!0 (array!68249 (_ BitVec 32) List!22896) Bool)

(assert (=> b!1068799 (= res!713169 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22893))))

(declare-fun b!1068800 () Bool)

(declare-fun e!609846 () Bool)

(assert (=> b!1068800 (= e!609849 (and e!609846 mapRes!40150))))

(declare-fun condMapEmpty!40150 () Bool)

(declare-fun mapDefault!40150 () ValueCell!12114)

(assert (=> b!1068800 (= condMapEmpty!40150 (= (arr!32822 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12114)) mapDefault!40150)))))

(declare-fun b!1068801 () Bool)

(declare-fun e!609851 () Bool)

(assert (=> b!1068801 (= e!609848 e!609851)))

(declare-fun res!713168 () Bool)

(assert (=> b!1068801 (=> res!713168 e!609851)))

(declare-fun lt!472226 () ListLongMap!14317)

(declare-fun contains!6303 (ListLongMap!14317 (_ BitVec 64)) Bool)

(assert (=> b!1068801 (= res!713168 (contains!6303 lt!472226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4099 (array!68249 array!68247 (_ BitVec 32) (_ BitVec 32) V!39315 V!39315 (_ BitVec 32) Int) ListLongMap!14317)

(assert (=> b!1068801 (= lt!472226 (getCurrentListMap!4099 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068802 () Bool)

(assert (=> b!1068802 (= e!609851 true)))

(declare-fun -!655 (ListLongMap!14317 (_ BitVec 64)) ListLongMap!14317)

(assert (=> b!1068802 (= (-!655 lt!472226 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472226)))

(declare-fun lt!472222 () Unit!35147)

(declare-fun removeNotPresentStillSame!65 (ListLongMap!14317 (_ BitVec 64)) Unit!35147)

(assert (=> b!1068802 (= lt!472222 (removeNotPresentStillSame!65 lt!472226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068803 () Bool)

(assert (=> b!1068803 (= e!609846 tp_is_empty!25635)))

(assert (= (and start!94520 res!713170) b!1068795))

(assert (= (and b!1068795 res!713172) b!1068797))

(assert (= (and b!1068797 res!713173) b!1068799))

(assert (= (and b!1068799 res!713169) b!1068798))

(assert (= (and b!1068798 (not res!713171)) b!1068801))

(assert (= (and b!1068801 (not res!713168)) b!1068802))

(assert (= (and b!1068800 condMapEmpty!40150) mapIsEmpty!40150))

(assert (= (and b!1068800 (not condMapEmpty!40150)) mapNonEmpty!40150))

(get-info :version)

(assert (= (and mapNonEmpty!40150 ((_ is ValueCellFull!12114) mapValue!40150)) b!1068796))

(assert (= (and b!1068800 ((_ is ValueCellFull!12114) mapDefault!40150)) b!1068803))

(assert (= start!94520 b!1068800))

(declare-fun m!987353 () Bool)

(assert (=> b!1068799 m!987353))

(declare-fun m!987355 () Bool)

(assert (=> b!1068797 m!987355))

(declare-fun m!987357 () Bool)

(assert (=> b!1068802 m!987357))

(declare-fun m!987359 () Bool)

(assert (=> b!1068802 m!987359))

(declare-fun m!987361 () Bool)

(assert (=> mapNonEmpty!40150 m!987361))

(declare-fun m!987363 () Bool)

(assert (=> b!1068798 m!987363))

(declare-fun m!987365 () Bool)

(assert (=> b!1068798 m!987365))

(declare-fun m!987367 () Bool)

(assert (=> b!1068798 m!987367))

(declare-fun m!987369 () Bool)

(assert (=> b!1068801 m!987369))

(declare-fun m!987371 () Bool)

(assert (=> b!1068801 m!987371))

(declare-fun m!987373 () Bool)

(assert (=> start!94520 m!987373))

(declare-fun m!987375 () Bool)

(assert (=> start!94520 m!987375))

(declare-fun m!987377 () Bool)

(assert (=> start!94520 m!987377))

(check-sat tp_is_empty!25635 (not mapNonEmpty!40150) (not b_next!21825) (not b!1068797) (not b!1068798) (not b!1068799) (not start!94520) b_and!34627 (not b!1068802) (not b!1068801))
(check-sat b_and!34627 (not b_next!21825))
