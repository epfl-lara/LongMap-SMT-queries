; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70842 () Bool)

(assert start!70842)

(declare-fun b_free!13099 () Bool)

(declare-fun b_next!13099 () Bool)

(assert (=> start!70842 (= b_free!13099 (not b_next!13099))))

(declare-fun tp!46045 () Bool)

(declare-fun b_and!21957 () Bool)

(assert (=> start!70842 (= tp!46045 b_and!21957)))

(declare-fun b!822797 () Bool)

(declare-fun e!457540 () Bool)

(declare-fun tp_is_empty!14809 () Bool)

(assert (=> b!822797 (= e!457540 tp_is_empty!14809)))

(declare-fun b!822798 () Bool)

(declare-fun e!457544 () Bool)

(declare-fun e!457542 () Bool)

(assert (=> b!822798 (= e!457544 (not e!457542))))

(declare-fun res!561190 () Bool)

(assert (=> b!822798 (=> res!561190 e!457542)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822798 (= res!561190 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24747 0))(
  ( (V!24748 (val!7452 Int)) )
))
(declare-datatypes ((tuple2!9852 0))(
  ( (tuple2!9853 (_1!4937 (_ BitVec 64)) (_2!4937 V!24747)) )
))
(declare-datatypes ((List!15661 0))(
  ( (Nil!15658) (Cons!15657 (h!16786 tuple2!9852) (t!21991 List!15661)) )
))
(declare-datatypes ((ListLongMap!8665 0))(
  ( (ListLongMap!8666 (toList!4348 List!15661)) )
))
(declare-fun lt!370556 () ListLongMap!8665)

(declare-fun lt!370553 () ListLongMap!8665)

(assert (=> b!822798 (= lt!370556 lt!370553)))

(declare-datatypes ((Unit!28118 0))(
  ( (Unit!28119) )
))
(declare-fun lt!370557 () Unit!28118)

