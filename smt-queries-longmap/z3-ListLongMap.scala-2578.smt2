; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39272 () Bool)

(assert start!39272)

(declare-fun b_free!9553 () Bool)

(declare-fun b_next!9553 () Bool)

(assert (=> start!39272 (= b_free!9553 (not b_next!9553))))

(declare-fun tp!34188 () Bool)

(declare-fun b_and!16995 () Bool)

(assert (=> start!39272 (= tp!34188 b_and!16995)))

(declare-fun b!415552 () Bool)

(declare-fun res!241801 () Bool)

(declare-fun e!248191 () Bool)

(assert (=> b!415552 (=> (not res!241801) (not e!248191))))

(declare-datatypes ((array!25270 0))(
  ( (array!25271 (arr!12084 (Array (_ BitVec 32) (_ BitVec 64))) (size!12436 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25270)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415552 (= res!241801 (or (= (select (arr!12084 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12084 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415553 () Bool)

(declare-fun res!241804 () Bool)

(declare-fun e!248185 () Bool)

(assert (=> b!415553 (=> (not res!241804) (not e!248185))))

(declare-fun lt!190314 () array!25270)

(declare-datatypes ((List!6924 0))(
  ( (Nil!6921) (Cons!6920 (h!7776 (_ BitVec 64)) (t!12134 List!6924)) )
))
(declare-fun arrayNoDuplicates!0 (array!25270 (_ BitVec 32) List!6924) Bool)

(assert (=> b!415553 (= res!241804 (arrayNoDuplicates!0 lt!190314 #b00000000000000000000000000000000 Nil!6921))))

(declare-fun b!415554 () Bool)

(declare-fun res!241799 () Bool)

(assert (=> b!415554 (=> (not res!241799) (not e!248185))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!415554 (= res!241799 (bvsle from!863 i!563))))

(declare-datatypes ((V!15379 0))(
  ( (V!15380 (val!5397 Int)) )
))
(declare-fun minValue!515 () V!15379)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5009 0))(
  ( (ValueCellFull!5009 (v!7645 V!15379)) (EmptyCell!5009) )
))
(declare-datatypes ((array!25272 0))(
  ( (array!25273 (arr!12085 (Array (_ BitVec 32) ValueCell!5009)) (size!12437 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25272)

(declare-fun zeroValue!515 () V!15379)

(declare-datatypes ((tuple2!6904 0))(
  ( (tuple2!6905 (_1!3463 (_ BitVec 64)) (_2!3463 V!15379)) )
))
(declare-datatypes ((List!6925 0))(
  ( (Nil!6922) (Cons!6921 (h!7777 tuple2!6904) (t!12135 List!6925)) )
))
(declare-datatypes ((ListLongMap!5819 0))(
  ( (ListLongMap!5820 (toList!2925 List!6925)) )
))
(declare-fun call!28825 () ListLongMap!5819)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28821 () Bool)

(declare-fun lt!190313 () array!25272)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55020 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1174 (array!25270 array!25272 (_ BitVec 32) (_ BitVec 32) V!15379 V!15379 (_ BitVec 32) Int) ListLongMap!5819)

(assert (=> bm!28821 (= call!28825 (getCurrentListMapNoExtraKeys!1174 (ite c!55020 lt!190314 _keys!709) (ite c!55020 lt!190313 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415555 () Bool)

(declare-fun res!241802 () Bool)

(assert (=> b!415555 (=> (not res!241802) (not e!248191))))

(assert (=> b!415555 (= res!241802 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6921))))

(declare-fun b!415556 () Bool)

(declare-fun e!248188 () Bool)

(declare-fun e!248186 () Bool)

(declare-fun mapRes!17679 () Bool)

(assert (=> b!415556 (= e!248188 (and e!248186 mapRes!17679))))

(declare-fun condMapEmpty!17679 () Bool)

(declare-fun mapDefault!17679 () ValueCell!5009)

(assert (=> b!415556 (= condMapEmpty!17679 (= (arr!12085 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5009)) mapDefault!17679)))))

(declare-fun b!415557 () Bool)

(declare-fun tp_is_empty!10705 () Bool)

(assert (=> b!415557 (= e!248186 tp_is_empty!10705)))

(declare-fun b!415558 () Bool)

(declare-fun e!248187 () Bool)

(assert (=> b!415558 (= e!248185 e!248187)))

(declare-fun res!241794 () Bool)

(assert (=> b!415558 (=> (not res!241794) (not e!248187))))

(assert (=> b!415558 (= res!241794 (= from!863 i!563))))

(declare-fun lt!190315 () ListLongMap!5819)

(assert (=> b!415558 (= lt!190315 (getCurrentListMapNoExtraKeys!1174 lt!190314 lt!190313 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15379)

(assert (=> b!415558 (= lt!190313 (array!25273 (store (arr!12085 _values!549) i!563 (ValueCellFull!5009 v!412)) (size!12437 _values!549)))))

(declare-fun lt!190317 () ListLongMap!5819)

(assert (=> b!415558 (= lt!190317 (getCurrentListMapNoExtraKeys!1174 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415559 () Bool)

(declare-fun e!248184 () Bool)

(assert (=> b!415559 (= e!248184 tp_is_empty!10705)))

(declare-fun call!28824 () ListLongMap!5819)

(declare-fun bm!28822 () Bool)

(assert (=> bm!28822 (= call!28824 (getCurrentListMapNoExtraKeys!1174 (ite c!55020 _keys!709 lt!190314) (ite c!55020 _values!549 lt!190313) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241797 () Bool)

(assert (=> start!39272 (=> (not res!241797) (not e!248191))))

(assert (=> start!39272 (= res!241797 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12436 _keys!709))))))

(assert (=> start!39272 e!248191))

(assert (=> start!39272 tp_is_empty!10705))

(assert (=> start!39272 tp!34188))

(assert (=> start!39272 true))

(declare-fun array_inv!8894 (array!25272) Bool)

(assert (=> start!39272 (and (array_inv!8894 _values!549) e!248188)))

(declare-fun array_inv!8895 (array!25270) Bool)

(assert (=> start!39272 (array_inv!8895 _keys!709)))

(declare-fun b!415560 () Bool)

(declare-fun res!241800 () Bool)

(assert (=> b!415560 (=> (not res!241800) (not e!248191))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415560 (= res!241800 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17679 () Bool)

(assert (=> mapIsEmpty!17679 mapRes!17679))

(declare-fun b!415561 () Bool)

(declare-fun res!241793 () Bool)

(assert (=> b!415561 (=> (not res!241793) (not e!248191))))

(assert (=> b!415561 (= res!241793 (and (= (size!12437 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12436 _keys!709) (size!12437 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415562 () Bool)

(declare-fun res!241798 () Bool)

(assert (=> b!415562 (=> (not res!241798) (not e!248191))))

(declare-fun arrayContainsKey!0 (array!25270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415562 (= res!241798 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415563 () Bool)

(declare-fun e!248189 () Bool)

(assert (=> b!415563 (= e!248189 (= call!28824 call!28825))))

(declare-fun b!415564 () Bool)

(declare-fun res!241805 () Bool)

(assert (=> b!415564 (=> (not res!241805) (not e!248191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25270 (_ BitVec 32)) Bool)

(assert (=> b!415564 (= res!241805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415565 () Bool)

(declare-fun e!248183 () Bool)

(assert (=> b!415565 (= e!248187 (not e!248183))))

(declare-fun res!241796 () Bool)

(assert (=> b!415565 (=> res!241796 e!248183)))

(assert (=> b!415565 (= res!241796 (validKeyInArray!0 (select (arr!12084 _keys!709) from!863)))))

(assert (=> b!415565 e!248189))

(assert (=> b!415565 (= c!55020 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12277 0))(
  ( (Unit!12278) )
))
(declare-fun lt!190316 () Unit!12277)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!406 (array!25270 array!25272 (_ BitVec 32) (_ BitVec 32) V!15379 V!15379 (_ BitVec 32) (_ BitVec 64) V!15379 (_ BitVec 32) Int) Unit!12277)

(assert (=> b!415565 (= lt!190316 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!406 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415566 () Bool)

(assert (=> b!415566 (= e!248191 e!248185)))

(declare-fun res!241803 () Bool)

(assert (=> b!415566 (=> (not res!241803) (not e!248185))))

(assert (=> b!415566 (= res!241803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190314 mask!1025))))

(assert (=> b!415566 (= lt!190314 (array!25271 (store (arr!12084 _keys!709) i!563 k0!794) (size!12436 _keys!709)))))

(declare-fun b!415567 () Bool)

(assert (=> b!415567 (= e!248183 true)))

(declare-fun +!1199 (ListLongMap!5819 tuple2!6904) ListLongMap!5819)

(declare-fun get!5969 (ValueCell!5009 V!15379) V!15379)

(declare-fun dynLambda!664 (Int (_ BitVec 64)) V!15379)

(assert (=> b!415567 (= lt!190315 (+!1199 (getCurrentListMapNoExtraKeys!1174 lt!190314 lt!190313 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6905 (select (arr!12084 lt!190314) from!863) (get!5969 (select (arr!12085 lt!190313) from!863) (dynLambda!664 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415568 () Bool)

(declare-fun res!241795 () Bool)

(assert (=> b!415568 (=> (not res!241795) (not e!248191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415568 (= res!241795 (validMask!0 mask!1025))))

(declare-fun b!415569 () Bool)

(assert (=> b!415569 (= e!248189 (= call!28825 (+!1199 call!28824 (tuple2!6905 k0!794 v!412))))))

(declare-fun mapNonEmpty!17679 () Bool)

(declare-fun tp!34187 () Bool)

(assert (=> mapNonEmpty!17679 (= mapRes!17679 (and tp!34187 e!248184))))

(declare-fun mapValue!17679 () ValueCell!5009)

(declare-fun mapKey!17679 () (_ BitVec 32))

(declare-fun mapRest!17679 () (Array (_ BitVec 32) ValueCell!5009))

(assert (=> mapNonEmpty!17679 (= (arr!12085 _values!549) (store mapRest!17679 mapKey!17679 mapValue!17679))))

(declare-fun b!415570 () Bool)

(declare-fun res!241806 () Bool)

(assert (=> b!415570 (=> (not res!241806) (not e!248191))))

(assert (=> b!415570 (= res!241806 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12436 _keys!709))))))

(assert (= (and start!39272 res!241797) b!415568))

(assert (= (and b!415568 res!241795) b!415561))

(assert (= (and b!415561 res!241793) b!415564))

(assert (= (and b!415564 res!241805) b!415555))

(assert (= (and b!415555 res!241802) b!415570))

(assert (= (and b!415570 res!241806) b!415560))

(assert (= (and b!415560 res!241800) b!415552))

(assert (= (and b!415552 res!241801) b!415562))

(assert (= (and b!415562 res!241798) b!415566))

(assert (= (and b!415566 res!241803) b!415553))

(assert (= (and b!415553 res!241804) b!415554))

(assert (= (and b!415554 res!241799) b!415558))

(assert (= (and b!415558 res!241794) b!415565))

(assert (= (and b!415565 c!55020) b!415569))

(assert (= (and b!415565 (not c!55020)) b!415563))

(assert (= (or b!415569 b!415563) bm!28821))

(assert (= (or b!415569 b!415563) bm!28822))

(assert (= (and b!415565 (not res!241796)) b!415567))

(assert (= (and b!415556 condMapEmpty!17679) mapIsEmpty!17679))

(assert (= (and b!415556 (not condMapEmpty!17679)) mapNonEmpty!17679))

(get-info :version)

(assert (= (and mapNonEmpty!17679 ((_ is ValueCellFull!5009) mapValue!17679)) b!415559))

(assert (= (and b!415556 ((_ is ValueCellFull!5009) mapDefault!17679)) b!415557))

(assert (= start!39272 b!415556))

(declare-fun b_lambda!8879 () Bool)

(assert (=> (not b_lambda!8879) (not b!415567)))

(declare-fun t!12133 () Bool)

(declare-fun tb!3167 () Bool)

(assert (=> (and start!39272 (= defaultEntry!557 defaultEntry!557) t!12133) tb!3167))

(declare-fun result!5869 () Bool)

(assert (=> tb!3167 (= result!5869 tp_is_empty!10705)))

(assert (=> b!415567 t!12133))

(declare-fun b_and!16997 () Bool)

(assert (= b_and!16995 (and (=> t!12133 result!5869) b_and!16997)))

(declare-fun m!404955 () Bool)

(assert (=> mapNonEmpty!17679 m!404955))

(declare-fun m!404957 () Bool)

(assert (=> start!39272 m!404957))

(declare-fun m!404959 () Bool)

(assert (=> start!39272 m!404959))

(declare-fun m!404961 () Bool)

(assert (=> b!415565 m!404961))

(assert (=> b!415565 m!404961))

(declare-fun m!404963 () Bool)

(assert (=> b!415565 m!404963))

(declare-fun m!404965 () Bool)

(assert (=> b!415565 m!404965))

(declare-fun m!404967 () Bool)

(assert (=> b!415560 m!404967))

(declare-fun m!404969 () Bool)

(assert (=> bm!28821 m!404969))

(declare-fun m!404971 () Bool)

(assert (=> b!415566 m!404971))

(declare-fun m!404973 () Bool)

(assert (=> b!415566 m!404973))

(declare-fun m!404975 () Bool)

(assert (=> b!415555 m!404975))

(declare-fun m!404977 () Bool)

(assert (=> bm!28822 m!404977))

(declare-fun m!404979 () Bool)

(assert (=> b!415569 m!404979))

(declare-fun m!404981 () Bool)

(assert (=> b!415564 m!404981))

(declare-fun m!404983 () Bool)

(assert (=> b!415568 m!404983))

(declare-fun m!404985 () Bool)

(assert (=> b!415558 m!404985))

(declare-fun m!404987 () Bool)

(assert (=> b!415558 m!404987))

(declare-fun m!404989 () Bool)

(assert (=> b!415558 m!404989))

(declare-fun m!404991 () Bool)

(assert (=> b!415567 m!404991))

(declare-fun m!404993 () Bool)

(assert (=> b!415567 m!404993))

(declare-fun m!404995 () Bool)

(assert (=> b!415567 m!404995))

(assert (=> b!415567 m!404993))

(declare-fun m!404997 () Bool)

(assert (=> b!415567 m!404997))

(declare-fun m!404999 () Bool)

(assert (=> b!415567 m!404999))

(assert (=> b!415567 m!404991))

(assert (=> b!415567 m!404999))

(declare-fun m!405001 () Bool)

(assert (=> b!415567 m!405001))

(declare-fun m!405003 () Bool)

(assert (=> b!415562 m!405003))

(declare-fun m!405005 () Bool)

(assert (=> b!415552 m!405005))

(declare-fun m!405007 () Bool)

(assert (=> b!415553 m!405007))

(check-sat (not b!415555) (not b!415564) b_and!16997 (not mapNonEmpty!17679) (not b!415569) (not b_next!9553) tp_is_empty!10705 (not start!39272) (not b_lambda!8879) (not b!415567) (not b!415562) (not b!415553) (not b!415565) (not b!415566) (not bm!28822) (not b!415568) (not b!415558) (not bm!28821) (not b!415560))
(check-sat b_and!16997 (not b_next!9553))
