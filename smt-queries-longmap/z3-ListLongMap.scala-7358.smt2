; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93854 () Bool)

(assert start!93854)

(declare-fun b_free!21327 () Bool)

(declare-fun b_next!21327 () Bool)

(assert (=> start!93854 (= b_free!21327 (not b_next!21327))))

(declare-fun tp!75404 () Bool)

(declare-fun b_and!34041 () Bool)

(assert (=> start!93854 (= tp!75404 b_and!34041)))

(declare-fun res!708856 () Bool)

(declare-fun e!604486 () Bool)

(assert (=> start!93854 (=> (not res!708856) (not e!604486))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93854 (= res!708856 (validMask!0 mask!1515))))

(assert (=> start!93854 e!604486))

(assert (=> start!93854 true))

(declare-fun tp_is_empty!25137 () Bool)

(assert (=> start!93854 tp_is_empty!25137))

(declare-datatypes ((V!38651 0))(
  ( (V!38652 (val!12619 Int)) )
))
(declare-datatypes ((ValueCell!11865 0))(
  ( (ValueCellFull!11865 (v!15229 V!38651)) (EmptyCell!11865) )
))
(declare-datatypes ((array!67277 0))(
  ( (array!67278 (arr!32346 (Array (_ BitVec 32) ValueCell!11865)) (size!32882 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67277)

(declare-fun e!604488 () Bool)

(declare-fun array_inv!25064 (array!67277) Bool)

(assert (=> start!93854 (and (array_inv!25064 _values!955) e!604488)))

(assert (=> start!93854 tp!75404))

(declare-datatypes ((array!67279 0))(
  ( (array!67280 (arr!32347 (Array (_ BitVec 32) (_ BitVec 64))) (size!32883 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67279)

(declare-fun array_inv!25065 (array!67279) Bool)

(assert (=> start!93854 (array_inv!25065 _keys!1163)))

(declare-fun mapIsEmpty!39376 () Bool)

(declare-fun mapRes!39376 () Bool)

(assert (=> mapIsEmpty!39376 mapRes!39376))

(declare-fun b!1061495 () Bool)

(declare-fun e!604485 () Bool)

(assert (=> b!1061495 (= e!604488 (and e!604485 mapRes!39376))))

(declare-fun condMapEmpty!39376 () Bool)

(declare-fun mapDefault!39376 () ValueCell!11865)

(assert (=> b!1061495 (= condMapEmpty!39376 (= (arr!32346 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11865)) mapDefault!39376)))))

(declare-fun b!1061496 () Bool)

(declare-fun res!708855 () Bool)

(assert (=> b!1061496 (=> (not res!708855) (not e!604486))))

(declare-datatypes ((List!22537 0))(
  ( (Nil!22534) (Cons!22533 (h!23742 (_ BitVec 64)) (t!31846 List!22537)) )
))
(declare-fun arrayNoDuplicates!0 (array!67279 (_ BitVec 32) List!22537) Bool)

(assert (=> b!1061496 (= res!708855 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22534))))

(declare-fun b!1061497 () Bool)

(assert (=> b!1061497 (= e!604485 tp_is_empty!25137)))

(declare-fun b!1061498 () Bool)

(declare-fun e!604484 () Bool)

(assert (=> b!1061498 (= e!604484 tp_is_empty!25137)))

(declare-fun mapNonEmpty!39376 () Bool)

(declare-fun tp!75403 () Bool)

(assert (=> mapNonEmpty!39376 (= mapRes!39376 (and tp!75403 e!604484))))

(declare-fun mapKey!39376 () (_ BitVec 32))

(declare-fun mapValue!39376 () ValueCell!11865)

(declare-fun mapRest!39376 () (Array (_ BitVec 32) ValueCell!11865))

(assert (=> mapNonEmpty!39376 (= (arr!32346 _values!955) (store mapRest!39376 mapKey!39376 mapValue!39376))))

(declare-fun b!1061499 () Bool)

(declare-fun res!708854 () Bool)

(assert (=> b!1061499 (=> (not res!708854) (not e!604486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67279 (_ BitVec 32)) Bool)

(assert (=> b!1061499 (= res!708854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061500 () Bool)

(declare-fun res!708853 () Bool)

(assert (=> b!1061500 (=> (not res!708853) (not e!604486))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061500 (= res!708853 (and (= (size!32882 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32883 _keys!1163) (size!32882 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061501 () Bool)

(assert (=> b!1061501 (= e!604486 (not true))))

(declare-datatypes ((tuple2!15952 0))(
  ( (tuple2!15953 (_1!7987 (_ BitVec 64)) (_2!7987 V!38651)) )
))
(declare-datatypes ((List!22538 0))(
  ( (Nil!22535) (Cons!22534 (h!23743 tuple2!15952) (t!31847 List!22538)) )
))
(declare-datatypes ((ListLongMap!13921 0))(
  ( (ListLongMap!13922 (toList!6976 List!22538)) )
))
(declare-fun lt!467623 () ListLongMap!13921)

(declare-fun lt!467622 () ListLongMap!13921)

(assert (=> b!1061501 (= lt!467623 lt!467622)))

(declare-fun zeroValueBefore!47 () V!38651)

(declare-datatypes ((Unit!34754 0))(
  ( (Unit!34755) )
))
(declare-fun lt!467621 () Unit!34754)

(declare-fun minValue!907 () V!38651)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38651)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!615 (array!67279 array!67277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38651 V!38651 V!38651 V!38651 (_ BitVec 32) Int) Unit!34754)

(assert (=> b!1061501 (= lt!467621 (lemmaNoChangeToArrayThenSameMapNoExtras!615 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3578 (array!67279 array!67277 (_ BitVec 32) (_ BitVec 32) V!38651 V!38651 (_ BitVec 32) Int) ListLongMap!13921)

(assert (=> b!1061501 (= lt!467622 (getCurrentListMapNoExtraKeys!3578 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061501 (= lt!467623 (getCurrentListMapNoExtraKeys!3578 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93854 res!708856) b!1061500))

(assert (= (and b!1061500 res!708853) b!1061499))

(assert (= (and b!1061499 res!708854) b!1061496))

(assert (= (and b!1061496 res!708855) b!1061501))

(assert (= (and b!1061495 condMapEmpty!39376) mapIsEmpty!39376))

(assert (= (and b!1061495 (not condMapEmpty!39376)) mapNonEmpty!39376))

(get-info :version)

(assert (= (and mapNonEmpty!39376 ((_ is ValueCellFull!11865) mapValue!39376)) b!1061498))

(assert (= (and b!1061495 ((_ is ValueCellFull!11865) mapDefault!39376)) b!1061497))

(assert (= start!93854 b!1061495))

(declare-fun m!980337 () Bool)

(assert (=> b!1061496 m!980337))

(declare-fun m!980339 () Bool)

(assert (=> mapNonEmpty!39376 m!980339))

(declare-fun m!980341 () Bool)

(assert (=> b!1061501 m!980341))

(declare-fun m!980343 () Bool)

(assert (=> b!1061501 m!980343))

(declare-fun m!980345 () Bool)

(assert (=> b!1061501 m!980345))

(declare-fun m!980347 () Bool)

(assert (=> b!1061499 m!980347))

(declare-fun m!980349 () Bool)

(assert (=> start!93854 m!980349))

(declare-fun m!980351 () Bool)

(assert (=> start!93854 m!980351))

(declare-fun m!980353 () Bool)

(assert (=> start!93854 m!980353))

(check-sat tp_is_empty!25137 (not b!1061499) (not b!1061496) (not mapNonEmpty!39376) (not b!1061501) (not b_next!21327) (not start!93854) b_and!34041)
(check-sat b_and!34041 (not b_next!21327))
