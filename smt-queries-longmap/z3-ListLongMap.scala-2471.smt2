; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38646 () Bool)

(assert start!38646)

(declare-fun b_free!9183 () Bool)

(declare-fun b_next!9183 () Bool)

(assert (=> start!38646 (= b_free!9183 (not b_next!9183))))

(declare-fun tp!32673 () Bool)

(declare-fun b_and!16569 () Bool)

(assert (=> start!38646 (= tp!32673 b_and!16569)))

(declare-fun b!401125 () Bool)

(declare-fun e!241924 () Bool)

(declare-datatypes ((V!14525 0))(
  ( (V!14526 (val!5077 Int)) )
))
(declare-datatypes ((tuple2!6734 0))(
  ( (tuple2!6735 (_1!3378 (_ BitVec 64)) (_2!3378 V!14525)) )
))
(declare-datatypes ((List!6658 0))(
  ( (Nil!6655) (Cons!6654 (h!7510 tuple2!6734) (t!11832 List!6658)) )
))
(declare-datatypes ((ListLongMap!5647 0))(
  ( (ListLongMap!5648 (toList!2839 List!6658)) )
))
(declare-fun call!28213 () ListLongMap!5647)

(declare-fun call!28214 () ListLongMap!5647)

(assert (=> b!401125 (= e!241924 (= call!28213 call!28214))))

(declare-fun b!401126 () Bool)

(declare-fun res!230868 () Bool)

(declare-fun e!241928 () Bool)

