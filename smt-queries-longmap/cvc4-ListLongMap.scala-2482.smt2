; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38714 () Bool)

(assert start!38714)

(declare-fun b_free!9251 () Bool)

(declare-fun b_next!9251 () Bool)

(assert (=> start!38714 (= b_free!9251 (not b_next!9251))))

(declare-fun tp!32876 () Bool)

(declare-fun b_and!16637 () Bool)

(assert (=> start!38714 (= tp!32876 b_and!16637)))

(declare-fun b!402859 () Bool)

(declare-fun res!232096 () Bool)

(declare-fun e!242641 () Bool)

(assert (=> b!402859 (=> (not res!232096) (not e!242641))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24171 0))(
  ( (array!24172 (arr!11535 (Array (_ BitVec 32) (_ BitVec 64))) (size!11887 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24171)

(assert (=> b!402859 (= res!232096 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11887 _keys!709))))))

(declare-datatypes ((V!14615 0))(
  ( (V!14616 (val!5111 Int)) )
))
(declare-datatypes ((tuple2!6790 0))(
  ( (tuple2!6791 (_1!3406 (_ BitVec 64)) (_2!3406 V!14615)) )
))
(declare-datatypes ((List!6712 0))(
  ( (Nil!6709) (Cons!6708 (h!7564 tuple2!6790) (t!11886 List!6712)) )
))
(declare-datatypes ((ListLongMap!5703 0))(
  ( (ListLongMap!5704 (toList!2867 List!6712)) )
))
(declare-fun call!28417 () ListLongMap!5703)

(declare-fun minValue!515 () V!14615)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4723 0))(
  ( (ValueCellFull!4723 (v!7358 V!14615)) (EmptyCell!4723) )
))
(declare-datatypes ((array!24173 0))(
  ( (array!24174 (arr!11536 (Array (_ BitVec 32) ValueCell!4723)) (size!11888 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24173)

(declare-fun bm!28414 () Bool)

(declare-fun zeroValue!515 () V!14615)

(declare-fun lt!187979 () array!24171)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54833 () Bool)

(declare-fun v!412 () V!14615)

(declare-fun getCurrentListMapNoExtraKeys!1077 (array!24171 array!24173 (_ BitVec 32) (_ BitVec 32) V!14615 V!14615 (_ BitVec 32) Int) ListLongMap!5703)

(assert (=> bm!28414 (= call!28417 (getCurrentListMapNoExtraKeys!1077 (ite c!54833 _keys!709 lt!187979) (ite c!54833 _values!549 (array!24174 (store (arr!11536 _values!549) i!563 (ValueCellFull!4723 v!412)) (size!11888 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402860 () Bool)

(declare-fun res!232098 () Bool)

(assert (=> b!402860 (=> (not res!232098) (not e!242641))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402860 (= res!232098 (validKeyInArray!0 k!794))))

(declare-fun b!402861 () Bool)

(declare-fun res!232095 () Bool)

(assert (=> b!402861 (=> (not res!232095) (not e!242641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402861 (= res!232095 (validMask!0 mask!1025))))

(declare-fun b!402862 () Bool)

(declare-fun res!232100 () Bool)

(assert (=> b!402862 (=> (not res!232100) (not e!242641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24171 (_ BitVec 32)) Bool)

(assert (=> b!402862 (= res!232100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16821 () Bool)

(declare-fun mapRes!16821 () Bool)

(assert (=> mapIsEmpty!16821 mapRes!16821))

(declare-fun bm!28415 () Bool)

(declare-fun call!28418 () ListLongMap!5703)

(assert (=> bm!28415 (= call!28418 (getCurrentListMapNoExtraKeys!1077 (ite c!54833 lt!187979 _keys!709) (ite c!54833 (array!24174 (store (arr!11536 _values!549) i!563 (ValueCellFull!4723 v!412)) (size!11888 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402863 () Bool)

(declare-fun res!232097 () Bool)

(assert (=> b!402863 (=> (not res!232097) (not e!242641))))

(declare-fun arrayContainsKey!0 (array!24171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402863 (= res!232097 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!402865 () Bool)

(declare-fun e!242642 () Bool)

(declare-fun tp_is_empty!10133 () Bool)

(assert (=> b!402865 (= e!242642 tp_is_empty!10133)))

(declare-fun mapNonEmpty!16821 () Bool)

(declare-fun tp!32877 () Bool)

(declare-fun e!242639 () Bool)

(assert (=> mapNonEmpty!16821 (= mapRes!16821 (and tp!32877 e!242639))))

(declare-fun mapValue!16821 () ValueCell!4723)

(declare-fun mapKey!16821 () (_ BitVec 32))

(declare-fun mapRest!16821 () (Array (_ BitVec 32) ValueCell!4723))

(assert (=> mapNonEmpty!16821 (= (arr!11536 _values!549) (store mapRest!16821 mapKey!16821 mapValue!16821))))

(declare-fun b!402866 () Bool)

(declare-fun res!232101 () Bool)

(declare-fun e!242643 () Bool)

(assert (=> b!402866 (=> (not res!232101) (not e!242643))))

(assert (=> b!402866 (= res!232101 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11887 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402867 () Bool)

(declare-fun res!232094 () Bool)

(assert (=> b!402867 (=> (not res!232094) (not e!242641))))

(assert (=> b!402867 (= res!232094 (or (= (select (arr!11535 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11535 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402868 () Bool)

(declare-fun e!242640 () Bool)

(declare-fun +!1143 (ListLongMap!5703 tuple2!6790) ListLongMap!5703)

(assert (=> b!402868 (= e!242640 (= call!28418 (+!1143 call!28417 (tuple2!6791 k!794 v!412))))))

(declare-fun b!402869 () Bool)

(declare-fun res!232093 () Bool)

(assert (=> b!402869 (=> (not res!232093) (not e!242641))))

(assert (=> b!402869 (= res!232093 (and (= (size!11888 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11887 _keys!709) (size!11888 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402870 () Bool)

(declare-fun res!232092 () Bool)

(assert (=> b!402870 (=> (not res!232092) (not e!242641))))

(declare-datatypes ((List!6713 0))(
  ( (Nil!6710) (Cons!6709 (h!7565 (_ BitVec 64)) (t!11887 List!6713)) )
))
(declare-fun arrayNoDuplicates!0 (array!24171 (_ BitVec 32) List!6713) Bool)

(assert (=> b!402870 (= res!232092 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6710))))

(declare-fun b!402871 () Bool)

(assert (=> b!402871 (= e!242641 e!242643)))

(declare-fun res!232099 () Bool)

(assert (=> b!402871 (=> (not res!232099) (not e!242643))))

(assert (=> b!402871 (= res!232099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187979 mask!1025))))

(assert (=> b!402871 (= lt!187979 (array!24172 (store (arr!11535 _keys!709) i!563 k!794) (size!11887 _keys!709)))))

(declare-fun b!402872 () Bool)

(declare-fun e!242637 () Bool)

(assert (=> b!402872 (= e!242637 (and e!242642 mapRes!16821))))

(declare-fun condMapEmpty!16821 () Bool)

(declare-fun mapDefault!16821 () ValueCell!4723)

