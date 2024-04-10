; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38744 () Bool)

(assert start!38744)

(declare-fun b_free!9281 () Bool)

(declare-fun b_next!9281 () Bool)

(assert (=> start!38744 (= b_free!9281 (not b_next!9281))))

(declare-fun tp!32967 () Bool)

(declare-fun b_and!16667 () Bool)

(assert (=> start!38744 (= tp!32967 b_and!16667)))

(declare-fun mapNonEmpty!16866 () Bool)

(declare-fun mapRes!16866 () Bool)

(declare-fun tp!32966 () Bool)

(declare-fun e!242956 () Bool)

(assert (=> mapNonEmpty!16866 (= mapRes!16866 (and tp!32966 e!242956))))

(declare-datatypes ((V!14655 0))(
  ( (V!14656 (val!5126 Int)) )
))
(declare-datatypes ((ValueCell!4738 0))(
  ( (ValueCellFull!4738 (v!7373 V!14655)) (EmptyCell!4738) )
))
(declare-fun mapValue!16866 () ValueCell!4738)

(declare-fun mapKey!16866 () (_ BitVec 32))

(declare-datatypes ((array!24225 0))(
  ( (array!24226 (arr!11562 (Array (_ BitVec 32) ValueCell!4738)) (size!11914 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24225)

(declare-fun mapRest!16866 () (Array (_ BitVec 32) ValueCell!4738))

(assert (=> mapNonEmpty!16866 (= (arr!11562 _values!549) (store mapRest!16866 mapKey!16866 mapValue!16866))))

(declare-fun minValue!515 () V!14655)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28504 () Bool)

(declare-fun zeroValue!515 () V!14655)

(declare-datatypes ((array!24227 0))(
  ( (array!24228 (arr!11563 (Array (_ BitVec 32) (_ BitVec 64))) (size!11915 (_ BitVec 32))) )
))
(declare-fun lt!188069 () array!24227)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54878 () Bool)

(declare-fun v!412 () V!14655)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6814 0))(
  ( (tuple2!6815 (_1!3418 (_ BitVec 64)) (_2!3418 V!14655)) )
))
(declare-datatypes ((List!6732 0))(
  ( (Nil!6729) (Cons!6728 (h!7584 tuple2!6814) (t!11906 List!6732)) )
))
(declare-datatypes ((ListLongMap!5727 0))(
  ( (ListLongMap!5728 (toList!2879 List!6732)) )
))
(declare-fun call!28508 () ListLongMap!5727)

(declare-fun _keys!709 () array!24227)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1088 (array!24227 array!24225 (_ BitVec 32) (_ BitVec 32) V!14655 V!14655 (_ BitVec 32) Int) ListLongMap!5727)

(assert (=> bm!28504 (= call!28508 (getCurrentListMapNoExtraKeys!1088 (ite c!54878 lt!188069 _keys!709) (ite c!54878 (array!24226 (store (arr!11562 _values!549) i!563 (ValueCellFull!4738 v!412)) (size!11914 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16866 () Bool)

(assert (=> mapIsEmpty!16866 mapRes!16866))

(declare-fun b!403624 () Bool)

(declare-fun e!242952 () Bool)

(declare-fun e!242954 () Bool)

(assert (=> b!403624 (= e!242952 e!242954)))

(declare-fun res!232640 () Bool)

(assert (=> b!403624 (=> (not res!232640) (not e!242954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24227 (_ BitVec 32)) Bool)

(assert (=> b!403624 (= res!232640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188069 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!403624 (= lt!188069 (array!24228 (store (arr!11563 _keys!709) i!563 k!794) (size!11915 _keys!709)))))

(declare-fun res!232641 () Bool)

(assert (=> start!38744 (=> (not res!232641) (not e!242952))))

(assert (=> start!38744 (= res!232641 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11915 _keys!709))))))

(assert (=> start!38744 e!242952))

(declare-fun tp_is_empty!10163 () Bool)

(assert (=> start!38744 tp_is_empty!10163))

(assert (=> start!38744 tp!32967))

(assert (=> start!38744 true))

(declare-fun e!242958 () Bool)

(declare-fun array_inv!8458 (array!24225) Bool)

(assert (=> start!38744 (and (array_inv!8458 _values!549) e!242958)))

(declare-fun array_inv!8459 (array!24227) Bool)

(assert (=> start!38744 (array_inv!8459 _keys!709)))

(declare-fun call!28507 () ListLongMap!5727)

(declare-fun bm!28505 () Bool)

(assert (=> bm!28505 (= call!28507 (getCurrentListMapNoExtraKeys!1088 (ite c!54878 _keys!709 lt!188069) (ite c!54878 _values!549 (array!24226 (store (arr!11562 _values!549) i!563 (ValueCellFull!4738 v!412)) (size!11914 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403625 () Bool)

(declare-fun res!232632 () Bool)

(assert (=> b!403625 (=> (not res!232632) (not e!242952))))

(assert (=> b!403625 (= res!232632 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11915 _keys!709))))))

(declare-fun b!403626 () Bool)

(declare-fun res!232635 () Bool)

(assert (=> b!403626 (=> (not res!232635) (not e!242952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403626 (= res!232635 (validMask!0 mask!1025))))

(declare-fun b!403627 () Bool)

(declare-fun res!232633 () Bool)

(assert (=> b!403627 (=> (not res!232633) (not e!242952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403627 (= res!232633 (validKeyInArray!0 k!794))))

(declare-fun b!403628 () Bool)

(declare-fun res!232630 () Bool)

(assert (=> b!403628 (=> (not res!232630) (not e!242952))))

(assert (=> b!403628 (= res!232630 (or (= (select (arr!11563 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11563 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403629 () Bool)

(declare-fun res!232634 () Bool)

(assert (=> b!403629 (=> (not res!232634) (not e!242952))))

(declare-datatypes ((List!6733 0))(
  ( (Nil!6730) (Cons!6729 (h!7585 (_ BitVec 64)) (t!11907 List!6733)) )
))
(declare-fun arrayNoDuplicates!0 (array!24227 (_ BitVec 32) List!6733) Bool)

(assert (=> b!403629 (= res!232634 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6730))))

(declare-fun b!403630 () Bool)

(declare-fun e!242955 () Bool)

(assert (=> b!403630 (= e!242955 tp_is_empty!10163)))

(declare-fun b!403631 () Bool)

(declare-fun e!242957 () Bool)

(declare-fun +!1153 (ListLongMap!5727 tuple2!6814) ListLongMap!5727)

(assert (=> b!403631 (= e!242957 (= call!28508 (+!1153 call!28507 (tuple2!6815 k!794 v!412))))))

(declare-fun b!403632 () Bool)

(assert (=> b!403632 (= e!242958 (and e!242955 mapRes!16866))))

(declare-fun condMapEmpty!16866 () Bool)

(declare-fun mapDefault!16866 () ValueCell!4738)

