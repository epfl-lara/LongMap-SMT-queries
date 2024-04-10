; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37338 () Bool)

(assert start!37338)

(declare-fun b_free!8465 () Bool)

(declare-fun b_next!8465 () Bool)

(assert (=> start!37338 (= b_free!8465 (not b_next!8465))))

(declare-fun tp!30111 () Bool)

(declare-fun b_and!15707 () Bool)

(assert (=> start!37338 (= tp!30111 b_and!15707)))

(declare-fun mapNonEmpty!15234 () Bool)

(declare-fun mapRes!15234 () Bool)

(declare-fun tp!30110 () Bool)

(declare-fun e!230578 () Bool)

(assert (=> mapNonEmpty!15234 (= mapRes!15234 (and tp!30110 e!230578))))

(declare-datatypes ((V!13255 0))(
  ( (V!13256 (val!4601 Int)) )
))
(declare-datatypes ((ValueCell!4213 0))(
  ( (ValueCellFull!4213 (v!6798 V!13255)) (EmptyCell!4213) )
))
(declare-fun mapValue!15234 () ValueCell!4213)

(declare-fun mapRest!15234 () (Array (_ BitVec 32) ValueCell!4213))

(declare-fun mapKey!15234 () (_ BitVec 32))

(declare-datatypes ((array!22151 0))(
  ( (array!22152 (arr!10544 (Array (_ BitVec 32) ValueCell!4213)) (size!10896 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22151)

(assert (=> mapNonEmpty!15234 (= (arr!10544 _values!506) (store mapRest!15234 mapKey!15234 mapValue!15234))))

(declare-fun b!378915 () Bool)

(declare-fun res!214735 () Bool)

(declare-fun e!230576 () Bool)

(assert (=> b!378915 (=> (not res!214735) (not e!230576))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!22153 0))(
  ( (array!22154 (arr!10545 (Array (_ BitVec 32) (_ BitVec 64))) (size!10897 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22153)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!378915 (= res!214735 (and (= (size!10896 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10897 _keys!658) (size!10896 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378916 () Bool)

(declare-fun res!214730 () Bool)

(assert (=> b!378916 (=> (not res!214730) (not e!230576))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378916 (= res!214730 (or (= (select (arr!10545 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10545 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378917 () Bool)

(declare-fun e!230582 () Bool)

(declare-fun e!230575 () Bool)

(assert (=> b!378917 (= e!230582 (not e!230575))))

(declare-fun res!214733 () Bool)

(assert (=> b!378917 (=> res!214733 e!230575)))

(assert (=> b!378917 (= res!214733 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13255)

(declare-datatypes ((tuple2!6150 0))(
  ( (tuple2!6151 (_1!3086 (_ BitVec 64)) (_2!3086 V!13255)) )
))
(declare-datatypes ((List!5987 0))(
  ( (Nil!5984) (Cons!5983 (h!6839 tuple2!6150) (t!11137 List!5987)) )
))
(declare-datatypes ((ListLongMap!5063 0))(
  ( (ListLongMap!5064 (toList!2547 List!5987)) )
))
(declare-fun lt!176736 () ListLongMap!5063)

(declare-fun minValue!472 () V!13255)

(declare-fun getCurrentListMap!1971 (array!22153 array!22151 (_ BitVec 32) (_ BitVec 32) V!13255 V!13255 (_ BitVec 32) Int) ListLongMap!5063)

(assert (=> b!378917 (= lt!176736 (getCurrentListMap!1971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176740 () array!22153)

(declare-fun lt!176741 () array!22151)

(declare-fun lt!176742 () ListLongMap!5063)

(assert (=> b!378917 (= lt!176742 (getCurrentListMap!1971 lt!176740 lt!176741 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176738 () ListLongMap!5063)

(declare-fun lt!176734 () ListLongMap!5063)

(assert (=> b!378917 (and (= lt!176738 lt!176734) (= lt!176734 lt!176738))))

(declare-fun lt!176731 () ListLongMap!5063)

(declare-fun lt!176739 () tuple2!6150)

(declare-fun +!893 (ListLongMap!5063 tuple2!6150) ListLongMap!5063)

(assert (=> b!378917 (= lt!176734 (+!893 lt!176731 lt!176739))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13255)

(assert (=> b!378917 (= lt!176739 (tuple2!6151 k!778 v!373))))

(declare-datatypes ((Unit!11686 0))(
  ( (Unit!11687) )
))
(declare-fun lt!176735 () Unit!11686)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!129 (array!22153 array!22151 (_ BitVec 32) (_ BitVec 32) V!13255 V!13255 (_ BitVec 32) (_ BitVec 64) V!13255 (_ BitVec 32) Int) Unit!11686)

(assert (=> b!378917 (= lt!176735 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!129 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!805 (array!22153 array!22151 (_ BitVec 32) (_ BitVec 32) V!13255 V!13255 (_ BitVec 32) Int) ListLongMap!5063)

(assert (=> b!378917 (= lt!176738 (getCurrentListMapNoExtraKeys!805 lt!176740 lt!176741 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378917 (= lt!176741 (array!22152 (store (arr!10544 _values!506) i!548 (ValueCellFull!4213 v!373)) (size!10896 _values!506)))))

(assert (=> b!378917 (= lt!176731 (getCurrentListMapNoExtraKeys!805 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378918 () Bool)

(declare-fun tp_is_empty!9113 () Bool)

(assert (=> b!378918 (= e!230578 tp_is_empty!9113)))

(declare-fun b!378919 () Bool)

(declare-fun res!214731 () Bool)

(assert (=> b!378919 (=> (not res!214731) (not e!230582))))

(declare-datatypes ((List!5988 0))(
  ( (Nil!5985) (Cons!5984 (h!6840 (_ BitVec 64)) (t!11138 List!5988)) )
))
(declare-fun arrayNoDuplicates!0 (array!22153 (_ BitVec 32) List!5988) Bool)

(assert (=> b!378919 (= res!214731 (arrayNoDuplicates!0 lt!176740 #b00000000000000000000000000000000 Nil!5985))))

(declare-fun b!378920 () Bool)

(declare-fun e!230579 () Bool)

(assert (=> b!378920 (= e!230579 tp_is_empty!9113)))

(declare-fun res!214729 () Bool)

(assert (=> start!37338 (=> (not res!214729) (not e!230576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37338 (= res!214729 (validMask!0 mask!970))))

(assert (=> start!37338 e!230576))

(declare-fun e!230581 () Bool)

(declare-fun array_inv!7768 (array!22151) Bool)

(assert (=> start!37338 (and (array_inv!7768 _values!506) e!230581)))

(assert (=> start!37338 tp!30111))

(assert (=> start!37338 true))

(assert (=> start!37338 tp_is_empty!9113))

(declare-fun array_inv!7769 (array!22153) Bool)

(assert (=> start!37338 (array_inv!7769 _keys!658)))

(declare-fun b!378921 () Bool)

(assert (=> b!378921 (= e!230581 (and e!230579 mapRes!15234))))

(declare-fun condMapEmpty!15234 () Bool)

(declare-fun mapDefault!15234 () ValueCell!4213)

