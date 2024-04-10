; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38688 () Bool)

(assert start!38688)

(declare-fun b_free!9225 () Bool)

(declare-fun b_next!9225 () Bool)

(assert (=> start!38688 (= b_free!9225 (not b_next!9225))))

(declare-fun tp!32799 () Bool)

(declare-fun b_and!16611 () Bool)

(assert (=> start!38688 (= tp!32799 b_and!16611)))

(declare-fun b!402196 () Bool)

(declare-fun res!231629 () Bool)

(declare-fun e!242365 () Bool)

(assert (=> b!402196 (=> (not res!231629) (not e!242365))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24119 0))(
  ( (array!24120 (arr!11509 (Array (_ BitVec 32) (_ BitVec 64))) (size!11861 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24119)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402196 (= res!231629 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11861 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun e!242369 () Bool)

(declare-fun b!402197 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!14581 0))(
  ( (V!14582 (val!5098 Int)) )
))
(declare-datatypes ((tuple2!6770 0))(
  ( (tuple2!6771 (_1!3396 (_ BitVec 64)) (_2!3396 V!14581)) )
))
(declare-datatypes ((List!6693 0))(
  ( (Nil!6690) (Cons!6689 (h!7545 tuple2!6770) (t!11867 List!6693)) )
))
(declare-datatypes ((ListLongMap!5683 0))(
  ( (ListLongMap!5684 (toList!2857 List!6693)) )
))
(declare-fun call!28339 () ListLongMap!5683)

(declare-fun call!28340 () ListLongMap!5683)

(declare-fun v!412 () V!14581)

(declare-fun +!1136 (ListLongMap!5683 tuple2!6770) ListLongMap!5683)

(assert (=> b!402197 (= e!242369 (= call!28340 (+!1136 call!28339 (tuple2!6771 k0!794 v!412))))))

(declare-fun b!402198 () Bool)

(declare-fun res!231624 () Bool)

(declare-fun e!242370 () Bool)

(assert (=> b!402198 (=> (not res!231624) (not e!242370))))

(assert (=> b!402198 (= res!231624 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11861 _keys!709))))))

(declare-fun mapNonEmpty!16782 () Bool)

(declare-fun mapRes!16782 () Bool)

(declare-fun tp!32798 () Bool)

(declare-fun e!242366 () Bool)

(assert (=> mapNonEmpty!16782 (= mapRes!16782 (and tp!32798 e!242366))))

(declare-fun mapKey!16782 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4710 0))(
  ( (ValueCellFull!4710 (v!7345 V!14581)) (EmptyCell!4710) )
))
(declare-fun mapRest!16782 () (Array (_ BitVec 32) ValueCell!4710))

