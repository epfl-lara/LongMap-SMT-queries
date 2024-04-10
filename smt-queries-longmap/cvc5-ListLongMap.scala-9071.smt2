; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109210 () Bool)

(assert start!109210)

(declare-fun b_free!28699 () Bool)

(declare-fun b_next!28699 () Bool)

(assert (=> start!109210 (= b_free!28699 (not b_next!28699))))

(declare-fun tp!101215 () Bool)

(declare-fun b_and!46789 () Bool)

(assert (=> start!109210 (= tp!101215 b_and!46789)))

(declare-fun b!1291854 () Bool)

(declare-fun e!737417 () Bool)

(declare-fun tp_is_empty!34339 () Bool)

(assert (=> b!1291854 (= e!737417 tp_is_empty!34339)))

(declare-fun b!1291855 () Bool)

(declare-fun res!858328 () Bool)

(declare-fun e!737418 () Bool)

(assert (=> b!1291855 (=> (not res!858328) (not e!737418))))

(declare-datatypes ((array!85714 0))(
  ( (array!85715 (arr!41358 (Array (_ BitVec 32) (_ BitVec 64))) (size!41908 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85714)

(declare-datatypes ((List!29332 0))(
  ( (Nil!29329) (Cons!29328 (h!30537 (_ BitVec 64)) (t!42896 List!29332)) )
))
(declare-fun arrayNoDuplicates!0 (array!85714 (_ BitVec 32) List!29332) Bool)

(assert (=> b!1291855 (= res!858328 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29329))))

(declare-fun res!858333 () Bool)

(assert (=> start!109210 (=> (not res!858333) (not e!737418))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109210 (= res!858333 (validMask!0 mask!2175))))

(assert (=> start!109210 e!737418))

(assert (=> start!109210 tp_is_empty!34339))

(assert (=> start!109210 true))

(declare-datatypes ((V!50889 0))(
  ( (V!50890 (val!17244 Int)) )
))
(declare-datatypes ((ValueCell!16271 0))(
  ( (ValueCellFull!16271 (v!19847 V!50889)) (EmptyCell!16271) )
))
(declare-datatypes ((array!85716 0))(
  ( (array!85717 (arr!41359 (Array (_ BitVec 32) ValueCell!16271)) (size!41909 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85716)

(declare-fun e!737419 () Bool)

(declare-fun array_inv!31337 (array!85716) Bool)

(assert (=> start!109210 (and (array_inv!31337 _values!1445) e!737419)))

(declare-fun array_inv!31338 (array!85714) Bool)

(assert (=> start!109210 (array_inv!31338 _keys!1741)))

(assert (=> start!109210 tp!101215))

(declare-fun mapNonEmpty!53069 () Bool)

(declare-fun mapRes!53069 () Bool)

(declare-fun tp!101216 () Bool)

(declare-fun e!737420 () Bool)

(assert (=> mapNonEmpty!53069 (= mapRes!53069 (and tp!101216 e!737420))))

(declare-fun mapKey!53069 () (_ BitVec 32))

(declare-fun mapValue!53069 () ValueCell!16271)

(declare-fun mapRest!53069 () (Array (_ BitVec 32) ValueCell!16271))

(assert (=> mapNonEmpty!53069 (= (arr!41359 _values!1445) (store mapRest!53069 mapKey!53069 mapValue!53069))))

(declare-fun b!1291856 () Bool)

(assert (=> b!1291856 (= e!737418 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22178 0))(
  ( (tuple2!22179 (_1!11100 (_ BitVec 64)) (_2!11100 V!50889)) )
))
(declare-datatypes ((List!29333 0))(
  ( (Nil!29330) (Cons!29329 (h!30538 tuple2!22178) (t!42897 List!29333)) )
))
(declare-datatypes ((ListLongMap!19835 0))(
  ( (ListLongMap!19836 (toList!9933 List!29333)) )
))
(declare-fun contains!8051 (ListLongMap!19835 (_ BitVec 64)) Bool)

(assert (=> b!1291856 (not (contains!8051 (ListLongMap!19836 Nil!29330) k!1205))))

(declare-datatypes ((Unit!42776 0))(
  ( (Unit!42777) )
))
(declare-fun lt!579284 () Unit!42776)

(declare-fun emptyContainsNothing!110 ((_ BitVec 64)) Unit!42776)

(assert (=> b!1291856 (= lt!579284 (emptyContainsNothing!110 k!1205))))

(declare-fun b!1291857 () Bool)

(declare-fun res!858326 () Bool)

(assert (=> b!1291857 (=> (not res!858326) (not e!737418))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291857 (= res!858326 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41908 _keys!1741))))))

(declare-fun b!1291858 () Bool)

(declare-fun res!858327 () Bool)

(assert (=> b!1291858 (=> (not res!858327) (not e!737418))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291858 (= res!858327 (and (= (size!41909 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41908 _keys!1741) (size!41909 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291859 () Bool)

(declare-fun res!858332 () Bool)

(assert (=> b!1291859 (=> (not res!858332) (not e!737418))))

(declare-fun minValue!1387 () V!50889)

(declare-fun zeroValue!1387 () V!50889)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4981 (array!85714 array!85716 (_ BitVec 32) (_ BitVec 32) V!50889 V!50889 (_ BitVec 32) Int) ListLongMap!19835)

(assert (=> b!1291859 (= res!858332 (contains!8051 (getCurrentListMap!4981 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53069 () Bool)

(assert (=> mapIsEmpty!53069 mapRes!53069))

(declare-fun b!1291860 () Bool)

(assert (=> b!1291860 (= e!737420 tp_is_empty!34339)))

(declare-fun b!1291861 () Bool)

(assert (=> b!1291861 (= e!737419 (and e!737417 mapRes!53069))))

(declare-fun condMapEmpty!53069 () Bool)

(declare-fun mapDefault!53069 () ValueCell!16271)

