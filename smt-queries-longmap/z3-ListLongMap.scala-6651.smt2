; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83880 () Bool)

(assert start!83880)

(declare-fun b_free!19689 () Bool)

(declare-fun b_next!19689 () Bool)

(assert (=> start!83880 (= b_free!19689 (not b_next!19689))))

(declare-fun tp!68508 () Bool)

(declare-fun b_and!31467 () Bool)

(assert (=> start!83880 (= tp!68508 b_and!31467)))

(declare-fun b!980101 () Bool)

(declare-fun e!552454 () Bool)

(assert (=> b!980101 (= e!552454 true)))

(declare-datatypes ((V!35227 0))(
  ( (V!35228 (val!11392 Int)) )
))
(declare-datatypes ((tuple2!14612 0))(
  ( (tuple2!14613 (_1!7317 (_ BitVec 64)) (_2!7317 V!35227)) )
))
(declare-fun lt!435029 () tuple2!14612)

(declare-datatypes ((List!20479 0))(
  ( (Nil!20476) (Cons!20475 (h!21637 tuple2!14612) (t!29124 List!20479)) )
))
(declare-datatypes ((ListLongMap!13309 0))(
  ( (ListLongMap!13310 (toList!6670 List!20479)) )
))
(declare-fun lt!435026 () ListLongMap!13309)

(declare-fun lt!435028 () tuple2!14612)

(declare-fun lt!435027 () ListLongMap!13309)

(declare-fun +!2975 (ListLongMap!13309 tuple2!14612) ListLongMap!13309)

(assert (=> b!980101 (= lt!435027 (+!2975 (+!2975 lt!435026 lt!435029) lt!435028))))

(declare-datatypes ((Unit!32589 0))(
  ( (Unit!32590) )
))
(declare-fun lt!435021 () Unit!32589)

(declare-fun zeroValue!1220 () V!35227)

(declare-fun lt!435023 () V!35227)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61377 0))(
  ( (array!61378 (arr!29546 (Array (_ BitVec 32) (_ BitVec 64))) (size!30025 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61377)

(declare-fun addCommutativeForDiffKeys!603 (ListLongMap!13309 (_ BitVec 64) V!35227 (_ BitVec 64) V!35227) Unit!32589)

(assert (=> b!980101 (= lt!435021 (addCommutativeForDiffKeys!603 lt!435026 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29546 _keys!1544) from!1932) lt!435023))))

(declare-fun res!655921 () Bool)

(declare-fun e!552455 () Bool)

(assert (=> start!83880 (=> (not res!655921) (not e!552455))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83880 (= res!655921 (validMask!0 mask!1948))))

(assert (=> start!83880 e!552455))

(assert (=> start!83880 true))

(declare-fun tp_is_empty!22683 () Bool)

(assert (=> start!83880 tp_is_empty!22683))

(declare-datatypes ((ValueCell!10860 0))(
  ( (ValueCellFull!10860 (v!13954 V!35227)) (EmptyCell!10860) )
))
(declare-datatypes ((array!61379 0))(
  ( (array!61380 (arr!29547 (Array (_ BitVec 32) ValueCell!10860)) (size!30026 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61379)

(declare-fun e!552456 () Bool)

(declare-fun array_inv!22843 (array!61379) Bool)

(assert (=> start!83880 (and (array_inv!22843 _values!1278) e!552456)))

(assert (=> start!83880 tp!68508))

(declare-fun array_inv!22844 (array!61377) Bool)

(assert (=> start!83880 (array_inv!22844 _keys!1544)))

(declare-fun b!980102 () Bool)

(declare-fun res!655922 () Bool)

(assert (=> b!980102 (=> (not res!655922) (not e!552455))))

(assert (=> b!980102 (= res!655922 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30025 _keys!1544))))))

(declare-fun b!980103 () Bool)

(declare-fun e!552451 () Bool)

(assert (=> b!980103 (= e!552451 tp_is_empty!22683)))

(declare-fun b!980104 () Bool)

(declare-fun mapRes!36053 () Bool)

(assert (=> b!980104 (= e!552456 (and e!552451 mapRes!36053))))

(declare-fun condMapEmpty!36053 () Bool)

(declare-fun mapDefault!36053 () ValueCell!10860)

(assert (=> b!980104 (= condMapEmpty!36053 (= (arr!29547 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10860)) mapDefault!36053)))))

