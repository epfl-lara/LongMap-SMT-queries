; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77826 () Bool)

(assert start!77826)

(declare-fun b_free!16243 () Bool)

(declare-fun b_next!16243 () Bool)

(assert (=> start!77826 (= b_free!16243 (not b_next!16243))))

(declare-fun tp!56991 () Bool)

(declare-fun b_and!26649 () Bool)

(assert (=> start!77826 (= tp!56991 b_and!26649)))

(declare-fun b!906395 () Bool)

(declare-fun e!507994 () Bool)

(declare-fun e!507992 () Bool)

(assert (=> b!906395 (= e!507994 (not e!507992))))

(declare-fun res!611378 () Bool)

(assert (=> b!906395 (=> res!611378 e!507992)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53407 0))(
  ( (array!53408 (arr!25658 (Array (_ BitVec 32) (_ BitVec 64))) (size!26118 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53407)

(assert (=> b!906395 (= res!611378 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26118 _keys!1386))))))

(declare-datatypes ((V!29847 0))(
  ( (V!29848 (val!9381 Int)) )
))
(declare-datatypes ((ValueCell!8849 0))(
  ( (ValueCellFull!8849 (v!11883 V!29847)) (EmptyCell!8849) )
))
(declare-datatypes ((array!53409 0))(
  ( (array!53410 (arr!25659 (Array (_ BitVec 32) ValueCell!8849)) (size!26119 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53409)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408933 () V!29847)

(declare-fun get!13491 (ValueCell!8849 V!29847) V!29847)

(declare-fun dynLambda!1345 (Int (_ BitVec 64)) V!29847)

(assert (=> b!906395 (= lt!408933 (get!13491 (select (arr!25659 _values!1152) i!717) (dynLambda!1345 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906395 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30718 0))(
  ( (Unit!30719) )
))
(declare-fun lt!408936 () Unit!30718)

(declare-fun zeroValue!1094 () V!29847)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29847)

(declare-fun lemmaKeyInListMapIsInArray!204 (array!53407 array!53409 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 64) Int) Unit!30718)

(assert (=> b!906395 (= lt!408936 (lemmaKeyInListMapIsInArray!204 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906396 () Bool)

(declare-fun res!611374 () Bool)

(declare-fun e!507997 () Bool)

(assert (=> b!906396 (=> (not res!611374) (not e!507997))))

(assert (=> b!906396 (= res!611374 (and (= (size!26119 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26118 _keys!1386) (size!26119 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906397 () Bool)

(declare-fun e!507995 () Bool)

(declare-fun tp_is_empty!18661 () Bool)

(assert (=> b!906397 (= e!507995 tp_is_empty!18661)))

(declare-fun mapIsEmpty!29704 () Bool)

(declare-fun mapRes!29704 () Bool)

(assert (=> mapIsEmpty!29704 mapRes!29704))

(declare-fun mapNonEmpty!29704 () Bool)

(declare-fun tp!56992 () Bool)

(declare-fun e!507998 () Bool)

(assert (=> mapNonEmpty!29704 (= mapRes!29704 (and tp!56992 e!507998))))

(declare-fun mapValue!29704 () ValueCell!8849)

(declare-fun mapRest!29704 () (Array (_ BitVec 32) ValueCell!8849))

(declare-fun mapKey!29704 () (_ BitVec 32))

(assert (=> mapNonEmpty!29704 (= (arr!25659 _values!1152) (store mapRest!29704 mapKey!29704 mapValue!29704))))

(declare-fun b!906398 () Bool)

(declare-fun e!507996 () Bool)

(assert (=> b!906398 (= e!507992 e!507996)))

(declare-fun res!611375 () Bool)

(assert (=> b!906398 (=> res!611375 e!507996)))

(declare-datatypes ((tuple2!12134 0))(
  ( (tuple2!12135 (_1!6078 (_ BitVec 64)) (_2!6078 V!29847)) )
))
(declare-datatypes ((List!17977 0))(
  ( (Nil!17974) (Cons!17973 (h!19125 tuple2!12134) (t!25384 List!17977)) )
))
(declare-datatypes ((ListLongMap!10833 0))(
  ( (ListLongMap!10834 (toList!5432 List!17977)) )
))
(declare-fun lt!408937 () ListLongMap!10833)

(declare-fun contains!4487 (ListLongMap!10833 (_ BitVec 64)) Bool)

(assert (=> b!906398 (= res!611375 (not (contains!4487 lt!408937 k0!1033)))))

(declare-fun getCurrentListMap!2698 (array!53407 array!53409 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 32) Int) ListLongMap!10833)

(assert (=> b!906398 (= lt!408937 (getCurrentListMap!2698 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906399 () Bool)

(assert (=> b!906399 (= e!507996 true)))

(declare-fun lt!408935 () ListLongMap!10833)

(declare-fun apply!455 (ListLongMap!10833 (_ BitVec 64)) V!29847)

(assert (=> b!906399 (= (apply!455 lt!408935 k0!1033) lt!408933)))

(declare-fun lt!408934 () Unit!30718)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!11 (array!53407 array!53409 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 64) V!29847 (_ BitVec 32) Int) Unit!30718)

(assert (=> b!906399 (= lt!408934 (lemmaListMapApplyFromThenApplyFromZero!11 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408933 i!717 defaultEntry!1160))))

(declare-fun b!906400 () Bool)

(declare-fun res!611382 () Bool)

(assert (=> b!906400 (=> res!611382 e!507996)))

(assert (=> b!906400 (= res!611382 (not (= (apply!455 lt!408937 k0!1033) lt!408933)))))

(declare-fun res!611380 () Bool)

(assert (=> start!77826 (=> (not res!611380) (not e!507997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77826 (= res!611380 (validMask!0 mask!1756))))

(assert (=> start!77826 e!507997))

(declare-fun e!507993 () Bool)

(declare-fun array_inv!20158 (array!53409) Bool)

(assert (=> start!77826 (and (array_inv!20158 _values!1152) e!507993)))

(assert (=> start!77826 tp!56991))

(assert (=> start!77826 true))

(assert (=> start!77826 tp_is_empty!18661))

(declare-fun array_inv!20159 (array!53407) Bool)

(assert (=> start!77826 (array_inv!20159 _keys!1386)))

(declare-fun b!906401 () Bool)

(declare-fun res!611383 () Bool)

(assert (=> b!906401 (=> (not res!611383) (not e!507997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53407 (_ BitVec 32)) Bool)

(assert (=> b!906401 (= res!611383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906402 () Bool)

(assert (=> b!906402 (= e!507993 (and e!507995 mapRes!29704))))

(declare-fun condMapEmpty!29704 () Bool)

(declare-fun mapDefault!29704 () ValueCell!8849)

(assert (=> b!906402 (= condMapEmpty!29704 (= (arr!25659 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8849)) mapDefault!29704)))))

(declare-fun b!906403 () Bool)

(declare-fun res!611377 () Bool)

(assert (=> b!906403 (=> (not res!611377) (not e!507997))))

(declare-datatypes ((List!17978 0))(
  ( (Nil!17975) (Cons!17974 (h!19126 (_ BitVec 64)) (t!25385 List!17978)) )
))
(declare-fun arrayNoDuplicates!0 (array!53407 (_ BitVec 32) List!17978) Bool)

(assert (=> b!906403 (= res!611377 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17975))))

(declare-fun b!906404 () Bool)

(assert (=> b!906404 (= e!507998 tp_is_empty!18661)))

(declare-fun b!906405 () Bool)

(declare-fun res!611381 () Bool)

(assert (=> b!906405 (=> (not res!611381) (not e!507994))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906405 (= res!611381 (inRange!0 i!717 mask!1756))))

(declare-fun b!906406 () Bool)

(assert (=> b!906406 (= e!507997 e!507994)))

(declare-fun res!611379 () Bool)

(assert (=> b!906406 (=> (not res!611379) (not e!507994))))

(assert (=> b!906406 (= res!611379 (contains!4487 lt!408935 k0!1033))))

(assert (=> b!906406 (= lt!408935 (getCurrentListMap!2698 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906407 () Bool)

(declare-fun res!611376 () Bool)

(assert (=> b!906407 (=> (not res!611376) (not e!507994))))

(assert (=> b!906407 (= res!611376 (and (= (select (arr!25658 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77826 res!611380) b!906396))

(assert (= (and b!906396 res!611374) b!906401))

(assert (= (and b!906401 res!611383) b!906403))

(assert (= (and b!906403 res!611377) b!906406))

(assert (= (and b!906406 res!611379) b!906405))

(assert (= (and b!906405 res!611381) b!906407))

(assert (= (and b!906407 res!611376) b!906395))

(assert (= (and b!906395 (not res!611378)) b!906398))

(assert (= (and b!906398 (not res!611375)) b!906400))

(assert (= (and b!906400 (not res!611382)) b!906399))

(assert (= (and b!906402 condMapEmpty!29704) mapIsEmpty!29704))

(assert (= (and b!906402 (not condMapEmpty!29704)) mapNonEmpty!29704))

(get-info :version)

(assert (= (and mapNonEmpty!29704 ((_ is ValueCellFull!8849) mapValue!29704)) b!906404))

(assert (= (and b!906402 ((_ is ValueCellFull!8849) mapDefault!29704)) b!906397))

(assert (= start!77826 b!906402))

(declare-fun b_lambda!13131 () Bool)

(assert (=> (not b_lambda!13131) (not b!906395)))

(declare-fun t!25383 () Bool)

(declare-fun tb!5257 () Bool)

(assert (=> (and start!77826 (= defaultEntry!1160 defaultEntry!1160) t!25383) tb!5257))

(declare-fun result!10317 () Bool)

(assert (=> tb!5257 (= result!10317 tp_is_empty!18661)))

(assert (=> b!906395 t!25383))

(declare-fun b_and!26651 () Bool)

(assert (= b_and!26649 (and (=> t!25383 result!10317) b_and!26651)))

(declare-fun m!842189 () Bool)

(assert (=> mapNonEmpty!29704 m!842189))

(declare-fun m!842191 () Bool)

(assert (=> b!906400 m!842191))

(declare-fun m!842193 () Bool)

(assert (=> b!906407 m!842193))

(declare-fun m!842195 () Bool)

(assert (=> start!77826 m!842195))

(declare-fun m!842197 () Bool)

(assert (=> start!77826 m!842197))

(declare-fun m!842199 () Bool)

(assert (=> start!77826 m!842199))

(declare-fun m!842201 () Bool)

(assert (=> b!906395 m!842201))

(declare-fun m!842203 () Bool)

(assert (=> b!906395 m!842203))

(declare-fun m!842205 () Bool)

(assert (=> b!906395 m!842205))

(declare-fun m!842207 () Bool)

(assert (=> b!906395 m!842207))

(assert (=> b!906395 m!842201))

(assert (=> b!906395 m!842205))

(declare-fun m!842209 () Bool)

(assert (=> b!906395 m!842209))

(declare-fun m!842211 () Bool)

(assert (=> b!906406 m!842211))

(declare-fun m!842213 () Bool)

(assert (=> b!906406 m!842213))

(declare-fun m!842215 () Bool)

(assert (=> b!906405 m!842215))

(declare-fun m!842217 () Bool)

(assert (=> b!906403 m!842217))

(declare-fun m!842219 () Bool)

(assert (=> b!906401 m!842219))

(declare-fun m!842221 () Bool)

(assert (=> b!906398 m!842221))

(declare-fun m!842223 () Bool)

(assert (=> b!906398 m!842223))

(declare-fun m!842225 () Bool)

(assert (=> b!906399 m!842225))

(declare-fun m!842227 () Bool)

(assert (=> b!906399 m!842227))

(check-sat (not b!906395) (not b!906403) (not b!906406) (not b!906400) (not b_next!16243) (not b!906398) (not b!906399) tp_is_empty!18661 (not b!906401) (not b!906405) (not b_lambda!13131) (not start!77826) b_and!26651 (not mapNonEmpty!29704))
(check-sat b_and!26651 (not b_next!16243))
