; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39648 () Bool)

(assert start!39648)

(declare-fun b_free!9915 () Bool)

(declare-fun b_next!9915 () Bool)

(assert (=> start!39648 (= b_free!9915 (not b_next!9915))))

(declare-fun tp!35273 () Bool)

(declare-fun b_and!17571 () Bool)

(assert (=> start!39648 (= tp!35273 b_and!17571)))

(declare-fun b!425375 () Bool)

(declare-fun res!249045 () Bool)

(declare-fun e!252536 () Bool)

(assert (=> b!425375 (=> (not res!249045) (not e!252536))))

(declare-datatypes ((array!25973 0))(
  ( (array!25974 (arr!12436 (Array (_ BitVec 32) (_ BitVec 64))) (size!12788 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25973)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425375 (= res!249045 (or (= (select (arr!12436 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12436 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425376 () Bool)

(declare-fun res!249043 () Bool)

(assert (=> b!425376 (=> (not res!249043) (not e!252536))))

(assert (=> b!425376 (= res!249043 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12788 _keys!709))))))

(declare-fun b!425377 () Bool)

(declare-fun e!252540 () Bool)

(declare-fun e!252539 () Bool)

(declare-fun mapRes!18222 () Bool)

(assert (=> b!425377 (= e!252540 (and e!252539 mapRes!18222))))

(declare-fun condMapEmpty!18222 () Bool)

(declare-datatypes ((V!15861 0))(
  ( (V!15862 (val!5578 Int)) )
))
(declare-datatypes ((ValueCell!5190 0))(
  ( (ValueCellFull!5190 (v!7825 V!15861)) (EmptyCell!5190) )
))
(declare-datatypes ((array!25975 0))(
  ( (array!25976 (arr!12437 (Array (_ BitVec 32) ValueCell!5190)) (size!12789 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25975)

(declare-fun mapDefault!18222 () ValueCell!5190)

(assert (=> b!425377 (= condMapEmpty!18222 (= (arr!12437 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5190)) mapDefault!18222)))))

(declare-fun b!425378 () Bool)

(declare-fun e!252538 () Bool)

(assert (=> b!425378 (= e!252536 e!252538)))

(declare-fun res!249034 () Bool)

(assert (=> b!425378 (=> (not res!249034) (not e!252538))))

(declare-fun lt!194631 () array!25973)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25973 (_ BitVec 32)) Bool)

(assert (=> b!425378 (= res!249034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194631 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!425378 (= lt!194631 (array!25974 (store (arr!12436 _keys!709) i!563 k0!794) (size!12788 _keys!709)))))

(declare-fun b!425379 () Bool)

(declare-fun res!249044 () Bool)

(assert (=> b!425379 (=> (not res!249044) (not e!252536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425379 (= res!249044 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18222 () Bool)

(assert (=> mapIsEmpty!18222 mapRes!18222))

(declare-fun b!425380 () Bool)

(declare-fun tp_is_empty!11067 () Bool)

(assert (=> b!425380 (= e!252539 tp_is_empty!11067)))

(declare-fun b!425381 () Bool)

(declare-fun res!249042 () Bool)

(assert (=> b!425381 (=> (not res!249042) (not e!252538))))

(declare-datatypes ((List!7336 0))(
  ( (Nil!7333) (Cons!7332 (h!8188 (_ BitVec 64)) (t!12780 List!7336)) )
))
(declare-fun arrayNoDuplicates!0 (array!25973 (_ BitVec 32) List!7336) Bool)

(assert (=> b!425381 (= res!249042 (arrayNoDuplicates!0 lt!194631 #b00000000000000000000000000000000 Nil!7333))))

(declare-fun b!425382 () Bool)

(declare-fun res!249033 () Bool)

(assert (=> b!425382 (=> (not res!249033) (not e!252538))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425382 (= res!249033 (bvsle from!863 i!563))))

(declare-fun b!425383 () Bool)

(declare-fun res!249040 () Bool)

(assert (=> b!425383 (=> (not res!249040) (not e!252536))))

(assert (=> b!425383 (= res!249040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425384 () Bool)

(declare-fun res!249041 () Bool)

(assert (=> b!425384 (=> (not res!249041) (not e!252536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425384 (= res!249041 (validKeyInArray!0 k0!794))))

(declare-fun b!425385 () Bool)

(declare-fun res!249036 () Bool)

(assert (=> b!425385 (=> (not res!249036) (not e!252536))))

(assert (=> b!425385 (= res!249036 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7333))))

(declare-fun b!425386 () Bool)

(declare-fun e!252534 () Bool)

(assert (=> b!425386 (= e!252534 (not true))))

(declare-fun minValue!515 () V!15861)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15861)

(declare-fun lt!194632 () array!25975)

(declare-fun v!412 () V!15861)

(declare-datatypes ((tuple2!7324 0))(
  ( (tuple2!7325 (_1!3673 (_ BitVec 64)) (_2!3673 V!15861)) )
))
(declare-datatypes ((List!7337 0))(
  ( (Nil!7334) (Cons!7333 (h!8189 tuple2!7324) (t!12781 List!7337)) )
))
(declare-datatypes ((ListLongMap!6237 0))(
  ( (ListLongMap!6238 (toList!3134 List!7337)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1338 (array!25973 array!25975 (_ BitVec 32) (_ BitVec 32) V!15861 V!15861 (_ BitVec 32) Int) ListLongMap!6237)

(declare-fun +!1292 (ListLongMap!6237 tuple2!7324) ListLongMap!6237)

(assert (=> b!425386 (= (getCurrentListMapNoExtraKeys!1338 lt!194631 lt!194632 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1292 (getCurrentListMapNoExtraKeys!1338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7325 k0!794 v!412)))))

(declare-datatypes ((Unit!12486 0))(
  ( (Unit!12487) )
))
(declare-fun lt!194629 () Unit!12486)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!487 (array!25973 array!25975 (_ BitVec 32) (_ BitVec 32) V!15861 V!15861 (_ BitVec 32) (_ BitVec 64) V!15861 (_ BitVec 32) Int) Unit!12486)

(assert (=> b!425386 (= lt!194629 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18222 () Bool)

(declare-fun tp!35274 () Bool)

(declare-fun e!252535 () Bool)

(assert (=> mapNonEmpty!18222 (= mapRes!18222 (and tp!35274 e!252535))))

(declare-fun mapRest!18222 () (Array (_ BitVec 32) ValueCell!5190))

(declare-fun mapValue!18222 () ValueCell!5190)

(declare-fun mapKey!18222 () (_ BitVec 32))

(assert (=> mapNonEmpty!18222 (= (arr!12437 _values!549) (store mapRest!18222 mapKey!18222 mapValue!18222))))

(declare-fun b!425387 () Bool)

(declare-fun res!249039 () Bool)

(assert (=> b!425387 (=> (not res!249039) (not e!252536))))

(assert (=> b!425387 (= res!249039 (and (= (size!12789 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12788 _keys!709) (size!12789 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425388 () Bool)

(declare-fun res!249037 () Bool)

(assert (=> b!425388 (=> (not res!249037) (not e!252536))))

(declare-fun arrayContainsKey!0 (array!25973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425388 (= res!249037 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!249038 () Bool)

(assert (=> start!39648 (=> (not res!249038) (not e!252536))))

(assert (=> start!39648 (= res!249038 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12788 _keys!709))))))

(assert (=> start!39648 e!252536))

(assert (=> start!39648 tp_is_empty!11067))

(assert (=> start!39648 tp!35273))

(assert (=> start!39648 true))

(declare-fun array_inv!9062 (array!25975) Bool)

(assert (=> start!39648 (and (array_inv!9062 _values!549) e!252540)))

(declare-fun array_inv!9063 (array!25973) Bool)

(assert (=> start!39648 (array_inv!9063 _keys!709)))

(declare-fun b!425389 () Bool)

(assert (=> b!425389 (= e!252538 e!252534)))

(declare-fun res!249035 () Bool)

(assert (=> b!425389 (=> (not res!249035) (not e!252534))))

(assert (=> b!425389 (= res!249035 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194630 () ListLongMap!6237)

(assert (=> b!425389 (= lt!194630 (getCurrentListMapNoExtraKeys!1338 lt!194631 lt!194632 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425389 (= lt!194632 (array!25976 (store (arr!12437 _values!549) i!563 (ValueCellFull!5190 v!412)) (size!12789 _values!549)))))

(declare-fun lt!194633 () ListLongMap!6237)

(assert (=> b!425389 (= lt!194633 (getCurrentListMapNoExtraKeys!1338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425390 () Bool)

(assert (=> b!425390 (= e!252535 tp_is_empty!11067)))

(assert (= (and start!39648 res!249038) b!425379))

(assert (= (and b!425379 res!249044) b!425387))

(assert (= (and b!425387 res!249039) b!425383))

(assert (= (and b!425383 res!249040) b!425385))

(assert (= (and b!425385 res!249036) b!425376))

(assert (= (and b!425376 res!249043) b!425384))

(assert (= (and b!425384 res!249041) b!425375))

(assert (= (and b!425375 res!249045) b!425388))

(assert (= (and b!425388 res!249037) b!425378))

(assert (= (and b!425378 res!249034) b!425381))

(assert (= (and b!425381 res!249042) b!425382))

(assert (= (and b!425382 res!249033) b!425389))

(assert (= (and b!425389 res!249035) b!425386))

(assert (= (and b!425377 condMapEmpty!18222) mapIsEmpty!18222))

(assert (= (and b!425377 (not condMapEmpty!18222)) mapNonEmpty!18222))

(get-info :version)

(assert (= (and mapNonEmpty!18222 ((_ is ValueCellFull!5190) mapValue!18222)) b!425390))

(assert (= (and b!425377 ((_ is ValueCellFull!5190) mapDefault!18222)) b!425380))

(assert (= start!39648 b!425377))

(declare-fun m!414287 () Bool)

(assert (=> b!425378 m!414287))

(declare-fun m!414289 () Bool)

(assert (=> b!425378 m!414289))

(declare-fun m!414291 () Bool)

(assert (=> start!39648 m!414291))

(declare-fun m!414293 () Bool)

(assert (=> start!39648 m!414293))

(declare-fun m!414295 () Bool)

(assert (=> b!425384 m!414295))

(declare-fun m!414297 () Bool)

(assert (=> b!425383 m!414297))

(declare-fun m!414299 () Bool)

(assert (=> b!425389 m!414299))

(declare-fun m!414301 () Bool)

(assert (=> b!425389 m!414301))

(declare-fun m!414303 () Bool)

(assert (=> b!425389 m!414303))

(declare-fun m!414305 () Bool)

(assert (=> b!425375 m!414305))

(declare-fun m!414307 () Bool)

(assert (=> b!425385 m!414307))

(declare-fun m!414309 () Bool)

(assert (=> b!425381 m!414309))

(declare-fun m!414311 () Bool)

(assert (=> mapNonEmpty!18222 m!414311))

(declare-fun m!414313 () Bool)

(assert (=> b!425388 m!414313))

(declare-fun m!414315 () Bool)

(assert (=> b!425379 m!414315))

(declare-fun m!414317 () Bool)

(assert (=> b!425386 m!414317))

(declare-fun m!414319 () Bool)

(assert (=> b!425386 m!414319))

(assert (=> b!425386 m!414319))

(declare-fun m!414321 () Bool)

(assert (=> b!425386 m!414321))

(declare-fun m!414323 () Bool)

(assert (=> b!425386 m!414323))

(check-sat (not b!425378) (not b!425379) (not b!425389) (not b_next!9915) (not mapNonEmpty!18222) (not b!425386) b_and!17571 (not start!39648) tp_is_empty!11067 (not b!425381) (not b!425384) (not b!425385) (not b!425388) (not b!425383))
(check-sat b_and!17571 (not b_next!9915))
