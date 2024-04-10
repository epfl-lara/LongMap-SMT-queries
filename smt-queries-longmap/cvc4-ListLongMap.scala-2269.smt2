; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37080 () Bool)

(assert start!37080)

(declare-fun b_free!8207 () Bool)

(declare-fun b_next!8207 () Bool)

(assert (=> start!37080 (= b_free!8207 (not b_next!8207))))

(declare-fun tp!29336 () Bool)

(declare-fun b_and!15449 () Bool)

(assert (=> start!37080 (= tp!29336 b_and!15449)))

(declare-fun b!373100 () Bool)

(declare-fun res!210078 () Bool)

(declare-fun e!227489 () Bool)

(assert (=> b!373100 (=> (not res!210078) (not e!227489))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21651 0))(
  ( (array!21652 (arr!10294 (Array (_ BitVec 32) (_ BitVec 64))) (size!10646 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21651)

(assert (=> b!373100 (= res!210078 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10646 _keys!658))))))

(declare-fun mapNonEmpty!14847 () Bool)

(declare-fun mapRes!14847 () Bool)

(declare-fun tp!29337 () Bool)

(declare-fun e!227493 () Bool)

(assert (=> mapNonEmpty!14847 (= mapRes!14847 (and tp!29337 e!227493))))

(declare-datatypes ((V!12911 0))(
  ( (V!12912 (val!4472 Int)) )
))
(declare-datatypes ((ValueCell!4084 0))(
  ( (ValueCellFull!4084 (v!6669 V!12911)) (EmptyCell!4084) )
))
(declare-datatypes ((array!21653 0))(
  ( (array!21654 (arr!10295 (Array (_ BitVec 32) ValueCell!4084)) (size!10647 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21653)

(declare-fun mapValue!14847 () ValueCell!4084)

(declare-fun mapKey!14847 () (_ BitVec 32))

(declare-fun mapRest!14847 () (Array (_ BitVec 32) ValueCell!4084))

(assert (=> mapNonEmpty!14847 (= (arr!10295 _values!506) (store mapRest!14847 mapKey!14847 mapValue!14847))))

(declare-fun b!373101 () Bool)

(declare-datatypes ((tuple2!5932 0))(
  ( (tuple2!5933 (_1!2977 (_ BitVec 64)) (_2!2977 V!12911)) )
))
(declare-datatypes ((List!5778 0))(
  ( (Nil!5775) (Cons!5774 (h!6630 tuple2!5932) (t!10928 List!5778)) )
))
(declare-datatypes ((ListLongMap!4845 0))(
  ( (ListLongMap!4846 (toList!2438 List!5778)) )
))
(declare-fun lt!171117 () ListLongMap!4845)

(declare-fun lt!171120 () tuple2!5932)

(declare-fun e!227492 () Bool)

(declare-fun lt!171123 () tuple2!5932)

(declare-fun lt!171124 () ListLongMap!4845)

(declare-fun +!784 (ListLongMap!4845 tuple2!5932) ListLongMap!4845)

(assert (=> b!373101 (= e!227492 (= lt!171117 (+!784 (+!784 lt!171124 lt!171120) lt!171123)))))

(declare-fun b!373102 () Bool)

(declare-fun tp_is_empty!8855 () Bool)

(assert (=> b!373102 (= e!227493 tp_is_empty!8855)))

(declare-fun b!373103 () Bool)

(declare-fun res!210077 () Bool)

(assert (=> b!373103 (=> (not res!210077) (not e!227489))))

(declare-datatypes ((List!5779 0))(
  ( (Nil!5776) (Cons!5775 (h!6631 (_ BitVec 64)) (t!10929 List!5779)) )
))
(declare-fun arrayNoDuplicates!0 (array!21651 (_ BitVec 32) List!5779) Bool)

(assert (=> b!373103 (= res!210077 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5776))))

(declare-fun res!210085 () Bool)

(assert (=> start!37080 (=> (not res!210085) (not e!227489))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37080 (= res!210085 (validMask!0 mask!970))))

(assert (=> start!37080 e!227489))

(declare-fun e!227495 () Bool)

(declare-fun array_inv!7592 (array!21653) Bool)

(assert (=> start!37080 (and (array_inv!7592 _values!506) e!227495)))

(assert (=> start!37080 tp!29336))

(assert (=> start!37080 true))

(assert (=> start!37080 tp_is_empty!8855))

(declare-fun array_inv!7593 (array!21651) Bool)

(assert (=> start!37080 (array_inv!7593 _keys!658)))

(declare-fun b!373104 () Bool)

(declare-fun res!210081 () Bool)

(assert (=> b!373104 (=> (not res!210081) (not e!227492))))

(declare-fun lt!171122 () ListLongMap!4845)

(declare-fun lt!171118 () ListLongMap!4845)

(assert (=> b!373104 (= res!210081 (= lt!171122 (+!784 (+!784 lt!171118 lt!171120) lt!171123)))))

(declare-fun b!373105 () Bool)

(declare-fun res!210080 () Bool)

(assert (=> b!373105 (=> (not res!210080) (not e!227489))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373105 (= res!210080 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!14847 () Bool)

(assert (=> mapIsEmpty!14847 mapRes!14847))

(declare-fun b!373106 () Bool)

(declare-fun res!210075 () Bool)

(declare-fun e!227491 () Bool)

(assert (=> b!373106 (=> (not res!210075) (not e!227491))))

(declare-fun lt!171119 () array!21651)

(assert (=> b!373106 (= res!210075 (arrayNoDuplicates!0 lt!171119 #b00000000000000000000000000000000 Nil!5776))))

(declare-fun b!373107 () Bool)

(declare-fun res!210083 () Bool)

(assert (=> b!373107 (=> (not res!210083) (not e!227489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21651 (_ BitVec 32)) Bool)

(assert (=> b!373107 (= res!210083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373108 () Bool)

(declare-fun e!227490 () Bool)

(assert (=> b!373108 (= e!227490 true)))

(assert (=> b!373108 e!227492))

(declare-fun res!210079 () Bool)

(assert (=> b!373108 (=> (not res!210079) (not e!227492))))

(declare-fun lt!171125 () ListLongMap!4845)

(assert (=> b!373108 (= res!210079 (= lt!171117 (+!784 (+!784 lt!171125 lt!171120) lt!171123)))))

(declare-fun minValue!472 () V!12911)

(assert (=> b!373108 (= lt!171123 (tuple2!5933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!12911)

(assert (=> b!373108 (= lt!171120 (tuple2!5933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373109 () Bool)

(declare-fun res!210082 () Bool)

(assert (=> b!373109 (=> (not res!210082) (not e!227489))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373109 (= res!210082 (and (= (size!10647 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10646 _keys!658) (size!10647 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373110 () Bool)

(declare-fun res!210086 () Bool)

(assert (=> b!373110 (=> (not res!210086) (not e!227489))))

(declare-fun arrayContainsKey!0 (array!21651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373110 (= res!210086 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373111 () Bool)

(declare-fun e!227488 () Bool)

(assert (=> b!373111 (= e!227488 tp_is_empty!8855)))

(declare-fun b!373112 () Bool)

(assert (=> b!373112 (= e!227491 (not e!227490))))

(declare-fun res!210074 () Bool)

(assert (=> b!373112 (=> res!210074 e!227490)))

(assert (=> b!373112 (= res!210074 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1881 (array!21651 array!21653 (_ BitVec 32) (_ BitVec 32) V!12911 V!12911 (_ BitVec 32) Int) ListLongMap!4845)

(assert (=> b!373112 (= lt!171122 (getCurrentListMap!1881 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171121 () array!21653)

(assert (=> b!373112 (= lt!171117 (getCurrentListMap!1881 lt!171119 lt!171121 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373112 (and (= lt!171125 lt!171124) (= lt!171124 lt!171125))))

(declare-fun v!373 () V!12911)

(assert (=> b!373112 (= lt!171124 (+!784 lt!171118 (tuple2!5933 k!778 v!373)))))

(declare-datatypes ((Unit!11474 0))(
  ( (Unit!11475) )
))
(declare-fun lt!171126 () Unit!11474)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!39 (array!21651 array!21653 (_ BitVec 32) (_ BitVec 32) V!12911 V!12911 (_ BitVec 32) (_ BitVec 64) V!12911 (_ BitVec 32) Int) Unit!11474)

(assert (=> b!373112 (= lt!171126 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!39 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!715 (array!21651 array!21653 (_ BitVec 32) (_ BitVec 32) V!12911 V!12911 (_ BitVec 32) Int) ListLongMap!4845)

(assert (=> b!373112 (= lt!171125 (getCurrentListMapNoExtraKeys!715 lt!171119 lt!171121 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373112 (= lt!171121 (array!21654 (store (arr!10295 _values!506) i!548 (ValueCellFull!4084 v!373)) (size!10647 _values!506)))))

(assert (=> b!373112 (= lt!171118 (getCurrentListMapNoExtraKeys!715 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373113 () Bool)

(declare-fun res!210076 () Bool)

(assert (=> b!373113 (=> (not res!210076) (not e!227489))))

(assert (=> b!373113 (= res!210076 (or (= (select (arr!10294 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10294 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373114 () Bool)

(assert (=> b!373114 (= e!227489 e!227491)))

(declare-fun res!210084 () Bool)

(assert (=> b!373114 (=> (not res!210084) (not e!227491))))

(assert (=> b!373114 (= res!210084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171119 mask!970))))

(assert (=> b!373114 (= lt!171119 (array!21652 (store (arr!10294 _keys!658) i!548 k!778) (size!10646 _keys!658)))))

(declare-fun b!373115 () Bool)

(assert (=> b!373115 (= e!227495 (and e!227488 mapRes!14847))))

(declare-fun condMapEmpty!14847 () Bool)

(declare-fun mapDefault!14847 () ValueCell!4084)

