; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40130 () Bool)

(assert start!40130)

(declare-fun b_free!10397 () Bool)

(declare-fun b_next!10397 () Bool)

(assert (=> start!40130 (= b_free!10397 (not b_next!10397))))

(declare-fun tp!36719 () Bool)

(declare-fun b_and!18365 () Bool)

(assert (=> start!40130 (= tp!36719 b_and!18365)))

(declare-fun b!438884 () Bool)

(declare-fun res!259239 () Bool)

(declare-fun e!258811 () Bool)

(assert (=> b!438884 (=> (not res!259239) (not e!258811))))

(declare-datatypes ((array!26915 0))(
  ( (array!26916 (arr!12907 (Array (_ BitVec 32) (_ BitVec 64))) (size!13259 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26915)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16503 0))(
  ( (V!16504 (val!5819 Int)) )
))
(declare-datatypes ((ValueCell!5431 0))(
  ( (ValueCellFull!5431 (v!8066 V!16503)) (EmptyCell!5431) )
))
(declare-datatypes ((array!26917 0))(
  ( (array!26918 (arr!12908 (Array (_ BitVec 32) ValueCell!5431)) (size!13260 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26917)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!438884 (= res!259239 (and (= (size!13260 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13259 _keys!709) (size!13260 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438885 () Bool)

(declare-fun res!259236 () Bool)

(assert (=> b!438885 (=> (not res!259236) (not e!258811))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438885 (= res!259236 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!438886 () Bool)

(declare-fun res!259234 () Bool)

(assert (=> b!438886 (=> (not res!259234) (not e!258811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438886 (= res!259234 (validKeyInArray!0 k!794))))

(declare-fun b!438887 () Bool)

(declare-fun res!259233 () Bool)

(assert (=> b!438887 (=> (not res!259233) (not e!258811))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438887 (= res!259233 (or (= (select (arr!12907 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12907 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!259241 () Bool)

(assert (=> start!40130 (=> (not res!259241) (not e!258811))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40130 (= res!259241 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13259 _keys!709))))))

(assert (=> start!40130 e!258811))

(declare-fun tp_is_empty!11549 () Bool)

(assert (=> start!40130 tp_is_empty!11549))

(assert (=> start!40130 tp!36719))

(assert (=> start!40130 true))

(declare-fun e!258814 () Bool)

(declare-fun array_inv!9374 (array!26917) Bool)

(assert (=> start!40130 (and (array_inv!9374 _values!549) e!258814)))

(declare-fun array_inv!9375 (array!26915) Bool)

(assert (=> start!40130 (array_inv!9375 _keys!709)))

(declare-fun b!438888 () Bool)

(declare-fun res!259244 () Bool)

(declare-fun e!258816 () Bool)

(assert (=> b!438888 (=> (not res!259244) (not e!258816))))

(assert (=> b!438888 (= res!259244 (bvsle from!863 i!563))))

(declare-fun b!438889 () Bool)

(declare-fun res!259242 () Bool)

(assert (=> b!438889 (=> (not res!259242) (not e!258811))))

(assert (=> b!438889 (= res!259242 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13259 _keys!709))))))

(declare-fun b!438890 () Bool)

(declare-fun res!259245 () Bool)

(assert (=> b!438890 (=> (not res!259245) (not e!258816))))

(declare-fun lt!202098 () array!26915)

(declare-datatypes ((List!7720 0))(
  ( (Nil!7717) (Cons!7716 (h!8572 (_ BitVec 64)) (t!13476 List!7720)) )
))
(declare-fun arrayNoDuplicates!0 (array!26915 (_ BitVec 32) List!7720) Bool)

(assert (=> b!438890 (= res!259245 (arrayNoDuplicates!0 lt!202098 #b00000000000000000000000000000000 Nil!7717))))

(declare-fun b!438891 () Bool)

(declare-fun res!259235 () Bool)

(assert (=> b!438891 (=> (not res!259235) (not e!258811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438891 (= res!259235 (validMask!0 mask!1025))))

(declare-fun b!438892 () Bool)

(assert (=> b!438892 (= e!258811 e!258816)))

(declare-fun res!259238 () Bool)

(assert (=> b!438892 (=> (not res!259238) (not e!258816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26915 (_ BitVec 32)) Bool)

(assert (=> b!438892 (= res!259238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202098 mask!1025))))

(assert (=> b!438892 (= lt!202098 (array!26916 (store (arr!12907 _keys!709) i!563 k!794) (size!13259 _keys!709)))))

(declare-fun b!438893 () Bool)

(declare-fun res!259237 () Bool)

(assert (=> b!438893 (=> (not res!259237) (not e!258811))))

(assert (=> b!438893 (= res!259237 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7717))))

(declare-fun b!438894 () Bool)

(declare-fun e!258813 () Bool)

(assert (=> b!438894 (= e!258813 tp_is_empty!11549)))

(declare-fun b!438895 () Bool)

(declare-fun e!258810 () Bool)

(assert (=> b!438895 (= e!258810 tp_is_empty!11549)))

(declare-fun b!438896 () Bool)

(declare-fun e!258815 () Bool)

(assert (=> b!438896 (= e!258816 e!258815)))

(declare-fun res!259243 () Bool)

(assert (=> b!438896 (=> (not res!259243) (not e!258815))))

(assert (=> b!438896 (= res!259243 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16503)

(declare-fun lt!202097 () array!26917)

(declare-fun minValue!515 () V!16503)

(declare-datatypes ((tuple2!7722 0))(
  ( (tuple2!7723 (_1!3872 (_ BitVec 64)) (_2!3872 V!16503)) )
))
(declare-datatypes ((List!7721 0))(
  ( (Nil!7718) (Cons!7717 (h!8573 tuple2!7722) (t!13477 List!7721)) )
))
(declare-datatypes ((ListLongMap!6635 0))(
  ( (ListLongMap!6636 (toList!3333 List!7721)) )
))
(declare-fun lt!202096 () ListLongMap!6635)

(declare-fun getCurrentListMapNoExtraKeys!1522 (array!26915 array!26917 (_ BitVec 32) (_ BitVec 32) V!16503 V!16503 (_ BitVec 32) Int) ListLongMap!6635)

(assert (=> b!438896 (= lt!202096 (getCurrentListMapNoExtraKeys!1522 lt!202098 lt!202097 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16503)

(assert (=> b!438896 (= lt!202097 (array!26918 (store (arr!12908 _values!549) i!563 (ValueCellFull!5431 v!412)) (size!13260 _values!549)))))

(declare-fun lt!202099 () ListLongMap!6635)

(assert (=> b!438896 (= lt!202099 (getCurrentListMapNoExtraKeys!1522 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438897 () Bool)

(declare-fun mapRes!18945 () Bool)

(assert (=> b!438897 (= e!258814 (and e!258810 mapRes!18945))))

(declare-fun condMapEmpty!18945 () Bool)

(declare-fun mapDefault!18945 () ValueCell!5431)

