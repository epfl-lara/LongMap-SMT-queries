; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93940 () Bool)

(assert start!93940)

(declare-fun b_free!21399 () Bool)

(declare-fun b_next!21399 () Bool)

(assert (=> start!93940 (= b_free!21399 (not b_next!21399))))

(declare-fun tp!75623 () Bool)

(declare-fun b_and!34121 () Bool)

(assert (=> start!93940 (= tp!75623 b_and!34121)))

(declare-fun b!1062463 () Bool)

(declare-fun e!605212 () Bool)

(declare-fun e!605210 () Bool)

(assert (=> b!1062463 (= e!605212 e!605210)))

(declare-fun res!709443 () Bool)

(assert (=> b!1062463 (=> res!709443 e!605210)))

(declare-datatypes ((V!38747 0))(
  ( (V!38748 (val!12655 Int)) )
))
(declare-datatypes ((tuple2!16010 0))(
  ( (tuple2!16011 (_1!8016 (_ BitVec 64)) (_2!8016 V!38747)) )
))
(declare-datatypes ((List!22593 0))(
  ( (Nil!22590) (Cons!22589 (h!23798 tuple2!16010) (t!31904 List!22593)) )
))
(declare-datatypes ((ListLongMap!13979 0))(
  ( (ListLongMap!13980 (toList!7005 List!22593)) )
))
(declare-fun lt!468116 () ListLongMap!13979)

(declare-fun contains!6237 (ListLongMap!13979 (_ BitVec 64)) Bool)

