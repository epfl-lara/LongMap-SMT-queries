; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39806 () Bool)

(assert start!39806)

(declare-fun b_free!10087 () Bool)

(declare-fun b_next!10087 () Bool)

(assert (=> start!39806 (= b_free!10087 (not b_next!10087))))

(declare-fun tp!35790 () Bool)

(declare-fun b_and!17847 () Bool)

(assert (=> start!39806 (= tp!35790 b_and!17847)))

(declare-fun b!429856 () Bool)

(declare-fun res!252539 () Bool)

(declare-fun e!254545 () Bool)

(assert (=> b!429856 (=> (not res!252539) (not e!254545))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429856 (= res!252539 (validKeyInArray!0 k0!794))))

(declare-fun b!429857 () Bool)

(declare-fun e!254538 () Bool)

(declare-fun tp_is_empty!11239 () Bool)

(assert (=> b!429857 (= e!254538 tp_is_empty!11239)))

(declare-fun b!429858 () Bool)

(declare-fun res!252543 () Bool)

(assert (=> b!429858 (=> (not res!252543) (not e!254545))))

(declare-datatypes ((array!26318 0))(
  ( (array!26319 (arr!12608 (Array (_ BitVec 32) (_ BitVec 64))) (size!12960 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26318)

(declare-fun arrayContainsKey!0 (array!26318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429858 (= res!252543 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!252532 () Bool)

(assert (=> start!39806 (=> (not res!252532) (not e!254545))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39806 (= res!252532 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12960 _keys!709))))))

(assert (=> start!39806 e!254545))

(assert (=> start!39806 tp_is_empty!11239))

(assert (=> start!39806 tp!35790))

(assert (=> start!39806 true))

(declare-datatypes ((V!16091 0))(
  ( (V!16092 (val!5664 Int)) )
))
(declare-datatypes ((ValueCell!5276 0))(
  ( (ValueCellFull!5276 (v!7912 V!16091)) (EmptyCell!5276) )
))
(declare-datatypes ((array!26320 0))(
  ( (array!26321 (arr!12609 (Array (_ BitVec 32) ValueCell!5276)) (size!12961 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26320)

(declare-fun e!254540 () Bool)

(declare-fun array_inv!9244 (array!26320) Bool)

(assert (=> start!39806 (and (array_inv!9244 _values!549) e!254540)))

(declare-fun array_inv!9245 (array!26318) Bool)

(assert (=> start!39806 (array_inv!9245 _keys!709)))

(declare-fun mapNonEmpty!18480 () Bool)

(declare-fun mapRes!18480 () Bool)

(declare-fun tp!35789 () Bool)

(assert (=> mapNonEmpty!18480 (= mapRes!18480 (and tp!35789 e!254538))))

(declare-fun mapKey!18480 () (_ BitVec 32))

(declare-fun mapRest!18480 () (Array (_ BitVec 32) ValueCell!5276))

(declare-fun mapValue!18480 () ValueCell!5276)

(assert (=> mapNonEmpty!18480 (= (arr!12609 _values!549) (store mapRest!18480 mapKey!18480 mapValue!18480))))

(declare-fun b!429859 () Bool)

(declare-fun e!254537 () Bool)

(assert (=> b!429859 (= e!254545 e!254537)))

(declare-fun res!252531 () Bool)

(assert (=> b!429859 (=> (not res!252531) (not e!254537))))

(declare-fun lt!196518 () array!26318)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26318 (_ BitVec 32)) Bool)

(assert (=> b!429859 (= res!252531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196518 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429859 (= lt!196518 (array!26319 (store (arr!12608 _keys!709) i!563 k0!794) (size!12960 _keys!709)))))

(declare-fun b!429860 () Bool)

(declare-fun e!254542 () Bool)

(assert (=> b!429860 (= e!254537 e!254542)))

(declare-fun res!252540 () Bool)

(assert (=> b!429860 (=> (not res!252540) (not e!254542))))

(assert (=> b!429860 (= res!252540 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196522 () array!26320)

(declare-fun minValue!515 () V!16091)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16091)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7362 0))(
  ( (tuple2!7363 (_1!3692 (_ BitVec 64)) (_2!3692 V!16091)) )
))
(declare-datatypes ((List!7361 0))(
  ( (Nil!7358) (Cons!7357 (h!8213 tuple2!7362) (t!12889 List!7361)) )
))
(declare-datatypes ((ListLongMap!6277 0))(
  ( (ListLongMap!6278 (toList!3154 List!7361)) )
))
(declare-fun lt!196516 () ListLongMap!6277)

(declare-fun getCurrentListMapNoExtraKeys!1398 (array!26318 array!26320 (_ BitVec 32) (_ BitVec 32) V!16091 V!16091 (_ BitVec 32) Int) ListLongMap!6277)

(assert (=> b!429860 (= lt!196516 (getCurrentListMapNoExtraKeys!1398 lt!196518 lt!196522 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16091)

(assert (=> b!429860 (= lt!196522 (array!26321 (store (arr!12609 _values!549) i!563 (ValueCellFull!5276 v!412)) (size!12961 _values!549)))))

(declare-fun lt!196523 () ListLongMap!6277)

(assert (=> b!429860 (= lt!196523 (getCurrentListMapNoExtraKeys!1398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18480 () Bool)

(assert (=> mapIsEmpty!18480 mapRes!18480))

(declare-fun b!429861 () Bool)

(declare-datatypes ((Unit!12638 0))(
  ( (Unit!12639) )
))
(declare-fun e!254544 () Unit!12638)

(declare-fun Unit!12640 () Unit!12638)

(assert (=> b!429861 (= e!254544 Unit!12640)))

(declare-fun lt!196519 () Unit!12638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12638)

(assert (=> b!429861 (= lt!196519 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429861 false))

(declare-fun b!429862 () Bool)

(declare-fun res!252530 () Bool)

(assert (=> b!429862 (=> (not res!252530) (not e!254545))))

(assert (=> b!429862 (= res!252530 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12960 _keys!709))))))

(declare-fun b!429863 () Bool)

(declare-fun res!252536 () Bool)

(assert (=> b!429863 (=> (not res!252536) (not e!254545))))

(assert (=> b!429863 (= res!252536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429864 () Bool)

(declare-fun e!254543 () Bool)

(assert (=> b!429864 (= e!254543 tp_is_empty!11239)))

(declare-fun b!429865 () Bool)

(declare-fun res!252535 () Bool)

(assert (=> b!429865 (=> (not res!252535) (not e!254545))))

(declare-datatypes ((List!7362 0))(
  ( (Nil!7359) (Cons!7358 (h!8214 (_ BitVec 64)) (t!12890 List!7362)) )
))
(declare-fun arrayNoDuplicates!0 (array!26318 (_ BitVec 32) List!7362) Bool)

(assert (=> b!429865 (= res!252535 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7359))))

(declare-fun b!429866 () Bool)

(declare-fun res!252537 () Bool)

(assert (=> b!429866 (=> (not res!252537) (not e!254545))))

(assert (=> b!429866 (= res!252537 (and (= (size!12961 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12960 _keys!709) (size!12961 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429867 () Bool)

(declare-fun e!254539 () Bool)

(assert (=> b!429867 (= e!254539 true)))

(assert (=> b!429867 (not (= (select (arr!12608 _keys!709) from!863) k0!794))))

(declare-fun lt!196517 () Unit!12638)

(assert (=> b!429867 (= lt!196517 e!254544)))

(declare-fun c!55443 () Bool)

(assert (=> b!429867 (= c!55443 (= (select (arr!12608 _keys!709) from!863) k0!794))))

(declare-fun lt!196515 () ListLongMap!6277)

(declare-fun +!1365 (ListLongMap!6277 tuple2!7362) ListLongMap!6277)

(declare-fun get!6261 (ValueCell!5276 V!16091) V!16091)

(declare-fun dynLambda!778 (Int (_ BitVec 64)) V!16091)

(assert (=> b!429867 (= lt!196516 (+!1365 lt!196515 (tuple2!7363 (select (arr!12608 _keys!709) from!863) (get!6261 (select (arr!12609 _values!549) from!863) (dynLambda!778 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429868 () Bool)

(declare-fun res!252538 () Bool)

(assert (=> b!429868 (=> (not res!252538) (not e!254537))))

(assert (=> b!429868 (= res!252538 (arrayNoDuplicates!0 lt!196518 #b00000000000000000000000000000000 Nil!7359))))

(declare-fun b!429869 () Bool)

(declare-fun res!252533 () Bool)

(assert (=> b!429869 (=> (not res!252533) (not e!254545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429869 (= res!252533 (validMask!0 mask!1025))))

(declare-fun b!429870 () Bool)

(declare-fun res!252534 () Bool)

(assert (=> b!429870 (=> (not res!252534) (not e!254537))))

(assert (=> b!429870 (= res!252534 (bvsle from!863 i!563))))

(declare-fun b!429871 () Bool)

(assert (=> b!429871 (= e!254540 (and e!254543 mapRes!18480))))

(declare-fun condMapEmpty!18480 () Bool)

(declare-fun mapDefault!18480 () ValueCell!5276)

(assert (=> b!429871 (= condMapEmpty!18480 (= (arr!12609 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5276)) mapDefault!18480)))))

(declare-fun b!429872 () Bool)

(declare-fun res!252542 () Bool)

(assert (=> b!429872 (=> (not res!252542) (not e!254545))))

(assert (=> b!429872 (= res!252542 (or (= (select (arr!12608 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12608 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429873 () Bool)

(assert (=> b!429873 (= e!254542 (not e!254539))))

(declare-fun res!252541 () Bool)

(assert (=> b!429873 (=> res!252541 e!254539)))

(assert (=> b!429873 (= res!252541 (not (validKeyInArray!0 (select (arr!12608 _keys!709) from!863))))))

(declare-fun lt!196521 () ListLongMap!6277)

(assert (=> b!429873 (= lt!196521 lt!196515)))

(declare-fun lt!196524 () ListLongMap!6277)

(assert (=> b!429873 (= lt!196515 (+!1365 lt!196524 (tuple2!7363 k0!794 v!412)))))

(assert (=> b!429873 (= lt!196521 (getCurrentListMapNoExtraKeys!1398 lt!196518 lt!196522 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429873 (= lt!196524 (getCurrentListMapNoExtraKeys!1398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196520 () Unit!12638)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!543 (array!26318 array!26320 (_ BitVec 32) (_ BitVec 32) V!16091 V!16091 (_ BitVec 32) (_ BitVec 64) V!16091 (_ BitVec 32) Int) Unit!12638)

(assert (=> b!429873 (= lt!196520 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!543 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429874 () Bool)

(declare-fun Unit!12641 () Unit!12638)

(assert (=> b!429874 (= e!254544 Unit!12641)))

(assert (= (and start!39806 res!252532) b!429869))

(assert (= (and b!429869 res!252533) b!429866))

(assert (= (and b!429866 res!252537) b!429863))

(assert (= (and b!429863 res!252536) b!429865))

(assert (= (and b!429865 res!252535) b!429862))

(assert (= (and b!429862 res!252530) b!429856))

(assert (= (and b!429856 res!252539) b!429872))

(assert (= (and b!429872 res!252542) b!429858))

(assert (= (and b!429858 res!252543) b!429859))

(assert (= (and b!429859 res!252531) b!429868))

(assert (= (and b!429868 res!252538) b!429870))

(assert (= (and b!429870 res!252534) b!429860))

(assert (= (and b!429860 res!252540) b!429873))

(assert (= (and b!429873 (not res!252541)) b!429867))

(assert (= (and b!429867 c!55443) b!429861))

(assert (= (and b!429867 (not c!55443)) b!429874))

(assert (= (and b!429871 condMapEmpty!18480) mapIsEmpty!18480))

(assert (= (and b!429871 (not condMapEmpty!18480)) mapNonEmpty!18480))

(get-info :version)

(assert (= (and mapNonEmpty!18480 ((_ is ValueCellFull!5276) mapValue!18480)) b!429857))

(assert (= (and b!429871 ((_ is ValueCellFull!5276) mapDefault!18480)) b!429864))

(assert (= start!39806 b!429871))

(declare-fun b_lambda!9197 () Bool)

(assert (=> (not b_lambda!9197) (not b!429867)))

(declare-fun t!12888 () Bool)

(declare-fun tb!3485 () Bool)

(assert (=> (and start!39806 (= defaultEntry!557 defaultEntry!557) t!12888) tb!3485))

(declare-fun result!6505 () Bool)

(assert (=> tb!3485 (= result!6505 tp_is_empty!11239)))

(assert (=> b!429867 t!12888))

(declare-fun b_and!17849 () Bool)

(assert (= b_and!17847 (and (=> t!12888 result!6505) b_and!17849)))

(declare-fun m!418379 () Bool)

(assert (=> b!429868 m!418379))

(declare-fun m!418381 () Bool)

(assert (=> b!429872 m!418381))

(declare-fun m!418383 () Bool)

(assert (=> mapNonEmpty!18480 m!418383))

(declare-fun m!418385 () Bool)

(assert (=> start!39806 m!418385))

(declare-fun m!418387 () Bool)

(assert (=> start!39806 m!418387))

(declare-fun m!418389 () Bool)

(assert (=> b!429856 m!418389))

(declare-fun m!418391 () Bool)

(assert (=> b!429861 m!418391))

(declare-fun m!418393 () Bool)

(assert (=> b!429859 m!418393))

(declare-fun m!418395 () Bool)

(assert (=> b!429859 m!418395))

(declare-fun m!418397 () Bool)

(assert (=> b!429863 m!418397))

(declare-fun m!418399 () Bool)

(assert (=> b!429867 m!418399))

(declare-fun m!418401 () Bool)

(assert (=> b!429867 m!418401))

(declare-fun m!418403 () Bool)

(assert (=> b!429867 m!418403))

(assert (=> b!429867 m!418403))

(assert (=> b!429867 m!418401))

(declare-fun m!418405 () Bool)

(assert (=> b!429867 m!418405))

(declare-fun m!418407 () Bool)

(assert (=> b!429867 m!418407))

(declare-fun m!418409 () Bool)

(assert (=> b!429869 m!418409))

(declare-fun m!418411 () Bool)

(assert (=> b!429858 m!418411))

(declare-fun m!418413 () Bool)

(assert (=> b!429860 m!418413))

(declare-fun m!418415 () Bool)

(assert (=> b!429860 m!418415))

(declare-fun m!418417 () Bool)

(assert (=> b!429860 m!418417))

(assert (=> b!429873 m!418399))

(declare-fun m!418419 () Bool)

(assert (=> b!429873 m!418419))

(declare-fun m!418421 () Bool)

(assert (=> b!429873 m!418421))

(declare-fun m!418423 () Bool)

(assert (=> b!429873 m!418423))

(assert (=> b!429873 m!418399))

(declare-fun m!418425 () Bool)

(assert (=> b!429873 m!418425))

(declare-fun m!418427 () Bool)

(assert (=> b!429873 m!418427))

(declare-fun m!418429 () Bool)

(assert (=> b!429865 m!418429))

(check-sat (not b!429861) (not b!429868) (not b!429860) (not b!429865) (not b_next!10087) (not b!429869) (not b!429856) (not b!429863) (not b!429859) (not b!429873) b_and!17849 (not mapNonEmpty!18480) (not b!429867) (not b!429858) tp_is_empty!11239 (not b_lambda!9197) (not start!39806))
(check-sat b_and!17849 (not b_next!10087))
