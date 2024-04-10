; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37136 () Bool)

(assert start!37136)

(declare-fun b_free!8263 () Bool)

(declare-fun b_next!8263 () Bool)

(assert (=> start!37136 (= b_free!8263 (not b_next!8263))))

(declare-fun tp!29504 () Bool)

(declare-fun b_and!15505 () Bool)

(assert (=> start!37136 (= tp!29504 b_and!15505)))

(declare-fun b!374352 () Bool)

(declare-fun res!211084 () Bool)

(declare-fun e!228151 () Bool)

(assert (=> b!374352 (=> (not res!211084) (not e!228151))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21761 0))(
  ( (array!21762 (arr!10349 (Array (_ BitVec 32) (_ BitVec 64))) (size!10701 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21761)

(assert (=> b!374352 (= res!211084 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10701 _keys!658))))))

(declare-fun b!374353 () Bool)

(declare-fun e!228154 () Bool)

(declare-fun tp_is_empty!8911 () Bool)

(assert (=> b!374353 (= e!228154 tp_is_empty!8911)))

(declare-fun res!211076 () Bool)

(assert (=> start!37136 (=> (not res!211076) (not e!228151))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37136 (= res!211076 (validMask!0 mask!970))))

(assert (=> start!37136 e!228151))

(declare-datatypes ((V!12987 0))(
  ( (V!12988 (val!4500 Int)) )
))
(declare-datatypes ((ValueCell!4112 0))(
  ( (ValueCellFull!4112 (v!6697 V!12987)) (EmptyCell!4112) )
))
(declare-datatypes ((array!21763 0))(
  ( (array!21764 (arr!10350 (Array (_ BitVec 32) ValueCell!4112)) (size!10702 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21763)

(declare-fun e!228155 () Bool)

(declare-fun array_inv!7632 (array!21763) Bool)

(assert (=> start!37136 (and (array_inv!7632 _values!506) e!228155)))

(assert (=> start!37136 tp!29504))

(assert (=> start!37136 true))

(assert (=> start!37136 tp_is_empty!8911))

(declare-fun array_inv!7633 (array!21761) Bool)

(assert (=> start!37136 (array_inv!7633 _keys!658)))

(declare-fun b!374354 () Bool)

(declare-fun e!228156 () Bool)

(declare-fun e!228157 () Bool)

(assert (=> b!374354 (= e!228156 (not e!228157))))

(declare-fun res!211074 () Bool)

(assert (=> b!374354 (=> res!211074 e!228157)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374354 (= res!211074 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5982 0))(
  ( (tuple2!5983 (_1!3002 (_ BitVec 64)) (_2!3002 V!12987)) )
))
(declare-datatypes ((List!5827 0))(
  ( (Nil!5824) (Cons!5823 (h!6679 tuple2!5982) (t!10977 List!5827)) )
))
(declare-datatypes ((ListLongMap!4895 0))(
  ( (ListLongMap!4896 (toList!2463 List!5827)) )
))
(declare-fun lt!172526 () ListLongMap!4895)

(declare-fun zeroValue!472 () V!12987)

(declare-fun minValue!472 () V!12987)

(declare-fun getCurrentListMap!1901 (array!21761 array!21763 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) Int) ListLongMap!4895)

(assert (=> b!374354 (= lt!172526 (getCurrentListMap!1901 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172517 () ListLongMap!4895)

(declare-fun lt!172511 () array!21763)

(declare-fun lt!172512 () array!21761)

(assert (=> b!374354 (= lt!172517 (getCurrentListMap!1901 lt!172512 lt!172511 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172513 () ListLongMap!4895)

(declare-fun lt!172516 () ListLongMap!4895)

(assert (=> b!374354 (and (= lt!172513 lt!172516) (= lt!172516 lt!172513))))

(declare-fun lt!172519 () ListLongMap!4895)

(declare-fun lt!172521 () tuple2!5982)

(declare-fun +!809 (ListLongMap!4895 tuple2!5982) ListLongMap!4895)

(assert (=> b!374354 (= lt!172516 (+!809 lt!172519 lt!172521))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12987)

(assert (=> b!374354 (= lt!172521 (tuple2!5983 k!778 v!373))))

(declare-datatypes ((Unit!11524 0))(
  ( (Unit!11525) )
))
(declare-fun lt!172527 () Unit!11524)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!59 (array!21761 array!21763 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) (_ BitVec 64) V!12987 (_ BitVec 32) Int) Unit!11524)

(assert (=> b!374354 (= lt!172527 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!59 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!735 (array!21761 array!21763 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) Int) ListLongMap!4895)

(assert (=> b!374354 (= lt!172513 (getCurrentListMapNoExtraKeys!735 lt!172512 lt!172511 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374354 (= lt!172511 (array!21764 (store (arr!10350 _values!506) i!548 (ValueCellFull!4112 v!373)) (size!10702 _values!506)))))

(assert (=> b!374354 (= lt!172519 (getCurrentListMapNoExtraKeys!735 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374355 () Bool)

(declare-fun res!211078 () Bool)

(assert (=> b!374355 (=> (not res!211078) (not e!228156))))

(declare-datatypes ((List!5828 0))(
  ( (Nil!5825) (Cons!5824 (h!6680 (_ BitVec 64)) (t!10978 List!5828)) )
))
(declare-fun arrayNoDuplicates!0 (array!21761 (_ BitVec 32) List!5828) Bool)

(assert (=> b!374355 (= res!211078 (arrayNoDuplicates!0 lt!172512 #b00000000000000000000000000000000 Nil!5825))))

(declare-fun b!374356 () Bool)

(declare-fun res!211083 () Bool)

(assert (=> b!374356 (=> (not res!211083) (not e!228151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374356 (= res!211083 (validKeyInArray!0 k!778))))

(declare-fun b!374357 () Bool)

(declare-fun res!211077 () Bool)

(assert (=> b!374357 (=> (not res!211077) (not e!228151))))

(assert (=> b!374357 (= res!211077 (or (= (select (arr!10349 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10349 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374358 () Bool)

(declare-fun res!211075 () Bool)

(assert (=> b!374358 (=> (not res!211075) (not e!228151))))

(assert (=> b!374358 (= res!211075 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5825))))

(declare-fun b!374359 () Bool)

(declare-fun res!211081 () Bool)

(assert (=> b!374359 (=> (not res!211081) (not e!228151))))

(declare-fun arrayContainsKey!0 (array!21761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374359 (= res!211081 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374360 () Bool)

(declare-fun mapRes!14931 () Bool)

(assert (=> b!374360 (= e!228155 (and e!228154 mapRes!14931))))

(declare-fun condMapEmpty!14931 () Bool)

(declare-fun mapDefault!14931 () ValueCell!4112)

