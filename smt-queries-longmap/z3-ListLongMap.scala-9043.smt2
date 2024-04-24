; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109266 () Bool)

(assert start!109266)

(declare-fun b_free!28531 () Bool)

(declare-fun b_next!28531 () Bool)

(assert (=> start!109266 (= b_free!28531 (not b_next!28531))))

(declare-fun tp!100712 () Bool)

(declare-fun b_and!46623 () Bool)

(assert (=> start!109266 (= tp!100712 b_and!46623)))

(declare-fun b!1290146 () Bool)

(declare-fun res!856590 () Bool)

(declare-fun e!736766 () Bool)

(assert (=> b!1290146 (=> (not res!856590) (not e!736766))))

(declare-datatypes ((array!85421 0))(
  ( (array!85422 (arr!41207 (Array (_ BitVec 32) (_ BitVec 64))) (size!41758 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85421)

(declare-datatypes ((List!29230 0))(
  ( (Nil!29227) (Cons!29226 (h!30444 (_ BitVec 64)) (t!42786 List!29230)) )
))
(declare-fun arrayNoDuplicates!0 (array!85421 (_ BitVec 32) List!29230) Bool)

(assert (=> b!1290146 (= res!856590 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29227))))

(declare-fun b!1290147 () Bool)

(declare-fun e!736764 () Bool)

(declare-fun e!736767 () Bool)

(declare-fun mapRes!52817 () Bool)

(assert (=> b!1290147 (= e!736764 (and e!736767 mapRes!52817))))

(declare-fun condMapEmpty!52817 () Bool)

(declare-datatypes ((V!50665 0))(
  ( (V!50666 (val!17160 Int)) )
))
(declare-datatypes ((ValueCell!16187 0))(
  ( (ValueCellFull!16187 (v!19758 V!50665)) (EmptyCell!16187) )
))
(declare-datatypes ((array!85423 0))(
  ( (array!85424 (arr!41208 (Array (_ BitVec 32) ValueCell!16187)) (size!41759 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85423)

(declare-fun mapDefault!52817 () ValueCell!16187)

(assert (=> b!1290147 (= condMapEmpty!52817 (= (arr!41208 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16187)) mapDefault!52817)))))

(declare-fun b!1290148 () Bool)

(declare-fun res!856595 () Bool)

(assert (=> b!1290148 (=> (not res!856595) (not e!736766))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290148 (= res!856595 (not (validKeyInArray!0 (select (arr!41207 _keys!1741) from!2144))))))

(declare-fun b!1290149 () Bool)

(declare-fun e!736763 () Bool)

(declare-fun tp_is_empty!34171 () Bool)

(assert (=> b!1290149 (= e!736763 tp_is_empty!34171)))

(declare-fun b!1290150 () Bool)

(declare-fun res!856594 () Bool)

(assert (=> b!1290150 (=> (not res!856594) (not e!736766))))

(declare-fun minValue!1387 () V!50665)

(declare-fun zeroValue!1387 () V!50665)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22046 0))(
  ( (tuple2!22047 (_1!11034 (_ BitVec 64)) (_2!11034 V!50665)) )
))
(declare-datatypes ((List!29231 0))(
  ( (Nil!29228) (Cons!29227 (h!30445 tuple2!22046) (t!42787 List!29231)) )
))
(declare-datatypes ((ListLongMap!19711 0))(
  ( (ListLongMap!19712 (toList!9871 List!29231)) )
))
(declare-fun contains!8002 (ListLongMap!19711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4918 (array!85421 array!85423 (_ BitVec 32) (_ BitVec 32) V!50665 V!50665 (_ BitVec 32) Int) ListLongMap!19711)

(assert (=> b!1290150 (= res!856594 (contains!8002 (getCurrentListMap!4918 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290151 () Bool)

(declare-fun e!736762 () Bool)

(assert (=> b!1290151 (= e!736766 (not e!736762))))

(declare-fun res!856589 () Bool)

(assert (=> b!1290151 (=> res!856589 e!736762)))

(assert (=> b!1290151 (= res!856589 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290151 (not (contains!8002 (ListLongMap!19712 Nil!29228) k0!1205))))

(declare-datatypes ((Unit!42591 0))(
  ( (Unit!42592) )
))
(declare-fun lt!578577 () Unit!42591)

(declare-fun emptyContainsNothing!49 ((_ BitVec 64)) Unit!42591)

(assert (=> b!1290151 (= lt!578577 (emptyContainsNothing!49 k0!1205))))

(declare-fun b!1290152 () Bool)

(declare-fun res!856597 () Bool)

(assert (=> b!1290152 (=> (not res!856597) (not e!736766))))

(assert (=> b!1290152 (= res!856597 (and (= (size!41759 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41758 _keys!1741) (size!41759 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!856591 () Bool)

(assert (=> start!109266 (=> (not res!856591) (not e!736766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109266 (= res!856591 (validMask!0 mask!2175))))

(assert (=> start!109266 e!736766))

(assert (=> start!109266 tp_is_empty!34171))

(assert (=> start!109266 true))

(declare-fun array_inv!31449 (array!85423) Bool)

(assert (=> start!109266 (and (array_inv!31449 _values!1445) e!736764)))

(declare-fun array_inv!31450 (array!85421) Bool)

(assert (=> start!109266 (array_inv!31450 _keys!1741)))

(assert (=> start!109266 tp!100712))

(declare-fun b!1290153 () Bool)

(declare-fun res!856596 () Bool)

(assert (=> b!1290153 (=> (not res!856596) (not e!736766))))

(assert (=> b!1290153 (= res!856596 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41758 _keys!1741))))))

(declare-fun mapIsEmpty!52817 () Bool)

(assert (=> mapIsEmpty!52817 mapRes!52817))

(declare-fun b!1290154 () Bool)

(assert (=> b!1290154 (= e!736767 tp_is_empty!34171)))

(declare-fun mapNonEmpty!52817 () Bool)

(declare-fun tp!100711 () Bool)

(assert (=> mapNonEmpty!52817 (= mapRes!52817 (and tp!100711 e!736763))))

(declare-fun mapValue!52817 () ValueCell!16187)

(declare-fun mapKey!52817 () (_ BitVec 32))

(declare-fun mapRest!52817 () (Array (_ BitVec 32) ValueCell!16187))

(assert (=> mapNonEmpty!52817 (= (arr!41208 _values!1445) (store mapRest!52817 mapKey!52817 mapValue!52817))))

(declare-fun b!1290155 () Bool)

(declare-fun res!856592 () Bool)

(assert (=> b!1290155 (=> (not res!856592) (not e!736766))))

(assert (=> b!1290155 (= res!856592 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41758 _keys!1741))))))

(declare-fun b!1290156 () Bool)

(assert (=> b!1290156 (= e!736762 true)))

(declare-fun lt!578575 () ListLongMap!19711)

(declare-fun +!4377 (ListLongMap!19711 tuple2!22046) ListLongMap!19711)

(assert (=> b!1290156 (not (contains!8002 (+!4377 lt!578575 (tuple2!22047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578576 () Unit!42591)

(declare-fun addStillNotContains!353 (ListLongMap!19711 (_ BitVec 64) V!50665 (_ BitVec 64)) Unit!42591)

(assert (=> b!1290156 (= lt!578576 (addStillNotContains!353 lt!578575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6015 (array!85421 array!85423 (_ BitVec 32) (_ BitVec 32) V!50665 V!50665 (_ BitVec 32) Int) ListLongMap!19711)

(assert (=> b!1290156 (= lt!578575 (getCurrentListMapNoExtraKeys!6015 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290157 () Bool)

(declare-fun res!856593 () Bool)

(assert (=> b!1290157 (=> (not res!856593) (not e!736766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85421 (_ BitVec 32)) Bool)

(assert (=> b!1290157 (= res!856593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109266 res!856591) b!1290152))

(assert (= (and b!1290152 res!856597) b!1290157))

(assert (= (and b!1290157 res!856593) b!1290146))

(assert (= (and b!1290146 res!856590) b!1290153))

(assert (= (and b!1290153 res!856596) b!1290150))

(assert (= (and b!1290150 res!856594) b!1290155))

(assert (= (and b!1290155 res!856592) b!1290148))

(assert (= (and b!1290148 res!856595) b!1290151))

(assert (= (and b!1290151 (not res!856589)) b!1290156))

(assert (= (and b!1290147 condMapEmpty!52817) mapIsEmpty!52817))

(assert (= (and b!1290147 (not condMapEmpty!52817)) mapNonEmpty!52817))

(get-info :version)

(assert (= (and mapNonEmpty!52817 ((_ is ValueCellFull!16187) mapValue!52817)) b!1290149))

(assert (= (and b!1290147 ((_ is ValueCellFull!16187) mapDefault!52817)) b!1290154))

(assert (= start!109266 b!1290147))

(declare-fun m!1183029 () Bool)

(assert (=> b!1290151 m!1183029))

(declare-fun m!1183031 () Bool)

(assert (=> b!1290151 m!1183031))

(declare-fun m!1183033 () Bool)

(assert (=> b!1290150 m!1183033))

(assert (=> b!1290150 m!1183033))

(declare-fun m!1183035 () Bool)

(assert (=> b!1290150 m!1183035))

(declare-fun m!1183037 () Bool)

(assert (=> b!1290146 m!1183037))

(declare-fun m!1183039 () Bool)

(assert (=> b!1290148 m!1183039))

(assert (=> b!1290148 m!1183039))

(declare-fun m!1183041 () Bool)

(assert (=> b!1290148 m!1183041))

(declare-fun m!1183043 () Bool)

(assert (=> b!1290156 m!1183043))

(assert (=> b!1290156 m!1183043))

(declare-fun m!1183045 () Bool)

(assert (=> b!1290156 m!1183045))

(declare-fun m!1183047 () Bool)

(assert (=> b!1290156 m!1183047))

(declare-fun m!1183049 () Bool)

(assert (=> b!1290156 m!1183049))

(declare-fun m!1183051 () Bool)

(assert (=> start!109266 m!1183051))

(declare-fun m!1183053 () Bool)

(assert (=> start!109266 m!1183053))

(declare-fun m!1183055 () Bool)

(assert (=> start!109266 m!1183055))

(declare-fun m!1183057 () Bool)

(assert (=> mapNonEmpty!52817 m!1183057))

(declare-fun m!1183059 () Bool)

(assert (=> b!1290157 m!1183059))

(check-sat (not b!1290151) tp_is_empty!34171 b_and!46623 (not b!1290148) (not b!1290150) (not b!1290146) (not b!1290156) (not start!109266) (not mapNonEmpty!52817) (not b_next!28531) (not b!1290157))
(check-sat b_and!46623 (not b_next!28531))
