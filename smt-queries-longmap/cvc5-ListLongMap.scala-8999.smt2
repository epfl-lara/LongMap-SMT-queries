; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108754 () Bool)

(assert start!108754)

(declare-fun b_free!28267 () Bool)

(declare-fun b_next!28267 () Bool)

(assert (=> start!108754 (= b_free!28267 (not b_next!28267))))

(declare-fun tp!99917 () Bool)

(declare-fun b_and!46333 () Bool)

(assert (=> start!108754 (= tp!99917 b_and!46333)))

(declare-fun b!1284236 () Bool)

(declare-fun res!853142 () Bool)

(declare-fun e!733561 () Bool)

(assert (=> b!1284236 (=> (not res!853142) (not e!733561))))

(declare-datatypes ((array!84872 0))(
  ( (array!84873 (arr!40938 (Array (_ BitVec 32) (_ BitVec 64))) (size!41488 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84872)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84872 (_ BitVec 32)) Bool)

(assert (=> b!1284236 (= res!853142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284237 () Bool)

(declare-fun e!733565 () Bool)

(declare-fun tp_is_empty!33907 () Bool)

(assert (=> b!1284237 (= e!733565 tp_is_empty!33907)))

(declare-fun res!853144 () Bool)

(assert (=> start!108754 (=> (not res!853144) (not e!733561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108754 (= res!853144 (validMask!0 mask!2175))))

(assert (=> start!108754 e!733561))

(assert (=> start!108754 tp_is_empty!33907))

(assert (=> start!108754 true))

(declare-datatypes ((V!50313 0))(
  ( (V!50314 (val!17028 Int)) )
))
(declare-datatypes ((ValueCell!16055 0))(
  ( (ValueCellFull!16055 (v!19630 V!50313)) (EmptyCell!16055) )
))
(declare-datatypes ((array!84874 0))(
  ( (array!84875 (arr!40939 (Array (_ BitVec 32) ValueCell!16055)) (size!41489 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84874)

(declare-fun e!733564 () Bool)

(declare-fun array_inv!31047 (array!84874) Bool)

(assert (=> start!108754 (and (array_inv!31047 _values!1445) e!733564)))

(declare-fun array_inv!31048 (array!84872) Bool)

(assert (=> start!108754 (array_inv!31048 _keys!1741)))

(assert (=> start!108754 tp!99917))

(declare-fun mapNonEmpty!52418 () Bool)

(declare-fun mapRes!52418 () Bool)

(declare-fun tp!99916 () Bool)

(declare-fun e!733562 () Bool)

(assert (=> mapNonEmpty!52418 (= mapRes!52418 (and tp!99916 e!733562))))

(declare-fun mapValue!52418 () ValueCell!16055)

(declare-fun mapKey!52418 () (_ BitVec 32))

(declare-fun mapRest!52418 () (Array (_ BitVec 32) ValueCell!16055))

(assert (=> mapNonEmpty!52418 (= (arr!40939 _values!1445) (store mapRest!52418 mapKey!52418 mapValue!52418))))

(declare-fun b!1284238 () Bool)

(assert (=> b!1284238 (= e!733561 false)))

(declare-fun minValue!1387 () V!50313)

(declare-fun zeroValue!1387 () V!50313)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576787 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21814 0))(
  ( (tuple2!21815 (_1!10918 (_ BitVec 64)) (_2!10918 V!50313)) )
))
(declare-datatypes ((List!29007 0))(
  ( (Nil!29004) (Cons!29003 (h!30212 tuple2!21814) (t!42551 List!29007)) )
))
(declare-datatypes ((ListLongMap!19471 0))(
  ( (ListLongMap!19472 (toList!9751 List!29007)) )
))
(declare-fun contains!7868 (ListLongMap!19471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4830 (array!84872 array!84874 (_ BitVec 32) (_ BitVec 32) V!50313 V!50313 (_ BitVec 32) Int) ListLongMap!19471)

(assert (=> b!1284238 (= lt!576787 (contains!7868 (getCurrentListMap!4830 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52418 () Bool)

(assert (=> mapIsEmpty!52418 mapRes!52418))

(declare-fun b!1284239 () Bool)

(assert (=> b!1284239 (= e!733562 tp_is_empty!33907)))

(declare-fun b!1284240 () Bool)

(declare-fun res!853146 () Bool)

(assert (=> b!1284240 (=> (not res!853146) (not e!733561))))

(assert (=> b!1284240 (= res!853146 (and (= (size!41489 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41488 _keys!1741) (size!41489 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284241 () Bool)

(declare-fun res!853145 () Bool)

(assert (=> b!1284241 (=> (not res!853145) (not e!733561))))

(declare-datatypes ((List!29008 0))(
  ( (Nil!29005) (Cons!29004 (h!30213 (_ BitVec 64)) (t!42552 List!29008)) )
))
(declare-fun arrayNoDuplicates!0 (array!84872 (_ BitVec 32) List!29008) Bool)

(assert (=> b!1284241 (= res!853145 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29005))))

(declare-fun b!1284242 () Bool)

(declare-fun res!853143 () Bool)

(assert (=> b!1284242 (=> (not res!853143) (not e!733561))))

(assert (=> b!1284242 (= res!853143 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41488 _keys!1741))))))

(declare-fun b!1284243 () Bool)

(assert (=> b!1284243 (= e!733564 (and e!733565 mapRes!52418))))

(declare-fun condMapEmpty!52418 () Bool)

(declare-fun mapDefault!52418 () ValueCell!16055)

