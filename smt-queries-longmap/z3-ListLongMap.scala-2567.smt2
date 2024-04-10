; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39222 () Bool)

(assert start!39222)

(declare-fun b_free!9489 () Bool)

(declare-fun b_next!9489 () Bool)

(assert (=> start!39222 (= b_free!9489 (not b_next!9489))))

(declare-fun tp!33996 () Bool)

(declare-fun b_and!16875 () Bool)

(assert (=> start!39222 (= tp!33996 b_and!16875)))

(declare-datatypes ((V!15293 0))(
  ( (V!15294 (val!5365 Int)) )
))
(declare-fun minValue!515 () V!15293)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28642 () Bool)

(declare-datatypes ((ValueCell!4977 0))(
  ( (ValueCellFull!4977 (v!7612 V!15293)) (EmptyCell!4977) )
))
(declare-datatypes ((array!25139 0))(
  ( (array!25140 (arr!12019 (Array (_ BitVec 32) ValueCell!4977)) (size!12371 (_ BitVec 32))) )
))
(declare-fun lt!189816 () array!25139)

(declare-fun _values!549 () array!25139)

(declare-datatypes ((tuple2!6974 0))(
  ( (tuple2!6975 (_1!3498 (_ BitVec 64)) (_2!3498 V!15293)) )
))
(declare-datatypes ((List!6997 0))(
  ( (Nil!6994) (Cons!6993 (h!7849 tuple2!6974) (t!12171 List!6997)) )
))
(declare-datatypes ((ListLongMap!5887 0))(
  ( (ListLongMap!5888 (toList!2959 List!6997)) )
))
(declare-fun call!28646 () ListLongMap!5887)

(declare-datatypes ((array!25141 0))(
  ( (array!25142 (arr!12020 (Array (_ BitVec 32) (_ BitVec 64))) (size!12372 (_ BitVec 32))) )
))
(declare-fun lt!189815 () array!25141)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25141)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54947 () Bool)

(declare-fun zeroValue!515 () V!15293)

(declare-fun getCurrentListMapNoExtraKeys!1166 (array!25141 array!25139 (_ BitVec 32) (_ BitVec 32) V!15293 V!15293 (_ BitVec 32) Int) ListLongMap!5887)

