; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40092 () Bool)

(assert start!40092)

(declare-fun b_free!10359 () Bool)

(declare-fun b_next!10359 () Bool)

(assert (=> start!40092 (= b_free!10359 (not b_next!10359))))

(declare-fun tp!36606 () Bool)

(declare-fun b_and!18327 () Bool)

(assert (=> start!40092 (= tp!36606 b_and!18327)))

(declare-fun b!437972 () Bool)

(declare-fun e!258413 () Bool)

(declare-fun e!258411 () Bool)

(assert (=> b!437972 (= e!258413 e!258411)))

(declare-fun res!258498 () Bool)

(assert (=> b!437972 (=> (not res!258498) (not e!258411))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437972 (= res!258498 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16453 0))(
  ( (V!16454 (val!5800 Int)) )
))
(declare-fun minValue!515 () V!16453)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7686 0))(
  ( (tuple2!7687 (_1!3854 (_ BitVec 64)) (_2!3854 V!16453)) )
))
(declare-datatypes ((List!7686 0))(
  ( (Nil!7683) (Cons!7682 (h!8538 tuple2!7686) (t!13442 List!7686)) )
))
(declare-datatypes ((ListLongMap!6599 0))(
  ( (ListLongMap!6600 (toList!3315 List!7686)) )
))
(declare-fun lt!201812 () ListLongMap!6599)

(declare-datatypes ((ValueCell!5412 0))(
  ( (ValueCellFull!5412 (v!8047 V!16453)) (EmptyCell!5412) )
))
(declare-datatypes ((array!26839 0))(
  ( (array!26840 (arr!12869 (Array (_ BitVec 32) ValueCell!5412)) (size!13221 (_ BitVec 32))) )
))
(declare-fun lt!201815 () array!26839)

(declare-fun zeroValue!515 () V!16453)

(declare-datatypes ((array!26841 0))(
  ( (array!26842 (arr!12870 (Array (_ BitVec 32) (_ BitVec 64))) (size!13222 (_ BitVec 32))) )
))
(declare-fun lt!201814 () array!26841)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1504 (array!26841 array!26839 (_ BitVec 32) (_ BitVec 32) V!16453 V!16453 (_ BitVec 32) Int) ListLongMap!6599)

