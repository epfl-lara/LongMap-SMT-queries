; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110128 () Bool)

(assert start!110128)

(declare-fun b_free!29275 () Bool)

(declare-fun b_next!29275 () Bool)

(assert (=> start!110128 (= b_free!29275 (not b_next!29275))))

(declare-fun tp!102980 () Bool)

(declare-fun b_and!47449 () Bool)

(assert (=> start!110128 (= tp!102980 b_and!47449)))

(declare-fun mapNonEmpty!53969 () Bool)

(declare-fun mapRes!53969 () Bool)

(declare-fun tp!102979 () Bool)

(declare-fun e!743805 () Bool)

(assert (=> mapNonEmpty!53969 (= mapRes!53969 (and tp!102979 e!743805))))

(declare-datatypes ((V!51657 0))(
  ( (V!51658 (val!17532 Int)) )
))
(declare-datatypes ((ValueCell!16559 0))(
  ( (ValueCellFull!16559 (v!20150 V!51657)) (EmptyCell!16559) )
))
(declare-fun mapValue!53969 () ValueCell!16559)

(declare-fun mapKey!53969 () (_ BitVec 32))

(declare-fun mapRest!53969 () (Array (_ BitVec 32) ValueCell!16559))

(declare-datatypes ((array!86842 0))(
  ( (array!86843 (arr!41911 (Array (_ BitVec 32) ValueCell!16559)) (size!42461 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86842)

(assert (=> mapNonEmpty!53969 (= (arr!41911 _values!1445) (store mapRest!53969 mapKey!53969 mapValue!53969))))

(declare-fun b!1304004 () Bool)

(declare-fun res!866050 () Bool)

(declare-fun e!743804 () Bool)

(assert (=> b!1304004 (=> (not res!866050) (not e!743804))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86844 0))(
  ( (array!86845 (arr!41912 (Array (_ BitVec 32) (_ BitVec 64))) (size!42462 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86844)

(assert (=> b!1304004 (= res!866050 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42462 _keys!1741))))))

(declare-fun b!1304005 () Bool)

(declare-fun res!866054 () Bool)

(assert (=> b!1304005 (=> (not res!866054) (not e!743804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304005 (= res!866054 (not (validKeyInArray!0 (select (arr!41912 _keys!1741) from!2144))))))

(declare-fun b!1304006 () Bool)

(declare-fun res!866052 () Bool)

(assert (=> b!1304006 (=> (not res!866052) (not e!743804))))

(declare-fun minValue!1387 () V!51657)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!51657)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22626 0))(
  ( (tuple2!22627 (_1!11324 (_ BitVec 64)) (_2!11324 V!51657)) )
))
(declare-datatypes ((List!29749 0))(
  ( (Nil!29746) (Cons!29745 (h!30954 tuple2!22626) (t!43345 List!29749)) )
))
(declare-datatypes ((ListLongMap!20283 0))(
  ( (ListLongMap!20284 (toList!10157 List!29749)) )
))
(declare-fun contains!8295 (ListLongMap!20283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5177 (array!86844 array!86842 (_ BitVec 32) (_ BitVec 32) V!51657 V!51657 (_ BitVec 32) Int) ListLongMap!20283)

(assert (=> b!1304006 (= res!866052 (contains!8295 (getCurrentListMap!5177 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1304007 () Bool)

(declare-fun e!743803 () Bool)

(assert (=> b!1304007 (= e!743803 false)))

(declare-fun lt!583595 () ListLongMap!20283)

(declare-fun +!4480 (ListLongMap!20283 tuple2!22626) ListLongMap!20283)

(assert (=> b!1304007 (not (contains!8295 (+!4480 lt!583595 (tuple2!22627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!43178 0))(
  ( (Unit!43179) )
))
(declare-fun lt!583597 () Unit!43178)

(declare-fun addStillNotContains!477 (ListLongMap!20283 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43178)

(assert (=> b!1304007 (= lt!583597 (addStillNotContains!477 lt!583595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6115 (array!86844 array!86842 (_ BitVec 32) (_ BitVec 32) V!51657 V!51657 (_ BitVec 32) Int) ListLongMap!20283)

(assert (=> b!1304007 (= lt!583595 (getCurrentListMapNoExtraKeys!6115 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304008 () Bool)

(declare-fun res!866051 () Bool)

(assert (=> b!1304008 (=> (not res!866051) (not e!743804))))

(assert (=> b!1304008 (= res!866051 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42462 _keys!1741))))))

(declare-fun b!1304009 () Bool)

(declare-fun tp_is_empty!34915 () Bool)

(assert (=> b!1304009 (= e!743805 tp_is_empty!34915)))

(declare-fun mapIsEmpty!53969 () Bool)

(assert (=> mapIsEmpty!53969 mapRes!53969))

(declare-fun b!1304010 () Bool)

(assert (=> b!1304010 (= e!743804 (not e!743803))))

(declare-fun res!866056 () Bool)

(assert (=> b!1304010 (=> res!866056 e!743803)))

(assert (=> b!1304010 (= res!866056 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304010 (not (contains!8295 (ListLongMap!20284 Nil!29746) k!1205))))

(declare-fun lt!583596 () Unit!43178)

(declare-fun emptyContainsNothing!220 ((_ BitVec 64)) Unit!43178)

(assert (=> b!1304010 (= lt!583596 (emptyContainsNothing!220 k!1205))))

(declare-fun b!1304003 () Bool)

(declare-fun res!866053 () Bool)

(assert (=> b!1304003 (=> (not res!866053) (not e!743804))))

(declare-datatypes ((List!29750 0))(
  ( (Nil!29747) (Cons!29746 (h!30955 (_ BitVec 64)) (t!43346 List!29750)) )
))
(declare-fun arrayNoDuplicates!0 (array!86844 (_ BitVec 32) List!29750) Bool)

(assert (=> b!1304003 (= res!866053 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29747))))

(declare-fun res!866049 () Bool)

(assert (=> start!110128 (=> (not res!866049) (not e!743804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110128 (= res!866049 (validMask!0 mask!2175))))

(assert (=> start!110128 e!743804))

(assert (=> start!110128 tp_is_empty!34915))

(assert (=> start!110128 true))

(declare-fun e!743806 () Bool)

(declare-fun array_inv!31695 (array!86842) Bool)

(assert (=> start!110128 (and (array_inv!31695 _values!1445) e!743806)))

(declare-fun array_inv!31696 (array!86844) Bool)

(assert (=> start!110128 (array_inv!31696 _keys!1741)))

(assert (=> start!110128 tp!102980))

(declare-fun b!1304011 () Bool)

(declare-fun res!866057 () Bool)

(assert (=> b!1304011 (=> (not res!866057) (not e!743804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86844 (_ BitVec 32)) Bool)

(assert (=> b!1304011 (= res!866057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304012 () Bool)

(declare-fun res!866055 () Bool)

(assert (=> b!1304012 (=> (not res!866055) (not e!743804))))

(assert (=> b!1304012 (= res!866055 (and (= (size!42461 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42462 _keys!1741) (size!42461 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304013 () Bool)

(declare-fun e!743807 () Bool)

(assert (=> b!1304013 (= e!743806 (and e!743807 mapRes!53969))))

(declare-fun condMapEmpty!53969 () Bool)

(declare-fun mapDefault!53969 () ValueCell!16559)

