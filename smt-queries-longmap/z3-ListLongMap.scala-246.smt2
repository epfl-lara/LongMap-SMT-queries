; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4148 () Bool)

(assert start!4148)

(declare-fun b_free!1063 () Bool)

(declare-fun b_next!1063 () Bool)

(assert (=> start!4148 (= b_free!1063 (not b_next!1063))))

(declare-fun tp!4608 () Bool)

(declare-fun b_and!1867 () Bool)

(assert (=> start!4148 (= tp!4608 b_and!1867)))

(declare-fun mapIsEmpty!1654 () Bool)

(declare-fun mapRes!1654 () Bool)

(assert (=> mapIsEmpty!1654 mapRes!1654))

(declare-fun res!18954 () Bool)

(declare-fun e!19992 () Bool)

(assert (=> start!4148 (=> (not res!18954) (not e!19992))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4148 (= res!18954 (validMask!0 mask!2294))))

(assert (=> start!4148 e!19992))

(assert (=> start!4148 true))

(assert (=> start!4148 tp!4608))

(declare-datatypes ((V!1715 0))(
  ( (V!1716 (val!735 Int)) )
))
(declare-datatypes ((ValueCell!509 0))(
  ( (ValueCellFull!509 (v!1823 V!1715)) (EmptyCell!509) )
))
(declare-datatypes ((array!2027 0))(
  ( (array!2028 (arr!967 (Array (_ BitVec 32) ValueCell!509)) (size!1068 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2027)

(declare-fun e!19993 () Bool)

(declare-fun array_inv!683 (array!2027) Bool)

(assert (=> start!4148 (and (array_inv!683 _values!1501) e!19993)))

(declare-datatypes ((array!2029 0))(
  ( (array!2030 (arr!968 (Array (_ BitVec 32) (_ BitVec 64))) (size!1069 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2029)

(declare-fun array_inv!684 (array!2029) Bool)

(assert (=> start!4148 (array_inv!684 _keys!1833)))

(declare-fun tp_is_empty!1417 () Bool)

(assert (=> start!4148 tp_is_empty!1417))

(declare-fun b!31295 () Bool)

(declare-fun res!18952 () Bool)

(assert (=> b!31295 (=> (not res!18952) (not e!19992))))

(declare-datatypes ((List!790 0))(
  ( (Nil!787) (Cons!786 (h!1353 (_ BitVec 64)) (t!3476 List!790)) )
))
(declare-fun arrayNoDuplicates!0 (array!2029 (_ BitVec 32) List!790) Bool)

(assert (=> b!31295 (= res!18952 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!787))))

(declare-fun b!31296 () Bool)

(declare-fun res!18953 () Bool)

(assert (=> b!31296 (=> (not res!18953) (not e!19992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2029 (_ BitVec 32)) Bool)

(assert (=> b!31296 (= res!18953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31297 () Bool)

(declare-fun res!18951 () Bool)

(assert (=> b!31297 (=> (not res!18951) (not e!19992))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31297 (= res!18951 (and (= (size!1068 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1069 _keys!1833) (size!1068 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1654 () Bool)

(declare-fun tp!4609 () Bool)

(declare-fun e!19995 () Bool)

(assert (=> mapNonEmpty!1654 (= mapRes!1654 (and tp!4609 e!19995))))

(declare-fun mapValue!1654 () ValueCell!509)

(declare-fun mapRest!1654 () (Array (_ BitVec 32) ValueCell!509))

(declare-fun mapKey!1654 () (_ BitVec 32))

(assert (=> mapNonEmpty!1654 (= (arr!967 _values!1501) (store mapRest!1654 mapKey!1654 mapValue!1654))))

(declare-fun b!31298 () Bool)

(declare-fun e!19994 () Bool)

(assert (=> b!31298 (= e!19993 (and e!19994 mapRes!1654))))

(declare-fun condMapEmpty!1654 () Bool)

(declare-fun mapDefault!1654 () ValueCell!509)

(assert (=> b!31298 (= condMapEmpty!1654 (= (arr!967 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!509)) mapDefault!1654)))))

(declare-fun b!31299 () Bool)

(assert (=> b!31299 (= e!19992 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11551 () Bool)

(declare-fun zeroValue!1443 () V!1715)

(declare-fun minValue!1443 () V!1715)

(declare-datatypes ((tuple2!1208 0))(
  ( (tuple2!1209 (_1!615 (_ BitVec 64)) (_2!615 V!1715)) )
))
(declare-datatypes ((List!791 0))(
  ( (Nil!788) (Cons!787 (h!1354 tuple2!1208) (t!3477 List!791)) )
))
(declare-datatypes ((ListLongMap!773 0))(
  ( (ListLongMap!774 (toList!402 List!791)) )
))
(declare-fun contains!343 (ListLongMap!773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!225 (array!2029 array!2027 (_ BitVec 32) (_ BitVec 32) V!1715 V!1715 (_ BitVec 32) Int) ListLongMap!773)

(assert (=> b!31299 (= lt!11551 (contains!343 (getCurrentListMap!225 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31300 () Bool)

(assert (=> b!31300 (= e!19995 tp_is_empty!1417)))

(declare-fun b!31301 () Bool)

(assert (=> b!31301 (= e!19994 tp_is_empty!1417)))

(declare-fun b!31302 () Bool)

(declare-fun res!18955 () Bool)

(assert (=> b!31302 (=> (not res!18955) (not e!19992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31302 (= res!18955 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4148 res!18954) b!31297))

(assert (= (and b!31297 res!18951) b!31296))

(assert (= (and b!31296 res!18953) b!31295))

(assert (= (and b!31295 res!18952) b!31302))

(assert (= (and b!31302 res!18955) b!31299))

(assert (= (and b!31298 condMapEmpty!1654) mapIsEmpty!1654))

(assert (= (and b!31298 (not condMapEmpty!1654)) mapNonEmpty!1654))

(get-info :version)

(assert (= (and mapNonEmpty!1654 ((_ is ValueCellFull!509) mapValue!1654)) b!31300))

(assert (= (and b!31298 ((_ is ValueCellFull!509) mapDefault!1654)) b!31301))

(assert (= start!4148 b!31298))

(declare-fun m!25083 () Bool)

(assert (=> mapNonEmpty!1654 m!25083))

(declare-fun m!25085 () Bool)

(assert (=> start!4148 m!25085))

(declare-fun m!25087 () Bool)

(assert (=> start!4148 m!25087))

(declare-fun m!25089 () Bool)

(assert (=> start!4148 m!25089))

(declare-fun m!25091 () Bool)

(assert (=> b!31299 m!25091))

(assert (=> b!31299 m!25091))

(declare-fun m!25093 () Bool)

(assert (=> b!31299 m!25093))

(declare-fun m!25095 () Bool)

(assert (=> b!31295 m!25095))

(declare-fun m!25097 () Bool)

(assert (=> b!31302 m!25097))

(declare-fun m!25099 () Bool)

(assert (=> b!31296 m!25099))

(check-sat (not b!31299) (not b!31296) (not start!4148) (not b_next!1063) b_and!1867 (not b!31302) (not b!31295) (not mapNonEmpty!1654) tp_is_empty!1417)
(check-sat b_and!1867 (not b_next!1063))
