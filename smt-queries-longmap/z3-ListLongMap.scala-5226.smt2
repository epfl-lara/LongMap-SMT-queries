; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70400 () Bool)

(assert start!70400)

(declare-fun b_free!12763 () Bool)

(declare-fun b_next!12763 () Bool)

(assert (=> start!70400 (= b_free!12763 (not b_next!12763))))

(declare-fun tp!45018 () Bool)

(declare-fun b_and!21557 () Bool)

(assert (=> start!70400 (= tp!45018 b_and!21557)))

(declare-fun b!817725 () Bool)

(declare-fun e!453826 () Bool)

(declare-fun e!453821 () Bool)

(assert (=> b!817725 (= e!453826 (not e!453821))))

(declare-fun res!558172 () Bool)

(assert (=> b!817725 (=> res!558172 e!453821)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!817725 (= res!558172 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24299 0))(
  ( (V!24300 (val!7284 Int)) )
))
(declare-datatypes ((tuple2!9592 0))(
  ( (tuple2!9593 (_1!4807 (_ BitVec 64)) (_2!4807 V!24299)) )
))
(declare-datatypes ((List!15415 0))(
  ( (Nil!15412) (Cons!15411 (h!16540 tuple2!9592) (t!21733 List!15415)) )
))
(declare-datatypes ((ListLongMap!8405 0))(
  ( (ListLongMap!8406 (toList!4218 List!15415)) )
))
(declare-fun lt!366252 () ListLongMap!8405)

(declare-fun lt!366251 () ListLongMap!8405)

(assert (=> b!817725 (= lt!366252 lt!366251)))

(declare-fun zeroValueBefore!34 () V!24299)

