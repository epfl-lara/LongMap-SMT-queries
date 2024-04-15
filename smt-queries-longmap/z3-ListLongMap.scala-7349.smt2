; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93792 () Bool)

(assert start!93792)

(declare-fun b_free!21271 () Bool)

(declare-fun b_next!21271 () Bool)

(assert (=> start!93792 (= b_free!21271 (not b_next!21271))))

(declare-fun tp!75235 () Bool)

(declare-fun b_and!33959 () Bool)

(assert (=> start!93792 (= tp!75235 b_and!33959)))

(declare-fun res!708448 () Bool)

(declare-fun e!603971 () Bool)

(assert (=> start!93792 (=> (not res!708448) (not e!603971))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93792 (= res!708448 (validMask!0 mask!1515))))

(assert (=> start!93792 e!603971))

(assert (=> start!93792 true))

(declare-fun tp_is_empty!25081 () Bool)

(assert (=> start!93792 tp_is_empty!25081))

(declare-datatypes ((V!38577 0))(
  ( (V!38578 (val!12591 Int)) )
))
(declare-datatypes ((ValueCell!11837 0))(
  ( (ValueCellFull!11837 (v!15200 V!38577)) (EmptyCell!11837) )
))
(declare-datatypes ((array!67116 0))(
  ( (array!67117 (arr!32266 (Array (_ BitVec 32) ValueCell!11837)) (size!32804 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67116)

(declare-fun e!603974 () Bool)

(declare-fun array_inv!25008 (array!67116) Bool)

(assert (=> start!93792 (and (array_inv!25008 _values!955) e!603974)))

(assert (=> start!93792 tp!75235))

(declare-datatypes ((array!67118 0))(
  ( (array!67119 (arr!32267 (Array (_ BitVec 32) (_ BitVec 64))) (size!32805 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67118)

(declare-fun array_inv!25009 (array!67118) Bool)

(assert (=> start!93792 (array_inv!25009 _keys!1163)))

(declare-fun b!1060754 () Bool)

(declare-fun e!603975 () Bool)

(declare-fun mapRes!39292 () Bool)

(assert (=> b!1060754 (= e!603974 (and e!603975 mapRes!39292))))

(declare-fun condMapEmpty!39292 () Bool)

(declare-fun mapDefault!39292 () ValueCell!11837)

(assert (=> b!1060754 (= condMapEmpty!39292 (= (arr!32266 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11837)) mapDefault!39292)))))

(declare-fun mapNonEmpty!39292 () Bool)

(declare-fun tp!75236 () Bool)

(declare-fun e!603972 () Bool)

(assert (=> mapNonEmpty!39292 (= mapRes!39292 (and tp!75236 e!603972))))

(declare-fun mapValue!39292 () ValueCell!11837)

(declare-fun mapKey!39292 () (_ BitVec 32))

(declare-fun mapRest!39292 () (Array (_ BitVec 32) ValueCell!11837))

(assert (=> mapNonEmpty!39292 (= (arr!32266 _values!955) (store mapRest!39292 mapKey!39292 mapValue!39292))))

(declare-fun b!1060755 () Bool)

(declare-fun res!708449 () Bool)

(assert (=> b!1060755 (=> (not res!708449) (not e!603971))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060755 (= res!708449 (and (= (size!32804 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32805 _keys!1163) (size!32804 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39292 () Bool)

(assert (=> mapIsEmpty!39292 mapRes!39292))

(declare-fun b!1060756 () Bool)

(assert (=> b!1060756 (= e!603971 false)))

(declare-datatypes ((tuple2!15980 0))(
  ( (tuple2!15981 (_1!8001 (_ BitVec 64)) (_2!8001 V!38577)) )
))
(declare-datatypes ((List!22535 0))(
  ( (Nil!22532) (Cons!22531 (h!23740 tuple2!15980) (t!31835 List!22535)) )
))
(declare-datatypes ((ListLongMap!13949 0))(
  ( (ListLongMap!13950 (toList!6990 List!22535)) )
))
(declare-fun lt!467212 () ListLongMap!13949)

(declare-fun minValue!907 () V!38577)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38577)

(declare-fun getCurrentListMapNoExtraKeys!3607 (array!67118 array!67116 (_ BitVec 32) (_ BitVec 32) V!38577 V!38577 (_ BitVec 32) Int) ListLongMap!13949)

(assert (=> b!1060756 (= lt!467212 (getCurrentListMapNoExtraKeys!3607 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38577)

(declare-fun lt!467213 () ListLongMap!13949)

(assert (=> b!1060756 (= lt!467213 (getCurrentListMapNoExtraKeys!3607 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060757 () Bool)

(assert (=> b!1060757 (= e!603972 tp_is_empty!25081)))

(declare-fun b!1060758 () Bool)

(assert (=> b!1060758 (= e!603975 tp_is_empty!25081)))

(declare-fun b!1060759 () Bool)

(declare-fun res!708451 () Bool)

(assert (=> b!1060759 (=> (not res!708451) (not e!603971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67118 (_ BitVec 32)) Bool)

(assert (=> b!1060759 (= res!708451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060760 () Bool)

(declare-fun res!708450 () Bool)

(assert (=> b!1060760 (=> (not res!708450) (not e!603971))))

(declare-datatypes ((List!22536 0))(
  ( (Nil!22533) (Cons!22532 (h!23741 (_ BitVec 64)) (t!31836 List!22536)) )
))
(declare-fun arrayNoDuplicates!0 (array!67118 (_ BitVec 32) List!22536) Bool)

(assert (=> b!1060760 (= res!708450 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22533))))

(assert (= (and start!93792 res!708448) b!1060755))

(assert (= (and b!1060755 res!708449) b!1060759))

(assert (= (and b!1060759 res!708451) b!1060760))

(assert (= (and b!1060760 res!708450) b!1060756))

(assert (= (and b!1060754 condMapEmpty!39292) mapIsEmpty!39292))

(assert (= (and b!1060754 (not condMapEmpty!39292)) mapNonEmpty!39292))

(get-info :version)

(assert (= (and mapNonEmpty!39292 ((_ is ValueCellFull!11837) mapValue!39292)) b!1060757))

(assert (= (and b!1060754 ((_ is ValueCellFull!11837) mapDefault!39292)) b!1060758))

(assert (= start!93792 b!1060754))

(declare-fun m!979237 () Bool)

(assert (=> b!1060756 m!979237))

(declare-fun m!979239 () Bool)

(assert (=> b!1060756 m!979239))

(declare-fun m!979241 () Bool)

(assert (=> b!1060760 m!979241))

(declare-fun m!979243 () Bool)

(assert (=> mapNonEmpty!39292 m!979243))

(declare-fun m!979245 () Bool)

(assert (=> start!93792 m!979245))

(declare-fun m!979247 () Bool)

(assert (=> start!93792 m!979247))

(declare-fun m!979249 () Bool)

(assert (=> start!93792 m!979249))

(declare-fun m!979251 () Bool)

(assert (=> b!1060759 m!979251))

(check-sat (not start!93792) (not b_next!21271) tp_is_empty!25081 (not mapNonEmpty!39292) (not b!1060760) (not b!1060756) (not b!1060759) b_and!33959)
(check-sat b_and!33959 (not b_next!21271))
