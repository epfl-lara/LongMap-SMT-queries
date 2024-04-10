; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94062 () Bool)

(assert start!94062)

(declare-fun b_free!21477 () Bool)

(declare-fun b_next!21477 () Bool)

(assert (=> start!94062 (= b_free!21477 (not b_next!21477))))

(declare-fun tp!75862 () Bool)

(declare-fun b_and!34219 () Bool)

(assert (=> start!94062 (= tp!75862 b_and!34219)))

(declare-fun res!710240 () Bool)

(declare-fun e!606197 () Bool)

(assert (=> start!94062 (=> (not res!710240) (not e!606197))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94062 (= res!710240 (validMask!0 mask!1515))))

(assert (=> start!94062 e!606197))

(assert (=> start!94062 true))

(declare-fun tp_is_empty!25287 () Bool)

(assert (=> start!94062 tp_is_empty!25287))

(declare-datatypes ((V!38851 0))(
  ( (V!38852 (val!12694 Int)) )
))
(declare-datatypes ((ValueCell!11940 0))(
  ( (ValueCellFull!11940 (v!15306 V!38851)) (EmptyCell!11940) )
))
(declare-datatypes ((array!67573 0))(
  ( (array!67574 (arr!32491 (Array (_ BitVec 32) ValueCell!11940)) (size!33027 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67573)

(declare-fun e!606198 () Bool)

(declare-fun array_inv!25166 (array!67573) Bool)

(assert (=> start!94062 (and (array_inv!25166 _values!955) e!606198)))

(assert (=> start!94062 tp!75862))

(declare-datatypes ((array!67575 0))(
  ( (array!67576 (arr!32492 (Array (_ BitVec 32) (_ BitVec 64))) (size!33028 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67575)

(declare-fun array_inv!25167 (array!67575) Bool)

(assert (=> start!94062 (array_inv!25167 _keys!1163)))

(declare-fun b!1063802 () Bool)

(declare-fun res!710239 () Bool)

(assert (=> b!1063802 (=> (not res!710239) (not e!606197))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063802 (= res!710239 (and (= (size!33027 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33028 _keys!1163) (size!33027 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063803 () Bool)

(declare-fun res!710242 () Bool)

(assert (=> b!1063803 (=> (not res!710242) (not e!606197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67575 (_ BitVec 32)) Bool)

(assert (=> b!1063803 (= res!710242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39610 () Bool)

(declare-fun mapRes!39610 () Bool)

(declare-fun tp!75863 () Bool)

(declare-fun e!606200 () Bool)

(assert (=> mapNonEmpty!39610 (= mapRes!39610 (and tp!75863 e!606200))))

(declare-fun mapRest!39610 () (Array (_ BitVec 32) ValueCell!11940))

(declare-fun mapValue!39610 () ValueCell!11940)

(declare-fun mapKey!39610 () (_ BitVec 32))

(assert (=> mapNonEmpty!39610 (= (arr!32491 _values!955) (store mapRest!39610 mapKey!39610 mapValue!39610))))

(declare-fun b!1063804 () Bool)

(declare-fun res!710241 () Bool)

(assert (=> b!1063804 (=> (not res!710241) (not e!606197))))

(declare-datatypes ((List!22649 0))(
  ( (Nil!22646) (Cons!22645 (h!23854 (_ BitVec 64)) (t!31964 List!22649)) )
))
(declare-fun arrayNoDuplicates!0 (array!67575 (_ BitVec 32) List!22649) Bool)

(assert (=> b!1063804 (= res!710241 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22646))))

(declare-fun b!1063805 () Bool)

(declare-fun e!606201 () Bool)

(assert (=> b!1063805 (= e!606201 tp_is_empty!25287)))

(declare-fun b!1063806 () Bool)

(assert (=> b!1063806 (= e!606197 (not true))))

(declare-datatypes ((tuple2!16072 0))(
  ( (tuple2!16073 (_1!8047 (_ BitVec 64)) (_2!8047 V!38851)) )
))
(declare-datatypes ((List!22650 0))(
  ( (Nil!22647) (Cons!22646 (h!23855 tuple2!16072) (t!31965 List!22650)) )
))
(declare-datatypes ((ListLongMap!14041 0))(
  ( (ListLongMap!14042 (toList!7036 List!22650)) )
))
(declare-fun lt!468919 () ListLongMap!14041)

(declare-fun lt!468917 () ListLongMap!14041)

(assert (=> b!1063806 (= lt!468919 lt!468917)))

(declare-fun zeroValueBefore!47 () V!38851)

(declare-datatypes ((Unit!34872 0))(
  ( (Unit!34873) )
))
(declare-fun lt!468918 () Unit!34872)

(declare-fun minValue!907 () V!38851)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38851)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!665 (array!67575 array!67573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38851 V!38851 V!38851 V!38851 (_ BitVec 32) Int) Unit!34872)

(assert (=> b!1063806 (= lt!468918 (lemmaNoChangeToArrayThenSameMapNoExtras!665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3628 (array!67575 array!67573 (_ BitVec 32) (_ BitVec 32) V!38851 V!38851 (_ BitVec 32) Int) ListLongMap!14041)

(assert (=> b!1063806 (= lt!468917 (getCurrentListMapNoExtraKeys!3628 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063806 (= lt!468919 (getCurrentListMapNoExtraKeys!3628 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063807 () Bool)

(assert (=> b!1063807 (= e!606198 (and e!606201 mapRes!39610))))

(declare-fun condMapEmpty!39610 () Bool)

(declare-fun mapDefault!39610 () ValueCell!11940)

(assert (=> b!1063807 (= condMapEmpty!39610 (= (arr!32491 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11940)) mapDefault!39610)))))

(declare-fun mapIsEmpty!39610 () Bool)

(assert (=> mapIsEmpty!39610 mapRes!39610))

(declare-fun b!1063808 () Bool)

(assert (=> b!1063808 (= e!606200 tp_is_empty!25287)))

(assert (= (and start!94062 res!710240) b!1063802))

(assert (= (and b!1063802 res!710239) b!1063803))

(assert (= (and b!1063803 res!710242) b!1063804))

(assert (= (and b!1063804 res!710241) b!1063806))

(assert (= (and b!1063807 condMapEmpty!39610) mapIsEmpty!39610))

(assert (= (and b!1063807 (not condMapEmpty!39610)) mapNonEmpty!39610))

(get-info :version)

(assert (= (and mapNonEmpty!39610 ((_ is ValueCellFull!11940) mapValue!39610)) b!1063808))

(assert (= (and b!1063807 ((_ is ValueCellFull!11940) mapDefault!39610)) b!1063805))

(assert (= start!94062 b!1063807))

(declare-fun m!982449 () Bool)

(assert (=> b!1063804 m!982449))

(declare-fun m!982451 () Bool)

(assert (=> start!94062 m!982451))

(declare-fun m!982453 () Bool)

(assert (=> start!94062 m!982453))

(declare-fun m!982455 () Bool)

(assert (=> start!94062 m!982455))

(declare-fun m!982457 () Bool)

(assert (=> b!1063806 m!982457))

(declare-fun m!982459 () Bool)

(assert (=> b!1063806 m!982459))

(declare-fun m!982461 () Bool)

(assert (=> b!1063806 m!982461))

(declare-fun m!982463 () Bool)

(assert (=> b!1063803 m!982463))

(declare-fun m!982465 () Bool)

(assert (=> mapNonEmpty!39610 m!982465))

(check-sat (not b!1063806) (not mapNonEmpty!39610) b_and!34219 (not b_next!21477) (not start!94062) (not b!1063803) tp_is_empty!25287 (not b!1063804))
(check-sat b_and!34219 (not b_next!21477))
