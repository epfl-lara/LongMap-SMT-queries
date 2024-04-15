; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38672 () Bool)

(assert start!38672)

(declare-fun b_free!9223 () Bool)

(declare-fun b_next!9223 () Bool)

(assert (=> start!38672 (= b_free!9223 (not b_next!9223))))

(declare-fun tp!32792 () Bool)

(declare-fun b_and!16583 () Bool)

(assert (=> start!38672 (= tp!32792 b_and!16583)))

(declare-fun b!401874 () Bool)

(declare-fun res!231467 () Bool)

(declare-fun e!242173 () Bool)

(assert (=> b!401874 (=> (not res!231467) (not e!242173))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401874 (= res!231467 (validMask!0 mask!1025))))

(declare-fun b!401875 () Bool)

(declare-fun res!231468 () Bool)

(declare-fun e!242169 () Bool)

(assert (=> b!401875 (=> (not res!231468) (not e!242169))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24093 0))(
  ( (array!24094 (arr!11496 (Array (_ BitVec 32) (_ BitVec 64))) (size!11849 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24093)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401875 (= res!231468 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11849 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401876 () Bool)

(declare-fun res!231457 () Bool)

(assert (=> b!401876 (=> (not res!231457) (not e!242173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24093 (_ BitVec 32)) Bool)

(assert (=> b!401876 (= res!231457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16779 () Bool)

(declare-fun mapRes!16779 () Bool)

(declare-fun tp!32793 () Bool)

(declare-fun e!242171 () Bool)

(assert (=> mapNonEmpty!16779 (= mapRes!16779 (and tp!32793 e!242171))))

(declare-datatypes ((V!14579 0))(
  ( (V!14580 (val!5097 Int)) )
))
(declare-datatypes ((ValueCell!4709 0))(
  ( (ValueCellFull!4709 (v!7338 V!14579)) (EmptyCell!4709) )
))
(declare-fun mapRest!16779 () (Array (_ BitVec 32) ValueCell!4709))

(declare-fun mapKey!16779 () (_ BitVec 32))

(declare-datatypes ((array!24095 0))(
  ( (array!24096 (arr!11497 (Array (_ BitVec 32) ValueCell!4709)) (size!11850 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24095)

(declare-fun mapValue!16779 () ValueCell!4709)

(assert (=> mapNonEmpty!16779 (= (arr!11497 _values!549) (store mapRest!16779 mapKey!16779 mapValue!16779))))

(declare-fun e!242170 () Bool)

(declare-datatypes ((tuple2!6750 0))(
  ( (tuple2!6751 (_1!3386 (_ BitVec 64)) (_2!3386 V!14579)) )
))
(declare-datatypes ((List!6654 0))(
  ( (Nil!6651) (Cons!6650 (h!7506 tuple2!6750) (t!11819 List!6654)) )
))
(declare-datatypes ((ListLongMap!5653 0))(
  ( (ListLongMap!5654 (toList!2842 List!6654)) )
))
(declare-fun call!28308 () ListLongMap!5653)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!401877 () Bool)

(declare-fun call!28309 () ListLongMap!5653)

(declare-fun v!412 () V!14579)

(declare-fun +!1147 (ListLongMap!5653 tuple2!6750) ListLongMap!5653)

(assert (=> b!401877 (= e!242170 (= call!28308 (+!1147 call!28309 (tuple2!6751 k0!794 v!412))))))

(declare-fun b!401878 () Bool)

(declare-fun res!231458 () Bool)

(assert (=> b!401878 (=> (not res!231458) (not e!242173))))

(declare-datatypes ((List!6655 0))(
  ( (Nil!6652) (Cons!6651 (h!7507 (_ BitVec 64)) (t!11820 List!6655)) )
))
(declare-fun arrayNoDuplicates!0 (array!24093 (_ BitVec 32) List!6655) Bool)

(assert (=> b!401878 (= res!231458 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6652))))

(declare-fun b!401879 () Bool)

(declare-fun res!231466 () Bool)

(assert (=> b!401879 (=> (not res!231466) (not e!242173))))

(assert (=> b!401879 (= res!231466 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11849 _keys!709))))))

(declare-fun b!401880 () Bool)

(declare-fun res!231465 () Bool)

(assert (=> b!401880 (=> (not res!231465) (not e!242173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401880 (= res!231465 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16779 () Bool)

(assert (=> mapIsEmpty!16779 mapRes!16779))

(declare-fun minValue!515 () V!14579)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!187661 () array!24093)

(declare-fun zeroValue!515 () V!14579)

(declare-fun bm!28305 () Bool)

(declare-fun c!54720 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1058 (array!24093 array!24095 (_ BitVec 32) (_ BitVec 32) V!14579 V!14579 (_ BitVec 32) Int) ListLongMap!5653)

(assert (=> bm!28305 (= call!28309 (getCurrentListMapNoExtraKeys!1058 (ite c!54720 _keys!709 lt!187661) (ite c!54720 _values!549 (array!24096 (store (arr!11497 _values!549) i!563 (ValueCellFull!4709 v!412)) (size!11850 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401881 () Bool)

(declare-fun res!231462 () Bool)

(assert (=> b!401881 (=> (not res!231462) (not e!242173))))

(declare-fun arrayContainsKey!0 (array!24093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401881 (= res!231462 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401882 () Bool)

(declare-fun res!231461 () Bool)

(assert (=> b!401882 (=> (not res!231461) (not e!242173))))

(assert (=> b!401882 (= res!231461 (and (= (size!11850 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11849 _keys!709) (size!11850 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401883 () Bool)

(declare-fun res!231463 () Bool)

(assert (=> b!401883 (=> (not res!231463) (not e!242169))))

(assert (=> b!401883 (= res!231463 (arrayNoDuplicates!0 lt!187661 #b00000000000000000000000000000000 Nil!6652))))

(declare-fun b!401884 () Bool)

(declare-fun e!242172 () Bool)

(declare-fun tp_is_empty!10105 () Bool)

(assert (=> b!401884 (= e!242172 tp_is_empty!10105)))

(declare-fun bm!28306 () Bool)

(assert (=> bm!28306 (= call!28308 (getCurrentListMapNoExtraKeys!1058 (ite c!54720 lt!187661 _keys!709) (ite c!54720 (array!24096 (store (arr!11497 _values!549) i!563 (ValueCellFull!4709 v!412)) (size!11850 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401885 () Bool)

(declare-fun e!242175 () Bool)

(assert (=> b!401885 (= e!242175 (and e!242172 mapRes!16779))))

(declare-fun condMapEmpty!16779 () Bool)

(declare-fun mapDefault!16779 () ValueCell!4709)

(assert (=> b!401885 (= condMapEmpty!16779 (= (arr!11497 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4709)) mapDefault!16779)))))

(declare-fun res!231460 () Bool)

(assert (=> start!38672 (=> (not res!231460) (not e!242173))))

(assert (=> start!38672 (= res!231460 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11849 _keys!709))))))

(assert (=> start!38672 e!242173))

(assert (=> start!38672 tp_is_empty!10105))

(assert (=> start!38672 tp!32792))

(assert (=> start!38672 true))

(declare-fun array_inv!8434 (array!24095) Bool)

(assert (=> start!38672 (and (array_inv!8434 _values!549) e!242175)))

(declare-fun array_inv!8435 (array!24093) Bool)

(assert (=> start!38672 (array_inv!8435 _keys!709)))

(declare-fun b!401886 () Bool)

(assert (=> b!401886 (= e!242169 (not true))))

(assert (=> b!401886 e!242170))

(assert (=> b!401886 (= c!54720 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12146 0))(
  ( (Unit!12147) )
))
(declare-fun lt!187660 () Unit!12146)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!336 (array!24093 array!24095 (_ BitVec 32) (_ BitVec 32) V!14579 V!14579 (_ BitVec 32) (_ BitVec 64) V!14579 (_ BitVec 32) Int) Unit!12146)

(assert (=> b!401886 (= lt!187660 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401887 () Bool)

(assert (=> b!401887 (= e!242170 (= call!28309 call!28308))))

(declare-fun b!401888 () Bool)

(declare-fun res!231459 () Bool)

(assert (=> b!401888 (=> (not res!231459) (not e!242173))))

(assert (=> b!401888 (= res!231459 (or (= (select (arr!11496 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11496 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401889 () Bool)

(assert (=> b!401889 (= e!242173 e!242169)))

(declare-fun res!231464 () Bool)

(assert (=> b!401889 (=> (not res!231464) (not e!242169))))

(assert (=> b!401889 (= res!231464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187661 mask!1025))))

(assert (=> b!401889 (= lt!187661 (array!24094 (store (arr!11496 _keys!709) i!563 k0!794) (size!11849 _keys!709)))))

(declare-fun b!401890 () Bool)

(assert (=> b!401890 (= e!242171 tp_is_empty!10105)))

(assert (= (and start!38672 res!231460) b!401874))

(assert (= (and b!401874 res!231467) b!401882))

(assert (= (and b!401882 res!231461) b!401876))

(assert (= (and b!401876 res!231457) b!401878))

(assert (= (and b!401878 res!231458) b!401879))

(assert (= (and b!401879 res!231466) b!401880))

(assert (= (and b!401880 res!231465) b!401888))

(assert (= (and b!401888 res!231459) b!401881))

(assert (= (and b!401881 res!231462) b!401889))

(assert (= (and b!401889 res!231464) b!401883))

(assert (= (and b!401883 res!231463) b!401875))

(assert (= (and b!401875 res!231468) b!401886))

(assert (= (and b!401886 c!54720) b!401877))

(assert (= (and b!401886 (not c!54720)) b!401887))

(assert (= (or b!401877 b!401887) bm!28306))

(assert (= (or b!401877 b!401887) bm!28305))

(assert (= (and b!401885 condMapEmpty!16779) mapIsEmpty!16779))

(assert (= (and b!401885 (not condMapEmpty!16779)) mapNonEmpty!16779))

(get-info :version)

(assert (= (and mapNonEmpty!16779 ((_ is ValueCellFull!4709) mapValue!16779)) b!401890))

(assert (= (and b!401885 ((_ is ValueCellFull!4709) mapDefault!16779)) b!401884))

(assert (= start!38672 b!401885))

(declare-fun m!395043 () Bool)

(assert (=> b!401874 m!395043))

(declare-fun m!395045 () Bool)

(assert (=> bm!28305 m!395045))

(declare-fun m!395047 () Bool)

(assert (=> bm!28305 m!395047))

(declare-fun m!395049 () Bool)

(assert (=> b!401881 m!395049))

(declare-fun m!395051 () Bool)

(assert (=> b!401876 m!395051))

(declare-fun m!395053 () Bool)

(assert (=> b!401880 m!395053))

(declare-fun m!395055 () Bool)

(assert (=> b!401883 m!395055))

(assert (=> bm!28306 m!395045))

(declare-fun m!395057 () Bool)

(assert (=> bm!28306 m!395057))

(declare-fun m!395059 () Bool)

(assert (=> b!401877 m!395059))

(declare-fun m!395061 () Bool)

(assert (=> mapNonEmpty!16779 m!395061))

(declare-fun m!395063 () Bool)

(assert (=> start!38672 m!395063))

(declare-fun m!395065 () Bool)

(assert (=> start!38672 m!395065))

(declare-fun m!395067 () Bool)

(assert (=> b!401888 m!395067))

(declare-fun m!395069 () Bool)

(assert (=> b!401889 m!395069))

(declare-fun m!395071 () Bool)

(assert (=> b!401889 m!395071))

(declare-fun m!395073 () Bool)

(assert (=> b!401886 m!395073))

(declare-fun m!395075 () Bool)

(assert (=> b!401878 m!395075))

(check-sat (not start!38672) (not b!401886) (not b!401881) (not b!401878) (not b!401889) (not bm!28305) (not b!401876) (not mapNonEmpty!16779) (not b_next!9223) (not b!401877) (not b!401880) (not b!401874) (not bm!28306) (not b!401883) tp_is_empty!10105 b_and!16583)
(check-sat b_and!16583 (not b_next!9223))
