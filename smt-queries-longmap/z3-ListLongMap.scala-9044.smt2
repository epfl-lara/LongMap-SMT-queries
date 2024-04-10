; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109050 () Bool)

(assert start!109050)

(declare-fun b_free!28539 () Bool)

(declare-fun b_next!28539 () Bool)

(assert (=> start!109050 (= b_free!28539 (not b_next!28539))))

(declare-fun tp!100735 () Bool)

(declare-fun b_and!46629 () Bool)

(assert (=> start!109050 (= tp!100735 b_and!46629)))

(declare-fun b!1288985 () Bool)

(declare-fun res!856181 () Bool)

(declare-fun e!735992 () Bool)

(assert (=> b!1288985 (=> (not res!856181) (not e!735992))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85402 0))(
  ( (array!85403 (arr!41202 (Array (_ BitVec 32) (_ BitVec 64))) (size!41752 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85402)

(assert (=> b!1288985 (= res!856181 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41752 _keys!1741))))))

(declare-fun mapIsEmpty!52829 () Bool)

(declare-fun mapRes!52829 () Bool)

(assert (=> mapIsEmpty!52829 mapRes!52829))

(declare-fun b!1288986 () Bool)

(declare-fun res!856183 () Bool)

(assert (=> b!1288986 (=> (not res!856183) (not e!735992))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85402 (_ BitVec 32)) Bool)

