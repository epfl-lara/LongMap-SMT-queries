; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38726 () Bool)

(assert start!38726)

(declare-fun b_free!9277 () Bool)

(declare-fun b_next!9277 () Bool)

(assert (=> start!38726 (= b_free!9277 (not b_next!9277))))

(declare-fun tp!32954 () Bool)

(declare-fun b_and!16677 () Bool)

(assert (=> start!38726 (= tp!32954 b_and!16677)))

(declare-datatypes ((V!14651 0))(
  ( (V!14652 (val!5124 Int)) )
))
(declare-fun minValue!515 () V!14651)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4736 0))(
  ( (ValueCellFull!4736 (v!7372 V!14651)) (EmptyCell!4736) )
))
(declare-datatypes ((array!24202 0))(
  ( (array!24203 (arr!11550 (Array (_ BitVec 32) ValueCell!4736)) (size!11902 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24202)

(declare-fun zeroValue!515 () V!14651)

(declare-datatypes ((tuple2!6684 0))(
  ( (tuple2!6685 (_1!3353 (_ BitVec 64)) (_2!3353 V!14651)) )
))
(declare-datatypes ((List!6604 0))(
  ( (Nil!6601) (Cons!6600 (h!7456 tuple2!6684) (t!11770 List!6604)) )
))
(declare-datatypes ((ListLongMap!5599 0))(
  ( (ListLongMap!5600 (toList!2815 List!6604)) )
))
(declare-fun call!28482 () ListLongMap!5599)

(declare-fun v!412 () V!14651)

(declare-datatypes ((array!24204 0))(
  ( (array!24205 (arr!11551 (Array (_ BitVec 32) (_ BitVec 64))) (size!11903 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24204)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28479 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!188075 () array!24204)

(declare-fun c!54849 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1068 (array!24204 array!24202 (_ BitVec 32) (_ BitVec 32) V!14651 V!14651 (_ BitVec 32) Int) ListLongMap!5599)

(assert (=> bm!28479 (= call!28482 (getCurrentListMapNoExtraKeys!1068 (ite c!54849 _keys!709 lt!188075) (ite c!54849 _values!549 (array!24203 (store (arr!11550 _values!549) i!563 (ValueCellFull!4736 v!412)) (size!11902 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403473 () Bool)

(declare-fun e!242879 () Bool)

(declare-fun tp_is_empty!10159 () Bool)

(assert (=> b!403473 (= e!242879 tp_is_empty!10159)))

(declare-fun b!403474 () Bool)

(declare-fun res!232557 () Bool)

(declare-fun e!242878 () Bool)

(assert (=> b!403474 (=> (not res!232557) (not e!242878))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403474 (= res!232557 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403475 () Bool)

(declare-fun res!232564 () Bool)

(assert (=> b!403475 (=> (not res!232564) (not e!242878))))

(assert (=> b!403475 (= res!232564 (or (= (select (arr!11551 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11551 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16860 () Bool)

(declare-fun mapRes!16860 () Bool)

(assert (=> mapIsEmpty!16860 mapRes!16860))

(declare-fun b!403476 () Bool)

(declare-fun res!232559 () Bool)

(declare-fun e!242880 () Bool)

(assert (=> b!403476 (=> (not res!232559) (not e!242880))))

(assert (=> b!403476 (= res!232559 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11903 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun res!232560 () Bool)

(assert (=> start!38726 (=> (not res!232560) (not e!242878))))

(assert (=> start!38726 (= res!232560 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11903 _keys!709))))))

(assert (=> start!38726 e!242878))

(assert (=> start!38726 tp_is_empty!10159))

(assert (=> start!38726 tp!32954))

(assert (=> start!38726 true))

(declare-fun e!242881 () Bool)

(declare-fun array_inv!8532 (array!24202) Bool)

(assert (=> start!38726 (and (array_inv!8532 _values!549) e!242881)))

(declare-fun array_inv!8533 (array!24204) Bool)

(assert (=> start!38726 (array_inv!8533 _keys!709)))

(declare-fun b!403477 () Bool)

(declare-fun res!232566 () Bool)

(assert (=> b!403477 (=> (not res!232566) (not e!242880))))

(declare-datatypes ((List!6605 0))(
  ( (Nil!6602) (Cons!6601 (h!7457 (_ BitVec 64)) (t!11771 List!6605)) )
))
(declare-fun arrayNoDuplicates!0 (array!24204 (_ BitVec 32) List!6605) Bool)

(assert (=> b!403477 (= res!232566 (arrayNoDuplicates!0 lt!188075 #b00000000000000000000000000000000 Nil!6602))))

(declare-fun bm!28480 () Bool)

(declare-fun call!28483 () ListLongMap!5599)

(assert (=> bm!28480 (= call!28483 (getCurrentListMapNoExtraKeys!1068 (ite c!54849 lt!188075 _keys!709) (ite c!54849 (array!24203 (store (arr!11550 _values!549) i!563 (ValueCellFull!4736 v!412)) (size!11902 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403478 () Bool)

(declare-fun res!232563 () Bool)

(assert (=> b!403478 (=> (not res!232563) (not e!242878))))

(assert (=> b!403478 (= res!232563 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11903 _keys!709))))))

(declare-fun mapNonEmpty!16860 () Bool)

(declare-fun tp!32955 () Bool)

(assert (=> mapNonEmpty!16860 (= mapRes!16860 (and tp!32955 e!242879))))

(declare-fun mapKey!16860 () (_ BitVec 32))

(declare-fun mapValue!16860 () ValueCell!4736)

(declare-fun mapRest!16860 () (Array (_ BitVec 32) ValueCell!4736))

(assert (=> mapNonEmpty!16860 (= (arr!11550 _values!549) (store mapRest!16860 mapKey!16860 mapValue!16860))))

(declare-fun b!403479 () Bool)

(declare-fun e!242884 () Bool)

(assert (=> b!403479 (= e!242884 tp_is_empty!10159)))

(declare-fun b!403480 () Bool)

(assert (=> b!403480 (= e!242878 e!242880)))

(declare-fun res!232558 () Bool)

(assert (=> b!403480 (=> (not res!232558) (not e!242880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24204 (_ BitVec 32)) Bool)

(assert (=> b!403480 (= res!232558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188075 mask!1025))))

(assert (=> b!403480 (= lt!188075 (array!24205 (store (arr!11551 _keys!709) i!563 k0!794) (size!11903 _keys!709)))))

(declare-fun b!403481 () Bool)

(declare-fun res!232565 () Bool)

(assert (=> b!403481 (=> (not res!232565) (not e!242878))))

(assert (=> b!403481 (= res!232565 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6602))))

(declare-fun b!403482 () Bool)

(declare-fun res!232556 () Bool)

(assert (=> b!403482 (=> (not res!232556) (not e!242878))))

(assert (=> b!403482 (= res!232556 (and (= (size!11902 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11903 _keys!709) (size!11902 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403483 () Bool)

(declare-fun res!232555 () Bool)

(assert (=> b!403483 (=> (not res!232555) (not e!242878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403483 (= res!232555 (validKeyInArray!0 k0!794))))

(declare-fun b!403484 () Bool)

(assert (=> b!403484 (= e!242880 (not true))))

(declare-fun e!242883 () Bool)

(assert (=> b!403484 e!242883))

(assert (=> b!403484 (= c!54849 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12199 0))(
  ( (Unit!12200) )
))
(declare-fun lt!188076 () Unit!12199)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!367 (array!24204 array!24202 (_ BitVec 32) (_ BitVec 32) V!14651 V!14651 (_ BitVec 32) (_ BitVec 64) V!14651 (_ BitVec 32) Int) Unit!12199)

(assert (=> b!403484 (= lt!188076 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403485 () Bool)

(declare-fun res!232562 () Bool)

(assert (=> b!403485 (=> (not res!232562) (not e!242878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403485 (= res!232562 (validMask!0 mask!1025))))

(declare-fun b!403486 () Bool)

(declare-fun +!1153 (ListLongMap!5599 tuple2!6684) ListLongMap!5599)

(assert (=> b!403486 (= e!242883 (= call!28483 (+!1153 call!28482 (tuple2!6685 k0!794 v!412))))))

(declare-fun b!403487 () Bool)

(assert (=> b!403487 (= e!242881 (and e!242884 mapRes!16860))))

(declare-fun condMapEmpty!16860 () Bool)

(declare-fun mapDefault!16860 () ValueCell!4736)

(assert (=> b!403487 (= condMapEmpty!16860 (= (arr!11550 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4736)) mapDefault!16860)))))

(declare-fun b!403488 () Bool)

(assert (=> b!403488 (= e!242883 (= call!28482 call!28483))))

(declare-fun b!403489 () Bool)

(declare-fun res!232561 () Bool)

(assert (=> b!403489 (=> (not res!232561) (not e!242878))))

(assert (=> b!403489 (= res!232561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38726 res!232560) b!403485))

(assert (= (and b!403485 res!232562) b!403482))

(assert (= (and b!403482 res!232556) b!403489))

(assert (= (and b!403489 res!232561) b!403481))

(assert (= (and b!403481 res!232565) b!403478))

(assert (= (and b!403478 res!232563) b!403483))

(assert (= (and b!403483 res!232555) b!403475))

(assert (= (and b!403475 res!232564) b!403474))

(assert (= (and b!403474 res!232557) b!403480))

(assert (= (and b!403480 res!232558) b!403477))

(assert (= (and b!403477 res!232566) b!403476))

(assert (= (and b!403476 res!232559) b!403484))

(assert (= (and b!403484 c!54849) b!403486))

(assert (= (and b!403484 (not c!54849)) b!403488))

(assert (= (or b!403486 b!403488) bm!28480))

(assert (= (or b!403486 b!403488) bm!28479))

(assert (= (and b!403487 condMapEmpty!16860) mapIsEmpty!16860))

(assert (= (and b!403487 (not condMapEmpty!16860)) mapNonEmpty!16860))

(get-info :version)

(assert (= (and mapNonEmpty!16860 ((_ is ValueCellFull!4736) mapValue!16860)) b!403473))

(assert (= (and b!403487 ((_ is ValueCellFull!4736) mapDefault!16860)) b!403479))

(assert (= start!38726 b!403487))

(declare-fun m!396915 () Bool)

(assert (=> b!403483 m!396915))

(declare-fun m!396917 () Bool)

(assert (=> b!403481 m!396917))

(declare-fun m!396919 () Bool)

(assert (=> b!403484 m!396919))

(declare-fun m!396921 () Bool)

(assert (=> b!403486 m!396921))

(declare-fun m!396923 () Bool)

(assert (=> b!403475 m!396923))

(declare-fun m!396925 () Bool)

(assert (=> b!403485 m!396925))

(declare-fun m!396927 () Bool)

(assert (=> b!403474 m!396927))

(declare-fun m!396929 () Bool)

(assert (=> b!403477 m!396929))

(declare-fun m!396931 () Bool)

(assert (=> b!403480 m!396931))

(declare-fun m!396933 () Bool)

(assert (=> b!403480 m!396933))

(declare-fun m!396935 () Bool)

(assert (=> b!403489 m!396935))

(declare-fun m!396937 () Bool)

(assert (=> mapNonEmpty!16860 m!396937))

(declare-fun m!396939 () Bool)

(assert (=> bm!28480 m!396939))

(declare-fun m!396941 () Bool)

(assert (=> bm!28480 m!396941))

(assert (=> bm!28479 m!396939))

(declare-fun m!396943 () Bool)

(assert (=> bm!28479 m!396943))

(declare-fun m!396945 () Bool)

(assert (=> start!38726 m!396945))

(declare-fun m!396947 () Bool)

(assert (=> start!38726 m!396947))

(check-sat (not b!403484) (not b!403489) (not b!403481) (not mapNonEmpty!16860) tp_is_empty!10159 b_and!16677 (not bm!28479) (not start!38726) (not b!403477) (not b!403486) (not b!403483) (not b!403485) (not b!403480) (not bm!28480) (not b_next!9277) (not b!403474))
(check-sat b_and!16677 (not b_next!9277))
