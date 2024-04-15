; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39842 () Bool)

(assert start!39842)

(declare-fun b_free!10123 () Bool)

(declare-fun b_next!10123 () Bool)

(assert (=> start!39842 (= b_free!10123 (not b_next!10123))))

(declare-fun tp!35898 () Bool)

(declare-fun b_and!17879 () Bool)

(assert (=> start!39842 (= tp!35898 b_and!17879)))

(declare-fun mapIsEmpty!18534 () Bool)

(declare-fun mapRes!18534 () Bool)

(assert (=> mapIsEmpty!18534 mapRes!18534))

(declare-fun b!430743 () Bool)

(declare-fun e!254929 () Bool)

(declare-fun e!254930 () Bool)

(assert (=> b!430743 (= e!254929 (and e!254930 mapRes!18534))))

(declare-fun condMapEmpty!18534 () Bool)

(declare-datatypes ((V!16139 0))(
  ( (V!16140 (val!5682 Int)) )
))
(declare-datatypes ((ValueCell!5294 0))(
  ( (ValueCellFull!5294 (v!7923 V!16139)) (EmptyCell!5294) )
))
(declare-datatypes ((array!26377 0))(
  ( (array!26378 (arr!12638 (Array (_ BitVec 32) ValueCell!5294)) (size!12991 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26377)

(declare-fun mapDefault!18534 () ValueCell!5294)

(assert (=> b!430743 (= condMapEmpty!18534 (= (arr!12638 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5294)) mapDefault!18534)))))

(declare-fun b!430744 () Bool)

(declare-fun res!253213 () Bool)

(declare-fun e!254933 () Bool)

(assert (=> b!430744 (=> (not res!253213) (not e!254933))))

(declare-datatypes ((array!26379 0))(
  ( (array!26380 (arr!12639 (Array (_ BitVec 32) (_ BitVec 64))) (size!12992 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26379)

(declare-datatypes ((List!7494 0))(
  ( (Nil!7491) (Cons!7490 (h!8346 (_ BitVec 64)) (t!13057 List!7494)) )
))
(declare-fun arrayNoDuplicates!0 (array!26379 (_ BitVec 32) List!7494) Bool)

(assert (=> b!430744 (= res!253213 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7491))))

(declare-fun b!430745 () Bool)

(declare-fun res!253217 () Bool)

(assert (=> b!430745 (=> (not res!253217) (not e!254933))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430745 (= res!253217 (validKeyInArray!0 k0!794))))

(declare-fun b!430746 () Bool)

(declare-fun e!254937 () Bool)

(assert (=> b!430746 (= e!254933 e!254937)))

(declare-fun res!253220 () Bool)

(assert (=> b!430746 (=> (not res!253220) (not e!254937))))

(declare-fun lt!197045 () array!26379)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26379 (_ BitVec 32)) Bool)

(assert (=> b!430746 (= res!253220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197045 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430746 (= lt!197045 (array!26380 (store (arr!12639 _keys!709) i!563 k0!794) (size!12992 _keys!709)))))

(declare-fun b!430747 () Bool)

(declare-fun e!254935 () Bool)

(declare-fun tp_is_empty!11275 () Bool)

(assert (=> b!430747 (= e!254935 tp_is_empty!11275)))

(declare-fun b!430748 () Bool)

(declare-fun res!253208 () Bool)

(assert (=> b!430748 (=> (not res!253208) (not e!254937))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!430748 (= res!253208 (bvsle from!863 i!563))))

(declare-fun b!430750 () Bool)

(declare-fun res!253212 () Bool)

(assert (=> b!430750 (=> (not res!253212) (not e!254933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430750 (= res!253212 (validMask!0 mask!1025))))

(declare-fun b!430751 () Bool)

(declare-datatypes ((Unit!12681 0))(
  ( (Unit!12682) )
))
(declare-fun e!254928 () Unit!12681)

(declare-fun Unit!12683 () Unit!12681)

(assert (=> b!430751 (= e!254928 Unit!12683)))

(declare-fun lt!197047 () Unit!12681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12681)

(assert (=> b!430751 (= lt!197047 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430751 false))

(declare-fun mapNonEmpty!18534 () Bool)

(declare-fun tp!35897 () Bool)

(assert (=> mapNonEmpty!18534 (= mapRes!18534 (and tp!35897 e!254935))))

(declare-fun mapValue!18534 () ValueCell!5294)

(declare-fun mapKey!18534 () (_ BitVec 32))

(declare-fun mapRest!18534 () (Array (_ BitVec 32) ValueCell!5294))

(assert (=> mapNonEmpty!18534 (= (arr!12638 _values!549) (store mapRest!18534 mapKey!18534 mapValue!18534))))

(declare-fun b!430752 () Bool)

(declare-fun res!253207 () Bool)

(assert (=> b!430752 (=> (not res!253207) (not e!254933))))

(assert (=> b!430752 (= res!253207 (or (= (select (arr!12639 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12639 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430753 () Bool)

(declare-fun res!253211 () Bool)

(assert (=> b!430753 (=> (not res!253211) (not e!254933))))

(assert (=> b!430753 (= res!253211 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12992 _keys!709))))))

(declare-fun b!430754 () Bool)

(declare-fun res!253221 () Bool)

(assert (=> b!430754 (=> (not res!253221) (not e!254933))))

(declare-fun arrayContainsKey!0 (array!26379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430754 (= res!253221 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430755 () Bool)

(declare-fun e!254936 () Bool)

(declare-fun e!254932 () Bool)

(assert (=> b!430755 (= e!254936 e!254932)))

(declare-fun res!253214 () Bool)

(assert (=> b!430755 (=> res!253214 e!254932)))

(assert (=> b!430755 (= res!253214 (= k0!794 (select (arr!12639 _keys!709) from!863)))))

(assert (=> b!430755 (not (= (select (arr!12639 _keys!709) from!863) k0!794))))

(declare-fun lt!197037 () Unit!12681)

(assert (=> b!430755 (= lt!197037 e!254928)))

(declare-fun c!55449 () Bool)

(assert (=> b!430755 (= c!55449 (= (select (arr!12639 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7496 0))(
  ( (tuple2!7497 (_1!3759 (_ BitVec 64)) (_2!3759 V!16139)) )
))
(declare-datatypes ((List!7495 0))(
  ( (Nil!7492) (Cons!7491 (h!8347 tuple2!7496) (t!13058 List!7495)) )
))
(declare-datatypes ((ListLongMap!6399 0))(
  ( (ListLongMap!6400 (toList!3215 List!7495)) )
))
(declare-fun lt!197050 () ListLongMap!6399)

(declare-fun lt!197038 () ListLongMap!6399)

(assert (=> b!430755 (= lt!197050 lt!197038)))

(declare-fun lt!197041 () ListLongMap!6399)

(declare-fun lt!197044 () tuple2!7496)

(declare-fun +!1391 (ListLongMap!6399 tuple2!7496) ListLongMap!6399)

(assert (=> b!430755 (= lt!197038 (+!1391 lt!197041 lt!197044))))

(declare-fun lt!197039 () V!16139)

(assert (=> b!430755 (= lt!197044 (tuple2!7497 (select (arr!12639 _keys!709) from!863) lt!197039))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6274 (ValueCell!5294 V!16139) V!16139)

(declare-fun dynLambda!782 (Int (_ BitVec 64)) V!16139)

(assert (=> b!430755 (= lt!197039 (get!6274 (select (arr!12638 _values!549) from!863) (dynLambda!782 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430756 () Bool)

(declare-fun e!254934 () Bool)

(assert (=> b!430756 (= e!254934 (not e!254936))))

(declare-fun res!253215 () Bool)

(assert (=> b!430756 (=> res!253215 e!254936)))

(assert (=> b!430756 (= res!253215 (not (validKeyInArray!0 (select (arr!12639 _keys!709) from!863))))))

(declare-fun lt!197051 () ListLongMap!6399)

(assert (=> b!430756 (= lt!197051 lt!197041)))

(declare-fun lt!197049 () ListLongMap!6399)

(declare-fun lt!197043 () tuple2!7496)

(assert (=> b!430756 (= lt!197041 (+!1391 lt!197049 lt!197043))))

(declare-fun minValue!515 () V!16139)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16139)

(declare-fun lt!197048 () array!26377)

(declare-fun getCurrentListMapNoExtraKeys!1421 (array!26379 array!26377 (_ BitVec 32) (_ BitVec 32) V!16139 V!16139 (_ BitVec 32) Int) ListLongMap!6399)

(assert (=> b!430756 (= lt!197051 (getCurrentListMapNoExtraKeys!1421 lt!197045 lt!197048 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16139)

(assert (=> b!430756 (= lt!197043 (tuple2!7497 k0!794 v!412))))

(assert (=> b!430756 (= lt!197049 (getCurrentListMapNoExtraKeys!1421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197046 () Unit!12681)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!552 (array!26379 array!26377 (_ BitVec 32) (_ BitVec 32) V!16139 V!16139 (_ BitVec 32) (_ BitVec 64) V!16139 (_ BitVec 32) Int) Unit!12681)

(assert (=> b!430756 (= lt!197046 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!552 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430757 () Bool)

(assert (=> b!430757 (= e!254930 tp_is_empty!11275)))

(declare-fun b!430758 () Bool)

(declare-fun res!253209 () Bool)

(assert (=> b!430758 (=> (not res!253209) (not e!254933))))

(assert (=> b!430758 (= res!253209 (and (= (size!12991 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12992 _keys!709) (size!12991 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430759 () Bool)

(declare-fun res!253218 () Bool)

(assert (=> b!430759 (=> (not res!253218) (not e!254937))))

(assert (=> b!430759 (= res!253218 (arrayNoDuplicates!0 lt!197045 #b00000000000000000000000000000000 Nil!7491))))

(declare-fun b!430760 () Bool)

(assert (=> b!430760 (= e!254932 true)))

(assert (=> b!430760 (= lt!197038 (+!1391 (+!1391 lt!197049 lt!197044) lt!197043))))

(declare-fun lt!197042 () Unit!12681)

(declare-fun addCommutativeForDiffKeys!355 (ListLongMap!6399 (_ BitVec 64) V!16139 (_ BitVec 64) V!16139) Unit!12681)

(assert (=> b!430760 (= lt!197042 (addCommutativeForDiffKeys!355 lt!197049 k0!794 v!412 (select (arr!12639 _keys!709) from!863) lt!197039))))

(declare-fun b!430761 () Bool)

(declare-fun Unit!12684 () Unit!12681)

(assert (=> b!430761 (= e!254928 Unit!12684)))

(declare-fun b!430762 () Bool)

(assert (=> b!430762 (= e!254937 e!254934)))

(declare-fun res!253210 () Bool)

(assert (=> b!430762 (=> (not res!253210) (not e!254934))))

(assert (=> b!430762 (= res!253210 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430762 (= lt!197050 (getCurrentListMapNoExtraKeys!1421 lt!197045 lt!197048 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430762 (= lt!197048 (array!26378 (store (arr!12638 _values!549) i!563 (ValueCellFull!5294 v!412)) (size!12991 _values!549)))))

(declare-fun lt!197040 () ListLongMap!6399)

(assert (=> b!430762 (= lt!197040 (getCurrentListMapNoExtraKeys!1421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430749 () Bool)

(declare-fun res!253216 () Bool)

(assert (=> b!430749 (=> (not res!253216) (not e!254933))))

(assert (=> b!430749 (= res!253216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!253219 () Bool)

(assert (=> start!39842 (=> (not res!253219) (not e!254933))))

(assert (=> start!39842 (= res!253219 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12992 _keys!709))))))

(assert (=> start!39842 e!254933))

(assert (=> start!39842 tp_is_empty!11275))

(assert (=> start!39842 tp!35898))

(assert (=> start!39842 true))

(declare-fun array_inv!9232 (array!26377) Bool)

(assert (=> start!39842 (and (array_inv!9232 _values!549) e!254929)))

(declare-fun array_inv!9233 (array!26379) Bool)

(assert (=> start!39842 (array_inv!9233 _keys!709)))

(assert (= (and start!39842 res!253219) b!430750))

(assert (= (and b!430750 res!253212) b!430758))

(assert (= (and b!430758 res!253209) b!430749))

(assert (= (and b!430749 res!253216) b!430744))

(assert (= (and b!430744 res!253213) b!430753))

(assert (= (and b!430753 res!253211) b!430745))

(assert (= (and b!430745 res!253217) b!430752))

(assert (= (and b!430752 res!253207) b!430754))

(assert (= (and b!430754 res!253221) b!430746))

(assert (= (and b!430746 res!253220) b!430759))

(assert (= (and b!430759 res!253218) b!430748))

(assert (= (and b!430748 res!253208) b!430762))

(assert (= (and b!430762 res!253210) b!430756))

(assert (= (and b!430756 (not res!253215)) b!430755))

(assert (= (and b!430755 c!55449) b!430751))

(assert (= (and b!430755 (not c!55449)) b!430761))

(assert (= (and b!430755 (not res!253214)) b!430760))

(assert (= (and b!430743 condMapEmpty!18534) mapIsEmpty!18534))

(assert (= (and b!430743 (not condMapEmpty!18534)) mapNonEmpty!18534))

(get-info :version)

(assert (= (and mapNonEmpty!18534 ((_ is ValueCellFull!5294) mapValue!18534)) b!430747))

(assert (= (and b!430743 ((_ is ValueCellFull!5294) mapDefault!18534)) b!430757))

(assert (= start!39842 b!430743))

(declare-fun b_lambda!9193 () Bool)

(assert (=> (not b_lambda!9193) (not b!430755)))

(declare-fun t!13056 () Bool)

(declare-fun tb!3521 () Bool)

(assert (=> (and start!39842 (= defaultEntry!557 defaultEntry!557) t!13056) tb!3521))

(declare-fun result!6577 () Bool)

(assert (=> tb!3521 (= result!6577 tp_is_empty!11275)))

(assert (=> b!430755 t!13056))

(declare-fun b_and!17881 () Bool)

(assert (= b_and!17879 (and (=> t!13056 result!6577) b_and!17881)))

(declare-fun m!418455 () Bool)

(assert (=> b!430744 m!418455))

(declare-fun m!418457 () Bool)

(assert (=> b!430750 m!418457))

(declare-fun m!418459 () Bool)

(assert (=> b!430756 m!418459))

(declare-fun m!418461 () Bool)

(assert (=> b!430756 m!418461))

(declare-fun m!418463 () Bool)

(assert (=> b!430756 m!418463))

(declare-fun m!418465 () Bool)

(assert (=> b!430756 m!418465))

(assert (=> b!430756 m!418459))

(declare-fun m!418467 () Bool)

(assert (=> b!430756 m!418467))

(declare-fun m!418469 () Bool)

(assert (=> b!430756 m!418469))

(declare-fun m!418471 () Bool)

(assert (=> b!430746 m!418471))

(declare-fun m!418473 () Bool)

(assert (=> b!430746 m!418473))

(declare-fun m!418475 () Bool)

(assert (=> b!430762 m!418475))

(declare-fun m!418477 () Bool)

(assert (=> b!430762 m!418477))

(declare-fun m!418479 () Bool)

(assert (=> b!430762 m!418479))

(declare-fun m!418481 () Bool)

(assert (=> b!430751 m!418481))

(declare-fun m!418483 () Bool)

(assert (=> b!430754 m!418483))

(declare-fun m!418485 () Bool)

(assert (=> b!430745 m!418485))

(declare-fun m!418487 () Bool)

(assert (=> b!430760 m!418487))

(assert (=> b!430760 m!418487))

(declare-fun m!418489 () Bool)

(assert (=> b!430760 m!418489))

(assert (=> b!430760 m!418459))

(assert (=> b!430760 m!418459))

(declare-fun m!418491 () Bool)

(assert (=> b!430760 m!418491))

(assert (=> b!430755 m!418459))

(declare-fun m!418493 () Bool)

(assert (=> b!430755 m!418493))

(assert (=> b!430755 m!418493))

(declare-fun m!418495 () Bool)

(assert (=> b!430755 m!418495))

(declare-fun m!418497 () Bool)

(assert (=> b!430755 m!418497))

(assert (=> b!430755 m!418495))

(declare-fun m!418499 () Bool)

(assert (=> b!430755 m!418499))

(declare-fun m!418501 () Bool)

(assert (=> b!430759 m!418501))

(declare-fun m!418503 () Bool)

(assert (=> b!430752 m!418503))

(declare-fun m!418505 () Bool)

(assert (=> mapNonEmpty!18534 m!418505))

(declare-fun m!418507 () Bool)

(assert (=> start!39842 m!418507))

(declare-fun m!418509 () Bool)

(assert (=> start!39842 m!418509))

(declare-fun m!418511 () Bool)

(assert (=> b!430749 m!418511))

(check-sat (not mapNonEmpty!18534) (not b!430749) (not b!430760) tp_is_empty!11275 (not b!430746) (not b!430755) (not start!39842) (not b!430759) (not b!430744) (not b!430750) (not b!430756) (not b!430745) (not b!430762) (not b!430751) b_and!17881 (not b_lambda!9193) (not b_next!10123) (not b!430754))
(check-sat b_and!17881 (not b_next!10123))
