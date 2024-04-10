; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82242 () Bool)

(assert start!82242)

(declare-fun b_free!18515 () Bool)

(declare-fun b_next!18515 () Bool)

(assert (=> start!82242 (= b_free!18515 (not b_next!18515))))

(declare-fun tp!64505 () Bool)

(declare-fun b_and!30003 () Bool)

(assert (=> start!82242 (= tp!64505 b_and!30003)))

(declare-fun b!958631 () Bool)

(declare-fun e!540434 () Bool)

(assert (=> b!958631 (= e!540434 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun lt!430464 () Bool)

(declare-datatypes ((V!33277 0))(
  ( (V!33278 (val!10661 Int)) )
))
(declare-fun minValue!1328 () V!33277)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58541 0))(
  ( (array!58542 (arr!28144 (Array (_ BitVec 32) (_ BitVec 64))) (size!28623 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58541)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33277)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10129 0))(
  ( (ValueCellFull!10129 (v!13218 V!33277)) (EmptyCell!10129) )
))
(declare-datatypes ((array!58543 0))(
  ( (array!58544 (arr!28145 (Array (_ BitVec 32) ValueCell!10129)) (size!28624 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58543)

(declare-datatypes ((tuple2!13744 0))(
  ( (tuple2!13745 (_1!6883 (_ BitVec 64)) (_2!6883 V!33277)) )
))
(declare-datatypes ((List!19566 0))(
  ( (Nil!19563) (Cons!19562 (h!20724 tuple2!13744) (t!27929 List!19566)) )
))
(declare-datatypes ((ListLongMap!12441 0))(
  ( (ListLongMap!12442 (toList!6236 List!19566)) )
))
(declare-fun contains!5337 (ListLongMap!12441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3469 (array!58541 array!58543 (_ BitVec 32) (_ BitVec 32) V!33277 V!33277 (_ BitVec 32) Int) ListLongMap!12441)

(assert (=> b!958631 (= lt!430464 (contains!5337 (getCurrentListMap!3469 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28144 _keys!1668) i!793)))))

(declare-fun b!958632 () Bool)

(declare-fun res!641678 () Bool)

(assert (=> b!958632 (=> (not res!641678) (not e!540434))))

(assert (=> b!958632 (= res!641678 (and (= (size!28624 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28623 _keys!1668) (size!28624 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33811 () Bool)

(declare-fun mapRes!33811 () Bool)

(declare-fun tp!64506 () Bool)

(declare-fun e!540433 () Bool)

(assert (=> mapNonEmpty!33811 (= mapRes!33811 (and tp!64506 e!540433))))

(declare-fun mapKey!33811 () (_ BitVec 32))

(declare-fun mapRest!33811 () (Array (_ BitVec 32) ValueCell!10129))

(declare-fun mapValue!33811 () ValueCell!10129)

(assert (=> mapNonEmpty!33811 (= (arr!28145 _values!1386) (store mapRest!33811 mapKey!33811 mapValue!33811))))

(declare-fun b!958633 () Bool)

(declare-fun res!641673 () Bool)

(assert (=> b!958633 (=> (not res!641673) (not e!540434))))

(declare-datatypes ((List!19567 0))(
  ( (Nil!19564) (Cons!19563 (h!20725 (_ BitVec 64)) (t!27930 List!19567)) )
))
(declare-fun arrayNoDuplicates!0 (array!58541 (_ BitVec 32) List!19567) Bool)

(assert (=> b!958633 (= res!641673 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19564))))

(declare-fun b!958634 () Bool)

(declare-fun res!641674 () Bool)

(assert (=> b!958634 (=> (not res!641674) (not e!540434))))

(assert (=> b!958634 (= res!641674 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28623 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28623 _keys!1668))))))

(declare-fun b!958635 () Bool)

(declare-fun e!540432 () Bool)

(declare-fun e!540431 () Bool)

(assert (=> b!958635 (= e!540432 (and e!540431 mapRes!33811))))

(declare-fun condMapEmpty!33811 () Bool)

(declare-fun mapDefault!33811 () ValueCell!10129)

