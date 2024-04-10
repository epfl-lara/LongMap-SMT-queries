; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109684 () Bool)

(assert start!109684)

(declare-fun b_free!29137 () Bool)

(declare-fun b_next!29137 () Bool)

(assert (=> start!109684 (= b_free!29137 (not b_next!29137))))

(declare-fun tp!102536 () Bool)

(declare-fun b_and!47233 () Bool)

(assert (=> start!109684 (= tp!102536 b_and!47233)))

(declare-fun b!1299184 () Bool)

(declare-fun res!863375 () Bool)

(declare-fun e!741185 () Bool)

(assert (=> b!1299184 (=> (not res!863375) (not e!741185))))

(declare-datatypes ((array!86562 0))(
  ( (array!86563 (arr!41780 (Array (_ BitVec 32) (_ BitVec 64))) (size!42330 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86562)

(declare-datatypes ((List!29652 0))(
  ( (Nil!29649) (Cons!29648 (h!30857 (_ BitVec 64)) (t!43220 List!29652)) )
))
(declare-fun arrayNoDuplicates!0 (array!86562 (_ BitVec 32) List!29652) Bool)

(assert (=> b!1299184 (= res!863375 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29649))))

(declare-fun mapIsEmpty!53732 () Bool)

(declare-fun mapRes!53732 () Bool)

(assert (=> mapIsEmpty!53732 mapRes!53732))

(declare-fun b!1299185 () Bool)

(declare-fun res!863377 () Bool)

(assert (=> b!1299185 (=> (not res!863377) (not e!741185))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1299185 (= res!863377 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42330 _keys!1741))))))

(declare-fun b!1299186 () Bool)

(assert (=> b!1299186 (= e!741185 false)))

(declare-datatypes ((V!51473 0))(
  ( (V!51474 (val!17463 Int)) )
))
(declare-fun minValue!1387 () V!51473)

(declare-fun zeroValue!1387 () V!51473)

(declare-datatypes ((ValueCell!16490 0))(
  ( (ValueCellFull!16490 (v!20068 V!51473)) (EmptyCell!16490) )
))
(declare-datatypes ((array!86564 0))(
  ( (array!86565 (arr!41781 (Array (_ BitVec 32) ValueCell!16490)) (size!42331 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86564)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!580957 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22522 0))(
  ( (tuple2!22523 (_1!11272 (_ BitVec 64)) (_2!11272 V!51473)) )
))
(declare-datatypes ((List!29653 0))(
  ( (Nil!29650) (Cons!29649 (h!30858 tuple2!22522) (t!43221 List!29653)) )
))
(declare-datatypes ((ListLongMap!20179 0))(
  ( (ListLongMap!20180 (toList!10105 List!29653)) )
))
(declare-fun contains!8225 (ListLongMap!20179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5134 (array!86562 array!86564 (_ BitVec 32) (_ BitVec 32) V!51473 V!51473 (_ BitVec 32) Int) ListLongMap!20179)

(assert (=> b!1299186 (= lt!580957 (contains!8225 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1299187 () Bool)

(declare-fun e!741187 () Bool)

(declare-fun tp_is_empty!34777 () Bool)

(assert (=> b!1299187 (= e!741187 tp_is_empty!34777)))

(declare-fun b!1299188 () Bool)

(declare-fun res!863376 () Bool)

(assert (=> b!1299188 (=> (not res!863376) (not e!741185))))

(assert (=> b!1299188 (= res!863376 (and (= (size!42331 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42330 _keys!1741) (size!42331 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!863378 () Bool)

(assert (=> start!109684 (=> (not res!863378) (not e!741185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109684 (= res!863378 (validMask!0 mask!2175))))

(assert (=> start!109684 e!741185))

(assert (=> start!109684 tp_is_empty!34777))

(assert (=> start!109684 true))

(declare-fun e!741186 () Bool)

(declare-fun array_inv!31619 (array!86564) Bool)

(assert (=> start!109684 (and (array_inv!31619 _values!1445) e!741186)))

(declare-fun array_inv!31620 (array!86562) Bool)

(assert (=> start!109684 (array_inv!31620 _keys!1741)))

(assert (=> start!109684 tp!102536))

(declare-fun mapNonEmpty!53732 () Bool)

(declare-fun tp!102535 () Bool)

(declare-fun e!741184 () Bool)

(assert (=> mapNonEmpty!53732 (= mapRes!53732 (and tp!102535 e!741184))))

(declare-fun mapKey!53732 () (_ BitVec 32))

(declare-fun mapRest!53732 () (Array (_ BitVec 32) ValueCell!16490))

(declare-fun mapValue!53732 () ValueCell!16490)

(assert (=> mapNonEmpty!53732 (= (arr!41781 _values!1445) (store mapRest!53732 mapKey!53732 mapValue!53732))))

(declare-fun b!1299189 () Bool)

(assert (=> b!1299189 (= e!741184 tp_is_empty!34777)))

(declare-fun b!1299190 () Bool)

(declare-fun res!863379 () Bool)

(assert (=> b!1299190 (=> (not res!863379) (not e!741185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86562 (_ BitVec 32)) Bool)

(assert (=> b!1299190 (= res!863379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299191 () Bool)

(assert (=> b!1299191 (= e!741186 (and e!741187 mapRes!53732))))

(declare-fun condMapEmpty!53732 () Bool)

(declare-fun mapDefault!53732 () ValueCell!16490)

