; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37512 () Bool)

(assert start!37512)

(declare-fun b_free!8639 () Bool)

(declare-fun b_next!8639 () Bool)

(assert (=> start!37512 (= b_free!8639 (not b_next!8639))))

(declare-fun tp!30632 () Bool)

(declare-fun b_and!15881 () Bool)

(assert (=> start!37512 (= tp!30632 b_and!15881)))

(declare-fun b!382696 () Bool)

(declare-fun e!232535 () Bool)

(assert (=> b!382696 (= e!232535 true)))

(declare-datatypes ((V!13487 0))(
  ( (V!13488 (val!4688 Int)) )
))
(declare-datatypes ((tuple2!6304 0))(
  ( (tuple2!6305 (_1!3163 (_ BitVec 64)) (_2!3163 V!13487)) )
))
(declare-datatypes ((List!6136 0))(
  ( (Nil!6133) (Cons!6132 (h!6988 tuple2!6304) (t!11286 List!6136)) )
))
(declare-datatypes ((ListLongMap!5217 0))(
  ( (ListLongMap!5218 (toList!2624 List!6136)) )
))
(declare-fun lt!179590 () ListLongMap!5217)

(declare-fun lt!179588 () ListLongMap!5217)

(assert (=> b!382696 (= lt!179590 lt!179588)))

(declare-fun b!382697 () Bool)

(declare-fun e!232533 () Bool)

(assert (=> b!382697 (= e!232533 (not e!232535))))

(declare-fun res!217736 () Bool)

(assert (=> b!382697 (=> res!217736 e!232535)))

(declare-fun lt!179595 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382697 (= res!217736 (or (and (not lt!179595) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179595) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179595)))))

(assert (=> b!382697 (= lt!179595 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!4300 0))(
  ( (ValueCellFull!4300 (v!6885 V!13487)) (EmptyCell!4300) )
))
(declare-datatypes ((array!22483 0))(
  ( (array!22484 (arr!10710 (Array (_ BitVec 32) ValueCell!4300)) (size!11062 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22483)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179594 () ListLongMap!5217)

(declare-fun zeroValue!472 () V!13487)

(declare-datatypes ((array!22485 0))(
  ( (array!22486 (arr!10711 (Array (_ BitVec 32) (_ BitVec 64))) (size!11063 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22485)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13487)

(declare-fun getCurrentListMap!2029 (array!22485 array!22483 (_ BitVec 32) (_ BitVec 32) V!13487 V!13487 (_ BitVec 32) Int) ListLongMap!5217)

(assert (=> b!382697 (= lt!179594 (getCurrentListMap!2029 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179591 () array!22483)

(declare-fun lt!179589 () array!22485)

(assert (=> b!382697 (= lt!179590 (getCurrentListMap!2029 lt!179589 lt!179591 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179587 () ListLongMap!5217)

(assert (=> b!382697 (and (= lt!179588 lt!179587) (= lt!179587 lt!179588))))

(declare-fun v!373 () V!13487)

(declare-fun lt!179593 () ListLongMap!5217)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!959 (ListLongMap!5217 tuple2!6304) ListLongMap!5217)

(assert (=> b!382697 (= lt!179587 (+!959 lt!179593 (tuple2!6305 k!778 v!373)))))

(declare-datatypes ((Unit!11812 0))(
  ( (Unit!11813) )
))
(declare-fun lt!179592 () Unit!11812)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!187 (array!22485 array!22483 (_ BitVec 32) (_ BitVec 32) V!13487 V!13487 (_ BitVec 32) (_ BitVec 64) V!13487 (_ BitVec 32) Int) Unit!11812)

(assert (=> b!382697 (= lt!179592 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!187 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!863 (array!22485 array!22483 (_ BitVec 32) (_ BitVec 32) V!13487 V!13487 (_ BitVec 32) Int) ListLongMap!5217)

(assert (=> b!382697 (= lt!179588 (getCurrentListMapNoExtraKeys!863 lt!179589 lt!179591 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382697 (= lt!179591 (array!22484 (store (arr!10710 _values!506) i!548 (ValueCellFull!4300 v!373)) (size!11062 _values!506)))))

(assert (=> b!382697 (= lt!179593 (getCurrentListMapNoExtraKeys!863 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382698 () Bool)

(declare-fun res!217731 () Bool)

(declare-fun e!232531 () Bool)

(assert (=> b!382698 (=> (not res!217731) (not e!232531))))

(assert (=> b!382698 (= res!217731 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11063 _keys!658))))))

(declare-fun b!382699 () Bool)

(declare-fun res!217734 () Bool)

(assert (=> b!382699 (=> (not res!217734) (not e!232533))))

(declare-datatypes ((List!6137 0))(
  ( (Nil!6134) (Cons!6133 (h!6989 (_ BitVec 64)) (t!11287 List!6137)) )
))
(declare-fun arrayNoDuplicates!0 (array!22485 (_ BitVec 32) List!6137) Bool)

(assert (=> b!382699 (= res!217734 (arrayNoDuplicates!0 lt!179589 #b00000000000000000000000000000000 Nil!6134))))

(declare-fun b!382700 () Bool)

(declare-fun e!232529 () Bool)

(declare-fun e!232530 () Bool)

(declare-fun mapRes!15495 () Bool)

(assert (=> b!382700 (= e!232529 (and e!232530 mapRes!15495))))

(declare-fun condMapEmpty!15495 () Bool)

(declare-fun mapDefault!15495 () ValueCell!4300)

