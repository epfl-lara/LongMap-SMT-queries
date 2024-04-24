; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38696 () Bool)

(assert start!38696)

(declare-fun b_free!9247 () Bool)

(declare-fun b_next!9247 () Bool)

(assert (=> start!38696 (= b_free!9247 (not b_next!9247))))

(declare-fun tp!32864 () Bool)

(declare-fun b_and!16647 () Bool)

(assert (=> start!38696 (= tp!32864 b_and!16647)))

(declare-datatypes ((V!14611 0))(
  ( (V!14612 (val!5109 Int)) )
))
(declare-fun minValue!515 () V!14611)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4721 0))(
  ( (ValueCellFull!4721 (v!7357 V!14611)) (EmptyCell!4721) )
))
(declare-datatypes ((array!24142 0))(
  ( (array!24143 (arr!11520 (Array (_ BitVec 32) ValueCell!4721)) (size!11872 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24142)

(declare-datatypes ((array!24144 0))(
  ( (array!24145 (arr!11521 (Array (_ BitVec 32) (_ BitVec 64))) (size!11873 (_ BitVec 32))) )
))
(declare-fun lt!187985 () array!24144)

(declare-fun bm!28389 () Bool)

(declare-fun zeroValue!515 () V!14611)

(declare-fun c!54804 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!6654 0))(
  ( (tuple2!6655 (_1!3338 (_ BitVec 64)) (_2!3338 V!14611)) )
))
(declare-datatypes ((List!6576 0))(
  ( (Nil!6573) (Cons!6572 (h!7428 tuple2!6654) (t!11742 List!6576)) )
))
(declare-datatypes ((ListLongMap!5569 0))(
  ( (ListLongMap!5570 (toList!2800 List!6576)) )
))
(declare-fun call!28393 () ListLongMap!5569)

(declare-fun v!412 () V!14611)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24144)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1054 (array!24144 array!24142 (_ BitVec 32) (_ BitVec 32) V!14611 V!14611 (_ BitVec 32) Int) ListLongMap!5569)

