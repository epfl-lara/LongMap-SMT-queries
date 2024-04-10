; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38736 () Bool)

(assert start!38736)

(declare-fun b_free!9273 () Bool)

(declare-fun b_next!9273 () Bool)

(assert (=> start!38736 (= b_free!9273 (not b_next!9273))))

(declare-fun tp!32943 () Bool)

(declare-fun b_and!16659 () Bool)

(assert (=> start!38736 (= tp!32943 b_and!16659)))

(declare-fun b!403420 () Bool)

(declare-fun res!232493 () Bool)

(declare-fun e!242873 () Bool)

(assert (=> b!403420 (=> (not res!232493) (not e!242873))))

(declare-datatypes ((array!24209 0))(
  ( (array!24210 (arr!11554 (Array (_ BitVec 32) (_ BitVec 64))) (size!11906 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24209)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403420 (= res!232493 (or (= (select (arr!11554 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11554 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16854 () Bool)

(declare-fun mapRes!16854 () Bool)

(assert (=> mapIsEmpty!16854 mapRes!16854))

(declare-fun b!403421 () Bool)

(declare-fun res!232494 () Bool)

(assert (=> b!403421 (=> (not res!232494) (not e!242873))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403421 (= res!232494 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403422 () Bool)

(declare-fun e!242870 () Bool)

(declare-fun tp_is_empty!10155 () Bool)

(assert (=> b!403422 (= e!242870 tp_is_empty!10155)))

(declare-datatypes ((V!14645 0))(
  ( (V!14646 (val!5122 Int)) )
))
(declare-fun minValue!515 () V!14645)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!188045 () array!24209)

(declare-datatypes ((ValueCell!4734 0))(
  ( (ValueCellFull!4734 (v!7369 V!14645)) (EmptyCell!4734) )
))
(declare-datatypes ((array!24211 0))(
  ( (array!24212 (arr!11555 (Array (_ BitVec 32) ValueCell!4734)) (size!11907 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24211)

(declare-fun zeroValue!515 () V!14645)

(declare-fun c!54866 () Bool)

(declare-datatypes ((tuple2!6806 0))(
  ( (tuple2!6807 (_1!3414 (_ BitVec 64)) (_2!3414 V!14645)) )
))
(declare-datatypes ((List!6725 0))(
  ( (Nil!6722) (Cons!6721 (h!7577 tuple2!6806) (t!11899 List!6725)) )
))
(declare-datatypes ((ListLongMap!5719 0))(
  ( (ListLongMap!5720 (toList!2875 List!6725)) )
))
(declare-fun call!28484 () ListLongMap!5719)

(declare-fun v!412 () V!14645)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28480 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1084 (array!24209 array!24211 (_ BitVec 32) (_ BitVec 32) V!14645 V!14645 (_ BitVec 32) Int) ListLongMap!5719)

(assert (=> bm!28480 (= call!28484 (getCurrentListMapNoExtraKeys!1084 (ite c!54866 lt!188045 _keys!709) (ite c!54866 (array!24212 (store (arr!11555 _values!549) i!563 (ValueCellFull!4734 v!412)) (size!11907 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403423 () Bool)

(declare-fun res!232497 () Bool)

(assert (=> b!403423 (=> (not res!232497) (not e!242873))))

(declare-datatypes ((List!6726 0))(
  ( (Nil!6723) (Cons!6722 (h!7578 (_ BitVec 64)) (t!11900 List!6726)) )
))
(declare-fun arrayNoDuplicates!0 (array!24209 (_ BitVec 32) List!6726) Bool)

(assert (=> b!403423 (= res!232497 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6723))))

(declare-fun b!403424 () Bool)

(declare-fun e!242869 () Bool)

(declare-fun call!28483 () ListLongMap!5719)

(assert (=> b!403424 (= e!242869 (= call!28483 call!28484))))

(declare-fun b!403425 () Bool)

(declare-fun e!242871 () Bool)

(assert (=> b!403425 (= e!242871 (not true))))

(assert (=> b!403425 e!242869))

(assert (=> b!403425 (= c!54866 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12204 0))(
  ( (Unit!12205) )
))
(declare-fun lt!188044 () Unit!12204)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!360 (array!24209 array!24211 (_ BitVec 32) (_ BitVec 32) V!14645 V!14645 (_ BitVec 32) (_ BitVec 64) V!14645 (_ BitVec 32) Int) Unit!12204)

(assert (=> b!403425 (= lt!188044 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!360 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!232490 () Bool)

(assert (=> start!38736 (=> (not res!232490) (not e!242873))))

(assert (=> start!38736 (= res!232490 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11906 _keys!709))))))

(assert (=> start!38736 e!242873))

(assert (=> start!38736 tp_is_empty!10155))

(assert (=> start!38736 tp!32943))

(assert (=> start!38736 true))

(declare-fun e!242874 () Bool)

(declare-fun array_inv!8452 (array!24211) Bool)

(assert (=> start!38736 (and (array_inv!8452 _values!549) e!242874)))

(declare-fun array_inv!8453 (array!24209) Bool)

(assert (=> start!38736 (array_inv!8453 _keys!709)))

(declare-fun b!403426 () Bool)

(declare-fun res!232496 () Bool)

(assert (=> b!403426 (=> (not res!232496) (not e!242873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403426 (= res!232496 (validKeyInArray!0 k0!794))))

(declare-fun b!403427 () Bool)

(declare-fun res!232495 () Bool)

(assert (=> b!403427 (=> (not res!232495) (not e!242873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403427 (= res!232495 (validMask!0 mask!1025))))

(declare-fun b!403428 () Bool)

(declare-fun res!232491 () Bool)

(assert (=> b!403428 (=> (not res!232491) (not e!242873))))

(assert (=> b!403428 (= res!232491 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11906 _keys!709))))))

(declare-fun b!403429 () Bool)

(declare-fun res!232488 () Bool)

(assert (=> b!403429 (=> (not res!232488) (not e!242873))))

(assert (=> b!403429 (= res!232488 (and (= (size!11907 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11906 _keys!709) (size!11907 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403430 () Bool)

(declare-fun e!242872 () Bool)

(assert (=> b!403430 (= e!242874 (and e!242872 mapRes!16854))))

(declare-fun condMapEmpty!16854 () Bool)

(declare-fun mapDefault!16854 () ValueCell!4734)

(assert (=> b!403430 (= condMapEmpty!16854 (= (arr!11555 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4734)) mapDefault!16854)))))

(declare-fun b!403431 () Bool)

(assert (=> b!403431 (= e!242872 tp_is_empty!10155)))

(declare-fun b!403432 () Bool)

(declare-fun res!232489 () Bool)

(assert (=> b!403432 (=> (not res!232489) (not e!242871))))

(assert (=> b!403432 (= res!232489 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11906 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403433 () Bool)

(declare-fun res!232487 () Bool)

(assert (=> b!403433 (=> (not res!232487) (not e!242871))))

(assert (=> b!403433 (= res!232487 (arrayNoDuplicates!0 lt!188045 #b00000000000000000000000000000000 Nil!6723))))

(declare-fun b!403434 () Bool)

(declare-fun +!1150 (ListLongMap!5719 tuple2!6806) ListLongMap!5719)

(assert (=> b!403434 (= e!242869 (= call!28484 (+!1150 call!28483 (tuple2!6807 k0!794 v!412))))))

(declare-fun mapNonEmpty!16854 () Bool)

(declare-fun tp!32942 () Bool)

(assert (=> mapNonEmpty!16854 (= mapRes!16854 (and tp!32942 e!242870))))

(declare-fun mapKey!16854 () (_ BitVec 32))

(declare-fun mapRest!16854 () (Array (_ BitVec 32) ValueCell!4734))

(declare-fun mapValue!16854 () ValueCell!4734)

(assert (=> mapNonEmpty!16854 (= (arr!11555 _values!549) (store mapRest!16854 mapKey!16854 mapValue!16854))))

(declare-fun b!403435 () Bool)

(declare-fun res!232486 () Bool)

(assert (=> b!403435 (=> (not res!232486) (not e!242873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24209 (_ BitVec 32)) Bool)

(assert (=> b!403435 (= res!232486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28481 () Bool)

(assert (=> bm!28481 (= call!28483 (getCurrentListMapNoExtraKeys!1084 (ite c!54866 _keys!709 lt!188045) (ite c!54866 _values!549 (array!24212 (store (arr!11555 _values!549) i!563 (ValueCellFull!4734 v!412)) (size!11907 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403436 () Bool)

(assert (=> b!403436 (= e!242873 e!242871)))

(declare-fun res!232492 () Bool)

(assert (=> b!403436 (=> (not res!232492) (not e!242871))))

(assert (=> b!403436 (= res!232492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188045 mask!1025))))

(assert (=> b!403436 (= lt!188045 (array!24210 (store (arr!11554 _keys!709) i!563 k0!794) (size!11906 _keys!709)))))

(assert (= (and start!38736 res!232490) b!403427))

(assert (= (and b!403427 res!232495) b!403429))

(assert (= (and b!403429 res!232488) b!403435))

(assert (= (and b!403435 res!232486) b!403423))

(assert (= (and b!403423 res!232497) b!403428))

(assert (= (and b!403428 res!232491) b!403426))

(assert (= (and b!403426 res!232496) b!403420))

(assert (= (and b!403420 res!232493) b!403421))

(assert (= (and b!403421 res!232494) b!403436))

(assert (= (and b!403436 res!232492) b!403433))

(assert (= (and b!403433 res!232487) b!403432))

(assert (= (and b!403432 res!232489) b!403425))

(assert (= (and b!403425 c!54866) b!403434))

(assert (= (and b!403425 (not c!54866)) b!403424))

(assert (= (or b!403434 b!403424) bm!28480))

(assert (= (or b!403434 b!403424) bm!28481))

(assert (= (and b!403430 condMapEmpty!16854) mapIsEmpty!16854))

(assert (= (and b!403430 (not condMapEmpty!16854)) mapNonEmpty!16854))

(get-info :version)

(assert (= (and mapNonEmpty!16854 ((_ is ValueCellFull!4734) mapValue!16854)) b!403422))

(assert (= (and b!403430 ((_ is ValueCellFull!4734) mapDefault!16854)) b!403431))

(assert (= start!38736 b!403430))

(declare-fun m!396617 () Bool)

(assert (=> b!403433 m!396617))

(declare-fun m!396619 () Bool)

(assert (=> b!403427 m!396619))

(declare-fun m!396621 () Bool)

(assert (=> start!38736 m!396621))

(declare-fun m!396623 () Bool)

(assert (=> start!38736 m!396623))

(declare-fun m!396625 () Bool)

(assert (=> b!403436 m!396625))

(declare-fun m!396627 () Bool)

(assert (=> b!403436 m!396627))

(declare-fun m!396629 () Bool)

(assert (=> bm!28480 m!396629))

(declare-fun m!396631 () Bool)

(assert (=> bm!28480 m!396631))

(declare-fun m!396633 () Bool)

(assert (=> b!403426 m!396633))

(declare-fun m!396635 () Bool)

(assert (=> b!403421 m!396635))

(assert (=> bm!28481 m!396629))

(declare-fun m!396637 () Bool)

(assert (=> bm!28481 m!396637))

(declare-fun m!396639 () Bool)

(assert (=> b!403435 m!396639))

(declare-fun m!396641 () Bool)

(assert (=> b!403434 m!396641))

(declare-fun m!396643 () Bool)

(assert (=> b!403425 m!396643))

(declare-fun m!396645 () Bool)

(assert (=> b!403420 m!396645))

(declare-fun m!396647 () Bool)

(assert (=> b!403423 m!396647))

(declare-fun m!396649 () Bool)

(assert (=> mapNonEmpty!16854 m!396649))

(check-sat (not b!403433) (not b!403421) (not bm!28481) (not b_next!9273) (not b!403436) (not b!403426) (not start!38736) (not b!403435) tp_is_empty!10155 (not b!403434) b_and!16659 (not b!403425) (not b!403423) (not mapNonEmpty!16854) (not bm!28480) (not b!403427))
(check-sat b_and!16659 (not b_next!9273))
