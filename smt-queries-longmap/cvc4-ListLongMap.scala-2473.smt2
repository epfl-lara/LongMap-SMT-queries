; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38660 () Bool)

(assert start!38660)

(declare-fun b_free!9197 () Bool)

(declare-fun b_next!9197 () Bool)

(assert (=> start!38660 (= b_free!9197 (not b_next!9197))))

(declare-fun tp!32714 () Bool)

(declare-fun b_and!16583 () Bool)

(assert (=> start!38660 (= tp!32714 b_and!16583)))

(declare-fun b!401482 () Bool)

(declare-fun res!231126 () Bool)

(declare-fun e!242075 () Bool)

(assert (=> b!401482 (=> (not res!231126) (not e!242075))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401482 (= res!231126 (validKeyInArray!0 k!794))))

(declare-datatypes ((V!14543 0))(
  ( (V!14544 (val!5084 Int)) )
))
(declare-fun minValue!515 () V!14543)

(declare-fun bm!28252 () Bool)

(declare-datatypes ((ValueCell!4696 0))(
  ( (ValueCellFull!4696 (v!7331 V!14543)) (EmptyCell!4696) )
))
(declare-datatypes ((array!24065 0))(
  ( (array!24066 (arr!11482 (Array (_ BitVec 32) ValueCell!4696)) (size!11834 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24065)

(declare-fun zeroValue!515 () V!14543)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!6746 0))(
  ( (tuple2!6747 (_1!3384 (_ BitVec 64)) (_2!3384 V!14543)) )
))
(declare-datatypes ((List!6670 0))(
  ( (Nil!6667) (Cons!6666 (h!7522 tuple2!6746) (t!11844 List!6670)) )
))
(declare-datatypes ((ListLongMap!5659 0))(
  ( (ListLongMap!5660 (toList!2845 List!6670)) )
))
(declare-fun call!28255 () ListLongMap!5659)

(declare-fun v!412 () V!14543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24067 0))(
  ( (array!24068 (arr!11483 (Array (_ BitVec 32) (_ BitVec 64))) (size!11835 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24067)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!187816 () array!24067)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54752 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1057 (array!24067 array!24065 (_ BitVec 32) (_ BitVec 32) V!14543 V!14543 (_ BitVec 32) Int) ListLongMap!5659)

(assert (=> bm!28252 (= call!28255 (getCurrentListMapNoExtraKeys!1057 (ite c!54752 _keys!709 lt!187816) (ite c!54752 _values!549 (array!24066 (store (arr!11482 _values!549) i!563 (ValueCellFull!4696 v!412)) (size!11834 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401483 () Bool)

(declare-fun e!242072 () Bool)

(declare-fun tp_is_empty!10079 () Bool)

(assert (=> b!401483 (= e!242072 tp_is_empty!10079)))

(declare-fun res!231128 () Bool)

(assert (=> start!38660 (=> (not res!231128) (not e!242075))))

(assert (=> start!38660 (= res!231128 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11835 _keys!709))))))

(assert (=> start!38660 e!242075))

(assert (=> start!38660 tp_is_empty!10079))

(assert (=> start!38660 tp!32714))

(assert (=> start!38660 true))

(declare-fun e!242074 () Bool)

(declare-fun array_inv!8404 (array!24065) Bool)

(assert (=> start!38660 (and (array_inv!8404 _values!549) e!242074)))

(declare-fun array_inv!8405 (array!24067) Bool)

(assert (=> start!38660 (array_inv!8405 _keys!709)))

(declare-fun b!401484 () Bool)

(declare-fun res!231127 () Bool)

(assert (=> b!401484 (=> (not res!231127) (not e!242075))))

(assert (=> b!401484 (= res!231127 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11835 _keys!709))))))

(declare-fun b!401485 () Bool)

(declare-fun res!231122 () Bool)

(assert (=> b!401485 (=> (not res!231122) (not e!242075))))

(declare-datatypes ((List!6671 0))(
  ( (Nil!6668) (Cons!6667 (h!7523 (_ BitVec 64)) (t!11845 List!6671)) )
))
(declare-fun arrayNoDuplicates!0 (array!24067 (_ BitVec 32) List!6671) Bool)

(assert (=> b!401485 (= res!231122 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6668))))

