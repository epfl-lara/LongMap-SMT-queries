; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110952 () Bool)

(assert start!110952)

(declare-fun b_free!29787 () Bool)

(declare-fun b_next!29787 () Bool)

(assert (=> start!110952 (= b_free!29787 (not b_next!29787))))

(declare-fun tp!104682 () Bool)

(declare-fun b_and!47995 () Bool)

(assert (=> start!110952 (= tp!104682 b_and!47995)))

(declare-fun b!1313582 () Bool)

(declare-fun res!872085 () Bool)

(declare-fun e!749266 () Bool)

(assert (=> b!1313582 (=> (not res!872085) (not e!749266))))

(declare-datatypes ((array!88012 0))(
  ( (array!88013 (arr!42486 (Array (_ BitVec 32) (_ BitVec 64))) (size!43036 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88012)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88012 (_ BitVec 32)) Bool)

(assert (=> b!1313582 (= res!872085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313583 () Bool)

(assert (=> b!1313583 (= e!749266 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52459 0))(
  ( (V!52460 (val!17833 Int)) )
))
(declare-fun minValue!1296 () V!52459)

(declare-datatypes ((ValueCell!16860 0))(
  ( (ValueCellFull!16860 (v!20460 V!52459)) (EmptyCell!16860) )
))
(declare-datatypes ((array!88014 0))(
  ( (array!88015 (arr!42487 (Array (_ BitVec 32) ValueCell!16860)) (size!43037 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88014)

(declare-fun zeroValue!1296 () V!52459)

(declare-fun lt!585690 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22992 0))(
  ( (tuple2!22993 (_1!11507 (_ BitVec 64)) (_2!11507 V!52459)) )
))
(declare-datatypes ((List!30128 0))(
  ( (Nil!30125) (Cons!30124 (h!31333 tuple2!22992) (t!43734 List!30128)) )
))
(declare-datatypes ((ListLongMap!20649 0))(
  ( (ListLongMap!20650 (toList!10340 List!30128)) )
))
(declare-fun contains!8490 (ListLongMap!20649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5353 (array!88012 array!88014 (_ BitVec 32) (_ BitVec 32) V!52459 V!52459 (_ BitVec 32) Int) ListLongMap!20649)

(assert (=> b!1313583 (= lt!585690 (contains!8490 (getCurrentListMap!5353 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313584 () Bool)

(declare-fun res!872087 () Bool)

(assert (=> b!1313584 (=> (not res!872087) (not e!749266))))

(assert (=> b!1313584 (= res!872087 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43036 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54904 () Bool)

(declare-fun mapRes!54904 () Bool)

(declare-fun tp!104683 () Bool)

(declare-fun e!749265 () Bool)

(assert (=> mapNonEmpty!54904 (= mapRes!54904 (and tp!104683 e!749265))))

(declare-fun mapValue!54904 () ValueCell!16860)

(declare-fun mapRest!54904 () (Array (_ BitVec 32) ValueCell!16860))

(declare-fun mapKey!54904 () (_ BitVec 32))

(assert (=> mapNonEmpty!54904 (= (arr!42487 _values!1354) (store mapRest!54904 mapKey!54904 mapValue!54904))))

(declare-fun b!1313585 () Bool)

(declare-fun res!872086 () Bool)

(assert (=> b!1313585 (=> (not res!872086) (not e!749266))))

(declare-datatypes ((List!30129 0))(
  ( (Nil!30126) (Cons!30125 (h!31334 (_ BitVec 64)) (t!43735 List!30129)) )
))
(declare-fun arrayNoDuplicates!0 (array!88012 (_ BitVec 32) List!30129) Bool)

(assert (=> b!1313585 (= res!872086 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30126))))

(declare-fun mapIsEmpty!54904 () Bool)

(assert (=> mapIsEmpty!54904 mapRes!54904))

(declare-fun b!1313587 () Bool)

(declare-fun tp_is_empty!35517 () Bool)

(assert (=> b!1313587 (= e!749265 tp_is_empty!35517)))

(declare-fun b!1313588 () Bool)

(declare-fun e!749267 () Bool)

(declare-fun e!749263 () Bool)

(assert (=> b!1313588 (= e!749267 (and e!749263 mapRes!54904))))

(declare-fun condMapEmpty!54904 () Bool)

(declare-fun mapDefault!54904 () ValueCell!16860)

(assert (=> b!1313588 (= condMapEmpty!54904 (= (arr!42487 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16860)) mapDefault!54904)))))

(declare-fun b!1313589 () Bool)

(declare-fun res!872088 () Bool)

(assert (=> b!1313589 (=> (not res!872088) (not e!749266))))

(assert (=> b!1313589 (= res!872088 (and (= (size!43037 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43036 _keys!1628) (size!43037 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872084 () Bool)

(assert (=> start!110952 (=> (not res!872084) (not e!749266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110952 (= res!872084 (validMask!0 mask!2040))))

(assert (=> start!110952 e!749266))

(assert (=> start!110952 tp!104682))

(declare-fun array_inv!32091 (array!88012) Bool)

(assert (=> start!110952 (array_inv!32091 _keys!1628)))

(assert (=> start!110952 true))

(assert (=> start!110952 tp_is_empty!35517))

(declare-fun array_inv!32092 (array!88014) Bool)

(assert (=> start!110952 (and (array_inv!32092 _values!1354) e!749267)))

(declare-fun b!1313586 () Bool)

(assert (=> b!1313586 (= e!749263 tp_is_empty!35517)))

(assert (= (and start!110952 res!872084) b!1313589))

(assert (= (and b!1313589 res!872088) b!1313582))

(assert (= (and b!1313582 res!872085) b!1313585))

(assert (= (and b!1313585 res!872086) b!1313584))

(assert (= (and b!1313584 res!872087) b!1313583))

(assert (= (and b!1313588 condMapEmpty!54904) mapIsEmpty!54904))

(assert (= (and b!1313588 (not condMapEmpty!54904)) mapNonEmpty!54904))

(get-info :version)

(assert (= (and mapNonEmpty!54904 ((_ is ValueCellFull!16860) mapValue!54904)) b!1313587))

(assert (= (and b!1313588 ((_ is ValueCellFull!16860) mapDefault!54904)) b!1313586))

(assert (= start!110952 b!1313588))

(declare-fun m!1202383 () Bool)

(assert (=> b!1313583 m!1202383))

(assert (=> b!1313583 m!1202383))

(declare-fun m!1202385 () Bool)

(assert (=> b!1313583 m!1202385))

(declare-fun m!1202387 () Bool)

(assert (=> b!1313585 m!1202387))

(declare-fun m!1202389 () Bool)

(assert (=> b!1313582 m!1202389))

(declare-fun m!1202391 () Bool)

(assert (=> mapNonEmpty!54904 m!1202391))

(declare-fun m!1202393 () Bool)

(assert (=> start!110952 m!1202393))

(declare-fun m!1202395 () Bool)

(assert (=> start!110952 m!1202395))

(declare-fun m!1202397 () Bool)

(assert (=> start!110952 m!1202397))

(check-sat (not b!1313583) b_and!47995 (not b!1313582) (not start!110952) (not b_next!29787) (not mapNonEmpty!54904) tp_is_empty!35517 (not b!1313585))
(check-sat b_and!47995 (not b_next!29787))
