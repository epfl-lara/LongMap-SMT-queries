; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108554 () Bool)

(assert start!108554)

(declare-fun b_free!28101 () Bool)

(declare-fun b_next!28101 () Bool)

(assert (=> start!108554 (= b_free!28101 (not b_next!28101))))

(declare-fun tp!99412 () Bool)

(declare-fun b_and!46161 () Bool)

(assert (=> start!108554 (= tp!99412 b_and!46161)))

(declare-fun b!1281420 () Bool)

(declare-fun res!851224 () Bool)

(declare-fun e!732130 () Bool)

(assert (=> b!1281420 (=> (not res!851224) (not e!732130))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50091 0))(
  ( (V!50092 (val!16945 Int)) )
))
(declare-datatypes ((ValueCell!15972 0))(
  ( (ValueCellFull!15972 (v!19545 V!50091)) (EmptyCell!15972) )
))
(declare-datatypes ((array!84552 0))(
  ( (array!84553 (arr!40780 (Array (_ BitVec 32) ValueCell!15972)) (size!41330 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84552)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84554 0))(
  ( (array!84555 (arr!40781 (Array (_ BitVec 32) (_ BitVec 64))) (size!41331 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84554)

(assert (=> b!1281420 (= res!851224 (and (= (size!41330 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41331 _keys!1741) (size!41330 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52163 () Bool)

(declare-fun mapRes!52163 () Bool)

(assert (=> mapIsEmpty!52163 mapRes!52163))

(declare-fun b!1281421 () Bool)

(declare-fun res!851226 () Bool)

(assert (=> b!1281421 (=> (not res!851226) (not e!732130))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1281421 (= res!851226 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41331 _keys!1741)) (not (= (select (arr!40781 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281423 () Bool)

(declare-fun e!732126 () Bool)

(assert (=> b!1281423 (= e!732130 (not e!732126))))

(declare-fun res!851228 () Bool)

(assert (=> b!1281423 (=> res!851228 e!732126)))

(assert (=> b!1281423 (= res!851228 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!50091)

(declare-fun zeroValue!1387 () V!50091)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21696 0))(
  ( (tuple2!21697 (_1!10859 (_ BitVec 64)) (_2!10859 V!50091)) )
))
(declare-datatypes ((List!28890 0))(
  ( (Nil!28887) (Cons!28886 (h!30095 tuple2!21696) (t!42430 List!28890)) )
))
(declare-datatypes ((ListLongMap!19353 0))(
  ( (ListLongMap!19354 (toList!9692 List!28890)) )
))
(declare-fun contains!7807 (ListLongMap!19353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4776 (array!84554 array!84552 (_ BitVec 32) (_ BitVec 32) V!50091 V!50091 (_ BitVec 32) Int) ListLongMap!19353)

(assert (=> b!1281423 (contains!7807 (getCurrentListMap!4776 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42441 0))(
  ( (Unit!42442) )
))
(declare-fun lt!576230 () Unit!42441)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!25 (array!84554 array!84552 (_ BitVec 32) (_ BitVec 32) V!50091 V!50091 (_ BitVec 64) (_ BitVec 32) Int) Unit!42441)

(assert (=> b!1281423 (= lt!576230 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!25 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281424 () Bool)

(declare-fun e!732129 () Bool)

(declare-fun tp_is_empty!33741 () Bool)

(assert (=> b!1281424 (= e!732129 tp_is_empty!33741)))

(declare-fun b!1281425 () Bool)

(declare-fun res!851221 () Bool)

(assert (=> b!1281425 (=> (not res!851221) (not e!732130))))

(assert (=> b!1281425 (= res!851221 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41331 _keys!1741))))))

(declare-fun b!1281426 () Bool)

(declare-fun res!851222 () Bool)

(assert (=> b!1281426 (=> (not res!851222) (not e!732130))))

(declare-datatypes ((List!28891 0))(
  ( (Nil!28888) (Cons!28887 (h!30096 (_ BitVec 64)) (t!42431 List!28891)) )
))
(declare-fun arrayNoDuplicates!0 (array!84554 (_ BitVec 32) List!28891) Bool)

(assert (=> b!1281426 (= res!851222 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28888))))

(declare-fun mapNonEmpty!52163 () Bool)

(declare-fun tp!99413 () Bool)

(assert (=> mapNonEmpty!52163 (= mapRes!52163 (and tp!99413 e!732129))))

(declare-fun mapValue!52163 () ValueCell!15972)

(declare-fun mapKey!52163 () (_ BitVec 32))

(declare-fun mapRest!52163 () (Array (_ BitVec 32) ValueCell!15972))

(assert (=> mapNonEmpty!52163 (= (arr!40780 _values!1445) (store mapRest!52163 mapKey!52163 mapValue!52163))))

(declare-fun b!1281427 () Bool)

(declare-fun e!732128 () Bool)

(assert (=> b!1281427 (= e!732128 tp_is_empty!33741)))

(declare-fun b!1281428 () Bool)

(assert (=> b!1281428 (= e!732126 true)))

(declare-fun arrayContainsKey!0 (array!84554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281428 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576229 () Unit!42441)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!633 (array!84554 array!84552 (_ BitVec 32) (_ BitVec 32) V!50091 V!50091 (_ BitVec 64) (_ BitVec 32) Int) Unit!42441)

(assert (=> b!1281428 (= lt!576229 (lemmaListMapContainsThenArrayContainsFrom!633 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281422 () Bool)

(declare-fun res!851227 () Bool)

(assert (=> b!1281422 (=> (not res!851227) (not e!732130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84554 (_ BitVec 32)) Bool)

(assert (=> b!1281422 (= res!851227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!851225 () Bool)

(assert (=> start!108554 (=> (not res!851225) (not e!732130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108554 (= res!851225 (validMask!0 mask!2175))))

(assert (=> start!108554 e!732130))

(assert (=> start!108554 tp_is_empty!33741))

(assert (=> start!108554 true))

(declare-fun e!732127 () Bool)

(declare-fun array_inv!30945 (array!84552) Bool)

(assert (=> start!108554 (and (array_inv!30945 _values!1445) e!732127)))

(declare-fun array_inv!30946 (array!84554) Bool)

(assert (=> start!108554 (array_inv!30946 _keys!1741)))

(assert (=> start!108554 tp!99412))

(declare-fun b!1281429 () Bool)

(assert (=> b!1281429 (= e!732127 (and e!732128 mapRes!52163))))

(declare-fun condMapEmpty!52163 () Bool)

(declare-fun mapDefault!52163 () ValueCell!15972)

(assert (=> b!1281429 (= condMapEmpty!52163 (= (arr!40780 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15972)) mapDefault!52163)))))

(declare-fun b!1281430 () Bool)

(declare-fun res!851223 () Bool)

(assert (=> b!1281430 (=> (not res!851223) (not e!732130))))

(assert (=> b!1281430 (= res!851223 (contains!7807 (getCurrentListMap!4776 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108554 res!851225) b!1281420))

(assert (= (and b!1281420 res!851224) b!1281422))

(assert (= (and b!1281422 res!851227) b!1281426))

(assert (= (and b!1281426 res!851222) b!1281425))

(assert (= (and b!1281425 res!851221) b!1281430))

(assert (= (and b!1281430 res!851223) b!1281421))

(assert (= (and b!1281421 res!851226) b!1281423))

(assert (= (and b!1281423 (not res!851228)) b!1281428))

(assert (= (and b!1281429 condMapEmpty!52163) mapIsEmpty!52163))

(assert (= (and b!1281429 (not condMapEmpty!52163)) mapNonEmpty!52163))

(get-info :version)

(assert (= (and mapNonEmpty!52163 ((_ is ValueCellFull!15972) mapValue!52163)) b!1281424))

(assert (= (and b!1281429 ((_ is ValueCellFull!15972) mapDefault!52163)) b!1281427))

(assert (= start!108554 b!1281429))

(declare-fun m!1175841 () Bool)

(assert (=> b!1281426 m!1175841))

(declare-fun m!1175843 () Bool)

(assert (=> b!1281430 m!1175843))

(assert (=> b!1281430 m!1175843))

(declare-fun m!1175845 () Bool)

(assert (=> b!1281430 m!1175845))

(declare-fun m!1175847 () Bool)

(assert (=> b!1281428 m!1175847))

(declare-fun m!1175849 () Bool)

(assert (=> b!1281428 m!1175849))

(declare-fun m!1175851 () Bool)

(assert (=> b!1281422 m!1175851))

(declare-fun m!1175853 () Bool)

(assert (=> mapNonEmpty!52163 m!1175853))

(declare-fun m!1175855 () Bool)

(assert (=> b!1281421 m!1175855))

(declare-fun m!1175857 () Bool)

(assert (=> b!1281423 m!1175857))

(assert (=> b!1281423 m!1175857))

(declare-fun m!1175859 () Bool)

(assert (=> b!1281423 m!1175859))

(declare-fun m!1175861 () Bool)

(assert (=> b!1281423 m!1175861))

(declare-fun m!1175863 () Bool)

(assert (=> start!108554 m!1175863))

(declare-fun m!1175865 () Bool)

(assert (=> start!108554 m!1175865))

(declare-fun m!1175867 () Bool)

(assert (=> start!108554 m!1175867))

(check-sat b_and!46161 tp_is_empty!33741 (not b!1281423) (not mapNonEmpty!52163) (not start!108554) (not b!1281426) (not b!1281430) (not b!1281428) (not b!1281422) (not b_next!28101))
(check-sat b_and!46161 (not b_next!28101))
