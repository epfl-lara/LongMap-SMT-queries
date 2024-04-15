; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70786 () Bool)

(assert start!70786)

(declare-fun b_free!13063 () Bool)

(declare-fun b_next!13063 () Bool)

(assert (=> start!70786 (= b_free!13063 (not b_next!13063))))

(declare-fun tp!45934 () Bool)

(declare-fun b_and!21909 () Bool)

(assert (=> start!70786 (= tp!45934 b_and!21909)))

(declare-fun b!822184 () Bool)

(declare-fun e!457102 () Bool)

(declare-fun e!457103 () Bool)

(assert (=> b!822184 (= e!457102 (not e!457103))))

(declare-fun res!560841 () Bool)

(assert (=> b!822184 (=> res!560841 e!457103)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822184 (= res!560841 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24699 0))(
  ( (V!24700 (val!7434 Int)) )
))
(declare-datatypes ((tuple2!9822 0))(
  ( (tuple2!9823 (_1!4922 (_ BitVec 64)) (_2!4922 V!24699)) )
))
(declare-datatypes ((List!15634 0))(
  ( (Nil!15631) (Cons!15630 (h!16759 tuple2!9822) (t!21962 List!15634)) )
))
(declare-datatypes ((ListLongMap!8635 0))(
  ( (ListLongMap!8636 (toList!4333 List!15634)) )
))
(declare-fun lt!369861 () ListLongMap!8635)

(declare-fun lt!369857 () ListLongMap!8635)

(assert (=> b!822184 (= lt!369861 lt!369857)))

(declare-fun zeroValueBefore!34 () V!24699)

(declare-fun zeroValueAfter!34 () V!24699)

(declare-fun minValue!754 () V!24699)

