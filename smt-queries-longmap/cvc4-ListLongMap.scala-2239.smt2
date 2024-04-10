; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36900 () Bool)

(assert start!36900)

(declare-fun b_free!8027 () Bool)

(declare-fun b_next!8027 () Bool)

(assert (=> start!36900 (= b_free!8027 (not b_next!8027))))

(declare-fun tp!28797 () Bool)

(declare-fun b_and!15269 () Bool)

(assert (=> start!36900 (= tp!28797 b_and!15269)))

(declare-fun b!369566 () Bool)

(declare-fun e!225852 () Bool)

(declare-fun tp_is_empty!8675 () Bool)

(assert (=> b!369566 (= e!225852 tp_is_empty!8675)))

(declare-fun b!369567 () Bool)

(declare-fun res!207358 () Bool)

(declare-fun e!225857 () Bool)

(assert (=> b!369567 (=> (not res!207358) (not e!225857))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369567 (= res!207358 (validKeyInArray!0 k!778))))

(declare-fun b!369568 () Bool)

(declare-fun res!207359 () Bool)

(assert (=> b!369568 (=> (not res!207359) (not e!225857))))

(declare-datatypes ((array!21299 0))(
  ( (array!21300 (arr!10118 (Array (_ BitVec 32) (_ BitVec 64))) (size!10470 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21299)

(declare-fun arrayContainsKey!0 (array!21299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369568 (= res!207359 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369569 () Bool)

(declare-fun e!225855 () Bool)

(assert (=> b!369569 (= e!225855 tp_is_empty!8675)))

(declare-fun b!369570 () Bool)

(declare-fun e!225856 () Bool)

(assert (=> b!369570 (= e!225856 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169765 () array!21299)

(declare-datatypes ((V!12671 0))(
  ( (V!12672 (val!4382 Int)) )
))
(declare-fun zeroValue!472 () V!12671)

(declare-datatypes ((tuple2!5814 0))(
  ( (tuple2!5815 (_1!2918 (_ BitVec 64)) (_2!2918 V!12671)) )
))
(declare-datatypes ((List!5648 0))(
  ( (Nil!5645) (Cons!5644 (h!6500 tuple2!5814) (t!10798 List!5648)) )
))
(declare-datatypes ((ListLongMap!4727 0))(
  ( (ListLongMap!4728 (toList!2379 List!5648)) )
))
(declare-fun lt!169767 () ListLongMap!4727)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12671)

(declare-datatypes ((ValueCell!3994 0))(
  ( (ValueCellFull!3994 (v!6579 V!12671)) (EmptyCell!3994) )
))
(declare-datatypes ((array!21301 0))(
  ( (array!21302 (arr!10119 (Array (_ BitVec 32) ValueCell!3994)) (size!10471 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21301)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12671)

(declare-fun getCurrentListMapNoExtraKeys!656 (array!21299 array!21301 (_ BitVec 32) (_ BitVec 32) V!12671 V!12671 (_ BitVec 32) Int) ListLongMap!4727)

(assert (=> b!369570 (= lt!169767 (getCurrentListMapNoExtraKeys!656 lt!169765 (array!21302 (store (arr!10119 _values!506) i!548 (ValueCellFull!3994 v!373)) (size!10471 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169766 () ListLongMap!4727)

(assert (=> b!369570 (= lt!169766 (getCurrentListMapNoExtraKeys!656 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369571 () Bool)

(declare-fun res!207351 () Bool)

(assert (=> b!369571 (=> (not res!207351) (not e!225857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21299 (_ BitVec 32)) Bool)

(assert (=> b!369571 (= res!207351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369573 () Bool)

(declare-fun res!207353 () Bool)

(assert (=> b!369573 (=> (not res!207353) (not e!225857))))

(assert (=> b!369573 (= res!207353 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10470 _keys!658))))))

(declare-fun mapIsEmpty!14577 () Bool)

(declare-fun mapRes!14577 () Bool)

(assert (=> mapIsEmpty!14577 mapRes!14577))

(declare-fun b!369574 () Bool)

(declare-fun res!207352 () Bool)

(assert (=> b!369574 (=> (not res!207352) (not e!225857))))

(declare-datatypes ((List!5649 0))(
  ( (Nil!5646) (Cons!5645 (h!6501 (_ BitVec 64)) (t!10799 List!5649)) )
))
(declare-fun arrayNoDuplicates!0 (array!21299 (_ BitVec 32) List!5649) Bool)

(assert (=> b!369574 (= res!207352 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5646))))

(declare-fun b!369575 () Bool)

(declare-fun e!225853 () Bool)

(assert (=> b!369575 (= e!225853 (and e!225855 mapRes!14577))))

(declare-fun condMapEmpty!14577 () Bool)

(declare-fun mapDefault!14577 () ValueCell!3994)

