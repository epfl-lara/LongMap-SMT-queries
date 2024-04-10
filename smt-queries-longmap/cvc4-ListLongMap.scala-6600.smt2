; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83488 () Bool)

(assert start!83488)

(declare-fun b_free!19475 () Bool)

(declare-fun b_next!19475 () Bool)

(assert (=> start!83488 (= b_free!19475 (not b_next!19475))))

(declare-fun tp!67712 () Bool)

(declare-fun b_and!31077 () Bool)

(assert (=> start!83488 (= tp!67712 b_and!31077)))

(declare-fun b!975277 () Bool)

(declare-fun res!652870 () Bool)

(declare-fun e!549667 () Bool)

(assert (=> b!975277 (=> (not res!652870) (not e!549667))))

(declare-datatypes ((array!60789 0))(
  ( (array!60790 (arr!29258 (Array (_ BitVec 32) (_ BitVec 64))) (size!29737 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60789)

(declare-datatypes ((List!20304 0))(
  ( (Nil!20301) (Cons!20300 (h!21462 (_ BitVec 64)) (t!28781 List!20304)) )
))
(declare-fun arrayNoDuplicates!0 (array!60789 (_ BitVec 32) List!20304) Bool)

(assert (=> b!975277 (= res!652870 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20301))))

(declare-fun b!975278 () Bool)

(assert (=> b!975278 (= e!549667 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34821 0))(
  ( (V!34822 (val!11240 Int)) )
))
(declare-datatypes ((ValueCell!10708 0))(
  ( (ValueCellFull!10708 (v!13799 V!34821)) (EmptyCell!10708) )
))
(declare-datatypes ((array!60791 0))(
  ( (array!60792 (arr!29259 (Array (_ BitVec 32) ValueCell!10708)) (size!29738 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60791)

(declare-fun zeroValue!1367 () V!34821)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14452 0))(
  ( (tuple2!14453 (_1!7237 (_ BitVec 64)) (_2!7237 V!34821)) )
))
(declare-datatypes ((List!20305 0))(
  ( (Nil!20302) (Cons!20301 (h!21463 tuple2!14452) (t!28782 List!20305)) )
))
(declare-datatypes ((ListLongMap!13149 0))(
  ( (ListLongMap!13150 (toList!6590 List!20305)) )
))
(declare-fun lt!432848 () ListLongMap!13149)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34821)

(declare-fun getCurrentListMap!3823 (array!60789 array!60791 (_ BitVec 32) (_ BitVec 32) V!34821 V!34821 (_ BitVec 32) Int) ListLongMap!13149)

(assert (=> b!975278 (= lt!432848 (getCurrentListMap!3823 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975279 () Bool)

(declare-fun res!652868 () Bool)

(assert (=> b!975279 (=> (not res!652868) (not e!549667))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5672 (ListLongMap!13149 (_ BitVec 64)) Bool)

(assert (=> b!975279 (= res!652868 (contains!5672 (getCurrentListMap!3823 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29258 _keys!1717) i!822)))))

(declare-fun b!975280 () Bool)

(declare-fun e!549668 () Bool)

(declare-fun e!549669 () Bool)

(declare-fun mapRes!35578 () Bool)

(assert (=> b!975280 (= e!549668 (and e!549669 mapRes!35578))))

(declare-fun condMapEmpty!35578 () Bool)

(declare-fun mapDefault!35578 () ValueCell!10708)

