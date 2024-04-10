; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39456 () Bool)

(assert start!39456)

(declare-fun b_free!9723 () Bool)

(declare-fun b_next!9723 () Bool)

(assert (=> start!39456 (= b_free!9723 (not b_next!9723))))

(declare-fun tp!34698 () Bool)

(declare-fun b_and!17321 () Bool)

(assert (=> start!39456 (= tp!34698 b_and!17321)))

(declare-fun b!420616 () Bool)

(declare-fun res!245379 () Bool)

(declare-fun e!250512 () Bool)

(assert (=> b!420616 (=> (not res!245379) (not e!250512))))

(declare-datatypes ((array!25599 0))(
  ( (array!25600 (arr!12249 (Array (_ BitVec 32) (_ BitVec 64))) (size!12601 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25599)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25599 (_ BitVec 32)) Bool)

(assert (=> b!420616 (= res!245379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420617 () Bool)

(declare-fun res!245377 () Bool)

(assert (=> b!420617 (=> (not res!245377) (not e!250512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420617 (= res!245377 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17934 () Bool)

(declare-fun mapRes!17934 () Bool)

(declare-fun tp!34697 () Bool)

(declare-fun e!250517 () Bool)

(assert (=> mapNonEmpty!17934 (= mapRes!17934 (and tp!34697 e!250517))))

(declare-datatypes ((V!15605 0))(
  ( (V!15606 (val!5482 Int)) )
))
(declare-datatypes ((ValueCell!5094 0))(
  ( (ValueCellFull!5094 (v!7729 V!15605)) (EmptyCell!5094) )
))
(declare-datatypes ((array!25601 0))(
  ( (array!25602 (arr!12250 (Array (_ BitVec 32) ValueCell!5094)) (size!12602 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25601)

(declare-fun mapValue!17934 () ValueCell!5094)

(declare-fun mapKey!17934 () (_ BitVec 32))

(declare-fun mapRest!17934 () (Array (_ BitVec 32) ValueCell!5094))

(assert (=> mapNonEmpty!17934 (= (arr!12250 _values!549) (store mapRest!17934 mapKey!17934 mapValue!17934))))

(declare-fun b!420618 () Bool)

(declare-fun res!245368 () Bool)

(assert (=> b!420618 (=> (not res!245368) (not e!250512))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420618 (= res!245368 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420619 () Bool)

(declare-fun e!250511 () Bool)

(declare-fun e!250516 () Bool)

(assert (=> b!420619 (= e!250511 e!250516)))

(declare-fun res!245369 () Bool)

(assert (=> b!420619 (=> (not res!245369) (not e!250516))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420619 (= res!245369 (= from!863 i!563))))

(declare-fun minValue!515 () V!15605)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15605)

(declare-fun lt!193013 () array!25599)

(declare-fun lt!193004 () array!25601)

(declare-datatypes ((tuple2!7186 0))(
  ( (tuple2!7187 (_1!3604 (_ BitVec 64)) (_2!3604 V!15605)) )
))
(declare-datatypes ((List!7193 0))(
  ( (Nil!7190) (Cons!7189 (h!8045 tuple2!7186) (t!12581 List!7193)) )
))
(declare-datatypes ((ListLongMap!6099 0))(
  ( (ListLongMap!6100 (toList!3065 List!7193)) )
))
(declare-fun lt!193008 () ListLongMap!6099)

(declare-fun getCurrentListMapNoExtraKeys!1269 (array!25599 array!25601 (_ BitVec 32) (_ BitVec 32) V!15605 V!15605 (_ BitVec 32) Int) ListLongMap!6099)

(assert (=> b!420619 (= lt!193008 (getCurrentListMapNoExtraKeys!1269 lt!193013 lt!193004 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15605)

(assert (=> b!420619 (= lt!193004 (array!25602 (store (arr!12250 _values!549) i!563 (ValueCellFull!5094 v!412)) (size!12602 _values!549)))))

(declare-fun lt!193010 () ListLongMap!6099)

(assert (=> b!420619 (= lt!193010 (getCurrentListMapNoExtraKeys!1269 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!245378 () Bool)

(assert (=> start!39456 (=> (not res!245378) (not e!250512))))

(assert (=> start!39456 (= res!245378 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12601 _keys!709))))))

(assert (=> start!39456 e!250512))

(declare-fun tp_is_empty!10875 () Bool)

(assert (=> start!39456 tp_is_empty!10875))

(assert (=> start!39456 tp!34698))

(assert (=> start!39456 true))

(declare-fun e!250510 () Bool)

(declare-fun array_inv!8930 (array!25601) Bool)

(assert (=> start!39456 (and (array_inv!8930 _values!549) e!250510)))

(declare-fun array_inv!8931 (array!25599) Bool)

(assert (=> start!39456 (array_inv!8931 _keys!709)))

(declare-fun b!420620 () Bool)

(declare-fun e!250518 () Bool)

(assert (=> b!420620 (= e!250516 (not e!250518))))

(declare-fun res!245371 () Bool)

(assert (=> b!420620 (=> res!245371 e!250518)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420620 (= res!245371 (validKeyInArray!0 (select (arr!12249 _keys!709) from!863)))))

(declare-fun e!250513 () Bool)

(assert (=> b!420620 e!250513))

(declare-fun c!55298 () Bool)

(assert (=> b!420620 (= c!55298 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12426 0))(
  ( (Unit!12427) )
))
(declare-fun lt!193005 () Unit!12426)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!460 (array!25599 array!25601 (_ BitVec 32) (_ BitVec 32) V!15605 V!15605 (_ BitVec 32) (_ BitVec 64) V!15605 (_ BitVec 32) Int) Unit!12426)

(assert (=> b!420620 (= lt!193005 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!460 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420621 () Bool)

(declare-fun e!250515 () Bool)

(assert (=> b!420621 (= e!250510 (and e!250515 mapRes!17934))))

(declare-fun condMapEmpty!17934 () Bool)

(declare-fun mapDefault!17934 () ValueCell!5094)

(assert (=> b!420621 (= condMapEmpty!17934 (= (arr!12250 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5094)) mapDefault!17934)))))

(declare-fun bm!29344 () Bool)

(declare-fun call!29347 () ListLongMap!6099)

(assert (=> bm!29344 (= call!29347 (getCurrentListMapNoExtraKeys!1269 (ite c!55298 lt!193013 _keys!709) (ite c!55298 lt!193004 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420622 () Bool)

(declare-fun res!245367 () Bool)

(assert (=> b!420622 (=> (not res!245367) (not e!250511))))

(assert (=> b!420622 (= res!245367 (bvsle from!863 i!563))))

(declare-fun b!420623 () Bool)

(declare-fun call!29348 () ListLongMap!6099)

(assert (=> b!420623 (= e!250513 (= call!29348 call!29347))))

(declare-fun b!420624 () Bool)

(assert (=> b!420624 (= e!250518 true)))

(declare-fun lt!193011 () tuple2!7186)

(declare-fun lt!193012 () V!15605)

(declare-fun lt!193006 () ListLongMap!6099)

(declare-fun +!1262 (ListLongMap!6099 tuple2!7186) ListLongMap!6099)

(assert (=> b!420624 (= (+!1262 lt!193006 lt!193011) (+!1262 (+!1262 lt!193006 (tuple2!7187 k0!794 lt!193012)) lt!193011))))

(declare-fun lt!193007 () V!15605)

(assert (=> b!420624 (= lt!193011 (tuple2!7187 k0!794 lt!193007))))

(declare-fun lt!193009 () Unit!12426)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!58 (ListLongMap!6099 (_ BitVec 64) V!15605 V!15605) Unit!12426)

(assert (=> b!420624 (= lt!193009 (addSameAsAddTwiceSameKeyDiffValues!58 lt!193006 k0!794 lt!193012 lt!193007))))

(declare-fun lt!193003 () V!15605)

(declare-fun get!6084 (ValueCell!5094 V!15605) V!15605)

(assert (=> b!420624 (= lt!193012 (get!6084 (select (arr!12250 _values!549) from!863) lt!193003))))

(assert (=> b!420624 (= lt!193008 (+!1262 lt!193006 (tuple2!7187 (select (arr!12249 lt!193013) from!863) lt!193007)))))

(assert (=> b!420624 (= lt!193007 (get!6084 (select (store (arr!12250 _values!549) i!563 (ValueCellFull!5094 v!412)) from!863) lt!193003))))

(declare-fun dynLambda!729 (Int (_ BitVec 64)) V!15605)

(assert (=> b!420624 (= lt!193003 (dynLambda!729 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420624 (= lt!193006 (getCurrentListMapNoExtraKeys!1269 lt!193013 lt!193004 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420625 () Bool)

(assert (=> b!420625 (= e!250517 tp_is_empty!10875)))

(declare-fun b!420626 () Bool)

(declare-fun res!245374 () Bool)

(assert (=> b!420626 (=> (not res!245374) (not e!250512))))

(assert (=> b!420626 (= res!245374 (and (= (size!12602 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12601 _keys!709) (size!12602 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17934 () Bool)

(assert (=> mapIsEmpty!17934 mapRes!17934))

(declare-fun b!420627 () Bool)

(declare-fun res!245373 () Bool)

(assert (=> b!420627 (=> (not res!245373) (not e!250511))))

(declare-datatypes ((List!7194 0))(
  ( (Nil!7191) (Cons!7190 (h!8046 (_ BitVec 64)) (t!12582 List!7194)) )
))
(declare-fun arrayNoDuplicates!0 (array!25599 (_ BitVec 32) List!7194) Bool)

(assert (=> b!420627 (= res!245373 (arrayNoDuplicates!0 lt!193013 #b00000000000000000000000000000000 Nil!7191))))

(declare-fun b!420628 () Bool)

(assert (=> b!420628 (= e!250512 e!250511)))

(declare-fun res!245376 () Bool)

(assert (=> b!420628 (=> (not res!245376) (not e!250511))))

(assert (=> b!420628 (= res!245376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193013 mask!1025))))

(assert (=> b!420628 (= lt!193013 (array!25600 (store (arr!12249 _keys!709) i!563 k0!794) (size!12601 _keys!709)))))

(declare-fun bm!29345 () Bool)

(assert (=> bm!29345 (= call!29348 (getCurrentListMapNoExtraKeys!1269 (ite c!55298 _keys!709 lt!193013) (ite c!55298 _values!549 lt!193004) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420629 () Bool)

(declare-fun res!245366 () Bool)

(assert (=> b!420629 (=> (not res!245366) (not e!250512))))

(assert (=> b!420629 (= res!245366 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12601 _keys!709))))))

(declare-fun b!420630 () Bool)

(declare-fun res!245372 () Bool)

(assert (=> b!420630 (=> (not res!245372) (not e!250512))))

(assert (=> b!420630 (= res!245372 (validKeyInArray!0 k0!794))))

(declare-fun b!420631 () Bool)

(declare-fun res!245375 () Bool)

(assert (=> b!420631 (=> (not res!245375) (not e!250512))))

(assert (=> b!420631 (= res!245375 (or (= (select (arr!12249 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12249 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420632 () Bool)

(assert (=> b!420632 (= e!250513 (= call!29347 (+!1262 call!29348 (tuple2!7187 k0!794 v!412))))))

(declare-fun b!420633 () Bool)

(declare-fun res!245370 () Bool)

(assert (=> b!420633 (=> (not res!245370) (not e!250512))))

(assert (=> b!420633 (= res!245370 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7191))))

(declare-fun b!420634 () Bool)

(assert (=> b!420634 (= e!250515 tp_is_empty!10875)))

(assert (= (and start!39456 res!245378) b!420617))

(assert (= (and b!420617 res!245377) b!420626))

(assert (= (and b!420626 res!245374) b!420616))

(assert (= (and b!420616 res!245379) b!420633))

(assert (= (and b!420633 res!245370) b!420629))

(assert (= (and b!420629 res!245366) b!420630))

(assert (= (and b!420630 res!245372) b!420631))

(assert (= (and b!420631 res!245375) b!420618))

(assert (= (and b!420618 res!245368) b!420628))

(assert (= (and b!420628 res!245376) b!420627))

(assert (= (and b!420627 res!245373) b!420622))

(assert (= (and b!420622 res!245367) b!420619))

(assert (= (and b!420619 res!245369) b!420620))

(assert (= (and b!420620 c!55298) b!420632))

(assert (= (and b!420620 (not c!55298)) b!420623))

(assert (= (or b!420632 b!420623) bm!29344))

(assert (= (or b!420632 b!420623) bm!29345))

(assert (= (and b!420620 (not res!245371)) b!420624))

(assert (= (and b!420621 condMapEmpty!17934) mapIsEmpty!17934))

(assert (= (and b!420621 (not condMapEmpty!17934)) mapNonEmpty!17934))

(get-info :version)

(assert (= (and mapNonEmpty!17934 ((_ is ValueCellFull!5094) mapValue!17934)) b!420625))

(assert (= (and b!420621 ((_ is ValueCellFull!5094) mapDefault!17934)) b!420634))

(assert (= start!39456 b!420621))

(declare-fun b_lambda!9027 () Bool)

(assert (=> (not b_lambda!9027) (not b!420624)))

(declare-fun t!12580 () Bool)

(declare-fun tb!3345 () Bool)

(assert (=> (and start!39456 (= defaultEntry!557 defaultEntry!557) t!12580) tb!3345))

(declare-fun result!6217 () Bool)

(assert (=> tb!3345 (= result!6217 tp_is_empty!10875)))

(assert (=> b!420624 t!12580))

(declare-fun b_and!17323 () Bool)

(assert (= b_and!17321 (and (=> t!12580 result!6217) b_and!17323)))

(declare-fun m!410261 () Bool)

(assert (=> b!420631 m!410261))

(declare-fun m!410263 () Bool)

(assert (=> mapNonEmpty!17934 m!410263))

(declare-fun m!410265 () Bool)

(assert (=> b!420620 m!410265))

(assert (=> b!420620 m!410265))

(declare-fun m!410267 () Bool)

(assert (=> b!420620 m!410267))

(declare-fun m!410269 () Bool)

(assert (=> b!420620 m!410269))

(declare-fun m!410271 () Bool)

(assert (=> start!39456 m!410271))

(declare-fun m!410273 () Bool)

(assert (=> start!39456 m!410273))

(declare-fun m!410275 () Bool)

(assert (=> b!420633 m!410275))

(declare-fun m!410277 () Bool)

(assert (=> b!420632 m!410277))

(declare-fun m!410279 () Bool)

(assert (=> bm!29344 m!410279))

(declare-fun m!410281 () Bool)

(assert (=> b!420630 m!410281))

(declare-fun m!410283 () Bool)

(assert (=> b!420617 m!410283))

(declare-fun m!410285 () Bool)

(assert (=> b!420627 m!410285))

(declare-fun m!410287 () Bool)

(assert (=> bm!29345 m!410287))

(declare-fun m!410289 () Bool)

(assert (=> b!420628 m!410289))

(declare-fun m!410291 () Bool)

(assert (=> b!420628 m!410291))

(declare-fun m!410293 () Bool)

(assert (=> b!420616 m!410293))

(declare-fun m!410295 () Bool)

(assert (=> b!420624 m!410295))

(declare-fun m!410297 () Bool)

(assert (=> b!420624 m!410297))

(declare-fun m!410299 () Bool)

(assert (=> b!420624 m!410299))

(declare-fun m!410301 () Bool)

(assert (=> b!420624 m!410301))

(assert (=> b!420624 m!410295))

(declare-fun m!410303 () Bool)

(assert (=> b!420624 m!410303))

(declare-fun m!410305 () Bool)

(assert (=> b!420624 m!410305))

(assert (=> b!420624 m!410303))

(declare-fun m!410307 () Bool)

(assert (=> b!420624 m!410307))

(declare-fun m!410309 () Bool)

(assert (=> b!420624 m!410309))

(assert (=> b!420624 m!410305))

(declare-fun m!410311 () Bool)

(assert (=> b!420624 m!410311))

(declare-fun m!410313 () Bool)

(assert (=> b!420624 m!410313))

(declare-fun m!410315 () Bool)

(assert (=> b!420624 m!410315))

(declare-fun m!410317 () Bool)

(assert (=> b!420624 m!410317))

(declare-fun m!410319 () Bool)

(assert (=> b!420624 m!410319))

(declare-fun m!410321 () Bool)

(assert (=> b!420618 m!410321))

(declare-fun m!410323 () Bool)

(assert (=> b!420619 m!410323))

(assert (=> b!420619 m!410317))

(declare-fun m!410325 () Bool)

(assert (=> b!420619 m!410325))

(check-sat (not start!39456) (not bm!29344) (not b!420618) (not b!420632) (not b!420616) (not b!420630) (not b_lambda!9027) tp_is_empty!10875 (not mapNonEmpty!17934) (not b!420633) b_and!17323 (not b!420624) (not b!420627) (not b!420619) (not bm!29345) (not b_next!9723) (not b!420628) (not b!420620) (not b!420617))
(check-sat b_and!17323 (not b_next!9723))
