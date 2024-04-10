; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108750 () Bool)

(assert start!108750)

(declare-fun b_free!28263 () Bool)

(declare-fun b_next!28263 () Bool)

(assert (=> start!108750 (= b_free!28263 (not b_next!28263))))

(declare-fun tp!99905 () Bool)

(declare-fun b_and!46329 () Bool)

(assert (=> start!108750 (= tp!99905 b_and!46329)))

(declare-fun mapIsEmpty!52412 () Bool)

(declare-fun mapRes!52412 () Bool)

(assert (=> mapIsEmpty!52412 mapRes!52412))

(declare-fun mapNonEmpty!52412 () Bool)

(declare-fun tp!99904 () Bool)

(declare-fun e!733531 () Bool)

(assert (=> mapNonEmpty!52412 (= mapRes!52412 (and tp!99904 e!733531))))

(declare-datatypes ((V!50307 0))(
  ( (V!50308 (val!17026 Int)) )
))
(declare-datatypes ((ValueCell!16053 0))(
  ( (ValueCellFull!16053 (v!19628 V!50307)) (EmptyCell!16053) )
))
(declare-fun mapRest!52412 () (Array (_ BitVec 32) ValueCell!16053))

(declare-fun mapValue!52412 () ValueCell!16053)

(declare-datatypes ((array!84864 0))(
  ( (array!84865 (arr!40934 (Array (_ BitVec 32) ValueCell!16053)) (size!41484 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84864)

(declare-fun mapKey!52412 () (_ BitVec 32))

(assert (=> mapNonEmpty!52412 (= (arr!40934 _values!1445) (store mapRest!52412 mapKey!52412 mapValue!52412))))

(declare-fun b!1284172 () Bool)

(declare-fun e!733533 () Bool)

(declare-fun tp_is_empty!33903 () Bool)

(assert (=> b!1284172 (= e!733533 tp_is_empty!33903)))

(declare-fun b!1284173 () Bool)

(declare-fun res!853096 () Bool)

(declare-fun e!733535 () Bool)

(assert (=> b!1284173 (=> (not res!853096) (not e!733535))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84866 0))(
  ( (array!84867 (arr!40935 (Array (_ BitVec 32) (_ BitVec 64))) (size!41485 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84866)

(assert (=> b!1284173 (= res!853096 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41485 _keys!1741))))))

(declare-fun b!1284174 () Bool)

(declare-fun res!853098 () Bool)

(assert (=> b!1284174 (=> (not res!853098) (not e!733535))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84866 (_ BitVec 32)) Bool)

(assert (=> b!1284174 (= res!853098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284175 () Bool)

(declare-fun res!853103 () Bool)

(assert (=> b!1284175 (=> (not res!853103) (not e!733535))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1284175 (= res!853103 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41485 _keys!1741))))))

(declare-fun b!1284176 () Bool)

(declare-fun res!853102 () Bool)

(assert (=> b!1284176 (=> (not res!853102) (not e!733535))))

(declare-fun minValue!1387 () V!50307)

(declare-fun zeroValue!1387 () V!50307)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21810 0))(
  ( (tuple2!21811 (_1!10916 (_ BitVec 64)) (_2!10916 V!50307)) )
))
(declare-datatypes ((List!29003 0))(
  ( (Nil!29000) (Cons!28999 (h!30208 tuple2!21810) (t!42547 List!29003)) )
))
(declare-datatypes ((ListLongMap!19467 0))(
  ( (ListLongMap!19468 (toList!9749 List!29003)) )
))
(declare-fun contains!7866 (ListLongMap!19467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4828 (array!84866 array!84864 (_ BitVec 32) (_ BitVec 32) V!50307 V!50307 (_ BitVec 32) Int) ListLongMap!19467)

(assert (=> b!1284176 (= res!853102 (contains!7866 (getCurrentListMap!4828 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284177 () Bool)

(declare-fun res!853100 () Bool)

(assert (=> b!1284177 (=> (not res!853100) (not e!733535))))

(assert (=> b!1284177 (= res!853100 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284178 () Bool)

(assert (=> b!1284178 (= e!733531 tp_is_empty!33903)))

(declare-fun res!853097 () Bool)

(assert (=> start!108750 (=> (not res!853097) (not e!733535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108750 (= res!853097 (validMask!0 mask!2175))))

(assert (=> start!108750 e!733535))

(assert (=> start!108750 tp_is_empty!33903))

(assert (=> start!108750 true))

(declare-fun e!733532 () Bool)

(declare-fun array_inv!31045 (array!84864) Bool)

(assert (=> start!108750 (and (array_inv!31045 _values!1445) e!733532)))

(declare-fun array_inv!31046 (array!84866) Bool)

(assert (=> start!108750 (array_inv!31046 _keys!1741)))

(assert (=> start!108750 tp!99905))

(declare-fun b!1284179 () Bool)

(assert (=> b!1284179 (= e!733532 (and e!733533 mapRes!52412))))

(declare-fun condMapEmpty!52412 () Bool)

(declare-fun mapDefault!52412 () ValueCell!16053)

(assert (=> b!1284179 (= condMapEmpty!52412 (= (arr!40934 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16053)) mapDefault!52412)))))

(declare-fun b!1284180 () Bool)

(assert (=> b!1284180 (= e!733535 (not true))))

(declare-fun lt!576778 () ListLongMap!19467)

(assert (=> b!1284180 (contains!7866 lt!576778 k0!1205)))

(declare-datatypes ((Unit!42505 0))(
  ( (Unit!42506) )
))
(declare-fun lt!576777 () Unit!42505)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!23 ((_ BitVec 64) (_ BitVec 64) V!50307 ListLongMap!19467) Unit!42505)

(assert (=> b!1284180 (= lt!576777 (lemmaInListMapAfterAddingDiffThenInBefore!23 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576778))))

(declare-fun +!4299 (ListLongMap!19467 tuple2!21810) ListLongMap!19467)

(declare-fun getCurrentListMapNoExtraKeys!5929 (array!84866 array!84864 (_ BitVec 32) (_ BitVec 32) V!50307 V!50307 (_ BitVec 32) Int) ListLongMap!19467)

(assert (=> b!1284180 (= lt!576778 (+!4299 (getCurrentListMapNoExtraKeys!5929 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284181 () Bool)

(declare-fun res!853099 () Bool)

(assert (=> b!1284181 (=> (not res!853099) (not e!733535))))

(assert (=> b!1284181 (= res!853099 (and (= (size!41484 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41485 _keys!1741) (size!41484 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284182 () Bool)

(declare-fun res!853101 () Bool)

(assert (=> b!1284182 (=> (not res!853101) (not e!733535))))

(declare-datatypes ((List!29004 0))(
  ( (Nil!29001) (Cons!29000 (h!30209 (_ BitVec 64)) (t!42548 List!29004)) )
))
(declare-fun arrayNoDuplicates!0 (array!84866 (_ BitVec 32) List!29004) Bool)

(assert (=> b!1284182 (= res!853101 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29001))))

(declare-fun b!1284183 () Bool)

(declare-fun res!853104 () Bool)

(assert (=> b!1284183 (=> (not res!853104) (not e!733535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284183 (= res!853104 (validKeyInArray!0 (select (arr!40935 _keys!1741) from!2144)))))

(assert (= (and start!108750 res!853097) b!1284181))

(assert (= (and b!1284181 res!853099) b!1284174))

(assert (= (and b!1284174 res!853098) b!1284182))

(assert (= (and b!1284182 res!853101) b!1284173))

(assert (= (and b!1284173 res!853096) b!1284176))

(assert (= (and b!1284176 res!853102) b!1284175))

(assert (= (and b!1284175 res!853103) b!1284183))

(assert (= (and b!1284183 res!853104) b!1284177))

(assert (= (and b!1284177 res!853100) b!1284180))

(assert (= (and b!1284179 condMapEmpty!52412) mapIsEmpty!52412))

(assert (= (and b!1284179 (not condMapEmpty!52412)) mapNonEmpty!52412))

(get-info :version)

(assert (= (and mapNonEmpty!52412 ((_ is ValueCellFull!16053) mapValue!52412)) b!1284178))

(assert (= (and b!1284179 ((_ is ValueCellFull!16053) mapDefault!52412)) b!1284172))

(assert (= start!108750 b!1284179))

(declare-fun m!1177933 () Bool)

(assert (=> b!1284182 m!1177933))

(declare-fun m!1177935 () Bool)

(assert (=> b!1284176 m!1177935))

(assert (=> b!1284176 m!1177935))

(declare-fun m!1177937 () Bool)

(assert (=> b!1284176 m!1177937))

(declare-fun m!1177939 () Bool)

(assert (=> b!1284174 m!1177939))

(declare-fun m!1177941 () Bool)

(assert (=> b!1284183 m!1177941))

(assert (=> b!1284183 m!1177941))

(declare-fun m!1177943 () Bool)

(assert (=> b!1284183 m!1177943))

(declare-fun m!1177945 () Bool)

(assert (=> start!108750 m!1177945))

(declare-fun m!1177947 () Bool)

(assert (=> start!108750 m!1177947))

(declare-fun m!1177949 () Bool)

(assert (=> start!108750 m!1177949))

(declare-fun m!1177951 () Bool)

(assert (=> mapNonEmpty!52412 m!1177951))

(declare-fun m!1177953 () Bool)

(assert (=> b!1284180 m!1177953))

(declare-fun m!1177955 () Bool)

(assert (=> b!1284180 m!1177955))

(declare-fun m!1177957 () Bool)

(assert (=> b!1284180 m!1177957))

(assert (=> b!1284180 m!1177957))

(declare-fun m!1177959 () Bool)

(assert (=> b!1284180 m!1177959))

(check-sat (not b!1284174) (not b!1284180) tp_is_empty!33903 (not b_next!28263) (not start!108750) (not mapNonEmpty!52412) (not b!1284183) (not b!1284176) b_and!46329 (not b!1284182))
(check-sat b_and!46329 (not b_next!28263))
