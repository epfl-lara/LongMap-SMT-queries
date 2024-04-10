; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39364 () Bool)

(assert start!39364)

(declare-fun b_free!9631 () Bool)

(declare-fun b_next!9631 () Bool)

(assert (=> start!39364 (= b_free!9631 (not b_next!9631))))

(declare-fun tp!34421 () Bool)

(declare-fun b_and!17137 () Bool)

(assert (=> start!39364 (= tp!34421 b_and!17137)))

(declare-fun b!417902 () Bool)

(declare-fun res!243440 () Bool)

(declare-fun e!249271 () Bool)

(assert (=> b!417902 (=> (not res!243440) (not e!249271))))

(declare-datatypes ((array!25417 0))(
  ( (array!25418 (arr!12158 (Array (_ BitVec 32) (_ BitVec 64))) (size!12510 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25417)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417902 (= res!243440 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!417903 () Bool)

(declare-fun res!243437 () Bool)

(assert (=> b!417903 (=> (not res!243437) (not e!249271))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417903 (= res!243437 (validMask!0 mask!1025))))

(declare-fun b!417904 () Bool)

(declare-fun e!249276 () Bool)

(declare-datatypes ((V!15483 0))(
  ( (V!15484 (val!5436 Int)) )
))
(declare-datatypes ((tuple2!7102 0))(
  ( (tuple2!7103 (_1!3562 (_ BitVec 64)) (_2!3562 V!15483)) )
))
(declare-datatypes ((List!7117 0))(
  ( (Nil!7114) (Cons!7113 (h!7969 tuple2!7102) (t!12413 List!7117)) )
))
(declare-datatypes ((ListLongMap!6015 0))(
  ( (ListLongMap!6016 (toList!3023 List!7117)) )
))
(declare-fun call!29071 () ListLongMap!6015)

(declare-fun call!29072 () ListLongMap!6015)

(assert (=> b!417904 (= e!249276 (= call!29071 call!29072))))

(declare-fun b!417905 () Bool)

(declare-fun res!243434 () Bool)

(assert (=> b!417905 (=> (not res!243434) (not e!249271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417905 (= res!243434 (validKeyInArray!0 k!794))))

(declare-fun b!417906 () Bool)

(declare-fun res!243439 () Bool)

(assert (=> b!417906 (=> (not res!243439) (not e!249271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25417 (_ BitVec 32)) Bool)

(assert (=> b!417906 (= res!243439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun minValue!515 () V!15483)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!191490 () array!25417)

(declare-fun bm!29068 () Bool)

(declare-datatypes ((ValueCell!5048 0))(
  ( (ValueCellFull!5048 (v!7683 V!15483)) (EmptyCell!5048) )
))
(declare-datatypes ((array!25419 0))(
  ( (array!25420 (arr!12159 (Array (_ BitVec 32) ValueCell!5048)) (size!12511 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25419)

(declare-fun zeroValue!515 () V!15483)

(declare-fun lt!191487 () array!25419)

(declare-fun c!55160 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1228 (array!25417 array!25419 (_ BitVec 32) (_ BitVec 32) V!15483 V!15483 (_ BitVec 32) Int) ListLongMap!6015)

(assert (=> bm!29068 (= call!29071 (getCurrentListMapNoExtraKeys!1228 (ite c!55160 _keys!709 lt!191490) (ite c!55160 _values!549 lt!191487) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417907 () Bool)

(declare-fun e!249269 () Bool)

(assert (=> b!417907 (= e!249269 true)))

(declare-fun lt!191489 () tuple2!7102)

(declare-fun lt!191494 () ListLongMap!6015)

(declare-fun lt!191488 () V!15483)

(declare-fun +!1223 (ListLongMap!6015 tuple2!7102) ListLongMap!6015)

(assert (=> b!417907 (= (+!1223 lt!191494 lt!191489) (+!1223 (+!1223 lt!191494 (tuple2!7103 k!794 lt!191488)) lt!191489))))

(declare-fun lt!191492 () V!15483)

(assert (=> b!417907 (= lt!191489 (tuple2!7103 k!794 lt!191492))))

(declare-datatypes ((Unit!12350 0))(
  ( (Unit!12351) )
))
(declare-fun lt!191491 () Unit!12350)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!23 (ListLongMap!6015 (_ BitVec 64) V!15483 V!15483) Unit!12350)

(assert (=> b!417907 (= lt!191491 (addSameAsAddTwiceSameKeyDiffValues!23 lt!191494 k!794 lt!191488 lt!191492))))

(declare-fun lt!191493 () V!15483)

(declare-fun get!6019 (ValueCell!5048 V!15483) V!15483)

(assert (=> b!417907 (= lt!191488 (get!6019 (select (arr!12159 _values!549) from!863) lt!191493))))

(declare-fun lt!191485 () ListLongMap!6015)

(assert (=> b!417907 (= lt!191485 (+!1223 lt!191494 (tuple2!7103 (select (arr!12158 lt!191490) from!863) lt!191492)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15483)

(assert (=> b!417907 (= lt!191492 (get!6019 (select (store (arr!12159 _values!549) i!563 (ValueCellFull!5048 v!412)) from!863) lt!191493))))

(declare-fun dynLambda!694 (Int (_ BitVec 64)) V!15483)

(assert (=> b!417907 (= lt!191493 (dynLambda!694 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417907 (= lt!191494 (getCurrentListMapNoExtraKeys!1228 lt!191490 lt!191487 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417908 () Bool)

(declare-fun e!249274 () Bool)

(assert (=> b!417908 (= e!249271 e!249274)))

(declare-fun res!243445 () Bool)

(assert (=> b!417908 (=> (not res!243445) (not e!249274))))

(assert (=> b!417908 (= res!243445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191490 mask!1025))))

(assert (=> b!417908 (= lt!191490 (array!25418 (store (arr!12158 _keys!709) i!563 k!794) (size!12510 _keys!709)))))

(declare-fun bm!29069 () Bool)

(assert (=> bm!29069 (= call!29072 (getCurrentListMapNoExtraKeys!1228 (ite c!55160 lt!191490 _keys!709) (ite c!55160 lt!191487 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17796 () Bool)

(declare-fun mapRes!17796 () Bool)

(declare-fun tp!34422 () Bool)

(declare-fun e!249272 () Bool)

(assert (=> mapNonEmpty!17796 (= mapRes!17796 (and tp!34422 e!249272))))

(declare-fun mapRest!17796 () (Array (_ BitVec 32) ValueCell!5048))

(declare-fun mapKey!17796 () (_ BitVec 32))

(declare-fun mapValue!17796 () ValueCell!5048)

(assert (=> mapNonEmpty!17796 (= (arr!12159 _values!549) (store mapRest!17796 mapKey!17796 mapValue!17796))))

(declare-fun b!417909 () Bool)

(declare-fun e!249270 () Bool)

(declare-fun tp_is_empty!10783 () Bool)

(assert (=> b!417909 (= e!249270 tp_is_empty!10783)))

(declare-fun b!417910 () Bool)

(declare-fun res!243436 () Bool)

(assert (=> b!417910 (=> (not res!243436) (not e!249274))))

(declare-datatypes ((List!7118 0))(
  ( (Nil!7115) (Cons!7114 (h!7970 (_ BitVec 64)) (t!12414 List!7118)) )
))
(declare-fun arrayNoDuplicates!0 (array!25417 (_ BitVec 32) List!7118) Bool)

(assert (=> b!417910 (= res!243436 (arrayNoDuplicates!0 lt!191490 #b00000000000000000000000000000000 Nil!7115))))

(declare-fun b!417911 () Bool)

(declare-fun e!249268 () Bool)

(assert (=> b!417911 (= e!249268 (and e!249270 mapRes!17796))))

(declare-fun condMapEmpty!17796 () Bool)

(declare-fun mapDefault!17796 () ValueCell!5048)

