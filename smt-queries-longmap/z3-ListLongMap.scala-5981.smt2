; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77880 () Bool)

(assert start!77880)

(declare-fun b_free!16297 () Bool)

(declare-fun b_next!16297 () Bool)

(assert (=> start!77880 (= b_free!16297 (not b_next!16297))))

(declare-fun tp!57154 () Bool)

(declare-fun b_and!26757 () Bool)

(assert (=> start!77880 (= tp!57154 b_and!26757)))

(declare-fun b!907502 () Bool)

(declare-fun e!508642 () Bool)

(declare-fun tp_is_empty!18715 () Bool)

(assert (=> b!907502 (= e!508642 tp_is_empty!18715)))

(declare-fun b!907503 () Bool)

(declare-fun res!612185 () Bool)

(declare-fun e!508641 () Bool)

(assert (=> b!907503 (=> (not res!612185) (not e!508641))))

(declare-datatypes ((array!53513 0))(
  ( (array!53514 (arr!25711 (Array (_ BitVec 32) (_ BitVec 64))) (size!26171 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53513)

(declare-datatypes ((List!18017 0))(
  ( (Nil!18014) (Cons!18013 (h!19165 (_ BitVec 64)) (t!25478 List!18017)) )
))
(declare-fun arrayNoDuplicates!0 (array!53513 (_ BitVec 32) List!18017) Bool)

(assert (=> b!907503 (= res!612185 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18014))))

(declare-fun b!907504 () Bool)

(declare-fun res!612191 () Bool)

(declare-fun e!508643 () Bool)

(assert (=> b!907504 (=> res!612191 e!508643)))

(declare-datatypes ((V!29919 0))(
  ( (V!29920 (val!9408 Int)) )
))
(declare-datatypes ((tuple2!12182 0))(
  ( (tuple2!12183 (_1!6102 (_ BitVec 64)) (_2!6102 V!29919)) )
))
(declare-datatypes ((List!18018 0))(
  ( (Nil!18015) (Cons!18014 (h!19166 tuple2!12182) (t!25479 List!18018)) )
))
(declare-datatypes ((ListLongMap!10881 0))(
  ( (ListLongMap!10882 (toList!5456 List!18018)) )
))
(declare-fun lt!409341 () ListLongMap!10881)

(declare-fun lt!409340 () V!29919)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!475 (ListLongMap!10881 (_ BitVec 64)) V!29919)

(assert (=> b!907504 (= res!612191 (not (= (apply!475 lt!409341 k0!1033) lt!409340)))))

(declare-fun b!907505 () Bool)

(declare-fun res!612192 () Bool)

(declare-fun e!508644 () Bool)

(assert (=> b!907505 (=> (not res!612192) (not e!508644))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!907505 (= res!612192 (and (= (select (arr!25711 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!29785 () Bool)

(declare-fun mapRes!29785 () Bool)

(assert (=> mapIsEmpty!29785 mapRes!29785))

(declare-fun b!907506 () Bool)

(declare-fun e!508646 () Bool)

(assert (=> b!907506 (= e!508646 tp_is_empty!18715)))

(declare-fun res!612184 () Bool)

(assert (=> start!77880 (=> (not res!612184) (not e!508641))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77880 (= res!612184 (validMask!0 mask!1756))))

(assert (=> start!77880 e!508641))

(declare-datatypes ((ValueCell!8876 0))(
  ( (ValueCellFull!8876 (v!11910 V!29919)) (EmptyCell!8876) )
))
(declare-datatypes ((array!53515 0))(
  ( (array!53516 (arr!25712 (Array (_ BitVec 32) ValueCell!8876)) (size!26172 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53515)

(declare-fun e!508645 () Bool)

(declare-fun array_inv!20192 (array!53515) Bool)

(assert (=> start!77880 (and (array_inv!20192 _values!1152) e!508645)))

(assert (=> start!77880 tp!57154))

(assert (=> start!77880 true))

(assert (=> start!77880 tp_is_empty!18715))

(declare-fun array_inv!20193 (array!53513) Bool)

(assert (=> start!77880 (array_inv!20193 _keys!1386)))

(declare-fun b!907507 () Bool)

(declare-fun e!508640 () Bool)

(assert (=> b!907507 (= e!508644 (not e!508640))))

(declare-fun res!612190 () Bool)

(assert (=> b!907507 (=> res!612190 e!508640)))

(assert (=> b!907507 (= res!612190 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26171 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13531 (ValueCell!8876 V!29919) V!29919)

(declare-fun dynLambda!1367 (Int (_ BitVec 64)) V!29919)

(assert (=> b!907507 (= lt!409340 (get!13531 (select (arr!25712 _values!1152) i!717) (dynLambda!1367 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907507 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29919)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29919)

(declare-datatypes ((Unit!30764 0))(
  ( (Unit!30765) )
))
(declare-fun lt!409342 () Unit!30764)

(declare-fun lemmaKeyInListMapIsInArray!226 (array!53513 array!53515 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 64) Int) Unit!30764)

(assert (=> b!907507 (= lt!409342 (lemmaKeyInListMapIsInArray!226 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907508 () Bool)

(assert (=> b!907508 (= e!508643 true)))

(declare-fun lt!409339 () ListLongMap!10881)

(assert (=> b!907508 (= (apply!475 lt!409339 k0!1033) lt!409340)))

(declare-fun lt!409338 () Unit!30764)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!28 (array!53513 array!53515 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 64) V!29919 (_ BitVec 32) Int) Unit!30764)

(assert (=> b!907508 (= lt!409338 (lemmaListMapApplyFromThenApplyFromZero!28 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409340 i!717 defaultEntry!1160))))

(declare-fun b!907509 () Bool)

(assert (=> b!907509 (= e!508640 e!508643)))

(declare-fun res!612188 () Bool)

(assert (=> b!907509 (=> res!612188 e!508643)))

(declare-fun contains!4511 (ListLongMap!10881 (_ BitVec 64)) Bool)

(assert (=> b!907509 (= res!612188 (not (contains!4511 lt!409341 k0!1033)))))

(declare-fun getCurrentListMap!2722 (array!53513 array!53515 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 32) Int) ListLongMap!10881)

(assert (=> b!907509 (= lt!409341 (getCurrentListMap!2722 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907510 () Bool)

(declare-fun res!612186 () Bool)

(assert (=> b!907510 (=> (not res!612186) (not e!508644))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907510 (= res!612186 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29785 () Bool)

(declare-fun tp!57153 () Bool)

(assert (=> mapNonEmpty!29785 (= mapRes!29785 (and tp!57153 e!508642))))

(declare-fun mapValue!29785 () ValueCell!8876)

(declare-fun mapRest!29785 () (Array (_ BitVec 32) ValueCell!8876))

(declare-fun mapKey!29785 () (_ BitVec 32))

(assert (=> mapNonEmpty!29785 (= (arr!25712 _values!1152) (store mapRest!29785 mapKey!29785 mapValue!29785))))

(declare-fun b!907511 () Bool)

(declare-fun res!612187 () Bool)

(assert (=> b!907511 (=> (not res!612187) (not e!508641))))

(assert (=> b!907511 (= res!612187 (and (= (size!26172 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26171 _keys!1386) (size!26172 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907512 () Bool)

(assert (=> b!907512 (= e!508641 e!508644)))

(declare-fun res!612193 () Bool)

(assert (=> b!907512 (=> (not res!612193) (not e!508644))))

(assert (=> b!907512 (= res!612193 (contains!4511 lt!409339 k0!1033))))

(assert (=> b!907512 (= lt!409339 (getCurrentListMap!2722 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907513 () Bool)

(declare-fun res!612189 () Bool)

(assert (=> b!907513 (=> (not res!612189) (not e!508641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53513 (_ BitVec 32)) Bool)

(assert (=> b!907513 (= res!612189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907514 () Bool)

(assert (=> b!907514 (= e!508645 (and e!508646 mapRes!29785))))

(declare-fun condMapEmpty!29785 () Bool)

(declare-fun mapDefault!29785 () ValueCell!8876)

(assert (=> b!907514 (= condMapEmpty!29785 (= (arr!25712 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8876)) mapDefault!29785)))))

(assert (= (and start!77880 res!612184) b!907511))

(assert (= (and b!907511 res!612187) b!907513))

(assert (= (and b!907513 res!612189) b!907503))

(assert (= (and b!907503 res!612185) b!907512))

(assert (= (and b!907512 res!612193) b!907510))

(assert (= (and b!907510 res!612186) b!907505))

(assert (= (and b!907505 res!612192) b!907507))

(assert (= (and b!907507 (not res!612190)) b!907509))

(assert (= (and b!907509 (not res!612188)) b!907504))

(assert (= (and b!907504 (not res!612191)) b!907508))

(assert (= (and b!907514 condMapEmpty!29785) mapIsEmpty!29785))

(assert (= (and b!907514 (not condMapEmpty!29785)) mapNonEmpty!29785))

(get-info :version)

(assert (= (and mapNonEmpty!29785 ((_ is ValueCellFull!8876) mapValue!29785)) b!907502))

(assert (= (and b!907514 ((_ is ValueCellFull!8876) mapDefault!29785)) b!907506))

(assert (= start!77880 b!907514))

(declare-fun b_lambda!13185 () Bool)

(assert (=> (not b_lambda!13185) (not b!907507)))

(declare-fun t!25477 () Bool)

(declare-fun tb!5311 () Bool)

(assert (=> (and start!77880 (= defaultEntry!1160 defaultEntry!1160) t!25477) tb!5311))

(declare-fun result!10425 () Bool)

(assert (=> tb!5311 (= result!10425 tp_is_empty!18715)))

(assert (=> b!907507 t!25477))

(declare-fun b_and!26759 () Bool)

(assert (= b_and!26757 (and (=> t!25477 result!10425) b_and!26759)))

(declare-fun m!843269 () Bool)

(assert (=> b!907509 m!843269))

(declare-fun m!843271 () Bool)

(assert (=> b!907509 m!843271))

(declare-fun m!843273 () Bool)

(assert (=> b!907503 m!843273))

(declare-fun m!843275 () Bool)

(assert (=> b!907513 m!843275))

(declare-fun m!843277 () Bool)

(assert (=> mapNonEmpty!29785 m!843277))

(declare-fun m!843279 () Bool)

(assert (=> b!907504 m!843279))

(declare-fun m!843281 () Bool)

(assert (=> b!907512 m!843281))

(declare-fun m!843283 () Bool)

(assert (=> b!907512 m!843283))

(declare-fun m!843285 () Bool)

(assert (=> start!77880 m!843285))

(declare-fun m!843287 () Bool)

(assert (=> start!77880 m!843287))

(declare-fun m!843289 () Bool)

(assert (=> start!77880 m!843289))

(declare-fun m!843291 () Bool)

(assert (=> b!907510 m!843291))

(declare-fun m!843293 () Bool)

(assert (=> b!907507 m!843293))

(declare-fun m!843295 () Bool)

(assert (=> b!907507 m!843295))

(declare-fun m!843297 () Bool)

(assert (=> b!907507 m!843297))

(declare-fun m!843299 () Bool)

(assert (=> b!907507 m!843299))

(assert (=> b!907507 m!843293))

(assert (=> b!907507 m!843297))

(declare-fun m!843301 () Bool)

(assert (=> b!907507 m!843301))

(declare-fun m!843303 () Bool)

(assert (=> b!907508 m!843303))

(declare-fun m!843305 () Bool)

(assert (=> b!907508 m!843305))

(declare-fun m!843307 () Bool)

(assert (=> b!907505 m!843307))

(check-sat (not b!907509) (not b!907504) (not start!77880) (not b_lambda!13185) (not b!907507) (not b!907510) (not b_next!16297) (not b!907512) tp_is_empty!18715 (not b!907508) (not b!907513) b_and!26759 (not mapNonEmpty!29785) (not b!907503))
(check-sat b_and!26759 (not b_next!16297))
