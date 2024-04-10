; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110958 () Bool)

(assert start!110958)

(declare-fun b_free!29793 () Bool)

(declare-fun b_next!29793 () Bool)

(assert (=> start!110958 (= b_free!29793 (not b_next!29793))))

(declare-fun tp!104701 () Bool)

(declare-fun b_and!48001 () Bool)

(assert (=> start!110958 (= tp!104701 b_and!48001)))

(declare-fun b!1313654 () Bool)

(declare-fun res!872132 () Bool)

(declare-fun e!749312 () Bool)

(assert (=> b!1313654 (=> (not res!872132) (not e!749312))))

(declare-datatypes ((array!88022 0))(
  ( (array!88023 (arr!42491 (Array (_ BitVec 32) (_ BitVec 64))) (size!43041 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88022)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52467 0))(
  ( (V!52468 (val!17836 Int)) )
))
(declare-datatypes ((ValueCell!16863 0))(
  ( (ValueCellFull!16863 (v!20463 V!52467)) (EmptyCell!16863) )
))
(declare-datatypes ((array!88024 0))(
  ( (array!88025 (arr!42492 (Array (_ BitVec 32) ValueCell!16863)) (size!43042 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88024)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313654 (= res!872132 (and (= (size!43042 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43041 _keys!1628) (size!43042 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313655 () Bool)

(declare-fun e!749308 () Bool)

(declare-fun e!749309 () Bool)

(declare-fun mapRes!54913 () Bool)

(assert (=> b!1313655 (= e!749308 (and e!749309 mapRes!54913))))

(declare-fun condMapEmpty!54913 () Bool)

(declare-fun mapDefault!54913 () ValueCell!16863)

(assert (=> b!1313655 (= condMapEmpty!54913 (= (arr!42492 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16863)) mapDefault!54913)))))

(declare-fun res!872131 () Bool)

(assert (=> start!110958 (=> (not res!872131) (not e!749312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110958 (= res!872131 (validMask!0 mask!2040))))

(assert (=> start!110958 e!749312))

(assert (=> start!110958 tp!104701))

(declare-fun array_inv!32095 (array!88022) Bool)

(assert (=> start!110958 (array_inv!32095 _keys!1628)))

(assert (=> start!110958 true))

(declare-fun tp_is_empty!35523 () Bool)

(assert (=> start!110958 tp_is_empty!35523))

(declare-fun array_inv!32096 (array!88024) Bool)

(assert (=> start!110958 (and (array_inv!32096 _values!1354) e!749308)))

(declare-fun b!1313656 () Bool)

(declare-fun e!749310 () Bool)

(assert (=> b!1313656 (= e!749310 tp_is_empty!35523)))

(declare-fun b!1313657 () Bool)

(assert (=> b!1313657 (= e!749309 tp_is_empty!35523)))

(declare-fun mapIsEmpty!54913 () Bool)

(assert (=> mapIsEmpty!54913 mapRes!54913))

(declare-fun b!1313658 () Bool)

(declare-fun res!872130 () Bool)

(assert (=> b!1313658 (=> (not res!872130) (not e!749312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88022 (_ BitVec 32)) Bool)

(assert (=> b!1313658 (= res!872130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313659 () Bool)

(assert (=> b!1313659 (= e!749312 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52467)

(declare-fun zeroValue!1296 () V!52467)

(declare-fun lt!585699 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22996 0))(
  ( (tuple2!22997 (_1!11509 (_ BitVec 64)) (_2!11509 V!52467)) )
))
(declare-datatypes ((List!30132 0))(
  ( (Nil!30129) (Cons!30128 (h!31337 tuple2!22996) (t!43738 List!30132)) )
))
(declare-datatypes ((ListLongMap!20653 0))(
  ( (ListLongMap!20654 (toList!10342 List!30132)) )
))
(declare-fun contains!8492 (ListLongMap!20653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5355 (array!88022 array!88024 (_ BitVec 32) (_ BitVec 32) V!52467 V!52467 (_ BitVec 32) Int) ListLongMap!20653)

(assert (=> b!1313659 (= lt!585699 (contains!8492 (getCurrentListMap!5355 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313660 () Bool)

(declare-fun res!872133 () Bool)

(assert (=> b!1313660 (=> (not res!872133) (not e!749312))))

(assert (=> b!1313660 (= res!872133 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43041 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313661 () Bool)

(declare-fun res!872129 () Bool)

(assert (=> b!1313661 (=> (not res!872129) (not e!749312))))

(declare-datatypes ((List!30133 0))(
  ( (Nil!30130) (Cons!30129 (h!31338 (_ BitVec 64)) (t!43739 List!30133)) )
))
(declare-fun arrayNoDuplicates!0 (array!88022 (_ BitVec 32) List!30133) Bool)

(assert (=> b!1313661 (= res!872129 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30130))))

(declare-fun mapNonEmpty!54913 () Bool)

(declare-fun tp!104700 () Bool)

(assert (=> mapNonEmpty!54913 (= mapRes!54913 (and tp!104700 e!749310))))

(declare-fun mapRest!54913 () (Array (_ BitVec 32) ValueCell!16863))

(declare-fun mapValue!54913 () ValueCell!16863)

(declare-fun mapKey!54913 () (_ BitVec 32))

(assert (=> mapNonEmpty!54913 (= (arr!42492 _values!1354) (store mapRest!54913 mapKey!54913 mapValue!54913))))

(assert (= (and start!110958 res!872131) b!1313654))

(assert (= (and b!1313654 res!872132) b!1313658))

(assert (= (and b!1313658 res!872130) b!1313661))

(assert (= (and b!1313661 res!872129) b!1313660))

(assert (= (and b!1313660 res!872133) b!1313659))

(assert (= (and b!1313655 condMapEmpty!54913) mapIsEmpty!54913))

(assert (= (and b!1313655 (not condMapEmpty!54913)) mapNonEmpty!54913))

(get-info :version)

(assert (= (and mapNonEmpty!54913 ((_ is ValueCellFull!16863) mapValue!54913)) b!1313656))

(assert (= (and b!1313655 ((_ is ValueCellFull!16863) mapDefault!54913)) b!1313657))

(assert (= start!110958 b!1313655))

(declare-fun m!1202431 () Bool)

(assert (=> b!1313661 m!1202431))

(declare-fun m!1202433 () Bool)

(assert (=> b!1313659 m!1202433))

(assert (=> b!1313659 m!1202433))

(declare-fun m!1202435 () Bool)

(assert (=> b!1313659 m!1202435))

(declare-fun m!1202437 () Bool)

(assert (=> b!1313658 m!1202437))

(declare-fun m!1202439 () Bool)

(assert (=> mapNonEmpty!54913 m!1202439))

(declare-fun m!1202441 () Bool)

(assert (=> start!110958 m!1202441))

(declare-fun m!1202443 () Bool)

(assert (=> start!110958 m!1202443))

(declare-fun m!1202445 () Bool)

(assert (=> start!110958 m!1202445))

(check-sat (not mapNonEmpty!54913) (not b!1313661) (not b_next!29793) (not start!110958) (not b!1313658) (not b!1313659) b_and!48001 tp_is_empty!35523)
(check-sat b_and!48001 (not b_next!29793))
