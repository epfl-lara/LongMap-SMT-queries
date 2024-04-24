; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40124 () Bool)

(assert start!40124)

(declare-fun b_free!10405 () Bool)

(declare-fun b_next!10405 () Bool)

(assert (=> start!40124 (= b_free!10405 (not b_next!10405))))

(declare-fun tp!36744 () Bool)

(declare-fun b_and!18387 () Bool)

(assert (=> start!40124 (= tp!36744 b_and!18387)))

(declare-fun b!439027 () Bool)

(declare-fun res!259386 () Bool)

(declare-fun e!258865 () Bool)

(assert (=> b!439027 (=> (not res!259386) (not e!258865))))

(declare-datatypes ((array!26936 0))(
  ( (array!26937 (arr!12917 (Array (_ BitVec 32) (_ BitVec 64))) (size!13269 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26936)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16515 0))(
  ( (V!16516 (val!5823 Int)) )
))
(declare-datatypes ((ValueCell!5435 0))(
  ( (ValueCellFull!5435 (v!8071 V!16515)) (EmptyCell!5435) )
))
(declare-datatypes ((array!26938 0))(
  ( (array!26939 (arr!12918 (Array (_ BitVec 32) ValueCell!5435)) (size!13270 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26938)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!439027 (= res!259386 (and (= (size!13270 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13269 _keys!709) (size!13270 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439028 () Bool)

(declare-fun e!258862 () Bool)

(declare-fun e!258864 () Bool)

(declare-fun mapRes!18957 () Bool)

(assert (=> b!439028 (= e!258862 (and e!258864 mapRes!18957))))

(declare-fun condMapEmpty!18957 () Bool)

(declare-fun mapDefault!18957 () ValueCell!5435)

(assert (=> b!439028 (= condMapEmpty!18957 (= (arr!12918 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5435)) mapDefault!18957)))))

(declare-fun b!439029 () Bool)

(declare-fun res!259388 () Bool)

(assert (=> b!439029 (=> (not res!259388) (not e!258865))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439029 (= res!259388 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439030 () Bool)

(declare-fun tp_is_empty!11557 () Bool)

(assert (=> b!439030 (= e!258864 tp_is_empty!11557)))

(declare-fun mapNonEmpty!18957 () Bool)

(declare-fun tp!36743 () Bool)

(declare-fun e!258867 () Bool)

(assert (=> mapNonEmpty!18957 (= mapRes!18957 (and tp!36743 e!258867))))

(declare-fun mapRest!18957 () (Array (_ BitVec 32) ValueCell!5435))

(declare-fun mapValue!18957 () ValueCell!5435)

(declare-fun mapKey!18957 () (_ BitVec 32))

(assert (=> mapNonEmpty!18957 (= (arr!12918 _values!549) (store mapRest!18957 mapKey!18957 mapValue!18957))))

(declare-fun b!439031 () Bool)

(declare-fun res!259397 () Bool)

(declare-fun e!258868 () Bool)

(assert (=> b!439031 (=> (not res!259397) (not e!258868))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439031 (= res!259397 (bvsle from!863 i!563))))

(declare-fun b!439032 () Bool)

(declare-fun res!259391 () Bool)

(assert (=> b!439032 (=> (not res!259391) (not e!258865))))

(assert (=> b!439032 (= res!259391 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13269 _keys!709))))))

(declare-fun mapIsEmpty!18957 () Bool)

(assert (=> mapIsEmpty!18957 mapRes!18957))

(declare-fun res!259392 () Bool)

(assert (=> start!40124 (=> (not res!259392) (not e!258865))))

(assert (=> start!40124 (= res!259392 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13269 _keys!709))))))

(assert (=> start!40124 e!258865))

(assert (=> start!40124 tp_is_empty!11557))

(assert (=> start!40124 tp!36744))

(assert (=> start!40124 true))

(declare-fun array_inv!9444 (array!26938) Bool)

(assert (=> start!40124 (and (array_inv!9444 _values!549) e!258862)))

(declare-fun array_inv!9445 (array!26936) Bool)

(assert (=> start!40124 (array_inv!9445 _keys!709)))

(declare-fun b!439033 () Bool)

(declare-fun res!259394 () Bool)

(assert (=> b!439033 (=> (not res!259394) (not e!258865))))

(assert (=> b!439033 (= res!259394 (or (= (select (arr!12917 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12917 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439034 () Bool)

(declare-fun res!259389 () Bool)

(assert (=> b!439034 (=> (not res!259389) (not e!258865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439034 (= res!259389 (validMask!0 mask!1025))))

(declare-fun b!439035 () Bool)

(declare-fun res!259398 () Bool)

(assert (=> b!439035 (=> (not res!259398) (not e!258865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26936 (_ BitVec 32)) Bool)

(assert (=> b!439035 (= res!259398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439036 () Bool)

(declare-fun res!259393 () Bool)

(assert (=> b!439036 (=> (not res!259393) (not e!258865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439036 (= res!259393 (validKeyInArray!0 k0!794))))

(declare-fun b!439037 () Bool)

(assert (=> b!439037 (= e!258865 e!258868)))

(declare-fun res!259396 () Bool)

(assert (=> b!439037 (=> (not res!259396) (not e!258868))))

(declare-fun lt!202177 () array!26936)

(assert (=> b!439037 (= res!259396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202177 mask!1025))))

(assert (=> b!439037 (= lt!202177 (array!26937 (store (arr!12917 _keys!709) i!563 k0!794) (size!13269 _keys!709)))))

(declare-fun b!439038 () Bool)

(declare-fun res!259387 () Bool)

(assert (=> b!439038 (=> (not res!259387) (not e!258868))))

(declare-datatypes ((List!7623 0))(
  ( (Nil!7620) (Cons!7619 (h!8475 (_ BitVec 64)) (t!13371 List!7623)) )
))
(declare-fun arrayNoDuplicates!0 (array!26936 (_ BitVec 32) List!7623) Bool)

(assert (=> b!439038 (= res!259387 (arrayNoDuplicates!0 lt!202177 #b00000000000000000000000000000000 Nil!7620))))

(declare-fun b!439039 () Bool)

(declare-fun e!258863 () Bool)

(assert (=> b!439039 (= e!258863 (not true))))

(declare-fun minValue!515 () V!16515)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16515)

(declare-fun v!412 () V!16515)

(declare-fun lt!202178 () array!26938)

(declare-datatypes ((tuple2!7636 0))(
  ( (tuple2!7637 (_1!3829 (_ BitVec 64)) (_2!3829 V!16515)) )
))
(declare-datatypes ((List!7624 0))(
  ( (Nil!7621) (Cons!7620 (h!8476 tuple2!7636) (t!13372 List!7624)) )
))
(declare-datatypes ((ListLongMap!6551 0))(
  ( (ListLongMap!6552 (toList!3291 List!7624)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1524 (array!26936 array!26938 (_ BitVec 32) (_ BitVec 32) V!16515 V!16515 (_ BitVec 32) Int) ListLongMap!6551)

(declare-fun +!1486 (ListLongMap!6551 tuple2!7636) ListLongMap!6551)

(assert (=> b!439039 (= (getCurrentListMapNoExtraKeys!1524 lt!202177 lt!202178 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1486 (getCurrentListMapNoExtraKeys!1524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7637 k0!794 v!412)))))

(declare-datatypes ((Unit!13047 0))(
  ( (Unit!13048) )
))
(declare-fun lt!202175 () Unit!13047)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!646 (array!26936 array!26938 (_ BitVec 32) (_ BitVec 32) V!16515 V!16515 (_ BitVec 32) (_ BitVec 64) V!16515 (_ BitVec 32) Int) Unit!13047)

(assert (=> b!439039 (= lt!202175 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!646 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439040 () Bool)

(assert (=> b!439040 (= e!258867 tp_is_empty!11557)))

(declare-fun b!439041 () Bool)

(declare-fun res!259390 () Bool)

(assert (=> b!439041 (=> (not res!259390) (not e!258865))))

(assert (=> b!439041 (= res!259390 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7620))))

(declare-fun b!439042 () Bool)

(assert (=> b!439042 (= e!258868 e!258863)))

(declare-fun res!259395 () Bool)

(assert (=> b!439042 (=> (not res!259395) (not e!258863))))

(assert (=> b!439042 (= res!259395 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202176 () ListLongMap!6551)

(assert (=> b!439042 (= lt!202176 (getCurrentListMapNoExtraKeys!1524 lt!202177 lt!202178 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439042 (= lt!202178 (array!26939 (store (arr!12918 _values!549) i!563 (ValueCellFull!5435 v!412)) (size!13270 _values!549)))))

(declare-fun lt!202179 () ListLongMap!6551)

(assert (=> b!439042 (= lt!202179 (getCurrentListMapNoExtraKeys!1524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40124 res!259392) b!439034))

(assert (= (and b!439034 res!259389) b!439027))

(assert (= (and b!439027 res!259386) b!439035))

(assert (= (and b!439035 res!259398) b!439041))

(assert (= (and b!439041 res!259390) b!439032))

(assert (= (and b!439032 res!259391) b!439036))

(assert (= (and b!439036 res!259393) b!439033))

(assert (= (and b!439033 res!259394) b!439029))

(assert (= (and b!439029 res!259388) b!439037))

(assert (= (and b!439037 res!259396) b!439038))

(assert (= (and b!439038 res!259387) b!439031))

(assert (= (and b!439031 res!259397) b!439042))

(assert (= (and b!439042 res!259395) b!439039))

(assert (= (and b!439028 condMapEmpty!18957) mapIsEmpty!18957))

(assert (= (and b!439028 (not condMapEmpty!18957)) mapNonEmpty!18957))

(get-info :version)

(assert (= (and mapNonEmpty!18957 ((_ is ValueCellFull!5435) mapValue!18957)) b!439040))

(assert (= (and b!439028 ((_ is ValueCellFull!5435) mapDefault!18957)) b!439030))

(assert (= start!40124 b!439028))

(declare-fun m!426623 () Bool)

(assert (=> b!439038 m!426623))

(declare-fun m!426625 () Bool)

(assert (=> b!439033 m!426625))

(declare-fun m!426627 () Bool)

(assert (=> b!439042 m!426627))

(declare-fun m!426629 () Bool)

(assert (=> b!439042 m!426629))

(declare-fun m!426631 () Bool)

(assert (=> b!439042 m!426631))

(declare-fun m!426633 () Bool)

(assert (=> b!439039 m!426633))

(declare-fun m!426635 () Bool)

(assert (=> b!439039 m!426635))

(assert (=> b!439039 m!426635))

(declare-fun m!426637 () Bool)

(assert (=> b!439039 m!426637))

(declare-fun m!426639 () Bool)

(assert (=> b!439039 m!426639))

(declare-fun m!426641 () Bool)

(assert (=> b!439029 m!426641))

(declare-fun m!426643 () Bool)

(assert (=> mapNonEmpty!18957 m!426643))

(declare-fun m!426645 () Bool)

(assert (=> start!40124 m!426645))

(declare-fun m!426647 () Bool)

(assert (=> start!40124 m!426647))

(declare-fun m!426649 () Bool)

(assert (=> b!439034 m!426649))

(declare-fun m!426651 () Bool)

(assert (=> b!439037 m!426651))

(declare-fun m!426653 () Bool)

(assert (=> b!439037 m!426653))

(declare-fun m!426655 () Bool)

(assert (=> b!439041 m!426655))

(declare-fun m!426657 () Bool)

(assert (=> b!439036 m!426657))

(declare-fun m!426659 () Bool)

(assert (=> b!439035 m!426659))

(check-sat (not mapNonEmpty!18957) (not b!439035) b_and!18387 (not b!439029) (not b!439034) (not b!439037) (not b!439038) (not b!439041) (not b!439039) (not b!439042) tp_is_empty!11557 (not b_next!10405) (not b!439036) (not start!40124))
(check-sat b_and!18387 (not b_next!10405))
