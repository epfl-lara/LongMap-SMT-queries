; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71598 () Bool)

(assert start!71598)

(declare-fun b_free!13477 () Bool)

(declare-fun b_next!13477 () Bool)

(assert (=> start!71598 (= b_free!13477 (not b_next!13477))))

(declare-fun tp!47212 () Bool)

(declare-fun b_and!22493 () Bool)

(assert (=> start!71598 (= tp!47212 b_and!22493)))

(declare-fun mapIsEmpty!24427 () Bool)

(declare-fun mapRes!24427 () Bool)

(assert (=> mapIsEmpty!24427 mapRes!24427))

(declare-datatypes ((V!25251 0))(
  ( (V!25252 (val!7641 Int)) )
))
(declare-datatypes ((tuple2!10062 0))(
  ( (tuple2!10063 (_1!5042 (_ BitVec 64)) (_2!5042 V!25251)) )
))
(declare-fun lt!376570 () tuple2!10062)

(declare-datatypes ((List!15833 0))(
  ( (Nil!15830) (Cons!15829 (h!16964 tuple2!10062) (t!22186 List!15833)) )
))
(declare-datatypes ((ListLongMap!8887 0))(
  ( (ListLongMap!8888 (toList!4459 List!15833)) )
))
(declare-fun lt!376575 () ListLongMap!8887)

(declare-fun e!463007 () Bool)

(declare-fun b!830472 () Bool)

(declare-fun lt!376567 () ListLongMap!8887)

(declare-fun +!1981 (ListLongMap!8887 tuple2!10062) ListLongMap!8887)

(assert (=> b!830472 (= e!463007 (= (+!1981 lt!376575 lt!376570) lt!376567))))

(declare-fun lt!376576 () ListLongMap!8887)

(declare-fun lt!376574 () ListLongMap!8887)

(assert (=> b!830472 (= lt!376576 (+!1981 lt!376574 lt!376570))))

(declare-datatypes ((Unit!28430 0))(
  ( (Unit!28431) )
))
(declare-fun lt!376569 () Unit!28430)

(declare-fun zeroValueAfter!34 () V!25251)

(declare-fun minValue!754 () V!25251)

(declare-fun lt!376571 () ListLongMap!8887)

(declare-fun addCommutativeForDiffKeys!471 (ListLongMap!8887 (_ BitVec 64) V!25251 (_ BitVec 64) V!25251) Unit!28430)

