; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94088 () Bool)

(assert start!94088)

(declare-fun b_free!21325 () Bool)

(declare-fun b_next!21325 () Bool)

(assert (=> start!94088 (= b_free!21325 (not b_next!21325))))

(declare-fun tp!75397 () Bool)

(declare-fun b_and!34049 () Bool)

(assert (=> start!94088 (= tp!75397 b_and!34049)))

(declare-fun b!1062801 () Bool)

(declare-fun e!605328 () Bool)

(declare-fun tp_is_empty!25135 () Bool)

(assert (=> b!1062801 (= e!605328 tp_is_empty!25135)))

(declare-fun b!1062802 () Bool)

(declare-fun res!709363 () Bool)

(declare-fun e!605327 () Bool)

(assert (=> b!1062802 (=> (not res!709363) (not e!605327))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((V!38649 0))(
  ( (V!38650 (val!12618 Int)) )
))
(declare-datatypes ((ValueCell!11864 0))(
  ( (ValueCellFull!11864 (v!15224 V!38649)) (EmptyCell!11864) )
))
(declare-datatypes ((array!67323 0))(
  ( (array!67324 (arr!32363 (Array (_ BitVec 32) ValueCell!11864)) (size!32900 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67323)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67325 0))(
  ( (array!67326 (arr!32364 (Array (_ BitVec 32) (_ BitVec 64))) (size!32901 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67325)

(assert (=> b!1062802 (= res!709363 (and (= (size!32900 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32901 _keys!1163) (size!32900 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062804 () Bool)

(assert (=> b!1062804 (= e!605327 (not true))))

(declare-datatypes ((tuple2!15936 0))(
  ( (tuple2!15937 (_1!7979 (_ BitVec 64)) (_2!7979 V!38649)) )
))
(declare-datatypes ((List!22522 0))(
  ( (Nil!22519) (Cons!22518 (h!23736 tuple2!15936) (t!31823 List!22522)) )
))
(declare-datatypes ((ListLongMap!13913 0))(
  ( (ListLongMap!13914 (toList!6972 List!22522)) )
))
(declare-fun lt!468129 () ListLongMap!13913)

(declare-fun lt!468128 () ListLongMap!13913)

(assert (=> b!1062804 (= lt!468129 lt!468128)))

(declare-fun zeroValueBefore!47 () V!38649)

(declare-datatypes ((Unit!34749 0))(
  ( (Unit!34750) )
))
(declare-fun lt!468127 () Unit!34749)

(declare-fun minValue!907 () V!38649)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38649)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!623 (array!67325 array!67323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38649 V!38649 V!38649 V!38649 (_ BitVec 32) Int) Unit!34749)

(assert (=> b!1062804 (= lt!468127 (lemmaNoChangeToArrayThenSameMapNoExtras!623 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3620 (array!67325 array!67323 (_ BitVec 32) (_ BitVec 32) V!38649 V!38649 (_ BitVec 32) Int) ListLongMap!13913)

(assert (=> b!1062804 (= lt!468128 (getCurrentListMapNoExtraKeys!3620 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062804 (= lt!468129 (getCurrentListMapNoExtraKeys!3620 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39373 () Bool)

(declare-fun mapRes!39373 () Bool)

(declare-fun tp!75398 () Bool)

(declare-fun e!605325 () Bool)

(assert (=> mapNonEmpty!39373 (= mapRes!39373 (and tp!75398 e!605325))))

(declare-fun mapRest!39373 () (Array (_ BitVec 32) ValueCell!11864))

(declare-fun mapKey!39373 () (_ BitVec 32))

(declare-fun mapValue!39373 () ValueCell!11864)

(assert (=> mapNonEmpty!39373 (= (arr!32363 _values!955) (store mapRest!39373 mapKey!39373 mapValue!39373))))

(declare-fun mapIsEmpty!39373 () Bool)

(assert (=> mapIsEmpty!39373 mapRes!39373))

(declare-fun b!1062805 () Bool)

(declare-fun res!709365 () Bool)

(assert (=> b!1062805 (=> (not res!709365) (not e!605327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67325 (_ BitVec 32)) Bool)

(assert (=> b!1062805 (= res!709365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062803 () Bool)

(declare-fun e!605324 () Bool)

(assert (=> b!1062803 (= e!605324 (and e!605328 mapRes!39373))))

(declare-fun condMapEmpty!39373 () Bool)

(declare-fun mapDefault!39373 () ValueCell!11864)

(assert (=> b!1062803 (= condMapEmpty!39373 (= (arr!32363 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11864)) mapDefault!39373)))))

(declare-fun res!709364 () Bool)

(assert (=> start!94088 (=> (not res!709364) (not e!605327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94088 (= res!709364 (validMask!0 mask!1515))))

(assert (=> start!94088 e!605327))

(assert (=> start!94088 true))

(assert (=> start!94088 tp_is_empty!25135))

(declare-fun array_inv!25092 (array!67323) Bool)

(assert (=> start!94088 (and (array_inv!25092 _values!955) e!605324)))

(assert (=> start!94088 tp!75397))

(declare-fun array_inv!25093 (array!67325) Bool)

(assert (=> start!94088 (array_inv!25093 _keys!1163)))

(declare-fun b!1062806 () Bool)

(assert (=> b!1062806 (= e!605325 tp_is_empty!25135)))

(declare-fun b!1062807 () Bool)

(declare-fun res!709366 () Bool)

(assert (=> b!1062807 (=> (not res!709366) (not e!605327))))

(declare-datatypes ((List!22523 0))(
  ( (Nil!22520) (Cons!22519 (h!23737 (_ BitVec 64)) (t!31824 List!22523)) )
))
(declare-fun arrayNoDuplicates!0 (array!67325 (_ BitVec 32) List!22523) Bool)

(assert (=> b!1062807 (= res!709366 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22520))))

(assert (= (and start!94088 res!709364) b!1062802))

(assert (= (and b!1062802 res!709363) b!1062805))

(assert (= (and b!1062805 res!709365) b!1062807))

(assert (= (and b!1062807 res!709366) b!1062804))

(assert (= (and b!1062803 condMapEmpty!39373) mapIsEmpty!39373))

(assert (= (and b!1062803 (not condMapEmpty!39373)) mapNonEmpty!39373))

(get-info :version)

(assert (= (and mapNonEmpty!39373 ((_ is ValueCellFull!11864) mapValue!39373)) b!1062806))

(assert (= (and b!1062803 ((_ is ValueCellFull!11864) mapDefault!39373)) b!1062801))

(assert (= start!94088 b!1062803))

(declare-fun m!981991 () Bool)

(assert (=> mapNonEmpty!39373 m!981991))

(declare-fun m!981993 () Bool)

(assert (=> start!94088 m!981993))

(declare-fun m!981995 () Bool)

(assert (=> start!94088 m!981995))

(declare-fun m!981997 () Bool)

(assert (=> start!94088 m!981997))

(declare-fun m!981999 () Bool)

(assert (=> b!1062804 m!981999))

(declare-fun m!982001 () Bool)

(assert (=> b!1062804 m!982001))

(declare-fun m!982003 () Bool)

(assert (=> b!1062804 m!982003))

(declare-fun m!982005 () Bool)

(assert (=> b!1062807 m!982005))

(declare-fun m!982007 () Bool)

(assert (=> b!1062805 m!982007))

(check-sat (not b!1062807) b_and!34049 (not b_next!21325) (not b!1062805) tp_is_empty!25135 (not b!1062804) (not mapNonEmpty!39373) (not start!94088))
(check-sat b_and!34049 (not b_next!21325))
