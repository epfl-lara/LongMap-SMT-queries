; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108654 () Bool)

(assert start!108654)

(declare-fun b_free!28167 () Bool)

(declare-fun b_next!28167 () Bool)

(assert (=> start!108654 (= b_free!28167 (not b_next!28167))))

(declare-fun tp!99617 () Bool)

(declare-fun b_and!46233 () Bool)

(assert (=> start!108654 (= tp!99617 b_and!46233)))

(declare-fun b!1282541 () Bool)

(declare-fun e!732812 () Bool)

(declare-fun tp_is_empty!33807 () Bool)

(assert (=> b!1282541 (= e!732812 tp_is_empty!33807)))

(declare-fun b!1282542 () Bool)

(declare-fun res!851899 () Bool)

(declare-fun e!732814 () Bool)

(assert (=> b!1282542 (=> (not res!851899) (not e!732814))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50179 0))(
  ( (V!50180 (val!16978 Int)) )
))
(declare-datatypes ((ValueCell!16005 0))(
  ( (ValueCellFull!16005 (v!19580 V!50179)) (EmptyCell!16005) )
))
(declare-datatypes ((array!84684 0))(
  ( (array!84685 (arr!40844 (Array (_ BitVec 32) ValueCell!16005)) (size!41394 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84684)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84686 0))(
  ( (array!84687 (arr!40845 (Array (_ BitVec 32) (_ BitVec 64))) (size!41395 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84686)

(assert (=> b!1282542 (= res!851899 (and (= (size!41394 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41395 _keys!1741) (size!41394 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282543 () Bool)

(declare-fun e!732811 () Bool)

(declare-fun e!732813 () Bool)

(declare-fun mapRes!52268 () Bool)

(assert (=> b!1282543 (= e!732811 (and e!732813 mapRes!52268))))

(declare-fun condMapEmpty!52268 () Bool)

(declare-fun mapDefault!52268 () ValueCell!16005)

(assert (=> b!1282543 (= condMapEmpty!52268 (= (arr!40844 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16005)) mapDefault!52268)))))

(declare-fun b!1282544 () Bool)

(declare-fun res!851900 () Bool)

(assert (=> b!1282544 (=> (not res!851900) (not e!732814))))

(declare-datatypes ((List!28937 0))(
  ( (Nil!28934) (Cons!28933 (h!30142 (_ BitVec 64)) (t!42481 List!28937)) )
))
(declare-fun arrayNoDuplicates!0 (array!84686 (_ BitVec 32) List!28937) Bool)

(assert (=> b!1282544 (= res!851900 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28934))))

(declare-fun mapNonEmpty!52268 () Bool)

(declare-fun tp!99616 () Bool)

(assert (=> mapNonEmpty!52268 (= mapRes!52268 (and tp!99616 e!732812))))

(declare-fun mapRest!52268 () (Array (_ BitVec 32) ValueCell!16005))

(declare-fun mapValue!52268 () ValueCell!16005)

(declare-fun mapKey!52268 () (_ BitVec 32))

(assert (=> mapNonEmpty!52268 (= (arr!40844 _values!1445) (store mapRest!52268 mapKey!52268 mapValue!52268))))

(declare-fun mapIsEmpty!52268 () Bool)

(assert (=> mapIsEmpty!52268 mapRes!52268))

(declare-fun res!851897 () Bool)

(assert (=> start!108654 (=> (not res!851897) (not e!732814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108654 (= res!851897 (validMask!0 mask!2175))))

(assert (=> start!108654 e!732814))

(assert (=> start!108654 tp_is_empty!33807))

(assert (=> start!108654 true))

(declare-fun array_inv!30985 (array!84684) Bool)

(assert (=> start!108654 (and (array_inv!30985 _values!1445) e!732811)))

(declare-fun array_inv!30986 (array!84686) Bool)

(assert (=> start!108654 (array_inv!30986 _keys!1741)))

(assert (=> start!108654 tp!99617))

(declare-fun b!1282545 () Bool)

(declare-fun res!851898 () Bool)

(assert (=> b!1282545 (=> (not res!851898) (not e!732814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84686 (_ BitVec 32)) Bool)

(assert (=> b!1282545 (= res!851898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282546 () Bool)

(assert (=> b!1282546 (= e!732813 tp_is_empty!33807)))

(declare-fun b!1282547 () Bool)

(declare-fun res!851901 () Bool)

(assert (=> b!1282547 (=> (not res!851901) (not e!732814))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282547 (= res!851901 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41395 _keys!1741))))))

(declare-fun b!1282548 () Bool)

(assert (=> b!1282548 (= e!732814 false)))

(declare-fun minValue!1387 () V!50179)

(declare-fun zeroValue!1387 () V!50179)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576547 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21740 0))(
  ( (tuple2!21741 (_1!10881 (_ BitVec 64)) (_2!10881 V!50179)) )
))
(declare-datatypes ((List!28938 0))(
  ( (Nil!28935) (Cons!28934 (h!30143 tuple2!21740) (t!42482 List!28938)) )
))
(declare-datatypes ((ListLongMap!19397 0))(
  ( (ListLongMap!19398 (toList!9714 List!28938)) )
))
(declare-fun contains!7831 (ListLongMap!19397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4798 (array!84686 array!84684 (_ BitVec 32) (_ BitVec 32) V!50179 V!50179 (_ BitVec 32) Int) ListLongMap!19397)

(assert (=> b!1282548 (= lt!576547 (contains!7831 (getCurrentListMap!4798 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108654 res!851897) b!1282542))

(assert (= (and b!1282542 res!851899) b!1282545))

(assert (= (and b!1282545 res!851898) b!1282544))

(assert (= (and b!1282544 res!851900) b!1282547))

(assert (= (and b!1282547 res!851901) b!1282548))

(assert (= (and b!1282543 condMapEmpty!52268) mapIsEmpty!52268))

(assert (= (and b!1282543 (not condMapEmpty!52268)) mapNonEmpty!52268))

(get-info :version)

(assert (= (and mapNonEmpty!52268 ((_ is ValueCellFull!16005) mapValue!52268)) b!1282541))

(assert (= (and b!1282543 ((_ is ValueCellFull!16005) mapDefault!52268)) b!1282546))

(assert (= start!108654 b!1282543))

(declare-fun m!1176709 () Bool)

(assert (=> b!1282544 m!1176709))

(declare-fun m!1176711 () Bool)

(assert (=> b!1282548 m!1176711))

(assert (=> b!1282548 m!1176711))

(declare-fun m!1176713 () Bool)

(assert (=> b!1282548 m!1176713))

(declare-fun m!1176715 () Bool)

(assert (=> mapNonEmpty!52268 m!1176715))

(declare-fun m!1176717 () Bool)

(assert (=> start!108654 m!1176717))

(declare-fun m!1176719 () Bool)

(assert (=> start!108654 m!1176719))

(declare-fun m!1176721 () Bool)

(assert (=> start!108654 m!1176721))

(declare-fun m!1176723 () Bool)

(assert (=> b!1282545 m!1176723))

(check-sat tp_is_empty!33807 (not b!1282544) (not b!1282548) (not b_next!28167) b_and!46233 (not b!1282545) (not start!108654) (not mapNonEmpty!52268))
(check-sat b_and!46233 (not b_next!28167))
