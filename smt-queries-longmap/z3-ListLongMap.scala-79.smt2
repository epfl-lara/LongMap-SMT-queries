; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1078 () Bool)

(assert start!1078)

(declare-fun b_free!381 () Bool)

(declare-fun b_next!381 () Bool)

(assert (=> start!1078 (= b_free!381 (not b_next!381))))

(declare-fun tp!1385 () Bool)

(declare-fun b_and!535 () Bool)

(assert (=> start!1078 (= tp!1385 b_and!535)))

(declare-fun mapIsEmpty!671 () Bool)

(declare-fun mapRes!671 () Bool)

(assert (=> mapIsEmpty!671 mapRes!671))

(declare-fun b!9553 () Bool)

(declare-fun res!8568 () Bool)

(declare-fun e!5466 () Bool)

(assert (=> b!9553 (=> (not res!8568) (not e!5466))))

(declare-datatypes ((array!849 0))(
  ( (array!850 (arr!409 (Array (_ BitVec 32) (_ BitVec 64))) (size!471 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!849)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!849 (_ BitVec 32)) Bool)

(assert (=> b!9553 (= res!8568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9554 () Bool)

(declare-fun e!5468 () Bool)

(assert (=> b!9554 (= e!5466 (not e!5468))))

(declare-fun res!8570 () Bool)

(assert (=> b!9554 (=> res!8570 e!5468)))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9554 (= res!8570 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!5473 () Bool)

(assert (=> b!9554 e!5473))

(declare-fun c!762 () Bool)

(assert (=> b!9554 (= c!762 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!789 0))(
  ( (V!790 (val!235 Int)) )
))
(declare-datatypes ((ValueCell!213 0))(
  ( (ValueCellFull!213 (v!1330 V!789)) (EmptyCell!213) )
))
(declare-datatypes ((array!851 0))(
  ( (array!852 (arr!410 (Array (_ BitVec 32) ValueCell!213)) (size!472 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!851)

(declare-fun zeroValue!1434 () V!789)

(declare-fun minValue!1434 () V!789)

(declare-datatypes ((Unit!195 0))(
  ( (Unit!196) )
))
(declare-fun lt!2161 () Unit!195)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lemmaKeyInListMapIsInArray!73 (array!849 array!851 (_ BitVec 32) (_ BitVec 32) V!789 V!789 (_ BitVec 64) Int) Unit!195)

(assert (=> b!9554 (= lt!2161 (lemmaKeyInListMapIsInArray!73 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9555 () Bool)

(declare-fun res!8565 () Bool)

(assert (=> b!9555 (=> (not res!8565) (not e!5466))))

(declare-datatypes ((List!284 0))(
  ( (Nil!281) (Cons!280 (h!846 (_ BitVec 64)) (t!2427 List!284)) )
))
(declare-fun arrayNoDuplicates!0 (array!849 (_ BitVec 32) List!284) Bool)

(assert (=> b!9555 (= res!8565 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!281))))

(declare-fun b!9556 () Bool)

(declare-fun e!5467 () Bool)

(declare-fun e!5471 () Bool)

(assert (=> b!9556 (= e!5467 (and e!5471 mapRes!671))))

(declare-fun condMapEmpty!671 () Bool)

(declare-fun mapDefault!671 () ValueCell!213)

(assert (=> b!9556 (= condMapEmpty!671 (= (arr!410 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!213)) mapDefault!671)))))

(declare-fun b!9557 () Bool)

(declare-fun res!8572 () Bool)

(declare-fun e!5469 () Bool)

(assert (=> b!9557 (=> res!8572 e!5469)))

(declare-fun lt!2162 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!35 0))(
  ( (MissingZero!35 (index!2259 (_ BitVec 32))) (Found!35 (index!2260 (_ BitVec 32))) (Intermediate!35 (undefined!847 Bool) (index!2261 (_ BitVec 32)) (x!2797 (_ BitVec 32))) (Undefined!35) (MissingVacant!35 (index!2262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!849 (_ BitVec 32)) SeekEntryResult!35)

(assert (=> b!9557 (= res!8572 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!35 lt!2162))))))

(declare-fun b!9558 () Bool)

(declare-fun e!5472 () Bool)

(assert (=> b!9558 (= e!5469 e!5472)))

(declare-fun res!8567 () Bool)

(assert (=> b!9558 (=> res!8567 e!5472)))

(declare-fun lt!2160 () SeekEntryResult!35)

(get-info :version)

(assert (=> b!9558 (= res!8567 (not ((_ is Found!35) lt!2160)))))

(assert (=> b!9558 (and ((_ is Found!35) lt!2160) (= (index!2260 lt!2160) lt!2162))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!849 (_ BitVec 32)) SeekEntryResult!35)

(assert (=> b!9558 (= lt!2160 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!2159 () Unit!195)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!849 (_ BitVec 32)) Unit!195)

(assert (=> b!9558 (= lt!2159 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2162 _keys!1806 mask!2250))))

(declare-fun b!9559 () Bool)

(assert (=> b!9559 (= e!5473 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9560 () Bool)

(declare-fun res!8573 () Bool)

(assert (=> b!9560 (=> (not res!8573) (not e!5466))))

(assert (=> b!9560 (= res!8573 (and (= (size!472 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!471 _keys!1806) (size!472 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9561 () Bool)

(assert (=> b!9561 (= e!5472 (and (bvsge (index!2260 lt!2160) #b00000000000000000000000000000000) (bvslt (index!2260 lt!2160) (size!471 _keys!1806))))))

(declare-fun b!9563 () Bool)

(assert (=> b!9563 (= e!5468 e!5469)))

(declare-fun res!8571 () Bool)

(assert (=> b!9563 (=> res!8571 e!5469)))

(assert (=> b!9563 (= res!8571 (not (= (size!471 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!9563 (arrayForallSeekEntryOrOpenFound!0 lt!2162 _keys!1806 mask!2250)))

(declare-fun lt!2163 () Unit!195)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!195)

(assert (=> b!9563 (= lt!2163 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2162))))

(declare-fun arrayScanForKey!0 (array!849 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9563 (= lt!2162 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9564 () Bool)

(declare-fun tp_is_empty!459 () Bool)

(assert (=> b!9564 (= e!5471 tp_is_empty!459)))

(declare-fun b!9565 () Bool)

(assert (=> b!9565 (= e!5473 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!671 () Bool)

(declare-fun tp!1384 () Bool)

(declare-fun e!5474 () Bool)

(assert (=> mapNonEmpty!671 (= mapRes!671 (and tp!1384 e!5474))))

(declare-fun mapValue!671 () ValueCell!213)

(declare-fun mapRest!671 () (Array (_ BitVec 32) ValueCell!213))

(declare-fun mapKey!671 () (_ BitVec 32))

(assert (=> mapNonEmpty!671 (= (arr!410 _values!1492) (store mapRest!671 mapKey!671 mapValue!671))))

(declare-fun b!9566 () Bool)

(declare-fun res!8574 () Bool)

(assert (=> b!9566 (=> (not res!8574) (not e!5466))))

(declare-datatypes ((tuple2!272 0))(
  ( (tuple2!273 (_1!136 (_ BitVec 64)) (_2!136 V!789)) )
))
(declare-datatypes ((List!285 0))(
  ( (Nil!282) (Cons!281 (h!847 tuple2!272) (t!2428 List!285)) )
))
(declare-datatypes ((ListLongMap!277 0))(
  ( (ListLongMap!278 (toList!154 List!285)) )
))
(declare-fun contains!132 (ListLongMap!277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!113 (array!849 array!851 (_ BitVec 32) (_ BitVec 32) V!789 V!789 (_ BitVec 32) Int) ListLongMap!277)

(assert (=> b!9566 (= res!8574 (contains!132 (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9567 () Bool)

(assert (=> b!9567 (= e!5474 tp_is_empty!459)))

(declare-fun b!9568 () Bool)

(declare-fun res!8569 () Bool)

(assert (=> b!9568 (=> res!8569 e!5472)))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9568 (= res!8569 (not (inRange!0 (index!2260 lt!2160) mask!2250)))))

(declare-fun b!9562 () Bool)

(declare-fun res!8566 () Bool)

(assert (=> b!9562 (=> (not res!8566) (not e!5466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9562 (= res!8566 (validKeyInArray!0 k0!1278))))

(declare-fun res!8564 () Bool)

(assert (=> start!1078 (=> (not res!8564) (not e!5466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1078 (= res!8564 (validMask!0 mask!2250))))

(assert (=> start!1078 e!5466))

(assert (=> start!1078 tp!1385))

(assert (=> start!1078 true))

(declare-fun array_inv!297 (array!851) Bool)

(assert (=> start!1078 (and (array_inv!297 _values!1492) e!5467)))

(assert (=> start!1078 tp_is_empty!459))

(declare-fun array_inv!298 (array!849) Bool)

(assert (=> start!1078 (array_inv!298 _keys!1806)))

(assert (= (and start!1078 res!8564) b!9560))

(assert (= (and b!9560 res!8573) b!9553))

(assert (= (and b!9553 res!8568) b!9555))

(assert (= (and b!9555 res!8565) b!9566))

(assert (= (and b!9566 res!8574) b!9562))

(assert (= (and b!9562 res!8566) b!9554))

(assert (= (and b!9554 c!762) b!9559))

(assert (= (and b!9554 (not c!762)) b!9565))

(assert (= (and b!9554 (not res!8570)) b!9563))

(assert (= (and b!9563 (not res!8571)) b!9557))

(assert (= (and b!9557 (not res!8572)) b!9558))

(assert (= (and b!9558 (not res!8567)) b!9568))

(assert (= (and b!9568 (not res!8569)) b!9561))

(assert (= (and b!9556 condMapEmpty!671) mapIsEmpty!671))

(assert (= (and b!9556 (not condMapEmpty!671)) mapNonEmpty!671))

(assert (= (and mapNonEmpty!671 ((_ is ValueCellFull!213) mapValue!671)) b!9567))

(assert (= (and b!9556 ((_ is ValueCellFull!213) mapDefault!671)) b!9564))

(assert (= start!1078 b!9556))

(declare-fun m!6015 () Bool)

(assert (=> b!9554 m!6015))

(declare-fun m!6017 () Bool)

(assert (=> b!9554 m!6017))

(declare-fun m!6019 () Bool)

(assert (=> b!9562 m!6019))

(declare-fun m!6021 () Bool)

(assert (=> b!9563 m!6021))

(declare-fun m!6023 () Bool)

(assert (=> b!9563 m!6023))

(declare-fun m!6025 () Bool)

(assert (=> b!9563 m!6025))

(declare-fun m!6027 () Bool)

(assert (=> b!9553 m!6027))

(declare-fun m!6029 () Bool)

(assert (=> mapNonEmpty!671 m!6029))

(declare-fun m!6031 () Bool)

(assert (=> start!1078 m!6031))

(declare-fun m!6033 () Bool)

(assert (=> start!1078 m!6033))

(declare-fun m!6035 () Bool)

(assert (=> start!1078 m!6035))

(declare-fun m!6037 () Bool)

(assert (=> b!9555 m!6037))

(declare-fun m!6039 () Bool)

(assert (=> b!9558 m!6039))

(declare-fun m!6041 () Bool)

(assert (=> b!9558 m!6041))

(declare-fun m!6043 () Bool)

(assert (=> b!9568 m!6043))

(declare-fun m!6045 () Bool)

(assert (=> b!9566 m!6045))

(assert (=> b!9566 m!6045))

(declare-fun m!6047 () Bool)

(assert (=> b!9566 m!6047))

(assert (=> b!9559 m!6015))

(declare-fun m!6049 () Bool)

(assert (=> b!9557 m!6049))

(check-sat tp_is_empty!459 b_and!535 (not b!9553) (not b!9559) (not b_next!381) (not b!9555) (not mapNonEmpty!671) (not start!1078) (not b!9568) (not b!9557) (not b!9562) (not b!9563) (not b!9554) (not b!9558) (not b!9566))
(check-sat b_and!535 (not b_next!381))
(get-model)

(declare-fun b!9629 () Bool)

(declare-fun e!5509 () SeekEntryResult!35)

(declare-fun e!5508 () SeekEntryResult!35)

(assert (=> b!9629 (= e!5509 e!5508)))

(declare-fun lt!2189 () (_ BitVec 64))

(declare-fun lt!2187 () SeekEntryResult!35)

(assert (=> b!9629 (= lt!2189 (select (arr!409 _keys!1806) (index!2261 lt!2187)))))

(declare-fun c!774 () Bool)

(assert (=> b!9629 (= c!774 (= lt!2189 k0!1278))))

(declare-fun b!9630 () Bool)

(declare-fun e!5510 () SeekEntryResult!35)

(assert (=> b!9630 (= e!5510 (MissingZero!35 (index!2261 lt!2187)))))

(declare-fun d!925 () Bool)

(declare-fun lt!2190 () SeekEntryResult!35)

(assert (=> d!925 (and (or ((_ is MissingVacant!35) lt!2190) (not ((_ is Found!35) lt!2190)) (and (bvsge (index!2260 lt!2190) #b00000000000000000000000000000000) (bvslt (index!2260 lt!2190) (size!471 _keys!1806)))) (not ((_ is MissingVacant!35) lt!2190)) (or (not ((_ is Found!35) lt!2190)) (= (select (arr!409 _keys!1806) (index!2260 lt!2190)) k0!1278)))))

(assert (=> d!925 (= lt!2190 e!5509)))

(declare-fun c!772 () Bool)

(assert (=> d!925 (= c!772 (and ((_ is Intermediate!35) lt!2187) (undefined!847 lt!2187)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!849 (_ BitVec 32)) SeekEntryResult!35)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!925 (= lt!2187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!925 (validMask!0 mask!2250)))

(assert (=> d!925 (= (seekEntry!0 k0!1278 _keys!1806 mask!2250) lt!2190)))

(declare-fun b!9631 () Bool)

(declare-fun lt!2188 () SeekEntryResult!35)

(assert (=> b!9631 (= e!5510 (ite ((_ is MissingVacant!35) lt!2188) (MissingZero!35 (index!2262 lt!2188)) lt!2188))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!849 (_ BitVec 32)) SeekEntryResult!35)

(assert (=> b!9631 (= lt!2188 (seekKeyOrZeroReturnVacant!0 (x!2797 lt!2187) (index!2261 lt!2187) (index!2261 lt!2187) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9632 () Bool)

(assert (=> b!9632 (= e!5509 Undefined!35)))

(declare-fun b!9633 () Bool)

(assert (=> b!9633 (= e!5508 (Found!35 (index!2261 lt!2187)))))

(declare-fun b!9634 () Bool)

(declare-fun c!773 () Bool)

(assert (=> b!9634 (= c!773 (= lt!2189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!9634 (= e!5508 e!5510)))

(assert (= (and d!925 c!772) b!9632))

(assert (= (and d!925 (not c!772)) b!9629))

(assert (= (and b!9629 c!774) b!9633))

(assert (= (and b!9629 (not c!774)) b!9634))

(assert (= (and b!9634 c!773) b!9630))

(assert (= (and b!9634 (not c!773)) b!9631))

(declare-fun m!6087 () Bool)

(assert (=> b!9629 m!6087))

(declare-fun m!6089 () Bool)

(assert (=> d!925 m!6089))

(declare-fun m!6091 () Bool)

(assert (=> d!925 m!6091))

(assert (=> d!925 m!6091))

(declare-fun m!6093 () Bool)

(assert (=> d!925 m!6093))

(assert (=> d!925 m!6031))

(declare-fun m!6095 () Bool)

(assert (=> b!9631 m!6095))

(assert (=> b!9558 d!925))

(declare-fun d!927 () Bool)

(declare-fun lt!2196 () SeekEntryResult!35)

(assert (=> d!927 (and ((_ is Found!35) lt!2196) (= (index!2260 lt!2196) lt!2162))))

(assert (=> d!927 (= lt!2196 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!2195 () Unit!195)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!849 (_ BitVec 32)) Unit!195)

(assert (=> d!927 (= lt!2195 (choose!0 k0!1278 lt!2162 _keys!1806 mask!2250))))

(assert (=> d!927 (validMask!0 mask!2250)))

(assert (=> d!927 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2162 _keys!1806 mask!2250) lt!2195)))

(declare-fun bs!332 () Bool)

(assert (= bs!332 d!927))

(assert (=> bs!332 m!6039))

(declare-fun m!6097 () Bool)

(assert (=> bs!332 m!6097))

(assert (=> bs!332 m!6031))

(assert (=> b!9558 d!927))

(declare-fun b!9647 () Bool)

(declare-fun e!5517 () SeekEntryResult!35)

(declare-fun lt!2205 () SeekEntryResult!35)

(assert (=> b!9647 (= e!5517 (MissingZero!35 (index!2261 lt!2205)))))

(declare-fun b!9648 () Bool)

(declare-fun c!783 () Bool)

(declare-fun lt!2203 () (_ BitVec 64))

(assert (=> b!9648 (= c!783 (= lt!2203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5519 () SeekEntryResult!35)

(assert (=> b!9648 (= e!5519 e!5517)))

(declare-fun b!9649 () Bool)

(assert (=> b!9649 (= e!5517 (seekKeyOrZeroReturnVacant!0 (x!2797 lt!2205) (index!2261 lt!2205) (index!2261 lt!2205) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9651 () Bool)

(declare-fun e!5518 () SeekEntryResult!35)

(assert (=> b!9651 (= e!5518 Undefined!35)))

(declare-fun b!9652 () Bool)

(assert (=> b!9652 (= e!5519 (Found!35 (index!2261 lt!2205)))))

(declare-fun b!9650 () Bool)

(assert (=> b!9650 (= e!5518 e!5519)))

(assert (=> b!9650 (= lt!2203 (select (arr!409 _keys!1806) (index!2261 lt!2205)))))

(declare-fun c!782 () Bool)

(assert (=> b!9650 (= c!782 (= lt!2203 k0!1278))))

(declare-fun d!929 () Bool)

(declare-fun lt!2204 () SeekEntryResult!35)

(assert (=> d!929 (and (or ((_ is Undefined!35) lt!2204) (not ((_ is Found!35) lt!2204)) (and (bvsge (index!2260 lt!2204) #b00000000000000000000000000000000) (bvslt (index!2260 lt!2204) (size!471 _keys!1806)))) (or ((_ is Undefined!35) lt!2204) ((_ is Found!35) lt!2204) (not ((_ is MissingZero!35) lt!2204)) (and (bvsge (index!2259 lt!2204) #b00000000000000000000000000000000) (bvslt (index!2259 lt!2204) (size!471 _keys!1806)))) (or ((_ is Undefined!35) lt!2204) ((_ is Found!35) lt!2204) ((_ is MissingZero!35) lt!2204) (not ((_ is MissingVacant!35) lt!2204)) (and (bvsge (index!2262 lt!2204) #b00000000000000000000000000000000) (bvslt (index!2262 lt!2204) (size!471 _keys!1806)))) (or ((_ is Undefined!35) lt!2204) (ite ((_ is Found!35) lt!2204) (= (select (arr!409 _keys!1806) (index!2260 lt!2204)) k0!1278) (ite ((_ is MissingZero!35) lt!2204) (= (select (arr!409 _keys!1806) (index!2259 lt!2204)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!35) lt!2204) (= (select (arr!409 _keys!1806) (index!2262 lt!2204)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!929 (= lt!2204 e!5518)))

(declare-fun c!781 () Bool)

(assert (=> d!929 (= c!781 (and ((_ is Intermediate!35) lt!2205) (undefined!847 lt!2205)))))

(assert (=> d!929 (= lt!2205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!929 (validMask!0 mask!2250)))

(assert (=> d!929 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) lt!2204)))

(assert (= (and d!929 c!781) b!9651))

(assert (= (and d!929 (not c!781)) b!9650))

(assert (= (and b!9650 c!782) b!9652))

(assert (= (and b!9650 (not c!782)) b!9648))

(assert (= (and b!9648 c!783) b!9647))

(assert (= (and b!9648 (not c!783)) b!9649))

(declare-fun m!6099 () Bool)

(assert (=> b!9649 m!6099))

(declare-fun m!6101 () Bool)

(assert (=> b!9650 m!6101))

(assert (=> d!929 m!6091))

(assert (=> d!929 m!6031))

(declare-fun m!6103 () Bool)

(assert (=> d!929 m!6103))

(declare-fun m!6105 () Bool)

(assert (=> d!929 m!6105))

(declare-fun m!6107 () Bool)

(assert (=> d!929 m!6107))

(assert (=> d!929 m!6091))

(assert (=> d!929 m!6093))

(assert (=> b!9557 d!929))

(declare-fun d!931 () Bool)

(declare-fun res!8612 () Bool)

(declare-fun e!5524 () Bool)

(assert (=> d!931 (=> res!8612 e!5524)))

(assert (=> d!931 (= res!8612 (= (select (arr!409 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!931 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!5524)))

(declare-fun b!9657 () Bool)

(declare-fun e!5525 () Bool)

(assert (=> b!9657 (= e!5524 e!5525)))

(declare-fun res!8613 () Bool)

(assert (=> b!9657 (=> (not res!8613) (not e!5525))))

(assert (=> b!9657 (= res!8613 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!471 _keys!1806)))))

(declare-fun b!9658 () Bool)

(assert (=> b!9658 (= e!5525 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!931 (not res!8612)) b!9657))

(assert (= (and b!9657 res!8613) b!9658))

(declare-fun m!6109 () Bool)

(assert (=> d!931 m!6109))

(declare-fun m!6111 () Bool)

(assert (=> b!9658 m!6111))

(assert (=> b!9559 d!931))

(declare-fun d!933 () Bool)

(assert (=> d!933 (= (inRange!0 (index!2260 lt!2160) mask!2250) (and (bvsge (index!2260 lt!2160) #b00000000000000000000000000000000) (bvslt (index!2260 lt!2160) (bvadd mask!2250 #b00000000000000000000000000000001))))))

(assert (=> b!9568 d!933))

(declare-fun d!935 () Bool)

(assert (=> d!935 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!1078 d!935))

(declare-fun d!937 () Bool)

(assert (=> d!937 (= (array_inv!297 _values!1492) (bvsge (size!472 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!1078 d!937))

(declare-fun d!939 () Bool)

(assert (=> d!939 (= (array_inv!298 _keys!1806) (bvsge (size!471 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!1078 d!939))

(declare-fun d!941 () Bool)

(assert (=> d!941 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9562 d!941))

(declare-fun b!9667 () Bool)

(declare-fun e!5534 () Bool)

(declare-fun e!5532 () Bool)

(assert (=> b!9667 (= e!5534 e!5532)))

(declare-fun c!786 () Bool)

(assert (=> b!9667 (= c!786 (validKeyInArray!0 (select (arr!409 _keys!1806) lt!2162)))))

(declare-fun b!9668 () Bool)

(declare-fun e!5533 () Bool)

(declare-fun call!267 () Bool)

(assert (=> b!9668 (= e!5533 call!267)))

(declare-fun b!9669 () Bool)

(assert (=> b!9669 (= e!5532 e!5533)))

(declare-fun lt!2213 () (_ BitVec 64))

(assert (=> b!9669 (= lt!2213 (select (arr!409 _keys!1806) lt!2162))))

(declare-fun lt!2214 () Unit!195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!849 (_ BitVec 64) (_ BitVec 32)) Unit!195)

(assert (=> b!9669 (= lt!2214 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2213 lt!2162))))

(assert (=> b!9669 (arrayContainsKey!0 _keys!1806 lt!2213 #b00000000000000000000000000000000)))

(declare-fun lt!2212 () Unit!195)

(assert (=> b!9669 (= lt!2212 lt!2214)))

(declare-fun res!8619 () Bool)

(assert (=> b!9669 (= res!8619 (= (seekEntryOrOpen!0 (select (arr!409 _keys!1806) lt!2162) _keys!1806 mask!2250) (Found!35 lt!2162)))))

(assert (=> b!9669 (=> (not res!8619) (not e!5533))))

(declare-fun d!943 () Bool)

(declare-fun res!8618 () Bool)

(assert (=> d!943 (=> res!8618 e!5534)))

(assert (=> d!943 (= res!8618 (bvsge lt!2162 (size!471 _keys!1806)))))

(assert (=> d!943 (= (arrayForallSeekEntryOrOpenFound!0 lt!2162 _keys!1806 mask!2250) e!5534)))

(declare-fun b!9670 () Bool)

(assert (=> b!9670 (= e!5532 call!267)))

(declare-fun bm!264 () Bool)

(assert (=> bm!264 (= call!267 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!2162 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(assert (= (and d!943 (not res!8618)) b!9667))

(assert (= (and b!9667 c!786) b!9669))

(assert (= (and b!9667 (not c!786)) b!9670))

(assert (= (and b!9669 res!8619) b!9668))

(assert (= (or b!9668 b!9670) bm!264))

(declare-fun m!6113 () Bool)

(assert (=> b!9667 m!6113))

(assert (=> b!9667 m!6113))

(declare-fun m!6115 () Bool)

(assert (=> b!9667 m!6115))

(assert (=> b!9669 m!6113))

(declare-fun m!6117 () Bool)

(assert (=> b!9669 m!6117))

(declare-fun m!6119 () Bool)

(assert (=> b!9669 m!6119))

(assert (=> b!9669 m!6113))

(declare-fun m!6121 () Bool)

(assert (=> b!9669 m!6121))

(declare-fun m!6123 () Bool)

(assert (=> bm!264 m!6123))

(assert (=> b!9563 d!943))

(declare-fun d!945 () Bool)

(assert (=> d!945 (arrayForallSeekEntryOrOpenFound!0 lt!2162 _keys!1806 mask!2250)))

(declare-fun lt!2217 () Unit!195)

(declare-fun choose!38 (array!849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!195)

(assert (=> d!945 (= lt!2217 (choose!38 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2162))))

(assert (=> d!945 (validMask!0 mask!2250)))

(assert (=> d!945 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2162) lt!2217)))

(declare-fun bs!333 () Bool)

(assert (= bs!333 d!945))

(assert (=> bs!333 m!6021))

(declare-fun m!6125 () Bool)

(assert (=> bs!333 m!6125))

(assert (=> bs!333 m!6031))

(assert (=> b!9563 d!945))

(declare-fun d!947 () Bool)

(declare-fun lt!2220 () (_ BitVec 32))

(assert (=> d!947 (and (or (bvslt lt!2220 #b00000000000000000000000000000000) (bvsge lt!2220 (size!471 _keys!1806)) (and (bvsge lt!2220 #b00000000000000000000000000000000) (bvslt lt!2220 (size!471 _keys!1806)))) (bvsge lt!2220 #b00000000000000000000000000000000) (bvslt lt!2220 (size!471 _keys!1806)) (= (select (arr!409 _keys!1806) lt!2220) k0!1278))))

(declare-fun e!5537 () (_ BitVec 32))

(assert (=> d!947 (= lt!2220 e!5537)))

(declare-fun c!789 () Bool)

(assert (=> d!947 (= c!789 (= (select (arr!409 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!471 _keys!1806)) (bvslt (size!471 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!947 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!2220)))

(declare-fun b!9675 () Bool)

(assert (=> b!9675 (= e!5537 #b00000000000000000000000000000000)))

(declare-fun b!9676 () Bool)

(assert (=> b!9676 (= e!5537 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!947 c!789) b!9675))

(assert (= (and d!947 (not c!789)) b!9676))

(declare-fun m!6127 () Bool)

(assert (=> d!947 m!6127))

(assert (=> d!947 m!6109))

(declare-fun m!6129 () Bool)

(assert (=> b!9676 m!6129))

(assert (=> b!9563 d!947))

(assert (=> b!9554 d!931))

(declare-fun d!949 () Bool)

(declare-fun e!5540 () Bool)

(assert (=> d!949 e!5540))

(declare-fun c!792 () Bool)

(assert (=> d!949 (= c!792 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2223 () Unit!195)

(declare-fun choose!142 (array!849 array!851 (_ BitVec 32) (_ BitVec 32) V!789 V!789 (_ BitVec 64) Int) Unit!195)

(assert (=> d!949 (= lt!2223 (choose!142 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!949 (validMask!0 mask!2250)))

(assert (=> d!949 (= (lemmaKeyInListMapIsInArray!73 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!2223)))

(declare-fun b!9681 () Bool)

(assert (=> b!9681 (= e!5540 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9682 () Bool)

(assert (=> b!9682 (= e!5540 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!949 c!792) b!9681))

(assert (= (and d!949 (not c!792)) b!9682))

(declare-fun m!6131 () Bool)

(assert (=> d!949 m!6131))

(assert (=> d!949 m!6031))

(assert (=> b!9681 m!6015))

(assert (=> b!9554 d!949))

(declare-fun b!9683 () Bool)

(declare-fun e!5543 () Bool)

(declare-fun e!5541 () Bool)

(assert (=> b!9683 (= e!5543 e!5541)))

(declare-fun c!793 () Bool)

(assert (=> b!9683 (= c!793 (validKeyInArray!0 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9684 () Bool)

(declare-fun e!5542 () Bool)

(declare-fun call!268 () Bool)

(assert (=> b!9684 (= e!5542 call!268)))

(declare-fun b!9685 () Bool)

(assert (=> b!9685 (= e!5541 e!5542)))

(declare-fun lt!2225 () (_ BitVec 64))

(assert (=> b!9685 (= lt!2225 (select (arr!409 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2226 () Unit!195)

(assert (=> b!9685 (= lt!2226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2225 #b00000000000000000000000000000000))))

(assert (=> b!9685 (arrayContainsKey!0 _keys!1806 lt!2225 #b00000000000000000000000000000000)))

(declare-fun lt!2224 () Unit!195)

(assert (=> b!9685 (= lt!2224 lt!2226)))

(declare-fun res!8621 () Bool)

(assert (=> b!9685 (= res!8621 (= (seekEntryOrOpen!0 (select (arr!409 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!35 #b00000000000000000000000000000000)))))

(assert (=> b!9685 (=> (not res!8621) (not e!5542))))

(declare-fun d!951 () Bool)

(declare-fun res!8620 () Bool)

(assert (=> d!951 (=> res!8620 e!5543)))

(assert (=> d!951 (= res!8620 (bvsge #b00000000000000000000000000000000 (size!471 _keys!1806)))))

(assert (=> d!951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!5543)))

(declare-fun b!9686 () Bool)

(assert (=> b!9686 (= e!5541 call!268)))

(declare-fun bm!265 () Bool)

(assert (=> bm!265 (= call!268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(assert (= (and d!951 (not res!8620)) b!9683))

(assert (= (and b!9683 c!793) b!9685))

(assert (= (and b!9683 (not c!793)) b!9686))

(assert (= (and b!9685 res!8621) b!9684))

(assert (= (or b!9684 b!9686) bm!265))

(assert (=> b!9683 m!6109))

(assert (=> b!9683 m!6109))

(declare-fun m!6133 () Bool)

(assert (=> b!9683 m!6133))

(assert (=> b!9685 m!6109))

(declare-fun m!6135 () Bool)

(assert (=> b!9685 m!6135))

(declare-fun m!6137 () Bool)

(assert (=> b!9685 m!6137))

(assert (=> b!9685 m!6109))

(declare-fun m!6139 () Bool)

(assert (=> b!9685 m!6139))

(declare-fun m!6141 () Bool)

(assert (=> bm!265 m!6141))

(assert (=> b!9553 d!951))

(declare-fun bm!268 () Bool)

(declare-fun call!271 () Bool)

(declare-fun c!796 () Bool)

(assert (=> bm!268 (= call!271 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!796 (Cons!280 (select (arr!409 _keys!1806) #b00000000000000000000000000000000) Nil!281) Nil!281)))))

(declare-fun b!9697 () Bool)

(declare-fun e!5552 () Bool)

(assert (=> b!9697 (= e!5552 call!271)))

(declare-fun d!953 () Bool)

(declare-fun res!8630 () Bool)

(declare-fun e!5555 () Bool)

(assert (=> d!953 (=> res!8630 e!5555)))

(assert (=> d!953 (= res!8630 (bvsge #b00000000000000000000000000000000 (size!471 _keys!1806)))))

(assert (=> d!953 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!281) e!5555)))

(declare-fun b!9698 () Bool)

(declare-fun e!5554 () Bool)

(assert (=> b!9698 (= e!5554 e!5552)))

(assert (=> b!9698 (= c!796 (validKeyInArray!0 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9699 () Bool)

(assert (=> b!9699 (= e!5552 call!271)))

(declare-fun b!9700 () Bool)

(assert (=> b!9700 (= e!5555 e!5554)))

(declare-fun res!8629 () Bool)

(assert (=> b!9700 (=> (not res!8629) (not e!5554))))

(declare-fun e!5553 () Bool)

(assert (=> b!9700 (= res!8629 (not e!5553))))

(declare-fun res!8628 () Bool)

(assert (=> b!9700 (=> (not res!8628) (not e!5553))))

(assert (=> b!9700 (= res!8628 (validKeyInArray!0 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9701 () Bool)

(declare-fun contains!134 (List!284 (_ BitVec 64)) Bool)

(assert (=> b!9701 (= e!5553 (contains!134 Nil!281 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!953 (not res!8630)) b!9700))

(assert (= (and b!9700 res!8628) b!9701))

(assert (= (and b!9700 res!8629) b!9698))

(assert (= (and b!9698 c!796) b!9697))

(assert (= (and b!9698 (not c!796)) b!9699))

(assert (= (or b!9697 b!9699) bm!268))

(assert (=> bm!268 m!6109))

(declare-fun m!6143 () Bool)

(assert (=> bm!268 m!6143))

(assert (=> b!9698 m!6109))

(assert (=> b!9698 m!6109))

(assert (=> b!9698 m!6133))

(assert (=> b!9700 m!6109))

(assert (=> b!9700 m!6109))

(assert (=> b!9700 m!6133))

(assert (=> b!9701 m!6109))

(assert (=> b!9701 m!6109))

(declare-fun m!6145 () Bool)

(assert (=> b!9701 m!6145))

(assert (=> b!9555 d!953))

(declare-fun d!955 () Bool)

(declare-fun e!5561 () Bool)

(assert (=> d!955 e!5561))

(declare-fun res!8633 () Bool)

(assert (=> d!955 (=> res!8633 e!5561)))

(declare-fun lt!2237 () Bool)

(assert (=> d!955 (= res!8633 (not lt!2237))))

(declare-fun lt!2235 () Bool)

(assert (=> d!955 (= lt!2237 lt!2235)))

(declare-fun lt!2236 () Unit!195)

(declare-fun e!5560 () Unit!195)

(assert (=> d!955 (= lt!2236 e!5560)))

(declare-fun c!799 () Bool)

(assert (=> d!955 (= c!799 lt!2235)))

(declare-fun containsKey!9 (List!285 (_ BitVec 64)) Bool)

(assert (=> d!955 (= lt!2235 (containsKey!9 (toList!154 (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!955 (= (contains!132 (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!2237)))

(declare-fun b!9708 () Bool)

(declare-fun lt!2238 () Unit!195)

(assert (=> b!9708 (= e!5560 lt!2238)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!9 (List!285 (_ BitVec 64)) Unit!195)

(assert (=> b!9708 (= lt!2238 (lemmaContainsKeyImpliesGetValueByKeyDefined!9 (toList!154 (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!21 0))(
  ( (Some!20 (v!1332 V!789)) (None!19) )
))
(declare-fun isDefined!10 (Option!21) Bool)

(declare-fun getValueByKey!15 (List!285 (_ BitVec 64)) Option!21)

(assert (=> b!9708 (isDefined!10 (getValueByKey!15 (toList!154 (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!9709 () Bool)

(declare-fun Unit!197 () Unit!195)

(assert (=> b!9709 (= e!5560 Unit!197)))

(declare-fun b!9710 () Bool)

(assert (=> b!9710 (= e!5561 (isDefined!10 (getValueByKey!15 (toList!154 (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!955 c!799) b!9708))

(assert (= (and d!955 (not c!799)) b!9709))

(assert (= (and d!955 (not res!8633)) b!9710))

(declare-fun m!6147 () Bool)

(assert (=> d!955 m!6147))

(declare-fun m!6149 () Bool)

(assert (=> b!9708 m!6149))

(declare-fun m!6151 () Bool)

(assert (=> b!9708 m!6151))

(assert (=> b!9708 m!6151))

(declare-fun m!6153 () Bool)

(assert (=> b!9708 m!6153))

(assert (=> b!9710 m!6151))

(assert (=> b!9710 m!6151))

(assert (=> b!9710 m!6153))

(assert (=> b!9566 d!955))

(declare-fun bm!283 () Bool)

(declare-fun call!286 () ListLongMap!277)

(declare-fun getCurrentListMapNoExtraKeys!9 (array!849 array!851 (_ BitVec 32) (_ BitVec 32) V!789 V!789 (_ BitVec 32) Int) ListLongMap!277)

(assert (=> bm!283 (= call!286 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!284 () Bool)

(declare-fun call!291 () Bool)

(declare-fun lt!2287 () ListLongMap!277)

(assert (=> bm!284 (= call!291 (contains!132 lt!2287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9753 () Bool)

(declare-fun e!5591 () ListLongMap!277)

(declare-fun call!289 () ListLongMap!277)

(assert (=> b!9753 (= e!5591 call!289)))

(declare-fun d!957 () Bool)

(declare-fun e!5597 () Bool)

(assert (=> d!957 e!5597))

(declare-fun res!8658 () Bool)

(assert (=> d!957 (=> (not res!8658) (not e!5597))))

(assert (=> d!957 (= res!8658 (or (bvsge #b00000000000000000000000000000000 (size!471 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!471 _keys!1806)))))))

(declare-fun lt!2290 () ListLongMap!277)

(assert (=> d!957 (= lt!2287 lt!2290)))

(declare-fun lt!2297 () Unit!195)

(declare-fun e!5594 () Unit!195)

(assert (=> d!957 (= lt!2297 e!5594)))

(declare-fun c!814 () Bool)

(declare-fun e!5596 () Bool)

(assert (=> d!957 (= c!814 e!5596)))

(declare-fun res!8660 () Bool)

(assert (=> d!957 (=> (not res!8660) (not e!5596))))

(assert (=> d!957 (= res!8660 (bvslt #b00000000000000000000000000000000 (size!471 _keys!1806)))))

(declare-fun e!5588 () ListLongMap!277)

(assert (=> d!957 (= lt!2290 e!5588)))

(declare-fun c!816 () Bool)

(assert (=> d!957 (= c!816 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!957 (validMask!0 mask!2250)))

(assert (=> d!957 (= (getCurrentListMap!113 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!2287)))

(declare-fun b!9754 () Bool)

(declare-fun e!5595 () Bool)

(declare-fun e!5600 () Bool)

(assert (=> b!9754 (= e!5595 e!5600)))

(declare-fun res!8654 () Bool)

(assert (=> b!9754 (= res!8654 call!291)))

(assert (=> b!9754 (=> (not res!8654) (not e!5600))))

(declare-fun bm!285 () Bool)

(declare-fun call!288 () ListLongMap!277)

(declare-fun call!290 () ListLongMap!277)

(assert (=> bm!285 (= call!288 call!290)))

(declare-fun b!9755 () Bool)

(declare-fun Unit!198 () Unit!195)

(assert (=> b!9755 (= e!5594 Unit!198)))

(declare-fun b!9756 () Bool)

(assert (=> b!9756 (= e!5596 (validKeyInArray!0 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9757 () Bool)

(declare-fun lt!2302 () Unit!195)

(assert (=> b!9757 (= e!5594 lt!2302)))

(declare-fun lt!2293 () ListLongMap!277)

(assert (=> b!9757 (= lt!2293 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2295 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2289 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2289 (select (arr!409 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2300 () Unit!195)

(declare-fun addStillContains!10 (ListLongMap!277 (_ BitVec 64) V!789 (_ BitVec 64)) Unit!195)

(assert (=> b!9757 (= lt!2300 (addStillContains!10 lt!2293 lt!2295 zeroValue!1434 lt!2289))))

(declare-fun +!12 (ListLongMap!277 tuple2!272) ListLongMap!277)

(assert (=> b!9757 (contains!132 (+!12 lt!2293 (tuple2!273 lt!2295 zeroValue!1434)) lt!2289)))

(declare-fun lt!2292 () Unit!195)

(assert (=> b!9757 (= lt!2292 lt!2300)))

(declare-fun lt!2291 () ListLongMap!277)

(assert (=> b!9757 (= lt!2291 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2288 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2288 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2301 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2301 (select (arr!409 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2299 () Unit!195)

(declare-fun addApplyDifferent!10 (ListLongMap!277 (_ BitVec 64) V!789 (_ BitVec 64)) Unit!195)

(assert (=> b!9757 (= lt!2299 (addApplyDifferent!10 lt!2291 lt!2288 minValue!1434 lt!2301))))

(declare-fun apply!25 (ListLongMap!277 (_ BitVec 64)) V!789)

(assert (=> b!9757 (= (apply!25 (+!12 lt!2291 (tuple2!273 lt!2288 minValue!1434)) lt!2301) (apply!25 lt!2291 lt!2301))))

(declare-fun lt!2296 () Unit!195)

(assert (=> b!9757 (= lt!2296 lt!2299)))

(declare-fun lt!2303 () ListLongMap!277)

(assert (=> b!9757 (= lt!2303 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2298 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2283 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2283 (select (arr!409 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2284 () Unit!195)

(assert (=> b!9757 (= lt!2284 (addApplyDifferent!10 lt!2303 lt!2298 zeroValue!1434 lt!2283))))

(assert (=> b!9757 (= (apply!25 (+!12 lt!2303 (tuple2!273 lt!2298 zeroValue!1434)) lt!2283) (apply!25 lt!2303 lt!2283))))

(declare-fun lt!2304 () Unit!195)

(assert (=> b!9757 (= lt!2304 lt!2284)))

(declare-fun lt!2286 () ListLongMap!277)

(assert (=> b!9757 (= lt!2286 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2285 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2285 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2294 () (_ BitVec 64))

(assert (=> b!9757 (= lt!2294 (select (arr!409 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!9757 (= lt!2302 (addApplyDifferent!10 lt!2286 lt!2285 minValue!1434 lt!2294))))

(assert (=> b!9757 (= (apply!25 (+!12 lt!2286 (tuple2!273 lt!2285 minValue!1434)) lt!2294) (apply!25 lt!2286 lt!2294))))

(declare-fun b!9758 () Bool)

(declare-fun res!8652 () Bool)

(assert (=> b!9758 (=> (not res!8652) (not e!5597))))

(declare-fun e!5599 () Bool)

(assert (=> b!9758 (= res!8652 e!5599)))

(declare-fun res!8653 () Bool)

(assert (=> b!9758 (=> res!8653 e!5599)))

(declare-fun e!5589 () Bool)

(assert (=> b!9758 (= res!8653 (not e!5589))))

(declare-fun res!8656 () Bool)

(assert (=> b!9758 (=> (not res!8656) (not e!5589))))

(assert (=> b!9758 (= res!8656 (bvslt #b00000000000000000000000000000000 (size!471 _keys!1806)))))

(declare-fun b!9759 () Bool)

(declare-fun c!815 () Bool)

(assert (=> b!9759 (= c!815 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!5590 () ListLongMap!277)

(assert (=> b!9759 (= e!5590 e!5591)))

(declare-fun b!9760 () Bool)

(declare-fun call!287 () ListLongMap!277)

(assert (=> b!9760 (= e!5588 (+!12 call!287 (tuple2!273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun bm!286 () Bool)

(declare-fun call!292 () Bool)

(assert (=> bm!286 (= call!292 (contains!132 lt!2287 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9761 () Bool)

(assert (=> b!9761 (= e!5590 call!289)))

(declare-fun bm!287 () Bool)

(assert (=> bm!287 (= call!289 call!287)))

(declare-fun bm!288 () Bool)

(declare-fun c!812 () Bool)

(assert (=> bm!288 (= call!287 (+!12 (ite c!816 call!286 (ite c!812 call!290 call!288)) (ite (or c!816 c!812) (tuple2!273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!9762 () Bool)

(declare-fun res!8657 () Bool)

(assert (=> b!9762 (=> (not res!8657) (not e!5597))))

(assert (=> b!9762 (= res!8657 e!5595)))

(declare-fun c!817 () Bool)

(assert (=> b!9762 (= c!817 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!9763 () Bool)

(assert (=> b!9763 (= e!5591 call!288)))

(declare-fun b!9764 () Bool)

(declare-fun e!5598 () Bool)

(assert (=> b!9764 (= e!5598 (not call!292))))

(declare-fun b!9765 () Bool)

(assert (=> b!9765 (= e!5600 (= (apply!25 lt!2287 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!9766 () Bool)

(declare-fun e!5592 () Bool)

(assert (=> b!9766 (= e!5592 (= (apply!25 lt!2287 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!9767 () Bool)

(assert (=> b!9767 (= e!5588 e!5590)))

(assert (=> b!9767 (= c!812 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9768 () Bool)

(assert (=> b!9768 (= e!5595 (not call!291))))

(declare-fun b!9769 () Bool)

(assert (=> b!9769 (= e!5589 (validKeyInArray!0 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9770 () Bool)

(assert (=> b!9770 (= e!5598 e!5592)))

(declare-fun res!8655 () Bool)

(assert (=> b!9770 (= res!8655 call!292)))

(assert (=> b!9770 (=> (not res!8655) (not e!5592))))

(declare-fun b!9771 () Bool)

(assert (=> b!9771 (= e!5597 e!5598)))

(declare-fun c!813 () Bool)

(assert (=> b!9771 (= c!813 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9772 () Bool)

(declare-fun e!5593 () Bool)

(assert (=> b!9772 (= e!5599 e!5593)))

(declare-fun res!8659 () Bool)

(assert (=> b!9772 (=> (not res!8659) (not e!5593))))

(assert (=> b!9772 (= res!8659 (contains!132 lt!2287 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!9772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!471 _keys!1806)))))

(declare-fun bm!289 () Bool)

(assert (=> bm!289 (= call!290 call!286)))

(declare-fun b!9773 () Bool)

(declare-fun get!179 (ValueCell!213 V!789) V!789)

(declare-fun dynLambda!47 (Int (_ BitVec 64)) V!789)

(assert (=> b!9773 (= e!5593 (= (apply!25 lt!2287 (select (arr!409 _keys!1806) #b00000000000000000000000000000000)) (get!179 (select (arr!410 _values!1492) #b00000000000000000000000000000000) (dynLambda!47 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!472 _values!1492)))))

(assert (=> b!9773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!471 _keys!1806)))))

(assert (= (and d!957 c!816) b!9760))

(assert (= (and d!957 (not c!816)) b!9767))

(assert (= (and b!9767 c!812) b!9761))

(assert (= (and b!9767 (not c!812)) b!9759))

(assert (= (and b!9759 c!815) b!9753))

(assert (= (and b!9759 (not c!815)) b!9763))

(assert (= (or b!9753 b!9763) bm!285))

(assert (= (or b!9761 bm!285) bm!289))

(assert (= (or b!9761 b!9753) bm!287))

(assert (= (or b!9760 bm!289) bm!283))

(assert (= (or b!9760 bm!287) bm!288))

(assert (= (and d!957 res!8660) b!9756))

(assert (= (and d!957 c!814) b!9757))

(assert (= (and d!957 (not c!814)) b!9755))

(assert (= (and d!957 res!8658) b!9758))

(assert (= (and b!9758 res!8656) b!9769))

(assert (= (and b!9758 (not res!8653)) b!9772))

(assert (= (and b!9772 res!8659) b!9773))

(assert (= (and b!9758 res!8652) b!9762))

(assert (= (and b!9762 c!817) b!9754))

(assert (= (and b!9762 (not c!817)) b!9768))

(assert (= (and b!9754 res!8654) b!9765))

(assert (= (or b!9754 b!9768) bm!284))

(assert (= (and b!9762 res!8657) b!9771))

(assert (= (and b!9771 c!813) b!9770))

(assert (= (and b!9771 (not c!813)) b!9764))

(assert (= (and b!9770 res!8655) b!9766))

(assert (= (or b!9770 b!9764) bm!286))

(declare-fun b_lambda!351 () Bool)

(assert (=> (not b_lambda!351) (not b!9773)))

(declare-fun t!2432 () Bool)

(declare-fun tb!143 () Bool)

(assert (=> (and start!1078 (= defaultEntry!1495 defaultEntry!1495) t!2432) tb!143))

(declare-fun result!231 () Bool)

(assert (=> tb!143 (= result!231 tp_is_empty!459)))

(assert (=> b!9773 t!2432))

(declare-fun b_and!539 () Bool)

(assert (= b_and!535 (and (=> t!2432 result!231) b_and!539)))

(assert (=> d!957 m!6031))

(declare-fun m!6155 () Bool)

(assert (=> bm!284 m!6155))

(assert (=> b!9756 m!6109))

(assert (=> b!9756 m!6109))

(assert (=> b!9756 m!6133))

(declare-fun m!6157 () Bool)

(assert (=> b!9773 m!6157))

(assert (=> b!9773 m!6109))

(declare-fun m!6159 () Bool)

(assert (=> b!9773 m!6159))

(assert (=> b!9773 m!6157))

(declare-fun m!6161 () Bool)

(assert (=> b!9773 m!6161))

(assert (=> b!9773 m!6109))

(declare-fun m!6163 () Bool)

(assert (=> b!9773 m!6163))

(assert (=> b!9773 m!6159))

(declare-fun m!6165 () Bool)

(assert (=> bm!286 m!6165))

(declare-fun m!6167 () Bool)

(assert (=> b!9765 m!6167))

(assert (=> b!9772 m!6109))

(assert (=> b!9772 m!6109))

(declare-fun m!6169 () Bool)

(assert (=> b!9772 m!6169))

(assert (=> b!9769 m!6109))

(assert (=> b!9769 m!6109))

(assert (=> b!9769 m!6133))

(declare-fun m!6171 () Bool)

(assert (=> b!9766 m!6171))

(declare-fun m!6173 () Bool)

(assert (=> b!9757 m!6173))

(declare-fun m!6175 () Bool)

(assert (=> b!9757 m!6175))

(assert (=> b!9757 m!6109))

(declare-fun m!6177 () Bool)

(assert (=> b!9757 m!6177))

(declare-fun m!6179 () Bool)

(assert (=> b!9757 m!6179))

(declare-fun m!6181 () Bool)

(assert (=> b!9757 m!6181))

(declare-fun m!6183 () Bool)

(assert (=> b!9757 m!6183))

(declare-fun m!6185 () Bool)

(assert (=> b!9757 m!6185))

(declare-fun m!6187 () Bool)

(assert (=> b!9757 m!6187))

(assert (=> b!9757 m!6177))

(assert (=> b!9757 m!6173))

(declare-fun m!6189 () Bool)

(assert (=> b!9757 m!6189))

(assert (=> b!9757 m!6187))

(declare-fun m!6191 () Bool)

(assert (=> b!9757 m!6191))

(declare-fun m!6193 () Bool)

(assert (=> b!9757 m!6193))

(declare-fun m!6195 () Bool)

(assert (=> b!9757 m!6195))

(declare-fun m!6197 () Bool)

(assert (=> b!9757 m!6197))

(declare-fun m!6199 () Bool)

(assert (=> b!9757 m!6199))

(assert (=> b!9757 m!6193))

(declare-fun m!6201 () Bool)

(assert (=> b!9757 m!6201))

(declare-fun m!6203 () Bool)

(assert (=> b!9757 m!6203))

(declare-fun m!6205 () Bool)

(assert (=> bm!288 m!6205))

(assert (=> bm!283 m!6199))

(declare-fun m!6207 () Bool)

(assert (=> b!9760 m!6207))

(assert (=> b!9566 d!957))

(declare-fun b!9783 () Bool)

(declare-fun e!5606 () Bool)

(assert (=> b!9783 (= e!5606 tp_is_empty!459)))

(declare-fun mapNonEmpty!677 () Bool)

(declare-fun mapRes!677 () Bool)

(declare-fun tp!1394 () Bool)

(declare-fun e!5605 () Bool)

(assert (=> mapNonEmpty!677 (= mapRes!677 (and tp!1394 e!5605))))

(declare-fun mapValue!677 () ValueCell!213)

(declare-fun mapRest!677 () (Array (_ BitVec 32) ValueCell!213))

(declare-fun mapKey!677 () (_ BitVec 32))

(assert (=> mapNonEmpty!677 (= mapRest!671 (store mapRest!677 mapKey!677 mapValue!677))))

(declare-fun mapIsEmpty!677 () Bool)

(assert (=> mapIsEmpty!677 mapRes!677))

(declare-fun b!9782 () Bool)

(assert (=> b!9782 (= e!5605 tp_is_empty!459)))

(declare-fun condMapEmpty!677 () Bool)

(declare-fun mapDefault!677 () ValueCell!213)

(assert (=> mapNonEmpty!671 (= condMapEmpty!677 (= mapRest!671 ((as const (Array (_ BitVec 32) ValueCell!213)) mapDefault!677)))))

(assert (=> mapNonEmpty!671 (= tp!1384 (and e!5606 mapRes!677))))

(assert (= (and mapNonEmpty!671 condMapEmpty!677) mapIsEmpty!677))

(assert (= (and mapNonEmpty!671 (not condMapEmpty!677)) mapNonEmpty!677))

(assert (= (and mapNonEmpty!677 ((_ is ValueCellFull!213) mapValue!677)) b!9782))

(assert (= (and mapNonEmpty!671 ((_ is ValueCellFull!213) mapDefault!677)) b!9783))

(declare-fun m!6209 () Bool)

(assert (=> mapNonEmpty!677 m!6209))

(declare-fun b_lambda!353 () Bool)

(assert (= b_lambda!351 (or (and start!1078 b_free!381) b_lambda!353)))

(check-sat (not bm!286) (not b!9760) (not bm!283) (not b!9649) (not b!9681) (not d!957) (not d!949) (not b_next!381) (not b_lambda!353) (not b!9765) (not d!945) (not bm!264) (not b!9669) (not b!9708) (not b!9676) (not b!9701) (not b!9698) (not mapNonEmpty!677) (not b!9757) tp_is_empty!459 (not b!9766) (not b!9658) (not b!9685) (not b!9773) (not b!9700) (not d!955) (not b!9683) (not bm!288) (not d!925) (not b!9769) (not d!929) (not b!9756) (not bm!284) (not bm!265) (not b!9710) (not b!9772) (not b!9631) (not b!9667) (not bm!268) b_and!539 (not d!927))
(check-sat b_and!539 (not b_next!381))
