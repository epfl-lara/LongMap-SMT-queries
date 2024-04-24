; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83712 () Bool)

(assert start!83712)

(declare-fun b_free!19531 () Bool)

(declare-fun b_next!19531 () Bool)

(assert (=> start!83712 (= b_free!19531 (not b_next!19531))))

(declare-fun tp!67881 () Bool)

(declare-fun b_and!31167 () Bool)

(assert (=> start!83712 (= tp!67881 b_and!31167)))

(declare-fun b!977091 () Bool)

(declare-fun res!653846 () Bool)

(declare-fun e!550722 () Bool)

(assert (=> b!977091 (=> (not res!653846) (not e!550722))))

(declare-datatypes ((array!60936 0))(
  ( (array!60937 (arr!29327 (Array (_ BitVec 32) (_ BitVec 64))) (size!29807 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60936)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977091 (= res!653846 (validKeyInArray!0 (select (arr!29327 _keys!1717) i!822)))))

(declare-fun b!977092 () Bool)

(declare-fun res!653848 () Bool)

(assert (=> b!977092 (=> (not res!653848) (not e!550722))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60936 (_ BitVec 32)) Bool)

(assert (=> b!977092 (= res!653848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!977093 () Bool)

(declare-fun res!653852 () Bool)

(assert (=> b!977093 (=> (not res!653852) (not e!550722))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!977093 (= res!653852 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29807 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29807 _keys!1717))))))

(declare-fun b!977094 () Bool)

(declare-fun res!653849 () Bool)

(assert (=> b!977094 (=> (not res!653849) (not e!550722))))

(declare-datatypes ((V!34897 0))(
  ( (V!34898 (val!11268 Int)) )
))
(declare-datatypes ((ValueCell!10736 0))(
  ( (ValueCellFull!10736 (v!13824 V!34897)) (EmptyCell!10736) )
))
(declare-datatypes ((array!60938 0))(
  ( (array!60939 (arr!29328 (Array (_ BitVec 32) ValueCell!10736)) (size!29808 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60938)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!977094 (= res!653849 (and (= (size!29808 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29807 _keys!1717) (size!29808 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!977095 () Bool)

(declare-fun e!550717 () Bool)

(declare-fun tp_is_empty!22435 () Bool)

(assert (=> b!977095 (= e!550717 tp_is_empty!22435)))

(declare-fun b!977096 () Bool)

(declare-fun e!550721 () Bool)

(assert (=> b!977096 (= e!550722 e!550721)))

(declare-fun res!653851 () Bool)

(assert (=> b!977096 (=> (not res!653851) (not e!550721))))

(declare-datatypes ((tuple2!14502 0))(
  ( (tuple2!14503 (_1!7262 (_ BitVec 64)) (_2!7262 V!34897)) )
))
(declare-datatypes ((List!20345 0))(
  ( (Nil!20342) (Cons!20341 (h!21509 tuple2!14502) (t!28840 List!20345)) )
))
(declare-datatypes ((ListLongMap!13201 0))(
  ( (ListLongMap!13202 (toList!6616 List!20345)) )
))
(declare-fun lt!433380 () ListLongMap!13201)

(declare-fun contains!5714 (ListLongMap!13201 (_ BitVec 64)) Bool)

(assert (=> b!977096 (= res!653851 (contains!5714 lt!433380 (select (arr!29327 _keys!1717) i!822)))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34897)

(declare-fun zeroValue!1367 () V!34897)

(declare-fun getCurrentListMap!3849 (array!60936 array!60938 (_ BitVec 32) (_ BitVec 32) V!34897 V!34897 (_ BitVec 32) Int) ListLongMap!13201)

(assert (=> b!977096 (= lt!433380 (getCurrentListMap!3849 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!977097 () Bool)

(declare-fun res!653850 () Bool)

(assert (=> b!977097 (=> (not res!653850) (not e!550722))))

(declare-datatypes ((List!20346 0))(
  ( (Nil!20343) (Cons!20342 (h!21510 (_ BitVec 64)) (t!28841 List!20346)) )
))
(declare-fun arrayNoDuplicates!0 (array!60936 (_ BitVec 32) List!20346) Bool)

(assert (=> b!977097 (= res!653850 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20343))))

(declare-fun b!977098 () Bool)

(declare-fun e!550723 () Bool)

(assert (=> b!977098 (= e!550723 tp_is_empty!22435)))

(declare-fun res!653845 () Bool)

(assert (=> start!83712 (=> (not res!653845) (not e!550722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83712 (= res!653845 (validMask!0 mask!2147))))

(assert (=> start!83712 e!550722))

(assert (=> start!83712 true))

(declare-fun e!550719 () Bool)

(declare-fun array_inv!22735 (array!60938) Bool)

(assert (=> start!83712 (and (array_inv!22735 _values!1425) e!550719)))

(assert (=> start!83712 tp_is_empty!22435))

(assert (=> start!83712 tp!67881))

(declare-fun array_inv!22736 (array!60936) Bool)

(assert (=> start!83712 (array_inv!22736 _keys!1717)))

(declare-fun mapIsEmpty!35662 () Bool)

(declare-fun mapRes!35662 () Bool)

(assert (=> mapIsEmpty!35662 mapRes!35662))

(declare-fun b!977099 () Bool)

(declare-fun e!550718 () Bool)

(assert (=> b!977099 (= e!550721 e!550718)))

(declare-fun res!653847 () Bool)

(assert (=> b!977099 (=> (not res!653847) (not e!550718))))

(declare-fun lt!433379 () (_ BitVec 64))

(assert (=> b!977099 (= res!653847 (validKeyInArray!0 lt!433379))))

(assert (=> b!977099 (= lt!433379 (select (arr!29327 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433377 () ListLongMap!13201)

(assert (=> b!977099 (= lt!433377 (getCurrentListMap!3849 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35662 () Bool)

(declare-fun tp!67882 () Bool)

(assert (=> mapNonEmpty!35662 (= mapRes!35662 (and tp!67882 e!550717))))

(declare-fun mapRest!35662 () (Array (_ BitVec 32) ValueCell!10736))

(declare-fun mapKey!35662 () (_ BitVec 32))

(declare-fun mapValue!35662 () ValueCell!10736)

(assert (=> mapNonEmpty!35662 (= (arr!29328 _values!1425) (store mapRest!35662 mapKey!35662 mapValue!35662))))

(declare-fun b!977100 () Bool)

(assert (=> b!977100 (= e!550718 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-fun lt!433383 () tuple2!14502)

(declare-fun +!2934 (ListLongMap!13201 tuple2!14502) ListLongMap!13201)

(assert (=> b!977100 (contains!5714 (+!2934 lt!433380 lt!433383) (select (arr!29327 _keys!1717) i!822))))

(declare-datatypes ((Unit!32432 0))(
  ( (Unit!32433) )
))
(declare-fun lt!433378 () Unit!32432)

(declare-fun lt!433381 () V!34897)

(declare-fun addStillContains!607 (ListLongMap!13201 (_ BitVec 64) V!34897 (_ BitVec 64)) Unit!32432)

(assert (=> b!977100 (= lt!433378 (addStillContains!607 lt!433380 lt!433379 lt!433381 (select (arr!29327 _keys!1717) i!822)))))

(assert (=> b!977100 (= lt!433377 (+!2934 (getCurrentListMap!3849 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!433383))))

(assert (=> b!977100 (= lt!433383 (tuple2!14503 lt!433379 lt!433381))))

(declare-fun get!15205 (ValueCell!10736 V!34897) V!34897)

(declare-fun dynLambda!1731 (Int (_ BitVec 64)) V!34897)

(assert (=> b!977100 (= lt!433381 (get!15205 (select (arr!29328 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1731 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433382 () Unit!32432)

(declare-fun lemmaListMapRecursiveValidKeyArray!290 (array!60936 array!60938 (_ BitVec 32) (_ BitVec 32) V!34897 V!34897 (_ BitVec 32) Int) Unit!32432)

(assert (=> b!977100 (= lt!433382 (lemmaListMapRecursiveValidKeyArray!290 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977101 () Bool)

(assert (=> b!977101 (= e!550719 (and e!550723 mapRes!35662))))

(declare-fun condMapEmpty!35662 () Bool)

(declare-fun mapDefault!35662 () ValueCell!10736)

(assert (=> b!977101 (= condMapEmpty!35662 (= (arr!29328 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10736)) mapDefault!35662)))))

(assert (= (and start!83712 res!653845) b!977094))

(assert (= (and b!977094 res!653849) b!977092))

(assert (= (and b!977092 res!653848) b!977097))

(assert (= (and b!977097 res!653850) b!977093))

(assert (= (and b!977093 res!653852) b!977091))

(assert (= (and b!977091 res!653846) b!977096))

(assert (= (and b!977096 res!653851) b!977099))

(assert (= (and b!977099 res!653847) b!977100))

(assert (= (and b!977101 condMapEmpty!35662) mapIsEmpty!35662))

(assert (= (and b!977101 (not condMapEmpty!35662)) mapNonEmpty!35662))

(get-info :version)

(assert (= (and mapNonEmpty!35662 ((_ is ValueCellFull!10736) mapValue!35662)) b!977095))

(assert (= (and b!977101 ((_ is ValueCellFull!10736) mapDefault!35662)) b!977098))

(assert (= start!83712 b!977101))

(declare-fun b_lambda!14583 () Bool)

(assert (=> (not b_lambda!14583) (not b!977100)))

(declare-fun t!28839 () Bool)

(declare-fun tb!6345 () Bool)

(assert (=> (and start!83712 (= defaultEntry!1428 defaultEntry!1428) t!28839) tb!6345))

(declare-fun result!12675 () Bool)

(assert (=> tb!6345 (= result!12675 tp_is_empty!22435)))

(assert (=> b!977100 t!28839))

(declare-fun b_and!31169 () Bool)

(assert (= b_and!31167 (and (=> t!28839 result!12675) b_and!31169)))

(declare-fun m!904679 () Bool)

(assert (=> b!977092 m!904679))

(declare-fun m!904681 () Bool)

(assert (=> b!977091 m!904681))

(assert (=> b!977091 m!904681))

(declare-fun m!904683 () Bool)

(assert (=> b!977091 m!904683))

(declare-fun m!904685 () Bool)

(assert (=> b!977099 m!904685))

(declare-fun m!904687 () Bool)

(assert (=> b!977099 m!904687))

(declare-fun m!904689 () Bool)

(assert (=> b!977099 m!904689))

(declare-fun m!904691 () Bool)

(assert (=> mapNonEmpty!35662 m!904691))

(declare-fun m!904693 () Bool)

(assert (=> b!977100 m!904693))

(assert (=> b!977100 m!904681))

(declare-fun m!904695 () Bool)

(assert (=> b!977100 m!904695))

(declare-fun m!904697 () Bool)

(assert (=> b!977100 m!904697))

(assert (=> b!977100 m!904681))

(assert (=> b!977100 m!904693))

(declare-fun m!904699 () Bool)

(assert (=> b!977100 m!904699))

(declare-fun m!904701 () Bool)

(assert (=> b!977100 m!904701))

(declare-fun m!904703 () Bool)

(assert (=> b!977100 m!904703))

(assert (=> b!977100 m!904681))

(declare-fun m!904705 () Bool)

(assert (=> b!977100 m!904705))

(assert (=> b!977100 m!904697))

(declare-fun m!904707 () Bool)

(assert (=> b!977100 m!904707))

(declare-fun m!904709 () Bool)

(assert (=> b!977100 m!904709))

(assert (=> b!977100 m!904699))

(assert (=> b!977100 m!904703))

(declare-fun m!904711 () Bool)

(assert (=> start!83712 m!904711))

(declare-fun m!904713 () Bool)

(assert (=> start!83712 m!904713))

(declare-fun m!904715 () Bool)

(assert (=> start!83712 m!904715))

(declare-fun m!904717 () Bool)

(assert (=> b!977097 m!904717))

(assert (=> b!977096 m!904681))

(assert (=> b!977096 m!904681))

(declare-fun m!904719 () Bool)

(assert (=> b!977096 m!904719))

(declare-fun m!904721 () Bool)

(assert (=> b!977096 m!904721))

(check-sat (not b!977096) (not b_next!19531) (not b!977097) b_and!31169 (not b!977099) (not mapNonEmpty!35662) (not b_lambda!14583) (not b!977091) (not b!977092) tp_is_empty!22435 (not b!977100) (not start!83712))
(check-sat b_and!31169 (not b_next!19531))
