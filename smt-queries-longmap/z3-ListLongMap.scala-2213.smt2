; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36692 () Bool)

(assert start!36692)

(declare-fun b!366119 () Bool)

(declare-fun res!204810 () Bool)

(declare-fun e!224153 () Bool)

(assert (=> b!366119 (=> (not res!204810) (not e!224153))))

(declare-datatypes ((array!20971 0))(
  ( (array!20972 (arr!9956 (Array (_ BitVec 32) (_ BitVec 64))) (size!10309 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20971)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20971 (_ BitVec 32)) Bool)

(assert (=> b!366119 (= res!204810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366120 () Bool)

(declare-fun res!204814 () Bool)

(assert (=> b!366120 (=> (not res!204814) (not e!224153))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366120 (= res!204814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)) mask!970))))

(declare-fun b!366121 () Bool)

(declare-datatypes ((List!5512 0))(
  ( (Nil!5509) (Cons!5508 (h!6364 (_ BitVec 64)) (t!10653 List!5512)) )
))
(declare-fun noDuplicate!189 (List!5512) Bool)

(assert (=> b!366121 (= e!224153 (not (noDuplicate!189 Nil!5509)))))

(declare-fun b!366122 () Bool)

(declare-fun res!204816 () Bool)

(assert (=> b!366122 (=> (not res!204816) (not e!224153))))

(assert (=> b!366122 (= res!204816 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10309 _keys!658))))))

(declare-fun b!366123 () Bool)

(declare-fun e!224155 () Bool)

(declare-fun tp_is_empty!8515 () Bool)

(assert (=> b!366123 (= e!224155 tp_is_empty!8515)))

(declare-fun mapNonEmpty!14331 () Bool)

(declare-fun mapRes!14331 () Bool)

(declare-fun tp!28407 () Bool)

(declare-fun e!224157 () Bool)

(assert (=> mapNonEmpty!14331 (= mapRes!14331 (and tp!28407 e!224157))))

(declare-fun mapKey!14331 () (_ BitVec 32))

