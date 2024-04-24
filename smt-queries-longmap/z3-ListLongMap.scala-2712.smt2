; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40076 () Bool)

(assert start!40076)

(declare-fun b_free!10357 () Bool)

(declare-fun b_next!10357 () Bool)

(assert (=> start!40076 (= b_free!10357 (not b_next!10357))))

(declare-fun tp!36599 () Bool)

(declare-fun b_and!18339 () Bool)

(assert (=> start!40076 (= tp!36599 b_and!18339)))

(declare-fun b!437875 () Bool)

(declare-fun e!258358 () Bool)

(declare-fun e!258361 () Bool)

(assert (=> b!437875 (= e!258358 e!258361)))

(declare-fun res!258454 () Bool)

(assert (=> b!437875 (=> (not res!258454) (not e!258361))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437875 (= res!258454 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16451 0))(
  ( (V!16452 (val!5799 Int)) )
))
(declare-fun minValue!515 () V!16451)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7596 0))(
  ( (tuple2!7597 (_1!3809 (_ BitVec 64)) (_2!3809 V!16451)) )
))
(declare-datatypes ((List!7583 0))(
  ( (Nil!7580) (Cons!7579 (h!8435 tuple2!7596) (t!13331 List!7583)) )
))
(declare-datatypes ((ListLongMap!6511 0))(
  ( (ListLongMap!6512 (toList!3271 List!7583)) )
))
(declare-fun lt!201818 () ListLongMap!6511)

(declare-fun zeroValue!515 () V!16451)

(declare-datatypes ((ValueCell!5411 0))(
  ( (ValueCellFull!5411 (v!8047 V!16451)) (EmptyCell!5411) )
))
(declare-datatypes ((array!26842 0))(
  ( (array!26843 (arr!12870 (Array (_ BitVec 32) ValueCell!5411)) (size!13222 (_ BitVec 32))) )
))
(declare-fun lt!201819 () array!26842)

(declare-datatypes ((array!26844 0))(
  ( (array!26845 (arr!12871 (Array (_ BitVec 32) (_ BitVec 64))) (size!13223 (_ BitVec 32))) )
))
(declare-fun lt!201815 () array!26844)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1504 (array!26844 array!26842 (_ BitVec 32) (_ BitVec 32) V!16451 V!16451 (_ BitVec 32) Int) ListLongMap!6511)

