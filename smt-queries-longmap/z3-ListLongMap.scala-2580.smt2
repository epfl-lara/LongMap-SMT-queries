; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39284 () Bool)

(assert start!39284)

(declare-fun b_free!9565 () Bool)

(declare-fun b_next!9565 () Bool)

(assert (=> start!39284 (= b_free!9565 (not b_next!9565))))

(declare-fun tp!34224 () Bool)

(declare-fun b_and!17019 () Bool)

(assert (=> start!39284 (= tp!34224 b_and!17019)))

(declare-fun b!415906 () Bool)

(declare-fun res!242048 () Bool)

(declare-fun e!248346 () Bool)

(assert (=> b!415906 (=> (not res!242048) (not e!248346))))

(declare-datatypes ((array!25294 0))(
  ( (array!25295 (arr!12096 (Array (_ BitVec 32) (_ BitVec 64))) (size!12448 (_ BitVec 32))) )
))
(declare-fun lt!190421 () array!25294)

(declare-datatypes ((List!6936 0))(
  ( (Nil!6933) (Cons!6932 (h!7788 (_ BitVec 64)) (t!12158 List!6936)) )
))
(declare-fun arrayNoDuplicates!0 (array!25294 (_ BitVec 32) List!6936) Bool)

(assert (=> b!415906 (= res!242048 (arrayNoDuplicates!0 lt!190421 #b00000000000000000000000000000000 Nil!6933))))

(declare-fun mapNonEmpty!17697 () Bool)

(declare-fun mapRes!17697 () Bool)

(declare-fun tp!34223 () Bool)

(declare-fun e!248348 () Bool)

(assert (=> mapNonEmpty!17697 (= mapRes!17697 (and tp!34223 e!248348))))

(declare-datatypes ((V!15395 0))(
  ( (V!15396 (val!5403 Int)) )
))
(declare-datatypes ((ValueCell!5015 0))(
  ( (ValueCellFull!5015 (v!7651 V!15395)) (EmptyCell!5015) )
))
(declare-fun mapValue!17697 () ValueCell!5015)

(declare-datatypes ((array!25296 0))(
  ( (array!25297 (arr!12097 (Array (_ BitVec 32) ValueCell!5015)) (size!12449 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25296)

(declare-fun mapKey!17697 () (_ BitVec 32))

(declare-fun mapRest!17697 () (Array (_ BitVec 32) ValueCell!5015))

(assert (=> mapNonEmpty!17697 (= (arr!12097 _values!549) (store mapRest!17697 mapKey!17697 mapValue!17697))))

(declare-fun res!242054 () Bool)

(declare-fun e!248347 () Bool)

(assert (=> start!39284 (=> (not res!242054) (not e!248347))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!25294)

(assert (=> start!39284 (= res!242054 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12448 _keys!709))))))

(assert (=> start!39284 e!248347))

(declare-fun tp_is_empty!10717 () Bool)

(assert (=> start!39284 tp_is_empty!10717))

(assert (=> start!39284 tp!34224))

(assert (=> start!39284 true))

(declare-fun e!248345 () Bool)

(declare-fun array_inv!8902 (array!25296) Bool)

(assert (=> start!39284 (and (array_inv!8902 _values!549) e!248345)))

(declare-fun array_inv!8903 (array!25294) Bool)

(assert (=> start!39284 (array_inv!8903 _keys!709)))

(declare-fun b!415907 () Bool)

(declare-fun e!248352 () Bool)

(assert (=> b!415907 (= e!248345 (and e!248352 mapRes!17697))))

(declare-fun condMapEmpty!17697 () Bool)

(declare-fun mapDefault!17697 () ValueCell!5015)

(assert (=> b!415907 (= condMapEmpty!17697 (= (arr!12097 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5015)) mapDefault!17697)))))

(declare-fun b!415908 () Bool)

(declare-fun res!242056 () Bool)

(assert (=> b!415908 (=> (not res!242056) (not e!248347))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415908 (= res!242056 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12448 _keys!709))))))

(declare-fun b!415909 () Bool)

(declare-fun res!242045 () Bool)

(assert (=> b!415909 (=> (not res!242045) (not e!248347))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415909 (= res!242045 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415910 () Bool)

(declare-fun res!242049 () Bool)

(assert (=> b!415910 (=> (not res!242049) (not e!248347))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!415910 (= res!242049 (and (= (size!12449 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12448 _keys!709) (size!12449 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun e!248353 () Bool)

(declare-datatypes ((tuple2!6916 0))(
  ( (tuple2!6917 (_1!3469 (_ BitVec 64)) (_2!3469 V!15395)) )
))
(declare-datatypes ((List!6937 0))(
  ( (Nil!6934) (Cons!6933 (h!7789 tuple2!6916) (t!12159 List!6937)) )
))
(declare-datatypes ((ListLongMap!5831 0))(
  ( (ListLongMap!5832 (toList!2931 List!6937)) )
))
(declare-fun call!28861 () ListLongMap!5831)

(declare-fun call!28860 () ListLongMap!5831)

(declare-fun b!415911 () Bool)

(declare-fun v!412 () V!15395)

(declare-fun +!1204 (ListLongMap!5831 tuple2!6916) ListLongMap!5831)

(assert (=> b!415911 (= e!248353 (= call!28861 (+!1204 call!28860 (tuple2!6917 k0!794 v!412))))))

(declare-fun b!415912 () Bool)

(declare-fun res!242046 () Bool)

(assert (=> b!415912 (=> (not res!242046) (not e!248346))))

(assert (=> b!415912 (= res!242046 (bvsle from!863 i!563))))

(declare-fun b!415913 () Bool)

(declare-fun res!242058 () Bool)

(assert (=> b!415913 (=> (not res!242058) (not e!248347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415913 (= res!242058 (validKeyInArray!0 k0!794))))

(declare-fun b!415914 () Bool)

(assert (=> b!415914 (= e!248353 (= call!28860 call!28861))))

(declare-fun b!415915 () Bool)

(declare-fun res!242055 () Bool)

(assert (=> b!415915 (=> (not res!242055) (not e!248347))))

(assert (=> b!415915 (= res!242055 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6933))))

(declare-fun minValue!515 () V!15395)

(declare-fun zeroValue!515 () V!15395)

(declare-fun lt!190420 () array!25296)

(declare-fun c!55038 () Bool)

(declare-fun bm!28857 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1179 (array!25294 array!25296 (_ BitVec 32) (_ BitVec 32) V!15395 V!15395 (_ BitVec 32) Int) ListLongMap!5831)

(assert (=> bm!28857 (= call!28861 (getCurrentListMapNoExtraKeys!1179 (ite c!55038 lt!190421 _keys!709) (ite c!55038 lt!190420 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17697 () Bool)

(assert (=> mapIsEmpty!17697 mapRes!17697))

(declare-fun b!415916 () Bool)

(declare-fun e!248351 () Bool)

(assert (=> b!415916 (= e!248346 e!248351)))

(declare-fun res!242050 () Bool)

(assert (=> b!415916 (=> (not res!242050) (not e!248351))))

(assert (=> b!415916 (= res!242050 (= from!863 i!563))))

(declare-fun lt!190415 () ListLongMap!5831)

(assert (=> b!415916 (= lt!190415 (getCurrentListMapNoExtraKeys!1179 lt!190421 lt!190420 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415916 (= lt!190420 (array!25297 (store (arr!12097 _values!549) i!563 (ValueCellFull!5015 v!412)) (size!12449 _values!549)))))

(declare-fun lt!190416 () ListLongMap!5831)

(assert (=> b!415916 (= lt!190416 (getCurrentListMapNoExtraKeys!1179 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28858 () Bool)

(assert (=> bm!28858 (= call!28860 (getCurrentListMapNoExtraKeys!1179 (ite c!55038 _keys!709 lt!190421) (ite c!55038 _values!549 lt!190420) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415917 () Bool)

(assert (=> b!415917 (= e!248347 e!248346)))

(declare-fun res!242052 () Bool)

(assert (=> b!415917 (=> (not res!242052) (not e!248346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25294 (_ BitVec 32)) Bool)

(assert (=> b!415917 (= res!242052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190421 mask!1025))))

(assert (=> b!415917 (= lt!190421 (array!25295 (store (arr!12096 _keys!709) i!563 k0!794) (size!12448 _keys!709)))))

(declare-fun b!415918 () Bool)

(declare-fun res!242057 () Bool)

(assert (=> b!415918 (=> (not res!242057) (not e!248347))))

(assert (=> b!415918 (= res!242057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415919 () Bool)

(assert (=> b!415919 (= e!248348 tp_is_empty!10717)))

(declare-fun b!415920 () Bool)

(declare-fun e!248349 () Bool)

(assert (=> b!415920 (= e!248351 (not e!248349))))

(declare-fun res!242047 () Bool)

(assert (=> b!415920 (=> res!242047 e!248349)))

(assert (=> b!415920 (= res!242047 (validKeyInArray!0 (select (arr!12096 _keys!709) from!863)))))

(assert (=> b!415920 e!248353))

(assert (=> b!415920 (= c!55038 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12287 0))(
  ( (Unit!12288) )
))
(declare-fun lt!190423 () Unit!12287)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!411 (array!25294 array!25296 (_ BitVec 32) (_ BitVec 32) V!15395 V!15395 (_ BitVec 32) (_ BitVec 64) V!15395 (_ BitVec 32) Int) Unit!12287)

(assert (=> b!415920 (= lt!190423 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!411 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415921 () Bool)

(assert (=> b!415921 (= e!248352 tp_is_empty!10717)))

(declare-fun b!415922 () Bool)

(declare-fun res!242051 () Bool)

(assert (=> b!415922 (=> (not res!242051) (not e!248347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415922 (= res!242051 (validMask!0 mask!1025))))

(declare-fun b!415923 () Bool)

(assert (=> b!415923 (= e!248349 true)))

(declare-fun lt!190424 () tuple2!6916)

(declare-fun lt!190425 () ListLongMap!5831)

(declare-fun lt!190417 () V!15395)

(assert (=> b!415923 (= (+!1204 lt!190425 lt!190424) (+!1204 (+!1204 lt!190425 (tuple2!6917 k0!794 lt!190417)) lt!190424))))

(declare-fun lt!190418 () V!15395)

(assert (=> b!415923 (= lt!190424 (tuple2!6917 k0!794 lt!190418))))

(declare-fun lt!190419 () Unit!12287)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!1 (ListLongMap!5831 (_ BitVec 64) V!15395 V!15395) Unit!12287)

(assert (=> b!415923 (= lt!190419 (addSameAsAddTwiceSameKeyDiffValues!1 lt!190425 k0!794 lt!190417 lt!190418))))

(declare-fun lt!190422 () V!15395)

(declare-fun get!5977 (ValueCell!5015 V!15395) V!15395)

(assert (=> b!415923 (= lt!190417 (get!5977 (select (arr!12097 _values!549) from!863) lt!190422))))

(assert (=> b!415923 (= lt!190415 (+!1204 lt!190425 (tuple2!6917 (select (arr!12096 lt!190421) from!863) lt!190418)))))

(assert (=> b!415923 (= lt!190418 (get!5977 (select (store (arr!12097 _values!549) i!563 (ValueCellFull!5015 v!412)) from!863) lt!190422))))

(declare-fun dynLambda!668 (Int (_ BitVec 64)) V!15395)

(assert (=> b!415923 (= lt!190422 (dynLambda!668 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!415923 (= lt!190425 (getCurrentListMapNoExtraKeys!1179 lt!190421 lt!190420 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415924 () Bool)

(declare-fun res!242053 () Bool)

(assert (=> b!415924 (=> (not res!242053) (not e!248347))))

(assert (=> b!415924 (= res!242053 (or (= (select (arr!12096 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12096 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39284 res!242054) b!415922))

(assert (= (and b!415922 res!242051) b!415910))

(assert (= (and b!415910 res!242049) b!415918))

(assert (= (and b!415918 res!242057) b!415915))

(assert (= (and b!415915 res!242055) b!415908))

(assert (= (and b!415908 res!242056) b!415913))

(assert (= (and b!415913 res!242058) b!415924))

(assert (= (and b!415924 res!242053) b!415909))

(assert (= (and b!415909 res!242045) b!415917))

(assert (= (and b!415917 res!242052) b!415906))

(assert (= (and b!415906 res!242048) b!415912))

(assert (= (and b!415912 res!242046) b!415916))

(assert (= (and b!415916 res!242050) b!415920))

(assert (= (and b!415920 c!55038) b!415911))

(assert (= (and b!415920 (not c!55038)) b!415914))

(assert (= (or b!415911 b!415914) bm!28857))

(assert (= (or b!415911 b!415914) bm!28858))

(assert (= (and b!415920 (not res!242047)) b!415923))

(assert (= (and b!415907 condMapEmpty!17697) mapIsEmpty!17697))

(assert (= (and b!415907 (not condMapEmpty!17697)) mapNonEmpty!17697))

(get-info :version)

(assert (= (and mapNonEmpty!17697 ((_ is ValueCellFull!5015) mapValue!17697)) b!415919))

(assert (= (and b!415907 ((_ is ValueCellFull!5015) mapDefault!17697)) b!415921))

(assert (= start!39284 b!415907))

(declare-fun b_lambda!8891 () Bool)

(assert (=> (not b_lambda!8891) (not b!415923)))

(declare-fun t!12157 () Bool)

(declare-fun tb!3179 () Bool)

(assert (=> (and start!39284 (= defaultEntry!557 defaultEntry!557) t!12157) tb!3179))

(declare-fun result!5893 () Bool)

(assert (=> tb!3179 (= result!5893 tp_is_empty!10717)))

(assert (=> b!415923 t!12157))

(declare-fun b_and!17021 () Bool)

(assert (= b_and!17019 (and (=> t!12157 result!5893) b_and!17021)))

(declare-fun m!405277 () Bool)

(assert (=> b!415913 m!405277))

(declare-fun m!405279 () Bool)

(assert (=> bm!28858 m!405279))

(declare-fun m!405281 () Bool)

(assert (=> bm!28857 m!405281))

(declare-fun m!405283 () Bool)

(assert (=> b!415911 m!405283))

(declare-fun m!405285 () Bool)

(assert (=> b!415917 m!405285))

(declare-fun m!405287 () Bool)

(assert (=> b!415917 m!405287))

(declare-fun m!405289 () Bool)

(assert (=> b!415916 m!405289))

(declare-fun m!405291 () Bool)

(assert (=> b!415916 m!405291))

(declare-fun m!405293 () Bool)

(assert (=> b!415916 m!405293))

(declare-fun m!405295 () Bool)

(assert (=> b!415920 m!405295))

(assert (=> b!415920 m!405295))

(declare-fun m!405297 () Bool)

(assert (=> b!415920 m!405297))

(declare-fun m!405299 () Bool)

(assert (=> b!415920 m!405299))

(declare-fun m!405301 () Bool)

(assert (=> b!415924 m!405301))

(declare-fun m!405303 () Bool)

(assert (=> mapNonEmpty!17697 m!405303))

(declare-fun m!405305 () Bool)

(assert (=> start!39284 m!405305))

(declare-fun m!405307 () Bool)

(assert (=> start!39284 m!405307))

(declare-fun m!405309 () Bool)

(assert (=> b!415918 m!405309))

(declare-fun m!405311 () Bool)

(assert (=> b!415909 m!405311))

(declare-fun m!405313 () Bool)

(assert (=> b!415915 m!405313))

(declare-fun m!405315 () Bool)

(assert (=> b!415922 m!405315))

(declare-fun m!405317 () Bool)

(assert (=> b!415906 m!405317))

(declare-fun m!405319 () Bool)

(assert (=> b!415923 m!405319))

(declare-fun m!405321 () Bool)

(assert (=> b!415923 m!405321))

(declare-fun m!405323 () Bool)

(assert (=> b!415923 m!405323))

(declare-fun m!405325 () Bool)

(assert (=> b!415923 m!405325))

(declare-fun m!405327 () Bool)

(assert (=> b!415923 m!405327))

(assert (=> b!415923 m!405321))

(declare-fun m!405329 () Bool)

(assert (=> b!415923 m!405329))

(declare-fun m!405331 () Bool)

(assert (=> b!415923 m!405331))

(declare-fun m!405333 () Bool)

(assert (=> b!415923 m!405333))

(declare-fun m!405335 () Bool)

(assert (=> b!415923 m!405335))

(declare-fun m!405337 () Bool)

(assert (=> b!415923 m!405337))

(assert (=> b!415923 m!405291))

(declare-fun m!405339 () Bool)

(assert (=> b!415923 m!405339))

(assert (=> b!415923 m!405331))

(declare-fun m!405341 () Bool)

(assert (=> b!415923 m!405341))

(assert (=> b!415923 m!405323))

(check-sat (not b!415918) (not mapNonEmpty!17697) (not start!39284) (not b!415913) (not b!415916) (not bm!28857) (not b!415920) tp_is_empty!10717 (not b_lambda!8891) (not b!415923) (not bm!28858) (not b!415917) (not b!415915) (not b!415909) (not b_next!9565) (not b!415922) (not b!415911) (not b!415906) b_and!17021)
(check-sat b_and!17021 (not b_next!9565))
