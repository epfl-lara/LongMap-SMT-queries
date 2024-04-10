; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84084 () Bool)

(assert start!84084)

(declare-fun b_free!19839 () Bool)

(declare-fun b_next!19839 () Bool)

(assert (=> start!84084 (= b_free!19839 (not b_next!19839))))

(declare-fun tp!69039 () Bool)

(declare-fun b_and!31761 () Bool)

(assert (=> start!84084 (= tp!69039 b_and!31761)))

(declare-fun b!983224 () Bool)

(declare-fun res!657986 () Bool)

(declare-fun e!554198 () Bool)

(assert (=> b!983224 (=> (not res!657986) (not e!554198))))

(declare-datatypes ((array!61763 0))(
  ( (array!61764 (arr!29739 (Array (_ BitVec 32) (_ BitVec 64))) (size!30218 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61763)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61763 (_ BitVec 32)) Bool)

(assert (=> b!983224 (= res!657986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983225 () Bool)

(declare-fun res!657985 () Bool)

(assert (=> b!983225 (=> (not res!657985) (not e!554198))))

(declare-datatypes ((V!35499 0))(
  ( (V!35500 (val!11494 Int)) )
))
(declare-datatypes ((ValueCell!10962 0))(
  ( (ValueCellFull!10962 (v!14056 V!35499)) (EmptyCell!10962) )
))
(declare-datatypes ((array!61765 0))(
  ( (array!61766 (arr!29740 (Array (_ BitVec 32) ValueCell!10962)) (size!30219 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61765)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983225 (= res!657985 (and (= (size!30219 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30218 _keys!1544) (size!30219 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983226 () Bool)

(declare-fun res!657984 () Bool)

(assert (=> b!983226 (=> (not res!657984) (not e!554198))))

(assert (=> b!983226 (= res!657984 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983227 () Bool)

(declare-fun res!657981 () Bool)

(assert (=> b!983227 (=> (not res!657981) (not e!554198))))

(declare-datatypes ((List!20604 0))(
  ( (Nil!20601) (Cons!20600 (h!21762 (_ BitVec 64)) (t!29393 List!20604)) )
))
(declare-fun arrayNoDuplicates!0 (array!61763 (_ BitVec 32) List!20604) Bool)

(assert (=> b!983227 (= res!657981 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20601))))

(declare-fun b!983228 () Bool)

(declare-fun res!657982 () Bool)

(assert (=> b!983228 (=> (not res!657982) (not e!554198))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983228 (= res!657982 (validKeyInArray!0 (select (arr!29739 _keys!1544) from!1932)))))

(declare-fun b!983229 () Bool)

(declare-fun e!554197 () Bool)

(declare-fun tp_is_empty!22887 () Bool)

(assert (=> b!983229 (= e!554197 tp_is_empty!22887)))

(declare-fun b!983230 () Bool)

(declare-fun e!554200 () Bool)

(assert (=> b!983230 (= e!554198 e!554200)))

(declare-fun res!657979 () Bool)

(assert (=> b!983230 (=> (not res!657979) (not e!554200))))

(assert (=> b!983230 (= res!657979 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29739 _keys!1544) from!1932))))))

(declare-fun lt!436471 () V!35499)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15429 (ValueCell!10962 V!35499) V!35499)

(declare-fun dynLambda!1806 (Int (_ BitVec 64)) V!35499)

(assert (=> b!983230 (= lt!436471 (get!15429 (select (arr!29740 _values!1278) from!1932) (dynLambda!1806 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35499)

(declare-fun zeroValue!1220 () V!35499)

(declare-datatypes ((tuple2!14728 0))(
  ( (tuple2!14729 (_1!7375 (_ BitVec 64)) (_2!7375 V!35499)) )
))
(declare-datatypes ((List!20605 0))(
  ( (Nil!20602) (Cons!20601 (h!21763 tuple2!14728) (t!29394 List!20605)) )
))
(declare-datatypes ((ListLongMap!13425 0))(
  ( (ListLongMap!13426 (toList!6728 List!20605)) )
))
(declare-fun lt!436473 () ListLongMap!13425)

(declare-fun getCurrentListMapNoExtraKeys!3423 (array!61763 array!61765 (_ BitVec 32) (_ BitVec 32) V!35499 V!35499 (_ BitVec 32) Int) ListLongMap!13425)

(assert (=> b!983230 (= lt!436473 (getCurrentListMapNoExtraKeys!3423 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983232 () Bool)

(declare-fun e!554201 () Bool)

(declare-fun e!554202 () Bool)

(declare-fun mapRes!36359 () Bool)

(assert (=> b!983232 (= e!554201 (and e!554202 mapRes!36359))))

(declare-fun condMapEmpty!36359 () Bool)

(declare-fun mapDefault!36359 () ValueCell!10962)

(assert (=> b!983232 (= condMapEmpty!36359 (= (arr!29740 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10962)) mapDefault!36359)))))

(declare-fun mapNonEmpty!36359 () Bool)

(declare-fun tp!69040 () Bool)

(assert (=> mapNonEmpty!36359 (= mapRes!36359 (and tp!69040 e!554197))))

(declare-fun mapKey!36359 () (_ BitVec 32))

(declare-fun mapValue!36359 () ValueCell!10962)

(declare-fun mapRest!36359 () (Array (_ BitVec 32) ValueCell!10962))

(assert (=> mapNonEmpty!36359 (= (arr!29740 _values!1278) (store mapRest!36359 mapKey!36359 mapValue!36359))))

(declare-fun mapIsEmpty!36359 () Bool)

(assert (=> mapIsEmpty!36359 mapRes!36359))

(declare-fun b!983233 () Bool)

(declare-fun res!657980 () Bool)

(assert (=> b!983233 (=> (not res!657980) (not e!554198))))

(assert (=> b!983233 (= res!657980 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30218 _keys!1544))))))

(declare-fun b!983234 () Bool)

(assert (=> b!983234 (= e!554202 tp_is_empty!22887)))

(declare-fun b!983231 () Bool)

(assert (=> b!983231 (= e!554200 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun lt!436472 () tuple2!14728)

(declare-fun lt!436475 () tuple2!14728)

(declare-fun +!3025 (ListLongMap!13425 tuple2!14728) ListLongMap!13425)

(assert (=> b!983231 (= (+!3025 (+!3025 lt!436473 lt!436472) lt!436475) (+!3025 (+!3025 lt!436473 lt!436475) lt!436472))))

(assert (=> b!983231 (= lt!436475 (tuple2!14729 (select (arr!29739 _keys!1544) from!1932) lt!436471))))

(assert (=> b!983231 (= lt!436472 (tuple2!14729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32689 0))(
  ( (Unit!32690) )
))
(declare-fun lt!436474 () Unit!32689)

(declare-fun addCommutativeForDiffKeys!653 (ListLongMap!13425 (_ BitVec 64) V!35499 (_ BitVec 64) V!35499) Unit!32689)

(assert (=> b!983231 (= lt!436474 (addCommutativeForDiffKeys!653 lt!436473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29739 _keys!1544) from!1932) lt!436471))))

(declare-fun res!657983 () Bool)

(assert (=> start!84084 (=> (not res!657983) (not e!554198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84084 (= res!657983 (validMask!0 mask!1948))))

(assert (=> start!84084 e!554198))

(assert (=> start!84084 true))

(assert (=> start!84084 tp_is_empty!22887))

(declare-fun array_inv!22997 (array!61765) Bool)

(assert (=> start!84084 (and (array_inv!22997 _values!1278) e!554201)))

(assert (=> start!84084 tp!69039))

(declare-fun array_inv!22998 (array!61763) Bool)

(assert (=> start!84084 (array_inv!22998 _keys!1544)))

(assert (= (and start!84084 res!657983) b!983225))

(assert (= (and b!983225 res!657985) b!983224))

(assert (= (and b!983224 res!657986) b!983227))

(assert (= (and b!983227 res!657981) b!983233))

(assert (= (and b!983233 res!657980) b!983228))

(assert (= (and b!983228 res!657982) b!983226))

(assert (= (and b!983226 res!657984) b!983230))

(assert (= (and b!983230 res!657979) b!983231))

(assert (= (and b!983232 condMapEmpty!36359) mapIsEmpty!36359))

(assert (= (and b!983232 (not condMapEmpty!36359)) mapNonEmpty!36359))

(get-info :version)

(assert (= (and mapNonEmpty!36359 ((_ is ValueCellFull!10962) mapValue!36359)) b!983229))

(assert (= (and b!983232 ((_ is ValueCellFull!10962) mapDefault!36359)) b!983234))

(assert (= start!84084 b!983232))

(declare-fun b_lambda!14877 () Bool)

(assert (=> (not b_lambda!14877) (not b!983230)))

(declare-fun t!29392 () Bool)

(declare-fun tb!6639 () Bool)

(assert (=> (and start!84084 (= defaultEntry!1281 defaultEntry!1281) t!29392) tb!6639))

(declare-fun result!13267 () Bool)

(assert (=> tb!6639 (= result!13267 tp_is_empty!22887)))

(assert (=> b!983230 t!29392))

(declare-fun b_and!31763 () Bool)

(assert (= b_and!31761 (and (=> t!29392 result!13267) b_and!31763)))

(declare-fun m!910541 () Bool)

(assert (=> b!983227 m!910541))

(declare-fun m!910543 () Bool)

(assert (=> mapNonEmpty!36359 m!910543))

(declare-fun m!910545 () Bool)

(assert (=> b!983231 m!910545))

(declare-fun m!910547 () Bool)

(assert (=> b!983231 m!910547))

(assert (=> b!983231 m!910545))

(declare-fun m!910549 () Bool)

(assert (=> b!983231 m!910549))

(assert (=> b!983231 m!910549))

(declare-fun m!910551 () Bool)

(assert (=> b!983231 m!910551))

(declare-fun m!910553 () Bool)

(assert (=> b!983231 m!910553))

(declare-fun m!910555 () Bool)

(assert (=> b!983231 m!910555))

(assert (=> b!983231 m!910553))

(assert (=> b!983230 m!910545))

(declare-fun m!910557 () Bool)

(assert (=> b!983230 m!910557))

(declare-fun m!910559 () Bool)

(assert (=> b!983230 m!910559))

(declare-fun m!910561 () Bool)

(assert (=> b!983230 m!910561))

(assert (=> b!983230 m!910557))

(assert (=> b!983230 m!910561))

(declare-fun m!910563 () Bool)

(assert (=> b!983230 m!910563))

(declare-fun m!910565 () Bool)

(assert (=> start!84084 m!910565))

(declare-fun m!910567 () Bool)

(assert (=> start!84084 m!910567))

(declare-fun m!910569 () Bool)

(assert (=> start!84084 m!910569))

(declare-fun m!910571 () Bool)

(assert (=> b!983224 m!910571))

(assert (=> b!983228 m!910545))

(assert (=> b!983228 m!910545))

(declare-fun m!910573 () Bool)

(assert (=> b!983228 m!910573))

(check-sat (not b!983230) (not b_lambda!14877) b_and!31763 (not mapNonEmpty!36359) (not b!983224) (not b!983231) (not b!983227) (not b!983228) tp_is_empty!22887 (not start!84084) (not b_next!19839))
(check-sat b_and!31763 (not b_next!19839))
