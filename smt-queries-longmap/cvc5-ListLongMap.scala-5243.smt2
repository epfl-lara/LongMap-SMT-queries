; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70558 () Bool)

(assert start!70558)

(declare-fun b_free!12865 () Bool)

(declare-fun b_next!12865 () Bool)

(assert (=> start!70558 (= b_free!12865 (not b_next!12865))))

(declare-fun tp!45330 () Bool)

(declare-fun b_and!21707 () Bool)

(assert (=> start!70558 (= tp!45330 b_and!21707)))

(declare-fun b!819629 () Bool)

(declare-fun e!455199 () Bool)

(assert (=> b!819629 (= e!455199 true)))

(declare-datatypes ((V!24435 0))(
  ( (V!24436 (val!7335 Int)) )
))
(declare-datatypes ((tuple2!9654 0))(
  ( (tuple2!9655 (_1!4838 (_ BitVec 64)) (_2!4838 V!24435)) )
))
(declare-fun lt!367926 () tuple2!9654)

(declare-fun lt!367922 () tuple2!9654)

(declare-datatypes ((List!15480 0))(
  ( (Nil!15477) (Cons!15476 (h!16605 tuple2!9654) (t!21811 List!15480)) )
))
(declare-datatypes ((ListLongMap!8477 0))(
  ( (ListLongMap!8478 (toList!4254 List!15480)) )
))
(declare-fun lt!367921 () ListLongMap!8477)

(declare-fun lt!367917 () ListLongMap!8477)

(declare-fun +!1850 (ListLongMap!8477 tuple2!9654) ListLongMap!8477)

(assert (=> b!819629 (= lt!367921 (+!1850 (+!1850 lt!367917 lt!367926) lt!367922))))

(declare-fun lt!367925 () ListLongMap!8477)

(declare-fun lt!367919 () ListLongMap!8477)

(assert (=> b!819629 (= (+!1850 lt!367925 lt!367922) (+!1850 lt!367919 lt!367922))))

(declare-fun zeroValueBefore!34 () V!24435)

(declare-datatypes ((Unit!27987 0))(
  ( (Unit!27988) )
))
(declare-fun lt!367920 () Unit!27987)

(declare-fun zeroValueAfter!34 () V!24435)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!189 (ListLongMap!8477 (_ BitVec 64) V!24435 V!24435) Unit!27987)

(assert (=> b!819629 (= lt!367920 (addSameAsAddTwiceSameKeyDiffValues!189 lt!367925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819629 (= lt!367922 (tuple2!9655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455205 () Bool)

(assert (=> b!819629 e!455205))

(declare-fun res!559286 () Bool)

(assert (=> b!819629 (=> (not res!559286) (not e!455205))))

(declare-fun lt!367923 () ListLongMap!8477)

(assert (=> b!819629 (= res!559286 (= lt!367923 lt!367919))))

(assert (=> b!819629 (= lt!367919 (+!1850 lt!367925 lt!367926))))

(assert (=> b!819629 (= lt!367926 (tuple2!9655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24435)

(declare-datatypes ((ValueCell!6872 0))(
  ( (ValueCellFull!6872 (v!9765 V!24435)) (EmptyCell!6872) )
))
(declare-datatypes ((array!45348 0))(
  ( (array!45349 (arr!21727 (Array (_ BitVec 32) ValueCell!6872)) (size!22148 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45348)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367924 () ListLongMap!8477)

(declare-datatypes ((array!45350 0))(
  ( (array!45351 (arr!21728 (Array (_ BitVec 32) (_ BitVec 64))) (size!22149 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45350)

(declare-fun getCurrentListMap!2455 (array!45350 array!45348 (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 (_ BitVec 32) Int) ListLongMap!8477)

(assert (=> b!819629 (= lt!367924 (getCurrentListMap!2455 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819629 (= lt!367923 (getCurrentListMap!2455 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819630 () Bool)

(declare-fun res!559282 () Bool)

(declare-fun e!455200 () Bool)

(assert (=> b!819630 (=> (not res!559282) (not e!455200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45350 (_ BitVec 32)) Bool)

(assert (=> b!819630 (= res!559282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819631 () Bool)

(assert (=> b!819631 (= e!455205 (= lt!367924 (+!1850 lt!367917 (tuple2!9655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819632 () Bool)

(declare-fun res!559283 () Bool)

(assert (=> b!819632 (=> (not res!559283) (not e!455200))))

(declare-datatypes ((List!15481 0))(
  ( (Nil!15478) (Cons!15477 (h!16606 (_ BitVec 64)) (t!21812 List!15481)) )
))
(declare-fun arrayNoDuplicates!0 (array!45350 (_ BitVec 32) List!15481) Bool)

(assert (=> b!819632 (= res!559283 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15478))))

(declare-fun mapNonEmpty!23464 () Bool)

(declare-fun mapRes!23464 () Bool)

(declare-fun tp!45331 () Bool)

(declare-fun e!455201 () Bool)

(assert (=> mapNonEmpty!23464 (= mapRes!23464 (and tp!45331 e!455201))))

(declare-fun mapKey!23464 () (_ BitVec 32))

(declare-fun mapRest!23464 () (Array (_ BitVec 32) ValueCell!6872))

(declare-fun mapValue!23464 () ValueCell!6872)

(assert (=> mapNonEmpty!23464 (= (arr!21727 _values!788) (store mapRest!23464 mapKey!23464 mapValue!23464))))

(declare-fun res!559281 () Bool)

(assert (=> start!70558 (=> (not res!559281) (not e!455200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70558 (= res!559281 (validMask!0 mask!1312))))

(assert (=> start!70558 e!455200))

(declare-fun tp_is_empty!14575 () Bool)

(assert (=> start!70558 tp_is_empty!14575))

(declare-fun array_inv!17365 (array!45350) Bool)

(assert (=> start!70558 (array_inv!17365 _keys!976)))

(assert (=> start!70558 true))

(declare-fun e!455203 () Bool)

(declare-fun array_inv!17366 (array!45348) Bool)

(assert (=> start!70558 (and (array_inv!17366 _values!788) e!455203)))

(assert (=> start!70558 tp!45330))

(declare-fun b!819633 () Bool)

(declare-fun e!455202 () Bool)

(assert (=> b!819633 (= e!455202 tp_is_empty!14575)))

(declare-fun b!819634 () Bool)

(assert (=> b!819634 (= e!455203 (and e!455202 mapRes!23464))))

(declare-fun condMapEmpty!23464 () Bool)

(declare-fun mapDefault!23464 () ValueCell!6872)