(declare-datatypes ((ValueCell!6971 0))(
  ( (ValueCellFull!6971 (v!9859 V!24699)) (EmptyCell!6971) )
))
(declare-datatypes ((array!45707 0))(
  ( (array!45708 (arr!21904 (Array (_ BitVec 32) ValueCell!6971)) (size!22325 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45707)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28086 0))(
  ( (Unit!28087) )
))
(declare-fun lt!369856 () Unit!28086)

(declare-datatypes ((array!45709 0))(
  ( (array!45710 (arr!21905 (Array (_ BitVec 32) (_ BitVec 64))) (size!22326 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45709)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!472 (array!45709 array!45707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 V!24699 V!24699 (_ BitVec 32) Int) Unit!28086)

(assert (=> b!822184 (= lt!369856 (lemmaNoChangeToArrayThenSameMapNoExtras!472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2379 (array!45709 array!45707 (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 (_ BitVec 32) Int) ListLongMap!8635)

(assert (=> b!822184 (= lt!369857 (getCurrentListMapNoExtraKeys!2379 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822184 (= lt!369861 (getCurrentListMapNoExtraKeys!2379 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822185 () Bool)

(declare-fun e!457104 () Bool)

(declare-fun e!457106 () Bool)

(declare-fun mapRes!23770 () Bool)

(assert (=> b!822185 (= e!457104 (and e!457106 mapRes!23770))))

(declare-fun condMapEmpty!23770 () Bool)

(declare-fun mapDefault!23770 () ValueCell!6971)

(assert (=> b!822185 (= condMapEmpty!23770 (= (arr!21904 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6971)) mapDefault!23770)))))

(declare-fun b!822186 () Bool)

(declare-fun e!457107 () Bool)

(declare-fun tp_is_empty!14773 () Bool)

(assert (=> b!822186 (= e!457107 tp_is_empty!14773)))

(declare-fun b!822187 () Bool)

(declare-fun res!560842 () Bool)

(assert (=> b!822187 (=> (not res!560842) (not e!457102))))

(assert (=> b!822187 (= res!560842 (and (= (size!22325 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22326 _keys!976) (size!22325 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560843 () Bool)

(assert (=> start!70786 (=> (not res!560843) (not e!457102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70786 (= res!560843 (validMask!0 mask!1312))))

(assert (=> start!70786 e!457102))

(assert (=> start!70786 tp_is_empty!14773))

(declare-fun array_inv!17561 (array!45709) Bool)

(assert (=> start!70786 (array_inv!17561 _keys!976)))

(assert (=> start!70786 true))

(declare-fun array_inv!17562 (array!45707) Bool)

(assert (=> start!70786 (and (array_inv!17562 _values!788) e!457104)))

(assert (=> start!70786 tp!45934))

(declare-fun b!822188 () Bool)

(declare-fun res!560839 () Bool)

(assert (=> b!822188 (=> (not res!560839) (not e!457102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45709 (_ BitVec 32)) Bool)

(assert (=> b!822188 (= res!560839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822189 () Bool)

(assert (=> b!822189 (= e!457106 tp_is_empty!14773)))

(declare-fun b!822190 () Bool)

(declare-fun res!560840 () Bool)

(assert (=> b!822190 (=> (not res!560840) (not e!457102))))

(declare-datatypes ((List!15635 0))(
  ( (Nil!15632) (Cons!15631 (h!16760 (_ BitVec 64)) (t!21963 List!15635)) )
))
(declare-fun arrayNoDuplicates!0 (array!45709 (_ BitVec 32) List!15635) Bool)

(assert (=> b!822190 (= res!560840 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15632))))

(declare-fun mapNonEmpty!23770 () Bool)

(declare-fun tp!45933 () Bool)

(assert (=> mapNonEmpty!23770 (= mapRes!23770 (and tp!45933 e!457107))))

(declare-fun mapValue!23770 () ValueCell!6971)

(declare-fun mapRest!23770 () (Array (_ BitVec 32) ValueCell!6971))

(declare-fun mapKey!23770 () (_ BitVec 32))

(assert (=> mapNonEmpty!23770 (= (arr!21904 _values!788) (store mapRest!23770 mapKey!23770 mapValue!23770))))

(declare-fun b!822191 () Bool)

(assert (=> b!822191 (= e!457103 true)))

(declare-fun lt!369858 () ListLongMap!8635)

(declare-fun lt!369860 () ListLongMap!8635)

(declare-fun lt!369859 () tuple2!9822)

(declare-fun +!1913 (ListLongMap!8635 tuple2!9822) ListLongMap!8635)

(assert (=> b!822191 (= lt!369858 (+!1913 lt!369860 lt!369859))))

(declare-fun lt!369862 () Unit!28086)

(declare-fun addCommutativeForDiffKeys!444 (ListLongMap!8635 (_ BitVec 64) V!24699 (_ BitVec 64) V!24699) Unit!28086)

(assert (=> b!822191 (= lt!369862 (addCommutativeForDiffKeys!444 lt!369861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369863 () ListLongMap!8635)

(assert (=> b!822191 (= lt!369863 lt!369858)))

(declare-fun lt!369864 () tuple2!9822)

(assert (=> b!822191 (= lt!369858 (+!1913 (+!1913 lt!369861 lt!369859) lt!369864))))

(assert (=> b!822191 (= lt!369859 (tuple2!9823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369855 () ListLongMap!8635)

(assert (=> b!822191 (= lt!369855 lt!369860)))

(assert (=> b!822191 (= lt!369860 (+!1913 lt!369861 lt!369864))))

(assert (=> b!822191 (= lt!369864 (tuple2!9823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2455 (array!45709 array!45707 (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 (_ BitVec 32) Int) ListLongMap!8635)

(assert (=> b!822191 (= lt!369863 (getCurrentListMap!2455 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822191 (= lt!369855 (getCurrentListMap!2455 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23770 () Bool)

(assert (=> mapIsEmpty!23770 mapRes!23770))

(assert (= (and start!70786 res!560843) b!822187))

(assert (= (and b!822187 res!560842) b!822188))

(assert (= (and b!822188 res!560839) b!822190))

(assert (= (and b!822190 res!560840) b!822184))

(assert (= (and b!822184 (not res!560841)) b!822191))

(assert (= (and b!822185 condMapEmpty!23770) mapIsEmpty!23770))

(assert (= (and b!822185 (not condMapEmpty!23770)) mapNonEmpty!23770))

(get-info :version)

(assert (= (and mapNonEmpty!23770 ((_ is ValueCellFull!6971) mapValue!23770)) b!822186))

(assert (= (and b!822185 ((_ is ValueCellFull!6971) mapDefault!23770)) b!822189))

(assert (= start!70786 b!822185))

(declare-fun m!763529 () Bool)

(assert (=> start!70786 m!763529))

(declare-fun m!763531 () Bool)

(assert (=> start!70786 m!763531))

(declare-fun m!763533 () Bool)

(assert (=> start!70786 m!763533))

(declare-fun m!763535 () Bool)

(assert (=> mapNonEmpty!23770 m!763535))

(declare-fun m!763537 () Bool)

(assert (=> b!822188 m!763537))

(declare-fun m!763539 () Bool)

(assert (=> b!822184 m!763539))

(declare-fun m!763541 () Bool)

(assert (=> b!822184 m!763541))

(declare-fun m!763543 () Bool)

(assert (=> b!822184 m!763543))

(declare-fun m!763545 () Bool)

(assert (=> b!822191 m!763545))

(declare-fun m!763547 () Bool)

(assert (=> b!822191 m!763547))

(declare-fun m!763549 () Bool)

(assert (=> b!822191 m!763549))

(declare-fun m!763551 () Bool)

(assert (=> b!822191 m!763551))

(declare-fun m!763553 () Bool)

(assert (=> b!822191 m!763553))

(assert (=> b!822191 m!763551))

(declare-fun m!763555 () Bool)

(assert (=> b!822191 m!763555))

(declare-fun m!763557 () Bool)

(assert (=> b!822191 m!763557))

(declare-fun m!763559 () Bool)

(assert (=> b!822190 m!763559))

(check-sat (not start!70786) tp_is_empty!14773 (not b!822191) b_and!21909 (not b!822184) (not b!822190) (not b_next!13063) (not b!822188) (not mapNonEmpty!23770))
(check-sat b_and!21909 (not b_next!13063))
