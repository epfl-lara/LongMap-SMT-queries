; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37236 () Bool)

(assert start!37236)

(declare-fun b_free!8377 () Bool)

(declare-fun b_next!8377 () Bool)

(assert (=> start!37236 (= b_free!8377 (not b_next!8377))))

(declare-fun tp!29846 () Bool)

(declare-fun b_and!15633 () Bool)

(assert (=> start!37236 (= tp!29846 b_and!15633)))

(declare-fun mapNonEmpty!15102 () Bool)

(declare-fun mapRes!15102 () Bool)

(declare-fun tp!29847 () Bool)

(declare-fun e!229492 () Bool)

(assert (=> mapNonEmpty!15102 (= mapRes!15102 (and tp!29847 e!229492))))

(declare-datatypes ((V!13139 0))(
  ( (V!13140 (val!4557 Int)) )
))
(declare-datatypes ((ValueCell!4169 0))(
  ( (ValueCellFull!4169 (v!6755 V!13139)) (EmptyCell!4169) )
))
(declare-datatypes ((array!21968 0))(
  ( (array!21969 (arr!10452 (Array (_ BitVec 32) ValueCell!4169)) (size!10804 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21968)

(declare-fun mapValue!15102 () ValueCell!4169)

(declare-fun mapKey!15102 () (_ BitVec 32))

(declare-fun mapRest!15102 () (Array (_ BitVec 32) ValueCell!4169))

(assert (=> mapNonEmpty!15102 (= (arr!10452 _values!506) (store mapRest!15102 mapKey!15102 mapValue!15102))))

(declare-fun b!376877 () Bool)

(declare-fun res!213136 () Bool)

(declare-fun e!229487 () Bool)

(assert (=> b!376877 (=> (not res!213136) (not e!229487))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21970 0))(
  ( (array!21971 (arr!10453 (Array (_ BitVec 32) (_ BitVec 64))) (size!10805 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21970)

(assert (=> b!376877 (= res!213136 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10805 _keys!658))))))

(declare-fun b!376878 () Bool)

(declare-fun res!213140 () Bool)

(assert (=> b!376878 (=> (not res!213140) (not e!229487))))

(assert (=> b!376878 (= res!213140 (or (= (select (arr!10453 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10453 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376879 () Bool)

(declare-fun tp_is_empty!9025 () Bool)

(assert (=> b!376879 (= e!229492 tp_is_empty!9025)))

(declare-fun mapIsEmpty!15102 () Bool)

(assert (=> mapIsEmpty!15102 mapRes!15102))

(declare-fun res!213139 () Bool)

(assert (=> start!37236 (=> (not res!213139) (not e!229487))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37236 (= res!213139 (validMask!0 mask!970))))

(assert (=> start!37236 e!229487))

(declare-fun e!229489 () Bool)

(declare-fun array_inv!7756 (array!21968) Bool)

(assert (=> start!37236 (and (array_inv!7756 _values!506) e!229489)))

(assert (=> start!37236 tp!29846))

(assert (=> start!37236 true))

(assert (=> start!37236 tp_is_empty!9025))

(declare-fun array_inv!7757 (array!21970) Bool)

(assert (=> start!37236 (array_inv!7757 _keys!658)))

(declare-fun b!376880 () Bool)

(declare-fun res!213143 () Bool)

(assert (=> b!376880 (=> (not res!213143) (not e!229487))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376880 (= res!213143 (validKeyInArray!0 k0!778))))

(declare-fun b!376881 () Bool)

(declare-fun res!213132 () Bool)

(assert (=> b!376881 (=> (not res!213132) (not e!229487))))

(declare-datatypes ((List!5817 0))(
  ( (Nil!5814) (Cons!5813 (h!6669 (_ BitVec 64)) (t!10959 List!5817)) )
))
(declare-fun arrayNoDuplicates!0 (array!21970 (_ BitVec 32) List!5817) Bool)

(assert (=> b!376881 (= res!213132 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5814))))

(declare-fun b!376882 () Bool)

(declare-fun res!213138 () Bool)

(assert (=> b!376882 (=> (not res!213138) (not e!229487))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376882 (= res!213138 (and (= (size!10804 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10805 _keys!658) (size!10804 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376883 () Bool)

(declare-fun res!213142 () Bool)

(assert (=> b!376883 (=> (not res!213142) (not e!229487))))

(declare-fun arrayContainsKey!0 (array!21970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376883 (= res!213142 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376884 () Bool)

(declare-fun res!213133 () Bool)

(declare-fun e!229494 () Bool)

(assert (=> b!376884 (=> (not res!213133) (not e!229494))))

(declare-fun lt!175081 () array!21970)

(assert (=> b!376884 (= res!213133 (arrayNoDuplicates!0 lt!175081 #b00000000000000000000000000000000 Nil!5814))))

(declare-fun b!376885 () Bool)

(declare-fun res!213134 () Bool)

(assert (=> b!376885 (=> (not res!213134) (not e!229487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21970 (_ BitVec 32)) Bool)

(assert (=> b!376885 (= res!213134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376886 () Bool)

(declare-fun e!229493 () Bool)

(assert (=> b!376886 (= e!229489 (and e!229493 mapRes!15102))))

(declare-fun condMapEmpty!15102 () Bool)

(declare-fun mapDefault!15102 () ValueCell!4169)

(assert (=> b!376886 (= condMapEmpty!15102 (= (arr!10452 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4169)) mapDefault!15102)))))

(declare-fun b!376887 () Bool)

(declare-fun e!229491 () Bool)

(assert (=> b!376887 (= e!229491 (bvsle #b00000000000000000000000000000000 (size!10805 _keys!658)))))

(declare-datatypes ((tuple2!5976 0))(
  ( (tuple2!5977 (_1!2999 (_ BitVec 64)) (_2!2999 V!13139)) )
))
(declare-datatypes ((List!5818 0))(
  ( (Nil!5815) (Cons!5814 (h!6670 tuple2!5976) (t!10960 List!5818)) )
))
(declare-datatypes ((ListLongMap!4891 0))(
  ( (ListLongMap!4892 (toList!2461 List!5818)) )
))
(declare-fun lt!175070 () ListLongMap!4891)

(declare-fun lt!175069 () ListLongMap!4891)

(declare-fun lt!175077 () tuple2!5976)

(declare-fun +!857 (ListLongMap!4891 tuple2!5976) ListLongMap!4891)

(assert (=> b!376887 (= lt!175070 (+!857 lt!175069 lt!175077))))

(declare-fun zeroValue!472 () V!13139)

(declare-fun lt!175076 () ListLongMap!4891)

(declare-fun v!373 () V!13139)

(declare-datatypes ((Unit!11601 0))(
  ( (Unit!11602) )
))
(declare-fun lt!175075 () Unit!11601)

(declare-fun addCommutativeForDiffKeys!278 (ListLongMap!4891 (_ BitVec 64) V!13139 (_ BitVec 64) V!13139) Unit!11601)

(assert (=> b!376887 (= lt!175075 (addCommutativeForDiffKeys!278 lt!175076 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376888 () Bool)

(assert (=> b!376888 (= e!229493 tp_is_empty!9025)))

(declare-fun b!376889 () Bool)

(assert (=> b!376889 (= e!229487 e!229494)))

(declare-fun res!213141 () Bool)

(assert (=> b!376889 (=> (not res!213141) (not e!229494))))

(assert (=> b!376889 (= res!213141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175081 mask!970))))

(assert (=> b!376889 (= lt!175081 (array!21971 (store (arr!10453 _keys!658) i!548 k0!778) (size!10805 _keys!658)))))

(declare-fun b!376890 () Bool)

(declare-fun e!229490 () Bool)

(assert (=> b!376890 (= e!229490 e!229491)))

(declare-fun res!213135 () Bool)

(assert (=> b!376890 (=> res!213135 e!229491)))

(assert (=> b!376890 (= res!213135 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175073 () ListLongMap!4891)

(assert (=> b!376890 (= lt!175073 lt!175070)))

(declare-fun lt!175079 () ListLongMap!4891)

(declare-fun lt!175071 () tuple2!5976)

(assert (=> b!376890 (= lt!175070 (+!857 lt!175079 lt!175071))))

(declare-fun lt!175080 () ListLongMap!4891)

(assert (=> b!376890 (= lt!175080 lt!175069)))

(assert (=> b!376890 (= lt!175069 (+!857 lt!175076 lt!175071))))

(declare-fun lt!175072 () ListLongMap!4891)

(assert (=> b!376890 (= lt!175073 (+!857 lt!175072 lt!175071))))

(assert (=> b!376890 (= lt!175071 (tuple2!5977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376891 () Bool)

(assert (=> b!376891 (= e!229494 (not e!229490))))

(declare-fun res!213137 () Bool)

(assert (=> b!376891 (=> res!213137 e!229490)))

(assert (=> b!376891 (= res!213137 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13139)

(declare-fun getCurrentListMap!1910 (array!21970 array!21968 (_ BitVec 32) (_ BitVec 32) V!13139 V!13139 (_ BitVec 32) Int) ListLongMap!4891)

(assert (=> b!376891 (= lt!175080 (getCurrentListMap!1910 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175078 () array!21968)

(assert (=> b!376891 (= lt!175073 (getCurrentListMap!1910 lt!175081 lt!175078 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376891 (and (= lt!175072 lt!175079) (= lt!175079 lt!175072))))

(assert (=> b!376891 (= lt!175079 (+!857 lt!175076 lt!175077))))

(assert (=> b!376891 (= lt!175077 (tuple2!5977 k0!778 v!373))))

(declare-fun lt!175074 () Unit!11601)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!97 (array!21970 array!21968 (_ BitVec 32) (_ BitVec 32) V!13139 V!13139 (_ BitVec 32) (_ BitVec 64) V!13139 (_ BitVec 32) Int) Unit!11601)

(assert (=> b!376891 (= lt!175074 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!97 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!757 (array!21970 array!21968 (_ BitVec 32) (_ BitVec 32) V!13139 V!13139 (_ BitVec 32) Int) ListLongMap!4891)

(assert (=> b!376891 (= lt!175072 (getCurrentListMapNoExtraKeys!757 lt!175081 lt!175078 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376891 (= lt!175078 (array!21969 (store (arr!10452 _values!506) i!548 (ValueCellFull!4169 v!373)) (size!10804 _values!506)))))

(assert (=> b!376891 (= lt!175076 (getCurrentListMapNoExtraKeys!757 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37236 res!213139) b!376882))

(assert (= (and b!376882 res!213138) b!376885))

(assert (= (and b!376885 res!213134) b!376881))

(assert (= (and b!376881 res!213132) b!376877))

(assert (= (and b!376877 res!213136) b!376880))

(assert (= (and b!376880 res!213143) b!376878))

(assert (= (and b!376878 res!213140) b!376883))

(assert (= (and b!376883 res!213142) b!376889))

(assert (= (and b!376889 res!213141) b!376884))

(assert (= (and b!376884 res!213133) b!376891))

(assert (= (and b!376891 (not res!213137)) b!376890))

(assert (= (and b!376890 (not res!213135)) b!376887))

(assert (= (and b!376886 condMapEmpty!15102) mapIsEmpty!15102))

(assert (= (and b!376886 (not condMapEmpty!15102)) mapNonEmpty!15102))

(get-info :version)

(assert (= (and mapNonEmpty!15102 ((_ is ValueCellFull!4169) mapValue!15102)) b!376879))

(assert (= (and b!376886 ((_ is ValueCellFull!4169) mapDefault!15102)) b!376888))

(assert (= start!37236 b!376886))

(declare-fun m!373889 () Bool)

(assert (=> b!376878 m!373889))

(declare-fun m!373891 () Bool)

(assert (=> b!376883 m!373891))

(declare-fun m!373893 () Bool)

(assert (=> b!376880 m!373893))

(declare-fun m!373895 () Bool)

(assert (=> b!376884 m!373895))

(declare-fun m!373897 () Bool)

(assert (=> b!376881 m!373897))

(declare-fun m!373899 () Bool)

(assert (=> b!376889 m!373899))

(declare-fun m!373901 () Bool)

(assert (=> b!376889 m!373901))

(declare-fun m!373903 () Bool)

(assert (=> mapNonEmpty!15102 m!373903))

(declare-fun m!373905 () Bool)

(assert (=> start!37236 m!373905))

(declare-fun m!373907 () Bool)

(assert (=> start!37236 m!373907))

(declare-fun m!373909 () Bool)

(assert (=> start!37236 m!373909))

(declare-fun m!373911 () Bool)

(assert (=> b!376887 m!373911))

(declare-fun m!373913 () Bool)

(assert (=> b!376887 m!373913))

(declare-fun m!373915 () Bool)

(assert (=> b!376891 m!373915))

(declare-fun m!373917 () Bool)

(assert (=> b!376891 m!373917))

(declare-fun m!373919 () Bool)

(assert (=> b!376891 m!373919))

(declare-fun m!373921 () Bool)

(assert (=> b!376891 m!373921))

(declare-fun m!373923 () Bool)

(assert (=> b!376891 m!373923))

(declare-fun m!373925 () Bool)

(assert (=> b!376891 m!373925))

(declare-fun m!373927 () Bool)

(assert (=> b!376891 m!373927))

(declare-fun m!373929 () Bool)

(assert (=> b!376885 m!373929))

(declare-fun m!373931 () Bool)

(assert (=> b!376890 m!373931))

(declare-fun m!373933 () Bool)

(assert (=> b!376890 m!373933))

(declare-fun m!373935 () Bool)

(assert (=> b!376890 m!373935))

(check-sat (not b!376880) (not b!376883) (not b!376881) tp_is_empty!9025 (not mapNonEmpty!15102) (not b!376887) (not start!37236) (not b!376891) (not b!376889) (not b!376884) (not b!376890) (not b!376885) (not b_next!8377) b_and!15633)
(check-sat b_and!15633 (not b_next!8377))