(assert (=> b!830472 (= lt!376569 (addCommutativeForDiffKeys!471 lt!376571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!830472 (= lt!376567 lt!376576)))

(declare-fun lt!376568 () tuple2!10062)

(assert (=> b!830472 (= lt!376576 (+!1981 (+!1981 lt!376571 lt!376570) lt!376568))))

(assert (=> b!830472 (= lt!376570 (tuple2!10063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!830472 (= lt!376575 lt!376574)))

(assert (=> b!830472 (= lt!376574 (+!1981 lt!376571 lt!376568))))

(assert (=> b!830472 (= lt!376568 (tuple2!10063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!46551 0))(
  ( (array!46552 (arr!22309 (Array (_ BitVec 32) (_ BitVec 64))) (size!22729 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46551)

(declare-datatypes ((ValueCell!7178 0))(
  ( (ValueCellFull!7178 (v!10081 V!25251)) (EmptyCell!7178) )
))
(declare-datatypes ((array!46553 0))(
  ( (array!46554 (arr!22310 (Array (_ BitVec 32) ValueCell!7178)) (size!22730 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46553)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2552 (array!46551 array!46553 (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 (_ BitVec 32) Int) ListLongMap!8887)

(assert (=> b!830472 (= lt!376567 (getCurrentListMap!2552 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25251)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!830472 (= lt!376575 (getCurrentListMap!2552 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830473 () Bool)

(declare-fun e!463008 () Bool)

(assert (=> b!830473 (= e!463008 (not e!463007))))

(declare-fun res!565461 () Bool)

(assert (=> b!830473 (=> res!565461 e!463007)))

(assert (=> b!830473 (= res!565461 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!376573 () ListLongMap!8887)

(assert (=> b!830473 (= lt!376571 lt!376573)))

(declare-fun lt!376572 () Unit!28430)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!597 (array!46551 array!46553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 V!25251 V!25251 (_ BitVec 32) Int) Unit!28430)

(assert (=> b!830473 (= lt!376572 (lemmaNoChangeToArrayThenSameMapNoExtras!597 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2530 (array!46551 array!46553 (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 (_ BitVec 32) Int) ListLongMap!8887)

(assert (=> b!830473 (= lt!376573 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830473 (= lt!376571 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830474 () Bool)

(declare-fun e!463010 () Bool)

(declare-fun tp_is_empty!15187 () Bool)

(assert (=> b!830474 (= e!463010 tp_is_empty!15187)))

(declare-fun b!830475 () Bool)

(declare-fun res!565460 () Bool)

(assert (=> b!830475 (=> (not res!565460) (not e!463008))))

(declare-datatypes ((List!15834 0))(
  ( (Nil!15831) (Cons!15830 (h!16965 (_ BitVec 64)) (t!22187 List!15834)) )
))
(declare-fun arrayNoDuplicates!0 (array!46551 (_ BitVec 32) List!15834) Bool)

(assert (=> b!830475 (= res!565460 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15831))))

(declare-fun b!830476 () Bool)

(declare-fun e!463006 () Bool)

(declare-fun e!463009 () Bool)

(assert (=> b!830476 (= e!463006 (and e!463009 mapRes!24427))))

(declare-fun condMapEmpty!24427 () Bool)

(declare-fun mapDefault!24427 () ValueCell!7178)

(assert (=> b!830476 (= condMapEmpty!24427 (= (arr!22310 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7178)) mapDefault!24427)))))

(declare-fun b!830477 () Bool)

(declare-fun res!565464 () Bool)

(assert (=> b!830477 (=> (not res!565464) (not e!463008))))

(assert (=> b!830477 (= res!565464 (and (= (size!22730 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22729 _keys!976) (size!22730 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!830478 () Bool)

(declare-fun res!565462 () Bool)

(assert (=> b!830478 (=> (not res!565462) (not e!463008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46551 (_ BitVec 32)) Bool)

(assert (=> b!830478 (= res!565462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!830479 () Bool)

(assert (=> b!830479 (= e!463009 tp_is_empty!15187)))

(declare-fun res!565463 () Bool)

(assert (=> start!71598 (=> (not res!565463) (not e!463008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71598 (= res!565463 (validMask!0 mask!1312))))

(assert (=> start!71598 e!463008))

(assert (=> start!71598 tp_is_empty!15187))

(declare-fun array_inv!17811 (array!46551) Bool)

(assert (=> start!71598 (array_inv!17811 _keys!976)))

(assert (=> start!71598 true))

(declare-fun array_inv!17812 (array!46553) Bool)

(assert (=> start!71598 (and (array_inv!17812 _values!788) e!463006)))

(assert (=> start!71598 tp!47212))

(declare-fun mapNonEmpty!24427 () Bool)

(declare-fun tp!47211 () Bool)

(assert (=> mapNonEmpty!24427 (= mapRes!24427 (and tp!47211 e!463010))))

(declare-fun mapRest!24427 () (Array (_ BitVec 32) ValueCell!7178))

(declare-fun mapValue!24427 () ValueCell!7178)

(declare-fun mapKey!24427 () (_ BitVec 32))

(assert (=> mapNonEmpty!24427 (= (arr!22310 _values!788) (store mapRest!24427 mapKey!24427 mapValue!24427))))

(assert (= (and start!71598 res!565463) b!830477))

(assert (= (and b!830477 res!565464) b!830478))

(assert (= (and b!830478 res!565462) b!830475))

(assert (= (and b!830475 res!565460) b!830473))

(assert (= (and b!830473 (not res!565461)) b!830472))

(assert (= (and b!830476 condMapEmpty!24427) mapIsEmpty!24427))

(assert (= (and b!830476 (not condMapEmpty!24427)) mapNonEmpty!24427))

(get-info :version)

(assert (= (and mapNonEmpty!24427 ((_ is ValueCellFull!7178) mapValue!24427)) b!830474))

(assert (= (and b!830476 ((_ is ValueCellFull!7178) mapDefault!24427)) b!830479))

(assert (= start!71598 b!830476))

(declare-fun m!773851 () Bool)

(assert (=> start!71598 m!773851))

(declare-fun m!773853 () Bool)

(assert (=> start!71598 m!773853))

(declare-fun m!773855 () Bool)

(assert (=> start!71598 m!773855))

(declare-fun m!773857 () Bool)

(assert (=> b!830478 m!773857))

(declare-fun m!773859 () Bool)

(assert (=> b!830472 m!773859))

(declare-fun m!773861 () Bool)

(assert (=> b!830472 m!773861))

(assert (=> b!830472 m!773859))

(declare-fun m!773863 () Bool)

(assert (=> b!830472 m!773863))

(declare-fun m!773865 () Bool)

(assert (=> b!830472 m!773865))

(declare-fun m!773867 () Bool)

(assert (=> b!830472 m!773867))

(declare-fun m!773869 () Bool)

(assert (=> b!830472 m!773869))

(declare-fun m!773871 () Bool)

(assert (=> b!830472 m!773871))

(declare-fun m!773873 () Bool)

(assert (=> b!830472 m!773873))

(declare-fun m!773875 () Bool)

(assert (=> b!830473 m!773875))

(declare-fun m!773877 () Bool)

(assert (=> b!830473 m!773877))

(declare-fun m!773879 () Bool)

(assert (=> b!830473 m!773879))

(declare-fun m!773881 () Bool)

(assert (=> b!830475 m!773881))

(declare-fun m!773883 () Bool)

(assert (=> mapNonEmpty!24427 m!773883))

(check-sat tp_is_empty!15187 (not b!830473) (not mapNonEmpty!24427) (not b!830472) (not b_next!13477) (not start!71598) (not b!830475) (not b!830478) b_and!22493)
(check-sat b_and!22493 (not b_next!13477))
