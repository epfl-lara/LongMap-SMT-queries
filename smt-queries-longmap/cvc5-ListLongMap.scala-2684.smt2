; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39922 () Bool)

(assert start!39922)

(declare-fun b_free!10189 () Bool)

(declare-fun b_next!10189 () Bool)

(assert (=> start!39922 (= b_free!10189 (not b_next!10189))))

(declare-fun tp!36095 () Bool)

(declare-fun b_and!18037 () Bool)

(assert (=> start!39922 (= tp!36095 b_and!18037)))

(declare-fun b!433060 () Bool)

(declare-fun res!254827 () Bool)

(declare-fun e!256098 () Bool)

(assert (=> b!433060 (=> (not res!254827) (not e!256098))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26515 0))(
  ( (array!26516 (arr!12707 (Array (_ BitVec 32) (_ BitVec 64))) (size!13059 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26515)

(assert (=> b!433060 (= res!254827 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13059 _keys!709))))))

(declare-fun b!433061 () Bool)

(declare-fun e!256099 () Bool)

(declare-fun e!256100 () Bool)

(assert (=> b!433061 (= e!256099 e!256100)))

(declare-fun res!254822 () Bool)

(assert (=> b!433061 (=> (not res!254822) (not e!256100))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433061 (= res!254822 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16227 0))(
  ( (V!16228 (val!5715 Int)) )
))
(declare-fun minValue!515 () V!16227)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16227)

(declare-fun lt!198770 () array!26515)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7548 0))(
  ( (tuple2!7549 (_1!3785 (_ BitVec 64)) (_2!3785 V!16227)) )
))
(declare-datatypes ((List!7559 0))(
  ( (Nil!7556) (Cons!7555 (h!8411 tuple2!7548) (t!13197 List!7559)) )
))
(declare-datatypes ((ListLongMap!6461 0))(
  ( (ListLongMap!6462 (toList!3246 List!7559)) )
))
(declare-fun lt!198760 () ListLongMap!6461)

(declare-datatypes ((ValueCell!5327 0))(
  ( (ValueCellFull!5327 (v!7962 V!16227)) (EmptyCell!5327) )
))
(declare-datatypes ((array!26517 0))(
  ( (array!26518 (arr!12708 (Array (_ BitVec 32) ValueCell!5327)) (size!13060 (_ BitVec 32))) )
))
(declare-fun lt!198757 () array!26517)

(declare-fun getCurrentListMapNoExtraKeys!1442 (array!26515 array!26517 (_ BitVec 32) (_ BitVec 32) V!16227 V!16227 (_ BitVec 32) Int) ListLongMap!6461)

