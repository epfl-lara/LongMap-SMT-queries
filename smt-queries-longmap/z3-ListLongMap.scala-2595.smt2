; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39374 () Bool)

(assert start!39374)

(declare-fun b_free!9655 () Bool)

(declare-fun b_next!9655 () Bool)

(assert (=> start!39374 (= b_free!9655 (not b_next!9655))))

(declare-fun tp!34494 () Bool)

(declare-fun b_and!17199 () Bool)

(assert (=> start!39374 (= tp!34494 b_and!17199)))

(declare-fun b!418561 () Bool)

(declare-fun e!249561 () Bool)

(declare-fun tp_is_empty!10807 () Bool)

(assert (=> b!418561 (= e!249561 tp_is_empty!10807)))

(declare-fun b!418562 () Bool)

(declare-fun e!249560 () Bool)

(declare-datatypes ((V!15515 0))(
  ( (V!15516 (val!5448 Int)) )
))
(declare-datatypes ((tuple2!7002 0))(
  ( (tuple2!7003 (_1!3512 (_ BitVec 64)) (_2!3512 V!15515)) )
))
(declare-datatypes ((List!7015 0))(
  ( (Nil!7012) (Cons!7011 (h!7867 tuple2!7002) (t!12327 List!7015)) )
))
(declare-datatypes ((ListLongMap!5917 0))(
  ( (ListLongMap!5918 (toList!2974 List!7015)) )
))
(declare-fun call!29131 () ListLongMap!5917)

(declare-fun call!29130 () ListLongMap!5917)

(assert (=> b!418562 (= e!249560 (= call!29131 call!29130))))

(declare-fun b!418563 () Bool)

(declare-fun e!249566 () Bool)

(assert (=> b!418563 (= e!249566 tp_is_empty!10807)))

(declare-fun b!418564 () Bool)

(declare-fun e!249563 () Bool)

(declare-fun e!249562 () Bool)

(assert (=> b!418564 (= e!249563 e!249562)))

(declare-fun res!243936 () Bool)

(assert (=> b!418564 (=> (not res!243936) (not e!249562))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418564 (= res!243936 (= from!863 i!563))))

(declare-fun minValue!515 () V!15515)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15515)

(declare-datatypes ((ValueCell!5060 0))(
  ( (ValueCellFull!5060 (v!7696 V!15515)) (EmptyCell!5060) )
))
(declare-datatypes ((array!25472 0))(
  ( (array!25473 (arr!12185 (Array (_ BitVec 32) ValueCell!5060)) (size!12537 (_ BitVec 32))) )
))
(declare-fun lt!191901 () array!25472)

(declare-datatypes ((array!25474 0))(
  ( (array!25475 (arr!12186 (Array (_ BitVec 32) (_ BitVec 64))) (size!12538 (_ BitVec 32))) )
))
(declare-fun lt!191908 () array!25474)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!191900 () ListLongMap!5917)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1220 (array!25474 array!25472 (_ BitVec 32) (_ BitVec 32) V!15515 V!15515 (_ BitVec 32) Int) ListLongMap!5917)

