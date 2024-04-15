; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71220 () Bool)

(assert start!71220)

(declare-fun b_free!13387 () Bool)

(declare-fun b_next!13387 () Bool)

(assert (=> start!71220 (= b_free!13387 (not b_next!13387))))

(declare-fun tp!46924 () Bool)

(declare-fun b_and!22299 () Bool)

(assert (=> start!71220 (= tp!46924 b_and!22299)))

(declare-fun b!827266 () Bool)

(declare-fun e!460844 () Bool)

(declare-fun e!460842 () Bool)

(declare-fun mapRes!24274 () Bool)

(assert (=> b!827266 (= e!460844 (and e!460842 mapRes!24274))))

(declare-fun condMapEmpty!24274 () Bool)

(declare-datatypes ((V!25131 0))(
  ( (V!25132 (val!7596 Int)) )
))
(declare-datatypes ((ValueCell!7133 0))(
  ( (ValueCellFull!7133 (v!10025 V!25131)) (EmptyCell!7133) )
))
(declare-datatypes ((array!46335 0))(
  ( (array!46336 (arr!22212 (Array (_ BitVec 32) ValueCell!7133)) (size!22633 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46335)

(declare-fun mapDefault!24274 () ValueCell!7133)

(assert (=> b!827266 (= condMapEmpty!24274 (= (arr!22212 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7133)) mapDefault!24274)))))

(declare-fun b!827267 () Bool)

(declare-fun res!563912 () Bool)

(declare-fun e!460843 () Bool)

(assert (=> b!827267 (=> (not res!563912) (not e!460843))))

(declare-datatypes ((array!46337 0))(
  ( (array!46338 (arr!22213 (Array (_ BitVec 32) (_ BitVec 64))) (size!22634 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46337)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46337 (_ BitVec 32)) Bool)

(assert (=> b!827267 (= res!563912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827268 () Bool)

(declare-fun tp_is_empty!15097 () Bool)

(assert (=> b!827268 (= e!460842 tp_is_empty!15097)))

(declare-fun b!827269 () Bool)

(declare-fun res!563914 () Bool)

(assert (=> b!827269 (=> (not res!563914) (not e!460843))))

(declare-datatypes ((List!15867 0))(
  ( (Nil!15864) (Cons!15863 (h!16992 (_ BitVec 64)) (t!22207 List!15867)) )
))
(declare-fun arrayNoDuplicates!0 (array!46337 (_ BitVec 32) List!15867) Bool)

(assert (=> b!827269 (= res!563914 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15864))))

(declare-fun b!827270 () Bool)

(declare-fun res!563913 () Bool)

(assert (=> b!827270 (=> (not res!563913) (not e!460843))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827270 (= res!563913 (and (= (size!22633 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22634 _keys!976) (size!22633 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24274 () Bool)

(assert (=> mapIsEmpty!24274 mapRes!24274))

(declare-fun b!827271 () Bool)

(assert (=> b!827271 (= e!460843 false)))

(declare-datatypes ((tuple2!10080 0))(
  ( (tuple2!10081 (_1!5051 (_ BitVec 64)) (_2!5051 V!25131)) )
))
(declare-datatypes ((List!15868 0))(
  ( (Nil!15865) (Cons!15864 (h!16993 tuple2!10080) (t!22208 List!15868)) )
))
(declare-datatypes ((ListLongMap!8893 0))(
  ( (ListLongMap!8894 (toList!4462 List!15868)) )
))
(declare-fun lt!374684 () ListLongMap!8893)

(declare-fun minValue!754 () V!25131)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25131)

(declare-fun getCurrentListMapNoExtraKeys!2494 (array!46337 array!46335 (_ BitVec 32) (_ BitVec 32) V!25131 V!25131 (_ BitVec 32) Int) ListLongMap!8893)

(assert (=> b!827271 (= lt!374684 (getCurrentListMapNoExtraKeys!2494 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25131)

(declare-fun lt!374683 () ListLongMap!8893)

(assert (=> b!827271 (= lt!374683 (getCurrentListMapNoExtraKeys!2494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563911 () Bool)

(assert (=> start!71220 (=> (not res!563911) (not e!460843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71220 (= res!563911 (validMask!0 mask!1312))))

(assert (=> start!71220 e!460843))

(assert (=> start!71220 tp_is_empty!15097))

(declare-fun array_inv!17763 (array!46337) Bool)

(assert (=> start!71220 (array_inv!17763 _keys!976)))

(assert (=> start!71220 true))

(declare-fun array_inv!17764 (array!46335) Bool)

(assert (=> start!71220 (and (array_inv!17764 _values!788) e!460844)))

(assert (=> start!71220 tp!46924))

(declare-fun b!827272 () Bool)

(declare-fun e!460840 () Bool)

(assert (=> b!827272 (= e!460840 tp_is_empty!15097)))

(declare-fun mapNonEmpty!24274 () Bool)

(declare-fun tp!46923 () Bool)

(assert (=> mapNonEmpty!24274 (= mapRes!24274 (and tp!46923 e!460840))))

(declare-fun mapKey!24274 () (_ BitVec 32))

(declare-fun mapRest!24274 () (Array (_ BitVec 32) ValueCell!7133))

(declare-fun mapValue!24274 () ValueCell!7133)

(assert (=> mapNonEmpty!24274 (= (arr!22212 _values!788) (store mapRest!24274 mapKey!24274 mapValue!24274))))

(assert (= (and start!71220 res!563911) b!827270))

(assert (= (and b!827270 res!563913) b!827267))

(assert (= (and b!827267 res!563912) b!827269))

(assert (= (and b!827269 res!563914) b!827271))

(assert (= (and b!827266 condMapEmpty!24274) mapIsEmpty!24274))

(assert (= (and b!827266 (not condMapEmpty!24274)) mapNonEmpty!24274))

(get-info :version)

(assert (= (and mapNonEmpty!24274 ((_ is ValueCellFull!7133) mapValue!24274)) b!827272))

(assert (= (and b!827266 ((_ is ValueCellFull!7133) mapDefault!24274)) b!827268))

(assert (= start!71220 b!827266))

(declare-fun m!769823 () Bool)

(assert (=> b!827271 m!769823))

(declare-fun m!769825 () Bool)

(assert (=> b!827271 m!769825))

(declare-fun m!769827 () Bool)

(assert (=> start!71220 m!769827))

(declare-fun m!769829 () Bool)

(assert (=> start!71220 m!769829))

(declare-fun m!769831 () Bool)

(assert (=> start!71220 m!769831))

(declare-fun m!769833 () Bool)

(assert (=> b!827269 m!769833))

(declare-fun m!769835 () Bool)

(assert (=> mapNonEmpty!24274 m!769835))

(declare-fun m!769837 () Bool)

(assert (=> b!827267 m!769837))

(check-sat (not b_next!13387) b_and!22299 tp_is_empty!15097 (not b!827267) (not b!827271) (not mapNonEmpty!24274) (not b!827269) (not start!71220))
(check-sat b_and!22299 (not b_next!13387))
