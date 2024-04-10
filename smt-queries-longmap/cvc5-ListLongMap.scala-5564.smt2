; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73168 () Bool)

(assert start!73168)

(declare-fun b_free!14083 () Bool)

(declare-fun b_next!14083 () Bool)

(assert (=> start!73168 (= b_free!14083 (not b_next!14083))))

(declare-fun tp!49752 () Bool)

(declare-fun b_and!23325 () Bool)

(assert (=> start!73168 (= tp!49752 b_and!23325)))

(declare-fun b!852105 () Bool)

(declare-fun e!475259 () Bool)

(assert (=> b!852105 (= e!475259 true)))

(declare-datatypes ((V!26673 0))(
  ( (V!26674 (val!8157 Int)) )
))
(declare-datatypes ((tuple2!10708 0))(
  ( (tuple2!10709 (_1!5365 (_ BitVec 64)) (_2!5365 V!26673)) )
))
(declare-fun lt!383892 () tuple2!10708)

(declare-datatypes ((List!16543 0))(
  ( (Nil!16540) (Cons!16539 (h!17670 tuple2!10708) (t!23072 List!16543)) )
))
(declare-datatypes ((ListLongMap!9477 0))(
  ( (ListLongMap!9478 (toList!4754 List!16543)) )
))
(declare-fun lt!383887 () ListLongMap!9477)

(declare-fun lt!383893 () V!26673)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2152 (ListLongMap!9477 tuple2!10708) ListLongMap!9477)

(assert (=> b!852105 (= (+!2152 lt!383887 lt!383892) (+!2152 (+!2152 lt!383887 (tuple2!10709 k!854 lt!383893)) lt!383892))))

(declare-fun lt!383888 () V!26673)

(assert (=> b!852105 (= lt!383892 (tuple2!10709 k!854 lt!383888))))

(declare-datatypes ((Unit!29087 0))(
  ( (Unit!29088) )
))
(declare-fun lt!383891 () Unit!29087)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!281 (ListLongMap!9477 (_ BitVec 64) V!26673 V!26673) Unit!29087)

(assert (=> b!852105 (= lt!383891 (addSameAsAddTwiceSameKeyDiffValues!281 lt!383887 k!854 lt!383893 lt!383888))))

(declare-fun lt!383886 () V!26673)

