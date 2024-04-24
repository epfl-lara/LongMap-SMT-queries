; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71034 () Bool)

(assert start!71034)

(declare-fun b_free!13105 () Bool)

(declare-fun b_next!13105 () Bool)

(assert (=> start!71034 (= b_free!13105 (not b_next!13105))))

(declare-fun tp!46063 () Bool)

(declare-fun b_and!21999 () Bool)

(assert (=> start!71034 (= tp!46063 b_and!21999)))

(declare-fun mapNonEmpty!23836 () Bool)

(declare-fun mapRes!23836 () Bool)

(declare-fun tp!46062 () Bool)

(declare-fun e!458325 () Bool)

(assert (=> mapNonEmpty!23836 (= mapRes!23836 (and tp!46062 e!458325))))

(declare-datatypes ((V!24755 0))(
  ( (V!24756 (val!7455 Int)) )
))
(declare-datatypes ((ValueCell!6992 0))(
  ( (ValueCellFull!6992 (v!9887 V!24755)) (EmptyCell!6992) )
))
(declare-fun mapRest!23836 () (Array (_ BitVec 32) ValueCell!6992))

(declare-datatypes ((array!45823 0))(
  ( (array!45824 (arr!21956 (Array (_ BitVec 32) ValueCell!6992)) (size!22376 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45823)

(declare-fun mapKey!23836 () (_ BitVec 32))

(declare-fun mapValue!23836 () ValueCell!6992)

(assert (=> mapNonEmpty!23836 (= (arr!21956 _values!788) (store mapRest!23836 mapKey!23836 mapValue!23836))))

(declare-fun b!824009 () Bool)

(declare-fun res!561688 () Bool)

(declare-fun e!458323 () Bool)

(assert (=> b!824009 (=> (not res!561688) (not e!458323))))

(declare-datatypes ((array!45825 0))(
  ( (array!45826 (arr!21957 (Array (_ BitVec 32) (_ BitVec 64))) (size!22377 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45825)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45825 (_ BitVec 32)) Bool)

(assert (=> b!824009 (= res!561688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824010 () Bool)

(declare-fun e!458326 () Bool)

(assert (=> b!824010 (= e!458323 (not e!458326))))

(declare-fun res!561686 () Bool)

(assert (=> b!824010 (=> res!561686 e!458326)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824010 (= res!561686 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9770 0))(
  ( (tuple2!9771 (_1!4896 (_ BitVec 64)) (_2!4896 V!24755)) )
))
(declare-datatypes ((List!15556 0))(
  ( (Nil!15553) (Cons!15552 (h!16687 tuple2!9770) (t!21887 List!15556)) )
))
(declare-datatypes ((ListLongMap!8595 0))(
  ( (ListLongMap!8596 (toList!4313 List!15556)) )
))
(declare-fun lt!371237 () ListLongMap!8595)

(declare-fun lt!371244 () ListLongMap!8595)

(assert (=> b!824010 (= lt!371237 lt!371244)))

(declare-datatypes ((Unit!28177 0))(
  ( (Unit!28178) )
))
(declare-fun lt!371242 () Unit!28177)

(declare-fun zeroValueBefore!34 () V!24755)

(declare-fun zeroValueAfter!34 () V!24755)

(declare-fun minValue!754 () V!24755)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!485 (array!45825 array!45823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 V!24755 V!24755 (_ BitVec 32) Int) Unit!28177)

(assert (=> b!824010 (= lt!371242 (lemmaNoChangeToArrayThenSameMapNoExtras!485 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2397 (array!45825 array!45823 (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 (_ BitVec 32) Int) ListLongMap!8595)

(assert (=> b!824010 (= lt!371244 (getCurrentListMapNoExtraKeys!2397 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824010 (= lt!371237 (getCurrentListMapNoExtraKeys!2397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824011 () Bool)

(declare-fun tp_is_empty!14815 () Bool)

(assert (=> b!824011 (= e!458325 tp_is_empty!14815)))

(declare-fun b!824012 () Bool)

(assert (=> b!824012 (= e!458326 true)))

(declare-fun lt!371246 () ListLongMap!8595)

(declare-fun lt!371238 () ListLongMap!8595)

(declare-fun lt!371241 () tuple2!9770)

(declare-fun +!1902 (ListLongMap!8595 tuple2!9770) ListLongMap!8595)

(assert (=> b!824012 (= lt!371246 (+!1902 lt!371238 lt!371241))))

(declare-fun lt!371243 () Unit!28177)

(declare-fun addCommutativeForDiffKeys!460 (ListLongMap!8595 (_ BitVec 64) V!24755 (_ BitVec 64) V!24755) Unit!28177)

(assert (=> b!824012 (= lt!371243 (addCommutativeForDiffKeys!460 lt!371237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371240 () ListLongMap!8595)

(assert (=> b!824012 (= lt!371240 lt!371246)))

(declare-fun lt!371239 () tuple2!9770)

(assert (=> b!824012 (= lt!371246 (+!1902 (+!1902 lt!371237 lt!371241) lt!371239))))

(assert (=> b!824012 (= lt!371241 (tuple2!9771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371245 () ListLongMap!8595)

(assert (=> b!824012 (= lt!371245 lt!371238)))

(assert (=> b!824012 (= lt!371238 (+!1902 lt!371237 lt!371239))))

(assert (=> b!824012 (= lt!371239 (tuple2!9771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2466 (array!45825 array!45823 (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 (_ BitVec 32) Int) ListLongMap!8595)

(assert (=> b!824012 (= lt!371240 (getCurrentListMap!2466 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824012 (= lt!371245 (getCurrentListMap!2466 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824013 () Bool)

(declare-fun e!458321 () Bool)

(assert (=> b!824013 (= e!458321 tp_is_empty!14815)))

(declare-fun b!824014 () Bool)

(declare-fun e!458322 () Bool)

(assert (=> b!824014 (= e!458322 (and e!458321 mapRes!23836))))

(declare-fun condMapEmpty!23836 () Bool)

(declare-fun mapDefault!23836 () ValueCell!6992)

(assert (=> b!824014 (= condMapEmpty!23836 (= (arr!21956 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6992)) mapDefault!23836)))))

(declare-fun b!824015 () Bool)

(declare-fun res!561685 () Bool)

(assert (=> b!824015 (=> (not res!561685) (not e!458323))))

(declare-datatypes ((List!15557 0))(
  ( (Nil!15554) (Cons!15553 (h!16688 (_ BitVec 64)) (t!21888 List!15557)) )
))
(declare-fun arrayNoDuplicates!0 (array!45825 (_ BitVec 32) List!15557) Bool)

(assert (=> b!824015 (= res!561685 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15554))))

(declare-fun res!561689 () Bool)

(assert (=> start!71034 (=> (not res!561689) (not e!458323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71034 (= res!561689 (validMask!0 mask!1312))))

(assert (=> start!71034 e!458323))

(assert (=> start!71034 tp_is_empty!14815))

(declare-fun array_inv!17563 (array!45825) Bool)

(assert (=> start!71034 (array_inv!17563 _keys!976)))

(assert (=> start!71034 true))

(declare-fun array_inv!17564 (array!45823) Bool)

(assert (=> start!71034 (and (array_inv!17564 _values!788) e!458322)))

(assert (=> start!71034 tp!46063))

(declare-fun b!824016 () Bool)

(declare-fun res!561687 () Bool)

(assert (=> b!824016 (=> (not res!561687) (not e!458323))))

(assert (=> b!824016 (= res!561687 (and (= (size!22376 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22377 _keys!976) (size!22376 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23836 () Bool)

(assert (=> mapIsEmpty!23836 mapRes!23836))

(assert (= (and start!71034 res!561689) b!824016))

(assert (= (and b!824016 res!561687) b!824009))

(assert (= (and b!824009 res!561688) b!824015))

(assert (= (and b!824015 res!561685) b!824010))

(assert (= (and b!824010 (not res!561686)) b!824012))

(assert (= (and b!824014 condMapEmpty!23836) mapIsEmpty!23836))

(assert (= (and b!824014 (not condMapEmpty!23836)) mapNonEmpty!23836))

(get-info :version)

(assert (= (and mapNonEmpty!23836 ((_ is ValueCellFull!6992) mapValue!23836)) b!824011))

(assert (= (and b!824014 ((_ is ValueCellFull!6992) mapDefault!23836)) b!824013))

(assert (= start!71034 b!824014))

(declare-fun m!766451 () Bool)

(assert (=> b!824010 m!766451))

(declare-fun m!766453 () Bool)

(assert (=> b!824010 m!766453))

(declare-fun m!766455 () Bool)

(assert (=> b!824010 m!766455))

(declare-fun m!766457 () Bool)

(assert (=> b!824012 m!766457))

(declare-fun m!766459 () Bool)

(assert (=> b!824012 m!766459))

(declare-fun m!766461 () Bool)

(assert (=> b!824012 m!766461))

(declare-fun m!766463 () Bool)

(assert (=> b!824012 m!766463))

(declare-fun m!766465 () Bool)

(assert (=> b!824012 m!766465))

(declare-fun m!766467 () Bool)

(assert (=> b!824012 m!766467))

(assert (=> b!824012 m!766461))

(declare-fun m!766469 () Bool)

(assert (=> b!824012 m!766469))

(declare-fun m!766471 () Bool)

(assert (=> mapNonEmpty!23836 m!766471))

(declare-fun m!766473 () Bool)

(assert (=> b!824015 m!766473))

(declare-fun m!766475 () Bool)

(assert (=> b!824009 m!766475))

(declare-fun m!766477 () Bool)

(assert (=> start!71034 m!766477))

(declare-fun m!766479 () Bool)

(assert (=> start!71034 m!766479))

(declare-fun m!766481 () Bool)

(assert (=> start!71034 m!766481))

(check-sat (not b!824010) tp_is_empty!14815 (not start!71034) (not b!824009) b_and!21999 (not mapNonEmpty!23836) (not b!824015) (not b_next!13105) (not b!824012))
(check-sat b_and!21999 (not b_next!13105))
