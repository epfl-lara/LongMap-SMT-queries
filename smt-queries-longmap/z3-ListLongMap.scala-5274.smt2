; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70796 () Bool)

(assert start!70796)

(declare-fun b_free!13053 () Bool)

(declare-fun b_next!13053 () Bool)

(assert (=> start!70796 (= b_free!13053 (not b_next!13053))))

(declare-fun tp!45903 () Bool)

(declare-fun b_and!21925 () Bool)

(assert (=> start!70796 (= tp!45903 b_and!21925)))

(declare-fun b!822310 () Bool)

(declare-fun e!457166 () Bool)

(assert (=> b!822310 (= e!457166 true)))

(declare-datatypes ((V!24685 0))(
  ( (V!24686 (val!7429 Int)) )
))
(declare-datatypes ((tuple2!9808 0))(
  ( (tuple2!9809 (_1!4915 (_ BitVec 64)) (_2!4915 V!24685)) )
))
(declare-datatypes ((List!15624 0))(
  ( (Nil!15621) (Cons!15620 (h!16749 tuple2!9808) (t!21961 List!15624)) )
))
(declare-datatypes ((ListLongMap!8631 0))(
  ( (ListLongMap!8632 (toList!4331 List!15624)) )
))
(declare-fun lt!369957 () ListLongMap!8631)

(declare-fun lt!369953 () ListLongMap!8631)

(declare-fun lt!369954 () tuple2!9808)

(declare-fun +!1882 (ListLongMap!8631 tuple2!9808) ListLongMap!8631)

(assert (=> b!822310 (= lt!369957 (+!1882 lt!369953 lt!369954))))

(declare-fun lt!369955 () ListLongMap!8631)

(declare-fun zeroValueAfter!34 () V!24685)

(declare-fun minValue!754 () V!24685)

(declare-datatypes ((Unit!28126 0))(
  ( (Unit!28127) )
))
(declare-fun lt!369949 () Unit!28126)

(declare-fun addCommutativeForDiffKeys!445 (ListLongMap!8631 (_ BitVec 64) V!24685 (_ BitVec 64) V!24685) Unit!28126)

