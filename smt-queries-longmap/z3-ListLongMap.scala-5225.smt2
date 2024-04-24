; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70580 () Bool)

(assert start!70580)

(declare-fun b_free!12757 () Bool)

(declare-fun b_next!12757 () Bool)

(assert (=> start!70580 (= b_free!12757 (not b_next!12757))))

(declare-fun tp!45001 () Bool)

(declare-fun b_and!21587 () Bool)

(assert (=> start!70580 (= tp!45001 b_and!21587)))

(declare-fun b!818793 () Bool)

(declare-fun e!454495 () Bool)

(declare-fun e!454498 () Bool)

(declare-fun mapRes!23296 () Bool)

(assert (=> b!818793 (= e!454495 (and e!454498 mapRes!23296))))

(declare-fun condMapEmpty!23296 () Bool)

(declare-datatypes ((V!24291 0))(
  ( (V!24292 (val!7281 Int)) )
))
(declare-datatypes ((ValueCell!6818 0))(
  ( (ValueCellFull!6818 (v!9710 V!24291)) (EmptyCell!6818) )
))
(declare-datatypes ((array!45133 0))(
  ( (array!45134 (arr!21617 (Array (_ BitVec 32) ValueCell!6818)) (size!22037 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45133)

(declare-fun mapDefault!23296 () ValueCell!6818)

(assert (=> b!818793 (= condMapEmpty!23296 (= (arr!21617 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6818)) mapDefault!23296)))))

(declare-fun mapIsEmpty!23296 () Bool)

(assert (=> mapIsEmpty!23296 mapRes!23296))

(declare-fun b!818794 () Bool)

(declare-fun e!454496 () Bool)

(assert (=> b!818794 (= e!454496 true)))

(declare-fun zeroValueBefore!34 () V!24291)

(declare-datatypes ((array!45135 0))(
  ( (array!45136 (arr!21618 (Array (_ BitVec 32) (_ BitVec 64))) (size!22038 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45135)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24291)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9478 0))(
  ( (tuple2!9479 (_1!4750 (_ BitVec 64)) (_2!4750 V!24291)) )
))
(declare-datatypes ((List!15290 0))(
  ( (Nil!15287) (Cons!15286 (h!16421 tuple2!9478) (t!21609 List!15290)) )
))
(declare-datatypes ((ListLongMap!8303 0))(
  ( (ListLongMap!8304 (toList!4167 List!15290)) )
))
(declare-fun lt!366813 () ListLongMap!8303)

(declare-fun getCurrentListMap!2365 (array!45135 array!45133 (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 (_ BitVec 32) Int) ListLongMap!8303)

(assert (=> b!818794 (= lt!366813 (getCurrentListMap!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818795 () Bool)

(declare-fun res!558575 () Bool)

(declare-fun e!454500 () Bool)

(assert (=> b!818795 (=> (not res!558575) (not e!454500))))

(declare-datatypes ((List!15291 0))(
  ( (Nil!15288) (Cons!15287 (h!16422 (_ BitVec 64)) (t!21610 List!15291)) )
))
(declare-fun arrayNoDuplicates!0 (array!45135 (_ BitVec 32) List!15291) Bool)

(assert (=> b!818795 (= res!558575 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15288))))

(declare-fun b!818796 () Bool)

(assert (=> b!818796 (= e!454500 (not e!454496))))

(declare-fun res!558577 () Bool)

(assert (=> b!818796 (=> res!558577 e!454496)))

(assert (=> b!818796 (= res!558577 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366814 () ListLongMap!8303)

(declare-fun lt!366811 () ListLongMap!8303)

(assert (=> b!818796 (= lt!366814 lt!366811)))

(declare-fun zeroValueAfter!34 () V!24291)

(declare-datatypes ((Unit!27887 0))(
  ( (Unit!27888) )
))
(declare-fun lt!366812 () Unit!27887)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!353 (array!45135 array!45133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 V!24291 V!24291 (_ BitVec 32) Int) Unit!27887)

(assert (=> b!818796 (= lt!366812 (lemmaNoChangeToArrayThenSameMapNoExtras!353 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2265 (array!45135 array!45133 (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 (_ BitVec 32) Int) ListLongMap!8303)

(assert (=> b!818796 (= lt!366811 (getCurrentListMapNoExtraKeys!2265 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818796 (= lt!366814 (getCurrentListMapNoExtraKeys!2265 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558576 () Bool)

(assert (=> start!70580 (=> (not res!558576) (not e!454500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70580 (= res!558576 (validMask!0 mask!1312))))

(assert (=> start!70580 e!454500))

(declare-fun tp_is_empty!14467 () Bool)

(assert (=> start!70580 tp_is_empty!14467))

(declare-fun array_inv!17317 (array!45135) Bool)

(assert (=> start!70580 (array_inv!17317 _keys!976)))

(assert (=> start!70580 true))

(declare-fun array_inv!17318 (array!45133) Bool)

(assert (=> start!70580 (and (array_inv!17318 _values!788) e!454495)))

(assert (=> start!70580 tp!45001))

(declare-fun b!818797 () Bool)

(assert (=> b!818797 (= e!454498 tp_is_empty!14467)))

(declare-fun b!818798 () Bool)

(declare-fun res!558578 () Bool)

(assert (=> b!818798 (=> (not res!558578) (not e!454500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45135 (_ BitVec 32)) Bool)

(assert (=> b!818798 (= res!558578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818799 () Bool)

(declare-fun res!558579 () Bool)

(assert (=> b!818799 (=> (not res!558579) (not e!454500))))

(assert (=> b!818799 (= res!558579 (and (= (size!22037 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22038 _keys!976) (size!22037 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818800 () Bool)

(declare-fun e!454497 () Bool)

(assert (=> b!818800 (= e!454497 tp_is_empty!14467)))

(declare-fun mapNonEmpty!23296 () Bool)

(declare-fun tp!45000 () Bool)

(assert (=> mapNonEmpty!23296 (= mapRes!23296 (and tp!45000 e!454497))))

(declare-fun mapValue!23296 () ValueCell!6818)

(declare-fun mapRest!23296 () (Array (_ BitVec 32) ValueCell!6818))

(declare-fun mapKey!23296 () (_ BitVec 32))

(assert (=> mapNonEmpty!23296 (= (arr!21617 _values!788) (store mapRest!23296 mapKey!23296 mapValue!23296))))

(assert (= (and start!70580 res!558576) b!818799))

(assert (= (and b!818799 res!558579) b!818798))

(assert (= (and b!818798 res!558578) b!818795))

(assert (= (and b!818795 res!558575) b!818796))

(assert (= (and b!818796 (not res!558577)) b!818794))

(assert (= (and b!818793 condMapEmpty!23296) mapIsEmpty!23296))

(assert (= (and b!818793 (not condMapEmpty!23296)) mapNonEmpty!23296))

(get-info :version)

(assert (= (and mapNonEmpty!23296 ((_ is ValueCellFull!6818) mapValue!23296)) b!818800))

(assert (= (and b!818793 ((_ is ValueCellFull!6818) mapDefault!23296)) b!818797))

(assert (= start!70580 b!818793))

(declare-fun m!760687 () Bool)

(assert (=> b!818795 m!760687))

(declare-fun m!760689 () Bool)

(assert (=> mapNonEmpty!23296 m!760689))

(declare-fun m!760691 () Bool)

(assert (=> b!818796 m!760691))

(declare-fun m!760693 () Bool)

(assert (=> b!818796 m!760693))

(declare-fun m!760695 () Bool)

(assert (=> b!818796 m!760695))

(declare-fun m!760697 () Bool)

(assert (=> b!818798 m!760697))

(declare-fun m!760699 () Bool)

(assert (=> start!70580 m!760699))

(declare-fun m!760701 () Bool)

(assert (=> start!70580 m!760701))

(declare-fun m!760703 () Bool)

(assert (=> start!70580 m!760703))

(declare-fun m!760705 () Bool)

(assert (=> b!818794 m!760705))

(check-sat (not b!818794) (not b_next!12757) tp_is_empty!14467 b_and!21587 (not start!70580) (not mapNonEmpty!23296) (not b!818796) (not b!818798) (not b!818795))
(check-sat b_and!21587 (not b_next!12757))
