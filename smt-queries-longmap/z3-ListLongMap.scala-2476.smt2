; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38660 () Bool)

(assert start!38660)

(declare-fun b_free!9211 () Bool)

(declare-fun b_next!9211 () Bool)

(assert (=> start!38660 (= b_free!9211 (not b_next!9211))))

(declare-fun tp!32757 () Bool)

(declare-fun b_and!16571 () Bool)

(assert (=> start!38660 (= tp!32757 b_and!16571)))

(declare-datatypes ((V!14563 0))(
  ( (V!14564 (val!5091 Int)) )
))
(declare-fun minValue!515 () V!14563)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54702 () Bool)

(declare-datatypes ((tuple2!6740 0))(
  ( (tuple2!6741 (_1!3381 (_ BitVec 64)) (_2!3381 V!14563)) )
))
(declare-datatypes ((List!6645 0))(
  ( (Nil!6642) (Cons!6641 (h!7497 tuple2!6740) (t!11810 List!6645)) )
))
(declare-datatypes ((ListLongMap!5643 0))(
  ( (ListLongMap!5644 (toList!2837 List!6645)) )
))
(declare-fun call!28272 () ListLongMap!5643)

(declare-datatypes ((ValueCell!4703 0))(
  ( (ValueCellFull!4703 (v!7332 V!14563)) (EmptyCell!4703) )
))
(declare-datatypes ((array!24071 0))(
  ( (array!24072 (arr!11485 (Array (_ BitVec 32) ValueCell!4703)) (size!11838 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24071)

(declare-fun zeroValue!515 () V!14563)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14563)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24073 0))(
  ( (array!24074 (arr!11486 (Array (_ BitVec 32) (_ BitVec 64))) (size!11839 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24073)

(declare-fun lt!187625 () array!24073)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28269 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1054 (array!24073 array!24071 (_ BitVec 32) (_ BitVec 32) V!14563 V!14563 (_ BitVec 32) Int) ListLongMap!5643)

(assert (=> bm!28269 (= call!28272 (getCurrentListMapNoExtraKeys!1054 (ite c!54702 lt!187625 _keys!709) (ite c!54702 (array!24072 (store (arr!11485 _values!549) i!563 (ValueCellFull!4703 v!412)) (size!11838 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401568 () Bool)

(declare-fun res!231243 () Bool)

(declare-fun e!242049 () Bool)

(assert (=> b!401568 (=> (not res!231243) (not e!242049))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401568 (= res!231243 (validKeyInArray!0 k0!794))))

(declare-fun b!401569 () Bool)

(declare-fun e!242043 () Bool)

(declare-fun tp_is_empty!10093 () Bool)

(assert (=> b!401569 (= e!242043 tp_is_empty!10093)))

(declare-fun b!401570 () Bool)

(declare-fun res!231249 () Bool)

(assert (=> b!401570 (=> (not res!231249) (not e!242049))))

(assert (=> b!401570 (= res!231249 (and (= (size!11838 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11839 _keys!709) (size!11838 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401571 () Bool)

(declare-fun res!231250 () Bool)

(declare-fun e!242045 () Bool)

(assert (=> b!401571 (=> (not res!231250) (not e!242045))))

(declare-datatypes ((List!6646 0))(
  ( (Nil!6643) (Cons!6642 (h!7498 (_ BitVec 64)) (t!11811 List!6646)) )
))
(declare-fun arrayNoDuplicates!0 (array!24073 (_ BitVec 32) List!6646) Bool)

(assert (=> b!401571 (= res!231250 (arrayNoDuplicates!0 lt!187625 #b00000000000000000000000000000000 Nil!6643))))

(declare-fun b!401572 () Bool)

(declare-fun e!242044 () Bool)

(assert (=> b!401572 (= e!242044 tp_is_empty!10093)))

(declare-fun res!231251 () Bool)

(assert (=> start!38660 (=> (not res!231251) (not e!242049))))

(assert (=> start!38660 (= res!231251 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11839 _keys!709))))))

(assert (=> start!38660 e!242049))

(assert (=> start!38660 tp_is_empty!10093))

(assert (=> start!38660 tp!32757))

(assert (=> start!38660 true))

(declare-fun e!242046 () Bool)

(declare-fun array_inv!8426 (array!24071) Bool)

(assert (=> start!38660 (and (array_inv!8426 _values!549) e!242046)))

(declare-fun array_inv!8427 (array!24073) Bool)

(assert (=> start!38660 (array_inv!8427 _keys!709)))

(declare-fun b!401573 () Bool)

(assert (=> b!401573 (= e!242049 e!242045)))

(declare-fun res!231247 () Bool)

(assert (=> b!401573 (=> (not res!231247) (not e!242045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24073 (_ BitVec 32)) Bool)

(assert (=> b!401573 (= res!231247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187625 mask!1025))))

(assert (=> b!401573 (= lt!187625 (array!24074 (store (arr!11486 _keys!709) i!563 k0!794) (size!11839 _keys!709)))))

(declare-fun b!401574 () Bool)

(declare-fun res!231242 () Bool)

(assert (=> b!401574 (=> (not res!231242) (not e!242049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401574 (= res!231242 (validMask!0 mask!1025))))

(declare-fun b!401575 () Bool)

(declare-fun res!231248 () Bool)

(assert (=> b!401575 (=> (not res!231248) (not e!242049))))

(assert (=> b!401575 (= res!231248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401576 () Bool)

(declare-fun res!231252 () Bool)

(assert (=> b!401576 (=> (not res!231252) (not e!242049))))

(assert (=> b!401576 (= res!231252 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6643))))

(declare-fun b!401577 () Bool)

(declare-fun mapRes!16761 () Bool)

(assert (=> b!401577 (= e!242046 (and e!242043 mapRes!16761))))

(declare-fun condMapEmpty!16761 () Bool)

(declare-fun mapDefault!16761 () ValueCell!4703)

(assert (=> b!401577 (= condMapEmpty!16761 (= (arr!11485 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4703)) mapDefault!16761)))))

(declare-fun b!401578 () Bool)

(declare-fun res!231246 () Bool)

(assert (=> b!401578 (=> (not res!231246) (not e!242049))))

(declare-fun arrayContainsKey!0 (array!24073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401578 (= res!231246 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401579 () Bool)

(declare-fun res!231244 () Bool)

(assert (=> b!401579 (=> (not res!231244) (not e!242049))))

(assert (=> b!401579 (= res!231244 (or (= (select (arr!11486 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11486 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16761 () Bool)

(assert (=> mapIsEmpty!16761 mapRes!16761))

(declare-fun bm!28270 () Bool)

(declare-fun call!28273 () ListLongMap!5643)

(assert (=> bm!28270 (= call!28273 (getCurrentListMapNoExtraKeys!1054 (ite c!54702 _keys!709 lt!187625) (ite c!54702 _values!549 (array!24072 (store (arr!11485 _values!549) i!563 (ValueCellFull!4703 v!412)) (size!11838 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401580 () Bool)

(declare-fun res!231241 () Bool)

(assert (=> b!401580 (=> (not res!231241) (not e!242045))))

(assert (=> b!401580 (= res!231241 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11839 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun e!242048 () Bool)

(declare-fun b!401581 () Bool)

(declare-fun +!1142 (ListLongMap!5643 tuple2!6740) ListLongMap!5643)

(assert (=> b!401581 (= e!242048 (= call!28272 (+!1142 call!28273 (tuple2!6741 k0!794 v!412))))))

(declare-fun b!401582 () Bool)

(declare-fun res!231245 () Bool)

(assert (=> b!401582 (=> (not res!231245) (not e!242049))))

(assert (=> b!401582 (= res!231245 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11839 _keys!709))))))

(declare-fun b!401583 () Bool)

(assert (=> b!401583 (= e!242045 (not true))))

(assert (=> b!401583 e!242048))

(assert (=> b!401583 (= c!54702 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12140 0))(
  ( (Unit!12141) )
))
(declare-fun lt!187624 () Unit!12140)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!333 (array!24073 array!24071 (_ BitVec 32) (_ BitVec 32) V!14563 V!14563 (_ BitVec 32) (_ BitVec 64) V!14563 (_ BitVec 32) Int) Unit!12140)

(assert (=> b!401583 (= lt!187624 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16761 () Bool)

(declare-fun tp!32756 () Bool)

(assert (=> mapNonEmpty!16761 (= mapRes!16761 (and tp!32756 e!242044))))

(declare-fun mapValue!16761 () ValueCell!4703)

(declare-fun mapRest!16761 () (Array (_ BitVec 32) ValueCell!4703))

(declare-fun mapKey!16761 () (_ BitVec 32))

(assert (=> mapNonEmpty!16761 (= (arr!11485 _values!549) (store mapRest!16761 mapKey!16761 mapValue!16761))))

(declare-fun b!401584 () Bool)

(assert (=> b!401584 (= e!242048 (= call!28273 call!28272))))

(assert (= (and start!38660 res!231251) b!401574))

(assert (= (and b!401574 res!231242) b!401570))

(assert (= (and b!401570 res!231249) b!401575))

(assert (= (and b!401575 res!231248) b!401576))

(assert (= (and b!401576 res!231252) b!401582))

(assert (= (and b!401582 res!231245) b!401568))

(assert (= (and b!401568 res!231243) b!401579))

(assert (= (and b!401579 res!231244) b!401578))

(assert (= (and b!401578 res!231246) b!401573))

(assert (= (and b!401573 res!231247) b!401571))

(assert (= (and b!401571 res!231250) b!401580))

(assert (= (and b!401580 res!231241) b!401583))

(assert (= (and b!401583 c!54702) b!401581))

(assert (= (and b!401583 (not c!54702)) b!401584))

(assert (= (or b!401581 b!401584) bm!28269))

(assert (= (or b!401581 b!401584) bm!28270))

(assert (= (and b!401577 condMapEmpty!16761) mapIsEmpty!16761))

(assert (= (and b!401577 (not condMapEmpty!16761)) mapNonEmpty!16761))

(get-info :version)

(assert (= (and mapNonEmpty!16761 ((_ is ValueCellFull!4703) mapValue!16761)) b!401572))

(assert (= (and b!401577 ((_ is ValueCellFull!4703) mapDefault!16761)) b!401569))

(assert (= start!38660 b!401577))

(declare-fun m!394839 () Bool)

(assert (=> bm!28269 m!394839))

(declare-fun m!394841 () Bool)

(assert (=> bm!28269 m!394841))

(declare-fun m!394843 () Bool)

(assert (=> b!401576 m!394843))

(declare-fun m!394845 () Bool)

(assert (=> b!401575 m!394845))

(declare-fun m!394847 () Bool)

(assert (=> b!401573 m!394847))

(declare-fun m!394849 () Bool)

(assert (=> b!401573 m!394849))

(declare-fun m!394851 () Bool)

(assert (=> b!401571 m!394851))

(declare-fun m!394853 () Bool)

(assert (=> b!401581 m!394853))

(declare-fun m!394855 () Bool)

(assert (=> b!401574 m!394855))

(declare-fun m!394857 () Bool)

(assert (=> b!401578 m!394857))

(declare-fun m!394859 () Bool)

(assert (=> start!38660 m!394859))

(declare-fun m!394861 () Bool)

(assert (=> start!38660 m!394861))

(declare-fun m!394863 () Bool)

(assert (=> b!401579 m!394863))

(declare-fun m!394865 () Bool)

(assert (=> b!401568 m!394865))

(declare-fun m!394867 () Bool)

(assert (=> mapNonEmpty!16761 m!394867))

(assert (=> bm!28270 m!394839))

(declare-fun m!394869 () Bool)

(assert (=> bm!28270 m!394869))

(declare-fun m!394871 () Bool)

(assert (=> b!401583 m!394871))

(check-sat (not b!401578) (not b!401583) (not b!401574) (not b_next!9211) (not bm!28269) (not b!401568) (not b!401581) (not b!401576) (not b!401573) (not b!401571) (not b!401575) (not start!38660) (not mapNonEmpty!16761) (not bm!28270) b_and!16571 tp_is_empty!10093)
(check-sat b_and!16571 (not b_next!9211))
