; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70866 () Bool)

(assert start!70866)

(declare-fun b_free!12973 () Bool)

(declare-fun b_next!12973 () Bool)

(assert (=> start!70866 (= b_free!12973 (not b_next!12973))))

(declare-fun tp!45660 () Bool)

(declare-fun b_and!21845 () Bool)

(assert (=> start!70866 (= tp!45660 b_and!21845)))

(declare-fun b!822087 () Bool)

(declare-fun e!456920 () Bool)

(assert (=> b!822087 (= e!456920 true)))

(declare-datatypes ((V!24579 0))(
  ( (V!24580 (val!7389 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24579)

(declare-datatypes ((array!45565 0))(
  ( (array!45566 (arr!21829 (Array (_ BitVec 32) (_ BitVec 64))) (size!22249 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45565)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24579)

(declare-datatypes ((ValueCell!6926 0))(
  ( (ValueCellFull!6926 (v!9820 V!24579)) (EmptyCell!6926) )
))
(declare-datatypes ((array!45567 0))(
  ( (array!45568 (arr!21830 (Array (_ BitVec 32) ValueCell!6926)) (size!22250 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45567)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9660 0))(
  ( (tuple2!9661 (_1!4841 (_ BitVec 64)) (_2!4841 V!24579)) )
))
(declare-datatypes ((List!15453 0))(
  ( (Nil!15450) (Cons!15449 (h!16584 tuple2!9660) (t!21780 List!15453)) )
))
(declare-datatypes ((ListLongMap!8485 0))(
  ( (ListLongMap!8486 (toList!4258 List!15453)) )
))
(declare-fun lt!369455 () ListLongMap!8485)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2419 (array!45565 array!45567 (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 (_ BitVec 32) Int) ListLongMap!8485)

(assert (=> b!822087 (= lt!369455 (getCurrentListMap!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822088 () Bool)

(declare-fun e!456922 () Bool)

(declare-fun tp_is_empty!14683 () Bool)

(assert (=> b!822088 (= e!456922 tp_is_empty!14683)))

(declare-fun b!822090 () Bool)

(declare-fun e!456919 () Bool)

(assert (=> b!822090 (= e!456919 tp_is_empty!14683)))

(declare-fun b!822091 () Bool)

(declare-fun res!560552 () Bool)

(declare-fun e!456918 () Bool)

(assert (=> b!822091 (=> (not res!560552) (not e!456918))))

(declare-datatypes ((List!15454 0))(
  ( (Nil!15451) (Cons!15450 (h!16585 (_ BitVec 64)) (t!21781 List!15454)) )
))
(declare-fun arrayNoDuplicates!0 (array!45565 (_ BitVec 32) List!15454) Bool)

(assert (=> b!822091 (= res!560552 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15451))))

(declare-fun b!822092 () Bool)

(declare-fun res!560551 () Bool)

(assert (=> b!822092 (=> (not res!560551) (not e!456918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45565 (_ BitVec 32)) Bool)

(assert (=> b!822092 (= res!560551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23632 () Bool)

(declare-fun mapRes!23632 () Bool)

(assert (=> mapIsEmpty!23632 mapRes!23632))

(declare-fun mapNonEmpty!23632 () Bool)

(declare-fun tp!45661 () Bool)

(assert (=> mapNonEmpty!23632 (= mapRes!23632 (and tp!45661 e!456919))))

(declare-fun mapKey!23632 () (_ BitVec 32))

(declare-fun mapRest!23632 () (Array (_ BitVec 32) ValueCell!6926))

(declare-fun mapValue!23632 () ValueCell!6926)

(assert (=> mapNonEmpty!23632 (= (arr!21830 _values!788) (store mapRest!23632 mapKey!23632 mapValue!23632))))

(declare-fun b!822093 () Bool)

(declare-fun e!456917 () Bool)

(assert (=> b!822093 (= e!456917 (and e!456922 mapRes!23632))))

(declare-fun condMapEmpty!23632 () Bool)

(declare-fun mapDefault!23632 () ValueCell!6926)

(assert (=> b!822093 (= condMapEmpty!23632 (= (arr!21830 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6926)) mapDefault!23632)))))

(declare-fun b!822094 () Bool)

(assert (=> b!822094 (= e!456918 (not e!456920))))

(declare-fun res!560549 () Bool)

(assert (=> b!822094 (=> res!560549 e!456920)))

(assert (=> b!822094 (= res!560549 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369452 () ListLongMap!8485)

(declare-fun lt!369454 () ListLongMap!8485)

(assert (=> b!822094 (= lt!369452 lt!369454)))

(declare-fun zeroValueAfter!34 () V!24579)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28066 0))(
  ( (Unit!28067) )
))
(declare-fun lt!369453 () Unit!28066)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!436 (array!45565 array!45567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 V!24579 V!24579 (_ BitVec 32) Int) Unit!28066)

(assert (=> b!822094 (= lt!369453 (lemmaNoChangeToArrayThenSameMapNoExtras!436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2348 (array!45565 array!45567 (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 (_ BitVec 32) Int) ListLongMap!8485)

(assert (=> b!822094 (= lt!369454 (getCurrentListMapNoExtraKeys!2348 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822094 (= lt!369452 (getCurrentListMapNoExtraKeys!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822089 () Bool)

(declare-fun res!560553 () Bool)

(assert (=> b!822089 (=> (not res!560553) (not e!456918))))

(assert (=> b!822089 (= res!560553 (and (= (size!22250 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22249 _keys!976) (size!22250 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560550 () Bool)

(assert (=> start!70866 (=> (not res!560550) (not e!456918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70866 (= res!560550 (validMask!0 mask!1312))))

(assert (=> start!70866 e!456918))

(assert (=> start!70866 tp_is_empty!14683))

(declare-fun array_inv!17473 (array!45565) Bool)

(assert (=> start!70866 (array_inv!17473 _keys!976)))

(assert (=> start!70866 true))

(declare-fun array_inv!17474 (array!45567) Bool)

(assert (=> start!70866 (and (array_inv!17474 _values!788) e!456917)))

(assert (=> start!70866 tp!45660))

(assert (= (and start!70866 res!560550) b!822089))

(assert (= (and b!822089 res!560553) b!822092))

(assert (= (and b!822092 res!560551) b!822091))

(assert (= (and b!822091 res!560552) b!822094))

(assert (= (and b!822094 (not res!560549)) b!822087))

(assert (= (and b!822093 condMapEmpty!23632) mapIsEmpty!23632))

(assert (= (and b!822093 (not condMapEmpty!23632)) mapNonEmpty!23632))

(get-info :version)

(assert (= (and mapNonEmpty!23632 ((_ is ValueCellFull!6926) mapValue!23632)) b!822090))

(assert (= (and b!822093 ((_ is ValueCellFull!6926) mapDefault!23632)) b!822088))

(assert (= start!70866 b!822093))

(declare-fun m!764311 () Bool)

(assert (=> b!822094 m!764311))

(declare-fun m!764313 () Bool)

(assert (=> b!822094 m!764313))

(declare-fun m!764315 () Bool)

(assert (=> b!822094 m!764315))

(declare-fun m!764317 () Bool)

(assert (=> mapNonEmpty!23632 m!764317))

(declare-fun m!764319 () Bool)

(assert (=> b!822092 m!764319))

(declare-fun m!764321 () Bool)

(assert (=> start!70866 m!764321))

(declare-fun m!764323 () Bool)

(assert (=> start!70866 m!764323))

(declare-fun m!764325 () Bool)

(assert (=> start!70866 m!764325))

(declare-fun m!764327 () Bool)

(assert (=> b!822087 m!764327))

(declare-fun m!764329 () Bool)

(assert (=> b!822091 m!764329))

(check-sat (not start!70866) (not b!822094) (not b!822087) (not b!822091) (not mapNonEmpty!23632) (not b!822092) b_and!21845 (not b_next!12973) tp_is_empty!14683)
(check-sat b_and!21845 (not b_next!12973))