(declare-fun b!980105 () Bool)

(declare-fun res!655920 () Bool)

(assert (=> b!980105 (=> (not res!655920) (not e!552455))))

(declare-datatypes ((List!20480 0))(
  ( (Nil!20477) (Cons!20476 (h!21638 (_ BitVec 64)) (t!29125 List!20480)) )
))
(declare-fun arrayNoDuplicates!0 (array!61377 (_ BitVec 32) List!20480) Bool)

(assert (=> b!980105 (= res!655920 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20477))))

(declare-fun mapNonEmpty!36053 () Bool)

(declare-fun tp!68509 () Bool)

(declare-fun e!552453 () Bool)

(assert (=> mapNonEmpty!36053 (= mapRes!36053 (and tp!68509 e!552453))))

(declare-fun mapKey!36053 () (_ BitVec 32))

(declare-fun mapValue!36053 () ValueCell!10860)

(declare-fun mapRest!36053 () (Array (_ BitVec 32) ValueCell!10860))

(assert (=> mapNonEmpty!36053 (= (arr!29547 _values!1278) (store mapRest!36053 mapKey!36053 mapValue!36053))))

(declare-fun b!980106 () Bool)

(declare-fun res!655918 () Bool)

(assert (=> b!980106 (=> (not res!655918) (not e!552455))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980106 (= res!655918 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980107 () Bool)

(assert (=> b!980107 (= e!552455 (not e!552454))))

(declare-fun res!655925 () Bool)

(assert (=> b!980107 (=> res!655925 e!552454)))

(assert (=> b!980107 (= res!655925 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29546 _keys!1544) from!1932)))))

(declare-fun lt!435022 () ListLongMap!13309)

(declare-fun lt!435025 () tuple2!14612)

(assert (=> b!980107 (= (+!2975 lt!435022 lt!435029) (+!2975 lt!435027 lt!435025))))

(declare-fun lt!435020 () ListLongMap!13309)

(assert (=> b!980107 (= lt!435027 (+!2975 lt!435020 lt!435029))))

(assert (=> b!980107 (= lt!435029 (tuple2!14613 (select (arr!29546 _keys!1544) from!1932) lt!435023))))

(assert (=> b!980107 (= lt!435022 (+!2975 lt!435020 lt!435025))))

(declare-fun minValue!1220 () V!35227)

