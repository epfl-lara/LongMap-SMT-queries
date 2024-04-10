; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70808 () Bool)

(assert start!70808)

(declare-fun b_free!13065 () Bool)

(declare-fun b_next!13065 () Bool)

(assert (=> start!70808 (= b_free!13065 (not b_next!13065))))

(declare-fun tp!45940 () Bool)

(declare-fun b_and!21937 () Bool)

(assert (=> start!70808 (= tp!45940 b_and!21937)))

(declare-fun mapIsEmpty!23773 () Bool)

(declare-fun mapRes!23773 () Bool)

(assert (=> mapIsEmpty!23773 mapRes!23773))

(declare-fun res!560961 () Bool)

(declare-fun e!457270 () Bool)

(assert (=> start!70808 (=> (not res!560961) (not e!457270))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70808 (= res!560961 (validMask!0 mask!1312))))

(assert (=> start!70808 e!457270))

(declare-fun tp_is_empty!14775 () Bool)

(assert (=> start!70808 tp_is_empty!14775))

(declare-datatypes ((array!45742 0))(
  ( (array!45743 (arr!21921 (Array (_ BitVec 32) (_ BitVec 64))) (size!22342 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45742)

(declare-fun array_inv!17509 (array!45742) Bool)

(assert (=> start!70808 (array_inv!17509 _keys!976)))

(assert (=> start!70808 true))

(declare-datatypes ((V!24701 0))(
  ( (V!24702 (val!7435 Int)) )
))
(declare-datatypes ((ValueCell!6972 0))(
  ( (ValueCellFull!6972 (v!9866 V!24701)) (EmptyCell!6972) )
))
(declare-datatypes ((array!45744 0))(
  ( (array!45745 (arr!21922 (Array (_ BitVec 32) ValueCell!6972)) (size!22343 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45744)

(declare-fun e!457275 () Bool)

(declare-fun array_inv!17510 (array!45744) Bool)

(assert (=> start!70808 (and (array_inv!17510 _values!788) e!457275)))

(assert (=> start!70808 tp!45940))

(declare-fun mapNonEmpty!23773 () Bool)

(declare-fun tp!45939 () Bool)

(declare-fun e!457273 () Bool)

(assert (=> mapNonEmpty!23773 (= mapRes!23773 (and tp!45939 e!457273))))

(declare-fun mapKey!23773 () (_ BitVec 32))

(declare-fun mapValue!23773 () ValueCell!6972)

(declare-fun mapRest!23773 () (Array (_ BitVec 32) ValueCell!6972))

(assert (=> mapNonEmpty!23773 (= (arr!21922 _values!788) (store mapRest!23773 mapKey!23773 mapValue!23773))))

(declare-fun b!822454 () Bool)

(assert (=> b!822454 (= e!457273 tp_is_empty!14775)))

(declare-fun b!822455 () Bool)

(declare-fun e!457274 () Bool)

(assert (=> b!822455 (= e!457270 (not e!457274))))

(declare-fun res!560962 () Bool)

(assert (=> b!822455 (=> res!560962 e!457274)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822455 (= res!560962 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9820 0))(
  ( (tuple2!9821 (_1!4921 (_ BitVec 64)) (_2!4921 V!24701)) )
))
(declare-datatypes ((List!15635 0))(
  ( (Nil!15632) (Cons!15631 (h!16760 tuple2!9820) (t!21972 List!15635)) )
))
(declare-datatypes ((ListLongMap!8643 0))(
  ( (ListLongMap!8644 (toList!4337 List!15635)) )
))
(declare-fun lt!370131 () ListLongMap!8643)

(declare-fun lt!370133 () ListLongMap!8643)

(assert (=> b!822455 (= lt!370131 lt!370133)))

(declare-fun zeroValueBefore!34 () V!24701)

(declare-fun zeroValueAfter!34 () V!24701)

(declare-fun minValue!754 () V!24701)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28138 0))(
  ( (Unit!28139) )
))
(declare-fun lt!370130 () Unit!28138)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!466 (array!45742 array!45744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24701 V!24701 V!24701 V!24701 (_ BitVec 32) Int) Unit!28138)

(assert (=> b!822455 (= lt!370130 (lemmaNoChangeToArrayThenSameMapNoExtras!466 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2356 (array!45742 array!45744 (_ BitVec 32) (_ BitVec 32) V!24701 V!24701 (_ BitVec 32) Int) ListLongMap!8643)

(assert (=> b!822455 (= lt!370133 (getCurrentListMapNoExtraKeys!2356 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822455 (= lt!370131 (getCurrentListMapNoExtraKeys!2356 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822456 () Bool)

(declare-fun e!457271 () Bool)

(assert (=> b!822456 (= e!457275 (and e!457271 mapRes!23773))))

(declare-fun condMapEmpty!23773 () Bool)

(declare-fun mapDefault!23773 () ValueCell!6972)

(assert (=> b!822456 (= condMapEmpty!23773 (= (arr!21922 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6972)) mapDefault!23773)))))

(declare-fun b!822457 () Bool)

(assert (=> b!822457 (= e!457274 true)))

(declare-fun lt!370134 () ListLongMap!8643)

(declare-fun lt!370136 () ListLongMap!8643)

(declare-fun lt!370132 () tuple2!9820)

(declare-fun +!1887 (ListLongMap!8643 tuple2!9820) ListLongMap!8643)

(assert (=> b!822457 (= lt!370134 (+!1887 lt!370136 lt!370132))))

(declare-fun lt!370135 () Unit!28138)

(declare-fun addCommutativeForDiffKeys!450 (ListLongMap!8643 (_ BitVec 64) V!24701 (_ BitVec 64) V!24701) Unit!28138)

(assert (=> b!822457 (= lt!370135 (addCommutativeForDiffKeys!450 lt!370131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370129 () ListLongMap!8643)

(assert (=> b!822457 (= lt!370129 lt!370134)))

(declare-fun lt!370128 () tuple2!9820)

(assert (=> b!822457 (= lt!370134 (+!1887 (+!1887 lt!370131 lt!370132) lt!370128))))

(assert (=> b!822457 (= lt!370132 (tuple2!9821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370137 () ListLongMap!8643)

(assert (=> b!822457 (= lt!370137 lt!370136)))

(assert (=> b!822457 (= lt!370136 (+!1887 lt!370131 lt!370128))))

(assert (=> b!822457 (= lt!370128 (tuple2!9821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2501 (array!45742 array!45744 (_ BitVec 32) (_ BitVec 32) V!24701 V!24701 (_ BitVec 32) Int) ListLongMap!8643)

(assert (=> b!822457 (= lt!370129 (getCurrentListMap!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822457 (= lt!370137 (getCurrentListMap!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822458 () Bool)

(declare-fun res!560960 () Bool)

(assert (=> b!822458 (=> (not res!560960) (not e!457270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45742 (_ BitVec 32)) Bool)

(assert (=> b!822458 (= res!560960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822459 () Bool)

(declare-fun res!560964 () Bool)

(assert (=> b!822459 (=> (not res!560964) (not e!457270))))

(assert (=> b!822459 (= res!560964 (and (= (size!22343 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22342 _keys!976) (size!22343 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822460 () Bool)

(declare-fun res!560963 () Bool)

(assert (=> b!822460 (=> (not res!560963) (not e!457270))))

(declare-datatypes ((List!15636 0))(
  ( (Nil!15633) (Cons!15632 (h!16761 (_ BitVec 64)) (t!21973 List!15636)) )
))
(declare-fun arrayNoDuplicates!0 (array!45742 (_ BitVec 32) List!15636) Bool)

(assert (=> b!822460 (= res!560963 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15633))))

(declare-fun b!822461 () Bool)

(assert (=> b!822461 (= e!457271 tp_is_empty!14775)))

(assert (= (and start!70808 res!560961) b!822459))

(assert (= (and b!822459 res!560964) b!822458))

(assert (= (and b!822458 res!560960) b!822460))

(assert (= (and b!822460 res!560963) b!822455))

(assert (= (and b!822455 (not res!560962)) b!822457))

(assert (= (and b!822456 condMapEmpty!23773) mapIsEmpty!23773))

(assert (= (and b!822456 (not condMapEmpty!23773)) mapNonEmpty!23773))

(get-info :version)

(assert (= (and mapNonEmpty!23773 ((_ is ValueCellFull!6972) mapValue!23773)) b!822454))

(assert (= (and b!822456 ((_ is ValueCellFull!6972) mapDefault!23773)) b!822461))

(assert (= start!70808 b!822456))

(declare-fun m!764313 () Bool)

(assert (=> mapNonEmpty!23773 m!764313))

(declare-fun m!764315 () Bool)

(assert (=> b!822460 m!764315))

(declare-fun m!764317 () Bool)

(assert (=> start!70808 m!764317))

(declare-fun m!764319 () Bool)

(assert (=> start!70808 m!764319))

(declare-fun m!764321 () Bool)

(assert (=> start!70808 m!764321))

(declare-fun m!764323 () Bool)

(assert (=> b!822455 m!764323))

(declare-fun m!764325 () Bool)

(assert (=> b!822455 m!764325))

(declare-fun m!764327 () Bool)

(assert (=> b!822455 m!764327))

(declare-fun m!764329 () Bool)

(assert (=> b!822457 m!764329))

(declare-fun m!764331 () Bool)

(assert (=> b!822457 m!764331))

(declare-fun m!764333 () Bool)

(assert (=> b!822457 m!764333))

(declare-fun m!764335 () Bool)

(assert (=> b!822457 m!764335))

(declare-fun m!764337 () Bool)

(assert (=> b!822457 m!764337))

(assert (=> b!822457 m!764335))

(declare-fun m!764339 () Bool)

(assert (=> b!822457 m!764339))

(declare-fun m!764341 () Bool)

(assert (=> b!822457 m!764341))

(declare-fun m!764343 () Bool)

(assert (=> b!822458 m!764343))

(check-sat tp_is_empty!14775 (not mapNonEmpty!23773) (not b!822455) (not b!822457) (not start!70808) (not b_next!13065) (not b!822458) (not b!822460) b_and!21937)
(check-sat b_and!21937 (not b_next!13065))
