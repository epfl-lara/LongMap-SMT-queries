; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40056 () Bool)

(assert start!40056)

(declare-fun b_free!10323 () Bool)

(declare-fun b_next!10323 () Bool)

(assert (=> start!40056 (= b_free!10323 (not b_next!10323))))

(declare-fun tp!36497 () Bool)

(declare-fun b_and!18291 () Bool)

(assert (=> start!40056 (= tp!36497 b_and!18291)))

(declare-fun b!437108 () Bool)

(declare-fun res!257796 () Bool)

(declare-fun e!258039 () Bool)

(assert (=> b!437108 (=> (not res!257796) (not e!258039))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26773 0))(
  ( (array!26774 (arr!12836 (Array (_ BitVec 32) (_ BitVec 64))) (size!13188 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26773)

(assert (=> b!437108 (= res!257796 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13188 _keys!709))))))

(declare-fun b!437109 () Bool)

(declare-fun e!258033 () Bool)

(assert (=> b!437109 (= e!258033 (not true))))

(declare-datatypes ((V!16405 0))(
  ( (V!16406 (val!5782 Int)) )
))
(declare-fun minValue!515 () V!16405)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5394 0))(
  ( (ValueCellFull!5394 (v!8029 V!16405)) (EmptyCell!5394) )
))
(declare-datatypes ((array!26775 0))(
  ( (array!26776 (arr!12837 (Array (_ BitVec 32) ValueCell!5394)) (size!13189 (_ BitVec 32))) )
))
(declare-fun lt!201542 () array!26775)

(declare-fun _values!549 () array!26775)

(declare-fun zeroValue!515 () V!16405)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16405)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!201541 () array!26773)

