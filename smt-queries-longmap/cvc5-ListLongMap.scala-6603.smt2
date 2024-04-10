; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83502 () Bool)

(assert start!83502)

(declare-fun b_free!19489 () Bool)

(declare-fun b_next!19489 () Bool)

(assert (=> start!83502 (= b_free!19489 (not b_next!19489))))

(declare-fun tp!67754 () Bool)

(declare-fun b_and!31091 () Bool)

(assert (=> start!83502 (= tp!67754 b_and!31091)))

(declare-fun b!975487 () Bool)

(declare-fun res!653016 () Bool)

(declare-fun e!549772 () Bool)

(assert (=> b!975487 (=> (not res!653016) (not e!549772))))

(declare-datatypes ((array!60817 0))(
  ( (array!60818 (arr!29272 (Array (_ BitVec 32) (_ BitVec 64))) (size!29751 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60817)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975487 (= res!653016 (validKeyInArray!0 (select (arr!29272 _keys!1717) i!822)))))

(declare-fun b!975488 () Bool)

(declare-fun e!549774 () Bool)

(declare-fun tp_is_empty!22393 () Bool)

(assert (=> b!975488 (= e!549774 tp_is_empty!22393)))

(declare-fun res!653017 () Bool)

(assert (=> start!83502 (=> (not res!653017) (not e!549772))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83502 (= res!653017 (validMask!0 mask!2147))))

(assert (=> start!83502 e!549772))

(assert (=> start!83502 true))

(declare-datatypes ((V!34841 0))(
  ( (V!34842 (val!11247 Int)) )
))
(declare-datatypes ((ValueCell!10715 0))(
  ( (ValueCellFull!10715 (v!13806 V!34841)) (EmptyCell!10715) )
))
(declare-datatypes ((array!60819 0))(
  ( (array!60820 (arr!29273 (Array (_ BitVec 32) ValueCell!10715)) (size!29752 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60819)

(declare-fun e!549773 () Bool)

(declare-fun array_inv!22637 (array!60819) Bool)

(assert (=> start!83502 (and (array_inv!22637 _values!1425) e!549773)))

(assert (=> start!83502 tp_is_empty!22393))

(assert (=> start!83502 tp!67754))

(declare-fun array_inv!22638 (array!60817) Bool)

(assert (=> start!83502 (array_inv!22638 _keys!1717)))

(declare-fun b!975489 () Bool)

(assert (=> b!975489 (= e!549772 false)))

(declare-fun zeroValue!1367 () V!34841)

(declare-datatypes ((tuple2!14464 0))(
  ( (tuple2!14465 (_1!7243 (_ BitVec 64)) (_2!7243 V!34841)) )
))
(declare-datatypes ((List!20316 0))(
  ( (Nil!20313) (Cons!20312 (h!21474 tuple2!14464) (t!28793 List!20316)) )
))
(declare-datatypes ((ListLongMap!13161 0))(
  ( (ListLongMap!13162 (toList!6596 List!20316)) )
))
(declare-fun lt!432869 () ListLongMap!13161)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34841)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3829 (array!60817 array!60819 (_ BitVec 32) (_ BitVec 32) V!34841 V!34841 (_ BitVec 32) Int) ListLongMap!13161)

(assert (=> b!975489 (= lt!432869 (getCurrentListMap!3829 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35599 () Bool)

(declare-fun mapRes!35599 () Bool)

(assert (=> mapIsEmpty!35599 mapRes!35599))

(declare-fun mapNonEmpty!35599 () Bool)

(declare-fun tp!67755 () Bool)

(declare-fun e!549775 () Bool)

(assert (=> mapNonEmpty!35599 (= mapRes!35599 (and tp!67755 e!549775))))

(declare-fun mapRest!35599 () (Array (_ BitVec 32) ValueCell!10715))

(declare-fun mapKey!35599 () (_ BitVec 32))

(declare-fun mapValue!35599 () ValueCell!10715)

(assert (=> mapNonEmpty!35599 (= (arr!29273 _values!1425) (store mapRest!35599 mapKey!35599 mapValue!35599))))

(declare-fun b!975490 () Bool)

(declare-fun res!653013 () Bool)

(assert (=> b!975490 (=> (not res!653013) (not e!549772))))

(declare-datatypes ((List!20317 0))(
  ( (Nil!20314) (Cons!20313 (h!21475 (_ BitVec 64)) (t!28794 List!20317)) )
))
(declare-fun arrayNoDuplicates!0 (array!60817 (_ BitVec 32) List!20317) Bool)

(assert (=> b!975490 (= res!653013 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20314))))

(declare-fun b!975491 () Bool)

(assert (=> b!975491 (= e!549773 (and e!549774 mapRes!35599))))

(declare-fun condMapEmpty!35599 () Bool)

(declare-fun mapDefault!35599 () ValueCell!10715)

