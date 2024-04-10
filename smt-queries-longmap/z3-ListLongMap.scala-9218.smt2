; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110658 () Bool)

(assert start!110658)

(declare-fun b_free!29493 () Bool)

(declare-fun b_next!29493 () Bool)

(assert (=> start!110658 (= b_free!29493 (not b_next!29493))))

(declare-fun tp!103801 () Bool)

(declare-fun b_and!47701 () Bool)

(assert (=> start!110658 (= tp!103801 b_and!47701)))

(declare-fun mapNonEmpty!54463 () Bool)

(declare-fun mapRes!54463 () Bool)

(declare-fun tp!103800 () Bool)

(declare-fun e!747061 () Bool)

(assert (=> mapNonEmpty!54463 (= mapRes!54463 (and tp!103800 e!747061))))

(declare-datatypes ((V!52067 0))(
  ( (V!52068 (val!17686 Int)) )
))
(declare-datatypes ((ValueCell!16713 0))(
  ( (ValueCellFull!16713 (v!20313 V!52067)) (EmptyCell!16713) )
))
(declare-datatypes ((array!87438 0))(
  ( (array!87439 (arr!42199 (Array (_ BitVec 32) ValueCell!16713)) (size!42749 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87438)

(declare-fun mapRest!54463 () (Array (_ BitVec 32) ValueCell!16713))

(declare-fun mapKey!54463 () (_ BitVec 32))

(declare-fun mapValue!54463 () ValueCell!16713)

(assert (=> mapNonEmpty!54463 (= (arr!42199 _values!1354) (store mapRest!54463 mapKey!54463 mapValue!54463))))

(declare-fun b!1309379 () Bool)

(declare-fun res!869206 () Bool)

(declare-fun e!747059 () Bool)

(assert (=> b!1309379 (=> (not res!869206) (not e!747059))))

(declare-datatypes ((array!87440 0))(
  ( (array!87441 (arr!42200 (Array (_ BitVec 32) (_ BitVec 64))) (size!42750 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87440)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87440 (_ BitVec 32)) Bool)

(assert (=> b!1309379 (= res!869206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309380 () Bool)

(declare-fun res!869208 () Bool)

(assert (=> b!1309380 (=> (not res!869208) (not e!747059))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309380 (= res!869208 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42750 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309381 () Bool)

(declare-fun res!869205 () Bool)

(assert (=> b!1309381 (=> (not res!869205) (not e!747059))))

(declare-datatypes ((List!29916 0))(
  ( (Nil!29913) (Cons!29912 (h!31121 (_ BitVec 64)) (t!43522 List!29916)) )
))
(declare-fun arrayNoDuplicates!0 (array!87440 (_ BitVec 32) List!29916) Bool)

(assert (=> b!1309381 (= res!869205 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29913))))

(declare-fun b!1309382 () Bool)

(declare-fun e!747062 () Bool)

(declare-fun e!747058 () Bool)

(assert (=> b!1309382 (= e!747062 (and e!747058 mapRes!54463))))

(declare-fun condMapEmpty!54463 () Bool)

(declare-fun mapDefault!54463 () ValueCell!16713)

(assert (=> b!1309382 (= condMapEmpty!54463 (= (arr!42199 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16713)) mapDefault!54463)))))

(declare-fun res!869207 () Bool)

(assert (=> start!110658 (=> (not res!869207) (not e!747059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110658 (= res!869207 (validMask!0 mask!2040))))

(assert (=> start!110658 e!747059))

(assert (=> start!110658 tp!103801))

(declare-fun array_inv!31891 (array!87440) Bool)

(assert (=> start!110658 (array_inv!31891 _keys!1628)))

(assert (=> start!110658 true))

(declare-fun tp_is_empty!35223 () Bool)

(assert (=> start!110658 tp_is_empty!35223))

(declare-fun array_inv!31892 (array!87438) Bool)

(assert (=> start!110658 (and (array_inv!31892 _values!1354) e!747062)))

(declare-fun b!1309383 () Bool)

(assert (=> b!1309383 (= e!747061 tp_is_empty!35223)))

(declare-fun b!1309384 () Bool)

(assert (=> b!1309384 (= e!747058 tp_is_empty!35223)))

(declare-fun mapIsEmpty!54463 () Bool)

(assert (=> mapIsEmpty!54463 mapRes!54463))

(declare-fun b!1309385 () Bool)

(assert (=> b!1309385 (= e!747059 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52067)

(declare-fun zeroValue!1296 () V!52067)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585258 () Bool)

(declare-datatypes ((tuple2!22772 0))(
  ( (tuple2!22773 (_1!11397 (_ BitVec 64)) (_2!11397 V!52067)) )
))
(declare-datatypes ((List!29917 0))(
  ( (Nil!29914) (Cons!29913 (h!31122 tuple2!22772) (t!43523 List!29917)) )
))
(declare-datatypes ((ListLongMap!20429 0))(
  ( (ListLongMap!20430 (toList!10230 List!29917)) )
))
(declare-fun contains!8380 (ListLongMap!20429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5243 (array!87440 array!87438 (_ BitVec 32) (_ BitVec 32) V!52067 V!52067 (_ BitVec 32) Int) ListLongMap!20429)

(assert (=> b!1309385 (= lt!585258 (contains!8380 (getCurrentListMap!5243 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309386 () Bool)

(declare-fun res!869204 () Bool)

(assert (=> b!1309386 (=> (not res!869204) (not e!747059))))

(assert (=> b!1309386 (= res!869204 (and (= (size!42749 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42750 _keys!1628) (size!42749 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110658 res!869207) b!1309386))

(assert (= (and b!1309386 res!869204) b!1309379))

(assert (= (and b!1309379 res!869206) b!1309381))

(assert (= (and b!1309381 res!869205) b!1309380))

(assert (= (and b!1309380 res!869208) b!1309385))

(assert (= (and b!1309382 condMapEmpty!54463) mapIsEmpty!54463))

(assert (= (and b!1309382 (not condMapEmpty!54463)) mapNonEmpty!54463))

(get-info :version)

(assert (= (and mapNonEmpty!54463 ((_ is ValueCellFull!16713) mapValue!54463)) b!1309383))

(assert (= (and b!1309382 ((_ is ValueCellFull!16713) mapDefault!54463)) b!1309384))

(assert (= start!110658 b!1309382))

(declare-fun m!1199479 () Bool)

(assert (=> b!1309385 m!1199479))

(assert (=> b!1309385 m!1199479))

(declare-fun m!1199481 () Bool)

(assert (=> b!1309385 m!1199481))

(declare-fun m!1199483 () Bool)

(assert (=> b!1309379 m!1199483))

(declare-fun m!1199485 () Bool)

(assert (=> b!1309381 m!1199485))

(declare-fun m!1199487 () Bool)

(assert (=> mapNonEmpty!54463 m!1199487))

(declare-fun m!1199489 () Bool)

(assert (=> start!110658 m!1199489))

(declare-fun m!1199491 () Bool)

(assert (=> start!110658 m!1199491))

(declare-fun m!1199493 () Bool)

(assert (=> start!110658 m!1199493))

(check-sat (not b!1309379) (not b!1309385) (not mapNonEmpty!54463) (not start!110658) b_and!47701 (not b_next!29493) (not b!1309381) tp_is_empty!35223)
(check-sat b_and!47701 (not b_next!29493))