(assert (=> bm!28642 (= call!28646 (getCurrentListMapNoExtraKeys!1166 (ite c!54947 _keys!709 lt!189815) (ite c!54947 _values!549 lt!189816) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17583 () Bool)

(declare-fun mapRes!17583 () Bool)

(assert (=> mapIsEmpty!17583 mapRes!17583))

(declare-fun b!413758 () Bool)

(declare-fun res!240485 () Bool)

(declare-fun e!247373 () Bool)

(assert (=> b!413758 (=> (not res!240485) (not e!247373))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413758 (= res!240485 (bvsle from!863 i!563))))

(declare-fun b!413759 () Bool)

(declare-fun e!247380 () Bool)

(declare-fun tp_is_empty!10641 () Bool)

(assert (=> b!413759 (= e!247380 tp_is_empty!10641)))

(declare-fun b!413760 () Bool)

(declare-fun res!240474 () Bool)

(assert (=> b!413760 (=> (not res!240474) (not e!247373))))

(declare-datatypes ((List!6998 0))(
  ( (Nil!6995) (Cons!6994 (h!7850 (_ BitVec 64)) (t!12172 List!6998)) )
))
(declare-fun arrayNoDuplicates!0 (array!25141 (_ BitVec 32) List!6998) Bool)

(assert (=> b!413760 (= res!240474 (arrayNoDuplicates!0 lt!189815 #b00000000000000000000000000000000 Nil!6995))))

(declare-fun mapNonEmpty!17583 () Bool)

(declare-fun tp!33995 () Bool)

(declare-fun e!247376 () Bool)

(assert (=> mapNonEmpty!17583 (= mapRes!17583 (and tp!33995 e!247376))))

(declare-fun mapValue!17583 () ValueCell!4977)

(declare-fun mapKey!17583 () (_ BitVec 32))

(declare-fun mapRest!17583 () (Array (_ BitVec 32) ValueCell!4977))

(assert (=> mapNonEmpty!17583 (= (arr!12019 _values!549) (store mapRest!17583 mapKey!17583 mapValue!17583))))

(declare-fun b!413761 () Bool)

(assert (=> b!413761 (= e!247376 tp_is_empty!10641)))

(declare-fun b!413762 () Bool)

(declare-fun res!240477 () Bool)

(declare-fun e!247375 () Bool)

(assert (=> b!413762 (=> (not res!240477) (not e!247375))))

(assert (=> b!413762 (= res!240477 (and (= (size!12371 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12372 _keys!709) (size!12371 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413763 () Bool)

(declare-fun res!240482 () Bool)

(assert (=> b!413763 (=> (not res!240482) (not e!247375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25141 (_ BitVec 32)) Bool)

(assert (=> b!413763 (= res!240482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413764 () Bool)

(declare-fun res!240479 () Bool)

(assert (=> b!413764 (=> (not res!240479) (not e!247375))))

(assert (=> b!413764 (= res!240479 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12372 _keys!709))))))

(declare-fun res!240486 () Bool)

(assert (=> start!39222 (=> (not res!240486) (not e!247375))))

(assert (=> start!39222 (= res!240486 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12372 _keys!709))))))

(assert (=> start!39222 e!247375))

(assert (=> start!39222 tp_is_empty!10641))

(assert (=> start!39222 tp!33996))

(assert (=> start!39222 true))

(declare-fun e!247378 () Bool)

(declare-fun array_inv!8766 (array!25139) Bool)

(assert (=> start!39222 (and (array_inv!8766 _values!549) e!247378)))

(declare-fun array_inv!8767 (array!25141) Bool)

(assert (=> start!39222 (array_inv!8767 _keys!709)))

(declare-fun b!413757 () Bool)

(declare-fun res!240484 () Bool)

(assert (=> b!413757 (=> (not res!240484) (not e!247375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413757 (= res!240484 (validMask!0 mask!1025))))

(declare-fun b!413765 () Bool)

(assert (=> b!413765 (= e!247375 e!247373)))

(declare-fun res!240480 () Bool)

(assert (=> b!413765 (=> (not res!240480) (not e!247373))))

(assert (=> b!413765 (= res!240480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189815 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!413765 (= lt!189815 (array!25142 (store (arr!12020 _keys!709) i!563 k0!794) (size!12372 _keys!709)))))

(declare-fun b!413766 () Bool)

(declare-fun e!247374 () Bool)

(declare-fun call!28645 () ListLongMap!5887)

(declare-fun v!412 () V!15293)

(declare-fun +!1168 (ListLongMap!5887 tuple2!6974) ListLongMap!5887)

(assert (=> b!413766 (= e!247374 (= call!28645 (+!1168 call!28646 (tuple2!6975 k0!794 v!412))))))

(declare-fun b!413767 () Bool)

(declare-fun e!247377 () Bool)

(assert (=> b!413767 (= e!247377 (not true))))

(assert (=> b!413767 e!247374))

(assert (=> b!413767 (= c!54947 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12242 0))(
  ( (Unit!12243) )
))
(declare-fun lt!189817 () Unit!12242)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!379 (array!25141 array!25139 (_ BitVec 32) (_ BitVec 32) V!15293 V!15293 (_ BitVec 32) (_ BitVec 64) V!15293 (_ BitVec 32) Int) Unit!12242)

(assert (=> b!413767 (= lt!189817 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!379 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413768 () Bool)

(declare-fun res!240481 () Bool)

(assert (=> b!413768 (=> (not res!240481) (not e!247375))))

(declare-fun arrayContainsKey!0 (array!25141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413768 (= res!240481 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413769 () Bool)

(assert (=> b!413769 (= e!247373 e!247377)))

(declare-fun res!240475 () Bool)

(assert (=> b!413769 (=> (not res!240475) (not e!247377))))

(assert (=> b!413769 (= res!240475 (= from!863 i!563))))

(declare-fun lt!189818 () ListLongMap!5887)

(assert (=> b!413769 (= lt!189818 (getCurrentListMapNoExtraKeys!1166 lt!189815 lt!189816 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413769 (= lt!189816 (array!25140 (store (arr!12019 _values!549) i!563 (ValueCellFull!4977 v!412)) (size!12371 _values!549)))))

(declare-fun lt!189814 () ListLongMap!5887)

(assert (=> b!413769 (= lt!189814 (getCurrentListMapNoExtraKeys!1166 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413770 () Bool)

(declare-fun res!240478 () Bool)

(assert (=> b!413770 (=> (not res!240478) (not e!247375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413770 (= res!240478 (validKeyInArray!0 k0!794))))

(declare-fun bm!28643 () Bool)

(assert (=> bm!28643 (= call!28645 (getCurrentListMapNoExtraKeys!1166 (ite c!54947 lt!189815 _keys!709) (ite c!54947 lt!189816 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413771 () Bool)

(declare-fun res!240476 () Bool)

(assert (=> b!413771 (=> (not res!240476) (not e!247375))))

(assert (=> b!413771 (= res!240476 (or (= (select (arr!12020 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12020 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413772 () Bool)

(declare-fun res!240483 () Bool)

(assert (=> b!413772 (=> (not res!240483) (not e!247375))))

(assert (=> b!413772 (= res!240483 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6995))))

(declare-fun b!413773 () Bool)

(assert (=> b!413773 (= e!247374 (= call!28646 call!28645))))

(declare-fun b!413774 () Bool)

(assert (=> b!413774 (= e!247378 (and e!247380 mapRes!17583))))

(declare-fun condMapEmpty!17583 () Bool)

(declare-fun mapDefault!17583 () ValueCell!4977)

(assert (=> b!413774 (= condMapEmpty!17583 (= (arr!12019 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4977)) mapDefault!17583)))))

(assert (= (and start!39222 res!240486) b!413757))

(assert (= (and b!413757 res!240484) b!413762))

(assert (= (and b!413762 res!240477) b!413763))

(assert (= (and b!413763 res!240482) b!413772))

(assert (= (and b!413772 res!240483) b!413764))

(assert (= (and b!413764 res!240479) b!413770))

(assert (= (and b!413770 res!240478) b!413771))

(assert (= (and b!413771 res!240476) b!413768))

(assert (= (and b!413768 res!240481) b!413765))

(assert (= (and b!413765 res!240480) b!413760))

(assert (= (and b!413760 res!240474) b!413758))

(assert (= (and b!413758 res!240485) b!413769))

(assert (= (and b!413769 res!240475) b!413767))

(assert (= (and b!413767 c!54947) b!413766))

(assert (= (and b!413767 (not c!54947)) b!413773))

(assert (= (or b!413766 b!413773) bm!28643))

(assert (= (or b!413766 b!413773) bm!28642))

(assert (= (and b!413774 condMapEmpty!17583) mapIsEmpty!17583))

(assert (= (and b!413774 (not condMapEmpty!17583)) mapNonEmpty!17583))

(get-info :version)

(assert (= (and mapNonEmpty!17583 ((_ is ValueCellFull!4977) mapValue!17583)) b!413761))

(assert (= (and b!413774 ((_ is ValueCellFull!4977) mapDefault!17583)) b!413759))

(assert (= start!39222 b!413774))

(declare-fun m!403161 () Bool)

(assert (=> b!413766 m!403161))

(declare-fun m!403163 () Bool)

(assert (=> b!413772 m!403163))

(declare-fun m!403165 () Bool)

(assert (=> b!413770 m!403165))

(declare-fun m!403167 () Bool)

(assert (=> bm!28643 m!403167))

(declare-fun m!403169 () Bool)

(assert (=> mapNonEmpty!17583 m!403169))

(declare-fun m!403171 () Bool)

(assert (=> b!413771 m!403171))

(declare-fun m!403173 () Bool)

(assert (=> b!413763 m!403173))

(declare-fun m!403175 () Bool)

(assert (=> bm!28642 m!403175))

(declare-fun m!403177 () Bool)

(assert (=> b!413769 m!403177))

(declare-fun m!403179 () Bool)

(assert (=> b!413769 m!403179))

(declare-fun m!403181 () Bool)

(assert (=> b!413769 m!403181))

(declare-fun m!403183 () Bool)

(assert (=> b!413765 m!403183))

(declare-fun m!403185 () Bool)

(assert (=> b!413765 m!403185))

(declare-fun m!403187 () Bool)

(assert (=> start!39222 m!403187))

(declare-fun m!403189 () Bool)

(assert (=> start!39222 m!403189))

(declare-fun m!403191 () Bool)

(assert (=> b!413757 m!403191))

(declare-fun m!403193 () Bool)

(assert (=> b!413760 m!403193))

(declare-fun m!403195 () Bool)

(assert (=> b!413767 m!403195))

(declare-fun m!403197 () Bool)

(assert (=> b!413768 m!403197))

(check-sat (not b!413763) (not b!413766) (not bm!28643) (not b!413760) (not start!39222) (not b_next!9489) (not b!413765) tp_is_empty!10641 (not bm!28642) (not mapNonEmpty!17583) (not b!413770) b_and!16875 (not b!413767) (not b!413772) (not b!413768) (not b!413769) (not b!413757))
(check-sat b_and!16875 (not b_next!9489))
