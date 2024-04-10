; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70790 () Bool)

(assert start!70790)

(declare-fun b_free!13047 () Bool)

(declare-fun b_next!13047 () Bool)

(assert (=> start!70790 (= b_free!13047 (not b_next!13047))))

(declare-fun tp!45886 () Bool)

(declare-fun b_and!21919 () Bool)

(assert (=> start!70790 (= tp!45886 b_and!21919)))

(declare-fun res!560827 () Bool)

(declare-fun e!457110 () Bool)

(assert (=> start!70790 (=> (not res!560827) (not e!457110))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70790 (= res!560827 (validMask!0 mask!1312))))

(assert (=> start!70790 e!457110))

(declare-fun tp_is_empty!14757 () Bool)

(assert (=> start!70790 tp_is_empty!14757))

(declare-datatypes ((array!45708 0))(
  ( (array!45709 (arr!21904 (Array (_ BitVec 32) (_ BitVec 64))) (size!22325 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45708)

(declare-fun array_inv!17497 (array!45708) Bool)

(assert (=> start!70790 (array_inv!17497 _keys!976)))

(assert (=> start!70790 true))

(declare-datatypes ((V!24677 0))(
  ( (V!24678 (val!7426 Int)) )
))
(declare-datatypes ((ValueCell!6963 0))(
  ( (ValueCellFull!6963 (v!9857 V!24677)) (EmptyCell!6963) )
))
(declare-datatypes ((array!45710 0))(
  ( (array!45711 (arr!21905 (Array (_ BitVec 32) ValueCell!6963)) (size!22326 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45710)

(declare-fun e!457108 () Bool)

(declare-fun array_inv!17498 (array!45710) Bool)

(assert (=> start!70790 (and (array_inv!17498 _values!788) e!457108)))

(assert (=> start!70790 tp!45886))

(declare-fun b!822238 () Bool)

(declare-fun res!560828 () Bool)

(assert (=> b!822238 (=> (not res!560828) (not e!457110))))

(declare-datatypes ((List!15620 0))(
  ( (Nil!15617) (Cons!15616 (h!16745 (_ BitVec 64)) (t!21957 List!15620)) )
))
(declare-fun arrayNoDuplicates!0 (array!45708 (_ BitVec 32) List!15620) Bool)

(assert (=> b!822238 (= res!560828 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15617))))

(declare-fun b!822239 () Bool)

(declare-fun res!560825 () Bool)

(assert (=> b!822239 (=> (not res!560825) (not e!457110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45708 (_ BitVec 32)) Bool)

(assert (=> b!822239 (= res!560825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822240 () Bool)

(declare-fun e!457113 () Bool)

(assert (=> b!822240 (= e!457110 (not e!457113))))

(declare-fun res!560826 () Bool)

(assert (=> b!822240 (=> res!560826 e!457113)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822240 (= res!560826 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9804 0))(
  ( (tuple2!9805 (_1!4913 (_ BitVec 64)) (_2!4913 V!24677)) )
))
(declare-datatypes ((List!15621 0))(
  ( (Nil!15618) (Cons!15617 (h!16746 tuple2!9804) (t!21958 List!15621)) )
))
(declare-datatypes ((ListLongMap!8627 0))(
  ( (ListLongMap!8628 (toList!4329 List!15621)) )
))
(declare-fun lt!369861 () ListLongMap!8627)

(declare-fun lt!369859 () ListLongMap!8627)

(assert (=> b!822240 (= lt!369861 lt!369859)))

(declare-fun zeroValueBefore!34 () V!24677)

(declare-fun zeroValueAfter!34 () V!24677)

(declare-fun minValue!754 () V!24677)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28122 0))(
  ( (Unit!28123) )
))
(declare-fun lt!369862 () Unit!28122)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!458 (array!45708 array!45710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24677 V!24677 V!24677 V!24677 (_ BitVec 32) Int) Unit!28122)

(assert (=> b!822240 (= lt!369862 (lemmaNoChangeToArrayThenSameMapNoExtras!458 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2348 (array!45708 array!45710 (_ BitVec 32) (_ BitVec 32) V!24677 V!24677 (_ BitVec 32) Int) ListLongMap!8627)

(assert (=> b!822240 (= lt!369859 (getCurrentListMapNoExtraKeys!2348 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822240 (= lt!369861 (getCurrentListMapNoExtraKeys!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822241 () Bool)

(declare-fun e!457112 () Bool)

(declare-fun mapRes!23746 () Bool)

(assert (=> b!822241 (= e!457108 (and e!457112 mapRes!23746))))

(declare-fun condMapEmpty!23746 () Bool)

(declare-fun mapDefault!23746 () ValueCell!6963)

(assert (=> b!822241 (= condMapEmpty!23746 (= (arr!21905 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6963)) mapDefault!23746)))))

(declare-fun b!822242 () Bool)

(assert (=> b!822242 (= e!457113 true)))

(declare-fun lt!369864 () ListLongMap!8627)

(declare-fun lt!369860 () ListLongMap!8627)

(declare-fun lt!369858 () tuple2!9804)

(declare-fun +!1880 (ListLongMap!8627 tuple2!9804) ListLongMap!8627)

(assert (=> b!822242 (= lt!369864 (+!1880 lt!369860 lt!369858))))

(declare-fun lt!369865 () Unit!28122)

(declare-fun addCommutativeForDiffKeys!443 (ListLongMap!8627 (_ BitVec 64) V!24677 (_ BitVec 64) V!24677) Unit!28122)

(assert (=> b!822242 (= lt!369865 (addCommutativeForDiffKeys!443 lt!369861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369867 () ListLongMap!8627)

(assert (=> b!822242 (= lt!369867 lt!369864)))

(declare-fun lt!369863 () tuple2!9804)

(assert (=> b!822242 (= lt!369864 (+!1880 (+!1880 lt!369861 lt!369858) lt!369863))))

(assert (=> b!822242 (= lt!369858 (tuple2!9805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369866 () ListLongMap!8627)

(assert (=> b!822242 (= lt!369866 lt!369860)))

(assert (=> b!822242 (= lt!369860 (+!1880 lt!369861 lt!369863))))

(assert (=> b!822242 (= lt!369863 (tuple2!9805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2494 (array!45708 array!45710 (_ BitVec 32) (_ BitVec 32) V!24677 V!24677 (_ BitVec 32) Int) ListLongMap!8627)

(assert (=> b!822242 (= lt!369867 (getCurrentListMap!2494 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822242 (= lt!369866 (getCurrentListMap!2494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822243 () Bool)

(assert (=> b!822243 (= e!457112 tp_is_empty!14757)))

(declare-fun mapNonEmpty!23746 () Bool)

(declare-fun tp!45885 () Bool)

(declare-fun e!457111 () Bool)

(assert (=> mapNonEmpty!23746 (= mapRes!23746 (and tp!45885 e!457111))))

(declare-fun mapRest!23746 () (Array (_ BitVec 32) ValueCell!6963))

(declare-fun mapValue!23746 () ValueCell!6963)

(declare-fun mapKey!23746 () (_ BitVec 32))

(assert (=> mapNonEmpty!23746 (= (arr!21905 _values!788) (store mapRest!23746 mapKey!23746 mapValue!23746))))

(declare-fun mapIsEmpty!23746 () Bool)

(assert (=> mapIsEmpty!23746 mapRes!23746))

(declare-fun b!822244 () Bool)

(declare-fun res!560829 () Bool)

(assert (=> b!822244 (=> (not res!560829) (not e!457110))))

(assert (=> b!822244 (= res!560829 (and (= (size!22326 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22325 _keys!976) (size!22326 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822245 () Bool)

(assert (=> b!822245 (= e!457111 tp_is_empty!14757)))

(assert (= (and start!70790 res!560827) b!822244))

(assert (= (and b!822244 res!560829) b!822239))

(assert (= (and b!822239 res!560825) b!822238))

(assert (= (and b!822238 res!560828) b!822240))

(assert (= (and b!822240 (not res!560826)) b!822242))

(assert (= (and b!822241 condMapEmpty!23746) mapIsEmpty!23746))

(assert (= (and b!822241 (not condMapEmpty!23746)) mapNonEmpty!23746))

(get-info :version)

(assert (= (and mapNonEmpty!23746 ((_ is ValueCellFull!6963) mapValue!23746)) b!822245))

(assert (= (and b!822241 ((_ is ValueCellFull!6963) mapDefault!23746)) b!822243))

(assert (= start!70790 b!822241))

(declare-fun m!764025 () Bool)

(assert (=> b!822242 m!764025))

(declare-fun m!764027 () Bool)

(assert (=> b!822242 m!764027))

(declare-fun m!764029 () Bool)

(assert (=> b!822242 m!764029))

(assert (=> b!822242 m!764029))

(declare-fun m!764031 () Bool)

(assert (=> b!822242 m!764031))

(declare-fun m!764033 () Bool)

(assert (=> b!822242 m!764033))

(declare-fun m!764035 () Bool)

(assert (=> b!822242 m!764035))

(declare-fun m!764037 () Bool)

(assert (=> b!822242 m!764037))

(declare-fun m!764039 () Bool)

(assert (=> start!70790 m!764039))

(declare-fun m!764041 () Bool)

(assert (=> start!70790 m!764041))

(declare-fun m!764043 () Bool)

(assert (=> start!70790 m!764043))

(declare-fun m!764045 () Bool)

(assert (=> b!822239 m!764045))

(declare-fun m!764047 () Bool)

(assert (=> b!822238 m!764047))

(declare-fun m!764049 () Bool)

(assert (=> b!822240 m!764049))

(declare-fun m!764051 () Bool)

(assert (=> b!822240 m!764051))

(declare-fun m!764053 () Bool)

(assert (=> b!822240 m!764053))

(declare-fun m!764055 () Bool)

(assert (=> mapNonEmpty!23746 m!764055))

(check-sat (not b_next!13047) (not b!822240) (not mapNonEmpty!23746) (not b!822239) (not b!822238) (not b!822242) tp_is_empty!14757 (not start!70790) b_and!21919)
(check-sat b_and!21919 (not b_next!13047))
