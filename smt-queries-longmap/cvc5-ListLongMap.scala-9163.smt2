; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110052 () Bool)

(assert start!110052)

(declare-fun b_free!29251 () Bool)

(declare-fun b_next!29251 () Bool)

(assert (=> start!110052 (= b_free!29251 (not b_next!29251))))

(declare-fun tp!102903 () Bool)

(declare-fun b_and!47415 () Bool)

(assert (=> start!110052 (= tp!102903 b_and!47415)))

(declare-fun b!1303262 () Bool)

(declare-fun e!743382 () Bool)

(declare-fun tp_is_empty!34891 () Bool)

(assert (=> b!1303262 (= e!743382 tp_is_empty!34891)))

(declare-fun b!1303264 () Bool)

(declare-fun res!865588 () Bool)

(declare-fun e!743383 () Bool)

(assert (=> b!1303264 (=> (not res!865588) (not e!743383))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86798 0))(
  ( (array!86799 (arr!41890 (Array (_ BitVec 32) (_ BitVec 64))) (size!42440 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86798)

(assert (=> b!1303264 (= res!865588 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42440 _keys!1741))))))

(declare-fun b!1303265 () Bool)

(declare-fun res!865591 () Bool)

(assert (=> b!1303265 (=> (not res!865591) (not e!743383))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86798 (_ BitVec 32)) Bool)

(assert (=> b!1303265 (= res!865591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303266 () Bool)

(declare-fun res!865593 () Bool)

(assert (=> b!1303266 (=> (not res!865593) (not e!743383))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1303266 (= res!865593 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42440 _keys!1741))))))

(declare-fun b!1303267 () Bool)

(declare-fun res!865589 () Bool)

(assert (=> b!1303267 (=> (not res!865589) (not e!743383))))

(declare-datatypes ((V!51625 0))(
  ( (V!51626 (val!17520 Int)) )
))
(declare-fun minValue!1387 () V!51625)

(declare-fun zeroValue!1387 () V!51625)

(declare-datatypes ((ValueCell!16547 0))(
  ( (ValueCellFull!16547 (v!20136 V!51625)) (EmptyCell!16547) )
))
(declare-datatypes ((array!86800 0))(
  ( (array!86801 (arr!41891 (Array (_ BitVec 32) ValueCell!16547)) (size!42441 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86800)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22608 0))(
  ( (tuple2!22609 (_1!11315 (_ BitVec 64)) (_2!11315 V!51625)) )
))
(declare-datatypes ((List!29735 0))(
  ( (Nil!29732) (Cons!29731 (h!30940 tuple2!22608) (t!43329 List!29735)) )
))
(declare-datatypes ((ListLongMap!20265 0))(
  ( (ListLongMap!20266 (toList!10148 List!29735)) )
))
(declare-fun contains!8284 (ListLongMap!20265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5171 (array!86798 array!86800 (_ BitVec 32) (_ BitVec 32) V!51625 V!51625 (_ BitVec 32) Int) ListLongMap!20265)

(assert (=> b!1303267 (= res!865589 (contains!8284 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1303268 () Bool)

(declare-fun res!865587 () Bool)

(assert (=> b!1303268 (=> (not res!865587) (not e!743383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303268 (= res!865587 (not (validKeyInArray!0 (select (arr!41890 _keys!1741) from!2144))))))

(declare-fun b!1303263 () Bool)

(declare-fun e!743384 () Bool)

(assert (=> b!1303263 (= e!743383 (not e!743384))))

(declare-fun res!865590 () Bool)

(assert (=> b!1303263 (=> res!865590 e!743384)))

(assert (=> b!1303263 (= res!865590 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1303263 (not (contains!8284 (ListLongMap!20266 Nil!29732) k!1205))))

(declare-datatypes ((Unit!43150 0))(
  ( (Unit!43151) )
))
(declare-fun lt!583192 () Unit!43150)

(declare-fun emptyContainsNothing!213 ((_ BitVec 64)) Unit!43150)

(assert (=> b!1303263 (= lt!583192 (emptyContainsNothing!213 k!1205))))

(declare-fun res!865586 () Bool)

(assert (=> start!110052 (=> (not res!865586) (not e!743383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110052 (= res!865586 (validMask!0 mask!2175))))

(assert (=> start!110052 e!743383))

(assert (=> start!110052 tp_is_empty!34891))

(assert (=> start!110052 true))

(declare-fun e!743385 () Bool)

(declare-fun array_inv!31683 (array!86800) Bool)

(assert (=> start!110052 (and (array_inv!31683 _values!1445) e!743385)))

(declare-fun array_inv!31684 (array!86798) Bool)

(assert (=> start!110052 (array_inv!31684 _keys!1741)))

(assert (=> start!110052 tp!102903))

(declare-fun b!1303269 () Bool)

(declare-fun res!865585 () Bool)

(assert (=> b!1303269 (=> (not res!865585) (not e!743383))))

(assert (=> b!1303269 (= res!865585 (and (= (size!42441 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42440 _keys!1741) (size!42441 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53929 () Bool)

(declare-fun mapRes!53929 () Bool)

(assert (=> mapIsEmpty!53929 mapRes!53929))

(declare-fun b!1303270 () Bool)

(declare-fun e!743386 () Bool)

(assert (=> b!1303270 (= e!743385 (and e!743386 mapRes!53929))))

(declare-fun condMapEmpty!53929 () Bool)

(declare-fun mapDefault!53929 () ValueCell!16547)

