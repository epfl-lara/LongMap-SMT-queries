; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38594 () Bool)

(assert start!38594)

(declare-fun b_free!9145 () Bool)

(declare-fun b_next!9145 () Bool)

(assert (=> start!38594 (= b_free!9145 (not b_next!9145))))

(declare-fun tp!32559 () Bool)

(declare-fun b_and!16545 () Bool)

(assert (=> start!38594 (= tp!32559 b_and!16545)))

(declare-fun b!400107 () Bool)

(declare-fun e!241497 () Bool)

(declare-fun tp_is_empty!10027 () Bool)

(assert (=> b!400107 (= e!241497 tp_is_empty!10027)))

(declare-datatypes ((V!14475 0))(
  ( (V!14476 (val!5058 Int)) )
))
(declare-datatypes ((tuple2!6566 0))(
  ( (tuple2!6567 (_1!3294 (_ BitVec 64)) (_2!3294 V!14475)) )
))
(declare-datatypes ((List!6486 0))(
  ( (Nil!6483) (Cons!6482 (h!7338 tuple2!6566) (t!11652 List!6486)) )
))
(declare-datatypes ((ListLongMap!5481 0))(
  ( (ListLongMap!5482 (toList!2756 List!6486)) )
))
(declare-fun call!28087 () ListLongMap!5481)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!400108 () Bool)

(declare-fun call!28086 () ListLongMap!5481)

(declare-fun e!241493 () Bool)

(declare-fun v!412 () V!14475)

(declare-fun +!1103 (ListLongMap!5481 tuple2!6566) ListLongMap!5481)

(assert (=> b!400108 (= e!241493 (= call!28087 (+!1103 call!28086 (tuple2!6567 k0!794 v!412))))))

(declare-fun b!400109 () Bool)

(declare-fun res!230188 () Bool)

(declare-fun e!241498 () Bool)

(assert (=> b!400109 (=> (not res!230188) (not e!241498))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23940 0))(
  ( (array!23941 (arr!11419 (Array (_ BitVec 32) (_ BitVec 64))) (size!11771 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23940)

(assert (=> b!400109 (= res!230188 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11771 _keys!709))))))

(declare-fun mapIsEmpty!16662 () Bool)

(declare-fun mapRes!16662 () Bool)

(assert (=> mapIsEmpty!16662 mapRes!16662))

(declare-fun b!400110 () Bool)

(declare-fun res!230182 () Bool)

(assert (=> b!400110 (=> (not res!230182) (not e!241498))))

