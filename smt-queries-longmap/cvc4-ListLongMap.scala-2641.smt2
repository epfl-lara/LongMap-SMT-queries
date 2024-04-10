; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39668 () Bool)

(assert start!39668)

(declare-fun b_free!9935 () Bool)

(declare-fun b_next!9935 () Bool)

(assert (=> start!39668 (= b_free!9935 (not b_next!9935))))

(declare-fun tp!35333 () Bool)

(declare-fun b_and!17591 () Bool)

(assert (=> start!39668 (= tp!35333 b_and!17591)))

(declare-fun mapIsEmpty!18252 () Bool)

(declare-fun mapRes!18252 () Bool)

(assert (=> mapIsEmpty!18252 mapRes!18252))

(declare-fun b!425855 () Bool)

(declare-fun res!249427 () Bool)

(declare-fun e!252750 () Bool)

(assert (=> b!425855 (=> (not res!249427) (not e!252750))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425855 (= res!249427 (validKeyInArray!0 k!794))))

(declare-fun b!425856 () Bool)

(declare-fun e!252747 () Bool)

(assert (=> b!425856 (= e!252747 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!26013 0))(
  ( (array!26014 (arr!12456 (Array (_ BitVec 32) (_ BitVec 64))) (size!12808 (_ BitVec 32))) )
))
(declare-fun lt!194779 () array!26013)

