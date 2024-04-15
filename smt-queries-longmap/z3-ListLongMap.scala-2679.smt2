; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39878 () Bool)

(assert start!39878)

(declare-fun b_free!10159 () Bool)

(declare-fun b_next!10159 () Bool)

(assert (=> start!39878 (= b_free!10159 (not b_next!10159))))

(declare-fun tp!36006 () Bool)

(declare-fun b_and!17951 () Bool)

(assert (=> start!39878 (= tp!36006 b_and!17951)))

(declare-fun b!431860 () Bool)

(declare-fun res!254024 () Bool)

(declare-fun e!255469 () Bool)

(assert (=> b!431860 (=> (not res!254024) (not e!255469))))

(declare-datatypes ((array!26449 0))(
  ( (array!26450 (arr!12674 (Array (_ BitVec 32) (_ BitVec 64))) (size!13027 (_ BitVec 32))) )
))
(declare-fun lt!197852 () array!26449)

(declare-datatypes ((List!7524 0))(
  ( (Nil!7521) (Cons!7520 (h!8376 (_ BitVec 64)) (t!13123 List!7524)) )
))
(declare-fun arrayNoDuplicates!0 (array!26449 (_ BitVec 32) List!7524) Bool)

(assert (=> b!431860 (= res!254024 (arrayNoDuplicates!0 lt!197852 #b00000000000000000000000000000000 Nil!7521))))

(declare-fun b!431861 () Bool)

(declare-datatypes ((Unit!12733 0))(
  ( (Unit!12734) )
))
(declare-fun e!255476 () Unit!12733)

(declare-fun Unit!12735 () Unit!12733)

(assert (=> b!431861 (= e!255476 Unit!12735)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197849 () Unit!12733)

(declare-fun _keys!709 () array!26449)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12733)

(assert (=> b!431861 (= lt!197849 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431861 false))

(declare-fun b!431862 () Bool)

(declare-fun res!254025 () Bool)

(declare-fun e!255468 () Bool)

(assert (=> b!431862 (=> (not res!254025) (not e!255468))))

(assert (=> b!431862 (= res!254025 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7521))))

(declare-fun b!431863 () Bool)

(declare-fun res!254029 () Bool)

(assert (=> b!431863 (=> (not res!254029) (not e!255469))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431863 (= res!254029 (bvsle from!863 i!563))))

(declare-fun b!431864 () Bool)

(declare-fun e!255474 () Bool)

(declare-fun e!255475 () Bool)

(declare-fun mapRes!18588 () Bool)

(assert (=> b!431864 (= e!255474 (and e!255475 mapRes!18588))))

(declare-fun condMapEmpty!18588 () Bool)

(declare-datatypes ((V!16187 0))(
  ( (V!16188 (val!5700 Int)) )
))
(declare-datatypes ((ValueCell!5312 0))(
  ( (ValueCellFull!5312 (v!7941 V!16187)) (EmptyCell!5312) )
))
(declare-datatypes ((array!26451 0))(
  ( (array!26452 (arr!12675 (Array (_ BitVec 32) ValueCell!5312)) (size!13028 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26451)

(declare-fun mapDefault!18588 () ValueCell!5312)

(assert (=> b!431864 (= condMapEmpty!18588 (= (arr!12675 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5312)) mapDefault!18588)))))

(declare-fun mapIsEmpty!18588 () Bool)

(assert (=> mapIsEmpty!18588 mapRes!18588))

(declare-fun b!431865 () Bool)

(declare-fun Unit!12736 () Unit!12733)

(assert (=> b!431865 (= e!255476 Unit!12736)))

(declare-fun b!431866 () Bool)

(declare-fun res!254027 () Bool)

(assert (=> b!431866 (=> (not res!254027) (not e!255468))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!431866 (= res!254027 (and (= (size!13028 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13027 _keys!709) (size!13028 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431867 () Bool)

(declare-fun e!255477 () Bool)

(assert (=> b!431867 (= e!255469 e!255477)))

(declare-fun res!254030 () Bool)

(assert (=> b!431867 (=> (not res!254030) (not e!255477))))

(assert (=> b!431867 (= res!254030 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16187)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7530 0))(
  ( (tuple2!7531 (_1!3776 (_ BitVec 64)) (_2!3776 V!16187)) )
))
(declare-datatypes ((List!7525 0))(
  ( (Nil!7522) (Cons!7521 (h!8377 tuple2!7530) (t!13124 List!7525)) )
))
(declare-datatypes ((ListLongMap!6433 0))(
  ( (ListLongMap!6434 (toList!3232 List!7525)) )
))
(declare-fun lt!197861 () ListLongMap!6433)

(declare-fun lt!197847 () array!26451)

(declare-fun zeroValue!515 () V!16187)

(declare-fun getCurrentListMapNoExtraKeys!1437 (array!26449 array!26451 (_ BitVec 32) (_ BitVec 32) V!16187 V!16187 (_ BitVec 32) Int) ListLongMap!6433)

(assert (=> b!431867 (= lt!197861 (getCurrentListMapNoExtraKeys!1437 lt!197852 lt!197847 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16187)

(assert (=> b!431867 (= lt!197847 (array!26452 (store (arr!12675 _values!549) i!563 (ValueCellFull!5312 v!412)) (size!13028 _values!549)))))

(declare-fun lt!197858 () ListLongMap!6433)

(assert (=> b!431867 (= lt!197858 (getCurrentListMapNoExtraKeys!1437 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431868 () Bool)

(declare-fun tp_is_empty!11311 () Bool)

(assert (=> b!431868 (= e!255475 tp_is_empty!11311)))

(declare-fun b!431869 () Bool)

(declare-fun res!254031 () Bool)

(assert (=> b!431869 (=> (not res!254031) (not e!255468))))

(assert (=> b!431869 (= res!254031 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13027 _keys!709))))))

(declare-fun b!431870 () Bool)

(declare-fun res!254023 () Bool)

(assert (=> b!431870 (=> (not res!254023) (not e!255468))))

(assert (=> b!431870 (= res!254023 (or (= (select (arr!12674 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12674 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!254017 () Bool)

(assert (=> start!39878 (=> (not res!254017) (not e!255468))))

(assert (=> start!39878 (= res!254017 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13027 _keys!709))))))

(assert (=> start!39878 e!255468))

(assert (=> start!39878 tp_is_empty!11311))

(assert (=> start!39878 tp!36006))

(assert (=> start!39878 true))

(declare-fun array_inv!9258 (array!26451) Bool)

(assert (=> start!39878 (and (array_inv!9258 _values!549) e!255474)))

(declare-fun array_inv!9259 (array!26449) Bool)

(assert (=> start!39878 (array_inv!9259 _keys!709)))

(declare-fun b!431859 () Bool)

(declare-fun res!254020 () Bool)

(assert (=> b!431859 (=> (not res!254020) (not e!255468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431859 (= res!254020 (validKeyInArray!0 k0!794))))

(declare-fun b!431871 () Bool)

(assert (=> b!431871 (= e!255468 e!255469)))

(declare-fun res!254026 () Bool)

(assert (=> b!431871 (=> (not res!254026) (not e!255469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26449 (_ BitVec 32)) Bool)

(assert (=> b!431871 (= res!254026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197852 mask!1025))))

(assert (=> b!431871 (= lt!197852 (array!26450 (store (arr!12674 _keys!709) i!563 k0!794) (size!13027 _keys!709)))))

(declare-fun mapNonEmpty!18588 () Bool)

(declare-fun tp!36005 () Bool)

(declare-fun e!255473 () Bool)

(assert (=> mapNonEmpty!18588 (= mapRes!18588 (and tp!36005 e!255473))))

(declare-fun mapValue!18588 () ValueCell!5312)

(declare-fun mapKey!18588 () (_ BitVec 32))

(declare-fun mapRest!18588 () (Array (_ BitVec 32) ValueCell!5312))

(assert (=> mapNonEmpty!18588 (= (arr!12675 _values!549) (store mapRest!18588 mapKey!18588 mapValue!18588))))

(declare-fun b!431872 () Bool)

(declare-fun res!254019 () Bool)

(assert (=> b!431872 (=> (not res!254019) (not e!255468))))

(assert (=> b!431872 (= res!254019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431873 () Bool)

(assert (=> b!431873 (= e!255473 tp_is_empty!11311)))

(declare-fun b!431874 () Bool)

(declare-fun e!255472 () Bool)

(declare-fun e!255471 () Bool)

(assert (=> b!431874 (= e!255472 e!255471)))

(declare-fun res!254028 () Bool)

(assert (=> b!431874 (=> res!254028 e!255471)))

(assert (=> b!431874 (= res!254028 (= k0!794 (select (arr!12674 _keys!709) from!863)))))

(assert (=> b!431874 (not (= (select (arr!12674 _keys!709) from!863) k0!794))))

(declare-fun lt!197851 () Unit!12733)

(assert (=> b!431874 (= lt!197851 e!255476)))

(declare-fun c!55503 () Bool)

(assert (=> b!431874 (= c!55503 (= (select (arr!12674 _keys!709) from!863) k0!794))))

(declare-fun lt!197853 () ListLongMap!6433)

(assert (=> b!431874 (= lt!197861 lt!197853)))

(declare-fun lt!197857 () ListLongMap!6433)

(declare-fun lt!197848 () tuple2!7530)

(declare-fun +!1407 (ListLongMap!6433 tuple2!7530) ListLongMap!6433)

(assert (=> b!431874 (= lt!197853 (+!1407 lt!197857 lt!197848))))

(declare-fun lt!197854 () V!16187)

(assert (=> b!431874 (= lt!197848 (tuple2!7531 (select (arr!12674 _keys!709) from!863) lt!197854))))

(declare-fun get!6298 (ValueCell!5312 V!16187) V!16187)

(declare-fun dynLambda!794 (Int (_ BitVec 64)) V!16187)

(assert (=> b!431874 (= lt!197854 (get!6298 (select (arr!12675 _values!549) from!863) (dynLambda!794 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431875 () Bool)

(declare-fun res!254021 () Bool)

(assert (=> b!431875 (=> (not res!254021) (not e!255468))))

(declare-fun arrayContainsKey!0 (array!26449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431875 (= res!254021 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431876 () Bool)

(assert (=> b!431876 (= e!255471 true)))

(declare-fun lt!197856 () ListLongMap!6433)

(declare-fun lt!197859 () tuple2!7530)

(assert (=> b!431876 (= lt!197853 (+!1407 (+!1407 lt!197856 lt!197848) lt!197859))))

(declare-fun lt!197850 () Unit!12733)

(declare-fun addCommutativeForDiffKeys!367 (ListLongMap!6433 (_ BitVec 64) V!16187 (_ BitVec 64) V!16187) Unit!12733)

(assert (=> b!431876 (= lt!197850 (addCommutativeForDiffKeys!367 lt!197856 k0!794 v!412 (select (arr!12674 _keys!709) from!863) lt!197854))))

(declare-fun b!431877 () Bool)

(assert (=> b!431877 (= e!255477 (not e!255472))))

(declare-fun res!254018 () Bool)

(assert (=> b!431877 (=> res!254018 e!255472)))

(assert (=> b!431877 (= res!254018 (not (validKeyInArray!0 (select (arr!12674 _keys!709) from!863))))))

(declare-fun lt!197855 () ListLongMap!6433)

(assert (=> b!431877 (= lt!197855 lt!197857)))

(assert (=> b!431877 (= lt!197857 (+!1407 lt!197856 lt!197859))))

(assert (=> b!431877 (= lt!197855 (getCurrentListMapNoExtraKeys!1437 lt!197852 lt!197847 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431877 (= lt!197859 (tuple2!7531 k0!794 v!412))))

(assert (=> b!431877 (= lt!197856 (getCurrentListMapNoExtraKeys!1437 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197860 () Unit!12733)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!564 (array!26449 array!26451 (_ BitVec 32) (_ BitVec 32) V!16187 V!16187 (_ BitVec 32) (_ BitVec 64) V!16187 (_ BitVec 32) Int) Unit!12733)

(assert (=> b!431877 (= lt!197860 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!564 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431878 () Bool)

(declare-fun res!254022 () Bool)

(assert (=> b!431878 (=> (not res!254022) (not e!255468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431878 (= res!254022 (validMask!0 mask!1025))))

(assert (= (and start!39878 res!254017) b!431878))

(assert (= (and b!431878 res!254022) b!431866))

(assert (= (and b!431866 res!254027) b!431872))

(assert (= (and b!431872 res!254019) b!431862))

(assert (= (and b!431862 res!254025) b!431869))

(assert (= (and b!431869 res!254031) b!431859))

(assert (= (and b!431859 res!254020) b!431870))

(assert (= (and b!431870 res!254023) b!431875))

(assert (= (and b!431875 res!254021) b!431871))

(assert (= (and b!431871 res!254026) b!431860))

(assert (= (and b!431860 res!254024) b!431863))

(assert (= (and b!431863 res!254029) b!431867))

(assert (= (and b!431867 res!254030) b!431877))

(assert (= (and b!431877 (not res!254018)) b!431874))

(assert (= (and b!431874 c!55503) b!431861))

(assert (= (and b!431874 (not c!55503)) b!431865))

(assert (= (and b!431874 (not res!254028)) b!431876))

(assert (= (and b!431864 condMapEmpty!18588) mapIsEmpty!18588))

(assert (= (and b!431864 (not condMapEmpty!18588)) mapNonEmpty!18588))

(get-info :version)

(assert (= (and mapNonEmpty!18588 ((_ is ValueCellFull!5312) mapValue!18588)) b!431873))

(assert (= (and b!431864 ((_ is ValueCellFull!5312) mapDefault!18588)) b!431868))

(assert (= start!39878 b!431864))

(declare-fun b_lambda!9229 () Bool)

(assert (=> (not b_lambda!9229) (not b!431874)))

(declare-fun t!13122 () Bool)

(declare-fun tb!3557 () Bool)

(assert (=> (and start!39878 (= defaultEntry!557 defaultEntry!557) t!13122) tb!3557))

(declare-fun result!6649 () Bool)

(assert (=> tb!3557 (= result!6649 tp_is_empty!11311)))

(assert (=> b!431874 t!13122))

(declare-fun b_and!17953 () Bool)

(assert (= b_and!17951 (and (=> t!13122 result!6649) b_and!17953)))

(declare-fun m!419499 () Bool)

(assert (=> b!431862 m!419499))

(declare-fun m!419501 () Bool)

(assert (=> b!431871 m!419501))

(declare-fun m!419503 () Bool)

(assert (=> b!431871 m!419503))

(declare-fun m!419505 () Bool)

(assert (=> b!431867 m!419505))

(declare-fun m!419507 () Bool)

(assert (=> b!431867 m!419507))

(declare-fun m!419509 () Bool)

(assert (=> b!431867 m!419509))

(declare-fun m!419511 () Bool)

(assert (=> b!431877 m!419511))

(declare-fun m!419513 () Bool)

(assert (=> b!431877 m!419513))

(declare-fun m!419515 () Bool)

(assert (=> b!431877 m!419515))

(declare-fun m!419517 () Bool)

(assert (=> b!431877 m!419517))

(assert (=> b!431877 m!419511))

(declare-fun m!419519 () Bool)

(assert (=> b!431877 m!419519))

(declare-fun m!419521 () Bool)

(assert (=> b!431877 m!419521))

(declare-fun m!419523 () Bool)

(assert (=> b!431860 m!419523))

(declare-fun m!419525 () Bool)

(assert (=> b!431876 m!419525))

(assert (=> b!431876 m!419525))

(declare-fun m!419527 () Bool)

(assert (=> b!431876 m!419527))

(assert (=> b!431876 m!419511))

(assert (=> b!431876 m!419511))

(declare-fun m!419529 () Bool)

(assert (=> b!431876 m!419529))

(declare-fun m!419531 () Bool)

(assert (=> b!431859 m!419531))

(declare-fun m!419533 () Bool)

(assert (=> b!431875 m!419533))

(declare-fun m!419535 () Bool)

(assert (=> b!431878 m!419535))

(declare-fun m!419537 () Bool)

(assert (=> b!431872 m!419537))

(declare-fun m!419539 () Bool)

(assert (=> start!39878 m!419539))

(declare-fun m!419541 () Bool)

(assert (=> start!39878 m!419541))

(declare-fun m!419543 () Bool)

(assert (=> b!431861 m!419543))

(declare-fun m!419545 () Bool)

(assert (=> mapNonEmpty!18588 m!419545))

(assert (=> b!431874 m!419511))

(declare-fun m!419547 () Bool)

(assert (=> b!431874 m!419547))

(declare-fun m!419549 () Bool)

(assert (=> b!431874 m!419549))

(declare-fun m!419551 () Bool)

(assert (=> b!431874 m!419551))

(assert (=> b!431874 m!419551))

(assert (=> b!431874 m!419547))

(declare-fun m!419553 () Bool)

(assert (=> b!431874 m!419553))

(declare-fun m!419555 () Bool)

(assert (=> b!431870 m!419555))

(check-sat (not b!431867) (not b!431861) (not mapNonEmpty!18588) b_and!17953 (not b_lambda!9229) (not b!431862) (not start!39878) (not b!431860) (not b!431878) tp_is_empty!11311 (not b!431874) (not b!431876) (not b_next!10159) (not b!431875) (not b!431871) (not b!431872) (not b!431859) (not b!431877))
(check-sat b_and!17953 (not b_next!10159))
