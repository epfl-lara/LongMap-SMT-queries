; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97380 () Bool)

(assert start!97380)

(declare-fun b!1106411 () Bool)

(declare-fun e!631591 () Bool)

(declare-datatypes ((array!71737 0))(
  ( (array!71738 (arr!34516 (Array (_ BitVec 32) (_ BitVec 64))) (size!35053 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71737)

(assert (=> b!1106411 (= e!631591 (not (or (bvsge #b00000000000000000000000000000000 (size!35053 _keys!1208)) (bvslt (size!35053 _keys!1208) #b01111111111111111111111111111111))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106411 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36251 0))(
  ( (Unit!36252) )
))
(declare-fun lt!495760 () Unit!36251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71737 (_ BitVec 64) (_ BitVec 32)) Unit!36251)

(assert (=> b!1106411 (= lt!495760 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106412 () Bool)

(declare-fun res!737860 () Bool)

(declare-fun e!631588 () Bool)

(assert (=> b!1106412 (=> (not res!737860) (not e!631588))))

(assert (=> b!1106412 (= res!737860 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35053 _keys!1208))))))

(declare-fun b!1106413 () Bool)

(declare-fun e!631589 () Bool)

(declare-fun e!631590 () Bool)

(declare-fun mapRes!42901 () Bool)

(assert (=> b!1106413 (= e!631589 (and e!631590 mapRes!42901))))

(declare-fun condMapEmpty!42901 () Bool)

(declare-datatypes ((V!41649 0))(
  ( (V!41650 (val!13752 Int)) )
))
(declare-datatypes ((ValueCell!12986 0))(
  ( (ValueCellFull!12986 (v!16381 V!41649)) (EmptyCell!12986) )
))
(declare-datatypes ((array!71739 0))(
  ( (array!71740 (arr!34517 (Array (_ BitVec 32) ValueCell!12986)) (size!35054 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71739)

(declare-fun mapDefault!42901 () ValueCell!12986)

(assert (=> b!1106413 (= condMapEmpty!42901 (= (arr!34517 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12986)) mapDefault!42901)))))

(declare-fun b!1106414 () Bool)

(declare-fun res!737855 () Bool)

(assert (=> b!1106414 (=> (not res!737855) (not e!631588))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106414 (= res!737855 (validMask!0 mask!1564))))

(declare-fun b!1106415 () Bool)

(declare-fun res!737857 () Bool)

(assert (=> b!1106415 (=> (not res!737857) (not e!631588))))

(assert (=> b!1106415 (= res!737857 (= (select (arr!34516 _keys!1208) i!673) k0!934))))

(declare-fun res!737864 () Bool)

(assert (=> start!97380 (=> (not res!737864) (not e!631588))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97380 (= res!737864 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35053 _keys!1208))))))

(assert (=> start!97380 e!631588))

(declare-fun array_inv!26610 (array!71737) Bool)

(assert (=> start!97380 (array_inv!26610 _keys!1208)))

(assert (=> start!97380 true))

(declare-fun array_inv!26611 (array!71739) Bool)

(assert (=> start!97380 (and (array_inv!26611 _values!996) e!631589)))

(declare-fun b!1106416 () Bool)

(declare-fun tp_is_empty!27391 () Bool)

(assert (=> b!1106416 (= e!631590 tp_is_empty!27391)))

(declare-fun mapNonEmpty!42901 () Bool)

(declare-fun tp!81821 () Bool)

(declare-fun e!631592 () Bool)

(assert (=> mapNonEmpty!42901 (= mapRes!42901 (and tp!81821 e!631592))))

(declare-fun mapRest!42901 () (Array (_ BitVec 32) ValueCell!12986))

(declare-fun mapValue!42901 () ValueCell!12986)

(declare-fun mapKey!42901 () (_ BitVec 32))

(assert (=> mapNonEmpty!42901 (= (arr!34517 _values!996) (store mapRest!42901 mapKey!42901 mapValue!42901))))

(declare-fun b!1106417 () Bool)

(assert (=> b!1106417 (= e!631588 e!631591)))

(declare-fun res!737862 () Bool)

(assert (=> b!1106417 (=> (not res!737862) (not e!631591))))

(declare-fun lt!495759 () array!71737)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71737 (_ BitVec 32)) Bool)

(assert (=> b!1106417 (= res!737862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495759 mask!1564))))

(assert (=> b!1106417 (= lt!495759 (array!71738 (store (arr!34516 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35053 _keys!1208)))))

(declare-fun b!1106418 () Bool)

(declare-fun res!737859 () Bool)

(assert (=> b!1106418 (=> (not res!737859) (not e!631588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106418 (= res!737859 (validKeyInArray!0 k0!934))))

(declare-fun b!1106419 () Bool)

(declare-fun res!737861 () Bool)

(assert (=> b!1106419 (=> (not res!737861) (not e!631588))))

(declare-datatypes ((List!24091 0))(
  ( (Nil!24088) (Cons!24087 (h!25305 (_ BitVec 64)) (t!34348 List!24091)) )
))
(declare-fun arrayNoDuplicates!0 (array!71737 (_ BitVec 32) List!24091) Bool)

(assert (=> b!1106419 (= res!737861 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24088))))

(declare-fun mapIsEmpty!42901 () Bool)

(assert (=> mapIsEmpty!42901 mapRes!42901))

(declare-fun b!1106420 () Bool)

(declare-fun res!737863 () Bool)

(assert (=> b!1106420 (=> (not res!737863) (not e!631588))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106420 (= res!737863 (and (= (size!35054 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35053 _keys!1208) (size!35054 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106421 () Bool)

(declare-fun res!737858 () Bool)

(assert (=> b!1106421 (=> (not res!737858) (not e!631591))))

(assert (=> b!1106421 (= res!737858 (arrayNoDuplicates!0 lt!495759 #b00000000000000000000000000000000 Nil!24088))))

(declare-fun b!1106422 () Bool)

(declare-fun res!737856 () Bool)

(assert (=> b!1106422 (=> (not res!737856) (not e!631588))))

(assert (=> b!1106422 (= res!737856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106423 () Bool)

(assert (=> b!1106423 (= e!631592 tp_is_empty!27391)))

(assert (= (and start!97380 res!737864) b!1106414))

(assert (= (and b!1106414 res!737855) b!1106420))

(assert (= (and b!1106420 res!737863) b!1106422))

(assert (= (and b!1106422 res!737856) b!1106419))

(assert (= (and b!1106419 res!737861) b!1106412))

(assert (= (and b!1106412 res!737860) b!1106418))

(assert (= (and b!1106418 res!737859) b!1106415))

(assert (= (and b!1106415 res!737857) b!1106417))

(assert (= (and b!1106417 res!737862) b!1106421))

(assert (= (and b!1106421 res!737858) b!1106411))

(assert (= (and b!1106413 condMapEmpty!42901) mapIsEmpty!42901))

(assert (= (and b!1106413 (not condMapEmpty!42901)) mapNonEmpty!42901))

(get-info :version)

(assert (= (and mapNonEmpty!42901 ((_ is ValueCellFull!12986) mapValue!42901)) b!1106423))

(assert (= (and b!1106413 ((_ is ValueCellFull!12986) mapDefault!42901)) b!1106416))

(assert (= start!97380 b!1106413))

(declare-fun m!1026265 () Bool)

(assert (=> b!1106419 m!1026265))

(declare-fun m!1026267 () Bool)

(assert (=> b!1106411 m!1026267))

(declare-fun m!1026269 () Bool)

(assert (=> b!1106411 m!1026269))

(declare-fun m!1026271 () Bool)

(assert (=> b!1106421 m!1026271))

(declare-fun m!1026273 () Bool)

(assert (=> mapNonEmpty!42901 m!1026273))

(declare-fun m!1026275 () Bool)

(assert (=> b!1106418 m!1026275))

(declare-fun m!1026277 () Bool)

(assert (=> b!1106414 m!1026277))

(declare-fun m!1026279 () Bool)

(assert (=> start!97380 m!1026279))

(declare-fun m!1026281 () Bool)

(assert (=> start!97380 m!1026281))

(declare-fun m!1026283 () Bool)

(assert (=> b!1106415 m!1026283))

(declare-fun m!1026285 () Bool)

(assert (=> b!1106422 m!1026285))

(declare-fun m!1026287 () Bool)

(assert (=> b!1106417 m!1026287))

(declare-fun m!1026289 () Bool)

(assert (=> b!1106417 m!1026289))

(check-sat (not b!1106419) (not mapNonEmpty!42901) (not b!1106418) (not start!97380) (not b!1106421) (not b!1106422) (not b!1106414) (not b!1106411) (not b!1106417) tp_is_empty!27391)
(check-sat)
(get-model)

(declare-fun d!131383 () Bool)

(declare-fun res!737929 () Bool)

(declare-fun e!631633 () Bool)

(assert (=> d!131383 (=> res!737929 e!631633)))

(assert (=> d!131383 (= res!737929 (= (select (arr!34516 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131383 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!631633)))

(declare-fun b!1106506 () Bool)

(declare-fun e!631634 () Bool)

(assert (=> b!1106506 (= e!631633 e!631634)))

(declare-fun res!737930 () Bool)

(assert (=> b!1106506 (=> (not res!737930) (not e!631634))))

(assert (=> b!1106506 (= res!737930 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!35053 _keys!1208)))))

(declare-fun b!1106507 () Bool)

(assert (=> b!1106507 (= e!631634 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131383 (not res!737929)) b!1106506))

(assert (= (and b!1106506 res!737930) b!1106507))

(declare-fun m!1026343 () Bool)

(assert (=> d!131383 m!1026343))

(declare-fun m!1026345 () Bool)

(assert (=> b!1106507 m!1026345))

(assert (=> b!1106411 d!131383))

(declare-fun d!131385 () Bool)

(assert (=> d!131385 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495775 () Unit!36251)

(declare-fun choose!13 (array!71737 (_ BitVec 64) (_ BitVec 32)) Unit!36251)

(assert (=> d!131385 (= lt!495775 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131385 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131385 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!495775)))

(declare-fun bs!32439 () Bool)

(assert (= bs!32439 d!131385))

(assert (=> bs!32439 m!1026267))

(declare-fun m!1026347 () Bool)

(assert (=> bs!32439 m!1026347))

(assert (=> b!1106411 d!131385))

(declare-fun b!1106518 () Bool)

(declare-fun e!631646 () Bool)

(declare-fun e!631645 () Bool)

(assert (=> b!1106518 (= e!631646 e!631645)))

(declare-fun res!737939 () Bool)

(assert (=> b!1106518 (=> (not res!737939) (not e!631645))))

(declare-fun e!631643 () Bool)

(assert (=> b!1106518 (= res!737939 (not e!631643))))

(declare-fun res!737937 () Bool)

(assert (=> b!1106518 (=> (not res!737937) (not e!631643))))

(assert (=> b!1106518 (= res!737937 (validKeyInArray!0 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1106519 () Bool)

(declare-fun e!631644 () Bool)

(declare-fun call!46416 () Bool)

(assert (=> b!1106519 (= e!631644 call!46416)))

(declare-fun b!1106520 () Bool)

(assert (=> b!1106520 (= e!631645 e!631644)))

(declare-fun c!109413 () Bool)

(assert (=> b!1106520 (= c!109413 (validKeyInArray!0 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1106521 () Bool)

(declare-fun contains!6443 (List!24091 (_ BitVec 64)) Bool)

(assert (=> b!1106521 (= e!631643 (contains!6443 Nil!24088 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131387 () Bool)

(declare-fun res!737938 () Bool)

(assert (=> d!131387 (=> res!737938 e!631646)))

(assert (=> d!131387 (= res!737938 (bvsge #b00000000000000000000000000000000 (size!35053 _keys!1208)))))

(assert (=> d!131387 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24088) e!631646)))

(declare-fun bm!46413 () Bool)

(assert (=> bm!46413 (= call!46416 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109413 (Cons!24087 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000) Nil!24088) Nil!24088)))))

(declare-fun b!1106522 () Bool)

(assert (=> b!1106522 (= e!631644 call!46416)))

(assert (= (and d!131387 (not res!737938)) b!1106518))

(assert (= (and b!1106518 res!737937) b!1106521))

(assert (= (and b!1106518 res!737939) b!1106520))

(assert (= (and b!1106520 c!109413) b!1106522))

(assert (= (and b!1106520 (not c!109413)) b!1106519))

(assert (= (or b!1106522 b!1106519) bm!46413))

(assert (=> b!1106518 m!1026343))

(assert (=> b!1106518 m!1026343))

(declare-fun m!1026349 () Bool)

(assert (=> b!1106518 m!1026349))

(assert (=> b!1106520 m!1026343))

(assert (=> b!1106520 m!1026343))

(assert (=> b!1106520 m!1026349))

(assert (=> b!1106521 m!1026343))

(assert (=> b!1106521 m!1026343))

(declare-fun m!1026351 () Bool)

(assert (=> b!1106521 m!1026351))

(assert (=> bm!46413 m!1026343))

(declare-fun m!1026353 () Bool)

(assert (=> bm!46413 m!1026353))

(assert (=> b!1106419 d!131387))

(declare-fun d!131389 () Bool)

(assert (=> d!131389 (= (array_inv!26610 _keys!1208) (bvsge (size!35053 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97380 d!131389))

(declare-fun d!131391 () Bool)

(assert (=> d!131391 (= (array_inv!26611 _values!996) (bvsge (size!35054 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97380 d!131391))

(declare-fun d!131393 () Bool)

(declare-fun res!737944 () Bool)

(declare-fun e!631655 () Bool)

(assert (=> d!131393 (=> res!737944 e!631655)))

(assert (=> d!131393 (= res!737944 (bvsge #b00000000000000000000000000000000 (size!35053 _keys!1208)))))

(assert (=> d!131393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!631655)))

(declare-fun b!1106531 () Bool)

(declare-fun e!631654 () Bool)

(declare-fun call!46419 () Bool)

(assert (=> b!1106531 (= e!631654 call!46419)))

(declare-fun b!1106532 () Bool)

(assert (=> b!1106532 (= e!631655 e!631654)))

(declare-fun c!109416 () Bool)

(assert (=> b!1106532 (= c!109416 (validKeyInArray!0 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1106533 () Bool)

(declare-fun e!631653 () Bool)

(assert (=> b!1106533 (= e!631654 e!631653)))

(declare-fun lt!495784 () (_ BitVec 64))

(assert (=> b!1106533 (= lt!495784 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495782 () Unit!36251)

(assert (=> b!1106533 (= lt!495782 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495784 #b00000000000000000000000000000000))))

(assert (=> b!1106533 (arrayContainsKey!0 _keys!1208 lt!495784 #b00000000000000000000000000000000)))

(declare-fun lt!495783 () Unit!36251)

(assert (=> b!1106533 (= lt!495783 lt!495782)))

(declare-fun res!737945 () Bool)

(declare-datatypes ((SeekEntryResult!9880 0))(
  ( (MissingZero!9880 (index!41891 (_ BitVec 32))) (Found!9880 (index!41892 (_ BitVec 32))) (Intermediate!9880 (undefined!10692 Bool) (index!41893 (_ BitVec 32)) (x!99359 (_ BitVec 32))) (Undefined!9880) (MissingVacant!9880 (index!41894 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71737 (_ BitVec 32)) SeekEntryResult!9880)

(assert (=> b!1106533 (= res!737945 (= (seekEntryOrOpen!0 (select (arr!34516 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9880 #b00000000000000000000000000000000)))))

(assert (=> b!1106533 (=> (not res!737945) (not e!631653))))

(declare-fun b!1106534 () Bool)

(assert (=> b!1106534 (= e!631653 call!46419)))

(declare-fun bm!46416 () Bool)

(assert (=> bm!46416 (= call!46419 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!131393 (not res!737944)) b!1106532))

(assert (= (and b!1106532 c!109416) b!1106533))

(assert (= (and b!1106532 (not c!109416)) b!1106531))

(assert (= (and b!1106533 res!737945) b!1106534))

(assert (= (or b!1106534 b!1106531) bm!46416))

(assert (=> b!1106532 m!1026343))

(assert (=> b!1106532 m!1026343))

(assert (=> b!1106532 m!1026349))

(assert (=> b!1106533 m!1026343))

(declare-fun m!1026355 () Bool)

(assert (=> b!1106533 m!1026355))

(declare-fun m!1026357 () Bool)

(assert (=> b!1106533 m!1026357))

(assert (=> b!1106533 m!1026343))

(declare-fun m!1026359 () Bool)

(assert (=> b!1106533 m!1026359))

(declare-fun m!1026361 () Bool)

(assert (=> bm!46416 m!1026361))

(assert (=> b!1106422 d!131393))

(declare-fun d!131395 () Bool)

(assert (=> d!131395 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1106418 d!131395))

(declare-fun d!131397 () Bool)

(assert (=> d!131397 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1106414 d!131397))

(declare-fun b!1106535 () Bool)

(declare-fun e!631659 () Bool)

(declare-fun e!631658 () Bool)

(assert (=> b!1106535 (= e!631659 e!631658)))

(declare-fun res!737948 () Bool)

(assert (=> b!1106535 (=> (not res!737948) (not e!631658))))

(declare-fun e!631656 () Bool)

(assert (=> b!1106535 (= res!737948 (not e!631656))))

(declare-fun res!737946 () Bool)

(assert (=> b!1106535 (=> (not res!737946) (not e!631656))))

(assert (=> b!1106535 (= res!737946 (validKeyInArray!0 (select (arr!34516 lt!495759) #b00000000000000000000000000000000)))))

(declare-fun b!1106536 () Bool)

(declare-fun e!631657 () Bool)

(declare-fun call!46420 () Bool)

(assert (=> b!1106536 (= e!631657 call!46420)))

(declare-fun b!1106537 () Bool)

(assert (=> b!1106537 (= e!631658 e!631657)))

(declare-fun c!109417 () Bool)

(assert (=> b!1106537 (= c!109417 (validKeyInArray!0 (select (arr!34516 lt!495759) #b00000000000000000000000000000000)))))

(declare-fun b!1106538 () Bool)

(assert (=> b!1106538 (= e!631656 (contains!6443 Nil!24088 (select (arr!34516 lt!495759) #b00000000000000000000000000000000)))))

(declare-fun d!131399 () Bool)

(declare-fun res!737947 () Bool)

(assert (=> d!131399 (=> res!737947 e!631659)))

(assert (=> d!131399 (= res!737947 (bvsge #b00000000000000000000000000000000 (size!35053 lt!495759)))))

(assert (=> d!131399 (= (arrayNoDuplicates!0 lt!495759 #b00000000000000000000000000000000 Nil!24088) e!631659)))

(declare-fun bm!46417 () Bool)

(assert (=> bm!46417 (= call!46420 (arrayNoDuplicates!0 lt!495759 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109417 (Cons!24087 (select (arr!34516 lt!495759) #b00000000000000000000000000000000) Nil!24088) Nil!24088)))))

(declare-fun b!1106539 () Bool)

(assert (=> b!1106539 (= e!631657 call!46420)))

(assert (= (and d!131399 (not res!737947)) b!1106535))

(assert (= (and b!1106535 res!737946) b!1106538))

(assert (= (and b!1106535 res!737948) b!1106537))

(assert (= (and b!1106537 c!109417) b!1106539))

(assert (= (and b!1106537 (not c!109417)) b!1106536))

(assert (= (or b!1106539 b!1106536) bm!46417))

(declare-fun m!1026363 () Bool)

(assert (=> b!1106535 m!1026363))

(assert (=> b!1106535 m!1026363))

(declare-fun m!1026365 () Bool)

(assert (=> b!1106535 m!1026365))

(assert (=> b!1106537 m!1026363))

(assert (=> b!1106537 m!1026363))

(assert (=> b!1106537 m!1026365))

(assert (=> b!1106538 m!1026363))

(assert (=> b!1106538 m!1026363))

(declare-fun m!1026367 () Bool)

(assert (=> b!1106538 m!1026367))

(assert (=> bm!46417 m!1026363))

(declare-fun m!1026369 () Bool)

(assert (=> bm!46417 m!1026369))

(assert (=> b!1106421 d!131399))

(declare-fun d!131401 () Bool)

(declare-fun res!737949 () Bool)

(declare-fun e!631662 () Bool)

(assert (=> d!131401 (=> res!737949 e!631662)))

(assert (=> d!131401 (= res!737949 (bvsge #b00000000000000000000000000000000 (size!35053 lt!495759)))))

(assert (=> d!131401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495759 mask!1564) e!631662)))

(declare-fun b!1106540 () Bool)

(declare-fun e!631661 () Bool)

(declare-fun call!46421 () Bool)

(assert (=> b!1106540 (= e!631661 call!46421)))

(declare-fun b!1106541 () Bool)

(assert (=> b!1106541 (= e!631662 e!631661)))

(declare-fun c!109418 () Bool)

(assert (=> b!1106541 (= c!109418 (validKeyInArray!0 (select (arr!34516 lt!495759) #b00000000000000000000000000000000)))))

(declare-fun b!1106542 () Bool)

(declare-fun e!631660 () Bool)

(assert (=> b!1106542 (= e!631661 e!631660)))

(declare-fun lt!495787 () (_ BitVec 64))

(assert (=> b!1106542 (= lt!495787 (select (arr!34516 lt!495759) #b00000000000000000000000000000000))))

(declare-fun lt!495785 () Unit!36251)

(assert (=> b!1106542 (= lt!495785 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!495759 lt!495787 #b00000000000000000000000000000000))))

(assert (=> b!1106542 (arrayContainsKey!0 lt!495759 lt!495787 #b00000000000000000000000000000000)))

(declare-fun lt!495786 () Unit!36251)

(assert (=> b!1106542 (= lt!495786 lt!495785)))

(declare-fun res!737950 () Bool)

(assert (=> b!1106542 (= res!737950 (= (seekEntryOrOpen!0 (select (arr!34516 lt!495759) #b00000000000000000000000000000000) lt!495759 mask!1564) (Found!9880 #b00000000000000000000000000000000)))))

(assert (=> b!1106542 (=> (not res!737950) (not e!631660))))

(declare-fun b!1106543 () Bool)

(assert (=> b!1106543 (= e!631660 call!46421)))

(declare-fun bm!46418 () Bool)

(assert (=> bm!46418 (= call!46421 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!495759 mask!1564))))

(assert (= (and d!131401 (not res!737949)) b!1106541))

(assert (= (and b!1106541 c!109418) b!1106542))

(assert (= (and b!1106541 (not c!109418)) b!1106540))

(assert (= (and b!1106542 res!737950) b!1106543))

(assert (= (or b!1106543 b!1106540) bm!46418))

(assert (=> b!1106541 m!1026363))

(assert (=> b!1106541 m!1026363))

(assert (=> b!1106541 m!1026365))

(assert (=> b!1106542 m!1026363))

(declare-fun m!1026371 () Bool)

(assert (=> b!1106542 m!1026371))

(declare-fun m!1026373 () Bool)

(assert (=> b!1106542 m!1026373))

(assert (=> b!1106542 m!1026363))

(declare-fun m!1026375 () Bool)

(assert (=> b!1106542 m!1026375))

(declare-fun m!1026377 () Bool)

(assert (=> bm!46418 m!1026377))

(assert (=> b!1106417 d!131401))

(declare-fun b!1106550 () Bool)

(declare-fun e!631667 () Bool)

(assert (=> b!1106550 (= e!631667 tp_is_empty!27391)))

(declare-fun mapIsEmpty!42910 () Bool)

(declare-fun mapRes!42910 () Bool)

(assert (=> mapIsEmpty!42910 mapRes!42910))

(declare-fun condMapEmpty!42910 () Bool)

(declare-fun mapDefault!42910 () ValueCell!12986)

(assert (=> mapNonEmpty!42901 (= condMapEmpty!42910 (= mapRest!42901 ((as const (Array (_ BitVec 32) ValueCell!12986)) mapDefault!42910)))))

(declare-fun e!631668 () Bool)

(assert (=> mapNonEmpty!42901 (= tp!81821 (and e!631668 mapRes!42910))))

(declare-fun mapNonEmpty!42910 () Bool)

(declare-fun tp!81830 () Bool)

(assert (=> mapNonEmpty!42910 (= mapRes!42910 (and tp!81830 e!631667))))

(declare-fun mapKey!42910 () (_ BitVec 32))

(declare-fun mapRest!42910 () (Array (_ BitVec 32) ValueCell!12986))

(declare-fun mapValue!42910 () ValueCell!12986)

(assert (=> mapNonEmpty!42910 (= mapRest!42901 (store mapRest!42910 mapKey!42910 mapValue!42910))))

(declare-fun b!1106551 () Bool)

(assert (=> b!1106551 (= e!631668 tp_is_empty!27391)))

(assert (= (and mapNonEmpty!42901 condMapEmpty!42910) mapIsEmpty!42910))

(assert (= (and mapNonEmpty!42901 (not condMapEmpty!42910)) mapNonEmpty!42910))

(assert (= (and mapNonEmpty!42910 ((_ is ValueCellFull!12986) mapValue!42910)) b!1106550))

(assert (= (and mapNonEmpty!42901 ((_ is ValueCellFull!12986) mapDefault!42910)) b!1106551))

(declare-fun m!1026379 () Bool)

(assert (=> mapNonEmpty!42910 m!1026379))

(check-sat (not mapNonEmpty!42910) (not bm!46413) (not b!1106541) (not b!1106518) tp_is_empty!27391 (not b!1106538) (not b!1106533) (not b!1106521) (not bm!46416) (not bm!46417) (not b!1106535) (not b!1106542) (not bm!46418) (not b!1106520) (not d!131385) (not b!1106507) (not b!1106532) (not b!1106537))
(check-sat)
