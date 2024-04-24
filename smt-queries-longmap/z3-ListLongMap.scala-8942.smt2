; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108602 () Bool)

(assert start!108602)

(declare-fun b_free!27925 () Bool)

(declare-fun b_next!27925 () Bool)

(assert (=> start!108602 (= b_free!27925 (not b_next!27925))))

(declare-fun tp!98885 () Bool)

(declare-fun b_and!45987 () Bool)

(assert (=> start!108602 (= tp!98885 b_and!45987)))

(declare-fun res!850221 () Bool)

(declare-fun e!731648 () Bool)

(assert (=> start!108602 (=> (not res!850221) (not e!731648))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108602 (= res!850221 (validMask!0 mask!2175))))

(assert (=> start!108602 e!731648))

(declare-fun tp_is_empty!33565 () Bool)

(assert (=> start!108602 tp_is_empty!33565))

(assert (=> start!108602 true))

(declare-datatypes ((V!49857 0))(
  ( (V!49858 (val!16857 Int)) )
))
(declare-datatypes ((ValueCell!15884 0))(
  ( (ValueCellFull!15884 (v!19452 V!49857)) (EmptyCell!15884) )
))
(declare-datatypes ((array!84245 0))(
  ( (array!84246 (arr!40622 (Array (_ BitVec 32) ValueCell!15884)) (size!41173 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84245)

(declare-fun e!731649 () Bool)

(declare-fun array_inv!31035 (array!84245) Bool)

(assert (=> start!108602 (and (array_inv!31035 _values!1445) e!731649)))

(declare-datatypes ((array!84247 0))(
  ( (array!84248 (arr!40623 (Array (_ BitVec 32) (_ BitVec 64))) (size!41174 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84247)

(declare-fun array_inv!31036 (array!84247) Bool)

(assert (=> start!108602 (array_inv!31036 _keys!1741)))

(assert (=> start!108602 tp!98885))

(declare-fun b!1280409 () Bool)

(declare-fun res!850218 () Bool)

(assert (=> b!1280409 (=> (not res!850218) (not e!731648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84247 (_ BitVec 32)) Bool)

(assert (=> b!1280409 (= res!850218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280410 () Bool)

(declare-fun res!850217 () Bool)

(assert (=> b!1280410 (=> (not res!850217) (not e!731648))))

(declare-datatypes ((List!28800 0))(
  ( (Nil!28797) (Cons!28796 (h!30014 (_ BitVec 64)) (t!42332 List!28800)) )
))
(declare-fun arrayNoDuplicates!0 (array!84247 (_ BitVec 32) List!28800) Bool)

(assert (=> b!1280410 (= res!850217 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28797))))

(declare-fun b!1280411 () Bool)

(declare-fun e!731651 () Bool)

(assert (=> b!1280411 (= e!731651 tp_is_empty!33565)))

(declare-fun mapNonEmpty!51899 () Bool)

(declare-fun mapRes!51899 () Bool)

(declare-fun tp!98884 () Bool)

(assert (=> mapNonEmpty!51899 (= mapRes!51899 (and tp!98884 e!731651))))

(declare-fun mapKey!51899 () (_ BitVec 32))

(declare-fun mapRest!51899 () (Array (_ BitVec 32) ValueCell!15884))

(declare-fun mapValue!51899 () ValueCell!15884)

(assert (=> mapNonEmpty!51899 (= (arr!40622 _values!1445) (store mapRest!51899 mapKey!51899 mapValue!51899))))

(declare-fun b!1280412 () Bool)

(declare-fun res!850220 () Bool)

(assert (=> b!1280412 (=> (not res!850220) (not e!731648))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280412 (= res!850220 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41174 _keys!1741))))))

(declare-fun b!1280413 () Bool)

(assert (=> b!1280413 (= e!731648 false)))

(declare-fun minValue!1387 () V!49857)

(declare-fun zeroValue!1387 () V!49857)

(declare-fun lt!576453 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21586 0))(
  ( (tuple2!21587 (_1!10804 (_ BitVec 64)) (_2!10804 V!49857)) )
))
(declare-datatypes ((List!28801 0))(
  ( (Nil!28798) (Cons!28797 (h!30015 tuple2!21586) (t!42333 List!28801)) )
))
(declare-datatypes ((ListLongMap!19251 0))(
  ( (ListLongMap!19252 (toList!9641 List!28801)) )
))
(declare-fun contains!7770 (ListLongMap!19251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4710 (array!84247 array!84245 (_ BitVec 32) (_ BitVec 32) V!49857 V!49857 (_ BitVec 32) Int) ListLongMap!19251)

(assert (=> b!1280413 (= lt!576453 (contains!7770 (getCurrentListMap!4710 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280414 () Bool)

(declare-fun res!850219 () Bool)

(assert (=> b!1280414 (=> (not res!850219) (not e!731648))))

(assert (=> b!1280414 (= res!850219 (and (= (size!41173 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41174 _keys!1741) (size!41173 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280415 () Bool)

(declare-fun e!731650 () Bool)

(assert (=> b!1280415 (= e!731650 tp_is_empty!33565)))

(declare-fun b!1280416 () Bool)

(assert (=> b!1280416 (= e!731649 (and e!731650 mapRes!51899))))

(declare-fun condMapEmpty!51899 () Bool)

(declare-fun mapDefault!51899 () ValueCell!15884)

(assert (=> b!1280416 (= condMapEmpty!51899 (= (arr!40622 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15884)) mapDefault!51899)))))

(declare-fun mapIsEmpty!51899 () Bool)

(assert (=> mapIsEmpty!51899 mapRes!51899))

(assert (= (and start!108602 res!850221) b!1280414))

(assert (= (and b!1280414 res!850219) b!1280409))

(assert (= (and b!1280409 res!850218) b!1280410))

(assert (= (and b!1280410 res!850217) b!1280412))

(assert (= (and b!1280412 res!850220) b!1280413))

(assert (= (and b!1280416 condMapEmpty!51899) mapIsEmpty!51899))

(assert (= (and b!1280416 (not condMapEmpty!51899)) mapNonEmpty!51899))

(get-info :version)

(assert (= (and mapNonEmpty!51899 ((_ is ValueCellFull!15884) mapValue!51899)) b!1280411))

(assert (= (and b!1280416 ((_ is ValueCellFull!15884) mapDefault!51899)) b!1280415))

(assert (= start!108602 b!1280416))

(declare-fun m!1175793 () Bool)

(assert (=> mapNonEmpty!51899 m!1175793))

(declare-fun m!1175795 () Bool)

(assert (=> b!1280410 m!1175795))

(declare-fun m!1175797 () Bool)

(assert (=> start!108602 m!1175797))

(declare-fun m!1175799 () Bool)

(assert (=> start!108602 m!1175799))

(declare-fun m!1175801 () Bool)

(assert (=> start!108602 m!1175801))

(declare-fun m!1175803 () Bool)

(assert (=> b!1280413 m!1175803))

(assert (=> b!1280413 m!1175803))

(declare-fun m!1175805 () Bool)

(assert (=> b!1280413 m!1175805))

(declare-fun m!1175807 () Bool)

(assert (=> b!1280409 m!1175807))

(check-sat (not b!1280410) (not b!1280409) (not b!1280413) b_and!45987 (not start!108602) (not b_next!27925) (not mapNonEmpty!51899) tp_is_empty!33565)
(check-sat b_and!45987 (not b_next!27925))
