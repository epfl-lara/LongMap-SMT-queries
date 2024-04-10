; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38644 () Bool)

(assert start!38644)

(declare-fun b_free!9181 () Bool)

(declare-fun b_next!9181 () Bool)

(assert (=> start!38644 (= b_free!9181 (not b_next!9181))))

(declare-fun tp!32666 () Bool)

(declare-fun b_and!16567 () Bool)

(assert (=> start!38644 (= tp!32666 b_and!16567)))

(declare-fun b!401074 () Bool)

(declare-fun e!241904 () Bool)

(declare-datatypes ((V!14523 0))(
  ( (V!14524 (val!5076 Int)) )
))
(declare-datatypes ((tuple2!6732 0))(
  ( (tuple2!6733 (_1!3377 (_ BitVec 64)) (_2!3377 V!14523)) )
))
(declare-datatypes ((List!6656 0))(
  ( (Nil!6653) (Cons!6652 (h!7508 tuple2!6732) (t!11830 List!6656)) )
))
(declare-datatypes ((ListLongMap!5645 0))(
  ( (ListLongMap!5646 (toList!2838 List!6656)) )
))
(declare-fun call!28207 () ListLongMap!5645)

(declare-fun call!28208 () ListLongMap!5645)

(assert (=> b!401074 (= e!241904 (= call!28207 call!28208))))

(declare-fun b!401075 () Bool)

(declare-fun e!241905 () Bool)

(assert (=> b!401075 (= e!241905 (not true))))

(assert (=> b!401075 e!241904))

(declare-fun c!54728 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401075 (= c!54728 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4688 0))(
  ( (ValueCellFull!4688 (v!7323 V!14523)) (EmptyCell!4688) )
))
(declare-datatypes ((array!24035 0))(
  ( (array!24036 (arr!11467 (Array (_ BitVec 32) ValueCell!4688)) (size!11819 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24035)

(declare-datatypes ((Unit!12148 0))(
  ( (Unit!12149) )
))
(declare-fun lt!187768 () Unit!12148)

(declare-fun zeroValue!515 () V!14523)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24037 0))(
  ( (array!24038 (arr!11468 (Array (_ BitVec 32) (_ BitVec 64))) (size!11820 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24037)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!332 (array!24037 array!24035 (_ BitVec 32) (_ BitVec 32) V!14523 V!14523 (_ BitVec 32) (_ BitVec 64) V!14523 (_ BitVec 32) Int) Unit!12148)

(assert (=> b!401075 (= lt!187768 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!332 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401076 () Bool)

(declare-fun res!230835 () Bool)

(declare-fun e!241902 () Bool)

(assert (=> b!401076 (=> (not res!230835) (not e!241902))))

(assert (=> b!401076 (= res!230835 (and (= (size!11819 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11820 _keys!709) (size!11819 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401077 () Bool)

(declare-fun res!230837 () Bool)

(assert (=> b!401077 (=> (not res!230837) (not e!241902))))

(declare-datatypes ((List!6657 0))(
  ( (Nil!6654) (Cons!6653 (h!7509 (_ BitVec 64)) (t!11831 List!6657)) )
))
(declare-fun arrayNoDuplicates!0 (array!24037 (_ BitVec 32) List!6657) Bool)

(assert (=> b!401077 (= res!230837 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6654))))

(declare-fun b!401078 () Bool)

(declare-fun res!230834 () Bool)

(assert (=> b!401078 (=> (not res!230834) (not e!241902))))

(declare-fun arrayContainsKey!0 (array!24037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401078 (= res!230834 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!401079 () Bool)

(declare-fun res!230836 () Bool)

(assert (=> b!401079 (=> (not res!230836) (not e!241902))))

(assert (=> b!401079 (= res!230836 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11820 _keys!709))))))

(declare-fun b!401080 () Bool)

(declare-fun res!230839 () Bool)

(assert (=> b!401080 (=> (not res!230839) (not e!241902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401080 (= res!230839 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16716 () Bool)

(declare-fun mapRes!16716 () Bool)

(assert (=> mapIsEmpty!16716 mapRes!16716))

(declare-fun b!401081 () Bool)

(assert (=> b!401081 (= e!241902 e!241905)))

(declare-fun res!230830 () Bool)

(assert (=> b!401081 (=> (not res!230830) (not e!241905))))

(declare-fun lt!187769 () array!24037)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24037 (_ BitVec 32)) Bool)

(assert (=> b!401081 (= res!230830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187769 mask!1025))))

(assert (=> b!401081 (= lt!187769 (array!24038 (store (arr!11468 _keys!709) i!563 k!794) (size!11820 _keys!709)))))

(declare-fun b!401082 () Bool)

(declare-fun res!230833 () Bool)

(assert (=> b!401082 (=> (not res!230833) (not e!241905))))

(assert (=> b!401082 (= res!230833 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11820 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401083 () Bool)

(declare-fun +!1123 (ListLongMap!5645 tuple2!6732) ListLongMap!5645)

(assert (=> b!401083 (= e!241904 (= call!28208 (+!1123 call!28207 (tuple2!6733 k!794 v!412))))))

(declare-fun bm!28204 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1051 (array!24037 array!24035 (_ BitVec 32) (_ BitVec 32) V!14523 V!14523 (_ BitVec 32) Int) ListLongMap!5645)

(assert (=> bm!28204 (= call!28208 (getCurrentListMapNoExtraKeys!1051 (ite c!54728 lt!187769 _keys!709) (ite c!54728 (array!24036 (store (arr!11467 _values!549) i!563 (ValueCellFull!4688 v!412)) (size!11819 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401085 () Bool)

(declare-fun res!230841 () Bool)

(assert (=> b!401085 (=> (not res!230841) (not e!241902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401085 (= res!230841 (validKeyInArray!0 k!794))))

(declare-fun bm!28205 () Bool)

(assert (=> bm!28205 (= call!28207 (getCurrentListMapNoExtraKeys!1051 (ite c!54728 _keys!709 lt!187769) (ite c!54728 _values!549 (array!24036 (store (arr!11467 _values!549) i!563 (ValueCellFull!4688 v!412)) (size!11819 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401086 () Bool)

(declare-fun res!230838 () Bool)

(assert (=> b!401086 (=> (not res!230838) (not e!241902))))

(assert (=> b!401086 (= res!230838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401087 () Bool)

(declare-fun res!230832 () Bool)

(assert (=> b!401087 (=> (not res!230832) (not e!241905))))

(assert (=> b!401087 (= res!230832 (arrayNoDuplicates!0 lt!187769 #b00000000000000000000000000000000 Nil!6654))))

(declare-fun b!401088 () Bool)

(declare-fun e!241906 () Bool)

(declare-fun e!241903 () Bool)

(assert (=> b!401088 (= e!241906 (and e!241903 mapRes!16716))))

(declare-fun condMapEmpty!16716 () Bool)

(declare-fun mapDefault!16716 () ValueCell!4688)

