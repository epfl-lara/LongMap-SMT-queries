; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38642 () Bool)

(assert start!38642)

(declare-fun b_free!9179 () Bool)

(declare-fun b_next!9179 () Bool)

(assert (=> start!38642 (= b_free!9179 (not b_next!9179))))

(declare-fun tp!32660 () Bool)

(declare-fun b_and!16565 () Bool)

(assert (=> start!38642 (= tp!32660 b_and!16565)))

(declare-fun mapIsEmpty!16713 () Bool)

(declare-fun mapRes!16713 () Bool)

(assert (=> mapIsEmpty!16713 mapRes!16713))

(declare-fun b!401023 () Bool)

(declare-fun e!241884 () Bool)

(assert (=> b!401023 (= e!241884 (not true))))

(declare-fun e!241882 () Bool)

(assert (=> b!401023 e!241882))

(declare-fun c!54725 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401023 (= c!54725 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14519 0))(
  ( (V!14520 (val!5075 Int)) )
))
(declare-fun minValue!515 () V!14519)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4687 0))(
  ( (ValueCellFull!4687 (v!7322 V!14519)) (EmptyCell!4687) )
))
(declare-datatypes ((array!24031 0))(
  ( (array!24032 (arr!11465 (Array (_ BitVec 32) ValueCell!4687)) (size!11817 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24031)

(declare-fun zeroValue!515 () V!14519)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12146 0))(
  ( (Unit!12147) )
))
(declare-fun lt!187763 () Unit!12146)

(declare-fun v!412 () V!14519)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24033 0))(
  ( (array!24034 (arr!11466 (Array (_ BitVec 32) (_ BitVec 64))) (size!11818 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24033)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!331 (array!24033 array!24031 (_ BitVec 32) (_ BitVec 32) V!14519 V!14519 (_ BitVec 32) (_ BitVec 64) V!14519 (_ BitVec 32) Int) Unit!12146)

(assert (=> b!401023 (= lt!187763 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401024 () Bool)

(declare-datatypes ((tuple2!6730 0))(
  ( (tuple2!6731 (_1!3376 (_ BitVec 64)) (_2!3376 V!14519)) )
))
(declare-datatypes ((List!6654 0))(
  ( (Nil!6651) (Cons!6650 (h!7506 tuple2!6730) (t!11828 List!6654)) )
))
(declare-datatypes ((ListLongMap!5643 0))(
  ( (ListLongMap!5644 (toList!2837 List!6654)) )
))
(declare-fun call!28201 () ListLongMap!5643)

(declare-fun call!28202 () ListLongMap!5643)

(declare-fun +!1122 (ListLongMap!5643 tuple2!6730) ListLongMap!5643)

(assert (=> b!401024 (= e!241882 (= call!28201 (+!1122 call!28202 (tuple2!6731 k!794 v!412))))))

(declare-fun b!401025 () Bool)

(declare-fun res!230799 () Bool)

(assert (=> b!401025 (=> (not res!230799) (not e!241884))))

(declare-fun lt!187762 () array!24033)

(declare-datatypes ((List!6655 0))(
  ( (Nil!6652) (Cons!6651 (h!7507 (_ BitVec 64)) (t!11829 List!6655)) )
))
(declare-fun arrayNoDuplicates!0 (array!24033 (_ BitVec 32) List!6655) Bool)

(assert (=> b!401025 (= res!230799 (arrayNoDuplicates!0 lt!187762 #b00000000000000000000000000000000 Nil!6652))))

(declare-fun b!401026 () Bool)

(declare-fun res!230797 () Bool)

(declare-fun e!241881 () Bool)

(assert (=> b!401026 (=> (not res!230797) (not e!241881))))

(assert (=> b!401026 (= res!230797 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6652))))

(declare-fun b!401027 () Bool)

(declare-fun res!230805 () Bool)

(assert (=> b!401027 (=> (not res!230805) (not e!241884))))

(assert (=> b!401027 (= res!230805 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11818 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401028 () Bool)

(declare-fun res!230796 () Bool)

(assert (=> b!401028 (=> (not res!230796) (not e!241881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24033 (_ BitVec 32)) Bool)

(assert (=> b!401028 (= res!230796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230802 () Bool)

(assert (=> start!38642 (=> (not res!230802) (not e!241881))))

(assert (=> start!38642 (= res!230802 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11818 _keys!709))))))

(assert (=> start!38642 e!241881))

(declare-fun tp_is_empty!10061 () Bool)

(assert (=> start!38642 tp_is_empty!10061))

(assert (=> start!38642 tp!32660))

(assert (=> start!38642 true))

(declare-fun e!241886 () Bool)

(declare-fun array_inv!8394 (array!24031) Bool)

(assert (=> start!38642 (and (array_inv!8394 _values!549) e!241886)))

(declare-fun array_inv!8395 (array!24033) Bool)

(assert (=> start!38642 (array_inv!8395 _keys!709)))

(declare-fun mapNonEmpty!16713 () Bool)

(declare-fun tp!32661 () Bool)

(declare-fun e!241887 () Bool)

(assert (=> mapNonEmpty!16713 (= mapRes!16713 (and tp!32661 e!241887))))

(declare-fun mapValue!16713 () ValueCell!4687)

(declare-fun mapKey!16713 () (_ BitVec 32))

(declare-fun mapRest!16713 () (Array (_ BitVec 32) ValueCell!4687))

(assert (=> mapNonEmpty!16713 (= (arr!11465 _values!549) (store mapRest!16713 mapKey!16713 mapValue!16713))))

(declare-fun b!401029 () Bool)

(declare-fun res!230804 () Bool)

(assert (=> b!401029 (=> (not res!230804) (not e!241881))))

(declare-fun arrayContainsKey!0 (array!24033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401029 (= res!230804 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28198 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1050 (array!24033 array!24031 (_ BitVec 32) (_ BitVec 32) V!14519 V!14519 (_ BitVec 32) Int) ListLongMap!5643)

(assert (=> bm!28198 (= call!28202 (getCurrentListMapNoExtraKeys!1050 (ite c!54725 _keys!709 lt!187762) (ite c!54725 _values!549 (array!24032 (store (arr!11465 _values!549) i!563 (ValueCellFull!4687 v!412)) (size!11817 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401030 () Bool)

(assert (=> b!401030 (= e!241881 e!241884)))

(declare-fun res!230798 () Bool)

(assert (=> b!401030 (=> (not res!230798) (not e!241884))))

(assert (=> b!401030 (= res!230798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187762 mask!1025))))

(assert (=> b!401030 (= lt!187762 (array!24034 (store (arr!11466 _keys!709) i!563 k!794) (size!11818 _keys!709)))))

(declare-fun b!401031 () Bool)

(declare-fun res!230800 () Bool)

(assert (=> b!401031 (=> (not res!230800) (not e!241881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401031 (= res!230800 (validMask!0 mask!1025))))

(declare-fun b!401032 () Bool)

(declare-fun res!230795 () Bool)

(assert (=> b!401032 (=> (not res!230795) (not e!241881))))

(assert (=> b!401032 (= res!230795 (and (= (size!11817 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11818 _keys!709) (size!11817 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401033 () Bool)

(declare-fun res!230794 () Bool)

(assert (=> b!401033 (=> (not res!230794) (not e!241881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401033 (= res!230794 (validKeyInArray!0 k!794))))

(declare-fun b!401034 () Bool)

(declare-fun res!230803 () Bool)

(assert (=> b!401034 (=> (not res!230803) (not e!241881))))

(assert (=> b!401034 (= res!230803 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11818 _keys!709))))))

(declare-fun b!401035 () Bool)

(assert (=> b!401035 (= e!241887 tp_is_empty!10061)))

(declare-fun b!401036 () Bool)

(declare-fun e!241885 () Bool)

(assert (=> b!401036 (= e!241886 (and e!241885 mapRes!16713))))

(declare-fun condMapEmpty!16713 () Bool)

(declare-fun mapDefault!16713 () ValueCell!4687)

