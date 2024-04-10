; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84216 () Bool)

(assert start!84216)

(declare-fun b_free!19917 () Bool)

(declare-fun b_next!19917 () Bool)

(assert (=> start!84216 (= b_free!19917 (not b_next!19917))))

(declare-fun tp!69355 () Bool)

(declare-fun b_and!31911 () Bool)

(assert (=> start!84216 (= tp!69355 b_and!31911)))

(declare-fun mapIsEmpty!36557 () Bool)

(declare-fun mapRes!36557 () Bool)

(assert (=> mapIsEmpty!36557 mapRes!36557))

(declare-fun b!985087 () Bool)

(declare-fun e!555297 () Bool)

(declare-fun e!555296 () Bool)

(assert (=> b!985087 (= e!555297 e!555296)))

(declare-fun res!659182 () Bool)

(assert (=> b!985087 (=> (not res!659182) (not e!555296))))

(declare-datatypes ((array!62013 0))(
  ( (array!62014 (arr!29864 (Array (_ BitVec 32) (_ BitVec 64))) (size!30343 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62013)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985087 (= res!659182 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29864 _keys!1544) from!1932))))))

(declare-datatypes ((V!35675 0))(
  ( (V!35676 (val!11560 Int)) )
))
(declare-datatypes ((ValueCell!11028 0))(
  ( (ValueCellFull!11028 (v!14122 V!35675)) (EmptyCell!11028) )
))
(declare-datatypes ((array!62015 0))(
  ( (array!62016 (arr!29865 (Array (_ BitVec 32) ValueCell!11028)) (size!30344 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62015)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!437096 () V!35675)

(declare-fun get!15497 (ValueCell!11028 V!35675) V!35675)

(declare-fun dynLambda!1830 (Int (_ BitVec 64)) V!35675)

(assert (=> b!985087 (= lt!437096 (get!15497 (select (arr!29865 _values!1278) from!1932) (dynLambda!1830 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35675)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35675)

(declare-datatypes ((tuple2!14788 0))(
  ( (tuple2!14789 (_1!7405 (_ BitVec 64)) (_2!7405 V!35675)) )
))
(declare-datatypes ((List!20680 0))(
  ( (Nil!20677) (Cons!20676 (h!21838 tuple2!14788) (t!29541 List!20680)) )
))
(declare-datatypes ((ListLongMap!13485 0))(
  ( (ListLongMap!13486 (toList!6758 List!20680)) )
))
(declare-fun lt!437094 () ListLongMap!13485)

(declare-fun getCurrentListMapNoExtraKeys!3450 (array!62013 array!62015 (_ BitVec 32) (_ BitVec 32) V!35675 V!35675 (_ BitVec 32) Int) ListLongMap!13485)

(assert (=> b!985087 (= lt!437094 (getCurrentListMapNoExtraKeys!3450 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985088 () Bool)

(declare-fun e!555298 () Bool)

(declare-fun tp_is_empty!23019 () Bool)

(assert (=> b!985088 (= e!555298 tp_is_empty!23019)))

(declare-fun b!985089 () Bool)

(declare-fun e!555295 () Bool)

(declare-fun e!555300 () Bool)

(assert (=> b!985089 (= e!555295 (and e!555300 mapRes!36557))))

(declare-fun condMapEmpty!36557 () Bool)

(declare-fun mapDefault!36557 () ValueCell!11028)

(assert (=> b!985089 (= condMapEmpty!36557 (= (arr!29865 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11028)) mapDefault!36557)))))

(declare-fun b!985090 () Bool)

(declare-fun res!659177 () Bool)

(assert (=> b!985090 (=> (not res!659177) (not e!555297))))

(declare-datatypes ((List!20681 0))(
  ( (Nil!20678) (Cons!20677 (h!21839 (_ BitVec 64)) (t!29542 List!20681)) )
))
(declare-fun arrayNoDuplicates!0 (array!62013 (_ BitVec 32) List!20681) Bool)

(assert (=> b!985090 (= res!659177 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20678))))

(declare-fun b!985091 () Bool)

(declare-fun res!659179 () Bool)

(assert (=> b!985091 (=> (not res!659179) (not e!555297))))

(assert (=> b!985091 (= res!659179 (and (= (size!30344 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30343 _keys!1544) (size!30344 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985092 () Bool)

(declare-fun res!659181 () Bool)

(assert (=> b!985092 (=> (not res!659181) (not e!555297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62013 (_ BitVec 32)) Bool)

(assert (=> b!985092 (= res!659181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985093 () Bool)

(declare-fun res!659180 () Bool)

(assert (=> b!985093 (=> (not res!659180) (not e!555297))))

(assert (=> b!985093 (= res!659180 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30343 _keys!1544))))))

(declare-fun b!985094 () Bool)

(declare-fun res!659183 () Bool)

(assert (=> b!985094 (=> (not res!659183) (not e!555297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985094 (= res!659183 (validKeyInArray!0 (select (arr!29864 _keys!1544) from!1932)))))

(declare-fun b!985095 () Bool)

(declare-fun res!659176 () Bool)

(assert (=> b!985095 (=> (not res!659176) (not e!555297))))

(assert (=> b!985095 (= res!659176 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!659178 () Bool)

(assert (=> start!84216 (=> (not res!659178) (not e!555297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84216 (= res!659178 (validMask!0 mask!1948))))

(assert (=> start!84216 e!555297))

(assert (=> start!84216 true))

(assert (=> start!84216 tp_is_empty!23019))

(declare-fun array_inv!23087 (array!62015) Bool)

(assert (=> start!84216 (and (array_inv!23087 _values!1278) e!555295)))

(assert (=> start!84216 tp!69355))

(declare-fun array_inv!23088 (array!62013) Bool)

(assert (=> start!84216 (array_inv!23088 _keys!1544)))

(declare-fun b!985096 () Bool)

(assert (=> b!985096 (= e!555296 (not true))))

(declare-fun lt!437093 () tuple2!14788)

(declare-fun lt!437095 () tuple2!14788)

(declare-fun +!3049 (ListLongMap!13485 tuple2!14788) ListLongMap!13485)

(assert (=> b!985096 (= (+!3049 (+!3049 lt!437094 lt!437093) lt!437095) (+!3049 (+!3049 lt!437094 lt!437095) lt!437093))))

(assert (=> b!985096 (= lt!437095 (tuple2!14789 (select (arr!29864 _keys!1544) from!1932) lt!437096))))

(assert (=> b!985096 (= lt!437093 (tuple2!14789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32737 0))(
  ( (Unit!32738) )
))
(declare-fun lt!437092 () Unit!32737)

(declare-fun addCommutativeForDiffKeys!677 (ListLongMap!13485 (_ BitVec 64) V!35675 (_ BitVec 64) V!35675) Unit!32737)

(assert (=> b!985096 (= lt!437092 (addCommutativeForDiffKeys!677 lt!437094 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29864 _keys!1544) from!1932) lt!437096))))

(declare-fun b!985097 () Bool)

(assert (=> b!985097 (= e!555300 tp_is_empty!23019)))

(declare-fun mapNonEmpty!36557 () Bool)

(declare-fun tp!69354 () Bool)

(assert (=> mapNonEmpty!36557 (= mapRes!36557 (and tp!69354 e!555298))))

(declare-fun mapValue!36557 () ValueCell!11028)

(declare-fun mapRest!36557 () (Array (_ BitVec 32) ValueCell!11028))

(declare-fun mapKey!36557 () (_ BitVec 32))

(assert (=> mapNonEmpty!36557 (= (arr!29865 _values!1278) (store mapRest!36557 mapKey!36557 mapValue!36557))))

(assert (= (and start!84216 res!659178) b!985091))

(assert (= (and b!985091 res!659179) b!985092))

(assert (= (and b!985092 res!659181) b!985090))

(assert (= (and b!985090 res!659177) b!985093))

(assert (= (and b!985093 res!659180) b!985094))

(assert (= (and b!985094 res!659183) b!985095))

(assert (= (and b!985095 res!659176) b!985087))

(assert (= (and b!985087 res!659182) b!985096))

(assert (= (and b!985089 condMapEmpty!36557) mapIsEmpty!36557))

(assert (= (and b!985089 (not condMapEmpty!36557)) mapNonEmpty!36557))

(get-info :version)

(assert (= (and mapNonEmpty!36557 ((_ is ValueCellFull!11028) mapValue!36557)) b!985088))

(assert (= (and b!985089 ((_ is ValueCellFull!11028) mapDefault!36557)) b!985097))

(assert (= start!84216 b!985089))

(declare-fun b_lambda!14949 () Bool)

(assert (=> (not b_lambda!14949) (not b!985087)))

(declare-fun t!29540 () Bool)

(declare-fun tb!6711 () Bool)

(assert (=> (and start!84216 (= defaultEntry!1281 defaultEntry!1281) t!29540) tb!6711))

(declare-fun result!13411 () Bool)

(assert (=> tb!6711 (= result!13411 tp_is_empty!23019)))

(assert (=> b!985087 t!29540))

(declare-fun b_and!31913 () Bool)

(assert (= b_and!31911 (and (=> t!29540 result!13411) b_and!31913)))

(declare-fun m!912155 () Bool)

(assert (=> start!84216 m!912155))

(declare-fun m!912157 () Bool)

(assert (=> start!84216 m!912157))

(declare-fun m!912159 () Bool)

(assert (=> start!84216 m!912159))

(declare-fun m!912161 () Bool)

(assert (=> b!985087 m!912161))

(declare-fun m!912163 () Bool)

(assert (=> b!985087 m!912163))

(declare-fun m!912165 () Bool)

(assert (=> b!985087 m!912165))

(declare-fun m!912167 () Bool)

(assert (=> b!985087 m!912167))

(assert (=> b!985087 m!912163))

(assert (=> b!985087 m!912167))

(declare-fun m!912169 () Bool)

(assert (=> b!985087 m!912169))

(assert (=> b!985094 m!912161))

(assert (=> b!985094 m!912161))

(declare-fun m!912171 () Bool)

(assert (=> b!985094 m!912171))

(declare-fun m!912173 () Bool)

(assert (=> b!985090 m!912173))

(declare-fun m!912175 () Bool)

(assert (=> b!985092 m!912175))

(declare-fun m!912177 () Bool)

(assert (=> b!985096 m!912177))

(assert (=> b!985096 m!912161))

(declare-fun m!912179 () Bool)

(assert (=> b!985096 m!912179))

(declare-fun m!912181 () Bool)

(assert (=> b!985096 m!912181))

(assert (=> b!985096 m!912177))

(declare-fun m!912183 () Bool)

(assert (=> b!985096 m!912183))

(assert (=> b!985096 m!912179))

(assert (=> b!985096 m!912161))

(declare-fun m!912185 () Bool)

(assert (=> b!985096 m!912185))

(declare-fun m!912187 () Bool)

(assert (=> mapNonEmpty!36557 m!912187))

(check-sat (not b_next!19917) (not b!985094) (not b!985096) (not start!84216) (not b_lambda!14949) tp_is_empty!23019 b_and!31913 (not b!985090) (not mapNonEmpty!36557) (not b!985087) (not b!985092))
(check-sat b_and!31913 (not b_next!19917))
