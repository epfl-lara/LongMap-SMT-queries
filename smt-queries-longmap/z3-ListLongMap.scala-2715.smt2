; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40094 () Bool)

(assert start!40094)

(declare-fun b_free!10375 () Bool)

(declare-fun b_next!10375 () Bool)

(assert (=> start!40094 (= b_free!10375 (not b_next!10375))))

(declare-fun tp!36654 () Bool)

(declare-fun b_and!18317 () Bool)

(assert (=> start!40094 (= tp!36654 b_and!18317)))

(declare-fun b!438085 () Bool)

(declare-fun e!258407 () Bool)

(declare-fun tp_is_empty!11527 () Bool)

(assert (=> b!438085 (= e!258407 tp_is_empty!11527)))

(declare-fun b!438086 () Bool)

(declare-fun res!258681 () Bool)

(declare-fun e!258405 () Bool)

(assert (=> b!438086 (=> (not res!258681) (not e!258405))))

(declare-datatypes ((array!26873 0))(
  ( (array!26874 (arr!12886 (Array (_ BitVec 32) (_ BitVec 64))) (size!13239 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26873)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26873 (_ BitVec 32)) Bool)

(assert (=> b!438086 (= res!258681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18912 () Bool)

(declare-fun mapRes!18912 () Bool)

(assert (=> mapIsEmpty!18912 mapRes!18912))

(declare-fun b!438087 () Bool)

(declare-fun res!258679 () Bool)

(assert (=> b!438087 (=> (not res!258679) (not e!258405))))

(declare-datatypes ((List!7709 0))(
  ( (Nil!7706) (Cons!7705 (h!8561 (_ BitVec 64)) (t!13456 List!7709)) )
))
(declare-fun arrayNoDuplicates!0 (array!26873 (_ BitVec 32) List!7709) Bool)

(assert (=> b!438087 (= res!258679 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7706))))

(declare-fun b!438088 () Bool)

(declare-fun res!258685 () Bool)

(assert (=> b!438088 (=> (not res!258685) (not e!258405))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438088 (= res!258685 (or (= (select (arr!12886 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12886 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438089 () Bool)

(declare-fun res!258682 () Bool)

(assert (=> b!438089 (=> (not res!258682) (not e!258405))))

(assert (=> b!438089 (= res!258682 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13239 _keys!709))))))

(declare-fun b!438090 () Bool)

(declare-fun e!258410 () Bool)

(assert (=> b!438090 (= e!258410 tp_is_empty!11527)))

(declare-fun b!438091 () Bool)

(declare-fun res!258675 () Bool)

(assert (=> b!438091 (=> (not res!258675) (not e!258405))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438091 (= res!258675 (validKeyInArray!0 k0!794))))

(declare-fun b!438092 () Bool)

(declare-fun e!258411 () Bool)

(assert (=> b!438092 (= e!258411 (and e!258410 mapRes!18912))))

(declare-fun condMapEmpty!18912 () Bool)

(declare-datatypes ((V!16475 0))(
  ( (V!16476 (val!5808 Int)) )
))
(declare-datatypes ((ValueCell!5420 0))(
  ( (ValueCellFull!5420 (v!8049 V!16475)) (EmptyCell!5420) )
))
(declare-datatypes ((array!26875 0))(
  ( (array!26876 (arr!12887 (Array (_ BitVec 32) ValueCell!5420)) (size!13240 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26875)

(declare-fun mapDefault!18912 () ValueCell!5420)

(assert (=> b!438092 (= condMapEmpty!18912 (= (arr!12887 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5420)) mapDefault!18912)))))

(declare-fun res!258684 () Bool)

(assert (=> start!40094 (=> (not res!258684) (not e!258405))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40094 (= res!258684 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13239 _keys!709))))))

(assert (=> start!40094 e!258405))

(assert (=> start!40094 tp_is_empty!11527))

(assert (=> start!40094 tp!36654))

(assert (=> start!40094 true))

(declare-fun array_inv!9408 (array!26875) Bool)

(assert (=> start!40094 (and (array_inv!9408 _values!549) e!258411)))

(declare-fun array_inv!9409 (array!26873) Bool)

(assert (=> start!40094 (array_inv!9409 _keys!709)))

(declare-fun b!438093 () Bool)

(declare-fun res!258686 () Bool)

(assert (=> b!438093 (=> (not res!258686) (not e!258405))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!438093 (= res!258686 (and (= (size!13240 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13239 _keys!709) (size!13240 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438094 () Bool)

(declare-fun e!258408 () Bool)

(assert (=> b!438094 (= e!258405 e!258408)))

(declare-fun res!258687 () Bool)

(assert (=> b!438094 (=> (not res!258687) (not e!258408))))

(declare-fun lt!201701 () array!26873)

(assert (=> b!438094 (= res!258687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201701 mask!1025))))

(assert (=> b!438094 (= lt!201701 (array!26874 (store (arr!12886 _keys!709) i!563 k0!794) (size!13239 _keys!709)))))

(declare-fun b!438095 () Bool)

(declare-fun res!258680 () Bool)

(assert (=> b!438095 (=> (not res!258680) (not e!258408))))

(assert (=> b!438095 (= res!258680 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18912 () Bool)

(declare-fun tp!36653 () Bool)

(assert (=> mapNonEmpty!18912 (= mapRes!18912 (and tp!36653 e!258407))))

(declare-fun mapValue!18912 () ValueCell!5420)

(declare-fun mapKey!18912 () (_ BitVec 32))

(declare-fun mapRest!18912 () (Array (_ BitVec 32) ValueCell!5420))

(assert (=> mapNonEmpty!18912 (= (arr!12887 _values!549) (store mapRest!18912 mapKey!18912 mapValue!18912))))

(declare-fun b!438096 () Bool)

(declare-fun res!258678 () Bool)

(assert (=> b!438096 (=> (not res!258678) (not e!258408))))

(assert (=> b!438096 (= res!258678 (arrayNoDuplicates!0 lt!201701 #b00000000000000000000000000000000 Nil!7706))))

(declare-fun b!438097 () Bool)

(declare-fun e!258406 () Bool)

(assert (=> b!438097 (= e!258408 e!258406)))

(declare-fun res!258677 () Bool)

(assert (=> b!438097 (=> (not res!258677) (not e!258406))))

(assert (=> b!438097 (= res!258677 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201700 () array!26875)

(declare-fun minValue!515 () V!16475)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16475)

(declare-datatypes ((tuple2!7722 0))(
  ( (tuple2!7723 (_1!3872 (_ BitVec 64)) (_2!3872 V!16475)) )
))
(declare-datatypes ((List!7710 0))(
  ( (Nil!7707) (Cons!7706 (h!8562 tuple2!7722) (t!13457 List!7710)) )
))
(declare-datatypes ((ListLongMap!6625 0))(
  ( (ListLongMap!6626 (toList!3328 List!7710)) )
))
(declare-fun lt!201698 () ListLongMap!6625)

(declare-fun getCurrentListMapNoExtraKeys!1527 (array!26873 array!26875 (_ BitVec 32) (_ BitVec 32) V!16475 V!16475 (_ BitVec 32) Int) ListLongMap!6625)

(assert (=> b!438097 (= lt!201698 (getCurrentListMapNoExtraKeys!1527 lt!201701 lt!201700 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16475)

(assert (=> b!438097 (= lt!201700 (array!26876 (store (arr!12887 _values!549) i!563 (ValueCellFull!5420 v!412)) (size!13240 _values!549)))))

(declare-fun lt!201697 () ListLongMap!6625)

(assert (=> b!438097 (= lt!201697 (getCurrentListMapNoExtraKeys!1527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438098 () Bool)

(assert (=> b!438098 (= e!258406 (not true))))

(declare-fun +!1498 (ListLongMap!6625 tuple2!7722) ListLongMap!6625)

(assert (=> b!438098 (= (getCurrentListMapNoExtraKeys!1527 lt!201701 lt!201700 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1498 (getCurrentListMapNoExtraKeys!1527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7723 k0!794 v!412)))))

(declare-datatypes ((Unit!13013 0))(
  ( (Unit!13014) )
))
(declare-fun lt!201699 () Unit!13013)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!636 (array!26873 array!26875 (_ BitVec 32) (_ BitVec 32) V!16475 V!16475 (_ BitVec 32) (_ BitVec 64) V!16475 (_ BitVec 32) Int) Unit!13013)

(assert (=> b!438098 (= lt!201699 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!636 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438099 () Bool)

(declare-fun res!258683 () Bool)

(assert (=> b!438099 (=> (not res!258683) (not e!258405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438099 (= res!258683 (validMask!0 mask!1025))))

(declare-fun b!438100 () Bool)

(declare-fun res!258676 () Bool)

(assert (=> b!438100 (=> (not res!258676) (not e!258405))))

(declare-fun arrayContainsKey!0 (array!26873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438100 (= res!258676 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40094 res!258684) b!438099))

(assert (= (and b!438099 res!258683) b!438093))

(assert (= (and b!438093 res!258686) b!438086))

(assert (= (and b!438086 res!258681) b!438087))

(assert (= (and b!438087 res!258679) b!438089))

(assert (= (and b!438089 res!258682) b!438091))

(assert (= (and b!438091 res!258675) b!438088))

(assert (= (and b!438088 res!258685) b!438100))

(assert (= (and b!438100 res!258676) b!438094))

(assert (= (and b!438094 res!258687) b!438096))

(assert (= (and b!438096 res!258678) b!438095))

(assert (= (and b!438095 res!258680) b!438097))

(assert (= (and b!438097 res!258677) b!438098))

(assert (= (and b!438092 condMapEmpty!18912) mapIsEmpty!18912))

(assert (= (and b!438092 (not condMapEmpty!18912)) mapNonEmpty!18912))

(get-info :version)

(assert (= (and mapNonEmpty!18912 ((_ is ValueCellFull!5420) mapValue!18912)) b!438085))

(assert (= (and b!438092 ((_ is ValueCellFull!5420) mapDefault!18912)) b!438090))

(assert (= start!40094 b!438092))

(declare-fun m!425103 () Bool)

(assert (=> b!438087 m!425103))

(declare-fun m!425105 () Bool)

(assert (=> b!438091 m!425105))

(declare-fun m!425107 () Bool)

(assert (=> start!40094 m!425107))

(declare-fun m!425109 () Bool)

(assert (=> start!40094 m!425109))

(declare-fun m!425111 () Bool)

(assert (=> b!438099 m!425111))

(declare-fun m!425113 () Bool)

(assert (=> b!438094 m!425113))

(declare-fun m!425115 () Bool)

(assert (=> b!438094 m!425115))

(declare-fun m!425117 () Bool)

(assert (=> b!438088 m!425117))

(declare-fun m!425119 () Bool)

(assert (=> b!438097 m!425119))

(declare-fun m!425121 () Bool)

(assert (=> b!438097 m!425121))

(declare-fun m!425123 () Bool)

(assert (=> b!438097 m!425123))

(declare-fun m!425125 () Bool)

(assert (=> b!438098 m!425125))

(declare-fun m!425127 () Bool)

(assert (=> b!438098 m!425127))

(assert (=> b!438098 m!425127))

(declare-fun m!425129 () Bool)

(assert (=> b!438098 m!425129))

(declare-fun m!425131 () Bool)

(assert (=> b!438098 m!425131))

(declare-fun m!425133 () Bool)

(assert (=> mapNonEmpty!18912 m!425133))

(declare-fun m!425135 () Bool)

(assert (=> b!438100 m!425135))

(declare-fun m!425137 () Bool)

(assert (=> b!438086 m!425137))

(declare-fun m!425139 () Bool)

(assert (=> b!438096 m!425139))

(check-sat (not b_next!10375) (not b!438099) (not b!438100) (not b!438094) b_and!18317 (not b!438091) tp_is_empty!11527 (not b!438086) (not b!438097) (not start!40094) (not b!438087) (not mapNonEmpty!18912) (not b!438096) (not b!438098))
(check-sat b_and!18317 (not b_next!10375))
