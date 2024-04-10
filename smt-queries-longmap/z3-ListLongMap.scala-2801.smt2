; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40696 () Bool)

(assert start!40696)

(declare-fun b_free!10707 () Bool)

(declare-fun b_next!10707 () Bool)

(assert (=> start!40696 (= b_free!10707 (not b_next!10707))))

(declare-fun tp!37940 () Bool)

(declare-fun b_and!18715 () Bool)

(assert (=> start!40696 (= tp!37940 b_and!18715)))

(declare-fun b!450119 () Bool)

(declare-fun e!263811 () Bool)

(declare-fun e!263812 () Bool)

(declare-fun mapRes!19701 () Bool)

(assert (=> b!450119 (= e!263811 (and e!263812 mapRes!19701))))

(declare-fun condMapEmpty!19701 () Bool)

(declare-datatypes ((V!17165 0))(
  ( (V!17166 (val!6067 Int)) )
))
(declare-datatypes ((ValueCell!5679 0))(
  ( (ValueCellFull!5679 (v!8322 V!17165)) (EmptyCell!5679) )
))
(declare-datatypes ((array!27897 0))(
  ( (array!27898 (arr!13394 (Array (_ BitVec 32) ValueCell!5679)) (size!13746 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27897)

(declare-fun mapDefault!19701 () ValueCell!5679)

(assert (=> b!450119 (= condMapEmpty!19701 (= (arr!13394 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5679)) mapDefault!19701)))))

(declare-fun b!450120 () Bool)

(declare-fun res!267859 () Bool)

(declare-fun e!263814 () Bool)

(assert (=> b!450120 (=> (not res!267859) (not e!263814))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27899 0))(
  ( (array!27900 (arr!13395 (Array (_ BitVec 32) (_ BitVec 64))) (size!13747 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27899)

(assert (=> b!450120 (= res!267859 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13747 _keys!709))))))

(declare-fun mapNonEmpty!19701 () Bool)

(declare-fun tp!37941 () Bool)

(declare-fun e!263810 () Bool)

(assert (=> mapNonEmpty!19701 (= mapRes!19701 (and tp!37941 e!263810))))

(declare-fun mapValue!19701 () ValueCell!5679)

(declare-fun mapKey!19701 () (_ BitVec 32))

(declare-fun mapRest!19701 () (Array (_ BitVec 32) ValueCell!5679))

(assert (=> mapNonEmpty!19701 (= (arr!13394 _values!549) (store mapRest!19701 mapKey!19701 mapValue!19701))))

(declare-fun b!450121 () Bool)

(declare-fun e!263809 () Bool)

(declare-datatypes ((tuple2!7966 0))(
  ( (tuple2!7967 (_1!3994 (_ BitVec 64)) (_2!3994 V!17165)) )
))
(declare-datatypes ((List!8034 0))(
  ( (Nil!8031) (Cons!8030 (h!8886 tuple2!7966) (t!13796 List!8034)) )
))
(declare-datatypes ((ListLongMap!6879 0))(
  ( (ListLongMap!6880 (toList!3455 List!8034)) )
))
(declare-fun call!29713 () ListLongMap!6879)

(declare-fun call!29714 () ListLongMap!6879)

(assert (=> b!450121 (= e!263809 (= call!29713 call!29714))))

(declare-fun b!450122 () Bool)

(declare-fun e!263816 () Bool)

(assert (=> b!450122 (= e!263816 (not true))))

(assert (=> b!450122 e!263809))

(declare-fun c!55967 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!450122 (= c!55967 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17165)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17165)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17165)

(declare-datatypes ((Unit!13188 0))(
  ( (Unit!13189) )
))
(declare-fun lt!204521 () Unit!13188)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 (array!27899 array!27897 (_ BitVec 32) (_ BitVec 32) V!17165 V!17165 (_ BitVec 32) (_ BitVec 64) V!17165 (_ BitVec 32) Int) Unit!13188)

