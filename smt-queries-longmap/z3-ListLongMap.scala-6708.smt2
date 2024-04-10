; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84222 () Bool)

(assert start!84222)

(declare-fun b_free!19923 () Bool)

(declare-fun b_next!19923 () Bool)

(assert (=> start!84222 (= b_free!19923 (not b_next!19923))))

(declare-fun tp!69372 () Bool)

(declare-fun b_and!31923 () Bool)

(assert (=> start!84222 (= tp!69372 b_and!31923)))

(declare-fun b!985192 () Bool)

(declare-fun res!659254 () Bool)

(declare-fun e!555350 () Bool)

(assert (=> b!985192 (=> (not res!659254) (not e!555350))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62025 0))(
  ( (array!62026 (arr!29870 (Array (_ BitVec 32) (_ BitVec 64))) (size!30349 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62025)

(assert (=> b!985192 (= res!659254 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30349 _keys!1544))))))

(declare-fun b!985193 () Bool)

(declare-fun e!555351 () Bool)

(declare-fun tp_is_empty!23025 () Bool)

(assert (=> b!985193 (= e!555351 tp_is_empty!23025)))

(declare-fun b!985194 () Bool)

(declare-fun res!659252 () Bool)

(assert (=> b!985194 (=> (not res!659252) (not e!555350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985194 (= res!659252 (validKeyInArray!0 (select (arr!29870 _keys!1544) from!1932)))))

(declare-fun b!985195 () Bool)

(declare-fun res!659251 () Bool)

(assert (=> b!985195 (=> (not res!659251) (not e!555350))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985195 (= res!659251 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985196 () Bool)

(declare-fun res!659248 () Bool)

(assert (=> b!985196 (=> (not res!659248) (not e!555350))))

(declare-datatypes ((List!20684 0))(
  ( (Nil!20681) (Cons!20680 (h!21842 (_ BitVec 64)) (t!29551 List!20684)) )
))
(declare-fun arrayNoDuplicates!0 (array!62025 (_ BitVec 32) List!20684) Bool)

(assert (=> b!985196 (= res!659248 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20681))))

(declare-fun b!985197 () Bool)

(declare-fun res!659250 () Bool)

(assert (=> b!985197 (=> (not res!659250) (not e!555350))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62025 (_ BitVec 32)) Bool)

(assert (=> b!985197 (= res!659250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985198 () Bool)

(declare-fun e!555354 () Bool)

(assert (=> b!985198 (= e!555350 e!555354)))

(declare-fun res!659249 () Bool)

(assert (=> b!985198 (=> (not res!659249) (not e!555354))))

(assert (=> b!985198 (= res!659249 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29870 _keys!1544) from!1932))))))

(declare-datatypes ((V!35683 0))(
  ( (V!35684 (val!11563 Int)) )
))
(declare-fun lt!437138 () V!35683)

(declare-datatypes ((ValueCell!11031 0))(
  ( (ValueCellFull!11031 (v!14125 V!35683)) (EmptyCell!11031) )
))
(declare-datatypes ((array!62027 0))(
  ( (array!62028 (arr!29871 (Array (_ BitVec 32) ValueCell!11031)) (size!30350 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62027)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15501 (ValueCell!11031 V!35683) V!35683)

(declare-fun dynLambda!1832 (Int (_ BitVec 64)) V!35683)

(assert (=> b!985198 (= lt!437138 (get!15501 (select (arr!29871 _values!1278) from!1932) (dynLambda!1832 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35683)

(declare-datatypes ((tuple2!14792 0))(
  ( (tuple2!14793 (_1!7407 (_ BitVec 64)) (_2!7407 V!35683)) )
))
(declare-datatypes ((List!20685 0))(
  ( (Nil!20682) (Cons!20681 (h!21843 tuple2!14792) (t!29552 List!20685)) )
))
(declare-datatypes ((ListLongMap!13489 0))(
  ( (ListLongMap!13490 (toList!6760 List!20685)) )
))
(declare-fun lt!437137 () ListLongMap!13489)

(declare-fun zeroValue!1220 () V!35683)

(declare-fun getCurrentListMapNoExtraKeys!3452 (array!62025 array!62027 (_ BitVec 32) (_ BitVec 32) V!35683 V!35683 (_ BitVec 32) Int) ListLongMap!13489)

(assert (=> b!985198 (= lt!437137 (getCurrentListMapNoExtraKeys!3452 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985199 () Bool)

(declare-fun e!555353 () Bool)

(declare-fun e!555349 () Bool)

(declare-fun mapRes!36566 () Bool)

(assert (=> b!985199 (= e!555353 (and e!555349 mapRes!36566))))

(declare-fun condMapEmpty!36566 () Bool)

(declare-fun mapDefault!36566 () ValueCell!11031)

(assert (=> b!985199 (= condMapEmpty!36566 (= (arr!29871 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11031)) mapDefault!36566)))))

(declare-fun b!985200 () Bool)

(assert (=> b!985200 (= e!555354 (not true))))

(declare-fun lt!437141 () tuple2!14792)

(declare-fun lt!437139 () tuple2!14792)

(declare-fun +!3050 (ListLongMap!13489 tuple2!14792) ListLongMap!13489)

(assert (=> b!985200 (= (+!3050 (+!3050 lt!437137 lt!437141) lt!437139) (+!3050 (+!3050 lt!437137 lt!437139) lt!437141))))

(assert (=> b!985200 (= lt!437139 (tuple2!14793 (select (arr!29870 _keys!1544) from!1932) lt!437138))))

(assert (=> b!985200 (= lt!437141 (tuple2!14793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32739 0))(
  ( (Unit!32740) )
))
(declare-fun lt!437140 () Unit!32739)

(declare-fun addCommutativeForDiffKeys!678 (ListLongMap!13489 (_ BitVec 64) V!35683 (_ BitVec 64) V!35683) Unit!32739)

(assert (=> b!985200 (= lt!437140 (addCommutativeForDiffKeys!678 lt!437137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29870 _keys!1544) from!1932) lt!437138))))

(declare-fun b!985201 () Bool)

(assert (=> b!985201 (= e!555349 tp_is_empty!23025)))

(declare-fun res!659255 () Bool)

(assert (=> start!84222 (=> (not res!659255) (not e!555350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84222 (= res!659255 (validMask!0 mask!1948))))

(assert (=> start!84222 e!555350))

(assert (=> start!84222 true))

(assert (=> start!84222 tp_is_empty!23025))

(declare-fun array_inv!23091 (array!62027) Bool)

(assert (=> start!84222 (and (array_inv!23091 _values!1278) e!555353)))

(assert (=> start!84222 tp!69372))

(declare-fun array_inv!23092 (array!62025) Bool)

(assert (=> start!84222 (array_inv!23092 _keys!1544)))

(declare-fun mapIsEmpty!36566 () Bool)

(assert (=> mapIsEmpty!36566 mapRes!36566))

(declare-fun b!985202 () Bool)

(declare-fun res!659253 () Bool)

(assert (=> b!985202 (=> (not res!659253) (not e!555350))))

(assert (=> b!985202 (= res!659253 (and (= (size!30350 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30349 _keys!1544) (size!30350 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36566 () Bool)

(declare-fun tp!69373 () Bool)

(assert (=> mapNonEmpty!36566 (= mapRes!36566 (and tp!69373 e!555351))))

(declare-fun mapKey!36566 () (_ BitVec 32))

(declare-fun mapValue!36566 () ValueCell!11031)

(declare-fun mapRest!36566 () (Array (_ BitVec 32) ValueCell!11031))

(assert (=> mapNonEmpty!36566 (= (arr!29871 _values!1278) (store mapRest!36566 mapKey!36566 mapValue!36566))))

(assert (= (and start!84222 res!659255) b!985202))

(assert (= (and b!985202 res!659253) b!985197))

(assert (= (and b!985197 res!659250) b!985196))

(assert (= (and b!985196 res!659248) b!985192))

(assert (= (and b!985192 res!659254) b!985194))

(assert (= (and b!985194 res!659252) b!985195))

(assert (= (and b!985195 res!659251) b!985198))

(assert (= (and b!985198 res!659249) b!985200))

(assert (= (and b!985199 condMapEmpty!36566) mapIsEmpty!36566))

(assert (= (and b!985199 (not condMapEmpty!36566)) mapNonEmpty!36566))

(get-info :version)

(assert (= (and mapNonEmpty!36566 ((_ is ValueCellFull!11031) mapValue!36566)) b!985193))

(assert (= (and b!985199 ((_ is ValueCellFull!11031) mapDefault!36566)) b!985201))

(assert (= start!84222 b!985199))

(declare-fun b_lambda!14955 () Bool)

(assert (=> (not b_lambda!14955) (not b!985198)))

(declare-fun t!29550 () Bool)

(declare-fun tb!6717 () Bool)

(assert (=> (and start!84222 (= defaultEntry!1281 defaultEntry!1281) t!29550) tb!6717))

(declare-fun result!13423 () Bool)

(assert (=> tb!6717 (= result!13423 tp_is_empty!23025)))

(assert (=> b!985198 t!29550))

(declare-fun b_and!31925 () Bool)

(assert (= b_and!31923 (and (=> t!29550 result!13423) b_and!31925)))

(declare-fun m!912257 () Bool)

(assert (=> mapNonEmpty!36566 m!912257))

(declare-fun m!912259 () Bool)

(assert (=> b!985196 m!912259))

(declare-fun m!912261 () Bool)

(assert (=> b!985198 m!912261))

(declare-fun m!912263 () Bool)

(assert (=> b!985198 m!912263))

(declare-fun m!912265 () Bool)

(assert (=> b!985198 m!912265))

(declare-fun m!912267 () Bool)

(assert (=> b!985198 m!912267))

(assert (=> b!985198 m!912263))

(assert (=> b!985198 m!912267))

(declare-fun m!912269 () Bool)

(assert (=> b!985198 m!912269))

(declare-fun m!912271 () Bool)

(assert (=> start!84222 m!912271))

(declare-fun m!912273 () Bool)

(assert (=> start!84222 m!912273))

(declare-fun m!912275 () Bool)

(assert (=> start!84222 m!912275))

(declare-fun m!912277 () Bool)

(assert (=> b!985200 m!912277))

(assert (=> b!985200 m!912261))

(declare-fun m!912279 () Bool)

(assert (=> b!985200 m!912279))

(assert (=> b!985200 m!912277))

(declare-fun m!912281 () Bool)

(assert (=> b!985200 m!912281))

(assert (=> b!985200 m!912261))

(declare-fun m!912283 () Bool)

(assert (=> b!985200 m!912283))

(assert (=> b!985200 m!912279))

(declare-fun m!912285 () Bool)

(assert (=> b!985200 m!912285))

(assert (=> b!985194 m!912261))

(assert (=> b!985194 m!912261))

(declare-fun m!912287 () Bool)

(assert (=> b!985194 m!912287))

(declare-fun m!912289 () Bool)

(assert (=> b!985197 m!912289))

(check-sat (not b_next!19923) (not b!985194) (not b!985200) (not start!84222) b_and!31925 (not b!985197) tp_is_empty!23025 (not b!985198) (not b!985196) (not mapNonEmpty!36566) (not b_lambda!14955))
(check-sat b_and!31925 (not b_next!19923))
