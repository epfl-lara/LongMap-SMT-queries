; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70634 () Bool)

(assert start!70634)

(declare-fun b_free!12921 () Bool)

(declare-fun b_next!12921 () Bool)

(assert (=> start!70634 (= b_free!12921 (not b_next!12921))))

(declare-fun tp!45502 () Bool)

(declare-fun b_and!21775 () Bool)

(assert (=> start!70634 (= tp!45502 b_and!21775)))

(declare-fun b!820551 () Bool)

(declare-fun e!455883 () Bool)

(declare-fun tp_is_empty!14631 () Bool)

(assert (=> b!820551 (= e!455883 tp_is_empty!14631)))

(declare-fun mapIsEmpty!23551 () Bool)

(declare-fun mapRes!23551 () Bool)

(assert (=> mapIsEmpty!23551 mapRes!23551))

(declare-fun mapNonEmpty!23551 () Bool)

(declare-fun tp!45501 () Bool)

(declare-fun e!455886 () Bool)

(assert (=> mapNonEmpty!23551 (= mapRes!23551 (and tp!45501 e!455886))))

(declare-datatypes ((V!24509 0))(
  ( (V!24510 (val!7363 Int)) )
))
(declare-datatypes ((ValueCell!6900 0))(
  ( (ValueCellFull!6900 (v!9794 V!24509)) (EmptyCell!6900) )
))
(declare-fun mapRest!23551 () (Array (_ BitVec 32) ValueCell!6900))

(declare-datatypes ((array!45456 0))(
  ( (array!45457 (arr!21780 (Array (_ BitVec 32) ValueCell!6900)) (size!22201 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45456)

(declare-fun mapKey!23551 () (_ BitVec 32))

(declare-fun mapValue!23551 () ValueCell!6900)

(assert (=> mapNonEmpty!23551 (= (arr!21780 _values!788) (store mapRest!23551 mapKey!23551 mapValue!23551))))

(declare-fun res!559851 () Bool)

(declare-fun e!455885 () Bool)

(assert (=> start!70634 (=> (not res!559851) (not e!455885))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70634 (= res!559851 (validMask!0 mask!1312))))

(assert (=> start!70634 e!455885))

(assert (=> start!70634 tp_is_empty!14631))

(declare-datatypes ((array!45458 0))(
  ( (array!45459 (arr!21781 (Array (_ BitVec 32) (_ BitVec 64))) (size!22202 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45458)

(declare-fun array_inv!17407 (array!45458) Bool)

(assert (=> start!70634 (array_inv!17407 _keys!976)))

(assert (=> start!70634 true))

(declare-fun e!455887 () Bool)

(declare-fun array_inv!17408 (array!45456) Bool)

(assert (=> start!70634 (and (array_inv!17408 _values!788) e!455887)))

(assert (=> start!70634 tp!45502))

(declare-fun b!820552 () Bool)

(assert (=> b!820552 (= e!455886 tp_is_empty!14631)))

(declare-fun b!820553 () Bool)

(declare-fun res!559849 () Bool)

(assert (=> b!820553 (=> (not res!559849) (not e!455885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45458 (_ BitVec 32)) Bool)

(assert (=> b!820553 (= res!559849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820554 () Bool)

(declare-fun res!559850 () Bool)

(assert (=> b!820554 (=> (not res!559850) (not e!455885))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820554 (= res!559850 (and (= (size!22201 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22202 _keys!976) (size!22201 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820555 () Bool)

(assert (=> b!820555 (= e!455885 (not true))))

(declare-datatypes ((tuple2!9700 0))(
  ( (tuple2!9701 (_1!4861 (_ BitVec 64)) (_2!4861 V!24509)) )
))
(declare-datatypes ((List!15520 0))(
  ( (Nil!15517) (Cons!15516 (h!16645 tuple2!9700) (t!21853 List!15520)) )
))
(declare-datatypes ((ListLongMap!8523 0))(
  ( (ListLongMap!8524 (toList!4277 List!15520)) )
))
(declare-fun lt!368814 () ListLongMap!8523)

(declare-fun lt!368815 () ListLongMap!8523)

(assert (=> b!820555 (= lt!368814 lt!368815)))

(declare-fun zeroValueBefore!34 () V!24509)

(declare-fun zeroValueAfter!34 () V!24509)

(declare-fun minValue!754 () V!24509)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28031 0))(
  ( (Unit!28032) )
))
(declare-fun lt!368813 () Unit!28031)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!413 (array!45458 array!45456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24509 V!24509 V!24509 V!24509 (_ BitVec 32) Int) Unit!28031)

(assert (=> b!820555 (= lt!368813 (lemmaNoChangeToArrayThenSameMapNoExtras!413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2303 (array!45458 array!45456 (_ BitVec 32) (_ BitVec 32) V!24509 V!24509 (_ BitVec 32) Int) ListLongMap!8523)

(assert (=> b!820555 (= lt!368815 (getCurrentListMapNoExtraKeys!2303 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820555 (= lt!368814 (getCurrentListMapNoExtraKeys!2303 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820556 () Bool)

(declare-fun res!559852 () Bool)

(assert (=> b!820556 (=> (not res!559852) (not e!455885))))

(declare-datatypes ((List!15521 0))(
  ( (Nil!15518) (Cons!15517 (h!16646 (_ BitVec 64)) (t!21854 List!15521)) )
))
(declare-fun arrayNoDuplicates!0 (array!45458 (_ BitVec 32) List!15521) Bool)

(assert (=> b!820556 (= res!559852 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15518))))

(declare-fun b!820557 () Bool)

(assert (=> b!820557 (= e!455887 (and e!455883 mapRes!23551))))

(declare-fun condMapEmpty!23551 () Bool)

(declare-fun mapDefault!23551 () ValueCell!6900)

(assert (=> b!820557 (= condMapEmpty!23551 (= (arr!21780 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6900)) mapDefault!23551)))))

(assert (= (and start!70634 res!559851) b!820554))

(assert (= (and b!820554 res!559850) b!820553))

(assert (= (and b!820553 res!559849) b!820556))

(assert (= (and b!820556 res!559852) b!820555))

(assert (= (and b!820557 condMapEmpty!23551) mapIsEmpty!23551))

(assert (= (and b!820557 (not condMapEmpty!23551)) mapNonEmpty!23551))

(get-info :version)

(assert (= (and mapNonEmpty!23551 ((_ is ValueCellFull!6900) mapValue!23551)) b!820552))

(assert (= (and b!820557 ((_ is ValueCellFull!6900) mapDefault!23551)) b!820551))

(assert (= start!70634 b!820557))

(declare-fun m!762489 () Bool)

(assert (=> b!820553 m!762489))

(declare-fun m!762491 () Bool)

(assert (=> mapNonEmpty!23551 m!762491))

(declare-fun m!762493 () Bool)

(assert (=> start!70634 m!762493))

(declare-fun m!762495 () Bool)

(assert (=> start!70634 m!762495))

(declare-fun m!762497 () Bool)

(assert (=> start!70634 m!762497))

(declare-fun m!762499 () Bool)

(assert (=> b!820556 m!762499))

(declare-fun m!762501 () Bool)

(assert (=> b!820555 m!762501))

(declare-fun m!762503 () Bool)

(assert (=> b!820555 m!762503))

(declare-fun m!762505 () Bool)

(assert (=> b!820555 m!762505))

(check-sat (not b!820553) (not mapNonEmpty!23551) (not start!70634) tp_is_empty!14631 b_and!21775 (not b_next!12921) (not b!820555) (not b!820556))
(check-sat b_and!21775 (not b_next!12921))
