; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70598 () Bool)

(assert start!70598)

(declare-fun b_free!12775 () Bool)

(declare-fun b_next!12775 () Bool)

(assert (=> start!70598 (= b_free!12775 (not b_next!12775))))

(declare-fun tp!45055 () Bool)

(declare-fun b_and!21605 () Bool)

(assert (=> start!70598 (= tp!45055 b_and!21605)))

(declare-fun b!819009 () Bool)

(declare-fun e!454660 () Bool)

(assert (=> b!819009 (= e!454660 true)))

(declare-datatypes ((V!24315 0))(
  ( (V!24316 (val!7290 Int)) )
))
(declare-datatypes ((tuple2!9494 0))(
  ( (tuple2!9495 (_1!4758 (_ BitVec 64)) (_2!4758 V!24315)) )
))
(declare-datatypes ((List!15304 0))(
  ( (Nil!15301) (Cons!15300 (h!16435 tuple2!9494) (t!21623 List!15304)) )
))
(declare-datatypes ((ListLongMap!8319 0))(
  ( (ListLongMap!8320 (toList!4175 List!15304)) )
))
(declare-fun lt!366920 () ListLongMap!8319)

(declare-fun zeroValueBefore!34 () V!24315)

(declare-datatypes ((array!45169 0))(
  ( (array!45170 (arr!21635 (Array (_ BitVec 32) (_ BitVec 64))) (size!22055 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45169)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24315)

(declare-datatypes ((ValueCell!6827 0))(
  ( (ValueCellFull!6827 (v!9719 V!24315)) (EmptyCell!6827) )
))
(declare-datatypes ((array!45171 0))(
  ( (array!45172 (arr!21636 (Array (_ BitVec 32) ValueCell!6827)) (size!22056 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45171)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2371 (array!45169 array!45171 (_ BitVec 32) (_ BitVec 32) V!24315 V!24315 (_ BitVec 32) Int) ListLongMap!8319)

(assert (=> b!819009 (= lt!366920 (getCurrentListMap!2371 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558710 () Bool)

(declare-fun e!454659 () Bool)

(assert (=> start!70598 (=> (not res!558710) (not e!454659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70598 (= res!558710 (validMask!0 mask!1312))))

(assert (=> start!70598 e!454659))

(declare-fun tp_is_empty!14485 () Bool)

(assert (=> start!70598 tp_is_empty!14485))

(declare-fun array_inv!17329 (array!45169) Bool)

(assert (=> start!70598 (array_inv!17329 _keys!976)))

(assert (=> start!70598 true))

(declare-fun e!454661 () Bool)

(declare-fun array_inv!17330 (array!45171) Bool)

(assert (=> start!70598 (and (array_inv!17330 _values!788) e!454661)))

(assert (=> start!70598 tp!45055))

(declare-fun b!819010 () Bool)

(declare-fun e!454662 () Bool)

(declare-fun mapRes!23323 () Bool)

(assert (=> b!819010 (= e!454661 (and e!454662 mapRes!23323))))

(declare-fun condMapEmpty!23323 () Bool)

(declare-fun mapDefault!23323 () ValueCell!6827)

(assert (=> b!819010 (= condMapEmpty!23323 (= (arr!21636 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6827)) mapDefault!23323)))))

(declare-fun mapIsEmpty!23323 () Bool)

(assert (=> mapIsEmpty!23323 mapRes!23323))

(declare-fun b!819011 () Bool)

(declare-fun e!454658 () Bool)

(assert (=> b!819011 (= e!454658 tp_is_empty!14485)))

(declare-fun b!819012 () Bool)

(declare-fun res!558713 () Bool)

(assert (=> b!819012 (=> (not res!558713) (not e!454659))))

(declare-datatypes ((List!15305 0))(
  ( (Nil!15302) (Cons!15301 (h!16436 (_ BitVec 64)) (t!21624 List!15305)) )
))
(declare-fun arrayNoDuplicates!0 (array!45169 (_ BitVec 32) List!15305) Bool)

(assert (=> b!819012 (= res!558713 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15302))))

(declare-fun b!819013 () Bool)

(assert (=> b!819013 (= e!454659 (not e!454660))))

(declare-fun res!558712 () Bool)

(assert (=> b!819013 (=> res!558712 e!454660)))

(assert (=> b!819013 (= res!558712 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366919 () ListLongMap!8319)

(declare-fun lt!366921 () ListLongMap!8319)

(assert (=> b!819013 (= lt!366919 lt!366921)))

(declare-fun zeroValueAfter!34 () V!24315)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27903 0))(
  ( (Unit!27904) )
))
(declare-fun lt!366922 () Unit!27903)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!361 (array!45169 array!45171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24315 V!24315 V!24315 V!24315 (_ BitVec 32) Int) Unit!27903)

(assert (=> b!819013 (= lt!366922 (lemmaNoChangeToArrayThenSameMapNoExtras!361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2273 (array!45169 array!45171 (_ BitVec 32) (_ BitVec 32) V!24315 V!24315 (_ BitVec 32) Int) ListLongMap!8319)

(assert (=> b!819013 (= lt!366921 (getCurrentListMapNoExtraKeys!2273 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819013 (= lt!366919 (getCurrentListMapNoExtraKeys!2273 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819014 () Bool)

(declare-fun res!558711 () Bool)

(assert (=> b!819014 (=> (not res!558711) (not e!454659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45169 (_ BitVec 32)) Bool)

(assert (=> b!819014 (= res!558711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819015 () Bool)

(declare-fun res!558714 () Bool)

(assert (=> b!819015 (=> (not res!558714) (not e!454659))))

(assert (=> b!819015 (= res!558714 (and (= (size!22056 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22055 _keys!976) (size!22056 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23323 () Bool)

(declare-fun tp!45054 () Bool)

(assert (=> mapNonEmpty!23323 (= mapRes!23323 (and tp!45054 e!454658))))

(declare-fun mapValue!23323 () ValueCell!6827)

(declare-fun mapKey!23323 () (_ BitVec 32))

(declare-fun mapRest!23323 () (Array (_ BitVec 32) ValueCell!6827))

(assert (=> mapNonEmpty!23323 (= (arr!21636 _values!788) (store mapRest!23323 mapKey!23323 mapValue!23323))))

(declare-fun b!819016 () Bool)

(assert (=> b!819016 (= e!454662 tp_is_empty!14485)))

(assert (= (and start!70598 res!558710) b!819015))

(assert (= (and b!819015 res!558714) b!819014))

(assert (= (and b!819014 res!558711) b!819012))

(assert (= (and b!819012 res!558713) b!819013))

(assert (= (and b!819013 (not res!558712)) b!819009))

(assert (= (and b!819010 condMapEmpty!23323) mapIsEmpty!23323))

(assert (= (and b!819010 (not condMapEmpty!23323)) mapNonEmpty!23323))

(get-info :version)

(assert (= (and mapNonEmpty!23323 ((_ is ValueCellFull!6827) mapValue!23323)) b!819011))

(assert (= (and b!819010 ((_ is ValueCellFull!6827) mapDefault!23323)) b!819016))

(assert (= start!70598 b!819010))

(declare-fun m!760867 () Bool)

(assert (=> b!819013 m!760867))

(declare-fun m!760869 () Bool)

(assert (=> b!819013 m!760869))

(declare-fun m!760871 () Bool)

(assert (=> b!819013 m!760871))

(declare-fun m!760873 () Bool)

(assert (=> b!819009 m!760873))

(declare-fun m!760875 () Bool)

(assert (=> start!70598 m!760875))

(declare-fun m!760877 () Bool)

(assert (=> start!70598 m!760877))

(declare-fun m!760879 () Bool)

(assert (=> start!70598 m!760879))

(declare-fun m!760881 () Bool)

(assert (=> b!819014 m!760881))

(declare-fun m!760883 () Bool)

(assert (=> mapNonEmpty!23323 m!760883))

(declare-fun m!760885 () Bool)

(assert (=> b!819012 m!760885))

(check-sat (not b!819014) tp_is_empty!14485 (not b_next!12775) (not b!819013) (not b!819009) (not b!819012) b_and!21605 (not start!70598) (not mapNonEmpty!23323))
(check-sat b_and!21605 (not b_next!12775))