(assert (=> bm!28389 (= call!28393 (getCurrentListMapNoExtraKeys!1054 (ite c!54804 lt!187985 _keys!709) (ite c!54804 (array!24143 (store (arr!11520 _values!549) i!563 (ValueCellFull!4721 v!412)) (size!11872 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402708 () Bool)

(declare-fun res!232025 () Bool)

(declare-fun e!242563 () Bool)

(assert (=> b!402708 (=> (not res!232025) (not e!242563))))

(assert (=> b!402708 (= res!232025 (and (= (size!11872 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11873 _keys!709) (size!11872 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402709 () Bool)

(declare-fun res!232019 () Bool)

(assert (=> b!402709 (=> (not res!232019) (not e!242563))))

(declare-datatypes ((List!6577 0))(
  ( (Nil!6574) (Cons!6573 (h!7429 (_ BitVec 64)) (t!11743 List!6577)) )
))
(declare-fun arrayNoDuplicates!0 (array!24144 (_ BitVec 32) List!6577) Bool)

(assert (=> b!402709 (= res!232019 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6574))))

(declare-fun b!402710 () Bool)

(declare-fun e!242568 () Bool)

(declare-fun tp_is_empty!10129 () Bool)

(assert (=> b!402710 (= e!242568 tp_is_empty!10129)))

(declare-fun b!402712 () Bool)

(declare-fun res!232017 () Bool)

(declare-fun e!242565 () Bool)

(assert (=> b!402712 (=> (not res!232017) (not e!242565))))

(assert (=> b!402712 (= res!232017 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11873 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402713 () Bool)

(declare-fun res!232015 () Bool)

(assert (=> b!402713 (=> (not res!232015) (not e!242563))))

(assert (=> b!402713 (= res!232015 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11873 _keys!709))))))

(declare-fun b!402714 () Bool)

(declare-fun res!232016 () Bool)

(assert (=> b!402714 (=> (not res!232016) (not e!242563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402714 (= res!232016 (validKeyInArray!0 k0!794))))

(declare-fun call!28392 () ListLongMap!5569)

(declare-fun bm!28390 () Bool)

(assert (=> bm!28390 (= call!28392 (getCurrentListMapNoExtraKeys!1054 (ite c!54804 _keys!709 lt!187985) (ite c!54804 _values!549 (array!24143 (store (arr!11520 _values!549) i!563 (ValueCellFull!4721 v!412)) (size!11872 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402715 () Bool)

(declare-fun res!232020 () Bool)

(assert (=> b!402715 (=> (not res!232020) (not e!242565))))

(assert (=> b!402715 (= res!232020 (arrayNoDuplicates!0 lt!187985 #b00000000000000000000000000000000 Nil!6574))))

(declare-fun b!402716 () Bool)

(declare-fun res!232024 () Bool)

(assert (=> b!402716 (=> (not res!232024) (not e!242563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402716 (= res!232024 (validMask!0 mask!1025))))

(declare-fun b!402717 () Bool)

(declare-fun res!232022 () Bool)

(assert (=> b!402717 (=> (not res!232022) (not e!242563))))

(declare-fun arrayContainsKey!0 (array!24144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402717 (= res!232022 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402711 () Bool)

(assert (=> b!402711 (= e!242565 (not true))))

(declare-fun e!242567 () Bool)

(assert (=> b!402711 e!242567))

(assert (=> b!402711 (= c!54804 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12173 0))(
  ( (Unit!12174) )
))
(declare-fun lt!187986 () Unit!12173)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!354 (array!24144 array!24142 (_ BitVec 32) (_ BitVec 32) V!14611 V!14611 (_ BitVec 32) (_ BitVec 64) V!14611 (_ BitVec 32) Int) Unit!12173)

(assert (=> b!402711 (= lt!187986 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!354 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!232023 () Bool)

(assert (=> start!38696 (=> (not res!232023) (not e!242563))))

(assert (=> start!38696 (= res!232023 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11873 _keys!709))))))

(assert (=> start!38696 e!242563))

(assert (=> start!38696 tp_is_empty!10129))

(assert (=> start!38696 tp!32864))

(assert (=> start!38696 true))

(declare-fun e!242569 () Bool)

(declare-fun array_inv!8506 (array!24142) Bool)

(assert (=> start!38696 (and (array_inv!8506 _values!549) e!242569)))

(declare-fun array_inv!8507 (array!24144) Bool)

(assert (=> start!38696 (array_inv!8507 _keys!709)))

(declare-fun b!402718 () Bool)

(declare-fun +!1142 (ListLongMap!5569 tuple2!6654) ListLongMap!5569)

(assert (=> b!402718 (= e!242567 (= call!28393 (+!1142 call!28392 (tuple2!6655 k0!794 v!412))))))

(declare-fun mapIsEmpty!16815 () Bool)

(declare-fun mapRes!16815 () Bool)

(assert (=> mapIsEmpty!16815 mapRes!16815))

(declare-fun b!402719 () Bool)

(declare-fun e!242566 () Bool)

(assert (=> b!402719 (= e!242569 (and e!242566 mapRes!16815))))

(declare-fun condMapEmpty!16815 () Bool)

(declare-fun mapDefault!16815 () ValueCell!4721)

(assert (=> b!402719 (= condMapEmpty!16815 (= (arr!11520 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4721)) mapDefault!16815)))))

(declare-fun b!402720 () Bool)

(declare-fun res!232018 () Bool)

(assert (=> b!402720 (=> (not res!232018) (not e!242563))))

(assert (=> b!402720 (= res!232018 (or (= (select (arr!11521 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11521 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402721 () Bool)

(assert (=> b!402721 (= e!242563 e!242565)))

(declare-fun res!232026 () Bool)

(assert (=> b!402721 (=> (not res!232026) (not e!242565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24144 (_ BitVec 32)) Bool)

(assert (=> b!402721 (= res!232026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187985 mask!1025))))

(assert (=> b!402721 (= lt!187985 (array!24145 (store (arr!11521 _keys!709) i!563 k0!794) (size!11873 _keys!709)))))

(declare-fun b!402722 () Bool)

(declare-fun res!232021 () Bool)

(assert (=> b!402722 (=> (not res!232021) (not e!242563))))

(assert (=> b!402722 (= res!232021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402723 () Bool)

(assert (=> b!402723 (= e!242567 (= call!28392 call!28393))))

(declare-fun mapNonEmpty!16815 () Bool)

(declare-fun tp!32865 () Bool)

(assert (=> mapNonEmpty!16815 (= mapRes!16815 (and tp!32865 e!242568))))

(declare-fun mapKey!16815 () (_ BitVec 32))

(declare-fun mapRest!16815 () (Array (_ BitVec 32) ValueCell!4721))

(declare-fun mapValue!16815 () ValueCell!4721)

(assert (=> mapNonEmpty!16815 (= (arr!11520 _values!549) (store mapRest!16815 mapKey!16815 mapValue!16815))))

(declare-fun b!402724 () Bool)

(assert (=> b!402724 (= e!242566 tp_is_empty!10129)))

(assert (= (and start!38696 res!232023) b!402716))

(assert (= (and b!402716 res!232024) b!402708))

(assert (= (and b!402708 res!232025) b!402722))

(assert (= (and b!402722 res!232021) b!402709))

(assert (= (and b!402709 res!232019) b!402713))

(assert (= (and b!402713 res!232015) b!402714))

(assert (= (and b!402714 res!232016) b!402720))

(assert (= (and b!402720 res!232018) b!402717))

(assert (= (and b!402717 res!232022) b!402721))

(assert (= (and b!402721 res!232026) b!402715))

(assert (= (and b!402715 res!232020) b!402712))

(assert (= (and b!402712 res!232017) b!402711))

(assert (= (and b!402711 c!54804) b!402718))

(assert (= (and b!402711 (not c!54804)) b!402723))

(assert (= (or b!402718 b!402723) bm!28389))

(assert (= (or b!402718 b!402723) bm!28390))

(assert (= (and b!402719 condMapEmpty!16815) mapIsEmpty!16815))

(assert (= (and b!402719 (not condMapEmpty!16815)) mapNonEmpty!16815))

(get-info :version)

(assert (= (and mapNonEmpty!16815 ((_ is ValueCellFull!4721) mapValue!16815)) b!402710))

(assert (= (and b!402719 ((_ is ValueCellFull!4721) mapDefault!16815)) b!402724))

(assert (= start!38696 b!402719))

(declare-fun m!396405 () Bool)

(assert (=> b!402714 m!396405))

(declare-fun m!396407 () Bool)

(assert (=> b!402721 m!396407))

(declare-fun m!396409 () Bool)

(assert (=> b!402721 m!396409))

(declare-fun m!396411 () Bool)

(assert (=> b!402717 m!396411))

(declare-fun m!396413 () Bool)

(assert (=> bm!28389 m!396413))

(declare-fun m!396415 () Bool)

(assert (=> bm!28389 m!396415))

(declare-fun m!396417 () Bool)

(assert (=> b!402709 m!396417))

(declare-fun m!396419 () Bool)

(assert (=> b!402722 m!396419))

(declare-fun m!396421 () Bool)

(assert (=> start!38696 m!396421))

(declare-fun m!396423 () Bool)

(assert (=> start!38696 m!396423))

(declare-fun m!396425 () Bool)

(assert (=> b!402711 m!396425))

(declare-fun m!396427 () Bool)

(assert (=> b!402716 m!396427))

(declare-fun m!396429 () Bool)

(assert (=> b!402720 m!396429))

(declare-fun m!396431 () Bool)

(assert (=> mapNonEmpty!16815 m!396431))

(declare-fun m!396433 () Bool)

(assert (=> b!402718 m!396433))

(declare-fun m!396435 () Bool)

(assert (=> b!402715 m!396435))

(assert (=> bm!28390 m!396413))

(declare-fun m!396437 () Bool)

(assert (=> bm!28390 m!396437))

(check-sat (not b_next!9247) (not b!402718) (not b!402717) (not mapNonEmpty!16815) (not b!402714) (not bm!28389) (not b!402722) (not b!402709) (not b!402716) (not start!38696) (not b!402711) (not b!402721) b_and!16647 (not b!402715) (not bm!28390) tp_is_empty!10129)
(check-sat b_and!16647 (not b_next!9247))
