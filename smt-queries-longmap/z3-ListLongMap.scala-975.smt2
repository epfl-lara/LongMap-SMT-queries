; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21092 () Bool)

(assert start!21092)

(declare-fun b_free!5599 () Bool)

(declare-fun b_next!5599 () Bool)

(assert (=> start!21092 (= b_free!5599 (not b_next!5599))))

(declare-fun tp!19858 () Bool)

(declare-fun b_and!12403 () Bool)

(assert (=> start!21092 (= tp!19858 b_and!12403)))

(declare-fun b!212050 () Bool)

(declare-datatypes ((V!6929 0))(
  ( (V!6930 (val!2775 Int)) )
))
(declare-datatypes ((tuple2!4170 0))(
  ( (tuple2!4171 (_1!2096 (_ BitVec 64)) (_2!2096 V!6929)) )
))
(declare-datatypes ((List!3078 0))(
  ( (Nil!3075) (Cons!3074 (h!3716 tuple2!4170) (t!8014 List!3078)) )
))
(declare-datatypes ((ListLongMap!3073 0))(
  ( (ListLongMap!3074 (toList!1552 List!3078)) )
))
(declare-fun lt!109148 () ListLongMap!3073)

(declare-fun minValue!615 () V!6929)

(declare-fun e!137977 () Bool)

(declare-fun lt!109151 () ListLongMap!3073)

(declare-fun +!576 (ListLongMap!3073 tuple2!4170) ListLongMap!3073)