(assert (=> b!433061 (= lt!198760 (getCurrentListMapNoExtraKeys!1442 lt!198770 lt!198757 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26517)

(declare-fun v!412 () V!16227)

(assert (=> b!433061 (= lt!198757 (array!26518 (store (arr!12708 _values!549) i!563 (ValueCellFull!5327 v!412)) (size!13060 _values!549)))))

(declare-fun lt!198763 () ListLongMap!6461)

(assert (=> b!433061 (= lt!198763 (getCurrentListMapNoExtraKeys!1442 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18633 () Bool)

(declare-fun mapRes!18633 () Bool)

(assert (=> mapIsEmpty!18633 mapRes!18633))

(declare-fun b!433062 () Bool)

(declare-fun res!254824 () Bool)

(assert (=> b!433062 (=> (not res!254824) (not e!256098))))

(assert (=> b!433062 (= res!254824 (or (= (select (arr!12707 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12707 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433063 () Bool)

(declare-fun res!254835 () Bool)

(assert (=> b!433063 (=> (not res!254835) (not e!256098))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433063 (= res!254835 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433064 () Bool)

(declare-fun res!254826 () Bool)

(assert (=> b!433064 (=> (not res!254826) (not e!256098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26515 (_ BitVec 32)) Bool)

(assert (=> b!433064 (= res!254826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433065 () Bool)

(assert (=> b!433065 (= e!256098 e!256099)))

(declare-fun res!254823 () Bool)

(assert (=> b!433065 (=> (not res!254823) (not e!256099))))

(assert (=> b!433065 (= res!254823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198770 mask!1025))))

(assert (=> b!433065 (= lt!198770 (array!26516 (store (arr!12707 _keys!709) i!563 k!794) (size!13059 _keys!709)))))

(declare-fun b!433066 () Bool)

(declare-fun e!256094 () Bool)

(assert (=> b!433066 (= e!256094 true)))

(declare-fun lt!198769 () tuple2!7548)

(declare-fun lt!198766 () tuple2!7548)

(declare-fun lt!198758 () ListLongMap!6461)

(declare-fun lt!198756 () ListLongMap!6461)

(declare-fun +!1394 (ListLongMap!6461 tuple2!7548) ListLongMap!6461)

(assert (=> b!433066 (= lt!198758 (+!1394 (+!1394 lt!198756 lt!198766) lt!198769))))

(declare-fun lt!198765 () V!16227)

(declare-datatypes ((Unit!12807 0))(
  ( (Unit!12808) )
))
(declare-fun lt!198761 () Unit!12807)

(declare-fun addCommutativeForDiffKeys!383 (ListLongMap!6461 (_ BitVec 64) V!16227 (_ BitVec 64) V!16227) Unit!12807)

(assert (=> b!433066 (= lt!198761 (addCommutativeForDiffKeys!383 lt!198756 k!794 v!412 (select (arr!12707 _keys!709) from!863) lt!198765))))

(declare-fun b!433068 () Bool)

(declare-fun res!254832 () Bool)

(assert (=> b!433068 (=> (not res!254832) (not e!256099))))

(assert (=> b!433068 (= res!254832 (bvsle from!863 i!563))))

(declare-fun b!433069 () Bool)

(declare-fun e!256097 () Bool)

(assert (=> b!433069 (= e!256100 (not e!256097))))

(declare-fun res!254825 () Bool)

(assert (=> b!433069 (=> res!254825 e!256097)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433069 (= res!254825 (not (validKeyInArray!0 (select (arr!12707 _keys!709) from!863))))))

(declare-fun lt!198767 () ListLongMap!6461)

(declare-fun lt!198768 () ListLongMap!6461)

(assert (=> b!433069 (= lt!198767 lt!198768)))

(assert (=> b!433069 (= lt!198768 (+!1394 lt!198756 lt!198769))))

(assert (=> b!433069 (= lt!198767 (getCurrentListMapNoExtraKeys!1442 lt!198770 lt!198757 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433069 (= lt!198769 (tuple2!7549 k!794 v!412))))

(assert (=> b!433069 (= lt!198756 (getCurrentListMapNoExtraKeys!1442 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198764 () Unit!12807)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!575 (array!26515 array!26517 (_ BitVec 32) (_ BitVec 32) V!16227 V!16227 (_ BitVec 32) (_ BitVec 64) V!16227 (_ BitVec 32) Int) Unit!12807)

(assert (=> b!433069 (= lt!198764 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!575 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433070 () Bool)

(declare-fun e!256096 () Bool)

(declare-fun tp_is_empty!11341 () Bool)

(assert (=> b!433070 (= e!256096 tp_is_empty!11341)))

(declare-fun b!433071 () Bool)

(declare-fun e!256095 () Bool)

(assert (=> b!433071 (= e!256095 tp_is_empty!11341)))

(declare-fun b!433072 () Bool)

(declare-fun e!256093 () Bool)

(assert (=> b!433072 (= e!256093 (and e!256095 mapRes!18633))))

(declare-fun condMapEmpty!18633 () Bool)

(declare-fun mapDefault!18633 () ValueCell!5327)