(declare-datatypes ((tuple2!7664 0))(
  ( (tuple2!7665 (_1!3843 (_ BitVec 64)) (_2!3843 V!16405)) )
))
(declare-datatypes ((List!7662 0))(
  ( (Nil!7659) (Cons!7658 (h!8514 tuple2!7664) (t!13418 List!7662)) )
))
(declare-datatypes ((ListLongMap!6577 0))(
  ( (ListLongMap!6578 (toList!3304 List!7662)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1493 (array!26773 array!26775 (_ BitVec 32) (_ BitVec 32) V!16405 V!16405 (_ BitVec 32) Int) ListLongMap!6577)

(declare-fun +!1449 (ListLongMap!6577 tuple2!7664) ListLongMap!6577)

(assert (=> b!437109 (= (getCurrentListMapNoExtraKeys!1493 lt!201541 lt!201542 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1449 (getCurrentListMapNoExtraKeys!1493 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7665 k0!794 v!412)))))

(declare-datatypes ((Unit!13002 0))(
  ( (Unit!13003) )
))
(declare-fun lt!201544 () Unit!13002)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!618 (array!26773 array!26775 (_ BitVec 32) (_ BitVec 32) V!16405 V!16405 (_ BitVec 32) (_ BitVec 64) V!16405 (_ BitVec 32) Int) Unit!13002)

(assert (=> b!437109 (= lt!201544 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!618 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437110 () Bool)

(declare-fun res!257797 () Bool)

(assert (=> b!437110 (=> (not res!257797) (not e!258039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437110 (= res!257797 (validKeyInArray!0 k0!794))))

(declare-fun b!437111 () Bool)

(declare-fun res!257794 () Bool)

(assert (=> b!437111 (=> (not res!257794) (not e!258039))))

(declare-datatypes ((List!7663 0))(
  ( (Nil!7660) (Cons!7659 (h!8515 (_ BitVec 64)) (t!13419 List!7663)) )
))
(declare-fun arrayNoDuplicates!0 (array!26773 (_ BitVec 32) List!7663) Bool)

(assert (=> b!437111 (= res!257794 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7660))))

(declare-fun res!257800 () Bool)

(assert (=> start!40056 (=> (not res!257800) (not e!258039))))

(assert (=> start!40056 (= res!257800 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13188 _keys!709))))))

(assert (=> start!40056 e!258039))

(declare-fun tp_is_empty!11475 () Bool)

(assert (=> start!40056 tp_is_empty!11475))

(assert (=> start!40056 tp!36497))

(assert (=> start!40056 true))

(declare-fun e!258038 () Bool)

(declare-fun array_inv!9324 (array!26775) Bool)

(assert (=> start!40056 (and (array_inv!9324 _values!549) e!258038)))

(declare-fun array_inv!9325 (array!26773) Bool)

(assert (=> start!40056 (array_inv!9325 _keys!709)))

(declare-fun b!437112 () Bool)

(declare-fun e!258037 () Bool)

(assert (=> b!437112 (= e!258037 e!258033)))

(declare-fun res!257791 () Bool)

(assert (=> b!437112 (=> (not res!257791) (not e!258033))))

(assert (=> b!437112 (= res!257791 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201543 () ListLongMap!6577)

(assert (=> b!437112 (= lt!201543 (getCurrentListMapNoExtraKeys!1493 lt!201541 lt!201542 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437112 (= lt!201542 (array!26776 (store (arr!12837 _values!549) i!563 (ValueCellFull!5394 v!412)) (size!13189 _values!549)))))

(declare-fun lt!201545 () ListLongMap!6577)

(assert (=> b!437112 (= lt!201545 (getCurrentListMapNoExtraKeys!1493 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437113 () Bool)

(declare-fun res!257801 () Bool)

(assert (=> b!437113 (=> (not res!257801) (not e!258039))))

(declare-fun arrayContainsKey!0 (array!26773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437113 (= res!257801 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437114 () Bool)

(declare-fun e!258034 () Bool)

(assert (=> b!437114 (= e!258034 tp_is_empty!11475)))

(declare-fun b!437115 () Bool)

(declare-fun res!257792 () Bool)

(assert (=> b!437115 (=> (not res!257792) (not e!258039))))

(assert (=> b!437115 (= res!257792 (or (= (select (arr!12836 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12836 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18834 () Bool)

(declare-fun mapRes!18834 () Bool)

(assert (=> mapIsEmpty!18834 mapRes!18834))

(declare-fun b!437116 () Bool)

(declare-fun res!257795 () Bool)

(assert (=> b!437116 (=> (not res!257795) (not e!258039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437116 (= res!257795 (validMask!0 mask!1025))))

(declare-fun b!437117 () Bool)

(declare-fun e!258035 () Bool)

(assert (=> b!437117 (= e!258035 tp_is_empty!11475)))

(declare-fun b!437118 () Bool)

(declare-fun res!257793 () Bool)

(assert (=> b!437118 (=> (not res!257793) (not e!258037))))

(assert (=> b!437118 (= res!257793 (bvsle from!863 i!563))))

(declare-fun b!437119 () Bool)

(declare-fun res!257798 () Bool)

(assert (=> b!437119 (=> (not res!257798) (not e!258037))))

(assert (=> b!437119 (= res!257798 (arrayNoDuplicates!0 lt!201541 #b00000000000000000000000000000000 Nil!7660))))

(declare-fun b!437120 () Bool)

(assert (=> b!437120 (= e!258039 e!258037)))

(declare-fun res!257790 () Bool)

(assert (=> b!437120 (=> (not res!257790) (not e!258037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26773 (_ BitVec 32)) Bool)

(assert (=> b!437120 (= res!257790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201541 mask!1025))))

(assert (=> b!437120 (= lt!201541 (array!26774 (store (arr!12836 _keys!709) i!563 k0!794) (size!13188 _keys!709)))))

(declare-fun b!437121 () Bool)

(declare-fun res!257799 () Bool)

(assert (=> b!437121 (=> (not res!257799) (not e!258039))))

(assert (=> b!437121 (= res!257799 (and (= (size!13189 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13188 _keys!709) (size!13189 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437122 () Bool)

(assert (=> b!437122 (= e!258038 (and e!258035 mapRes!18834))))

(declare-fun condMapEmpty!18834 () Bool)

(declare-fun mapDefault!18834 () ValueCell!5394)

(assert (=> b!437122 (= condMapEmpty!18834 (= (arr!12837 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5394)) mapDefault!18834)))))

(declare-fun b!437123 () Bool)

(declare-fun res!257802 () Bool)

(assert (=> b!437123 (=> (not res!257802) (not e!258039))))

(assert (=> b!437123 (= res!257802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18834 () Bool)

(declare-fun tp!36498 () Bool)

(assert (=> mapNonEmpty!18834 (= mapRes!18834 (and tp!36498 e!258034))))

(declare-fun mapKey!18834 () (_ BitVec 32))

(declare-fun mapValue!18834 () ValueCell!5394)

(declare-fun mapRest!18834 () (Array (_ BitVec 32) ValueCell!5394))

(assert (=> mapNonEmpty!18834 (= (arr!12837 _values!549) (store mapRest!18834 mapKey!18834 mapValue!18834))))

(assert (= (and start!40056 res!257800) b!437116))

(assert (= (and b!437116 res!257795) b!437121))

(assert (= (and b!437121 res!257799) b!437123))

(assert (= (and b!437123 res!257802) b!437111))

(assert (= (and b!437111 res!257794) b!437108))

(assert (= (and b!437108 res!257796) b!437110))

(assert (= (and b!437110 res!257797) b!437115))

(assert (= (and b!437115 res!257792) b!437113))

(assert (= (and b!437113 res!257801) b!437120))

(assert (= (and b!437120 res!257790) b!437119))

(assert (= (and b!437119 res!257798) b!437118))

(assert (= (and b!437118 res!257793) b!437112))

(assert (= (and b!437112 res!257791) b!437109))

(assert (= (and b!437122 condMapEmpty!18834) mapIsEmpty!18834))

(assert (= (and b!437122 (not condMapEmpty!18834)) mapNonEmpty!18834))

(get-info :version)

(assert (= (and mapNonEmpty!18834 ((_ is ValueCellFull!5394) mapValue!18834)) b!437114))

(assert (= (and b!437122 ((_ is ValueCellFull!5394) mapDefault!18834)) b!437117))

(assert (= start!40056 b!437122))

(declare-fun m!424847 () Bool)

(assert (=> b!437111 m!424847))

(declare-fun m!424849 () Bool)

(assert (=> b!437119 m!424849))

(declare-fun m!424851 () Bool)

(assert (=> b!437123 m!424851))

(declare-fun m!424853 () Bool)

(assert (=> mapNonEmpty!18834 m!424853))

(declare-fun m!424855 () Bool)

(assert (=> start!40056 m!424855))

(declare-fun m!424857 () Bool)

(assert (=> start!40056 m!424857))

(declare-fun m!424859 () Bool)

(assert (=> b!437116 m!424859))

(declare-fun m!424861 () Bool)

(assert (=> b!437113 m!424861))

(declare-fun m!424863 () Bool)

(assert (=> b!437109 m!424863))

(declare-fun m!424865 () Bool)

(assert (=> b!437109 m!424865))

(assert (=> b!437109 m!424865))

(declare-fun m!424867 () Bool)

(assert (=> b!437109 m!424867))

(declare-fun m!424869 () Bool)

(assert (=> b!437109 m!424869))

(declare-fun m!424871 () Bool)

(assert (=> b!437120 m!424871))

(declare-fun m!424873 () Bool)

(assert (=> b!437120 m!424873))

(declare-fun m!424875 () Bool)

(assert (=> b!437110 m!424875))

(declare-fun m!424877 () Bool)

(assert (=> b!437112 m!424877))

(declare-fun m!424879 () Bool)

(assert (=> b!437112 m!424879))

(declare-fun m!424881 () Bool)

(assert (=> b!437112 m!424881))

(declare-fun m!424883 () Bool)

(assert (=> b!437115 m!424883))

(check-sat (not b!437112) (not b!437116) (not b!437110) tp_is_empty!11475 (not mapNonEmpty!18834) (not b_next!10323) (not b!437119) (not b!437123) (not b!437111) (not start!40056) (not b!437113) (not b!437120) b_and!18291 (not b!437109))
(check-sat b_and!18291 (not b_next!10323))
