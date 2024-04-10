; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40156 () Bool)

(assert start!40156)

(declare-fun b_free!10423 () Bool)

(declare-fun b_next!10423 () Bool)

(assert (=> start!40156 (= b_free!10423 (not b_next!10423))))

(declare-fun tp!36798 () Bool)

(declare-fun b_and!18391 () Bool)

(assert (=> start!40156 (= tp!36798 b_and!18391)))

(declare-fun b!439508 () Bool)

(declare-fun res!259743 () Bool)

(declare-fun e!259084 () Bool)

(assert (=> b!439508 (=> (not res!259743) (not e!259084))))

(declare-datatypes ((array!26967 0))(
  ( (array!26968 (arr!12933 (Array (_ BitVec 32) (_ BitVec 64))) (size!13285 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26967)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439508 (= res!259743 (or (= (select (arr!12933 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12933 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439509 () Bool)

(declare-fun res!259752 () Bool)

(assert (=> b!439509 (=> (not res!259752) (not e!259084))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16539 0))(
  ( (V!16540 (val!5832 Int)) )
))
(declare-datatypes ((ValueCell!5444 0))(
  ( (ValueCellFull!5444 (v!8079 V!16539)) (EmptyCell!5444) )
))
(declare-datatypes ((array!26969 0))(
  ( (array!26970 (arr!12934 (Array (_ BitVec 32) ValueCell!5444)) (size!13286 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26969)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!439509 (= res!259752 (and (= (size!13286 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13285 _keys!709) (size!13286 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439510 () Bool)

(declare-fun res!259748 () Bool)

(declare-fun e!259085 () Bool)

(assert (=> b!439510 (=> (not res!259748) (not e!259085))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!439510 (= res!259748 (bvsle from!863 i!563))))

(declare-fun b!439511 () Bool)

(declare-fun res!259747 () Bool)

(assert (=> b!439511 (=> (not res!259747) (not e!259084))))

(declare-datatypes ((List!7741 0))(
  ( (Nil!7738) (Cons!7737 (h!8593 (_ BitVec 64)) (t!13497 List!7741)) )
))
(declare-fun arrayNoDuplicates!0 (array!26967 (_ BitVec 32) List!7741) Bool)

(assert (=> b!439511 (= res!259747 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7738))))

(declare-fun b!439512 () Bool)

(declare-fun res!259745 () Bool)

(assert (=> b!439512 (=> (not res!259745) (not e!259084))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439512 (= res!259745 (validKeyInArray!0 k!794))))

(declare-fun res!259741 () Bool)

(assert (=> start!40156 (=> (not res!259741) (not e!259084))))

(assert (=> start!40156 (= res!259741 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13285 _keys!709))))))

(assert (=> start!40156 e!259084))

(declare-fun tp_is_empty!11575 () Bool)

(assert (=> start!40156 tp_is_empty!11575))

(assert (=> start!40156 tp!36798))

(assert (=> start!40156 true))

(declare-fun e!259089 () Bool)

(declare-fun array_inv!9390 (array!26969) Bool)

(assert (=> start!40156 (and (array_inv!9390 _values!549) e!259089)))

(declare-fun array_inv!9391 (array!26967) Bool)

(assert (=> start!40156 (array_inv!9391 _keys!709)))

(declare-fun b!439513 () Bool)

(declare-fun e!259086 () Bool)

(assert (=> b!439513 (= e!259085 e!259086)))

(declare-fun res!259740 () Bool)

(assert (=> b!439513 (=> (not res!259740) (not e!259086))))

(assert (=> b!439513 (= res!259740 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16539)

(declare-fun lt!202293 () array!26969)

(declare-fun zeroValue!515 () V!16539)

(declare-datatypes ((tuple2!7744 0))(
  ( (tuple2!7745 (_1!3883 (_ BitVec 64)) (_2!3883 V!16539)) )
))
(declare-datatypes ((List!7742 0))(
  ( (Nil!7739) (Cons!7738 (h!8594 tuple2!7744) (t!13498 List!7742)) )
))
(declare-datatypes ((ListLongMap!6657 0))(
  ( (ListLongMap!6658 (toList!3344 List!7742)) )
))
(declare-fun lt!202291 () ListLongMap!6657)

(declare-fun lt!202295 () array!26967)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1533 (array!26967 array!26969 (_ BitVec 32) (_ BitVec 32) V!16539 V!16539 (_ BitVec 32) Int) ListLongMap!6657)

(assert (=> b!439513 (= lt!202291 (getCurrentListMapNoExtraKeys!1533 lt!202295 lt!202293 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16539)

(assert (=> b!439513 (= lt!202293 (array!26970 (store (arr!12934 _values!549) i!563 (ValueCellFull!5444 v!412)) (size!13286 _values!549)))))

(declare-fun lt!202292 () ListLongMap!6657)

(assert (=> b!439513 (= lt!202292 (getCurrentListMapNoExtraKeys!1533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439514 () Bool)

(declare-fun e!259083 () Bool)

(declare-fun mapRes!18984 () Bool)

(assert (=> b!439514 (= e!259089 (and e!259083 mapRes!18984))))

(declare-fun condMapEmpty!18984 () Bool)

(declare-fun mapDefault!18984 () ValueCell!5444)

