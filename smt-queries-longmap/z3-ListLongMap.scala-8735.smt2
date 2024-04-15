; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105900 () Bool)

(assert start!105900)

(declare-fun b_free!27445 () Bool)

(declare-fun b_next!27445 () Bool)

(assert (=> start!105900 (= b_free!27445 (not b_next!27445))))

(declare-fun tp!95866 () Bool)

(declare-fun b_and!45335 () Bool)

(assert (=> start!105900 (= tp!95866 b_and!45335)))

(declare-fun b!1261338 () Bool)

(declare-fun res!840522 () Bool)

(declare-fun e!717889 () Bool)

(assert (=> b!1261338 (=> (not res!840522) (not e!717889))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82229 0))(
  ( (array!82230 (arr!39668 (Array (_ BitVec 32) (_ BitVec 64))) (size!40206 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82229)

(declare-datatypes ((V!48495 0))(
  ( (V!48496 (val!16236 Int)) )
))
(declare-datatypes ((ValueCell!15410 0))(
  ( (ValueCellFull!15410 (v!18939 V!48495)) (EmptyCell!15410) )
))
(declare-datatypes ((array!82231 0))(
  ( (array!82232 (arr!39669 (Array (_ BitVec 32) ValueCell!15410)) (size!40207 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82231)

(assert (=> b!1261338 (= res!840522 (and (= (size!40207 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40206 _keys!1118) (size!40207 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261339 () Bool)

(assert (=> b!1261339 (= e!717889 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48495)

(declare-fun zeroValue!871 () V!48495)

(declare-datatypes ((tuple2!21084 0))(
  ( (tuple2!21085 (_1!10553 (_ BitVec 64)) (_2!10553 V!48495)) )
))
(declare-datatypes ((List!28286 0))(
  ( (Nil!28283) (Cons!28282 (h!29491 tuple2!21084) (t!41776 List!28286)) )
))
(declare-datatypes ((ListLongMap!18957 0))(
  ( (ListLongMap!18958 (toList!9494 List!28286)) )
))
(declare-fun lt!571444 () ListLongMap!18957)

(declare-fun getCurrentListMapNoExtraKeys!5863 (array!82229 array!82231 (_ BitVec 32) (_ BitVec 32) V!48495 V!48495 (_ BitVec 32) Int) ListLongMap!18957)

(assert (=> b!1261339 (= lt!571444 (getCurrentListMapNoExtraKeys!5863 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571443 () ListLongMap!18957)

(declare-fun minValueBefore!43 () V!48495)

(assert (=> b!1261339 (= lt!571443 (getCurrentListMapNoExtraKeys!5863 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50323 () Bool)

(declare-fun mapRes!50323 () Bool)

(declare-fun tp!95867 () Bool)

(declare-fun e!717888 () Bool)

(assert (=> mapNonEmpty!50323 (= mapRes!50323 (and tp!95867 e!717888))))

(declare-fun mapRest!50323 () (Array (_ BitVec 32) ValueCell!15410))

(declare-fun mapKey!50323 () (_ BitVec 32))

(declare-fun mapValue!50323 () ValueCell!15410)

(assert (=> mapNonEmpty!50323 (= (arr!39669 _values!914) (store mapRest!50323 mapKey!50323 mapValue!50323))))

(declare-fun b!1261340 () Bool)

(declare-fun res!840524 () Bool)

(assert (=> b!1261340 (=> (not res!840524) (not e!717889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82229 (_ BitVec 32)) Bool)

(assert (=> b!1261340 (= res!840524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50323 () Bool)

(assert (=> mapIsEmpty!50323 mapRes!50323))

(declare-fun res!840523 () Bool)

(assert (=> start!105900 (=> (not res!840523) (not e!717889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105900 (= res!840523 (validMask!0 mask!1466))))

(assert (=> start!105900 e!717889))

(assert (=> start!105900 true))

(assert (=> start!105900 tp!95866))

(declare-fun tp_is_empty!32347 () Bool)

(assert (=> start!105900 tp_is_empty!32347))

(declare-fun array_inv!30347 (array!82229) Bool)

(assert (=> start!105900 (array_inv!30347 _keys!1118)))

(declare-fun e!717886 () Bool)

(declare-fun array_inv!30348 (array!82231) Bool)

(assert (=> start!105900 (and (array_inv!30348 _values!914) e!717886)))

(declare-fun b!1261341 () Bool)

(declare-fun res!840525 () Bool)

(assert (=> b!1261341 (=> (not res!840525) (not e!717889))))

(declare-datatypes ((List!28287 0))(
  ( (Nil!28284) (Cons!28283 (h!29492 (_ BitVec 64)) (t!41777 List!28287)) )
))
(declare-fun arrayNoDuplicates!0 (array!82229 (_ BitVec 32) List!28287) Bool)

(assert (=> b!1261341 (= res!840525 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28284))))

(declare-fun b!1261342 () Bool)

(declare-fun e!717887 () Bool)

(assert (=> b!1261342 (= e!717886 (and e!717887 mapRes!50323))))

(declare-fun condMapEmpty!50323 () Bool)

(declare-fun mapDefault!50323 () ValueCell!15410)

(assert (=> b!1261342 (= condMapEmpty!50323 (= (arr!39669 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15410)) mapDefault!50323)))))

(declare-fun b!1261343 () Bool)

(assert (=> b!1261343 (= e!717888 tp_is_empty!32347)))

(declare-fun b!1261344 () Bool)

(assert (=> b!1261344 (= e!717887 tp_is_empty!32347)))

(assert (= (and start!105900 res!840523) b!1261338))

(assert (= (and b!1261338 res!840522) b!1261340))

(assert (= (and b!1261340 res!840524) b!1261341))

(assert (= (and b!1261341 res!840525) b!1261339))

(assert (= (and b!1261342 condMapEmpty!50323) mapIsEmpty!50323))

(assert (= (and b!1261342 (not condMapEmpty!50323)) mapNonEmpty!50323))

(get-info :version)

(assert (= (and mapNonEmpty!50323 ((_ is ValueCellFull!15410) mapValue!50323)) b!1261343))

(assert (= (and b!1261342 ((_ is ValueCellFull!15410) mapDefault!50323)) b!1261344))

(assert (= start!105900 b!1261342))

(declare-fun m!1161529 () Bool)

(assert (=> start!105900 m!1161529))

(declare-fun m!1161531 () Bool)

(assert (=> start!105900 m!1161531))

(declare-fun m!1161533 () Bool)

(assert (=> start!105900 m!1161533))

(declare-fun m!1161535 () Bool)

(assert (=> mapNonEmpty!50323 m!1161535))

(declare-fun m!1161537 () Bool)

(assert (=> b!1261340 m!1161537))

(declare-fun m!1161539 () Bool)

(assert (=> b!1261341 m!1161539))

(declare-fun m!1161541 () Bool)

(assert (=> b!1261339 m!1161541))

(declare-fun m!1161543 () Bool)

(assert (=> b!1261339 m!1161543))

(check-sat tp_is_empty!32347 (not b!1261340) (not b_next!27445) b_and!45335 (not b!1261339) (not b!1261341) (not start!105900) (not mapNonEmpty!50323))
(check-sat b_and!45335 (not b_next!27445))
