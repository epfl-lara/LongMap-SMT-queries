; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37104 () Bool)

(assert start!37104)

(declare-fun b_free!8245 () Bool)

(declare-fun b_next!8245 () Bool)

(assert (=> start!37104 (= b_free!8245 (not b_next!8245))))

(declare-fun tp!29450 () Bool)

(declare-fun b_and!15501 () Bool)

(assert (=> start!37104 (= tp!29450 b_and!15501)))

(declare-fun b!373898 () Bool)

(declare-fun e!227908 () Bool)

(declare-fun tp_is_empty!8893 () Bool)

(assert (=> b!373898 (= e!227908 tp_is_empty!8893)))

(declare-fun b!373899 () Bool)

(declare-fun e!227903 () Bool)

(declare-fun e!227905 () Bool)

(assert (=> b!373899 (= e!227903 e!227905)))

(declare-fun res!210749 () Bool)

(assert (=> b!373899 (=> (not res!210749) (not e!227905))))

(declare-datatypes ((array!21708 0))(
  ( (array!21709 (arr!10322 (Array (_ BitVec 32) (_ BitVec 64))) (size!10674 (_ BitVec 32))) )
))
(declare-fun lt!172072 () array!21708)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21708 (_ BitVec 32)) Bool)

(assert (=> b!373899 (= res!210749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172072 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21708)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373899 (= lt!172072 (array!21709 (store (arr!10322 _keys!658) i!548 k0!778) (size!10674 _keys!658)))))

(declare-fun b!373900 () Bool)

(declare-fun res!210756 () Bool)

(assert (=> b!373900 (=> (not res!210756) (not e!227903))))

