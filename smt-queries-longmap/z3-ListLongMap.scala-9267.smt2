; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110950 () Bool)

(assert start!110950)

(declare-fun b_free!29785 () Bool)

(declare-fun b_next!29785 () Bool)

(assert (=> start!110950 (= b_free!29785 (not b_next!29785))))

(declare-fun tp!104678 () Bool)

(declare-fun b_and!47975 () Bool)

(assert (=> start!110950 (= tp!104678 b_and!47975)))

(declare-fun b!1313488 () Bool)

(declare-fun res!872042 () Bool)

(declare-fun e!749219 () Bool)

(assert (=> b!1313488 (=> (not res!872042) (not e!749219))))

(declare-datatypes ((array!87913 0))(
  ( (array!87914 (arr!42437 (Array (_ BitVec 32) (_ BitVec 64))) (size!42989 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87913)

(declare-datatypes ((List!30197 0))(
  ( (Nil!30194) (Cons!30193 (h!31402 (_ BitVec 64)) (t!43795 List!30197)) )
))
(declare-fun arrayNoDuplicates!0 (array!87913 (_ BitVec 32) List!30197) Bool)

(assert (=> b!1313488 (= res!872042 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30194))))

(declare-fun b!1313489 () Bool)

(declare-fun res!872044 () Bool)

(assert (=> b!1313489 (=> (not res!872044) (not e!749219))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52457 0))(
  ( (V!52458 (val!17832 Int)) )
))
(declare-datatypes ((ValueCell!16859 0))(
  ( (ValueCellFull!16859 (v!20458 V!52457)) (EmptyCell!16859) )
))
(declare-datatypes ((array!87915 0))(
  ( (array!87916 (arr!42438 (Array (_ BitVec 32) ValueCell!16859)) (size!42990 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87915)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313489 (= res!872044 (and (= (size!42990 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42989 _keys!1628) (size!42990 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313490 () Bool)

(declare-fun e!749218 () Bool)

(declare-fun tp_is_empty!35515 () Bool)

(assert (=> b!1313490 (= e!749218 tp_is_empty!35515)))

(declare-fun mapNonEmpty!54901 () Bool)

(declare-fun mapRes!54901 () Bool)

(declare-fun tp!104677 () Bool)

(declare-fun e!749217 () Bool)

(assert (=> mapNonEmpty!54901 (= mapRes!54901 (and tp!104677 e!749217))))

(declare-fun mapValue!54901 () ValueCell!16859)

(declare-fun mapRest!54901 () (Array (_ BitVec 32) ValueCell!16859))

(declare-fun mapKey!54901 () (_ BitVec 32))

(assert (=> mapNonEmpty!54901 (= (arr!42438 _values!1354) (store mapRest!54901 mapKey!54901 mapValue!54901))))

(declare-fun b!1313491 () Bool)

(assert (=> b!1313491 (= e!749219 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52457)

(declare-fun zeroValue!1296 () V!52457)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585501 () Bool)

(declare-datatypes ((tuple2!23080 0))(
  ( (tuple2!23081 (_1!11551 (_ BitVec 64)) (_2!11551 V!52457)) )
))
(declare-datatypes ((List!30198 0))(
  ( (Nil!30195) (Cons!30194 (h!31403 tuple2!23080) (t!43796 List!30198)) )
))
(declare-datatypes ((ListLongMap!20737 0))(
  ( (ListLongMap!20738 (toList!10384 List!30198)) )
))
(declare-fun contains!8461 (ListLongMap!20737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5279 (array!87913 array!87915 (_ BitVec 32) (_ BitVec 32) V!52457 V!52457 (_ BitVec 32) Int) ListLongMap!20737)

(assert (=> b!1313491 (= lt!585501 (contains!8461 (getCurrentListMap!5279 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!872043 () Bool)

(assert (=> start!110950 (=> (not res!872043) (not e!749219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110950 (= res!872043 (validMask!0 mask!2040))))

(assert (=> start!110950 e!749219))

(assert (=> start!110950 tp!104678))

(declare-fun array_inv!32245 (array!87913) Bool)

(assert (=> start!110950 (array_inv!32245 _keys!1628)))

(assert (=> start!110950 true))

(assert (=> start!110950 tp_is_empty!35515))

(declare-fun e!749215 () Bool)

(declare-fun array_inv!32246 (array!87915) Bool)

(assert (=> start!110950 (and (array_inv!32246 _values!1354) e!749215)))

(declare-fun b!1313492 () Bool)

(declare-fun res!872040 () Bool)

(assert (=> b!1313492 (=> (not res!872040) (not e!749219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87913 (_ BitVec 32)) Bool)

(assert (=> b!1313492 (= res!872040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54901 () Bool)

(assert (=> mapIsEmpty!54901 mapRes!54901))

(declare-fun b!1313493 () Bool)

(assert (=> b!1313493 (= e!749217 tp_is_empty!35515)))

(declare-fun b!1313494 () Bool)

(assert (=> b!1313494 (= e!749215 (and e!749218 mapRes!54901))))

(declare-fun condMapEmpty!54901 () Bool)

(declare-fun mapDefault!54901 () ValueCell!16859)

(assert (=> b!1313494 (= condMapEmpty!54901 (= (arr!42438 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16859)) mapDefault!54901)))))

(declare-fun b!1313495 () Bool)

(declare-fun res!872041 () Bool)

(assert (=> b!1313495 (=> (not res!872041) (not e!749219))))

(assert (=> b!1313495 (= res!872041 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42989 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110950 res!872043) b!1313489))

(assert (= (and b!1313489 res!872044) b!1313492))

(assert (= (and b!1313492 res!872040) b!1313488))

(assert (= (and b!1313488 res!872042) b!1313495))

(assert (= (and b!1313495 res!872041) b!1313491))

(assert (= (and b!1313494 condMapEmpty!54901) mapIsEmpty!54901))

(assert (= (and b!1313494 (not condMapEmpty!54901)) mapNonEmpty!54901))

(get-info :version)

(assert (= (and mapNonEmpty!54901 ((_ is ValueCellFull!16859) mapValue!54901)) b!1313493))

(assert (= (and b!1313494 ((_ is ValueCellFull!16859) mapDefault!54901)) b!1313490))

(assert (= start!110950 b!1313494))

(declare-fun m!1201851 () Bool)

(assert (=> start!110950 m!1201851))

(declare-fun m!1201853 () Bool)

(assert (=> start!110950 m!1201853))

(declare-fun m!1201855 () Bool)

(assert (=> start!110950 m!1201855))

(declare-fun m!1201857 () Bool)

(assert (=> b!1313492 m!1201857))

(declare-fun m!1201859 () Bool)

(assert (=> b!1313488 m!1201859))

(declare-fun m!1201861 () Bool)

(assert (=> b!1313491 m!1201861))

(assert (=> b!1313491 m!1201861))

(declare-fun m!1201863 () Bool)

(assert (=> b!1313491 m!1201863))

(declare-fun m!1201865 () Bool)

(assert (=> mapNonEmpty!54901 m!1201865))

(check-sat (not b!1313488) (not b_next!29785) tp_is_empty!35515 (not mapNonEmpty!54901) (not start!110950) (not b!1313491) (not b!1313492) b_and!47975)
(check-sat b_and!47975 (not b_next!29785))
