; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84058 () Bool)

(assert start!84058)

(declare-fun b_free!19699 () Bool)

(declare-fun b_next!19699 () Bool)

(assert (=> start!84058 (= b_free!19699 (not b_next!19699))))

(declare-fun tp!68539 () Bool)

(declare-fun b_and!31497 () Bool)

(assert (=> start!84058 (= tp!68539 b_and!31497)))

(declare-fun b!981179 () Bool)

(declare-fun e!553128 () Bool)

(assert (=> b!981179 (= e!553128 true)))

(declare-datatypes ((V!35241 0))(
  ( (V!35242 (val!11397 Int)) )
))
(declare-datatypes ((tuple2!14632 0))(
  ( (tuple2!14633 (_1!7327 (_ BitVec 64)) (_2!7327 V!35241)) )
))
(declare-fun lt!435533 () tuple2!14632)

(declare-datatypes ((List!20491 0))(
  ( (Nil!20488) (Cons!20487 (h!21655 tuple2!14632) (t!29138 List!20491)) )
))
(declare-datatypes ((ListLongMap!13331 0))(
  ( (ListLongMap!13332 (toList!6681 List!20491)) )
))
(declare-fun lt!435532 () ListLongMap!13331)

(declare-fun lt!435535 () tuple2!14632)

(declare-fun lt!435534 () ListLongMap!13331)

(declare-fun +!2996 (ListLongMap!13331 tuple2!14632) ListLongMap!13331)

(assert (=> b!981179 (= lt!435534 (+!2996 (+!2996 lt!435532 lt!435533) lt!435535))))

(declare-fun lt!435538 () V!35241)

