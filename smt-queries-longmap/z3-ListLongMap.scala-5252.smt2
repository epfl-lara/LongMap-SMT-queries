; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70798 () Bool)

(assert start!70798)

(declare-fun b_free!12919 () Bool)

(declare-fun b_next!12919 () Bool)

(assert (=> start!70798 (= b_free!12919 (not b_next!12919))))

(declare-fun tp!45495 () Bool)

(declare-fun b_and!21783 () Bool)

(assert (=> start!70798 (= tp!45495 b_and!21783)))

(declare-fun b!821424 () Bool)

(declare-fun res!560186 () Bool)

(declare-fun e!456450 () Bool)

(assert (=> b!821424 (=> (not res!560186) (not e!456450))))

(declare-datatypes ((array!45459 0))(
  ( (array!45460 (arr!21777 (Array (_ BitVec 32) (_ BitVec 64))) (size!22197 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45459)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24507 0))(
  ( (V!24508 (val!7362 Int)) )
))
(declare-datatypes ((ValueCell!6899 0))(
  ( (ValueCellFull!6899 (v!9793 V!24507)) (EmptyCell!6899) )
))
(declare-datatypes ((array!45461 0))(
  ( (array!45462 (arr!21778 (Array (_ BitVec 32) ValueCell!6899)) (size!22198 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45461)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821424 (= res!560186 (and (= (size!22198 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22197 _keys!976) (size!22198 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23548 () Bool)

(declare-fun mapRes!23548 () Bool)

(declare-fun tp!45496 () Bool)

(declare-fun e!456446 () Bool)

(assert (=> mapNonEmpty!23548 (= mapRes!23548 (and tp!45496 e!456446))))

(declare-fun mapRest!23548 () (Array (_ BitVec 32) ValueCell!6899))

(declare-fun mapValue!23548 () ValueCell!6899)

(declare-fun mapKey!23548 () (_ BitVec 32))

(assert (=> mapNonEmpty!23548 (= (arr!21778 _values!788) (store mapRest!23548 mapKey!23548 mapValue!23548))))

(declare-fun b!821425 () Bool)

(declare-fun tp_is_empty!14629 () Bool)

(assert (=> b!821425 (= e!456446 tp_is_empty!14629)))

(declare-fun mapIsEmpty!23548 () Bool)

(assert (=> mapIsEmpty!23548 mapRes!23548))

(declare-fun b!821426 () Bool)

(declare-fun res!560185 () Bool)

(assert (=> b!821426 (=> (not res!560185) (not e!456450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45459 (_ BitVec 32)) Bool)

(assert (=> b!821426 (= res!560185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821427 () Bool)

(declare-fun e!456447 () Bool)

(declare-fun e!456448 () Bool)

(assert (=> b!821427 (= e!456447 (and e!456448 mapRes!23548))))

(declare-fun condMapEmpty!23548 () Bool)

(declare-fun mapDefault!23548 () ValueCell!6899)

(assert (=> b!821427 (= condMapEmpty!23548 (= (arr!21778 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6899)) mapDefault!23548)))))

(declare-fun b!821428 () Bool)

(declare-fun res!560184 () Bool)

(assert (=> b!821428 (=> (not res!560184) (not e!456450))))

(declare-datatypes ((List!15411 0))(
  ( (Nil!15408) (Cons!15407 (h!16542 (_ BitVec 64)) (t!21736 List!15411)) )
))
(declare-fun arrayNoDuplicates!0 (array!45459 (_ BitVec 32) List!15411) Bool)

(assert (=> b!821428 (= res!560184 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15408))))

(declare-fun res!560183 () Bool)

(assert (=> start!70798 (=> (not res!560183) (not e!456450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70798 (= res!560183 (validMask!0 mask!1312))))

(assert (=> start!70798 e!456450))

(assert (=> start!70798 tp_is_empty!14629))

(declare-fun array_inv!17435 (array!45459) Bool)

(assert (=> start!70798 (array_inv!17435 _keys!976)))

(assert (=> start!70798 true))

(declare-fun array_inv!17436 (array!45461) Bool)

(assert (=> start!70798 (and (array_inv!17436 _values!788) e!456447)))

(assert (=> start!70798 tp!45495))

(declare-fun b!821429 () Bool)

(assert (=> b!821429 (= e!456448 tp_is_empty!14629)))

(declare-fun b!821430 () Bool)

(assert (=> b!821430 (= e!456450 (not true))))

(declare-datatypes ((tuple2!9614 0))(
  ( (tuple2!9615 (_1!4818 (_ BitVec 64)) (_2!4818 V!24507)) )
))
(declare-datatypes ((List!15412 0))(
  ( (Nil!15409) (Cons!15408 (h!16543 tuple2!9614) (t!21737 List!15412)) )
))
(declare-datatypes ((ListLongMap!8439 0))(
  ( (ListLongMap!8440 (toList!4235 List!15412)) )
))
(declare-fun lt!369160 () ListLongMap!8439)

(declare-fun lt!369159 () ListLongMap!8439)

(assert (=> b!821430 (= lt!369160 lt!369159)))

(declare-fun zeroValueBefore!34 () V!24507)

(declare-fun zeroValueAfter!34 () V!24507)

(declare-fun minValue!754 () V!24507)

(declare-datatypes ((Unit!28022 0))(
  ( (Unit!28023) )
))
(declare-fun lt!369158 () Unit!28022)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!414 (array!45459 array!45461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24507 V!24507 V!24507 V!24507 (_ BitVec 32) Int) Unit!28022)

(assert (=> b!821430 (= lt!369158 (lemmaNoChangeToArrayThenSameMapNoExtras!414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2326 (array!45459 array!45461 (_ BitVec 32) (_ BitVec 32) V!24507 V!24507 (_ BitVec 32) Int) ListLongMap!8439)

(assert (=> b!821430 (= lt!369159 (getCurrentListMapNoExtraKeys!2326 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821430 (= lt!369160 (getCurrentListMapNoExtraKeys!2326 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70798 res!560183) b!821424))

(assert (= (and b!821424 res!560186) b!821426))

(assert (= (and b!821426 res!560185) b!821428))

(assert (= (and b!821428 res!560184) b!821430))

(assert (= (and b!821427 condMapEmpty!23548) mapIsEmpty!23548))

(assert (= (and b!821427 (not condMapEmpty!23548)) mapNonEmpty!23548))

(get-info :version)

(assert (= (and mapNonEmpty!23548 ((_ is ValueCellFull!6899) mapValue!23548)) b!821425))

(assert (= (and b!821427 ((_ is ValueCellFull!6899) mapDefault!23548)) b!821429))

(assert (= start!70798 b!821427))

(declare-fun m!763753 () Bool)

(assert (=> b!821428 m!763753))

(declare-fun m!763755 () Bool)

(assert (=> b!821426 m!763755))

(declare-fun m!763757 () Bool)

(assert (=> start!70798 m!763757))

(declare-fun m!763759 () Bool)

(assert (=> start!70798 m!763759))

(declare-fun m!763761 () Bool)

(assert (=> start!70798 m!763761))

(declare-fun m!763763 () Bool)

(assert (=> b!821430 m!763763))

(declare-fun m!763765 () Bool)

(assert (=> b!821430 m!763765))

(declare-fun m!763767 () Bool)

(assert (=> b!821430 m!763767))

(declare-fun m!763769 () Bool)

(assert (=> mapNonEmpty!23548 m!763769))

(check-sat (not b_next!12919) b_and!21783 (not b!821430) (not b!821426) (not b!821428) tp_is_empty!14629 (not start!70798) (not mapNonEmpty!23548))
(check-sat b_and!21783 (not b_next!12919))
