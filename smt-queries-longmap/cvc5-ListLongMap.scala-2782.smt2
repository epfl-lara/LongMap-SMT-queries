; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40580 () Bool)

(assert start!40580)

(declare-fun b_free!10591 () Bool)

(declare-fun b_next!10591 () Bool)

(assert (=> start!40580 (= b_free!10591 (not b_next!10591))))

(declare-fun tp!37593 () Bool)

(declare-fun b_and!18599 () Bool)

(assert (=> start!40580 (= tp!37593 b_and!18599)))

(declare-fun b!447467 () Bool)

(declare-fun e!262742 () Bool)

(declare-fun tp_is_empty!11929 () Bool)

(assert (=> b!447467 (= e!262742 tp_is_empty!11929)))

(declare-fun mapNonEmpty!19527 () Bool)

(declare-fun mapRes!19527 () Bool)

(declare-fun tp!37592 () Bool)

(declare-fun e!262740 () Bool)

(assert (=> mapNonEmpty!19527 (= mapRes!19527 (and tp!37592 e!262740))))

(declare-fun mapKey!19527 () (_ BitVec 32))

(declare-datatypes ((V!17011 0))(
  ( (V!17012 (val!6009 Int)) )
))
(declare-datatypes ((ValueCell!5621 0))(
  ( (ValueCellFull!5621 (v!8264 V!17011)) (EmptyCell!5621) )
))
(declare-datatypes ((array!27665 0))(
  ( (array!27666 (arr!13278 (Array (_ BitVec 32) ValueCell!5621)) (size!13630 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27665)

(declare-fun mapRest!19527 () (Array (_ BitVec 32) ValueCell!5621))

(declare-fun mapValue!19527 () ValueCell!5621)

(assert (=> mapNonEmpty!19527 (= (arr!13278 _values!549) (store mapRest!19527 mapKey!19527 mapValue!19527))))

(declare-fun b!447468 () Bool)

(declare-fun res!265767 () Bool)

(declare-fun e!262737 () Bool)

(assert (=> b!447468 (=> (not res!265767) (not e!262737))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447468 (= res!265767 (validKeyInArray!0 k!794))))

(declare-fun b!447469 () Bool)

(declare-fun res!265763 () Bool)

(assert (=> b!447469 (=> (not res!265763) (not e!262737))))

(declare-datatypes ((array!27667 0))(
  ( (array!27668 (arr!13279 (Array (_ BitVec 32) (_ BitVec 64))) (size!13631 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27667)

(declare-datatypes ((List!7944 0))(
  ( (Nil!7941) (Cons!7940 (h!8796 (_ BitVec 64)) (t!13706 List!7944)) )
))
(declare-fun arrayNoDuplicates!0 (array!27667 (_ BitVec 32) List!7944) Bool)

(assert (=> b!447469 (= res!265763 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7941))))

(declare-fun mapIsEmpty!19527 () Bool)

(assert (=> mapIsEmpty!19527 mapRes!19527))

(declare-fun b!447471 () Bool)

(assert (=> b!447471 (= e!262740 tp_is_empty!11929)))

(declare-fun b!447472 () Bool)

(declare-fun res!265760 () Bool)

(declare-fun e!262738 () Bool)

(assert (=> b!447472 (=> (not res!265760) (not e!262738))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447472 (= res!265760 (bvsle from!863 i!563))))

(declare-fun b!447473 () Bool)

(assert (=> b!447473 (= e!262738 false)))

(declare-fun lt!203971 () array!27667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17011)

(declare-fun v!412 () V!17011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17011)

(declare-datatypes ((tuple2!7880 0))(
  ( (tuple2!7881 (_1!3951 (_ BitVec 64)) (_2!3951 V!17011)) )
))
(declare-datatypes ((List!7945 0))(
  ( (Nil!7942) (Cons!7941 (h!8797 tuple2!7880) (t!13707 List!7945)) )
))
(declare-datatypes ((ListLongMap!6793 0))(
  ( (ListLongMap!6794 (toList!3412 List!7945)) )
))
(declare-fun lt!203973 () ListLongMap!6793)

(declare-fun getCurrentListMapNoExtraKeys!1598 (array!27667 array!27665 (_ BitVec 32) (_ BitVec 32) V!17011 V!17011 (_ BitVec 32) Int) ListLongMap!6793)

(assert (=> b!447473 (= lt!203973 (getCurrentListMapNoExtraKeys!1598 lt!203971 (array!27666 (store (arr!13278 _values!549) i!563 (ValueCellFull!5621 v!412)) (size!13630 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203972 () ListLongMap!6793)

(assert (=> b!447473 (= lt!203972 (getCurrentListMapNoExtraKeys!1598 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447474 () Bool)

(declare-fun res!265759 () Bool)

(assert (=> b!447474 (=> (not res!265759) (not e!262737))))

(assert (=> b!447474 (= res!265759 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13631 _keys!709))))))

(declare-fun b!447475 () Bool)

(declare-fun res!265766 () Bool)

(assert (=> b!447475 (=> (not res!265766) (not e!262737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447475 (= res!265766 (validMask!0 mask!1025))))

(declare-fun b!447476 () Bool)

(assert (=> b!447476 (= e!262737 e!262738)))

(declare-fun res!265757 () Bool)

(assert (=> b!447476 (=> (not res!265757) (not e!262738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27667 (_ BitVec 32)) Bool)

(assert (=> b!447476 (= res!265757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203971 mask!1025))))

(assert (=> b!447476 (= lt!203971 (array!27668 (store (arr!13279 _keys!709) i!563 k!794) (size!13631 _keys!709)))))

(declare-fun b!447477 () Bool)

(declare-fun e!262739 () Bool)

(assert (=> b!447477 (= e!262739 (and e!262742 mapRes!19527))))

(declare-fun condMapEmpty!19527 () Bool)

(declare-fun mapDefault!19527 () ValueCell!5621)

