; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39768 () Bool)

(assert start!39768)

(declare-fun b_free!10035 () Bool)

(declare-fun b_next!10035 () Bool)

(assert (=> start!39768 (= b_free!10035 (not b_next!10035))))

(declare-fun tp!35633 () Bool)

(declare-fun b_and!17729 () Bool)

(assert (=> start!39768 (= tp!35633 b_and!17729)))

(declare-fun b!428371 () Bool)

(declare-fun res!251453 () Bool)

(declare-fun e!253871 () Bool)

(assert (=> b!428371 (=> (not res!251453) (not e!253871))))

(declare-datatypes ((array!26211 0))(
  ( (array!26212 (arr!12555 (Array (_ BitVec 32) (_ BitVec 64))) (size!12907 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26211)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428371 (= res!251453 (or (= (select (arr!12555 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12555 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428372 () Bool)

(declare-fun e!253869 () Bool)

(declare-fun e!253874 () Bool)

(declare-fun mapRes!18402 () Bool)

(assert (=> b!428372 (= e!253869 (and e!253874 mapRes!18402))))

(declare-fun condMapEmpty!18402 () Bool)

(declare-datatypes ((V!16021 0))(
  ( (V!16022 (val!5638 Int)) )
))
(declare-datatypes ((ValueCell!5250 0))(
  ( (ValueCellFull!5250 (v!7885 V!16021)) (EmptyCell!5250) )
))
(declare-datatypes ((array!26213 0))(
  ( (array!26214 (arr!12556 (Array (_ BitVec 32) ValueCell!5250)) (size!12908 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26213)

(declare-fun mapDefault!18402 () ValueCell!5250)

(assert (=> b!428372 (= condMapEmpty!18402 (= (arr!12556 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5250)) mapDefault!18402)))))

(declare-fun b!428373 () Bool)

(declare-fun e!253872 () Bool)

(assert (=> b!428373 (= e!253872 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!428373 (not (= (select (arr!12555 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12568 0))(
  ( (Unit!12569) )
))
(declare-fun lt!195720 () Unit!12568)

(declare-fun e!253870 () Unit!12568)

(assert (=> b!428373 (= lt!195720 e!253870)))

(declare-fun c!55388 () Bool)

(assert (=> b!428373 (= c!55388 (= (select (arr!12555 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7420 0))(
  ( (tuple2!7421 (_1!3721 (_ BitVec 64)) (_2!3721 V!16021)) )
))
(declare-datatypes ((List!7433 0))(
  ( (Nil!7430) (Cons!7429 (h!8285 tuple2!7420) (t!12917 List!7433)) )
))
(declare-datatypes ((ListLongMap!6333 0))(
  ( (ListLongMap!6334 (toList!3182 List!7433)) )
))
(declare-fun lt!195716 () ListLongMap!6333)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!195721 () ListLongMap!6333)

(declare-fun +!1335 (ListLongMap!6333 tuple2!7420) ListLongMap!6333)

(declare-fun get!6221 (ValueCell!5250 V!16021) V!16021)

(declare-fun dynLambda!762 (Int (_ BitVec 64)) V!16021)

(assert (=> b!428373 (= lt!195721 (+!1335 lt!195716 (tuple2!7421 (select (arr!12555 _keys!709) from!863) (get!6221 (select (arr!12556 _values!549) from!863) (dynLambda!762 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428374 () Bool)

(declare-fun res!251449 () Bool)

(assert (=> b!428374 (=> (not res!251449) (not e!253871))))

(assert (=> b!428374 (= res!251449 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12907 _keys!709))))))

(declare-fun b!428375 () Bool)

(declare-fun res!251445 () Bool)

(assert (=> b!428375 (=> (not res!251445) (not e!253871))))

(declare-fun arrayContainsKey!0 (array!26211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428375 (= res!251445 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428376 () Bool)

(declare-fun res!251448 () Bool)

(assert (=> b!428376 (=> (not res!251448) (not e!253871))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428376 (= res!251448 (validMask!0 mask!1025))))

(declare-fun b!428377 () Bool)

(declare-fun res!251443 () Bool)

(assert (=> b!428377 (=> (not res!251443) (not e!253871))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!428377 (= res!251443 (and (= (size!12908 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12907 _keys!709) (size!12908 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428378 () Bool)

(declare-fun e!253867 () Bool)

(declare-fun tp_is_empty!11187 () Bool)

(assert (=> b!428378 (= e!253867 tp_is_empty!11187)))

(declare-fun b!428379 () Bool)

(declare-fun res!251451 () Bool)

(assert (=> b!428379 (=> (not res!251451) (not e!253871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428379 (= res!251451 (validKeyInArray!0 k0!794))))

(declare-fun b!428380 () Bool)

(declare-fun e!253875 () Bool)

(assert (=> b!428380 (= e!253875 (not e!253872))))

(declare-fun res!251454 () Bool)

(assert (=> b!428380 (=> res!251454 e!253872)))

(assert (=> b!428380 (= res!251454 (not (validKeyInArray!0 (select (arr!12555 _keys!709) from!863))))))

(declare-fun lt!195722 () ListLongMap!6333)

(assert (=> b!428380 (= lt!195722 lt!195716)))

(declare-fun lt!195718 () ListLongMap!6333)

(declare-fun v!412 () V!16021)

(assert (=> b!428380 (= lt!195716 (+!1335 lt!195718 (tuple2!7421 k0!794 v!412)))))

(declare-fun minValue!515 () V!16021)

(declare-fun lt!195725 () array!26213)

(declare-fun zeroValue!515 () V!16021)

(declare-fun lt!195723 () array!26211)

(declare-fun getCurrentListMapNoExtraKeys!1384 (array!26211 array!26213 (_ BitVec 32) (_ BitVec 32) V!16021 V!16021 (_ BitVec 32) Int) ListLongMap!6333)

(assert (=> b!428380 (= lt!195722 (getCurrentListMapNoExtraKeys!1384 lt!195723 lt!195725 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428380 (= lt!195718 (getCurrentListMapNoExtraKeys!1384 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195717 () Unit!12568)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!527 (array!26211 array!26213 (_ BitVec 32) (_ BitVec 32) V!16021 V!16021 (_ BitVec 32) (_ BitVec 64) V!16021 (_ BitVec 32) Int) Unit!12568)

(assert (=> b!428380 (= lt!195717 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428381 () Bool)

(declare-fun Unit!12570 () Unit!12568)

(assert (=> b!428381 (= e!253870 Unit!12570)))

(declare-fun lt!195724 () Unit!12568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12568)

(assert (=> b!428381 (= lt!195724 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428381 false))

(declare-fun b!428382 () Bool)

(declare-fun res!251444 () Bool)

(declare-fun e!253873 () Bool)

(assert (=> b!428382 (=> (not res!251444) (not e!253873))))

(assert (=> b!428382 (= res!251444 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18402 () Bool)

(declare-fun tp!35634 () Bool)

(assert (=> mapNonEmpty!18402 (= mapRes!18402 (and tp!35634 e!253867))))

(declare-fun mapKey!18402 () (_ BitVec 32))

(declare-fun mapValue!18402 () ValueCell!5250)

(declare-fun mapRest!18402 () (Array (_ BitVec 32) ValueCell!5250))

(assert (=> mapNonEmpty!18402 (= (arr!12556 _values!549) (store mapRest!18402 mapKey!18402 mapValue!18402))))

(declare-fun b!428383 () Bool)

(declare-fun Unit!12571 () Unit!12568)

(assert (=> b!428383 (= e!253870 Unit!12571)))

(declare-fun b!428384 () Bool)

(declare-fun res!251450 () Bool)

(assert (=> b!428384 (=> (not res!251450) (not e!253871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26211 (_ BitVec 32)) Bool)

(assert (=> b!428384 (= res!251450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428385 () Bool)

(assert (=> b!428385 (= e!253871 e!253873)))

(declare-fun res!251447 () Bool)

(assert (=> b!428385 (=> (not res!251447) (not e!253873))))

(assert (=> b!428385 (= res!251447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195723 mask!1025))))

(assert (=> b!428385 (= lt!195723 (array!26212 (store (arr!12555 _keys!709) i!563 k0!794) (size!12907 _keys!709)))))

(declare-fun b!428386 () Bool)

(declare-fun res!251442 () Bool)

(assert (=> b!428386 (=> (not res!251442) (not e!253871))))

(declare-datatypes ((List!7434 0))(
  ( (Nil!7431) (Cons!7430 (h!8286 (_ BitVec 64)) (t!12918 List!7434)) )
))
(declare-fun arrayNoDuplicates!0 (array!26211 (_ BitVec 32) List!7434) Bool)

(assert (=> b!428386 (= res!251442 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7431))))

(declare-fun b!428387 () Bool)

(assert (=> b!428387 (= e!253873 e!253875)))

(declare-fun res!251452 () Bool)

(assert (=> b!428387 (=> (not res!251452) (not e!253875))))

(assert (=> b!428387 (= res!251452 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428387 (= lt!195721 (getCurrentListMapNoExtraKeys!1384 lt!195723 lt!195725 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428387 (= lt!195725 (array!26214 (store (arr!12556 _values!549) i!563 (ValueCellFull!5250 v!412)) (size!12908 _values!549)))))

(declare-fun lt!195719 () ListLongMap!6333)

(assert (=> b!428387 (= lt!195719 (getCurrentListMapNoExtraKeys!1384 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428388 () Bool)

(declare-fun res!251441 () Bool)

(assert (=> b!428388 (=> (not res!251441) (not e!253873))))

(assert (=> b!428388 (= res!251441 (arrayNoDuplicates!0 lt!195723 #b00000000000000000000000000000000 Nil!7431))))

(declare-fun mapIsEmpty!18402 () Bool)

(assert (=> mapIsEmpty!18402 mapRes!18402))

(declare-fun b!428389 () Bool)

(assert (=> b!428389 (= e!253874 tp_is_empty!11187)))

(declare-fun res!251446 () Bool)

(assert (=> start!39768 (=> (not res!251446) (not e!253871))))

(assert (=> start!39768 (= res!251446 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12907 _keys!709))))))

(assert (=> start!39768 e!253871))

(assert (=> start!39768 tp_is_empty!11187))

(assert (=> start!39768 tp!35633))

(assert (=> start!39768 true))

(declare-fun array_inv!9152 (array!26213) Bool)

(assert (=> start!39768 (and (array_inv!9152 _values!549) e!253869)))

(declare-fun array_inv!9153 (array!26211) Bool)

(assert (=> start!39768 (array_inv!9153 _keys!709)))

(assert (= (and start!39768 res!251446) b!428376))

(assert (= (and b!428376 res!251448) b!428377))

(assert (= (and b!428377 res!251443) b!428384))

(assert (= (and b!428384 res!251450) b!428386))

(assert (= (and b!428386 res!251442) b!428374))

(assert (= (and b!428374 res!251449) b!428379))

(assert (= (and b!428379 res!251451) b!428371))

(assert (= (and b!428371 res!251453) b!428375))

(assert (= (and b!428375 res!251445) b!428385))

(assert (= (and b!428385 res!251447) b!428388))

(assert (= (and b!428388 res!251441) b!428382))

(assert (= (and b!428382 res!251444) b!428387))

(assert (= (and b!428387 res!251452) b!428380))

(assert (= (and b!428380 (not res!251454)) b!428373))

(assert (= (and b!428373 c!55388) b!428381))

(assert (= (and b!428373 (not c!55388)) b!428383))

(assert (= (and b!428372 condMapEmpty!18402) mapIsEmpty!18402))

(assert (= (and b!428372 (not condMapEmpty!18402)) mapNonEmpty!18402))

(get-info :version)

(assert (= (and mapNonEmpty!18402 ((_ is ValueCellFull!5250) mapValue!18402)) b!428378))

(assert (= (and b!428372 ((_ is ValueCellFull!5250) mapDefault!18402)) b!428389))

(assert (= start!39768 b!428372))

(declare-fun b_lambda!9123 () Bool)

(assert (=> (not b_lambda!9123) (not b!428373)))

(declare-fun t!12916 () Bool)

(declare-fun tb!3441 () Bool)

(assert (=> (and start!39768 (= defaultEntry!557 defaultEntry!557) t!12916) tb!3441))

(declare-fun result!6409 () Bool)

(assert (=> tb!3441 (= result!6409 tp_is_empty!11187)))

(assert (=> b!428373 t!12916))

(declare-fun b_and!17731 () Bool)

(assert (= b_and!17729 (and (=> t!12916 result!6409) b_and!17731)))

(declare-fun m!416809 () Bool)

(assert (=> start!39768 m!416809))

(declare-fun m!416811 () Bool)

(assert (=> start!39768 m!416811))

(declare-fun m!416813 () Bool)

(assert (=> b!428375 m!416813))

(declare-fun m!416815 () Bool)

(assert (=> b!428376 m!416815))

(declare-fun m!416817 () Bool)

(assert (=> b!428381 m!416817))

(declare-fun m!416819 () Bool)

(assert (=> b!428373 m!416819))

(declare-fun m!416821 () Bool)

(assert (=> b!428373 m!416821))

(declare-fun m!416823 () Bool)

(assert (=> b!428373 m!416823))

(declare-fun m!416825 () Bool)

(assert (=> b!428373 m!416825))

(assert (=> b!428373 m!416825))

(assert (=> b!428373 m!416823))

(declare-fun m!416827 () Bool)

(assert (=> b!428373 m!416827))

(declare-fun m!416829 () Bool)

(assert (=> b!428379 m!416829))

(declare-fun m!416831 () Bool)

(assert (=> b!428388 m!416831))

(declare-fun m!416833 () Bool)

(assert (=> b!428380 m!416833))

(declare-fun m!416835 () Bool)

(assert (=> b!428380 m!416835))

(assert (=> b!428380 m!416819))

(declare-fun m!416837 () Bool)

(assert (=> b!428380 m!416837))

(declare-fun m!416839 () Bool)

(assert (=> b!428380 m!416839))

(assert (=> b!428380 m!416819))

(declare-fun m!416841 () Bool)

(assert (=> b!428380 m!416841))

(declare-fun m!416843 () Bool)

(assert (=> mapNonEmpty!18402 m!416843))

(declare-fun m!416845 () Bool)

(assert (=> b!428371 m!416845))

(declare-fun m!416847 () Bool)

(assert (=> b!428387 m!416847))

(declare-fun m!416849 () Bool)

(assert (=> b!428387 m!416849))

(declare-fun m!416851 () Bool)

(assert (=> b!428387 m!416851))

(declare-fun m!416853 () Bool)

(assert (=> b!428385 m!416853))

(declare-fun m!416855 () Bool)

(assert (=> b!428385 m!416855))

(declare-fun m!416857 () Bool)

(assert (=> b!428386 m!416857))

(declare-fun m!416859 () Bool)

(assert (=> b!428384 m!416859))

(check-sat (not b!428384) (not b!428375) (not b!428388) (not b_next!10035) tp_is_empty!11187 (not mapNonEmpty!18402) (not b!428386) (not start!39768) (not b!428380) (not b_lambda!9123) (not b!428373) (not b!428387) (not b!428379) (not b!428381) b_and!17731 (not b!428376) (not b!428385))
(check-sat b_and!17731 (not b_next!10035))