(assert (=> b!980107 (= lt!435025 (tuple2!14613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435024 () Unit!32589)

(assert (=> b!980107 (= lt!435024 (addCommutativeForDiffKeys!603 lt!435020 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29546 _keys!1544) from!1932) lt!435023))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15316 (ValueCell!10860 V!35227) V!35227)

(declare-fun dynLambda!1761 (Int (_ BitVec 64)) V!35227)

(assert (=> b!980107 (= lt!435023 (get!15316 (select (arr!29547 _values!1278) from!1932) (dynLambda!1761 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980107 (= lt!435020 (+!2975 lt!435026 lt!435028))))

(assert (=> b!980107 (= lt!435028 (tuple2!14613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3375 (array!61377 array!61379 (_ BitVec 32) (_ BitVec 32) V!35227 V!35227 (_ BitVec 32) Int) ListLongMap!13309)

(assert (=> b!980107 (= lt!435026 (getCurrentListMapNoExtraKeys!3375 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36053 () Bool)

(assert (=> mapIsEmpty!36053 mapRes!36053))

(declare-fun b!980108 () Bool)

(declare-fun res!655924 () Bool)

(assert (=> b!980108 (=> (not res!655924) (not e!552455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61377 (_ BitVec 32)) Bool)

(assert (=> b!980108 (= res!655924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980109 () Bool)

(declare-fun res!655919 () Bool)

(assert (=> b!980109 (=> (not res!655919) (not e!552455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980109 (= res!655919 (validKeyInArray!0 (select (arr!29546 _keys!1544) from!1932)))))

(declare-fun b!980110 () Bool)

(assert (=> b!980110 (= e!552453 tp_is_empty!22683)))

(declare-fun b!980111 () Bool)

(declare-fun res!655923 () Bool)

(assert (=> b!980111 (=> (not res!655923) (not e!552455))))

(assert (=> b!980111 (= res!655923 (and (= (size!30026 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30025 _keys!1544) (size!30026 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83880 res!655921) b!980111))

(assert (= (and b!980111 res!655923) b!980108))

(assert (= (and b!980108 res!655924) b!980105))

(assert (= (and b!980105 res!655920) b!980102))

(assert (= (and b!980102 res!655922) b!980109))

(assert (= (and b!980109 res!655919) b!980106))

(assert (= (and b!980106 res!655918) b!980107))

(assert (= (and b!980107 (not res!655925)) b!980101))

(assert (= (and b!980104 condMapEmpty!36053) mapIsEmpty!36053))

(assert (= (and b!980104 (not condMapEmpty!36053)) mapNonEmpty!36053))

(get-info :version)

(assert (= (and mapNonEmpty!36053 ((_ is ValueCellFull!10860) mapValue!36053)) b!980110))

(assert (= (and b!980104 ((_ is ValueCellFull!10860) mapDefault!36053)) b!980103))

(assert (= start!83880 b!980104))

(declare-fun b_lambda!14733 () Bool)

(assert (=> (not b_lambda!14733) (not b!980107)))

(declare-fun t!29123 () Bool)

(declare-fun tb!6495 () Bool)

(assert (=> (and start!83880 (= defaultEntry!1281 defaultEntry!1281) t!29123) tb!6495))

(declare-fun result!12979 () Bool)

(assert (=> tb!6495 (= result!12979 tp_is_empty!22683)))

(assert (=> b!980107 t!29123))

(declare-fun b_and!31469 () Bool)

(assert (= b_and!31467 (and (=> t!29123 result!12979) b_and!31469)))

(declare-fun m!907543 () Bool)

(assert (=> start!83880 m!907543))

(declare-fun m!907545 () Bool)

(assert (=> start!83880 m!907545))

(declare-fun m!907547 () Bool)

(assert (=> start!83880 m!907547))

(declare-fun m!907549 () Bool)

(assert (=> b!980109 m!907549))

(assert (=> b!980109 m!907549))

(declare-fun m!907551 () Bool)

(assert (=> b!980109 m!907551))

(declare-fun m!907553 () Bool)

(assert (=> b!980105 m!907553))

(assert (=> b!980107 m!907549))

(declare-fun m!907555 () Bool)

(assert (=> b!980107 m!907555))

(declare-fun m!907557 () Bool)

(assert (=> b!980107 m!907557))

(declare-fun m!907559 () Bool)

(assert (=> b!980107 m!907559))

(declare-fun m!907561 () Bool)

(assert (=> b!980107 m!907561))

(declare-fun m!907563 () Bool)

(assert (=> b!980107 m!907563))

(assert (=> b!980107 m!907549))

(declare-fun m!907565 () Bool)

(assert (=> b!980107 m!907565))

(declare-fun m!907567 () Bool)

(assert (=> b!980107 m!907567))

(declare-fun m!907569 () Bool)

(assert (=> b!980107 m!907569))

(declare-fun m!907571 () Bool)

(assert (=> b!980107 m!907571))

(assert (=> b!980107 m!907555))

(assert (=> b!980107 m!907569))

(declare-fun m!907573 () Bool)

(assert (=> b!980107 m!907573))

(declare-fun m!907575 () Bool)

(assert (=> b!980108 m!907575))

(declare-fun m!907577 () Bool)

(assert (=> b!980101 m!907577))

(assert (=> b!980101 m!907577))

(declare-fun m!907579 () Bool)

(assert (=> b!980101 m!907579))

(assert (=> b!980101 m!907549))

(assert (=> b!980101 m!907549))

(declare-fun m!907581 () Bool)

(assert (=> b!980101 m!907581))

(declare-fun m!907583 () Bool)

(assert (=> mapNonEmpty!36053 m!907583))

(check-sat (not b!980105) (not b_lambda!14733) b_and!31469 (not b!980101) (not b!980107) (not start!83880) (not mapNonEmpty!36053) (not b!980108) (not b!980109) (not b_next!19689) tp_is_empty!22683)
(check-sat b_and!31469 (not b_next!19689))
