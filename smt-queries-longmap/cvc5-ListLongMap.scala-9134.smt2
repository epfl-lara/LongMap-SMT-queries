; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109588 () Bool)

(assert start!109588)

(declare-fun b_free!29077 () Bool)

(declare-fun b_next!29077 () Bool)

(assert (=> start!109588 (= b_free!29077 (not b_next!29077))))

(declare-fun tp!102350 () Bool)

(declare-fun b_and!47167 () Bool)

(assert (=> start!109588 (= tp!102350 b_and!47167)))

(declare-fun res!862630 () Bool)

(declare-fun e!740548 () Bool)

(assert (=> start!109588 (=> (not res!862630) (not e!740548))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109588 (= res!862630 (validMask!0 mask!2175))))

(assert (=> start!109588 e!740548))

(declare-fun tp_is_empty!34717 () Bool)

(assert (=> start!109588 tp_is_empty!34717))

(assert (=> start!109588 true))

(declare-datatypes ((V!51393 0))(
  ( (V!51394 (val!17433 Int)) )
))
(declare-datatypes ((ValueCell!16460 0))(
  ( (ValueCellFull!16460 (v!20036 V!51393)) (EmptyCell!16460) )
))
(declare-datatypes ((array!86440 0))(
  ( (array!86441 (arr!41721 (Array (_ BitVec 32) ValueCell!16460)) (size!42271 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86440)

(declare-fun e!740551 () Bool)

(declare-fun array_inv!31577 (array!86440) Bool)

(assert (=> start!109588 (and (array_inv!31577 _values!1445) e!740551)))

(declare-datatypes ((array!86442 0))(
  ( (array!86443 (arr!41722 (Array (_ BitVec 32) (_ BitVec 64))) (size!42272 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86442)

(declare-fun array_inv!31578 (array!86442) Bool)

(assert (=> start!109588 (array_inv!31578 _keys!1741)))

(assert (=> start!109588 tp!102350))

(declare-fun b!1298017 () Bool)

(declare-fun res!862627 () Bool)

(assert (=> b!1298017 (=> (not res!862627) (not e!740548))))

(declare-datatypes ((List!29603 0))(
  ( (Nil!29600) (Cons!29599 (h!30808 (_ BitVec 64)) (t!43167 List!29603)) )
))
(declare-fun arrayNoDuplicates!0 (array!86442 (_ BitVec 32) List!29603) Bool)

(assert (=> b!1298017 (= res!862627 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29600))))

(declare-fun b!1298018 () Bool)

(declare-fun res!862632 () Bool)

(assert (=> b!1298018 (=> (not res!862632) (not e!740548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86442 (_ BitVec 32)) Bool)

(assert (=> b!1298018 (= res!862632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298019 () Bool)

(declare-fun res!862629 () Bool)

(assert (=> b!1298019 (=> (not res!862629) (not e!740548))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298019 (= res!862629 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42272 _keys!1741))))))

(declare-fun b!1298020 () Bool)

(assert (=> b!1298020 (= e!740548 (not true))))

(declare-fun minValue!1387 () V!51393)

(declare-fun zeroValue!1387 () V!51393)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22472 0))(
  ( (tuple2!22473 (_1!11247 (_ BitVec 64)) (_2!11247 V!51393)) )
))
(declare-datatypes ((List!29604 0))(
  ( (Nil!29601) (Cons!29600 (h!30809 tuple2!22472) (t!43168 List!29604)) )
))
(declare-datatypes ((ListLongMap!20129 0))(
  ( (ListLongMap!20130 (toList!10080 List!29604)) )
))
(declare-fun contains!8198 (ListLongMap!20129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5109 (array!86442 array!86440 (_ BitVec 32) (_ BitVec 32) V!51393 V!51393 (_ BitVec 32) Int) ListLongMap!20129)

(assert (=> b!1298020 (contains!8198 (getCurrentListMap!5109 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42973 0))(
  ( (Unit!42974) )
))
(declare-fun lt!580661 () Unit!42973)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!39 (array!86442 array!86440 (_ BitVec 32) (_ BitVec 32) V!51393 V!51393 (_ BitVec 64) (_ BitVec 32) Int) Unit!42973)

(assert (=> b!1298020 (= lt!580661 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!39 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298021 () Bool)

(declare-fun res!862626 () Bool)

(assert (=> b!1298021 (=> (not res!862626) (not e!740548))))

(assert (=> b!1298021 (= res!862626 (contains!8198 (getCurrentListMap!5109 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298022 () Bool)

(declare-fun res!862631 () Bool)

(assert (=> b!1298022 (=> (not res!862631) (not e!740548))))

(assert (=> b!1298022 (= res!862631 (and (= (size!42271 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42272 _keys!1741) (size!42271 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298023 () Bool)

(declare-fun e!740550 () Bool)

(assert (=> b!1298023 (= e!740550 tp_is_empty!34717)))

(declare-fun mapNonEmpty!53636 () Bool)

(declare-fun mapRes!53636 () Bool)

(declare-fun tp!102349 () Bool)

(declare-fun e!740549 () Bool)

(assert (=> mapNonEmpty!53636 (= mapRes!53636 (and tp!102349 e!740549))))

(declare-fun mapKey!53636 () (_ BitVec 32))

(declare-fun mapValue!53636 () ValueCell!16460)

(declare-fun mapRest!53636 () (Array (_ BitVec 32) ValueCell!16460))

(assert (=> mapNonEmpty!53636 (= (arr!41721 _values!1445) (store mapRest!53636 mapKey!53636 mapValue!53636))))

(declare-fun b!1298024 () Bool)

(assert (=> b!1298024 (= e!740549 tp_is_empty!34717)))

(declare-fun b!1298025 () Bool)

(declare-fun res!862628 () Bool)

(assert (=> b!1298025 (=> (not res!862628) (not e!740548))))

(assert (=> b!1298025 (= res!862628 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42272 _keys!1741)) (not (= (select (arr!41722 _keys!1741) from!2144) k!1205))))))

(declare-fun mapIsEmpty!53636 () Bool)

(assert (=> mapIsEmpty!53636 mapRes!53636))

(declare-fun b!1298026 () Bool)

(assert (=> b!1298026 (= e!740551 (and e!740550 mapRes!53636))))

(declare-fun condMapEmpty!53636 () Bool)

(declare-fun mapDefault!53636 () ValueCell!16460)

