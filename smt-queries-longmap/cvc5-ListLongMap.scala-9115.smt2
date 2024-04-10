; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109474 () Bool)

(assert start!109474)

(declare-fun b_free!28963 () Bool)

(declare-fun b_next!28963 () Bool)

(assert (=> start!109474 (= b_free!28963 (not b_next!28963))))

(declare-fun tp!102008 () Bool)

(declare-fun b_and!47053 () Bool)

(assert (=> start!109474 (= tp!102008 b_and!47053)))

(declare-fun b!1296583 () Bool)

(declare-fun res!861705 () Bool)

(declare-fun e!739694 () Bool)

(assert (=> b!1296583 (=> (not res!861705) (not e!739694))))

(declare-datatypes ((array!86224 0))(
  ( (array!86225 (arr!41613 (Array (_ BitVec 32) (_ BitVec 64))) (size!42163 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86224)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86224 (_ BitVec 32)) Bool)

(assert (=> b!1296583 (= res!861705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296584 () Bool)

(assert (=> b!1296584 (= e!739694 false)))

(declare-datatypes ((V!51241 0))(
  ( (V!51242 (val!17376 Int)) )
))
(declare-fun minValue!1387 () V!51241)

(declare-fun zeroValue!1387 () V!51241)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16403 0))(
  ( (ValueCellFull!16403 (v!19979 V!51241)) (EmptyCell!16403) )
))
(declare-datatypes ((array!86226 0))(
  ( (array!86227 (arr!41614 (Array (_ BitVec 32) ValueCell!16403)) (size!42164 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86226)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580499 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22384 0))(
  ( (tuple2!22385 (_1!11203 (_ BitVec 64)) (_2!11203 V!51241)) )
))
(declare-datatypes ((List!29522 0))(
  ( (Nil!29519) (Cons!29518 (h!30727 tuple2!22384) (t!43086 List!29522)) )
))
(declare-datatypes ((ListLongMap!20041 0))(
  ( (ListLongMap!20042 (toList!10036 List!29522)) )
))
(declare-fun contains!8154 (ListLongMap!20041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5065 (array!86224 array!86226 (_ BitVec 32) (_ BitVec 32) V!51241 V!51241 (_ BitVec 32) Int) ListLongMap!20041)

(assert (=> b!1296584 (= lt!580499 (contains!8154 (getCurrentListMap!5065 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296585 () Bool)

(declare-fun e!739693 () Bool)

(declare-fun tp_is_empty!34603 () Bool)

(assert (=> b!1296585 (= e!739693 tp_is_empty!34603)))

(declare-fun b!1296586 () Bool)

(declare-fun res!861704 () Bool)

(assert (=> b!1296586 (=> (not res!861704) (not e!739694))))

(declare-datatypes ((List!29523 0))(
  ( (Nil!29520) (Cons!29519 (h!30728 (_ BitVec 64)) (t!43087 List!29523)) )
))
(declare-fun arrayNoDuplicates!0 (array!86224 (_ BitVec 32) List!29523) Bool)

(assert (=> b!1296586 (= res!861704 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29520))))

(declare-fun mapNonEmpty!53465 () Bool)

(declare-fun mapRes!53465 () Bool)

(declare-fun tp!102007 () Bool)

(declare-fun e!739695 () Bool)

(assert (=> mapNonEmpty!53465 (= mapRes!53465 (and tp!102007 e!739695))))

(declare-fun mapValue!53465 () ValueCell!16403)

(declare-fun mapKey!53465 () (_ BitVec 32))

(declare-fun mapRest!53465 () (Array (_ BitVec 32) ValueCell!16403))

(assert (=> mapNonEmpty!53465 (= (arr!41614 _values!1445) (store mapRest!53465 mapKey!53465 mapValue!53465))))

(declare-fun b!1296587 () Bool)

(assert (=> b!1296587 (= e!739695 tp_is_empty!34603)))

(declare-fun b!1296588 () Bool)

(declare-fun e!739697 () Bool)

(assert (=> b!1296588 (= e!739697 (and e!739693 mapRes!53465))))

(declare-fun condMapEmpty!53465 () Bool)

(declare-fun mapDefault!53465 () ValueCell!16403)

