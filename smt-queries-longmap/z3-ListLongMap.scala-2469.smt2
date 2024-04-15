; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38618 () Bool)

(assert start!38618)

(declare-fun b_free!9169 () Bool)

(declare-fun b_next!9169 () Bool)

(assert (=> start!38618 (= b_free!9169 (not b_next!9169))))

(declare-fun tp!32630 () Bool)

(declare-fun b_and!16529 () Bool)

(assert (=> start!38618 (= tp!32630 b_and!16529)))

(declare-fun mapIsEmpty!16698 () Bool)

(declare-fun mapRes!16698 () Bool)

(assert (=> mapIsEmpty!16698 mapRes!16698))

(declare-fun b!400497 () Bool)

(declare-fun e!241606 () Bool)

(declare-fun tp_is_empty!10051 () Bool)

(assert (=> b!400497 (= e!241606 tp_is_empty!10051)))

(declare-fun b!400498 () Bool)

(declare-fun res!230486 () Bool)

(declare-fun e!241607 () Bool)

(assert (=> b!400498 (=> (not res!230486) (not e!241607))))

(declare-datatypes ((array!23989 0))(
  ( (array!23990 (arr!11444 (Array (_ BitVec 32) (_ BitVec 64))) (size!11797 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23989)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23989 (_ BitVec 32)) Bool)

(assert (=> b!400498 (= res!230486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400499 () Bool)

(declare-fun res!230489 () Bool)

(assert (=> b!400499 (=> (not res!230489) (not e!241607))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400499 (= res!230489 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11797 _keys!709))))))

(declare-fun b!400500 () Bool)

(declare-fun e!241608 () Bool)

(assert (=> b!400500 (= e!241608 tp_is_empty!10051)))

(declare-fun mapNonEmpty!16698 () Bool)

(declare-fun tp!32631 () Bool)

(assert (=> mapNonEmpty!16698 (= mapRes!16698 (and tp!32631 e!241606))))

(declare-fun mapKey!16698 () (_ BitVec 32))

(declare-datatypes ((V!14507 0))(
  ( (V!14508 (val!5070 Int)) )
))
(declare-datatypes ((ValueCell!4682 0))(
  ( (ValueCellFull!4682 (v!7311 V!14507)) (EmptyCell!4682) )
))
(declare-fun mapValue!16698 () ValueCell!4682)

(declare-datatypes ((array!23991 0))(
  ( (array!23992 (arr!11445 (Array (_ BitVec 32) ValueCell!4682)) (size!11798 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23991)

(declare-fun mapRest!16698 () (Array (_ BitVec 32) ValueCell!4682))

(assert (=> mapNonEmpty!16698 (= (arr!11445 _values!549) (store mapRest!16698 mapKey!16698 mapValue!16698))))

(declare-fun b!400502 () Bool)

(declare-fun res!230496 () Bool)

(assert (=> b!400502 (=> (not res!230496) (not e!241607))))

(declare-datatypes ((List!6607 0))(
  ( (Nil!6604) (Cons!6603 (h!7459 (_ BitVec 64)) (t!11772 List!6607)) )
))
(declare-fun arrayNoDuplicates!0 (array!23989 (_ BitVec 32) List!6607) Bool)

(assert (=> b!400502 (= res!230496 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6604))))

(declare-fun b!400503 () Bool)

(declare-fun res!230495 () Bool)

(assert (=> b!400503 (=> (not res!230495) (not e!241607))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!400503 (= res!230495 (and (= (size!11798 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11797 _keys!709) (size!11798 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400504 () Bool)

(declare-fun res!230490 () Bool)

(assert (=> b!400504 (=> (not res!230490) (not e!241607))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400504 (= res!230490 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400505 () Bool)

(declare-fun res!230485 () Bool)

(assert (=> b!400505 (=> (not res!230485) (not e!241607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400505 (= res!230485 (validKeyInArray!0 k0!794))))

(declare-fun b!400506 () Bool)

(declare-fun e!241604 () Bool)

(declare-datatypes ((tuple2!6700 0))(
  ( (tuple2!6701 (_1!3361 (_ BitVec 64)) (_2!3361 V!14507)) )
))
(declare-datatypes ((List!6608 0))(
  ( (Nil!6605) (Cons!6604 (h!7460 tuple2!6700) (t!11773 List!6608)) )
))
(declare-datatypes ((ListLongMap!5603 0))(
  ( (ListLongMap!5604 (toList!2817 List!6608)) )
))
(declare-fun call!28146 () ListLongMap!5603)

(declare-fun call!28147 () ListLongMap!5603)

(assert (=> b!400506 (= e!241604 (= call!28146 call!28147))))

(declare-fun b!400507 () Bool)

(declare-fun v!412 () V!14507)

(declare-fun +!1127 (ListLongMap!5603 tuple2!6700) ListLongMap!5603)

(assert (=> b!400507 (= e!241604 (= call!28147 (+!1127 call!28146 (tuple2!6701 k0!794 v!412))))))

(declare-fun b!400508 () Bool)

(declare-fun e!241602 () Bool)

(assert (=> b!400508 (= e!241602 (and e!241608 mapRes!16698))))

(declare-fun condMapEmpty!16698 () Bool)

(declare-fun mapDefault!16698 () ValueCell!4682)

(assert (=> b!400508 (= condMapEmpty!16698 (= (arr!11445 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4682)) mapDefault!16698)))))

(declare-fun b!400509 () Bool)

(declare-fun res!230492 () Bool)

(declare-fun e!241605 () Bool)

(assert (=> b!400509 (=> (not res!230492) (not e!241605))))

(declare-fun lt!187499 () array!23989)

(assert (=> b!400509 (= res!230492 (arrayNoDuplicates!0 lt!187499 #b00000000000000000000000000000000 Nil!6604))))

(declare-fun b!400501 () Bool)

(assert (=> b!400501 (= e!241605 (not true))))

(assert (=> b!400501 e!241604))

(declare-fun c!54639 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400501 (= c!54639 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14507)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14507)

(declare-datatypes ((Unit!12110 0))(
  ( (Unit!12111) )
))
(declare-fun lt!187498 () Unit!12110)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!318 (array!23989 array!23991 (_ BitVec 32) (_ BitVec 32) V!14507 V!14507 (_ BitVec 32) (_ BitVec 64) V!14507 (_ BitVec 32) Int) Unit!12110)

(assert (=> b!400501 (= lt!187498 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!318 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!230487 () Bool)

(assert (=> start!38618 (=> (not res!230487) (not e!241607))))

(assert (=> start!38618 (= res!230487 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11797 _keys!709))))))

(assert (=> start!38618 e!241607))

(assert (=> start!38618 tp_is_empty!10051))

(assert (=> start!38618 tp!32630))

(assert (=> start!38618 true))

(declare-fun array_inv!8396 (array!23991) Bool)

(assert (=> start!38618 (and (array_inv!8396 _values!549) e!241602)))

(declare-fun array_inv!8397 (array!23989) Bool)

(assert (=> start!38618 (array_inv!8397 _keys!709)))

(declare-fun b!400510 () Bool)

(declare-fun res!230494 () Bool)

(assert (=> b!400510 (=> (not res!230494) (not e!241607))))

(assert (=> b!400510 (= res!230494 (or (= (select (arr!11444 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11444 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400511 () Bool)

(assert (=> b!400511 (= e!241607 e!241605)))

(declare-fun res!230491 () Bool)

(assert (=> b!400511 (=> (not res!230491) (not e!241605))))

(assert (=> b!400511 (= res!230491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187499 mask!1025))))

(assert (=> b!400511 (= lt!187499 (array!23990 (store (arr!11444 _keys!709) i!563 k0!794) (size!11797 _keys!709)))))

(declare-fun b!400512 () Bool)

(declare-fun res!230488 () Bool)

(assert (=> b!400512 (=> (not res!230488) (not e!241607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400512 (= res!230488 (validMask!0 mask!1025))))

(declare-fun bm!28143 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1035 (array!23989 array!23991 (_ BitVec 32) (_ BitVec 32) V!14507 V!14507 (_ BitVec 32) Int) ListLongMap!5603)

(assert (=> bm!28143 (= call!28146 (getCurrentListMapNoExtraKeys!1035 (ite c!54639 _keys!709 lt!187499) (ite c!54639 _values!549 (array!23992 (store (arr!11445 _values!549) i!563 (ValueCellFull!4682 v!412)) (size!11798 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28144 () Bool)

(assert (=> bm!28144 (= call!28147 (getCurrentListMapNoExtraKeys!1035 (ite c!54639 lt!187499 _keys!709) (ite c!54639 (array!23992 (store (arr!11445 _values!549) i!563 (ValueCellFull!4682 v!412)) (size!11798 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400513 () Bool)

(declare-fun res!230493 () Bool)

(assert (=> b!400513 (=> (not res!230493) (not e!241605))))

(assert (=> b!400513 (= res!230493 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11797 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38618 res!230487) b!400512))

(assert (= (and b!400512 res!230488) b!400503))

(assert (= (and b!400503 res!230495) b!400498))

(assert (= (and b!400498 res!230486) b!400502))

(assert (= (and b!400502 res!230496) b!400499))

(assert (= (and b!400499 res!230489) b!400505))

(assert (= (and b!400505 res!230485) b!400510))

(assert (= (and b!400510 res!230494) b!400504))

(assert (= (and b!400504 res!230490) b!400511))

(assert (= (and b!400511 res!230491) b!400509))

(assert (= (and b!400509 res!230492) b!400513))

(assert (= (and b!400513 res!230493) b!400501))

(assert (= (and b!400501 c!54639) b!400507))

(assert (= (and b!400501 (not c!54639)) b!400506))

(assert (= (or b!400507 b!400506) bm!28144))

(assert (= (or b!400507 b!400506) bm!28143))

(assert (= (and b!400508 condMapEmpty!16698) mapIsEmpty!16698))

(assert (= (and b!400508 (not condMapEmpty!16698)) mapNonEmpty!16698))

(get-info :version)

(assert (= (and mapNonEmpty!16698 ((_ is ValueCellFull!4682) mapValue!16698)) b!400497))

(assert (= (and b!400508 ((_ is ValueCellFull!4682) mapDefault!16698)) b!400500))

(assert (= start!38618 b!400508))

(declare-fun m!394125 () Bool)

(assert (=> b!400512 m!394125))

(declare-fun m!394127 () Bool)

(assert (=> b!400511 m!394127))

(declare-fun m!394129 () Bool)

(assert (=> b!400511 m!394129))

(declare-fun m!394131 () Bool)

(assert (=> start!38618 m!394131))

(declare-fun m!394133 () Bool)

(assert (=> start!38618 m!394133))

(declare-fun m!394135 () Bool)

(assert (=> b!400501 m!394135))

(declare-fun m!394137 () Bool)

(assert (=> b!400507 m!394137))

(declare-fun m!394139 () Bool)

(assert (=> b!400504 m!394139))

(declare-fun m!394141 () Bool)

(assert (=> b!400505 m!394141))

(declare-fun m!394143 () Bool)

(assert (=> b!400509 m!394143))

(declare-fun m!394145 () Bool)

(assert (=> bm!28143 m!394145))

(declare-fun m!394147 () Bool)

(assert (=> bm!28143 m!394147))

(declare-fun m!394149 () Bool)

(assert (=> b!400498 m!394149))

(assert (=> bm!28144 m!394145))

(declare-fun m!394151 () Bool)

(assert (=> bm!28144 m!394151))

(declare-fun m!394153 () Bool)

(assert (=> b!400502 m!394153))

(declare-fun m!394155 () Bool)

(assert (=> b!400510 m!394155))

(declare-fun m!394157 () Bool)

(assert (=> mapNonEmpty!16698 m!394157))

(check-sat (not bm!28143) (not b_next!9169) (not b!400511) (not b!400509) (not b!400502) (not b!400505) (not b!400512) (not b!400501) (not mapNonEmpty!16698) (not b!400498) (not b!400507) tp_is_empty!10051 (not bm!28144) (not start!38618) b_and!16529 (not b!400504))
(check-sat b_and!16529 (not b_next!9169))
