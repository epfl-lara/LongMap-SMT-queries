; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70538 () Bool)

(assert start!70538)

(declare-fun b_free!12865 () Bool)

(declare-fun b_next!12865 () Bool)

(assert (=> start!70538 (= b_free!12865 (not b_next!12865))))

(declare-fun tp!45330 () Bool)

(declare-fun b_and!21681 () Bool)

(assert (=> start!70538 (= tp!45330 b_and!21681)))

(declare-fun res!559178 () Bool)

(declare-fun e!455053 () Bool)

(assert (=> start!70538 (=> (not res!559178) (not e!455053))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70538 (= res!559178 (validMask!0 mask!1312))))

(assert (=> start!70538 e!455053))

(declare-fun tp_is_empty!14575 () Bool)

(assert (=> start!70538 tp_is_empty!14575))

(declare-datatypes ((array!45323 0))(
  ( (array!45324 (arr!21715 (Array (_ BitVec 32) (_ BitVec 64))) (size!22136 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45323)

(declare-fun array_inv!17423 (array!45323) Bool)

(assert (=> start!70538 (array_inv!17423 _keys!976)))

(assert (=> start!70538 true))

(declare-datatypes ((V!24435 0))(
  ( (V!24436 (val!7335 Int)) )
))
(declare-datatypes ((ValueCell!6872 0))(
  ( (ValueCellFull!6872 (v!9759 V!24435)) (EmptyCell!6872) )
))
(declare-datatypes ((array!45325 0))(
  ( (array!45326 (arr!21716 (Array (_ BitVec 32) ValueCell!6872)) (size!22137 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45325)

(declare-fun e!455054 () Bool)

(declare-fun array_inv!17424 (array!45325) Bool)

(assert (=> start!70538 (and (array_inv!17424 _values!788) e!455054)))

(assert (=> start!70538 tp!45330))

(declare-fun mapNonEmpty!23464 () Bool)

(declare-fun mapRes!23464 () Bool)

(declare-fun tp!45331 () Bool)

(declare-fun e!455055 () Bool)

(assert (=> mapNonEmpty!23464 (= mapRes!23464 (and tp!45331 e!455055))))

(declare-fun mapValue!23464 () ValueCell!6872)

(declare-fun mapRest!23464 () (Array (_ BitVec 32) ValueCell!6872))

(declare-fun mapKey!23464 () (_ BitVec 32))

(assert (=> mapNonEmpty!23464 (= (arr!21716 _values!788) (store mapRest!23464 mapKey!23464 mapValue!23464))))

(declare-fun b!819383 () Bool)

(declare-fun res!559176 () Bool)

(assert (=> b!819383 (=> (not res!559176) (not e!455053))))

(declare-datatypes ((List!15492 0))(
  ( (Nil!15489) (Cons!15488 (h!16617 (_ BitVec 64)) (t!21814 List!15492)) )
))
(declare-fun arrayNoDuplicates!0 (array!45323 (_ BitVec 32) List!15492) Bool)

(assert (=> b!819383 (= res!559176 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15489))))

(declare-fun b!819384 () Bool)

(declare-fun e!455050 () Bool)

(assert (=> b!819384 (= e!455050 true)))

(declare-datatypes ((tuple2!9672 0))(
  ( (tuple2!9673 (_1!4847 (_ BitVec 64)) (_2!4847 V!24435)) )
))
(declare-fun lt!367675 () tuple2!9672)

(declare-datatypes ((List!15493 0))(
  ( (Nil!15490) (Cons!15489 (h!16618 tuple2!9672) (t!21815 List!15493)) )
))
(declare-datatypes ((ListLongMap!8485 0))(
  ( (ListLongMap!8486 (toList!4258 List!15493)) )
))
(declare-fun lt!367676 () ListLongMap!8485)

(declare-fun lt!367683 () ListLongMap!8485)

(declare-fun lt!367682 () tuple2!9672)

(declare-fun +!1879 (ListLongMap!8485 tuple2!9672) ListLongMap!8485)

(assert (=> b!819384 (= lt!367676 (+!1879 (+!1879 lt!367683 lt!367682) lt!367675))))

(declare-fun lt!367678 () ListLongMap!8485)

(declare-fun lt!367679 () ListLongMap!8485)

(assert (=> b!819384 (= (+!1879 lt!367678 lt!367675) (+!1879 lt!367679 lt!367675))))

(declare-datatypes ((Unit!27943 0))(
  ( (Unit!27944) )
))
(declare-fun lt!367681 () Unit!27943)

(declare-fun zeroValueBefore!34 () V!24435)

(declare-fun zeroValueAfter!34 () V!24435)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!194 (ListLongMap!8485 (_ BitVec 64) V!24435 V!24435) Unit!27943)

(assert (=> b!819384 (= lt!367681 (addSameAsAddTwiceSameKeyDiffValues!194 lt!367678 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819384 (= lt!367675 (tuple2!9673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455049 () Bool)

(assert (=> b!819384 e!455049))

(declare-fun res!559179 () Bool)

(assert (=> b!819384 (=> (not res!559179) (not e!455049))))

(declare-fun lt!367677 () ListLongMap!8485)

(assert (=> b!819384 (= res!559179 (= lt!367677 lt!367679))))

(assert (=> b!819384 (= lt!367679 (+!1879 lt!367678 lt!367682))))

(assert (=> b!819384 (= lt!367682 (tuple2!9673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24435)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!367674 () ListLongMap!8485)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2407 (array!45323 array!45325 (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 (_ BitVec 32) Int) ListLongMap!8485)

(assert (=> b!819384 (= lt!367674 (getCurrentListMap!2407 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819384 (= lt!367677 (getCurrentListMap!2407 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23464 () Bool)

(assert (=> mapIsEmpty!23464 mapRes!23464))

(declare-fun b!819385 () Bool)

(declare-fun res!559180 () Bool)

(assert (=> b!819385 (=> (not res!559180) (not e!455053))))

(assert (=> b!819385 (= res!559180 (and (= (size!22137 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22136 _keys!976) (size!22137 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819386 () Bool)

(assert (=> b!819386 (= e!455053 (not e!455050))))

(declare-fun res!559177 () Bool)

(assert (=> b!819386 (=> res!559177 e!455050)))

(assert (=> b!819386 (= res!559177 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819386 (= lt!367678 lt!367683)))

(declare-fun lt!367680 () Unit!27943)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!406 (array!45323 array!45325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 V!24435 V!24435 (_ BitVec 32) Int) Unit!27943)

(assert (=> b!819386 (= lt!367680 (lemmaNoChangeToArrayThenSameMapNoExtras!406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2313 (array!45323 array!45325 (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 (_ BitVec 32) Int) ListLongMap!8485)

(assert (=> b!819386 (= lt!367683 (getCurrentListMapNoExtraKeys!2313 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819386 (= lt!367678 (getCurrentListMapNoExtraKeys!2313 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819387 () Bool)

(declare-fun e!455051 () Bool)

(assert (=> b!819387 (= e!455051 tp_is_empty!14575)))

(declare-fun b!819388 () Bool)

(assert (=> b!819388 (= e!455055 tp_is_empty!14575)))

(declare-fun b!819389 () Bool)

(assert (=> b!819389 (= e!455049 (= lt!367674 (+!1879 lt!367683 (tuple2!9673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819390 () Bool)

(assert (=> b!819390 (= e!455054 (and e!455051 mapRes!23464))))

(declare-fun condMapEmpty!23464 () Bool)

(declare-fun mapDefault!23464 () ValueCell!6872)

(assert (=> b!819390 (= condMapEmpty!23464 (= (arr!21716 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6872)) mapDefault!23464)))))

(declare-fun b!819391 () Bool)

(declare-fun res!559175 () Bool)

(assert (=> b!819391 (=> (not res!559175) (not e!455053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45323 (_ BitVec 32)) Bool)

(assert (=> b!819391 (= res!559175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70538 res!559178) b!819385))

(assert (= (and b!819385 res!559180) b!819391))

(assert (= (and b!819391 res!559175) b!819383))

(assert (= (and b!819383 res!559176) b!819386))

(assert (= (and b!819386 (not res!559177)) b!819384))

(assert (= (and b!819384 res!559179) b!819389))

(assert (= (and b!819390 condMapEmpty!23464) mapIsEmpty!23464))

(assert (= (and b!819390 (not condMapEmpty!23464)) mapNonEmpty!23464))

(get-info :version)

(assert (= (and mapNonEmpty!23464 ((_ is ValueCellFull!6872) mapValue!23464)) b!819388))

(assert (= (and b!819390 ((_ is ValueCellFull!6872) mapDefault!23464)) b!819387))

(assert (= start!70538 b!819390))

(declare-fun m!760563 () Bool)

(assert (=> b!819389 m!760563))

(declare-fun m!760565 () Bool)

(assert (=> b!819391 m!760565))

(declare-fun m!760567 () Bool)

(assert (=> mapNonEmpty!23464 m!760567))

(declare-fun m!760569 () Bool)

(assert (=> b!819386 m!760569))

(declare-fun m!760571 () Bool)

(assert (=> b!819386 m!760571))

(declare-fun m!760573 () Bool)

(assert (=> b!819386 m!760573))

(declare-fun m!760575 () Bool)

(assert (=> b!819383 m!760575))

(declare-fun m!760577 () Bool)

(assert (=> start!70538 m!760577))

(declare-fun m!760579 () Bool)

(assert (=> start!70538 m!760579))

(declare-fun m!760581 () Bool)

(assert (=> start!70538 m!760581))

(declare-fun m!760583 () Bool)

(assert (=> b!819384 m!760583))

(declare-fun m!760585 () Bool)

(assert (=> b!819384 m!760585))

(declare-fun m!760587 () Bool)

(assert (=> b!819384 m!760587))

(declare-fun m!760589 () Bool)

(assert (=> b!819384 m!760589))

(declare-fun m!760591 () Bool)

(assert (=> b!819384 m!760591))

(declare-fun m!760593 () Bool)

(assert (=> b!819384 m!760593))

(assert (=> b!819384 m!760587))

(declare-fun m!760595 () Bool)

(assert (=> b!819384 m!760595))

(declare-fun m!760597 () Bool)

(assert (=> b!819384 m!760597))

(check-sat b_and!21681 (not mapNonEmpty!23464) (not b!819383) (not b!819384) tp_is_empty!14575 (not b!819389) (not b!819391) (not start!70538) (not b!819386) (not b_next!12865))
(check-sat b_and!21681 (not b_next!12865))