(declare-datatypes ((V!15887 0))(
  ( (V!15888 (val!5588 Int)) )
))
(declare-datatypes ((ValueCell!5200 0))(
  ( (ValueCellFull!5200 (v!7835 V!15887)) (EmptyCell!5200) )
))
(declare-datatypes ((array!26015 0))(
  ( (array!26016 (arr!12457 (Array (_ BitVec 32) ValueCell!5200)) (size!12809 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26015)

(declare-fun zeroValue!515 () V!15887)

(declare-fun v!412 () V!15887)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26013)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15887)

(declare-fun lt!194781 () array!26015)

(declare-datatypes ((tuple2!7340 0))(
  ( (tuple2!7341 (_1!3681 (_ BitVec 64)) (_2!3681 V!15887)) )
))
(declare-datatypes ((List!7352 0))(
  ( (Nil!7349) (Cons!7348 (h!8204 tuple2!7340) (t!12796 List!7352)) )
))
(declare-datatypes ((ListLongMap!6253 0))(
  ( (ListLongMap!6254 (toList!3142 List!7352)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1346 (array!26013 array!26015 (_ BitVec 32) (_ BitVec 32) V!15887 V!15887 (_ BitVec 32) Int) ListLongMap!6253)

(declare-fun +!1300 (ListLongMap!6253 tuple2!7340) ListLongMap!6253)

(assert (=> b!425856 (= (getCurrentListMapNoExtraKeys!1346 lt!194779 lt!194781 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1300 (getCurrentListMapNoExtraKeys!1346 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7341 k!794 v!412)))))

(declare-datatypes ((Unit!12502 0))(
  ( (Unit!12503) )
))
(declare-fun lt!194783 () Unit!12502)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!495 (array!26013 array!26015 (_ BitVec 32) (_ BitVec 32) V!15887 V!15887 (_ BitVec 32) (_ BitVec 64) V!15887 (_ BitVec 32) Int) Unit!12502)

(assert (=> b!425856 (= lt!194783 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!495 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425857 () Bool)

(declare-fun res!249424 () Bool)

(declare-fun e!252744 () Bool)

(assert (=> b!425857 (=> (not res!249424) (not e!252744))))

(declare-datatypes ((List!7353 0))(
  ( (Nil!7350) (Cons!7349 (h!8205 (_ BitVec 64)) (t!12797 List!7353)) )
))
(declare-fun arrayNoDuplicates!0 (array!26013 (_ BitVec 32) List!7353) Bool)

(assert (=> b!425857 (= res!249424 (arrayNoDuplicates!0 lt!194779 #b00000000000000000000000000000000 Nil!7350))))

(declare-fun b!425858 () Bool)

(declare-fun res!249425 () Bool)

(assert (=> b!425858 (=> (not res!249425) (not e!252750))))

(assert (=> b!425858 (= res!249425 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7350))))

(declare-fun b!425859 () Bool)

(declare-fun res!249428 () Bool)

(assert (=> b!425859 (=> (not res!249428) (not e!252750))))

(assert (=> b!425859 (= res!249428 (and (= (size!12809 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12808 _keys!709) (size!12809 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425860 () Bool)

(declare-fun res!249433 () Bool)

(assert (=> b!425860 (=> (not res!249433) (not e!252744))))

(assert (=> b!425860 (= res!249433 (bvsle from!863 i!563))))

(declare-fun b!425861 () Bool)

(assert (=> b!425861 (= e!252744 e!252747)))

(declare-fun res!249431 () Bool)

(assert (=> b!425861 (=> (not res!249431) (not e!252747))))

(assert (=> b!425861 (= res!249431 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194782 () ListLongMap!6253)

(assert (=> b!425861 (= lt!194782 (getCurrentListMapNoExtraKeys!1346 lt!194779 lt!194781 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425861 (= lt!194781 (array!26016 (store (arr!12457 _values!549) i!563 (ValueCellFull!5200 v!412)) (size!12809 _values!549)))))

(declare-fun lt!194780 () ListLongMap!6253)

(assert (=> b!425861 (= lt!194780 (getCurrentListMapNoExtraKeys!1346 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!249423 () Bool)

(assert (=> start!39668 (=> (not res!249423) (not e!252750))))

(assert (=> start!39668 (= res!249423 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12808 _keys!709))))))

(assert (=> start!39668 e!252750))

(declare-fun tp_is_empty!11087 () Bool)

(assert (=> start!39668 tp_is_empty!11087))

(assert (=> start!39668 tp!35333))

(assert (=> start!39668 true))

(declare-fun e!252748 () Bool)

(declare-fun array_inv!9078 (array!26015) Bool)

(assert (=> start!39668 (and (array_inv!9078 _values!549) e!252748)))

(declare-fun array_inv!9079 (array!26013) Bool)

(assert (=> start!39668 (array_inv!9079 _keys!709)))

(declare-fun b!425862 () Bool)

(declare-fun res!249435 () Bool)

(assert (=> b!425862 (=> (not res!249435) (not e!252750))))

(declare-fun arrayContainsKey!0 (array!26013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425862 (= res!249435 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425863 () Bool)

(declare-fun res!249426 () Bool)

(assert (=> b!425863 (=> (not res!249426) (not e!252750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425863 (= res!249426 (validMask!0 mask!1025))))

(declare-fun b!425864 () Bool)

(assert (=> b!425864 (= e!252750 e!252744)))

(declare-fun res!249432 () Bool)

(assert (=> b!425864 (=> (not res!249432) (not e!252744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26013 (_ BitVec 32)) Bool)

(assert (=> b!425864 (= res!249432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194779 mask!1025))))

(assert (=> b!425864 (= lt!194779 (array!26014 (store (arr!12456 _keys!709) i!563 k!794) (size!12808 _keys!709)))))

(declare-fun b!425865 () Bool)

(declare-fun e!252746 () Bool)

(assert (=> b!425865 (= e!252746 tp_is_empty!11087)))

(declare-fun mapNonEmpty!18252 () Bool)

(declare-fun tp!35334 () Bool)

(declare-fun e!252749 () Bool)

(assert (=> mapNonEmpty!18252 (= mapRes!18252 (and tp!35334 e!252749))))

(declare-fun mapRest!18252 () (Array (_ BitVec 32) ValueCell!5200))

(declare-fun mapKey!18252 () (_ BitVec 32))

(declare-fun mapValue!18252 () ValueCell!5200)

(assert (=> mapNonEmpty!18252 (= (arr!12457 _values!549) (store mapRest!18252 mapKey!18252 mapValue!18252))))

(declare-fun b!425866 () Bool)

(declare-fun res!249429 () Bool)

(assert (=> b!425866 (=> (not res!249429) (not e!252750))))

(assert (=> b!425866 (= res!249429 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12808 _keys!709))))))

(declare-fun b!425867 () Bool)

(declare-fun res!249434 () Bool)

(assert (=> b!425867 (=> (not res!249434) (not e!252750))))

(assert (=> b!425867 (= res!249434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425868 () Bool)

(assert (=> b!425868 (= e!252749 tp_is_empty!11087)))

(declare-fun b!425869 () Bool)

(assert (=> b!425869 (= e!252748 (and e!252746 mapRes!18252))))

(declare-fun condMapEmpty!18252 () Bool)

(declare-fun mapDefault!18252 () ValueCell!5200)

