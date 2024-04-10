; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37248 () Bool)

(assert start!37248)

(declare-fun b_free!8375 () Bool)

(declare-fun b_next!8375 () Bool)

(assert (=> start!37248 (= b_free!8375 (not b_next!8375))))

(declare-fun tp!29840 () Bool)

(declare-fun b_and!15617 () Bool)

(assert (=> start!37248 (= tp!29840 b_and!15617)))

(declare-fun b!376881 () Bool)

(declare-fun res!213099 () Bool)

(declare-fun e!229500 () Bool)

(assert (=> b!376881 (=> (not res!213099) (not e!229500))))

(declare-datatypes ((array!21975 0))(
  ( (array!21976 (arr!10456 (Array (_ BitVec 32) (_ BitVec 64))) (size!10808 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21975)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21975 (_ BitVec 32)) Bool)

(assert (=> b!376881 (= res!213099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376882 () Bool)

(declare-fun e!229495 () Bool)

(declare-fun e!229501 () Bool)

(assert (=> b!376882 (= e!229495 e!229501)))

(declare-fun res!213107 () Bool)

(assert (=> b!376882 (=> res!213107 e!229501)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!376882 (= res!213107 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13135 0))(
  ( (V!13136 (val!4556 Int)) )
))
(declare-datatypes ((tuple2!6070 0))(
  ( (tuple2!6071 (_1!3046 (_ BitVec 64)) (_2!3046 V!13135)) )
))
(declare-datatypes ((List!5911 0))(
  ( (Nil!5908) (Cons!5907 (h!6763 tuple2!6070) (t!11061 List!5911)) )
))
(declare-datatypes ((ListLongMap!4983 0))(
  ( (ListLongMap!4984 (toList!2507 List!5911)) )
))
(declare-fun lt!175013 () ListLongMap!4983)

(declare-fun lt!175020 () ListLongMap!4983)

(assert (=> b!376882 (= lt!175013 lt!175020)))

(declare-fun lt!175012 () ListLongMap!4983)

(declare-fun lt!175016 () tuple2!6070)

(declare-fun +!853 (ListLongMap!4983 tuple2!6070) ListLongMap!4983)

(assert (=> b!376882 (= lt!175020 (+!853 lt!175012 lt!175016))))

(declare-fun lt!175014 () ListLongMap!4983)

(declare-fun lt!175015 () ListLongMap!4983)

(assert (=> b!376882 (= lt!175014 lt!175015)))

(declare-fun lt!175019 () ListLongMap!4983)

(assert (=> b!376882 (= lt!175015 (+!853 lt!175019 lt!175016))))

(declare-fun lt!175022 () ListLongMap!4983)

(assert (=> b!376882 (= lt!175013 (+!853 lt!175022 lt!175016))))

(declare-fun zeroValue!472 () V!13135)

(assert (=> b!376882 (= lt!175016 (tuple2!6071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376883 () Bool)

(declare-fun res!213103 () Bool)

(assert (=> b!376883 (=> (not res!213103) (not e!229500))))

(declare-fun arrayContainsKey!0 (array!21975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376883 (= res!213103 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!213104 () Bool)

(assert (=> start!37248 (=> (not res!213104) (not e!229500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37248 (= res!213104 (validMask!0 mask!970))))

(assert (=> start!37248 e!229500))

(declare-datatypes ((ValueCell!4168 0))(
  ( (ValueCellFull!4168 (v!6753 V!13135)) (EmptyCell!4168) )
))
(declare-datatypes ((array!21977 0))(
  ( (array!21978 (arr!10457 (Array (_ BitVec 32) ValueCell!4168)) (size!10809 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21977)

(declare-fun e!229496 () Bool)

(declare-fun array_inv!7706 (array!21977) Bool)

(assert (=> start!37248 (and (array_inv!7706 _values!506) e!229496)))

(assert (=> start!37248 tp!29840))

(assert (=> start!37248 true))

(declare-fun tp_is_empty!9023 () Bool)

(assert (=> start!37248 tp_is_empty!9023))

(declare-fun array_inv!7707 (array!21975) Bool)

(assert (=> start!37248 (array_inv!7707 _keys!658)))

(declare-fun b!376884 () Bool)

(declare-fun res!213102 () Bool)

(assert (=> b!376884 (=> (not res!213102) (not e!229500))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376884 (= res!213102 (or (= (select (arr!10456 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10456 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15099 () Bool)

(declare-fun mapRes!15099 () Bool)

(assert (=> mapIsEmpty!15099 mapRes!15099))

(declare-fun b!376885 () Bool)

(declare-fun res!213101 () Bool)

(assert (=> b!376885 (=> (not res!213101) (not e!229500))))

(declare-datatypes ((List!5912 0))(
  ( (Nil!5909) (Cons!5908 (h!6764 (_ BitVec 64)) (t!11062 List!5912)) )
))
(declare-fun arrayNoDuplicates!0 (array!21975 (_ BitVec 32) List!5912) Bool)

(assert (=> b!376885 (= res!213101 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5909))))

(declare-fun b!376886 () Bool)

(declare-fun res!213105 () Bool)

(assert (=> b!376886 (=> (not res!213105) (not e!229500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376886 (= res!213105 (validKeyInArray!0 k!778))))

(declare-fun b!376887 () Bool)

(declare-fun res!213110 () Bool)

(declare-fun e!229497 () Bool)

(assert (=> b!376887 (=> (not res!213110) (not e!229497))))

(declare-fun lt!175021 () array!21975)

(assert (=> b!376887 (= res!213110 (arrayNoDuplicates!0 lt!175021 #b00000000000000000000000000000000 Nil!5909))))

(declare-fun b!376888 () Bool)

(declare-fun e!229498 () Bool)

(assert (=> b!376888 (= e!229498 tp_is_empty!9023)))

(declare-fun b!376889 () Bool)

(declare-fun res!213109 () Bool)

(assert (=> b!376889 (=> (not res!213109) (not e!229500))))

(assert (=> b!376889 (= res!213109 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10808 _keys!658))))))

(declare-fun b!376890 () Bool)

(assert (=> b!376890 (= e!229497 (not e!229495))))

(declare-fun res!213100 () Bool)

(assert (=> b!376890 (=> res!213100 e!229495)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376890 (= res!213100 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13135)

(declare-fun getCurrentListMap!1940 (array!21975 array!21977 (_ BitVec 32) (_ BitVec 32) V!13135 V!13135 (_ BitVec 32) Int) ListLongMap!4983)

(assert (=> b!376890 (= lt!175014 (getCurrentListMap!1940 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175011 () array!21977)

(assert (=> b!376890 (= lt!175013 (getCurrentListMap!1940 lt!175021 lt!175011 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376890 (and (= lt!175022 lt!175012) (= lt!175012 lt!175022))))

(declare-fun lt!175023 () tuple2!6070)

(assert (=> b!376890 (= lt!175012 (+!853 lt!175019 lt!175023))))

(declare-fun v!373 () V!13135)

(assert (=> b!376890 (= lt!175023 (tuple2!6071 k!778 v!373))))

(declare-datatypes ((Unit!11610 0))(
  ( (Unit!11611) )
))
(declare-fun lt!175017 () Unit!11610)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!98 (array!21975 array!21977 (_ BitVec 32) (_ BitVec 32) V!13135 V!13135 (_ BitVec 32) (_ BitVec 64) V!13135 (_ BitVec 32) Int) Unit!11610)

(assert (=> b!376890 (= lt!175017 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!98 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!774 (array!21975 array!21977 (_ BitVec 32) (_ BitVec 32) V!13135 V!13135 (_ BitVec 32) Int) ListLongMap!4983)

(assert (=> b!376890 (= lt!175022 (getCurrentListMapNoExtraKeys!774 lt!175021 lt!175011 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376890 (= lt!175011 (array!21978 (store (arr!10457 _values!506) i!548 (ValueCellFull!4168 v!373)) (size!10809 _values!506)))))

(assert (=> b!376890 (= lt!175019 (getCurrentListMapNoExtraKeys!774 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376891 () Bool)

(declare-fun e!229499 () Bool)

(assert (=> b!376891 (= e!229496 (and e!229499 mapRes!15099))))

(declare-fun condMapEmpty!15099 () Bool)

(declare-fun mapDefault!15099 () ValueCell!4168)

