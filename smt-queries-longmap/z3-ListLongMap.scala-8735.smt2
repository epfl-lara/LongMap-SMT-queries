; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106128 () Bool)

(assert start!106128)

(declare-fun b_free!27445 () Bool)

(declare-fun b_next!27445 () Bool)

(assert (=> start!106128 (= b_free!27445 (not b_next!27445))))

(declare-fun tp!95867 () Bool)

(declare-fun b_and!45355 () Bool)

(assert (=> start!106128 (= tp!95867 b_and!45355)))

(declare-fun b!1262725 () Bool)

(declare-fun res!841085 () Bool)

(declare-fun e!718781 () Bool)

(assert (=> b!1262725 (=> (not res!841085) (not e!718781))))

(declare-datatypes ((array!82353 0))(
  ( (array!82354 (arr!39725 (Array (_ BitVec 32) (_ BitVec 64))) (size!40262 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82353)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82353 (_ BitVec 32)) Bool)

(assert (=> b!1262725 (= res!841085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50323 () Bool)

(declare-fun mapRes!50323 () Bool)

(assert (=> mapIsEmpty!50323 mapRes!50323))

(declare-fun res!841083 () Bool)

(assert (=> start!106128 (=> (not res!841083) (not e!718781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106128 (= res!841083 (validMask!0 mask!1466))))

(assert (=> start!106128 e!718781))

(assert (=> start!106128 true))

(assert (=> start!106128 tp!95867))

(declare-fun tp_is_empty!32347 () Bool)

(assert (=> start!106128 tp_is_empty!32347))

(declare-fun array_inv!30391 (array!82353) Bool)

(assert (=> start!106128 (array_inv!30391 _keys!1118)))

(declare-datatypes ((V!48495 0))(
  ( (V!48496 (val!16236 Int)) )
))
(declare-datatypes ((ValueCell!15410 0))(
  ( (ValueCellFull!15410 (v!18936 V!48495)) (EmptyCell!15410) )
))
(declare-datatypes ((array!82355 0))(
  ( (array!82356 (arr!39726 (Array (_ BitVec 32) ValueCell!15410)) (size!40263 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82355)

(declare-fun e!718782 () Bool)

(declare-fun array_inv!30392 (array!82355) Bool)

(assert (=> start!106128 (and (array_inv!30392 _values!914) e!718782)))

(declare-fun b!1262726 () Bool)

(declare-fun e!718780 () Bool)

(assert (=> b!1262726 (= e!718780 tp_is_empty!32347)))

(declare-fun b!1262727 () Bool)

(assert (=> b!1262727 (= e!718781 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48495)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48495)

(declare-datatypes ((tuple2!21024 0))(
  ( (tuple2!21025 (_1!10523 (_ BitVec 64)) (_2!10523 V!48495)) )
))
(declare-datatypes ((List!28246 0))(
  ( (Nil!28243) (Cons!28242 (h!29460 tuple2!21024) (t!41737 List!28246)) )
))
(declare-datatypes ((ListLongMap!18905 0))(
  ( (ListLongMap!18906 (toList!9468 List!28246)) )
))
(declare-fun lt!572107 () ListLongMap!18905)

(declare-fun getCurrentListMapNoExtraKeys!5874 (array!82353 array!82355 (_ BitVec 32) (_ BitVec 32) V!48495 V!48495 (_ BitVec 32) Int) ListLongMap!18905)

(assert (=> b!1262727 (= lt!572107 (getCurrentListMapNoExtraKeys!5874 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48495)

(declare-fun lt!572106 () ListLongMap!18905)

(assert (=> b!1262727 (= lt!572106 (getCurrentListMapNoExtraKeys!5874 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262728 () Bool)

(declare-fun e!718779 () Bool)

(assert (=> b!1262728 (= e!718779 tp_is_empty!32347)))

(declare-fun b!1262729 () Bool)

(declare-fun res!841082 () Bool)

(assert (=> b!1262729 (=> (not res!841082) (not e!718781))))

(assert (=> b!1262729 (= res!841082 (and (= (size!40263 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40262 _keys!1118) (size!40263 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50323 () Bool)

(declare-fun tp!95866 () Bool)

(assert (=> mapNonEmpty!50323 (= mapRes!50323 (and tp!95866 e!718779))))

(declare-fun mapValue!50323 () ValueCell!15410)

(declare-fun mapKey!50323 () (_ BitVec 32))

(declare-fun mapRest!50323 () (Array (_ BitVec 32) ValueCell!15410))

(assert (=> mapNonEmpty!50323 (= (arr!39726 _values!914) (store mapRest!50323 mapKey!50323 mapValue!50323))))

(declare-fun b!1262730 () Bool)

(declare-fun res!841084 () Bool)

(assert (=> b!1262730 (=> (not res!841084) (not e!718781))))

(declare-datatypes ((List!28247 0))(
  ( (Nil!28244) (Cons!28243 (h!29461 (_ BitVec 64)) (t!41738 List!28247)) )
))
(declare-fun arrayNoDuplicates!0 (array!82353 (_ BitVec 32) List!28247) Bool)

(assert (=> b!1262730 (= res!841084 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28244))))

(declare-fun b!1262731 () Bool)

(assert (=> b!1262731 (= e!718782 (and e!718780 mapRes!50323))))

(declare-fun condMapEmpty!50323 () Bool)

(declare-fun mapDefault!50323 () ValueCell!15410)

(assert (=> b!1262731 (= condMapEmpty!50323 (= (arr!39726 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15410)) mapDefault!50323)))))

(assert (= (and start!106128 res!841083) b!1262729))

(assert (= (and b!1262729 res!841082) b!1262725))

(assert (= (and b!1262725 res!841085) b!1262730))

(assert (= (and b!1262730 res!841084) b!1262727))

(assert (= (and b!1262731 condMapEmpty!50323) mapIsEmpty!50323))

(assert (= (and b!1262731 (not condMapEmpty!50323)) mapNonEmpty!50323))

(get-info :version)

(assert (= (and mapNonEmpty!50323 ((_ is ValueCellFull!15410) mapValue!50323)) b!1262728))

(assert (= (and b!1262731 ((_ is ValueCellFull!15410) mapDefault!50323)) b!1262726))

(assert (= start!106128 b!1262731))

(declare-fun m!1163661 () Bool)

(assert (=> b!1262725 m!1163661))

(declare-fun m!1163663 () Bool)

(assert (=> mapNonEmpty!50323 m!1163663))

(declare-fun m!1163665 () Bool)

(assert (=> start!106128 m!1163665))

(declare-fun m!1163667 () Bool)

(assert (=> start!106128 m!1163667))

(declare-fun m!1163669 () Bool)

(assert (=> start!106128 m!1163669))

(declare-fun m!1163671 () Bool)

(assert (=> b!1262730 m!1163671))

(declare-fun m!1163673 () Bool)

(assert (=> b!1262727 m!1163673))

(declare-fun m!1163675 () Bool)

(assert (=> b!1262727 m!1163675))

(check-sat tp_is_empty!32347 (not b!1262730) b_and!45355 (not b_next!27445) (not b!1262725) (not mapNonEmpty!50323) (not b!1262727) (not start!106128))
(check-sat b_and!45355 (not b_next!27445))
