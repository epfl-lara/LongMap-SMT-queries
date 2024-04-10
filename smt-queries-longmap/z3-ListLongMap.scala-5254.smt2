; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70646 () Bool)

(assert start!70646)

(declare-fun b_free!12933 () Bool)

(declare-fun b_next!12933 () Bool)

(assert (=> start!70646 (= b_free!12933 (not b_next!12933))))

(declare-fun tp!45537 () Bool)

(declare-fun b_and!21787 () Bool)

(assert (=> start!70646 (= tp!45537 b_and!21787)))

(declare-fun b!820677 () Bool)

(declare-fun e!455974 () Bool)

(declare-fun tp_is_empty!14643 () Bool)

(assert (=> b!820677 (= e!455974 tp_is_empty!14643)))

(declare-fun res!559924 () Bool)

(declare-fun e!455976 () Bool)

(assert (=> start!70646 (=> (not res!559924) (not e!455976))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70646 (= res!559924 (validMask!0 mask!1312))))

(assert (=> start!70646 e!455976))

(assert (=> start!70646 tp_is_empty!14643))

(declare-datatypes ((array!45480 0))(
  ( (array!45481 (arr!21792 (Array (_ BitVec 32) (_ BitVec 64))) (size!22213 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45480)

(declare-fun array_inv!17417 (array!45480) Bool)

(assert (=> start!70646 (array_inv!17417 _keys!976)))

(assert (=> start!70646 true))

(declare-datatypes ((V!24525 0))(
  ( (V!24526 (val!7369 Int)) )
))
(declare-datatypes ((ValueCell!6906 0))(
  ( (ValueCellFull!6906 (v!9800 V!24525)) (EmptyCell!6906) )
))
(declare-datatypes ((array!45482 0))(
  ( (array!45483 (arr!21793 (Array (_ BitVec 32) ValueCell!6906)) (size!22214 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45482)

(declare-fun e!455973 () Bool)

(declare-fun array_inv!17418 (array!45482) Bool)

(assert (=> start!70646 (and (array_inv!17418 _values!788) e!455973)))

(assert (=> start!70646 tp!45537))

(declare-fun mapNonEmpty!23569 () Bool)

(declare-fun mapRes!23569 () Bool)

(declare-fun tp!45538 () Bool)

(declare-fun e!455975 () Bool)

(assert (=> mapNonEmpty!23569 (= mapRes!23569 (and tp!45538 e!455975))))

(declare-fun mapRest!23569 () (Array (_ BitVec 32) ValueCell!6906))

(declare-fun mapValue!23569 () ValueCell!6906)

(declare-fun mapKey!23569 () (_ BitVec 32))

(assert (=> mapNonEmpty!23569 (= (arr!21793 _values!788) (store mapRest!23569 mapKey!23569 mapValue!23569))))

(declare-fun b!820678 () Bool)

(declare-fun res!559922 () Bool)

(assert (=> b!820678 (=> (not res!559922) (not e!455976))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820678 (= res!559922 (and (= (size!22214 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22213 _keys!976) (size!22214 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820679 () Bool)

(assert (=> b!820679 (= e!455975 tp_is_empty!14643)))

(declare-fun mapIsEmpty!23569 () Bool)

(assert (=> mapIsEmpty!23569 mapRes!23569))

(declare-fun b!820680 () Bool)

(declare-fun res!559923 () Bool)

(assert (=> b!820680 (=> (not res!559923) (not e!455976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45480 (_ BitVec 32)) Bool)

(assert (=> b!820680 (= res!559923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820681 () Bool)

(assert (=> b!820681 (= e!455976 (not true))))

(declare-datatypes ((tuple2!9710 0))(
  ( (tuple2!9711 (_1!4866 (_ BitVec 64)) (_2!4866 V!24525)) )
))
(declare-datatypes ((List!15529 0))(
  ( (Nil!15526) (Cons!15525 (h!16654 tuple2!9710) (t!21862 List!15529)) )
))
(declare-datatypes ((ListLongMap!8533 0))(
  ( (ListLongMap!8534 (toList!4282 List!15529)) )
))
(declare-fun lt!368867 () ListLongMap!8533)

(declare-fun lt!368869 () ListLongMap!8533)

(assert (=> b!820681 (= lt!368867 lt!368869)))

(declare-fun minValue!754 () V!24525)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28041 0))(
  ( (Unit!28042) )
))
(declare-fun lt!368868 () Unit!28041)

(declare-fun zeroValueBefore!34 () V!24525)

(declare-fun zeroValueAfter!34 () V!24525)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!418 (array!45480 array!45482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24525 V!24525 V!24525 V!24525 (_ BitVec 32) Int) Unit!28041)

(assert (=> b!820681 (= lt!368868 (lemmaNoChangeToArrayThenSameMapNoExtras!418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2308 (array!45480 array!45482 (_ BitVec 32) (_ BitVec 32) V!24525 V!24525 (_ BitVec 32) Int) ListLongMap!8533)

(assert (=> b!820681 (= lt!368869 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820681 (= lt!368867 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820682 () Bool)

(assert (=> b!820682 (= e!455973 (and e!455974 mapRes!23569))))

(declare-fun condMapEmpty!23569 () Bool)

(declare-fun mapDefault!23569 () ValueCell!6906)

(assert (=> b!820682 (= condMapEmpty!23569 (= (arr!21793 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6906)) mapDefault!23569)))))

(declare-fun b!820683 () Bool)

(declare-fun res!559921 () Bool)

(assert (=> b!820683 (=> (not res!559921) (not e!455976))))

(declare-datatypes ((List!15530 0))(
  ( (Nil!15527) (Cons!15526 (h!16655 (_ BitVec 64)) (t!21863 List!15530)) )
))
(declare-fun arrayNoDuplicates!0 (array!45480 (_ BitVec 32) List!15530) Bool)

(assert (=> b!820683 (= res!559921 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15527))))

(assert (= (and start!70646 res!559924) b!820678))

(assert (= (and b!820678 res!559922) b!820680))

(assert (= (and b!820680 res!559923) b!820683))

(assert (= (and b!820683 res!559921) b!820681))

(assert (= (and b!820682 condMapEmpty!23569) mapIsEmpty!23569))

(assert (= (and b!820682 (not condMapEmpty!23569)) mapNonEmpty!23569))

(get-info :version)

(assert (= (and mapNonEmpty!23569 ((_ is ValueCellFull!6906) mapValue!23569)) b!820679))

(assert (= (and b!820682 ((_ is ValueCellFull!6906) mapDefault!23569)) b!820677))

(assert (= start!70646 b!820682))

(declare-fun m!762597 () Bool)

(assert (=> mapNonEmpty!23569 m!762597))

(declare-fun m!762599 () Bool)

(assert (=> b!820683 m!762599))

(declare-fun m!762601 () Bool)

(assert (=> b!820680 m!762601))

(declare-fun m!762603 () Bool)

(assert (=> start!70646 m!762603))

(declare-fun m!762605 () Bool)

(assert (=> start!70646 m!762605))

(declare-fun m!762607 () Bool)

(assert (=> start!70646 m!762607))

(declare-fun m!762609 () Bool)

(assert (=> b!820681 m!762609))

(declare-fun m!762611 () Bool)

(assert (=> b!820681 m!762611))

(declare-fun m!762613 () Bool)

(assert (=> b!820681 m!762613))

(check-sat (not b_next!12933) (not b!820681) (not mapNonEmpty!23569) (not b!820680) tp_is_empty!14643 (not start!70646) b_and!21787 (not b!820683))
(check-sat b_and!21787 (not b_next!12933))
