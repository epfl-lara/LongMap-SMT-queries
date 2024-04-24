; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38720 () Bool)

(assert start!38720)

(declare-fun b_free!9271 () Bool)

(declare-fun b_next!9271 () Bool)

(assert (=> start!38720 (= b_free!9271 (not b_next!9271))))

(declare-fun tp!32936 () Bool)

(declare-fun b_and!16671 () Bool)

(assert (=> start!38720 (= tp!32936 b_and!16671)))

(declare-fun b!403320 () Bool)

(declare-fun res!232457 () Bool)

(declare-fun e!242817 () Bool)

(assert (=> b!403320 (=> (not res!232457) (not e!242817))))

(declare-datatypes ((array!24190 0))(
  ( (array!24191 (arr!11544 (Array (_ BitVec 32) (_ BitVec 64))) (size!11896 (_ BitVec 32))) )
))
(declare-fun lt!188057 () array!24190)

(declare-datatypes ((List!6598 0))(
  ( (Nil!6595) (Cons!6594 (h!7450 (_ BitVec 64)) (t!11764 List!6598)) )
))
(declare-fun arrayNoDuplicates!0 (array!24190 (_ BitVec 32) List!6598) Bool)

(assert (=> b!403320 (= res!232457 (arrayNoDuplicates!0 lt!188057 #b00000000000000000000000000000000 Nil!6595))))

(declare-fun b!403321 () Bool)

(declare-fun e!242818 () Bool)

(declare-fun e!242816 () Bool)

(declare-fun mapRes!16851 () Bool)

(assert (=> b!403321 (= e!242818 (and e!242816 mapRes!16851))))

(declare-fun condMapEmpty!16851 () Bool)

(declare-datatypes ((V!14643 0))(
  ( (V!14644 (val!5121 Int)) )
))
(declare-datatypes ((ValueCell!4733 0))(
  ( (ValueCellFull!4733 (v!7369 V!14643)) (EmptyCell!4733) )
))
(declare-datatypes ((array!24192 0))(
  ( (array!24193 (arr!11545 (Array (_ BitVec 32) ValueCell!4733)) (size!11897 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24192)

(declare-fun mapDefault!16851 () ValueCell!4733)

(assert (=> b!403321 (= condMapEmpty!16851 (= (arr!11545 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4733)) mapDefault!16851)))))

(declare-fun b!403322 () Bool)

(assert (=> b!403322 (= e!242817 (not true))))

(declare-fun e!242819 () Bool)

(assert (=> b!403322 e!242819))

(declare-fun c!54840 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403322 (= c!54840 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12193 0))(
  ( (Unit!12194) )
))
(declare-fun lt!188058 () Unit!12193)

(declare-fun minValue!515 () V!14643)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14643)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24190)

(declare-fun v!412 () V!14643)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!364 (array!24190 array!24192 (_ BitVec 32) (_ BitVec 32) V!14643 V!14643 (_ BitVec 32) (_ BitVec 64) V!14643 (_ BitVec 32) Int) Unit!12193)

(assert (=> b!403322 (= lt!188058 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403323 () Bool)

(declare-fun e!242815 () Bool)

(declare-fun tp_is_empty!10153 () Bool)

(assert (=> b!403323 (= e!242815 tp_is_empty!10153)))

(declare-fun b!403324 () Bool)

(declare-fun res!232448 () Bool)

(declare-fun e!242821 () Bool)

(assert (=> b!403324 (=> (not res!232448) (not e!242821))))

(assert (=> b!403324 (= res!232448 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6595))))

(declare-fun b!403325 () Bool)

(declare-fun res!232453 () Bool)

(assert (=> b!403325 (=> (not res!232453) (not e!242821))))

(assert (=> b!403325 (= res!232453 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11896 _keys!709))))))

(declare-datatypes ((tuple2!6678 0))(
  ( (tuple2!6679 (_1!3350 (_ BitVec 64)) (_2!3350 V!14643)) )
))
(declare-datatypes ((List!6599 0))(
  ( (Nil!6596) (Cons!6595 (h!7451 tuple2!6678) (t!11765 List!6599)) )
))
(declare-datatypes ((ListLongMap!5593 0))(
  ( (ListLongMap!5594 (toList!2812 List!6599)) )
))
(declare-fun call!28465 () ListLongMap!5593)