(assert (=> b!1062463 (= res!709443 (contains!6237 lt!468116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38747)

(declare-datatypes ((ValueCell!11901 0))(
  ( (ValueCellFull!11901 (v!15265 V!38747)) (EmptyCell!11901) )
))
(declare-datatypes ((array!67421 0))(
  ( (array!67422 (arr!32417 (Array (_ BitVec 32) ValueCell!11901)) (size!32953 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67421)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38747)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67423 0))(
  ( (array!67424 (arr!32418 (Array (_ BitVec 32) (_ BitVec 64))) (size!32954 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67423)

(declare-fun getCurrentListMap!3990 (array!67423 array!67421 (_ BitVec 32) (_ BitVec 32) V!38747 V!38747 (_ BitVec 32) Int) ListLongMap!13979)

(assert (=> b!1062463 (= lt!468116 (getCurrentListMap!3990 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39487 () Bool)

(declare-fun mapRes!39487 () Bool)

(declare-fun tp!75622 () Bool)

(declare-fun e!605209 () Bool)

(assert (=> mapNonEmpty!39487 (= mapRes!39487 (and tp!75622 e!605209))))

(declare-fun mapKey!39487 () (_ BitVec 32))

(declare-fun mapValue!39487 () ValueCell!11901)

(declare-fun mapRest!39487 () (Array (_ BitVec 32) ValueCell!11901))

(assert (=> mapNonEmpty!39487 (= (arr!32417 _values!955) (store mapRest!39487 mapKey!39487 mapValue!39487))))

(declare-fun b!1062464 () Bool)

(declare-fun e!605206 () Bool)

(assert (=> b!1062464 (= e!605206 (not e!605212))))

(declare-fun res!709448 () Bool)

(assert (=> b!1062464 (=> res!709448 e!605212)))

(assert (=> b!1062464 (= res!709448 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468115 () ListLongMap!13979)

(declare-fun lt!468112 () ListLongMap!13979)

(assert (=> b!1062464 (= lt!468115 lt!468112)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38747)

(declare-datatypes ((Unit!34808 0))(
  ( (Unit!34809) )
))
(declare-fun lt!468113 () Unit!34808)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!638 (array!67423 array!67421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38747 V!38747 V!38747 V!38747 (_ BitVec 32) Int) Unit!34808)

(assert (=> b!1062464 (= lt!468113 (lemmaNoChangeToArrayThenSameMapNoExtras!638 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3601 (array!67423 array!67421 (_ BitVec 32) (_ BitVec 32) V!38747 V!38747 (_ BitVec 32) Int) ListLongMap!13979)

(assert (=> b!1062464 (= lt!468112 (getCurrentListMapNoExtraKeys!3601 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062464 (= lt!468115 (getCurrentListMapNoExtraKeys!3601 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39487 () Bool)

(assert (=> mapIsEmpty!39487 mapRes!39487))

(declare-fun b!1062465 () Bool)

(assert (=> b!1062465 (= e!605210 true)))

(declare-fun -!569 (ListLongMap!13979 (_ BitVec 64)) ListLongMap!13979)

(assert (=> b!1062465 (= (-!569 lt!468116 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468116)))

(declare-fun lt!468114 () Unit!34808)

(declare-fun removeNotPresentStillSame!16 (ListLongMap!13979 (_ BitVec 64)) Unit!34808)

(assert (=> b!1062465 (= lt!468114 (removeNotPresentStillSame!16 lt!468116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062466 () Bool)

(declare-fun res!709447 () Bool)

(assert (=> b!1062466 (=> (not res!709447) (not e!605206))))

(assert (=> b!1062466 (= res!709447 (and (= (size!32953 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32954 _keys!1163) (size!32953 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062467 () Bool)

(declare-fun tp_is_empty!25209 () Bool)

(assert (=> b!1062467 (= e!605209 tp_is_empty!25209)))

(declare-fun res!709444 () Bool)

(assert (=> start!93940 (=> (not res!709444) (not e!605206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93940 (= res!709444 (validMask!0 mask!1515))))

(assert (=> start!93940 e!605206))

(assert (=> start!93940 true))

(assert (=> start!93940 tp_is_empty!25209))

(declare-fun e!605207 () Bool)

(declare-fun array_inv!25112 (array!67421) Bool)

(assert (=> start!93940 (and (array_inv!25112 _values!955) e!605207)))

(assert (=> start!93940 tp!75623))

(declare-fun array_inv!25113 (array!67423) Bool)

(assert (=> start!93940 (array_inv!25113 _keys!1163)))

(declare-fun b!1062468 () Bool)

(declare-fun res!709445 () Bool)

(assert (=> b!1062468 (=> (not res!709445) (not e!605206))))

(declare-datatypes ((List!22594 0))(
  ( (Nil!22591) (Cons!22590 (h!23799 (_ BitVec 64)) (t!31905 List!22594)) )
))
(declare-fun arrayNoDuplicates!0 (array!67423 (_ BitVec 32) List!22594) Bool)

(assert (=> b!1062468 (= res!709445 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22591))))

(declare-fun b!1062469 () Bool)

(declare-fun res!709446 () Bool)

(assert (=> b!1062469 (=> (not res!709446) (not e!605206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67423 (_ BitVec 32)) Bool)

(assert (=> b!1062469 (= res!709446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062470 () Bool)

(declare-fun e!605211 () Bool)

(assert (=> b!1062470 (= e!605207 (and e!605211 mapRes!39487))))

(declare-fun condMapEmpty!39487 () Bool)

(declare-fun mapDefault!39487 () ValueCell!11901)

(assert (=> b!1062470 (= condMapEmpty!39487 (= (arr!32417 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11901)) mapDefault!39487)))))

(declare-fun b!1062471 () Bool)

(assert (=> b!1062471 (= e!605211 tp_is_empty!25209)))

(assert (= (and start!93940 res!709444) b!1062466))

(assert (= (and b!1062466 res!709447) b!1062469))

(assert (= (and b!1062469 res!709446) b!1062468))

(assert (= (and b!1062468 res!709445) b!1062464))

(assert (= (and b!1062464 (not res!709448)) b!1062463))

(assert (= (and b!1062463 (not res!709443)) b!1062465))

(assert (= (and b!1062470 condMapEmpty!39487) mapIsEmpty!39487))

(assert (= (and b!1062470 (not condMapEmpty!39487)) mapNonEmpty!39487))

(get-info :version)

(assert (= (and mapNonEmpty!39487 ((_ is ValueCellFull!11901) mapValue!39487)) b!1062467))

(assert (= (and b!1062470 ((_ is ValueCellFull!11901) mapDefault!39487)) b!1062471))

(assert (= start!93940 b!1062470))

(declare-fun m!981215 () Bool)

(assert (=> b!1062463 m!981215))

(declare-fun m!981217 () Bool)

(assert (=> b!1062463 m!981217))

(declare-fun m!981219 () Bool)

(assert (=> start!93940 m!981219))

(declare-fun m!981221 () Bool)

(assert (=> start!93940 m!981221))

(declare-fun m!981223 () Bool)

(assert (=> start!93940 m!981223))

(declare-fun m!981225 () Bool)

(assert (=> b!1062468 m!981225))

(declare-fun m!981227 () Bool)

(assert (=> b!1062465 m!981227))

(declare-fun m!981229 () Bool)

(assert (=> b!1062465 m!981229))

(declare-fun m!981231 () Bool)

(assert (=> mapNonEmpty!39487 m!981231))

(declare-fun m!981233 () Bool)

(assert (=> b!1062464 m!981233))

(declare-fun m!981235 () Bool)

(assert (=> b!1062464 m!981235))

(declare-fun m!981237 () Bool)

(assert (=> b!1062464 m!981237))

(declare-fun m!981239 () Bool)

(assert (=> b!1062469 m!981239))

(check-sat (not b!1062465) (not b!1062464) (not b!1062469) (not b!1062463) (not start!93940) (not b_next!21399) (not mapNonEmpty!39487) (not b!1062468) b_and!34121 tp_is_empty!25209)
(check-sat b_and!34121 (not b_next!21399))