(declare-fun zeroValue!1220 () V!35241)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61428 0))(
  ( (array!61429 (arr!29567 (Array (_ BitVec 32) (_ BitVec 64))) (size!30047 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61428)

(declare-datatypes ((Unit!32572 0))(
  ( (Unit!32573) )
))
(declare-fun lt!435531 () Unit!32572)

(declare-fun addCommutativeForDiffKeys!603 (ListLongMap!13331 (_ BitVec 64) V!35241 (_ BitVec 64) V!35241) Unit!32572)

(assert (=> b!981179 (= lt!435531 (addCommutativeForDiffKeys!603 lt!435532 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29567 _keys!1544) from!1932) lt!435538))))

(declare-fun b!981180 () Bool)

(declare-fun res!656388 () Bool)

(declare-fun e!553126 () Bool)

(assert (=> b!981180 (=> (not res!656388) (not e!553126))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981180 (= res!656388 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!981181 () Bool)

(declare-fun res!656389 () Bool)

(assert (=> b!981181 (=> (not res!656389) (not e!553126))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10865 0))(
  ( (ValueCellFull!10865 (v!13956 V!35241)) (EmptyCell!10865) )
))
(declare-datatypes ((array!61430 0))(
  ( (array!61431 (arr!29568 (Array (_ BitVec 32) ValueCell!10865)) (size!30048 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61430)

(assert (=> b!981181 (= res!656389 (and (= (size!30048 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30047 _keys!1544) (size!30048 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981182 () Bool)

(declare-fun res!656382 () Bool)

(assert (=> b!981182 (=> (not res!656382) (not e!553126))))

(assert (=> b!981182 (= res!656382 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30047 _keys!1544))))))

(declare-fun res!656386 () Bool)

(assert (=> start!84058 (=> (not res!656386) (not e!553126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84058 (= res!656386 (validMask!0 mask!1948))))

(assert (=> start!84058 e!553126))

(assert (=> start!84058 true))

(declare-fun tp_is_empty!22693 () Bool)

(assert (=> start!84058 tp_is_empty!22693))

(declare-fun e!553124 () Bool)

(declare-fun array_inv!22889 (array!61430) Bool)

(assert (=> start!84058 (and (array_inv!22889 _values!1278) e!553124)))

(assert (=> start!84058 tp!68539))

(declare-fun array_inv!22890 (array!61428) Bool)

(assert (=> start!84058 (array_inv!22890 _keys!1544)))

(declare-fun mapNonEmpty!36068 () Bool)

(declare-fun mapRes!36068 () Bool)

(declare-fun tp!68540 () Bool)

(declare-fun e!553123 () Bool)

(assert (=> mapNonEmpty!36068 (= mapRes!36068 (and tp!68540 e!553123))))

(declare-fun mapRest!36068 () (Array (_ BitVec 32) ValueCell!10865))

(declare-fun mapKey!36068 () (_ BitVec 32))

(declare-fun mapValue!36068 () ValueCell!10865)

(assert (=> mapNonEmpty!36068 (= (arr!29568 _values!1278) (store mapRest!36068 mapKey!36068 mapValue!36068))))

(declare-fun b!981183 () Bool)

(declare-fun res!656384 () Bool)

(assert (=> b!981183 (=> (not res!656384) (not e!553126))))

(declare-datatypes ((List!20492 0))(
  ( (Nil!20489) (Cons!20488 (h!21656 (_ BitVec 64)) (t!29139 List!20492)) )
))
(declare-fun arrayNoDuplicates!0 (array!61428 (_ BitVec 32) List!20492) Bool)

(assert (=> b!981183 (= res!656384 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20489))))

(declare-fun b!981184 () Bool)

(assert (=> b!981184 (= e!553123 tp_is_empty!22693)))

(declare-fun b!981185 () Bool)

(assert (=> b!981185 (= e!553126 (not e!553128))))

(declare-fun res!656387 () Bool)

(assert (=> b!981185 (=> res!656387 e!553128)))

(assert (=> b!981185 (= res!656387 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29567 _keys!1544) from!1932)))))

(declare-fun lt!435536 () ListLongMap!13331)

(declare-fun lt!435537 () tuple2!14632)

(assert (=> b!981185 (= (+!2996 lt!435536 lt!435533) (+!2996 lt!435534 lt!435537))))

(declare-fun lt!435540 () ListLongMap!13331)

(assert (=> b!981185 (= lt!435534 (+!2996 lt!435540 lt!435533))))

(assert (=> b!981185 (= lt!435533 (tuple2!14633 (select (arr!29567 _keys!1544) from!1932) lt!435538))))

(assert (=> b!981185 (= lt!435536 (+!2996 lt!435540 lt!435537))))

(declare-fun minValue!1220 () V!35241)

(assert (=> b!981185 (= lt!435537 (tuple2!14633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435539 () Unit!32572)

(assert (=> b!981185 (= lt!435539 (addCommutativeForDiffKeys!603 lt!435540 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29567 _keys!1544) from!1932) lt!435538))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15353 (ValueCell!10865 V!35241) V!35241)

(declare-fun dynLambda!1790 (Int (_ BitVec 64)) V!35241)

(assert (=> b!981185 (= lt!435538 (get!15353 (select (arr!29568 _values!1278) from!1932) (dynLambda!1790 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!981185 (= lt!435540 (+!2996 lt!435532 lt!435535))))

(assert (=> b!981185 (= lt!435535 (tuple2!14633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3428 (array!61428 array!61430 (_ BitVec 32) (_ BitVec 32) V!35241 V!35241 (_ BitVec 32) Int) ListLongMap!13331)

(assert (=> b!981185 (= lt!435532 (getCurrentListMapNoExtraKeys!3428 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36068 () Bool)

(assert (=> mapIsEmpty!36068 mapRes!36068))

(declare-fun b!981186 () Bool)

(declare-fun res!656383 () Bool)

(assert (=> b!981186 (=> (not res!656383) (not e!553126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981186 (= res!656383 (validKeyInArray!0 (select (arr!29567 _keys!1544) from!1932)))))

(declare-fun b!981187 () Bool)

(declare-fun res!656385 () Bool)

(assert (=> b!981187 (=> (not res!656385) (not e!553126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61428 (_ BitVec 32)) Bool)

(assert (=> b!981187 (= res!656385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981188 () Bool)

(declare-fun e!553125 () Bool)

(assert (=> b!981188 (= e!553125 tp_is_empty!22693)))

(declare-fun b!981189 () Bool)

(assert (=> b!981189 (= e!553124 (and e!553125 mapRes!36068))))

(declare-fun condMapEmpty!36068 () Bool)

(declare-fun mapDefault!36068 () ValueCell!10865)

(assert (=> b!981189 (= condMapEmpty!36068 (= (arr!29568 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10865)) mapDefault!36068)))))

(assert (= (and start!84058 res!656386) b!981181))

(assert (= (and b!981181 res!656389) b!981187))

(assert (= (and b!981187 res!656385) b!981183))

(assert (= (and b!981183 res!656384) b!981182))

(assert (= (and b!981182 res!656382) b!981186))

(assert (= (and b!981186 res!656383) b!981180))

(assert (= (and b!981180 res!656388) b!981185))

(assert (= (and b!981185 (not res!656387)) b!981179))

(assert (= (and b!981189 condMapEmpty!36068) mapIsEmpty!36068))

(assert (= (and b!981189 (not condMapEmpty!36068)) mapNonEmpty!36068))

(get-info :version)

(assert (= (and mapNonEmpty!36068 ((_ is ValueCellFull!10865) mapValue!36068)) b!981184))

(assert (= (and b!981189 ((_ is ValueCellFull!10865) mapDefault!36068)) b!981188))

(assert (= start!84058 b!981189))

(declare-fun b_lambda!14757 () Bool)

(assert (=> (not b_lambda!14757) (not b!981185)))

(declare-fun t!29137 () Bool)

(declare-fun tb!6497 () Bool)

(assert (=> (and start!84058 (= defaultEntry!1281 defaultEntry!1281) t!29137) tb!6497))

(declare-fun result!12991 () Bool)

(assert (=> tb!6497 (= result!12991 tp_is_empty!22693)))

(assert (=> b!981185 t!29137))

(declare-fun b_and!31499 () Bool)

(assert (= b_and!31497 (and (=> t!29137 result!12991) b_and!31499)))

(declare-fun m!909047 () Bool)

(assert (=> start!84058 m!909047))

(declare-fun m!909049 () Bool)

(assert (=> start!84058 m!909049))

(declare-fun m!909051 () Bool)

(assert (=> start!84058 m!909051))

(declare-fun m!909053 () Bool)

(assert (=> b!981187 m!909053))

(declare-fun m!909055 () Bool)

(assert (=> mapNonEmpty!36068 m!909055))

(declare-fun m!909057 () Bool)

(assert (=> b!981179 m!909057))

(assert (=> b!981179 m!909057))

(declare-fun m!909059 () Bool)

(assert (=> b!981179 m!909059))

(declare-fun m!909061 () Bool)

(assert (=> b!981179 m!909061))

(assert (=> b!981179 m!909061))

(declare-fun m!909063 () Bool)

(assert (=> b!981179 m!909063))

(declare-fun m!909065 () Bool)

(assert (=> b!981185 m!909065))

(declare-fun m!909067 () Bool)

(assert (=> b!981185 m!909067))

(declare-fun m!909069 () Bool)

(assert (=> b!981185 m!909069))

(assert (=> b!981185 m!909061))

(declare-fun m!909071 () Bool)

(assert (=> b!981185 m!909071))

(declare-fun m!909073 () Bool)

(assert (=> b!981185 m!909073))

(declare-fun m!909075 () Bool)

(assert (=> b!981185 m!909075))

(declare-fun m!909077 () Bool)

(assert (=> b!981185 m!909077))

(declare-fun m!909079 () Bool)

(assert (=> b!981185 m!909079))

(assert (=> b!981185 m!909061))

(declare-fun m!909081 () Bool)

(assert (=> b!981185 m!909081))

(assert (=> b!981185 m!909067))

(assert (=> b!981185 m!909081))

(declare-fun m!909083 () Bool)

(assert (=> b!981185 m!909083))

(declare-fun m!909085 () Bool)

(assert (=> b!981183 m!909085))

(assert (=> b!981186 m!909061))

(assert (=> b!981186 m!909061))

(declare-fun m!909087 () Bool)

(assert (=> b!981186 m!909087))

(check-sat (not b!981187) (not b_next!19699) (not b_lambda!14757) (not start!84058) tp_is_empty!22693 b_and!31499 (not b!981185) (not b!981186) (not b!981183) (not b!981179) (not mapNonEmpty!36068))
(check-sat b_and!31499 (not b_next!19699))
