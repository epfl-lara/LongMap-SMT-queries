; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39976 () Bool)

(assert start!39976)

(declare-fun b_free!10243 () Bool)

(declare-fun b_next!10243 () Bool)

(assert (=> start!39976 (= b_free!10243 (not b_next!10243))))

(declare-fun tp!36258 () Bool)

(declare-fun b_and!18145 () Bool)

(assert (=> start!39976 (= tp!36258 b_and!18145)))

(declare-fun b!434734 () Bool)

(declare-fun res!256047 () Bool)

(declare-fun e!256902 () Bool)

(assert (=> b!434734 (=> (not res!256047) (not e!256902))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434734 (= res!256047 (validKeyInArray!0 k!794))))

(declare-fun b!434735 () Bool)

(declare-fun res!256046 () Bool)

(declare-fun e!256903 () Bool)

(assert (=> b!434735 (=> (not res!256046) (not e!256903))))

(declare-datatypes ((array!26621 0))(
  ( (array!26622 (arr!12760 (Array (_ BitVec 32) (_ BitVec 64))) (size!13112 (_ BitVec 32))) )
))
(declare-fun lt!199978 () array!26621)

(declare-datatypes ((List!7603 0))(
  ( (Nil!7600) (Cons!7599 (h!8455 (_ BitVec 64)) (t!13295 List!7603)) )
))
(declare-fun arrayNoDuplicates!0 (array!26621 (_ BitVec 32) List!7603) Bool)

(assert (=> b!434735 (= res!256046 (arrayNoDuplicates!0 lt!199978 #b00000000000000000000000000000000 Nil!7600))))

(declare-fun b!434736 () Bool)

(declare-fun e!256906 () Bool)

(assert (=> b!434736 (= e!256903 e!256906)))

(declare-fun res!256039 () Bool)

(assert (=> b!434736 (=> (not res!256039) (not e!256906))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434736 (= res!256039 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16299 0))(
  ( (V!16300 (val!5742 Int)) )
))
(declare-datatypes ((tuple2!7600 0))(
  ( (tuple2!7601 (_1!3811 (_ BitVec 64)) (_2!3811 V!16299)) )
))
(declare-datatypes ((List!7604 0))(
  ( (Nil!7601) (Cons!7600 (h!8456 tuple2!7600) (t!13296 List!7604)) )
))
(declare-datatypes ((ListLongMap!6513 0))(
  ( (ListLongMap!6514 (toList!3272 List!7604)) )
))
(declare-fun lt!199976 () ListLongMap!6513)

(declare-fun minValue!515 () V!16299)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5354 0))(
  ( (ValueCellFull!5354 (v!7989 V!16299)) (EmptyCell!5354) )
))
(declare-datatypes ((array!26623 0))(
  ( (array!26624 (arr!12761 (Array (_ BitVec 32) ValueCell!5354)) (size!13113 (_ BitVec 32))) )
))
(declare-fun lt!199977 () array!26623)

(declare-fun zeroValue!515 () V!16299)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1463 (array!26621 array!26623 (_ BitVec 32) (_ BitVec 32) V!16299 V!16299 (_ BitVec 32) Int) ListLongMap!6513)

(assert (=> b!434736 (= lt!199976 (getCurrentListMapNoExtraKeys!1463 lt!199978 lt!199977 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16299)

(declare-fun _values!549 () array!26623)

(assert (=> b!434736 (= lt!199977 (array!26624 (store (arr!12761 _values!549) i!563 (ValueCellFull!5354 v!412)) (size!13113 _values!549)))))

(declare-fun lt!199972 () ListLongMap!6513)

(declare-fun _keys!709 () array!26621)

(assert (=> b!434736 (= lt!199972 (getCurrentListMapNoExtraKeys!1463 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434737 () Bool)

(declare-fun res!256045 () Bool)

(assert (=> b!434737 (=> (not res!256045) (not e!256902))))

(assert (=> b!434737 (= res!256045 (and (= (size!13113 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13112 _keys!709) (size!13113 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434738 () Bool)

(declare-fun res!256041 () Bool)

(assert (=> b!434738 (=> (not res!256041) (not e!256902))))

(declare-fun arrayContainsKey!0 (array!26621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434738 (= res!256041 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!434739 () Bool)

(declare-fun e!256911 () Bool)

(assert (=> b!434739 (= e!256911 true)))

(declare-fun lt!199982 () ListLongMap!6513)

(declare-fun lt!199980 () tuple2!7600)

(declare-fun lt!199973 () ListLongMap!6513)

(declare-fun lt!199971 () tuple2!7600)

(declare-fun +!1420 (ListLongMap!6513 tuple2!7600) ListLongMap!6513)

(assert (=> b!434739 (= lt!199982 (+!1420 (+!1420 lt!199973 lt!199971) lt!199980))))

(declare-datatypes ((Unit!12897 0))(
  ( (Unit!12898) )
))
(declare-fun lt!199974 () Unit!12897)

(declare-fun lt!199983 () V!16299)

(declare-fun addCommutativeForDiffKeys!404 (ListLongMap!6513 (_ BitVec 64) V!16299 (_ BitVec 64) V!16299) Unit!12897)

(assert (=> b!434739 (= lt!199974 (addCommutativeForDiffKeys!404 lt!199973 k!794 v!412 (select (arr!12760 _keys!709) from!863) lt!199983))))

(declare-fun b!434740 () Bool)

(declare-fun res!256038 () Bool)

(assert (=> b!434740 (=> (not res!256038) (not e!256902))))

(assert (=> b!434740 (= res!256038 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13112 _keys!709))))))

(declare-fun b!434741 () Bool)

(declare-fun res!256050 () Bool)

(assert (=> b!434741 (=> (not res!256050) (not e!256902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434741 (= res!256050 (validMask!0 mask!1025))))

(declare-fun b!434742 () Bool)

(declare-fun e!256908 () Bool)

(declare-fun tp_is_empty!11395 () Bool)

(assert (=> b!434742 (= e!256908 tp_is_empty!11395)))

(declare-fun b!434744 () Bool)

(declare-fun e!256909 () Bool)

(declare-fun mapRes!18714 () Bool)

(assert (=> b!434744 (= e!256909 (and e!256908 mapRes!18714))))

(declare-fun condMapEmpty!18714 () Bool)

(declare-fun mapDefault!18714 () ValueCell!5354)