(assert (=> b!1288986 (= res!856183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288987 () Bool)

(declare-fun res!856177 () Bool)

(assert (=> b!1288987 (=> (not res!856177) (not e!735992))))

(declare-datatypes ((V!50675 0))(
  ( (V!50676 (val!17164 Int)) )
))
(declare-fun minValue!1387 () V!50675)

(declare-fun zeroValue!1387 () V!50675)

(declare-datatypes ((ValueCell!16191 0))(
  ( (ValueCellFull!16191 (v!19767 V!50675)) (EmptyCell!16191) )
))
(declare-datatypes ((array!85404 0))(
  ( (array!85405 (arr!41203 (Array (_ BitVec 32) ValueCell!16191)) (size!41753 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85404)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22042 0))(
  ( (tuple2!22043 (_1!11032 (_ BitVec 64)) (_2!11032 V!50675)) )
))
(declare-datatypes ((List!29213 0))(
  ( (Nil!29210) (Cons!29209 (h!30418 tuple2!22042) (t!42777 List!29213)) )
))
(declare-datatypes ((ListLongMap!19699 0))(
  ( (ListLongMap!19700 (toList!9865 List!29213)) )
))
(declare-fun contains!7983 (ListLongMap!19699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4926 (array!85402 array!85404 (_ BitVec 32) (_ BitVec 32) V!50675 V!50675 (_ BitVec 32) Int) ListLongMap!19699)

(assert (=> b!1288987 (= res!856177 (contains!7983 (getCurrentListMap!4926 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288988 () Bool)

(declare-fun res!856185 () Bool)

(assert (=> b!1288988 (=> (not res!856185) (not e!735992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288988 (= res!856185 (not (validKeyInArray!0 (select (arr!41202 _keys!1741) from!2144))))))

(declare-fun b!1288989 () Bool)

(declare-fun e!735991 () Bool)

(assert (=> b!1288989 (= e!735992 (not e!735991))))

(declare-fun res!856178 () Bool)

(assert (=> b!1288989 (=> res!856178 e!735991)))

(assert (=> b!1288989 (= res!856178 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288989 (not (contains!7983 (ListLongMap!19700 Nil!29210) k0!1205))))

(declare-datatypes ((Unit!42648 0))(
  ( (Unit!42649) )
))
(declare-fun lt!578128 () Unit!42648)

(declare-fun emptyContainsNothing!53 ((_ BitVec 64)) Unit!42648)

(assert (=> b!1288989 (= lt!578128 (emptyContainsNothing!53 k0!1205))))

(declare-fun b!1288991 () Bool)

(declare-fun res!856179 () Bool)

(assert (=> b!1288991 (=> (not res!856179) (not e!735992))))

(assert (=> b!1288991 (= res!856179 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41752 _keys!1741))))))

(declare-fun b!1288992 () Bool)

(declare-fun res!856182 () Bool)

(assert (=> b!1288992 (=> (not res!856182) (not e!735992))))

(declare-datatypes ((List!29214 0))(
  ( (Nil!29211) (Cons!29210 (h!30419 (_ BitVec 64)) (t!42778 List!29214)) )
))
(declare-fun arrayNoDuplicates!0 (array!85402 (_ BitVec 32) List!29214) Bool)

(assert (=> b!1288992 (= res!856182 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29211))))

(declare-fun b!1288993 () Bool)

(declare-fun e!735989 () Bool)

(declare-fun tp_is_empty!34179 () Bool)

(assert (=> b!1288993 (= e!735989 tp_is_empty!34179)))

(declare-fun b!1288994 () Bool)

(declare-fun e!735988 () Bool)

(declare-fun e!735987 () Bool)

(assert (=> b!1288994 (= e!735988 (and e!735987 mapRes!52829))))

(declare-fun condMapEmpty!52829 () Bool)

(declare-fun mapDefault!52829 () ValueCell!16191)

(assert (=> b!1288994 (= condMapEmpty!52829 (= (arr!41203 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16191)) mapDefault!52829)))))

(declare-fun b!1288995 () Bool)

(assert (=> b!1288995 (= e!735987 tp_is_empty!34179)))

(declare-fun res!856184 () Bool)

(assert (=> start!109050 (=> (not res!856184) (not e!735992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109050 (= res!856184 (validMask!0 mask!2175))))

(assert (=> start!109050 e!735992))

(assert (=> start!109050 tp_is_empty!34179))

(assert (=> start!109050 true))

(declare-fun array_inv!31237 (array!85404) Bool)

(assert (=> start!109050 (and (array_inv!31237 _values!1445) e!735988)))

(declare-fun array_inv!31238 (array!85402) Bool)

(assert (=> start!109050 (array_inv!31238 _keys!1741)))

(assert (=> start!109050 tp!100735))

(declare-fun b!1288990 () Bool)

(declare-fun res!856180 () Bool)

(assert (=> b!1288990 (=> (not res!856180) (not e!735992))))

(assert (=> b!1288990 (= res!856180 (and (= (size!41753 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41752 _keys!1741) (size!41753 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288996 () Bool)

(assert (=> b!1288996 (= e!735991 true)))

(declare-fun lt!578129 () ListLongMap!19699)

(declare-fun +!4337 (ListLongMap!19699 tuple2!22042) ListLongMap!19699)

(assert (=> b!1288996 (not (contains!7983 (+!4337 lt!578129 (tuple2!22043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578127 () Unit!42648)

(declare-fun addStillNotContains!355 (ListLongMap!19699 (_ BitVec 64) V!50675 (_ BitVec 64)) Unit!42648)

(assert (=> b!1288996 (= lt!578127 (addStillNotContains!355 lt!578129 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5968 (array!85402 array!85404 (_ BitVec 32) (_ BitVec 32) V!50675 V!50675 (_ BitVec 32) Int) ListLongMap!19699)

(assert (=> b!1288996 (= lt!578129 (getCurrentListMapNoExtraKeys!5968 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52829 () Bool)

(declare-fun tp!100736 () Bool)

(assert (=> mapNonEmpty!52829 (= mapRes!52829 (and tp!100736 e!735989))))

(declare-fun mapValue!52829 () ValueCell!16191)

(declare-fun mapRest!52829 () (Array (_ BitVec 32) ValueCell!16191))

(declare-fun mapKey!52829 () (_ BitVec 32))

(assert (=> mapNonEmpty!52829 (= (arr!41203 _values!1445) (store mapRest!52829 mapKey!52829 mapValue!52829))))

(assert (= (and start!109050 res!856184) b!1288990))

(assert (= (and b!1288990 res!856180) b!1288986))

(assert (= (and b!1288986 res!856183) b!1288992))

(assert (= (and b!1288992 res!856182) b!1288991))

(assert (= (and b!1288991 res!856179) b!1288987))

(assert (= (and b!1288987 res!856177) b!1288985))

(assert (= (and b!1288985 res!856181) b!1288988))

(assert (= (and b!1288988 res!856185) b!1288989))

(assert (= (and b!1288989 (not res!856178)) b!1288996))

(assert (= (and b!1288994 condMapEmpty!52829) mapIsEmpty!52829))

(assert (= (and b!1288994 (not condMapEmpty!52829)) mapNonEmpty!52829))

(get-info :version)

(assert (= (and mapNonEmpty!52829 ((_ is ValueCellFull!16191) mapValue!52829)) b!1288993))

(assert (= (and b!1288994 ((_ is ValueCellFull!16191) mapDefault!52829)) b!1288995))

(assert (= start!109050 b!1288994))

(declare-fun m!1181539 () Bool)

(assert (=> b!1288988 m!1181539))

(assert (=> b!1288988 m!1181539))

(declare-fun m!1181541 () Bool)

(assert (=> b!1288988 m!1181541))

(declare-fun m!1181543 () Bool)

(assert (=> start!109050 m!1181543))

(declare-fun m!1181545 () Bool)

(assert (=> start!109050 m!1181545))

(declare-fun m!1181547 () Bool)

(assert (=> start!109050 m!1181547))

(declare-fun m!1181549 () Bool)

(assert (=> b!1288996 m!1181549))

(assert (=> b!1288996 m!1181549))

(declare-fun m!1181551 () Bool)

(assert (=> b!1288996 m!1181551))

(declare-fun m!1181553 () Bool)

(assert (=> b!1288996 m!1181553))

(declare-fun m!1181555 () Bool)

(assert (=> b!1288996 m!1181555))

(declare-fun m!1181557 () Bool)

(assert (=> b!1288992 m!1181557))

(declare-fun m!1181559 () Bool)

(assert (=> b!1288986 m!1181559))

(declare-fun m!1181561 () Bool)

(assert (=> mapNonEmpty!52829 m!1181561))

(declare-fun m!1181563 () Bool)

(assert (=> b!1288987 m!1181563))

(assert (=> b!1288987 m!1181563))

(declare-fun m!1181565 () Bool)

(assert (=> b!1288987 m!1181565))

(declare-fun m!1181567 () Bool)

(assert (=> b!1288989 m!1181567))

(declare-fun m!1181569 () Bool)

(assert (=> b!1288989 m!1181569))

(check-sat (not b!1288987) (not b!1288989) (not b!1288996) (not mapNonEmpty!52829) (not start!109050) (not b!1288992) (not b!1288988) tp_is_empty!34179 (not b_next!28539) (not b!1288986) b_and!46629)
(check-sat b_and!46629 (not b_next!28539))
