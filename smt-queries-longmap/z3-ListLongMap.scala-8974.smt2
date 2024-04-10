; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108592 () Bool)

(assert start!108592)

(declare-fun b_free!28119 () Bool)

(declare-fun b_next!28119 () Bool)

(assert (=> start!108592 (= b_free!28119 (not b_next!28119))))

(declare-fun tp!99470 () Bool)

(declare-fun b_and!46183 () Bool)

(assert (=> start!108592 (= tp!99470 b_and!46183)))

(declare-fun b!1281847 () Bool)

(declare-fun e!732380 () Bool)

(assert (=> b!1281847 (= e!732380 false)))

(declare-datatypes ((V!50115 0))(
  ( (V!50116 (val!16954 Int)) )
))
(declare-fun minValue!1387 () V!50115)

(declare-fun zeroValue!1387 () V!50115)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15981 0))(
  ( (ValueCellFull!15981 (v!19555 V!50115)) (EmptyCell!15981) )
))
(declare-datatypes ((array!84588 0))(
  ( (array!84589 (arr!40797 (Array (_ BitVec 32) ValueCell!15981)) (size!41347 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84588)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84590 0))(
  ( (array!84591 (arr!40798 (Array (_ BitVec 32) (_ BitVec 64))) (size!41348 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84590)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576397 () Bool)

(declare-datatypes ((tuple2!21710 0))(
  ( (tuple2!21711 (_1!10866 (_ BitVec 64)) (_2!10866 V!50115)) )
))
(declare-datatypes ((List!28902 0))(
  ( (Nil!28899) (Cons!28898 (h!30107 tuple2!21710) (t!42444 List!28902)) )
))
(declare-datatypes ((ListLongMap!19367 0))(
  ( (ListLongMap!19368 (toList!9699 List!28902)) )
))
(declare-fun contains!7815 (ListLongMap!19367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4783 (array!84590 array!84588 (_ BitVec 32) (_ BitVec 32) V!50115 V!50115 (_ BitVec 32) Int) ListLongMap!19367)

(assert (=> b!1281847 (= lt!576397 (contains!7815 (getCurrentListMap!4783 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281848 () Bool)

(declare-fun e!732379 () Bool)

(declare-fun tp_is_empty!33759 () Bool)

(assert (=> b!1281848 (= e!732379 tp_is_empty!33759)))

(declare-fun b!1281849 () Bool)

(declare-fun res!851484 () Bool)

(assert (=> b!1281849 (=> (not res!851484) (not e!732380))))

(assert (=> b!1281849 (= res!851484 (and (= (size!41347 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41348 _keys!1741) (size!41347 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52193 () Bool)

(declare-fun mapRes!52193 () Bool)

(declare-fun tp!99469 () Bool)

(assert (=> mapNonEmpty!52193 (= mapRes!52193 (and tp!99469 e!732379))))

(declare-fun mapRest!52193 () (Array (_ BitVec 32) ValueCell!15981))

(declare-fun mapValue!52193 () ValueCell!15981)

(declare-fun mapKey!52193 () (_ BitVec 32))

(assert (=> mapNonEmpty!52193 (= (arr!40797 _values!1445) (store mapRest!52193 mapKey!52193 mapValue!52193))))

(declare-fun b!1281850 () Bool)

(declare-fun res!851486 () Bool)

(assert (=> b!1281850 (=> (not res!851486) (not e!732380))))

(declare-datatypes ((List!28903 0))(
  ( (Nil!28900) (Cons!28899 (h!30108 (_ BitVec 64)) (t!42445 List!28903)) )
))
(declare-fun arrayNoDuplicates!0 (array!84590 (_ BitVec 32) List!28903) Bool)

(assert (=> b!1281850 (= res!851486 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28900))))

(declare-fun b!1281851 () Bool)

(declare-fun e!732383 () Bool)

(assert (=> b!1281851 (= e!732383 tp_is_empty!33759)))

(declare-fun b!1281852 () Bool)

(declare-fun e!732381 () Bool)

(assert (=> b!1281852 (= e!732381 (and e!732383 mapRes!52193))))

(declare-fun condMapEmpty!52193 () Bool)

(declare-fun mapDefault!52193 () ValueCell!15981)

(assert (=> b!1281852 (= condMapEmpty!52193 (= (arr!40797 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15981)) mapDefault!52193)))))

(declare-fun res!851487 () Bool)

(assert (=> start!108592 (=> (not res!851487) (not e!732380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108592 (= res!851487 (validMask!0 mask!2175))))

(assert (=> start!108592 e!732380))

(assert (=> start!108592 tp_is_empty!33759))

(assert (=> start!108592 true))

(declare-fun array_inv!30955 (array!84588) Bool)

(assert (=> start!108592 (and (array_inv!30955 _values!1445) e!732381)))

(declare-fun array_inv!30956 (array!84590) Bool)

(assert (=> start!108592 (array_inv!30956 _keys!1741)))

(assert (=> start!108592 tp!99470))

(declare-fun b!1281853 () Bool)

(declare-fun res!851485 () Bool)

(assert (=> b!1281853 (=> (not res!851485) (not e!732380))))

(assert (=> b!1281853 (= res!851485 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41348 _keys!1741))))))

(declare-fun b!1281854 () Bool)

(declare-fun res!851483 () Bool)

(assert (=> b!1281854 (=> (not res!851483) (not e!732380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84590 (_ BitVec 32)) Bool)

(assert (=> b!1281854 (= res!851483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52193 () Bool)

(assert (=> mapIsEmpty!52193 mapRes!52193))

(assert (= (and start!108592 res!851487) b!1281849))

(assert (= (and b!1281849 res!851484) b!1281854))

(assert (= (and b!1281854 res!851483) b!1281850))

(assert (= (and b!1281850 res!851486) b!1281853))

(assert (= (and b!1281853 res!851485) b!1281847))

(assert (= (and b!1281852 condMapEmpty!52193) mapIsEmpty!52193))

(assert (= (and b!1281852 (not condMapEmpty!52193)) mapNonEmpty!52193))

(get-info :version)

(assert (= (and mapNonEmpty!52193 ((_ is ValueCellFull!15981) mapValue!52193)) b!1281848))

(assert (= (and b!1281852 ((_ is ValueCellFull!15981) mapDefault!52193)) b!1281851))

(assert (= start!108592 b!1281852))

(declare-fun m!1176237 () Bool)

(assert (=> start!108592 m!1176237))

(declare-fun m!1176239 () Bool)

(assert (=> start!108592 m!1176239))

(declare-fun m!1176241 () Bool)

(assert (=> start!108592 m!1176241))

(declare-fun m!1176243 () Bool)

(assert (=> b!1281847 m!1176243))

(assert (=> b!1281847 m!1176243))

(declare-fun m!1176245 () Bool)

(assert (=> b!1281847 m!1176245))

(declare-fun m!1176247 () Bool)

(assert (=> mapNonEmpty!52193 m!1176247))

(declare-fun m!1176249 () Bool)

(assert (=> b!1281854 m!1176249))

(declare-fun m!1176251 () Bool)

(assert (=> b!1281850 m!1176251))

(check-sat (not b!1281850) b_and!46183 tp_is_empty!33759 (not b!1281854) (not b!1281847) (not mapNonEmpty!52193) (not b_next!28119) (not start!108592))
(check-sat b_and!46183 (not b_next!28119))