(declare-datatypes ((V!12459 0))(
  ( (V!12460 (val!4302 Int)) )
))
(declare-datatypes ((ValueCell!3914 0))(
  ( (ValueCellFull!3914 (v!6492 V!12459)) (EmptyCell!3914) )
))
(declare-datatypes ((array!20973 0))(
  ( (array!20974 (arr!9957 (Array (_ BitVec 32) ValueCell!3914)) (size!10310 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20973)

(declare-fun mapRest!14331 () (Array (_ BitVec 32) ValueCell!3914))

(declare-fun mapValue!14331 () ValueCell!3914)

(assert (=> mapNonEmpty!14331 (= (arr!9957 _values!506) (store mapRest!14331 mapKey!14331 mapValue!14331))))

(declare-fun b!366124 () Bool)

(assert (=> b!366124 (= e!224157 tp_is_empty!8515)))

(declare-fun b!366125 () Bool)

(declare-fun res!204809 () Bool)

(assert (=> b!366125 (=> (not res!204809) (not e!224153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366125 (= res!204809 (validKeyInArray!0 k0!778))))

(declare-fun res!204812 () Bool)

(assert (=> start!36692 (=> (not res!204812) (not e!224153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36692 (= res!204812 (validMask!0 mask!970))))

(assert (=> start!36692 e!224153))

(assert (=> start!36692 true))

(declare-fun e!224156 () Bool)

(declare-fun array_inv!7382 (array!20973) Bool)

(assert (=> start!36692 (and (array_inv!7382 _values!506) e!224156)))

(declare-fun array_inv!7383 (array!20971) Bool)

(assert (=> start!36692 (array_inv!7383 _keys!658)))

(declare-fun b!366126 () Bool)

(assert (=> b!366126 (= e!224156 (and e!224155 mapRes!14331))))

(declare-fun condMapEmpty!14331 () Bool)

(declare-fun mapDefault!14331 () ValueCell!3914)

(assert (=> b!366126 (= condMapEmpty!14331 (= (arr!9957 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3914)) mapDefault!14331)))))

(declare-fun b!366127 () Bool)

(declare-fun res!204815 () Bool)

(assert (=> b!366127 (=> (not res!204815) (not e!224153))))

(assert (=> b!366127 (= res!204815 (or (= (select (arr!9956 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9956 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14331 () Bool)

(assert (=> mapIsEmpty!14331 mapRes!14331))

(declare-fun b!366128 () Bool)

(declare-fun res!204818 () Bool)

(assert (=> b!366128 (=> (not res!204818) (not e!224153))))

(declare-fun arrayContainsKey!0 (array!20971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366128 (= res!204818 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366129 () Bool)

(declare-fun res!204817 () Bool)

(assert (=> b!366129 (=> (not res!204817) (not e!224153))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366129 (= res!204817 (and (= (size!10310 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10309 _keys!658) (size!10310 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366130 () Bool)

(declare-fun res!204811 () Bool)

(assert (=> b!366130 (=> (not res!204811) (not e!224153))))

(assert (=> b!366130 (= res!204811 (and (bvsle #b00000000000000000000000000000000 (size!10309 _keys!658)) (bvslt (size!10309 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!366131 () Bool)

(declare-fun res!204813 () Bool)

(assert (=> b!366131 (=> (not res!204813) (not e!224153))))

(declare-fun arrayNoDuplicates!0 (array!20971 (_ BitVec 32) List!5512) Bool)

(assert (=> b!366131 (= res!204813 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5509))))

(assert (= (and start!36692 res!204812) b!366129))

(assert (= (and b!366129 res!204817) b!366119))

(assert (= (and b!366119 res!204810) b!366131))

(assert (= (and b!366131 res!204813) b!366122))

(assert (= (and b!366122 res!204816) b!366125))

(assert (= (and b!366125 res!204809) b!366127))

(assert (= (and b!366127 res!204815) b!366128))

(assert (= (and b!366128 res!204818) b!366120))

(assert (= (and b!366120 res!204814) b!366130))

(assert (= (and b!366130 res!204811) b!366121))

(assert (= (and b!366126 condMapEmpty!14331) mapIsEmpty!14331))

(assert (= (and b!366126 (not condMapEmpty!14331)) mapNonEmpty!14331))

(get-info :version)

(assert (= (and mapNonEmpty!14331 ((_ is ValueCellFull!3914) mapValue!14331)) b!366124))

(assert (= (and b!366126 ((_ is ValueCellFull!3914) mapDefault!14331)) b!366123))

(assert (= start!36692 b!366126))

(declare-fun m!363001 () Bool)

(assert (=> b!366120 m!363001))

(declare-fun m!363003 () Bool)

(assert (=> b!366120 m!363003))

(declare-fun m!363005 () Bool)

(assert (=> start!36692 m!363005))

(declare-fun m!363007 () Bool)

(assert (=> start!36692 m!363007))

(declare-fun m!363009 () Bool)

(assert (=> start!36692 m!363009))

(declare-fun m!363011 () Bool)

(assert (=> b!366127 m!363011))

(declare-fun m!363013 () Bool)

(assert (=> b!366128 m!363013))

(declare-fun m!363015 () Bool)

(assert (=> b!366131 m!363015))

(declare-fun m!363017 () Bool)

(assert (=> mapNonEmpty!14331 m!363017))

(declare-fun m!363019 () Bool)

(assert (=> b!366125 m!363019))

(declare-fun m!363021 () Bool)

(assert (=> b!366119 m!363021))

(declare-fun m!363023 () Bool)

(assert (=> b!366121 m!363023))

(check-sat (not start!36692) (not b!366125) (not b!366131) (not b!366119) (not b!366120) (not mapNonEmpty!14331) tp_is_empty!8515 (not b!366128) (not b!366121))
(check-sat)
(get-model)

(declare-fun bm!27269 () Bool)

(declare-fun call!27272 () Bool)

(declare-fun c!53842 () Bool)

(assert (=> bm!27269 (= call!27272 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53842 (Cons!5508 (select (arr!9956 _keys!658) #b00000000000000000000000000000000) Nil!5509) Nil!5509)))))

(declare-fun b!366221 () Bool)

(declare-fun e!224198 () Bool)

(declare-fun e!224196 () Bool)

(assert (=> b!366221 (= e!224198 e!224196)))

(assert (=> b!366221 (= c!53842 (validKeyInArray!0 (select (arr!9956 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366222 () Bool)

(assert (=> b!366222 (= e!224196 call!27272)))

(declare-fun b!366223 () Bool)

(assert (=> b!366223 (= e!224196 call!27272)))

(declare-fun b!366224 () Bool)

(declare-fun e!224197 () Bool)

(declare-fun contains!2426 (List!5512 (_ BitVec 64)) Bool)

(assert (=> b!366224 (= e!224197 (contains!2426 Nil!5509 (select (arr!9956 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72201 () Bool)

(declare-fun res!204885 () Bool)

(declare-fun e!224199 () Bool)

(assert (=> d!72201 (=> res!204885 e!224199)))

(assert (=> d!72201 (= res!204885 (bvsge #b00000000000000000000000000000000 (size!10309 _keys!658)))))

(assert (=> d!72201 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5509) e!224199)))

(declare-fun b!366220 () Bool)

(assert (=> b!366220 (= e!224199 e!224198)))

(declare-fun res!204886 () Bool)

(assert (=> b!366220 (=> (not res!204886) (not e!224198))))

(assert (=> b!366220 (= res!204886 (not e!224197))))

(declare-fun res!204887 () Bool)

(assert (=> b!366220 (=> (not res!204887) (not e!224197))))

(assert (=> b!366220 (= res!204887 (validKeyInArray!0 (select (arr!9956 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72201 (not res!204885)) b!366220))

(assert (= (and b!366220 res!204887) b!366224))

(assert (= (and b!366220 res!204886) b!366221))

(assert (= (and b!366221 c!53842) b!366222))

(assert (= (and b!366221 (not c!53842)) b!366223))

(assert (= (or b!366222 b!366223) bm!27269))

(declare-fun m!363073 () Bool)

(assert (=> bm!27269 m!363073))

(declare-fun m!363075 () Bool)

(assert (=> bm!27269 m!363075))

(assert (=> b!366221 m!363073))

(assert (=> b!366221 m!363073))

(declare-fun m!363077 () Bool)

(assert (=> b!366221 m!363077))

(assert (=> b!366224 m!363073))

(assert (=> b!366224 m!363073))

(declare-fun m!363079 () Bool)

(assert (=> b!366224 m!363079))

(assert (=> b!366220 m!363073))

(assert (=> b!366220 m!363073))

(assert (=> b!366220 m!363077))

(assert (=> b!366131 d!72201))

(declare-fun b!366233 () Bool)

(declare-fun e!224206 () Bool)

(declare-fun e!224208 () Bool)

(assert (=> b!366233 (= e!224206 e!224208)))

(declare-fun lt!169009 () (_ BitVec 64))

(assert (=> b!366233 (= lt!169009 (select (arr!9956 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11372 0))(
  ( (Unit!11373) )
))
(declare-fun lt!169008 () Unit!11372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20971 (_ BitVec 64) (_ BitVec 32)) Unit!11372)

(assert (=> b!366233 (= lt!169008 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169009 #b00000000000000000000000000000000))))

(assert (=> b!366233 (arrayContainsKey!0 _keys!658 lt!169009 #b00000000000000000000000000000000)))

(declare-fun lt!169010 () Unit!11372)

(assert (=> b!366233 (= lt!169010 lt!169008)))

(declare-fun res!204892 () Bool)

(declare-datatypes ((SeekEntryResult!3501 0))(
  ( (MissingZero!3501 (index!16183 (_ BitVec 32))) (Found!3501 (index!16184 (_ BitVec 32))) (Intermediate!3501 (undefined!4313 Bool) (index!16185 (_ BitVec 32)) (x!36740 (_ BitVec 32))) (Undefined!3501) (MissingVacant!3501 (index!16186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20971 (_ BitVec 32)) SeekEntryResult!3501)

(assert (=> b!366233 (= res!204892 (= (seekEntryOrOpen!0 (select (arr!9956 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3501 #b00000000000000000000000000000000)))))

(assert (=> b!366233 (=> (not res!204892) (not e!224208))))

(declare-fun bm!27272 () Bool)

(declare-fun call!27275 () Bool)

(assert (=> bm!27272 (= call!27275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72203 () Bool)

(declare-fun res!204893 () Bool)

(declare-fun e!224207 () Bool)

(assert (=> d!72203 (=> res!204893 e!224207)))

(assert (=> d!72203 (= res!204893 (bvsge #b00000000000000000000000000000000 (size!10309 _keys!658)))))

(assert (=> d!72203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224207)))

(declare-fun b!366234 () Bool)

(assert (=> b!366234 (= e!224208 call!27275)))

(declare-fun b!366235 () Bool)

(assert (=> b!366235 (= e!224206 call!27275)))

(declare-fun b!366236 () Bool)

(assert (=> b!366236 (= e!224207 e!224206)))

(declare-fun c!53845 () Bool)

(assert (=> b!366236 (= c!53845 (validKeyInArray!0 (select (arr!9956 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72203 (not res!204893)) b!366236))

(assert (= (and b!366236 c!53845) b!366233))

(assert (= (and b!366236 (not c!53845)) b!366235))

(assert (= (and b!366233 res!204892) b!366234))

(assert (= (or b!366234 b!366235) bm!27272))

(assert (=> b!366233 m!363073))

(declare-fun m!363081 () Bool)

(assert (=> b!366233 m!363081))

(declare-fun m!363083 () Bool)

(assert (=> b!366233 m!363083))

(assert (=> b!366233 m!363073))

(declare-fun m!363085 () Bool)

(assert (=> b!366233 m!363085))

(declare-fun m!363087 () Bool)

(assert (=> bm!27272 m!363087))

(assert (=> b!366236 m!363073))

(assert (=> b!366236 m!363073))

(assert (=> b!366236 m!363077))

(assert (=> b!366119 d!72203))

(declare-fun b!366237 () Bool)

(declare-fun e!224209 () Bool)

(declare-fun e!224211 () Bool)

(assert (=> b!366237 (= e!224209 e!224211)))

(declare-fun lt!169012 () (_ BitVec 64))

(assert (=> b!366237 (= lt!169012 (select (arr!9956 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658))) #b00000000000000000000000000000000))))

(declare-fun lt!169011 () Unit!11372)

(assert (=> b!366237 (= lt!169011 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)) lt!169012 #b00000000000000000000000000000000))))

(assert (=> b!366237 (arrayContainsKey!0 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)) lt!169012 #b00000000000000000000000000000000)))

(declare-fun lt!169013 () Unit!11372)

(assert (=> b!366237 (= lt!169013 lt!169011)))

(declare-fun res!204894 () Bool)

(assert (=> b!366237 (= res!204894 (= (seekEntryOrOpen!0 (select (arr!9956 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658))) #b00000000000000000000000000000000) (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)) mask!970) (Found!3501 #b00000000000000000000000000000000)))))

(assert (=> b!366237 (=> (not res!204894) (not e!224211))))

(declare-fun call!27276 () Bool)

(declare-fun bm!27273 () Bool)

(assert (=> bm!27273 (= call!27276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)) mask!970))))

(declare-fun d!72205 () Bool)

(declare-fun res!204895 () Bool)

(declare-fun e!224210 () Bool)

(assert (=> d!72205 (=> res!204895 e!224210)))

(assert (=> d!72205 (= res!204895 (bvsge #b00000000000000000000000000000000 (size!10309 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)))))))

(assert (=> d!72205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658)) mask!970) e!224210)))

(declare-fun b!366238 () Bool)

(assert (=> b!366238 (= e!224211 call!27276)))

(declare-fun b!366239 () Bool)

(assert (=> b!366239 (= e!224209 call!27276)))

(declare-fun b!366240 () Bool)

(assert (=> b!366240 (= e!224210 e!224209)))

(declare-fun c!53846 () Bool)

(assert (=> b!366240 (= c!53846 (validKeyInArray!0 (select (arr!9956 (array!20972 (store (arr!9956 _keys!658) i!548 k0!778) (size!10309 _keys!658))) #b00000000000000000000000000000000)))))

(assert (= (and d!72205 (not res!204895)) b!366240))

(assert (= (and b!366240 c!53846) b!366237))

(assert (= (and b!366240 (not c!53846)) b!366239))

(assert (= (and b!366237 res!204894) b!366238))

(assert (= (or b!366238 b!366239) bm!27273))

(declare-fun m!363089 () Bool)

(assert (=> b!366237 m!363089))

(declare-fun m!363091 () Bool)

(assert (=> b!366237 m!363091))

(declare-fun m!363093 () Bool)

(assert (=> b!366237 m!363093))

(assert (=> b!366237 m!363089))

(declare-fun m!363095 () Bool)

(assert (=> b!366237 m!363095))

(declare-fun m!363097 () Bool)

(assert (=> bm!27273 m!363097))

(assert (=> b!366240 m!363089))

(assert (=> b!366240 m!363089))

(declare-fun m!363099 () Bool)

(assert (=> b!366240 m!363099))

(assert (=> b!366120 d!72205))

(declare-fun d!72207 () Bool)

(declare-fun res!204900 () Bool)

(declare-fun e!224216 () Bool)

(assert (=> d!72207 (=> res!204900 e!224216)))

(assert (=> d!72207 (= res!204900 (= (select (arr!9956 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72207 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224216)))

(declare-fun b!366245 () Bool)

(declare-fun e!224217 () Bool)

(assert (=> b!366245 (= e!224216 e!224217)))

(declare-fun res!204901 () Bool)

(assert (=> b!366245 (=> (not res!204901) (not e!224217))))

(assert (=> b!366245 (= res!204901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10309 _keys!658)))))

(declare-fun b!366246 () Bool)

(assert (=> b!366246 (= e!224217 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72207 (not res!204900)) b!366245))

(assert (= (and b!366245 res!204901) b!366246))

(assert (=> d!72207 m!363073))

(declare-fun m!363101 () Bool)

(assert (=> b!366246 m!363101))

(assert (=> b!366128 d!72207))

(declare-fun d!72209 () Bool)

(assert (=> d!72209 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36692 d!72209))

(declare-fun d!72211 () Bool)

(assert (=> d!72211 (= (array_inv!7382 _values!506) (bvsge (size!10310 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36692 d!72211))

(declare-fun d!72213 () Bool)

(assert (=> d!72213 (= (array_inv!7383 _keys!658) (bvsge (size!10309 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36692 d!72213))

(declare-fun d!72215 () Bool)

(assert (=> d!72215 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366125 d!72215))

(declare-fun d!72217 () Bool)

(declare-fun res!204906 () Bool)

(declare-fun e!224222 () Bool)

(assert (=> d!72217 (=> res!204906 e!224222)))

(assert (=> d!72217 (= res!204906 ((_ is Nil!5509) Nil!5509))))

(assert (=> d!72217 (= (noDuplicate!189 Nil!5509) e!224222)))

(declare-fun b!366251 () Bool)

(declare-fun e!224223 () Bool)

(assert (=> b!366251 (= e!224222 e!224223)))

(declare-fun res!204907 () Bool)

(assert (=> b!366251 (=> (not res!204907) (not e!224223))))

(assert (=> b!366251 (= res!204907 (not (contains!2426 (t!10653 Nil!5509) (h!6364 Nil!5509))))))

(declare-fun b!366252 () Bool)

(assert (=> b!366252 (= e!224223 (noDuplicate!189 (t!10653 Nil!5509)))))

(assert (= (and d!72217 (not res!204906)) b!366251))

(assert (= (and b!366251 res!204907) b!366252))

(declare-fun m!363103 () Bool)

(assert (=> b!366251 m!363103))

(declare-fun m!363105 () Bool)

(assert (=> b!366252 m!363105))

(assert (=> b!366121 d!72217))

(declare-fun condMapEmpty!14340 () Bool)

(declare-fun mapDefault!14340 () ValueCell!3914)

(assert (=> mapNonEmpty!14331 (= condMapEmpty!14340 (= mapRest!14331 ((as const (Array (_ BitVec 32) ValueCell!3914)) mapDefault!14340)))))

(declare-fun e!224228 () Bool)

(declare-fun mapRes!14340 () Bool)

(assert (=> mapNonEmpty!14331 (= tp!28407 (and e!224228 mapRes!14340))))

(declare-fun b!366259 () Bool)

(declare-fun e!224229 () Bool)

(assert (=> b!366259 (= e!224229 tp_is_empty!8515)))

(declare-fun mapIsEmpty!14340 () Bool)

(assert (=> mapIsEmpty!14340 mapRes!14340))

(declare-fun mapNonEmpty!14340 () Bool)

(declare-fun tp!28416 () Bool)

(assert (=> mapNonEmpty!14340 (= mapRes!14340 (and tp!28416 e!224229))))

(declare-fun mapRest!14340 () (Array (_ BitVec 32) ValueCell!3914))

(declare-fun mapValue!14340 () ValueCell!3914)

(declare-fun mapKey!14340 () (_ BitVec 32))

(assert (=> mapNonEmpty!14340 (= mapRest!14331 (store mapRest!14340 mapKey!14340 mapValue!14340))))

(declare-fun b!366260 () Bool)

(assert (=> b!366260 (= e!224228 tp_is_empty!8515)))

(assert (= (and mapNonEmpty!14331 condMapEmpty!14340) mapIsEmpty!14340))

(assert (= (and mapNonEmpty!14331 (not condMapEmpty!14340)) mapNonEmpty!14340))

(assert (= (and mapNonEmpty!14340 ((_ is ValueCellFull!3914) mapValue!14340)) b!366259))

(assert (= (and mapNonEmpty!14331 ((_ is ValueCellFull!3914) mapDefault!14340)) b!366260))

(declare-fun m!363107 () Bool)

(assert (=> mapNonEmpty!14340 m!363107))

(check-sat (not bm!27273) (not b!366237) (not b!366224) (not bm!27272) (not b!366252) (not bm!27269) (not b!366246) (not b!366236) (not mapNonEmpty!14340) (not b!366221) (not b!366220) (not b!366233) (not b!366240) (not b!366251) tp_is_empty!8515)
(check-sat)