(assert (=> b!373900 (= res!210756 (or (= (select (arr!10322 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10322 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373901 () Bool)

(declare-fun res!210748 () Bool)

(assert (=> b!373901 (=> (not res!210748) (not e!227903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373901 (= res!210748 (validKeyInArray!0 k0!778))))

(declare-fun b!373902 () Bool)

(declare-fun res!210754 () Bool)

(assert (=> b!373902 (=> (not res!210754) (not e!227903))))

(declare-fun arrayContainsKey!0 (array!21708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373902 (= res!210754 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373903 () Bool)

(declare-fun res!210757 () Bool)

(assert (=> b!373903 (=> (not res!210757) (not e!227903))))

(declare-datatypes ((List!5715 0))(
  ( (Nil!5712) (Cons!5711 (h!6567 (_ BitVec 64)) (t!10857 List!5715)) )
))
(declare-fun arrayNoDuplicates!0 (array!21708 (_ BitVec 32) List!5715) Bool)

(assert (=> b!373903 (= res!210757 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5712))))

(declare-fun b!373905 () Bool)

(declare-fun e!227907 () Bool)

(assert (=> b!373905 (= e!227907 true)))

(declare-datatypes ((V!12963 0))(
  ( (V!12964 (val!4491 Int)) )
))
(declare-datatypes ((tuple2!5870 0))(
  ( (tuple2!5871 (_1!2946 (_ BitVec 64)) (_2!2946 V!12963)) )
))
(declare-datatypes ((List!5716 0))(
  ( (Nil!5713) (Cons!5712 (h!6568 tuple2!5870) (t!10858 List!5716)) )
))
(declare-datatypes ((ListLongMap!4785 0))(
  ( (ListLongMap!4786 (toList!2408 List!5716)) )
))
(declare-fun lt!172073 () ListLongMap!4785)

(declare-fun lt!172083 () tuple2!5870)

(declare-fun lt!172075 () ListLongMap!4785)

(declare-fun lt!172074 () tuple2!5870)

(declare-fun +!804 (ListLongMap!4785 tuple2!5870) ListLongMap!4785)

(assert (=> b!373905 (= (+!804 lt!172073 lt!172074) (+!804 lt!172075 lt!172083))))

(declare-fun v!373 () V!12963)

(declare-datatypes ((Unit!11497 0))(
  ( (Unit!11498) )
))
(declare-fun lt!172071 () Unit!11497)

(declare-fun minValue!472 () V!12963)

(declare-fun lt!172079 () ListLongMap!4785)

(declare-fun addCommutativeForDiffKeys!232 (ListLongMap!4785 (_ BitVec 64) V!12963 (_ BitVec 64) V!12963) Unit!11497)

(assert (=> b!373905 (= lt!172071 (addCommutativeForDiffKeys!232 lt!172079 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373906 () Bool)

(declare-fun res!210752 () Bool)

(assert (=> b!373906 (=> (not res!210752) (not e!227903))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4103 0))(
  ( (ValueCellFull!4103 (v!6689 V!12963)) (EmptyCell!4103) )
))
(declare-datatypes ((array!21710 0))(
  ( (array!21711 (arr!10323 (Array (_ BitVec 32) ValueCell!4103)) (size!10675 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21710)

(assert (=> b!373906 (= res!210752 (and (= (size!10675 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10674 _keys!658) (size!10675 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373907 () Bool)

(declare-fun e!227910 () Bool)

(assert (=> b!373907 (= e!227910 tp_is_empty!8893)))

(declare-fun mapIsEmpty!14904 () Bool)

(declare-fun mapRes!14904 () Bool)

(assert (=> mapIsEmpty!14904 mapRes!14904))

(declare-fun b!373908 () Bool)

(declare-fun e!227909 () Bool)

(assert (=> b!373908 (= e!227909 e!227907)))

(declare-fun res!210751 () Bool)

(assert (=> b!373908 (=> res!210751 e!227907)))

(assert (=> b!373908 (= res!210751 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172086 () ListLongMap!4785)

(assert (=> b!373908 (= lt!172086 lt!172073)))

(assert (=> b!373908 (= lt!172073 (+!804 lt!172079 lt!172083))))

(declare-fun lt!172081 () ListLongMap!4785)

(declare-fun zeroValue!472 () V!12963)

(declare-fun lt!172078 () Unit!11497)

(assert (=> b!373908 (= lt!172078 (addCommutativeForDiffKeys!232 lt!172081 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172082 () ListLongMap!4785)

(assert (=> b!373908 (= lt!172082 (+!804 lt!172086 lt!172074))))

(declare-fun lt!172085 () ListLongMap!4785)

(declare-fun lt!172084 () tuple2!5870)

(assert (=> b!373908 (= lt!172086 (+!804 lt!172085 lt!172084))))

(declare-fun lt!172076 () ListLongMap!4785)

(assert (=> b!373908 (= lt!172076 lt!172075)))

(assert (=> b!373908 (= lt!172075 (+!804 lt!172079 lt!172074))))

(assert (=> b!373908 (= lt!172079 (+!804 lt!172081 lt!172084))))

(declare-fun lt!172080 () ListLongMap!4785)

(assert (=> b!373908 (= lt!172082 (+!804 (+!804 lt!172080 lt!172084) lt!172074))))

(assert (=> b!373908 (= lt!172074 (tuple2!5871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373908 (= lt!172084 (tuple2!5871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373904 () Bool)

(declare-fun res!210750 () Bool)

(assert (=> b!373904 (=> (not res!210750) (not e!227905))))

(assert (=> b!373904 (= res!210750 (arrayNoDuplicates!0 lt!172072 #b00000000000000000000000000000000 Nil!5712))))

(declare-fun res!210753 () Bool)

(assert (=> start!37104 (=> (not res!210753) (not e!227903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37104 (= res!210753 (validMask!0 mask!970))))

(assert (=> start!37104 e!227903))

(declare-fun e!227906 () Bool)

(declare-fun array_inv!7660 (array!21710) Bool)

(assert (=> start!37104 (and (array_inv!7660 _values!506) e!227906)))

(assert (=> start!37104 tp!29450))

(assert (=> start!37104 true))

(assert (=> start!37104 tp_is_empty!8893))

(declare-fun array_inv!7661 (array!21708) Bool)

(assert (=> start!37104 (array_inv!7661 _keys!658)))

(declare-fun b!373909 () Bool)

(assert (=> b!373909 (= e!227905 (not e!227909))))

(declare-fun res!210747 () Bool)

(assert (=> b!373909 (=> res!210747 e!227909)))

(assert (=> b!373909 (= res!210747 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1868 (array!21708 array!21710 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) Int) ListLongMap!4785)

(assert (=> b!373909 (= lt!172076 (getCurrentListMap!1868 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172077 () array!21710)

(assert (=> b!373909 (= lt!172082 (getCurrentListMap!1868 lt!172072 lt!172077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373909 (and (= lt!172080 lt!172085) (= lt!172085 lt!172080))))

(assert (=> b!373909 (= lt!172085 (+!804 lt!172081 lt!172083))))

(assert (=> b!373909 (= lt!172083 (tuple2!5871 k0!778 v!373))))

(declare-fun lt!172087 () Unit!11497)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!55 (array!21708 array!21710 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) (_ BitVec 64) V!12963 (_ BitVec 32) Int) Unit!11497)

(assert (=> b!373909 (= lt!172087 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!55 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!715 (array!21708 array!21710 (_ BitVec 32) (_ BitVec 32) V!12963 V!12963 (_ BitVec 32) Int) ListLongMap!4785)

(assert (=> b!373909 (= lt!172080 (getCurrentListMapNoExtraKeys!715 lt!172072 lt!172077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373909 (= lt!172077 (array!21711 (store (arr!10323 _values!506) i!548 (ValueCellFull!4103 v!373)) (size!10675 _values!506)))))

(assert (=> b!373909 (= lt!172081 (getCurrentListMapNoExtraKeys!715 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373910 () Bool)

(declare-fun res!210758 () Bool)

(assert (=> b!373910 (=> (not res!210758) (not e!227903))))

(assert (=> b!373910 (= res!210758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14904 () Bool)

(declare-fun tp!29451 () Bool)

(assert (=> mapNonEmpty!14904 (= mapRes!14904 (and tp!29451 e!227908))))

(declare-fun mapKey!14904 () (_ BitVec 32))

(declare-fun mapValue!14904 () ValueCell!4103)

(declare-fun mapRest!14904 () (Array (_ BitVec 32) ValueCell!4103))

(assert (=> mapNonEmpty!14904 (= (arr!10323 _values!506) (store mapRest!14904 mapKey!14904 mapValue!14904))))

(declare-fun b!373911 () Bool)

(assert (=> b!373911 (= e!227906 (and e!227910 mapRes!14904))))

(declare-fun condMapEmpty!14904 () Bool)

(declare-fun mapDefault!14904 () ValueCell!4103)

(assert (=> b!373911 (= condMapEmpty!14904 (= (arr!10323 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4103)) mapDefault!14904)))))

(declare-fun b!373912 () Bool)

(declare-fun res!210755 () Bool)

(assert (=> b!373912 (=> (not res!210755) (not e!227903))))

(assert (=> b!373912 (= res!210755 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10674 _keys!658))))))

(assert (= (and start!37104 res!210753) b!373906))

(assert (= (and b!373906 res!210752) b!373910))

(assert (= (and b!373910 res!210758) b!373903))

(assert (= (and b!373903 res!210757) b!373912))

(assert (= (and b!373912 res!210755) b!373901))

(assert (= (and b!373901 res!210748) b!373900))

(assert (= (and b!373900 res!210756) b!373902))

(assert (= (and b!373902 res!210754) b!373899))

(assert (= (and b!373899 res!210749) b!373904))

(assert (= (and b!373904 res!210750) b!373909))

(assert (= (and b!373909 (not res!210747)) b!373908))

(assert (= (and b!373908 (not res!210751)) b!373905))

(assert (= (and b!373911 condMapEmpty!14904) mapIsEmpty!14904))

(assert (= (and b!373911 (not condMapEmpty!14904)) mapNonEmpty!14904))

(get-info :version)

(assert (= (and mapNonEmpty!14904 ((_ is ValueCellFull!4103) mapValue!14904)) b!373898))

(assert (= (and b!373911 ((_ is ValueCellFull!4103) mapDefault!14904)) b!373907))

(assert (= start!37104 b!373911))

(declare-fun m!370265 () Bool)

(assert (=> b!373904 m!370265))

(declare-fun m!370267 () Bool)

(assert (=> b!373900 m!370267))

(declare-fun m!370269 () Bool)

(assert (=> b!373908 m!370269))

(declare-fun m!370271 () Bool)

(assert (=> b!373908 m!370271))

(declare-fun m!370273 () Bool)

(assert (=> b!373908 m!370273))

(declare-fun m!370275 () Bool)

(assert (=> b!373908 m!370275))

(declare-fun m!370277 () Bool)

(assert (=> b!373908 m!370277))

(declare-fun m!370279 () Bool)

(assert (=> b!373908 m!370279))

(declare-fun m!370281 () Bool)

(assert (=> b!373908 m!370281))

(assert (=> b!373908 m!370273))

(declare-fun m!370283 () Bool)

(assert (=> b!373908 m!370283))

(declare-fun m!370285 () Bool)

(assert (=> start!37104 m!370285))

(declare-fun m!370287 () Bool)

(assert (=> start!37104 m!370287))

(declare-fun m!370289 () Bool)

(assert (=> start!37104 m!370289))

(declare-fun m!370291 () Bool)

(assert (=> b!373909 m!370291))

(declare-fun m!370293 () Bool)

(assert (=> b!373909 m!370293))

(declare-fun m!370295 () Bool)

(assert (=> b!373909 m!370295))

(declare-fun m!370297 () Bool)

(assert (=> b!373909 m!370297))

(declare-fun m!370299 () Bool)

(assert (=> b!373909 m!370299))

(declare-fun m!370301 () Bool)

(assert (=> b!373909 m!370301))

(declare-fun m!370303 () Bool)

(assert (=> b!373909 m!370303))

(declare-fun m!370305 () Bool)

(assert (=> b!373905 m!370305))

(declare-fun m!370307 () Bool)

(assert (=> b!373905 m!370307))

(declare-fun m!370309 () Bool)

(assert (=> b!373905 m!370309))

(declare-fun m!370311 () Bool)

(assert (=> b!373902 m!370311))

(declare-fun m!370313 () Bool)

(assert (=> b!373910 m!370313))

(declare-fun m!370315 () Bool)

(assert (=> b!373903 m!370315))

(declare-fun m!370317 () Bool)

(assert (=> mapNonEmpty!14904 m!370317))

(declare-fun m!370319 () Bool)

(assert (=> b!373899 m!370319))

(declare-fun m!370321 () Bool)

(assert (=> b!373899 m!370321))

(declare-fun m!370323 () Bool)

(assert (=> b!373901 m!370323))

(check-sat tp_is_empty!8893 (not b!373905) (not b!373909) (not start!37104) b_and!15501 (not b!373901) (not b!373910) (not b!373902) (not b!373904) (not b!373908) (not mapNonEmpty!14904) (not b!373899) (not b_next!8245) (not b!373903))
(check-sat b_and!15501 (not b_next!8245))
