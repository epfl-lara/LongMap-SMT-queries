; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38626 () Bool)

(assert start!38626)

(declare-fun b_free!9163 () Bool)

(declare-fun b_next!9163 () Bool)

(assert (=> start!38626 (= b_free!9163 (not b_next!9163))))

(declare-fun tp!32613 () Bool)

(declare-fun b_and!16549 () Bool)

(assert (=> start!38626 (= tp!32613 b_and!16549)))

(declare-fun b!400615 () Bool)

(declare-fun res!230508 () Bool)

(declare-fun e!241713 () Bool)

(assert (=> b!400615 (=> (not res!230508) (not e!241713))))

(declare-datatypes ((array!23999 0))(
  ( (array!24000 (arr!11449 (Array (_ BitVec 32) (_ BitVec 64))) (size!11801 (_ BitVec 32))) )
))
(declare-fun lt!187715 () array!23999)

(declare-datatypes ((List!6644 0))(
  ( (Nil!6641) (Cons!6640 (h!7496 (_ BitVec 64)) (t!11818 List!6644)) )
))
(declare-fun arrayNoDuplicates!0 (array!23999 (_ BitVec 32) List!6644) Bool)

(assert (=> b!400615 (= res!230508 (arrayNoDuplicates!0 lt!187715 #b00000000000000000000000000000000 Nil!6641))))

(declare-fun mapIsEmpty!16689 () Bool)

(declare-fun mapRes!16689 () Bool)

(assert (=> mapIsEmpty!16689 mapRes!16689))

(declare-fun b!400616 () Bool)

(declare-fun res!230506 () Bool)

(declare-fun e!241719 () Bool)

(assert (=> b!400616 (=> (not res!230506) (not e!241719))))

(declare-fun _keys!709 () array!23999)

(assert (=> b!400616 (= res!230506 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6641))))

(declare-fun b!400617 () Bool)

(declare-fun e!241717 () Bool)

(declare-datatypes ((V!14499 0))(
  ( (V!14500 (val!5067 Int)) )
))
(declare-datatypes ((tuple2!6722 0))(
  ( (tuple2!6723 (_1!3372 (_ BitVec 64)) (_2!3372 V!14499)) )
))
(declare-datatypes ((List!6645 0))(
  ( (Nil!6642) (Cons!6641 (h!7497 tuple2!6722) (t!11819 List!6645)) )
))
(declare-datatypes ((ListLongMap!5635 0))(
  ( (ListLongMap!5636 (toList!2833 List!6645)) )
))
(declare-fun call!28153 () ListLongMap!5635)

(declare-fun call!28154 () ListLongMap!5635)

(assert (=> b!400617 (= e!241717 (= call!28153 call!28154))))

(declare-fun b!400618 () Bool)

(declare-fun res!230514 () Bool)

(assert (=> b!400618 (=> (not res!230514) (not e!241719))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400618 (= res!230514 (or (= (select (arr!11449 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11449 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400619 () Bool)

(declare-fun res!230516 () Bool)

(assert (=> b!400619 (=> (not res!230516) (not e!241713))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400619 (= res!230516 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11801 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400620 () Bool)

(declare-fun res!230513 () Bool)

(assert (=> b!400620 (=> (not res!230513) (not e!241719))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400620 (= res!230513 (validKeyInArray!0 k!794))))

(declare-fun minValue!515 () V!14499)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4679 0))(
  ( (ValueCellFull!4679 (v!7314 V!14499)) (EmptyCell!4679) )
))
(declare-datatypes ((array!24001 0))(
  ( (array!24002 (arr!11450 (Array (_ BitVec 32) ValueCell!4679)) (size!11802 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24001)

(declare-fun zeroValue!515 () V!14499)

(declare-fun c!54701 () Bool)

(declare-fun v!412 () V!14499)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28150 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1046 (array!23999 array!24001 (_ BitVec 32) (_ BitVec 32) V!14499 V!14499 (_ BitVec 32) Int) ListLongMap!5635)

(assert (=> bm!28150 (= call!28154 (getCurrentListMapNoExtraKeys!1046 (ite c!54701 lt!187715 _keys!709) (ite c!54701 (array!24002 (store (arr!11450 _values!549) i!563 (ValueCellFull!4679 v!412)) (size!11802 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400621 () Bool)

(assert (=> b!400621 (= e!241719 e!241713)))

(declare-fun res!230517 () Bool)

(assert (=> b!400621 (=> (not res!230517) (not e!241713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23999 (_ BitVec 32)) Bool)

(assert (=> b!400621 (= res!230517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187715 mask!1025))))

(assert (=> b!400621 (= lt!187715 (array!24000 (store (arr!11449 _keys!709) i!563 k!794) (size!11801 _keys!709)))))

(declare-fun b!400622 () Bool)

(declare-fun res!230515 () Bool)

(assert (=> b!400622 (=> (not res!230515) (not e!241719))))

(assert (=> b!400622 (= res!230515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230509 () Bool)

(assert (=> start!38626 (=> (not res!230509) (not e!241719))))

(assert (=> start!38626 (= res!230509 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11801 _keys!709))))))

(assert (=> start!38626 e!241719))

(declare-fun tp_is_empty!10045 () Bool)

(assert (=> start!38626 tp_is_empty!10045))

(assert (=> start!38626 tp!32613))

(assert (=> start!38626 true))

(declare-fun e!241714 () Bool)

(declare-fun array_inv!8384 (array!24001) Bool)

(assert (=> start!38626 (and (array_inv!8384 _values!549) e!241714)))

(declare-fun array_inv!8385 (array!23999) Bool)

(assert (=> start!38626 (array_inv!8385 _keys!709)))

(declare-fun b!400623 () Bool)

(declare-fun e!241715 () Bool)

(assert (=> b!400623 (= e!241715 tp_is_empty!10045)))

(declare-fun b!400624 () Bool)

(declare-fun +!1118 (ListLongMap!5635 tuple2!6722) ListLongMap!5635)

(assert (=> b!400624 (= e!241717 (= call!28154 (+!1118 call!28153 (tuple2!6723 k!794 v!412))))))

(declare-fun b!400625 () Bool)

(assert (=> b!400625 (= e!241714 (and e!241715 mapRes!16689))))

(declare-fun condMapEmpty!16689 () Bool)

(declare-fun mapDefault!16689 () ValueCell!4679)

