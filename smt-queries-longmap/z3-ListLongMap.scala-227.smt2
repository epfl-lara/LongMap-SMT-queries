; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4034 () Bool)

(assert start!4034)

(declare-fun b_free!949 () Bool)

(declare-fun b_next!949 () Bool)

(assert (=> start!4034 (= b_free!949 (not b_next!949))))

(declare-fun tp!4266 () Bool)

(declare-fun b_and!1753 () Bool)

(assert (=> start!4034 (= tp!4266 b_and!1753)))

(declare-fun b!29589 () Bool)

(declare-fun res!17761 () Bool)

(declare-fun e!19085 () Bool)

(assert (=> b!29589 (=> (not res!17761) (not e!19085))))

(declare-datatypes ((array!1811 0))(
  ( (array!1812 (arr!859 (Array (_ BitVec 32) (_ BitVec 64))) (size!960 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1811)

(declare-datatypes ((List!714 0))(
  ( (Nil!711) (Cons!710 (h!1277 (_ BitVec 64)) (t!3400 List!714)) )
))
(declare-fun arrayNoDuplicates!0 (array!1811 (_ BitVec 32) List!714) Bool)

(assert (=> b!29589 (= res!17761 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!711))))

(declare-fun b!29590 () Bool)

(declare-fun res!17763 () Bool)

(assert (=> b!29590 (=> (not res!17763) (not e!19085))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29590 (= res!17763 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29591 () Bool)

(declare-fun res!17759 () Bool)

(assert (=> b!29591 (=> (not res!17759) (not e!19085))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1563 0))(
  ( (V!1564 (val!678 Int)) )
))
(declare-datatypes ((ValueCell!452 0))(
  ( (ValueCellFull!452 (v!1766 V!1563)) (EmptyCell!452) )
))
(declare-datatypes ((array!1813 0))(
  ( (array!1814 (arr!860 (Array (_ BitVec 32) ValueCell!452)) (size!961 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1813)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1563)

(declare-fun minValue!1443 () V!1563)

(declare-datatypes ((tuple2!1134 0))(
  ( (tuple2!1135 (_1!578 (_ BitVec 64)) (_2!578 V!1563)) )
))
(declare-datatypes ((List!715 0))(
  ( (Nil!712) (Cons!711 (h!1278 tuple2!1134) (t!3401 List!715)) )
))
(declare-datatypes ((ListLongMap!699 0))(
  ( (ListLongMap!700 (toList!365 List!715)) )
))
(declare-fun contains!306 (ListLongMap!699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!189 (array!1811 array!1813 (_ BitVec 32) (_ BitVec 32) V!1563 V!1563 (_ BitVec 32) Int) ListLongMap!699)

(assert (=> b!29591 (= res!17759 (not (contains!306 (getCurrentListMap!189 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1483 () Bool)

(declare-fun mapRes!1483 () Bool)

(declare-fun tp!4267 () Bool)

(declare-fun e!19087 () Bool)

(assert (=> mapNonEmpty!1483 (= mapRes!1483 (and tp!4267 e!19087))))

(declare-fun mapKey!1483 () (_ BitVec 32))

(declare-fun mapRest!1483 () (Array (_ BitVec 32) ValueCell!452))

(declare-fun mapValue!1483 () ValueCell!452)

(assert (=> mapNonEmpty!1483 (= (arr!860 _values!1501) (store mapRest!1483 mapKey!1483 mapValue!1483))))

(declare-fun mapIsEmpty!1483 () Bool)

(assert (=> mapIsEmpty!1483 mapRes!1483))

(declare-fun b!29592 () Bool)

(declare-fun res!17758 () Bool)

(assert (=> b!29592 (=> (not res!17758) (not e!19085))))

(assert (=> b!29592 (= res!17758 (and (= (size!961 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!960 _keys!1833) (size!961 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29593 () Bool)

(declare-fun res!17762 () Bool)

(assert (=> b!29593 (=> (not res!17762) (not e!19085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1811 (_ BitVec 32)) Bool)

(assert (=> b!29593 (= res!17762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29594 () Bool)

(declare-fun tp_is_empty!1303 () Bool)

(assert (=> b!29594 (= e!19087 tp_is_empty!1303)))

(declare-fun b!29595 () Bool)

(assert (=> b!29595 (= e!19085 (not (= (size!960 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!29597 () Bool)

(declare-fun e!19083 () Bool)

(assert (=> b!29597 (= e!19083 tp_is_empty!1303)))

(declare-fun b!29598 () Bool)

(declare-fun e!19086 () Bool)

(assert (=> b!29598 (= e!19086 (and e!19083 mapRes!1483))))

(declare-fun condMapEmpty!1483 () Bool)

(declare-fun mapDefault!1483 () ValueCell!452)

(assert (=> b!29598 (= condMapEmpty!1483 (= (arr!860 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!452)) mapDefault!1483)))))

(declare-fun res!17764 () Bool)

(assert (=> start!4034 (=> (not res!17764) (not e!19085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4034 (= res!17764 (validMask!0 mask!2294))))

(assert (=> start!4034 e!19085))

(assert (=> start!4034 true))

(assert (=> start!4034 tp!4266))

(declare-fun array_inv!601 (array!1813) Bool)

(assert (=> start!4034 (and (array_inv!601 _values!1501) e!19086)))

(declare-fun array_inv!602 (array!1811) Bool)

(assert (=> start!4034 (array_inv!602 _keys!1833)))

(assert (=> start!4034 tp_is_empty!1303))

(declare-fun b!29596 () Bool)

(declare-fun res!17760 () Bool)

(assert (=> b!29596 (=> (not res!17760) (not e!19085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29596 (= res!17760 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4034 res!17764) b!29592))

(assert (= (and b!29592 res!17758) b!29593))

(assert (= (and b!29593 res!17762) b!29589))

(assert (= (and b!29589 res!17761) b!29596))

(assert (= (and b!29596 res!17760) b!29591))

(assert (= (and b!29591 res!17759) b!29590))

(assert (= (and b!29590 res!17763) b!29595))

(assert (= (and b!29598 condMapEmpty!1483) mapIsEmpty!1483))

(assert (= (and b!29598 (not condMapEmpty!1483)) mapNonEmpty!1483))

(get-info :version)

(assert (= (and mapNonEmpty!1483 ((_ is ValueCellFull!452) mapValue!1483)) b!29594))

(assert (= (and b!29598 ((_ is ValueCellFull!452) mapDefault!1483)) b!29597))

(assert (= start!4034 b!29598))

(declare-fun m!23805 () Bool)

(assert (=> b!29589 m!23805))

(declare-fun m!23807 () Bool)

(assert (=> start!4034 m!23807))

(declare-fun m!23809 () Bool)

(assert (=> start!4034 m!23809))

(declare-fun m!23811 () Bool)

(assert (=> start!4034 m!23811))

(declare-fun m!23813 () Bool)

(assert (=> b!29593 m!23813))

(declare-fun m!23815 () Bool)

(assert (=> b!29590 m!23815))

(declare-fun m!23817 () Bool)

(assert (=> b!29596 m!23817))

(declare-fun m!23819 () Bool)

(assert (=> b!29591 m!23819))

(assert (=> b!29591 m!23819))

(declare-fun m!23821 () Bool)

(assert (=> b!29591 m!23821))

(declare-fun m!23823 () Bool)

(assert (=> mapNonEmpty!1483 m!23823))

(check-sat b_and!1753 (not b!29591) (not b!29590) (not b!29593) (not mapNonEmpty!1483) (not start!4034) (not b!29596) (not b_next!949) tp_is_empty!1303 (not b!29589))
(check-sat b_and!1753 (not b_next!949))
