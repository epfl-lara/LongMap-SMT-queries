; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108786 () Bool)

(assert start!108786)

(declare-fun b_free!28299 () Bool)

(declare-fun b_next!28299 () Bool)

(assert (=> start!108786 (= b_free!28299 (not b_next!28299))))

(declare-fun tp!100013 () Bool)

(declare-fun b_and!46365 () Bool)

(assert (=> start!108786 (= tp!100013 b_and!46365)))

(declare-fun b!1284620 () Bool)

(declare-fun e!733803 () Bool)

(declare-fun e!733804 () Bool)

(declare-fun mapRes!52466 () Bool)

(assert (=> b!1284620 (= e!733803 (and e!733804 mapRes!52466))))

(declare-fun condMapEmpty!52466 () Bool)

(declare-datatypes ((V!50355 0))(
  ( (V!50356 (val!17044 Int)) )
))
(declare-datatypes ((ValueCell!16071 0))(
  ( (ValueCellFull!16071 (v!19646 V!50355)) (EmptyCell!16071) )
))
(declare-datatypes ((array!84936 0))(
  ( (array!84937 (arr!40970 (Array (_ BitVec 32) ValueCell!16071)) (size!41520 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84936)

(declare-fun mapDefault!52466 () ValueCell!16071)

(assert (=> b!1284620 (= condMapEmpty!52466 (= (arr!40970 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16071)) mapDefault!52466)))))

(declare-fun mapIsEmpty!52466 () Bool)

(assert (=> mapIsEmpty!52466 mapRes!52466))

(declare-fun b!1284621 () Bool)

(declare-fun e!733805 () Bool)

(assert (=> b!1284621 (= e!733805 false)))

(declare-fun minValue!1387 () V!50355)

(declare-fun zeroValue!1387 () V!50355)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84938 0))(
  ( (array!84939 (arr!40971 (Array (_ BitVec 32) (_ BitVec 64))) (size!41521 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84938)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!576835 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21840 0))(
  ( (tuple2!21841 (_1!10931 (_ BitVec 64)) (_2!10931 V!50355)) )
))
(declare-datatypes ((List!29033 0))(
  ( (Nil!29030) (Cons!29029 (h!30238 tuple2!21840) (t!42577 List!29033)) )
))
(declare-datatypes ((ListLongMap!19497 0))(
  ( (ListLongMap!19498 (toList!9764 List!29033)) )
))
(declare-fun contains!7881 (ListLongMap!19497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4843 (array!84938 array!84936 (_ BitVec 32) (_ BitVec 32) V!50355 V!50355 (_ BitVec 32) Int) ListLongMap!19497)

(assert (=> b!1284621 (= lt!576835 (contains!7881 (getCurrentListMap!4843 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!853384 () Bool)

(assert (=> start!108786 (=> (not res!853384) (not e!733805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108786 (= res!853384 (validMask!0 mask!2175))))

(assert (=> start!108786 e!733805))

(declare-fun tp_is_empty!33939 () Bool)

(assert (=> start!108786 tp_is_empty!33939))

(assert (=> start!108786 true))

(declare-fun array_inv!31073 (array!84936) Bool)

(assert (=> start!108786 (and (array_inv!31073 _values!1445) e!733803)))

(declare-fun array_inv!31074 (array!84938) Bool)

(assert (=> start!108786 (array_inv!31074 _keys!1741)))

(assert (=> start!108786 tp!100013))

(declare-fun mapNonEmpty!52466 () Bool)

(declare-fun tp!100012 () Bool)

(declare-fun e!733801 () Bool)

(assert (=> mapNonEmpty!52466 (= mapRes!52466 (and tp!100012 e!733801))))

(declare-fun mapKey!52466 () (_ BitVec 32))

(declare-fun mapValue!52466 () ValueCell!16071)

(declare-fun mapRest!52466 () (Array (_ BitVec 32) ValueCell!16071))

(assert (=> mapNonEmpty!52466 (= (arr!40970 _values!1445) (store mapRest!52466 mapKey!52466 mapValue!52466))))

(declare-fun b!1284622 () Bool)

(declare-fun res!853383 () Bool)

(assert (=> b!1284622 (=> (not res!853383) (not e!733805))))

(assert (=> b!1284622 (= res!853383 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41521 _keys!1741))))))

(declare-fun b!1284623 () Bool)

(assert (=> b!1284623 (= e!733804 tp_is_empty!33939)))

(declare-fun b!1284624 () Bool)

(assert (=> b!1284624 (= e!733801 tp_is_empty!33939)))

(declare-fun b!1284625 () Bool)

(declare-fun res!853386 () Bool)

(assert (=> b!1284625 (=> (not res!853386) (not e!733805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84938 (_ BitVec 32)) Bool)

(assert (=> b!1284625 (= res!853386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284626 () Bool)

(declare-fun res!853382 () Bool)

(assert (=> b!1284626 (=> (not res!853382) (not e!733805))))

(declare-datatypes ((List!29034 0))(
  ( (Nil!29031) (Cons!29030 (h!30239 (_ BitVec 64)) (t!42578 List!29034)) )
))
(declare-fun arrayNoDuplicates!0 (array!84938 (_ BitVec 32) List!29034) Bool)

(assert (=> b!1284626 (= res!853382 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29031))))

(declare-fun b!1284627 () Bool)

(declare-fun res!853385 () Bool)

(assert (=> b!1284627 (=> (not res!853385) (not e!733805))))

(assert (=> b!1284627 (= res!853385 (and (= (size!41520 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41521 _keys!1741) (size!41520 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108786 res!853384) b!1284627))

(assert (= (and b!1284627 res!853385) b!1284625))

(assert (= (and b!1284625 res!853386) b!1284626))

(assert (= (and b!1284626 res!853382) b!1284622))

(assert (= (and b!1284622 res!853383) b!1284621))

(assert (= (and b!1284620 condMapEmpty!52466) mapIsEmpty!52466))

(assert (= (and b!1284620 (not condMapEmpty!52466)) mapNonEmpty!52466))

(get-info :version)

(assert (= (and mapNonEmpty!52466 ((_ is ValueCellFull!16071) mapValue!52466)) b!1284624))

(assert (= (and b!1284620 ((_ is ValueCellFull!16071) mapDefault!52466)) b!1284623))

(assert (= start!108786 b!1284620))

(declare-fun m!1178245 () Bool)

(assert (=> b!1284625 m!1178245))

(declare-fun m!1178247 () Bool)

(assert (=> start!108786 m!1178247))

(declare-fun m!1178249 () Bool)

(assert (=> start!108786 m!1178249))

(declare-fun m!1178251 () Bool)

(assert (=> start!108786 m!1178251))

(declare-fun m!1178253 () Bool)

(assert (=> mapNonEmpty!52466 m!1178253))

(declare-fun m!1178255 () Bool)

(assert (=> b!1284626 m!1178255))

(declare-fun m!1178257 () Bool)

(assert (=> b!1284621 m!1178257))

(assert (=> b!1284621 m!1178257))

(declare-fun m!1178259 () Bool)

(assert (=> b!1284621 m!1178259))

(check-sat (not mapNonEmpty!52466) b_and!46365 (not b!1284626) (not b!1284625) (not b!1284621) (not start!108786) (not b_next!28299) tp_is_empty!33939)
(check-sat b_and!46365 (not b_next!28299))
