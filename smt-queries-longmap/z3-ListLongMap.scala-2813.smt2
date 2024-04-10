; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40790 () Bool)

(assert start!40790)

(declare-fun b_free!10779 () Bool)

(declare-fun b_next!10779 () Bool)

(assert (=> start!40790 (= b_free!10779 (not b_next!10779))))

(declare-fun tp!38160 () Bool)

(declare-fun b_and!18845 () Bool)

(assert (=> start!40790 (= tp!38160 b_and!18845)))

(declare-fun b!452353 () Bool)

(declare-fun e!264877 () Bool)

(declare-fun e!264873 () Bool)

(assert (=> b!452353 (= e!264877 (not e!264873))))

(declare-fun res!269425 () Bool)

(assert (=> b!452353 (=> res!269425 e!264873)))

(declare-datatypes ((array!28041 0))(
  ( (array!28042 (arr!13465 (Array (_ BitVec 32) (_ BitVec 64))) (size!13817 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28041)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452353 (= res!269425 (validKeyInArray!0 (select (arr!13465 _keys!709) from!863)))))

(declare-fun e!264874 () Bool)

(assert (=> b!452353 e!264874))

(declare-fun c!56117 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452353 (= c!56117 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17261 0))(
  ( (V!17262 (val!6103 Int)) )
))
(declare-fun minValue!515 () V!17261)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5715 0))(
  ( (ValueCellFull!5715 (v!8362 V!17261)) (EmptyCell!5715) )
))
(declare-datatypes ((array!28043 0))(
  ( (array!28044 (arr!13466 (Array (_ BitVec 32) ValueCell!5715)) (size!13818 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28043)

(declare-fun zeroValue!515 () V!17261)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13226 0))(
  ( (Unit!13227) )
))
(declare-fun lt!205193 () Unit!13226)

(declare-fun v!412 () V!17261)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!727 (array!28041 array!28043 (_ BitVec 32) (_ BitVec 32) V!17261 V!17261 (_ BitVec 32) (_ BitVec 64) V!17261 (_ BitVec 32) Int) Unit!13226)