(assert (=> b!401126 (=> (not res!230868) (not e!241928))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24039 0))(
  ( (array!24040 (arr!11469 (Array (_ BitVec 32) (_ BitVec 64))) (size!11821 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24039)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401126 (= res!230868 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11821 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401127 () Bool)

(declare-fun res!230866 () Bool)

(declare-fun e!241929 () Bool)

(assert (=> b!401127 (=> (not res!230866) (not e!241929))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401127 (= res!230866 (validKeyInArray!0 k0!794))))

(declare-fun b!401128 () Bool)

(declare-fun res!230867 () Bool)

(assert (=> b!401128 (=> (not res!230867) (not e!241928))))

(declare-fun lt!187775 () array!24039)

(declare-datatypes ((List!6659 0))(
  ( (Nil!6656) (Cons!6655 (h!7511 (_ BitVec 64)) (t!11833 List!6659)) )
))
(declare-fun arrayNoDuplicates!0 (array!24039 (_ BitVec 32) List!6659) Bool)

(assert (=> b!401128 (= res!230867 (arrayNoDuplicates!0 lt!187775 #b00000000000000000000000000000000 Nil!6656))))

(declare-fun b!401129 () Bool)

(declare-fun res!230873 () Bool)

(assert (=> b!401129 (=> (not res!230873) (not e!241929))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24039 (_ BitVec 32)) Bool)

(assert (=> b!401129 (= res!230873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230871 () Bool)

(assert (=> start!38646 (=> (not res!230871) (not e!241929))))

(assert (=> start!38646 (= res!230871 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11821 _keys!709))))))

(assert (=> start!38646 e!241929))

(declare-fun tp_is_empty!10065 () Bool)

(assert (=> start!38646 tp_is_empty!10065))

(assert (=> start!38646 tp!32673))

(assert (=> start!38646 true))

(declare-datatypes ((ValueCell!4689 0))(
  ( (ValueCellFull!4689 (v!7324 V!14525)) (EmptyCell!4689) )
))
(declare-datatypes ((array!24041 0))(
  ( (array!24042 (arr!11470 (Array (_ BitVec 32) ValueCell!4689)) (size!11822 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24041)

(declare-fun e!241927 () Bool)

(declare-fun array_inv!8396 (array!24041) Bool)

(assert (=> start!38646 (and (array_inv!8396 _values!549) e!241927)))

(declare-fun array_inv!8397 (array!24039) Bool)

(assert (=> start!38646 (array_inv!8397 _keys!709)))

(declare-fun b!401130 () Bool)

(declare-fun res!230876 () Bool)

(assert (=> b!401130 (=> (not res!230876) (not e!241929))))

(assert (=> b!401130 (= res!230876 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11821 _keys!709))))))

(declare-fun b!401131 () Bool)

(assert (=> b!401131 (= e!241928 (not true))))

(assert (=> b!401131 e!241924))

(declare-fun c!54731 () Bool)

(assert (=> b!401131 (= c!54731 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12150 0))(
  ( (Unit!12151) )
))
(declare-fun lt!187774 () Unit!12150)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14525)

(declare-fun v!412 () V!14525)

(declare-fun minValue!515 () V!14525)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!333 (array!24039 array!24041 (_ BitVec 32) (_ BitVec 32) V!14525 V!14525 (_ BitVec 32) (_ BitVec 64) V!14525 (_ BitVec 32) Int) Unit!12150)

(assert (=> b!401131 (= lt!187774 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401132 () Bool)

(declare-fun e!241923 () Bool)

(assert (=> b!401132 (= e!241923 tp_is_empty!10065)))

(declare-fun bm!28210 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1052 (array!24039 array!24041 (_ BitVec 32) (_ BitVec 32) V!14525 V!14525 (_ BitVec 32) Int) ListLongMap!5647)

(assert (=> bm!28210 (= call!28213 (getCurrentListMapNoExtraKeys!1052 (ite c!54731 _keys!709 lt!187775) (ite c!54731 _values!549 (array!24042 (store (arr!11470 _values!549) i!563 (ValueCellFull!4689 v!412)) (size!11822 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401133 () Bool)

(declare-fun +!1124 (ListLongMap!5647 tuple2!6734) ListLongMap!5647)

(assert (=> b!401133 (= e!241924 (= call!28214 (+!1124 call!28213 (tuple2!6735 k0!794 v!412))))))

(declare-fun b!401134 () Bool)

(declare-fun res!230874 () Bool)

(assert (=> b!401134 (=> (not res!230874) (not e!241929))))

(assert (=> b!401134 (= res!230874 (and (= (size!11822 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11821 _keys!709) (size!11822 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401135 () Bool)

(declare-fun e!241925 () Bool)

(assert (=> b!401135 (= e!241925 tp_is_empty!10065)))

(declare-fun mapIsEmpty!16719 () Bool)

(declare-fun mapRes!16719 () Bool)

(assert (=> mapIsEmpty!16719 mapRes!16719))

(declare-fun b!401136 () Bool)

(assert (=> b!401136 (= e!241929 e!241928)))

(declare-fun res!230875 () Bool)

(assert (=> b!401136 (=> (not res!230875) (not e!241928))))

(assert (=> b!401136 (= res!230875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187775 mask!1025))))

(assert (=> b!401136 (= lt!187775 (array!24040 (store (arr!11469 _keys!709) i!563 k0!794) (size!11821 _keys!709)))))

(declare-fun b!401137 () Bool)

(assert (=> b!401137 (= e!241927 (and e!241923 mapRes!16719))))

(declare-fun condMapEmpty!16719 () Bool)

(declare-fun mapDefault!16719 () ValueCell!4689)

(assert (=> b!401137 (= condMapEmpty!16719 (= (arr!11470 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4689)) mapDefault!16719)))))

(declare-fun b!401138 () Bool)

(declare-fun res!230870 () Bool)

(assert (=> b!401138 (=> (not res!230870) (not e!241929))))

(declare-fun arrayContainsKey!0 (array!24039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401138 (= res!230870 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16719 () Bool)

(declare-fun tp!32672 () Bool)

(assert (=> mapNonEmpty!16719 (= mapRes!16719 (and tp!32672 e!241925))))

(declare-fun mapValue!16719 () ValueCell!4689)

(declare-fun mapRest!16719 () (Array (_ BitVec 32) ValueCell!4689))

(declare-fun mapKey!16719 () (_ BitVec 32))

(assert (=> mapNonEmpty!16719 (= (arr!11470 _values!549) (store mapRest!16719 mapKey!16719 mapValue!16719))))

(declare-fun bm!28211 () Bool)

(assert (=> bm!28211 (= call!28214 (getCurrentListMapNoExtraKeys!1052 (ite c!54731 lt!187775 _keys!709) (ite c!54731 (array!24042 (store (arr!11470 _values!549) i!563 (ValueCellFull!4689 v!412)) (size!11822 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401139 () Bool)

(declare-fun res!230869 () Bool)

(assert (=> b!401139 (=> (not res!230869) (not e!241929))))

(assert (=> b!401139 (= res!230869 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6656))))

(declare-fun b!401140 () Bool)

(declare-fun res!230877 () Bool)

(assert (=> b!401140 (=> (not res!230877) (not e!241929))))

(assert (=> b!401140 (= res!230877 (or (= (select (arr!11469 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11469 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401141 () Bool)

(declare-fun res!230872 () Bool)

(assert (=> b!401141 (=> (not res!230872) (not e!241929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401141 (= res!230872 (validMask!0 mask!1025))))

(assert (= (and start!38646 res!230871) b!401141))

(assert (= (and b!401141 res!230872) b!401134))

(assert (= (and b!401134 res!230874) b!401129))

(assert (= (and b!401129 res!230873) b!401139))

(assert (= (and b!401139 res!230869) b!401130))

(assert (= (and b!401130 res!230876) b!401127))

(assert (= (and b!401127 res!230866) b!401140))

(assert (= (and b!401140 res!230877) b!401138))

(assert (= (and b!401138 res!230870) b!401136))

(assert (= (and b!401136 res!230875) b!401128))

(assert (= (and b!401128 res!230867) b!401126))

(assert (= (and b!401126 res!230868) b!401131))

(assert (= (and b!401131 c!54731) b!401133))

(assert (= (and b!401131 (not c!54731)) b!401125))

(assert (= (or b!401133 b!401125) bm!28211))

(assert (= (or b!401133 b!401125) bm!28210))

(assert (= (and b!401137 condMapEmpty!16719) mapIsEmpty!16719))

(assert (= (and b!401137 (not condMapEmpty!16719)) mapNonEmpty!16719))

(get-info :version)

(assert (= (and mapNonEmpty!16719 ((_ is ValueCellFull!4689) mapValue!16719)) b!401135))

(assert (= (and b!401137 ((_ is ValueCellFull!4689) mapDefault!16719)) b!401132))

(assert (= start!38646 b!401137))

(declare-fun m!395087 () Bool)

(assert (=> b!401131 m!395087))

(declare-fun m!395089 () Bool)

(assert (=> b!401138 m!395089))

(declare-fun m!395091 () Bool)

(assert (=> b!401140 m!395091))

(declare-fun m!395093 () Bool)

(assert (=> b!401139 m!395093))

(declare-fun m!395095 () Bool)

(assert (=> bm!28210 m!395095))

(declare-fun m!395097 () Bool)

(assert (=> bm!28210 m!395097))

(declare-fun m!395099 () Bool)

(assert (=> b!401141 m!395099))

(declare-fun m!395101 () Bool)

(assert (=> start!38646 m!395101))

(declare-fun m!395103 () Bool)

(assert (=> start!38646 m!395103))

(declare-fun m!395105 () Bool)

(assert (=> b!401128 m!395105))

(declare-fun m!395107 () Bool)

(assert (=> b!401133 m!395107))

(assert (=> bm!28211 m!395095))

(declare-fun m!395109 () Bool)

(assert (=> bm!28211 m!395109))

(declare-fun m!395111 () Bool)

(assert (=> mapNonEmpty!16719 m!395111))

(declare-fun m!395113 () Bool)

(assert (=> b!401136 m!395113))

(declare-fun m!395115 () Bool)

(assert (=> b!401136 m!395115))

(declare-fun m!395117 () Bool)

(assert (=> b!401127 m!395117))

(declare-fun m!395119 () Bool)

(assert (=> b!401129 m!395119))

(check-sat (not b!401138) tp_is_empty!10065 (not b!401136) (not mapNonEmpty!16719) (not b!401127) (not b!401128) (not b!401129) (not b!401139) (not b_next!9183) (not b!401133) (not b!401131) (not bm!28211) (not start!38646) b_and!16569 (not bm!28210) (not b!401141))
(check-sat b_and!16569 (not b_next!9183))