(assert (=> b!418564 (= lt!191900 (getCurrentListMapNoExtraKeys!1220 lt!191908 lt!191901 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25472)

(declare-fun v!412 () V!15515)

(assert (=> b!418564 (= lt!191901 (array!25473 (store (arr!12185 _values!549) i!563 (ValueCellFull!5060 v!412)) (size!12537 _values!549)))))

(declare-fun lt!191910 () ListLongMap!5917)

(declare-fun _keys!709 () array!25474)

(assert (=> b!418564 (= lt!191910 (getCurrentListMapNoExtraKeys!1220 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun c!55173 () Bool)

(declare-fun bm!29127 () Bool)

(assert (=> bm!29127 (= call!29130 (getCurrentListMapNoExtraKeys!1220 (ite c!55173 lt!191908 _keys!709) (ite c!55173 lt!191901 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17832 () Bool)

(declare-fun mapRes!17832 () Bool)

(declare-fun tp!34493 () Bool)

(assert (=> mapNonEmpty!17832 (= mapRes!17832 (and tp!34493 e!249561))))

(declare-fun mapRest!17832 () (Array (_ BitVec 32) ValueCell!5060))

(declare-fun mapValue!17832 () ValueCell!5060)

(declare-fun mapKey!17832 () (_ BitVec 32))

(assert (=> mapNonEmpty!17832 (= (arr!12185 _values!549) (store mapRest!17832 mapKey!17832 mapValue!17832))))

(declare-fun b!418565 () Bool)

(declare-fun res!243944 () Bool)

(declare-fun e!249565 () Bool)

(assert (=> b!418565 (=> (not res!243944) (not e!249565))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418565 (= res!243944 (validKeyInArray!0 k0!794))))

(declare-fun bm!29128 () Bool)

(assert (=> bm!29128 (= call!29131 (getCurrentListMapNoExtraKeys!1220 (ite c!55173 _keys!709 lt!191908) (ite c!55173 _values!549 lt!191901) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418566 () Bool)

(declare-fun res!243942 () Bool)

(assert (=> b!418566 (=> (not res!243942) (not e!249565))))

(assert (=> b!418566 (= res!243942 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12538 _keys!709))))))

(declare-fun b!418567 () Bool)

(declare-fun res!243937 () Bool)

(assert (=> b!418567 (=> (not res!243937) (not e!249565))))

(declare-datatypes ((List!7016 0))(
  ( (Nil!7013) (Cons!7012 (h!7868 (_ BitVec 64)) (t!12328 List!7016)) )
))
(declare-fun arrayNoDuplicates!0 (array!25474 (_ BitVec 32) List!7016) Bool)

(assert (=> b!418567 (= res!243937 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7013))))

(declare-fun b!418568 () Bool)

(declare-fun res!243946 () Bool)

(assert (=> b!418568 (=> (not res!243946) (not e!249565))))

(assert (=> b!418568 (= res!243946 (and (= (size!12537 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12538 _keys!709) (size!12537 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418569 () Bool)

(declare-fun res!243948 () Bool)

(assert (=> b!418569 (=> (not res!243948) (not e!249565))))

(declare-fun arrayContainsKey!0 (array!25474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418569 (= res!243948 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418570 () Bool)

(declare-fun res!243943 () Bool)

(assert (=> b!418570 (=> (not res!243943) (not e!249563))))

(assert (=> b!418570 (= res!243943 (arrayNoDuplicates!0 lt!191908 #b00000000000000000000000000000000 Nil!7013))))

(declare-fun b!418571 () Bool)

(declare-fun res!243940 () Bool)

(assert (=> b!418571 (=> (not res!243940) (not e!249565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418571 (= res!243940 (validMask!0 mask!1025))))

(declare-fun res!243938 () Bool)

(assert (=> start!39374 (=> (not res!243938) (not e!249565))))

(assert (=> start!39374 (= res!243938 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12538 _keys!709))))))

(assert (=> start!39374 e!249565))

(assert (=> start!39374 tp_is_empty!10807))

(assert (=> start!39374 tp!34494))

(assert (=> start!39374 true))

(declare-fun e!249564 () Bool)

(declare-fun array_inv!8962 (array!25472) Bool)

(assert (=> start!39374 (and (array_inv!8962 _values!549) e!249564)))

(declare-fun array_inv!8963 (array!25474) Bool)

(assert (=> start!39374 (array_inv!8963 _keys!709)))

(declare-fun b!418572 () Bool)

(assert (=> b!418572 (= e!249564 (and e!249566 mapRes!17832))))

(declare-fun condMapEmpty!17832 () Bool)

(declare-fun mapDefault!17832 () ValueCell!5060)

(assert (=> b!418572 (= condMapEmpty!17832 (= (arr!12185 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5060)) mapDefault!17832)))))

(declare-fun b!418573 () Bool)

(declare-fun res!243945 () Bool)

(assert (=> b!418573 (=> (not res!243945) (not e!249563))))

(assert (=> b!418573 (= res!243945 (bvsle from!863 i!563))))

(declare-fun b!418574 () Bool)

(assert (=> b!418574 (= e!249565 e!249563)))

(declare-fun res!243935 () Bool)

(assert (=> b!418574 (=> (not res!243935) (not e!249563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25474 (_ BitVec 32)) Bool)

(assert (=> b!418574 (= res!243935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191908 mask!1025))))

(assert (=> b!418574 (= lt!191908 (array!25475 (store (arr!12186 _keys!709) i!563 k0!794) (size!12538 _keys!709)))))

(declare-fun b!418575 () Bool)

(declare-fun res!243939 () Bool)

(assert (=> b!418575 (=> (not res!243939) (not e!249565))))

(assert (=> b!418575 (= res!243939 (or (= (select (arr!12186 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12186 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418576 () Bool)

(declare-fun +!1242 (ListLongMap!5917 tuple2!7002) ListLongMap!5917)

(assert (=> b!418576 (= e!249560 (= call!29130 (+!1242 call!29131 (tuple2!7003 k0!794 v!412))))))

(declare-fun b!418577 () Bool)

(declare-fun e!249567 () Bool)

(assert (=> b!418577 (= e!249562 (not e!249567))))

(declare-fun res!243947 () Bool)

(assert (=> b!418577 (=> res!243947 e!249567)))

(assert (=> b!418577 (= res!243947 (validKeyInArray!0 (select (arr!12186 _keys!709) from!863)))))

(assert (=> b!418577 e!249560))

(assert (=> b!418577 (= c!55173 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12353 0))(
  ( (Unit!12354) )
))
(declare-fun lt!191905 () Unit!12353)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!434 (array!25474 array!25472 (_ BitVec 32) (_ BitVec 32) V!15515 V!15515 (_ BitVec 32) (_ BitVec 64) V!15515 (_ BitVec 32) Int) Unit!12353)

(assert (=> b!418577 (= lt!191905 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!434 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17832 () Bool)

(assert (=> mapIsEmpty!17832 mapRes!17832))

(declare-fun b!418578 () Bool)

(assert (=> b!418578 (= e!249567 true)))

(declare-fun lt!191907 () ListLongMap!5917)

(declare-fun lt!191902 () V!15515)

(declare-fun lt!191904 () tuple2!7002)

(assert (=> b!418578 (= (+!1242 lt!191907 lt!191904) (+!1242 (+!1242 lt!191907 (tuple2!7003 k0!794 lt!191902)) lt!191904))))

(declare-fun lt!191906 () V!15515)

(assert (=> b!418578 (= lt!191904 (tuple2!7003 k0!794 lt!191906))))

(declare-fun lt!191909 () Unit!12353)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!32 (ListLongMap!5917 (_ BitVec 64) V!15515 V!15515) Unit!12353)

(assert (=> b!418578 (= lt!191909 (addSameAsAddTwiceSameKeyDiffValues!32 lt!191907 k0!794 lt!191902 lt!191906))))

(declare-fun lt!191903 () V!15515)

(declare-fun get!6038 (ValueCell!5060 V!15515) V!15515)

(assert (=> b!418578 (= lt!191902 (get!6038 (select (arr!12185 _values!549) from!863) lt!191903))))

(assert (=> b!418578 (= lt!191900 (+!1242 lt!191907 (tuple2!7003 (select (arr!12186 lt!191908) from!863) lt!191906)))))

(assert (=> b!418578 (= lt!191906 (get!6038 (select (store (arr!12185 _values!549) i!563 (ValueCellFull!5060 v!412)) from!863) lt!191903))))

(declare-fun dynLambda!699 (Int (_ BitVec 64)) V!15515)

(assert (=> b!418578 (= lt!191903 (dynLambda!699 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418578 (= lt!191907 (getCurrentListMapNoExtraKeys!1220 lt!191908 lt!191901 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418579 () Bool)

(declare-fun res!243941 () Bool)

(assert (=> b!418579 (=> (not res!243941) (not e!249565))))

(assert (=> b!418579 (= res!243941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39374 res!243938) b!418571))

(assert (= (and b!418571 res!243940) b!418568))

(assert (= (and b!418568 res!243946) b!418579))

(assert (= (and b!418579 res!243941) b!418567))

(assert (= (and b!418567 res!243937) b!418566))

(assert (= (and b!418566 res!243942) b!418565))

(assert (= (and b!418565 res!243944) b!418575))

(assert (= (and b!418575 res!243939) b!418569))

(assert (= (and b!418569 res!243948) b!418574))

(assert (= (and b!418574 res!243935) b!418570))

(assert (= (and b!418570 res!243943) b!418573))

(assert (= (and b!418573 res!243945) b!418564))

(assert (= (and b!418564 res!243936) b!418577))

(assert (= (and b!418577 c!55173) b!418576))

(assert (= (and b!418577 (not c!55173)) b!418562))

(assert (= (or b!418576 b!418562) bm!29127))

(assert (= (or b!418576 b!418562) bm!29128))

(assert (= (and b!418577 (not res!243947)) b!418578))

(assert (= (and b!418572 condMapEmpty!17832) mapIsEmpty!17832))

(assert (= (and b!418572 (not condMapEmpty!17832)) mapNonEmpty!17832))

(get-info :version)

(assert (= (and mapNonEmpty!17832 ((_ is ValueCellFull!5060) mapValue!17832)) b!418561))

(assert (= (and b!418572 ((_ is ValueCellFull!5060) mapDefault!17832)) b!418563))

(assert (= start!39374 b!418572))

(declare-fun b_lambda!8981 () Bool)

(assert (=> (not b_lambda!8981) (not b!418578)))

(declare-fun t!12326 () Bool)

(declare-fun tb!3269 () Bool)

(assert (=> (and start!39374 (= defaultEntry!557 defaultEntry!557) t!12326) tb!3269))

(declare-fun result!6073 () Bool)

(assert (=> tb!3269 (= result!6073 tp_is_empty!10807)))

(assert (=> b!418578 t!12326))

(declare-fun b_and!17201 () Bool)

(assert (= b_and!17199 (and (=> t!12326 result!6073) b_and!17201)))

(declare-fun m!408239 () Bool)

(assert (=> bm!29127 m!408239))

(declare-fun m!408241 () Bool)

(assert (=> b!418565 m!408241))

(declare-fun m!408243 () Bool)

(assert (=> b!418576 m!408243))

(declare-fun m!408245 () Bool)

(assert (=> b!418570 m!408245))

(declare-fun m!408247 () Bool)

(assert (=> b!418567 m!408247))

(declare-fun m!408249 () Bool)

(assert (=> mapNonEmpty!17832 m!408249))

(declare-fun m!408251 () Bool)

(assert (=> b!418578 m!408251))

(declare-fun m!408253 () Bool)

(assert (=> b!418578 m!408253))

(declare-fun m!408255 () Bool)

(assert (=> b!418578 m!408255))

(declare-fun m!408257 () Bool)

(assert (=> b!418578 m!408257))

(declare-fun m!408259 () Bool)

(assert (=> b!418578 m!408259))

(declare-fun m!408261 () Bool)

(assert (=> b!418578 m!408261))

(declare-fun m!408263 () Bool)

(assert (=> b!418578 m!408263))

(assert (=> b!418578 m!408259))

(declare-fun m!408265 () Bool)

(assert (=> b!418578 m!408265))

(declare-fun m!408267 () Bool)

(assert (=> b!418578 m!408267))

(declare-fun m!408269 () Bool)

(assert (=> b!418578 m!408269))

(declare-fun m!408271 () Bool)

(assert (=> b!418578 m!408271))

(assert (=> b!418578 m!408269))

(declare-fun m!408273 () Bool)

(assert (=> b!418578 m!408273))

(declare-fun m!408275 () Bool)

(assert (=> b!418578 m!408275))

(assert (=> b!418578 m!408265))

(declare-fun m!408277 () Bool)

(assert (=> b!418575 m!408277))

(declare-fun m!408279 () Bool)

(assert (=> b!418564 m!408279))

(assert (=> b!418564 m!408255))

(declare-fun m!408281 () Bool)

(assert (=> b!418564 m!408281))

(declare-fun m!408283 () Bool)

(assert (=> b!418579 m!408283))

(declare-fun m!408285 () Bool)

(assert (=> b!418577 m!408285))

(assert (=> b!418577 m!408285))

(declare-fun m!408287 () Bool)

(assert (=> b!418577 m!408287))

(declare-fun m!408289 () Bool)

(assert (=> b!418577 m!408289))

(declare-fun m!408291 () Bool)

(assert (=> start!39374 m!408291))

(declare-fun m!408293 () Bool)

(assert (=> start!39374 m!408293))

(declare-fun m!408295 () Bool)

(assert (=> b!418574 m!408295))

(declare-fun m!408297 () Bool)

(assert (=> b!418574 m!408297))

(declare-fun m!408299 () Bool)

(assert (=> bm!29128 m!408299))

(declare-fun m!408301 () Bool)

(assert (=> b!418569 m!408301))

(declare-fun m!408303 () Bool)

(assert (=> b!418571 m!408303))

(check-sat (not b!418569) (not b_next!9655) (not b!418579) (not mapNonEmpty!17832) (not b!418577) (not b!418565) tp_is_empty!10807 (not b!418564) (not bm!29127) (not b!418570) (not bm!29128) (not b!418571) (not b!418576) (not start!39374) (not b!418574) (not b_lambda!8981) (not b!418567) b_and!17201 (not b!418578))
(check-sat b_and!17201 (not b_next!9655))
