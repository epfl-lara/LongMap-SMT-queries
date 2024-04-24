; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70604 () Bool)

(assert start!70604)

(declare-fun b_free!12781 () Bool)

(declare-fun b_next!12781 () Bool)

(assert (=> start!70604 (= b_free!12781 (not b_next!12781))))

(declare-fun tp!45072 () Bool)

(declare-fun b_and!21611 () Bool)

(assert (=> start!70604 (= tp!45072 b_and!21611)))

(declare-fun mapIsEmpty!23332 () Bool)

(declare-fun mapRes!23332 () Bool)

(assert (=> mapIsEmpty!23332 mapRes!23332))

(declare-fun b!819081 () Bool)

(declare-fun e!454713 () Bool)

(declare-fun e!454716 () Bool)

(assert (=> b!819081 (= e!454713 (not e!454716))))

(declare-fun res!558757 () Bool)

(assert (=> b!819081 (=> res!558757 e!454716)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819081 (= res!558757 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24323 0))(
  ( (V!24324 (val!7293 Int)) )
))
(declare-datatypes ((tuple2!9498 0))(
  ( (tuple2!9499 (_1!4760 (_ BitVec 64)) (_2!4760 V!24323)) )
))
(declare-datatypes ((List!15309 0))(
  ( (Nil!15306) (Cons!15305 (h!16440 tuple2!9498) (t!21628 List!15309)) )
))
(declare-datatypes ((ListLongMap!8323 0))(
  ( (ListLongMap!8324 (toList!4177 List!15309)) )
))
(declare-fun lt!366955 () ListLongMap!8323)

(declare-fun lt!366958 () ListLongMap!8323)

(assert (=> b!819081 (= lt!366955 lt!366958)))

(declare-datatypes ((Unit!27907 0))(
  ( (Unit!27908) )
))
(declare-fun lt!366956 () Unit!27907)

(declare-fun zeroValueBefore!34 () V!24323)

