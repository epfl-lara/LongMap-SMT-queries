; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105864 () Bool)

(assert start!105864)

(declare-fun b_free!27405 () Bool)

(declare-fun b_next!27405 () Bool)

(assert (=> start!105864 (= b_free!27405 (not b_next!27405))))

(declare-fun tp!95747 () Bool)

(declare-fun b_and!45313 () Bool)

(assert (=> start!105864 (= tp!95747 b_and!45313)))

(declare-fun b!1261000 () Bool)

(declare-fun res!840325 () Bool)

(declare-fun e!717633 () Bool)

(assert (=> b!1261000 (=> (not res!840325) (not e!717633))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82228 0))(
  ( (array!82229 (arr!39667 (Array (_ BitVec 32) (_ BitVec 64))) (size!40203 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82228)

(declare-datatypes ((V!48441 0))(
  ( (V!48442 (val!16216 Int)) )
))
(declare-datatypes ((ValueCell!15390 0))(
  ( (ValueCellFull!15390 (v!18920 V!48441)) (EmptyCell!15390) )
))
(declare-datatypes ((array!82230 0))(
  ( (array!82231 (arr!39668 (Array (_ BitVec 32) ValueCell!15390)) (size!40204 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82230)

(assert (=> b!1261000 (= res!840325 (and (= (size!40204 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40203 _keys!1118) (size!40204 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50263 () Bool)

(declare-fun mapRes!50263 () Bool)

(assert (=> mapIsEmpty!50263 mapRes!50263))

(declare-fun b!1261001 () Bool)

(declare-fun e!717632 () Bool)

(declare-fun tp_is_empty!32307 () Bool)

(assert (=> b!1261001 (= e!717632 tp_is_empty!32307)))

(declare-fun res!840324 () Bool)

(assert (=> start!105864 (=> (not res!840324) (not e!717633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105864 (= res!840324 (validMask!0 mask!1466))))

(assert (=> start!105864 e!717633))

(assert (=> start!105864 true))

(assert (=> start!105864 tp!95747))

(assert (=> start!105864 tp_is_empty!32307))

(declare-fun array_inv!30197 (array!82228) Bool)

(assert (=> start!105864 (array_inv!30197 _keys!1118)))

(declare-fun e!717631 () Bool)

(declare-fun array_inv!30198 (array!82230) Bool)

(assert (=> start!105864 (and (array_inv!30198 _values!914) e!717631)))

(declare-fun b!1261002 () Bool)

(assert (=> b!1261002 (= e!717633 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48441)

(declare-fun zeroValue!871 () V!48441)

(declare-datatypes ((tuple2!20984 0))(
  ( (tuple2!20985 (_1!10503 (_ BitVec 64)) (_2!10503 V!48441)) )
))
(declare-datatypes ((List!28181 0))(
  ( (Nil!28178) (Cons!28177 (h!29386 tuple2!20984) (t!41680 List!28181)) )
))
(declare-datatypes ((ListLongMap!18857 0))(
  ( (ListLongMap!18858 (toList!9444 List!28181)) )
))
(declare-fun lt!571502 () ListLongMap!18857)

(declare-fun getCurrentListMapNoExtraKeys!5812 (array!82228 array!82230 (_ BitVec 32) (_ BitVec 32) V!48441 V!48441 (_ BitVec 32) Int) ListLongMap!18857)

(assert (=> b!1261002 (= lt!571502 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571503 () ListLongMap!18857)

(declare-fun minValueBefore!43 () V!48441)

(assert (=> b!1261002 (= lt!571503 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261003 () Bool)

(declare-fun e!717635 () Bool)

(assert (=> b!1261003 (= e!717631 (and e!717635 mapRes!50263))))

(declare-fun condMapEmpty!50263 () Bool)

(declare-fun mapDefault!50263 () ValueCell!15390)

(assert (=> b!1261003 (= condMapEmpty!50263 (= (arr!39668 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15390)) mapDefault!50263)))))

(declare-fun b!1261004 () Bool)

(declare-fun res!840322 () Bool)

(assert (=> b!1261004 (=> (not res!840322) (not e!717633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82228 (_ BitVec 32)) Bool)

(assert (=> b!1261004 (= res!840322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261005 () Bool)

(assert (=> b!1261005 (= e!717635 tp_is_empty!32307)))

(declare-fun mapNonEmpty!50263 () Bool)

(declare-fun tp!95746 () Bool)

(assert (=> mapNonEmpty!50263 (= mapRes!50263 (and tp!95746 e!717632))))

(declare-fun mapKey!50263 () (_ BitVec 32))

(declare-fun mapRest!50263 () (Array (_ BitVec 32) ValueCell!15390))

(declare-fun mapValue!50263 () ValueCell!15390)

(assert (=> mapNonEmpty!50263 (= (arr!39668 _values!914) (store mapRest!50263 mapKey!50263 mapValue!50263))))

(declare-fun b!1261006 () Bool)

(declare-fun res!840323 () Bool)

(assert (=> b!1261006 (=> (not res!840323) (not e!717633))))

(declare-datatypes ((List!28182 0))(
  ( (Nil!28179) (Cons!28178 (h!29387 (_ BitVec 64)) (t!41681 List!28182)) )
))
(declare-fun arrayNoDuplicates!0 (array!82228 (_ BitVec 32) List!28182) Bool)

(assert (=> b!1261006 (= res!840323 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28179))))

(assert (= (and start!105864 res!840324) b!1261000))

(assert (= (and b!1261000 res!840325) b!1261004))

(assert (= (and b!1261004 res!840322) b!1261006))

(assert (= (and b!1261006 res!840323) b!1261002))

(assert (= (and b!1261003 condMapEmpty!50263) mapIsEmpty!50263))

(assert (= (and b!1261003 (not condMapEmpty!50263)) mapNonEmpty!50263))

(get-info :version)

(assert (= (and mapNonEmpty!50263 ((_ is ValueCellFull!15390) mapValue!50263)) b!1261001))

(assert (= (and b!1261003 ((_ is ValueCellFull!15390) mapDefault!50263)) b!1261005))

(assert (= start!105864 b!1261003))

(declare-fun m!1161729 () Bool)

(assert (=> b!1261006 m!1161729))

(declare-fun m!1161731 () Bool)

(assert (=> b!1261002 m!1161731))

(declare-fun m!1161733 () Bool)

(assert (=> b!1261002 m!1161733))

(declare-fun m!1161735 () Bool)

(assert (=> start!105864 m!1161735))

(declare-fun m!1161737 () Bool)

(assert (=> start!105864 m!1161737))

(declare-fun m!1161739 () Bool)

(assert (=> start!105864 m!1161739))

(declare-fun m!1161741 () Bool)

(assert (=> mapNonEmpty!50263 m!1161741))

(declare-fun m!1161743 () Bool)

(assert (=> b!1261004 m!1161743))

(check-sat (not b!1261006) (not b_next!27405) tp_is_empty!32307 (not start!105864) (not b!1261002) b_and!45313 (not b!1261004) (not mapNonEmpty!50263))
(check-sat b_and!45313 (not b_next!27405))
