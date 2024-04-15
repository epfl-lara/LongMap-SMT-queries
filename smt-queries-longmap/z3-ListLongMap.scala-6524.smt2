; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82972 () Bool)

(assert start!82972)

(declare-fun b!968321 () Bool)

(declare-fun e!545722 () Bool)

(declare-fun tp_is_empty!21919 () Bool)

(assert (=> b!968321 (= e!545722 tp_is_empty!21919)))

(declare-fun b!968322 () Bool)

(declare-fun e!545719 () Bool)

(declare-datatypes ((array!59836 0))(
  ( (array!59837 (arr!28786 (Array (_ BitVec 32) (_ BitVec 64))) (size!29267 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59836)

(assert (=> b!968322 (= e!545719 (bvsgt #b00000000000000000000000000000000 (size!29267 _keys!1717)))))

(declare-fun mapNonEmpty!34876 () Bool)

(declare-fun mapRes!34876 () Bool)

(declare-fun tp!66445 () Bool)

(assert (=> mapNonEmpty!34876 (= mapRes!34876 (and tp!66445 e!545722))))

(declare-fun mapKey!34876 () (_ BitVec 32))

(declare-datatypes ((V!34209 0))(
  ( (V!34210 (val!11010 Int)) )
))
(declare-datatypes ((ValueCell!10478 0))(
  ( (ValueCellFull!10478 (v!13567 V!34209)) (EmptyCell!10478) )
))
(declare-fun mapRest!34876 () (Array (_ BitVec 32) ValueCell!10478))

(declare-datatypes ((array!59838 0))(
  ( (array!59839 (arr!28787 (Array (_ BitVec 32) ValueCell!10478)) (size!29268 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59838)

(declare-fun mapValue!34876 () ValueCell!10478)

(assert (=> mapNonEmpty!34876 (= (arr!28787 _values!1425) (store mapRest!34876 mapKey!34876 mapValue!34876))))

(declare-fun b!968323 () Bool)

(declare-fun res!648281 () Bool)

(assert (=> b!968323 (=> (not res!648281) (not e!545719))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968323 (= res!648281 (and (= (size!29268 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29267 _keys!1717) (size!29268 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968324 () Bool)

(declare-fun e!545718 () Bool)

(assert (=> b!968324 (= e!545718 tp_is_empty!21919)))

(declare-fun b!968325 () Bool)

(declare-fun res!648280 () Bool)

(assert (=> b!968325 (=> (not res!648280) (not e!545719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59836 (_ BitVec 32)) Bool)

(assert (=> b!968325 (= res!648280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968326 () Bool)

(declare-fun e!545720 () Bool)

(assert (=> b!968326 (= e!545720 (and e!545718 mapRes!34876))))

(declare-fun condMapEmpty!34876 () Bool)

(declare-fun mapDefault!34876 () ValueCell!10478)

(assert (=> b!968326 (= condMapEmpty!34876 (= (arr!28787 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10478)) mapDefault!34876)))))

(declare-fun res!648279 () Bool)

(assert (=> start!82972 (=> (not res!648279) (not e!545719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82972 (= res!648279 (validMask!0 mask!2147))))

(assert (=> start!82972 e!545719))

(assert (=> start!82972 true))

(declare-fun array_inv!22349 (array!59838) Bool)

(assert (=> start!82972 (and (array_inv!22349 _values!1425) e!545720)))

(declare-fun array_inv!22350 (array!59836) Bool)

(assert (=> start!82972 (array_inv!22350 _keys!1717)))

(declare-fun mapIsEmpty!34876 () Bool)

(assert (=> mapIsEmpty!34876 mapRes!34876))

(assert (= (and start!82972 res!648279) b!968323))

(assert (= (and b!968323 res!648281) b!968325))

(assert (= (and b!968325 res!648280) b!968322))

(assert (= (and b!968326 condMapEmpty!34876) mapIsEmpty!34876))

(assert (= (and b!968326 (not condMapEmpty!34876)) mapNonEmpty!34876))

(get-info :version)

(assert (= (and mapNonEmpty!34876 ((_ is ValueCellFull!10478) mapValue!34876)) b!968321))

(assert (= (and b!968326 ((_ is ValueCellFull!10478) mapDefault!34876)) b!968324))

(assert (= start!82972 b!968326))

(declare-fun m!896115 () Bool)

(assert (=> mapNonEmpty!34876 m!896115))

(declare-fun m!896117 () Bool)

(assert (=> b!968325 m!896117))

(declare-fun m!896119 () Bool)

(assert (=> start!82972 m!896119))

(declare-fun m!896121 () Bool)

(assert (=> start!82972 m!896121))

(declare-fun m!896123 () Bool)

(assert (=> start!82972 m!896123))

(check-sat (not b!968325) (not start!82972) (not mapNonEmpty!34876) tp_is_empty!21919)
(check-sat)
(get-model)

(declare-fun b!968371 () Bool)

(declare-fun e!545760 () Bool)

(declare-fun e!545761 () Bool)

(assert (=> b!968371 (= e!545760 e!545761)))

(declare-fun c!99855 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968371 (= c!99855 (validKeyInArray!0 (select (arr!28786 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun d!116043 () Bool)

(declare-fun res!648305 () Bool)

(assert (=> d!116043 (=> res!648305 e!545760)))

(assert (=> d!116043 (= res!648305 (bvsge #b00000000000000000000000000000000 (size!29267 _keys!1717)))))

(assert (=> d!116043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!545760)))

(declare-fun bm!41703 () Bool)

(declare-fun call!41706 () Bool)

(assert (=> bm!41703 (= call!41706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!968372 () Bool)

(declare-fun e!545759 () Bool)

(assert (=> b!968372 (= e!545761 e!545759)))

(declare-fun lt!431294 () (_ BitVec 64))

(assert (=> b!968372 (= lt!431294 (select (arr!28786 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32230 0))(
  ( (Unit!32231) )
))
(declare-fun lt!431293 () Unit!32230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59836 (_ BitVec 64) (_ BitVec 32)) Unit!32230)

(assert (=> b!968372 (= lt!431293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431294 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968372 (arrayContainsKey!0 _keys!1717 lt!431294 #b00000000000000000000000000000000)))

(declare-fun lt!431292 () Unit!32230)

(assert (=> b!968372 (= lt!431292 lt!431293)))

(declare-fun res!648304 () Bool)

(declare-datatypes ((SeekEntryResult!9192 0))(
  ( (MissingZero!9192 (index!39139 (_ BitVec 32))) (Found!9192 (index!39140 (_ BitVec 32))) (Intermediate!9192 (undefined!10004 Bool) (index!39141 (_ BitVec 32)) (x!83607 (_ BitVec 32))) (Undefined!9192) (MissingVacant!9192 (index!39142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59836 (_ BitVec 32)) SeekEntryResult!9192)

(assert (=> b!968372 (= res!648304 (= (seekEntryOrOpen!0 (select (arr!28786 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9192 #b00000000000000000000000000000000)))))

(assert (=> b!968372 (=> (not res!648304) (not e!545759))))

(declare-fun b!968373 () Bool)

(assert (=> b!968373 (= e!545759 call!41706)))

(declare-fun b!968374 () Bool)

(assert (=> b!968374 (= e!545761 call!41706)))

(assert (= (and d!116043 (not res!648305)) b!968371))

(assert (= (and b!968371 c!99855) b!968372))

(assert (= (and b!968371 (not c!99855)) b!968374))

(assert (= (and b!968372 res!648304) b!968373))

(assert (= (or b!968373 b!968374) bm!41703))

(declare-fun m!896145 () Bool)

(assert (=> b!968371 m!896145))

(assert (=> b!968371 m!896145))

(declare-fun m!896147 () Bool)

(assert (=> b!968371 m!896147))

(declare-fun m!896149 () Bool)

(assert (=> bm!41703 m!896149))

(assert (=> b!968372 m!896145))

(declare-fun m!896151 () Bool)

(assert (=> b!968372 m!896151))

(declare-fun m!896153 () Bool)

(assert (=> b!968372 m!896153))

(assert (=> b!968372 m!896145))

(declare-fun m!896155 () Bool)

(assert (=> b!968372 m!896155))

(assert (=> b!968325 d!116043))

(declare-fun d!116045 () Bool)

(assert (=> d!116045 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!82972 d!116045))

(declare-fun d!116047 () Bool)

(assert (=> d!116047 (= (array_inv!22349 _values!1425) (bvsge (size!29268 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!82972 d!116047))

(declare-fun d!116049 () Bool)

(assert (=> d!116049 (= (array_inv!22350 _keys!1717) (bvsge (size!29267 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!82972 d!116049))

(declare-fun mapIsEmpty!34885 () Bool)

(declare-fun mapRes!34885 () Bool)

(assert (=> mapIsEmpty!34885 mapRes!34885))

(declare-fun condMapEmpty!34885 () Bool)

(declare-fun mapDefault!34885 () ValueCell!10478)

(assert (=> mapNonEmpty!34876 (= condMapEmpty!34885 (= mapRest!34876 ((as const (Array (_ BitVec 32) ValueCell!10478)) mapDefault!34885)))))

(declare-fun e!545766 () Bool)

(assert (=> mapNonEmpty!34876 (= tp!66445 (and e!545766 mapRes!34885))))

(declare-fun b!968381 () Bool)

(declare-fun e!545767 () Bool)

(assert (=> b!968381 (= e!545767 tp_is_empty!21919)))

(declare-fun b!968382 () Bool)

(assert (=> b!968382 (= e!545766 tp_is_empty!21919)))

(declare-fun mapNonEmpty!34885 () Bool)

(declare-fun tp!66454 () Bool)

(assert (=> mapNonEmpty!34885 (= mapRes!34885 (and tp!66454 e!545767))))

(declare-fun mapRest!34885 () (Array (_ BitVec 32) ValueCell!10478))

(declare-fun mapValue!34885 () ValueCell!10478)

(declare-fun mapKey!34885 () (_ BitVec 32))

(assert (=> mapNonEmpty!34885 (= mapRest!34876 (store mapRest!34885 mapKey!34885 mapValue!34885))))

(assert (= (and mapNonEmpty!34876 condMapEmpty!34885) mapIsEmpty!34885))

(assert (= (and mapNonEmpty!34876 (not condMapEmpty!34885)) mapNonEmpty!34885))

(assert (= (and mapNonEmpty!34885 ((_ is ValueCellFull!10478) mapValue!34885)) b!968381))

(assert (= (and mapNonEmpty!34876 ((_ is ValueCellFull!10478) mapDefault!34885)) b!968382))

(declare-fun m!896157 () Bool)

(assert (=> mapNonEmpty!34885 m!896157))

(check-sat (not bm!41703) (not b!968371) (not b!968372) (not mapNonEmpty!34885) tp_is_empty!21919)
(check-sat)
