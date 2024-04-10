; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70802 () Bool)

(assert start!70802)

(declare-fun b_free!13059 () Bool)

(declare-fun b_next!13059 () Bool)

(assert (=> start!70802 (= b_free!13059 (not b_next!13059))))

(declare-fun tp!45921 () Bool)

(declare-fun b_and!21931 () Bool)

(assert (=> start!70802 (= tp!45921 b_and!21931)))

(declare-fun b!822382 () Bool)

(declare-fun res!560916 () Bool)

(declare-fun e!457219 () Bool)

(assert (=> b!822382 (=> (not res!560916) (not e!457219))))

(declare-datatypes ((array!45730 0))(
  ( (array!45731 (arr!21915 (Array (_ BitVec 32) (_ BitVec 64))) (size!22336 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45730)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45730 (_ BitVec 32)) Bool)

(assert (=> b!822382 (= res!560916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822383 () Bool)

(declare-fun e!457217 () Bool)

(declare-fun e!457218 () Bool)

(declare-fun mapRes!23764 () Bool)

(assert (=> b!822383 (= e!457217 (and e!457218 mapRes!23764))))

(declare-fun condMapEmpty!23764 () Bool)

(declare-datatypes ((V!24693 0))(
  ( (V!24694 (val!7432 Int)) )
))
(declare-datatypes ((ValueCell!6969 0))(
  ( (ValueCellFull!6969 (v!9863 V!24693)) (EmptyCell!6969) )
))
(declare-datatypes ((array!45732 0))(
  ( (array!45733 (arr!21916 (Array (_ BitVec 32) ValueCell!6969)) (size!22337 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45732)

(declare-fun mapDefault!23764 () ValueCell!6969)

(assert (=> b!822383 (= condMapEmpty!23764 (= (arr!21916 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6969)) mapDefault!23764)))))

(declare-fun b!822384 () Bool)

(declare-fun e!457216 () Bool)

(assert (=> b!822384 (= e!457216 true)))

(declare-datatypes ((tuple2!9814 0))(
  ( (tuple2!9815 (_1!4918 (_ BitVec 64)) (_2!4918 V!24693)) )
))
(declare-datatypes ((List!15629 0))(
  ( (Nil!15626) (Cons!15625 (h!16754 tuple2!9814) (t!21966 List!15629)) )
))
(declare-datatypes ((ListLongMap!8637 0))(
  ( (ListLongMap!8638 (toList!4334 List!15629)) )
))
(declare-fun lt!370044 () ListLongMap!8637)

(declare-fun lt!370038 () ListLongMap!8637)

(declare-fun lt!370046 () tuple2!9814)

(declare-fun +!1884 (ListLongMap!8637 tuple2!9814) ListLongMap!8637)

(assert (=> b!822384 (= lt!370044 (+!1884 lt!370038 lt!370046))))

(declare-fun lt!370045 () ListLongMap!8637)

(declare-fun zeroValueAfter!34 () V!24693)

(declare-fun minValue!754 () V!24693)

(declare-datatypes ((Unit!28132 0))(
  ( (Unit!28133) )
))
(declare-fun lt!370047 () Unit!28132)

(declare-fun addCommutativeForDiffKeys!447 (ListLongMap!8637 (_ BitVec 64) V!24693 (_ BitVec 64) V!24693) Unit!28132)

(assert (=> b!822384 (= lt!370047 (addCommutativeForDiffKeys!447 lt!370045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370039 () ListLongMap!8637)

(assert (=> b!822384 (= lt!370039 lt!370044)))

(declare-fun lt!370042 () tuple2!9814)

(assert (=> b!822384 (= lt!370044 (+!1884 (+!1884 lt!370045 lt!370046) lt!370042))))

(assert (=> b!822384 (= lt!370046 (tuple2!9815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370040 () ListLongMap!8637)

(assert (=> b!822384 (= lt!370040 lt!370038)))

(assert (=> b!822384 (= lt!370038 (+!1884 lt!370045 lt!370042))))

(assert (=> b!822384 (= lt!370042 (tuple2!9815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2498 (array!45730 array!45732 (_ BitVec 32) (_ BitVec 32) V!24693 V!24693 (_ BitVec 32) Int) ListLongMap!8637)

(assert (=> b!822384 (= lt!370039 (getCurrentListMap!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24693)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822384 (= lt!370040 (getCurrentListMap!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822385 () Bool)

(declare-fun tp_is_empty!14769 () Bool)

(assert (=> b!822385 (= e!457218 tp_is_empty!14769)))

(declare-fun mapIsEmpty!23764 () Bool)

(assert (=> mapIsEmpty!23764 mapRes!23764))

(declare-fun b!822386 () Bool)

(declare-fun res!560917 () Bool)

(assert (=> b!822386 (=> (not res!560917) (not e!457219))))

(assert (=> b!822386 (= res!560917 (and (= (size!22337 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22336 _keys!976) (size!22337 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560918 () Bool)

(assert (=> start!70802 (=> (not res!560918) (not e!457219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70802 (= res!560918 (validMask!0 mask!1312))))

(assert (=> start!70802 e!457219))

(assert (=> start!70802 tp_is_empty!14769))

(declare-fun array_inv!17503 (array!45730) Bool)

(assert (=> start!70802 (array_inv!17503 _keys!976)))

(assert (=> start!70802 true))

(declare-fun array_inv!17504 (array!45732) Bool)

(assert (=> start!70802 (and (array_inv!17504 _values!788) e!457217)))

(assert (=> start!70802 tp!45921))

(declare-fun b!822387 () Bool)

(declare-fun e!457221 () Bool)

(assert (=> b!822387 (= e!457221 tp_is_empty!14769)))

(declare-fun mapNonEmpty!23764 () Bool)

(declare-fun tp!45922 () Bool)

(assert (=> mapNonEmpty!23764 (= mapRes!23764 (and tp!45922 e!457221))))

(declare-fun mapRest!23764 () (Array (_ BitVec 32) ValueCell!6969))

(declare-fun mapKey!23764 () (_ BitVec 32))

(declare-fun mapValue!23764 () ValueCell!6969)

(assert (=> mapNonEmpty!23764 (= (arr!21916 _values!788) (store mapRest!23764 mapKey!23764 mapValue!23764))))

(declare-fun b!822388 () Bool)

(declare-fun res!560915 () Bool)

(assert (=> b!822388 (=> (not res!560915) (not e!457219))))

(declare-datatypes ((List!15630 0))(
  ( (Nil!15627) (Cons!15626 (h!16755 (_ BitVec 64)) (t!21967 List!15630)) )
))
(declare-fun arrayNoDuplicates!0 (array!45730 (_ BitVec 32) List!15630) Bool)

(assert (=> b!822388 (= res!560915 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15627))))

(declare-fun b!822389 () Bool)

(assert (=> b!822389 (= e!457219 (not e!457216))))

(declare-fun res!560919 () Bool)

(assert (=> b!822389 (=> res!560919 e!457216)))

(assert (=> b!822389 (= res!560919 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370043 () ListLongMap!8637)

(assert (=> b!822389 (= lt!370045 lt!370043)))

(declare-fun lt!370041 () Unit!28132)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!463 (array!45730 array!45732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24693 V!24693 V!24693 V!24693 (_ BitVec 32) Int) Unit!28132)

(assert (=> b!822389 (= lt!370041 (lemmaNoChangeToArrayThenSameMapNoExtras!463 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2353 (array!45730 array!45732 (_ BitVec 32) (_ BitVec 32) V!24693 V!24693 (_ BitVec 32) Int) ListLongMap!8637)

(assert (=> b!822389 (= lt!370043 (getCurrentListMapNoExtraKeys!2353 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822389 (= lt!370045 (getCurrentListMapNoExtraKeys!2353 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70802 res!560918) b!822386))

(assert (= (and b!822386 res!560917) b!822382))

(assert (= (and b!822382 res!560916) b!822388))

(assert (= (and b!822388 res!560915) b!822389))

(assert (= (and b!822389 (not res!560919)) b!822384))

(assert (= (and b!822383 condMapEmpty!23764) mapIsEmpty!23764))

(assert (= (and b!822383 (not condMapEmpty!23764)) mapNonEmpty!23764))

(get-info :version)

(assert (= (and mapNonEmpty!23764 ((_ is ValueCellFull!6969) mapValue!23764)) b!822387))

(assert (= (and b!822383 ((_ is ValueCellFull!6969) mapDefault!23764)) b!822385))

(assert (= start!70802 b!822383))

(declare-fun m!764217 () Bool)

(assert (=> mapNonEmpty!23764 m!764217))

(declare-fun m!764219 () Bool)

(assert (=> b!822384 m!764219))

(declare-fun m!764221 () Bool)

(assert (=> b!822384 m!764221))

(declare-fun m!764223 () Bool)

(assert (=> b!822384 m!764223))

(declare-fun m!764225 () Bool)

(assert (=> b!822384 m!764225))

(declare-fun m!764227 () Bool)

(assert (=> b!822384 m!764227))

(declare-fun m!764229 () Bool)

(assert (=> b!822384 m!764229))

(declare-fun m!764231 () Bool)

(assert (=> b!822384 m!764231))

(assert (=> b!822384 m!764227))

(declare-fun m!764233 () Bool)

(assert (=> b!822389 m!764233))

(declare-fun m!764235 () Bool)

(assert (=> b!822389 m!764235))

(declare-fun m!764237 () Bool)

(assert (=> b!822389 m!764237))

(declare-fun m!764239 () Bool)

(assert (=> b!822382 m!764239))

(declare-fun m!764241 () Bool)

(assert (=> start!70802 m!764241))

(declare-fun m!764243 () Bool)

(assert (=> start!70802 m!764243))

(declare-fun m!764245 () Bool)

(assert (=> start!70802 m!764245))

(declare-fun m!764247 () Bool)

(assert (=> b!822388 m!764247))

(check-sat (not b!822384) (not b!822388) (not start!70802) tp_is_empty!14769 (not b!822389) b_and!21931 (not mapNonEmpty!23764) (not b_next!13059) (not b!822382))
(check-sat b_and!21931 (not b_next!13059))
