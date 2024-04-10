; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83548 () Bool)

(assert start!83548)

(declare-fun b_free!19535 () Bool)

(declare-fun b_next!19535 () Bool)

(assert (=> start!83548 (= b_free!19535 (not b_next!19535))))

(declare-fun tp!67893 () Bool)

(declare-fun b_and!31165 () Bool)

(assert (=> start!83548 (= tp!67893 b_and!31165)))

(declare-fun b!976258 () Bool)

(declare-fun res!653551 () Bool)

(declare-fun e!550179 () Bool)

(assert (=> b!976258 (=> (not res!653551) (not e!550179))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34901 0))(
  ( (V!34902 (val!11270 Int)) )
))
(declare-datatypes ((ValueCell!10738 0))(
  ( (ValueCellFull!10738 (v!13829 V!34901)) (EmptyCell!10738) )
))
(declare-datatypes ((array!60907 0))(
  ( (array!60908 (arr!29317 (Array (_ BitVec 32) ValueCell!10738)) (size!29796 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60907)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60909 0))(
  ( (array!60910 (arr!29318 (Array (_ BitVec 32) (_ BitVec 64))) (size!29797 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60909)

(assert (=> b!976258 (= res!653551 (and (= (size!29796 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29797 _keys!1717) (size!29796 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976259 () Bool)

(declare-fun e!550181 () Bool)

(assert (=> b!976259 (= e!550179 e!550181)))

(declare-fun res!653554 () Bool)

(assert (=> b!976259 (=> (not res!653554) (not e!550181))))

(declare-datatypes ((tuple2!14502 0))(
  ( (tuple2!14503 (_1!7262 (_ BitVec 64)) (_2!7262 V!34901)) )
))
(declare-datatypes ((List!20353 0))(
  ( (Nil!20350) (Cons!20349 (h!21511 tuple2!14502) (t!28860 List!20353)) )
))
(declare-datatypes ((ListLongMap!13199 0))(
  ( (ListLongMap!13200 (toList!6615 List!20353)) )
))
(declare-fun lt!433062 () ListLongMap!13199)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5693 (ListLongMap!13199 (_ BitVec 64)) Bool)

(assert (=> b!976259 (= res!653554 (contains!5693 lt!433062 (select (arr!29318 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34901)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34901)

(declare-fun getCurrentListMap!3848 (array!60909 array!60907 (_ BitVec 32) (_ BitVec 32) V!34901 V!34901 (_ BitVec 32) Int) ListLongMap!13199)

(assert (=> b!976259 (= lt!433062 (getCurrentListMap!3848 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976260 () Bool)

(declare-fun e!550178 () Bool)

(declare-fun tp_is_empty!22439 () Bool)

(assert (=> b!976260 (= e!550178 tp_is_empty!22439)))

(declare-fun b!976261 () Bool)

(declare-fun res!653550 () Bool)

(assert (=> b!976261 (=> (not res!653550) (not e!550179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976261 (= res!653550 (validKeyInArray!0 (select (arr!29318 _keys!1717) i!822)))))

(declare-fun res!653553 () Bool)

(assert (=> start!83548 (=> (not res!653553) (not e!550179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83548 (= res!653553 (validMask!0 mask!2147))))

(assert (=> start!83548 e!550179))

(assert (=> start!83548 true))

(declare-fun e!550180 () Bool)

(declare-fun array_inv!22667 (array!60907) Bool)

(assert (=> start!83548 (and (array_inv!22667 _values!1425) e!550180)))

(assert (=> start!83548 tp_is_empty!22439))

(assert (=> start!83548 tp!67893))

(declare-fun array_inv!22668 (array!60909) Bool)

(assert (=> start!83548 (array_inv!22668 _keys!1717)))

(declare-fun b!976262 () Bool)

(declare-fun e!550182 () Bool)

(declare-fun mapRes!35668 () Bool)

(assert (=> b!976262 (= e!550180 (and e!550182 mapRes!35668))))

(declare-fun condMapEmpty!35668 () Bool)

(declare-fun mapDefault!35668 () ValueCell!10738)

