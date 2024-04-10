; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110162 () Bool)

(assert start!110162)

(declare-fun b_free!29285 () Bool)

(declare-fun b_next!29285 () Bool)

(assert (=> start!110162 (= b_free!29285 (not b_next!29285))))

(declare-fun tp!103013 () Bool)

(declare-fun b_and!47465 () Bool)

(assert (=> start!110162 (= tp!103013 b_and!47465)))

(declare-fun b!1304344 () Bool)

(declare-fun res!866254 () Bool)

(declare-fun e!743996 () Bool)

(assert (=> b!1304344 (=> (not res!866254) (not e!743996))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86864 0))(
  ( (array!86865 (arr!41921 (Array (_ BitVec 32) (_ BitVec 64))) (size!42471 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86864)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1304344 (= res!866254 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42471 _keys!1741))))))

(declare-fun b!1304345 () Bool)

(declare-fun res!866258 () Bool)

(assert (=> b!1304345 (=> (not res!866258) (not e!743996))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86864 (_ BitVec 32)) Bool)

(assert (=> b!1304345 (= res!866258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53987 () Bool)

(declare-fun mapRes!53987 () Bool)

(declare-fun tp!103012 () Bool)

(declare-fun e!743999 () Bool)

(assert (=> mapNonEmpty!53987 (= mapRes!53987 (and tp!103012 e!743999))))

(declare-datatypes ((V!51669 0))(
  ( (V!51670 (val!17537 Int)) )
))
(declare-datatypes ((ValueCell!16564 0))(
  ( (ValueCellFull!16564 (v!20156 V!51669)) (EmptyCell!16564) )
))
(declare-fun mapRest!53987 () (Array (_ BitVec 32) ValueCell!16564))

(declare-fun mapKey!53987 () (_ BitVec 32))

(declare-datatypes ((array!86866 0))(
  ( (array!86867 (arr!41922 (Array (_ BitVec 32) ValueCell!16564)) (size!42472 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86866)

(declare-fun mapValue!53987 () ValueCell!16564)

(assert (=> mapNonEmpty!53987 (= (arr!41922 _values!1445) (store mapRest!53987 mapKey!53987 mapValue!53987))))

(declare-fun b!1304347 () Bool)

(declare-fun tp_is_empty!34925 () Bool)

(assert (=> b!1304347 (= e!743999 tp_is_empty!34925)))

(declare-fun b!1304348 () Bool)

(declare-fun e!743998 () Bool)

(declare-fun e!743995 () Bool)

(assert (=> b!1304348 (= e!743998 (and e!743995 mapRes!53987))))

(declare-fun condMapEmpty!53987 () Bool)

(declare-fun mapDefault!53987 () ValueCell!16564)

