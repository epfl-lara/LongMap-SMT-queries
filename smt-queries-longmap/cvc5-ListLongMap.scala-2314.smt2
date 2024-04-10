; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37346 () Bool)

(assert start!37346)

(declare-fun b_free!8473 () Bool)

(declare-fun b_next!8473 () Bool)

(assert (=> start!37346 (= b_free!8473 (not b_next!8473))))

(declare-fun tp!30135 () Bool)

(declare-fun b_and!15715 () Bool)

(assert (=> start!37346 (= tp!30135 b_and!15715)))

(declare-fun b!379095 () Bool)

(declare-fun e!230676 () Bool)

(declare-fun e!230673 () Bool)

(assert (=> b!379095 (= e!230676 (not e!230673))))

(declare-fun res!214875 () Bool)

(assert (=> b!379095 (=> res!214875 e!230673)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379095 (= res!214875 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13267 0))(
  ( (V!13268 (val!4605 Int)) )
))
(declare-datatypes ((ValueCell!4217 0))(
  ( (ValueCellFull!4217 (v!6802 V!13267)) (EmptyCell!4217) )
))
(declare-datatypes ((array!22165 0))(
  ( (array!22166 (arr!10551 (Array (_ BitVec 32) ValueCell!4217)) (size!10903 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22165)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6158 0))(
  ( (tuple2!6159 (_1!3090 (_ BitVec 64)) (_2!3090 V!13267)) )
))
(declare-datatypes ((List!5994 0))(
  ( (Nil!5991) (Cons!5990 (h!6846 tuple2!6158) (t!11144 List!5994)) )
))
(declare-datatypes ((ListLongMap!5071 0))(
  ( (ListLongMap!5072 (toList!2551 List!5994)) )
))
(declare-fun lt!176898 () ListLongMap!5071)

(declare-fun zeroValue!472 () V!13267)

(declare-datatypes ((array!22167 0))(
  ( (array!22168 (arr!10552 (Array (_ BitVec 32) (_ BitVec 64))) (size!10904 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22167)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13267)

(declare-fun getCurrentListMap!1974 (array!22167 array!22165 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) Int) ListLongMap!5071)

(assert (=> b!379095 (= lt!176898 (getCurrentListMap!1974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176890 () array!22165)

(declare-fun lt!176896 () array!22167)

(declare-fun lt!176886 () ListLongMap!5071)

(assert (=> b!379095 (= lt!176886 (getCurrentListMap!1974 lt!176896 lt!176890 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176897 () ListLongMap!5071)

(declare-fun lt!176888 () ListLongMap!5071)

(assert (=> b!379095 (and (= lt!176897 lt!176888) (= lt!176888 lt!176897))))

(declare-fun lt!176893 () ListLongMap!5071)

(declare-fun lt!176895 () tuple2!6158)

(declare-fun +!897 (ListLongMap!5071 tuple2!6158) ListLongMap!5071)

(assert (=> b!379095 (= lt!176888 (+!897 lt!176893 lt!176895))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13267)

(assert (=> b!379095 (= lt!176895 (tuple2!6159 k!778 v!373))))

(declare-datatypes ((Unit!11692 0))(
  ( (Unit!11693) )
))
(declare-fun lt!176891 () Unit!11692)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!132 (array!22167 array!22165 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) (_ BitVec 64) V!13267 (_ BitVec 32) Int) Unit!11692)

(assert (=> b!379095 (= lt!176891 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!132 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!808 (array!22167 array!22165 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) Int) ListLongMap!5071)

(assert (=> b!379095 (= lt!176897 (getCurrentListMapNoExtraKeys!808 lt!176896 lt!176890 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379095 (= lt!176890 (array!22166 (store (arr!10551 _values!506) i!548 (ValueCellFull!4217 v!373)) (size!10903 _values!506)))))

(assert (=> b!379095 (= lt!176893 (getCurrentListMapNoExtraKeys!808 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379096 () Bool)

(declare-fun e!230675 () Bool)

(assert (=> b!379096 (= e!230675 e!230676)))

(declare-fun res!214880 () Bool)

(assert (=> b!379096 (=> (not res!214880) (not e!230676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22167 (_ BitVec 32)) Bool)

(assert (=> b!379096 (= res!214880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176896 mask!970))))

(assert (=> b!379096 (= lt!176896 (array!22168 (store (arr!10552 _keys!658) i!548 k!778) (size!10904 _keys!658)))))

(declare-fun b!379097 () Bool)

(declare-fun res!214878 () Bool)

(assert (=> b!379097 (=> (not res!214878) (not e!230676))))

(declare-datatypes ((List!5995 0))(
  ( (Nil!5992) (Cons!5991 (h!6847 (_ BitVec 64)) (t!11145 List!5995)) )
))
(declare-fun arrayNoDuplicates!0 (array!22167 (_ BitVec 32) List!5995) Bool)

(assert (=> b!379097 (= res!214878 (arrayNoDuplicates!0 lt!176896 #b00000000000000000000000000000000 Nil!5992))))

(declare-fun b!379098 () Bool)

(declare-fun e!230678 () Bool)

(declare-fun e!230672 () Bool)

(declare-fun mapRes!15246 () Bool)

(assert (=> b!379098 (= e!230678 (and e!230672 mapRes!15246))))

(declare-fun condMapEmpty!15246 () Bool)

(declare-fun mapDefault!15246 () ValueCell!4217)

