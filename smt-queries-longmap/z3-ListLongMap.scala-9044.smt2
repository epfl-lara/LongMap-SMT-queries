; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109272 () Bool)

(assert start!109272)

(declare-fun b_free!28537 () Bool)

(declare-fun b_next!28537 () Bool)

(assert (=> start!109272 (= b_free!28537 (not b_next!28537))))

(declare-fun tp!100729 () Bool)

(declare-fun b_and!46629 () Bool)

(assert (=> start!109272 (= tp!100729 b_and!46629)))

(declare-fun b!1290254 () Bool)

(declare-fun e!736820 () Bool)

(assert (=> b!1290254 (= e!736820 true)))

(declare-datatypes ((V!50673 0))(
  ( (V!50674 (val!17163 Int)) )
))
(declare-datatypes ((tuple2!22050 0))(
  ( (tuple2!22051 (_1!11036 (_ BitVec 64)) (_2!11036 V!50673)) )
))
(declare-datatypes ((List!29234 0))(
  ( (Nil!29231) (Cons!29230 (h!30448 tuple2!22050) (t!42790 List!29234)) )
))
(declare-datatypes ((ListLongMap!19715 0))(
  ( (ListLongMap!19716 (toList!9873 List!29234)) )
))
(declare-fun lt!578602 () ListLongMap!19715)

(declare-fun zeroValue!1387 () V!50673)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8004 (ListLongMap!19715 (_ BitVec 64)) Bool)

(declare-fun +!4379 (ListLongMap!19715 tuple2!22050) ListLongMap!19715)