(declare-datatypes ((ValueCell!7670 0))(
  ( (ValueCellFull!7670 (v!10582 V!26673)) (EmptyCell!7670) )
))
(declare-datatypes ((array!48636 0))(
  ( (array!48637 (arr!23349 (Array (_ BitVec 32) ValueCell!7670)) (size!23789 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48636)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12307 (ValueCell!7670 V!26673) V!26673)

(assert (=> b!852105 (= lt!383893 (get!12307 (select (arr!23349 _values!688) from!1053) lt!383886))))

(declare-datatypes ((array!48638 0))(
  ( (array!48639 (arr!23350 (Array (_ BitVec 32) (_ BitVec 64))) (size!23790 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48638)

(declare-fun lt!383889 () ListLongMap!9477)

(assert (=> b!852105 (= lt!383889 (+!2152 lt!383887 (tuple2!10709 (select (arr!23350 _keys!868) from!1053) lt!383888)))))

(declare-fun v!557 () V!26673)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852105 (= lt!383888 (get!12307 (select (store (arr!23349 _values!688) i!612 (ValueCellFull!7670 v!557)) from!1053) lt!383886))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1035 (Int (_ BitVec 64)) V!26673)

(assert (=> b!852105 (= lt!383886 (dynLambda!1035 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26673)

(declare-fun zeroValue!654 () V!26673)

(declare-fun lt!383890 () array!48636)

(declare-fun getCurrentListMapNoExtraKeys!2736 (array!48638 array!48636 (_ BitVec 32) (_ BitVec 32) V!26673 V!26673 (_ BitVec 32) Int) ListLongMap!9477)

(assert (=> b!852105 (= lt!383887 (getCurrentListMapNoExtraKeys!2736 _keys!868 lt!383890 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852106 () Bool)

(declare-fun e!475264 () Bool)

(assert (=> b!852106 (= e!475264 (not e!475259))))

(declare-fun res!578773 () Bool)

(assert (=> b!852106 (=> res!578773 e!475259)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852106 (= res!578773 (not (validKeyInArray!0 (select (arr!23350 _keys!868) from!1053))))))

(declare-fun e!475257 () Bool)

(assert (=> b!852106 e!475257))

(declare-fun c!91795 () Bool)

(assert (=> b!852106 (= c!91795 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383884 () Unit!29087)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!384 (array!48638 array!48636 (_ BitVec 32) (_ BitVec 32) V!26673 V!26673 (_ BitVec 32) (_ BitVec 64) V!26673 (_ BitVec 32) Int) Unit!29087)

(assert (=> b!852106 (= lt!383884 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!384 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852107 () Bool)

(declare-fun res!578774 () Bool)

(declare-fun e!475262 () Bool)

(assert (=> b!852107 (=> (not res!578774) (not e!475262))))

(assert (=> b!852107 (= res!578774 (and (= (select (arr!23350 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!852108 () Bool)

(declare-fun e!475260 () Bool)

(declare-fun tp_is_empty!16219 () Bool)

(assert (=> b!852108 (= e!475260 tp_is_empty!16219)))

(declare-fun b!852109 () Bool)

(declare-fun res!578775 () Bool)

(assert (=> b!852109 (=> (not res!578775) (not e!475262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48638 (_ BitVec 32)) Bool)

(assert (=> b!852109 (= res!578775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852110 () Bool)

(declare-fun call!38104 () ListLongMap!9477)

(declare-fun call!38105 () ListLongMap!9477)

(assert (=> b!852110 (= e!475257 (= call!38104 (+!2152 call!38105 (tuple2!10709 k!854 v!557))))))

(declare-fun bm!38101 () Bool)

(assert (=> bm!38101 (= call!38104 (getCurrentListMapNoExtraKeys!2736 _keys!868 lt!383890 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852111 () Bool)

(declare-fun res!578776 () Bool)

(assert (=> b!852111 (=> (not res!578776) (not e!475262))))

(assert (=> b!852111 (= res!578776 (and (= (size!23789 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23790 _keys!868) (size!23789 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852112 () Bool)

(assert (=> b!852112 (= e!475262 e!475264)))

(declare-fun res!578768 () Bool)

(assert (=> b!852112 (=> (not res!578768) (not e!475264))))

(assert (=> b!852112 (= res!578768 (= from!1053 i!612))))

(assert (=> b!852112 (= lt!383889 (getCurrentListMapNoExtraKeys!2736 _keys!868 lt!383890 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852112 (= lt!383890 (array!48637 (store (arr!23349 _values!688) i!612 (ValueCellFull!7670 v!557)) (size!23789 _values!688)))))

(declare-fun lt!383885 () ListLongMap!9477)

(assert (=> b!852112 (= lt!383885 (getCurrentListMapNoExtraKeys!2736 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25928 () Bool)

(declare-fun mapRes!25928 () Bool)

(declare-fun tp!49753 () Bool)

(assert (=> mapNonEmpty!25928 (= mapRes!25928 (and tp!49753 e!475260))))

(declare-fun mapValue!25928 () ValueCell!7670)

(declare-fun mapRest!25928 () (Array (_ BitVec 32) ValueCell!7670))

(declare-fun mapKey!25928 () (_ BitVec 32))

(assert (=> mapNonEmpty!25928 (= (arr!23349 _values!688) (store mapRest!25928 mapKey!25928 mapValue!25928))))

(declare-fun mapIsEmpty!25928 () Bool)

(assert (=> mapIsEmpty!25928 mapRes!25928))

(declare-fun b!852113 () Bool)

(declare-fun res!578771 () Bool)

(assert (=> b!852113 (=> (not res!578771) (not e!475262))))

(assert (=> b!852113 (= res!578771 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23790 _keys!868))))))

(declare-fun b!852114 () Bool)

(assert (=> b!852114 (= e!475257 (= call!38104 call!38105))))

(declare-fun b!852115 () Bool)

(declare-fun res!578770 () Bool)

(assert (=> b!852115 (=> (not res!578770) (not e!475262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852115 (= res!578770 (validMask!0 mask!1196))))

(declare-fun res!578777 () Bool)

(assert (=> start!73168 (=> (not res!578777) (not e!475262))))

(assert (=> start!73168 (= res!578777 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23790 _keys!868))))))

(assert (=> start!73168 e!475262))

(assert (=> start!73168 tp_is_empty!16219))

(assert (=> start!73168 true))

(assert (=> start!73168 tp!49752))

(declare-fun array_inv!18518 (array!48638) Bool)

(assert (=> start!73168 (array_inv!18518 _keys!868)))

(declare-fun e!475263 () Bool)

(declare-fun array_inv!18519 (array!48636) Bool)

(assert (=> start!73168 (and (array_inv!18519 _values!688) e!475263)))

(declare-fun bm!38102 () Bool)

(assert (=> bm!38102 (= call!38105 (getCurrentListMapNoExtraKeys!2736 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852116 () Bool)

(declare-fun res!578769 () Bool)

(assert (=> b!852116 (=> (not res!578769) (not e!475262))))

(declare-datatypes ((List!16544 0))(
  ( (Nil!16541) (Cons!16540 (h!17671 (_ BitVec 64)) (t!23073 List!16544)) )
))
(declare-fun arrayNoDuplicates!0 (array!48638 (_ BitVec 32) List!16544) Bool)

(assert (=> b!852116 (= res!578769 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16541))))

(declare-fun b!852117 () Bool)

(declare-fun e!475258 () Bool)

(assert (=> b!852117 (= e!475258 tp_is_empty!16219)))

(declare-fun b!852118 () Bool)

(assert (=> b!852118 (= e!475263 (and e!475258 mapRes!25928))))

(declare-fun condMapEmpty!25928 () Bool)

(declare-fun mapDefault!25928 () ValueCell!7670)