(declare-datatypes ((array!45181 0))(
  ( (array!45182 (arr!21641 (Array (_ BitVec 32) (_ BitVec 64))) (size!22061 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45181)

(declare-fun zeroValueAfter!34 () V!24323)

(declare-fun minValue!754 () V!24323)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6830 0))(
  ( (ValueCellFull!6830 (v!9722 V!24323)) (EmptyCell!6830) )
))
(declare-datatypes ((array!45183 0))(
  ( (array!45184 (arr!21642 (Array (_ BitVec 32) ValueCell!6830)) (size!22062 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45183)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!363 (array!45181 array!45183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 V!24323 V!24323 (_ BitVec 32) Int) Unit!27907)

(assert (=> b!819081 (= lt!366956 (lemmaNoChangeToArrayThenSameMapNoExtras!363 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2275 (array!45181 array!45183 (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 (_ BitVec 32) Int) ListLongMap!8323)

(assert (=> b!819081 (= lt!366958 (getCurrentListMapNoExtraKeys!2275 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819081 (= lt!366955 (getCurrentListMapNoExtraKeys!2275 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819082 () Bool)

(declare-fun res!558759 () Bool)

(assert (=> b!819082 (=> (not res!558759) (not e!454713))))

(declare-datatypes ((List!15310 0))(
  ( (Nil!15307) (Cons!15306 (h!16441 (_ BitVec 64)) (t!21629 List!15310)) )
))
(declare-fun arrayNoDuplicates!0 (array!45181 (_ BitVec 32) List!15310) Bool)

(assert (=> b!819082 (= res!558759 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15307))))

(declare-fun b!819083 () Bool)

(declare-fun e!454714 () Bool)

(declare-fun tp_is_empty!14491 () Bool)

(assert (=> b!819083 (= e!454714 tp_is_empty!14491)))

(declare-fun b!819084 () Bool)

(assert (=> b!819084 (= e!454716 true)))

(declare-fun lt!366957 () ListLongMap!8323)

(declare-fun getCurrentListMap!2373 (array!45181 array!45183 (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 (_ BitVec 32) Int) ListLongMap!8323)

(assert (=> b!819084 (= lt!366957 (getCurrentListMap!2373 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819085 () Bool)

(declare-fun e!454715 () Bool)

(declare-fun e!454711 () Bool)

(assert (=> b!819085 (= e!454715 (and e!454711 mapRes!23332))))

(declare-fun condMapEmpty!23332 () Bool)

(declare-fun mapDefault!23332 () ValueCell!6830)

(assert (=> b!819085 (= condMapEmpty!23332 (= (arr!21642 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6830)) mapDefault!23332)))))

(declare-fun res!558758 () Bool)

(assert (=> start!70604 (=> (not res!558758) (not e!454713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70604 (= res!558758 (validMask!0 mask!1312))))

(assert (=> start!70604 e!454713))

(assert (=> start!70604 tp_is_empty!14491))

(declare-fun array_inv!17335 (array!45181) Bool)

(assert (=> start!70604 (array_inv!17335 _keys!976)))

(assert (=> start!70604 true))

(declare-fun array_inv!17336 (array!45183) Bool)

(assert (=> start!70604 (and (array_inv!17336 _values!788) e!454715)))

(assert (=> start!70604 tp!45072))

(declare-fun mapNonEmpty!23332 () Bool)

(declare-fun tp!45073 () Bool)

(assert (=> mapNonEmpty!23332 (= mapRes!23332 (and tp!45073 e!454714))))

(declare-fun mapRest!23332 () (Array (_ BitVec 32) ValueCell!6830))

(declare-fun mapKey!23332 () (_ BitVec 32))

(declare-fun mapValue!23332 () ValueCell!6830)

(assert (=> mapNonEmpty!23332 (= (arr!21642 _values!788) (store mapRest!23332 mapKey!23332 mapValue!23332))))

(declare-fun b!819086 () Bool)

(declare-fun res!558756 () Bool)

(assert (=> b!819086 (=> (not res!558756) (not e!454713))))

(assert (=> b!819086 (= res!558756 (and (= (size!22062 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22061 _keys!976) (size!22062 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819087 () Bool)

(assert (=> b!819087 (= e!454711 tp_is_empty!14491)))

(declare-fun b!819088 () Bool)

(declare-fun res!558755 () Bool)

(assert (=> b!819088 (=> (not res!558755) (not e!454713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45181 (_ BitVec 32)) Bool)

(assert (=> b!819088 (= res!558755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70604 res!558758) b!819086))

(assert (= (and b!819086 res!558756) b!819088))

(assert (= (and b!819088 res!558755) b!819082))

(assert (= (and b!819082 res!558759) b!819081))

(assert (= (and b!819081 (not res!558757)) b!819084))

(assert (= (and b!819085 condMapEmpty!23332) mapIsEmpty!23332))

(assert (= (and b!819085 (not condMapEmpty!23332)) mapNonEmpty!23332))

(get-info :version)

(assert (= (and mapNonEmpty!23332 ((_ is ValueCellFull!6830) mapValue!23332)) b!819083))

(assert (= (and b!819085 ((_ is ValueCellFull!6830) mapDefault!23332)) b!819087))

(assert (= start!70604 b!819085))

(declare-fun m!760927 () Bool)

(assert (=> start!70604 m!760927))

(declare-fun m!760929 () Bool)

(assert (=> start!70604 m!760929))

(declare-fun m!760931 () Bool)

(assert (=> start!70604 m!760931))

(declare-fun m!760933 () Bool)

(assert (=> b!819081 m!760933))

(declare-fun m!760935 () Bool)

(assert (=> b!819081 m!760935))

(declare-fun m!760937 () Bool)

(assert (=> b!819081 m!760937))

(declare-fun m!760939 () Bool)

(assert (=> b!819082 m!760939))

(declare-fun m!760941 () Bool)

(assert (=> b!819088 m!760941))

(declare-fun m!760943 () Bool)

(assert (=> b!819084 m!760943))

(declare-fun m!760945 () Bool)

(assert (=> mapNonEmpty!23332 m!760945))

(check-sat (not b_next!12781) (not b!819081) (not mapNonEmpty!23332) tp_is_empty!14491 (not b!819088) (not b!819084) (not b!819082) b_and!21611 (not start!70604))
(check-sat b_and!21611 (not b_next!12781))