(assert (=> b!1290254 (not (contains!8004 (+!4379 lt!578602 (tuple2!22051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42595 0))(
  ( (Unit!42596) )
))
(declare-fun lt!578604 () Unit!42595)

(declare-fun addStillNotContains!355 (ListLongMap!19715 (_ BitVec 64) V!50673 (_ BitVec 64)) Unit!42595)

(assert (=> b!1290254 (= lt!578604 (addStillNotContains!355 lt!578602 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50673)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16190 0))(
  ( (ValueCellFull!16190 (v!19761 V!50673)) (EmptyCell!16190) )
))
(declare-datatypes ((array!85433 0))(
  ( (array!85434 (arr!41213 (Array (_ BitVec 32) ValueCell!16190)) (size!41764 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85433)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85435 0))(
  ( (array!85436 (arr!41214 (Array (_ BitVec 32) (_ BitVec 64))) (size!41765 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85435)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6017 (array!85435 array!85433 (_ BitVec 32) (_ BitVec 32) V!50673 V!50673 (_ BitVec 32) Int) ListLongMap!19715)

(assert (=> b!1290254 (= lt!578602 (getCurrentListMapNoExtraKeys!6017 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290255 () Bool)

(declare-fun res!856678 () Bool)

(declare-fun e!736816 () Bool)

(assert (=> b!1290255 (=> (not res!856678) (not e!736816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85435 (_ BitVec 32)) Bool)

(assert (=> b!1290255 (= res!856678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290256 () Bool)

(declare-fun res!856673 () Bool)

(assert (=> b!1290256 (=> (not res!856673) (not e!736816))))

(assert (=> b!1290256 (= res!856673 (and (= (size!41764 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41765 _keys!1741) (size!41764 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290257 () Bool)

(declare-fun res!856676 () Bool)

(assert (=> b!1290257 (=> (not res!856676) (not e!736816))))

(declare-fun getCurrentListMap!4919 (array!85435 array!85433 (_ BitVec 32) (_ BitVec 32) V!50673 V!50673 (_ BitVec 32) Int) ListLongMap!19715)

(assert (=> b!1290257 (= res!856676 (contains!8004 (getCurrentListMap!4919 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!856674 () Bool)

(assert (=> start!109272 (=> (not res!856674) (not e!736816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109272 (= res!856674 (validMask!0 mask!2175))))

(assert (=> start!109272 e!736816))

(declare-fun tp_is_empty!34177 () Bool)

(assert (=> start!109272 tp_is_empty!34177))

(assert (=> start!109272 true))

(declare-fun e!736821 () Bool)

(declare-fun array_inv!31453 (array!85433) Bool)

(assert (=> start!109272 (and (array_inv!31453 _values!1445) e!736821)))

(declare-fun array_inv!31454 (array!85435) Bool)

(assert (=> start!109272 (array_inv!31454 _keys!1741)))

(assert (=> start!109272 tp!100729))

(declare-fun b!1290258 () Bool)

(declare-fun e!736818 () Bool)

(assert (=> b!1290258 (= e!736818 tp_is_empty!34177)))

(declare-fun b!1290259 () Bool)

(declare-fun res!856672 () Bool)

(assert (=> b!1290259 (=> (not res!856672) (not e!736816))))

(assert (=> b!1290259 (= res!856672 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41765 _keys!1741))))))

(declare-fun b!1290260 () Bool)

(declare-fun e!736817 () Bool)

(declare-fun mapRes!52826 () Bool)

(assert (=> b!1290260 (= e!736821 (and e!736817 mapRes!52826))))

(declare-fun condMapEmpty!52826 () Bool)

(declare-fun mapDefault!52826 () ValueCell!16190)

(assert (=> b!1290260 (= condMapEmpty!52826 (= (arr!41213 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16190)) mapDefault!52826)))))

(declare-fun b!1290261 () Bool)

(declare-fun res!856671 () Bool)

(assert (=> b!1290261 (=> (not res!856671) (not e!736816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290261 (= res!856671 (not (validKeyInArray!0 (select (arr!41214 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52826 () Bool)

(declare-fun tp!100730 () Bool)

(assert (=> mapNonEmpty!52826 (= mapRes!52826 (and tp!100730 e!736818))))

(declare-fun mapRest!52826 () (Array (_ BitVec 32) ValueCell!16190))

(declare-fun mapKey!52826 () (_ BitVec 32))

(declare-fun mapValue!52826 () ValueCell!16190)

(assert (=> mapNonEmpty!52826 (= (arr!41213 _values!1445) (store mapRest!52826 mapKey!52826 mapValue!52826))))

(declare-fun mapIsEmpty!52826 () Bool)

(assert (=> mapIsEmpty!52826 mapRes!52826))

(declare-fun b!1290262 () Bool)

(assert (=> b!1290262 (= e!736817 tp_is_empty!34177)))

(declare-fun b!1290263 () Bool)

(declare-fun res!856677 () Bool)

(assert (=> b!1290263 (=> (not res!856677) (not e!736816))))

(assert (=> b!1290263 (= res!856677 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41765 _keys!1741))))))

(declare-fun b!1290264 () Bool)

(declare-fun res!856675 () Bool)

(assert (=> b!1290264 (=> (not res!856675) (not e!736816))))

(declare-datatypes ((List!29235 0))(
  ( (Nil!29232) (Cons!29231 (h!30449 (_ BitVec 64)) (t!42791 List!29235)) )
))
(declare-fun arrayNoDuplicates!0 (array!85435 (_ BitVec 32) List!29235) Bool)

(assert (=> b!1290264 (= res!856675 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29232))))

(declare-fun b!1290265 () Bool)

(assert (=> b!1290265 (= e!736816 (not e!736820))))

(declare-fun res!856670 () Bool)

(assert (=> b!1290265 (=> res!856670 e!736820)))

(assert (=> b!1290265 (= res!856670 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290265 (not (contains!8004 (ListLongMap!19716 Nil!29231) k0!1205))))

(declare-fun lt!578603 () Unit!42595)

(declare-fun emptyContainsNothing!51 ((_ BitVec 64)) Unit!42595)

(assert (=> b!1290265 (= lt!578603 (emptyContainsNothing!51 k0!1205))))

(assert (= (and start!109272 res!856674) b!1290256))

(assert (= (and b!1290256 res!856673) b!1290255))

(assert (= (and b!1290255 res!856678) b!1290264))

(assert (= (and b!1290264 res!856675) b!1290259))

(assert (= (and b!1290259 res!856672) b!1290257))

(assert (= (and b!1290257 res!856676) b!1290263))

(assert (= (and b!1290263 res!856677) b!1290261))

(assert (= (and b!1290261 res!856671) b!1290265))

(assert (= (and b!1290265 (not res!856670)) b!1290254))

(assert (= (and b!1290260 condMapEmpty!52826) mapIsEmpty!52826))

(assert (= (and b!1290260 (not condMapEmpty!52826)) mapNonEmpty!52826))

(get-info :version)

(assert (= (and mapNonEmpty!52826 ((_ is ValueCellFull!16190) mapValue!52826)) b!1290258))

(assert (= (and b!1290260 ((_ is ValueCellFull!16190) mapDefault!52826)) b!1290262))

(assert (= start!109272 b!1290260))

(declare-fun m!1183125 () Bool)

(assert (=> b!1290261 m!1183125))

(assert (=> b!1290261 m!1183125))

(declare-fun m!1183127 () Bool)

(assert (=> b!1290261 m!1183127))

(declare-fun m!1183129 () Bool)

(assert (=> start!109272 m!1183129))

(declare-fun m!1183131 () Bool)

(assert (=> start!109272 m!1183131))

(declare-fun m!1183133 () Bool)

(assert (=> start!109272 m!1183133))

(declare-fun m!1183135 () Bool)

(assert (=> b!1290257 m!1183135))

(assert (=> b!1290257 m!1183135))

(declare-fun m!1183137 () Bool)

(assert (=> b!1290257 m!1183137))

(declare-fun m!1183139 () Bool)

(assert (=> b!1290265 m!1183139))

(declare-fun m!1183141 () Bool)

(assert (=> b!1290265 m!1183141))

(declare-fun m!1183143 () Bool)

(assert (=> b!1290264 m!1183143))

(declare-fun m!1183145 () Bool)

(assert (=> b!1290254 m!1183145))

(assert (=> b!1290254 m!1183145))

(declare-fun m!1183147 () Bool)

(assert (=> b!1290254 m!1183147))

(declare-fun m!1183149 () Bool)

(assert (=> b!1290254 m!1183149))

(declare-fun m!1183151 () Bool)

(assert (=> b!1290254 m!1183151))

(declare-fun m!1183153 () Bool)

(assert (=> mapNonEmpty!52826 m!1183153))

(declare-fun m!1183155 () Bool)

(assert (=> b!1290255 m!1183155))

(check-sat (not b!1290265) b_and!46629 (not start!109272) (not b!1290254) tp_is_empty!34177 (not b!1290261) (not b!1290264) (not mapNonEmpty!52826) (not b!1290255) (not b!1290257) (not b_next!28537))
(check-sat b_and!46629 (not b_next!28537))
