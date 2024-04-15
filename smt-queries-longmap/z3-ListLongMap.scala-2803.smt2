; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40692 () Bool)

(assert start!40692)

(declare-fun b_free!10717 () Bool)

(declare-fun b_next!10717 () Bool)

(assert (=> start!40692 (= b_free!10717 (not b_next!10717))))

(declare-fun tp!37971 () Bool)

(declare-fun b_and!18699 () Bool)

(assert (=> start!40692 (= tp!37971 b_and!18699)))

(declare-fun b!450128 () Bool)

(declare-fun res!267945 () Bool)

(declare-fun e!263769 () Bool)

(assert (=> b!450128 (=> (not res!267945) (not e!263769))))

(declare-datatypes ((array!27915 0))(
  ( (array!27916 (arr!13403 (Array (_ BitVec 32) (_ BitVec 64))) (size!13756 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27915)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450128 (= res!267945 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450129 () Bool)

(declare-fun e!263765 () Bool)

(assert (=> b!450129 (= e!263769 e!263765)))

(declare-fun res!267944 () Bool)

(assert (=> b!450129 (=> (not res!267944) (not e!263765))))

(declare-fun lt!204366 () array!27915)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27915 (_ BitVec 32)) Bool)

(assert (=> b!450129 (= res!267944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204366 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450129 (= lt!204366 (array!27916 (store (arr!13403 _keys!709) i!563 k0!794) (size!13756 _keys!709)))))

(declare-datatypes ((V!17179 0))(
  ( (V!17180 (val!6072 Int)) )
))
(declare-datatypes ((tuple2!7988 0))(
  ( (tuple2!7989 (_1!4005 (_ BitVec 64)) (_2!4005 V!17179)) )
))
(declare-datatypes ((List!8053 0))(
  ( (Nil!8050) (Cons!8049 (h!8905 tuple2!7988) (t!13806 List!8053)) )
))
(declare-datatypes ((ListLongMap!6891 0))(
  ( (ListLongMap!6892 (toList!3461 List!8053)) )
))
(declare-fun call!29719 () ListLongMap!6891)

(declare-fun b!450130 () Bool)

(declare-fun e!263764 () Bool)

(declare-fun call!29718 () ListLongMap!6891)

(declare-fun v!412 () V!17179)

(declare-fun +!1567 (ListLongMap!6891 tuple2!7988) ListLongMap!6891)

(assert (=> b!450130 (= e!263764 (= call!29719 (+!1567 call!29718 (tuple2!7989 k0!794 v!412))))))

(declare-fun b!450131 () Bool)

(declare-fun e!263770 () Bool)

(assert (=> b!450131 (= e!263765 e!263770)))

(declare-fun res!267943 () Bool)

(assert (=> b!450131 (=> (not res!267943) (not e!263770))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!450131 (= res!267943 (= from!863 i!563))))

(declare-fun minValue!515 () V!17179)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204365 () ListLongMap!6891)

(declare-fun zeroValue!515 () V!17179)

(declare-datatypes ((ValueCell!5684 0))(
  ( (ValueCellFull!5684 (v!8321 V!17179)) (EmptyCell!5684) )
))
(declare-datatypes ((array!27917 0))(
  ( (array!27918 (arr!13404 (Array (_ BitVec 32) ValueCell!5684)) (size!13757 (_ BitVec 32))) )
))
(declare-fun lt!204364 () array!27917)

(declare-fun getCurrentListMapNoExtraKeys!1659 (array!27915 array!27917 (_ BitVec 32) (_ BitVec 32) V!17179 V!17179 (_ BitVec 32) Int) ListLongMap!6891)

(assert (=> b!450131 (= lt!204365 (getCurrentListMapNoExtraKeys!1659 lt!204366 lt!204364 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27917)

(assert (=> b!450131 (= lt!204364 (array!27918 (store (arr!13404 _values!549) i!563 (ValueCellFull!5684 v!412)) (size!13757 _values!549)))))

(declare-fun lt!204362 () ListLongMap!6891)

(assert (=> b!450131 (= lt!204362 (getCurrentListMapNoExtraKeys!1659 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun c!55911 () Bool)

(declare-fun bm!29715 () Bool)

(assert (=> bm!29715 (= call!29718 (getCurrentListMapNoExtraKeys!1659 (ite c!55911 _keys!709 lt!204366) (ite c!55911 _values!549 lt!204364) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450132 () Bool)

(assert (=> b!450132 (= e!263764 (= call!29718 call!29719))))

(declare-fun b!450133 () Bool)

(declare-fun res!267942 () Bool)

(assert (=> b!450133 (=> (not res!267942) (not e!263769))))

(declare-datatypes ((List!8054 0))(
  ( (Nil!8051) (Cons!8050 (h!8906 (_ BitVec 64)) (t!13807 List!8054)) )
))
(declare-fun arrayNoDuplicates!0 (array!27915 (_ BitVec 32) List!8054) Bool)

(assert (=> b!450133 (= res!267942 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8051))))

(declare-fun b!450134 () Bool)

(declare-fun res!267940 () Bool)

(assert (=> b!450134 (=> (not res!267940) (not e!263765))))

(assert (=> b!450134 (= res!267940 (arrayNoDuplicates!0 lt!204366 #b00000000000000000000000000000000 Nil!8051))))

(declare-fun b!450135 () Bool)

(declare-fun res!267934 () Bool)

(assert (=> b!450135 (=> (not res!267934) (not e!263765))))

(assert (=> b!450135 (= res!267934 (bvsle from!863 i!563))))

(declare-fun b!450136 () Bool)

(assert (=> b!450136 (= e!263770 (not true))))

(assert (=> b!450136 e!263764))

(assert (=> b!450136 (= c!55911 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13151 0))(
  ( (Unit!13152) )
))
(declare-fun lt!204363 () Unit!13151)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!703 (array!27915 array!27917 (_ BitVec 32) (_ BitVec 32) V!17179 V!17179 (_ BitVec 32) (_ BitVec 64) V!17179 (_ BitVec 32) Int) Unit!13151)

(assert (=> b!450136 (= lt!204363 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!703 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450137 () Bool)

(declare-fun res!267937 () Bool)

(assert (=> b!450137 (=> (not res!267937) (not e!263769))))

(assert (=> b!450137 (= res!267937 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13756 _keys!709))))))

(declare-fun b!450127 () Bool)

(declare-fun res!267933 () Bool)

(assert (=> b!450127 (=> (not res!267933) (not e!263769))))

(assert (=> b!450127 (= res!267933 (and (= (size!13757 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13756 _keys!709) (size!13757 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!267938 () Bool)

(assert (=> start!40692 (=> (not res!267938) (not e!263769))))

(assert (=> start!40692 (= res!267938 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13756 _keys!709))))))

(assert (=> start!40692 e!263769))

(declare-fun tp_is_empty!12055 () Bool)

(assert (=> start!40692 tp_is_empty!12055))

(assert (=> start!40692 tp!37971))

(assert (=> start!40692 true))

(declare-fun e!263766 () Bool)

(declare-fun array_inv!9770 (array!27917) Bool)

(assert (=> start!40692 (and (array_inv!9770 _values!549) e!263766)))

(declare-fun array_inv!9771 (array!27915) Bool)

(assert (=> start!40692 (array_inv!9771 _keys!709)))

(declare-fun b!450138 () Bool)

(declare-fun e!263771 () Bool)

(assert (=> b!450138 (= e!263771 tp_is_empty!12055)))

(declare-fun b!450139 () Bool)

(declare-fun res!267939 () Bool)

(assert (=> b!450139 (=> (not res!267939) (not e!263769))))

(assert (=> b!450139 (= res!267939 (or (= (select (arr!13403 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13403 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450140 () Bool)

(declare-fun e!263767 () Bool)

(assert (=> b!450140 (= e!263767 tp_is_empty!12055)))

(declare-fun b!450141 () Bool)

(declare-fun mapRes!19716 () Bool)

(assert (=> b!450141 (= e!263766 (and e!263767 mapRes!19716))))

(declare-fun condMapEmpty!19716 () Bool)

(declare-fun mapDefault!19716 () ValueCell!5684)

(assert (=> b!450141 (= condMapEmpty!19716 (= (arr!13404 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5684)) mapDefault!19716)))))

(declare-fun b!450142 () Bool)

(declare-fun res!267935 () Bool)

(assert (=> b!450142 (=> (not res!267935) (not e!263769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450142 (= res!267935 (validKeyInArray!0 k0!794))))

(declare-fun bm!29716 () Bool)

(assert (=> bm!29716 (= call!29719 (getCurrentListMapNoExtraKeys!1659 (ite c!55911 lt!204366 _keys!709) (ite c!55911 lt!204364 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450143 () Bool)

(declare-fun res!267941 () Bool)

(assert (=> b!450143 (=> (not res!267941) (not e!263769))))

(assert (=> b!450143 (= res!267941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19716 () Bool)

(declare-fun tp!37970 () Bool)

(assert (=> mapNonEmpty!19716 (= mapRes!19716 (and tp!37970 e!263771))))

(declare-fun mapKey!19716 () (_ BitVec 32))

(declare-fun mapRest!19716 () (Array (_ BitVec 32) ValueCell!5684))

(declare-fun mapValue!19716 () ValueCell!5684)

(assert (=> mapNonEmpty!19716 (= (arr!13404 _values!549) (store mapRest!19716 mapKey!19716 mapValue!19716))))

(declare-fun b!450144 () Bool)

(declare-fun res!267936 () Bool)

(assert (=> b!450144 (=> (not res!267936) (not e!263769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450144 (= res!267936 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19716 () Bool)

(assert (=> mapIsEmpty!19716 mapRes!19716))

(assert (= (and start!40692 res!267938) b!450144))

(assert (= (and b!450144 res!267936) b!450127))

(assert (= (and b!450127 res!267933) b!450143))

(assert (= (and b!450143 res!267941) b!450133))

(assert (= (and b!450133 res!267942) b!450137))

(assert (= (and b!450137 res!267937) b!450142))

(assert (= (and b!450142 res!267935) b!450139))

(assert (= (and b!450139 res!267939) b!450128))

(assert (= (and b!450128 res!267945) b!450129))

(assert (= (and b!450129 res!267944) b!450134))

(assert (= (and b!450134 res!267940) b!450135))

(assert (= (and b!450135 res!267934) b!450131))

(assert (= (and b!450131 res!267943) b!450136))

(assert (= (and b!450136 c!55911) b!450130))

(assert (= (and b!450136 (not c!55911)) b!450132))

(assert (= (or b!450130 b!450132) bm!29716))

(assert (= (or b!450130 b!450132) bm!29715))

(assert (= (and b!450141 condMapEmpty!19716) mapIsEmpty!19716))

(assert (= (and b!450141 (not condMapEmpty!19716)) mapNonEmpty!19716))

(get-info :version)

(assert (= (and mapNonEmpty!19716 ((_ is ValueCellFull!5684) mapValue!19716)) b!450138))

(assert (= (and b!450141 ((_ is ValueCellFull!5684) mapDefault!19716)) b!450140))

(assert (= start!40692 b!450141))

(declare-fun m!433585 () Bool)

(assert (=> b!450129 m!433585))

(declare-fun m!433587 () Bool)

(assert (=> b!450129 m!433587))

(declare-fun m!433589 () Bool)

(assert (=> start!40692 m!433589))

(declare-fun m!433591 () Bool)

(assert (=> start!40692 m!433591))

(declare-fun m!433593 () Bool)

(assert (=> b!450133 m!433593))

(declare-fun m!433595 () Bool)

(assert (=> b!450142 m!433595))

(declare-fun m!433597 () Bool)

(assert (=> b!450131 m!433597))

(declare-fun m!433599 () Bool)

(assert (=> b!450131 m!433599))

(declare-fun m!433601 () Bool)

(assert (=> b!450131 m!433601))

(declare-fun m!433603 () Bool)

(assert (=> b!450134 m!433603))

(declare-fun m!433605 () Bool)

(assert (=> b!450128 m!433605))

(declare-fun m!433607 () Bool)

(assert (=> b!450136 m!433607))

(declare-fun m!433609 () Bool)

(assert (=> bm!29715 m!433609))

(declare-fun m!433611 () Bool)

(assert (=> b!450130 m!433611))

(declare-fun m!433613 () Bool)

(assert (=> mapNonEmpty!19716 m!433613))

(declare-fun m!433615 () Bool)

(assert (=> b!450139 m!433615))

(declare-fun m!433617 () Bool)

(assert (=> b!450143 m!433617))

(declare-fun m!433619 () Bool)

(assert (=> b!450144 m!433619))

(declare-fun m!433621 () Bool)

(assert (=> bm!29716 m!433621))

(check-sat (not bm!29716) (not b!450133) (not b!450136) (not b!450131) (not b_next!10717) tp_is_empty!12055 (not b!450144) b_and!18699 (not start!40692) (not b!450142) (not b!450130) (not b!450134) (not bm!29715) (not mapNonEmpty!19716) (not b!450128) (not b!450129) (not b!450143))
(check-sat b_and!18699 (not b_next!10717))
