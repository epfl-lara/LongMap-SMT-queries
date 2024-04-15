; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39464 () Bool)

(assert start!39464)

(declare-fun b_free!9745 () Bool)

(declare-fun b_next!9745 () Bool)

(assert (=> start!39464 (= b_free!9745 (not b_next!9745))))

(declare-fun tp!34763 () Bool)

(declare-fun b_and!17339 () Bool)

(assert (=> start!39464 (= tp!34763 b_and!17339)))

(declare-fun mapNonEmpty!17967 () Bool)

(declare-fun mapRes!17967 () Bool)

(declare-fun tp!34764 () Bool)

(declare-fun e!250639 () Bool)

(assert (=> mapNonEmpty!17967 (= mapRes!17967 (and tp!34764 e!250639))))

(declare-datatypes ((V!15635 0))(
  ( (V!15636 (val!5493 Int)) )
))
(declare-datatypes ((ValueCell!5105 0))(
  ( (ValueCellFull!5105 (v!7734 V!15635)) (EmptyCell!5105) )
))
(declare-fun mapRest!17967 () (Array (_ BitVec 32) ValueCell!5105))

(declare-fun mapKey!17967 () (_ BitVec 32))

(declare-datatypes ((array!25627 0))(
  ( (array!25628 (arr!12263 (Array (_ BitVec 32) ValueCell!5105)) (size!12616 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25627)

(declare-fun mapValue!17967 () ValueCell!5105)

(assert (=> mapNonEmpty!17967 (= (arr!12263 _values!549) (store mapRest!17967 mapKey!17967 mapValue!17967))))

(declare-fun b!420994 () Bool)

(declare-fun res!245709 () Bool)

(declare-fun e!250633 () Bool)

(assert (=> b!420994 (=> (not res!245709) (not e!250633))))

(declare-datatypes ((array!25629 0))(
  ( (array!25630 (arr!12264 (Array (_ BitVec 32) (_ BitVec 64))) (size!12617 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25629)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25629 (_ BitVec 32)) Bool)

(assert (=> b!420994 (= res!245709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420995 () Bool)

(declare-fun res!245703 () Bool)

(declare-fun e!250640 () Bool)

(assert (=> b!420995 (=> (not res!245703) (not e!250640))))

(declare-fun lt!193140 () array!25629)

(declare-datatypes ((List!7183 0))(
  ( (Nil!7180) (Cons!7179 (h!8035 (_ BitVec 64)) (t!12584 List!7183)) )
))
(declare-fun arrayNoDuplicates!0 (array!25629 (_ BitVec 32) List!7183) Bool)

(assert (=> b!420995 (= res!245703 (arrayNoDuplicates!0 lt!193140 #b00000000000000000000000000000000 Nil!7180))))

(declare-fun b!420996 () Bool)

(declare-fun res!245711 () Bool)

(assert (=> b!420996 (=> (not res!245711) (not e!250633))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420996 (= res!245711 (or (= (select (arr!12264 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12264 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420997 () Bool)

(declare-fun res!245706 () Bool)

(assert (=> b!420997 (=> (not res!245706) (not e!250640))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!420997 (= res!245706 (bvsle from!863 i!563))))

(declare-fun b!420998 () Bool)

(declare-fun res!245700 () Bool)

(assert (=> b!420998 (=> (not res!245700) (not e!250633))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420998 (= res!245700 (validKeyInArray!0 k0!794))))

(declare-fun b!420999 () Bool)

(declare-fun e!250636 () Bool)

(declare-fun e!250641 () Bool)

(assert (=> b!420999 (= e!250636 (and e!250641 mapRes!17967))))

(declare-fun condMapEmpty!17967 () Bool)

(declare-fun mapDefault!17967 () ValueCell!5105)

(assert (=> b!420999 (= condMapEmpty!17967 (= (arr!12263 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5105)) mapDefault!17967)))))

(declare-fun b!421000 () Bool)

(declare-fun res!245699 () Bool)

(assert (=> b!421000 (=> (not res!245699) (not e!250633))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!421000 (= res!245699 (and (= (size!12616 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12617 _keys!709) (size!12616 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421001 () Bool)

(assert (=> b!421001 (= e!250633 e!250640)))

(declare-fun res!245708 () Bool)

(assert (=> b!421001 (=> (not res!245708) (not e!250640))))

(assert (=> b!421001 (= res!245708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193140 mask!1025))))

(assert (=> b!421001 (= lt!193140 (array!25630 (store (arr!12264 _keys!709) i!563 k0!794) (size!12617 _keys!709)))))

(declare-fun b!421002 () Bool)

(declare-fun e!250634 () Bool)

(assert (=> b!421002 (= e!250634 true)))

(declare-fun lt!193137 () V!15635)

(declare-datatypes ((tuple2!7190 0))(
  ( (tuple2!7191 (_1!3606 (_ BitVec 64)) (_2!3606 V!15635)) )
))
(declare-datatypes ((List!7184 0))(
  ( (Nil!7181) (Cons!7180 (h!8036 tuple2!7190) (t!12585 List!7184)) )
))
(declare-datatypes ((ListLongMap!6093 0))(
  ( (ListLongMap!6094 (toList!3062 List!7184)) )
))
(declare-fun lt!193133 () ListLongMap!6093)

(declare-fun lt!193138 () tuple2!7190)

(declare-fun +!1283 (ListLongMap!6093 tuple2!7190) ListLongMap!6093)

(assert (=> b!421002 (= (+!1283 lt!193133 lt!193138) (+!1283 (+!1283 lt!193133 (tuple2!7191 k0!794 lt!193137)) lt!193138))))

(declare-fun lt!193135 () V!15635)

(assert (=> b!421002 (= lt!193138 (tuple2!7191 k0!794 lt!193135))))

(declare-datatypes ((Unit!12414 0))(
  ( (Unit!12415) )
))
(declare-fun lt!193132 () Unit!12414)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!67 (ListLongMap!6093 (_ BitVec 64) V!15635 V!15635) Unit!12414)

(assert (=> b!421002 (= lt!193132 (addSameAsAddTwiceSameKeyDiffValues!67 lt!193133 k0!794 lt!193137 lt!193135))))

(declare-fun lt!193134 () V!15635)

(declare-fun get!6090 (ValueCell!5105 V!15635) V!15635)

(assert (=> b!421002 (= lt!193137 (get!6090 (select (arr!12263 _values!549) from!863) lt!193134))))

(declare-fun lt!193139 () ListLongMap!6093)

(assert (=> b!421002 (= lt!193139 (+!1283 lt!193133 (tuple2!7191 (select (arr!12264 lt!193140) from!863) lt!193135)))))

(declare-fun v!412 () V!15635)

(assert (=> b!421002 (= lt!193135 (get!6090 (select (store (arr!12263 _values!549) i!563 (ValueCellFull!5105 v!412)) from!863) lt!193134))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!724 (Int (_ BitVec 64)) V!15635)

(assert (=> b!421002 (= lt!193134 (dynLambda!724 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15635)

(declare-fun zeroValue!515 () V!15635)

(declare-fun lt!193142 () array!25627)

(declare-fun getCurrentListMapNoExtraKeys!1272 (array!25629 array!25627 (_ BitVec 32) (_ BitVec 32) V!15635 V!15635 (_ BitVec 32) Int) ListLongMap!6093)

(assert (=> b!421002 (= lt!193133 (getCurrentListMapNoExtraKeys!1272 lt!193140 lt!193142 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421003 () Bool)

(declare-fun res!245702 () Bool)

(assert (=> b!421003 (=> (not res!245702) (not e!250633))))

(assert (=> b!421003 (= res!245702 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12617 _keys!709))))))

(declare-fun bm!29385 () Bool)

(declare-fun call!29389 () ListLongMap!6093)

(declare-fun c!55260 () Bool)

(assert (=> bm!29385 (= call!29389 (getCurrentListMapNoExtraKeys!1272 (ite c!55260 lt!193140 _keys!709) (ite c!55260 lt!193142 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29388 () ListLongMap!6093)

(declare-fun e!250635 () Bool)

(declare-fun b!421004 () Bool)

(assert (=> b!421004 (= e!250635 (= call!29389 (+!1283 call!29388 (tuple2!7191 k0!794 v!412))))))

(declare-fun mapIsEmpty!17967 () Bool)

(assert (=> mapIsEmpty!17967 mapRes!17967))

(declare-fun b!421005 () Bool)

(declare-fun e!250637 () Bool)

(assert (=> b!421005 (= e!250640 e!250637)))

(declare-fun res!245712 () Bool)

(assert (=> b!421005 (=> (not res!245712) (not e!250637))))

(assert (=> b!421005 (= res!245712 (= from!863 i!563))))

(assert (=> b!421005 (= lt!193139 (getCurrentListMapNoExtraKeys!1272 lt!193140 lt!193142 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421005 (= lt!193142 (array!25628 (store (arr!12263 _values!549) i!563 (ValueCellFull!5105 v!412)) (size!12616 _values!549)))))

(declare-fun lt!193141 () ListLongMap!6093)

(assert (=> b!421005 (= lt!193141 (getCurrentListMapNoExtraKeys!1272 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421006 () Bool)

(declare-fun res!245705 () Bool)

(assert (=> b!421006 (=> (not res!245705) (not e!250633))))

(declare-fun arrayContainsKey!0 (array!25629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421006 (= res!245705 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421007 () Bool)

(assert (=> b!421007 (= e!250635 (= call!29388 call!29389))))

(declare-fun b!421008 () Bool)

(assert (=> b!421008 (= e!250637 (not e!250634))))

(declare-fun res!245710 () Bool)

(assert (=> b!421008 (=> res!245710 e!250634)))

(assert (=> b!421008 (= res!245710 (validKeyInArray!0 (select (arr!12264 _keys!709) from!863)))))

(assert (=> b!421008 e!250635))

(assert (=> b!421008 (= c!55260 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193136 () Unit!12414)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!455 (array!25629 array!25627 (_ BitVec 32) (_ BitVec 32) V!15635 V!15635 (_ BitVec 32) (_ BitVec 64) V!15635 (_ BitVec 32) Int) Unit!12414)

(assert (=> b!421008 (= lt!193136 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421009 () Bool)

(declare-fun res!245707 () Bool)

(assert (=> b!421009 (=> (not res!245707) (not e!250633))))

(assert (=> b!421009 (= res!245707 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7180))))

(declare-fun b!421010 () Bool)

(declare-fun tp_is_empty!10897 () Bool)

(assert (=> b!421010 (= e!250639 tp_is_empty!10897)))

(declare-fun b!421011 () Bool)

(assert (=> b!421011 (= e!250641 tp_is_empty!10897)))

(declare-fun res!245701 () Bool)

(assert (=> start!39464 (=> (not res!245701) (not e!250633))))

(assert (=> start!39464 (= res!245701 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12617 _keys!709))))))

(assert (=> start!39464 e!250633))

(assert (=> start!39464 tp_is_empty!10897))

(assert (=> start!39464 tp!34763))

(assert (=> start!39464 true))

(declare-fun array_inv!8978 (array!25627) Bool)

(assert (=> start!39464 (and (array_inv!8978 _values!549) e!250636)))

(declare-fun array_inv!8979 (array!25629) Bool)

(assert (=> start!39464 (array_inv!8979 _keys!709)))

(declare-fun bm!29386 () Bool)

(assert (=> bm!29386 (= call!29388 (getCurrentListMapNoExtraKeys!1272 (ite c!55260 _keys!709 lt!193140) (ite c!55260 _values!549 lt!193142) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421012 () Bool)

(declare-fun res!245704 () Bool)

(assert (=> b!421012 (=> (not res!245704) (not e!250633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421012 (= res!245704 (validMask!0 mask!1025))))

(assert (= (and start!39464 res!245701) b!421012))

(assert (= (and b!421012 res!245704) b!421000))

(assert (= (and b!421000 res!245699) b!420994))

(assert (= (and b!420994 res!245709) b!421009))

(assert (= (and b!421009 res!245707) b!421003))

(assert (= (and b!421003 res!245702) b!420998))

(assert (= (and b!420998 res!245700) b!420996))

(assert (= (and b!420996 res!245711) b!421006))

(assert (= (and b!421006 res!245705) b!421001))

(assert (= (and b!421001 res!245708) b!420995))

(assert (= (and b!420995 res!245703) b!420997))

(assert (= (and b!420997 res!245706) b!421005))

(assert (= (and b!421005 res!245712) b!421008))

(assert (= (and b!421008 c!55260) b!421004))

(assert (= (and b!421008 (not c!55260)) b!421007))

(assert (= (or b!421004 b!421007) bm!29385))

(assert (= (or b!421004 b!421007) bm!29386))

(assert (= (and b!421008 (not res!245710)) b!421002))

(assert (= (and b!420999 condMapEmpty!17967) mapIsEmpty!17967))

(assert (= (and b!420999 (not condMapEmpty!17967)) mapNonEmpty!17967))

(get-info :version)

(assert (= (and mapNonEmpty!17967 ((_ is ValueCellFull!5105) mapValue!17967)) b!421010))

(assert (= (and b!420999 ((_ is ValueCellFull!5105) mapDefault!17967)) b!421011))

(assert (= start!39464 b!420999))

(declare-fun b_lambda!9031 () Bool)

(assert (=> (not b_lambda!9031) (not b!421002)))

(declare-fun t!12583 () Bool)

(declare-fun tb!3359 () Bool)

(assert (=> (and start!39464 (= defaultEntry!557 defaultEntry!557) t!12583) tb!3359))

(declare-fun result!6253 () Bool)

(assert (=> tb!3359 (= result!6253 tp_is_empty!10897)))

(assert (=> b!421002 t!12583))

(declare-fun b_and!17341 () Bool)

(assert (= b_and!17339 (and (=> t!12583 result!6253) b_and!17341)))

(declare-fun m!410253 () Bool)

(assert (=> start!39464 m!410253))

(declare-fun m!410255 () Bool)

(assert (=> start!39464 m!410255))

(declare-fun m!410257 () Bool)

(assert (=> b!421009 m!410257))

(declare-fun m!410259 () Bool)

(assert (=> b!420996 m!410259))

(declare-fun m!410261 () Bool)

(assert (=> b!421008 m!410261))

(assert (=> b!421008 m!410261))

(declare-fun m!410263 () Bool)

(assert (=> b!421008 m!410263))

(declare-fun m!410265 () Bool)

(assert (=> b!421008 m!410265))

(declare-fun m!410267 () Bool)

(assert (=> b!421012 m!410267))

(declare-fun m!410269 () Bool)

(assert (=> b!421004 m!410269))

(declare-fun m!410271 () Bool)

(assert (=> b!421006 m!410271))

(declare-fun m!410273 () Bool)

(assert (=> b!421005 m!410273))

(declare-fun m!410275 () Bool)

(assert (=> b!421005 m!410275))

(declare-fun m!410277 () Bool)

(assert (=> b!421005 m!410277))

(declare-fun m!410279 () Bool)

(assert (=> bm!29386 m!410279))

(declare-fun m!410281 () Bool)

(assert (=> mapNonEmpty!17967 m!410281))

(declare-fun m!410283 () Bool)

(assert (=> b!420998 m!410283))

(declare-fun m!410285 () Bool)

(assert (=> b!421002 m!410285))

(declare-fun m!410287 () Bool)

(assert (=> b!421002 m!410287))

(declare-fun m!410289 () Bool)

(assert (=> b!421002 m!410289))

(declare-fun m!410291 () Bool)

(assert (=> b!421002 m!410291))

(assert (=> b!421002 m!410275))

(declare-fun m!410293 () Bool)

(assert (=> b!421002 m!410293))

(declare-fun m!410295 () Bool)

(assert (=> b!421002 m!410295))

(assert (=> b!421002 m!410295))

(declare-fun m!410297 () Bool)

(assert (=> b!421002 m!410297))

(declare-fun m!410299 () Bool)

(assert (=> b!421002 m!410299))

(assert (=> b!421002 m!410285))

(declare-fun m!410301 () Bool)

(assert (=> b!421002 m!410301))

(declare-fun m!410303 () Bool)

(assert (=> b!421002 m!410303))

(declare-fun m!410305 () Bool)

(assert (=> b!421002 m!410305))

(assert (=> b!421002 m!410301))

(declare-fun m!410307 () Bool)

(assert (=> b!421002 m!410307))

(declare-fun m!410309 () Bool)

(assert (=> b!420994 m!410309))

(declare-fun m!410311 () Bool)

(assert (=> bm!29385 m!410311))

(declare-fun m!410313 () Bool)

(assert (=> b!420995 m!410313))

(declare-fun m!410315 () Bool)

(assert (=> b!421001 m!410315))

(declare-fun m!410317 () Bool)

(assert (=> b!421001 m!410317))

(check-sat (not b!420994) (not bm!29385) (not b!421002) (not bm!29386) (not b!421001) (not b!421012) (not b!421006) (not b!420998) (not b_next!9745) (not b_lambda!9031) (not b!421005) (not mapNonEmpty!17967) (not b!421009) (not start!39464) (not b!421004) tp_is_empty!10897 (not b!421008) b_and!17341 (not b!420995))
(check-sat b_and!17341 (not b_next!9745))
