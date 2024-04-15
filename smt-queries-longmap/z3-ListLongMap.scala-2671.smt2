; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39830 () Bool)

(assert start!39830)

(declare-fun b_free!10111 () Bool)

(declare-fun b_next!10111 () Bool)

(assert (=> start!39830 (= b_free!10111 (not b_next!10111))))

(declare-fun tp!35861 () Bool)

(declare-fun b_and!17855 () Bool)

(assert (=> start!39830 (= tp!35861 b_and!17855)))

(declare-fun mapIsEmpty!18516 () Bool)

(declare-fun mapRes!18516 () Bool)

(assert (=> mapIsEmpty!18516 mapRes!18516))

(declare-fun b!430371 () Bool)

(declare-fun res!252948 () Bool)

(declare-fun e!254756 () Bool)

(assert (=> b!430371 (=> (not res!252948) (not e!254756))))

(declare-datatypes ((array!26355 0))(
  ( (array!26356 (arr!12627 (Array (_ BitVec 32) (_ BitVec 64))) (size!12980 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26355)

(declare-datatypes ((List!7486 0))(
  ( (Nil!7483) (Cons!7482 (h!8338 (_ BitVec 64)) (t!13037 List!7486)) )
))
(declare-fun arrayNoDuplicates!0 (array!26355 (_ BitVec 32) List!7486) Bool)

(assert (=> b!430371 (= res!252948 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7483))))

(declare-fun b!430372 () Bool)

(declare-fun res!252950 () Bool)

(declare-fun e!254755 () Bool)

(assert (=> b!430372 (=> (not res!252950) (not e!254755))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430372 (= res!252950 (bvsle from!863 i!563))))

(declare-fun b!430373 () Bool)

(declare-fun e!254753 () Bool)

(declare-fun e!254752 () Bool)

(assert (=> b!430373 (= e!254753 (not e!254752))))

(declare-fun res!252943 () Bool)

(assert (=> b!430373 (=> res!252943 e!254752)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430373 (= res!252943 (not (validKeyInArray!0 (select (arr!12627 _keys!709) from!863))))))

(declare-datatypes ((V!16123 0))(
  ( (V!16124 (val!5676 Int)) )
))
(declare-datatypes ((tuple2!7488 0))(
  ( (tuple2!7489 (_1!3755 (_ BitVec 64)) (_2!3755 V!16123)) )
))
(declare-datatypes ((List!7487 0))(
  ( (Nil!7484) (Cons!7483 (h!8339 tuple2!7488) (t!13038 List!7487)) )
))
(declare-datatypes ((ListLongMap!6391 0))(
  ( (ListLongMap!6392 (toList!3211 List!7487)) )
))
(declare-fun lt!196779 () ListLongMap!6391)

(declare-fun lt!196773 () ListLongMap!6391)

(assert (=> b!430373 (= lt!196779 lt!196773)))

(declare-fun lt!196777 () ListLongMap!6391)

(declare-fun lt!196770 () tuple2!7488)

(declare-fun +!1387 (ListLongMap!6391 tuple2!7488) ListLongMap!6391)

(assert (=> b!430373 (= lt!196773 (+!1387 lt!196777 lt!196770))))

(declare-fun lt!196778 () array!26355)

(declare-fun minValue!515 () V!16123)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16123)

(declare-datatypes ((ValueCell!5288 0))(
  ( (ValueCellFull!5288 (v!7917 V!16123)) (EmptyCell!5288) )
))
(declare-datatypes ((array!26357 0))(
  ( (array!26358 (arr!12628 (Array (_ BitVec 32) ValueCell!5288)) (size!12981 (_ BitVec 32))) )
))
(declare-fun lt!196774 () array!26357)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1417 (array!26355 array!26357 (_ BitVec 32) (_ BitVec 32) V!16123 V!16123 (_ BitVec 32) Int) ListLongMap!6391)

(assert (=> b!430373 (= lt!196779 (getCurrentListMapNoExtraKeys!1417 lt!196778 lt!196774 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16123)

(assert (=> b!430373 (= lt!196770 (tuple2!7489 k0!794 v!412))))

(declare-fun _values!549 () array!26357)

(assert (=> b!430373 (= lt!196777 (getCurrentListMapNoExtraKeys!1417 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12669 0))(
  ( (Unit!12670) )
))
(declare-fun lt!196768 () Unit!12669)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!550 (array!26355 array!26357 (_ BitVec 32) (_ BitVec 32) V!16123 V!16123 (_ BitVec 32) (_ BitVec 64) V!16123 (_ BitVec 32) Int) Unit!12669)

(assert (=> b!430373 (= lt!196768 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!550 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430374 () Bool)

(declare-fun e!254751 () Bool)

(assert (=> b!430374 (= e!254751 true)))

(declare-fun lt!196781 () ListLongMap!6391)

(declare-fun lt!196771 () tuple2!7488)

(assert (=> b!430374 (= lt!196781 (+!1387 (+!1387 lt!196777 lt!196771) lt!196770))))

(declare-fun lt!196772 () Unit!12669)

(declare-fun lt!196767 () V!16123)

(declare-fun addCommutativeForDiffKeys!352 (ListLongMap!6391 (_ BitVec 64) V!16123 (_ BitVec 64) V!16123) Unit!12669)

(assert (=> b!430374 (= lt!196772 (addCommutativeForDiffKeys!352 lt!196777 k0!794 v!412 (select (arr!12627 _keys!709) from!863) lt!196767))))

(declare-fun b!430375 () Bool)

(declare-fun res!252944 () Bool)

(assert (=> b!430375 (=> (not res!252944) (not e!254756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430375 (= res!252944 (validMask!0 mask!1025))))

(declare-fun b!430376 () Bool)

(declare-fun res!252942 () Bool)

(assert (=> b!430376 (=> (not res!252942) (not e!254756))))

(assert (=> b!430376 (= res!252942 (or (= (select (arr!12627 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12627 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!252946 () Bool)

(assert (=> start!39830 (=> (not res!252946) (not e!254756))))

(assert (=> start!39830 (= res!252946 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12980 _keys!709))))))

(assert (=> start!39830 e!254756))

(declare-fun tp_is_empty!11263 () Bool)

(assert (=> start!39830 tp_is_empty!11263))

(assert (=> start!39830 tp!35861))

(assert (=> start!39830 true))

(declare-fun e!254749 () Bool)

(declare-fun array_inv!9224 (array!26357) Bool)

(assert (=> start!39830 (and (array_inv!9224 _values!549) e!254749)))

(declare-fun array_inv!9225 (array!26355) Bool)

(assert (=> start!39830 (array_inv!9225 _keys!709)))

(declare-fun b!430377 () Bool)

(assert (=> b!430377 (= e!254755 e!254753)))

(declare-fun res!252951 () Bool)

(assert (=> b!430377 (=> (not res!252951) (not e!254753))))

(assert (=> b!430377 (= res!252951 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196776 () ListLongMap!6391)

(assert (=> b!430377 (= lt!196776 (getCurrentListMapNoExtraKeys!1417 lt!196778 lt!196774 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430377 (= lt!196774 (array!26358 (store (arr!12628 _values!549) i!563 (ValueCellFull!5288 v!412)) (size!12981 _values!549)))))

(declare-fun lt!196775 () ListLongMap!6391)

(assert (=> b!430377 (= lt!196775 (getCurrentListMapNoExtraKeys!1417 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430378 () Bool)

(declare-fun res!252949 () Bool)

(assert (=> b!430378 (=> (not res!252949) (not e!254756))))

(declare-fun arrayContainsKey!0 (array!26355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430378 (= res!252949 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430379 () Bool)

(declare-fun e!254748 () Unit!12669)

(declare-fun Unit!12671 () Unit!12669)

(assert (=> b!430379 (= e!254748 Unit!12671)))

(declare-fun b!430380 () Bool)

(declare-fun e!254754 () Bool)

(assert (=> b!430380 (= e!254754 tp_is_empty!11263)))

(declare-fun mapNonEmpty!18516 () Bool)

(declare-fun tp!35862 () Bool)

(declare-fun e!254750 () Bool)

(assert (=> mapNonEmpty!18516 (= mapRes!18516 (and tp!35862 e!254750))))

(declare-fun mapRest!18516 () (Array (_ BitVec 32) ValueCell!5288))

(declare-fun mapValue!18516 () ValueCell!5288)

(declare-fun mapKey!18516 () (_ BitVec 32))

(assert (=> mapNonEmpty!18516 (= (arr!12628 _values!549) (store mapRest!18516 mapKey!18516 mapValue!18516))))

(declare-fun b!430381 () Bool)

(assert (=> b!430381 (= e!254752 e!254751)))

(declare-fun res!252939 () Bool)

(assert (=> b!430381 (=> res!252939 e!254751)))

(assert (=> b!430381 (= res!252939 (= k0!794 (select (arr!12627 _keys!709) from!863)))))

(assert (=> b!430381 (not (= (select (arr!12627 _keys!709) from!863) k0!794))))

(declare-fun lt!196769 () Unit!12669)

(assert (=> b!430381 (= lt!196769 e!254748)))

(declare-fun c!55431 () Bool)

(assert (=> b!430381 (= c!55431 (= (select (arr!12627 _keys!709) from!863) k0!794))))

(assert (=> b!430381 (= lt!196776 lt!196781)))

(assert (=> b!430381 (= lt!196781 (+!1387 lt!196773 lt!196771))))

(assert (=> b!430381 (= lt!196771 (tuple2!7489 (select (arr!12627 _keys!709) from!863) lt!196767))))

(declare-fun get!6267 (ValueCell!5288 V!16123) V!16123)

(declare-fun dynLambda!779 (Int (_ BitVec 64)) V!16123)

(assert (=> b!430381 (= lt!196767 (get!6267 (select (arr!12628 _values!549) from!863) (dynLambda!779 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430382 () Bool)

(assert (=> b!430382 (= e!254756 e!254755)))

(declare-fun res!252947 () Bool)

(assert (=> b!430382 (=> (not res!252947) (not e!254755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26355 (_ BitVec 32)) Bool)

(assert (=> b!430382 (= res!252947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196778 mask!1025))))

(assert (=> b!430382 (= lt!196778 (array!26356 (store (arr!12627 _keys!709) i!563 k0!794) (size!12980 _keys!709)))))

(declare-fun b!430383 () Bool)

(declare-fun res!252940 () Bool)

(assert (=> b!430383 (=> (not res!252940) (not e!254756))))

(assert (=> b!430383 (= res!252940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430384 () Bool)

(declare-fun res!252937 () Bool)

(assert (=> b!430384 (=> (not res!252937) (not e!254756))))

(assert (=> b!430384 (= res!252937 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12980 _keys!709))))))

(declare-fun b!430385 () Bool)

(declare-fun res!252938 () Bool)

(assert (=> b!430385 (=> (not res!252938) (not e!254756))))

(assert (=> b!430385 (= res!252938 (validKeyInArray!0 k0!794))))

(declare-fun b!430386 () Bool)

(declare-fun Unit!12672 () Unit!12669)

(assert (=> b!430386 (= e!254748 Unit!12672)))

(declare-fun lt!196780 () Unit!12669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12669)

(assert (=> b!430386 (= lt!196780 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430386 false))

(declare-fun b!430387 () Bool)

(declare-fun res!252945 () Bool)

(assert (=> b!430387 (=> (not res!252945) (not e!254756))))

(assert (=> b!430387 (= res!252945 (and (= (size!12981 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12980 _keys!709) (size!12981 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430388 () Bool)

(assert (=> b!430388 (= e!254750 tp_is_empty!11263)))

(declare-fun b!430389 () Bool)

(assert (=> b!430389 (= e!254749 (and e!254754 mapRes!18516))))

(declare-fun condMapEmpty!18516 () Bool)

(declare-fun mapDefault!18516 () ValueCell!5288)

(assert (=> b!430389 (= condMapEmpty!18516 (= (arr!12628 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5288)) mapDefault!18516)))))

(declare-fun b!430390 () Bool)

(declare-fun res!252941 () Bool)

(assert (=> b!430390 (=> (not res!252941) (not e!254755))))

(assert (=> b!430390 (= res!252941 (arrayNoDuplicates!0 lt!196778 #b00000000000000000000000000000000 Nil!7483))))

(assert (= (and start!39830 res!252946) b!430375))

(assert (= (and b!430375 res!252944) b!430387))

(assert (= (and b!430387 res!252945) b!430383))

(assert (= (and b!430383 res!252940) b!430371))

(assert (= (and b!430371 res!252948) b!430384))

(assert (= (and b!430384 res!252937) b!430385))

(assert (= (and b!430385 res!252938) b!430376))

(assert (= (and b!430376 res!252942) b!430378))

(assert (= (and b!430378 res!252949) b!430382))

(assert (= (and b!430382 res!252947) b!430390))

(assert (= (and b!430390 res!252941) b!430372))

(assert (= (and b!430372 res!252950) b!430377))

(assert (= (and b!430377 res!252951) b!430373))

(assert (= (and b!430373 (not res!252943)) b!430381))

(assert (= (and b!430381 c!55431) b!430386))

(assert (= (and b!430381 (not c!55431)) b!430379))

(assert (= (and b!430381 (not res!252939)) b!430374))

(assert (= (and b!430389 condMapEmpty!18516) mapIsEmpty!18516))

(assert (= (and b!430389 (not condMapEmpty!18516)) mapNonEmpty!18516))

(get-info :version)

(assert (= (and mapNonEmpty!18516 ((_ is ValueCellFull!5288) mapValue!18516)) b!430388))

(assert (= (and b!430389 ((_ is ValueCellFull!5288) mapDefault!18516)) b!430380))

(assert (= start!39830 b!430389))

(declare-fun b_lambda!9181 () Bool)

(assert (=> (not b_lambda!9181) (not b!430381)))

(declare-fun t!13036 () Bool)

(declare-fun tb!3509 () Bool)

(assert (=> (and start!39830 (= defaultEntry!557 defaultEntry!557) t!13036) tb!3509))

(declare-fun result!6553 () Bool)

(assert (=> tb!3509 (= result!6553 tp_is_empty!11263)))

(assert (=> b!430381 t!13036))

(declare-fun b_and!17857 () Bool)

(assert (= b_and!17855 (and (=> t!13036 result!6553) b_and!17857)))

(declare-fun m!418107 () Bool)

(assert (=> b!430376 m!418107))

(declare-fun m!418109 () Bool)

(assert (=> b!430385 m!418109))

(declare-fun m!418111 () Bool)

(assert (=> start!39830 m!418111))

(declare-fun m!418113 () Bool)

(assert (=> start!39830 m!418113))

(declare-fun m!418115 () Bool)

(assert (=> b!430377 m!418115))

(declare-fun m!418117 () Bool)

(assert (=> b!430377 m!418117))

(declare-fun m!418119 () Bool)

(assert (=> b!430377 m!418119))

(declare-fun m!418121 () Bool)

(assert (=> b!430383 m!418121))

(declare-fun m!418123 () Bool)

(assert (=> b!430378 m!418123))

(declare-fun m!418125 () Bool)

(assert (=> b!430375 m!418125))

(declare-fun m!418127 () Bool)

(assert (=> b!430373 m!418127))

(declare-fun m!418129 () Bool)

(assert (=> b!430373 m!418129))

(declare-fun m!418131 () Bool)

(assert (=> b!430373 m!418131))

(declare-fun m!418133 () Bool)

(assert (=> b!430373 m!418133))

(assert (=> b!430373 m!418127))

(declare-fun m!418135 () Bool)

(assert (=> b!430373 m!418135))

(declare-fun m!418137 () Bool)

(assert (=> b!430373 m!418137))

(declare-fun m!418139 () Bool)

(assert (=> b!430382 m!418139))

(declare-fun m!418141 () Bool)

(assert (=> b!430382 m!418141))

(declare-fun m!418143 () Bool)

(assert (=> b!430371 m!418143))

(declare-fun m!418145 () Bool)

(assert (=> b!430386 m!418145))

(declare-fun m!418147 () Bool)

(assert (=> mapNonEmpty!18516 m!418147))

(declare-fun m!418149 () Bool)

(assert (=> b!430390 m!418149))

(declare-fun m!418151 () Bool)

(assert (=> b!430374 m!418151))

(assert (=> b!430374 m!418151))

(declare-fun m!418153 () Bool)

(assert (=> b!430374 m!418153))

(assert (=> b!430374 m!418127))

(assert (=> b!430374 m!418127))

(declare-fun m!418155 () Bool)

(assert (=> b!430374 m!418155))

(assert (=> b!430381 m!418127))

(declare-fun m!418157 () Bool)

(assert (=> b!430381 m!418157))

(declare-fun m!418159 () Bool)

(assert (=> b!430381 m!418159))

(declare-fun m!418161 () Bool)

(assert (=> b!430381 m!418161))

(assert (=> b!430381 m!418161))

(assert (=> b!430381 m!418157))

(declare-fun m!418163 () Bool)

(assert (=> b!430381 m!418163))

(check-sat (not b!430377) (not b!430378) (not b!430390) (not b!430385) (not b!430381) (not b!430386) (not b!430375) (not mapNonEmpty!18516) b_and!17857 (not b!430373) (not b_lambda!9181) tp_is_empty!11263 (not b!430382) (not start!39830) (not b!430371) (not b!430383) (not b_next!10111) (not b!430374))
(check-sat b_and!17857 (not b_next!10111))
