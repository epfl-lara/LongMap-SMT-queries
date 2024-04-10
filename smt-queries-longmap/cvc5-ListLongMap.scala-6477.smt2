; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82702 () Bool)

(assert start!82702)

(declare-fun b_free!18835 () Bool)

(declare-fun b_next!18835 () Bool)

(assert (=> start!82702 (= b_free!18835 (not b_next!18835))))

(declare-fun tp!65624 () Bool)

(declare-fun b_and!30323 () Bool)

(assert (=> start!82702 (= tp!65624 b_and!30323)))

(declare-fun b!964388 () Bool)

(declare-fun res!645496 () Bool)

(declare-fun e!543685 () Bool)

(assert (=> b!964388 (=> (not res!645496) (not e!543685))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33833 0))(
  ( (V!33834 (val!10869 Int)) )
))
(declare-datatypes ((ValueCell!10337 0))(
  ( (ValueCellFull!10337 (v!13427 V!33833)) (EmptyCell!10337) )
))
(declare-datatypes ((array!59361 0))(
  ( (array!59362 (arr!28549 (Array (_ BitVec 32) ValueCell!10337)) (size!29028 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59361)

(declare-datatypes ((array!59363 0))(
  ( (array!59364 (arr!28550 (Array (_ BitVec 32) (_ BitVec 64))) (size!29029 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59363)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964388 (= res!645496 (and (= (size!29028 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29029 _keys!1686) (size!29028 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964389 () Bool)

(declare-fun res!645495 () Bool)

(assert (=> b!964389 (=> (not res!645495) (not e!543685))))

(declare-fun minValue!1342 () V!33833)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33833)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13968 0))(
  ( (tuple2!13969 (_1!6995 (_ BitVec 64)) (_2!6995 V!33833)) )
))
(declare-datatypes ((List!19814 0))(
  ( (Nil!19811) (Cons!19810 (h!20972 tuple2!13968) (t!28177 List!19814)) )
))
(declare-datatypes ((ListLongMap!12665 0))(
  ( (ListLongMap!12666 (toList!6348 List!19814)) )
))
(declare-fun contains!5451 (ListLongMap!12665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3581 (array!59363 array!59361 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) Int) ListLongMap!12665)

(assert (=> b!964389 (= res!645495 (contains!5451 (getCurrentListMap!3581 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28550 _keys!1686) i!803)))))

(declare-fun b!964390 () Bool)

(declare-fun res!645498 () Bool)

(assert (=> b!964390 (=> (not res!645498) (not e!543685))))

(declare-datatypes ((List!19815 0))(
  ( (Nil!19812) (Cons!19811 (h!20973 (_ BitVec 64)) (t!28178 List!19815)) )
))
(declare-fun arrayNoDuplicates!0 (array!59363 (_ BitVec 32) List!19815) Bool)

(assert (=> b!964390 (= res!645498 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19812))))

(declare-fun b!964391 () Bool)

(declare-fun res!645499 () Bool)

(assert (=> b!964391 (=> (not res!645499) (not e!543685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964391 (= res!645499 (validKeyInArray!0 (select (arr!28550 _keys!1686) i!803)))))

(declare-fun b!964392 () Bool)

(declare-fun e!543688 () Bool)

(assert (=> b!964392 (= e!543685 (not e!543688))))

(declare-fun res!645501 () Bool)

(assert (=> b!964392 (=> res!645501 e!543688)))

(assert (=> b!964392 (= res!645501 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29029 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964392 (contains!5451 (getCurrentListMap!3581 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28550 _keys!1686) i!803))))

(declare-datatypes ((Unit!32279 0))(
  ( (Unit!32280) )
))
(declare-fun lt!431094 () Unit!32279)

(declare-fun lemmaInListMapFromThenInFromMinusOne!34 (array!59363 array!59361 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) (_ BitVec 32) Int) Unit!32279)

(assert (=> b!964392 (= lt!431094 (lemmaInListMapFromThenInFromMinusOne!34 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964393 () Bool)

(declare-fun e!543684 () Bool)

(declare-fun tp_is_empty!21637 () Bool)

(assert (=> b!964393 (= e!543684 tp_is_empty!21637)))

(declare-fun b!964394 () Bool)

(assert (=> b!964394 (= e!543688 true)))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964394 (contains!5451 (getCurrentListMap!3581 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28550 _keys!1686) i!803))))

(declare-fun lt!431095 () Unit!32279)

(declare-fun lemmaInListMapFromThenInFromSmaller!31 (array!59363 array!59361 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32279)

(assert (=> b!964394 (= lt!431095 (lemmaInListMapFromThenInFromSmaller!31 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34450 () Bool)

(declare-fun mapRes!34450 () Bool)

(declare-fun tp!65625 () Bool)

(assert (=> mapNonEmpty!34450 (= mapRes!34450 (and tp!65625 e!543684))))

(declare-fun mapValue!34450 () ValueCell!10337)

(declare-fun mapKey!34450 () (_ BitVec 32))

(declare-fun mapRest!34450 () (Array (_ BitVec 32) ValueCell!10337))

(assert (=> mapNonEmpty!34450 (= (arr!28549 _values!1400) (store mapRest!34450 mapKey!34450 mapValue!34450))))

(declare-fun res!645497 () Bool)

(assert (=> start!82702 (=> (not res!645497) (not e!543685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82702 (= res!645497 (validMask!0 mask!2110))))

(assert (=> start!82702 e!543685))

(assert (=> start!82702 true))

(declare-fun e!543686 () Bool)

(declare-fun array_inv!22109 (array!59361) Bool)

(assert (=> start!82702 (and (array_inv!22109 _values!1400) e!543686)))

(declare-fun array_inv!22110 (array!59363) Bool)

(assert (=> start!82702 (array_inv!22110 _keys!1686)))

(assert (=> start!82702 tp!65624))

(assert (=> start!82702 tp_is_empty!21637))

(declare-fun b!964395 () Bool)

(declare-fun res!645500 () Bool)

(assert (=> b!964395 (=> (not res!645500) (not e!543685))))

(assert (=> b!964395 (= res!645500 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34450 () Bool)

(assert (=> mapIsEmpty!34450 mapRes!34450))

(declare-fun b!964396 () Bool)

(declare-fun e!543689 () Bool)

(assert (=> b!964396 (= e!543686 (and e!543689 mapRes!34450))))

(declare-fun condMapEmpty!34450 () Bool)

(declare-fun mapDefault!34450 () ValueCell!10337)