(assert (=> b!212050 (= e!137977 (= lt!109148 (+!576 lt!109151 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212051 () Bool)

(declare-fun e!137979 () Bool)

(declare-fun tp_is_empty!5461 () Bool)

(assert (=> b!212051 (= e!137979 tp_is_empty!5461)))

(declare-fun b!212052 () Bool)

(declare-fun e!137980 () Bool)

(declare-fun mapRes!9281 () Bool)

(assert (=> b!212052 (= e!137980 (and e!137979 mapRes!9281))))

(declare-fun condMapEmpty!9281 () Bool)

(declare-datatypes ((ValueCell!2387 0))(
  ( (ValueCellFull!2387 (v!4767 V!6929)) (EmptyCell!2387) )
))
(declare-datatypes ((array!10115 0))(
  ( (array!10116 (arr!4800 (Array (_ BitVec 32) ValueCell!2387)) (size!5126 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10115)

(declare-fun mapDefault!9281 () ValueCell!2387)

(assert (=> b!212052 (= condMapEmpty!9281 (= (arr!4800 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2387)) mapDefault!9281)))))

(declare-fun res!103645 () Bool)

(declare-fun e!137982 () Bool)

(assert (=> start!21092 (=> (not res!103645) (not e!137982))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21092 (= res!103645 (validMask!0 mask!1149))))

(assert (=> start!21092 e!137982))

(declare-fun array_inv!3151 (array!10115) Bool)

(assert (=> start!21092 (and (array_inv!3151 _values!649) e!137980)))

(assert (=> start!21092 true))

(assert (=> start!21092 tp_is_empty!5461))

(declare-datatypes ((array!10117 0))(
  ( (array!10118 (arr!4801 (Array (_ BitVec 32) (_ BitVec 64))) (size!5127 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10117)

(declare-fun array_inv!3152 (array!10117) Bool)

(assert (=> start!21092 (array_inv!3152 _keys!825)))

(assert (=> start!21092 tp!19858))

(declare-fun b!212053 () Bool)

(declare-fun res!103642 () Bool)

(assert (=> b!212053 (=> (not res!103642) (not e!137982))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212053 (= res!103642 (and (= (size!5126 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5127 _keys!825) (size!5126 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212054 () Bool)

(declare-fun res!103639 () Bool)

(assert (=> b!212054 (=> (not res!103639) (not e!137982))))

(declare-datatypes ((List!3079 0))(
  ( (Nil!3076) (Cons!3075 (h!3717 (_ BitVec 64)) (t!8015 List!3079)) )
))
(declare-fun arrayNoDuplicates!0 (array!10117 (_ BitVec 32) List!3079) Bool)

(assert (=> b!212054 (= res!103639 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3076))))

(declare-fun b!212055 () Bool)

(declare-fun res!103644 () Bool)

(assert (=> b!212055 (=> (not res!103644) (not e!137982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10117 (_ BitVec 32)) Bool)

(assert (=> b!212055 (= res!103644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9281 () Bool)

(assert (=> mapIsEmpty!9281 mapRes!9281))

(declare-fun b!212056 () Bool)

(declare-fun e!137981 () Bool)

(assert (=> b!212056 (= e!137981 tp_is_empty!5461)))

(declare-fun b!212057 () Bool)

(declare-fun res!103646 () Bool)

(assert (=> b!212057 (=> (not res!103646) (not e!137982))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212057 (= res!103646 (= (select (arr!4801 _keys!825) i!601) k0!843))))

(declare-fun b!212058 () Bool)

(assert (=> b!212058 (= e!137982 (not e!137977))))

(declare-fun res!103640 () Bool)

(assert (=> b!212058 (=> res!103640 e!137977)))

(assert (=> b!212058 (= res!103640 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6929)

(declare-fun lt!109150 () ListLongMap!3073)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1064 (array!10117 array!10115 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) Int) ListLongMap!3073)

(assert (=> b!212058 (= lt!109150 (getCurrentListMap!1064 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109154 () array!10115)

(assert (=> b!212058 (= lt!109148 (getCurrentListMap!1064 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109152 () ListLongMap!3073)

(assert (=> b!212058 (and (= lt!109151 lt!109152) (= lt!109152 lt!109151))))

(declare-fun v!520 () V!6929)

(declare-fun lt!109149 () ListLongMap!3073)

(assert (=> b!212058 (= lt!109152 (+!576 lt!109149 (tuple2!4171 k0!843 v!520)))))

(declare-datatypes ((Unit!6402 0))(
  ( (Unit!6403) )
))
(declare-fun lt!109153 () Unit!6402)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 (array!10117 array!10115 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) (_ BitVec 64) V!6929 (_ BitVec 32) Int) Unit!6402)

(assert (=> b!212058 (= lt!109153 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!501 (array!10117 array!10115 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) Int) ListLongMap!3073)

(assert (=> b!212058 (= lt!109151 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212058 (= lt!109154 (array!10116 (store (arr!4800 _values!649) i!601 (ValueCellFull!2387 v!520)) (size!5126 _values!649)))))

(assert (=> b!212058 (= lt!109149 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212059 () Bool)

(declare-fun res!103641 () Bool)

(assert (=> b!212059 (=> (not res!103641) (not e!137982))))

(assert (=> b!212059 (= res!103641 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5127 _keys!825))))))

(declare-fun b!212060 () Bool)

(declare-fun res!103643 () Bool)

(assert (=> b!212060 (=> (not res!103643) (not e!137982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212060 (= res!103643 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!9281 () Bool)

(declare-fun tp!19859 () Bool)

(assert (=> mapNonEmpty!9281 (= mapRes!9281 (and tp!19859 e!137981))))

(declare-fun mapKey!9281 () (_ BitVec 32))

(declare-fun mapRest!9281 () (Array (_ BitVec 32) ValueCell!2387))

(declare-fun mapValue!9281 () ValueCell!2387)

(assert (=> mapNonEmpty!9281 (= (arr!4800 _values!649) (store mapRest!9281 mapKey!9281 mapValue!9281))))

(assert (= (and start!21092 res!103645) b!212053))

(assert (= (and b!212053 res!103642) b!212055))

(assert (= (and b!212055 res!103644) b!212054))

(assert (= (and b!212054 res!103639) b!212059))

(assert (= (and b!212059 res!103641) b!212060))

(assert (= (and b!212060 res!103643) b!212057))

(assert (= (and b!212057 res!103646) b!212058))

(assert (= (and b!212058 (not res!103640)) b!212050))

(assert (= (and b!212052 condMapEmpty!9281) mapIsEmpty!9281))

(assert (= (and b!212052 (not condMapEmpty!9281)) mapNonEmpty!9281))

(get-info :version)

(assert (= (and mapNonEmpty!9281 ((_ is ValueCellFull!2387) mapValue!9281)) b!212056))

(assert (= (and b!212052 ((_ is ValueCellFull!2387) mapDefault!9281)) b!212051))

(assert (= start!21092 b!212052))

(declare-fun m!239381 () Bool)

(assert (=> b!212054 m!239381))

(declare-fun m!239383 () Bool)

(assert (=> b!212055 m!239383))

(declare-fun m!239385 () Bool)

(assert (=> b!212058 m!239385))

(declare-fun m!239387 () Bool)

(assert (=> b!212058 m!239387))

(declare-fun m!239389 () Bool)

(assert (=> b!212058 m!239389))

(declare-fun m!239391 () Bool)

(assert (=> b!212058 m!239391))

(declare-fun m!239393 () Bool)

(assert (=> b!212058 m!239393))

(declare-fun m!239395 () Bool)

(assert (=> b!212058 m!239395))

(declare-fun m!239397 () Bool)

(assert (=> b!212058 m!239397))

(declare-fun m!239399 () Bool)

(assert (=> b!212057 m!239399))

(declare-fun m!239401 () Bool)

(assert (=> b!212060 m!239401))

(declare-fun m!239403 () Bool)

(assert (=> mapNonEmpty!9281 m!239403))

(declare-fun m!239405 () Bool)

(assert (=> start!21092 m!239405))

(declare-fun m!239407 () Bool)

(assert (=> start!21092 m!239407))

(declare-fun m!239409 () Bool)

(assert (=> start!21092 m!239409))

(declare-fun m!239411 () Bool)

(assert (=> b!212050 m!239411))

(check-sat tp_is_empty!5461 (not b!212055) (not b!212058) b_and!12403 (not b!212054) (not start!21092) (not b_next!5599) (not mapNonEmpty!9281) (not b!212060) (not b!212050))
(check-sat b_and!12403 (not b_next!5599))
(get-model)

(declare-fun d!57959 () Bool)

(assert (=> d!57959 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21092 d!57959))

(declare-fun d!57961 () Bool)

(assert (=> d!57961 (= (array_inv!3151 _values!649) (bvsge (size!5126 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21092 d!57961))

(declare-fun d!57963 () Bool)

(assert (=> d!57963 (= (array_inv!3152 _keys!825) (bvsge (size!5127 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21092 d!57963))

(declare-fun d!57965 () Bool)

(assert (=> d!57965 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212060 d!57965))

(declare-fun d!57967 () Bool)

(declare-fun e!138021 () Bool)

(assert (=> d!57967 e!138021))

(declare-fun res!103699 () Bool)

(assert (=> d!57967 (=> (not res!103699) (not e!138021))))

(declare-fun lt!109207 () ListLongMap!3073)

(declare-fun contains!1388 (ListLongMap!3073 (_ BitVec 64)) Bool)

(assert (=> d!57967 (= res!103699 (contains!1388 lt!109207 (_1!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lt!109206 () List!3078)

(assert (=> d!57967 (= lt!109207 (ListLongMap!3074 lt!109206))))

(declare-fun lt!109205 () Unit!6402)

(declare-fun lt!109208 () Unit!6402)

(assert (=> d!57967 (= lt!109205 lt!109208)))

(declare-datatypes ((Option!258 0))(
  ( (Some!257 (v!4773 V!6929)) (None!256) )
))
(declare-fun getValueByKey!252 (List!3078 (_ BitVec 64)) Option!258)

(assert (=> d!57967 (= (getValueByKey!252 lt!109206 (_1!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!257 (_2!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!142 (List!3078 (_ BitVec 64) V!6929) Unit!6402)

(assert (=> d!57967 (= lt!109208 (lemmaContainsTupThenGetReturnValue!142 lt!109206 (_1!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun insertStrictlySorted!145 (List!3078 (_ BitVec 64) V!6929) List!3078)

(assert (=> d!57967 (= lt!109206 (insertStrictlySorted!145 (toList!1552 lt!109151) (_1!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!57967 (= (+!576 lt!109151 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) lt!109207)))

(declare-fun b!212131 () Bool)

(declare-fun res!103700 () Bool)

(assert (=> b!212131 (=> (not res!103700) (not e!138021))))

(assert (=> b!212131 (= res!103700 (= (getValueByKey!252 (toList!1552 lt!109207) (_1!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!257 (_2!2096 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))))

(declare-fun b!212132 () Bool)

(declare-fun contains!1389 (List!3078 tuple2!4170) Bool)

(assert (=> b!212132 (= e!138021 (contains!1389 (toList!1552 lt!109207) (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!57967 res!103699) b!212131))

(assert (= (and b!212131 res!103700) b!212132))

(declare-fun m!239477 () Bool)

(assert (=> d!57967 m!239477))

(declare-fun m!239479 () Bool)

(assert (=> d!57967 m!239479))

(declare-fun m!239481 () Bool)

(assert (=> d!57967 m!239481))

(declare-fun m!239483 () Bool)

(assert (=> d!57967 m!239483))

(declare-fun m!239485 () Bool)

(assert (=> b!212131 m!239485))

(declare-fun m!239487 () Bool)

(assert (=> b!212132 m!239487))

(assert (=> b!212050 d!57967))

(declare-fun b!212141 () Bool)

(declare-fun e!138028 () Bool)

(declare-fun e!138029 () Bool)

(assert (=> b!212141 (= e!138028 e!138029)))

(declare-fun c!35755 () Bool)

(assert (=> b!212141 (= c!35755 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212142 () Bool)

(declare-fun e!138030 () Bool)

(assert (=> b!212142 (= e!138029 e!138030)))

(declare-fun lt!109217 () (_ BitVec 64))

(assert (=> b!212142 (= lt!109217 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109215 () Unit!6402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10117 (_ BitVec 64) (_ BitVec 32)) Unit!6402)

(assert (=> b!212142 (= lt!109215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109217 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212142 (arrayContainsKey!0 _keys!825 lt!109217 #b00000000000000000000000000000000)))

(declare-fun lt!109216 () Unit!6402)

(assert (=> b!212142 (= lt!109216 lt!109215)))

(declare-fun res!103705 () Bool)

(declare-datatypes ((SeekEntryResult!712 0))(
  ( (MissingZero!712 (index!5018 (_ BitVec 32))) (Found!712 (index!5019 (_ BitVec 32))) (Intermediate!712 (undefined!1524 Bool) (index!5020 (_ BitVec 32)) (x!22162 (_ BitVec 32))) (Undefined!712) (MissingVacant!712 (index!5021 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10117 (_ BitVec 32)) SeekEntryResult!712)

(assert (=> b!212142 (= res!103705 (= (seekEntryOrOpen!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!712 #b00000000000000000000000000000000)))))

(assert (=> b!212142 (=> (not res!103705) (not e!138030))))

(declare-fun bm!20060 () Bool)

(declare-fun call!20063 () Bool)

(assert (=> bm!20060 (= call!20063 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!212143 () Bool)

(assert (=> b!212143 (= e!138029 call!20063)))

(declare-fun b!212144 () Bool)

(assert (=> b!212144 (= e!138030 call!20063)))

(declare-fun d!57969 () Bool)

(declare-fun res!103706 () Bool)

(assert (=> d!57969 (=> res!103706 e!138028)))

(assert (=> d!57969 (= res!103706 (bvsge #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> d!57969 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138028)))

(assert (= (and d!57969 (not res!103706)) b!212141))

(assert (= (and b!212141 c!35755) b!212142))

(assert (= (and b!212141 (not c!35755)) b!212143))

(assert (= (and b!212142 res!103705) b!212144))

(assert (= (or b!212144 b!212143) bm!20060))

(declare-fun m!239489 () Bool)

(assert (=> b!212141 m!239489))

(assert (=> b!212141 m!239489))

(declare-fun m!239491 () Bool)

(assert (=> b!212141 m!239491))

(assert (=> b!212142 m!239489))

(declare-fun m!239493 () Bool)

(assert (=> b!212142 m!239493))

(declare-fun m!239495 () Bool)

(assert (=> b!212142 m!239495))

(assert (=> b!212142 m!239489))

(declare-fun m!239497 () Bool)

(assert (=> b!212142 m!239497))

(declare-fun m!239499 () Bool)

(assert (=> bm!20060 m!239499))

(assert (=> b!212055 d!57969))

(declare-fun b!212155 () Bool)

(declare-fun e!138040 () Bool)

(declare-fun e!138041 () Bool)

(assert (=> b!212155 (= e!138040 e!138041)))

(declare-fun c!35758 () Bool)

(assert (=> b!212155 (= c!35758 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212156 () Bool)

(declare-fun call!20066 () Bool)

(assert (=> b!212156 (= e!138041 call!20066)))

(declare-fun b!212157 () Bool)

(declare-fun e!138039 () Bool)

(assert (=> b!212157 (= e!138039 e!138040)))

(declare-fun res!103713 () Bool)

(assert (=> b!212157 (=> (not res!103713) (not e!138040))))

(declare-fun e!138042 () Bool)

(assert (=> b!212157 (= res!103713 (not e!138042))))

(declare-fun res!103714 () Bool)

(assert (=> b!212157 (=> (not res!103714) (not e!138042))))

(assert (=> b!212157 (= res!103714 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212158 () Bool)

(declare-fun contains!1390 (List!3079 (_ BitVec 64)) Bool)

(assert (=> b!212158 (= e!138042 (contains!1390 Nil!3076 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20063 () Bool)

(assert (=> bm!20063 (= call!20066 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35758 (Cons!3075 (select (arr!4801 _keys!825) #b00000000000000000000000000000000) Nil!3076) Nil!3076)))))

(declare-fun b!212159 () Bool)

(assert (=> b!212159 (= e!138041 call!20066)))

(declare-fun d!57971 () Bool)

(declare-fun res!103715 () Bool)

(assert (=> d!57971 (=> res!103715 e!138039)))

(assert (=> d!57971 (= res!103715 (bvsge #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> d!57971 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3076) e!138039)))

(assert (= (and d!57971 (not res!103715)) b!212157))

(assert (= (and b!212157 res!103714) b!212158))

(assert (= (and b!212157 res!103713) b!212155))

(assert (= (and b!212155 c!35758) b!212156))

(assert (= (and b!212155 (not c!35758)) b!212159))

(assert (= (or b!212156 b!212159) bm!20063))

(assert (=> b!212155 m!239489))

(assert (=> b!212155 m!239489))

(assert (=> b!212155 m!239491))

(assert (=> b!212157 m!239489))

(assert (=> b!212157 m!239489))

(assert (=> b!212157 m!239491))

(assert (=> b!212158 m!239489))

(assert (=> b!212158 m!239489))

(declare-fun m!239501 () Bool)

(assert (=> b!212158 m!239501))

(assert (=> bm!20063 m!239489))

(declare-fun m!239503 () Bool)

(assert (=> bm!20063 m!239503))

(assert (=> b!212054 d!57971))

(declare-fun d!57973 () Bool)

(declare-fun e!138043 () Bool)

(assert (=> d!57973 e!138043))

(declare-fun res!103716 () Bool)

(assert (=> d!57973 (=> (not res!103716) (not e!138043))))

(declare-fun lt!109220 () ListLongMap!3073)

(assert (=> d!57973 (= res!103716 (contains!1388 lt!109220 (_1!2096 (tuple2!4171 k0!843 v!520))))))

(declare-fun lt!109219 () List!3078)

(assert (=> d!57973 (= lt!109220 (ListLongMap!3074 lt!109219))))

(declare-fun lt!109218 () Unit!6402)

(declare-fun lt!109221 () Unit!6402)

(assert (=> d!57973 (= lt!109218 lt!109221)))

(assert (=> d!57973 (= (getValueByKey!252 lt!109219 (_1!2096 (tuple2!4171 k0!843 v!520))) (Some!257 (_2!2096 (tuple2!4171 k0!843 v!520))))))

(assert (=> d!57973 (= lt!109221 (lemmaContainsTupThenGetReturnValue!142 lt!109219 (_1!2096 (tuple2!4171 k0!843 v!520)) (_2!2096 (tuple2!4171 k0!843 v!520))))))

(assert (=> d!57973 (= lt!109219 (insertStrictlySorted!145 (toList!1552 lt!109149) (_1!2096 (tuple2!4171 k0!843 v!520)) (_2!2096 (tuple2!4171 k0!843 v!520))))))

(assert (=> d!57973 (= (+!576 lt!109149 (tuple2!4171 k0!843 v!520)) lt!109220)))

(declare-fun b!212160 () Bool)

(declare-fun res!103717 () Bool)

(assert (=> b!212160 (=> (not res!103717) (not e!138043))))

(assert (=> b!212160 (= res!103717 (= (getValueByKey!252 (toList!1552 lt!109220) (_1!2096 (tuple2!4171 k0!843 v!520))) (Some!257 (_2!2096 (tuple2!4171 k0!843 v!520)))))))

(declare-fun b!212161 () Bool)

(assert (=> b!212161 (= e!138043 (contains!1389 (toList!1552 lt!109220) (tuple2!4171 k0!843 v!520)))))

(assert (= (and d!57973 res!103716) b!212160))

(assert (= (and b!212160 res!103717) b!212161))

(declare-fun m!239505 () Bool)

(assert (=> d!57973 m!239505))

(declare-fun m!239507 () Bool)

(assert (=> d!57973 m!239507))

(declare-fun m!239509 () Bool)

(assert (=> d!57973 m!239509))

(declare-fun m!239511 () Bool)

(assert (=> d!57973 m!239511))

(declare-fun m!239513 () Bool)

(assert (=> b!212160 m!239513))

(declare-fun m!239515 () Bool)

(assert (=> b!212161 m!239515))

(assert (=> b!212058 d!57973))

(declare-fun bm!20066 () Bool)

(declare-fun call!20069 () ListLongMap!3073)

(assert (=> bm!20066 (= call!20069 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212186 () Bool)

(declare-fun e!138060 () Bool)

(declare-fun e!138059 () Bool)

(assert (=> b!212186 (= e!138060 e!138059)))

(assert (=> b!212186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun res!103729 () Bool)

(declare-fun lt!109239 () ListLongMap!3073)

(assert (=> b!212186 (= res!103729 (contains!1388 lt!109239 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212186 (=> (not res!103729) (not e!138059))))

(declare-fun b!212187 () Bool)

(declare-fun e!138064 () Bool)

(declare-fun isEmpty!501 (ListLongMap!3073) Bool)

(assert (=> b!212187 (= e!138064 (isEmpty!501 lt!109239))))

(declare-fun b!212188 () Bool)

(assert (=> b!212188 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> b!212188 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5126 _values!649)))))

(declare-fun apply!196 (ListLongMap!3073 (_ BitVec 64)) V!6929)

(declare-fun get!2566 (ValueCell!2387 V!6929) V!6929)

(declare-fun dynLambda!530 (Int (_ BitVec 64)) V!6929)

(assert (=> b!212188 (= e!138059 (= (apply!196 lt!109239 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4800 _values!649) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!57975 () Bool)

(declare-fun e!138058 () Bool)

(assert (=> d!57975 e!138058))

(declare-fun res!103726 () Bool)

(assert (=> d!57975 (=> (not res!103726) (not e!138058))))

(assert (=> d!57975 (= res!103726 (not (contains!1388 lt!109239 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138063 () ListLongMap!3073)

(assert (=> d!57975 (= lt!109239 e!138063)))

(declare-fun c!35768 () Bool)

(assert (=> d!57975 (= c!35768 (bvsge #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> d!57975 (validMask!0 mask!1149)))

(assert (=> d!57975 (= (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109239)))

(declare-fun b!212189 () Bool)

(declare-fun e!138061 () ListLongMap!3073)

(assert (=> b!212189 (= e!138061 call!20069)))

(declare-fun b!212190 () Bool)

(assert (=> b!212190 (= e!138064 (= lt!109239 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212191 () Bool)

(assert (=> b!212191 (= e!138058 e!138060)))

(declare-fun c!35767 () Bool)

(declare-fun e!138062 () Bool)

(assert (=> b!212191 (= c!35767 e!138062)))

(declare-fun res!103728 () Bool)

(assert (=> b!212191 (=> (not res!103728) (not e!138062))))

(assert (=> b!212191 (= res!103728 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun b!212192 () Bool)

(assert (=> b!212192 (= e!138062 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212192 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212193 () Bool)

(assert (=> b!212193 (= e!138060 e!138064)))

(declare-fun c!35769 () Bool)

(assert (=> b!212193 (= c!35769 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun b!212194 () Bool)

(assert (=> b!212194 (= e!138063 (ListLongMap!3074 Nil!3075))))

(declare-fun b!212195 () Bool)

(declare-fun res!103727 () Bool)

(assert (=> b!212195 (=> (not res!103727) (not e!138058))))

(assert (=> b!212195 (= res!103727 (not (contains!1388 lt!109239 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212196 () Bool)

(declare-fun lt!109236 () Unit!6402)

(declare-fun lt!109240 () Unit!6402)

(assert (=> b!212196 (= lt!109236 lt!109240)))

(declare-fun lt!109242 () (_ BitVec 64))

(declare-fun lt!109238 () ListLongMap!3073)

(declare-fun lt!109241 () (_ BitVec 64))

(declare-fun lt!109237 () V!6929)

(assert (=> b!212196 (not (contains!1388 (+!576 lt!109238 (tuple2!4171 lt!109241 lt!109237)) lt!109242))))

(declare-fun addStillNotContains!106 (ListLongMap!3073 (_ BitVec 64) V!6929 (_ BitVec 64)) Unit!6402)

(assert (=> b!212196 (= lt!109240 (addStillNotContains!106 lt!109238 lt!109241 lt!109237 lt!109242))))

(assert (=> b!212196 (= lt!109242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212196 (= lt!109237 (get!2566 (select (arr!4800 _values!649) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212196 (= lt!109241 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212196 (= lt!109238 call!20069)))

(assert (=> b!212196 (= e!138061 (+!576 call!20069 (tuple2!4171 (select (arr!4801 _keys!825) #b00000000000000000000000000000000) (get!2566 (select (arr!4800 _values!649) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212197 () Bool)

(assert (=> b!212197 (= e!138063 e!138061)))

(declare-fun c!35770 () Bool)

(assert (=> b!212197 (= c!35770 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57975 c!35768) b!212194))

(assert (= (and d!57975 (not c!35768)) b!212197))

(assert (= (and b!212197 c!35770) b!212196))

(assert (= (and b!212197 (not c!35770)) b!212189))

(assert (= (or b!212196 b!212189) bm!20066))

(assert (= (and d!57975 res!103726) b!212195))

(assert (= (and b!212195 res!103727) b!212191))

(assert (= (and b!212191 res!103728) b!212192))

(assert (= (and b!212191 c!35767) b!212186))

(assert (= (and b!212191 (not c!35767)) b!212193))

(assert (= (and b!212186 res!103729) b!212188))

(assert (= (and b!212193 c!35769) b!212190))

(assert (= (and b!212193 (not c!35769)) b!212187))

(declare-fun b_lambda!7689 () Bool)

(assert (=> (not b_lambda!7689) (not b!212188)))

(declare-fun t!8019 () Bool)

(declare-fun tb!2897 () Bool)

(assert (=> (and start!21092 (= defaultEntry!657 defaultEntry!657) t!8019) tb!2897))

(declare-fun result!4995 () Bool)

(assert (=> tb!2897 (= result!4995 tp_is_empty!5461)))

(assert (=> b!212188 t!8019))

(declare-fun b_and!12409 () Bool)

(assert (= b_and!12403 (and (=> t!8019 result!4995) b_and!12409)))

(declare-fun b_lambda!7691 () Bool)

(assert (=> (not b_lambda!7691) (not b!212196)))

(assert (=> b!212196 t!8019))

(declare-fun b_and!12411 () Bool)

(assert (= b_and!12409 (and (=> t!8019 result!4995) b_and!12411)))

(declare-fun m!239517 () Bool)

(assert (=> b!212190 m!239517))

(declare-fun m!239519 () Bool)

(assert (=> d!57975 m!239519))

(assert (=> d!57975 m!239405))

(declare-fun m!239521 () Bool)

(assert (=> b!212188 m!239521))

(declare-fun m!239523 () Bool)

(assert (=> b!212188 m!239523))

(declare-fun m!239525 () Bool)

(assert (=> b!212188 m!239525))

(assert (=> b!212188 m!239521))

(assert (=> b!212188 m!239489))

(declare-fun m!239527 () Bool)

(assert (=> b!212188 m!239527))

(assert (=> b!212188 m!239489))

(assert (=> b!212188 m!239523))

(assert (=> b!212196 m!239521))

(assert (=> b!212196 m!239523))

(assert (=> b!212196 m!239525))

(declare-fun m!239529 () Bool)

(assert (=> b!212196 m!239529))

(assert (=> b!212196 m!239489))

(declare-fun m!239531 () Bool)

(assert (=> b!212196 m!239531))

(assert (=> b!212196 m!239529))

(declare-fun m!239533 () Bool)

(assert (=> b!212196 m!239533))

(assert (=> b!212196 m!239521))

(assert (=> b!212196 m!239523))

(declare-fun m!239535 () Bool)

(assert (=> b!212196 m!239535))

(declare-fun m!239537 () Bool)

(assert (=> b!212195 m!239537))

(assert (=> b!212192 m!239489))

(assert (=> b!212192 m!239489))

(assert (=> b!212192 m!239491))

(assert (=> b!212197 m!239489))

(assert (=> b!212197 m!239489))

(assert (=> b!212197 m!239491))

(assert (=> bm!20066 m!239517))

(declare-fun m!239539 () Bool)

(assert (=> b!212187 m!239539))

(assert (=> b!212186 m!239489))

(assert (=> b!212186 m!239489))

(declare-fun m!239541 () Bool)

(assert (=> b!212186 m!239541))

(assert (=> b!212058 d!57975))

(declare-fun b!212242 () Bool)

(declare-fun res!103749 () Bool)

(declare-fun e!138103 () Bool)

(assert (=> b!212242 (=> (not res!103749) (not e!138103))))

(declare-fun e!138102 () Bool)

(assert (=> b!212242 (= res!103749 e!138102)))

(declare-fun res!103751 () Bool)

(assert (=> b!212242 (=> res!103751 e!138102)))

(declare-fun e!138101 () Bool)

(assert (=> b!212242 (= res!103751 (not e!138101))))

(declare-fun res!103755 () Bool)

(assert (=> b!212242 (=> (not res!103755) (not e!138101))))

(assert (=> b!212242 (= res!103755 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun d!57977 () Bool)

(assert (=> d!57977 e!138103))

(declare-fun res!103753 () Bool)

(assert (=> d!57977 (=> (not res!103753) (not e!138103))))

(assert (=> d!57977 (= res!103753 (or (bvsge #b00000000000000000000000000000000 (size!5127 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))))

(declare-fun lt!109292 () ListLongMap!3073)

(declare-fun lt!109300 () ListLongMap!3073)

(assert (=> d!57977 (= lt!109292 lt!109300)))

(declare-fun lt!109299 () Unit!6402)

(declare-fun e!138096 () Unit!6402)

(assert (=> d!57977 (= lt!109299 e!138096)))

(declare-fun c!35787 () Bool)

(declare-fun e!138098 () Bool)

(assert (=> d!57977 (= c!35787 e!138098)))

(declare-fun res!103754 () Bool)

(assert (=> d!57977 (=> (not res!103754) (not e!138098))))

(assert (=> d!57977 (= res!103754 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun e!138093 () ListLongMap!3073)

(assert (=> d!57977 (= lt!109300 e!138093)))

(declare-fun c!35785 () Bool)

(assert (=> d!57977 (= c!35785 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57977 (validMask!0 mask!1149)))

(assert (=> d!57977 (= (getCurrentListMap!1064 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109292)))

(declare-fun b!212243 () Bool)

(declare-fun Unit!6404 () Unit!6402)

(assert (=> b!212243 (= e!138096 Unit!6404)))

(declare-fun b!212244 () Bool)

(declare-fun e!138100 () Bool)

(declare-fun call!20089 () Bool)

(assert (=> b!212244 (= e!138100 (not call!20089))))

(declare-fun b!212245 () Bool)

(declare-fun res!103748 () Bool)

(assert (=> b!212245 (=> (not res!103748) (not e!138103))))

(declare-fun e!138091 () Bool)

(assert (=> b!212245 (= res!103748 e!138091)))

(declare-fun c!35783 () Bool)

(assert (=> b!212245 (= c!35783 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20081 () Bool)

(declare-fun call!20085 () Bool)

(assert (=> bm!20081 (= call!20085 (contains!1388 lt!109292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212246 () Bool)

(declare-fun call!20090 () ListLongMap!3073)

(assert (=> b!212246 (= e!138093 (+!576 call!20090 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212247 () Bool)

(assert (=> b!212247 (= e!138098 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212248 () Bool)

(declare-fun e!138092 () ListLongMap!3073)

(declare-fun call!20088 () ListLongMap!3073)

(assert (=> b!212248 (= e!138092 call!20088)))

(declare-fun b!212249 () Bool)

(declare-fun e!138099 () ListLongMap!3073)

(assert (=> b!212249 (= e!138093 e!138099)))

(declare-fun c!35788 () Bool)

(assert (=> b!212249 (= c!35788 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20082 () Bool)

(assert (=> bm!20082 (= call!20089 (contains!1388 lt!109292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212250 () Bool)

(declare-fun c!35784 () Bool)

(assert (=> b!212250 (= c!35784 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212250 (= e!138099 e!138092)))

(declare-fun bm!20083 () Bool)

(declare-fun call!20087 () ListLongMap!3073)

(declare-fun call!20086 () ListLongMap!3073)

(assert (=> bm!20083 (= call!20087 call!20086)))

(declare-fun b!212251 () Bool)

(declare-fun e!138094 () Bool)

(assert (=> b!212251 (= e!138094 (= (apply!196 lt!109292 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!212252 () Bool)

(assert (=> b!212252 (= e!138100 e!138094)))

(declare-fun res!103752 () Bool)

(assert (=> b!212252 (= res!103752 call!20089)))

(assert (=> b!212252 (=> (not res!103752) (not e!138094))))

(declare-fun b!212253 () Bool)

(declare-fun e!138095 () Bool)

(assert (=> b!212253 (= e!138095 (= (apply!196 lt!109292 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20084 () Bool)

(declare-fun call!20084 () ListLongMap!3073)

(assert (=> bm!20084 (= call!20084 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212254 () Bool)

(assert (=> b!212254 (= e!138101 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20085 () Bool)

(assert (=> bm!20085 (= call!20088 call!20090)))

(declare-fun b!212255 () Bool)

(assert (=> b!212255 (= e!138103 e!138100)))

(declare-fun c!35786 () Bool)

(assert (=> b!212255 (= c!35786 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212256 () Bool)

(assert (=> b!212256 (= e!138091 e!138095)))

(declare-fun res!103750 () Bool)

(assert (=> b!212256 (= res!103750 call!20085)))

(assert (=> b!212256 (=> (not res!103750) (not e!138095))))

(declare-fun bm!20086 () Bool)

(assert (=> bm!20086 (= call!20086 call!20084)))

(declare-fun b!212257 () Bool)

(declare-fun e!138097 () Bool)

(assert (=> b!212257 (= e!138102 e!138097)))

(declare-fun res!103756 () Bool)

(assert (=> b!212257 (=> (not res!103756) (not e!138097))))

(assert (=> b!212257 (= res!103756 (contains!1388 lt!109292 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun b!212258 () Bool)

(assert (=> b!212258 (= e!138097 (= (apply!196 lt!109292 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4800 lt!109154) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5126 lt!109154)))))

(assert (=> b!212258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun bm!20087 () Bool)

(assert (=> bm!20087 (= call!20090 (+!576 (ite c!35785 call!20084 (ite c!35788 call!20086 call!20087)) (ite (or c!35785 c!35788) (tuple2!4171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212259 () Bool)

(declare-fun lt!109304 () Unit!6402)

(assert (=> b!212259 (= e!138096 lt!109304)))

(declare-fun lt!109301 () ListLongMap!3073)

(assert (=> b!212259 (= lt!109301 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109290 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109303 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109303 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109287 () Unit!6402)

(declare-fun addStillContains!172 (ListLongMap!3073 (_ BitVec 64) V!6929 (_ BitVec 64)) Unit!6402)

(assert (=> b!212259 (= lt!109287 (addStillContains!172 lt!109301 lt!109290 zeroValue!615 lt!109303))))

(assert (=> b!212259 (contains!1388 (+!576 lt!109301 (tuple2!4171 lt!109290 zeroValue!615)) lt!109303)))

(declare-fun lt!109293 () Unit!6402)

(assert (=> b!212259 (= lt!109293 lt!109287)))

(declare-fun lt!109308 () ListLongMap!3073)

(assert (=> b!212259 (= lt!109308 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109307 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109307 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109297 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109297 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109305 () Unit!6402)

(declare-fun addApplyDifferent!172 (ListLongMap!3073 (_ BitVec 64) V!6929 (_ BitVec 64)) Unit!6402)

(assert (=> b!212259 (= lt!109305 (addApplyDifferent!172 lt!109308 lt!109307 minValue!615 lt!109297))))

(assert (=> b!212259 (= (apply!196 (+!576 lt!109308 (tuple2!4171 lt!109307 minValue!615)) lt!109297) (apply!196 lt!109308 lt!109297))))

(declare-fun lt!109288 () Unit!6402)

(assert (=> b!212259 (= lt!109288 lt!109305)))

(declare-fun lt!109294 () ListLongMap!3073)

(assert (=> b!212259 (= lt!109294 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109296 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109298 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109298 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109289 () Unit!6402)

(assert (=> b!212259 (= lt!109289 (addApplyDifferent!172 lt!109294 lt!109296 zeroValue!615 lt!109298))))

(assert (=> b!212259 (= (apply!196 (+!576 lt!109294 (tuple2!4171 lt!109296 zeroValue!615)) lt!109298) (apply!196 lt!109294 lt!109298))))

(declare-fun lt!109291 () Unit!6402)

(assert (=> b!212259 (= lt!109291 lt!109289)))

(declare-fun lt!109306 () ListLongMap!3073)

(assert (=> b!212259 (= lt!109306 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109295 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109302 () (_ BitVec 64))

(assert (=> b!212259 (= lt!109302 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212259 (= lt!109304 (addApplyDifferent!172 lt!109306 lt!109295 minValue!615 lt!109302))))

(assert (=> b!212259 (= (apply!196 (+!576 lt!109306 (tuple2!4171 lt!109295 minValue!615)) lt!109302) (apply!196 lt!109306 lt!109302))))

(declare-fun b!212260 () Bool)

(assert (=> b!212260 (= e!138092 call!20087)))

(declare-fun b!212261 () Bool)

(assert (=> b!212261 (= e!138099 call!20088)))

(declare-fun b!212262 () Bool)

(assert (=> b!212262 (= e!138091 (not call!20085))))

(assert (= (and d!57977 c!35785) b!212246))

(assert (= (and d!57977 (not c!35785)) b!212249))

(assert (= (and b!212249 c!35788) b!212261))

(assert (= (and b!212249 (not c!35788)) b!212250))

(assert (= (and b!212250 c!35784) b!212248))

(assert (= (and b!212250 (not c!35784)) b!212260))

(assert (= (or b!212248 b!212260) bm!20083))

(assert (= (or b!212261 bm!20083) bm!20086))

(assert (= (or b!212261 b!212248) bm!20085))

(assert (= (or b!212246 bm!20086) bm!20084))

(assert (= (or b!212246 bm!20085) bm!20087))

(assert (= (and d!57977 res!103754) b!212247))

(assert (= (and d!57977 c!35787) b!212259))

(assert (= (and d!57977 (not c!35787)) b!212243))

(assert (= (and d!57977 res!103753) b!212242))

(assert (= (and b!212242 res!103755) b!212254))

(assert (= (and b!212242 (not res!103751)) b!212257))

(assert (= (and b!212257 res!103756) b!212258))

(assert (= (and b!212242 res!103749) b!212245))

(assert (= (and b!212245 c!35783) b!212256))

(assert (= (and b!212245 (not c!35783)) b!212262))

(assert (= (and b!212256 res!103750) b!212253))

(assert (= (or b!212256 b!212262) bm!20081))

(assert (= (and b!212245 res!103748) b!212255))

(assert (= (and b!212255 c!35786) b!212252))

(assert (= (and b!212255 (not c!35786)) b!212244))

(assert (= (and b!212252 res!103752) b!212251))

(assert (= (or b!212252 b!212244) bm!20082))

(declare-fun b_lambda!7693 () Bool)

(assert (=> (not b_lambda!7693) (not b!212258)))

(assert (=> b!212258 t!8019))

(declare-fun b_and!12413 () Bool)

(assert (= b_and!12411 (and (=> t!8019 result!4995) b_and!12413)))

(declare-fun m!239543 () Bool)

(assert (=> b!212259 m!239543))

(assert (=> b!212259 m!239389))

(declare-fun m!239545 () Bool)

(assert (=> b!212259 m!239545))

(declare-fun m!239547 () Bool)

(assert (=> b!212259 m!239547))

(declare-fun m!239549 () Bool)

(assert (=> b!212259 m!239549))

(declare-fun m!239551 () Bool)

(assert (=> b!212259 m!239551))

(assert (=> b!212259 m!239545))

(declare-fun m!239553 () Bool)

(assert (=> b!212259 m!239553))

(assert (=> b!212259 m!239549))

(declare-fun m!239555 () Bool)

(assert (=> b!212259 m!239555))

(declare-fun m!239557 () Bool)

(assert (=> b!212259 m!239557))

(declare-fun m!239559 () Bool)

(assert (=> b!212259 m!239559))

(assert (=> b!212259 m!239555))

(declare-fun m!239561 () Bool)

(assert (=> b!212259 m!239561))

(declare-fun m!239563 () Bool)

(assert (=> b!212259 m!239563))

(declare-fun m!239565 () Bool)

(assert (=> b!212259 m!239565))

(assert (=> b!212259 m!239557))

(declare-fun m!239567 () Bool)

(assert (=> b!212259 m!239567))

(declare-fun m!239569 () Bool)

(assert (=> b!212259 m!239569))

(declare-fun m!239571 () Bool)

(assert (=> b!212259 m!239571))

(assert (=> b!212259 m!239489))

(declare-fun m!239573 () Bool)

(assert (=> b!212246 m!239573))

(assert (=> b!212257 m!239489))

(assert (=> b!212257 m!239489))

(declare-fun m!239575 () Bool)

(assert (=> b!212257 m!239575))

(declare-fun m!239577 () Bool)

(assert (=> bm!20087 m!239577))

(assert (=> b!212254 m!239489))

(assert (=> b!212254 m!239489))

(assert (=> b!212254 m!239491))

(declare-fun m!239579 () Bool)

(assert (=> bm!20082 m!239579))

(assert (=> bm!20084 m!239389))

(declare-fun m!239581 () Bool)

(assert (=> bm!20081 m!239581))

(declare-fun m!239583 () Bool)

(assert (=> b!212251 m!239583))

(declare-fun m!239585 () Bool)

(assert (=> b!212253 m!239585))

(assert (=> b!212247 m!239489))

(assert (=> b!212247 m!239489))

(assert (=> b!212247 m!239491))

(declare-fun m!239587 () Bool)

(assert (=> b!212258 m!239587))

(assert (=> b!212258 m!239523))

(declare-fun m!239589 () Bool)

(assert (=> b!212258 m!239589))

(assert (=> b!212258 m!239489))

(declare-fun m!239591 () Bool)

(assert (=> b!212258 m!239591))

(assert (=> b!212258 m!239523))

(assert (=> b!212258 m!239489))

(assert (=> b!212258 m!239587))

(assert (=> d!57977 m!239405))

(assert (=> b!212058 d!57977))

(declare-fun call!20091 () ListLongMap!3073)

(declare-fun bm!20088 () Bool)

(assert (=> bm!20088 (= call!20091 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!212263 () Bool)

(declare-fun e!138106 () Bool)

(declare-fun e!138105 () Bool)

(assert (=> b!212263 (= e!138106 e!138105)))

(assert (=> b!212263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun res!103760 () Bool)

(declare-fun lt!109312 () ListLongMap!3073)

(assert (=> b!212263 (= res!103760 (contains!1388 lt!109312 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212263 (=> (not res!103760) (not e!138105))))

(declare-fun b!212264 () Bool)

(declare-fun e!138110 () Bool)

(assert (=> b!212264 (= e!138110 (isEmpty!501 lt!109312))))

(declare-fun b!212265 () Bool)

(assert (=> b!212265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> b!212265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5126 lt!109154)))))

(assert (=> b!212265 (= e!138105 (= (apply!196 lt!109312 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4800 lt!109154) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!57979 () Bool)

(declare-fun e!138104 () Bool)

(assert (=> d!57979 e!138104))

(declare-fun res!103757 () Bool)

(assert (=> d!57979 (=> (not res!103757) (not e!138104))))

(assert (=> d!57979 (= res!103757 (not (contains!1388 lt!109312 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138109 () ListLongMap!3073)

(assert (=> d!57979 (= lt!109312 e!138109)))

(declare-fun c!35790 () Bool)

(assert (=> d!57979 (= c!35790 (bvsge #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> d!57979 (validMask!0 mask!1149)))

(assert (=> d!57979 (= (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109312)))

(declare-fun b!212266 () Bool)

(declare-fun e!138107 () ListLongMap!3073)

(assert (=> b!212266 (= e!138107 call!20091)))

(declare-fun b!212267 () Bool)

(assert (=> b!212267 (= e!138110 (= lt!109312 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109154 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212268 () Bool)

(assert (=> b!212268 (= e!138104 e!138106)))

(declare-fun c!35789 () Bool)

(declare-fun e!138108 () Bool)

(assert (=> b!212268 (= c!35789 e!138108)))

(declare-fun res!103759 () Bool)

(assert (=> b!212268 (=> (not res!103759) (not e!138108))))

(assert (=> b!212268 (= res!103759 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun b!212269 () Bool)

(assert (=> b!212269 (= e!138108 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212269 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212270 () Bool)

(assert (=> b!212270 (= e!138106 e!138110)))

(declare-fun c!35791 () Bool)

(assert (=> b!212270 (= c!35791 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun b!212271 () Bool)

(assert (=> b!212271 (= e!138109 (ListLongMap!3074 Nil!3075))))

(declare-fun b!212272 () Bool)

(declare-fun res!103758 () Bool)

(assert (=> b!212272 (=> (not res!103758) (not e!138104))))

(assert (=> b!212272 (= res!103758 (not (contains!1388 lt!109312 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!212273 () Bool)

(declare-fun lt!109309 () Unit!6402)

(declare-fun lt!109313 () Unit!6402)

(assert (=> b!212273 (= lt!109309 lt!109313)))

(declare-fun lt!109314 () (_ BitVec 64))

(declare-fun lt!109311 () ListLongMap!3073)

(declare-fun lt!109310 () V!6929)

(declare-fun lt!109315 () (_ BitVec 64))

(assert (=> b!212273 (not (contains!1388 (+!576 lt!109311 (tuple2!4171 lt!109314 lt!109310)) lt!109315))))

(assert (=> b!212273 (= lt!109313 (addStillNotContains!106 lt!109311 lt!109314 lt!109310 lt!109315))))

(assert (=> b!212273 (= lt!109315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212273 (= lt!109310 (get!2566 (select (arr!4800 lt!109154) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212273 (= lt!109314 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212273 (= lt!109311 call!20091)))

(assert (=> b!212273 (= e!138107 (+!576 call!20091 (tuple2!4171 (select (arr!4801 _keys!825) #b00000000000000000000000000000000) (get!2566 (select (arr!4800 lt!109154) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212274 () Bool)

(assert (=> b!212274 (= e!138109 e!138107)))

(declare-fun c!35792 () Bool)

(assert (=> b!212274 (= c!35792 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57979 c!35790) b!212271))

(assert (= (and d!57979 (not c!35790)) b!212274))

(assert (= (and b!212274 c!35792) b!212273))

(assert (= (and b!212274 (not c!35792)) b!212266))

(assert (= (or b!212273 b!212266) bm!20088))

(assert (= (and d!57979 res!103757) b!212272))

(assert (= (and b!212272 res!103758) b!212268))

(assert (= (and b!212268 res!103759) b!212269))

(assert (= (and b!212268 c!35789) b!212263))

(assert (= (and b!212268 (not c!35789)) b!212270))

(assert (= (and b!212263 res!103760) b!212265))

(assert (= (and b!212270 c!35791) b!212267))

(assert (= (and b!212270 (not c!35791)) b!212264))

(declare-fun b_lambda!7695 () Bool)

(assert (=> (not b_lambda!7695) (not b!212265)))

(assert (=> b!212265 t!8019))

(declare-fun b_and!12415 () Bool)

(assert (= b_and!12413 (and (=> t!8019 result!4995) b_and!12415)))

(declare-fun b_lambda!7697 () Bool)

(assert (=> (not b_lambda!7697) (not b!212273)))

(assert (=> b!212273 t!8019))

(declare-fun b_and!12417 () Bool)

(assert (= b_and!12415 (and (=> t!8019 result!4995) b_and!12417)))

(declare-fun m!239593 () Bool)

(assert (=> b!212267 m!239593))

(declare-fun m!239595 () Bool)

(assert (=> d!57979 m!239595))

(assert (=> d!57979 m!239405))

(assert (=> b!212265 m!239587))

(assert (=> b!212265 m!239523))

(assert (=> b!212265 m!239589))

(assert (=> b!212265 m!239587))

(assert (=> b!212265 m!239489))

(declare-fun m!239597 () Bool)

(assert (=> b!212265 m!239597))

(assert (=> b!212265 m!239489))

(assert (=> b!212265 m!239523))

(assert (=> b!212273 m!239587))

(assert (=> b!212273 m!239523))

(assert (=> b!212273 m!239589))

(declare-fun m!239599 () Bool)

(assert (=> b!212273 m!239599))

(assert (=> b!212273 m!239489))

(declare-fun m!239601 () Bool)

(assert (=> b!212273 m!239601))

(assert (=> b!212273 m!239599))

(declare-fun m!239603 () Bool)

(assert (=> b!212273 m!239603))

(assert (=> b!212273 m!239587))

(assert (=> b!212273 m!239523))

(declare-fun m!239605 () Bool)

(assert (=> b!212273 m!239605))

(declare-fun m!239607 () Bool)

(assert (=> b!212272 m!239607))

(assert (=> b!212269 m!239489))

(assert (=> b!212269 m!239489))

(assert (=> b!212269 m!239491))

(assert (=> b!212274 m!239489))

(assert (=> b!212274 m!239489))

(assert (=> b!212274 m!239491))

(assert (=> bm!20088 m!239593))

(declare-fun m!239609 () Bool)

(assert (=> b!212264 m!239609))

(assert (=> b!212263 m!239489))

(assert (=> b!212263 m!239489))

(declare-fun m!239611 () Bool)

(assert (=> b!212263 m!239611))

(assert (=> b!212058 d!57979))

(declare-fun call!20096 () ListLongMap!3073)

(declare-fun b!212281 () Bool)

(declare-fun e!138116 () Bool)

(declare-fun call!20097 () ListLongMap!3073)

(assert (=> b!212281 (= e!138116 (= call!20096 (+!576 call!20097 (tuple2!4171 k0!843 v!520))))))

(declare-fun d!57981 () Bool)

(declare-fun e!138115 () Bool)

(assert (=> d!57981 e!138115))

(declare-fun res!103763 () Bool)

(assert (=> d!57981 (=> (not res!103763) (not e!138115))))

(assert (=> d!57981 (= res!103763 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5126 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5126 _values!649))))))))

(declare-fun lt!109318 () Unit!6402)

(declare-fun choose!1087 (array!10117 array!10115 (_ BitVec 32) (_ BitVec 32) V!6929 V!6929 (_ BitVec 32) (_ BitVec 64) V!6929 (_ BitVec 32) Int) Unit!6402)

(assert (=> d!57981 (= lt!109318 (choose!1087 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(assert (=> d!57981 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109318)))

(declare-fun bm!20093 () Bool)

(assert (=> bm!20093 (= call!20097 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212282 () Bool)

(assert (=> b!212282 (= e!138115 e!138116)))

(declare-fun c!35795 () Bool)

(assert (=> b!212282 (= c!35795 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!212283 () Bool)

(assert (=> b!212283 (= e!138116 (= call!20096 call!20097))))

(declare-fun bm!20094 () Bool)

(assert (=> bm!20094 (= call!20096 (getCurrentListMapNoExtraKeys!501 _keys!825 (array!10116 (store (arr!4800 _values!649) i!601 (ValueCellFull!2387 v!520)) (size!5126 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57981 res!103763) b!212282))

(assert (= (and b!212282 c!35795) b!212281))

(assert (= (and b!212282 (not c!35795)) b!212283))

(assert (= (or b!212281 b!212283) bm!20094))

(assert (= (or b!212281 b!212283) bm!20093))

(declare-fun m!239613 () Bool)

(assert (=> b!212281 m!239613))

(declare-fun m!239615 () Bool)

(assert (=> d!57981 m!239615))

(assert (=> bm!20093 m!239393))

(assert (=> bm!20094 m!239387))

(declare-fun m!239617 () Bool)

(assert (=> bm!20094 m!239617))

(assert (=> b!212058 d!57981))

(declare-fun b!212284 () Bool)

(declare-fun res!103765 () Bool)

(declare-fun e!138129 () Bool)

(assert (=> b!212284 (=> (not res!103765) (not e!138129))))

(declare-fun e!138128 () Bool)

(assert (=> b!212284 (= res!103765 e!138128)))

(declare-fun res!103767 () Bool)

(assert (=> b!212284 (=> res!103767 e!138128)))

(declare-fun e!138127 () Bool)

(assert (=> b!212284 (= res!103767 (not e!138127))))

(declare-fun res!103771 () Bool)

(assert (=> b!212284 (=> (not res!103771) (not e!138127))))

(assert (=> b!212284 (= res!103771 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun d!57983 () Bool)

(assert (=> d!57983 e!138129))

(declare-fun res!103769 () Bool)

(assert (=> d!57983 (=> (not res!103769) (not e!138129))))

(assert (=> d!57983 (= res!103769 (or (bvsge #b00000000000000000000000000000000 (size!5127 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))))

(declare-fun lt!109324 () ListLongMap!3073)

(declare-fun lt!109332 () ListLongMap!3073)

(assert (=> d!57983 (= lt!109324 lt!109332)))

(declare-fun lt!109331 () Unit!6402)

(declare-fun e!138122 () Unit!6402)

(assert (=> d!57983 (= lt!109331 e!138122)))

(declare-fun c!35800 () Bool)

(declare-fun e!138124 () Bool)

(assert (=> d!57983 (= c!35800 e!138124)))

(declare-fun res!103770 () Bool)

(assert (=> d!57983 (=> (not res!103770) (not e!138124))))

(assert (=> d!57983 (= res!103770 (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun e!138119 () ListLongMap!3073)

(assert (=> d!57983 (= lt!109332 e!138119)))

(declare-fun c!35798 () Bool)

(assert (=> d!57983 (= c!35798 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57983 (validMask!0 mask!1149)))

(assert (=> d!57983 (= (getCurrentListMap!1064 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109324)))

(declare-fun b!212285 () Bool)

(declare-fun Unit!6405 () Unit!6402)

(assert (=> b!212285 (= e!138122 Unit!6405)))

(declare-fun b!212286 () Bool)

(declare-fun e!138126 () Bool)

(declare-fun call!20103 () Bool)

(assert (=> b!212286 (= e!138126 (not call!20103))))

(declare-fun b!212287 () Bool)

(declare-fun res!103764 () Bool)

(assert (=> b!212287 (=> (not res!103764) (not e!138129))))

(declare-fun e!138117 () Bool)

(assert (=> b!212287 (= res!103764 e!138117)))

(declare-fun c!35796 () Bool)

(assert (=> b!212287 (= c!35796 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20095 () Bool)

(declare-fun call!20099 () Bool)

(assert (=> bm!20095 (= call!20099 (contains!1388 lt!109324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212288 () Bool)

(declare-fun call!20104 () ListLongMap!3073)

(assert (=> b!212288 (= e!138119 (+!576 call!20104 (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!212289 () Bool)

(assert (=> b!212289 (= e!138124 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212290 () Bool)

(declare-fun e!138118 () ListLongMap!3073)

(declare-fun call!20102 () ListLongMap!3073)

(assert (=> b!212290 (= e!138118 call!20102)))

(declare-fun b!212291 () Bool)

(declare-fun e!138125 () ListLongMap!3073)

(assert (=> b!212291 (= e!138119 e!138125)))

(declare-fun c!35801 () Bool)

(assert (=> b!212291 (= c!35801 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20096 () Bool)

(assert (=> bm!20096 (= call!20103 (contains!1388 lt!109324 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212292 () Bool)

(declare-fun c!35797 () Bool)

(assert (=> b!212292 (= c!35797 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212292 (= e!138125 e!138118)))

(declare-fun bm!20097 () Bool)

(declare-fun call!20101 () ListLongMap!3073)

(declare-fun call!20100 () ListLongMap!3073)

(assert (=> bm!20097 (= call!20101 call!20100)))

(declare-fun b!212293 () Bool)

(declare-fun e!138120 () Bool)

(assert (=> b!212293 (= e!138120 (= (apply!196 lt!109324 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!212294 () Bool)

(assert (=> b!212294 (= e!138126 e!138120)))

(declare-fun res!103768 () Bool)

(assert (=> b!212294 (= res!103768 call!20103)))

(assert (=> b!212294 (=> (not res!103768) (not e!138120))))

(declare-fun b!212295 () Bool)

(declare-fun e!138121 () Bool)

(assert (=> b!212295 (= e!138121 (= (apply!196 lt!109324 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun call!20098 () ListLongMap!3073)

(declare-fun bm!20098 () Bool)

(assert (=> bm!20098 (= call!20098 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212296 () Bool)

(assert (=> b!212296 (= e!138127 (validKeyInArray!0 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20099 () Bool)

(assert (=> bm!20099 (= call!20102 call!20104)))

(declare-fun b!212297 () Bool)

(assert (=> b!212297 (= e!138129 e!138126)))

(declare-fun c!35799 () Bool)

(assert (=> b!212297 (= c!35799 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212298 () Bool)

(assert (=> b!212298 (= e!138117 e!138121)))

(declare-fun res!103766 () Bool)

(assert (=> b!212298 (= res!103766 call!20099)))

(assert (=> b!212298 (=> (not res!103766) (not e!138121))))

(declare-fun bm!20100 () Bool)

(assert (=> bm!20100 (= call!20100 call!20098)))

(declare-fun b!212299 () Bool)

(declare-fun e!138123 () Bool)

(assert (=> b!212299 (= e!138128 e!138123)))

(declare-fun res!103772 () Bool)

(assert (=> b!212299 (=> (not res!103772) (not e!138123))))

(assert (=> b!212299 (= res!103772 (contains!1388 lt!109324 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun b!212300 () Bool)

(assert (=> b!212300 (= e!138123 (= (apply!196 lt!109324 (select (arr!4801 _keys!825) #b00000000000000000000000000000000)) (get!2566 (select (arr!4800 _values!649) #b00000000000000000000000000000000) (dynLambda!530 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5126 _values!649)))))

(assert (=> b!212300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5127 _keys!825)))))

(declare-fun bm!20101 () Bool)

(assert (=> bm!20101 (= call!20104 (+!576 (ite c!35798 call!20098 (ite c!35801 call!20100 call!20101)) (ite (or c!35798 c!35801) (tuple2!4171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212301 () Bool)

(declare-fun lt!109336 () Unit!6402)

(assert (=> b!212301 (= e!138122 lt!109336)))

(declare-fun lt!109333 () ListLongMap!3073)

(assert (=> b!212301 (= lt!109333 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109322 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109335 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109335 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109319 () Unit!6402)

(assert (=> b!212301 (= lt!109319 (addStillContains!172 lt!109333 lt!109322 zeroValue!615 lt!109335))))

(assert (=> b!212301 (contains!1388 (+!576 lt!109333 (tuple2!4171 lt!109322 zeroValue!615)) lt!109335)))

(declare-fun lt!109325 () Unit!6402)

(assert (=> b!212301 (= lt!109325 lt!109319)))

(declare-fun lt!109340 () ListLongMap!3073)

(assert (=> b!212301 (= lt!109340 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109339 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109339 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109329 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109329 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109337 () Unit!6402)

(assert (=> b!212301 (= lt!109337 (addApplyDifferent!172 lt!109340 lt!109339 minValue!615 lt!109329))))

(assert (=> b!212301 (= (apply!196 (+!576 lt!109340 (tuple2!4171 lt!109339 minValue!615)) lt!109329) (apply!196 lt!109340 lt!109329))))

(declare-fun lt!109320 () Unit!6402)

(assert (=> b!212301 (= lt!109320 lt!109337)))

(declare-fun lt!109326 () ListLongMap!3073)

(assert (=> b!212301 (= lt!109326 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109328 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109330 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109330 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109321 () Unit!6402)

(assert (=> b!212301 (= lt!109321 (addApplyDifferent!172 lt!109326 lt!109328 zeroValue!615 lt!109330))))

(assert (=> b!212301 (= (apply!196 (+!576 lt!109326 (tuple2!4171 lt!109328 zeroValue!615)) lt!109330) (apply!196 lt!109326 lt!109330))))

(declare-fun lt!109323 () Unit!6402)

(assert (=> b!212301 (= lt!109323 lt!109321)))

(declare-fun lt!109338 () ListLongMap!3073)

(assert (=> b!212301 (= lt!109338 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109327 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109327 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109334 () (_ BitVec 64))

(assert (=> b!212301 (= lt!109334 (select (arr!4801 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212301 (= lt!109336 (addApplyDifferent!172 lt!109338 lt!109327 minValue!615 lt!109334))))

(assert (=> b!212301 (= (apply!196 (+!576 lt!109338 (tuple2!4171 lt!109327 minValue!615)) lt!109334) (apply!196 lt!109338 lt!109334))))

(declare-fun b!212302 () Bool)

(assert (=> b!212302 (= e!138118 call!20101)))

(declare-fun b!212303 () Bool)

(assert (=> b!212303 (= e!138125 call!20102)))

(declare-fun b!212304 () Bool)

(assert (=> b!212304 (= e!138117 (not call!20099))))

(assert (= (and d!57983 c!35798) b!212288))

(assert (= (and d!57983 (not c!35798)) b!212291))

(assert (= (and b!212291 c!35801) b!212303))

(assert (= (and b!212291 (not c!35801)) b!212292))

(assert (= (and b!212292 c!35797) b!212290))

(assert (= (and b!212292 (not c!35797)) b!212302))

(assert (= (or b!212290 b!212302) bm!20097))

(assert (= (or b!212303 bm!20097) bm!20100))

(assert (= (or b!212303 b!212290) bm!20099))

(assert (= (or b!212288 bm!20100) bm!20098))

(assert (= (or b!212288 bm!20099) bm!20101))

(assert (= (and d!57983 res!103770) b!212289))

(assert (= (and d!57983 c!35800) b!212301))

(assert (= (and d!57983 (not c!35800)) b!212285))

(assert (= (and d!57983 res!103769) b!212284))

(assert (= (and b!212284 res!103771) b!212296))

(assert (= (and b!212284 (not res!103767)) b!212299))

(assert (= (and b!212299 res!103772) b!212300))

(assert (= (and b!212284 res!103765) b!212287))

(assert (= (and b!212287 c!35796) b!212298))

(assert (= (and b!212287 (not c!35796)) b!212304))

(assert (= (and b!212298 res!103766) b!212295))

(assert (= (or b!212298 b!212304) bm!20095))

(assert (= (and b!212287 res!103764) b!212297))

(assert (= (and b!212297 c!35799) b!212294))

(assert (= (and b!212297 (not c!35799)) b!212286))

(assert (= (and b!212294 res!103768) b!212293))

(assert (= (or b!212294 b!212286) bm!20096))

(declare-fun b_lambda!7699 () Bool)

(assert (=> (not b_lambda!7699) (not b!212300)))

(assert (=> b!212300 t!8019))

(declare-fun b_and!12419 () Bool)

(assert (= b_and!12417 (and (=> t!8019 result!4995) b_and!12419)))

(declare-fun m!239619 () Bool)

(assert (=> b!212301 m!239619))

(assert (=> b!212301 m!239393))

(declare-fun m!239621 () Bool)

(assert (=> b!212301 m!239621))

(declare-fun m!239623 () Bool)

(assert (=> b!212301 m!239623))

(declare-fun m!239625 () Bool)

(assert (=> b!212301 m!239625))

(declare-fun m!239627 () Bool)

(assert (=> b!212301 m!239627))

(assert (=> b!212301 m!239621))

(declare-fun m!239629 () Bool)

(assert (=> b!212301 m!239629))

(assert (=> b!212301 m!239625))

(declare-fun m!239631 () Bool)

(assert (=> b!212301 m!239631))

(declare-fun m!239633 () Bool)

(assert (=> b!212301 m!239633))

(declare-fun m!239635 () Bool)

(assert (=> b!212301 m!239635))

(assert (=> b!212301 m!239631))

(declare-fun m!239637 () Bool)

(assert (=> b!212301 m!239637))

(declare-fun m!239639 () Bool)

(assert (=> b!212301 m!239639))

(declare-fun m!239641 () Bool)

(assert (=> b!212301 m!239641))

(assert (=> b!212301 m!239633))

(declare-fun m!239643 () Bool)

(assert (=> b!212301 m!239643))

(declare-fun m!239645 () Bool)

(assert (=> b!212301 m!239645))

(declare-fun m!239647 () Bool)

(assert (=> b!212301 m!239647))

(assert (=> b!212301 m!239489))

(declare-fun m!239649 () Bool)

(assert (=> b!212288 m!239649))

(assert (=> b!212299 m!239489))

(assert (=> b!212299 m!239489))

(declare-fun m!239651 () Bool)

(assert (=> b!212299 m!239651))

(declare-fun m!239653 () Bool)

(assert (=> bm!20101 m!239653))

(assert (=> b!212296 m!239489))

(assert (=> b!212296 m!239489))

(assert (=> b!212296 m!239491))

(declare-fun m!239655 () Bool)

(assert (=> bm!20096 m!239655))

(assert (=> bm!20098 m!239393))

(declare-fun m!239657 () Bool)

(assert (=> bm!20095 m!239657))

(declare-fun m!239659 () Bool)

(assert (=> b!212293 m!239659))

(declare-fun m!239661 () Bool)

(assert (=> b!212295 m!239661))

(assert (=> b!212289 m!239489))

(assert (=> b!212289 m!239489))

(assert (=> b!212289 m!239491))

(assert (=> b!212300 m!239521))

(assert (=> b!212300 m!239523))

(assert (=> b!212300 m!239525))

(assert (=> b!212300 m!239489))

(declare-fun m!239663 () Bool)

(assert (=> b!212300 m!239663))

(assert (=> b!212300 m!239523))

(assert (=> b!212300 m!239489))

(assert (=> b!212300 m!239521))

(assert (=> d!57983 m!239405))

(assert (=> b!212058 d!57983))

(declare-fun mapIsEmpty!9290 () Bool)

(declare-fun mapRes!9290 () Bool)

(assert (=> mapIsEmpty!9290 mapRes!9290))

(declare-fun condMapEmpty!9290 () Bool)

(declare-fun mapDefault!9290 () ValueCell!2387)

(assert (=> mapNonEmpty!9281 (= condMapEmpty!9290 (= mapRest!9281 ((as const (Array (_ BitVec 32) ValueCell!2387)) mapDefault!9290)))))

(declare-fun e!138134 () Bool)

(assert (=> mapNonEmpty!9281 (= tp!19859 (and e!138134 mapRes!9290))))

(declare-fun b!212312 () Bool)

(assert (=> b!212312 (= e!138134 tp_is_empty!5461)))

(declare-fun mapNonEmpty!9290 () Bool)

(declare-fun tp!19874 () Bool)

(declare-fun e!138135 () Bool)

(assert (=> mapNonEmpty!9290 (= mapRes!9290 (and tp!19874 e!138135))))

(declare-fun mapValue!9290 () ValueCell!2387)

(declare-fun mapRest!9290 () (Array (_ BitVec 32) ValueCell!2387))

(declare-fun mapKey!9290 () (_ BitVec 32))

(assert (=> mapNonEmpty!9290 (= mapRest!9281 (store mapRest!9290 mapKey!9290 mapValue!9290))))

(declare-fun b!212311 () Bool)

(assert (=> b!212311 (= e!138135 tp_is_empty!5461)))

(assert (= (and mapNonEmpty!9281 condMapEmpty!9290) mapIsEmpty!9290))

(assert (= (and mapNonEmpty!9281 (not condMapEmpty!9290)) mapNonEmpty!9290))

(assert (= (and mapNonEmpty!9290 ((_ is ValueCellFull!2387) mapValue!9290)) b!212311))

(assert (= (and mapNonEmpty!9281 ((_ is ValueCellFull!2387) mapDefault!9290)) b!212312))

(declare-fun m!239665 () Bool)

(assert (=> mapNonEmpty!9290 m!239665))

(declare-fun b_lambda!7701 () Bool)

(assert (= b_lambda!7695 (or (and start!21092 b_free!5599) b_lambda!7701)))

(declare-fun b_lambda!7703 () Bool)

(assert (= b_lambda!7691 (or (and start!21092 b_free!5599) b_lambda!7703)))

(declare-fun b_lambda!7705 () Bool)

(assert (= b_lambda!7689 (or (and start!21092 b_free!5599) b_lambda!7705)))

(declare-fun b_lambda!7707 () Bool)

(assert (= b_lambda!7693 (or (and start!21092 b_free!5599) b_lambda!7707)))

(declare-fun b_lambda!7709 () Bool)

(assert (= b_lambda!7699 (or (and start!21092 b_free!5599) b_lambda!7709)))

(declare-fun b_lambda!7711 () Bool)

(assert (= b_lambda!7697 (or (and start!21092 b_free!5599) b_lambda!7711)))

(check-sat tp_is_empty!5461 (not b!212161) (not d!57981) (not b!212281) (not b!212195) (not b!212259) (not b!212267) (not b_lambda!7707) (not bm!20094) (not b_lambda!7705) (not b!212258) (not b!212265) (not b!212301) (not b!212263) (not bm!20095) (not b!212187) (not b!212197) (not bm!20098) (not b!212155) (not b!212288) (not b!212251) (not bm!20081) (not b!212132) (not bm!20063) (not b!212296) (not b!212160) (not b_lambda!7711) (not bm!20087) (not bm!20066) (not b!212289) (not b!212131) (not b!212196) (not b!212246) (not b!212188) (not b!212272) (not bm!20093) (not b!212273) (not b!212142) (not d!57967) (not bm!20084) (not d!57977) (not b!212274) (not b_lambda!7701) (not b!212247) (not bm!20060) (not b!212299) (not bm!20096) (not b!212254) (not b!212192) (not b!212158) (not b_next!5599) (not bm!20082) (not bm!20101) (not bm!20088) (not b!212186) (not b!212257) (not b!212157) (not b!212300) (not mapNonEmpty!9290) (not d!57979) (not b_lambda!7709) (not b!212141) (not b!212253) (not d!57973) (not b_lambda!7703) (not b!212293) (not b!212269) (not d!57975) (not b!212190) (not b!212264) b_and!12419 (not b!212295) (not d!57983))
(check-sat b_and!12419 (not b_next!5599))
