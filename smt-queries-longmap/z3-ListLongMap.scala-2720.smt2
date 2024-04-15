; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40124 () Bool)

(assert start!40124)

(declare-fun b_free!10405 () Bool)

(declare-fun b_next!10405 () Bool)

(assert (=> start!40124 (= b_free!10405 (not b_next!10405))))

(declare-fun tp!36744 () Bool)

(declare-fun b_and!18347 () Bool)

(assert (=> start!40124 (= tp!36744 b_and!18347)))

(declare-fun b!438805 () Bool)

(declare-fun res!259266 () Bool)

(declare-fun e!258720 () Bool)

(assert (=> b!438805 (=> (not res!259266) (not e!258720))))

(declare-datatypes ((array!26933 0))(
  ( (array!26934 (arr!12916 (Array (_ BitVec 32) (_ BitVec 64))) (size!13269 (_ BitVec 32))) )
))
(declare-fun lt!201926 () array!26933)

(declare-datatypes ((List!7736 0))(
  ( (Nil!7733) (Cons!7732 (h!8588 (_ BitVec 64)) (t!13483 List!7736)) )
))
(declare-fun arrayNoDuplicates!0 (array!26933 (_ BitVec 32) List!7736) Bool)

(assert (=> b!438805 (= res!259266 (arrayNoDuplicates!0 lt!201926 #b00000000000000000000000000000000 Nil!7733))))

(declare-fun b!438806 () Bool)

(declare-fun res!259267 () Bool)

(declare-fun e!258726 () Bool)

(assert (=> b!438806 (=> (not res!259267) (not e!258726))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438806 (= res!259267 (validMask!0 mask!1025))))

(declare-fun b!438807 () Bool)

(declare-fun res!259269 () Bool)

(assert (=> b!438807 (=> (not res!259269) (not e!258726))))

(declare-fun _keys!709 () array!26933)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26933 (_ BitVec 32)) Bool)

(assert (=> b!438807 (= res!259269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438808 () Bool)

(declare-fun res!259261 () Bool)

(assert (=> b!438808 (=> (not res!259261) (not e!258726))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16515 0))(
  ( (V!16516 (val!5823 Int)) )
))
(declare-datatypes ((ValueCell!5435 0))(
  ( (ValueCellFull!5435 (v!8064 V!16515)) (EmptyCell!5435) )
))
(declare-datatypes ((array!26935 0))(
  ( (array!26936 (arr!12917 (Array (_ BitVec 32) ValueCell!5435)) (size!13270 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26935)

(assert (=> b!438808 (= res!259261 (and (= (size!13270 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13269 _keys!709) (size!13270 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438809 () Bool)

(declare-fun e!258725 () Bool)

(declare-fun tp_is_empty!11557 () Bool)

(assert (=> b!438809 (= e!258725 tp_is_empty!11557)))

(declare-fun b!438810 () Bool)

(declare-fun res!259263 () Bool)

(assert (=> b!438810 (=> (not res!259263) (not e!258726))))

(assert (=> b!438810 (= res!259263 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7733))))

(declare-fun b!438811 () Bool)

(declare-fun e!258722 () Bool)

(assert (=> b!438811 (= e!258720 e!258722)))

(declare-fun res!259260 () Bool)

(assert (=> b!438811 (=> (not res!259260) (not e!258722))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438811 (= res!259260 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16515)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7748 0))(
  ( (tuple2!7749 (_1!3885 (_ BitVec 64)) (_2!3885 V!16515)) )
))
(declare-datatypes ((List!7737 0))(
  ( (Nil!7734) (Cons!7733 (h!8589 tuple2!7748) (t!13484 List!7737)) )
))
(declare-datatypes ((ListLongMap!6651 0))(
  ( (ListLongMap!6652 (toList!3341 List!7737)) )
))
(declare-fun lt!201924 () ListLongMap!6651)

(declare-fun zeroValue!515 () V!16515)

(declare-fun lt!201923 () array!26935)

(declare-fun getCurrentListMapNoExtraKeys!1540 (array!26933 array!26935 (_ BitVec 32) (_ BitVec 32) V!16515 V!16515 (_ BitVec 32) Int) ListLongMap!6651)

(assert (=> b!438811 (= lt!201924 (getCurrentListMapNoExtraKeys!1540 lt!201926 lt!201923 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16515)

(assert (=> b!438811 (= lt!201923 (array!26936 (store (arr!12917 _values!549) i!563 (ValueCellFull!5435 v!412)) (size!13270 _values!549)))))

(declare-fun lt!201925 () ListLongMap!6651)

(assert (=> b!438811 (= lt!201925 (getCurrentListMapNoExtraKeys!1540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18957 () Bool)

(declare-fun mapRes!18957 () Bool)

(assert (=> mapIsEmpty!18957 mapRes!18957))

(declare-fun b!438813 () Bool)

(declare-fun res!259271 () Bool)

(assert (=> b!438813 (=> (not res!259271) (not e!258726))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438813 (= res!259271 (validKeyInArray!0 k0!794))))

(declare-fun b!438814 () Bool)

(declare-fun res!259268 () Bool)

(assert (=> b!438814 (=> (not res!259268) (not e!258726))))

(declare-fun arrayContainsKey!0 (array!26933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438814 (= res!259268 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438815 () Bool)

(assert (=> b!438815 (= e!258722 (not true))))

(declare-fun +!1506 (ListLongMap!6651 tuple2!7748) ListLongMap!6651)

(assert (=> b!438815 (= (getCurrentListMapNoExtraKeys!1540 lt!201926 lt!201923 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1506 (getCurrentListMapNoExtraKeys!1540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7749 k0!794 v!412)))))

(declare-datatypes ((Unit!13029 0))(
  ( (Unit!13030) )
))
(declare-fun lt!201922 () Unit!13029)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!644 (array!26933 array!26935 (_ BitVec 32) (_ BitVec 32) V!16515 V!16515 (_ BitVec 32) (_ BitVec 64) V!16515 (_ BitVec 32) Int) Unit!13029)

(assert (=> b!438815 (= lt!201922 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!644 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438816 () Bool)

(declare-fun e!258724 () Bool)

(assert (=> b!438816 (= e!258724 (and e!258725 mapRes!18957))))

(declare-fun condMapEmpty!18957 () Bool)

(declare-fun mapDefault!18957 () ValueCell!5435)

(assert (=> b!438816 (= condMapEmpty!18957 (= (arr!12917 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5435)) mapDefault!18957)))))

(declare-fun b!438817 () Bool)

(assert (=> b!438817 (= e!258726 e!258720)))

(declare-fun res!259264 () Bool)

(assert (=> b!438817 (=> (not res!259264) (not e!258720))))

(assert (=> b!438817 (= res!259264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201926 mask!1025))))

(assert (=> b!438817 (= lt!201926 (array!26934 (store (arr!12916 _keys!709) i!563 k0!794) (size!13269 _keys!709)))))

(declare-fun mapNonEmpty!18957 () Bool)

(declare-fun tp!36743 () Bool)

(declare-fun e!258721 () Bool)

(assert (=> mapNonEmpty!18957 (= mapRes!18957 (and tp!36743 e!258721))))

(declare-fun mapKey!18957 () (_ BitVec 32))

(declare-fun mapRest!18957 () (Array (_ BitVec 32) ValueCell!5435))

(declare-fun mapValue!18957 () ValueCell!5435)

(assert (=> mapNonEmpty!18957 (= (arr!12917 _values!549) (store mapRest!18957 mapKey!18957 mapValue!18957))))

(declare-fun b!438818 () Bool)

(declare-fun res!259262 () Bool)

(assert (=> b!438818 (=> (not res!259262) (not e!258726))))

(assert (=> b!438818 (= res!259262 (or (= (select (arr!12916 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12916 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438812 () Bool)

(declare-fun res!259265 () Bool)

(assert (=> b!438812 (=> (not res!259265) (not e!258726))))

(assert (=> b!438812 (= res!259265 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13269 _keys!709))))))

(declare-fun res!259270 () Bool)

(assert (=> start!40124 (=> (not res!259270) (not e!258726))))

(assert (=> start!40124 (= res!259270 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13269 _keys!709))))))

(assert (=> start!40124 e!258726))

(assert (=> start!40124 tp_is_empty!11557))

(assert (=> start!40124 tp!36744))

(assert (=> start!40124 true))

(declare-fun array_inv!9424 (array!26935) Bool)

(assert (=> start!40124 (and (array_inv!9424 _values!549) e!258724)))

(declare-fun array_inv!9425 (array!26933) Bool)

(assert (=> start!40124 (array_inv!9425 _keys!709)))

(declare-fun b!438819 () Bool)

(assert (=> b!438819 (= e!258721 tp_is_empty!11557)))

(declare-fun b!438820 () Bool)

(declare-fun res!259272 () Bool)

(assert (=> b!438820 (=> (not res!259272) (not e!258720))))

(assert (=> b!438820 (= res!259272 (bvsle from!863 i!563))))

(assert (= (and start!40124 res!259270) b!438806))

(assert (= (and b!438806 res!259267) b!438808))

(assert (= (and b!438808 res!259261) b!438807))

(assert (= (and b!438807 res!259269) b!438810))

(assert (= (and b!438810 res!259263) b!438812))

(assert (= (and b!438812 res!259265) b!438813))

(assert (= (and b!438813 res!259271) b!438818))

(assert (= (and b!438818 res!259262) b!438814))

(assert (= (and b!438814 res!259268) b!438817))

(assert (= (and b!438817 res!259264) b!438805))

(assert (= (and b!438805 res!259266) b!438820))

(assert (= (and b!438820 res!259272) b!438811))

(assert (= (and b!438811 res!259260) b!438815))

(assert (= (and b!438816 condMapEmpty!18957) mapIsEmpty!18957))

(assert (= (and b!438816 (not condMapEmpty!18957)) mapNonEmpty!18957))

(get-info :version)

(assert (= (and mapNonEmpty!18957 ((_ is ValueCellFull!5435) mapValue!18957)) b!438819))

(assert (= (and b!438816 ((_ is ValueCellFull!5435) mapDefault!18957)) b!438809))

(assert (= start!40124 b!438816))

(declare-fun m!425673 () Bool)

(assert (=> mapNonEmpty!18957 m!425673))

(declare-fun m!425675 () Bool)

(assert (=> b!438818 m!425675))

(declare-fun m!425677 () Bool)

(assert (=> b!438811 m!425677))

(declare-fun m!425679 () Bool)

(assert (=> b!438811 m!425679))

(declare-fun m!425681 () Bool)

(assert (=> b!438811 m!425681))

(declare-fun m!425683 () Bool)

(assert (=> b!438807 m!425683))

(declare-fun m!425685 () Bool)

(assert (=> b!438815 m!425685))

(declare-fun m!425687 () Bool)

(assert (=> b!438815 m!425687))

(assert (=> b!438815 m!425687))

(declare-fun m!425689 () Bool)

(assert (=> b!438815 m!425689))

(declare-fun m!425691 () Bool)

(assert (=> b!438815 m!425691))

(declare-fun m!425693 () Bool)

(assert (=> b!438810 m!425693))

(declare-fun m!425695 () Bool)

(assert (=> b!438814 m!425695))

(declare-fun m!425697 () Bool)

(assert (=> b!438817 m!425697))

(declare-fun m!425699 () Bool)

(assert (=> b!438817 m!425699))

(declare-fun m!425701 () Bool)

(assert (=> b!438805 m!425701))

(declare-fun m!425703 () Bool)

(assert (=> b!438813 m!425703))

(declare-fun m!425705 () Bool)

(assert (=> start!40124 m!425705))

(declare-fun m!425707 () Bool)

(assert (=> start!40124 m!425707))

(declare-fun m!425709 () Bool)

(assert (=> b!438806 m!425709))

(check-sat tp_is_empty!11557 (not b!438805) (not b!438817) (not b!438810) (not b!438811) (not b!438813) b_and!18347 (not start!40124) (not mapNonEmpty!18957) (not b!438806) (not b!438814) (not b!438815) (not b!438807) (not b_next!10405))
(check-sat b_and!18347 (not b_next!10405))
