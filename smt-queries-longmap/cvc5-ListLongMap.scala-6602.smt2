; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83496 () Bool)

(assert start!83496)

(declare-fun b_free!19483 () Bool)

(declare-fun b_next!19483 () Bool)

(assert (=> start!83496 (= b_free!19483 (not b_next!19483))))

(declare-fun tp!67737 () Bool)

(declare-fun b_and!31085 () Bool)

(assert (=> start!83496 (= tp!67737 b_and!31085)))

(declare-fun b!975397 () Bool)

(declare-fun res!652951 () Bool)

(declare-fun e!549730 () Bool)

(assert (=> b!975397 (=> (not res!652951) (not e!549730))))

(declare-datatypes ((array!60805 0))(
  ( (array!60806 (arr!29266 (Array (_ BitVec 32) (_ BitVec 64))) (size!29745 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60805)

(declare-datatypes ((List!20310 0))(
  ( (Nil!20307) (Cons!20306 (h!21468 (_ BitVec 64)) (t!28787 List!20310)) )
))
(declare-fun arrayNoDuplicates!0 (array!60805 (_ BitVec 32) List!20310) Bool)

(assert (=> b!975397 (= res!652951 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20307))))

(declare-fun b!975398 () Bool)

(declare-fun res!652953 () Bool)

(assert (=> b!975398 (=> (not res!652953) (not e!549730))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34833 0))(
  ( (V!34834 (val!11244 Int)) )
))
(declare-datatypes ((ValueCell!10712 0))(
  ( (ValueCellFull!10712 (v!13803 V!34833)) (EmptyCell!10712) )
))
(declare-datatypes ((array!60807 0))(
  ( (array!60808 (arr!29267 (Array (_ BitVec 32) ValueCell!10712)) (size!29746 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60807)

(declare-fun zeroValue!1367 () V!34833)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34833)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((tuple2!14458 0))(
  ( (tuple2!14459 (_1!7240 (_ BitVec 64)) (_2!7240 V!34833)) )
))
(declare-datatypes ((List!20311 0))(
  ( (Nil!20308) (Cons!20307 (h!21469 tuple2!14458) (t!28788 List!20311)) )
))
(declare-datatypes ((ListLongMap!13155 0))(
  ( (ListLongMap!13156 (toList!6593 List!20311)) )
))
(declare-fun contains!5675 (ListLongMap!13155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3826 (array!60805 array!60807 (_ BitVec 32) (_ BitVec 32) V!34833 V!34833 (_ BitVec 32) Int) ListLongMap!13155)

(assert (=> b!975398 (= res!652953 (contains!5675 (getCurrentListMap!3826 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29266 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35590 () Bool)

(declare-fun mapRes!35590 () Bool)

(declare-fun tp!67736 () Bool)

(declare-fun e!549726 () Bool)

(assert (=> mapNonEmpty!35590 (= mapRes!35590 (and tp!67736 e!549726))))

(declare-fun mapRest!35590 () (Array (_ BitVec 32) ValueCell!10712))

(declare-fun mapValue!35590 () ValueCell!10712)

(declare-fun mapKey!35590 () (_ BitVec 32))

(assert (=> mapNonEmpty!35590 (= (arr!29267 _values!1425) (store mapRest!35590 mapKey!35590 mapValue!35590))))

(declare-fun b!975399 () Bool)

(assert (=> b!975399 (= e!549730 false)))

(declare-fun lt!432860 () ListLongMap!13155)

(assert (=> b!975399 (= lt!432860 (getCurrentListMap!3826 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975400 () Bool)

(declare-fun e!549728 () Bool)

(declare-fun e!549729 () Bool)

(assert (=> b!975400 (= e!549728 (and e!549729 mapRes!35590))))

(declare-fun condMapEmpty!35590 () Bool)

(declare-fun mapDefault!35590 () ValueCell!10712)

