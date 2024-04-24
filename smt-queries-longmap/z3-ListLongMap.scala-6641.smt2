; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83986 () Bool)

(assert start!83986)

(declare-fun b_free!19627 () Bool)

(declare-fun b_next!19627 () Bool)

(assert (=> start!83986 (= b_free!19627 (not b_next!19627))))

(declare-fun tp!68324 () Bool)

(declare-fun b_and!31353 () Bool)

(assert (=> start!83986 (= tp!68324 b_and!31353)))

(declare-fun b!979919 () Bool)

(declare-fun e!552478 () Bool)

(assert (=> b!979919 (= e!552478 true)))

(declare-datatypes ((V!35145 0))(
  ( (V!35146 (val!11361 Int)) )
))
(declare-datatypes ((tuple2!14580 0))(
  ( (tuple2!14581 (_1!7301 (_ BitVec 64)) (_2!7301 V!35145)) )
))
(declare-fun lt!434453 () tuple2!14580)

(declare-fun lt!434457 () tuple2!14580)

(declare-datatypes ((List!20440 0))(
  ( (Nil!20437) (Cons!20436 (h!21604 tuple2!14580) (t!29015 List!20440)) )
))
(declare-datatypes ((ListLongMap!13279 0))(
  ( (ListLongMap!13280 (toList!6655 List!20440)) )
))
(declare-fun lt!434460 () ListLongMap!13279)

(declare-fun lt!434451 () ListLongMap!13279)

(declare-fun +!2970 (ListLongMap!13279 tuple2!14580) ListLongMap!13279)

(assert (=> b!979919 (= lt!434460 (+!2970 (+!2970 lt!434451 lt!434453) lt!434457))))

(declare-fun zeroValue!1220 () V!35145)

(declare-fun lt!434459 () V!35145)

(declare-datatypes ((Unit!32520 0))(
  ( (Unit!32521) )
))
(declare-fun lt!434458 () Unit!32520)

(declare-datatypes ((array!61290 0))(
  ( (array!61291 (arr!29498 (Array (_ BitVec 32) (_ BitVec 64))) (size!29978 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61290)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!577 (ListLongMap!13279 (_ BitVec 64) V!35145 (_ BitVec 64) V!35145) Unit!32520)

(assert (=> b!979919 (= lt!434458 (addCommutativeForDiffKeys!577 lt!434451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29498 _keys!1544) from!1932) lt!434459))))

(declare-fun b!979920 () Bool)

(declare-fun res!655520 () Bool)

(declare-fun e!552476 () Bool)

(assert (=> b!979920 (=> (not res!655520) (not e!552476))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979920 (= res!655520 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979921 () Bool)

(declare-fun res!655518 () Bool)

(assert (=> b!979921 (=> (not res!655518) (not e!552476))))

(assert (=> b!979921 (= res!655518 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29978 _keys!1544))))))

(declare-fun b!979922 () Bool)

(assert (=> b!979922 (= e!552476 (not e!552478))))

(declare-fun res!655525 () Bool)

(assert (=> b!979922 (=> res!655525 e!552478)))

(assert (=> b!979922 (= res!655525 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29498 _keys!1544) from!1932)))))

(declare-fun lt!434452 () tuple2!14580)

(declare-fun lt!434455 () ListLongMap!13279)

(assert (=> b!979922 (= (+!2970 lt!434455 lt!434453) (+!2970 lt!434460 lt!434452))))

(declare-fun lt!434456 () ListLongMap!13279)

(assert (=> b!979922 (= lt!434460 (+!2970 lt!434456 lt!434453))))

(assert (=> b!979922 (= lt!434453 (tuple2!14581 (select (arr!29498 _keys!1544) from!1932) lt!434459))))

(assert (=> b!979922 (= lt!434455 (+!2970 lt!434456 lt!434452))))

(declare-fun minValue!1220 () V!35145)

