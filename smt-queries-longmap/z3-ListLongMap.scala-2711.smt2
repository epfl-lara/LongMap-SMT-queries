; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40086 () Bool)

(assert start!40086)

(declare-fun b_free!10353 () Bool)

(declare-fun b_next!10353 () Bool)

(assert (=> start!40086 (= b_free!10353 (not b_next!10353))))

(declare-fun tp!36588 () Bool)

(declare-fun b_and!18321 () Bool)

(assert (=> start!40086 (= tp!36588 b_and!18321)))

(declare-fun b!437828 () Bool)

(declare-fun e!258349 () Bool)

(assert (=> b!437828 (= e!258349 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16445 0))(
  ( (V!16446 (val!5797 Int)) )
))
(declare-datatypes ((ValueCell!5409 0))(
  ( (ValueCellFull!5409 (v!8044 V!16445)) (EmptyCell!5409) )
))
(declare-datatypes ((array!26827 0))(
  ( (array!26828 (arr!12863 (Array (_ BitVec 32) ValueCell!5409)) (size!13215 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26827)

(declare-fun zeroValue!515 () V!16445)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16445)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26829 0))(
  ( (array!26830 (arr!12864 (Array (_ BitVec 32) (_ BitVec 64))) (size!13216 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26829)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!201766 () array!26827)

(declare-fun lt!201770 () array!26829)

(declare-fun minValue!515 () V!16445)

(declare-datatypes ((tuple2!7680 0))(
  ( (tuple2!7681 (_1!3851 (_ BitVec 64)) (_2!3851 V!16445)) )
))
(declare-datatypes ((List!7680 0))(
  ( (Nil!7677) (Cons!7676 (h!8532 tuple2!7680) (t!13436 List!7680)) )
))
(declare-datatypes ((ListLongMap!6593 0))(
  ( (ListLongMap!6594 (toList!3312 List!7680)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1501 (array!26829 array!26827 (_ BitVec 32) (_ BitVec 32) V!16445 V!16445 (_ BitVec 32) Int) ListLongMap!6593)

(declare-fun +!1456 (ListLongMap!6593 tuple2!7680) ListLongMap!6593)

(assert (=> b!437828 (= (getCurrentListMapNoExtraKeys!1501 lt!201770 lt!201766 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1456 (getCurrentListMapNoExtraKeys!1501 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7681 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13016 0))(
  ( (Unit!13017) )
))
(declare-fun lt!201767 () Unit!13016)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!625 (array!26829 array!26827 (_ BitVec 32) (_ BitVec 32) V!16445 V!16445 (_ BitVec 32) (_ BitVec 64) V!16445 (_ BitVec 32) Int) Unit!13016)

(assert (=> b!437828 (= lt!201767 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!625 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18879 () Bool)

(declare-fun mapRes!18879 () Bool)

(declare-fun tp!36587 () Bool)

(declare-fun e!258353 () Bool)

(assert (=> mapNonEmpty!18879 (= mapRes!18879 (and tp!36587 e!258353))))

(declare-fun mapKey!18879 () (_ BitVec 32))

(declare-fun mapRest!18879 () (Array (_ BitVec 32) ValueCell!5409))

(declare-fun mapValue!18879 () ValueCell!5409)

(assert (=> mapNonEmpty!18879 (= (arr!12863 _values!549) (store mapRest!18879 mapKey!18879 mapValue!18879))))

(declare-fun b!437829 () Bool)

(declare-fun res!258387 () Bool)

(declare-fun e!258348 () Bool)

(assert (=> b!437829 (=> (not res!258387) (not e!258348))))

(assert (=> b!437829 (= res!258387 (and (= (size!13215 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13216 _keys!709) (size!13215 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437830 () Bool)

(declare-fun res!258379 () Bool)

(assert (=> b!437830 (=> (not res!258379) (not e!258348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26829 (_ BitVec 32)) Bool)

(assert (=> b!437830 (= res!258379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437831 () Bool)

(declare-fun res!258376 () Bool)

(assert (=> b!437831 (=> (not res!258376) (not e!258348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437831 (= res!258376 (validKeyInArray!0 k0!794))))

(declare-fun b!437832 () Bool)

(declare-fun res!258377 () Bool)

(assert (=> b!437832 (=> (not res!258377) (not e!258348))))

(declare-datatypes ((List!7681 0))(
  ( (Nil!7678) (Cons!7677 (h!8533 (_ BitVec 64)) (t!13437 List!7681)) )
))
(declare-fun arrayNoDuplicates!0 (array!26829 (_ BitVec 32) List!7681) Bool)

(assert (=> b!437832 (= res!258377 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7678))))

(declare-fun b!437833 () Bool)

(declare-fun e!258354 () Bool)

(declare-fun tp_is_empty!11505 () Bool)

(assert (=> b!437833 (= e!258354 tp_is_empty!11505)))

(declare-fun b!437834 () Bool)

(declare-fun res!258386 () Bool)

(assert (=> b!437834 (=> (not res!258386) (not e!258348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437834 (= res!258386 (validMask!0 mask!1025))))

(declare-fun b!437836 () Bool)

(declare-fun res!258384 () Bool)

(assert (=> b!437836 (=> (not res!258384) (not e!258348))))

(declare-fun arrayContainsKey!0 (array!26829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437836 (= res!258384 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437837 () Bool)

(declare-fun e!258352 () Bool)

(assert (=> b!437837 (= e!258352 e!258349)))

(declare-fun res!258375 () Bool)

(assert (=> b!437837 (=> (not res!258375) (not e!258349))))

(assert (=> b!437837 (= res!258375 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201768 () ListLongMap!6593)

(assert (=> b!437837 (= lt!201768 (getCurrentListMapNoExtraKeys!1501 lt!201770 lt!201766 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437837 (= lt!201766 (array!26828 (store (arr!12863 _values!549) i!563 (ValueCellFull!5409 v!412)) (size!13215 _values!549)))))

(declare-fun lt!201769 () ListLongMap!6593)

(assert (=> b!437837 (= lt!201769 (getCurrentListMapNoExtraKeys!1501 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18879 () Bool)

(assert (=> mapIsEmpty!18879 mapRes!18879))

(declare-fun b!437838 () Bool)

(declare-fun res!258380 () Bool)

(assert (=> b!437838 (=> (not res!258380) (not e!258352))))

(assert (=> b!437838 (= res!258380 (arrayNoDuplicates!0 lt!201770 #b00000000000000000000000000000000 Nil!7678))))

(declare-fun b!437839 () Bool)

(assert (=> b!437839 (= e!258353 tp_is_empty!11505)))

(declare-fun b!437835 () Bool)

(declare-fun res!258385 () Bool)

(assert (=> b!437835 (=> (not res!258385) (not e!258348))))

(assert (=> b!437835 (= res!258385 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13216 _keys!709))))))

(declare-fun res!258383 () Bool)

(assert (=> start!40086 (=> (not res!258383) (not e!258348))))

(assert (=> start!40086 (= res!258383 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13216 _keys!709))))))

(assert (=> start!40086 e!258348))

(assert (=> start!40086 tp_is_empty!11505))

(assert (=> start!40086 tp!36588))

(assert (=> start!40086 true))

(declare-fun e!258351 () Bool)

(declare-fun array_inv!9342 (array!26827) Bool)

(assert (=> start!40086 (and (array_inv!9342 _values!549) e!258351)))

(declare-fun array_inv!9343 (array!26829) Bool)

(assert (=> start!40086 (array_inv!9343 _keys!709)))

(declare-fun b!437840 () Bool)

(declare-fun res!258378 () Bool)

(assert (=> b!437840 (=> (not res!258378) (not e!258348))))

(assert (=> b!437840 (= res!258378 (or (= (select (arr!12864 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12864 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437841 () Bool)

(declare-fun res!258381 () Bool)

(assert (=> b!437841 (=> (not res!258381) (not e!258352))))

(assert (=> b!437841 (= res!258381 (bvsle from!863 i!563))))

(declare-fun b!437842 () Bool)

(assert (=> b!437842 (= e!258348 e!258352)))

(declare-fun res!258382 () Bool)

(assert (=> b!437842 (=> (not res!258382) (not e!258352))))

(assert (=> b!437842 (= res!258382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201770 mask!1025))))

(assert (=> b!437842 (= lt!201770 (array!26830 (store (arr!12864 _keys!709) i!563 k0!794) (size!13216 _keys!709)))))

(declare-fun b!437843 () Bool)

(assert (=> b!437843 (= e!258351 (and e!258354 mapRes!18879))))

(declare-fun condMapEmpty!18879 () Bool)

(declare-fun mapDefault!18879 () ValueCell!5409)

(assert (=> b!437843 (= condMapEmpty!18879 (= (arr!12863 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5409)) mapDefault!18879)))))

(assert (= (and start!40086 res!258383) b!437834))

(assert (= (and b!437834 res!258386) b!437829))

(assert (= (and b!437829 res!258387) b!437830))

(assert (= (and b!437830 res!258379) b!437832))

(assert (= (and b!437832 res!258377) b!437835))

(assert (= (and b!437835 res!258385) b!437831))

(assert (= (and b!437831 res!258376) b!437840))

(assert (= (and b!437840 res!258378) b!437836))

(assert (= (and b!437836 res!258384) b!437842))

(assert (= (and b!437842 res!258382) b!437838))

(assert (= (and b!437838 res!258380) b!437841))

(assert (= (and b!437841 res!258381) b!437837))

(assert (= (and b!437837 res!258375) b!437828))

(assert (= (and b!437843 condMapEmpty!18879) mapIsEmpty!18879))

(assert (= (and b!437843 (not condMapEmpty!18879)) mapNonEmpty!18879))

(get-info :version)

(assert (= (and mapNonEmpty!18879 ((_ is ValueCellFull!5409) mapValue!18879)) b!437839))

(assert (= (and b!437843 ((_ is ValueCellFull!5409) mapDefault!18879)) b!437833))

(assert (= start!40086 b!437843))

(declare-fun m!425417 () Bool)

(assert (=> b!437830 m!425417))

(declare-fun m!425419 () Bool)

(assert (=> b!437832 m!425419))

(declare-fun m!425421 () Bool)

(assert (=> b!437828 m!425421))

(declare-fun m!425423 () Bool)

(assert (=> b!437828 m!425423))

(assert (=> b!437828 m!425423))

(declare-fun m!425425 () Bool)

(assert (=> b!437828 m!425425))

(declare-fun m!425427 () Bool)

(assert (=> b!437828 m!425427))

(declare-fun m!425429 () Bool)

(assert (=> mapNonEmpty!18879 m!425429))

(declare-fun m!425431 () Bool)

(assert (=> b!437834 m!425431))

(declare-fun m!425433 () Bool)

(assert (=> b!437840 m!425433))

(declare-fun m!425435 () Bool)

(assert (=> b!437837 m!425435))

(declare-fun m!425437 () Bool)

(assert (=> b!437837 m!425437))

(declare-fun m!425439 () Bool)

(assert (=> b!437837 m!425439))

(declare-fun m!425441 () Bool)

(assert (=> b!437836 m!425441))

(declare-fun m!425443 () Bool)

(assert (=> b!437842 m!425443))

(declare-fun m!425445 () Bool)

(assert (=> b!437842 m!425445))

(declare-fun m!425447 () Bool)

(assert (=> start!40086 m!425447))

(declare-fun m!425449 () Bool)

(assert (=> start!40086 m!425449))

(declare-fun m!425451 () Bool)

(assert (=> b!437831 m!425451))

(declare-fun m!425453 () Bool)

(assert (=> b!437838 m!425453))

(check-sat (not b!437828) (not b!437830) (not b_next!10353) (not b!437837) (not b!437842) (not mapNonEmpty!18879) (not start!40086) b_and!18321 (not b!437836) (not b!437831) (not b!437838) tp_is_empty!11505 (not b!437832) (not b!437834))
(check-sat b_and!18321 (not b_next!10353))