(declare-datatypes ((ValueCell!4670 0))(
  ( (ValueCellFull!4670 (v!7306 V!14475)) (EmptyCell!4670) )
))
(declare-datatypes ((array!23942 0))(
  ( (array!23943 (arr!11420 (Array (_ BitVec 32) ValueCell!4670)) (size!11772 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23942)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!400110 (= res!230182 (and (= (size!11772 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11771 _keys!709) (size!11772 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400111 () Bool)

(declare-fun res!230181 () Bool)

(assert (=> b!400111 (=> (not res!230181) (not e!241498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400111 (= res!230181 (validMask!0 mask!1025))))

(declare-fun b!400112 () Bool)

(declare-fun e!241496 () Bool)

(assert (=> b!400112 (= e!241496 (not true))))

(assert (=> b!400112 e!241493))

(declare-fun c!54651 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400112 (= c!54651 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14475)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12095 0))(
  ( (Unit!12096) )
))
(declare-fun lt!187679 () Unit!12095)

(declare-fun zeroValue!515 () V!14475)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!315 (array!23940 array!23942 (_ BitVec 32) (_ BitVec 32) V!14475 V!14475 (_ BitVec 32) (_ BitVec 64) V!14475 (_ BitVec 32) Int) Unit!12095)

(assert (=> b!400112 (= lt!187679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!315 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16662 () Bool)

(declare-fun tp!32558 () Bool)

(declare-fun e!241495 () Bool)

(assert (=> mapNonEmpty!16662 (= mapRes!16662 (and tp!32558 e!241495))))

(declare-fun mapValue!16662 () ValueCell!4670)

(declare-fun mapRest!16662 () (Array (_ BitVec 32) ValueCell!4670))

(declare-fun mapKey!16662 () (_ BitVec 32))

(assert (=> mapNonEmpty!16662 (= (arr!11420 _values!549) (store mapRest!16662 mapKey!16662 mapValue!16662))))

(declare-fun bm!28083 () Bool)

(declare-fun lt!187680 () array!23940)

(declare-fun getCurrentListMapNoExtraKeys!1014 (array!23940 array!23942 (_ BitVec 32) (_ BitVec 32) V!14475 V!14475 (_ BitVec 32) Int) ListLongMap!5481)

(assert (=> bm!28083 (= call!28087 (getCurrentListMapNoExtraKeys!1014 (ite c!54651 lt!187680 _keys!709) (ite c!54651 (array!23943 (store (arr!11420 _values!549) i!563 (ValueCellFull!4670 v!412)) (size!11772 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400114 () Bool)

(assert (=> b!400114 (= e!241493 (= call!28086 call!28087))))

(declare-fun b!400115 () Bool)

(declare-fun res!230186 () Bool)

(assert (=> b!400115 (=> (not res!230186) (not e!241498))))

(declare-fun arrayContainsKey!0 (array!23940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400115 (= res!230186 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400116 () Bool)

(declare-fun res!230189 () Bool)

(assert (=> b!400116 (=> (not res!230189) (not e!241498))))

(assert (=> b!400116 (= res!230189 (or (= (select (arr!11419 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11419 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28084 () Bool)

(assert (=> bm!28084 (= call!28086 (getCurrentListMapNoExtraKeys!1014 (ite c!54651 _keys!709 lt!187680) (ite c!54651 _values!549 (array!23943 (store (arr!11420 _values!549) i!563 (ValueCellFull!4670 v!412)) (size!11772 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400117 () Bool)

(declare-fun res!230184 () Bool)

(assert (=> b!400117 (=> (not res!230184) (not e!241496))))

(declare-datatypes ((List!6487 0))(
  ( (Nil!6484) (Cons!6483 (h!7339 (_ BitVec 64)) (t!11653 List!6487)) )
))
(declare-fun arrayNoDuplicates!0 (array!23940 (_ BitVec 32) List!6487) Bool)

(assert (=> b!400117 (= res!230184 (arrayNoDuplicates!0 lt!187680 #b00000000000000000000000000000000 Nil!6484))))

(declare-fun b!400118 () Bool)

(declare-fun res!230183 () Bool)

(assert (=> b!400118 (=> (not res!230183) (not e!241498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23940 (_ BitVec 32)) Bool)

(assert (=> b!400118 (= res!230183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400119 () Bool)

(assert (=> b!400119 (= e!241495 tp_is_empty!10027)))

(declare-fun b!400120 () Bool)

(declare-fun res!230187 () Bool)

(assert (=> b!400120 (=> (not res!230187) (not e!241496))))

(assert (=> b!400120 (= res!230187 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11771 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400121 () Bool)

(assert (=> b!400121 (= e!241498 e!241496)))

(declare-fun res!230190 () Bool)

(assert (=> b!400121 (=> (not res!230190) (not e!241496))))

(assert (=> b!400121 (= res!230190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187680 mask!1025))))

(assert (=> b!400121 (= lt!187680 (array!23941 (store (arr!11419 _keys!709) i!563 k0!794) (size!11771 _keys!709)))))

(declare-fun res!230179 () Bool)

(assert (=> start!38594 (=> (not res!230179) (not e!241498))))

(assert (=> start!38594 (= res!230179 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11771 _keys!709))))))

(assert (=> start!38594 e!241498))

(assert (=> start!38594 tp_is_empty!10027))

(assert (=> start!38594 tp!32559))

(assert (=> start!38594 true))

(declare-fun e!241494 () Bool)

(declare-fun array_inv!8436 (array!23942) Bool)

(assert (=> start!38594 (and (array_inv!8436 _values!549) e!241494)))

(declare-fun array_inv!8437 (array!23940) Bool)

(assert (=> start!38594 (array_inv!8437 _keys!709)))

(declare-fun b!400113 () Bool)

(assert (=> b!400113 (= e!241494 (and e!241497 mapRes!16662))))

(declare-fun condMapEmpty!16662 () Bool)

(declare-fun mapDefault!16662 () ValueCell!4670)

(assert (=> b!400113 (= condMapEmpty!16662 (= (arr!11420 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4670)) mapDefault!16662)))))

(declare-fun b!400122 () Bool)

(declare-fun res!230180 () Bool)

(assert (=> b!400122 (=> (not res!230180) (not e!241498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400122 (= res!230180 (validKeyInArray!0 k0!794))))

(declare-fun b!400123 () Bool)

(declare-fun res!230185 () Bool)

(assert (=> b!400123 (=> (not res!230185) (not e!241498))))

(assert (=> b!400123 (= res!230185 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6484))))

(assert (= (and start!38594 res!230179) b!400111))

(assert (= (and b!400111 res!230181) b!400110))

(assert (= (and b!400110 res!230182) b!400118))

(assert (= (and b!400118 res!230183) b!400123))

(assert (= (and b!400123 res!230185) b!400109))

(assert (= (and b!400109 res!230188) b!400122))

(assert (= (and b!400122 res!230180) b!400116))

(assert (= (and b!400116 res!230189) b!400115))

(assert (= (and b!400115 res!230186) b!400121))

(assert (= (and b!400121 res!230190) b!400117))

(assert (= (and b!400117 res!230184) b!400120))

(assert (= (and b!400120 res!230187) b!400112))

(assert (= (and b!400112 c!54651) b!400108))

(assert (= (and b!400112 (not c!54651)) b!400114))

(assert (= (or b!400108 b!400114) bm!28083))

(assert (= (or b!400108 b!400114) bm!28084))

(assert (= (and b!400113 condMapEmpty!16662) mapIsEmpty!16662))

(assert (= (and b!400113 (not condMapEmpty!16662)) mapNonEmpty!16662))

(get-info :version)

(assert (= (and mapNonEmpty!16662 ((_ is ValueCellFull!4670) mapValue!16662)) b!400119))

(assert (= (and b!400113 ((_ is ValueCellFull!4670) mapDefault!16662)) b!400107))

(assert (= start!38594 b!400113))

(declare-fun m!394671 () Bool)

(assert (=> b!400121 m!394671))

(declare-fun m!394673 () Bool)

(assert (=> b!400121 m!394673))

(declare-fun m!394675 () Bool)

(assert (=> b!400111 m!394675))

(declare-fun m!394677 () Bool)

(assert (=> b!400123 m!394677))

(declare-fun m!394679 () Bool)

(assert (=> b!400108 m!394679))

(declare-fun m!394681 () Bool)

(assert (=> start!38594 m!394681))

(declare-fun m!394683 () Bool)

(assert (=> start!38594 m!394683))

(declare-fun m!394685 () Bool)

(assert (=> b!400116 m!394685))

(declare-fun m!394687 () Bool)

(assert (=> b!400118 m!394687))

(declare-fun m!394689 () Bool)

(assert (=> b!400122 m!394689))

(declare-fun m!394691 () Bool)

(assert (=> mapNonEmpty!16662 m!394691))

(declare-fun m!394693 () Bool)

(assert (=> bm!28083 m!394693))

(declare-fun m!394695 () Bool)

(assert (=> bm!28083 m!394695))

(declare-fun m!394697 () Bool)

(assert (=> b!400115 m!394697))

(declare-fun m!394699 () Bool)

(assert (=> b!400117 m!394699))

(declare-fun m!394701 () Bool)

(assert (=> b!400112 m!394701))

(assert (=> bm!28084 m!394693))

(declare-fun m!394703 () Bool)

(assert (=> bm!28084 m!394703))

(check-sat (not bm!28083) (not b!400108) (not b_next!9145) (not b!400123) (not b!400122) (not start!38594) (not b!400121) (not mapNonEmpty!16662) (not b!400111) tp_is_empty!10027 (not b!400117) (not b!400118) (not b!400115) b_and!16545 (not bm!28084) (not b!400112))
(check-sat b_and!16545 (not b_next!9145))