(declare-datatypes ((array!45781 0))(
  ( (array!45782 (arr!21940 (Array (_ BitVec 32) (_ BitVec 64))) (size!22361 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45781)

(declare-fun zeroValueAfter!34 () V!24747)

(declare-fun minValue!754 () V!24747)

(declare-datatypes ((ValueCell!6989 0))(
  ( (ValueCellFull!6989 (v!9878 V!24747)) (EmptyCell!6989) )
))
(declare-datatypes ((array!45783 0))(
  ( (array!45784 (arr!21941 (Array (_ BitVec 32) ValueCell!6989)) (size!22362 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45783)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24747)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!486 (array!45781 array!45783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 V!24747 V!24747 (_ BitVec 32) Int) Unit!28118)

(assert (=> b!822798 (= lt!370557 (lemmaNoChangeToArrayThenSameMapNoExtras!486 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2393 (array!45781 array!45783 (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 (_ BitVec 32) Int) ListLongMap!8665)

(assert (=> b!822798 (= lt!370553 (getCurrentListMapNoExtraKeys!2393 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822798 (= lt!370556 (getCurrentListMapNoExtraKeys!2393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822799 () Bool)

(declare-fun res!561192 () Bool)

(assert (=> b!822799 (=> (not res!561192) (not e!457544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45781 (_ BitVec 32)) Bool)

(assert (=> b!822799 (= res!561192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822801 () Bool)

(assert (=> b!822801 (= e!457542 true)))

(declare-fun lt!370558 () ListLongMap!8665)

(declare-fun lt!370551 () ListLongMap!8665)

(declare-fun lt!370554 () tuple2!9852)

(declare-fun +!1924 (ListLongMap!8665 tuple2!9852) ListLongMap!8665)

(assert (=> b!822801 (= lt!370558 (+!1924 lt!370551 lt!370554))))

(declare-fun lt!370555 () Unit!28118)

(declare-fun addCommutativeForDiffKeys!455 (ListLongMap!8665 (_ BitVec 64) V!24747 (_ BitVec 64) V!24747) Unit!28118)

(assert (=> b!822801 (= lt!370555 (addCommutativeForDiffKeys!455 lt!370556 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370552 () ListLongMap!8665)

(assert (=> b!822801 (= lt!370552 lt!370558)))

(declare-fun lt!370550 () tuple2!9852)

(assert (=> b!822801 (= lt!370558 (+!1924 (+!1924 lt!370556 lt!370554) lt!370550))))

(assert (=> b!822801 (= lt!370554 (tuple2!9853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370559 () ListLongMap!8665)

(assert (=> b!822801 (= lt!370559 lt!370551)))

(assert (=> b!822801 (= lt!370551 (+!1924 lt!370556 lt!370550))))

(assert (=> b!822801 (= lt!370550 (tuple2!9853 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2466 (array!45781 array!45783 (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 (_ BitVec 32) Int) ListLongMap!8665)

(assert (=> b!822801 (= lt!370552 (getCurrentListMap!2466 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822801 (= lt!370559 (getCurrentListMap!2466 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822802 () Bool)

(declare-fun res!561189 () Bool)

(assert (=> b!822802 (=> (not res!561189) (not e!457544))))

(declare-datatypes ((List!15662 0))(
  ( (Nil!15659) (Cons!15658 (h!16787 (_ BitVec 64)) (t!21992 List!15662)) )
))
(declare-fun arrayNoDuplicates!0 (array!45781 (_ BitVec 32) List!15662) Bool)

(assert (=> b!822802 (= res!561189 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15659))))

(declare-fun mapNonEmpty!23827 () Bool)

(declare-fun mapRes!23827 () Bool)

(declare-fun tp!46044 () Bool)

(declare-fun e!457543 () Bool)

(assert (=> mapNonEmpty!23827 (= mapRes!23827 (and tp!46044 e!457543))))

(declare-fun mapKey!23827 () (_ BitVec 32))

(declare-fun mapRest!23827 () (Array (_ BitVec 32) ValueCell!6989))

(declare-fun mapValue!23827 () ValueCell!6989)

(assert (=> mapNonEmpty!23827 (= (arr!21941 _values!788) (store mapRest!23827 mapKey!23827 mapValue!23827))))

(declare-fun mapIsEmpty!23827 () Bool)

(assert (=> mapIsEmpty!23827 mapRes!23827))

(declare-fun b!822803 () Bool)

(declare-fun res!561188 () Bool)

(assert (=> b!822803 (=> (not res!561188) (not e!457544))))

(assert (=> b!822803 (= res!561188 (and (= (size!22362 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22361 _keys!976) (size!22362 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822804 () Bool)

(declare-fun e!457539 () Bool)

(assert (=> b!822804 (= e!457539 (and e!457540 mapRes!23827))))

(declare-fun condMapEmpty!23827 () Bool)

(declare-fun mapDefault!23827 () ValueCell!6989)

(assert (=> b!822804 (= condMapEmpty!23827 (= (arr!21941 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6989)) mapDefault!23827)))))

(declare-fun b!822800 () Bool)

(assert (=> b!822800 (= e!457543 tp_is_empty!14809)))

(declare-fun res!561191 () Bool)

(assert (=> start!70842 (=> (not res!561191) (not e!457544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70842 (= res!561191 (validMask!0 mask!1312))))

(assert (=> start!70842 e!457544))

(assert (=> start!70842 tp_is_empty!14809))

(declare-fun array_inv!17585 (array!45781) Bool)

(assert (=> start!70842 (array_inv!17585 _keys!976)))

(assert (=> start!70842 true))

(declare-fun array_inv!17586 (array!45783) Bool)

(assert (=> start!70842 (and (array_inv!17586 _values!788) e!457539)))

(assert (=> start!70842 tp!46045))

(assert (= (and start!70842 res!561191) b!822803))

(assert (= (and b!822803 res!561188) b!822799))

(assert (= (and b!822799 res!561192) b!822802))

(assert (= (and b!822802 res!561189) b!822798))

(assert (= (and b!822798 (not res!561190)) b!822801))

(assert (= (and b!822804 condMapEmpty!23827) mapIsEmpty!23827))

(assert (= (and b!822804 (not condMapEmpty!23827)) mapNonEmpty!23827))

(get-info :version)

(assert (= (and mapNonEmpty!23827 ((_ is ValueCellFull!6989) mapValue!23827)) b!822800))

(assert (= (and b!822804 ((_ is ValueCellFull!6989) mapDefault!23827)) b!822797))

(assert (= start!70842 b!822804))

(declare-fun m!764321 () Bool)

(assert (=> b!822798 m!764321))

(declare-fun m!764323 () Bool)

(assert (=> b!822798 m!764323))

(declare-fun m!764325 () Bool)

(assert (=> b!822798 m!764325))

(declare-fun m!764327 () Bool)

(assert (=> b!822801 m!764327))

(declare-fun m!764329 () Bool)

(assert (=> b!822801 m!764329))

(declare-fun m!764331 () Bool)

(assert (=> b!822801 m!764331))

(declare-fun m!764333 () Bool)

(assert (=> b!822801 m!764333))

(declare-fun m!764335 () Bool)

(assert (=> b!822801 m!764335))

(declare-fun m!764337 () Bool)

(assert (=> b!822801 m!764337))

(assert (=> b!822801 m!764329))

(declare-fun m!764339 () Bool)

(assert (=> b!822801 m!764339))

(declare-fun m!764341 () Bool)

(assert (=> b!822802 m!764341))

(declare-fun m!764343 () Bool)

(assert (=> mapNonEmpty!23827 m!764343))

(declare-fun m!764345 () Bool)

(assert (=> start!70842 m!764345))

(declare-fun m!764347 () Bool)

(assert (=> start!70842 m!764347))

(declare-fun m!764349 () Bool)

(assert (=> start!70842 m!764349))

(declare-fun m!764351 () Bool)

(assert (=> b!822799 m!764351))

(check-sat (not start!70842) b_and!21957 (not b!822802) (not b!822798) (not b!822799) (not b_next!13099) (not b!822801) tp_is_empty!14809 (not mapNonEmpty!23827))
(check-sat b_and!21957 (not b_next!13099))
