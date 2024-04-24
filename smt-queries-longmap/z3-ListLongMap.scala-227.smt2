; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4040 () Bool)

(assert start!4040)

(declare-fun b_free!949 () Bool)

(declare-fun b_next!949 () Bool)

(assert (=> start!4040 (= b_free!949 (not b_next!949))))

(declare-fun tp!4267 () Bool)

(declare-fun b_and!1749 () Bool)

(assert (=> start!4040 (= tp!4267 b_and!1749)))

(declare-fun b!29571 () Bool)

(declare-fun e!19074 () Bool)

(declare-fun e!19076 () Bool)

(declare-fun mapRes!1483 () Bool)

(assert (=> b!29571 (= e!19074 (and e!19076 mapRes!1483))))

(declare-fun condMapEmpty!1483 () Bool)

(declare-datatypes ((V!1563 0))(
  ( (V!1564 (val!678 Int)) )
))
(declare-datatypes ((ValueCell!452 0))(
  ( (ValueCellFull!452 (v!1767 V!1563)) (EmptyCell!452) )
))
(declare-datatypes ((array!1817 0))(
  ( (array!1818 (arr!862 (Array (_ BitVec 32) ValueCell!452)) (size!963 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1817)

(declare-fun mapDefault!1483 () ValueCell!452)

(assert (=> b!29571 (= condMapEmpty!1483 (= (arr!862 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!452)) mapDefault!1483)))))

(declare-fun b!29572 () Bool)

(declare-fun res!17752 () Bool)

(declare-fun e!19075 () Bool)

(assert (=> b!29572 (=> (not res!17752) (not e!19075))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1819 0))(
  ( (array!1820 (arr!863 (Array (_ BitVec 32) (_ BitVec 64))) (size!964 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1819)

(declare-fun zeroValue!1443 () V!1563)

(declare-fun minValue!1443 () V!1563)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((tuple2!1120 0))(
  ( (tuple2!1121 (_1!571 (_ BitVec 64)) (_2!571 V!1563)) )
))
(declare-datatypes ((List!711 0))(
  ( (Nil!708) (Cons!707 (h!1274 tuple2!1120) (t!3398 List!711)) )
))
(declare-datatypes ((ListLongMap!691 0))(
  ( (ListLongMap!692 (toList!361 List!711)) )
))
(declare-fun contains!303 (ListLongMap!691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!186 (array!1819 array!1817 (_ BitVec 32) (_ BitVec 32) V!1563 V!1563 (_ BitVec 32) Int) ListLongMap!691)

(assert (=> b!29572 (= res!17752 (not (contains!303 (getCurrentListMap!186 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29573 () Bool)

(declare-fun res!17750 () Bool)

(assert (=> b!29573 (=> (not res!17750) (not e!19075))))

(assert (=> b!29573 (= res!17750 (and (= (size!963 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!964 _keys!1833) (size!963 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29574 () Bool)

(declare-fun e!19078 () Bool)

(declare-fun tp_is_empty!1303 () Bool)

(assert (=> b!29574 (= e!19078 tp_is_empty!1303)))

(declare-fun b!29575 () Bool)

(declare-fun res!17753 () Bool)

(assert (=> b!29575 (=> (not res!17753) (not e!19075))))

(declare-fun arrayContainsKey!0 (array!1819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29575 (= res!17753 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29576 () Bool)

(assert (=> b!29576 (= e!19076 tp_is_empty!1303)))

(declare-fun mapNonEmpty!1483 () Bool)

(declare-fun tp!4266 () Bool)

(assert (=> mapNonEmpty!1483 (= mapRes!1483 (and tp!4266 e!19078))))

(declare-fun mapRest!1483 () (Array (_ BitVec 32) ValueCell!452))

(declare-fun mapKey!1483 () (_ BitVec 32))

(declare-fun mapValue!1483 () ValueCell!452)

(assert (=> mapNonEmpty!1483 (= (arr!862 _values!1501) (store mapRest!1483 mapKey!1483 mapValue!1483))))

(declare-fun mapIsEmpty!1483 () Bool)

(assert (=> mapIsEmpty!1483 mapRes!1483))

(declare-fun b!29577 () Bool)

(declare-fun res!17751 () Bool)

(assert (=> b!29577 (=> (not res!17751) (not e!19075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1819 (_ BitVec 32)) Bool)

(assert (=> b!29577 (= res!17751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29578 () Bool)

(declare-fun res!17755 () Bool)

(assert (=> b!29578 (=> (not res!17755) (not e!19075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29578 (= res!17755 (validKeyInArray!0 k0!1304))))

(declare-fun res!17754 () Bool)

(assert (=> start!4040 (=> (not res!17754) (not e!19075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4040 (= res!17754 (validMask!0 mask!2294))))

(assert (=> start!4040 e!19075))

(assert (=> start!4040 true))

(assert (=> start!4040 tp!4267))

(declare-fun array_inv!595 (array!1817) Bool)

(assert (=> start!4040 (and (array_inv!595 _values!1501) e!19074)))

(declare-fun array_inv!596 (array!1819) Bool)

(assert (=> start!4040 (array_inv!596 _keys!1833)))

(assert (=> start!4040 tp_is_empty!1303))

(declare-fun b!29579 () Bool)

(declare-fun res!17756 () Bool)

(assert (=> b!29579 (=> (not res!17756) (not e!19075))))

(declare-datatypes ((List!712 0))(
  ( (Nil!709) (Cons!708 (h!1275 (_ BitVec 64)) (t!3399 List!712)) )
))
(declare-fun arrayNoDuplicates!0 (array!1819 (_ BitVec 32) List!712) Bool)

(assert (=> b!29579 (= res!17756 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!709))))

(declare-fun b!29580 () Bool)

(assert (=> b!29580 (= e!19075 (not (= (size!964 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(assert (= (and start!4040 res!17754) b!29573))

(assert (= (and b!29573 res!17750) b!29577))

(assert (= (and b!29577 res!17751) b!29579))

(assert (= (and b!29579 res!17756) b!29578))

(assert (= (and b!29578 res!17755) b!29572))

(assert (= (and b!29572 res!17752) b!29575))

(assert (= (and b!29575 res!17753) b!29580))

(assert (= (and b!29571 condMapEmpty!1483) mapIsEmpty!1483))

(assert (= (and b!29571 (not condMapEmpty!1483)) mapNonEmpty!1483))

(get-info :version)

(assert (= (and mapNonEmpty!1483 ((_ is ValueCellFull!452) mapValue!1483)) b!29574))

(assert (= (and b!29571 ((_ is ValueCellFull!452) mapDefault!1483)) b!29576))

(assert (= start!4040 b!29571))

(declare-fun m!23723 () Bool)

(assert (=> start!4040 m!23723))

(declare-fun m!23725 () Bool)

(assert (=> start!4040 m!23725))

(declare-fun m!23727 () Bool)

(assert (=> start!4040 m!23727))

(declare-fun m!23729 () Bool)

(assert (=> b!29575 m!23729))

(declare-fun m!23731 () Bool)

(assert (=> b!29579 m!23731))

(declare-fun m!23733 () Bool)

(assert (=> b!29572 m!23733))

(assert (=> b!29572 m!23733))

(declare-fun m!23735 () Bool)

(assert (=> b!29572 m!23735))

(declare-fun m!23737 () Bool)

(assert (=> b!29577 m!23737))

(declare-fun m!23739 () Bool)

(assert (=> mapNonEmpty!1483 m!23739))

(declare-fun m!23741 () Bool)

(assert (=> b!29578 m!23741))

(check-sat (not b!29572) (not b!29578) (not b!29575) (not b!29577) b_and!1749 (not b_next!949) (not start!4040) (not b!29579) tp_is_empty!1303 (not mapNonEmpty!1483))
(check-sat b_and!1749 (not b_next!949))