(assert (=> b!822310 (= lt!369949 (addCommutativeForDiffKeys!445 lt!369955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369952 () ListLongMap!8631)

(assert (=> b!822310 (= lt!369952 lt!369957)))

(declare-fun lt!369956 () tuple2!9808)

(assert (=> b!822310 (= lt!369957 (+!1882 (+!1882 lt!369955 lt!369954) lt!369956))))

(assert (=> b!822310 (= lt!369954 (tuple2!9809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369950 () ListLongMap!8631)

(assert (=> b!822310 (= lt!369950 lt!369953)))

(assert (=> b!822310 (= lt!369953 (+!1882 lt!369955 lt!369956))))

(assert (=> b!822310 (= lt!369956 (tuple2!9809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45718 0))(
  ( (array!45719 (arr!21909 (Array (_ BitVec 32) (_ BitVec 64))) (size!22330 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45718)

(declare-datatypes ((ValueCell!6966 0))(
  ( (ValueCellFull!6966 (v!9860 V!24685)) (EmptyCell!6966) )
))
(declare-datatypes ((array!45720 0))(
  ( (array!45721 (arr!21910 (Array (_ BitVec 32) ValueCell!6966)) (size!22331 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45720)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2496 (array!45718 array!45720 (_ BitVec 32) (_ BitVec 32) V!24685 V!24685 (_ BitVec 32) Int) ListLongMap!8631)

(assert (=> b!822310 (= lt!369952 (getCurrentListMap!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24685)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822310 (= lt!369950 (getCurrentListMap!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560874 () Bool)

(declare-fun e!457162 () Bool)

(assert (=> start!70796 (=> (not res!560874) (not e!457162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70796 (= res!560874 (validMask!0 mask!1312))))

(assert (=> start!70796 e!457162))

(declare-fun tp_is_empty!14763 () Bool)

(assert (=> start!70796 tp_is_empty!14763))

(declare-fun array_inv!17501 (array!45718) Bool)

(assert (=> start!70796 (array_inv!17501 _keys!976)))

(assert (=> start!70796 true))

(declare-fun e!457165 () Bool)

(declare-fun array_inv!17502 (array!45720) Bool)

(assert (=> start!70796 (and (array_inv!17502 _values!788) e!457165)))

(assert (=> start!70796 tp!45903))

(declare-fun mapNonEmpty!23755 () Bool)

(declare-fun mapRes!23755 () Bool)

(declare-fun tp!45904 () Bool)

(declare-fun e!457167 () Bool)

(assert (=> mapNonEmpty!23755 (= mapRes!23755 (and tp!45904 e!457167))))

(declare-fun mapValue!23755 () ValueCell!6966)

(declare-fun mapKey!23755 () (_ BitVec 32))

(declare-fun mapRest!23755 () (Array (_ BitVec 32) ValueCell!6966))

(assert (=> mapNonEmpty!23755 (= (arr!21910 _values!788) (store mapRest!23755 mapKey!23755 mapValue!23755))))

(declare-fun b!822311 () Bool)

(declare-fun e!457163 () Bool)

(assert (=> b!822311 (= e!457163 tp_is_empty!14763)))

(declare-fun b!822312 () Bool)

(declare-fun res!560872 () Bool)

(assert (=> b!822312 (=> (not res!560872) (not e!457162))))

(assert (=> b!822312 (= res!560872 (and (= (size!22331 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22330 _keys!976) (size!22331 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822313 () Bool)

(declare-fun res!560871 () Bool)

(assert (=> b!822313 (=> (not res!560871) (not e!457162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45718 (_ BitVec 32)) Bool)

(assert (=> b!822313 (= res!560871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822314 () Bool)

(assert (=> b!822314 (= e!457165 (and e!457163 mapRes!23755))))

(declare-fun condMapEmpty!23755 () Bool)

(declare-fun mapDefault!23755 () ValueCell!6966)

(assert (=> b!822314 (= condMapEmpty!23755 (= (arr!21910 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6966)) mapDefault!23755)))))

(declare-fun b!822315 () Bool)

(assert (=> b!822315 (= e!457167 tp_is_empty!14763)))

(declare-fun mapIsEmpty!23755 () Bool)

(assert (=> mapIsEmpty!23755 mapRes!23755))

(declare-fun b!822316 () Bool)

(assert (=> b!822316 (= e!457162 (not e!457166))))

(declare-fun res!560873 () Bool)

(assert (=> b!822316 (=> res!560873 e!457166)))

(assert (=> b!822316 (= res!560873 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369948 () ListLongMap!8631)

(assert (=> b!822316 (= lt!369955 lt!369948)))

(declare-fun lt!369951 () Unit!28126)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!460 (array!45718 array!45720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24685 V!24685 V!24685 V!24685 (_ BitVec 32) Int) Unit!28126)

(assert (=> b!822316 (= lt!369951 (lemmaNoChangeToArrayThenSameMapNoExtras!460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2350 (array!45718 array!45720 (_ BitVec 32) (_ BitVec 32) V!24685 V!24685 (_ BitVec 32) Int) ListLongMap!8631)

(assert (=> b!822316 (= lt!369948 (getCurrentListMapNoExtraKeys!2350 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822316 (= lt!369955 (getCurrentListMapNoExtraKeys!2350 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822317 () Bool)

(declare-fun res!560870 () Bool)

(assert (=> b!822317 (=> (not res!560870) (not e!457162))))

(declare-datatypes ((List!15625 0))(
  ( (Nil!15622) (Cons!15621 (h!16750 (_ BitVec 64)) (t!21962 List!15625)) )
))
(declare-fun arrayNoDuplicates!0 (array!45718 (_ BitVec 32) List!15625) Bool)

(assert (=> b!822317 (= res!560870 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15622))))

(assert (= (and start!70796 res!560874) b!822312))

(assert (= (and b!822312 res!560872) b!822313))

(assert (= (and b!822313 res!560871) b!822317))

(assert (= (and b!822317 res!560870) b!822316))

(assert (= (and b!822316 (not res!560873)) b!822310))

(assert (= (and b!822314 condMapEmpty!23755) mapIsEmpty!23755))

(assert (= (and b!822314 (not condMapEmpty!23755)) mapNonEmpty!23755))

(get-info :version)

(assert (= (and mapNonEmpty!23755 ((_ is ValueCellFull!6966) mapValue!23755)) b!822315))

(assert (= (and b!822314 ((_ is ValueCellFull!6966) mapDefault!23755)) b!822311))

(assert (= start!70796 b!822314))

(declare-fun m!764121 () Bool)

(assert (=> b!822313 m!764121))

(declare-fun m!764123 () Bool)

(assert (=> b!822317 m!764123))

(declare-fun m!764125 () Bool)

(assert (=> start!70796 m!764125))

(declare-fun m!764127 () Bool)

(assert (=> start!70796 m!764127))

(declare-fun m!764129 () Bool)

(assert (=> start!70796 m!764129))

(declare-fun m!764131 () Bool)

(assert (=> b!822310 m!764131))

(declare-fun m!764133 () Bool)

(assert (=> b!822310 m!764133))

(declare-fun m!764135 () Bool)

(assert (=> b!822310 m!764135))

(declare-fun m!764137 () Bool)

(assert (=> b!822310 m!764137))

(assert (=> b!822310 m!764133))

(declare-fun m!764139 () Bool)

(assert (=> b!822310 m!764139))

(declare-fun m!764141 () Bool)

(assert (=> b!822310 m!764141))

(declare-fun m!764143 () Bool)

(assert (=> b!822310 m!764143))

(declare-fun m!764145 () Bool)

(assert (=> b!822316 m!764145))

(declare-fun m!764147 () Bool)

(assert (=> b!822316 m!764147))

(declare-fun m!764149 () Bool)

(assert (=> b!822316 m!764149))

(declare-fun m!764151 () Bool)

(assert (=> mapNonEmpty!23755 m!764151))

(check-sat (not b!822317) tp_is_empty!14763 (not b_next!13053) b_and!21925 (not mapNonEmpty!23755) (not b!822316) (not b!822313) (not b!822310) (not start!70796))
(check-sat b_and!21925 (not b_next!13053))
