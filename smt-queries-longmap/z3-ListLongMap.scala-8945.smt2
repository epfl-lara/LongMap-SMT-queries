; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108620 () Bool)

(assert start!108620)

(declare-fun b_free!27943 () Bool)

(declare-fun b_next!27943 () Bool)

(assert (=> start!108620 (= b_free!27943 (not b_next!27943))))

(declare-fun tp!98939 () Bool)

(declare-fun b_and!46005 () Bool)

(assert (=> start!108620 (= tp!98939 b_and!46005)))

(declare-fun b!1280625 () Bool)

(declare-fun res!850355 () Bool)

(declare-fun e!731786 () Bool)

(assert (=> b!1280625 (=> (not res!850355) (not e!731786))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49881 0))(
  ( (V!49882 (val!16866 Int)) )
))
(declare-datatypes ((ValueCell!15893 0))(
  ( (ValueCellFull!15893 (v!19461 V!49881)) (EmptyCell!15893) )
))
(declare-datatypes ((array!84281 0))(
  ( (array!84282 (arr!40640 (Array (_ BitVec 32) ValueCell!15893)) (size!41191 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84281)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84283 0))(
  ( (array!84284 (arr!40641 (Array (_ BitVec 32) (_ BitVec 64))) (size!41192 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84283)

(assert (=> b!1280625 (= res!850355 (and (= (size!41191 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41192 _keys!1741) (size!41191 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280626 () Bool)

(assert (=> b!1280626 (= e!731786 false)))

(declare-fun minValue!1387 () V!49881)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!49881)

(declare-fun lt!576480 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21600 0))(
  ( (tuple2!21601 (_1!10811 (_ BitVec 64)) (_2!10811 V!49881)) )
))
(declare-datatypes ((List!28814 0))(
  ( (Nil!28811) (Cons!28810 (h!30028 tuple2!21600) (t!42346 List!28814)) )
))
(declare-datatypes ((ListLongMap!19265 0))(
  ( (ListLongMap!19266 (toList!9648 List!28814)) )
))
(declare-fun contains!7777 (ListLongMap!19265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4717 (array!84283 array!84281 (_ BitVec 32) (_ BitVec 32) V!49881 V!49881 (_ BitVec 32) Int) ListLongMap!19265)

(assert (=> b!1280626 (= lt!576480 (contains!7777 (getCurrentListMap!4717 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280627 () Bool)

(declare-fun res!850356 () Bool)

(assert (=> b!1280627 (=> (not res!850356) (not e!731786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84283 (_ BitVec 32)) Bool)

(assert (=> b!1280627 (= res!850356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51926 () Bool)

(declare-fun mapRes!51926 () Bool)

(declare-fun tp!98938 () Bool)

(declare-fun e!731783 () Bool)

(assert (=> mapNonEmpty!51926 (= mapRes!51926 (and tp!98938 e!731783))))

(declare-fun mapValue!51926 () ValueCell!15893)

(declare-fun mapKey!51926 () (_ BitVec 32))

(declare-fun mapRest!51926 () (Array (_ BitVec 32) ValueCell!15893))

(assert (=> mapNonEmpty!51926 (= (arr!40640 _values!1445) (store mapRest!51926 mapKey!51926 mapValue!51926))))

(declare-fun b!1280629 () Bool)

(declare-fun e!731784 () Bool)

(declare-fun e!731787 () Bool)

(assert (=> b!1280629 (= e!731784 (and e!731787 mapRes!51926))))

(declare-fun condMapEmpty!51926 () Bool)

(declare-fun mapDefault!51926 () ValueCell!15893)

(assert (=> b!1280629 (= condMapEmpty!51926 (= (arr!40640 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15893)) mapDefault!51926)))))

(declare-fun mapIsEmpty!51926 () Bool)

(assert (=> mapIsEmpty!51926 mapRes!51926))

(declare-fun b!1280630 () Bool)

(declare-fun res!850352 () Bool)

(assert (=> b!1280630 (=> (not res!850352) (not e!731786))))

(assert (=> b!1280630 (= res!850352 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41192 _keys!1741))))))

(declare-fun res!850354 () Bool)

(assert (=> start!108620 (=> (not res!850354) (not e!731786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108620 (= res!850354 (validMask!0 mask!2175))))

(assert (=> start!108620 e!731786))

(declare-fun tp_is_empty!33583 () Bool)

(assert (=> start!108620 tp_is_empty!33583))

(assert (=> start!108620 true))

(declare-fun array_inv!31049 (array!84281) Bool)

(assert (=> start!108620 (and (array_inv!31049 _values!1445) e!731784)))

(declare-fun array_inv!31050 (array!84283) Bool)

(assert (=> start!108620 (array_inv!31050 _keys!1741)))

(assert (=> start!108620 tp!98939))

(declare-fun b!1280628 () Bool)

(assert (=> b!1280628 (= e!731783 tp_is_empty!33583)))

(declare-fun b!1280631 () Bool)

(declare-fun res!850353 () Bool)

(assert (=> b!1280631 (=> (not res!850353) (not e!731786))))

(declare-datatypes ((List!28815 0))(
  ( (Nil!28812) (Cons!28811 (h!30029 (_ BitVec 64)) (t!42347 List!28815)) )
))
(declare-fun arrayNoDuplicates!0 (array!84283 (_ BitVec 32) List!28815) Bool)

(assert (=> b!1280631 (= res!850353 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28812))))

(declare-fun b!1280632 () Bool)

(assert (=> b!1280632 (= e!731787 tp_is_empty!33583)))

(assert (= (and start!108620 res!850354) b!1280625))

(assert (= (and b!1280625 res!850355) b!1280627))

(assert (= (and b!1280627 res!850356) b!1280631))

(assert (= (and b!1280631 res!850353) b!1280630))

(assert (= (and b!1280630 res!850352) b!1280626))

(assert (= (and b!1280629 condMapEmpty!51926) mapIsEmpty!51926))

(assert (= (and b!1280629 (not condMapEmpty!51926)) mapNonEmpty!51926))

(get-info :version)

(assert (= (and mapNonEmpty!51926 ((_ is ValueCellFull!15893) mapValue!51926)) b!1280628))

(assert (= (and b!1280629 ((_ is ValueCellFull!15893) mapDefault!51926)) b!1280632))

(assert (= start!108620 b!1280629))

(declare-fun m!1175937 () Bool)

(assert (=> start!108620 m!1175937))

(declare-fun m!1175939 () Bool)

(assert (=> start!108620 m!1175939))

(declare-fun m!1175941 () Bool)

(assert (=> start!108620 m!1175941))

(declare-fun m!1175943 () Bool)

(assert (=> b!1280626 m!1175943))

(assert (=> b!1280626 m!1175943))

(declare-fun m!1175945 () Bool)

(assert (=> b!1280626 m!1175945))

(declare-fun m!1175947 () Bool)

(assert (=> mapNonEmpty!51926 m!1175947))

(declare-fun m!1175949 () Bool)

(assert (=> b!1280627 m!1175949))

(declare-fun m!1175951 () Bool)

(assert (=> b!1280631 m!1175951))

(check-sat (not b!1280627) (not b_next!27943) (not b!1280626) tp_is_empty!33583 (not start!108620) (not mapNonEmpty!51926) (not b!1280631) b_and!46005)
(check-sat b_and!46005 (not b_next!27943))