(declare-datatypes ((array!45123 0))(
  ( (array!45124 (arr!21617 (Array (_ BitVec 32) (_ BitVec 64))) (size!22038 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45123)

(declare-fun zeroValueAfter!34 () V!24299)

(declare-fun minValue!754 () V!24299)

(declare-datatypes ((ValueCell!6821 0))(
  ( (ValueCellFull!6821 (v!9707 V!24299)) (EmptyCell!6821) )
))
(declare-datatypes ((array!45125 0))(
  ( (array!45126 (arr!21618 (Array (_ BitVec 32) ValueCell!6821)) (size!22039 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45125)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27862 0))(
  ( (Unit!27863) )
))
(declare-fun lt!366250 () Unit!27862)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!370 (array!45123 array!45125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 V!24299 V!24299 (_ BitVec 32) Int) Unit!27862)

(assert (=> b!817725 (= lt!366250 (lemmaNoChangeToArrayThenSameMapNoExtras!370 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2277 (array!45123 array!45125 (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 (_ BitVec 32) Int) ListLongMap!8405)

(assert (=> b!817725 (= lt!366251 (getCurrentListMapNoExtraKeys!2277 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817725 (= lt!366252 (getCurrentListMapNoExtraKeys!2277 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817726 () Bool)

(declare-fun e!453824 () Bool)

(declare-fun tp_is_empty!14473 () Bool)

(assert (=> b!817726 (= e!453824 tp_is_empty!14473)))

(declare-fun b!817727 () Bool)

(declare-fun res!558169 () Bool)

(assert (=> b!817727 (=> (not res!558169) (not e!453826))))

(declare-datatypes ((List!15416 0))(
  ( (Nil!15413) (Cons!15412 (h!16541 (_ BitVec 64)) (t!21734 List!15416)) )
))
(declare-fun arrayNoDuplicates!0 (array!45123 (_ BitVec 32) List!15416) Bool)

(assert (=> b!817727 (= res!558169 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15413))))

(declare-fun b!817728 () Bool)

(declare-fun res!558168 () Bool)

(assert (=> b!817728 (=> (not res!558168) (not e!453826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45123 (_ BitVec 32)) Bool)

(assert (=> b!817728 (= res!558168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817729 () Bool)

(assert (=> b!817729 (= e!453821 true)))

(declare-fun lt!366253 () ListLongMap!8405)

(declare-fun getCurrentListMap!2371 (array!45123 array!45125 (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 (_ BitVec 32) Int) ListLongMap!8405)

(assert (=> b!817729 (= lt!366253 (getCurrentListMap!2371 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23305 () Bool)

(declare-fun mapRes!23305 () Bool)

(declare-fun tp!45019 () Bool)

(assert (=> mapNonEmpty!23305 (= mapRes!23305 (and tp!45019 e!453824))))

(declare-fun mapValue!23305 () ValueCell!6821)

(declare-fun mapRest!23305 () (Array (_ BitVec 32) ValueCell!6821))

(declare-fun mapKey!23305 () (_ BitVec 32))

(assert (=> mapNonEmpty!23305 (= (arr!21618 _values!788) (store mapRest!23305 mapKey!23305 mapValue!23305))))

(declare-fun b!817730 () Bool)

(declare-fun e!453822 () Bool)

(declare-fun e!453825 () Bool)

(assert (=> b!817730 (= e!453822 (and e!453825 mapRes!23305))))

(declare-fun condMapEmpty!23305 () Bool)

(declare-fun mapDefault!23305 () ValueCell!6821)

(assert (=> b!817730 (= condMapEmpty!23305 (= (arr!21618 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6821)) mapDefault!23305)))))

(declare-fun b!817731 () Bool)

(declare-fun res!558170 () Bool)

(assert (=> b!817731 (=> (not res!558170) (not e!453826))))

(assert (=> b!817731 (= res!558170 (and (= (size!22039 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22038 _keys!976) (size!22039 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817732 () Bool)

(assert (=> b!817732 (= e!453825 tp_is_empty!14473)))

(declare-fun res!558171 () Bool)

(assert (=> start!70400 (=> (not res!558171) (not e!453826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70400 (= res!558171 (validMask!0 mask!1312))))

(assert (=> start!70400 e!453826))

(assert (=> start!70400 tp_is_empty!14473))

(declare-fun array_inv!17355 (array!45123) Bool)

(assert (=> start!70400 (array_inv!17355 _keys!976)))

(assert (=> start!70400 true))

(declare-fun array_inv!17356 (array!45125) Bool)

(assert (=> start!70400 (and (array_inv!17356 _values!788) e!453822)))

(assert (=> start!70400 tp!45018))

(declare-fun mapIsEmpty!23305 () Bool)

(assert (=> mapIsEmpty!23305 mapRes!23305))

(assert (= (and start!70400 res!558171) b!817731))

(assert (= (and b!817731 res!558170) b!817728))

(assert (= (and b!817728 res!558168) b!817727))

(assert (= (and b!817727 res!558169) b!817725))

(assert (= (and b!817725 (not res!558172)) b!817729))

(assert (= (and b!817730 condMapEmpty!23305) mapIsEmpty!23305))

(assert (= (and b!817730 (not condMapEmpty!23305)) mapNonEmpty!23305))

(get-info :version)

(assert (= (and mapNonEmpty!23305 ((_ is ValueCellFull!6821) mapValue!23305)) b!817726))

(assert (= (and b!817730 ((_ is ValueCellFull!6821) mapDefault!23305)) b!817732))

(assert (= start!70400 b!817730))

(declare-fun m!758713 () Bool)

(assert (=> b!817725 m!758713))

(declare-fun m!758715 () Bool)

(assert (=> b!817725 m!758715))

(declare-fun m!758717 () Bool)

(assert (=> b!817725 m!758717))

(declare-fun m!758719 () Bool)

(assert (=> mapNonEmpty!23305 m!758719))

(declare-fun m!758721 () Bool)

(assert (=> b!817729 m!758721))

(declare-fun m!758723 () Bool)

(assert (=> start!70400 m!758723))

(declare-fun m!758725 () Bool)

(assert (=> start!70400 m!758725))

(declare-fun m!758727 () Bool)

(assert (=> start!70400 m!758727))

(declare-fun m!758729 () Bool)

(assert (=> b!817728 m!758729))

(declare-fun m!758731 () Bool)

(assert (=> b!817727 m!758731))

(check-sat (not b_next!12763) (not b!817727) (not mapNonEmpty!23305) (not start!70400) tp_is_empty!14473 b_and!21557 (not b!817725) (not b!817729) (not b!817728))
(check-sat b_and!21557 (not b_next!12763))
