; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109616 () Bool)

(assert start!109616)

(declare-fun b_free!29105 () Bool)

(declare-fun b_next!29105 () Bool)

(assert (=> start!109616 (= b_free!29105 (not b_next!29105))))

(declare-fun tp!102434 () Bool)

(declare-fun b_and!47195 () Bool)

(assert (=> start!109616 (= tp!102434 b_and!47195)))

(declare-fun b!1298437 () Bool)

(declare-fun e!740761 () Bool)

(declare-fun tp_is_empty!34745 () Bool)

(assert (=> b!1298437 (= e!740761 tp_is_empty!34745)))

(declare-fun b!1298438 () Bool)

(declare-fun e!740762 () Bool)

(assert (=> b!1298438 (= e!740762 (not true))))

(declare-datatypes ((V!51429 0))(
  ( (V!51430 (val!17447 Int)) )
))
(declare-fun minValue!1387 () V!51429)

(declare-fun zeroValue!1387 () V!51429)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16474 0))(
  ( (ValueCellFull!16474 (v!20050 V!51429)) (EmptyCell!16474) )
))
(declare-datatypes ((array!86496 0))(
  ( (array!86497 (arr!41749 (Array (_ BitVec 32) ValueCell!16474)) (size!42299 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86496)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86498 0))(
  ( (array!86499 (arr!41750 (Array (_ BitVec 32) (_ BitVec 64))) (size!42300 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86498)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22496 0))(
  ( (tuple2!22497 (_1!11259 (_ BitVec 64)) (_2!11259 V!51429)) )
))
(declare-datatypes ((List!29625 0))(
  ( (Nil!29622) (Cons!29621 (h!30830 tuple2!22496) (t!43189 List!29625)) )
))
(declare-datatypes ((ListLongMap!20153 0))(
  ( (ListLongMap!20154 (toList!10092 List!29625)) )
))
(declare-fun contains!8210 (ListLongMap!20153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5121 (array!86498 array!86496 (_ BitVec 32) (_ BitVec 32) V!51429 V!51429 (_ BitVec 32) Int) ListLongMap!20153)

(assert (=> b!1298438 (contains!8210 (getCurrentListMap!5121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42993 0))(
  ( (Unit!42994) )
))
(declare-fun lt!580703 () Unit!42993)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 (array!86498 array!86496 (_ BitVec 32) (_ BitVec 32) V!51429 V!51429 (_ BitVec 64) (_ BitVec 32) Int) Unit!42993)

(assert (=> b!1298438 (= lt!580703 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298439 () Bool)

(declare-fun res!862925 () Bool)

(assert (=> b!1298439 (=> (not res!862925) (not e!740762))))

(assert (=> b!1298439 (= res!862925 (contains!8210 (getCurrentListMap!5121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298440 () Bool)

(declare-fun res!862926 () Bool)

(assert (=> b!1298440 (=> (not res!862926) (not e!740762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86498 (_ BitVec 32)) Bool)

(assert (=> b!1298440 (= res!862926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298441 () Bool)

(declare-fun e!740760 () Bool)

(declare-fun mapRes!53678 () Bool)

(assert (=> b!1298441 (= e!740760 (and e!740761 mapRes!53678))))

(declare-fun condMapEmpty!53678 () Bool)

(declare-fun mapDefault!53678 () ValueCell!16474)

