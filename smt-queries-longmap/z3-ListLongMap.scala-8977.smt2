; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108846 () Bool)

(assert start!108846)

(declare-fun b_free!28135 () Bool)

(declare-fun b_next!28135 () Bool)

(assert (=> start!108846 (= b_free!28135 (not b_next!28135))))

(declare-fun tp!99521 () Bool)

(declare-fun b_and!46203 () Bool)

(assert (=> start!108846 (= tp!99521 b_and!46203)))

(declare-fun mapIsEmpty!52220 () Bool)

(declare-fun mapRes!52220 () Bool)

(assert (=> mapIsEmpty!52220 mapRes!52220))

(declare-fun b!1283462 () Bool)

(declare-fun e!733418 () Bool)

(declare-fun e!733422 () Bool)

(assert (=> b!1283462 (= e!733418 (and e!733422 mapRes!52220))))

(declare-fun condMapEmpty!52220 () Bool)

(declare-datatypes ((V!50137 0))(
  ( (V!50138 (val!16962 Int)) )
))
(declare-datatypes ((ValueCell!15989 0))(
  ( (ValueCellFull!15989 (v!19559 V!50137)) (EmptyCell!15989) )
))
(declare-datatypes ((array!84653 0))(
  ( (array!84654 (arr!40824 (Array (_ BitVec 32) ValueCell!15989)) (size!41375 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84653)

(declare-fun mapDefault!52220 () ValueCell!15989)

(assert (=> b!1283462 (= condMapEmpty!52220 (= (arr!40824 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15989)) mapDefault!52220)))))

(declare-fun b!1283463 () Bool)

(declare-fun e!733420 () Bool)

(declare-fun tp_is_empty!33775 () Bool)

(assert (=> b!1283463 (= e!733420 tp_is_empty!33775)))

(declare-fun b!1283464 () Bool)

(assert (=> b!1283464 (= e!733422 tp_is_empty!33775)))

(declare-fun b!1283465 () Bool)

(declare-fun res!852180 () Bool)

(declare-fun e!733419 () Bool)

(assert (=> b!1283465 (=> (not res!852180) (not e!733419))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84655 0))(
  ( (array!84656 (arr!40825 (Array (_ BitVec 32) (_ BitVec 64))) (size!41376 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84655)

(assert (=> b!1283465 (= res!852180 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41376 _keys!1741))))))

(declare-fun b!1283466 () Bool)

(declare-fun res!852179 () Bool)

(assert (=> b!1283466 (=> (not res!852179) (not e!733419))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84655 (_ BitVec 32)) Bool)

(assert (=> b!1283466 (= res!852179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!852177 () Bool)

(assert (=> start!108846 (=> (not res!852177) (not e!733419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108846 (= res!852177 (validMask!0 mask!2175))))

(assert (=> start!108846 e!733419))

(assert (=> start!108846 tp_is_empty!33775))

(assert (=> start!108846 true))

(declare-fun array_inv!31183 (array!84653) Bool)

(assert (=> start!108846 (and (array_inv!31183 _values!1445) e!733418)))

(declare-fun array_inv!31184 (array!84655) Bool)

(assert (=> start!108846 (array_inv!31184 _keys!1741)))

(assert (=> start!108846 tp!99521))

(declare-fun b!1283467 () Bool)

(assert (=> b!1283467 (= e!733419 false)))

(declare-fun minValue!1387 () V!50137)

(declare-fun zeroValue!1387 () V!50137)

(declare-fun lt!576983 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21740 0))(
  ( (tuple2!21741 (_1!10881 (_ BitVec 64)) (_2!10881 V!50137)) )
))
(declare-datatypes ((List!28953 0))(
  ( (Nil!28950) (Cons!28949 (h!30167 tuple2!21740) (t!42489 List!28953)) )
))
(declare-datatypes ((ListLongMap!19405 0))(
  ( (ListLongMap!19406 (toList!9718 List!28953)) )
))
(declare-fun contains!7849 (ListLongMap!19405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4787 (array!84655 array!84653 (_ BitVec 32) (_ BitVec 32) V!50137 V!50137 (_ BitVec 32) Int) ListLongMap!19405)

(assert (=> b!1283467 (= lt!576983 (contains!7849 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283468 () Bool)

(declare-fun res!852181 () Bool)

(assert (=> b!1283468 (=> (not res!852181) (not e!733419))))

(declare-datatypes ((List!28954 0))(
  ( (Nil!28951) (Cons!28950 (h!30168 (_ BitVec 64)) (t!42490 List!28954)) )
))
(declare-fun arrayNoDuplicates!0 (array!84655 (_ BitVec 32) List!28954) Bool)

(assert (=> b!1283468 (= res!852181 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28951))))

(declare-fun mapNonEmpty!52220 () Bool)

(declare-fun tp!99520 () Bool)

(assert (=> mapNonEmpty!52220 (= mapRes!52220 (and tp!99520 e!733420))))

(declare-fun mapValue!52220 () ValueCell!15989)

(declare-fun mapKey!52220 () (_ BitVec 32))

(declare-fun mapRest!52220 () (Array (_ BitVec 32) ValueCell!15989))

(assert (=> mapNonEmpty!52220 (= (arr!40824 _values!1445) (store mapRest!52220 mapKey!52220 mapValue!52220))))

(declare-fun b!1283469 () Bool)

(declare-fun res!852178 () Bool)

(assert (=> b!1283469 (=> (not res!852178) (not e!733419))))

(assert (=> b!1283469 (= res!852178 (and (= (size!41375 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41376 _keys!1741) (size!41375 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108846 res!852177) b!1283469))

(assert (= (and b!1283469 res!852178) b!1283466))

(assert (= (and b!1283466 res!852179) b!1283468))

(assert (= (and b!1283468 res!852181) b!1283465))

(assert (= (and b!1283465 res!852180) b!1283467))

(assert (= (and b!1283462 condMapEmpty!52220) mapIsEmpty!52220))

(assert (= (and b!1283462 (not condMapEmpty!52220)) mapNonEmpty!52220))

(get-info :version)

(assert (= (and mapNonEmpty!52220 ((_ is ValueCellFull!15989) mapValue!52220)) b!1283463))

(assert (= (and b!1283462 ((_ is ValueCellFull!15989) mapDefault!52220)) b!1283464))

(assert (= start!108846 b!1283462))

(declare-fun m!1178065 () Bool)

(assert (=> b!1283466 m!1178065))

(declare-fun m!1178067 () Bool)

(assert (=> b!1283467 m!1178067))

(assert (=> b!1283467 m!1178067))

(declare-fun m!1178069 () Bool)

(assert (=> b!1283467 m!1178069))

(declare-fun m!1178071 () Bool)

(assert (=> start!108846 m!1178071))

(declare-fun m!1178073 () Bool)

(assert (=> start!108846 m!1178073))

(declare-fun m!1178075 () Bool)

(assert (=> start!108846 m!1178075))

(declare-fun m!1178077 () Bool)

(assert (=> b!1283468 m!1178077))

(declare-fun m!1178079 () Bool)

(assert (=> mapNonEmpty!52220 m!1178079))

(check-sat (not start!108846) (not b!1283467) (not b_next!28135) tp_is_empty!33775 (not mapNonEmpty!52220) (not b!1283466) (not b!1283468) b_and!46203)
(check-sat b_and!46203 (not b_next!28135))
