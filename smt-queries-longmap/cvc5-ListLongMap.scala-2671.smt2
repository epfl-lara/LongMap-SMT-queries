; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39844 () Bool)

(assert start!39844)

(declare-fun b_free!10111 () Bool)

(declare-fun b_next!10111 () Bool)

(assert (=> start!39844 (= b_free!10111 (not b_next!10111))))

(declare-fun tp!35861 () Bool)

(declare-fun b_and!17881 () Bool)

(assert (=> start!39844 (= tp!35861 b_and!17881)))

(declare-fun mapNonEmpty!18516 () Bool)

(declare-fun mapRes!18516 () Bool)

(declare-fun tp!35862 () Bool)

(declare-fun e!254930 () Bool)

(assert (=> mapNonEmpty!18516 (= mapRes!18516 (and tp!35862 e!254930))))

(declare-datatypes ((V!16123 0))(
  ( (V!16124 (val!5676 Int)) )
))
(declare-datatypes ((ValueCell!5288 0))(
  ( (ValueCellFull!5288 (v!7923 V!16123)) (EmptyCell!5288) )
))
(declare-fun mapRest!18516 () (Array (_ BitVec 32) ValueCell!5288))

(declare-fun mapValue!18516 () ValueCell!5288)

(declare-fun mapKey!18516 () (_ BitVec 32))

