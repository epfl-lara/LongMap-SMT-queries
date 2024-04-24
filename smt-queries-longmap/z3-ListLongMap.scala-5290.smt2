; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71096 () Bool)

(assert start!71096)

(declare-fun b_free!13147 () Bool)

(declare-fun b_next!13147 () Bool)

(assert (=> start!71096 (= b_free!13147 (not b_next!13147))))

(declare-fun tp!46191 () Bool)

(declare-fun b_and!22053 () Bool)

(assert (=> start!71096 (= tp!46191 b_and!22053)))

(declare-fun b!824674 () Bool)

(declare-fun e!458794 () Bool)

(declare-fun tp_is_empty!14857 () Bool)

(assert (=> b!824674 (= e!458794 tp_is_empty!14857)))

(declare-fun b!824675 () Bool)

(declare-fun res!562062 () Bool)

(declare-fun e!458795 () Bool)

(assert (=> b!824675 (=> (not res!562062) (not e!458795))))

(declare-datatypes ((array!45909 0))(
  ( (array!45910 (arr!21998 (Array (_ BitVec 32) (_ BitVec 64))) (size!22418 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45909)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45909 (_ BitVec 32)) Bool)

(assert (=> b!824675 (= res!562062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824676 () Bool)

(declare-fun e!458792 () Bool)

(assert (=> b!824676 (= e!458792 tp_is_empty!14857)))

(declare-fun mapNonEmpty!23902 () Bool)

(declare-fun mapRes!23902 () Bool)

(declare-fun tp!46192 () Bool)

(assert (=> mapNonEmpty!23902 (= mapRes!23902 (and tp!46192 e!458792))))

(declare-fun mapKey!23902 () (_ BitVec 32))

(declare-datatypes ((V!24811 0))(
  ( (V!24812 (val!7476 Int)) )
))
(declare-datatypes ((ValueCell!7013 0))(
  ( (ValueCellFull!7013 (v!9909 V!24811)) (EmptyCell!7013) )
))
(declare-datatypes ((array!45911 0))(
  ( (array!45912 (arr!21999 (Array (_ BitVec 32) ValueCell!7013)) (size!22419 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45911)

(declare-fun mapRest!23902 () (Array (_ BitVec 32) ValueCell!7013))

(declare-fun mapValue!23902 () ValueCell!7013)

(assert (=> mapNonEmpty!23902 (= (arr!21999 _values!788) (store mapRest!23902 mapKey!23902 mapValue!23902))))

(declare-fun res!562061 () Bool)

(assert (=> start!71096 (=> (not res!562061) (not e!458795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71096 (= res!562061 (validMask!0 mask!1312))))

(assert (=> start!71096 e!458795))

(assert (=> start!71096 tp_is_empty!14857))

(declare-fun array_inv!17595 (array!45909) Bool)

(assert (=> start!71096 (array_inv!17595 _keys!976)))

(assert (=> start!71096 true))

(declare-fun e!458796 () Bool)

(declare-fun array_inv!17596 (array!45911) Bool)

(assert (=> start!71096 (and (array_inv!17596 _values!788) e!458796)))

(assert (=> start!71096 tp!46191))

(declare-fun b!824677 () Bool)

(declare-fun res!562060 () Bool)

(assert (=> b!824677 (=> (not res!562060) (not e!458795))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824677 (= res!562060 (and (= (size!22419 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22418 _keys!976) (size!22419 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23902 () Bool)

(assert (=> mapIsEmpty!23902 mapRes!23902))

(declare-fun b!824678 () Bool)

(assert (=> b!824678 (= e!458795 (not true))))

(declare-datatypes ((tuple2!9804 0))(
  ( (tuple2!9805 (_1!4913 (_ BitVec 64)) (_2!4913 V!24811)) )
))
(declare-datatypes ((List!15590 0))(
  ( (Nil!15587) (Cons!15586 (h!16721 tuple2!9804) (t!21923 List!15590)) )
))
(declare-datatypes ((ListLongMap!8629 0))(
  ( (ListLongMap!8630 (toList!4330 List!15590)) )
))
(declare-fun lt!371882 () ListLongMap!8629)

(declare-fun lt!371883 () ListLongMap!8629)

(assert (=> b!824678 (= lt!371882 lt!371883)))

(declare-fun zeroValueBefore!34 () V!24811)

(declare-fun zeroValueAfter!34 () V!24811)

(declare-fun minValue!754 () V!24811)

(declare-datatypes ((Unit!28213 0))(
  ( (Unit!28214) )
))
(declare-fun lt!371884 () Unit!28213)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!501 (array!45909 array!45911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24811 V!24811 V!24811 V!24811 (_ BitVec 32) Int) Unit!28213)

(assert (=> b!824678 (= lt!371884 (lemmaNoChangeToArrayThenSameMapNoExtras!501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2413 (array!45909 array!45911 (_ BitVec 32) (_ BitVec 32) V!24811 V!24811 (_ BitVec 32) Int) ListLongMap!8629)

(assert (=> b!824678 (= lt!371883 (getCurrentListMapNoExtraKeys!2413 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824678 (= lt!371882 (getCurrentListMapNoExtraKeys!2413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824679 () Bool)

(declare-fun res!562059 () Bool)

(assert (=> b!824679 (=> (not res!562059) (not e!458795))))

(declare-datatypes ((List!15591 0))(
  ( (Nil!15588) (Cons!15587 (h!16722 (_ BitVec 64)) (t!21924 List!15591)) )
))
(declare-fun arrayNoDuplicates!0 (array!45909 (_ BitVec 32) List!15591) Bool)

(assert (=> b!824679 (= res!562059 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15588))))

(declare-fun b!824680 () Bool)

(assert (=> b!824680 (= e!458796 (and e!458794 mapRes!23902))))

(declare-fun condMapEmpty!23902 () Bool)

(declare-fun mapDefault!23902 () ValueCell!7013)

(assert (=> b!824680 (= condMapEmpty!23902 (= (arr!21999 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7013)) mapDefault!23902)))))

(assert (= (and start!71096 res!562061) b!824677))

(assert (= (and b!824677 res!562060) b!824675))

(assert (= (and b!824675 res!562062) b!824679))

(assert (= (and b!824679 res!562059) b!824678))

(assert (= (and b!824680 condMapEmpty!23902) mapIsEmpty!23902))

(assert (= (and b!824680 (not condMapEmpty!23902)) mapNonEmpty!23902))

(get-info :version)

(assert (= (and mapNonEmpty!23902 ((_ is ValueCellFull!7013) mapValue!23902)) b!824676))

(assert (= (and b!824680 ((_ is ValueCellFull!7013) mapDefault!23902)) b!824674))

(assert (= start!71096 b!824680))

(declare-fun m!767255 () Bool)

(assert (=> b!824678 m!767255))

(declare-fun m!767257 () Bool)

(assert (=> b!824678 m!767257))

(declare-fun m!767259 () Bool)

(assert (=> b!824678 m!767259))

(declare-fun m!767261 () Bool)

(assert (=> start!71096 m!767261))

(declare-fun m!767263 () Bool)

(assert (=> start!71096 m!767263))

(declare-fun m!767265 () Bool)

(assert (=> start!71096 m!767265))

(declare-fun m!767267 () Bool)

(assert (=> b!824675 m!767267))

(declare-fun m!767269 () Bool)

(assert (=> mapNonEmpty!23902 m!767269))

(declare-fun m!767271 () Bool)

(assert (=> b!824679 m!767271))

(check-sat (not b_next!13147) (not b!824675) (not b!824678) (not b!824679) b_and!22053 (not start!71096) tp_is_empty!14857 (not mapNonEmpty!23902))
(check-sat b_and!22053 (not b_next!13147))
