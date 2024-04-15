; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40070 () Bool)

(assert start!40070)

(declare-fun b_free!10351 () Bool)

(declare-fun b_next!10351 () Bool)

(assert (=> start!40070 (= b_free!10351 (not b_next!10351))))

(declare-fun tp!36582 () Bool)

(declare-fun b_and!18293 () Bool)

(assert (=> start!40070 (= tp!36582 b_and!18293)))

(declare-fun b!437509 () Bool)

(declare-fun res!258219 () Bool)

(declare-fun e!258159 () Bool)

(assert (=> b!437509 (=> (not res!258219) (not e!258159))))

(declare-datatypes ((array!26827 0))(
  ( (array!26828 (arr!12863 (Array (_ BitVec 32) (_ BitVec 64))) (size!13216 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26827)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437509 (= res!258219 (or (= (select (arr!12863 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12863 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18876 () Bool)

(declare-fun mapRes!18876 () Bool)

(declare-fun tp!36581 () Bool)

(declare-fun e!258153 () Bool)

(assert (=> mapNonEmpty!18876 (= mapRes!18876 (and tp!36581 e!258153))))

(declare-fun mapKey!18876 () (_ BitVec 32))

(declare-datatypes ((V!16443 0))(
  ( (V!16444 (val!5796 Int)) )
))
(declare-datatypes ((ValueCell!5408 0))(
  ( (ValueCellFull!5408 (v!8037 V!16443)) (EmptyCell!5408) )
))
(declare-datatypes ((array!26829 0))(
  ( (array!26830 (arr!12864 (Array (_ BitVec 32) ValueCell!5408)) (size!13217 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26829)

(declare-fun mapRest!18876 () (Array (_ BitVec 32) ValueCell!5408))

(declare-fun mapValue!18876 () ValueCell!5408)

(assert (=> mapNonEmpty!18876 (= (arr!12864 _values!549) (store mapRest!18876 mapKey!18876 mapValue!18876))))

(declare-fun b!437510 () Bool)

(declare-fun res!258207 () Bool)

(assert (=> b!437510 (=> (not res!258207) (not e!258159))))

(declare-datatypes ((List!7689 0))(
  ( (Nil!7686) (Cons!7685 (h!8541 (_ BitVec 64)) (t!13436 List!7689)) )
))
(declare-fun arrayNoDuplicates!0 (array!26827 (_ BitVec 32) List!7689) Bool)

(assert (=> b!437510 (= res!258207 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7686))))

(declare-fun b!437511 () Bool)

(declare-fun res!258209 () Bool)

(assert (=> b!437511 (=> (not res!258209) (not e!258159))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437511 (= res!258209 (validKeyInArray!0 k0!794))))

(declare-fun b!437512 () Bool)

(declare-fun res!258217 () Bool)

(assert (=> b!437512 (=> (not res!258217) (not e!258159))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437512 (= res!258217 (validMask!0 mask!1025))))

(declare-fun b!437513 () Bool)

(declare-fun tp_is_empty!11503 () Bool)

(assert (=> b!437513 (= e!258153 tp_is_empty!11503)))

(declare-fun b!437514 () Bool)

(declare-fun res!258213 () Bool)

(assert (=> b!437514 (=> (not res!258213) (not e!258159))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!437514 (= res!258213 (and (= (size!13217 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13216 _keys!709) (size!13217 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!258215 () Bool)

(assert (=> start!40070 (=> (not res!258215) (not e!258159))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40070 (= res!258215 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13216 _keys!709))))))

(assert (=> start!40070 e!258159))

(assert (=> start!40070 tp_is_empty!11503))

(assert (=> start!40070 tp!36582))

(assert (=> start!40070 true))

(declare-fun e!258158 () Bool)

(declare-fun array_inv!9392 (array!26829) Bool)

(assert (=> start!40070 (and (array_inv!9392 _values!549) e!258158)))

(declare-fun array_inv!9393 (array!26827) Bool)

(assert (=> start!40070 (array_inv!9393 _keys!709)))

(declare-fun b!437515 () Bool)

(declare-fun res!258216 () Bool)

(declare-fun e!258156 () Bool)

(assert (=> b!437515 (=> (not res!258216) (not e!258156))))

(assert (=> b!437515 (= res!258216 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18876 () Bool)

(assert (=> mapIsEmpty!18876 mapRes!18876))

(declare-fun b!437516 () Bool)

(declare-fun e!258154 () Bool)

(assert (=> b!437516 (= e!258154 (not true))))

(declare-fun minValue!515 () V!16443)

(declare-fun zeroValue!515 () V!16443)

(declare-fun lt!201519 () array!26829)

(declare-fun v!412 () V!16443)

(declare-fun lt!201520 () array!26827)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7702 0))(
  ( (tuple2!7703 (_1!3862 (_ BitVec 64)) (_2!3862 V!16443)) )
))
(declare-datatypes ((List!7690 0))(
  ( (Nil!7687) (Cons!7686 (h!8542 tuple2!7702) (t!13437 List!7690)) )
))
(declare-datatypes ((ListLongMap!6605 0))(
  ( (ListLongMap!6606 (toList!3318 List!7690)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1517 (array!26827 array!26829 (_ BitVec 32) (_ BitVec 32) V!16443 V!16443 (_ BitVec 32) Int) ListLongMap!6605)

(declare-fun +!1491 (ListLongMap!6605 tuple2!7702) ListLongMap!6605)

(assert (=> b!437516 (= (getCurrentListMapNoExtraKeys!1517 lt!201520 lt!201519 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1491 (getCurrentListMapNoExtraKeys!1517 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7703 k0!794 v!412)))))

(declare-datatypes ((Unit!12999 0))(
  ( (Unit!13000) )
))
(declare-fun lt!201517 () Unit!12999)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!629 (array!26827 array!26829 (_ BitVec 32) (_ BitVec 32) V!16443 V!16443 (_ BitVec 32) (_ BitVec 64) V!16443 (_ BitVec 32) Int) Unit!12999)

(assert (=> b!437516 (= lt!201517 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!629 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437517 () Bool)

(declare-fun res!258214 () Bool)

(assert (=> b!437517 (=> (not res!258214) (not e!258159))))

(declare-fun arrayContainsKey!0 (array!26827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437517 (= res!258214 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437518 () Bool)

(declare-fun res!258212 () Bool)

(assert (=> b!437518 (=> (not res!258212) (not e!258159))))

(assert (=> b!437518 (= res!258212 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13216 _keys!709))))))

(declare-fun b!437519 () Bool)

(declare-fun e!258155 () Bool)

(assert (=> b!437519 (= e!258155 tp_is_empty!11503)))

(declare-fun b!437520 () Bool)

(assert (=> b!437520 (= e!258159 e!258156)))

(declare-fun res!258210 () Bool)

(assert (=> b!437520 (=> (not res!258210) (not e!258156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26827 (_ BitVec 32)) Bool)

(assert (=> b!437520 (= res!258210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201520 mask!1025))))

(assert (=> b!437520 (= lt!201520 (array!26828 (store (arr!12863 _keys!709) i!563 k0!794) (size!13216 _keys!709)))))

(declare-fun b!437521 () Bool)

(assert (=> b!437521 (= e!258158 (and e!258155 mapRes!18876))))

(declare-fun condMapEmpty!18876 () Bool)

(declare-fun mapDefault!18876 () ValueCell!5408)

(assert (=> b!437521 (= condMapEmpty!18876 (= (arr!12864 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5408)) mapDefault!18876)))))

(declare-fun b!437522 () Bool)

(assert (=> b!437522 (= e!258156 e!258154)))

(declare-fun res!258211 () Bool)

(assert (=> b!437522 (=> (not res!258211) (not e!258154))))

(assert (=> b!437522 (= res!258211 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201518 () ListLongMap!6605)

(assert (=> b!437522 (= lt!201518 (getCurrentListMapNoExtraKeys!1517 lt!201520 lt!201519 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437522 (= lt!201519 (array!26830 (store (arr!12864 _values!549) i!563 (ValueCellFull!5408 v!412)) (size!13217 _values!549)))))

(declare-fun lt!201521 () ListLongMap!6605)

(assert (=> b!437522 (= lt!201521 (getCurrentListMapNoExtraKeys!1517 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437523 () Bool)

(declare-fun res!258208 () Bool)

(assert (=> b!437523 (=> (not res!258208) (not e!258159))))

(assert (=> b!437523 (= res!258208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437524 () Bool)

(declare-fun res!258218 () Bool)

(assert (=> b!437524 (=> (not res!258218) (not e!258156))))

(assert (=> b!437524 (= res!258218 (arrayNoDuplicates!0 lt!201520 #b00000000000000000000000000000000 Nil!7686))))

(assert (= (and start!40070 res!258215) b!437512))

(assert (= (and b!437512 res!258217) b!437514))

(assert (= (and b!437514 res!258213) b!437523))

(assert (= (and b!437523 res!258208) b!437510))

(assert (= (and b!437510 res!258207) b!437518))

(assert (= (and b!437518 res!258212) b!437511))

(assert (= (and b!437511 res!258209) b!437509))

(assert (= (and b!437509 res!258219) b!437517))

(assert (= (and b!437517 res!258214) b!437520))

(assert (= (and b!437520 res!258210) b!437524))

(assert (= (and b!437524 res!258218) b!437515))

(assert (= (and b!437515 res!258216) b!437522))

(assert (= (and b!437522 res!258211) b!437516))

(assert (= (and b!437521 condMapEmpty!18876) mapIsEmpty!18876))

(assert (= (and b!437521 (not condMapEmpty!18876)) mapNonEmpty!18876))

(get-info :version)

(assert (= (and mapNonEmpty!18876 ((_ is ValueCellFull!5408) mapValue!18876)) b!437513))

(assert (= (and b!437521 ((_ is ValueCellFull!5408) mapDefault!18876)) b!437519))

(assert (= start!40070 b!437521))

(declare-fun m!424647 () Bool)

(assert (=> b!437520 m!424647))

(declare-fun m!424649 () Bool)

(assert (=> b!437520 m!424649))

(declare-fun m!424651 () Bool)

(assert (=> b!437509 m!424651))

(declare-fun m!424653 () Bool)

(assert (=> mapNonEmpty!18876 m!424653))

(declare-fun m!424655 () Bool)

(assert (=> b!437510 m!424655))

(declare-fun m!424657 () Bool)

(assert (=> b!437512 m!424657))

(declare-fun m!424659 () Bool)

(assert (=> b!437522 m!424659))

(declare-fun m!424661 () Bool)

(assert (=> b!437522 m!424661))

(declare-fun m!424663 () Bool)

(assert (=> b!437522 m!424663))

(declare-fun m!424665 () Bool)

(assert (=> start!40070 m!424665))

(declare-fun m!424667 () Bool)

(assert (=> start!40070 m!424667))

(declare-fun m!424669 () Bool)

(assert (=> b!437524 m!424669))

(declare-fun m!424671 () Bool)

(assert (=> b!437511 m!424671))

(declare-fun m!424673 () Bool)

(assert (=> b!437517 m!424673))

(declare-fun m!424675 () Bool)

(assert (=> b!437523 m!424675))

(declare-fun m!424677 () Bool)

(assert (=> b!437516 m!424677))

(declare-fun m!424679 () Bool)

(assert (=> b!437516 m!424679))

(assert (=> b!437516 m!424679))

(declare-fun m!424681 () Bool)

(assert (=> b!437516 m!424681))

(declare-fun m!424683 () Bool)

(assert (=> b!437516 m!424683))

(check-sat tp_is_empty!11503 (not mapNonEmpty!18876) (not b!437522) (not b!437520) (not b!437523) (not b!437512) (not b!437510) (not b!437517) (not b!437516) (not b!437511) (not start!40070) (not b_next!10351) b_and!18293 (not b!437524))
(check-sat b_and!18293 (not b_next!10351))