(assert (=> b!450122 (= lt!204521 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450123 () Bool)

(declare-fun res!267858 () Bool)

(assert (=> b!450123 (=> (not res!267858) (not e!263814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27899 (_ BitVec 32)) Bool)

(assert (=> b!450123 (= res!267858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450124 () Bool)

(declare-fun res!267868 () Bool)

(declare-fun e!263815 () Bool)

(assert (=> b!450124 (=> (not res!267868) (not e!263815))))

(assert (=> b!450124 (= res!267868 (bvsle from!863 i!563))))

(declare-fun b!450125 () Bool)

(declare-fun res!267864 () Bool)

(assert (=> b!450125 (=> (not res!267864) (not e!263814))))

(declare-datatypes ((List!8035 0))(
  ( (Nil!8032) (Cons!8031 (h!8887 (_ BitVec 64)) (t!13797 List!8035)) )
))
(declare-fun arrayNoDuplicates!0 (array!27899 (_ BitVec 32) List!8035) Bool)

(assert (=> b!450125 (= res!267864 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8032))))

(declare-fun b!450126 () Bool)

(declare-fun res!267862 () Bool)

(assert (=> b!450126 (=> (not res!267862) (not e!263814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450126 (= res!267862 (validMask!0 mask!1025))))

(declare-fun b!450127 () Bool)

(declare-fun +!1539 (ListLongMap!6879 tuple2!7966) ListLongMap!6879)

(assert (=> b!450127 (= e!263809 (= call!29714 (+!1539 call!29713 (tuple2!7967 k0!794 v!412))))))

(declare-fun res!267866 () Bool)

(assert (=> start!40696 (=> (not res!267866) (not e!263814))))

(assert (=> start!40696 (= res!267866 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13747 _keys!709))))))

(assert (=> start!40696 e!263814))

(declare-fun tp_is_empty!12045 () Bool)

(assert (=> start!40696 tp_is_empty!12045))

(assert (=> start!40696 tp!37940))

(assert (=> start!40696 true))

(declare-fun array_inv!9700 (array!27897) Bool)

(assert (=> start!40696 (and (array_inv!9700 _values!549) e!263811)))

(declare-fun array_inv!9701 (array!27899) Bool)

(assert (=> start!40696 (array_inv!9701 _keys!709)))

(declare-fun b!450128 () Bool)

(assert (=> b!450128 (= e!263814 e!263815)))

(declare-fun res!267870 () Bool)

(assert (=> b!450128 (=> (not res!267870) (not e!263815))))

(declare-fun lt!204523 () array!27899)

(assert (=> b!450128 (= res!267870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204523 mask!1025))))

(assert (=> b!450128 (= lt!204523 (array!27900 (store (arr!13395 _keys!709) i!563 k0!794) (size!13747 _keys!709)))))

(declare-fun mapIsEmpty!19701 () Bool)

(assert (=> mapIsEmpty!19701 mapRes!19701))

(declare-fun b!450129 () Bool)

(assert (=> b!450129 (= e!263815 e!263816)))

(declare-fun res!267865 () Bool)

(assert (=> b!450129 (=> (not res!267865) (not e!263816))))

(assert (=> b!450129 (= res!267865 (= from!863 i!563))))

(declare-fun lt!204524 () ListLongMap!6879)

(declare-fun lt!204522 () array!27897)

(declare-fun getCurrentListMapNoExtraKeys!1641 (array!27899 array!27897 (_ BitVec 32) (_ BitVec 32) V!17165 V!17165 (_ BitVec 32) Int) ListLongMap!6879)

(assert (=> b!450129 (= lt!204524 (getCurrentListMapNoExtraKeys!1641 lt!204523 lt!204522 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450129 (= lt!204522 (array!27898 (store (arr!13394 _values!549) i!563 (ValueCellFull!5679 v!412)) (size!13746 _values!549)))))

(declare-fun lt!204525 () ListLongMap!6879)

(assert (=> b!450129 (= lt!204525 (getCurrentListMapNoExtraKeys!1641 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450130 () Bool)

(assert (=> b!450130 (= e!263812 tp_is_empty!12045)))

(declare-fun b!450131 () Bool)

(declare-fun res!267867 () Bool)

(assert (=> b!450131 (=> (not res!267867) (not e!263814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450131 (= res!267867 (validKeyInArray!0 k0!794))))

(declare-fun b!450132 () Bool)

(assert (=> b!450132 (= e!263810 tp_is_empty!12045)))

(declare-fun b!450133 () Bool)

(declare-fun res!267863 () Bool)

(assert (=> b!450133 (=> (not res!267863) (not e!263814))))

(declare-fun arrayContainsKey!0 (array!27899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450133 (= res!267863 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450134 () Bool)

(declare-fun res!267869 () Bool)

(assert (=> b!450134 (=> (not res!267869) (not e!263814))))

(assert (=> b!450134 (= res!267869 (or (= (select (arr!13395 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13395 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450135 () Bool)

(declare-fun res!267861 () Bool)

(assert (=> b!450135 (=> (not res!267861) (not e!263815))))

(assert (=> b!450135 (= res!267861 (arrayNoDuplicates!0 lt!204523 #b00000000000000000000000000000000 Nil!8032))))

(declare-fun bm!29710 () Bool)

(assert (=> bm!29710 (= call!29714 (getCurrentListMapNoExtraKeys!1641 (ite c!55967 lt!204523 _keys!709) (ite c!55967 lt!204522 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450136 () Bool)

(declare-fun res!267860 () Bool)

(assert (=> b!450136 (=> (not res!267860) (not e!263814))))

(assert (=> b!450136 (= res!267860 (and (= (size!13746 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13747 _keys!709) (size!13746 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29711 () Bool)

(assert (=> bm!29711 (= call!29713 (getCurrentListMapNoExtraKeys!1641 (ite c!55967 _keys!709 lt!204523) (ite c!55967 _values!549 lt!204522) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40696 res!267866) b!450126))

(assert (= (and b!450126 res!267862) b!450136))

(assert (= (and b!450136 res!267860) b!450123))

(assert (= (and b!450123 res!267858) b!450125))

(assert (= (and b!450125 res!267864) b!450120))

(assert (= (and b!450120 res!267859) b!450131))

(assert (= (and b!450131 res!267867) b!450134))

(assert (= (and b!450134 res!267869) b!450133))

(assert (= (and b!450133 res!267863) b!450128))

(assert (= (and b!450128 res!267870) b!450135))

(assert (= (and b!450135 res!267861) b!450124))

(assert (= (and b!450124 res!267868) b!450129))

(assert (= (and b!450129 res!267865) b!450122))

(assert (= (and b!450122 c!55967) b!450127))

(assert (= (and b!450122 (not c!55967)) b!450121))

(assert (= (or b!450127 b!450121) bm!29710))

(assert (= (or b!450127 b!450121) bm!29711))

(assert (= (and b!450119 condMapEmpty!19701) mapIsEmpty!19701))

(assert (= (and b!450119 (not condMapEmpty!19701)) mapNonEmpty!19701))

(get-info :version)

(assert (= (and mapNonEmpty!19701 ((_ is ValueCellFull!5679) mapValue!19701)) b!450132))

(assert (= (and b!450119 ((_ is ValueCellFull!5679) mapDefault!19701)) b!450130))

(assert (= start!40696 b!450119))

(declare-fun m!434115 () Bool)

(assert (=> b!450127 m!434115))

(declare-fun m!434117 () Bool)

(assert (=> b!450126 m!434117))

(declare-fun m!434119 () Bool)

(assert (=> mapNonEmpty!19701 m!434119))

(declare-fun m!434121 () Bool)

(assert (=> b!450134 m!434121))

(declare-fun m!434123 () Bool)

(assert (=> bm!29711 m!434123))

(declare-fun m!434125 () Bool)

(assert (=> b!450123 m!434125))

(declare-fun m!434127 () Bool)

(assert (=> start!40696 m!434127))

(declare-fun m!434129 () Bool)

(assert (=> start!40696 m!434129))

(declare-fun m!434131 () Bool)

(assert (=> bm!29710 m!434131))

(declare-fun m!434133 () Bool)

(assert (=> b!450135 m!434133))

(declare-fun m!434135 () Bool)

(assert (=> b!450131 m!434135))

(declare-fun m!434137 () Bool)

(assert (=> b!450129 m!434137))

(declare-fun m!434139 () Bool)

(assert (=> b!450129 m!434139))

(declare-fun m!434141 () Bool)

(assert (=> b!450129 m!434141))

(declare-fun m!434143 () Bool)

(assert (=> b!450122 m!434143))

(declare-fun m!434145 () Bool)

(assert (=> b!450125 m!434145))

(declare-fun m!434147 () Bool)

(assert (=> b!450133 m!434147))

(declare-fun m!434149 () Bool)

(assert (=> b!450128 m!434149))

(declare-fun m!434151 () Bool)

(assert (=> b!450128 m!434151))

(check-sat (not bm!29711) (not start!40696) tp_is_empty!12045 (not b!450133) (not b!450131) (not b!450125) (not b!450128) (not b!450122) (not b!450135) b_and!18715 (not b!450129) (not b_next!10707) (not bm!29710) (not b!450126) (not b!450123) (not b!450127) (not mapNonEmpty!19701))
(check-sat b_and!18715 (not b_next!10707))
