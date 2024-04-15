; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77640 () Bool)

(assert start!77640)

(declare-fun b_free!16243 () Bool)

(declare-fun b_next!16243 () Bool)

(assert (=> start!77640 (= b_free!16243 (not b_next!16243))))

(declare-fun tp!56991 () Bool)

(declare-fun b_and!26613 () Bool)

(assert (=> start!77640 (= tp!56991 b_and!26613)))

(declare-fun b!905254 () Bool)

(declare-fun e!507268 () Bool)

(declare-fun e!507264 () Bool)

(declare-fun mapRes!29704 () Bool)

(assert (=> b!905254 (= e!507268 (and e!507264 mapRes!29704))))

(declare-fun condMapEmpty!29704 () Bool)

(declare-datatypes ((V!29847 0))(
  ( (V!29848 (val!9381 Int)) )
))
(declare-datatypes ((ValueCell!8849 0))(
  ( (ValueCellFull!8849 (v!11885 V!29847)) (EmptyCell!8849) )
))
(declare-datatypes ((array!53343 0))(
  ( (array!53344 (arr!25631 (Array (_ BitVec 32) ValueCell!8849)) (size!26092 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53343)

(declare-fun mapDefault!29704 () ValueCell!8849)

(assert (=> b!905254 (= condMapEmpty!29704 (= (arr!25631 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8849)) mapDefault!29704)))))

(declare-fun b!905255 () Bool)

(declare-fun res!610929 () Bool)

(declare-fun e!507262 () Bool)

(assert (=> b!905255 (=> (not res!610929) (not e!507262))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905255 (= res!610929 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29704 () Bool)

(declare-fun tp!56992 () Bool)

(declare-fun e!507267 () Bool)

(assert (=> mapNonEmpty!29704 (= mapRes!29704 (and tp!56992 e!507267))))

(declare-fun mapValue!29704 () ValueCell!8849)

(declare-fun mapRest!29704 () (Array (_ BitVec 32) ValueCell!8849))

(declare-fun mapKey!29704 () (_ BitVec 32))

(assert (=> mapNonEmpty!29704 (= (arr!25631 _values!1152) (store mapRest!29704 mapKey!29704 mapValue!29704))))

(declare-fun b!905256 () Bool)

(declare-fun e!507265 () Bool)

(assert (=> b!905256 (= e!507265 true)))

(declare-datatypes ((tuple2!12220 0))(
  ( (tuple2!12221 (_1!6121 (_ BitVec 64)) (_2!6121 V!29847)) )
))
(declare-datatypes ((List!18017 0))(
  ( (Nil!18014) (Cons!18013 (h!19159 tuple2!12220) (t!25423 List!18017)) )
))
(declare-datatypes ((ListLongMap!10907 0))(
  ( (ListLongMap!10908 (toList!5469 List!18017)) )
))
(declare-fun lt!408337 () ListLongMap!10907)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408336 () V!29847)

(declare-fun apply!449 (ListLongMap!10907 (_ BitVec 64)) V!29847)

(assert (=> b!905256 (= (apply!449 lt!408337 k0!1033) lt!408336)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29847)

(declare-datatypes ((array!53345 0))(
  ( (array!53346 (arr!25632 (Array (_ BitVec 32) (_ BitVec 64))) (size!26093 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53345)

(declare-datatypes ((Unit!30646 0))(
  ( (Unit!30647) )
))
(declare-fun lt!408338 () Unit!30646)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29847)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!12 (array!53345 array!53343 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 64) V!29847 (_ BitVec 32) Int) Unit!30646)

(assert (=> b!905256 (= lt!408338 (lemmaListMapApplyFromThenApplyFromZero!12 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408336 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29704 () Bool)

(assert (=> mapIsEmpty!29704 mapRes!29704))

(declare-fun b!905257 () Bool)

(declare-fun e!507269 () Bool)

(assert (=> b!905257 (= e!507269 e!507262)))

(declare-fun res!610926 () Bool)

(assert (=> b!905257 (=> (not res!610926) (not e!507262))))

(declare-fun contains!4478 (ListLongMap!10907 (_ BitVec 64)) Bool)

(assert (=> b!905257 (= res!610926 (contains!4478 lt!408337 k0!1033))))

(declare-fun getCurrentListMap!2682 (array!53345 array!53343 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 32) Int) ListLongMap!10907)

(assert (=> b!905257 (= lt!408337 (getCurrentListMap!2682 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905258 () Bool)

(declare-fun e!507266 () Bool)

(assert (=> b!905258 (= e!507266 e!507265)))

(declare-fun res!610927 () Bool)

(assert (=> b!905258 (=> res!610927 e!507265)))

(declare-fun lt!408340 () ListLongMap!10907)

(assert (=> b!905258 (= res!610927 (not (contains!4478 lt!408340 k0!1033)))))

(assert (=> b!905258 (= lt!408340 (getCurrentListMap!2682 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!610928 () Bool)

(assert (=> start!77640 (=> (not res!610928) (not e!507269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77640 (= res!610928 (validMask!0 mask!1756))))

(assert (=> start!77640 e!507269))

(declare-fun array_inv!20128 (array!53343) Bool)

(assert (=> start!77640 (and (array_inv!20128 _values!1152) e!507268)))

(assert (=> start!77640 tp!56991))

(assert (=> start!77640 true))

(declare-fun tp_is_empty!18661 () Bool)

(assert (=> start!77640 tp_is_empty!18661))

(declare-fun array_inv!20129 (array!53345) Bool)

(assert (=> start!77640 (array_inv!20129 _keys!1386)))

(declare-fun b!905253 () Bool)

(declare-fun res!610922 () Bool)

(assert (=> b!905253 (=> (not res!610922) (not e!507269))))

(declare-datatypes ((List!18018 0))(
  ( (Nil!18015) (Cons!18014 (h!19160 (_ BitVec 64)) (t!25424 List!18018)) )
))
(declare-fun arrayNoDuplicates!0 (array!53345 (_ BitVec 32) List!18018) Bool)

(assert (=> b!905253 (= res!610922 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18015))))

(declare-fun b!905259 () Bool)

(declare-fun res!610924 () Bool)

(assert (=> b!905259 (=> (not res!610924) (not e!507269))))

(assert (=> b!905259 (= res!610924 (and (= (size!26092 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26093 _keys!1386) (size!26092 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905260 () Bool)

(assert (=> b!905260 (= e!507264 tp_is_empty!18661)))

(declare-fun b!905261 () Bool)

(declare-fun res!610925 () Bool)

(assert (=> b!905261 (=> (not res!610925) (not e!507262))))

(assert (=> b!905261 (= res!610925 (and (= (select (arr!25632 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905262 () Bool)

(declare-fun res!610921 () Bool)

(assert (=> b!905262 (=> res!610921 e!507265)))

(assert (=> b!905262 (= res!610921 (not (= (apply!449 lt!408340 k0!1033) lt!408336)))))

(declare-fun b!905263 () Bool)

(assert (=> b!905263 (= e!507262 (not e!507266))))

(declare-fun res!610923 () Bool)

(assert (=> b!905263 (=> res!610923 e!507266)))

(assert (=> b!905263 (= res!610923 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26093 _keys!1386))))))

(declare-fun get!13474 (ValueCell!8849 V!29847) V!29847)

(declare-fun dynLambda!1327 (Int (_ BitVec 64)) V!29847)

(assert (=> b!905263 (= lt!408336 (get!13474 (select (arr!25631 _values!1152) i!717) (dynLambda!1327 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905263 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408339 () Unit!30646)

(declare-fun lemmaKeyInListMapIsInArray!203 (array!53345 array!53343 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 64) Int) Unit!30646)

(assert (=> b!905263 (= lt!408339 (lemmaKeyInListMapIsInArray!203 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905264 () Bool)

(assert (=> b!905264 (= e!507267 tp_is_empty!18661)))

(declare-fun b!905265 () Bool)

(declare-fun res!610920 () Bool)

(assert (=> b!905265 (=> (not res!610920) (not e!507269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53345 (_ BitVec 32)) Bool)

(assert (=> b!905265 (= res!610920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77640 res!610928) b!905259))

(assert (= (and b!905259 res!610924) b!905265))

(assert (= (and b!905265 res!610920) b!905253))

(assert (= (and b!905253 res!610922) b!905257))

(assert (= (and b!905257 res!610926) b!905255))

(assert (= (and b!905255 res!610929) b!905261))

(assert (= (and b!905261 res!610925) b!905263))

(assert (= (and b!905263 (not res!610923)) b!905258))

(assert (= (and b!905258 (not res!610927)) b!905262))

(assert (= (and b!905262 (not res!610921)) b!905256))

(assert (= (and b!905254 condMapEmpty!29704) mapIsEmpty!29704))

(assert (= (and b!905254 (not condMapEmpty!29704)) mapNonEmpty!29704))

(get-info :version)

(assert (= (and mapNonEmpty!29704 ((_ is ValueCellFull!8849) mapValue!29704)) b!905264))

(assert (= (and b!905254 ((_ is ValueCellFull!8849) mapDefault!29704)) b!905260))

(assert (= start!77640 b!905254))

(declare-fun b_lambda!13099 () Bool)

(assert (=> (not b_lambda!13099) (not b!905263)))

(declare-fun t!25422 () Bool)

(declare-fun tb!5257 () Bool)

(assert (=> (and start!77640 (= defaultEntry!1160 defaultEntry!1160) t!25422) tb!5257))

(declare-fun result!10317 () Bool)

(assert (=> tb!5257 (= result!10317 tp_is_empty!18661)))

(assert (=> b!905263 t!25422))

(declare-fun b_and!26615 () Bool)

(assert (= b_and!26613 (and (=> t!25422 result!10317) b_and!26615)))

(declare-fun m!840137 () Bool)

(assert (=> b!905261 m!840137))

(declare-fun m!840139 () Bool)

(assert (=> mapNonEmpty!29704 m!840139))

(declare-fun m!840141 () Bool)

(assert (=> b!905255 m!840141))

(declare-fun m!840143 () Bool)

(assert (=> b!905257 m!840143))

(declare-fun m!840145 () Bool)

(assert (=> b!905257 m!840145))

(declare-fun m!840147 () Bool)

(assert (=> b!905258 m!840147))

(declare-fun m!840149 () Bool)

(assert (=> b!905258 m!840149))

(declare-fun m!840151 () Bool)

(assert (=> b!905262 m!840151))

(declare-fun m!840153 () Bool)

(assert (=> b!905263 m!840153))

(declare-fun m!840155 () Bool)

(assert (=> b!905263 m!840155))

(declare-fun m!840157 () Bool)

(assert (=> b!905263 m!840157))

(declare-fun m!840159 () Bool)

(assert (=> b!905263 m!840159))

(assert (=> b!905263 m!840153))

(assert (=> b!905263 m!840157))

(declare-fun m!840161 () Bool)

(assert (=> b!905263 m!840161))

(declare-fun m!840163 () Bool)

(assert (=> b!905256 m!840163))

(declare-fun m!840165 () Bool)

(assert (=> b!905256 m!840165))

(declare-fun m!840167 () Bool)

(assert (=> b!905253 m!840167))

(declare-fun m!840169 () Bool)

(assert (=> b!905265 m!840169))

(declare-fun m!840171 () Bool)

(assert (=> start!77640 m!840171))

(declare-fun m!840173 () Bool)

(assert (=> start!77640 m!840173))

(declare-fun m!840175 () Bool)

(assert (=> start!77640 m!840175))

(check-sat (not b!905265) tp_is_empty!18661 (not b_lambda!13099) (not b!905256) (not b!905263) (not mapNonEmpty!29704) (not start!77640) (not b_next!16243) (not b!905258) (not b!905255) (not b!905257) (not b!905253) (not b!905262) b_and!26615)
(check-sat b_and!26615 (not b_next!16243))
