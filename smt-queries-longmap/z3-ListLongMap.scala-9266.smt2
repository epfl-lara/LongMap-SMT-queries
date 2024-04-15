; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110944 () Bool)

(assert start!110944)

(declare-fun b_free!29779 () Bool)

(declare-fun b_next!29779 () Bool)

(assert (=> start!110944 (= b_free!29779 (not b_next!29779))))

(declare-fun tp!104660 () Bool)

(declare-fun b_and!47969 () Bool)

(assert (=> start!110944 (= tp!104660 b_and!47969)))

(declare-fun b!1313416 () Bool)

(declare-fun e!749173 () Bool)

(declare-fun tp_is_empty!35509 () Bool)

(assert (=> b!1313416 (= e!749173 tp_is_empty!35509)))

(declare-fun b!1313417 () Bool)

(declare-fun res!871995 () Bool)

(declare-fun e!749174 () Bool)

(assert (=> b!1313417 (=> (not res!871995) (not e!749174))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52449 0))(
  ( (V!52450 (val!17829 Int)) )
))
(declare-datatypes ((ValueCell!16856 0))(
  ( (ValueCellFull!16856 (v!20455 V!52449)) (EmptyCell!16856) )
))
(declare-datatypes ((array!87901 0))(
  ( (array!87902 (arr!42431 (Array (_ BitVec 32) ValueCell!16856)) (size!42983 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87901)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((array!87903 0))(
  ( (array!87904 (arr!42432 (Array (_ BitVec 32) (_ BitVec 64))) (size!42984 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87903)

(assert (=> b!1313417 (= res!871995 (and (= (size!42983 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42984 _keys!1628) (size!42983 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313418 () Bool)

(declare-fun res!871998 () Bool)

(assert (=> b!1313418 (=> (not res!871998) (not e!749174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87903 (_ BitVec 32)) Bool)

(assert (=> b!1313418 (= res!871998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313419 () Bool)

(declare-fun res!871996 () Bool)

(assert (=> b!1313419 (=> (not res!871996) (not e!749174))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313419 (= res!871996 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42984 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313420 () Bool)

(declare-fun e!749172 () Bool)

(declare-fun e!749170 () Bool)

(declare-fun mapRes!54892 () Bool)

(assert (=> b!1313420 (= e!749172 (and e!749170 mapRes!54892))))

(declare-fun condMapEmpty!54892 () Bool)

(declare-fun mapDefault!54892 () ValueCell!16856)

(assert (=> b!1313420 (= condMapEmpty!54892 (= (arr!42431 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16856)) mapDefault!54892)))))

(declare-fun b!1313421 () Bool)

(assert (=> b!1313421 (= e!749174 false)))

(declare-fun lt!585492 () Bool)

(declare-fun minValue!1296 () V!52449)

(declare-fun zeroValue!1296 () V!52449)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23074 0))(
  ( (tuple2!23075 (_1!11548 (_ BitVec 64)) (_2!11548 V!52449)) )
))
(declare-datatypes ((List!30191 0))(
  ( (Nil!30188) (Cons!30187 (h!31396 tuple2!23074) (t!43789 List!30191)) )
))
(declare-datatypes ((ListLongMap!20731 0))(
  ( (ListLongMap!20732 (toList!10381 List!30191)) )
))
(declare-fun contains!8458 (ListLongMap!20731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5276 (array!87903 array!87901 (_ BitVec 32) (_ BitVec 32) V!52449 V!52449 (_ BitVec 32) Int) ListLongMap!20731)

(assert (=> b!1313421 (= lt!585492 (contains!8458 (getCurrentListMap!5276 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54892 () Bool)

(assert (=> mapIsEmpty!54892 mapRes!54892))

(declare-fun b!1313422 () Bool)

(declare-fun res!871999 () Bool)

(assert (=> b!1313422 (=> (not res!871999) (not e!749174))))

(declare-datatypes ((List!30192 0))(
  ( (Nil!30189) (Cons!30188 (h!31397 (_ BitVec 64)) (t!43790 List!30192)) )
))
(declare-fun arrayNoDuplicates!0 (array!87903 (_ BitVec 32) List!30192) Bool)

(assert (=> b!1313422 (= res!871999 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30189))))

(declare-fun mapNonEmpty!54892 () Bool)

(declare-fun tp!104659 () Bool)

(assert (=> mapNonEmpty!54892 (= mapRes!54892 (and tp!104659 e!749173))))

(declare-fun mapRest!54892 () (Array (_ BitVec 32) ValueCell!16856))

(declare-fun mapKey!54892 () (_ BitVec 32))

(declare-fun mapValue!54892 () ValueCell!16856)

(assert (=> mapNonEmpty!54892 (= (arr!42431 _values!1354) (store mapRest!54892 mapKey!54892 mapValue!54892))))

(declare-fun b!1313423 () Bool)

(assert (=> b!1313423 (= e!749170 tp_is_empty!35509)))

(declare-fun res!871997 () Bool)

(assert (=> start!110944 (=> (not res!871997) (not e!749174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110944 (= res!871997 (validMask!0 mask!2040))))

(assert (=> start!110944 e!749174))

(assert (=> start!110944 tp!104660))

(declare-fun array_inv!32241 (array!87903) Bool)

(assert (=> start!110944 (array_inv!32241 _keys!1628)))

(assert (=> start!110944 true))

(assert (=> start!110944 tp_is_empty!35509))

(declare-fun array_inv!32242 (array!87901) Bool)

(assert (=> start!110944 (and (array_inv!32242 _values!1354) e!749172)))

(assert (= (and start!110944 res!871997) b!1313417))

(assert (= (and b!1313417 res!871995) b!1313418))

(assert (= (and b!1313418 res!871998) b!1313422))

(assert (= (and b!1313422 res!871999) b!1313419))

(assert (= (and b!1313419 res!871996) b!1313421))

(assert (= (and b!1313420 condMapEmpty!54892) mapIsEmpty!54892))

(assert (= (and b!1313420 (not condMapEmpty!54892)) mapNonEmpty!54892))

(get-info :version)

(assert (= (and mapNonEmpty!54892 ((_ is ValueCellFull!16856) mapValue!54892)) b!1313416))

(assert (= (and b!1313420 ((_ is ValueCellFull!16856) mapDefault!54892)) b!1313423))

(assert (= start!110944 b!1313420))

(declare-fun m!1201803 () Bool)

(assert (=> mapNonEmpty!54892 m!1201803))

(declare-fun m!1201805 () Bool)

(assert (=> b!1313422 m!1201805))

(declare-fun m!1201807 () Bool)

(assert (=> b!1313421 m!1201807))

(assert (=> b!1313421 m!1201807))

(declare-fun m!1201809 () Bool)

(assert (=> b!1313421 m!1201809))

(declare-fun m!1201811 () Bool)

(assert (=> start!110944 m!1201811))

(declare-fun m!1201813 () Bool)

(assert (=> start!110944 m!1201813))

(declare-fun m!1201815 () Bool)

(assert (=> start!110944 m!1201815))

(declare-fun m!1201817 () Bool)

(assert (=> b!1313418 m!1201817))

(check-sat (not mapNonEmpty!54892) (not b!1313422) (not start!110944) b_and!47969 (not b_next!29779) (not b!1313418) tp_is_empty!35509 (not b!1313421))
(check-sat b_and!47969 (not b_next!29779))
