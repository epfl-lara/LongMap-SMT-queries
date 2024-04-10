; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38668 () Bool)

(assert start!38668)

(declare-fun b_free!9205 () Bool)

(declare-fun b_next!9205 () Bool)

(assert (=> start!38668 (= b_free!9205 (not b_next!9205))))

(declare-fun tp!32738 () Bool)

(declare-fun b_and!16591 () Bool)

(assert (=> start!38668 (= tp!32738 b_and!16591)))

(declare-fun mapIsEmpty!16752 () Bool)

(declare-fun mapRes!16752 () Bool)

(assert (=> mapIsEmpty!16752 mapRes!16752))

(declare-fun b!401686 () Bool)

(declare-fun res!231269 () Bool)

(declare-fun e!242154 () Bool)

(assert (=> b!401686 (=> (not res!231269) (not e!242154))))

(declare-datatypes ((array!24081 0))(
  ( (array!24082 (arr!11490 (Array (_ BitVec 32) (_ BitVec 64))) (size!11842 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24081)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24081 (_ BitVec 32)) Bool)

(assert (=> b!401686 (= res!231269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401687 () Bool)

(declare-fun e!242155 () Bool)

(declare-fun tp_is_empty!10087 () Bool)

(assert (=> b!401687 (= e!242155 tp_is_empty!10087)))

(declare-fun lt!187841 () array!24081)

(declare-datatypes ((V!14555 0))(
  ( (V!14556 (val!5088 Int)) )
))
(declare-fun minValue!515 () V!14555)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4700 0))(
  ( (ValueCellFull!4700 (v!7335 V!14555)) (EmptyCell!4700) )
))
(declare-datatypes ((array!24083 0))(
  ( (array!24084 (arr!11491 (Array (_ BitVec 32) ValueCell!4700)) (size!11843 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24083)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14555)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!28276 () Bool)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54764 () Bool)

(declare-datatypes ((tuple2!6754 0))(
  ( (tuple2!6755 (_1!3388 (_ BitVec 64)) (_2!3388 V!14555)) )
))
(declare-datatypes ((List!6677 0))(
  ( (Nil!6674) (Cons!6673 (h!7529 tuple2!6754) (t!11851 List!6677)) )
))
(declare-datatypes ((ListLongMap!5667 0))(
  ( (ListLongMap!5668 (toList!2849 List!6677)) )
))
(declare-fun call!28279 () ListLongMap!5667)

(declare-fun zeroValue!515 () V!14555)

(declare-fun getCurrentListMapNoExtraKeys!1061 (array!24081 array!24083 (_ BitVec 32) (_ BitVec 32) V!14555 V!14555 (_ BitVec 32) Int) ListLongMap!5667)

(assert (=> bm!28276 (= call!28279 (getCurrentListMapNoExtraKeys!1061 (ite c!54764 lt!187841 _keys!709) (ite c!54764 (array!24084 (store (arr!11491 _values!549) i!563 (ValueCellFull!4700 v!412)) (size!11843 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401688 () Bool)

(declare-fun res!231263 () Bool)

(assert (=> b!401688 (=> (not res!231263) (not e!242154))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401688 (= res!231263 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!401689 () Bool)

(declare-fun e!242158 () Bool)

(assert (=> b!401689 (= e!242158 tp_is_empty!10087)))

(declare-fun b!401690 () Bool)

(declare-fun res!231268 () Bool)

(assert (=> b!401690 (=> (not res!231268) (not e!242154))))

(assert (=> b!401690 (= res!231268 (and (= (size!11843 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11842 _keys!709) (size!11843 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401691 () Bool)

(declare-fun res!231266 () Bool)

(assert (=> b!401691 (=> (not res!231266) (not e!242154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401691 (= res!231266 (validMask!0 mask!1025))))

(declare-fun res!231270 () Bool)

(assert (=> start!38668 (=> (not res!231270) (not e!242154))))

(assert (=> start!38668 (= res!231270 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11842 _keys!709))))))

(assert (=> start!38668 e!242154))

(assert (=> start!38668 tp_is_empty!10087))

(assert (=> start!38668 tp!32738))

(assert (=> start!38668 true))

(declare-fun e!242156 () Bool)

(declare-fun array_inv!8412 (array!24083) Bool)

(assert (=> start!38668 (and (array_inv!8412 _values!549) e!242156)))

(declare-fun array_inv!8413 (array!24081) Bool)

(assert (=> start!38668 (array_inv!8413 _keys!709)))

(declare-fun b!401692 () Bool)

(declare-fun e!242160 () Bool)

(assert (=> b!401692 (= e!242160 (not true))))

(declare-fun e!242157 () Bool)

(assert (=> b!401692 e!242157))

(assert (=> b!401692 (= c!54764 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12166 0))(
  ( (Unit!12167) )
))
(declare-fun lt!187840 () Unit!12166)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!341 (array!24081 array!24083 (_ BitVec 32) (_ BitVec 32) V!14555 V!14555 (_ BitVec 32) (_ BitVec 64) V!14555 (_ BitVec 32) Int) Unit!12166)

(assert (=> b!401692 (= lt!187840 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!341 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28277 () Bool)

(declare-fun call!28280 () ListLongMap!5667)

(assert (=> bm!28277 (= call!28280 (getCurrentListMapNoExtraKeys!1061 (ite c!54764 _keys!709 lt!187841) (ite c!54764 _values!549 (array!24084 (store (arr!11491 _values!549) i!563 (ValueCellFull!4700 v!412)) (size!11843 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401693 () Bool)

(declare-fun res!231264 () Bool)

(assert (=> b!401693 (=> (not res!231264) (not e!242160))))

(declare-datatypes ((List!6678 0))(
  ( (Nil!6675) (Cons!6674 (h!7530 (_ BitVec 64)) (t!11852 List!6678)) )
))
(declare-fun arrayNoDuplicates!0 (array!24081 (_ BitVec 32) List!6678) Bool)

(assert (=> b!401693 (= res!231264 (arrayNoDuplicates!0 lt!187841 #b00000000000000000000000000000000 Nil!6675))))

(declare-fun b!401694 () Bool)

(assert (=> b!401694 (= e!242157 (= call!28280 call!28279))))

(declare-fun b!401695 () Bool)

(declare-fun res!231265 () Bool)

(assert (=> b!401695 (=> (not res!231265) (not e!242154))))

(assert (=> b!401695 (= res!231265 (or (= (select (arr!11490 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11490 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401696 () Bool)

(declare-fun res!231262 () Bool)

(assert (=> b!401696 (=> (not res!231262) (not e!242154))))

(assert (=> b!401696 (= res!231262 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6675))))

(declare-fun b!401697 () Bool)

(declare-fun res!231273 () Bool)

(assert (=> b!401697 (=> (not res!231273) (not e!242160))))

(assert (=> b!401697 (= res!231273 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11842 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401698 () Bool)

(assert (=> b!401698 (= e!242154 e!242160)))

(declare-fun res!231267 () Bool)

(assert (=> b!401698 (=> (not res!231267) (not e!242160))))

(assert (=> b!401698 (= res!231267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187841 mask!1025))))

(assert (=> b!401698 (= lt!187841 (array!24082 (store (arr!11490 _keys!709) i!563 k!794) (size!11842 _keys!709)))))

(declare-fun b!401699 () Bool)

(declare-fun +!1131 (ListLongMap!5667 tuple2!6754) ListLongMap!5667)

(assert (=> b!401699 (= e!242157 (= call!28279 (+!1131 call!28280 (tuple2!6755 k!794 v!412))))))

(declare-fun mapNonEmpty!16752 () Bool)

(declare-fun tp!32739 () Bool)

(assert (=> mapNonEmpty!16752 (= mapRes!16752 (and tp!32739 e!242158))))

(declare-fun mapValue!16752 () ValueCell!4700)

(declare-fun mapRest!16752 () (Array (_ BitVec 32) ValueCell!4700))

(declare-fun mapKey!16752 () (_ BitVec 32))

(assert (=> mapNonEmpty!16752 (= (arr!11491 _values!549) (store mapRest!16752 mapKey!16752 mapValue!16752))))

(declare-fun b!401700 () Bool)

(assert (=> b!401700 (= e!242156 (and e!242155 mapRes!16752))))

(declare-fun condMapEmpty!16752 () Bool)

(declare-fun mapDefault!16752 () ValueCell!4700)

