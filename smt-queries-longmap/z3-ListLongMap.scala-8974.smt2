; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108590 () Bool)

(assert start!108590)

(declare-fun b_free!28117 () Bool)

(declare-fun b_next!28117 () Bool)

(assert (=> start!108590 (= b_free!28117 (not b_next!28117))))

(declare-fun tp!99465 () Bool)

(declare-fun b_and!46163 () Bool)

(assert (=> start!108590 (= tp!99465 b_and!46163)))

(declare-fun b!1281759 () Bool)

(declare-fun e!732338 () Bool)

(declare-fun tp_is_empty!33757 () Bool)

(assert (=> b!1281759 (= e!732338 tp_is_empty!33757)))

(declare-fun mapIsEmpty!52190 () Bool)

(declare-fun mapRes!52190 () Bool)

(assert (=> mapIsEmpty!52190 mapRes!52190))

(declare-fun b!1281760 () Bool)

(declare-fun e!732339 () Bool)

(assert (=> b!1281760 (= e!732339 tp_is_empty!33757)))

(declare-fun b!1281761 () Bool)

(declare-fun res!851441 () Bool)

(declare-fun e!732337 () Bool)

(assert (=> b!1281761 (=> (not res!851441) (not e!732337))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84481 0))(
  ( (array!84482 (arr!40744 (Array (_ BitVec 32) (_ BitVec 64))) (size!41296 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84481)

(assert (=> b!1281761 (= res!851441 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41296 _keys!1741))))))

(declare-fun b!1281762 () Bool)

(declare-fun res!851444 () Bool)

(assert (=> b!1281762 (=> (not res!851444) (not e!732337))))

(declare-datatypes ((List!28970 0))(
  ( (Nil!28967) (Cons!28966 (h!30175 (_ BitVec 64)) (t!42504 List!28970)) )
))
(declare-fun arrayNoDuplicates!0 (array!84481 (_ BitVec 32) List!28970) Bool)

(assert (=> b!1281762 (= res!851444 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28967))))

(declare-fun b!1281763 () Bool)

(declare-fun res!851442 () Bool)

(assert (=> b!1281763 (=> (not res!851442) (not e!732337))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50113 0))(
  ( (V!50114 (val!16953 Int)) )
))
(declare-datatypes ((ValueCell!15980 0))(
  ( (ValueCellFull!15980 (v!19553 V!50113)) (EmptyCell!15980) )
))
(declare-datatypes ((array!84483 0))(
  ( (array!84484 (arr!40745 (Array (_ BitVec 32) ValueCell!15980)) (size!41297 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84483)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281763 (= res!851442 (and (= (size!41297 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41296 _keys!1741) (size!41297 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281764 () Bool)

(declare-fun res!851445 () Bool)

(assert (=> b!1281764 (=> (not res!851445) (not e!732337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84481 (_ BitVec 32)) Bool)

(assert (=> b!1281764 (= res!851445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281765 () Bool)

(declare-fun e!732336 () Bool)

(assert (=> b!1281765 (= e!732336 (and e!732338 mapRes!52190))))

(declare-fun condMapEmpty!52190 () Bool)

(declare-fun mapDefault!52190 () ValueCell!15980)

(assert (=> b!1281765 (= condMapEmpty!52190 (= (arr!40745 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15980)) mapDefault!52190)))))

(declare-fun mapNonEmpty!52190 () Bool)

(declare-fun tp!99464 () Bool)

(assert (=> mapNonEmpty!52190 (= mapRes!52190 (and tp!99464 e!732339))))

(declare-fun mapRest!52190 () (Array (_ BitVec 32) ValueCell!15980))

(declare-fun mapValue!52190 () ValueCell!15980)

(declare-fun mapKey!52190 () (_ BitVec 32))

(assert (=> mapNonEmpty!52190 (= (arr!40745 _values!1445) (store mapRest!52190 mapKey!52190 mapValue!52190))))

(declare-fun b!1281766 () Bool)

(assert (=> b!1281766 (= e!732337 false)))

(declare-fun minValue!1387 () V!50113)

(declare-fun zeroValue!1387 () V!50113)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576216 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21782 0))(
  ( (tuple2!21783 (_1!10902 (_ BitVec 64)) (_2!10902 V!50113)) )
))
(declare-datatypes ((List!28971 0))(
  ( (Nil!28968) (Cons!28967 (h!30176 tuple2!21782) (t!42505 List!28971)) )
))
(declare-datatypes ((ListLongMap!19439 0))(
  ( (ListLongMap!19440 (toList!9735 List!28971)) )
))
(declare-fun contains!7781 (ListLongMap!19439 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4709 (array!84481 array!84483 (_ BitVec 32) (_ BitVec 32) V!50113 V!50113 (_ BitVec 32) Int) ListLongMap!19439)

(assert (=> b!1281766 (= lt!576216 (contains!7781 (getCurrentListMap!4709 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!851443 () Bool)

(assert (=> start!108590 (=> (not res!851443) (not e!732337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108590 (= res!851443 (validMask!0 mask!2175))))

(assert (=> start!108590 e!732337))

(assert (=> start!108590 tp_is_empty!33757))

(assert (=> start!108590 true))

(declare-fun array_inv!31077 (array!84483) Bool)

(assert (=> start!108590 (and (array_inv!31077 _values!1445) e!732336)))

(declare-fun array_inv!31078 (array!84481) Bool)

(assert (=> start!108590 (array_inv!31078 _keys!1741)))

(assert (=> start!108590 tp!99465))

(assert (= (and start!108590 res!851443) b!1281763))

(assert (= (and b!1281763 res!851442) b!1281764))

(assert (= (and b!1281764 res!851445) b!1281762))

(assert (= (and b!1281762 res!851444) b!1281761))

(assert (= (and b!1281761 res!851441) b!1281766))

(assert (= (and b!1281765 condMapEmpty!52190) mapIsEmpty!52190))

(assert (= (and b!1281765 (not condMapEmpty!52190)) mapNonEmpty!52190))

(get-info :version)

(assert (= (and mapNonEmpty!52190 ((_ is ValueCellFull!15980) mapValue!52190)) b!1281760))

(assert (= (and b!1281765 ((_ is ValueCellFull!15980) mapDefault!52190)) b!1281759))

(assert (= start!108590 b!1281765))

(declare-fun m!1175721 () Bool)

(assert (=> mapNonEmpty!52190 m!1175721))

(declare-fun m!1175723 () Bool)

(assert (=> b!1281766 m!1175723))

(assert (=> b!1281766 m!1175723))

(declare-fun m!1175725 () Bool)

(assert (=> b!1281766 m!1175725))

(declare-fun m!1175727 () Bool)

(assert (=> b!1281764 m!1175727))

(declare-fun m!1175729 () Bool)

(assert (=> start!108590 m!1175729))

(declare-fun m!1175731 () Bool)

(assert (=> start!108590 m!1175731))

(declare-fun m!1175733 () Bool)

(assert (=> start!108590 m!1175733))

(declare-fun m!1175735 () Bool)

(assert (=> b!1281762 m!1175735))

(check-sat (not mapNonEmpty!52190) (not b!1281764) b_and!46163 (not b!1281762) (not b!1281766) tp_is_empty!33757 (not b_next!28117) (not start!108590))
(check-sat b_and!46163 (not b_next!28117))
