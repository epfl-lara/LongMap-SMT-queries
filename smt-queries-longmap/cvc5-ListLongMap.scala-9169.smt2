; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110164 () Bool)

(assert start!110164)

(declare-fun b_free!29287 () Bool)

(declare-fun b_next!29287 () Bool)

(assert (=> start!110164 (= b_free!29287 (not b_next!29287))))

(declare-fun tp!103019 () Bool)

(declare-fun b_and!47467 () Bool)

(assert (=> start!110164 (= tp!103019 b_and!47467)))

(declare-fun b!1304382 () Bool)

(declare-fun e!744020 () Bool)

(declare-fun e!744015 () Bool)

(assert (=> b!1304382 (= e!744020 (not e!744015))))

(declare-fun res!866286 () Bool)

(assert (=> b!1304382 (=> res!866286 e!744015)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304382 (= res!866286 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51673 0))(
  ( (V!51674 (val!17538 Int)) )
))
(declare-datatypes ((tuple2!22636 0))(
  ( (tuple2!22637 (_1!11329 (_ BitVec 64)) (_2!11329 V!51673)) )
))
(declare-datatypes ((List!29757 0))(
  ( (Nil!29754) (Cons!29753 (h!30962 tuple2!22636) (t!43355 List!29757)) )
))
(declare-datatypes ((ListLongMap!20293 0))(
  ( (ListLongMap!20294 (toList!10162 List!29757)) )
))
(declare-fun contains!8302 (ListLongMap!20293 (_ BitVec 64)) Bool)

(assert (=> b!1304382 (not (contains!8302 (ListLongMap!20294 Nil!29754) k!1205))))

(declare-datatypes ((Unit!43192 0))(
  ( (Unit!43193) )
))
(declare-fun lt!583779 () Unit!43192)

(declare-fun emptyContainsNothing!225 ((_ BitVec 64)) Unit!43192)

(assert (=> b!1304382 (= lt!583779 (emptyContainsNothing!225 k!1205))))

(declare-fun b!1304383 () Bool)

(declare-fun res!866284 () Bool)

(assert (=> b!1304383 (=> (not res!866284) (not e!744020))))

(declare-datatypes ((array!86868 0))(
  ( (array!86869 (arr!41923 (Array (_ BitVec 32) (_ BitVec 64))) (size!42473 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86868)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86868 (_ BitVec 32)) Bool)

(assert (=> b!1304383 (= res!866284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304384 () Bool)

(declare-fun e!744016 () Bool)

(assert (=> b!1304384 (= e!744015 e!744016)))

(declare-fun res!866288 () Bool)

(assert (=> b!1304384 (=> (not res!866288) (not e!744016))))

(declare-fun minValue!1387 () V!51673)

(declare-fun zeroValue!1387 () V!51673)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16565 0))(
  ( (ValueCellFull!16565 (v!20157 V!51673)) (EmptyCell!16565) )
))
(declare-datatypes ((array!86870 0))(
  ( (array!86871 (arr!41924 (Array (_ BitVec 32) ValueCell!16565)) (size!42474 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86870)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6120 (array!86868 array!86870 (_ BitVec 32) (_ BitVec 32) V!51673 V!51673 (_ BitVec 32) Int) ListLongMap!20293)

(assert (=> b!1304384 (= res!866288 (not (contains!8302 (getCurrentListMapNoExtraKeys!6120 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205)))))

(declare-fun b!1304385 () Bool)

(declare-fun res!866290 () Bool)

(assert (=> b!1304385 (=> (not res!866290) (not e!744020))))

(assert (=> b!1304385 (= res!866290 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42473 _keys!1741))))))

(declare-fun b!1304386 () Bool)

(declare-fun res!866282 () Bool)

(assert (=> b!1304386 (=> (not res!866282) (not e!744020))))

(declare-fun getCurrentListMap!5180 (array!86868 array!86870 (_ BitVec 32) (_ BitVec 32) V!51673 V!51673 (_ BitVec 32) Int) ListLongMap!20293)

(assert (=> b!1304386 (= res!866282 (contains!8302 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!53990 () Bool)

(declare-fun mapRes!53990 () Bool)

(declare-fun tp!103018 () Bool)

(declare-fun e!744019 () Bool)

(assert (=> mapNonEmpty!53990 (= mapRes!53990 (and tp!103018 e!744019))))

(declare-fun mapKey!53990 () (_ BitVec 32))

(declare-fun mapRest!53990 () (Array (_ BitVec 32) ValueCell!16565))

(declare-fun mapValue!53990 () ValueCell!16565)

(assert (=> mapNonEmpty!53990 (= (arr!41924 _values!1445) (store mapRest!53990 mapKey!53990 mapValue!53990))))

(declare-fun res!866289 () Bool)

(assert (=> start!110164 (=> (not res!866289) (not e!744020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110164 (= res!866289 (validMask!0 mask!2175))))

(assert (=> start!110164 e!744020))

(declare-fun tp_is_empty!34927 () Bool)

(assert (=> start!110164 tp_is_empty!34927))

(assert (=> start!110164 true))

(declare-fun e!744018 () Bool)

(declare-fun array_inv!31701 (array!86870) Bool)

(assert (=> start!110164 (and (array_inv!31701 _values!1445) e!744018)))

(declare-fun array_inv!31702 (array!86868) Bool)

(assert (=> start!110164 (array_inv!31702 _keys!1741)))

(assert (=> start!110164 tp!103019))

(declare-fun b!1304387 () Bool)

(declare-fun e!744017 () Bool)

(assert (=> b!1304387 (= e!744018 (and e!744017 mapRes!53990))))

(declare-fun condMapEmpty!53990 () Bool)

(declare-fun mapDefault!53990 () ValueCell!16565)