(assert (=> b!437875 (= lt!201818 (getCurrentListMapNoExtraKeys!1504 lt!201815 lt!201819 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26842)

(declare-fun v!412 () V!16451)

(assert (=> b!437875 (= lt!201819 (array!26843 (store (arr!12870 _values!549) i!563 (ValueCellFull!5411 v!412)) (size!13222 _values!549)))))

(declare-fun lt!201816 () ListLongMap!6511)

(declare-fun _keys!709 () array!26844)

(assert (=> b!437875 (= lt!201816 (getCurrentListMapNoExtraKeys!1504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437876 () Bool)

(declare-fun res!258456 () Bool)

(declare-fun e!258359 () Bool)

(assert (=> b!437876 (=> (not res!258456) (not e!258359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26844 (_ BitVec 32)) Bool)

(assert (=> b!437876 (= res!258456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437877 () Bool)

(declare-fun res!258458 () Bool)

(assert (=> b!437877 (=> (not res!258458) (not e!258359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437877 (= res!258458 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18885 () Bool)

(declare-fun mapRes!18885 () Bool)

(assert (=> mapIsEmpty!18885 mapRes!18885))

(declare-fun res!258452 () Bool)

(assert (=> start!40076 (=> (not res!258452) (not e!258359))))

(assert (=> start!40076 (= res!258452 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13223 _keys!709))))))

(assert (=> start!40076 e!258359))

(declare-fun tp_is_empty!11509 () Bool)

(assert (=> start!40076 tp_is_empty!11509))

(assert (=> start!40076 tp!36599))

(assert (=> start!40076 true))

(declare-fun e!258360 () Bool)

(declare-fun array_inv!9412 (array!26842) Bool)

(assert (=> start!40076 (and (array_inv!9412 _values!549) e!258360)))

(declare-fun array_inv!9413 (array!26844) Bool)

(assert (=> start!40076 (array_inv!9413 _keys!709)))

(declare-fun b!437878 () Bool)

(declare-fun e!258362 () Bool)

(assert (=> b!437878 (= e!258362 tp_is_empty!11509)))

(declare-fun b!437879 () Bool)

(declare-fun res!258450 () Bool)

(assert (=> b!437879 (=> (not res!258450) (not e!258358))))

(assert (=> b!437879 (= res!258450 (bvsle from!863 i!563))))

(declare-fun b!437880 () Bool)

(declare-fun e!258363 () Bool)

(assert (=> b!437880 (= e!258363 tp_is_empty!11509)))

(declare-fun b!437881 () Bool)

(declare-fun res!258461 () Bool)

(assert (=> b!437881 (=> (not res!258461) (not e!258359))))

(assert (=> b!437881 (= res!258461 (or (= (select (arr!12871 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12871 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437882 () Bool)

(declare-fun res!258459 () Bool)

(assert (=> b!437882 (=> (not res!258459) (not e!258359))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437882 (= res!258459 (validKeyInArray!0 k0!794))))

(declare-fun b!437883 () Bool)

(declare-fun res!258451 () Bool)

(assert (=> b!437883 (=> (not res!258451) (not e!258359))))

(declare-fun arrayContainsKey!0 (array!26844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437883 (= res!258451 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437884 () Bool)

(declare-fun res!258462 () Bool)

(assert (=> b!437884 (=> (not res!258462) (not e!258359))))

(assert (=> b!437884 (= res!258462 (and (= (size!13222 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13223 _keys!709) (size!13222 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437885 () Bool)

(assert (=> b!437885 (= e!258360 (and e!258362 mapRes!18885))))

(declare-fun condMapEmpty!18885 () Bool)

(declare-fun mapDefault!18885 () ValueCell!5411)

(assert (=> b!437885 (= condMapEmpty!18885 (= (arr!12870 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5411)) mapDefault!18885)))))

(declare-fun b!437886 () Bool)

(declare-fun res!258455 () Bool)

(assert (=> b!437886 (=> (not res!258455) (not e!258358))))

(declare-datatypes ((List!7584 0))(
  ( (Nil!7581) (Cons!7580 (h!8436 (_ BitVec 64)) (t!13332 List!7584)) )
))
(declare-fun arrayNoDuplicates!0 (array!26844 (_ BitVec 32) List!7584) Bool)

(assert (=> b!437886 (= res!258455 (arrayNoDuplicates!0 lt!201815 #b00000000000000000000000000000000 Nil!7581))))

(declare-fun b!437887 () Bool)

(declare-fun res!258453 () Bool)

(assert (=> b!437887 (=> (not res!258453) (not e!258359))))

(assert (=> b!437887 (= res!258453 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13223 _keys!709))))))

(declare-fun mapNonEmpty!18885 () Bool)

(declare-fun tp!36600 () Bool)

(assert (=> mapNonEmpty!18885 (= mapRes!18885 (and tp!36600 e!258363))))

(declare-fun mapKey!18885 () (_ BitVec 32))

(declare-fun mapRest!18885 () (Array (_ BitVec 32) ValueCell!5411))

(declare-fun mapValue!18885 () ValueCell!5411)

(assert (=> mapNonEmpty!18885 (= (arr!12870 _values!549) (store mapRest!18885 mapKey!18885 mapValue!18885))))

(declare-fun b!437888 () Bool)

(declare-fun res!258460 () Bool)

(assert (=> b!437888 (=> (not res!258460) (not e!258359))))

(assert (=> b!437888 (= res!258460 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7581))))

(declare-fun b!437889 () Bool)

(assert (=> b!437889 (= e!258361 (not true))))

(declare-fun +!1469 (ListLongMap!6511 tuple2!7596) ListLongMap!6511)

(assert (=> b!437889 (= (getCurrentListMapNoExtraKeys!1504 lt!201815 lt!201819 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1469 (getCurrentListMapNoExtraKeys!1504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7597 k0!794 v!412)))))

(declare-datatypes ((Unit!13013 0))(
  ( (Unit!13014) )
))
(declare-fun lt!201817 () Unit!13013)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!629 (array!26844 array!26842 (_ BitVec 32) (_ BitVec 32) V!16451 V!16451 (_ BitVec 32) (_ BitVec 64) V!16451 (_ BitVec 32) Int) Unit!13013)

(assert (=> b!437889 (= lt!201817 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!629 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437890 () Bool)

(assert (=> b!437890 (= e!258359 e!258358)))

(declare-fun res!258457 () Bool)

(assert (=> b!437890 (=> (not res!258457) (not e!258358))))

(assert (=> b!437890 (= res!258457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201815 mask!1025))))

(assert (=> b!437890 (= lt!201815 (array!26845 (store (arr!12871 _keys!709) i!563 k0!794) (size!13223 _keys!709)))))

(assert (= (and start!40076 res!258452) b!437877))

(assert (= (and b!437877 res!258458) b!437884))

(assert (= (and b!437884 res!258462) b!437876))

(assert (= (and b!437876 res!258456) b!437888))

(assert (= (and b!437888 res!258460) b!437887))

(assert (= (and b!437887 res!258453) b!437882))

(assert (= (and b!437882 res!258459) b!437881))

(assert (= (and b!437881 res!258461) b!437883))

(assert (= (and b!437883 res!258451) b!437890))

(assert (= (and b!437890 res!258457) b!437886))

(assert (= (and b!437886 res!258455) b!437879))

(assert (= (and b!437879 res!258450) b!437875))

(assert (= (and b!437875 res!258454) b!437889))

(assert (= (and b!437885 condMapEmpty!18885) mapIsEmpty!18885))

(assert (= (and b!437885 (not condMapEmpty!18885)) mapNonEmpty!18885))

(get-info :version)

(assert (= (and mapNonEmpty!18885 ((_ is ValueCellFull!5411) mapValue!18885)) b!437880))

(assert (= (and b!437885 ((_ is ValueCellFull!5411) mapDefault!18885)) b!437878))

(assert (= start!40076 b!437885))

(declare-fun m!425711 () Bool)

(assert (=> b!437876 m!425711))

(declare-fun m!425713 () Bool)

(assert (=> b!437881 m!425713))

(declare-fun m!425715 () Bool)

(assert (=> b!437882 m!425715))

(declare-fun m!425717 () Bool)

(assert (=> b!437886 m!425717))

(declare-fun m!425719 () Bool)

(assert (=> b!437888 m!425719))

(declare-fun m!425721 () Bool)

(assert (=> b!437889 m!425721))

(declare-fun m!425723 () Bool)

(assert (=> b!437889 m!425723))

(assert (=> b!437889 m!425723))

(declare-fun m!425725 () Bool)

(assert (=> b!437889 m!425725))

(declare-fun m!425727 () Bool)

(assert (=> b!437889 m!425727))

(declare-fun m!425729 () Bool)

(assert (=> b!437883 m!425729))

(declare-fun m!425731 () Bool)

(assert (=> mapNonEmpty!18885 m!425731))

(declare-fun m!425733 () Bool)

(assert (=> b!437890 m!425733))

(declare-fun m!425735 () Bool)

(assert (=> b!437890 m!425735))

(declare-fun m!425737 () Bool)

(assert (=> b!437875 m!425737))

(declare-fun m!425739 () Bool)

(assert (=> b!437875 m!425739))

(declare-fun m!425741 () Bool)

(assert (=> b!437875 m!425741))

(declare-fun m!425743 () Bool)

(assert (=> start!40076 m!425743))

(declare-fun m!425745 () Bool)

(assert (=> start!40076 m!425745))

(declare-fun m!425747 () Bool)

(assert (=> b!437877 m!425747))

(check-sat (not mapNonEmpty!18885) (not b_next!10357) (not b!437875) (not b!437882) (not b!437886) tp_is_empty!11509 (not start!40076) (not b!437876) (not b!437883) b_and!18339 (not b!437889) (not b!437890) (not b!437888) (not b!437877))
(check-sat b_and!18339 (not b_next!10357))
