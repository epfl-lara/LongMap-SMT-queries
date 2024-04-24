; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39950 () Bool)

(assert start!39950)

(declare-fun b_free!10231 () Bool)

(declare-fun b_next!10231 () Bool)

(assert (=> start!39950 (= b_free!10231 (not b_next!10231))))

(declare-fun tp!36221 () Bool)

(declare-fun b_and!18135 () Bool)

(assert (=> start!39950 (= tp!36221 b_and!18135)))

(declare-fun b!434313 () Bool)

(declare-fun e!256699 () Bool)

(declare-fun tp_is_empty!11383 () Bool)

(assert (=> b!434313 (= e!256699 tp_is_empty!11383)))

(declare-fun mapNonEmpty!18696 () Bool)

(declare-fun mapRes!18696 () Bool)

(declare-fun tp!36222 () Bool)

(assert (=> mapNonEmpty!18696 (= mapRes!18696 (and tp!36222 e!256699))))

(declare-datatypes ((V!16283 0))(
  ( (V!16284 (val!5736 Int)) )
))
(declare-datatypes ((ValueCell!5348 0))(
  ( (ValueCellFull!5348 (v!7984 V!16283)) (EmptyCell!5348) )
))
(declare-datatypes ((array!26602 0))(
  ( (array!26603 (arr!12750 (Array (_ BitVec 32) ValueCell!5348)) (size!13102 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26602)

(declare-fun mapKey!18696 () (_ BitVec 32))

(declare-fun mapRest!18696 () (Array (_ BitVec 32) ValueCell!5348))

(declare-fun mapValue!18696 () ValueCell!5348)

(assert (=> mapNonEmpty!18696 (= (arr!12750 _values!549) (store mapRest!18696 mapKey!18696 mapValue!18696))))

(declare-fun b!434314 () Bool)

(declare-fun res!255770 () Bool)

(declare-fun e!256695 () Bool)

(assert (=> b!434314 (=> (not res!255770) (not e!256695))))

(declare-datatypes ((array!26604 0))(
  ( (array!26605 (arr!12751 (Array (_ BitVec 32) (_ BitVec 64))) (size!13103 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26604)

(declare-datatypes ((List!7482 0))(
  ( (Nil!7479) (Cons!7478 (h!8334 (_ BitVec 64)) (t!13154 List!7482)) )
))
(declare-fun arrayNoDuplicates!0 (array!26604 (_ BitVec 32) List!7482) Bool)

(assert (=> b!434314 (= res!255770 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7479))))

(declare-fun b!434315 () Bool)

(declare-fun res!255776 () Bool)

(assert (=> b!434315 (=> (not res!255776) (not e!256695))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26604 (_ BitVec 32)) Bool)

(assert (=> b!434315 (= res!255776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434316 () Bool)

(declare-fun e!256697 () Bool)

(declare-fun e!256691 () Bool)

(assert (=> b!434316 (= e!256697 e!256691)))

(declare-fun res!255764 () Bool)

(assert (=> b!434316 (=> (not res!255764) (not e!256691))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434316 (= res!255764 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16283)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16283)

(declare-fun lt!199725 () array!26604)

(declare-datatypes ((tuple2!7492 0))(
  ( (tuple2!7493 (_1!3757 (_ BitVec 64)) (_2!3757 V!16283)) )
))
(declare-datatypes ((List!7483 0))(
  ( (Nil!7480) (Cons!7479 (h!8335 tuple2!7492) (t!13155 List!7483)) )
))
(declare-datatypes ((ListLongMap!6407 0))(
  ( (ListLongMap!6408 (toList!3219 List!7483)) )
))
(declare-fun lt!199728 () ListLongMap!6407)

(declare-fun lt!199724 () array!26602)

(declare-fun getCurrentListMapNoExtraKeys!1455 (array!26604 array!26602 (_ BitVec 32) (_ BitVec 32) V!16283 V!16283 (_ BitVec 32) Int) ListLongMap!6407)

(assert (=> b!434316 (= lt!199728 (getCurrentListMapNoExtraKeys!1455 lt!199725 lt!199724 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16283)

(assert (=> b!434316 (= lt!199724 (array!26603 (store (arr!12750 _values!549) i!563 (ValueCellFull!5348 v!412)) (size!13102 _values!549)))))

(declare-fun lt!199723 () ListLongMap!6407)

(assert (=> b!434316 (= lt!199723 (getCurrentListMapNoExtraKeys!1455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434317 () Bool)

(assert (=> b!434317 (= e!256695 e!256697)))

(declare-fun res!255767 () Bool)

(assert (=> b!434317 (=> (not res!255767) (not e!256697))))

(assert (=> b!434317 (= res!255767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199725 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!434317 (= lt!199725 (array!26605 (store (arr!12751 _keys!709) i!563 k0!794) (size!13103 _keys!709)))))

(declare-fun b!434318 () Bool)

(declare-fun e!256698 () Bool)

(assert (=> b!434318 (= e!256698 tp_is_empty!11383)))

(declare-fun b!434319 () Bool)

(declare-fun res!255765 () Bool)

(assert (=> b!434319 (=> (not res!255765) (not e!256695))))

(assert (=> b!434319 (= res!255765 (and (= (size!13102 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13103 _keys!709) (size!13102 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18696 () Bool)

(assert (=> mapIsEmpty!18696 mapRes!18696))

(declare-fun b!434321 () Bool)

(declare-fun res!255777 () Bool)

(assert (=> b!434321 (=> (not res!255777) (not e!256695))))

(assert (=> b!434321 (= res!255777 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13103 _keys!709))))))

(declare-fun b!434322 () Bool)

(declare-fun e!256692 () Bool)

(assert (=> b!434322 (= e!256692 (and e!256698 mapRes!18696))))

(declare-fun condMapEmpty!18696 () Bool)

(declare-fun mapDefault!18696 () ValueCell!5348)

(assert (=> b!434322 (= condMapEmpty!18696 (= (arr!12750 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5348)) mapDefault!18696)))))

(declare-fun b!434323 () Bool)

(declare-fun res!255763 () Bool)

(assert (=> b!434323 (=> (not res!255763) (not e!256695))))

(assert (=> b!434323 (= res!255763 (or (= (select (arr!12751 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12751 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434324 () Bool)

(declare-fun res!255775 () Bool)

(assert (=> b!434324 (=> (not res!255775) (not e!256695))))

(declare-fun arrayContainsKey!0 (array!26604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434324 (= res!255775 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434325 () Bool)

(declare-datatypes ((Unit!12873 0))(
  ( (Unit!12874) )
))
(declare-fun e!256696 () Unit!12873)

(declare-fun Unit!12875 () Unit!12873)

(assert (=> b!434325 (= e!256696 Unit!12875)))

(declare-fun lt!199734 () Unit!12873)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12873)

(assert (=> b!434325 (= lt!199734 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434325 false))

(declare-fun b!434326 () Bool)

(declare-fun e!256694 () Bool)

(declare-fun e!256690 () Bool)

(assert (=> b!434326 (= e!256694 e!256690)))

(declare-fun res!255773 () Bool)

(assert (=> b!434326 (=> res!255773 e!256690)))

(assert (=> b!434326 (= res!255773 (= k0!794 (select (arr!12751 _keys!709) from!863)))))

(assert (=> b!434326 (not (= (select (arr!12751 _keys!709) from!863) k0!794))))

(declare-fun lt!199730 () Unit!12873)

(assert (=> b!434326 (= lt!199730 e!256696)))

(declare-fun c!55659 () Bool)

(assert (=> b!434326 (= c!55659 (= (select (arr!12751 _keys!709) from!863) k0!794))))

(declare-fun lt!199726 () ListLongMap!6407)

(assert (=> b!434326 (= lt!199728 lt!199726)))

(declare-fun lt!199731 () ListLongMap!6407)

(declare-fun lt!199732 () tuple2!7492)

(declare-fun +!1424 (ListLongMap!6407 tuple2!7492) ListLongMap!6407)

(assert (=> b!434326 (= lt!199726 (+!1424 lt!199731 lt!199732))))

(declare-fun lt!199721 () V!16283)

(assert (=> b!434326 (= lt!199732 (tuple2!7493 (select (arr!12751 _keys!709) from!863) lt!199721))))

(declare-fun get!6359 (ValueCell!5348 V!16283) V!16283)

(declare-fun dynLambda!828 (Int (_ BitVec 64)) V!16283)

(assert (=> b!434326 (= lt!199721 (get!6359 (select (arr!12750 _values!549) from!863) (dynLambda!828 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434327 () Bool)

(declare-fun res!255772 () Bool)

(assert (=> b!434327 (=> (not res!255772) (not e!256695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434327 (= res!255772 (validMask!0 mask!1025))))

(declare-fun b!434328 () Bool)

(declare-fun res!255769 () Bool)

(assert (=> b!434328 (=> (not res!255769) (not e!256697))))

(assert (=> b!434328 (= res!255769 (arrayNoDuplicates!0 lt!199725 #b00000000000000000000000000000000 Nil!7479))))

(declare-fun b!434329 () Bool)

(declare-fun res!255766 () Bool)

(assert (=> b!434329 (=> (not res!255766) (not e!256695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434329 (= res!255766 (validKeyInArray!0 k0!794))))

(declare-fun res!255774 () Bool)

(assert (=> start!39950 (=> (not res!255774) (not e!256695))))

(assert (=> start!39950 (= res!255774 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13103 _keys!709))))))

(assert (=> start!39950 e!256695))

(assert (=> start!39950 tp_is_empty!11383))

(assert (=> start!39950 tp!36221))

(assert (=> start!39950 true))

(declare-fun array_inv!9328 (array!26602) Bool)

(assert (=> start!39950 (and (array_inv!9328 _values!549) e!256692)))

(declare-fun array_inv!9329 (array!26604) Bool)

(assert (=> start!39950 (array_inv!9329 _keys!709)))

(declare-fun b!434320 () Bool)

(declare-fun Unit!12876 () Unit!12873)

(assert (=> b!434320 (= e!256696 Unit!12876)))

(declare-fun b!434330 () Bool)

(assert (=> b!434330 (= e!256690 true)))

(declare-fun lt!199722 () ListLongMap!6407)

(declare-fun lt!199733 () tuple2!7492)

(assert (=> b!434330 (= lt!199726 (+!1424 (+!1424 lt!199722 lt!199732) lt!199733))))

(declare-fun lt!199729 () Unit!12873)

(declare-fun addCommutativeForDiffKeys!396 (ListLongMap!6407 (_ BitVec 64) V!16283 (_ BitVec 64) V!16283) Unit!12873)

(assert (=> b!434330 (= lt!199729 (addCommutativeForDiffKeys!396 lt!199722 k0!794 v!412 (select (arr!12751 _keys!709) from!863) lt!199721))))

(declare-fun b!434331 () Bool)

(assert (=> b!434331 (= e!256691 (not e!256694))))

(declare-fun res!255768 () Bool)

(assert (=> b!434331 (=> res!255768 e!256694)))

(assert (=> b!434331 (= res!255768 (not (validKeyInArray!0 (select (arr!12751 _keys!709) from!863))))))

(declare-fun lt!199720 () ListLongMap!6407)

(assert (=> b!434331 (= lt!199720 lt!199731)))

(assert (=> b!434331 (= lt!199731 (+!1424 lt!199722 lt!199733))))

(assert (=> b!434331 (= lt!199720 (getCurrentListMapNoExtraKeys!1455 lt!199725 lt!199724 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434331 (= lt!199733 (tuple2!7493 k0!794 v!412))))

(assert (=> b!434331 (= lt!199722 (getCurrentListMapNoExtraKeys!1455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199727 () Unit!12873)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!590 (array!26604 array!26602 (_ BitVec 32) (_ BitVec 32) V!16283 V!16283 (_ BitVec 32) (_ BitVec 64) V!16283 (_ BitVec 32) Int) Unit!12873)

(assert (=> b!434331 (= lt!199727 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!590 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434332 () Bool)

(declare-fun res!255771 () Bool)

(assert (=> b!434332 (=> (not res!255771) (not e!256697))))

(assert (=> b!434332 (= res!255771 (bvsle from!863 i!563))))

(assert (= (and start!39950 res!255774) b!434327))

(assert (= (and b!434327 res!255772) b!434319))

(assert (= (and b!434319 res!255765) b!434315))

(assert (= (and b!434315 res!255776) b!434314))

(assert (= (and b!434314 res!255770) b!434321))

(assert (= (and b!434321 res!255777) b!434329))

(assert (= (and b!434329 res!255766) b!434323))

(assert (= (and b!434323 res!255763) b!434324))

(assert (= (and b!434324 res!255775) b!434317))

(assert (= (and b!434317 res!255767) b!434328))

(assert (= (and b!434328 res!255769) b!434332))

(assert (= (and b!434332 res!255771) b!434316))

(assert (= (and b!434316 res!255764) b!434331))

(assert (= (and b!434331 (not res!255768)) b!434326))

(assert (= (and b!434326 c!55659) b!434325))

(assert (= (and b!434326 (not c!55659)) b!434320))

(assert (= (and b!434326 (not res!255773)) b!434330))

(assert (= (and b!434322 condMapEmpty!18696) mapIsEmpty!18696))

(assert (= (and b!434322 (not condMapEmpty!18696)) mapNonEmpty!18696))

(get-info :version)

(assert (= (and mapNonEmpty!18696 ((_ is ValueCellFull!5348) mapValue!18696)) b!434313))

(assert (= (and b!434322 ((_ is ValueCellFull!5348) mapDefault!18696)) b!434318))

(assert (= start!39950 b!434322))

(declare-fun b_lambda!9341 () Bool)

(assert (=> (not b_lambda!9341) (not b!434326)))

(declare-fun t!13153 () Bool)

(declare-fun tb!3629 () Bool)

(assert (=> (and start!39950 (= defaultEntry!557 defaultEntry!557) t!13153) tb!3629))

(declare-fun result!6793 () Bool)

(assert (=> tb!3629 (= result!6793 tp_is_empty!11383)))

(assert (=> b!434326 t!13153))

(declare-fun b_and!18137 () Bool)

(assert (= b_and!18135 (and (=> t!13153 result!6793) b_and!18137)))

(declare-fun m!422537 () Bool)

(assert (=> b!434327 m!422537))

(declare-fun m!422539 () Bool)

(assert (=> b!434317 m!422539))

(declare-fun m!422541 () Bool)

(assert (=> b!434317 m!422541))

(declare-fun m!422543 () Bool)

(assert (=> b!434330 m!422543))

(assert (=> b!434330 m!422543))

(declare-fun m!422545 () Bool)

(assert (=> b!434330 m!422545))

(declare-fun m!422547 () Bool)

(assert (=> b!434330 m!422547))

(assert (=> b!434330 m!422547))

(declare-fun m!422549 () Bool)

(assert (=> b!434330 m!422549))

(declare-fun m!422551 () Bool)

(assert (=> b!434329 m!422551))

(declare-fun m!422553 () Bool)

(assert (=> b!434315 m!422553))

(declare-fun m!422555 () Bool)

(assert (=> b!434314 m!422555))

(declare-fun m!422557 () Bool)

(assert (=> b!434325 m!422557))

(declare-fun m!422559 () Bool)

(assert (=> start!39950 m!422559))

(declare-fun m!422561 () Bool)

(assert (=> start!39950 m!422561))

(assert (=> b!434331 m!422547))

(declare-fun m!422563 () Bool)

(assert (=> b!434331 m!422563))

(declare-fun m!422565 () Bool)

(assert (=> b!434331 m!422565))

(declare-fun m!422567 () Bool)

(assert (=> b!434331 m!422567))

(assert (=> b!434331 m!422547))

(declare-fun m!422569 () Bool)

(assert (=> b!434331 m!422569))

(declare-fun m!422571 () Bool)

(assert (=> b!434331 m!422571))

(declare-fun m!422573 () Bool)

(assert (=> b!434328 m!422573))

(assert (=> b!434326 m!422547))

(declare-fun m!422575 () Bool)

(assert (=> b!434326 m!422575))

(declare-fun m!422577 () Bool)

(assert (=> b!434326 m!422577))

(assert (=> b!434326 m!422577))

(assert (=> b!434326 m!422575))

(declare-fun m!422579 () Bool)

(assert (=> b!434326 m!422579))

(declare-fun m!422581 () Bool)

(assert (=> b!434326 m!422581))

(declare-fun m!422583 () Bool)

(assert (=> b!434316 m!422583))

(declare-fun m!422585 () Bool)

(assert (=> b!434316 m!422585))

(declare-fun m!422587 () Bool)

(assert (=> b!434316 m!422587))

(declare-fun m!422589 () Bool)

(assert (=> b!434324 m!422589))

(declare-fun m!422591 () Bool)

(assert (=> mapNonEmpty!18696 m!422591))

(declare-fun m!422593 () Bool)

(assert (=> b!434323 m!422593))

(check-sat (not b!434325) (not b!434315) (not b!434326) (not b!434331) (not b!434330) (not b!434317) (not b_lambda!9341) b_and!18137 (not b!434324) tp_is_empty!11383 (not b!434329) (not b!434328) (not b_next!10231) (not mapNonEmpty!18696) (not b!434327) (not b!434316) (not b!434314) (not start!39950))
(check-sat b_and!18137 (not b_next!10231))
