; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70866 () Bool)

(assert start!70866)

(declare-fun b_free!13123 () Bool)

(declare-fun b_next!13123 () Bool)

(assert (=> start!70866 (= b_free!13123 (not b_next!13123))))

(declare-fun tp!46117 () Bool)

(declare-fun b_and!21981 () Bool)

(assert (=> start!70866 (= tp!46117 b_and!21981)))

(declare-fun res!561370 () Bool)

(declare-fun e!457757 () Bool)

(assert (=> start!70866 (=> (not res!561370) (not e!457757))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70866 (= res!561370 (validMask!0 mask!1312))))

(assert (=> start!70866 e!457757))

(declare-fun tp_is_empty!14833 () Bool)

(assert (=> start!70866 tp_is_empty!14833))

(declare-datatypes ((array!45825 0))(
  ( (array!45826 (arr!21962 (Array (_ BitVec 32) (_ BitVec 64))) (size!22383 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45825)

(declare-fun array_inv!17597 (array!45825) Bool)

(assert (=> start!70866 (array_inv!17597 _keys!976)))

(assert (=> start!70866 true))

(declare-datatypes ((V!24779 0))(
  ( (V!24780 (val!7464 Int)) )
))
(declare-datatypes ((ValueCell!7001 0))(
  ( (ValueCellFull!7001 (v!9890 V!24779)) (EmptyCell!7001) )
))
(declare-datatypes ((array!45827 0))(
  ( (array!45828 (arr!21963 (Array (_ BitVec 32) ValueCell!7001)) (size!22384 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45827)

(declare-fun e!457758 () Bool)

(declare-fun array_inv!17598 (array!45827) Bool)

(assert (=> start!70866 (and (array_inv!17598 _values!788) e!457758)))

(assert (=> start!70866 tp!46117))

(declare-fun b!823085 () Bool)

(declare-fun res!561368 () Bool)

(assert (=> b!823085 (=> (not res!561368) (not e!457757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45825 (_ BitVec 32)) Bool)

(assert (=> b!823085 (= res!561368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823086 () Bool)

(declare-fun res!561369 () Bool)

(assert (=> b!823086 (=> (not res!561369) (not e!457757))))

(declare-datatypes ((List!15675 0))(
  ( (Nil!15672) (Cons!15671 (h!16800 (_ BitVec 64)) (t!22005 List!15675)) )
))
(declare-fun arrayNoDuplicates!0 (array!45825 (_ BitVec 32) List!15675) Bool)

(assert (=> b!823086 (= res!561369 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15672))))

(declare-fun mapNonEmpty!23863 () Bool)

(declare-fun mapRes!23863 () Bool)

(declare-fun tp!46116 () Bool)

(declare-fun e!457759 () Bool)

(assert (=> mapNonEmpty!23863 (= mapRes!23863 (and tp!46116 e!457759))))

(declare-fun mapKey!23863 () (_ BitVec 32))

(declare-fun mapValue!23863 () ValueCell!7001)

(declare-fun mapRest!23863 () (Array (_ BitVec 32) ValueCell!7001))

(assert (=> mapNonEmpty!23863 (= (arr!21963 _values!788) (store mapRest!23863 mapKey!23863 mapValue!23863))))

(declare-fun b!823087 () Bool)

(declare-fun e!457755 () Bool)

(assert (=> b!823087 (= e!457755 true)))

(declare-datatypes ((tuple2!9870 0))(
  ( (tuple2!9871 (_1!4946 (_ BitVec 64)) (_2!4946 V!24779)) )
))
(declare-datatypes ((List!15676 0))(
  ( (Nil!15673) (Cons!15672 (h!16801 tuple2!9870) (t!22006 List!15676)) )
))
(declare-datatypes ((ListLongMap!8683 0))(
  ( (ListLongMap!8684 (toList!4357 List!15676)) )
))
(declare-fun lt!370916 () ListLongMap!8683)

(declare-fun lt!370919 () ListLongMap!8683)

(declare-fun lt!370917 () tuple2!9870)

(declare-fun +!1932 (ListLongMap!8683 tuple2!9870) ListLongMap!8683)

(assert (=> b!823087 (= lt!370916 (+!1932 lt!370919 lt!370917))))

(declare-datatypes ((Unit!28136 0))(
  ( (Unit!28137) )
))
(declare-fun lt!370914 () Unit!28136)

(declare-fun lt!370912 () ListLongMap!8683)

(declare-fun zeroValueAfter!34 () V!24779)

(declare-fun minValue!754 () V!24779)

(declare-fun addCommutativeForDiffKeys!463 (ListLongMap!8683 (_ BitVec 64) V!24779 (_ BitVec 64) V!24779) Unit!28136)

(assert (=> b!823087 (= lt!370914 (addCommutativeForDiffKeys!463 lt!370912 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370915 () ListLongMap!8683)

(assert (=> b!823087 (= lt!370915 lt!370916)))

(declare-fun lt!370918 () tuple2!9870)

(assert (=> b!823087 (= lt!370916 (+!1932 (+!1932 lt!370912 lt!370917) lt!370918))))

(assert (=> b!823087 (= lt!370917 (tuple2!9871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370913 () ListLongMap!8683)

(assert (=> b!823087 (= lt!370913 lt!370919)))

(assert (=> b!823087 (= lt!370919 (+!1932 lt!370912 lt!370918))))

(assert (=> b!823087 (= lt!370918 (tuple2!9871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2474 (array!45825 array!45827 (_ BitVec 32) (_ BitVec 32) V!24779 V!24779 (_ BitVec 32) Int) ListLongMap!8683)

(assert (=> b!823087 (= lt!370915 (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24779)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823087 (= lt!370913 (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823088 () Bool)

(declare-fun res!561372 () Bool)

(assert (=> b!823088 (=> (not res!561372) (not e!457757))))

(assert (=> b!823088 (= res!561372 (and (= (size!22384 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22383 _keys!976) (size!22384 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823089 () Bool)

(declare-fun e!457760 () Bool)

(assert (=> b!823089 (= e!457760 tp_is_empty!14833)))

(declare-fun mapIsEmpty!23863 () Bool)

(assert (=> mapIsEmpty!23863 mapRes!23863))

(declare-fun b!823090 () Bool)

(assert (=> b!823090 (= e!457757 (not e!457755))))

(declare-fun res!561371 () Bool)

(assert (=> b!823090 (=> res!561371 e!457755)))

(assert (=> b!823090 (= res!561371 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370910 () ListLongMap!8683)

(assert (=> b!823090 (= lt!370912 lt!370910)))

(declare-fun lt!370911 () Unit!28136)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!494 (array!45825 array!45827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24779 V!24779 V!24779 V!24779 (_ BitVec 32) Int) Unit!28136)

(assert (=> b!823090 (= lt!370911 (lemmaNoChangeToArrayThenSameMapNoExtras!494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2401 (array!45825 array!45827 (_ BitVec 32) (_ BitVec 32) V!24779 V!24779 (_ BitVec 32) Int) ListLongMap!8683)

(assert (=> b!823090 (= lt!370910 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823090 (= lt!370912 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823091 () Bool)

(assert (=> b!823091 (= e!457758 (and e!457760 mapRes!23863))))

(declare-fun condMapEmpty!23863 () Bool)

(declare-fun mapDefault!23863 () ValueCell!7001)

(assert (=> b!823091 (= condMapEmpty!23863 (= (arr!21963 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7001)) mapDefault!23863)))))

(declare-fun b!823092 () Bool)

(assert (=> b!823092 (= e!457759 tp_is_empty!14833)))

(assert (= (and start!70866 res!561370) b!823088))

(assert (= (and b!823088 res!561372) b!823085))

(assert (= (and b!823085 res!561368) b!823086))

(assert (= (and b!823086 res!561369) b!823090))

(assert (= (and b!823090 (not res!561371)) b!823087))

(assert (= (and b!823091 condMapEmpty!23863) mapIsEmpty!23863))

(assert (= (and b!823091 (not condMapEmpty!23863)) mapNonEmpty!23863))

(get-info :version)

(assert (= (and mapNonEmpty!23863 ((_ is ValueCellFull!7001) mapValue!23863)) b!823092))

(assert (= (and b!823091 ((_ is ValueCellFull!7001) mapDefault!23863)) b!823089))

(assert (= start!70866 b!823091))

(declare-fun m!764705 () Bool)

(assert (=> b!823087 m!764705))

(declare-fun m!764707 () Bool)

(assert (=> b!823087 m!764707))

(declare-fun m!764709 () Bool)

(assert (=> b!823087 m!764709))

(declare-fun m!764711 () Bool)

(assert (=> b!823087 m!764711))

(declare-fun m!764713 () Bool)

(assert (=> b!823087 m!764713))

(assert (=> b!823087 m!764709))

(declare-fun m!764715 () Bool)

(assert (=> b!823087 m!764715))

(declare-fun m!764717 () Bool)

(assert (=> b!823087 m!764717))

(declare-fun m!764719 () Bool)

(assert (=> b!823086 m!764719))

(declare-fun m!764721 () Bool)

(assert (=> b!823090 m!764721))

(declare-fun m!764723 () Bool)

(assert (=> b!823090 m!764723))

(declare-fun m!764725 () Bool)

(assert (=> b!823090 m!764725))

(declare-fun m!764727 () Bool)

(assert (=> mapNonEmpty!23863 m!764727))

(declare-fun m!764729 () Bool)

(assert (=> start!70866 m!764729))

(declare-fun m!764731 () Bool)

(assert (=> start!70866 m!764731))

(declare-fun m!764733 () Bool)

(assert (=> start!70866 m!764733))

(declare-fun m!764735 () Bool)

(assert (=> b!823085 m!764735))

(check-sat (not b!823085) (not start!70866) (not b!823087) (not b!823086) tp_is_empty!14833 b_and!21981 (not b_next!13123) (not mapNonEmpty!23863) (not b!823090))
(check-sat b_and!21981 (not b_next!13123))
