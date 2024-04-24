; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94132 () Bool)

(assert start!94132)

(declare-fun b_free!21355 () Bool)

(declare-fun b_next!21355 () Bool)

(assert (=> start!94132 (= b_free!21355 (not b_next!21355))))

(declare-fun tp!75490 () Bool)

(declare-fun b_and!34087 () Bool)

(assert (=> start!94132 (= tp!75490 b_and!34087)))

(declare-fun b!1063203 () Bool)

(declare-fun res!709579 () Bool)

(declare-fun e!605609 () Bool)

(assert (=> b!1063203 (=> (not res!709579) (not e!605609))))

(declare-datatypes ((array!67381 0))(
  ( (array!67382 (arr!32391 (Array (_ BitVec 32) (_ BitVec 64))) (size!32928 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67381)

(declare-datatypes ((List!22545 0))(
  ( (Nil!22542) (Cons!22541 (h!23759 (_ BitVec 64)) (t!31848 List!22545)) )
))
(declare-fun arrayNoDuplicates!0 (array!67381 (_ BitVec 32) List!22545) Bool)

(assert (=> b!1063203 (= res!709579 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22542))))

(declare-fun b!1063204 () Bool)

(declare-fun e!605611 () Bool)

(declare-fun e!605607 () Bool)

(declare-fun mapRes!39421 () Bool)

(assert (=> b!1063204 (= e!605611 (and e!605607 mapRes!39421))))

(declare-fun condMapEmpty!39421 () Bool)

(declare-datatypes ((V!38689 0))(
  ( (V!38690 (val!12633 Int)) )
))
(declare-datatypes ((ValueCell!11879 0))(
  ( (ValueCellFull!11879 (v!15239 V!38689)) (EmptyCell!11879) )
))
(declare-datatypes ((array!67383 0))(
  ( (array!67384 (arr!32392 (Array (_ BitVec 32) ValueCell!11879)) (size!32929 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67383)

(declare-fun mapDefault!39421 () ValueCell!11879)

(assert (=> b!1063204 (= condMapEmpty!39421 (= (arr!32392 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11879)) mapDefault!39421)))))

(declare-fun b!1063205 () Bool)

(declare-fun res!709577 () Bool)

(assert (=> b!1063205 (=> (not res!709577) (not e!605609))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67381 (_ BitVec 32)) Bool)

(assert (=> b!1063205 (= res!709577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063206 () Bool)

(declare-fun e!605608 () Bool)

(declare-fun tp_is_empty!25165 () Bool)

(assert (=> b!1063206 (= e!605608 tp_is_empty!25165)))

(declare-fun mapNonEmpty!39421 () Bool)

(declare-fun tp!75491 () Bool)

(assert (=> mapNonEmpty!39421 (= mapRes!39421 (and tp!75491 e!605608))))

(declare-fun mapKey!39421 () (_ BitVec 32))

(declare-fun mapRest!39421 () (Array (_ BitVec 32) ValueCell!11879))

(declare-fun mapValue!39421 () ValueCell!11879)

(assert (=> mapNonEmpty!39421 (= (arr!32392 _values!955) (store mapRest!39421 mapKey!39421 mapValue!39421))))

(declare-fun b!1063207 () Bool)

(declare-fun res!709576 () Bool)

(assert (=> b!1063207 (=> (not res!709576) (not e!605609))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063207 (= res!709576 (and (= (size!32929 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32928 _keys!1163) (size!32929 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063208 () Bool)

(assert (=> b!1063208 (= e!605607 tp_is_empty!25165)))

(declare-fun res!709578 () Bool)

(assert (=> start!94132 (=> (not res!709578) (not e!605609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94132 (= res!709578 (validMask!0 mask!1515))))

(assert (=> start!94132 e!605609))

(assert (=> start!94132 true))

(assert (=> start!94132 tp_is_empty!25165))

(declare-fun array_inv!25114 (array!67383) Bool)

(assert (=> start!94132 (and (array_inv!25114 _values!955) e!605611)))

(assert (=> start!94132 tp!75490))

(declare-fun array_inv!25115 (array!67381) Bool)

(assert (=> start!94132 (array_inv!25115 _keys!1163)))

(declare-fun mapIsEmpty!39421 () Bool)

(assert (=> mapIsEmpty!39421 mapRes!39421))

(declare-fun b!1063209 () Bool)

(declare-fun e!605610 () Bool)

(assert (=> b!1063209 (= e!605609 (not e!605610))))

(declare-fun res!709580 () Bool)

(assert (=> b!1063209 (=> res!709580 e!605610)))

(assert (=> b!1063209 (= res!709580 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!15958 0))(
  ( (tuple2!15959 (_1!7990 (_ BitVec 64)) (_2!7990 V!38689)) )
))
(declare-datatypes ((List!22546 0))(
  ( (Nil!22543) (Cons!22542 (h!23760 tuple2!15958) (t!31849 List!22546)) )
))
(declare-datatypes ((ListLongMap!13935 0))(
  ( (ListLongMap!13936 (toList!6983 List!22546)) )
))
(declare-fun lt!468307 () ListLongMap!13935)

(declare-fun lt!468304 () ListLongMap!13935)

(assert (=> b!1063209 (= lt!468307 lt!468304)))

(declare-fun zeroValueBefore!47 () V!38689)

(declare-fun minValue!907 () V!38689)

(declare-datatypes ((Unit!34771 0))(
  ( (Unit!34772) )
))
(declare-fun lt!468306 () Unit!34771)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38689)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!634 (array!67381 array!67383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 V!38689 V!38689 (_ BitVec 32) Int) Unit!34771)

(assert (=> b!1063209 (= lt!468306 (lemmaNoChangeToArrayThenSameMapNoExtras!634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3631 (array!67381 array!67383 (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 (_ BitVec 32) Int) ListLongMap!13935)

(assert (=> b!1063209 (= lt!468304 (getCurrentListMapNoExtraKeys!3631 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063209 (= lt!468307 (getCurrentListMapNoExtraKeys!3631 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063210 () Bool)

(assert (=> b!1063210 (= e!605610 true)))

(declare-fun lt!468305 () Bool)

(declare-fun contains!6244 (ListLongMap!13935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3970 (array!67381 array!67383 (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 (_ BitVec 32) Int) ListLongMap!13935)

(assert (=> b!1063210 (= lt!468305 (contains!6244 (getCurrentListMap!3970 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94132 res!709578) b!1063207))

(assert (= (and b!1063207 res!709576) b!1063205))

(assert (= (and b!1063205 res!709577) b!1063203))

(assert (= (and b!1063203 res!709579) b!1063209))

(assert (= (and b!1063209 (not res!709580)) b!1063210))

(assert (= (and b!1063204 condMapEmpty!39421) mapIsEmpty!39421))

(assert (= (and b!1063204 (not condMapEmpty!39421)) mapNonEmpty!39421))

(get-info :version)

(assert (= (and mapNonEmpty!39421 ((_ is ValueCellFull!11879) mapValue!39421)) b!1063206))

(assert (= (and b!1063204 ((_ is ValueCellFull!11879) mapDefault!39421)) b!1063208))

(assert (= start!94132 b!1063204))

(declare-fun m!982327 () Bool)

(assert (=> b!1063205 m!982327))

(declare-fun m!982329 () Bool)

(assert (=> b!1063209 m!982329))

(declare-fun m!982331 () Bool)

(assert (=> b!1063209 m!982331))

(declare-fun m!982333 () Bool)

(assert (=> b!1063209 m!982333))

(declare-fun m!982335 () Bool)

(assert (=> b!1063210 m!982335))

(assert (=> b!1063210 m!982335))

(declare-fun m!982337 () Bool)

(assert (=> b!1063210 m!982337))

(declare-fun m!982339 () Bool)

(assert (=> b!1063203 m!982339))

(declare-fun m!982341 () Bool)

(assert (=> mapNonEmpty!39421 m!982341))

(declare-fun m!982343 () Bool)

(assert (=> start!94132 m!982343))

(declare-fun m!982345 () Bool)

(assert (=> start!94132 m!982345))

(declare-fun m!982347 () Bool)

(assert (=> start!94132 m!982347))

(check-sat (not mapNonEmpty!39421) (not b!1063205) (not b!1063209) (not b_next!21355) (not start!94132) b_and!34087 (not b!1063210) (not b!1063203) tp_is_empty!25165)
(check-sat b_and!34087 (not b_next!21355))
