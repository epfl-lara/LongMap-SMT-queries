; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6462 () Bool)

(assert start!6462)

(declare-fun b_free!1497 () Bool)

(declare-fun b_next!1497 () Bool)

(assert (=> start!6462 (= b_free!1497 (not b_next!1497))))

(declare-fun tp!5933 () Bool)

(declare-fun b_and!2643 () Bool)

(assert (=> start!6462 (= tp!5933 b_and!2643)))

(declare-fun res!25530 () Bool)

(declare-fun e!27238 () Bool)

(assert (=> start!6462 (=> (not res!25530) (not e!27238))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6462 (= res!25530 (validMask!0 mask!853))))

(assert (=> start!6462 e!27238))

(assert (=> start!6462 true))

(assert (=> start!6462 tp!5933))

(declare-fun b!42972 () Bool)

(assert (=> b!42972 (= e!27238 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2303 0))(
  ( (V!2304 (val!982 Int)) )
))
(declare-datatypes ((tuple2!1618 0))(
  ( (tuple2!1619 (_1!820 (_ BitVec 64)) (_2!820 V!2303)) )
))
(declare-datatypes ((List!1192 0))(
  ( (Nil!1189) (Cons!1188 (h!1765 tuple2!1618) (t!4185 List!1192)) )
))
(declare-datatypes ((ListLongMap!1195 0))(
  ( (ListLongMap!1196 (toList!613 List!1192)) )
))
(declare-fun lt!18320 () ListLongMap!1195)

(declare-datatypes ((array!2919 0))(
  ( (array!2920 (arr!1403 (Array (_ BitVec 32) (_ BitVec 64))) (size!1588 (_ BitVec 32))) )
))
(declare-fun lt!18315 () array!2919)

(declare-fun lt!18317 () V!2303)

(declare-datatypes ((ValueCell!696 0))(
  ( (ValueCellFull!696 (v!2072 V!2303)) (EmptyCell!696) )
))
(declare-datatypes ((array!2921 0))(
  ( (array!2922 (arr!1404 (Array (_ BitVec 32) ValueCell!696)) (size!1589 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!372 0))(
  ( (LongMapFixedSize!373 (defaultEntry!1879 Int) (mask!5426 (_ BitVec 32)) (extraKeys!1770 (_ BitVec 32)) (zeroValue!1797 V!2303) (minValue!1797 V!2303) (_size!235 (_ BitVec 32)) (_keys!3428 array!2919) (_values!1862 array!2921) (_vacant!235 (_ BitVec 32))) )
))
(declare-fun map!828 (LongMapFixedSize!372) ListLongMap!1195)

(assert (=> b!42972 (= lt!18320 (map!828 (LongMapFixedSize!373 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18317 lt!18317 #b00000000000000000000000000000000 lt!18315 (array!2922 ((as const (Array (_ BitVec 32) ValueCell!696)) EmptyCell!696) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1193 0))(
  ( (Nil!1190) (Cons!1189 (h!1766 (_ BitVec 64)) (t!4186 List!1193)) )
))
(declare-fun arrayNoDuplicates!0 (array!2919 (_ BitVec 32) List!1193) Bool)

(assert (=> b!42972 (arrayNoDuplicates!0 lt!18315 #b00000000000000000000000000000000 Nil!1190)))

(declare-datatypes ((Unit!1193 0))(
  ( (Unit!1194) )
))
(declare-fun lt!18319 () Unit!1193)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2919 (_ BitVec 32) (_ BitVec 32) List!1193) Unit!1193)

(assert (=> b!42972 (= lt!18319 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18315 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2919 (_ BitVec 32)) Bool)

(assert (=> b!42972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18315 mask!853)))

(declare-fun lt!18316 () Unit!1193)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2919 (_ BitVec 32) (_ BitVec 32)) Unit!1193)

(assert (=> b!42972 (= lt!18316 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18315 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2919 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42972 (= (arrayCountValidKeys!0 lt!18315 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18318 () Unit!1193)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2919 (_ BitVec 32) (_ BitVec 32)) Unit!1193)

(assert (=> b!42972 (= lt!18318 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18315 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42972 (= lt!18315 (array!2920 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!257 (Int (_ BitVec 64)) V!2303)

(assert (=> b!42972 (= lt!18317 (dynLambda!257 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6462 res!25530) b!42972))

(declare-fun b_lambda!2239 () Bool)

(assert (=> (not b_lambda!2239) (not b!42972)))

(declare-fun t!4184 () Bool)

(declare-fun tb!979 () Bool)

(assert (=> (and start!6462 (= defaultEntry!470 defaultEntry!470) t!4184) tb!979))

(declare-fun result!1709 () Bool)

(declare-fun tp_is_empty!1887 () Bool)

(assert (=> tb!979 (= result!1709 tp_is_empty!1887)))

(assert (=> b!42972 t!4184))

(declare-fun b_and!2645 () Bool)

(assert (= b_and!2643 (and (=> t!4184 result!1709) b_and!2645)))

(declare-fun m!36851 () Bool)

(assert (=> start!6462 m!36851))

(declare-fun m!36853 () Bool)

(assert (=> b!42972 m!36853))

(declare-fun m!36855 () Bool)

(assert (=> b!42972 m!36855))

(declare-fun m!36857 () Bool)

(assert (=> b!42972 m!36857))

(declare-fun m!36859 () Bool)

(assert (=> b!42972 m!36859))

(declare-fun m!36861 () Bool)

(assert (=> b!42972 m!36861))

(declare-fun m!36863 () Bool)

(assert (=> b!42972 m!36863))

(declare-fun m!36865 () Bool)

(assert (=> b!42972 m!36865))

(declare-fun m!36867 () Bool)

(assert (=> b!42972 m!36867))

(check-sat (not b!42972) (not b_next!1497) (not b_lambda!2239) (not start!6462) tp_is_empty!1887 b_and!2645)
(check-sat b_and!2645 (not b_next!1497))
