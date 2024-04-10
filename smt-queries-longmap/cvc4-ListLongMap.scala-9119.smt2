; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109502 () Bool)

(assert start!109502)

(declare-fun b_free!28991 () Bool)

(declare-fun b_next!28991 () Bool)

(assert (=> start!109502 (= b_free!28991 (not b_next!28991))))

(declare-fun tp!102092 () Bool)

(declare-fun b_and!47081 () Bool)

(assert (=> start!109502 (= tp!102092 b_and!47081)))

(declare-fun b!1296927 () Bool)

(declare-fun res!861924 () Bool)

(declare-fun e!739904 () Bool)

(assert (=> b!1296927 (=> (not res!861924) (not e!739904))))

(declare-datatypes ((array!86278 0))(
  ( (array!86279 (arr!41640 (Array (_ BitVec 32) (_ BitVec 64))) (size!42190 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86278)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86278 (_ BitVec 32)) Bool)

(assert (=> b!1296927 (= res!861924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296928 () Bool)

(declare-fun e!739903 () Bool)

(declare-fun tp_is_empty!34631 () Bool)

(assert (=> b!1296928 (= e!739903 tp_is_empty!34631)))

(declare-fun b!1296929 () Bool)

(declare-fun e!739905 () Bool)

(assert (=> b!1296929 (= e!739905 tp_is_empty!34631)))

(declare-fun mapIsEmpty!53507 () Bool)

(declare-fun mapRes!53507 () Bool)

(assert (=> mapIsEmpty!53507 mapRes!53507))

(declare-fun b!1296930 () Bool)

(assert (=> b!1296930 (= e!739904 false)))

(declare-datatypes ((V!51277 0))(
  ( (V!51278 (val!17390 Int)) )
))
(declare-fun minValue!1387 () V!51277)

(declare-fun zeroValue!1387 () V!51277)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580532 () Bool)

(declare-datatypes ((ValueCell!16417 0))(
  ( (ValueCellFull!16417 (v!19993 V!51277)) (EmptyCell!16417) )
))
(declare-datatypes ((array!86280 0))(
  ( (array!86281 (arr!41641 (Array (_ BitVec 32) ValueCell!16417)) (size!42191 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86280)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22408 0))(
  ( (tuple2!22409 (_1!11215 (_ BitVec 64)) (_2!11215 V!51277)) )
))
(declare-datatypes ((List!29544 0))(
  ( (Nil!29541) (Cons!29540 (h!30749 tuple2!22408) (t!43108 List!29544)) )
))
(declare-datatypes ((ListLongMap!20065 0))(
  ( (ListLongMap!20066 (toList!10048 List!29544)) )
))
(declare-fun contains!8166 (ListLongMap!20065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5077 (array!86278 array!86280 (_ BitVec 32) (_ BitVec 32) V!51277 V!51277 (_ BitVec 32) Int) ListLongMap!20065)

(assert (=> b!1296930 (= lt!580532 (contains!8166 (getCurrentListMap!5077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296931 () Bool)

(declare-fun res!861923 () Bool)

(assert (=> b!1296931 (=> (not res!861923) (not e!739904))))

(assert (=> b!1296931 (= res!861923 (and (= (size!42191 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42190 _keys!1741) (size!42191 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296933 () Bool)

(declare-fun e!739906 () Bool)

(assert (=> b!1296933 (= e!739906 (and e!739903 mapRes!53507))))

(declare-fun condMapEmpty!53507 () Bool)

(declare-fun mapDefault!53507 () ValueCell!16417)

