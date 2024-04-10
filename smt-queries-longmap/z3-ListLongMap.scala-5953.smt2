; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77546 () Bool)

(assert start!77546)

(declare-fun b_free!16131 () Bool)

(declare-fun b_next!16131 () Bool)

(assert (=> start!77546 (= b_free!16131 (not b_next!16131))))

(declare-fun tp!56655 () Bool)

(declare-fun b_and!26497 () Bool)

(assert (=> start!77546 (= tp!56655 b_and!26497)))

(declare-fun b!903509 () Bool)

(declare-fun e!506235 () Bool)

(declare-fun tp_is_empty!18549 () Bool)

(assert (=> b!903509 (= e!506235 tp_is_empty!18549)))

(declare-fun b!903510 () Bool)

(declare-fun e!506231 () Bool)

(assert (=> b!903510 (= e!506231 tp_is_empty!18549)))

(declare-fun res!609582 () Bool)

(declare-fun e!506232 () Bool)

(assert (=> start!77546 (=> (not res!609582) (not e!506232))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77546 (= res!609582 (validMask!0 mask!1756))))

(assert (=> start!77546 e!506232))

(declare-datatypes ((V!29697 0))(
  ( (V!29698 (val!9325 Int)) )
))
(declare-datatypes ((ValueCell!8793 0))(
  ( (ValueCellFull!8793 (v!11830 V!29697)) (EmptyCell!8793) )
))
(declare-datatypes ((array!53154 0))(
  ( (array!53155 (arr!25536 (Array (_ BitVec 32) ValueCell!8793)) (size!25995 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53154)

(declare-fun e!506234 () Bool)

(declare-fun array_inv!20012 (array!53154) Bool)

(assert (=> start!77546 (and (array_inv!20012 _values!1152) e!506234)))

(assert (=> start!77546 tp!56655))

(assert (=> start!77546 true))

(assert (=> start!77546 tp_is_empty!18549))

(declare-datatypes ((array!53156 0))(
  ( (array!53157 (arr!25537 (Array (_ BitVec 32) (_ BitVec 64))) (size!25996 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53156)

(declare-fun array_inv!20013 (array!53156) Bool)

(assert (=> start!77546 (array_inv!20013 _keys!1386)))

(declare-fun b!903511 () Bool)

(declare-fun res!609584 () Bool)

(assert (=> b!903511 (=> (not res!609584) (not e!506232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53156 (_ BitVec 32)) Bool)

(assert (=> b!903511 (= res!609584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903512 () Bool)

(declare-fun res!609581 () Bool)

(assert (=> b!903512 (=> (not res!609581) (not e!506232))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903512 (= res!609581 (and (= (size!25995 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25996 _keys!1386) (size!25995 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29536 () Bool)

(declare-fun mapRes!29536 () Bool)

(assert (=> mapIsEmpty!29536 mapRes!29536))

(declare-fun mapNonEmpty!29536 () Bool)

(declare-fun tp!56654 () Bool)

(assert (=> mapNonEmpty!29536 (= mapRes!29536 (and tp!56654 e!506231))))

(declare-fun mapValue!29536 () ValueCell!8793)

(declare-fun mapKey!29536 () (_ BitVec 32))

(declare-fun mapRest!29536 () (Array (_ BitVec 32) ValueCell!8793))

(assert (=> mapNonEmpty!29536 (= (arr!25536 _values!1152) (store mapRest!29536 mapKey!29536 mapValue!29536))))

(declare-fun b!903513 () Bool)

(assert (=> b!903513 (= e!506234 (and e!506235 mapRes!29536))))

(declare-fun condMapEmpty!29536 () Bool)

(declare-fun mapDefault!29536 () ValueCell!8793)

(assert (=> b!903513 (= condMapEmpty!29536 (= (arr!25536 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8793)) mapDefault!29536)))))

(declare-fun b!903514 () Bool)

(assert (=> b!903514 (= e!506232 false)))

(declare-fun zeroValue!1094 () V!29697)

(declare-fun lt!408018 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29697)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12110 0))(
  ( (tuple2!12111 (_1!6066 (_ BitVec 64)) (_2!6066 V!29697)) )
))
(declare-datatypes ((List!17930 0))(
  ( (Nil!17927) (Cons!17926 (h!19072 tuple2!12110) (t!25313 List!17930)) )
))
(declare-datatypes ((ListLongMap!10807 0))(
  ( (ListLongMap!10808 (toList!5419 List!17930)) )
))
(declare-fun contains!4467 (ListLongMap!10807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2688 (array!53156 array!53154 (_ BitVec 32) (_ BitVec 32) V!29697 V!29697 (_ BitVec 32) Int) ListLongMap!10807)

(assert (=> b!903514 (= lt!408018 (contains!4467 (getCurrentListMap!2688 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903515 () Bool)

(declare-fun res!609583 () Bool)

(assert (=> b!903515 (=> (not res!609583) (not e!506232))))

(declare-datatypes ((List!17931 0))(
  ( (Nil!17928) (Cons!17927 (h!19073 (_ BitVec 64)) (t!25314 List!17931)) )
))
(declare-fun arrayNoDuplicates!0 (array!53156 (_ BitVec 32) List!17931) Bool)

(assert (=> b!903515 (= res!609583 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17928))))

(assert (= (and start!77546 res!609582) b!903512))

(assert (= (and b!903512 res!609581) b!903511))

(assert (= (and b!903511 res!609584) b!903515))

(assert (= (and b!903515 res!609583) b!903514))

(assert (= (and b!903513 condMapEmpty!29536) mapIsEmpty!29536))

(assert (= (and b!903513 (not condMapEmpty!29536)) mapNonEmpty!29536))

(get-info :version)

(assert (= (and mapNonEmpty!29536 ((_ is ValueCellFull!8793) mapValue!29536)) b!903510))

(assert (= (and b!903513 ((_ is ValueCellFull!8793) mapDefault!29536)) b!903509))

(assert (= start!77546 b!903513))

(declare-fun m!839177 () Bool)

(assert (=> b!903514 m!839177))

(assert (=> b!903514 m!839177))

(declare-fun m!839179 () Bool)

(assert (=> b!903514 m!839179))

(declare-fun m!839181 () Bool)

(assert (=> mapNonEmpty!29536 m!839181))

(declare-fun m!839183 () Bool)

(assert (=> start!77546 m!839183))

(declare-fun m!839185 () Bool)

(assert (=> start!77546 m!839185))

(declare-fun m!839187 () Bool)

(assert (=> start!77546 m!839187))

(declare-fun m!839189 () Bool)

(assert (=> b!903515 m!839189))

(declare-fun m!839191 () Bool)

(assert (=> b!903511 m!839191))

(check-sat (not start!77546) (not b_next!16131) (not mapNonEmpty!29536) b_and!26497 (not b!903514) tp_is_empty!18549 (not b!903511) (not b!903515))
(check-sat b_and!26497 (not b_next!16131))