(assert (=> b!437972 (= lt!201812 (getCurrentListMapNoExtraKeys!1504 lt!201814 lt!201815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26839)

(declare-fun v!412 () V!16453)

(assert (=> b!437972 (= lt!201815 (array!26840 (store (arr!12869 _values!549) i!563 (ValueCellFull!5412 v!412)) (size!13221 _values!549)))))

(declare-fun lt!201813 () ListLongMap!6599)

(declare-fun _keys!709 () array!26841)

(assert (=> b!437972 (= lt!201813 (getCurrentListMapNoExtraKeys!1504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437973 () Bool)

(declare-fun e!258417 () Bool)

(declare-fun tp_is_empty!11511 () Bool)

(assert (=> b!437973 (= e!258417 tp_is_empty!11511)))

(declare-fun b!437974 () Bool)

(declare-fun e!258416 () Bool)

(assert (=> b!437974 (= e!258416 tp_is_empty!11511)))

(declare-fun b!437976 () Bool)

(declare-fun res!258492 () Bool)

(declare-fun e!258415 () Bool)

(assert (=> b!437976 (=> (not res!258492) (not e!258415))))

(assert (=> b!437976 (= res!258492 (or (= (select (arr!12870 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12870 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437977 () Bool)

(assert (=> b!437977 (= e!258411 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1459 (ListLongMap!6599 tuple2!7686) ListLongMap!6599)

(assert (=> b!437977 (= (getCurrentListMapNoExtraKeys!1504 lt!201814 lt!201815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1459 (getCurrentListMapNoExtraKeys!1504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7687 k0!794 v!412)))))

(declare-datatypes ((Unit!13022 0))(
  ( (Unit!13023) )
))
(declare-fun lt!201811 () Unit!13022)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!628 (array!26841 array!26839 (_ BitVec 32) (_ BitVec 32) V!16453 V!16453 (_ BitVec 32) (_ BitVec 64) V!16453 (_ BitVec 32) Int) Unit!13022)

(assert (=> b!437977 (= lt!201811 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!628 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18888 () Bool)

(declare-fun mapRes!18888 () Bool)

(declare-fun tp!36605 () Bool)

(assert (=> mapNonEmpty!18888 (= mapRes!18888 (and tp!36605 e!258417))))

(declare-fun mapRest!18888 () (Array (_ BitVec 32) ValueCell!5412))

(declare-fun mapValue!18888 () ValueCell!5412)

(declare-fun mapKey!18888 () (_ BitVec 32))

(assert (=> mapNonEmpty!18888 (= (arr!12869 _values!549) (store mapRest!18888 mapKey!18888 mapValue!18888))))

(declare-fun b!437978 () Bool)

(declare-fun res!258502 () Bool)

(assert (=> b!437978 (=> (not res!258502) (not e!258415))))

(declare-fun arrayContainsKey!0 (array!26841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437978 (= res!258502 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437979 () Bool)

(declare-fun res!258503 () Bool)

(assert (=> b!437979 (=> (not res!258503) (not e!258415))))

(assert (=> b!437979 (= res!258503 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13222 _keys!709))))))

(declare-fun b!437980 () Bool)

(declare-fun res!258494 () Bool)

(assert (=> b!437980 (=> (not res!258494) (not e!258413))))

(assert (=> b!437980 (= res!258494 (bvsle from!863 i!563))))

(declare-fun b!437981 () Bool)

(declare-fun res!258496 () Bool)

(assert (=> b!437981 (=> (not res!258496) (not e!258415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26841 (_ BitVec 32)) Bool)

(assert (=> b!437981 (= res!258496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18888 () Bool)

(assert (=> mapIsEmpty!18888 mapRes!18888))

(declare-fun b!437982 () Bool)

(declare-fun res!258499 () Bool)

(assert (=> b!437982 (=> (not res!258499) (not e!258415))))

(assert (=> b!437982 (= res!258499 (and (= (size!13221 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13222 _keys!709) (size!13221 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437983 () Bool)

(declare-fun res!258504 () Bool)

(assert (=> b!437983 (=> (not res!258504) (not e!258413))))

(declare-datatypes ((List!7687 0))(
  ( (Nil!7684) (Cons!7683 (h!8539 (_ BitVec 64)) (t!13443 List!7687)) )
))
(declare-fun arrayNoDuplicates!0 (array!26841 (_ BitVec 32) List!7687) Bool)

(assert (=> b!437983 (= res!258504 (arrayNoDuplicates!0 lt!201814 #b00000000000000000000000000000000 Nil!7684))))

(declare-fun res!258497 () Bool)

(assert (=> start!40092 (=> (not res!258497) (not e!258415))))

(assert (=> start!40092 (= res!258497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13222 _keys!709))))))

(assert (=> start!40092 e!258415))

(assert (=> start!40092 tp_is_empty!11511))

(assert (=> start!40092 tp!36606))

(assert (=> start!40092 true))

(declare-fun e!258412 () Bool)

(declare-fun array_inv!9348 (array!26839) Bool)

(assert (=> start!40092 (and (array_inv!9348 _values!549) e!258412)))

(declare-fun array_inv!9349 (array!26841) Bool)

(assert (=> start!40092 (array_inv!9349 _keys!709)))

(declare-fun b!437975 () Bool)

(declare-fun res!258500 () Bool)

(assert (=> b!437975 (=> (not res!258500) (not e!258415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437975 (= res!258500 (validKeyInArray!0 k0!794))))

(declare-fun b!437984 () Bool)

(declare-fun res!258493 () Bool)

(assert (=> b!437984 (=> (not res!258493) (not e!258415))))

(assert (=> b!437984 (= res!258493 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7684))))

(declare-fun b!437985 () Bool)

(assert (=> b!437985 (= e!258412 (and e!258416 mapRes!18888))))

(declare-fun condMapEmpty!18888 () Bool)

(declare-fun mapDefault!18888 () ValueCell!5412)

(assert (=> b!437985 (= condMapEmpty!18888 (= (arr!12869 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5412)) mapDefault!18888)))))

(declare-fun b!437986 () Bool)

(assert (=> b!437986 (= e!258415 e!258413)))

(declare-fun res!258501 () Bool)

(assert (=> b!437986 (=> (not res!258501) (not e!258413))))

(assert (=> b!437986 (= res!258501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201814 mask!1025))))

(assert (=> b!437986 (= lt!201814 (array!26842 (store (arr!12870 _keys!709) i!563 k0!794) (size!13222 _keys!709)))))

(declare-fun b!437987 () Bool)

(declare-fun res!258495 () Bool)

(assert (=> b!437987 (=> (not res!258495) (not e!258415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437987 (= res!258495 (validMask!0 mask!1025))))

(assert (= (and start!40092 res!258497) b!437987))

(assert (= (and b!437987 res!258495) b!437982))

(assert (= (and b!437982 res!258499) b!437981))

(assert (= (and b!437981 res!258496) b!437984))

(assert (= (and b!437984 res!258493) b!437979))

(assert (= (and b!437979 res!258503) b!437975))

(assert (= (and b!437975 res!258500) b!437976))

(assert (= (and b!437976 res!258492) b!437978))

(assert (= (and b!437978 res!258502) b!437986))

(assert (= (and b!437986 res!258501) b!437983))

(assert (= (and b!437983 res!258504) b!437980))

(assert (= (and b!437980 res!258494) b!437972))

(assert (= (and b!437972 res!258498) b!437977))

(assert (= (and b!437985 condMapEmpty!18888) mapIsEmpty!18888))

(assert (= (and b!437985 (not condMapEmpty!18888)) mapNonEmpty!18888))

(get-info :version)

(assert (= (and mapNonEmpty!18888 ((_ is ValueCellFull!5412) mapValue!18888)) b!437973))

(assert (= (and b!437985 ((_ is ValueCellFull!5412) mapDefault!18888)) b!437974))

(assert (= start!40092 b!437985))

(declare-fun m!425531 () Bool)

(assert (=> b!437984 m!425531))

(declare-fun m!425533 () Bool)

(assert (=> b!437987 m!425533))

(declare-fun m!425535 () Bool)

(assert (=> b!437976 m!425535))

(declare-fun m!425537 () Bool)

(assert (=> mapNonEmpty!18888 m!425537))

(declare-fun m!425539 () Bool)

(assert (=> b!437977 m!425539))

(declare-fun m!425541 () Bool)

(assert (=> b!437977 m!425541))

(assert (=> b!437977 m!425541))

(declare-fun m!425543 () Bool)

(assert (=> b!437977 m!425543))

(declare-fun m!425545 () Bool)

(assert (=> b!437977 m!425545))

(declare-fun m!425547 () Bool)

(assert (=> b!437981 m!425547))

(declare-fun m!425549 () Bool)

(assert (=> b!437975 m!425549))

(declare-fun m!425551 () Bool)

(assert (=> b!437972 m!425551))

(declare-fun m!425553 () Bool)

(assert (=> b!437972 m!425553))

(declare-fun m!425555 () Bool)

(assert (=> b!437972 m!425555))

(declare-fun m!425557 () Bool)

(assert (=> b!437983 m!425557))

(declare-fun m!425559 () Bool)

(assert (=> b!437978 m!425559))

(declare-fun m!425561 () Bool)

(assert (=> b!437986 m!425561))

(declare-fun m!425563 () Bool)

(assert (=> b!437986 m!425563))

(declare-fun m!425565 () Bool)

(assert (=> start!40092 m!425565))

(declare-fun m!425567 () Bool)

(assert (=> start!40092 m!425567))

(check-sat (not b!437984) (not mapNonEmpty!18888) (not b!437975) (not b!437981) (not b!437986) (not b_next!10359) b_and!18327 (not b!437977) (not b!437972) (not start!40092) tp_is_empty!11511 (not b!437987) (not b!437983) (not b!437978))
(check-sat b_and!18327 (not b_next!10359))
