; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39458 () Bool)

(assert start!39458)

(declare-fun b_free!9739 () Bool)

(declare-fun b_next!9739 () Bool)

(assert (=> start!39458 (= b_free!9739 (not b_next!9739))))

(declare-fun tp!34746 () Bool)

(declare-fun b_and!17327 () Bool)

(assert (=> start!39458 (= tp!34746 b_and!17327)))

(declare-fun b!420817 () Bool)

(declare-fun res!245585 () Bool)

(declare-fun e!250556 () Bool)

(assert (=> b!420817 (=> (not res!245585) (not e!250556))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25615 0))(
  ( (array!25616 (arr!12257 (Array (_ BitVec 32) (_ BitVec 64))) (size!12610 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25615)

(assert (=> b!420817 (= res!245585 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12610 _keys!709))))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!15627 0))(
  ( (V!15628 (val!5490 Int)) )
))
(declare-datatypes ((tuple2!7184 0))(
  ( (tuple2!7185 (_1!3603 (_ BitVec 64)) (_2!3603 V!15627)) )
))
(declare-datatypes ((List!7178 0))(
  ( (Nil!7175) (Cons!7174 (h!8030 tuple2!7184) (t!12573 List!7178)) )
))
(declare-datatypes ((ListLongMap!6087 0))(
  ( (ListLongMap!6088 (toList!3059 List!7178)) )
))
(declare-fun call!29371 () ListLongMap!6087)

(declare-fun call!29370 () ListLongMap!6087)

(declare-fun v!412 () V!15627)

(declare-fun b!420818 () Bool)

(declare-fun e!250555 () Bool)

(declare-fun +!1281 (ListLongMap!6087 tuple2!7184) ListLongMap!6087)

(assert (=> b!420818 (= e!250555 (= call!29370 (+!1281 call!29371 (tuple2!7185 k0!794 v!412))))))

(declare-fun b!420819 () Bool)

(declare-fun e!250559 () Bool)

(declare-fun tp_is_empty!10891 () Bool)

(assert (=> b!420819 (= e!250559 tp_is_empty!10891)))

(declare-fun b!420820 () Bool)

(declare-fun e!250560 () Bool)

(declare-fun e!250553 () Bool)

(assert (=> b!420820 (= e!250560 (not e!250553))))

(declare-fun res!245575 () Bool)

(assert (=> b!420820 (=> res!245575 e!250553)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420820 (= res!245575 (validKeyInArray!0 (select (arr!12257 _keys!709) from!863)))))

(assert (=> b!420820 e!250555))

(declare-fun c!55251 () Bool)

