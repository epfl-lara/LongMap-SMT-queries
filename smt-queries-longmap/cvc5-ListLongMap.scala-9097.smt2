; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109366 () Bool)

(assert start!109366)

(declare-fun b_free!28855 () Bool)

(declare-fun b_next!28855 () Bool)

(assert (=> start!109366 (= b_free!28855 (not b_next!28855))))

(declare-fun tp!101683 () Bool)

(declare-fun b_and!46945 () Bool)

(assert (=> start!109366 (= tp!101683 b_and!46945)))

(declare-fun b!1294536 () Bool)

(declare-fun res!860311 () Bool)

(declare-fun e!738695 () Bool)

(assert (=> b!1294536 (=> (not res!860311) (not e!738695))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86012 0))(
  ( (array!86013 (arr!41507 (Array (_ BitVec 32) (_ BitVec 64))) (size!42057 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86012)

(assert (=> b!1294536 (= res!860311 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42057 _keys!1741))))))

(declare-fun b!1294538 () Bool)

(declare-fun res!860310 () Bool)

(assert (=> b!1294538 (=> (not res!860310) (not e!738695))))

(declare-datatypes ((V!51097 0))(
  ( (V!51098 (val!17322 Int)) )
))
(declare-fun minValue!1387 () V!51097)

(declare-fun zeroValue!1387 () V!51097)

(declare-datatypes ((ValueCell!16349 0))(
  ( (ValueCellFull!16349 (v!19925 V!51097)) (EmptyCell!16349) )
))
(declare-datatypes ((array!86014 0))(
  ( (array!86015 (arr!41508 (Array (_ BitVec 32) ValueCell!16349)) (size!42058 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86014)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22300 0))(
  ( (tuple2!22301 (_1!11161 (_ BitVec 64)) (_2!11161 V!51097)) )
))
(declare-datatypes ((List!29443 0))(
  ( (Nil!29440) (Cons!29439 (h!30648 tuple2!22300) (t!43007 List!29443)) )
))
(declare-datatypes ((ListLongMap!19957 0))(
  ( (ListLongMap!19958 (toList!9994 List!29443)) )
))
(declare-fun contains!8112 (ListLongMap!19957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5031 (array!86012 array!86014 (_ BitVec 32) (_ BitVec 32) V!51097 V!51097 (_ BitVec 32) Int) ListLongMap!19957)

(assert (=> b!1294538 (= res!860310 (contains!8112 (getCurrentListMap!5031 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294539 () Bool)

(declare-fun res!860309 () Bool)

(assert (=> b!1294539 (=> (not res!860309) (not e!738695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294539 (= res!860309 (not (validKeyInArray!0 (select (arr!41507 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53303 () Bool)

(declare-fun mapRes!53303 () Bool)

(declare-fun tp!101684 () Bool)

(declare-fun e!738694 () Bool)

(assert (=> mapNonEmpty!53303 (= mapRes!53303 (and tp!101684 e!738694))))

(declare-fun mapKey!53303 () (_ BitVec 32))

(declare-fun mapRest!53303 () (Array (_ BitVec 32) ValueCell!16349))

(declare-fun mapValue!53303 () ValueCell!16349)

(assert (=> mapNonEmpty!53303 (= (arr!41508 _values!1445) (store mapRest!53303 mapKey!53303 mapValue!53303))))

(declare-fun b!1294540 () Bool)

(declare-fun res!860307 () Bool)

(assert (=> b!1294540 (=> (not res!860307) (not e!738695))))

(assert (=> b!1294540 (= res!860307 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42057 _keys!1741))))))

(declare-fun b!1294541 () Bool)

(declare-fun res!860312 () Bool)

(assert (=> b!1294541 (=> (not res!860312) (not e!738695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86012 (_ BitVec 32)) Bool)

(assert (=> b!1294541 (= res!860312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294542 () Bool)

(declare-fun res!860308 () Bool)

(assert (=> b!1294542 (=> (not res!860308) (not e!738695))))

(declare-datatypes ((List!29444 0))(
  ( (Nil!29441) (Cons!29440 (h!30649 (_ BitVec 64)) (t!43008 List!29444)) )
))
(declare-fun arrayNoDuplicates!0 (array!86012 (_ BitVec 32) List!29444) Bool)

(assert (=> b!1294542 (= res!860308 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29441))))

(declare-fun b!1294543 () Bool)

(declare-fun e!738696 () Bool)

(declare-fun tp_is_empty!34495 () Bool)

(assert (=> b!1294543 (= e!738696 tp_is_empty!34495)))

(declare-fun b!1294537 () Bool)

(declare-fun e!738697 () Bool)

(assert (=> b!1294537 (= e!738697 (and e!738696 mapRes!53303))))

(declare-fun condMapEmpty!53303 () Bool)

(declare-fun mapDefault!53303 () ValueCell!16349)

