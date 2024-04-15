; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110524 () Bool)

(assert start!110524)

(declare-fun b_free!29359 () Bool)

(declare-fun b_next!29359 () Bool)

(assert (=> start!110524 (= b_free!29359 (not b_next!29359))))

(declare-fun tp!103399 () Bool)

(declare-fun b_and!47549 () Bool)

(assert (=> start!110524 (= tp!103399 b_and!47549)))

(declare-fun res!867849 () Bool)

(declare-fun e!746020 () Bool)

(assert (=> start!110524 (=> (not res!867849) (not e!746020))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110524 (= res!867849 (validMask!0 mask!2040))))

(assert (=> start!110524 e!746020))

(assert (=> start!110524 tp!103399))

(declare-datatypes ((array!87095 0))(
  ( (array!87096 (arr!42028 (Array (_ BitVec 32) (_ BitVec 64))) (size!42580 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87095)

(declare-fun array_inv!31963 (array!87095) Bool)

(assert (=> start!110524 (array_inv!31963 _keys!1628)))

(assert (=> start!110524 true))

(declare-fun tp_is_empty!35089 () Bool)

(assert (=> start!110524 tp_is_empty!35089))

(declare-datatypes ((V!51889 0))(
  ( (V!51890 (val!17619 Int)) )
))
(declare-datatypes ((ValueCell!16646 0))(
  ( (ValueCellFull!16646 (v!20245 V!51889)) (EmptyCell!16646) )
))
(declare-datatypes ((array!87097 0))(
  ( (array!87098 (arr!42029 (Array (_ BitVec 32) ValueCell!16646)) (size!42581 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87097)

(declare-fun e!746022 () Bool)

(declare-fun array_inv!31964 (array!87097) Bool)

(assert (=> start!110524 (and (array_inv!31964 _values!1354) e!746022)))

(declare-fun b!1307377 () Bool)

(declare-fun e!746024 () Bool)

(assert (=> b!1307377 (= e!746024 tp_is_empty!35089)))

(declare-fun mapNonEmpty!54262 () Bool)

(declare-fun mapRes!54262 () Bool)

(declare-fun tp!103400 () Bool)

(assert (=> mapNonEmpty!54262 (= mapRes!54262 (and tp!103400 e!746024))))

(declare-fun mapKey!54262 () (_ BitVec 32))

(declare-fun mapRest!54262 () (Array (_ BitVec 32) ValueCell!16646))

(declare-fun mapValue!54262 () ValueCell!16646)

(assert (=> mapNonEmpty!54262 (= (arr!42029 _values!1354) (store mapRest!54262 mapKey!54262 mapValue!54262))))

(declare-fun b!1307378 () Bool)

(declare-fun res!867847 () Bool)

(assert (=> b!1307378 (=> (not res!867847) (not e!746020))))

(declare-datatypes ((List!29886 0))(
  ( (Nil!29883) (Cons!29882 (h!31091 (_ BitVec 64)) (t!43484 List!29886)) )
))
(declare-fun arrayNoDuplicates!0 (array!87095 (_ BitVec 32) List!29886) Bool)

(assert (=> b!1307378 (= res!867847 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29883))))

(declare-fun b!1307379 () Bool)

(declare-fun res!867846 () Bool)

(assert (=> b!1307379 (=> (not res!867846) (not e!746020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87095 (_ BitVec 32)) Bool)

(assert (=> b!1307379 (= res!867846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54262 () Bool)

(assert (=> mapIsEmpty!54262 mapRes!54262))

(declare-fun b!1307380 () Bool)

(declare-fun res!867848 () Bool)

(assert (=> b!1307380 (=> (not res!867848) (not e!746020))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307380 (= res!867848 (and (= (size!42581 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42580 _keys!1628) (size!42581 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307381 () Bool)

(declare-fun e!746021 () Bool)

(assert (=> b!1307381 (= e!746022 (and e!746021 mapRes!54262))))

(declare-fun condMapEmpty!54262 () Bool)

(declare-fun mapDefault!54262 () ValueCell!16646)

(assert (=> b!1307381 (= condMapEmpty!54262 (= (arr!42029 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16646)) mapDefault!54262)))))

(declare-fun b!1307382 () Bool)

(declare-fun res!867850 () Bool)

(assert (=> b!1307382 (=> (not res!867850) (not e!746020))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307382 (= res!867850 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42580 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307383 () Bool)

(assert (=> b!1307383 (= e!746020 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51889)

(declare-fun zeroValue!1296 () V!51889)

(declare-fun lt!584871 () Bool)

(declare-datatypes ((tuple2!22762 0))(
  ( (tuple2!22763 (_1!11392 (_ BitVec 64)) (_2!11392 V!51889)) )
))
(declare-datatypes ((List!29887 0))(
  ( (Nil!29884) (Cons!29883 (h!31092 tuple2!22762) (t!43485 List!29887)) )
))
(declare-datatypes ((ListLongMap!20419 0))(
  ( (ListLongMap!20420 (toList!10225 List!29887)) )
))
(declare-fun contains!8302 (ListLongMap!20419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5120 (array!87095 array!87097 (_ BitVec 32) (_ BitVec 32) V!51889 V!51889 (_ BitVec 32) Int) ListLongMap!20419)

(assert (=> b!1307383 (= lt!584871 (contains!8302 (getCurrentListMap!5120 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307384 () Bool)

(assert (=> b!1307384 (= e!746021 tp_is_empty!35089)))

(assert (= (and start!110524 res!867849) b!1307380))

(assert (= (and b!1307380 res!867848) b!1307379))

(assert (= (and b!1307379 res!867846) b!1307378))

(assert (= (and b!1307378 res!867847) b!1307382))

(assert (= (and b!1307382 res!867850) b!1307383))

(assert (= (and b!1307381 condMapEmpty!54262) mapIsEmpty!54262))

(assert (= (and b!1307381 (not condMapEmpty!54262)) mapNonEmpty!54262))

(get-info :version)

(assert (= (and mapNonEmpty!54262 ((_ is ValueCellFull!16646) mapValue!54262)) b!1307377))

(assert (= (and b!1307381 ((_ is ValueCellFull!16646) mapDefault!54262)) b!1307384))

(assert (= start!110524 b!1307381))

(declare-fun m!1197621 () Bool)

(assert (=> b!1307378 m!1197621))

(declare-fun m!1197623 () Bool)

(assert (=> start!110524 m!1197623))

(declare-fun m!1197625 () Bool)

(assert (=> start!110524 m!1197625))

(declare-fun m!1197627 () Bool)

(assert (=> start!110524 m!1197627))

(declare-fun m!1197629 () Bool)

(assert (=> b!1307379 m!1197629))

(declare-fun m!1197631 () Bool)

(assert (=> mapNonEmpty!54262 m!1197631))

(declare-fun m!1197633 () Bool)

(assert (=> b!1307383 m!1197633))

(assert (=> b!1307383 m!1197633))

(declare-fun m!1197635 () Bool)

(assert (=> b!1307383 m!1197635))

(check-sat (not b!1307383) tp_is_empty!35089 (not b_next!29359) (not b!1307378) b_and!47549 (not mapNonEmpty!54262) (not b!1307379) (not start!110524))
(check-sat b_and!47549 (not b_next!29359))
