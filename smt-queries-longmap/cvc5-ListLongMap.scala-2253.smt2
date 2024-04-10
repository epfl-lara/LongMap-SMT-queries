; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36980 () Bool)

(assert start!36980)

(declare-fun b_free!8107 () Bool)

(declare-fun b_next!8107 () Bool)

(assert (=> start!36980 (= b_free!8107 (not b_next!8107))))

(declare-fun tp!29037 () Bool)

(declare-fun b_and!15349 () Bool)

(assert (=> start!36980 (= tp!29037 b_and!15349)))

(declare-fun b!371126 () Bool)

(declare-fun res!208559 () Bool)

(declare-fun e!226576 () Bool)

(assert (=> b!371126 (=> (not res!208559) (not e!226576))))

(declare-datatypes ((array!21453 0))(
  ( (array!21454 (arr!10195 (Array (_ BitVec 32) (_ BitVec 64))) (size!10547 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21453)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371126 (= res!208559 (or (= (select (arr!10195 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10195 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371127 () Bool)

(declare-fun res!208553 () Bool)

(assert (=> b!371127 (=> (not res!208553) (not e!226576))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21453 (_ BitVec 32)) Bool)

(assert (=> b!371127 (= res!208553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371128 () Bool)

(declare-fun res!208552 () Bool)

(assert (=> b!371128 (=> (not res!208552) (not e!226576))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371128 (= res!208552 (validKeyInArray!0 k!778))))

(declare-fun b!371129 () Bool)

(declare-fun res!208555 () Bool)

(assert (=> b!371129 (=> (not res!208555) (not e!226576))))

(declare-datatypes ((List!5705 0))(
  ( (Nil!5702) (Cons!5701 (h!6557 (_ BitVec 64)) (t!10855 List!5705)) )
))
(declare-fun arrayNoDuplicates!0 (array!21453 (_ BitVec 32) List!5705) Bool)

(assert (=> b!371129 (= res!208555 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5702))))

(declare-fun b!371130 () Bool)

(declare-fun e!226577 () Bool)

(assert (=> b!371130 (= e!226577 (not true))))

(declare-datatypes ((V!12779 0))(
  ( (V!12780 (val!4422 Int)) )
))
(declare-datatypes ((tuple2!5866 0))(
  ( (tuple2!5867 (_1!2944 (_ BitVec 64)) (_2!2944 V!12779)) )
))
(declare-datatypes ((List!5706 0))(
  ( (Nil!5703) (Cons!5702 (h!6558 tuple2!5866) (t!10856 List!5706)) )
))
(declare-datatypes ((ListLongMap!4779 0))(
  ( (ListLongMap!4780 (toList!2405 List!5706)) )
))
(declare-fun lt!170167 () ListLongMap!4779)

(declare-fun lt!170168 () ListLongMap!4779)

(assert (=> b!371130 (and (= lt!170167 lt!170168) (= lt!170168 lt!170167))))

(declare-fun v!373 () V!12779)

(declare-fun lt!170169 () ListLongMap!4779)

(declare-fun +!751 (ListLongMap!4779 tuple2!5866) ListLongMap!4779)

(assert (=> b!371130 (= lt!170168 (+!751 lt!170169 (tuple2!5867 k!778 v!373)))))

(declare-datatypes ((ValueCell!4034 0))(
  ( (ValueCellFull!4034 (v!6619 V!12779)) (EmptyCell!4034) )
))
(declare-datatypes ((array!21455 0))(
  ( (array!21456 (arr!10196 (Array (_ BitVec 32) ValueCell!4034)) (size!10548 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21455)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11408 0))(
  ( (Unit!11409) )
))
(declare-fun lt!170166 () Unit!11408)

(declare-fun zeroValue!472 () V!12779)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun minValue!472 () V!12779)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!6 (array!21453 array!21455 (_ BitVec 32) (_ BitVec 32) V!12779 V!12779 (_ BitVec 32) (_ BitVec 64) V!12779 (_ BitVec 32) Int) Unit!11408)

(assert (=> b!371130 (= lt!170166 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!6 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170165 () array!21453)

(declare-fun getCurrentListMapNoExtraKeys!682 (array!21453 array!21455 (_ BitVec 32) (_ BitVec 32) V!12779 V!12779 (_ BitVec 32) Int) ListLongMap!4779)

(assert (=> b!371130 (= lt!170167 (getCurrentListMapNoExtraKeys!682 lt!170165 (array!21456 (store (arr!10196 _values!506) i!548 (ValueCellFull!4034 v!373)) (size!10548 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371130 (= lt!170169 (getCurrentListMapNoExtraKeys!682 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371131 () Bool)

(declare-fun res!208558 () Bool)

(assert (=> b!371131 (=> (not res!208558) (not e!226576))))

(declare-fun arrayContainsKey!0 (array!21453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371131 (= res!208558 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14697 () Bool)

(declare-fun mapRes!14697 () Bool)

(declare-fun tp!29036 () Bool)

(declare-fun e!226573 () Bool)

(assert (=> mapNonEmpty!14697 (= mapRes!14697 (and tp!29036 e!226573))))

(declare-fun mapValue!14697 () ValueCell!4034)

(declare-fun mapKey!14697 () (_ BitVec 32))

(declare-fun mapRest!14697 () (Array (_ BitVec 32) ValueCell!4034))

(assert (=> mapNonEmpty!14697 (= (arr!10196 _values!506) (store mapRest!14697 mapKey!14697 mapValue!14697))))

(declare-fun mapIsEmpty!14697 () Bool)

(assert (=> mapIsEmpty!14697 mapRes!14697))

(declare-fun b!371132 () Bool)

(assert (=> b!371132 (= e!226576 e!226577)))

(declare-fun res!208551 () Bool)

(assert (=> b!371132 (=> (not res!208551) (not e!226577))))

(assert (=> b!371132 (= res!208551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170165 mask!970))))

(assert (=> b!371132 (= lt!170165 (array!21454 (store (arr!10195 _keys!658) i!548 k!778) (size!10547 _keys!658)))))

(declare-fun b!371133 () Bool)

(declare-fun tp_is_empty!8755 () Bool)

(assert (=> b!371133 (= e!226573 tp_is_empty!8755)))

(declare-fun b!371134 () Bool)

(declare-fun e!226572 () Bool)

(assert (=> b!371134 (= e!226572 tp_is_empty!8755)))

(declare-fun b!371135 () Bool)

(declare-fun res!208556 () Bool)

(assert (=> b!371135 (=> (not res!208556) (not e!226577))))

(assert (=> b!371135 (= res!208556 (arrayNoDuplicates!0 lt!170165 #b00000000000000000000000000000000 Nil!5702))))

(declare-fun b!371136 () Bool)

(declare-fun e!226574 () Bool)

(assert (=> b!371136 (= e!226574 (and e!226572 mapRes!14697))))

(declare-fun condMapEmpty!14697 () Bool)

(declare-fun mapDefault!14697 () ValueCell!4034)

