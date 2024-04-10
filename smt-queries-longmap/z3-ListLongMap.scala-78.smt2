; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1046 () Bool)

(assert start!1046)

(declare-fun b_free!375 () Bool)

(declare-fun b_next!375 () Bool)

(assert (=> start!1046 (= b_free!375 (not b_next!375))))

(declare-fun tp!1363 () Bool)

(declare-fun b_and!527 () Bool)

(assert (=> start!1046 (= tp!1363 b_and!527)))

(declare-fun b!9272 () Bool)

(declare-fun e!5300 () Bool)

(declare-fun e!5294 () Bool)

(assert (=> b!9272 (= e!5300 (not e!5294))))

(declare-fun res!8430 () Bool)

(assert (=> b!9272 (=> res!8430 e!5294)))

(declare-datatypes ((array!835 0))(
  ( (array!836 (arr!403 (Array (_ BitVec 32) (_ BitVec 64))) (size!465 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!835)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9272 (= res!8430 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!5293 () Bool)

(assert (=> b!9272 e!5293))

(declare-fun c!710 () Bool)

(assert (=> b!9272 (= c!710 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!189 0))(
  ( (Unit!190) )
))
(declare-fun lt!2014 () Unit!189)

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!781 0))(
  ( (V!782 (val!232 Int)) )
))
(declare-datatypes ((ValueCell!210 0))(
  ( (ValueCellFull!210 (v!1326 V!781)) (EmptyCell!210) )
))
(declare-datatypes ((array!837 0))(
  ( (array!838 (arr!404 (Array (_ BitVec 32) ValueCell!210)) (size!466 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!837)

(declare-fun minValue!1434 () V!781)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!781)

(declare-fun lemmaKeyInListMapIsInArray!71 (array!835 array!837 (_ BitVec 32) (_ BitVec 32) V!781 V!781 (_ BitVec 64) Int) Unit!189)

(assert (=> b!9272 (= lt!2014 (lemmaKeyInListMapIsInArray!71 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9273 () Bool)

(declare-fun e!5295 () Bool)

(declare-fun e!5297 () Bool)

(declare-fun mapRes!659 () Bool)

(assert (=> b!9273 (= e!5295 (and e!5297 mapRes!659))))

(declare-fun condMapEmpty!659 () Bool)

(declare-fun mapDefault!659 () ValueCell!210)

(assert (=> b!9273 (= condMapEmpty!659 (= (arr!404 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!210)) mapDefault!659)))))

(declare-fun b!9274 () Bool)

(declare-fun e!5298 () Bool)

(assert (=> b!9274 (= e!5294 e!5298)))

(declare-fun res!8424 () Bool)

(assert (=> b!9274 (=> res!8424 e!5298)))

(assert (=> b!9274 (= res!8424 (not (= (size!465 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!2015 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!835 (_ BitVec 32)) Bool)

(assert (=> b!9274 (arrayForallSeekEntryOrOpenFound!0 lt!2015 _keys!1806 mask!2250)))

(declare-fun lt!2016 () Unit!189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!189)

(assert (=> b!9274 (= lt!2016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2015))))

(declare-fun arrayScanForKey!0 (array!835 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9274 (= lt!2015 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9275 () Bool)

(declare-fun res!8427 () Bool)

(assert (=> b!9275 (=> (not res!8427) (not e!5300))))

(assert (=> b!9275 (= res!8427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9276 () Bool)

(declare-fun res!8426 () Bool)

(assert (=> b!9276 (=> (not res!8426) (not e!5300))))

(declare-datatypes ((tuple2!270 0))(
  ( (tuple2!271 (_1!135 (_ BitVec 64)) (_2!135 V!781)) )
))
(declare-datatypes ((List!281 0))(
  ( (Nil!278) (Cons!277 (h!843 tuple2!270) (t!2422 List!281)) )
))
(declare-datatypes ((ListLongMap!275 0))(
  ( (ListLongMap!276 (toList!153 List!281)) )
))
(declare-fun contains!130 (ListLongMap!275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!112 (array!835 array!837 (_ BitVec 32) (_ BitVec 32) V!781 V!781 (_ BitVec 32) Int) ListLongMap!275)

(assert (=> b!9276 (= res!8426 (contains!130 (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9277 () Bool)

(declare-datatypes ((SeekEntryResult!34 0))(
  ( (MissingZero!34 (index!2255 (_ BitVec 32))) (Found!34 (index!2256 (_ BitVec 32))) (Intermediate!34 (undefined!846 Bool) (index!2257 (_ BitVec 32)) (x!2778 (_ BitVec 32))) (Undefined!34) (MissingVacant!34 (index!2258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!835 (_ BitVec 32)) SeekEntryResult!34)

(assert (=> b!9277 (= e!5298 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!34 lt!2015)))))

(declare-fun mapNonEmpty!659 () Bool)

(declare-fun tp!1364 () Bool)

(declare-fun e!5299 () Bool)

(assert (=> mapNonEmpty!659 (= mapRes!659 (and tp!1364 e!5299))))

(declare-fun mapRest!659 () (Array (_ BitVec 32) ValueCell!210))

(declare-fun mapKey!659 () (_ BitVec 32))

(declare-fun mapValue!659 () ValueCell!210)

(assert (=> mapNonEmpty!659 (= (arr!404 _values!1492) (store mapRest!659 mapKey!659 mapValue!659))))

(declare-fun b!9278 () Bool)

(assert (=> b!9278 (= e!5293 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!659 () Bool)

(assert (=> mapIsEmpty!659 mapRes!659))

(declare-fun b!9279 () Bool)

(declare-fun res!8429 () Bool)

(assert (=> b!9279 (=> (not res!8429) (not e!5300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9279 (= res!8429 (validKeyInArray!0 k0!1278))))

(declare-fun b!9280 () Bool)

(declare-fun tp_is_empty!453 () Bool)

(assert (=> b!9280 (= e!5297 tp_is_empty!453)))

(declare-fun b!9281 () Bool)

(assert (=> b!9281 (= e!5299 tp_is_empty!453)))

(declare-fun b!9282 () Bool)

(declare-fun res!8428 () Bool)

(assert (=> b!9282 (=> (not res!8428) (not e!5300))))

(assert (=> b!9282 (= res!8428 (and (= (size!466 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!465 _keys!1806) (size!466 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9283 () Bool)

(declare-fun res!8431 () Bool)

(assert (=> b!9283 (=> (not res!8431) (not e!5300))))

(declare-datatypes ((List!282 0))(
  ( (Nil!279) (Cons!278 (h!844 (_ BitVec 64)) (t!2423 List!282)) )
))
(declare-fun arrayNoDuplicates!0 (array!835 (_ BitVec 32) List!282) Bool)

(assert (=> b!9283 (= res!8431 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!279))))

(declare-fun b!9284 () Bool)

(assert (=> b!9284 (= e!5293 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!8425 () Bool)

(assert (=> start!1046 (=> (not res!8425) (not e!5300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1046 (= res!8425 (validMask!0 mask!2250))))

(assert (=> start!1046 e!5300))

(assert (=> start!1046 tp!1363))

(assert (=> start!1046 true))

(declare-fun array_inv!295 (array!837) Bool)

(assert (=> start!1046 (and (array_inv!295 _values!1492) e!5295)))

(assert (=> start!1046 tp_is_empty!453))

(declare-fun array_inv!296 (array!835) Bool)

(assert (=> start!1046 (array_inv!296 _keys!1806)))

(assert (= (and start!1046 res!8425) b!9282))

(assert (= (and b!9282 res!8428) b!9275))

(assert (= (and b!9275 res!8427) b!9283))

(assert (= (and b!9283 res!8431) b!9276))

(assert (= (and b!9276 res!8426) b!9279))

(assert (= (and b!9279 res!8429) b!9272))

(assert (= (and b!9272 c!710) b!9278))

(assert (= (and b!9272 (not c!710)) b!9284))

(assert (= (and b!9272 (not res!8430)) b!9274))

(assert (= (and b!9274 (not res!8424)) b!9277))

(assert (= (and b!9273 condMapEmpty!659) mapIsEmpty!659))

(assert (= (and b!9273 (not condMapEmpty!659)) mapNonEmpty!659))

(get-info :version)

(assert (= (and mapNonEmpty!659 ((_ is ValueCellFull!210) mapValue!659)) b!9281))

(assert (= (and b!9273 ((_ is ValueCellFull!210) mapDefault!659)) b!9280))

(assert (= start!1046 b!9273))

(declare-fun m!5803 () Bool)

(assert (=> start!1046 m!5803))

(declare-fun m!5805 () Bool)

(assert (=> start!1046 m!5805))

(declare-fun m!5807 () Bool)

(assert (=> start!1046 m!5807))

(declare-fun m!5809 () Bool)

(assert (=> b!9272 m!5809))

(declare-fun m!5811 () Bool)

(assert (=> b!9272 m!5811))

(declare-fun m!5813 () Bool)

(assert (=> b!9276 m!5813))

(assert (=> b!9276 m!5813))

(declare-fun m!5815 () Bool)

(assert (=> b!9276 m!5815))

(declare-fun m!5817 () Bool)

(assert (=> b!9275 m!5817))

(declare-fun m!5819 () Bool)

(assert (=> mapNonEmpty!659 m!5819))

(declare-fun m!5821 () Bool)

(assert (=> b!9277 m!5821))

(assert (=> b!9278 m!5809))

(declare-fun m!5823 () Bool)

(assert (=> b!9279 m!5823))

(declare-fun m!5825 () Bool)

(assert (=> b!9274 m!5825))

(declare-fun m!5827 () Bool)

(assert (=> b!9274 m!5827))

(declare-fun m!5829 () Bool)

(assert (=> b!9274 m!5829))

(declare-fun m!5831 () Bool)

(assert (=> b!9283 m!5831))

(check-sat (not b!9283) (not b_next!375) (not b!9277) (not mapNonEmpty!659) (not b!9272) (not b!9276) tp_is_empty!453 b_and!527 (not b!9279) (not b!9278) (not start!1046) (not b!9275) (not b!9274))
(check-sat b_and!527 (not b_next!375))
(get-model)

(declare-fun e!5333 () SeekEntryResult!34)

(declare-fun b!9336 () Bool)

(declare-fun lt!2034 () SeekEntryResult!34)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!835 (_ BitVec 32)) SeekEntryResult!34)

(assert (=> b!9336 (= e!5333 (seekKeyOrZeroReturnVacant!0 (x!2778 lt!2034) (index!2257 lt!2034) (index!2257 lt!2034) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9337 () Bool)

(declare-fun e!5332 () SeekEntryResult!34)

(declare-fun e!5331 () SeekEntryResult!34)

(assert (=> b!9337 (= e!5332 e!5331)))

(declare-fun lt!2033 () (_ BitVec 64))

(assert (=> b!9337 (= lt!2033 (select (arr!403 _keys!1806) (index!2257 lt!2034)))))

(declare-fun c!722 () Bool)

(assert (=> b!9337 (= c!722 (= lt!2033 k0!1278))))

(declare-fun b!9338 () Bool)

(assert (=> b!9338 (= e!5332 Undefined!34)))

(declare-fun b!9339 () Bool)

(assert (=> b!9339 (= e!5333 (MissingZero!34 (index!2257 lt!2034)))))

(declare-fun b!9340 () Bool)

(assert (=> b!9340 (= e!5331 (Found!34 (index!2257 lt!2034)))))

(declare-fun b!9341 () Bool)

(declare-fun c!720 () Bool)

(assert (=> b!9341 (= c!720 (= lt!2033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!9341 (= e!5331 e!5333)))

(declare-fun d!895 () Bool)

(declare-fun lt!2032 () SeekEntryResult!34)

(assert (=> d!895 (and (or ((_ is Undefined!34) lt!2032) (not ((_ is Found!34) lt!2032)) (and (bvsge (index!2256 lt!2032) #b00000000000000000000000000000000) (bvslt (index!2256 lt!2032) (size!465 _keys!1806)))) (or ((_ is Undefined!34) lt!2032) ((_ is Found!34) lt!2032) (not ((_ is MissingZero!34) lt!2032)) (and (bvsge (index!2255 lt!2032) #b00000000000000000000000000000000) (bvslt (index!2255 lt!2032) (size!465 _keys!1806)))) (or ((_ is Undefined!34) lt!2032) ((_ is Found!34) lt!2032) ((_ is MissingZero!34) lt!2032) (not ((_ is MissingVacant!34) lt!2032)) (and (bvsge (index!2258 lt!2032) #b00000000000000000000000000000000) (bvslt (index!2258 lt!2032) (size!465 _keys!1806)))) (or ((_ is Undefined!34) lt!2032) (ite ((_ is Found!34) lt!2032) (= (select (arr!403 _keys!1806) (index!2256 lt!2032)) k0!1278) (ite ((_ is MissingZero!34) lt!2032) (= (select (arr!403 _keys!1806) (index!2255 lt!2032)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!34) lt!2032) (= (select (arr!403 _keys!1806) (index!2258 lt!2032)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!895 (= lt!2032 e!5332)))

(declare-fun c!721 () Bool)

(assert (=> d!895 (= c!721 (and ((_ is Intermediate!34) lt!2034) (undefined!846 lt!2034)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!835 (_ BitVec 32)) SeekEntryResult!34)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!895 (= lt!2034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!895 (validMask!0 mask!2250)))

(assert (=> d!895 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) lt!2032)))

(assert (= (and d!895 c!721) b!9338))

(assert (= (and d!895 (not c!721)) b!9337))

(assert (= (and b!9337 c!722) b!9340))

(assert (= (and b!9337 (not c!722)) b!9341))

(assert (= (and b!9341 c!720) b!9339))

(assert (= (and b!9341 (not c!720)) b!9336))

(declare-fun m!5863 () Bool)

(assert (=> b!9336 m!5863))

(declare-fun m!5865 () Bool)

(assert (=> b!9337 m!5865))

(declare-fun m!5867 () Bool)

(assert (=> d!895 m!5867))

(assert (=> d!895 m!5803))

(declare-fun m!5869 () Bool)

(assert (=> d!895 m!5869))

(declare-fun m!5871 () Bool)

(assert (=> d!895 m!5871))

(declare-fun m!5873 () Bool)

(assert (=> d!895 m!5873))

(assert (=> d!895 m!5871))

(declare-fun m!5875 () Bool)

(assert (=> d!895 m!5875))

(assert (=> b!9277 d!895))

(declare-fun d!897 () Bool)

(assert (=> d!897 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!1046 d!897))

(declare-fun d!899 () Bool)

(assert (=> d!899 (= (array_inv!295 _values!1492) (bvsge (size!466 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!1046 d!899))

(declare-fun d!901 () Bool)

(assert (=> d!901 (= (array_inv!296 _keys!1806) (bvsge (size!465 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!1046 d!901))

(declare-fun d!903 () Bool)

(declare-fun res!8460 () Bool)

(declare-fun e!5338 () Bool)

(assert (=> d!903 (=> res!8460 e!5338)))

(assert (=> d!903 (= res!8460 (= (select (arr!403 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!903 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!5338)))

(declare-fun b!9346 () Bool)

(declare-fun e!5339 () Bool)

(assert (=> b!9346 (= e!5338 e!5339)))

(declare-fun res!8461 () Bool)

(assert (=> b!9346 (=> (not res!8461) (not e!5339))))

(assert (=> b!9346 (= res!8461 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!465 _keys!1806)))))

(declare-fun b!9347 () Bool)

(assert (=> b!9347 (= e!5339 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!903 (not res!8460)) b!9346))

(assert (= (and b!9346 res!8461) b!9347))

(declare-fun m!5877 () Bool)

(assert (=> d!903 m!5877))

(declare-fun m!5879 () Bool)

(assert (=> b!9347 m!5879))

(assert (=> b!9272 d!903))

(declare-fun d!905 () Bool)

(declare-fun e!5342 () Bool)

(assert (=> d!905 e!5342))

(declare-fun c!725 () Bool)

(assert (=> d!905 (= c!725 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2037 () Unit!189)

(declare-fun choose!141 (array!835 array!837 (_ BitVec 32) (_ BitVec 32) V!781 V!781 (_ BitVec 64) Int) Unit!189)

(assert (=> d!905 (= lt!2037 (choose!141 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!905 (validMask!0 mask!2250)))

(assert (=> d!905 (= (lemmaKeyInListMapIsInArray!71 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!2037)))

(declare-fun b!9352 () Bool)

(assert (=> b!9352 (= e!5342 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9353 () Bool)

(assert (=> b!9353 (= e!5342 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!905 c!725) b!9352))

(assert (= (and d!905 (not c!725)) b!9353))

(declare-fun m!5881 () Bool)

(assert (=> d!905 m!5881))

(assert (=> d!905 m!5803))

(assert (=> b!9352 m!5809))

(assert (=> b!9272 d!905))

(declare-fun d!907 () Bool)

(assert (=> d!907 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9279 d!907))

(declare-fun d!909 () Bool)

(declare-fun e!5348 () Bool)

(assert (=> d!909 e!5348))

(declare-fun res!8464 () Bool)

(assert (=> d!909 (=> res!8464 e!5348)))

(declare-fun lt!2046 () Bool)

(assert (=> d!909 (= res!8464 (not lt!2046))))

(declare-fun lt!2049 () Bool)

(assert (=> d!909 (= lt!2046 lt!2049)))

(declare-fun lt!2048 () Unit!189)

(declare-fun e!5347 () Unit!189)

(assert (=> d!909 (= lt!2048 e!5347)))

(declare-fun c!728 () Bool)

(assert (=> d!909 (= c!728 lt!2049)))

(declare-fun containsKey!8 (List!281 (_ BitVec 64)) Bool)

(assert (=> d!909 (= lt!2049 (containsKey!8 (toList!153 (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!909 (= (contains!130 (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!2046)))

(declare-fun b!9360 () Bool)

(declare-fun lt!2047 () Unit!189)

(assert (=> b!9360 (= e!5347 lt!2047)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!8 (List!281 (_ BitVec 64)) Unit!189)

(assert (=> b!9360 (= lt!2047 (lemmaContainsKeyImpliesGetValueByKeyDefined!8 (toList!153 (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!20 0))(
  ( (Some!19 (v!1328 V!781)) (None!18) )
))
(declare-fun isDefined!9 (Option!20) Bool)

(declare-fun getValueByKey!14 (List!281 (_ BitVec 64)) Option!20)

(assert (=> b!9360 (isDefined!9 (getValueByKey!14 (toList!153 (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!9361 () Bool)

(declare-fun Unit!191 () Unit!189)

(assert (=> b!9361 (= e!5347 Unit!191)))

(declare-fun b!9362 () Bool)

(assert (=> b!9362 (= e!5348 (isDefined!9 (getValueByKey!14 (toList!153 (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!909 c!728) b!9360))

(assert (= (and d!909 (not c!728)) b!9361))

(assert (= (and d!909 (not res!8464)) b!9362))

(declare-fun m!5883 () Bool)

(assert (=> d!909 m!5883))

(declare-fun m!5885 () Bool)

(assert (=> b!9360 m!5885))

(declare-fun m!5887 () Bool)

(assert (=> b!9360 m!5887))

(assert (=> b!9360 m!5887))

(declare-fun m!5889 () Bool)

(assert (=> b!9360 m!5889))

(assert (=> b!9362 m!5887))

(assert (=> b!9362 m!5887))

(assert (=> b!9362 m!5889))

(assert (=> b!9276 d!909))

(declare-fun b!9405 () Bool)

(declare-fun e!5381 () Bool)

(assert (=> b!9405 (= e!5381 (validKeyInArray!0 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun call!251 () ListLongMap!275)

(declare-fun bm!248 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!8 (array!835 array!837 (_ BitVec 32) (_ BitVec 32) V!781 V!781 (_ BitVec 32) Int) ListLongMap!275)

(assert (=> bm!248 (= call!251 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!9406 () Bool)

(declare-fun e!5385 () Bool)

(declare-fun e!5387 () Bool)

(assert (=> b!9406 (= e!5385 e!5387)))

(declare-fun res!8488 () Bool)

(declare-fun call!255 () Bool)

(assert (=> b!9406 (= res!8488 call!255)))

(assert (=> b!9406 (=> (not res!8488) (not e!5387))))

(declare-fun b!9407 () Bool)

(declare-fun e!5378 () Bool)

(declare-fun e!5376 () Bool)

(assert (=> b!9407 (= e!5378 e!5376)))

(declare-fun res!8484 () Bool)

(assert (=> b!9407 (=> (not res!8484) (not e!5376))))

(declare-fun lt!2107 () ListLongMap!275)

(assert (=> b!9407 (= res!8484 (contains!130 lt!2107 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!9407 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!465 _keys!1806)))))

(declare-fun bm!249 () Bool)

(assert (=> bm!249 (= call!255 (contains!130 lt!2107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9408 () Bool)

(declare-fun e!5382 () Unit!189)

(declare-fun Unit!192 () Unit!189)

(assert (=> b!9408 (= e!5382 Unit!192)))

(declare-fun b!9409 () Bool)

(declare-fun res!8491 () Bool)

(declare-fun e!5386 () Bool)

(assert (=> b!9409 (=> (not res!8491) (not e!5386))))

(assert (=> b!9409 (= res!8491 e!5385)))

(declare-fun c!744 () Bool)

(assert (=> b!9409 (= c!744 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!9410 () Bool)

(declare-fun e!5375 () Bool)

(declare-fun apply!24 (ListLongMap!275 (_ BitVec 64)) V!781)

(assert (=> b!9410 (= e!5375 (= (apply!24 lt!2107 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun bm!250 () Bool)

(declare-fun call!256 () ListLongMap!275)

(declare-fun call!253 () ListLongMap!275)

(assert (=> bm!250 (= call!256 call!253)))

(declare-fun b!9412 () Bool)

(declare-fun e!5380 () ListLongMap!275)

(declare-fun e!5383 () ListLongMap!275)

(assert (=> b!9412 (= e!5380 e!5383)))

(declare-fun c!746 () Bool)

(assert (=> b!9412 (= c!746 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9413 () Bool)

(declare-fun res!8485 () Bool)

(assert (=> b!9413 (=> (not res!8485) (not e!5386))))

(assert (=> b!9413 (= res!8485 e!5378)))

(declare-fun res!8483 () Bool)

(assert (=> b!9413 (=> res!8483 e!5378)))

(assert (=> b!9413 (= res!8483 (not e!5381))))

(declare-fun res!8486 () Bool)

(assert (=> b!9413 (=> (not res!8486) (not e!5381))))

(assert (=> b!9413 (= res!8486 (bvslt #b00000000000000000000000000000000 (size!465 _keys!1806)))))

(declare-fun b!9414 () Bool)

(assert (=> b!9414 (= e!5387 (= (apply!24 lt!2107 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!9415 () Bool)

(declare-fun call!252 () ListLongMap!275)

(assert (=> b!9415 (= e!5383 call!252)))

(declare-fun b!9416 () Bool)

(declare-fun get!176 (ValueCell!210 V!781) V!781)

(declare-fun dynLambda!46 (Int (_ BitVec 64)) V!781)

(assert (=> b!9416 (= e!5376 (= (apply!24 lt!2107 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)) (get!176 (select (arr!404 _values!1492) #b00000000000000000000000000000000) (dynLambda!46 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!466 _values!1492)))))

(assert (=> b!9416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!465 _keys!1806)))))

(declare-fun b!9417 () Bool)

(declare-fun e!5379 () Bool)

(assert (=> b!9417 (= e!5386 e!5379)))

(declare-fun c!745 () Bool)

(assert (=> b!9417 (= c!745 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!254 () ListLongMap!275)

(declare-fun c!741 () Bool)

(declare-fun bm!251 () Bool)

(declare-fun +!11 (ListLongMap!275 tuple2!270) ListLongMap!275)

(assert (=> bm!251 (= call!254 (+!11 (ite c!741 call!251 (ite c!746 call!253 call!256)) (ite (or c!741 c!746) (tuple2!271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!9418 () Bool)

(declare-fun call!257 () Bool)

(assert (=> b!9418 (= e!5379 (not call!257))))

(declare-fun b!9419 () Bool)

(assert (=> b!9419 (= e!5380 (+!11 call!254 (tuple2!271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!9420 () Bool)

(assert (=> b!9420 (= e!5379 e!5375)))

(declare-fun res!8490 () Bool)

(assert (=> b!9420 (= res!8490 call!257)))

(assert (=> b!9420 (=> (not res!8490) (not e!5375))))

(declare-fun b!9421 () Bool)

(declare-fun e!5377 () ListLongMap!275)

(assert (=> b!9421 (= e!5377 call!256)))

(declare-fun b!9422 () Bool)

(declare-fun e!5384 () Bool)

(assert (=> b!9422 (= e!5384 (validKeyInArray!0 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9423 () Bool)

(assert (=> b!9423 (= e!5385 (not call!255))))

(declare-fun b!9424 () Bool)

(assert (=> b!9424 (= e!5377 call!252)))

(declare-fun bm!252 () Bool)

(assert (=> bm!252 (= call!252 call!254)))

(declare-fun bm!253 () Bool)

(assert (=> bm!253 (= call!253 call!251)))

(declare-fun b!9411 () Bool)

(declare-fun lt!2113 () Unit!189)

(assert (=> b!9411 (= e!5382 lt!2113)))

(declare-fun lt!2115 () ListLongMap!275)

(assert (=> b!9411 (= lt!2115 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2112 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2103 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2103 (select (arr!403 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2095 () Unit!189)

(declare-fun addStillContains!9 (ListLongMap!275 (_ BitVec 64) V!781 (_ BitVec 64)) Unit!189)

(assert (=> b!9411 (= lt!2095 (addStillContains!9 lt!2115 lt!2112 zeroValue!1434 lt!2103))))

(assert (=> b!9411 (contains!130 (+!11 lt!2115 (tuple2!271 lt!2112 zeroValue!1434)) lt!2103)))

(declare-fun lt!2108 () Unit!189)

(assert (=> b!9411 (= lt!2108 lt!2095)))

(declare-fun lt!2104 () ListLongMap!275)

(assert (=> b!9411 (= lt!2104 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2099 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2099 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2098 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2098 (select (arr!403 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2100 () Unit!189)

(declare-fun addApplyDifferent!9 (ListLongMap!275 (_ BitVec 64) V!781 (_ BitVec 64)) Unit!189)

(assert (=> b!9411 (= lt!2100 (addApplyDifferent!9 lt!2104 lt!2099 minValue!1434 lt!2098))))

(assert (=> b!9411 (= (apply!24 (+!11 lt!2104 (tuple2!271 lt!2099 minValue!1434)) lt!2098) (apply!24 lt!2104 lt!2098))))

(declare-fun lt!2110 () Unit!189)

(assert (=> b!9411 (= lt!2110 lt!2100)))

(declare-fun lt!2114 () ListLongMap!275)

(assert (=> b!9411 (= lt!2114 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2097 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2111 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2111 (select (arr!403 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2105 () Unit!189)

(assert (=> b!9411 (= lt!2105 (addApplyDifferent!9 lt!2114 lt!2097 zeroValue!1434 lt!2111))))

(assert (=> b!9411 (= (apply!24 (+!11 lt!2114 (tuple2!271 lt!2097 zeroValue!1434)) lt!2111) (apply!24 lt!2114 lt!2111))))

(declare-fun lt!2096 () Unit!189)

(assert (=> b!9411 (= lt!2096 lt!2105)))

(declare-fun lt!2101 () ListLongMap!275)

(assert (=> b!9411 (= lt!2101 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2094 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2094 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2106 () (_ BitVec 64))

(assert (=> b!9411 (= lt!2106 (select (arr!403 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!9411 (= lt!2113 (addApplyDifferent!9 lt!2101 lt!2094 minValue!1434 lt!2106))))

(assert (=> b!9411 (= (apply!24 (+!11 lt!2101 (tuple2!271 lt!2094 minValue!1434)) lt!2106) (apply!24 lt!2101 lt!2106))))

(declare-fun d!911 () Bool)

(assert (=> d!911 e!5386))

(declare-fun res!8487 () Bool)

(assert (=> d!911 (=> (not res!8487) (not e!5386))))

(assert (=> d!911 (= res!8487 (or (bvsge #b00000000000000000000000000000000 (size!465 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!465 _keys!1806)))))))

(declare-fun lt!2109 () ListLongMap!275)

(assert (=> d!911 (= lt!2107 lt!2109)))

(declare-fun lt!2102 () Unit!189)

(assert (=> d!911 (= lt!2102 e!5382)))

(declare-fun c!742 () Bool)

(assert (=> d!911 (= c!742 e!5384)))

(declare-fun res!8489 () Bool)

(assert (=> d!911 (=> (not res!8489) (not e!5384))))

(assert (=> d!911 (= res!8489 (bvslt #b00000000000000000000000000000000 (size!465 _keys!1806)))))

(assert (=> d!911 (= lt!2109 e!5380)))

(assert (=> d!911 (= c!741 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!911 (validMask!0 mask!2250)))

(assert (=> d!911 (= (getCurrentListMap!112 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!2107)))

(declare-fun bm!254 () Bool)

(assert (=> bm!254 (= call!257 (contains!130 lt!2107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9425 () Bool)

(declare-fun c!743 () Bool)

(assert (=> b!9425 (= c!743 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!9425 (= e!5383 e!5377)))

(assert (= (and d!911 c!741) b!9419))

(assert (= (and d!911 (not c!741)) b!9412))

(assert (= (and b!9412 c!746) b!9415))

(assert (= (and b!9412 (not c!746)) b!9425))

(assert (= (and b!9425 c!743) b!9424))

(assert (= (and b!9425 (not c!743)) b!9421))

(assert (= (or b!9424 b!9421) bm!250))

(assert (= (or b!9415 bm!250) bm!253))

(assert (= (or b!9415 b!9424) bm!252))

(assert (= (or b!9419 bm!253) bm!248))

(assert (= (or b!9419 bm!252) bm!251))

(assert (= (and d!911 res!8489) b!9422))

(assert (= (and d!911 c!742) b!9411))

(assert (= (and d!911 (not c!742)) b!9408))

(assert (= (and d!911 res!8487) b!9413))

(assert (= (and b!9413 res!8486) b!9405))

(assert (= (and b!9413 (not res!8483)) b!9407))

(assert (= (and b!9407 res!8484) b!9416))

(assert (= (and b!9413 res!8485) b!9409))

(assert (= (and b!9409 c!744) b!9406))

(assert (= (and b!9409 (not c!744)) b!9423))

(assert (= (and b!9406 res!8488) b!9414))

(assert (= (or b!9406 b!9423) bm!249))

(assert (= (and b!9409 res!8491) b!9417))

(assert (= (and b!9417 c!745) b!9420))

(assert (= (and b!9417 (not c!745)) b!9418))

(assert (= (and b!9420 res!8490) b!9410))

(assert (= (or b!9420 b!9418) bm!254))

(declare-fun b_lambda!347 () Bool)

(assert (=> (not b_lambda!347) (not b!9416)))

(declare-fun t!2426 () Bool)

(declare-fun tb!141 () Bool)

(assert (=> (and start!1046 (= defaultEntry!1495 defaultEntry!1495) t!2426) tb!141))

(declare-fun result!225 () Bool)

(assert (=> tb!141 (= result!225 tp_is_empty!453)))

(assert (=> b!9416 t!2426))

(declare-fun b_and!531 () Bool)

(assert (= b_and!527 (and (=> t!2426 result!225) b_and!531)))

(declare-fun m!5891 () Bool)

(assert (=> b!9414 m!5891))

(declare-fun m!5893 () Bool)

(assert (=> bm!251 m!5893))

(declare-fun m!5895 () Bool)

(assert (=> b!9410 m!5895))

(assert (=> d!911 m!5803))

(assert (=> b!9405 m!5877))

(assert (=> b!9405 m!5877))

(declare-fun m!5897 () Bool)

(assert (=> b!9405 m!5897))

(assert (=> b!9422 m!5877))

(assert (=> b!9422 m!5877))

(assert (=> b!9422 m!5897))

(declare-fun m!5899 () Bool)

(assert (=> b!9411 m!5899))

(assert (=> b!9411 m!5877))

(declare-fun m!5901 () Bool)

(assert (=> b!9411 m!5901))

(declare-fun m!5903 () Bool)

(assert (=> b!9411 m!5903))

(declare-fun m!5905 () Bool)

(assert (=> b!9411 m!5905))

(declare-fun m!5907 () Bool)

(assert (=> b!9411 m!5907))

(declare-fun m!5909 () Bool)

(assert (=> b!9411 m!5909))

(declare-fun m!5911 () Bool)

(assert (=> b!9411 m!5911))

(declare-fun m!5913 () Bool)

(assert (=> b!9411 m!5913))

(assert (=> b!9411 m!5913))

(declare-fun m!5915 () Bool)

(assert (=> b!9411 m!5915))

(assert (=> b!9411 m!5901))

(declare-fun m!5917 () Bool)

(assert (=> b!9411 m!5917))

(declare-fun m!5919 () Bool)

(assert (=> b!9411 m!5919))

(declare-fun m!5921 () Bool)

(assert (=> b!9411 m!5921))

(declare-fun m!5923 () Bool)

(assert (=> b!9411 m!5923))

(declare-fun m!5925 () Bool)

(assert (=> b!9411 m!5925))

(declare-fun m!5927 () Bool)

(assert (=> b!9411 m!5927))

(declare-fun m!5929 () Bool)

(assert (=> b!9411 m!5929))

(assert (=> b!9411 m!5919))

(assert (=> b!9411 m!5923))

(declare-fun m!5931 () Bool)

(assert (=> bm!254 m!5931))

(assert (=> bm!248 m!5911))

(declare-fun m!5933 () Bool)

(assert (=> b!9419 m!5933))

(assert (=> b!9407 m!5877))

(assert (=> b!9407 m!5877))

(declare-fun m!5935 () Bool)

(assert (=> b!9407 m!5935))

(assert (=> b!9416 m!5877))

(declare-fun m!5937 () Bool)

(assert (=> b!9416 m!5937))

(assert (=> b!9416 m!5877))

(declare-fun m!5939 () Bool)

(assert (=> b!9416 m!5939))

(declare-fun m!5941 () Bool)

(assert (=> b!9416 m!5941))

(declare-fun m!5943 () Bool)

(assert (=> b!9416 m!5943))

(assert (=> b!9416 m!5939))

(assert (=> b!9416 m!5941))

(declare-fun m!5945 () Bool)

(assert (=> bm!249 m!5945))

(assert (=> b!9276 d!911))

(declare-fun b!9438 () Bool)

(declare-fun e!5397 () Bool)

(declare-fun e!5399 () Bool)

(assert (=> b!9438 (= e!5397 e!5399)))

(declare-fun c!749 () Bool)

(assert (=> b!9438 (= c!749 (validKeyInArray!0 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!913 () Bool)

(declare-fun res!8498 () Bool)

(declare-fun e!5396 () Bool)

(assert (=> d!913 (=> res!8498 e!5396)))

(assert (=> d!913 (= res!8498 (bvsge #b00000000000000000000000000000000 (size!465 _keys!1806)))))

(assert (=> d!913 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!279) e!5396)))

(declare-fun bm!257 () Bool)

(declare-fun call!260 () Bool)

(assert (=> bm!257 (= call!260 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!749 (Cons!278 (select (arr!403 _keys!1806) #b00000000000000000000000000000000) Nil!279) Nil!279)))))

(declare-fun b!9439 () Bool)

(assert (=> b!9439 (= e!5396 e!5397)))

(declare-fun res!8500 () Bool)

(assert (=> b!9439 (=> (not res!8500) (not e!5397))))

(declare-fun e!5398 () Bool)

(assert (=> b!9439 (= res!8500 (not e!5398))))

(declare-fun res!8499 () Bool)

(assert (=> b!9439 (=> (not res!8499) (not e!5398))))

(assert (=> b!9439 (= res!8499 (validKeyInArray!0 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9440 () Bool)

(assert (=> b!9440 (= e!5399 call!260)))

(declare-fun b!9441 () Bool)

(assert (=> b!9441 (= e!5399 call!260)))

(declare-fun b!9442 () Bool)

(declare-fun contains!131 (List!282 (_ BitVec 64)) Bool)

(assert (=> b!9442 (= e!5398 (contains!131 Nil!279 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!913 (not res!8498)) b!9439))

(assert (= (and b!9439 res!8499) b!9442))

(assert (= (and b!9439 res!8500) b!9438))

(assert (= (and b!9438 c!749) b!9441))

(assert (= (and b!9438 (not c!749)) b!9440))

(assert (= (or b!9441 b!9440) bm!257))

(assert (=> b!9438 m!5877))

(assert (=> b!9438 m!5877))

(assert (=> b!9438 m!5897))

(assert (=> bm!257 m!5877))

(declare-fun m!5947 () Bool)

(assert (=> bm!257 m!5947))

(assert (=> b!9439 m!5877))

(assert (=> b!9439 m!5877))

(assert (=> b!9439 m!5897))

(assert (=> b!9442 m!5877))

(assert (=> b!9442 m!5877))

(declare-fun m!5949 () Bool)

(assert (=> b!9442 m!5949))

(assert (=> b!9283 d!913))

(declare-fun b!9451 () Bool)

(declare-fun e!5407 () Bool)

(declare-fun e!5408 () Bool)

(assert (=> b!9451 (= e!5407 e!5408)))

(declare-fun c!752 () Bool)

(assert (=> b!9451 (= c!752 (validKeyInArray!0 (select (arr!403 _keys!1806) lt!2015)))))

(declare-fun d!915 () Bool)

(declare-fun res!8505 () Bool)

(assert (=> d!915 (=> res!8505 e!5407)))

(assert (=> d!915 (= res!8505 (bvsge lt!2015 (size!465 _keys!1806)))))

(assert (=> d!915 (= (arrayForallSeekEntryOrOpenFound!0 lt!2015 _keys!1806 mask!2250) e!5407)))

(declare-fun b!9452 () Bool)

(declare-fun e!5406 () Bool)

(declare-fun call!263 () Bool)

(assert (=> b!9452 (= e!5406 call!263)))

(declare-fun b!9453 () Bool)

(assert (=> b!9453 (= e!5408 call!263)))

(declare-fun b!9454 () Bool)

(assert (=> b!9454 (= e!5408 e!5406)))

(declare-fun lt!2123 () (_ BitVec 64))

(assert (=> b!9454 (= lt!2123 (select (arr!403 _keys!1806) lt!2015))))

(declare-fun lt!2122 () Unit!189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!835 (_ BitVec 64) (_ BitVec 32)) Unit!189)

(assert (=> b!9454 (= lt!2122 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2123 lt!2015))))

(assert (=> b!9454 (arrayContainsKey!0 _keys!1806 lt!2123 #b00000000000000000000000000000000)))

(declare-fun lt!2124 () Unit!189)

(assert (=> b!9454 (= lt!2124 lt!2122)))

(declare-fun res!8506 () Bool)

(assert (=> b!9454 (= res!8506 (= (seekEntryOrOpen!0 (select (arr!403 _keys!1806) lt!2015) _keys!1806 mask!2250) (Found!34 lt!2015)))))

(assert (=> b!9454 (=> (not res!8506) (not e!5406))))

(declare-fun bm!260 () Bool)

(assert (=> bm!260 (= call!263 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!2015 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(assert (= (and d!915 (not res!8505)) b!9451))

(assert (= (and b!9451 c!752) b!9454))

(assert (= (and b!9451 (not c!752)) b!9453))

(assert (= (and b!9454 res!8506) b!9452))

(assert (= (or b!9452 b!9453) bm!260))

(declare-fun m!5951 () Bool)

(assert (=> b!9451 m!5951))

(assert (=> b!9451 m!5951))

(declare-fun m!5953 () Bool)

(assert (=> b!9451 m!5953))

(assert (=> b!9454 m!5951))

(declare-fun m!5955 () Bool)

(assert (=> b!9454 m!5955))

(declare-fun m!5957 () Bool)

(assert (=> b!9454 m!5957))

(assert (=> b!9454 m!5951))

(declare-fun m!5959 () Bool)

(assert (=> b!9454 m!5959))

(declare-fun m!5961 () Bool)

(assert (=> bm!260 m!5961))

(assert (=> b!9274 d!915))

(declare-fun d!917 () Bool)

(assert (=> d!917 (arrayForallSeekEntryOrOpenFound!0 lt!2015 _keys!1806 mask!2250)))

(declare-fun lt!2127 () Unit!189)

(declare-fun choose!38 (array!835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!189)

(assert (=> d!917 (= lt!2127 (choose!38 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2015))))

(assert (=> d!917 (validMask!0 mask!2250)))

(assert (=> d!917 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2015) lt!2127)))

(declare-fun bs!328 () Bool)

(assert (= bs!328 d!917))

(assert (=> bs!328 m!5825))

(declare-fun m!5963 () Bool)

(assert (=> bs!328 m!5963))

(assert (=> bs!328 m!5803))

(assert (=> b!9274 d!917))

(declare-fun d!919 () Bool)

(declare-fun lt!2130 () (_ BitVec 32))

(assert (=> d!919 (and (or (bvslt lt!2130 #b00000000000000000000000000000000) (bvsge lt!2130 (size!465 _keys!1806)) (and (bvsge lt!2130 #b00000000000000000000000000000000) (bvslt lt!2130 (size!465 _keys!1806)))) (bvsge lt!2130 #b00000000000000000000000000000000) (bvslt lt!2130 (size!465 _keys!1806)) (= (select (arr!403 _keys!1806) lt!2130) k0!1278))))

(declare-fun e!5411 () (_ BitVec 32))

(assert (=> d!919 (= lt!2130 e!5411)))

(declare-fun c!755 () Bool)

(assert (=> d!919 (= c!755 (= (select (arr!403 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!465 _keys!1806)) (bvslt (size!465 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!919 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!2130)))

(declare-fun b!9459 () Bool)

(assert (=> b!9459 (= e!5411 #b00000000000000000000000000000000)))

(declare-fun b!9460 () Bool)

(assert (=> b!9460 (= e!5411 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!919 c!755) b!9459))

(assert (= (and d!919 (not c!755)) b!9460))

(declare-fun m!5965 () Bool)

(assert (=> d!919 m!5965))

(assert (=> d!919 m!5877))

(declare-fun m!5967 () Bool)

(assert (=> b!9460 m!5967))

(assert (=> b!9274 d!919))

(declare-fun b!9461 () Bool)

(declare-fun e!5413 () Bool)

(declare-fun e!5414 () Bool)

(assert (=> b!9461 (= e!5413 e!5414)))

(declare-fun c!756 () Bool)

(assert (=> b!9461 (= c!756 (validKeyInArray!0 (select (arr!403 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!921 () Bool)

(declare-fun res!8507 () Bool)

(assert (=> d!921 (=> res!8507 e!5413)))

(assert (=> d!921 (= res!8507 (bvsge #b00000000000000000000000000000000 (size!465 _keys!1806)))))

(assert (=> d!921 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!5413)))

(declare-fun b!9462 () Bool)

(declare-fun e!5412 () Bool)

(declare-fun call!264 () Bool)

(assert (=> b!9462 (= e!5412 call!264)))

(declare-fun b!9463 () Bool)

(assert (=> b!9463 (= e!5414 call!264)))

(declare-fun b!9464 () Bool)

(assert (=> b!9464 (= e!5414 e!5412)))

(declare-fun lt!2132 () (_ BitVec 64))

(assert (=> b!9464 (= lt!2132 (select (arr!403 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2131 () Unit!189)

(assert (=> b!9464 (= lt!2131 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2132 #b00000000000000000000000000000000))))

(assert (=> b!9464 (arrayContainsKey!0 _keys!1806 lt!2132 #b00000000000000000000000000000000)))

(declare-fun lt!2133 () Unit!189)

(assert (=> b!9464 (= lt!2133 lt!2131)))

(declare-fun res!8508 () Bool)

(assert (=> b!9464 (= res!8508 (= (seekEntryOrOpen!0 (select (arr!403 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!34 #b00000000000000000000000000000000)))))

(assert (=> b!9464 (=> (not res!8508) (not e!5412))))

(declare-fun bm!261 () Bool)

(assert (=> bm!261 (= call!264 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(assert (= (and d!921 (not res!8507)) b!9461))

(assert (= (and b!9461 c!756) b!9464))

(assert (= (and b!9461 (not c!756)) b!9463))

(assert (= (and b!9464 res!8508) b!9462))

(assert (= (or b!9462 b!9463) bm!261))

(assert (=> b!9461 m!5877))

(assert (=> b!9461 m!5877))

(assert (=> b!9461 m!5897))

(assert (=> b!9464 m!5877))

(declare-fun m!5969 () Bool)

(assert (=> b!9464 m!5969))

(declare-fun m!5971 () Bool)

(assert (=> b!9464 m!5971))

(assert (=> b!9464 m!5877))

(declare-fun m!5973 () Bool)

(assert (=> b!9464 m!5973))

(declare-fun m!5975 () Bool)

(assert (=> bm!261 m!5975))

(assert (=> b!9275 d!921))

(assert (=> b!9278 d!903))

(declare-fun b!9472 () Bool)

(declare-fun e!5420 () Bool)

(assert (=> b!9472 (= e!5420 tp_is_empty!453)))

(declare-fun mapIsEmpty!665 () Bool)

(declare-fun mapRes!665 () Bool)

(assert (=> mapIsEmpty!665 mapRes!665))

(declare-fun mapNonEmpty!665 () Bool)

(declare-fun tp!1373 () Bool)

(declare-fun e!5419 () Bool)

(assert (=> mapNonEmpty!665 (= mapRes!665 (and tp!1373 e!5419))))

(declare-fun mapRest!665 () (Array (_ BitVec 32) ValueCell!210))

(declare-fun mapKey!665 () (_ BitVec 32))

(declare-fun mapValue!665 () ValueCell!210)

(assert (=> mapNonEmpty!665 (= mapRest!659 (store mapRest!665 mapKey!665 mapValue!665))))

(declare-fun condMapEmpty!665 () Bool)

(declare-fun mapDefault!665 () ValueCell!210)

(assert (=> mapNonEmpty!659 (= condMapEmpty!665 (= mapRest!659 ((as const (Array (_ BitVec 32) ValueCell!210)) mapDefault!665)))))

(assert (=> mapNonEmpty!659 (= tp!1364 (and e!5420 mapRes!665))))

(declare-fun b!9471 () Bool)

(assert (=> b!9471 (= e!5419 tp_is_empty!453)))

(assert (= (and mapNonEmpty!659 condMapEmpty!665) mapIsEmpty!665))

(assert (= (and mapNonEmpty!659 (not condMapEmpty!665)) mapNonEmpty!665))

(assert (= (and mapNonEmpty!665 ((_ is ValueCellFull!210) mapValue!665)) b!9471))

(assert (= (and mapNonEmpty!659 ((_ is ValueCellFull!210) mapDefault!665)) b!9472))

(declare-fun m!5977 () Bool)

(assert (=> mapNonEmpty!665 m!5977))

(declare-fun b_lambda!349 () Bool)

(assert (= b_lambda!347 (or (and start!1046 b_free!375) b_lambda!349)))

(check-sat (not b!9410) (not b!9439) (not b!9422) (not b!9352) (not d!905) (not bm!251) (not d!911) (not mapNonEmpty!665) tp_is_empty!453 (not bm!248) (not bm!249) (not b!9405) (not b!9362) (not d!895) (not b!9460) (not b!9407) (not b!9454) (not b_next!375) (not b!9414) (not d!909) (not b!9416) (not b!9419) (not bm!254) (not b!9438) (not b!9347) (not b!9336) (not bm!261) (not b!9360) (not b!9411) (not b!9464) (not d!917) (not bm!257) b_and!531 (not b!9451) (not b!9461) (not b!9442) (not bm!260) (not b_lambda!349))
(check-sat b_and!531 (not b_next!375))