(declare-datatypes ((array!24121 0))(
  ( (array!24122 (arr!11510 (Array (_ BitVec 32) ValueCell!4710)) (size!11862 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24121)

(declare-fun mapValue!16782 () ValueCell!4710)

(assert (=> mapNonEmpty!16782 (= (arr!11510 _values!549) (store mapRest!16782 mapKey!16782 mapValue!16782))))

(declare-fun b!402199 () Bool)

(declare-fun e!242368 () Bool)

(declare-fun e!242367 () Bool)

(assert (=> b!402199 (= e!242368 (and e!242367 mapRes!16782))))

(declare-fun condMapEmpty!16782 () Bool)

(declare-fun mapDefault!16782 () ValueCell!4710)

(assert (=> b!402199 (= condMapEmpty!16782 (= (arr!11510 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4710)) mapDefault!16782)))))

(declare-fun b!402200 () Bool)

(declare-fun res!231625 () Bool)

(assert (=> b!402200 (=> (not res!231625) (not e!242370))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!402200 (= res!231625 (and (= (size!11862 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11861 _keys!709) (size!11862 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402202 () Bool)

(declare-fun res!231631 () Bool)

(assert (=> b!402202 (=> (not res!231631) (not e!242370))))

(assert (=> b!402202 (= res!231631 (or (= (select (arr!11509 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11509 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16782 () Bool)

(assert (=> mapIsEmpty!16782 mapRes!16782))

(declare-fun b!402203 () Bool)

(assert (=> b!402203 (= e!242370 e!242365)))

(declare-fun res!231626 () Bool)

(assert (=> b!402203 (=> (not res!231626) (not e!242365))))

(declare-fun lt!187900 () array!24119)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24119 (_ BitVec 32)) Bool)

(assert (=> b!402203 (= res!231626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187900 mask!1025))))

(assert (=> b!402203 (= lt!187900 (array!24120 (store (arr!11509 _keys!709) i!563 k0!794) (size!11861 _keys!709)))))

(declare-fun b!402204 () Bool)

(declare-fun tp_is_empty!10107 () Bool)

(assert (=> b!402204 (= e!242366 tp_is_empty!10107)))

(declare-fun minValue!515 () V!14581)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14581)

(declare-fun c!54794 () Bool)

(declare-fun bm!28336 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1068 (array!24119 array!24121 (_ BitVec 32) (_ BitVec 32) V!14581 V!14581 (_ BitVec 32) Int) ListLongMap!5683)

(assert (=> bm!28336 (= call!28340 (getCurrentListMapNoExtraKeys!1068 (ite c!54794 lt!187900 _keys!709) (ite c!54794 (array!24122 (store (arr!11510 _values!549) i!563 (ValueCellFull!4710 v!412)) (size!11862 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402205 () Bool)

(declare-fun res!231627 () Bool)

(assert (=> b!402205 (=> (not res!231627) (not e!242370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402205 (= res!231627 (validKeyInArray!0 k0!794))))

(declare-fun b!402206 () Bool)

(declare-fun res!231628 () Bool)

(assert (=> b!402206 (=> (not res!231628) (not e!242370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402206 (= res!231628 (validMask!0 mask!1025))))

(declare-fun b!402207 () Bool)

(assert (=> b!402207 (= e!242369 (= call!28339 call!28340))))

(declare-fun b!402208 () Bool)

(assert (=> b!402208 (= e!242365 (not true))))

(assert (=> b!402208 e!242369))

(assert (=> b!402208 (= c!54794 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12176 0))(
  ( (Unit!12177) )
))
(declare-fun lt!187901 () Unit!12176)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!346 (array!24119 array!24121 (_ BitVec 32) (_ BitVec 32) V!14581 V!14581 (_ BitVec 32) (_ BitVec 64) V!14581 (_ BitVec 32) Int) Unit!12176)

(assert (=> b!402208 (= lt!187901 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!346 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402201 () Bool)

(declare-fun res!231622 () Bool)

(assert (=> b!402201 (=> (not res!231622) (not e!242370))))

(declare-fun arrayContainsKey!0 (array!24119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402201 (= res!231622 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!231630 () Bool)

(assert (=> start!38688 (=> (not res!231630) (not e!242370))))

(assert (=> start!38688 (= res!231630 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11861 _keys!709))))))

(assert (=> start!38688 e!242370))

(assert (=> start!38688 tp_is_empty!10107))

(assert (=> start!38688 tp!32799))

(assert (=> start!38688 true))

(declare-fun array_inv!8422 (array!24121) Bool)

(assert (=> start!38688 (and (array_inv!8422 _values!549) e!242368)))

(declare-fun array_inv!8423 (array!24119) Bool)

(assert (=> start!38688 (array_inv!8423 _keys!709)))

(declare-fun b!402209 () Bool)

(declare-fun res!231632 () Bool)

(assert (=> b!402209 (=> (not res!231632) (not e!242365))))

(declare-datatypes ((List!6694 0))(
  ( (Nil!6691) (Cons!6690 (h!7546 (_ BitVec 64)) (t!11868 List!6694)) )
))
(declare-fun arrayNoDuplicates!0 (array!24119 (_ BitVec 32) List!6694) Bool)

(assert (=> b!402209 (= res!231632 (arrayNoDuplicates!0 lt!187900 #b00000000000000000000000000000000 Nil!6691))))

(declare-fun b!402210 () Bool)

(declare-fun res!231623 () Bool)

(assert (=> b!402210 (=> (not res!231623) (not e!242370))))

(assert (=> b!402210 (= res!231623 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6691))))

(declare-fun b!402211 () Bool)

(assert (=> b!402211 (= e!242367 tp_is_empty!10107)))

(declare-fun bm!28337 () Bool)

(assert (=> bm!28337 (= call!28339 (getCurrentListMapNoExtraKeys!1068 (ite c!54794 _keys!709 lt!187900) (ite c!54794 _values!549 (array!24122 (store (arr!11510 _values!549) i!563 (ValueCellFull!4710 v!412)) (size!11862 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402212 () Bool)

(declare-fun res!231633 () Bool)

(assert (=> b!402212 (=> (not res!231633) (not e!242370))))

(assert (=> b!402212 (= res!231633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38688 res!231630) b!402206))

(assert (= (and b!402206 res!231628) b!402200))

(assert (= (and b!402200 res!231625) b!402212))

(assert (= (and b!402212 res!231633) b!402210))

(assert (= (and b!402210 res!231623) b!402198))

(assert (= (and b!402198 res!231624) b!402205))

(assert (= (and b!402205 res!231627) b!402202))

(assert (= (and b!402202 res!231631) b!402201))

(assert (= (and b!402201 res!231622) b!402203))

(assert (= (and b!402203 res!231626) b!402209))

(assert (= (and b!402209 res!231632) b!402196))

(assert (= (and b!402196 res!231629) b!402208))

(assert (= (and b!402208 c!54794) b!402197))

(assert (= (and b!402208 (not c!54794)) b!402207))

(assert (= (or b!402197 b!402207) bm!28336))

(assert (= (or b!402197 b!402207) bm!28337))

(assert (= (and b!402199 condMapEmpty!16782) mapIsEmpty!16782))

(assert (= (and b!402199 (not condMapEmpty!16782)) mapNonEmpty!16782))

(get-info :version)

(assert (= (and mapNonEmpty!16782 ((_ is ValueCellFull!4710) mapValue!16782)) b!402204))

(assert (= (and b!402199 ((_ is ValueCellFull!4710) mapDefault!16782)) b!402211))

(assert (= start!38688 b!402199))

(declare-fun m!395801 () Bool)

(assert (=> mapNonEmpty!16782 m!395801))

(declare-fun m!395803 () Bool)

(assert (=> start!38688 m!395803))

(declare-fun m!395805 () Bool)

(assert (=> start!38688 m!395805))

(declare-fun m!395807 () Bool)

(assert (=> b!402203 m!395807))

(declare-fun m!395809 () Bool)

(assert (=> b!402203 m!395809))

(declare-fun m!395811 () Bool)

(assert (=> b!402208 m!395811))

(declare-fun m!395813 () Bool)

(assert (=> b!402212 m!395813))

(declare-fun m!395815 () Bool)

(assert (=> b!402197 m!395815))

(declare-fun m!395817 () Bool)

(assert (=> b!402209 m!395817))

(declare-fun m!395819 () Bool)

(assert (=> b!402205 m!395819))

(declare-fun m!395821 () Bool)

(assert (=> bm!28337 m!395821))

(declare-fun m!395823 () Bool)

(assert (=> bm!28337 m!395823))

(assert (=> bm!28336 m!395821))

(declare-fun m!395825 () Bool)

(assert (=> bm!28336 m!395825))

(declare-fun m!395827 () Bool)

(assert (=> b!402202 m!395827))

(declare-fun m!395829 () Bool)

(assert (=> b!402206 m!395829))

(declare-fun m!395831 () Bool)

(assert (=> b!402201 m!395831))

(declare-fun m!395833 () Bool)

(assert (=> b!402210 m!395833))

(check-sat tp_is_empty!10107 (not start!38688) (not b!402206) (not b!402205) (not b!402210) (not mapNonEmpty!16782) (not b!402197) (not b_next!9225) (not b!402212) (not b!402203) (not b!402209) (not b!402208) b_and!16611 (not bm!28337) (not b!402201) (not bm!28336))
(check-sat b_and!16611 (not b_next!9225))