(declare-fun b!401486 () Bool)

(declare-fun res!231120 () Bool)

(assert (=> b!401486 (=> (not res!231120) (not e!242075))))

(declare-fun arrayContainsKey!0 (array!24067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401486 (= res!231120 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!401487 () Bool)

(declare-fun res!231121 () Bool)

(declare-fun e!242073 () Bool)

(assert (=> b!401487 (=> (not res!231121) (not e!242073))))

(assert (=> b!401487 (= res!231121 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11835 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401488 () Bool)

(assert (=> b!401488 (= e!242073 (not true))))

(declare-fun e!242071 () Bool)

(assert (=> b!401488 e!242071))

(assert (=> b!401488 (= c!54752 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12160 0))(
  ( (Unit!12161) )
))
(declare-fun lt!187817 () Unit!12160)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!338 (array!24067 array!24065 (_ BitVec 32) (_ BitVec 32) V!14543 V!14543 (_ BitVec 32) (_ BitVec 64) V!14543 (_ BitVec 32) Int) Unit!12160)

(assert (=> b!401488 (= lt!187817 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16740 () Bool)

(declare-fun mapRes!16740 () Bool)

(assert (=> mapIsEmpty!16740 mapRes!16740))

(declare-fun bm!28253 () Bool)

(declare-fun call!28256 () ListLongMap!5659)

(assert (=> bm!28253 (= call!28256 (getCurrentListMapNoExtraKeys!1057 (ite c!54752 lt!187816 _keys!709) (ite c!54752 (array!24066 (store (arr!11482 _values!549) i!563 (ValueCellFull!4696 v!412)) (size!11834 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401489 () Bool)

(declare-fun +!1129 (ListLongMap!5659 tuple2!6746) ListLongMap!5659)

(assert (=> b!401489 (= e!242071 (= call!28256 (+!1129 call!28255 (tuple2!6747 k!794 v!412))))))

(declare-fun b!401490 () Bool)

(declare-fun e!242070 () Bool)

(assert (=> b!401490 (= e!242070 tp_is_empty!10079)))

(declare-fun mapNonEmpty!16740 () Bool)

(declare-fun tp!32715 () Bool)

(assert (=> mapNonEmpty!16740 (= mapRes!16740 (and tp!32715 e!242072))))

(declare-fun mapRest!16740 () (Array (_ BitVec 32) ValueCell!4696))

(declare-fun mapKey!16740 () (_ BitVec 32))

(declare-fun mapValue!16740 () ValueCell!4696)

(assert (=> mapNonEmpty!16740 (= (arr!11482 _values!549) (store mapRest!16740 mapKey!16740 mapValue!16740))))

(declare-fun b!401491 () Bool)

(declare-fun res!231125 () Bool)

(assert (=> b!401491 (=> (not res!231125) (not e!242075))))

(assert (=> b!401491 (= res!231125 (and (= (size!11834 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11835 _keys!709) (size!11834 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401492 () Bool)

(declare-fun res!231129 () Bool)

(assert (=> b!401492 (=> (not res!231129) (not e!242073))))

(assert (=> b!401492 (= res!231129 (arrayNoDuplicates!0 lt!187816 #b00000000000000000000000000000000 Nil!6668))))

(declare-fun b!401493 () Bool)

(assert (=> b!401493 (= e!242071 (= call!28255 call!28256))))

(declare-fun b!401494 () Bool)

(assert (=> b!401494 (= e!242074 (and e!242070 mapRes!16740))))

(declare-fun condMapEmpty!16740 () Bool)

(declare-fun mapDefault!16740 () ValueCell!4696)