(assert (=> b!452353 (= lt!205193 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452355 () Bool)

(declare-fun res!269435 () Bool)

(declare-fun e!264870 () Bool)

(assert (=> b!452355 (=> (not res!269435) (not e!264870))))

(declare-fun lt!205190 () array!28041)

(declare-datatypes ((List!8090 0))(
  ( (Nil!8087) (Cons!8086 (h!8942 (_ BitVec 64)) (t!13892 List!8090)) )
))
(declare-fun arrayNoDuplicates!0 (array!28041 (_ BitVec 32) List!8090) Bool)

(assert (=> b!452355 (= res!269435 (arrayNoDuplicates!0 lt!205190 #b00000000000000000000000000000000 Nil!8087))))

(declare-fun b!452356 () Bool)

(declare-fun res!269428 () Bool)

(assert (=> b!452356 (=> (not res!269428) (not e!264870))))

(assert (=> b!452356 (= res!269428 (bvsle from!863 i!563))))

(declare-fun b!452357 () Bool)

(declare-fun e!264872 () Bool)

(declare-fun tp_is_empty!12117 () Bool)

(assert (=> b!452357 (= e!264872 tp_is_empty!12117)))

(declare-fun b!452358 () Bool)

(declare-fun res!269430 () Bool)

(declare-fun e!264875 () Bool)

(assert (=> b!452358 (=> (not res!269430) (not e!264875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452358 (= res!269430 (validMask!0 mask!1025))))

(declare-fun b!452359 () Bool)

(declare-fun res!269423 () Bool)

(assert (=> b!452359 (=> (not res!269423) (not e!264875))))

(assert (=> b!452359 (= res!269423 (and (= (size!13818 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13817 _keys!709) (size!13818 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452360 () Bool)

(declare-fun res!269429 () Bool)

(assert (=> b!452360 (=> (not res!269429) (not e!264875))))

(assert (=> b!452360 (= res!269429 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8087))))

(declare-fun b!452361 () Bool)

(declare-fun res!269432 () Bool)

(assert (=> b!452361 (=> (not res!269432) (not e!264875))))

(declare-fun arrayContainsKey!0 (array!28041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452361 (= res!269432 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452362 () Bool)

(declare-fun res!269433 () Bool)

(assert (=> b!452362 (=> (not res!269433) (not e!264875))))

(assert (=> b!452362 (= res!269433 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13817 _keys!709))))))

(declare-fun b!452363 () Bool)

(declare-fun e!264871 () Bool)

(assert (=> b!452363 (= e!264871 tp_is_empty!12117)))

(declare-fun b!452364 () Bool)

(declare-fun res!269431 () Bool)

(assert (=> b!452364 (=> (not res!269431) (not e!264875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28041 (_ BitVec 32)) Bool)

(assert (=> b!452364 (= res!269431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452365 () Bool)

(declare-datatypes ((tuple2!8032 0))(
  ( (tuple2!8033 (_1!4027 (_ BitVec 64)) (_2!4027 V!17261)) )
))
(declare-datatypes ((List!8091 0))(
  ( (Nil!8088) (Cons!8087 (h!8943 tuple2!8032) (t!13893 List!8091)) )
))
(declare-datatypes ((ListLongMap!6945 0))(
  ( (ListLongMap!6946 (toList!3488 List!8091)) )
))
(declare-fun call!29951 () ListLongMap!6945)

(declare-fun call!29950 () ListLongMap!6945)

(assert (=> b!452365 (= e!264874 (= call!29951 call!29950))))

(declare-fun bm!29947 () Bool)

(declare-fun lt!205199 () array!28043)

(declare-fun getCurrentListMapNoExtraKeys!1672 (array!28041 array!28043 (_ BitVec 32) (_ BitVec 32) V!17261 V!17261 (_ BitVec 32) Int) ListLongMap!6945)

(assert (=> bm!29947 (= call!29950 (getCurrentListMapNoExtraKeys!1672 (ite c!56117 lt!205190 _keys!709) (ite c!56117 lt!205199 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452366 () Bool)

(assert (=> b!452366 (= e!264870 e!264877)))

(declare-fun res!269422 () Bool)

(assert (=> b!452366 (=> (not res!269422) (not e!264877))))

(assert (=> b!452366 (= res!269422 (= from!863 i!563))))

(declare-fun lt!205189 () ListLongMap!6945)

(assert (=> b!452366 (= lt!205189 (getCurrentListMapNoExtraKeys!1672 lt!205190 lt!205199 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452366 (= lt!205199 (array!28044 (store (arr!13466 _values!549) i!563 (ValueCellFull!5715 v!412)) (size!13818 _values!549)))))

(declare-fun lt!205196 () ListLongMap!6945)

(assert (=> b!452366 (= lt!205196 (getCurrentListMapNoExtraKeys!1672 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452367 () Bool)

(assert (=> b!452367 (= e!264873 true)))

(declare-fun lt!205198 () tuple2!8032)

(declare-fun lt!205197 () V!17261)

(declare-fun lt!205194 () ListLongMap!6945)

(declare-fun +!1565 (ListLongMap!6945 tuple2!8032) ListLongMap!6945)

(assert (=> b!452367 (= (+!1565 lt!205194 lt!205198) (+!1565 (+!1565 lt!205194 (tuple2!8033 k0!794 lt!205197)) lt!205198))))

(declare-fun lt!205192 () V!17261)

(assert (=> b!452367 (= lt!205198 (tuple2!8033 k0!794 lt!205192))))

(declare-fun lt!205191 () Unit!13226)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!78 (ListLongMap!6945 (_ BitVec 64) V!17261 V!17261) Unit!13226)

(assert (=> b!452367 (= lt!205191 (addSameAsAddTwiceSameKeyDiffValues!78 lt!205194 k0!794 lt!205197 lt!205192))))

(declare-fun lt!205195 () V!17261)

(declare-fun get!6636 (ValueCell!5715 V!17261) V!17261)

(assert (=> b!452367 (= lt!205197 (get!6636 (select (arr!13466 _values!549) from!863) lt!205195))))

(assert (=> b!452367 (= lt!205189 (+!1565 lt!205194 (tuple2!8033 (select (arr!13465 lt!205190) from!863) lt!205192)))))

(assert (=> b!452367 (= lt!205192 (get!6636 (select (store (arr!13466 _values!549) i!563 (ValueCellFull!5715 v!412)) from!863) lt!205195))))

(declare-fun dynLambda!865 (Int (_ BitVec 64)) V!17261)

(assert (=> b!452367 (= lt!205195 (dynLambda!865 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452367 (= lt!205194 (getCurrentListMapNoExtraKeys!1672 lt!205190 lt!205199 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19812 () Bool)

(declare-fun mapRes!19812 () Bool)

(assert (=> mapIsEmpty!19812 mapRes!19812))

(declare-fun mapNonEmpty!19812 () Bool)

(declare-fun tp!38159 () Bool)

(assert (=> mapNonEmpty!19812 (= mapRes!19812 (and tp!38159 e!264872))))

(declare-fun mapKey!19812 () (_ BitVec 32))

(declare-fun mapValue!19812 () ValueCell!5715)

(declare-fun mapRest!19812 () (Array (_ BitVec 32) ValueCell!5715))

(assert (=> mapNonEmpty!19812 (= (arr!13466 _values!549) (store mapRest!19812 mapKey!19812 mapValue!19812))))

(declare-fun b!452368 () Bool)

(declare-fun res!269434 () Bool)

(assert (=> b!452368 (=> (not res!269434) (not e!264875))))

(assert (=> b!452368 (= res!269434 (validKeyInArray!0 k0!794))))

(declare-fun b!452369 () Bool)

(declare-fun e!264878 () Bool)

(assert (=> b!452369 (= e!264878 (and e!264871 mapRes!19812))))

(declare-fun condMapEmpty!19812 () Bool)

(declare-fun mapDefault!19812 () ValueCell!5715)

(assert (=> b!452369 (= condMapEmpty!19812 (= (arr!13466 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5715)) mapDefault!19812)))))

(declare-fun b!452354 () Bool)

(declare-fun res!269427 () Bool)

(assert (=> b!452354 (=> (not res!269427) (not e!264875))))

(assert (=> b!452354 (= res!269427 (or (= (select (arr!13465 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13465 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!269424 () Bool)

(assert (=> start!40790 (=> (not res!269424) (not e!264875))))

(assert (=> start!40790 (= res!269424 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13817 _keys!709))))))

(assert (=> start!40790 e!264875))

(assert (=> start!40790 tp_is_empty!12117))

(assert (=> start!40790 tp!38160))

(assert (=> start!40790 true))

(declare-fun array_inv!9750 (array!28043) Bool)

(assert (=> start!40790 (and (array_inv!9750 _values!549) e!264878)))

(declare-fun array_inv!9751 (array!28041) Bool)

(assert (=> start!40790 (array_inv!9751 _keys!709)))

(declare-fun b!452370 () Bool)

(assert (=> b!452370 (= e!264875 e!264870)))

(declare-fun res!269426 () Bool)

(assert (=> b!452370 (=> (not res!269426) (not e!264870))))

(assert (=> b!452370 (= res!269426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205190 mask!1025))))

(assert (=> b!452370 (= lt!205190 (array!28042 (store (arr!13465 _keys!709) i!563 k0!794) (size!13817 _keys!709)))))

(declare-fun b!452371 () Bool)

(assert (=> b!452371 (= e!264874 (= call!29950 (+!1565 call!29951 (tuple2!8033 k0!794 v!412))))))

(declare-fun bm!29948 () Bool)

(assert (=> bm!29948 (= call!29951 (getCurrentListMapNoExtraKeys!1672 (ite c!56117 _keys!709 lt!205190) (ite c!56117 _values!549 lt!205199) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40790 res!269424) b!452358))

(assert (= (and b!452358 res!269430) b!452359))

(assert (= (and b!452359 res!269423) b!452364))

(assert (= (and b!452364 res!269431) b!452360))

(assert (= (and b!452360 res!269429) b!452362))

(assert (= (and b!452362 res!269433) b!452368))

(assert (= (and b!452368 res!269434) b!452354))

(assert (= (and b!452354 res!269427) b!452361))

(assert (= (and b!452361 res!269432) b!452370))

(assert (= (and b!452370 res!269426) b!452355))

(assert (= (and b!452355 res!269435) b!452356))

(assert (= (and b!452356 res!269428) b!452366))

(assert (= (and b!452366 res!269422) b!452353))

(assert (= (and b!452353 c!56117) b!452371))

(assert (= (and b!452353 (not c!56117)) b!452365))

(assert (= (or b!452371 b!452365) bm!29947))

(assert (= (or b!452371 b!452365) bm!29948))

(assert (= (and b!452353 (not res!269425)) b!452367))

(assert (= (and b!452369 condMapEmpty!19812) mapIsEmpty!19812))

(assert (= (and b!452369 (not condMapEmpty!19812)) mapNonEmpty!19812))

(get-info :version)

(assert (= (and mapNonEmpty!19812 ((_ is ValueCellFull!5715) mapValue!19812)) b!452357))

(assert (= (and b!452369 ((_ is ValueCellFull!5715) mapDefault!19812)) b!452363))

(assert (= start!40790 b!452369))

(declare-fun b_lambda!9557 () Bool)

(assert (=> (not b_lambda!9557) (not b!452367)))

(declare-fun t!13891 () Bool)

(declare-fun tb!3759 () Bool)

(assert (=> (and start!40790 (= defaultEntry!557 defaultEntry!557) t!13891) tb!3759))

(declare-fun result!7055 () Bool)

(assert (=> tb!3759 (= result!7055 tp_is_empty!12117)))

(assert (=> b!452367 t!13891))

(declare-fun b_and!18847 () Bool)

(assert (= b_and!18845 (and (=> t!13891 result!7055) b_and!18847)))

(declare-fun m!436061 () Bool)

(assert (=> b!452368 m!436061))

(declare-fun m!436063 () Bool)

(assert (=> bm!29948 m!436063))

(declare-fun m!436065 () Bool)

(assert (=> b!452370 m!436065))

(declare-fun m!436067 () Bool)

(assert (=> b!452370 m!436067))

(declare-fun m!436069 () Bool)

(assert (=> b!452361 m!436069))

(declare-fun m!436071 () Bool)

(assert (=> b!452364 m!436071))

(declare-fun m!436073 () Bool)

(assert (=> b!452367 m!436073))

(declare-fun m!436075 () Bool)

(assert (=> b!452367 m!436075))

(declare-fun m!436077 () Bool)

(assert (=> b!452367 m!436077))

(declare-fun m!436079 () Bool)

(assert (=> b!452367 m!436079))

(declare-fun m!436081 () Bool)

(assert (=> b!452367 m!436081))

(declare-fun m!436083 () Bool)

(assert (=> b!452367 m!436083))

(declare-fun m!436085 () Bool)

(assert (=> b!452367 m!436085))

(declare-fun m!436087 () Bool)

(assert (=> b!452367 m!436087))

(declare-fun m!436089 () Bool)

(assert (=> b!452367 m!436089))

(assert (=> b!452367 m!436075))

(assert (=> b!452367 m!436083))

(declare-fun m!436091 () Bool)

(assert (=> b!452367 m!436091))

(declare-fun m!436093 () Bool)

(assert (=> b!452367 m!436093))

(declare-fun m!436095 () Bool)

(assert (=> b!452367 m!436095))

(declare-fun m!436097 () Bool)

(assert (=> b!452367 m!436097))

(assert (=> b!452367 m!436095))

(declare-fun m!436099 () Bool)

(assert (=> bm!29947 m!436099))

(declare-fun m!436101 () Bool)

(assert (=> mapNonEmpty!19812 m!436101))

(declare-fun m!436103 () Bool)

(assert (=> b!452358 m!436103))

(declare-fun m!436105 () Bool)

(assert (=> b!452360 m!436105))

(declare-fun m!436107 () Bool)

(assert (=> b!452354 m!436107))

(declare-fun m!436109 () Bool)

(assert (=> start!40790 m!436109))

(declare-fun m!436111 () Bool)

(assert (=> start!40790 m!436111))

(declare-fun m!436113 () Bool)

(assert (=> b!452355 m!436113))

(declare-fun m!436115 () Bool)

(assert (=> b!452366 m!436115))

(assert (=> b!452366 m!436093))

(declare-fun m!436117 () Bool)

(assert (=> b!452366 m!436117))

(declare-fun m!436119 () Bool)

(assert (=> b!452371 m!436119))

(declare-fun m!436121 () Bool)

(assert (=> b!452353 m!436121))

(assert (=> b!452353 m!436121))

(declare-fun m!436123 () Bool)

(assert (=> b!452353 m!436123))

(declare-fun m!436125 () Bool)

(assert (=> b!452353 m!436125))

(check-sat (not b!452355) (not b!452360) b_and!18847 (not b!452371) tp_is_empty!12117 (not b_lambda!9557) (not b!452368) (not b!452367) (not b!452366) (not mapNonEmpty!19812) (not b!452353) (not b!452364) (not b_next!10779) (not start!40790) (not b!452370) (not b!452361) (not bm!29948) (not b!452358) (not bm!29947))
(check-sat b_and!18847 (not b_next!10779))
