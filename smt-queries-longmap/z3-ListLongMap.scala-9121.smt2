; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109510 () Bool)

(assert start!109510)

(declare-fun b_free!28999 () Bool)

(declare-fun b_next!28999 () Bool)

(assert (=> start!109510 (= b_free!28999 (not b_next!28999))))

(declare-fun tp!102116 () Bool)

(declare-fun b_and!47071 () Bool)

(assert (=> start!109510 (= tp!102116 b_and!47071)))

(declare-fun res!861959 () Bool)

(declare-fun e!739935 () Bool)

(assert (=> start!109510 (=> (not res!861959) (not e!739935))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109510 (= res!861959 (validMask!0 mask!2175))))

(assert (=> start!109510 e!739935))

(declare-fun tp_is_empty!34639 () Bool)

(assert (=> start!109510 tp_is_empty!34639))

(assert (=> start!109510 true))

(declare-datatypes ((V!51289 0))(
  ( (V!51290 (val!17394 Int)) )
))
(declare-datatypes ((ValueCell!16421 0))(
  ( (ValueCellFull!16421 (v!19996 V!51289)) (EmptyCell!16421) )
))
(declare-datatypes ((array!86187 0))(
  ( (array!86188 (arr!41595 (Array (_ BitVec 32) ValueCell!16421)) (size!42147 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86187)

(declare-fun e!739936 () Bool)

(declare-fun array_inv!31649 (array!86187) Bool)

(assert (=> start!109510 (and (array_inv!31649 _values!1445) e!739936)))

(declare-datatypes ((array!86189 0))(
  ( (array!86190 (arr!41596 (Array (_ BitVec 32) (_ BitVec 64))) (size!42148 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86189)

(declare-fun array_inv!31650 (array!86189) Bool)

(assert (=> start!109510 (array_inv!31650 _keys!1741)))

(assert (=> start!109510 tp!102116))

(declare-fun b!1296959 () Bool)

(declare-fun res!861957 () Bool)

(assert (=> b!1296959 (=> (not res!861957) (not e!739935))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296959 (= res!861957 (and (= (size!42147 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42148 _keys!1741) (size!42147 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296960 () Bool)

(assert (=> b!1296960 (= e!739935 false)))

(declare-fun minValue!1387 () V!51289)

(declare-fun zeroValue!1387 () V!51289)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580366 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22468 0))(
  ( (tuple2!22469 (_1!11245 (_ BitVec 64)) (_2!11245 V!51289)) )
))
(declare-datatypes ((List!29593 0))(
  ( (Nil!29590) (Cons!29589 (h!30798 tuple2!22468) (t!43149 List!29593)) )
))
(declare-datatypes ((ListLongMap!20125 0))(
  ( (ListLongMap!20126 (toList!10078 List!29593)) )
))
(declare-fun contains!8126 (ListLongMap!20125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4994 (array!86189 array!86187 (_ BitVec 32) (_ BitVec 32) V!51289 V!51289 (_ BitVec 32) Int) ListLongMap!20125)

(assert (=> b!1296960 (= lt!580366 (contains!8126 (getCurrentListMap!4994 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296961 () Bool)

(declare-fun e!739937 () Bool)

(assert (=> b!1296961 (= e!739937 tp_is_empty!34639)))

(declare-fun b!1296962 () Bool)

(declare-fun res!861960 () Bool)

(assert (=> b!1296962 (=> (not res!861960) (not e!739935))))

(assert (=> b!1296962 (= res!861960 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42148 _keys!1741))))))

(declare-fun mapNonEmpty!53519 () Bool)

(declare-fun mapRes!53519 () Bool)

(declare-fun tp!102117 () Bool)

(assert (=> mapNonEmpty!53519 (= mapRes!53519 (and tp!102117 e!739937))))

(declare-fun mapKey!53519 () (_ BitVec 32))

(declare-fun mapRest!53519 () (Array (_ BitVec 32) ValueCell!16421))

(declare-fun mapValue!53519 () ValueCell!16421)

(assert (=> mapNonEmpty!53519 (= (arr!41595 _values!1445) (store mapRest!53519 mapKey!53519 mapValue!53519))))

(declare-fun b!1296963 () Bool)

(declare-fun e!739934 () Bool)

(assert (=> b!1296963 (= e!739936 (and e!739934 mapRes!53519))))

(declare-fun condMapEmpty!53519 () Bool)

(declare-fun mapDefault!53519 () ValueCell!16421)

(assert (=> b!1296963 (= condMapEmpty!53519 (= (arr!41595 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16421)) mapDefault!53519)))))

(declare-fun mapIsEmpty!53519 () Bool)

(assert (=> mapIsEmpty!53519 mapRes!53519))

(declare-fun b!1296964 () Bool)

(declare-fun res!861956 () Bool)

(assert (=> b!1296964 (=> (not res!861956) (not e!739935))))

(declare-datatypes ((List!29594 0))(
  ( (Nil!29591) (Cons!29590 (h!30799 (_ BitVec 64)) (t!43150 List!29594)) )
))
(declare-fun arrayNoDuplicates!0 (array!86189 (_ BitVec 32) List!29594) Bool)

(assert (=> b!1296964 (= res!861956 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29591))))

(declare-fun b!1296965 () Bool)

(assert (=> b!1296965 (= e!739934 tp_is_empty!34639)))

(declare-fun b!1296966 () Bool)

(declare-fun res!861958 () Bool)

(assert (=> b!1296966 (=> (not res!861958) (not e!739935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86189 (_ BitVec 32)) Bool)

(assert (=> b!1296966 (= res!861958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109510 res!861959) b!1296959))

(assert (= (and b!1296959 res!861957) b!1296966))

(assert (= (and b!1296966 res!861958) b!1296964))

(assert (= (and b!1296964 res!861956) b!1296962))

(assert (= (and b!1296962 res!861960) b!1296960))

(assert (= (and b!1296963 condMapEmpty!53519) mapIsEmpty!53519))

(assert (= (and b!1296963 (not condMapEmpty!53519)) mapNonEmpty!53519))

(get-info :version)

(assert (= (and mapNonEmpty!53519 ((_ is ValueCellFull!16421) mapValue!53519)) b!1296961))

(assert (= (and b!1296963 ((_ is ValueCellFull!16421) mapDefault!53519)) b!1296965))

(assert (= start!109510 b!1296963))

(declare-fun m!1188255 () Bool)

(assert (=> b!1296964 m!1188255))

(declare-fun m!1188257 () Bool)

(assert (=> b!1296966 m!1188257))

(declare-fun m!1188259 () Bool)

(assert (=> mapNonEmpty!53519 m!1188259))

(declare-fun m!1188261 () Bool)

(assert (=> start!109510 m!1188261))

(declare-fun m!1188263 () Bool)

(assert (=> start!109510 m!1188263))

(declare-fun m!1188265 () Bool)

(assert (=> start!109510 m!1188265))

(declare-fun m!1188267 () Bool)

(assert (=> b!1296960 m!1188267))

(assert (=> b!1296960 m!1188267))

(declare-fun m!1188269 () Bool)

(assert (=> b!1296960 m!1188269))

(check-sat (not mapNonEmpty!53519) (not b!1296960) (not b!1296966) b_and!47071 tp_is_empty!34639 (not b_next!28999) (not b!1296964) (not start!109510))
(check-sat b_and!47071 (not b_next!28999))