(assert (=> b!979922 (= lt!434452 (tuple2!14581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434454 () Unit!32520)

(assert (=> b!979922 (= lt!434454 (addCommutativeForDiffKeys!577 lt!434456 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29498 _keys!1544) from!1932) lt!434459))))

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((ValueCell!10829 0))(
  ( (ValueCellFull!10829 (v!13920 V!35145)) (EmptyCell!10829) )
))
(declare-datatypes ((array!61292 0))(
  ( (array!61293 (arr!29499 (Array (_ BitVec 32) ValueCell!10829)) (size!29979 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61292)

(declare-fun get!15304 (ValueCell!10829 V!35145) V!35145)

(declare-fun dynLambda!1765 (Int (_ BitVec 64)) V!35145)

(assert (=> b!979922 (= lt!434459 (get!15304 (select (arr!29499 _values!1278) from!1932) (dynLambda!1765 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979922 (= lt!434456 (+!2970 lt!434451 lt!434457))))

(assert (=> b!979922 (= lt!434457 (tuple2!14581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3403 (array!61290 array!61292 (_ BitVec 32) (_ BitVec 32) V!35145 V!35145 (_ BitVec 32) Int) ListLongMap!13279)

(assert (=> b!979922 (= lt!434451 (getCurrentListMapNoExtraKeys!3403 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979923 () Bool)

(declare-fun res!655523 () Bool)

(assert (=> b!979923 (=> (not res!655523) (not e!552476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61290 (_ BitVec 32)) Bool)

(assert (=> b!979923 (= res!655523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35960 () Bool)

(declare-fun mapRes!35960 () Bool)

(declare-fun tp!68323 () Bool)

(declare-fun e!552477 () Bool)

(assert (=> mapNonEmpty!35960 (= mapRes!35960 (and tp!68323 e!552477))))

(declare-fun mapKey!35960 () (_ BitVec 32))

(declare-fun mapValue!35960 () ValueCell!10829)

(declare-fun mapRest!35960 () (Array (_ BitVec 32) ValueCell!10829))

(assert (=> mapNonEmpty!35960 (= (arr!29499 _values!1278) (store mapRest!35960 mapKey!35960 mapValue!35960))))

(declare-fun mapIsEmpty!35960 () Bool)

(assert (=> mapIsEmpty!35960 mapRes!35960))

(declare-fun b!979924 () Bool)

(declare-fun e!552479 () Bool)

(declare-fun tp_is_empty!22621 () Bool)

(assert (=> b!979924 (= e!552479 tp_is_empty!22621)))

(declare-fun res!655519 () Bool)

(assert (=> start!83986 (=> (not res!655519) (not e!552476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83986 (= res!655519 (validMask!0 mask!1948))))

(assert (=> start!83986 e!552476))

(assert (=> start!83986 true))

(assert (=> start!83986 tp_is_empty!22621))

(declare-fun e!552480 () Bool)

(declare-fun array_inv!22845 (array!61292) Bool)

(assert (=> start!83986 (and (array_inv!22845 _values!1278) e!552480)))

(assert (=> start!83986 tp!68324))

(declare-fun array_inv!22846 (array!61290) Bool)

(assert (=> start!83986 (array_inv!22846 _keys!1544)))

(declare-fun b!979925 () Bool)

(assert (=> b!979925 (= e!552480 (and e!552479 mapRes!35960))))

(declare-fun condMapEmpty!35960 () Bool)

(declare-fun mapDefault!35960 () ValueCell!10829)

(assert (=> b!979925 (= condMapEmpty!35960 (= (arr!29499 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10829)) mapDefault!35960)))))

(declare-fun b!979926 () Bool)

(declare-fun res!655524 () Bool)

(assert (=> b!979926 (=> (not res!655524) (not e!552476))))

(declare-datatypes ((List!20441 0))(
  ( (Nil!20438) (Cons!20437 (h!21605 (_ BitVec 64)) (t!29016 List!20441)) )
))
(declare-fun arrayNoDuplicates!0 (array!61290 (_ BitVec 32) List!20441) Bool)

(assert (=> b!979926 (= res!655524 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20438))))

(declare-fun b!979927 () Bool)

(assert (=> b!979927 (= e!552477 tp_is_empty!22621)))

(declare-fun b!979928 () Bool)

(declare-fun res!655521 () Bool)

(assert (=> b!979928 (=> (not res!655521) (not e!552476))))

(assert (=> b!979928 (= res!655521 (and (= (size!29979 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29978 _keys!1544) (size!29979 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979929 () Bool)

(declare-fun res!655522 () Bool)

(assert (=> b!979929 (=> (not res!655522) (not e!552476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979929 (= res!655522 (validKeyInArray!0 (select (arr!29498 _keys!1544) from!1932)))))

(assert (= (and start!83986 res!655519) b!979928))

(assert (= (and b!979928 res!655521) b!979923))

(assert (= (and b!979923 res!655523) b!979926))

(assert (= (and b!979926 res!655524) b!979921))

(assert (= (and b!979921 res!655518) b!979929))

(assert (= (and b!979929 res!655522) b!979920))

(assert (= (and b!979920 res!655520) b!979922))

(assert (= (and b!979922 (not res!655525)) b!979919))

(assert (= (and b!979925 condMapEmpty!35960) mapIsEmpty!35960))

(assert (= (and b!979925 (not condMapEmpty!35960)) mapNonEmpty!35960))

(get-info :version)

(assert (= (and mapNonEmpty!35960 ((_ is ValueCellFull!10829) mapValue!35960)) b!979927))

(assert (= (and b!979925 ((_ is ValueCellFull!10829) mapDefault!35960)) b!979924))

(assert (= start!83986 b!979925))

(declare-fun b_lambda!14685 () Bool)

(assert (=> (not b_lambda!14685) (not b!979922)))

(declare-fun t!29014 () Bool)

(declare-fun tb!6425 () Bool)

(assert (=> (and start!83986 (= defaultEntry!1281 defaultEntry!1281) t!29014) tb!6425))

(declare-fun result!12847 () Bool)

(assert (=> tb!6425 (= result!12847 tp_is_empty!22621)))

(assert (=> b!979922 t!29014))

(declare-fun b_and!31355 () Bool)

(assert (= b_and!31353 (and (=> t!29014 result!12847) b_and!31355)))

(declare-fun m!907535 () Bool)

(assert (=> b!979929 m!907535))

(assert (=> b!979929 m!907535))

(declare-fun m!907537 () Bool)

(assert (=> b!979929 m!907537))

(declare-fun m!907539 () Bool)

(assert (=> b!979923 m!907539))

(declare-fun m!907541 () Bool)

(assert (=> b!979919 m!907541))

(assert (=> b!979919 m!907541))

(declare-fun m!907543 () Bool)

(assert (=> b!979919 m!907543))

(assert (=> b!979919 m!907535))

(assert (=> b!979919 m!907535))

(declare-fun m!907545 () Bool)

(assert (=> b!979919 m!907545))

(declare-fun m!907547 () Bool)

(assert (=> start!83986 m!907547))

(declare-fun m!907549 () Bool)

(assert (=> start!83986 m!907549))

(declare-fun m!907551 () Bool)

(assert (=> start!83986 m!907551))

(declare-fun m!907553 () Bool)

(assert (=> b!979926 m!907553))

(assert (=> b!979922 m!907535))

(declare-fun m!907555 () Bool)

(assert (=> b!979922 m!907555))

(assert (=> b!979922 m!907535))

(declare-fun m!907557 () Bool)

(assert (=> b!979922 m!907557))

(declare-fun m!907559 () Bool)

(assert (=> b!979922 m!907559))

(declare-fun m!907561 () Bool)

(assert (=> b!979922 m!907561))

(declare-fun m!907563 () Bool)

(assert (=> b!979922 m!907563))

(declare-fun m!907565 () Bool)

(assert (=> b!979922 m!907565))

(declare-fun m!907567 () Bool)

(assert (=> b!979922 m!907567))

(declare-fun m!907569 () Bool)

(assert (=> b!979922 m!907569))

(declare-fun m!907571 () Bool)

(assert (=> b!979922 m!907571))

(assert (=> b!979922 m!907567))

(assert (=> b!979922 m!907571))

(declare-fun m!907573 () Bool)

(assert (=> b!979922 m!907573))

(declare-fun m!907575 () Bool)

(assert (=> mapNonEmpty!35960 m!907575))

(check-sat tp_is_empty!22621 b_and!31355 (not b!979922) (not b!979919) (not start!83986) (not b!979923) (not b_next!19627) (not b!979926) (not mapNonEmpty!35960) (not b!979929) (not b_lambda!14685))
(check-sat b_and!31355 (not b_next!19627))