(assert (=> b!420820 (= c!55251 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5102 0))(
  ( (ValueCellFull!5102 (v!7731 V!15627)) (EmptyCell!5102) )
))
(declare-datatypes ((array!25617 0))(
  ( (array!25618 (arr!12258 (Array (_ BitVec 32) ValueCell!5102)) (size!12611 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25617)

(declare-fun zeroValue!515 () V!15627)

(declare-datatypes ((Unit!12408 0))(
  ( (Unit!12409) )
))
(declare-fun lt!193036 () Unit!12408)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!453 (array!25615 array!25617 (_ BitVec 32) (_ BitVec 32) V!15627 V!15627 (_ BitVec 32) (_ BitVec 64) V!15627 (_ BitVec 32) Int) Unit!12408)

(assert (=> b!420820 (= lt!193036 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!453 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420821 () Bool)

(declare-fun res!245574 () Bool)

(assert (=> b!420821 (=> (not res!245574) (not e!250556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25615 (_ BitVec 32)) Bool)

(assert (=> b!420821 (= res!245574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420823 () Bool)

(declare-fun e!250554 () Bool)

(assert (=> b!420823 (= e!250556 e!250554)))

(declare-fun res!245573 () Bool)

(assert (=> b!420823 (=> (not res!245573) (not e!250554))))

(declare-fun lt!193043 () array!25615)

(assert (=> b!420823 (= res!245573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193043 mask!1025))))

(assert (=> b!420823 (= lt!193043 (array!25616 (store (arr!12257 _keys!709) i!563 k0!794) (size!12610 _keys!709)))))

(declare-fun b!420824 () Bool)

(declare-fun res!245582 () Bool)

(assert (=> b!420824 (=> (not res!245582) (not e!250556))))

(declare-datatypes ((List!7179 0))(
  ( (Nil!7176) (Cons!7175 (h!8031 (_ BitVec 64)) (t!12574 List!7179)) )
))
(declare-fun arrayNoDuplicates!0 (array!25615 (_ BitVec 32) List!7179) Bool)

(assert (=> b!420824 (= res!245582 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7176))))

(declare-fun b!420825 () Bool)

(assert (=> b!420825 (= e!250555 (= call!29371 call!29370))))

(declare-fun b!420826 () Bool)

(assert (=> b!420826 (= e!250554 e!250560)))

(declare-fun res!245576 () Bool)

(assert (=> b!420826 (=> (not res!245576) (not e!250560))))

(assert (=> b!420826 (= res!245576 (= from!863 i!563))))

(declare-fun lt!193033 () ListLongMap!6087)

(declare-fun lt!193041 () array!25617)

(declare-fun getCurrentListMapNoExtraKeys!1269 (array!25615 array!25617 (_ BitVec 32) (_ BitVec 32) V!15627 V!15627 (_ BitVec 32) Int) ListLongMap!6087)

(assert (=> b!420826 (= lt!193033 (getCurrentListMapNoExtraKeys!1269 lt!193043 lt!193041 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420826 (= lt!193041 (array!25618 (store (arr!12258 _values!549) i!563 (ValueCellFull!5102 v!412)) (size!12611 _values!549)))))

(declare-fun lt!193039 () ListLongMap!6087)

(assert (=> b!420826 (= lt!193039 (getCurrentListMapNoExtraKeys!1269 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420827 () Bool)

(declare-fun res!245586 () Bool)

(assert (=> b!420827 (=> (not res!245586) (not e!250556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420827 (= res!245586 (validMask!0 mask!1025))))

(declare-fun bm!29367 () Bool)

(assert (=> bm!29367 (= call!29371 (getCurrentListMapNoExtraKeys!1269 (ite c!55251 _keys!709 lt!193043) (ite c!55251 _values!549 lt!193041) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420828 () Bool)

(declare-fun res!245581 () Bool)

(assert (=> b!420828 (=> (not res!245581) (not e!250556))))

(assert (=> b!420828 (= res!245581 (or (= (select (arr!12257 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12257 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29368 () Bool)

(assert (=> bm!29368 (= call!29370 (getCurrentListMapNoExtraKeys!1269 (ite c!55251 lt!193043 _keys!709) (ite c!55251 lt!193041 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245579 () Bool)

(assert (=> start!39458 (=> (not res!245579) (not e!250556))))

(assert (=> start!39458 (= res!245579 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12610 _keys!709))))))

(assert (=> start!39458 e!250556))

(assert (=> start!39458 tp_is_empty!10891))

(assert (=> start!39458 tp!34746))

(assert (=> start!39458 true))

(declare-fun e!250552 () Bool)

(declare-fun array_inv!8974 (array!25617) Bool)

(assert (=> start!39458 (and (array_inv!8974 _values!549) e!250552)))

(declare-fun array_inv!8975 (array!25615) Bool)

(assert (=> start!39458 (array_inv!8975 _keys!709)))

(declare-fun b!420822 () Bool)

(declare-fun res!245578 () Bool)

(assert (=> b!420822 (=> (not res!245578) (not e!250556))))

(assert (=> b!420822 (= res!245578 (and (= (size!12611 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12610 _keys!709) (size!12611 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420829 () Bool)

(declare-fun res!245584 () Bool)

(assert (=> b!420829 (=> (not res!245584) (not e!250556))))

(declare-fun arrayContainsKey!0 (array!25615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420829 (= res!245584 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17958 () Bool)

(declare-fun mapRes!17958 () Bool)

(declare-fun tp!34745 () Bool)

(assert (=> mapNonEmpty!17958 (= mapRes!17958 (and tp!34745 e!250559))))

(declare-fun mapRest!17958 () (Array (_ BitVec 32) ValueCell!5102))

(declare-fun mapKey!17958 () (_ BitVec 32))

(declare-fun mapValue!17958 () ValueCell!5102)

(assert (=> mapNonEmpty!17958 (= (arr!12258 _values!549) (store mapRest!17958 mapKey!17958 mapValue!17958))))

(declare-fun b!420830 () Bool)

(assert (=> b!420830 (= e!250553 true)))

(declare-fun lt!193035 () V!15627)

(declare-fun lt!193034 () ListLongMap!6087)

(declare-fun lt!193037 () tuple2!7184)

(assert (=> b!420830 (= (+!1281 lt!193034 lt!193037) (+!1281 (+!1281 lt!193034 (tuple2!7185 k0!794 lt!193035)) lt!193037))))

(declare-fun lt!193042 () V!15627)

(assert (=> b!420830 (= lt!193037 (tuple2!7185 k0!794 lt!193042))))

(declare-fun lt!193038 () Unit!12408)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!65 (ListLongMap!6087 (_ BitVec 64) V!15627 V!15627) Unit!12408)

(assert (=> b!420830 (= lt!193038 (addSameAsAddTwiceSameKeyDiffValues!65 lt!193034 k0!794 lt!193035 lt!193042))))

(declare-fun lt!193040 () V!15627)

(declare-fun get!6086 (ValueCell!5102 V!15627) V!15627)

(assert (=> b!420830 (= lt!193035 (get!6086 (select (arr!12258 _values!549) from!863) lt!193040))))

(assert (=> b!420830 (= lt!193033 (+!1281 lt!193034 (tuple2!7185 (select (arr!12257 lt!193043) from!863) lt!193042)))))

(assert (=> b!420830 (= lt!193042 (get!6086 (select (store (arr!12258 _values!549) i!563 (ValueCellFull!5102 v!412)) from!863) lt!193040))))

(declare-fun dynLambda!722 (Int (_ BitVec 64)) V!15627)

(assert (=> b!420830 (= lt!193040 (dynLambda!722 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420830 (= lt!193034 (getCurrentListMapNoExtraKeys!1269 lt!193043 lt!193041 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420831 () Bool)

(declare-fun res!245583 () Bool)

(assert (=> b!420831 (=> (not res!245583) (not e!250554))))

(assert (=> b!420831 (= res!245583 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17958 () Bool)

(assert (=> mapIsEmpty!17958 mapRes!17958))

(declare-fun b!420832 () Bool)

(declare-fun res!245577 () Bool)

(assert (=> b!420832 (=> (not res!245577) (not e!250556))))

(assert (=> b!420832 (= res!245577 (validKeyInArray!0 k0!794))))

(declare-fun b!420833 () Bool)

(declare-fun res!245580 () Bool)

(assert (=> b!420833 (=> (not res!245580) (not e!250554))))

(assert (=> b!420833 (= res!245580 (arrayNoDuplicates!0 lt!193043 #b00000000000000000000000000000000 Nil!7176))))

(declare-fun b!420834 () Bool)

(declare-fun e!250557 () Bool)

(assert (=> b!420834 (= e!250552 (and e!250557 mapRes!17958))))

(declare-fun condMapEmpty!17958 () Bool)

(declare-fun mapDefault!17958 () ValueCell!5102)

(assert (=> b!420834 (= condMapEmpty!17958 (= (arr!12258 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5102)) mapDefault!17958)))))

(declare-fun b!420835 () Bool)

(assert (=> b!420835 (= e!250557 tp_is_empty!10891)))

(assert (= (and start!39458 res!245579) b!420827))

(assert (= (and b!420827 res!245586) b!420822))

(assert (= (and b!420822 res!245578) b!420821))

(assert (= (and b!420821 res!245574) b!420824))

(assert (= (and b!420824 res!245582) b!420817))

(assert (= (and b!420817 res!245585) b!420832))

(assert (= (and b!420832 res!245577) b!420828))

(assert (= (and b!420828 res!245581) b!420829))

(assert (= (and b!420829 res!245584) b!420823))

(assert (= (and b!420823 res!245573) b!420833))

(assert (= (and b!420833 res!245580) b!420831))

(assert (= (and b!420831 res!245583) b!420826))

(assert (= (and b!420826 res!245576) b!420820))

(assert (= (and b!420820 c!55251) b!420818))

(assert (= (and b!420820 (not c!55251)) b!420825))

(assert (= (or b!420818 b!420825) bm!29368))

(assert (= (or b!420818 b!420825) bm!29367))

(assert (= (and b!420820 (not res!245575)) b!420830))

(assert (= (and b!420834 condMapEmpty!17958) mapIsEmpty!17958))

(assert (= (and b!420834 (not condMapEmpty!17958)) mapNonEmpty!17958))

(get-info :version)

(assert (= (and mapNonEmpty!17958 ((_ is ValueCellFull!5102) mapValue!17958)) b!420819))

(assert (= (and b!420834 ((_ is ValueCellFull!5102) mapDefault!17958)) b!420835))

(assert (= start!39458 b!420834))

(declare-fun b_lambda!9025 () Bool)

(assert (=> (not b_lambda!9025) (not b!420830)))

(declare-fun t!12572 () Bool)

(declare-fun tb!3353 () Bool)

(assert (=> (and start!39458 (= defaultEntry!557 defaultEntry!557) t!12572) tb!3353))

(declare-fun result!6241 () Bool)

(assert (=> tb!3353 (= result!6241 tp_is_empty!10891)))

(assert (=> b!420830 t!12572))

(declare-fun b_and!17329 () Bool)

(assert (= b_and!17327 (and (=> t!12572 result!6241) b_and!17329)))

(declare-fun m!410055 () Bool)

(assert (=> start!39458 m!410055))

(declare-fun m!410057 () Bool)

(assert (=> start!39458 m!410057))

(declare-fun m!410059 () Bool)

(assert (=> b!420833 m!410059))

(declare-fun m!410061 () Bool)

(assert (=> bm!29368 m!410061))

(declare-fun m!410063 () Bool)

(assert (=> b!420820 m!410063))

(assert (=> b!420820 m!410063))

(declare-fun m!410065 () Bool)

(assert (=> b!420820 m!410065))

(declare-fun m!410067 () Bool)

(assert (=> b!420820 m!410067))

(declare-fun m!410069 () Bool)

(assert (=> bm!29367 m!410069))

(declare-fun m!410071 () Bool)

(assert (=> b!420818 m!410071))

(declare-fun m!410073 () Bool)

(assert (=> b!420821 m!410073))

(declare-fun m!410075 () Bool)

(assert (=> b!420827 m!410075))

(declare-fun m!410077 () Bool)

(assert (=> b!420832 m!410077))

(declare-fun m!410079 () Bool)

(assert (=> mapNonEmpty!17958 m!410079))

(declare-fun m!410081 () Bool)

(assert (=> b!420829 m!410081))

(declare-fun m!410083 () Bool)

(assert (=> b!420824 m!410083))

(declare-fun m!410085 () Bool)

(assert (=> b!420830 m!410085))

(declare-fun m!410087 () Bool)

(assert (=> b!420830 m!410087))

(declare-fun m!410089 () Bool)

(assert (=> b!420830 m!410089))

(declare-fun m!410091 () Bool)

(assert (=> b!420830 m!410091))

(declare-fun m!410093 () Bool)

(assert (=> b!420830 m!410093))

(declare-fun m!410095 () Bool)

(assert (=> b!420830 m!410095))

(declare-fun m!410097 () Bool)

(assert (=> b!420830 m!410097))

(declare-fun m!410099 () Bool)

(assert (=> b!420830 m!410099))

(assert (=> b!420830 m!410099))

(declare-fun m!410101 () Bool)

(assert (=> b!420830 m!410101))

(declare-fun m!410103 () Bool)

(assert (=> b!420830 m!410103))

(declare-fun m!410105 () Bool)

(assert (=> b!420830 m!410105))

(declare-fun m!410107 () Bool)

(assert (=> b!420830 m!410107))

(declare-fun m!410109 () Bool)

(assert (=> b!420830 m!410109))

(assert (=> b!420830 m!410085))

(assert (=> b!420830 m!410093))

(declare-fun m!410111 () Bool)

(assert (=> b!420826 m!410111))

(assert (=> b!420826 m!410109))

(declare-fun m!410113 () Bool)

(assert (=> b!420826 m!410113))

(declare-fun m!410115 () Bool)

(assert (=> b!420828 m!410115))

(declare-fun m!410117 () Bool)

(assert (=> b!420823 m!410117))

(declare-fun m!410119 () Bool)

(assert (=> b!420823 m!410119))

(check-sat (not b!420821) (not bm!29368) (not b!420824) (not start!39458) (not b!420833) (not b!420829) (not b!420830) b_and!17329 (not mapNonEmpty!17958) (not b!420826) (not b_lambda!9025) tp_is_empty!10891 (not bm!29367) (not b!420823) (not b_next!9739) (not b!420820) (not b!420818) (not b!420832) (not b!420827))
(check-sat b_and!17329 (not b_next!9739))
