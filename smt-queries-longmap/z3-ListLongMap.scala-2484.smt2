; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38708 () Bool)

(assert start!38708)

(declare-fun b_free!9259 () Bool)

(declare-fun b_next!9259 () Bool)

(assert (=> start!38708 (= b_free!9259 (not b_next!9259))))

(declare-fun tp!32901 () Bool)

(declare-fun b_and!16659 () Bool)

(assert (=> start!38708 (= tp!32901 b_and!16659)))

(declare-fun b!403014 () Bool)

(declare-fun e!242689 () Bool)

(declare-fun tp_is_empty!10141 () Bool)

(assert (=> b!403014 (= e!242689 tp_is_empty!10141)))

(declare-fun b!403015 () Bool)

(declare-fun e!242694 () Bool)

(declare-datatypes ((V!14627 0))(
  ( (V!14628 (val!5115 Int)) )
))
(declare-datatypes ((tuple2!6666 0))(
  ( (tuple2!6667 (_1!3344 (_ BitVec 64)) (_2!3344 V!14627)) )
))
(declare-datatypes ((List!6587 0))(
  ( (Nil!6584) (Cons!6583 (h!7439 tuple2!6666) (t!11753 List!6587)) )
))
(declare-datatypes ((ListLongMap!5581 0))(
  ( (ListLongMap!5582 (toList!2806 List!6587)) )
))
(declare-fun call!28428 () ListLongMap!5581)

(declare-fun call!28429 () ListLongMap!5581)

(assert (=> b!403015 (= e!242694 (= call!28428 call!28429))))

(declare-fun mapIsEmpty!16833 () Bool)

(declare-fun mapRes!16833 () Bool)

(assert (=> mapIsEmpty!16833 mapRes!16833))

(declare-fun b!403016 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14627)

(declare-fun +!1147 (ListLongMap!5581 tuple2!6666) ListLongMap!5581)

(assert (=> b!403016 (= e!242694 (= call!28429 (+!1147 call!28428 (tuple2!6667 k0!794 v!412))))))

(declare-fun b!403017 () Bool)

(declare-fun e!242690 () Bool)

(declare-fun e!242691 () Bool)

(assert (=> b!403017 (= e!242690 (and e!242691 mapRes!16833))))

(declare-fun condMapEmpty!16833 () Bool)

