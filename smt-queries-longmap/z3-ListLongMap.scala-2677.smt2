; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39866 () Bool)

(assert start!39866)

(declare-fun b_free!10147 () Bool)

(declare-fun b_next!10147 () Bool)

(assert (=> start!39866 (= b_free!10147 (not b_next!10147))))

(declare-fun tp!35969 () Bool)

(declare-fun b_and!17967 () Bool)

(assert (=> start!39866 (= tp!35969 b_and!17967)))

(declare-fun b!431709 () Bool)

(declare-fun res!253886 () Bool)

(declare-fun e!255434 () Bool)

(assert (=> b!431709 (=> (not res!253886) (not e!255434))))

(declare-datatypes ((array!26438 0))(
  ( (array!26439 (arr!12668 (Array (_ BitVec 32) (_ BitVec 64))) (size!13020 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26438)

(declare-datatypes ((List!7417 0))(
  ( (Nil!7414) (Cons!7413 (h!8269 (_ BitVec 64)) (t!13005 List!7417)) )
))
(declare-fun arrayNoDuplicates!0 (array!26438 (_ BitVec 32) List!7417) Bool)

(assert (=> b!431709 (= res!253886 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7414))))

(declare-fun b!431710 () Bool)

(declare-fun res!253874 () Bool)

(assert (=> b!431710 (=> (not res!253874) (not e!255434))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431710 (= res!253874 (validMask!0 mask!1025))))

(declare-fun b!431711 () Bool)

(declare-fun res!253881 () Bool)

(declare-fun e!255437 () Bool)

(assert (=> b!431711 (=> (not res!253881) (not e!255437))))

(declare-fun lt!197836 () array!26438)

(assert (=> b!431711 (= res!253881 (arrayNoDuplicates!0 lt!197836 #b00000000000000000000000000000000 Nil!7414))))

(declare-fun b!431712 () Bool)

(declare-fun e!255430 () Bool)

(assert (=> b!431712 (= e!255430 true)))

(declare-datatypes ((V!16171 0))(
  ( (V!16172 (val!5694 Int)) )
))
(declare-datatypes ((tuple2!7422 0))(
  ( (tuple2!7423 (_1!3722 (_ BitVec 64)) (_2!3722 V!16171)) )
))
(declare-fun lt!197833 () tuple2!7422)

(declare-datatypes ((List!7418 0))(
  ( (Nil!7415) (Cons!7414 (h!8270 tuple2!7422) (t!13006 List!7418)) )
))
(declare-datatypes ((ListLongMap!6337 0))(
  ( (ListLongMap!6338 (toList!3184 List!7418)) )
))
(declare-fun lt!197841 () ListLongMap!6337)

(declare-fun lt!197832 () ListLongMap!6337)

(declare-fun lt!197839 () tuple2!7422)

(declare-fun +!1392 (ListLongMap!6337 tuple2!7422) ListLongMap!6337)

(assert (=> b!431712 (= lt!197841 (+!1392 (+!1392 lt!197832 lt!197839) lt!197833))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12742 0))(
  ( (Unit!12743) )
))
(declare-fun lt!197844 () Unit!12742)

(declare-fun v!412 () V!16171)

(declare-fun lt!197840 () V!16171)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!371 (ListLongMap!6337 (_ BitVec 64) V!16171 (_ BitVec 64) V!16171) Unit!12742)

(assert (=> b!431712 (= lt!197844 (addCommutativeForDiffKeys!371 lt!197832 k0!794 v!412 (select (arr!12668 _keys!709) from!863) lt!197840))))

(declare-fun b!431713 () Bool)

(declare-fun res!253883 () Bool)

(assert (=> b!431713 (=> (not res!253883) (not e!255434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431713 (= res!253883 (validKeyInArray!0 k0!794))))

(declare-fun b!431714 () Bool)

(declare-fun e!255433 () Bool)

(declare-fun tp_is_empty!11299 () Bool)

(assert (=> b!431714 (= e!255433 tp_is_empty!11299)))

(declare-fun b!431715 () Bool)

(declare-fun e!255435 () Bool)

(declare-fun e!255438 () Bool)

(assert (=> b!431715 (= e!255435 (not e!255438))))

(declare-fun res!253878 () Bool)

(assert (=> b!431715 (=> res!253878 e!255438)))

(assert (=> b!431715 (= res!253878 (not (validKeyInArray!0 (select (arr!12668 _keys!709) from!863))))))

(declare-fun lt!197837 () ListLongMap!6337)

(declare-fun lt!197842 () ListLongMap!6337)

(assert (=> b!431715 (= lt!197837 lt!197842)))

(assert (=> b!431715 (= lt!197842 (+!1392 lt!197832 lt!197833))))

(declare-datatypes ((ValueCell!5306 0))(
  ( (ValueCellFull!5306 (v!7942 V!16171)) (EmptyCell!5306) )
))
(declare-datatypes ((array!26440 0))(
  ( (array!26441 (arr!12669 (Array (_ BitVec 32) ValueCell!5306)) (size!13021 (_ BitVec 32))) )
))
(declare-fun lt!197834 () array!26440)

(declare-fun minValue!515 () V!16171)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16171)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1424 (array!26438 array!26440 (_ BitVec 32) (_ BitVec 32) V!16171 V!16171 (_ BitVec 32) Int) ListLongMap!6337)

(assert (=> b!431715 (= lt!197837 (getCurrentListMapNoExtraKeys!1424 lt!197836 lt!197834 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431715 (= lt!197833 (tuple2!7423 k0!794 v!412))))

(declare-fun _values!549 () array!26440)

(assert (=> b!431715 (= lt!197832 (getCurrentListMapNoExtraKeys!1424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197830 () Unit!12742)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!565 (array!26438 array!26440 (_ BitVec 32) (_ BitVec 32) V!16171 V!16171 (_ BitVec 32) (_ BitVec 64) V!16171 (_ BitVec 32) Int) Unit!12742)

(assert (=> b!431715 (= lt!197830 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!565 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431717 () Bool)

(declare-fun res!253875 () Bool)

(assert (=> b!431717 (=> (not res!253875) (not e!255434))))

(assert (=> b!431717 (= res!253875 (and (= (size!13021 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13020 _keys!709) (size!13021 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431718 () Bool)

(declare-fun e!255436 () Bool)

(declare-fun e!255439 () Bool)

(declare-fun mapRes!18570 () Bool)

(assert (=> b!431718 (= e!255436 (and e!255439 mapRes!18570))))

(declare-fun condMapEmpty!18570 () Bool)

(declare-fun mapDefault!18570 () ValueCell!5306)

(assert (=> b!431718 (= condMapEmpty!18570 (= (arr!12669 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5306)) mapDefault!18570)))))

(declare-fun b!431719 () Bool)

(declare-fun e!255431 () Unit!12742)

(declare-fun Unit!12744 () Unit!12742)

(assert (=> b!431719 (= e!255431 Unit!12744)))

(declare-fun b!431720 () Bool)

(declare-fun res!253873 () Bool)

(assert (=> b!431720 (=> (not res!253873) (not e!255437))))

(assert (=> b!431720 (= res!253873 (bvsle from!863 i!563))))

(declare-fun b!431721 () Bool)

(declare-fun res!253882 () Bool)

(assert (=> b!431721 (=> (not res!253882) (not e!255434))))

(assert (=> b!431721 (= res!253882 (or (= (select (arr!12668 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12668 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18570 () Bool)

(declare-fun tp!35970 () Bool)

(assert (=> mapNonEmpty!18570 (= mapRes!18570 (and tp!35970 e!255433))))

(declare-fun mapValue!18570 () ValueCell!5306)

(declare-fun mapKey!18570 () (_ BitVec 32))

(declare-fun mapRest!18570 () (Array (_ BitVec 32) ValueCell!5306))

(assert (=> mapNonEmpty!18570 (= (arr!12669 _values!549) (store mapRest!18570 mapKey!18570 mapValue!18570))))

(declare-fun b!431722 () Bool)

(assert (=> b!431722 (= e!255437 e!255435)))

(declare-fun res!253884 () Bool)

(assert (=> b!431722 (=> (not res!253884) (not e!255435))))

(assert (=> b!431722 (= res!253884 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197843 () ListLongMap!6337)

(assert (=> b!431722 (= lt!197843 (getCurrentListMapNoExtraKeys!1424 lt!197836 lt!197834 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431722 (= lt!197834 (array!26441 (store (arr!12669 _values!549) i!563 (ValueCellFull!5306 v!412)) (size!13021 _values!549)))))

(declare-fun lt!197831 () ListLongMap!6337)

(assert (=> b!431722 (= lt!197831 (getCurrentListMapNoExtraKeys!1424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431723 () Bool)

(declare-fun res!253880 () Bool)

(assert (=> b!431723 (=> (not res!253880) (not e!255434))))

(assert (=> b!431723 (= res!253880 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13020 _keys!709))))))

(declare-fun b!431724 () Bool)

(assert (=> b!431724 (= e!255438 e!255430)))

(declare-fun res!253887 () Bool)

(assert (=> b!431724 (=> res!253887 e!255430)))

(assert (=> b!431724 (= res!253887 (= k0!794 (select (arr!12668 _keys!709) from!863)))))

(assert (=> b!431724 (not (= (select (arr!12668 _keys!709) from!863) k0!794))))

(declare-fun lt!197838 () Unit!12742)

(assert (=> b!431724 (= lt!197838 e!255431)))

(declare-fun c!55533 () Bool)

(assert (=> b!431724 (= c!55533 (= (select (arr!12668 _keys!709) from!863) k0!794))))

(assert (=> b!431724 (= lt!197843 lt!197841)))

(assert (=> b!431724 (= lt!197841 (+!1392 lt!197842 lt!197839))))

(assert (=> b!431724 (= lt!197839 (tuple2!7423 (select (arr!12668 _keys!709) from!863) lt!197840))))

(declare-fun get!6303 (ValueCell!5306 V!16171) V!16171)

(declare-fun dynLambda!800 (Int (_ BitVec 64)) V!16171)

(assert (=> b!431724 (= lt!197840 (get!6303 (select (arr!12669 _values!549) from!863) (dynLambda!800 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18570 () Bool)

(assert (=> mapIsEmpty!18570 mapRes!18570))

(declare-fun b!431725 () Bool)

(declare-fun res!253877 () Bool)

(assert (=> b!431725 (=> (not res!253877) (not e!255434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26438 (_ BitVec 32)) Bool)

(assert (=> b!431725 (= res!253877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431726 () Bool)

(declare-fun res!253876 () Bool)

(assert (=> b!431726 (=> (not res!253876) (not e!255434))))

(declare-fun arrayContainsKey!0 (array!26438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431726 (= res!253876 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!253885 () Bool)

(assert (=> start!39866 (=> (not res!253885) (not e!255434))))

(assert (=> start!39866 (= res!253885 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13020 _keys!709))))))

(assert (=> start!39866 e!255434))

(assert (=> start!39866 tp_is_empty!11299))

(assert (=> start!39866 tp!35969))

(assert (=> start!39866 true))

(declare-fun array_inv!9280 (array!26440) Bool)

(assert (=> start!39866 (and (array_inv!9280 _values!549) e!255436)))

(declare-fun array_inv!9281 (array!26438) Bool)

(assert (=> start!39866 (array_inv!9281 _keys!709)))

(declare-fun b!431716 () Bool)

(assert (=> b!431716 (= e!255434 e!255437)))

(declare-fun res!253879 () Bool)

(assert (=> b!431716 (=> (not res!253879) (not e!255437))))

(assert (=> b!431716 (= res!253879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197836 mask!1025))))

(assert (=> b!431716 (= lt!197836 (array!26439 (store (arr!12668 _keys!709) i!563 k0!794) (size!13020 _keys!709)))))

(declare-fun b!431727 () Bool)

(assert (=> b!431727 (= e!255439 tp_is_empty!11299)))

(declare-fun b!431728 () Bool)

(declare-fun Unit!12745 () Unit!12742)

(assert (=> b!431728 (= e!255431 Unit!12745)))

(declare-fun lt!197835 () Unit!12742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26438 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12742)

(assert (=> b!431728 (= lt!197835 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431728 false))

(assert (= (and start!39866 res!253885) b!431710))

(assert (= (and b!431710 res!253874) b!431717))

(assert (= (and b!431717 res!253875) b!431725))

(assert (= (and b!431725 res!253877) b!431709))

(assert (= (and b!431709 res!253886) b!431723))

(assert (= (and b!431723 res!253880) b!431713))

(assert (= (and b!431713 res!253883) b!431721))

(assert (= (and b!431721 res!253882) b!431726))

(assert (= (and b!431726 res!253876) b!431716))

(assert (= (and b!431716 res!253879) b!431711))

(assert (= (and b!431711 res!253881) b!431720))

(assert (= (and b!431720 res!253873) b!431722))

(assert (= (and b!431722 res!253884) b!431715))

(assert (= (and b!431715 (not res!253878)) b!431724))

(assert (= (and b!431724 c!55533) b!431728))

(assert (= (and b!431724 (not c!55533)) b!431719))

(assert (= (and b!431724 (not res!253887)) b!431712))

(assert (= (and b!431718 condMapEmpty!18570) mapIsEmpty!18570))

(assert (= (and b!431718 (not condMapEmpty!18570)) mapNonEmpty!18570))

(get-info :version)

(assert (= (and mapNonEmpty!18570 ((_ is ValueCellFull!5306) mapValue!18570)) b!431714))

(assert (= (and b!431718 ((_ is ValueCellFull!5306) mapDefault!18570)) b!431727))

(assert (= start!39866 b!431718))

(declare-fun b_lambda!9257 () Bool)

(assert (=> (not b_lambda!9257) (not b!431724)))

(declare-fun t!13004 () Bool)

(declare-fun tb!3545 () Bool)

(assert (=> (and start!39866 (= defaultEntry!557 defaultEntry!557) t!13004) tb!3545))

(declare-fun result!6625 () Bool)

(assert (=> tb!3545 (= result!6625 tp_is_empty!11299)))

(assert (=> b!431724 t!13004))

(declare-fun b_and!17969 () Bool)

(assert (= b_and!17967 (and (=> t!13004 result!6625) b_and!17969)))

(declare-fun m!420101 () Bool)

(assert (=> b!431712 m!420101))

(assert (=> b!431712 m!420101))

(declare-fun m!420103 () Bool)

(assert (=> b!431712 m!420103))

(declare-fun m!420105 () Bool)

(assert (=> b!431712 m!420105))

(assert (=> b!431712 m!420105))

(declare-fun m!420107 () Bool)

(assert (=> b!431712 m!420107))

(declare-fun m!420109 () Bool)

(assert (=> b!431725 m!420109))

(declare-fun m!420111 () Bool)

(assert (=> b!431710 m!420111))

(declare-fun m!420113 () Bool)

(assert (=> b!431722 m!420113))

(declare-fun m!420115 () Bool)

(assert (=> b!431722 m!420115))

(declare-fun m!420117 () Bool)

(assert (=> b!431722 m!420117))

(declare-fun m!420119 () Bool)

(assert (=> b!431726 m!420119))

(declare-fun m!420121 () Bool)

(assert (=> b!431721 m!420121))

(declare-fun m!420123 () Bool)

(assert (=> b!431713 m!420123))

(assert (=> b!431715 m!420105))

(declare-fun m!420125 () Bool)

(assert (=> b!431715 m!420125))

(declare-fun m!420127 () Bool)

(assert (=> b!431715 m!420127))

(declare-fun m!420129 () Bool)

(assert (=> b!431715 m!420129))

(assert (=> b!431715 m!420105))

(declare-fun m!420131 () Bool)

(assert (=> b!431715 m!420131))

(declare-fun m!420133 () Bool)

(assert (=> b!431715 m!420133))

(assert (=> b!431724 m!420105))

(declare-fun m!420135 () Bool)

(assert (=> b!431724 m!420135))

(declare-fun m!420137 () Bool)

(assert (=> b!431724 m!420137))

(declare-fun m!420139 () Bool)

(assert (=> b!431724 m!420139))

(assert (=> b!431724 m!420139))

(assert (=> b!431724 m!420137))

(declare-fun m!420141 () Bool)

(assert (=> b!431724 m!420141))

(declare-fun m!420143 () Bool)

(assert (=> b!431709 m!420143))

(declare-fun m!420145 () Bool)

(assert (=> b!431716 m!420145))

(declare-fun m!420147 () Bool)

(assert (=> b!431716 m!420147))

(declare-fun m!420149 () Bool)

(assert (=> mapNonEmpty!18570 m!420149))

(declare-fun m!420151 () Bool)

(assert (=> b!431711 m!420151))

(declare-fun m!420153 () Bool)

(assert (=> b!431728 m!420153))

(declare-fun m!420155 () Bool)

(assert (=> start!39866 m!420155))

(declare-fun m!420157 () Bool)

(assert (=> start!39866 m!420157))

(check-sat (not b!431712) (not b!431713) (not b_lambda!9257) (not mapNonEmpty!18570) (not b!431715) (not b!431716) (not b!431722) (not b!431709) tp_is_empty!11299 b_and!17969 (not b!431728) (not b!431724) (not b_next!10147) (not b!431726) (not start!39866) (not b!431725) (not b!431710) (not b!431711))
(check-sat b_and!17969 (not b_next!10147))
