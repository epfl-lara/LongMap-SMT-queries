; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36882 () Bool)

(assert start!36882)

(declare-fun b_free!8009 () Bool)

(declare-fun b_next!8009 () Bool)

(assert (=> start!36882 (= b_free!8009 (not b_next!8009))))

(declare-fun tp!28743 () Bool)

(declare-fun b_and!15251 () Bool)

(assert (=> start!36882 (= tp!28743 b_and!15251)))

(declare-fun mapIsEmpty!14550 () Bool)

(declare-fun mapRes!14550 () Bool)

(assert (=> mapIsEmpty!14550 mapRes!14550))

(declare-fun b!369215 () Bool)

(declare-fun res!207087 () Bool)

(declare-fun e!225690 () Bool)

(assert (=> b!369215 (=> (not res!207087) (not e!225690))))

(declare-datatypes ((array!21265 0))(
  ( (array!21266 (arr!10101 (Array (_ BitVec 32) (_ BitVec 64))) (size!10453 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21265)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369215 (= res!207087 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369216 () Bool)

(declare-fun e!225693 () Bool)

(assert (=> b!369216 (= e!225693 false)))

(declare-datatypes ((V!12647 0))(
  ( (V!12648 (val!4373 Int)) )
))
(declare-datatypes ((ValueCell!3985 0))(
  ( (ValueCellFull!3985 (v!6570 V!12647)) (EmptyCell!3985) )
))
(declare-datatypes ((array!21267 0))(
  ( (array!21268 (arr!10102 (Array (_ BitVec 32) ValueCell!3985)) (size!10454 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21267)

(declare-fun lt!169685 () array!21265)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5798 0))(
  ( (tuple2!5799 (_1!2910 (_ BitVec 64)) (_2!2910 V!12647)) )
))
(declare-datatypes ((List!5632 0))(
  ( (Nil!5629) (Cons!5628 (h!6484 tuple2!5798) (t!10782 List!5632)) )
))
(declare-datatypes ((ListLongMap!4711 0))(
  ( (ListLongMap!4712 (toList!2371 List!5632)) )
))
(declare-fun lt!169684 () ListLongMap!4711)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12647)

(declare-fun zeroValue!472 () V!12647)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12647)

(declare-fun getCurrentListMapNoExtraKeys!648 (array!21265 array!21267 (_ BitVec 32) (_ BitVec 32) V!12647 V!12647 (_ BitVec 32) Int) ListLongMap!4711)

(assert (=> b!369216 (= lt!169684 (getCurrentListMapNoExtraKeys!648 lt!169685 (array!21268 (store (arr!10102 _values!506) i!548 (ValueCellFull!3985 v!373)) (size!10454 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169686 () ListLongMap!4711)

(assert (=> b!369216 (= lt!169686 (getCurrentListMapNoExtraKeys!648 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369217 () Bool)

(declare-fun res!207083 () Bool)

(assert (=> b!369217 (=> (not res!207083) (not e!225690))))

(assert (=> b!369217 (= res!207083 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10453 _keys!658))))))

(declare-fun b!369218 () Bool)

(declare-fun res!207081 () Bool)

(assert (=> b!369218 (=> (not res!207081) (not e!225690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369218 (= res!207081 (validKeyInArray!0 k!778))))

(declare-fun b!369219 () Bool)

(declare-fun res!207086 () Bool)

(assert (=> b!369219 (=> (not res!207086) (not e!225690))))

(declare-datatypes ((List!5633 0))(
  ( (Nil!5630) (Cons!5629 (h!6485 (_ BitVec 64)) (t!10783 List!5633)) )
))
(declare-fun arrayNoDuplicates!0 (array!21265 (_ BitVec 32) List!5633) Bool)

(assert (=> b!369219 (= res!207086 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5630))))

(declare-fun b!369220 () Bool)

(declare-fun e!225695 () Bool)

(declare-fun e!225694 () Bool)

(assert (=> b!369220 (= e!225695 (and e!225694 mapRes!14550))))

(declare-fun condMapEmpty!14550 () Bool)

(declare-fun mapDefault!14550 () ValueCell!3985)

