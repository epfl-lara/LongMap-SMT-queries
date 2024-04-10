; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37238 () Bool)

(assert start!37238)

(declare-fun b_free!8365 () Bool)

(declare-fun b_next!8365 () Bool)

(assert (=> start!37238 (= b_free!8365 (not b_next!8365))))

(declare-fun tp!29811 () Bool)

(declare-fun b_and!15607 () Bool)

(assert (=> start!37238 (= tp!29811 b_and!15607)))

(declare-fun b!376656 () Bool)

(declare-fun res!212929 () Bool)

(declare-fun e!229376 () Bool)

(assert (=> b!376656 (=> (not res!212929) (not e!229376))))

(declare-datatypes ((array!21955 0))(
  ( (array!21956 (arr!10446 (Array (_ BitVec 32) (_ BitVec 64))) (size!10798 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21955)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376656 (= res!212929 (or (= (select (arr!10446 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10446 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376657 () Bool)

(declare-fun res!212920 () Bool)

(assert (=> b!376657 (=> (not res!212920) (not e!229376))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376657 (= res!212920 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!376658 () Bool)

(declare-fun e!229379 () Bool)

(declare-fun e!229377 () Bool)

(assert (=> b!376658 (= e!229379 e!229377)))

(declare-fun res!212922 () Bool)

(assert (=> b!376658 (=> res!212922 e!229377)))

(assert (=> b!376658 (= res!212922 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13123 0))(
  ( (V!13124 (val!4551 Int)) )
))
(declare-datatypes ((tuple2!6060 0))(
  ( (tuple2!6061 (_1!3041 (_ BitVec 64)) (_2!3041 V!13123)) )
))
(declare-datatypes ((List!5902 0))(
  ( (Nil!5899) (Cons!5898 (h!6754 tuple2!6060) (t!11052 List!5902)) )
))
(declare-datatypes ((ListLongMap!4973 0))(
  ( (ListLongMap!4974 (toList!2502 List!5902)) )
))
(declare-fun lt!174822 () ListLongMap!4973)

(declare-fun lt!174824 () ListLongMap!4973)

(assert (=> b!376658 (= lt!174822 lt!174824)))

(declare-fun lt!174825 () ListLongMap!4973)

(declare-fun lt!174820 () tuple2!6060)

(declare-fun +!848 (ListLongMap!4973 tuple2!6060) ListLongMap!4973)

(assert (=> b!376658 (= lt!174824 (+!848 lt!174825 lt!174820))))

(declare-fun lt!174827 () ListLongMap!4973)

(declare-fun lt!174819 () ListLongMap!4973)

(assert (=> b!376658 (= lt!174827 lt!174819)))

(declare-fun lt!174816 () ListLongMap!4973)

(assert (=> b!376658 (= lt!174819 (+!848 lt!174816 lt!174820))))

(declare-fun lt!174821 () ListLongMap!4973)

(assert (=> b!376658 (= lt!174822 (+!848 lt!174821 lt!174820))))

(declare-fun zeroValue!472 () V!13123)

(assert (=> b!376658 (= lt!174820 (tuple2!6061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!212923 () Bool)

(assert (=> start!37238 (=> (not res!212923) (not e!229376))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37238 (= res!212923 (validMask!0 mask!970))))

(assert (=> start!37238 e!229376))

(declare-datatypes ((ValueCell!4163 0))(
  ( (ValueCellFull!4163 (v!6748 V!13123)) (EmptyCell!4163) )
))
(declare-datatypes ((array!21957 0))(
  ( (array!21958 (arr!10447 (Array (_ BitVec 32) ValueCell!4163)) (size!10799 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21957)

(declare-fun e!229380 () Bool)

(declare-fun array_inv!7700 (array!21957) Bool)

(assert (=> start!37238 (and (array_inv!7700 _values!506) e!229380)))

(assert (=> start!37238 tp!29811))

(assert (=> start!37238 true))

(declare-fun tp_is_empty!9013 () Bool)

(assert (=> start!37238 tp_is_empty!9013))

(declare-fun array_inv!7701 (array!21955) Bool)

(assert (=> start!37238 (array_inv!7701 _keys!658)))

(declare-fun b!376659 () Bool)

(declare-fun e!229382 () Bool)

(assert (=> b!376659 (= e!229382 (not e!229379))))

(declare-fun res!212930 () Bool)

(assert (=> b!376659 (=> res!212930 e!229379)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376659 (= res!212930 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13123)

(declare-fun getCurrentListMap!1936 (array!21955 array!21957 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) Int) ListLongMap!4973)

(assert (=> b!376659 (= lt!174827 (getCurrentListMap!1936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174818 () array!21955)

(declare-fun lt!174828 () array!21957)

(assert (=> b!376659 (= lt!174822 (getCurrentListMap!1936 lt!174818 lt!174828 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376659 (and (= lt!174821 lt!174825) (= lt!174825 lt!174821))))

(declare-fun lt!174817 () tuple2!6060)

(assert (=> b!376659 (= lt!174825 (+!848 lt!174816 lt!174817))))

(declare-fun v!373 () V!13123)

(assert (=> b!376659 (= lt!174817 (tuple2!6061 k!778 v!373))))

(declare-datatypes ((Unit!11602 0))(
  ( (Unit!11603) )
))
(declare-fun lt!174823 () Unit!11602)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!94 (array!21955 array!21957 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) (_ BitVec 64) V!13123 (_ BitVec 32) Int) Unit!11602)

(assert (=> b!376659 (= lt!174823 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!94 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!770 (array!21955 array!21957 (_ BitVec 32) (_ BitVec 32) V!13123 V!13123 (_ BitVec 32) Int) ListLongMap!4973)

(assert (=> b!376659 (= lt!174821 (getCurrentListMapNoExtraKeys!770 lt!174818 lt!174828 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376659 (= lt!174828 (array!21958 (store (arr!10447 _values!506) i!548 (ValueCellFull!4163 v!373)) (size!10799 _values!506)))))

(assert (=> b!376659 (= lt!174816 (getCurrentListMapNoExtraKeys!770 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376660 () Bool)

(declare-fun res!212926 () Bool)

(assert (=> b!376660 (=> (not res!212926) (not e!229376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21955 (_ BitVec 32)) Bool)

(assert (=> b!376660 (= res!212926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376661 () Bool)

(declare-fun res!212928 () Bool)

(assert (=> b!376661 (=> (not res!212928) (not e!229376))))

(declare-datatypes ((List!5903 0))(
  ( (Nil!5900) (Cons!5899 (h!6755 (_ BitVec 64)) (t!11053 List!5903)) )
))
(declare-fun arrayNoDuplicates!0 (array!21955 (_ BitVec 32) List!5903) Bool)

(assert (=> b!376661 (= res!212928 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5900))))

(declare-fun b!376662 () Bool)

(declare-fun e!229375 () Bool)

(declare-fun mapRes!15084 () Bool)

(assert (=> b!376662 (= e!229380 (and e!229375 mapRes!15084))))

(declare-fun condMapEmpty!15084 () Bool)

(declare-fun mapDefault!15084 () ValueCell!4163)

