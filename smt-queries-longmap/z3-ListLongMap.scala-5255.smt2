; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70630 () Bool)

(assert start!70630)

(declare-fun b_free!12937 () Bool)

(declare-fun b_next!12937 () Bool)

(assert (=> start!70630 (= b_free!12937 (not b_next!12937))))

(declare-fun tp!45550 () Bool)

(declare-fun b_and!21765 () Bool)

(assert (=> start!70630 (= tp!45550 b_and!21765)))

(declare-fun b!820473 () Bool)

(declare-fun e!455855 () Bool)

(declare-fun tp_is_empty!14647 () Bool)

(assert (=> b!820473 (= e!455855 tp_is_empty!14647)))

(declare-fun b!820474 () Bool)

(declare-fun res!559842 () Bool)

(declare-fun e!455856 () Bool)

(assert (=> b!820474 (=> (not res!559842) (not e!455856))))

(declare-datatypes ((array!45461 0))(
  ( (array!45462 (arr!21783 (Array (_ BitVec 32) (_ BitVec 64))) (size!22204 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45461)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45461 (_ BitVec 32)) Bool)

(assert (=> b!820474 (= res!559842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820475 () Bool)

(assert (=> b!820475 (= e!455856 (not true))))

(declare-datatypes ((V!24531 0))(
  ( (V!24532 (val!7371 Int)) )
))
(declare-datatypes ((tuple2!9724 0))(
  ( (tuple2!9725 (_1!4873 (_ BitVec 64)) (_2!4873 V!24531)) )
))
(declare-datatypes ((List!15540 0))(
  ( (Nil!15537) (Cons!15536 (h!16665 tuple2!9724) (t!21864 List!15540)) )
))
(declare-datatypes ((ListLongMap!8537 0))(
  ( (ListLongMap!8538 (toList!4284 List!15540)) )
))
(declare-fun lt!368642 () ListLongMap!8537)

(declare-fun lt!368644 () ListLongMap!8537)

(assert (=> b!820475 (= lt!368642 lt!368644)))

(declare-fun zeroValueBefore!34 () V!24531)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24531)

(declare-fun minValue!754 () V!24531)

(declare-datatypes ((ValueCell!6908 0))(
  ( (ValueCellFull!6908 (v!9796 V!24531)) (EmptyCell!6908) )
))
(declare-datatypes ((array!45463 0))(
  ( (array!45464 (arr!21784 (Array (_ BitVec 32) ValueCell!6908)) (size!22205 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45463)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27997 0))(
  ( (Unit!27998) )
))
(declare-fun lt!368643 () Unit!27997)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!429 (array!45461 array!45463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24531 V!24531 V!24531 V!24531 (_ BitVec 32) Int) Unit!27997)

(assert (=> b!820475 (= lt!368643 (lemmaNoChangeToArrayThenSameMapNoExtras!429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2336 (array!45461 array!45463 (_ BitVec 32) (_ BitVec 32) V!24531 V!24531 (_ BitVec 32) Int) ListLongMap!8537)

(assert (=> b!820475 (= lt!368644 (getCurrentListMapNoExtraKeys!2336 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820475 (= lt!368642 (getCurrentListMapNoExtraKeys!2336 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559840 () Bool)

(assert (=> start!70630 (=> (not res!559840) (not e!455856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70630 (= res!559840 (validMask!0 mask!1312))))

(assert (=> start!70630 e!455856))

(assert (=> start!70630 tp_is_empty!14647))

(declare-fun array_inv!17475 (array!45461) Bool)

(assert (=> start!70630 (array_inv!17475 _keys!976)))

(assert (=> start!70630 true))

(declare-fun e!455854 () Bool)

(declare-fun array_inv!17476 (array!45463) Bool)

(assert (=> start!70630 (and (array_inv!17476 _values!788) e!455854)))

(assert (=> start!70630 tp!45550))

(declare-fun mapNonEmpty!23575 () Bool)

(declare-fun mapRes!23575 () Bool)

(declare-fun tp!45549 () Bool)

(declare-fun e!455853 () Bool)

(assert (=> mapNonEmpty!23575 (= mapRes!23575 (and tp!45549 e!455853))))

(declare-fun mapKey!23575 () (_ BitVec 32))

(declare-fun mapValue!23575 () ValueCell!6908)

(declare-fun mapRest!23575 () (Array (_ BitVec 32) ValueCell!6908))

(assert (=> mapNonEmpty!23575 (= (arr!21784 _values!788) (store mapRest!23575 mapKey!23575 mapValue!23575))))

(declare-fun b!820476 () Bool)

(assert (=> b!820476 (= e!455853 tp_is_empty!14647)))

(declare-fun b!820477 () Bool)

(declare-fun res!559839 () Bool)

(assert (=> b!820477 (=> (not res!559839) (not e!455856))))

(assert (=> b!820477 (= res!559839 (and (= (size!22205 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22204 _keys!976) (size!22205 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820478 () Bool)

(declare-fun res!559841 () Bool)

(assert (=> b!820478 (=> (not res!559841) (not e!455856))))

(declare-datatypes ((List!15541 0))(
  ( (Nil!15538) (Cons!15537 (h!16666 (_ BitVec 64)) (t!21865 List!15541)) )
))
(declare-fun arrayNoDuplicates!0 (array!45461 (_ BitVec 32) List!15541) Bool)

(assert (=> b!820478 (= res!559841 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15538))))

(declare-fun mapIsEmpty!23575 () Bool)

(assert (=> mapIsEmpty!23575 mapRes!23575))

(declare-fun b!820479 () Bool)

(assert (=> b!820479 (= e!455854 (and e!455855 mapRes!23575))))

(declare-fun condMapEmpty!23575 () Bool)

(declare-fun mapDefault!23575 () ValueCell!6908)

(assert (=> b!820479 (= condMapEmpty!23575 (= (arr!21784 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6908)) mapDefault!23575)))))

(assert (= (and start!70630 res!559840) b!820477))

(assert (= (and b!820477 res!559839) b!820474))

(assert (= (and b!820474 res!559842) b!820478))

(assert (= (and b!820478 res!559841) b!820475))

(assert (= (and b!820479 condMapEmpty!23575) mapIsEmpty!23575))

(assert (= (and b!820479 (not condMapEmpty!23575)) mapNonEmpty!23575))

(get-info :version)

(assert (= (and mapNonEmpty!23575 ((_ is ValueCellFull!6908) mapValue!23575)) b!820476))

(assert (= (and b!820479 ((_ is ValueCellFull!6908) mapDefault!23575)) b!820473))

(assert (= start!70630 b!820479))

(declare-fun m!761881 () Bool)

(assert (=> mapNonEmpty!23575 m!761881))

(declare-fun m!761883 () Bool)

(assert (=> b!820478 m!761883))

(declare-fun m!761885 () Bool)

(assert (=> start!70630 m!761885))

(declare-fun m!761887 () Bool)

(assert (=> start!70630 m!761887))

(declare-fun m!761889 () Bool)

(assert (=> start!70630 m!761889))

(declare-fun m!761891 () Bool)

(assert (=> b!820474 m!761891))

(declare-fun m!761893 () Bool)

(assert (=> b!820475 m!761893))

(declare-fun m!761895 () Bool)

(assert (=> b!820475 m!761895))

(declare-fun m!761897 () Bool)

(assert (=> b!820475 m!761897))

(check-sat (not b_next!12937) (not start!70630) (not mapNonEmpty!23575) b_and!21765 (not b!820475) (not b!820478) tp_is_empty!14647 (not b!820474))
(check-sat b_and!21765 (not b_next!12937))
