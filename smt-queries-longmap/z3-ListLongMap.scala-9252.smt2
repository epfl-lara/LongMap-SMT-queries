; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110862 () Bool)

(assert start!110862)

(declare-fun b_free!29697 () Bool)

(declare-fun b_next!29697 () Bool)

(assert (=> start!110862 (= b_free!29697 (not b_next!29697))))

(declare-fun tp!104412 () Bool)

(declare-fun b_and!47905 () Bool)

(assert (=> start!110862 (= tp!104412 b_and!47905)))

(declare-fun b!1312459 () Bool)

(declare-fun res!871374 () Bool)

(declare-fun e!748589 () Bool)

(assert (=> b!1312459 (=> (not res!871374) (not e!748589))))

(declare-datatypes ((array!87840 0))(
  ( (array!87841 (arr!42400 (Array (_ BitVec 32) (_ BitVec 64))) (size!42950 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87840)

(declare-datatypes ((V!52339 0))(
  ( (V!52340 (val!17788 Int)) )
))
(declare-datatypes ((ValueCell!16815 0))(
  ( (ValueCellFull!16815 (v!20415 V!52339)) (EmptyCell!16815) )
))
(declare-datatypes ((array!87842 0))(
  ( (array!87843 (arr!42401 (Array (_ BitVec 32) ValueCell!16815)) (size!42951 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87842)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1312459 (= res!871374 (and (= (size!42951 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42950 _keys!1628) (size!42951 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!871367 () Bool)

(assert (=> start!110862 (=> (not res!871367) (not e!748589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110862 (= res!871367 (validMask!0 mask!2040))))

(assert (=> start!110862 e!748589))

(assert (=> start!110862 tp!104412))

(declare-fun array_inv!32039 (array!87840) Bool)

(assert (=> start!110862 (array_inv!32039 _keys!1628)))

(assert (=> start!110862 true))

(declare-fun tp_is_empty!35427 () Bool)

(assert (=> start!110862 tp_is_empty!35427))

(declare-fun e!748591 () Bool)

(declare-fun array_inv!32040 (array!87842) Bool)

(assert (=> start!110862 (and (array_inv!32040 _values!1354) e!748591)))

(declare-fun b!1312460 () Bool)

(declare-fun res!871369 () Bool)

(assert (=> b!1312460 (=> (not res!871369) (not e!748589))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312460 (= res!871369 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42950 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312461 () Bool)

(declare-fun e!748592 () Bool)

(assert (=> b!1312461 (= e!748592 tp_is_empty!35427)))

(declare-fun b!1312462 () Bool)

(declare-fun res!871372 () Bool)

(assert (=> b!1312462 (=> (not res!871372) (not e!748589))))

(declare-datatypes ((List!30068 0))(
  ( (Nil!30065) (Cons!30064 (h!31273 (_ BitVec 64)) (t!43674 List!30068)) )
))
(declare-fun arrayNoDuplicates!0 (array!87840 (_ BitVec 32) List!30068) Bool)

(assert (=> b!1312462 (= res!871372 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30065))))

(declare-fun b!1312463 () Bool)

(declare-fun e!748590 () Bool)

(assert (=> b!1312463 (= e!748590 tp_is_empty!35427)))

(declare-fun b!1312464 () Bool)

(declare-fun res!871368 () Bool)

(assert (=> b!1312464 (=> (not res!871368) (not e!748589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87840 (_ BitVec 32)) Bool)

(assert (=> b!1312464 (= res!871368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312465 () Bool)

(declare-fun res!871371 () Bool)

(assert (=> b!1312465 (=> (not res!871371) (not e!748589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312465 (= res!871371 (validKeyInArray!0 (select (arr!42400 _keys!1628) from!2020)))))

(declare-fun b!1312466 () Bool)

(declare-fun res!871373 () Bool)

(assert (=> b!1312466 (=> (not res!871373) (not e!748589))))

(declare-fun minValue!1296 () V!52339)

(declare-fun zeroValue!1296 () V!52339)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22930 0))(
  ( (tuple2!22931 (_1!11476 (_ BitVec 64)) (_2!11476 V!52339)) )
))
(declare-datatypes ((List!30069 0))(
  ( (Nil!30066) (Cons!30065 (h!31274 tuple2!22930) (t!43675 List!30069)) )
))
(declare-datatypes ((ListLongMap!20587 0))(
  ( (ListLongMap!20588 (toList!10309 List!30069)) )
))
(declare-fun contains!8459 (ListLongMap!20587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5322 (array!87840 array!87842 (_ BitVec 32) (_ BitVec 32) V!52339 V!52339 (_ BitVec 32) Int) ListLongMap!20587)

(assert (=> b!1312466 (= res!871373 (contains!8459 (getCurrentListMap!5322 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54769 () Bool)

(declare-fun mapRes!54769 () Bool)

(assert (=> mapIsEmpty!54769 mapRes!54769))

(declare-fun b!1312467 () Bool)

(declare-fun res!871370 () Bool)

(assert (=> b!1312467 (=> (not res!871370) (not e!748589))))

(assert (=> b!1312467 (= res!871370 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54769 () Bool)

(declare-fun tp!104413 () Bool)

(assert (=> mapNonEmpty!54769 (= mapRes!54769 (and tp!104413 e!748590))))

(declare-fun mapRest!54769 () (Array (_ BitVec 32) ValueCell!16815))

(declare-fun mapValue!54769 () ValueCell!16815)

(declare-fun mapKey!54769 () (_ BitVec 32))

(assert (=> mapNonEmpty!54769 (= (arr!42401 _values!1354) (store mapRest!54769 mapKey!54769 mapValue!54769))))

(declare-fun b!1312468 () Bool)

(declare-fun res!871366 () Bool)

(assert (=> b!1312468 (=> (not res!871366) (not e!748589))))

(assert (=> b!1312468 (= res!871366 (not (= (select (arr!42400 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312469 () Bool)

(assert (=> b!1312469 (= e!748589 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(assert (=> b!1312469 (contains!8459 (getCurrentListMap!5322 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43384 0))(
  ( (Unit!43385) )
))
(declare-fun lt!585564 () Unit!43384)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!19 (array!87840 array!87842 (_ BitVec 32) (_ BitVec 32) V!52339 V!52339 (_ BitVec 64) (_ BitVec 32) Int) Unit!43384)

(assert (=> b!1312469 (= lt!585564 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!19 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312470 () Bool)

(assert (=> b!1312470 (= e!748591 (and e!748592 mapRes!54769))))

(declare-fun condMapEmpty!54769 () Bool)

(declare-fun mapDefault!54769 () ValueCell!16815)

(assert (=> b!1312470 (= condMapEmpty!54769 (= (arr!42401 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16815)) mapDefault!54769)))))

(assert (= (and start!110862 res!871367) b!1312459))

(assert (= (and b!1312459 res!871374) b!1312464))

(assert (= (and b!1312464 res!871368) b!1312462))

(assert (= (and b!1312462 res!871372) b!1312460))

(assert (= (and b!1312460 res!871369) b!1312466))

(assert (= (and b!1312466 res!871373) b!1312468))

(assert (= (and b!1312468 res!871366) b!1312465))

(assert (= (and b!1312465 res!871371) b!1312467))

(assert (= (and b!1312467 res!871370) b!1312469))

(assert (= (and b!1312470 condMapEmpty!54769) mapIsEmpty!54769))

(assert (= (and b!1312470 (not condMapEmpty!54769)) mapNonEmpty!54769))

(get-info :version)

(assert (= (and mapNonEmpty!54769 ((_ is ValueCellFull!16815) mapValue!54769)) b!1312463))

(assert (= (and b!1312470 ((_ is ValueCellFull!16815) mapDefault!54769)) b!1312461))

(assert (= start!110862 b!1312470))

(declare-fun m!1201631 () Bool)

(assert (=> b!1312462 m!1201631))

(declare-fun m!1201633 () Bool)

(assert (=> start!110862 m!1201633))

(declare-fun m!1201635 () Bool)

(assert (=> start!110862 m!1201635))

(declare-fun m!1201637 () Bool)

(assert (=> start!110862 m!1201637))

(declare-fun m!1201639 () Bool)

(assert (=> b!1312466 m!1201639))

(assert (=> b!1312466 m!1201639))

(declare-fun m!1201641 () Bool)

(assert (=> b!1312466 m!1201641))

(declare-fun m!1201643 () Bool)

(assert (=> b!1312468 m!1201643))

(declare-fun m!1201645 () Bool)

(assert (=> b!1312464 m!1201645))

(assert (=> b!1312465 m!1201643))

(assert (=> b!1312465 m!1201643))

(declare-fun m!1201647 () Bool)

(assert (=> b!1312465 m!1201647))

(declare-fun m!1201649 () Bool)

(assert (=> mapNonEmpty!54769 m!1201649))

(declare-fun m!1201651 () Bool)

(assert (=> b!1312469 m!1201651))

(assert (=> b!1312469 m!1201651))

(declare-fun m!1201653 () Bool)

(assert (=> b!1312469 m!1201653))

(declare-fun m!1201655 () Bool)

(assert (=> b!1312469 m!1201655))

(check-sat (not b!1312465) (not b!1312466) b_and!47905 tp_is_empty!35427 (not start!110862) (not b!1312469) (not b!1312464) (not b!1312462) (not mapNonEmpty!54769) (not b_next!29697))
(check-sat b_and!47905 (not b_next!29697))
