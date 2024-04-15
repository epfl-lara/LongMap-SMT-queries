; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93696 () Bool)

(assert start!93696)

(declare-fun b_free!21187 () Bool)

(declare-fun b_next!21187 () Bool)

(assert (=> start!93696 (= b_free!21187 (not b_next!21187))))

(declare-fun tp!74981 () Bool)

(declare-fun b_and!33871 () Bool)

(assert (=> start!93696 (= tp!74981 b_and!33871)))

(declare-fun b!1059799 () Bool)

(declare-fun e!603293 () Bool)

(assert (=> b!1059799 (= e!603293 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38465 0))(
  ( (V!38466 (val!12549 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38465)

(declare-datatypes ((tuple2!15924 0))(
  ( (tuple2!15925 (_1!7973 (_ BitVec 64)) (_2!7973 V!38465)) )
))
(declare-datatypes ((List!22475 0))(
  ( (Nil!22472) (Cons!22471 (h!23680 tuple2!15924) (t!31773 List!22475)) )
))
(declare-datatypes ((ListLongMap!13893 0))(
  ( (ListLongMap!13894 (toList!6962 List!22475)) )
))
(declare-fun lt!467000 () ListLongMap!13893)

(declare-datatypes ((ValueCell!11795 0))(
  ( (ValueCellFull!11795 (v!15158 V!38465)) (EmptyCell!11795) )
))
(declare-datatypes ((array!66958 0))(
  ( (array!66959 (arr!32188 (Array (_ BitVec 32) ValueCell!11795)) (size!32726 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66958)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38465)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66960 0))(
  ( (array!66961 (arr!32189 (Array (_ BitVec 32) (_ BitVec 64))) (size!32727 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66960)

(declare-fun getCurrentListMapNoExtraKeys!3579 (array!66960 array!66958 (_ BitVec 32) (_ BitVec 32) V!38465 V!38465 (_ BitVec 32) Int) ListLongMap!13893)

(assert (=> b!1059799 (= lt!467000 (getCurrentListMapNoExtraKeys!3579 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059800 () Bool)

(declare-fun res!707919 () Bool)

(assert (=> b!1059800 (=> (not res!707919) (not e!603293))))

(declare-datatypes ((List!22476 0))(
  ( (Nil!22473) (Cons!22472 (h!23681 (_ BitVec 64)) (t!31774 List!22476)) )
))
(declare-fun arrayNoDuplicates!0 (array!66960 (_ BitVec 32) List!22476) Bool)

(assert (=> b!1059800 (= res!707919 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22473))))

(declare-fun mapNonEmpty!39163 () Bool)

(declare-fun mapRes!39163 () Bool)

(declare-fun tp!74980 () Bool)

(declare-fun e!603296 () Bool)

(assert (=> mapNonEmpty!39163 (= mapRes!39163 (and tp!74980 e!603296))))

(declare-fun mapKey!39163 () (_ BitVec 32))

(declare-fun mapValue!39163 () ValueCell!11795)

(declare-fun mapRest!39163 () (Array (_ BitVec 32) ValueCell!11795))

(assert (=> mapNonEmpty!39163 (= (arr!32188 _values!955) (store mapRest!39163 mapKey!39163 mapValue!39163))))

(declare-fun b!1059801 () Bool)

(declare-fun res!707920 () Bool)

(assert (=> b!1059801 (=> (not res!707920) (not e!603293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66960 (_ BitVec 32)) Bool)

(assert (=> b!1059801 (= res!707920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059802 () Bool)

(declare-fun e!603295 () Bool)

(declare-fun e!603294 () Bool)

(assert (=> b!1059802 (= e!603295 (and e!603294 mapRes!39163))))

(declare-fun condMapEmpty!39163 () Bool)

(declare-fun mapDefault!39163 () ValueCell!11795)

(assert (=> b!1059802 (= condMapEmpty!39163 (= (arr!32188 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11795)) mapDefault!39163)))))

(declare-fun b!1059803 () Bool)

(declare-fun tp_is_empty!24997 () Bool)

(assert (=> b!1059803 (= e!603296 tp_is_empty!24997)))

(declare-fun b!1059804 () Bool)

(assert (=> b!1059804 (= e!603294 tp_is_empty!24997)))

(declare-fun mapIsEmpty!39163 () Bool)

(assert (=> mapIsEmpty!39163 mapRes!39163))

(declare-fun res!707918 () Bool)

(assert (=> start!93696 (=> (not res!707918) (not e!603293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93696 (= res!707918 (validMask!0 mask!1515))))

(assert (=> start!93696 e!603293))

(assert (=> start!93696 true))

(assert (=> start!93696 tp_is_empty!24997))

(declare-fun array_inv!24952 (array!66958) Bool)

(assert (=> start!93696 (and (array_inv!24952 _values!955) e!603295)))

(assert (=> start!93696 tp!74981))

(declare-fun array_inv!24953 (array!66960) Bool)

(assert (=> start!93696 (array_inv!24953 _keys!1163)))

(declare-fun b!1059805 () Bool)

(declare-fun res!707917 () Bool)

(assert (=> b!1059805 (=> (not res!707917) (not e!603293))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059805 (= res!707917 (and (= (size!32726 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32727 _keys!1163) (size!32726 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93696 res!707918) b!1059805))

(assert (= (and b!1059805 res!707917) b!1059801))

(assert (= (and b!1059801 res!707920) b!1059800))

(assert (= (and b!1059800 res!707919) b!1059799))

(assert (= (and b!1059802 condMapEmpty!39163) mapIsEmpty!39163))

(assert (= (and b!1059802 (not condMapEmpty!39163)) mapNonEmpty!39163))

(get-info :version)

(assert (= (and mapNonEmpty!39163 ((_ is ValueCellFull!11795) mapValue!39163)) b!1059803))

(assert (= (and b!1059802 ((_ is ValueCellFull!11795) mapDefault!39163)) b!1059804))

(assert (= start!93696 b!1059802))

(declare-fun m!978569 () Bool)

(assert (=> mapNonEmpty!39163 m!978569))

(declare-fun m!978571 () Bool)

(assert (=> b!1059799 m!978571))

(declare-fun m!978573 () Bool)

(assert (=> b!1059801 m!978573))

(declare-fun m!978575 () Bool)

(assert (=> b!1059800 m!978575))

(declare-fun m!978577 () Bool)

(assert (=> start!93696 m!978577))

(declare-fun m!978579 () Bool)

(assert (=> start!93696 m!978579))

(declare-fun m!978581 () Bool)

(assert (=> start!93696 m!978581))

(check-sat (not start!93696) (not mapNonEmpty!39163) (not b_next!21187) (not b!1059800) (not b!1059801) (not b!1059799) tp_is_empty!24997 b_and!33871)
(check-sat b_and!33871 (not b_next!21187))
