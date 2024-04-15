; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71078 () Bool)

(assert start!71078)

(declare-fun b_free!13285 () Bool)

(declare-fun b_next!13285 () Bool)

(assert (=> start!71078 (= b_free!13285 (not b_next!13285))))

(declare-fun tp!46612 () Bool)

(declare-fun b_and!22173 () Bool)

(assert (=> start!71078 (= tp!46612 b_and!22173)))

(declare-fun b!825492 () Bool)

(declare-fun res!562805 () Bool)

(declare-fun e!459531 () Bool)

(assert (=> b!825492 (=> (not res!562805) (not e!459531))))

(declare-datatypes ((array!46135 0))(
  ( (array!46136 (arr!22114 (Array (_ BitVec 32) (_ BitVec 64))) (size!22535 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46135)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24995 0))(
  ( (V!24996 (val!7545 Int)) )
))
(declare-datatypes ((ValueCell!7082 0))(
  ( (ValueCellFull!7082 (v!9972 V!24995)) (EmptyCell!7082) )
))
(declare-datatypes ((array!46137 0))(
  ( (array!46138 (arr!22115 (Array (_ BitVec 32) ValueCell!7082)) (size!22536 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46137)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825492 (= res!562805 (and (= (size!22536 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22535 _keys!976) (size!22536 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825493 () Bool)

(declare-fun res!562804 () Bool)

(assert (=> b!825493 (=> (not res!562804) (not e!459531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46135 (_ BitVec 32)) Bool)

(assert (=> b!825493 (= res!562804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24115 () Bool)

(declare-fun mapRes!24115 () Bool)

(assert (=> mapIsEmpty!24115 mapRes!24115))

(declare-fun b!825494 () Bool)

(declare-fun e!459524 () Bool)

(declare-fun tp_is_empty!14995 () Bool)

(assert (=> b!825494 (= e!459524 tp_is_empty!14995)))

(declare-datatypes ((tuple2!9996 0))(
  ( (tuple2!9997 (_1!5009 (_ BitVec 64)) (_2!5009 V!24995)) )
))
(declare-datatypes ((List!15789 0))(
  ( (Nil!15786) (Cons!15785 (h!16914 tuple2!9996) (t!22125 List!15789)) )
))
(declare-datatypes ((ListLongMap!8809 0))(
  ( (ListLongMap!8810 (toList!4420 List!15789)) )
))
(declare-fun lt!372849 () ListLongMap!8809)

(declare-fun e!459529 () Bool)

(declare-fun lt!372851 () tuple2!9996)

(declare-fun zeroValueAfter!34 () V!24995)

(declare-fun b!825495 () Bool)

(declare-fun lt!372858 () ListLongMap!8809)

(declare-fun +!1957 (ListLongMap!8809 tuple2!9996) ListLongMap!8809)

(assert (=> b!825495 (= e!459529 (= lt!372849 (+!1957 (+!1957 lt!372858 (tuple2!9997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372851)))))

(declare-fun res!562800 () Bool)

(assert (=> start!71078 (=> (not res!562800) (not e!459531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71078 (= res!562800 (validMask!0 mask!1312))))

(assert (=> start!71078 e!459531))

(assert (=> start!71078 tp_is_empty!14995))

(declare-fun array_inv!17697 (array!46135) Bool)

(assert (=> start!71078 (array_inv!17697 _keys!976)))

(assert (=> start!71078 true))

(declare-fun e!459526 () Bool)

(declare-fun array_inv!17698 (array!46137) Bool)

(assert (=> start!71078 (and (array_inv!17698 _values!788) e!459526)))

(assert (=> start!71078 tp!46612))

(declare-fun e!459525 () Bool)

(declare-fun lt!372854 () tuple2!9996)

(declare-fun b!825496 () Bool)

(assert (=> b!825496 (= e!459525 (= lt!372849 (+!1957 (+!1957 lt!372858 lt!372851) lt!372854)))))

(declare-fun b!825497 () Bool)

(assert (=> b!825497 (= e!459526 (and e!459524 mapRes!24115))))

(declare-fun condMapEmpty!24115 () Bool)

(declare-fun mapDefault!24115 () ValueCell!7082)

(assert (=> b!825497 (= condMapEmpty!24115 (= (arr!22115 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7082)) mapDefault!24115)))))

(declare-fun mapNonEmpty!24115 () Bool)

(declare-fun tp!46611 () Bool)

(declare-fun e!459528 () Bool)

(assert (=> mapNonEmpty!24115 (= mapRes!24115 (and tp!46611 e!459528))))

(declare-fun mapRest!24115 () (Array (_ BitVec 32) ValueCell!7082))

(declare-fun mapValue!24115 () ValueCell!7082)

(declare-fun mapKey!24115 () (_ BitVec 32))

(assert (=> mapNonEmpty!24115 (= (arr!22115 _values!788) (store mapRest!24115 mapKey!24115 mapValue!24115))))

(declare-fun b!825498 () Bool)

(assert (=> b!825498 (= e!459528 tp_is_empty!14995)))

(declare-fun b!825499 () Bool)

(declare-fun res!562803 () Bool)

(assert (=> b!825499 (=> (not res!562803) (not e!459531))))

(declare-datatypes ((List!15790 0))(
  ( (Nil!15787) (Cons!15786 (h!16915 (_ BitVec 64)) (t!22126 List!15790)) )
))
(declare-fun arrayNoDuplicates!0 (array!46135 (_ BitVec 32) List!15790) Bool)

(assert (=> b!825499 (= res!562803 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15787))))

(declare-fun b!825500 () Bool)

(declare-fun e!459527 () Bool)

(assert (=> b!825500 (= e!459527 true)))

(declare-fun lt!372856 () ListLongMap!8809)

(declare-fun lt!372853 () ListLongMap!8809)

(assert (=> b!825500 (= lt!372853 (+!1957 (+!1957 lt!372856 lt!372854) lt!372851))))

(declare-fun lt!372850 () ListLongMap!8809)

(declare-fun lt!372860 () ListLongMap!8809)

(assert (=> b!825500 (and (= lt!372850 lt!372860) (= lt!372849 lt!372860) (= lt!372849 lt!372850))))

(declare-fun lt!372855 () ListLongMap!8809)

(assert (=> b!825500 (= lt!372860 (+!1957 lt!372855 lt!372854))))

(declare-fun lt!372859 () ListLongMap!8809)

(assert (=> b!825500 (= lt!372850 (+!1957 lt!372859 lt!372854))))

(declare-fun zeroValueBefore!34 () V!24995)

(declare-datatypes ((Unit!28253 0))(
  ( (Unit!28254) )
))
(declare-fun lt!372852 () Unit!28253)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!224 (ListLongMap!8809 (_ BitVec 64) V!24995 V!24995) Unit!28253)

(assert (=> b!825500 (= lt!372852 (addSameAsAddTwiceSameKeyDiffValues!224 lt!372859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825500 e!459525))

(declare-fun res!562802 () Bool)

(assert (=> b!825500 (=> (not res!562802) (not e!459525))))

(declare-fun lt!372848 () ListLongMap!8809)

(assert (=> b!825500 (= res!562802 (= lt!372848 lt!372855))))

(declare-fun lt!372861 () tuple2!9996)

(assert (=> b!825500 (= lt!372855 (+!1957 lt!372859 lt!372861))))

(assert (=> b!825500 (= lt!372859 (+!1957 lt!372856 lt!372851))))

(assert (=> b!825500 (= lt!372854 (tuple2!9997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825500 e!459529))

(declare-fun res!562801 () Bool)

(assert (=> b!825500 (=> (not res!562801) (not e!459529))))

(assert (=> b!825500 (= res!562801 (= lt!372848 (+!1957 (+!1957 lt!372856 lt!372861) lt!372851)))))

(declare-fun minValue!754 () V!24995)

(assert (=> b!825500 (= lt!372851 (tuple2!9997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825500 (= lt!372861 (tuple2!9997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2507 (array!46135 array!46137 (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 (_ BitVec 32) Int) ListLongMap!8809)

(assert (=> b!825500 (= lt!372849 (getCurrentListMap!2507 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825500 (= lt!372848 (getCurrentListMap!2507 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825501 () Bool)

(assert (=> b!825501 (= e!459531 (not e!459527))))

(declare-fun res!562806 () Bool)

(assert (=> b!825501 (=> res!562806 e!459527)))

(assert (=> b!825501 (= res!562806 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825501 (= lt!372856 lt!372858)))

(declare-fun lt!372857 () Unit!28253)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!551 (array!46135 array!46137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 V!24995 V!24995 (_ BitVec 32) Int) Unit!28253)

(assert (=> b!825501 (= lt!372857 (lemmaNoChangeToArrayThenSameMapNoExtras!551 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2458 (array!46135 array!46137 (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 (_ BitVec 32) Int) ListLongMap!8809)

(assert (=> b!825501 (= lt!372858 (getCurrentListMapNoExtraKeys!2458 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825501 (= lt!372856 (getCurrentListMapNoExtraKeys!2458 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71078 res!562800) b!825492))

(assert (= (and b!825492 res!562805) b!825493))

(assert (= (and b!825493 res!562804) b!825499))

(assert (= (and b!825499 res!562803) b!825501))

(assert (= (and b!825501 (not res!562806)) b!825500))

(assert (= (and b!825500 res!562801) b!825495))

(assert (= (and b!825500 res!562802) b!825496))

(assert (= (and b!825497 condMapEmpty!24115) mapIsEmpty!24115))

(assert (= (and b!825497 (not condMapEmpty!24115)) mapNonEmpty!24115))

(get-info :version)

(assert (= (and mapNonEmpty!24115 ((_ is ValueCellFull!7082) mapValue!24115)) b!825498))

(assert (= (and b!825497 ((_ is ValueCellFull!7082) mapDefault!24115)) b!825494))

(assert (= start!71078 b!825497))

(declare-fun m!767325 () Bool)

(assert (=> b!825500 m!767325))

(declare-fun m!767327 () Bool)

(assert (=> b!825500 m!767327))

(declare-fun m!767329 () Bool)

(assert (=> b!825500 m!767329))

(declare-fun m!767331 () Bool)

(assert (=> b!825500 m!767331))

(assert (=> b!825500 m!767329))

(declare-fun m!767333 () Bool)

(assert (=> b!825500 m!767333))

(declare-fun m!767335 () Bool)

(assert (=> b!825500 m!767335))

(declare-fun m!767337 () Bool)

(assert (=> b!825500 m!767337))

(declare-fun m!767339 () Bool)

(assert (=> b!825500 m!767339))

(declare-fun m!767341 () Bool)

(assert (=> b!825500 m!767341))

(declare-fun m!767343 () Bool)

(assert (=> b!825500 m!767343))

(assert (=> b!825500 m!767335))

(declare-fun m!767345 () Bool)

(assert (=> b!825500 m!767345))

(declare-fun m!767347 () Bool)

(assert (=> b!825496 m!767347))

(assert (=> b!825496 m!767347))

(declare-fun m!767349 () Bool)

(assert (=> b!825496 m!767349))

(declare-fun m!767351 () Bool)

(assert (=> b!825495 m!767351))

(assert (=> b!825495 m!767351))

(declare-fun m!767353 () Bool)

(assert (=> b!825495 m!767353))

(declare-fun m!767355 () Bool)

(assert (=> mapNonEmpty!24115 m!767355))

(declare-fun m!767357 () Bool)

(assert (=> b!825501 m!767357))

(declare-fun m!767359 () Bool)

(assert (=> b!825501 m!767359))

(declare-fun m!767361 () Bool)

(assert (=> b!825501 m!767361))

(declare-fun m!767363 () Bool)

(assert (=> start!71078 m!767363))

(declare-fun m!767365 () Bool)

(assert (=> start!71078 m!767365))

(declare-fun m!767367 () Bool)

(assert (=> start!71078 m!767367))

(declare-fun m!767369 () Bool)

(assert (=> b!825493 m!767369))

(declare-fun m!767371 () Bool)

(assert (=> b!825499 m!767371))

(check-sat tp_is_empty!14995 (not start!71078) (not b!825500) (not b!825499) (not b!825501) (not mapNonEmpty!24115) (not b!825496) (not b!825493) (not b!825495) b_and!22173 (not b_next!13285))
(check-sat b_and!22173 (not b_next!13285))
