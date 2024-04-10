; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82388 () Bool)

(assert start!82388)

(declare-fun b_free!18655 () Bool)

(declare-fun b_next!18655 () Bool)

(assert (=> start!82388 (= b_free!18655 (not b_next!18655))))

(declare-fun tp!64935 () Bool)

(declare-fun b_and!30143 () Bool)

(assert (=> start!82388 (= tp!64935 b_and!30143)))

(declare-fun b!960665 () Bool)

(declare-fun res!643055 () Bool)

(declare-fun e!541526 () Bool)

(assert (=> b!960665 (=> (not res!643055) (not e!541526))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58823 0))(
  ( (array!58824 (arr!28285 (Array (_ BitVec 32) (_ BitVec 64))) (size!28764 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58823)

(declare-datatypes ((V!33473 0))(
  ( (V!33474 (val!10734 Int)) )
))
(declare-datatypes ((ValueCell!10202 0))(
  ( (ValueCellFull!10202 (v!13291 V!33473)) (EmptyCell!10202) )
))
(declare-datatypes ((array!58825 0))(
  ( (array!58826 (arr!28286 (Array (_ BitVec 32) ValueCell!10202)) (size!28765 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58825)

(assert (=> b!960665 (= res!643055 (and (= (size!28765 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28764 _keys!1668) (size!28765 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960666 () Bool)

(declare-fun res!643053 () Bool)

(assert (=> b!960666 (=> (not res!643053) (not e!541526))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960666 (= res!643053 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28764 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28764 _keys!1668))))))

(declare-fun b!960667 () Bool)

(declare-fun e!541530 () Bool)

(declare-fun tp_is_empty!21367 () Bool)

(assert (=> b!960667 (= e!541530 tp_is_empty!21367)))

(declare-fun b!960668 () Bool)

(declare-fun res!643054 () Bool)

(assert (=> b!960668 (=> (not res!643054) (not e!541526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960668 (= res!643054 (validKeyInArray!0 (select (arr!28285 _keys!1668) i!793)))))

(declare-fun b!960669 () Bool)

(assert (=> b!960669 (= e!541526 false)))

(declare-fun minValue!1328 () V!33473)

(declare-fun lt!430674 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33473)

(declare-datatypes ((tuple2!13846 0))(
  ( (tuple2!13847 (_1!6934 (_ BitVec 64)) (_2!6934 V!33473)) )
))
(declare-datatypes ((List!19668 0))(
  ( (Nil!19665) (Cons!19664 (h!20826 tuple2!13846) (t!28031 List!19668)) )
))
(declare-datatypes ((ListLongMap!12543 0))(
  ( (ListLongMap!12544 (toList!6287 List!19668)) )
))
(declare-fun contains!5386 (ListLongMap!12543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3520 (array!58823 array!58825 (_ BitVec 32) (_ BitVec 32) V!33473 V!33473 (_ BitVec 32) Int) ListLongMap!12543)

(assert (=> b!960669 (= lt!430674 (contains!5386 (getCurrentListMap!3520 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28285 _keys!1668) i!793)))))

(declare-fun b!960670 () Bool)

(declare-fun res!643052 () Bool)

(assert (=> b!960670 (=> (not res!643052) (not e!541526))))

(declare-datatypes ((List!19669 0))(
  ( (Nil!19666) (Cons!19665 (h!20827 (_ BitVec 64)) (t!28032 List!19669)) )
))
(declare-fun arrayNoDuplicates!0 (array!58823 (_ BitVec 32) List!19669) Bool)

(assert (=> b!960670 (= res!643052 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19666))))

(declare-fun mapNonEmpty!34030 () Bool)

(declare-fun mapRes!34030 () Bool)

(declare-fun tp!64934 () Bool)

(declare-fun e!541529 () Bool)

(assert (=> mapNonEmpty!34030 (= mapRes!34030 (and tp!64934 e!541529))))

(declare-fun mapValue!34030 () ValueCell!10202)

(declare-fun mapRest!34030 () (Array (_ BitVec 32) ValueCell!10202))

(declare-fun mapKey!34030 () (_ BitVec 32))

(assert (=> mapNonEmpty!34030 (= (arr!28286 _values!1386) (store mapRest!34030 mapKey!34030 mapValue!34030))))

(declare-fun b!960671 () Bool)

(declare-fun e!541528 () Bool)

(assert (=> b!960671 (= e!541528 (and e!541530 mapRes!34030))))

(declare-fun condMapEmpty!34030 () Bool)

(declare-fun mapDefault!34030 () ValueCell!10202)