(declare-datatypes ((ValueCell!4727 0))(
  ( (ValueCellFull!4727 (v!7363 V!14627)) (EmptyCell!4727) )
))
(declare-datatypes ((array!24166 0))(
  ( (array!24167 (arr!11532 (Array (_ BitVec 32) ValueCell!4727)) (size!11884 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24166)

(declare-fun mapDefault!16833 () ValueCell!4727)

(assert (=> b!403017 (= condMapEmpty!16833 (= (arr!11532 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4727)) mapDefault!16833)))))

(declare-fun b!403018 () Bool)

(declare-fun res!232233 () Bool)

(declare-fun e!242693 () Bool)

(assert (=> b!403018 (=> (not res!232233) (not e!242693))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24168 0))(
  ( (array!24169 (arr!11533 (Array (_ BitVec 32) (_ BitVec 64))) (size!11885 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24168)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!403018 (= res!232233 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11885 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403019 () Bool)

(declare-fun e!242692 () Bool)

(assert (=> b!403019 (= e!242692 e!242693)))

(declare-fun res!232231 () Bool)

(assert (=> b!403019 (=> (not res!232231) (not e!242693))))

(declare-fun lt!188022 () array!24168)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24168 (_ BitVec 32)) Bool)

(assert (=> b!403019 (= res!232231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188022 mask!1025))))

(assert (=> b!403019 (= lt!188022 (array!24169 (store (arr!11533 _keys!709) i!563 k0!794) (size!11885 _keys!709)))))

(declare-fun b!403020 () Bool)

(declare-fun res!232240 () Bool)

(assert (=> b!403020 (=> (not res!232240) (not e!242692))))

(declare-fun arrayContainsKey!0 (array!24168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403020 (= res!232240 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16833 () Bool)

(declare-fun tp!32900 () Bool)

(assert (=> mapNonEmpty!16833 (= mapRes!16833 (and tp!32900 e!242689))))

(declare-fun mapKey!16833 () (_ BitVec 32))

(declare-fun mapValue!16833 () ValueCell!4727)

(declare-fun mapRest!16833 () (Array (_ BitVec 32) ValueCell!4727))

(assert (=> mapNonEmpty!16833 (= (arr!11532 _values!549) (store mapRest!16833 mapKey!16833 mapValue!16833))))

(declare-fun b!403021 () Bool)

(declare-fun res!232238 () Bool)

(assert (=> b!403021 (=> (not res!232238) (not e!242692))))

(assert (=> b!403021 (= res!232238 (or (= (select (arr!11533 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11533 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!232236 () Bool)

(assert (=> start!38708 (=> (not res!232236) (not e!242692))))

(assert (=> start!38708 (= res!232236 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11885 _keys!709))))))

(assert (=> start!38708 e!242692))

(assert (=> start!38708 tp_is_empty!10141))

(assert (=> start!38708 tp!32901))

(assert (=> start!38708 true))

(declare-fun array_inv!8516 (array!24166) Bool)

(assert (=> start!38708 (and (array_inv!8516 _values!549) e!242690)))

(declare-fun array_inv!8517 (array!24168) Bool)

(assert (=> start!38708 (array_inv!8517 _keys!709)))

(declare-fun b!403022 () Bool)

(declare-fun res!232237 () Bool)

(assert (=> b!403022 (=> (not res!232237) (not e!242693))))

(declare-datatypes ((List!6588 0))(
  ( (Nil!6585) (Cons!6584 (h!7440 (_ BitVec 64)) (t!11754 List!6588)) )
))
(declare-fun arrayNoDuplicates!0 (array!24168 (_ BitVec 32) List!6588) Bool)

(assert (=> b!403022 (= res!232237 (arrayNoDuplicates!0 lt!188022 #b00000000000000000000000000000000 Nil!6585))))

(declare-fun b!403023 () Bool)

(declare-fun res!232242 () Bool)

(assert (=> b!403023 (=> (not res!232242) (not e!242692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403023 (= res!232242 (validKeyInArray!0 k0!794))))

(declare-fun c!54822 () Bool)

(declare-fun minValue!515 () V!14627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14627)

(declare-fun bm!28425 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1060 (array!24168 array!24166 (_ BitVec 32) (_ BitVec 32) V!14627 V!14627 (_ BitVec 32) Int) ListLongMap!5581)

(assert (=> bm!28425 (= call!28428 (getCurrentListMapNoExtraKeys!1060 (ite c!54822 _keys!709 lt!188022) (ite c!54822 _values!549 (array!24167 (store (arr!11532 _values!549) i!563 (ValueCellFull!4727 v!412)) (size!11884 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28426 () Bool)

(assert (=> bm!28426 (= call!28429 (getCurrentListMapNoExtraKeys!1060 (ite c!54822 lt!188022 _keys!709) (ite c!54822 (array!24167 (store (arr!11532 _values!549) i!563 (ValueCellFull!4727 v!412)) (size!11884 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403024 () Bool)

(declare-fun res!232239 () Bool)

(assert (=> b!403024 (=> (not res!232239) (not e!242692))))

(assert (=> b!403024 (= res!232239 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11885 _keys!709))))))

(declare-fun b!403025 () Bool)

(assert (=> b!403025 (= e!242693 (not true))))

(assert (=> b!403025 e!242694))

(assert (=> b!403025 (= c!54822 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12183 0))(
  ( (Unit!12184) )
))
(declare-fun lt!188021 () Unit!12183)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!359 (array!24168 array!24166 (_ BitVec 32) (_ BitVec 32) V!14627 V!14627 (_ BitVec 32) (_ BitVec 64) V!14627 (_ BitVec 32) Int) Unit!12183)

(assert (=> b!403025 (= lt!188021 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!359 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403026 () Bool)

(declare-fun res!232235 () Bool)

(assert (=> b!403026 (=> (not res!232235) (not e!242692))))

(assert (=> b!403026 (= res!232235 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6585))))

(declare-fun b!403027 () Bool)

(assert (=> b!403027 (= e!242691 tp_is_empty!10141)))

(declare-fun b!403028 () Bool)

(declare-fun res!232234 () Bool)

(assert (=> b!403028 (=> (not res!232234) (not e!242692))))

(assert (=> b!403028 (= res!232234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403029 () Bool)

(declare-fun res!232232 () Bool)

(assert (=> b!403029 (=> (not res!232232) (not e!242692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403029 (= res!232232 (validMask!0 mask!1025))))

(declare-fun b!403030 () Bool)

(declare-fun res!232241 () Bool)

(assert (=> b!403030 (=> (not res!232241) (not e!242692))))

(assert (=> b!403030 (= res!232241 (and (= (size!11884 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11885 _keys!709) (size!11884 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38708 res!232236) b!403029))

(assert (= (and b!403029 res!232232) b!403030))

(assert (= (and b!403030 res!232241) b!403028))

(assert (= (and b!403028 res!232234) b!403026))

(assert (= (and b!403026 res!232235) b!403024))

(assert (= (and b!403024 res!232239) b!403023))

(assert (= (and b!403023 res!232242) b!403021))

(assert (= (and b!403021 res!232238) b!403020))

(assert (= (and b!403020 res!232240) b!403019))

(assert (= (and b!403019 res!232231) b!403022))

(assert (= (and b!403022 res!232237) b!403018))

(assert (= (and b!403018 res!232233) b!403025))

(assert (= (and b!403025 c!54822) b!403016))

(assert (= (and b!403025 (not c!54822)) b!403015))

(assert (= (or b!403016 b!403015) bm!28426))

(assert (= (or b!403016 b!403015) bm!28425))

(assert (= (and b!403017 condMapEmpty!16833) mapIsEmpty!16833))

(assert (= (and b!403017 (not condMapEmpty!16833)) mapNonEmpty!16833))

(get-info :version)

(assert (= (and mapNonEmpty!16833 ((_ is ValueCellFull!4727) mapValue!16833)) b!403014))

(assert (= (and b!403017 ((_ is ValueCellFull!4727) mapDefault!16833)) b!403027))

(assert (= start!38708 b!403017))

(declare-fun m!396609 () Bool)

(assert (=> b!403026 m!396609))

(declare-fun m!396611 () Bool)

(assert (=> b!403022 m!396611))

(declare-fun m!396613 () Bool)

(assert (=> b!403016 m!396613))

(declare-fun m!396615 () Bool)

(assert (=> mapNonEmpty!16833 m!396615))

(declare-fun m!396617 () Bool)

(assert (=> b!403023 m!396617))

(declare-fun m!396619 () Bool)

(assert (=> b!403029 m!396619))

(declare-fun m!396621 () Bool)

(assert (=> start!38708 m!396621))

(declare-fun m!396623 () Bool)

(assert (=> start!38708 m!396623))

(declare-fun m!396625 () Bool)

(assert (=> b!403020 m!396625))

(declare-fun m!396627 () Bool)

(assert (=> b!403025 m!396627))

(declare-fun m!396629 () Bool)

(assert (=> b!403028 m!396629))

(declare-fun m!396631 () Bool)

(assert (=> b!403021 m!396631))

(declare-fun m!396633 () Bool)

(assert (=> bm!28425 m!396633))

(declare-fun m!396635 () Bool)

(assert (=> bm!28425 m!396635))

(assert (=> bm!28426 m!396633))

(declare-fun m!396637 () Bool)

(assert (=> bm!28426 m!396637))

(declare-fun m!396639 () Bool)

(assert (=> b!403019 m!396639))

(declare-fun m!396641 () Bool)

(assert (=> b!403019 m!396641))

(check-sat (not b!403023) (not b_next!9259) (not start!38708) (not b!403016) (not b!403026) (not bm!28426) b_and!16659 (not b!403025) (not b!403022) (not b!403020) (not mapNonEmpty!16833) (not bm!28425) (not b!403019) (not b!403029) tp_is_empty!10141 (not b!403028))
(check-sat b_and!16659 (not b_next!9259))