(declare-datatypes ((array!26361 0))(
  ( (array!26362 (arr!12630 (Array (_ BitVec 32) ValueCell!5288)) (size!12982 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26361)

(assert (=> mapNonEmpty!18516 (= (arr!12630 _values!549) (store mapRest!18516 mapKey!18516 mapValue!18516))))

(declare-fun b!430642 () Bool)

(declare-fun res!253074 () Bool)

(declare-fun e!254927 () Bool)

(assert (=> b!430642 (=> (not res!253074) (not e!254927))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430642 (= res!253074 (validMask!0 mask!1025))))

(declare-fun b!430643 () Bool)

(declare-fun res!253072 () Bool)

(assert (=> b!430643 (=> (not res!253072) (not e!254927))))

(declare-datatypes ((array!26363 0))(
  ( (array!26364 (arr!12631 (Array (_ BitVec 32) (_ BitVec 64))) (size!12983 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26363)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!430643 (= res!253072 (and (= (size!12982 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12983 _keys!709) (size!12982 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430644 () Bool)

(declare-fun e!254928 () Bool)

(declare-fun e!254929 () Bool)

(assert (=> b!430644 (= e!254928 (not e!254929))))

(declare-fun res!253073 () Bool)

(assert (=> b!430644 (=> res!253073 e!254929)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430644 (= res!253073 (not (validKeyInArray!0 (select (arr!12631 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7478 0))(
  ( (tuple2!7479 (_1!3750 (_ BitVec 64)) (_2!3750 V!16123)) )
))
(declare-datatypes ((List!7496 0))(
  ( (Nil!7493) (Cons!7492 (h!8348 tuple2!7478) (t!13056 List!7496)) )
))
(declare-datatypes ((ListLongMap!6391 0))(
  ( (ListLongMap!6392 (toList!3211 List!7496)) )
))
(declare-fun lt!197010 () ListLongMap!6391)

(declare-fun lt!197007 () ListLongMap!6391)

(assert (=> b!430644 (= lt!197010 lt!197007)))

(declare-fun lt!197005 () ListLongMap!6391)

(declare-fun lt!197001 () tuple2!7478)

(declare-fun +!1360 (ListLongMap!6391 tuple2!7478) ListLongMap!6391)

(assert (=> b!430644 (= lt!197007 (+!1360 lt!197005 lt!197001))))

(declare-fun minValue!515 () V!16123)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16123)

(declare-fun lt!197009 () array!26361)

(declare-fun lt!197004 () array!26363)

(declare-fun getCurrentListMapNoExtraKeys!1412 (array!26363 array!26361 (_ BitVec 32) (_ BitVec 32) V!16123 V!16123 (_ BitVec 32) Int) ListLongMap!6391)

(assert (=> b!430644 (= lt!197010 (getCurrentListMapNoExtraKeys!1412 lt!197004 lt!197009 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16123)

(assert (=> b!430644 (= lt!197001 (tuple2!7479 k!794 v!412))))

(assert (=> b!430644 (= lt!197005 (getCurrentListMapNoExtraKeys!1412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12680 0))(
  ( (Unit!12681) )
))
(declare-fun lt!197014 () Unit!12680)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!548 (array!26363 array!26361 (_ BitVec 32) (_ BitVec 32) V!16123 V!16123 (_ BitVec 32) (_ BitVec 64) V!16123 (_ BitVec 32) Int) Unit!12680)

(assert (=> b!430644 (= lt!197014 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!548 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18516 () Bool)

(assert (=> mapIsEmpty!18516 mapRes!18516))

(declare-fun b!430645 () Bool)

(declare-fun tp_is_empty!11263 () Bool)

(assert (=> b!430645 (= e!254930 tp_is_empty!11263)))

(declare-fun b!430647 () Bool)

(declare-fun res!253069 () Bool)

(assert (=> b!430647 (=> (not res!253069) (not e!254927))))

(declare-fun arrayContainsKey!0 (array!26363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430647 (= res!253069 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!430648 () Bool)

(declare-fun res!253070 () Bool)

(assert (=> b!430648 (=> (not res!253070) (not e!254927))))

(assert (=> b!430648 (= res!253070 (validKeyInArray!0 k!794))))

(declare-fun b!430649 () Bool)

(declare-fun e!254926 () Bool)

(assert (=> b!430649 (= e!254926 true)))

(declare-fun lt!197012 () ListLongMap!6391)

(declare-fun lt!197015 () tuple2!7478)

(assert (=> b!430649 (= lt!197012 (+!1360 (+!1360 lt!197005 lt!197015) lt!197001))))

(declare-fun lt!197008 () V!16123)

(declare-fun lt!197013 () Unit!12680)

(declare-fun addCommutativeForDiffKeys!355 (ListLongMap!6391 (_ BitVec 64) V!16123 (_ BitVec 64) V!16123) Unit!12680)

(assert (=> b!430649 (= lt!197013 (addCommutativeForDiffKeys!355 lt!197005 k!794 v!412 (select (arr!12631 _keys!709) from!863) lt!197008))))

(declare-fun b!430650 () Bool)

(declare-fun res!253078 () Bool)

(assert (=> b!430650 (=> (not res!253078) (not e!254927))))

(declare-datatypes ((List!7497 0))(
  ( (Nil!7494) (Cons!7493 (h!8349 (_ BitVec 64)) (t!13057 List!7497)) )
))
(declare-fun arrayNoDuplicates!0 (array!26363 (_ BitVec 32) List!7497) Bool)

(assert (=> b!430650 (= res!253078 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7494))))

(declare-fun b!430651 () Bool)

(declare-fun res!253079 () Bool)

(declare-fun e!254924 () Bool)

(assert (=> b!430651 (=> (not res!253079) (not e!254924))))

(assert (=> b!430651 (= res!253079 (bvsle from!863 i!563))))

(declare-fun b!430652 () Bool)

(assert (=> b!430652 (= e!254927 e!254924)))

(declare-fun res!253068 () Bool)

(assert (=> b!430652 (=> (not res!253068) (not e!254924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26363 (_ BitVec 32)) Bool)

(assert (=> b!430652 (= res!253068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197004 mask!1025))))

(assert (=> b!430652 (= lt!197004 (array!26364 (store (arr!12631 _keys!709) i!563 k!794) (size!12983 _keys!709)))))

(declare-fun b!430653 () Bool)

(declare-fun e!254922 () Unit!12680)

(declare-fun Unit!12682 () Unit!12680)

(assert (=> b!430653 (= e!254922 Unit!12682)))

(declare-fun b!430654 () Bool)

(assert (=> b!430654 (= e!254924 e!254928)))

(declare-fun res!253077 () Bool)

(assert (=> b!430654 (=> (not res!253077) (not e!254928))))

(assert (=> b!430654 (= res!253077 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197003 () ListLongMap!6391)

(assert (=> b!430654 (= lt!197003 (getCurrentListMapNoExtraKeys!1412 lt!197004 lt!197009 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430654 (= lt!197009 (array!26362 (store (arr!12630 _values!549) i!563 (ValueCellFull!5288 v!412)) (size!12982 _values!549)))))

(declare-fun lt!197002 () ListLongMap!6391)

(assert (=> b!430654 (= lt!197002 (getCurrentListMapNoExtraKeys!1412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430655 () Bool)

(declare-fun res!253075 () Bool)

(assert (=> b!430655 (=> (not res!253075) (not e!254927))))

(assert (=> b!430655 (= res!253075 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12983 _keys!709))))))

(declare-fun b!430646 () Bool)

(declare-fun res!253067 () Bool)

(assert (=> b!430646 (=> (not res!253067) (not e!254924))))

(assert (=> b!430646 (= res!253067 (arrayNoDuplicates!0 lt!197004 #b00000000000000000000000000000000 Nil!7494))))

(declare-fun res!253071 () Bool)

(assert (=> start!39844 (=> (not res!253071) (not e!254927))))

(assert (=> start!39844 (= res!253071 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12983 _keys!709))))))

(assert (=> start!39844 e!254927))

(assert (=> start!39844 tp_is_empty!11263))

(assert (=> start!39844 tp!35861))

(assert (=> start!39844 true))

(declare-fun e!254925 () Bool)

(declare-fun array_inv!9196 (array!26361) Bool)

(assert (=> start!39844 (and (array_inv!9196 _values!549) e!254925)))

(declare-fun array_inv!9197 (array!26363) Bool)

(assert (=> start!39844 (array_inv!9197 _keys!709)))

(declare-fun b!430656 () Bool)

(declare-fun res!253076 () Bool)

(assert (=> b!430656 (=> (not res!253076) (not e!254927))))

(assert (=> b!430656 (= res!253076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430657 () Bool)

(declare-fun res!253066 () Bool)

(assert (=> b!430657 (=> (not res!253066) (not e!254927))))

(assert (=> b!430657 (= res!253066 (or (= (select (arr!12631 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12631 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430658 () Bool)

(declare-fun e!254931 () Bool)

(assert (=> b!430658 (= e!254925 (and e!254931 mapRes!18516))))

(declare-fun condMapEmpty!18516 () Bool)

(declare-fun mapDefault!18516 () ValueCell!5288)

