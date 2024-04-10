; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37244 () Bool)

(assert start!37244)

(declare-fun b_free!8371 () Bool)

(declare-fun b_next!8371 () Bool)

(assert (=> start!37244 (= b_free!8371 (not b_next!8371))))

(declare-fun tp!29829 () Bool)

(declare-fun b_and!15613 () Bool)

(assert (=> start!37244 (= tp!29829 b_and!15613)))

(declare-fun b!376791 () Bool)

(declare-fun res!213027 () Bool)

(declare-fun e!229449 () Bool)

(assert (=> b!376791 (=> (not res!213027) (not e!229449))))

(declare-datatypes ((array!21967 0))(
  ( (array!21968 (arr!10452 (Array (_ BitVec 32) (_ BitVec 64))) (size!10804 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21967)

(declare-datatypes ((List!5907 0))(
  ( (Nil!5904) (Cons!5903 (h!6759 (_ BitVec 64)) (t!11057 List!5907)) )
))
(declare-fun arrayNoDuplicates!0 (array!21967 (_ BitVec 32) List!5907) Bool)

(assert (=> b!376791 (= res!213027 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5904))))

(declare-fun b!376792 () Bool)

(declare-fun e!229452 () Bool)

(declare-fun e!229450 () Bool)

(assert (=> b!376792 (= e!229452 e!229450)))

(declare-fun res!213028 () Bool)

(assert (=> b!376792 (=> res!213028 e!229450)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!376792 (= res!213028 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13131 0))(
  ( (V!13132 (val!4554 Int)) )
))
(declare-datatypes ((tuple2!6066 0))(
  ( (tuple2!6067 (_1!3044 (_ BitVec 64)) (_2!3044 V!13131)) )
))
(declare-datatypes ((List!5908 0))(
  ( (Nil!5905) (Cons!5904 (h!6760 tuple2!6066) (t!11058 List!5908)) )
))
(declare-datatypes ((ListLongMap!4979 0))(
  ( (ListLongMap!4980 (toList!2505 List!5908)) )
))
(declare-fun lt!174945 () ListLongMap!4979)

(declare-fun lt!174942 () ListLongMap!4979)

(assert (=> b!376792 (= lt!174945 lt!174942)))

(declare-fun lt!174937 () ListLongMap!4979)

(declare-fun lt!174940 () tuple2!6066)

(declare-fun +!851 (ListLongMap!4979 tuple2!6066) ListLongMap!4979)

(assert (=> b!376792 (= lt!174942 (+!851 lt!174937 lt!174940))))

(declare-fun lt!174941 () ListLongMap!4979)

(declare-fun lt!174938 () ListLongMap!4979)

(assert (=> b!376792 (= lt!174941 lt!174938)))

(declare-fun lt!174943 () ListLongMap!4979)

(assert (=> b!376792 (= lt!174938 (+!851 lt!174943 lt!174940))))

(declare-fun lt!174933 () ListLongMap!4979)

(assert (=> b!376792 (= lt!174945 (+!851 lt!174933 lt!174940))))

(declare-fun zeroValue!472 () V!13131)

(assert (=> b!376792 (= lt!174940 (tuple2!6067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376793 () Bool)

(declare-fun e!229447 () Bool)

(assert (=> b!376793 (= e!229447 (not e!229452))))

(declare-fun res!213034 () Bool)

(assert (=> b!376793 (=> res!213034 e!229452)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376793 (= res!213034 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4166 0))(
  ( (ValueCellFull!4166 (v!6751 V!13131)) (EmptyCell!4166) )
))
(declare-datatypes ((array!21969 0))(
  ( (array!21970 (arr!10453 (Array (_ BitVec 32) ValueCell!4166)) (size!10805 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21969)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13131)

(declare-fun getCurrentListMap!1938 (array!21967 array!21969 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) Int) ListLongMap!4979)

(assert (=> b!376793 (= lt!174941 (getCurrentListMap!1938 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174936 () array!21967)

(declare-fun lt!174944 () array!21969)

(assert (=> b!376793 (= lt!174945 (getCurrentListMap!1938 lt!174936 lt!174944 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376793 (and (= lt!174933 lt!174937) (= lt!174937 lt!174933))))

(declare-fun lt!174939 () tuple2!6066)

(assert (=> b!376793 (= lt!174937 (+!851 lt!174943 lt!174939))))

(declare-fun v!373 () V!13131)

(assert (=> b!376793 (= lt!174939 (tuple2!6067 k!778 v!373))))

(declare-datatypes ((Unit!11606 0))(
  ( (Unit!11607) )
))
(declare-fun lt!174935 () Unit!11606)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!96 (array!21967 array!21969 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) (_ BitVec 64) V!13131 (_ BitVec 32) Int) Unit!11606)

(assert (=> b!376793 (= lt!174935 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!96 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!772 (array!21967 array!21969 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) Int) ListLongMap!4979)

(assert (=> b!376793 (= lt!174933 (getCurrentListMapNoExtraKeys!772 lt!174936 lt!174944 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376793 (= lt!174944 (array!21970 (store (arr!10453 _values!506) i!548 (ValueCellFull!4166 v!373)) (size!10805 _values!506)))))

(assert (=> b!376793 (= lt!174943 (getCurrentListMapNoExtraKeys!772 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376794 () Bool)

(declare-fun e!229454 () Bool)

(declare-fun e!229448 () Bool)

(declare-fun mapRes!15093 () Bool)

(assert (=> b!376794 (= e!229454 (and e!229448 mapRes!15093))))

(declare-fun condMapEmpty!15093 () Bool)

(declare-fun mapDefault!15093 () ValueCell!4166)