(declare-fun call!28464 () ListLongMap!5593)

(declare-fun b!403326 () Bool)

(declare-fun +!1151 (ListLongMap!5593 tuple2!6678) ListLongMap!5593)

(assert (=> b!403326 (= e!242819 (= call!28464 (+!1151 call!28465 (tuple2!6679 k0!794 v!412))))))

(declare-fun bm!28461 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1065 (array!24190 array!24192 (_ BitVec 32) (_ BitVec 32) V!14643 V!14643 (_ BitVec 32) Int) ListLongMap!5593)

(assert (=> bm!28461 (= call!28464 (getCurrentListMapNoExtraKeys!1065 (ite c!54840 lt!188057 _keys!709) (ite c!54840 (array!24193 (store (arr!11545 _values!549) i!563 (ValueCellFull!4733 v!412)) (size!11897 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403327 () Bool)

(declare-fun res!232447 () Bool)

(assert (=> b!403327 (=> (not res!232447) (not e!242821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403327 (= res!232447 (validMask!0 mask!1025))))

(declare-fun b!403328 () Bool)

(declare-fun res!232456 () Bool)

(assert (=> b!403328 (=> (not res!232456) (not e!242821))))

(assert (=> b!403328 (= res!232456 (or (= (select (arr!11544 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11544 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403329 () Bool)

(declare-fun res!232455 () Bool)

(assert (=> b!403329 (=> (not res!232455) (not e!242821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403329 (= res!232455 (validKeyInArray!0 k0!794))))

(declare-fun b!403330 () Bool)

(assert (=> b!403330 (= e!242819 (= call!28465 call!28464))))

(declare-fun res!232454 () Bool)

(assert (=> start!38720 (=> (not res!232454) (not e!242821))))

(assert (=> start!38720 (= res!232454 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11896 _keys!709))))))

(assert (=> start!38720 e!242821))

(assert (=> start!38720 tp_is_empty!10153))

(assert (=> start!38720 tp!32936))

(assert (=> start!38720 true))

(declare-fun array_inv!8526 (array!24192) Bool)

(assert (=> start!38720 (and (array_inv!8526 _values!549) e!242818)))

(declare-fun array_inv!8527 (array!24190) Bool)

(assert (=> start!38720 (array_inv!8527 _keys!709)))

(declare-fun b!403331 () Bool)

(declare-fun res!232449 () Bool)

(assert (=> b!403331 (=> (not res!232449) (not e!242821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24190 (_ BitVec 32)) Bool)

(assert (=> b!403331 (= res!232449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403332 () Bool)

(assert (=> b!403332 (= e!242821 e!242817)))

(declare-fun res!232450 () Bool)

(assert (=> b!403332 (=> (not res!232450) (not e!242817))))

(assert (=> b!403332 (= res!232450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188057 mask!1025))))

(assert (=> b!403332 (= lt!188057 (array!24191 (store (arr!11544 _keys!709) i!563 k0!794) (size!11896 _keys!709)))))

(declare-fun b!403333 () Bool)

(assert (=> b!403333 (= e!242816 tp_is_empty!10153)))

(declare-fun bm!28462 () Bool)

(assert (=> bm!28462 (= call!28465 (getCurrentListMapNoExtraKeys!1065 (ite c!54840 _keys!709 lt!188057) (ite c!54840 _values!549 (array!24193 (store (arr!11545 _values!549) i!563 (ValueCellFull!4733 v!412)) (size!11897 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16851 () Bool)

(assert (=> mapIsEmpty!16851 mapRes!16851))

(declare-fun b!403334 () Bool)

(declare-fun res!232452 () Bool)

(assert (=> b!403334 (=> (not res!232452) (not e!242821))))

(declare-fun arrayContainsKey!0 (array!24190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403334 (= res!232452 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403335 () Bool)

(declare-fun res!232458 () Bool)

(assert (=> b!403335 (=> (not res!232458) (not e!242821))))

(assert (=> b!403335 (= res!232458 (and (= (size!11897 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11896 _keys!709) (size!11897 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403336 () Bool)

(declare-fun res!232451 () Bool)

(assert (=> b!403336 (=> (not res!232451) (not e!242817))))

(assert (=> b!403336 (= res!232451 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11896 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16851 () Bool)

(declare-fun tp!32937 () Bool)

(assert (=> mapNonEmpty!16851 (= mapRes!16851 (and tp!32937 e!242815))))

(declare-fun mapKey!16851 () (_ BitVec 32))

(declare-fun mapValue!16851 () ValueCell!4733)

(declare-fun mapRest!16851 () (Array (_ BitVec 32) ValueCell!4733))

(assert (=> mapNonEmpty!16851 (= (arr!11545 _values!549) (store mapRest!16851 mapKey!16851 mapValue!16851))))

(assert (= (and start!38720 res!232454) b!403327))

(assert (= (and b!403327 res!232447) b!403335))

(assert (= (and b!403335 res!232458) b!403331))

(assert (= (and b!403331 res!232449) b!403324))

(assert (= (and b!403324 res!232448) b!403325))

(assert (= (and b!403325 res!232453) b!403329))

(assert (= (and b!403329 res!232455) b!403328))

(assert (= (and b!403328 res!232456) b!403334))

(assert (= (and b!403334 res!232452) b!403332))

(assert (= (and b!403332 res!232450) b!403320))

(assert (= (and b!403320 res!232457) b!403336))

(assert (= (and b!403336 res!232451) b!403322))

(assert (= (and b!403322 c!54840) b!403326))

(assert (= (and b!403322 (not c!54840)) b!403330))

(assert (= (or b!403326 b!403330) bm!28461))

(assert (= (or b!403326 b!403330) bm!28462))

(assert (= (and b!403321 condMapEmpty!16851) mapIsEmpty!16851))

(assert (= (and b!403321 (not condMapEmpty!16851)) mapNonEmpty!16851))

(get-info :version)

(assert (= (and mapNonEmpty!16851 ((_ is ValueCellFull!4733) mapValue!16851)) b!403323))

(assert (= (and b!403321 ((_ is ValueCellFull!4733) mapDefault!16851)) b!403333))

(assert (= start!38720 b!403321))

(declare-fun m!396813 () Bool)

(assert (=> mapNonEmpty!16851 m!396813))

(declare-fun m!396815 () Bool)

(assert (=> b!403326 m!396815))

(declare-fun m!396817 () Bool)

(assert (=> b!403324 m!396817))

(declare-fun m!396819 () Bool)

(assert (=> b!403322 m!396819))

(declare-fun m!396821 () Bool)

(assert (=> b!403327 m!396821))

(declare-fun m!396823 () Bool)

(assert (=> b!403329 m!396823))

(declare-fun m!396825 () Bool)

(assert (=> b!403334 m!396825))

(declare-fun m!396827 () Bool)

(assert (=> b!403332 m!396827))

(declare-fun m!396829 () Bool)

(assert (=> b!403332 m!396829))

(declare-fun m!396831 () Bool)

(assert (=> start!38720 m!396831))

(declare-fun m!396833 () Bool)

(assert (=> start!38720 m!396833))

(declare-fun m!396835 () Bool)

(assert (=> b!403320 m!396835))

(declare-fun m!396837 () Bool)

(assert (=> bm!28462 m!396837))

(declare-fun m!396839 () Bool)

(assert (=> bm!28462 m!396839))

(assert (=> bm!28461 m!396837))

(declare-fun m!396841 () Bool)

(assert (=> bm!28461 m!396841))

(declare-fun m!396843 () Bool)

(assert (=> b!403328 m!396843))

(declare-fun m!396845 () Bool)

(assert (=> b!403331 m!396845))

(check-sat tp_is_empty!10153 (not b!403322) (not b!403327) (not b!403332) (not mapNonEmpty!16851) b_and!16671 (not b_next!9271) (not b!403326) (not b!403329) (not b!403334) (not bm!28461) (not b!403331) (not b!403320) (not b!403324) (not start!38720) (not bm!28462))
(check-sat b_and!16671 (not b_next!9271))
