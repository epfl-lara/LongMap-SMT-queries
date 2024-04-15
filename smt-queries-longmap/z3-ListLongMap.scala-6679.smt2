; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84028 () Bool)

(assert start!84028)

(declare-fun b_free!19801 () Bool)

(declare-fun b_next!19801 () Bool)

(assert (=> start!84028 (= b_free!19801 (not b_next!19801))))

(declare-fun tp!68927 () Bool)

(declare-fun b_and!31659 () Bool)

(assert (=> start!84028 (= tp!68927 b_and!31659)))

(declare-fun b!982320 () Bool)

(declare-fun e!553710 () Bool)

(declare-fun e!553707 () Bool)

(declare-fun mapRes!36302 () Bool)

(assert (=> b!982320 (= e!553710 (and e!553707 mapRes!36302))))

(declare-fun condMapEmpty!36302 () Bool)

(declare-datatypes ((V!35449 0))(
  ( (V!35450 (val!11475 Int)) )
))
(declare-datatypes ((ValueCell!10943 0))(
  ( (ValueCellFull!10943 (v!14036 V!35449)) (EmptyCell!10943) )
))
(declare-datatypes ((array!61622 0))(
  ( (array!61623 (arr!29669 (Array (_ BitVec 32) ValueCell!10943)) (size!30150 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61622)

(declare-fun mapDefault!36302 () ValueCell!10943)

(assert (=> b!982320 (= condMapEmpty!36302 (= (arr!29669 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10943)) mapDefault!36302)))))

(declare-fun b!982321 () Bool)

(declare-fun e!553708 () Bool)

(declare-fun tp_is_empty!22849 () Bool)

(assert (=> b!982321 (= e!553708 tp_is_empty!22849)))

(declare-fun b!982322 () Bool)

(declare-fun e!553711 () Bool)

(assert (=> b!982322 (= e!553711 (not true))))

(declare-datatypes ((tuple2!14772 0))(
  ( (tuple2!14773 (_1!7397 (_ BitVec 64)) (_2!7397 V!35449)) )
))
(declare-datatypes ((List!20611 0))(
  ( (Nil!20608) (Cons!20607 (h!21769 tuple2!14772) (t!29353 List!20611)) )
))
(declare-datatypes ((ListLongMap!13459 0))(
  ( (ListLongMap!13460 (toList!6745 List!20611)) )
))
(declare-fun lt!435952 () ListLongMap!13459)

(declare-fun lt!435954 () tuple2!14772)

(declare-fun lt!435953 () tuple2!14772)

(declare-fun +!3035 (ListLongMap!13459 tuple2!14772) ListLongMap!13459)

(assert (=> b!982322 (= (+!3035 (+!3035 lt!435952 lt!435954) lt!435953) (+!3035 (+!3035 lt!435952 lt!435953) lt!435954))))

(declare-fun lt!435950 () V!35449)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61624 0))(
  ( (array!61625 (arr!29670 (Array (_ BitVec 32) (_ BitVec 64))) (size!30151 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61624)

(assert (=> b!982322 (= lt!435953 (tuple2!14773 (select (arr!29670 _keys!1544) from!1932) lt!435950))))

(declare-fun zeroValue!1220 () V!35449)

(assert (=> b!982322 (= lt!435954 (tuple2!14773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32536 0))(
  ( (Unit!32537) )
))
(declare-fun lt!435951 () Unit!32536)

(declare-fun addCommutativeForDiffKeys!639 (ListLongMap!13459 (_ BitVec 64) V!35449 (_ BitVec 64) V!35449) Unit!32536)

(assert (=> b!982322 (= lt!435951 (addCommutativeForDiffKeys!639 lt!435952 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29670 _keys!1544) from!1932) lt!435950))))

(declare-fun b!982323 () Bool)

(declare-fun res!657414 () Bool)

(declare-fun e!553709 () Bool)

(assert (=> b!982323 (=> (not res!657414) (not e!553709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982323 (= res!657414 (validKeyInArray!0 (select (arr!29670 _keys!1544) from!1932)))))

(declare-fun b!982324 () Bool)

(declare-fun res!657413 () Bool)

(assert (=> b!982324 (=> (not res!657413) (not e!553709))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982324 (= res!657413 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982325 () Bool)

(assert (=> b!982325 (= e!553707 tp_is_empty!22849)))

(declare-fun b!982326 () Bool)

(assert (=> b!982326 (= e!553709 e!553711)))

(declare-fun res!657417 () Bool)

(assert (=> b!982326 (=> (not res!657417) (not e!553711))))

(assert (=> b!982326 (= res!657417 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29670 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15402 (ValueCell!10943 V!35449) V!35449)

(declare-fun dynLambda!1786 (Int (_ BitVec 64)) V!35449)

(assert (=> b!982326 (= lt!435950 (get!15402 (select (arr!29669 _values!1278) from!1932) (dynLambda!1786 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35449)

(declare-fun getCurrentListMapNoExtraKeys!3456 (array!61624 array!61622 (_ BitVec 32) (_ BitVec 32) V!35449 V!35449 (_ BitVec 32) Int) ListLongMap!13459)

(assert (=> b!982326 (= lt!435952 (getCurrentListMapNoExtraKeys!3456 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982327 () Bool)

(declare-fun res!657416 () Bool)

(assert (=> b!982327 (=> (not res!657416) (not e!553709))))

(assert (=> b!982327 (= res!657416 (and (= (size!30150 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30151 _keys!1544) (size!30150 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36302 () Bool)

(declare-fun tp!68926 () Bool)

(assert (=> mapNonEmpty!36302 (= mapRes!36302 (and tp!68926 e!553708))))

(declare-fun mapKey!36302 () (_ BitVec 32))

(declare-fun mapRest!36302 () (Array (_ BitVec 32) ValueCell!10943))

(declare-fun mapValue!36302 () ValueCell!10943)

(assert (=> mapNonEmpty!36302 (= (arr!29669 _values!1278) (store mapRest!36302 mapKey!36302 mapValue!36302))))

(declare-fun res!657418 () Bool)

(assert (=> start!84028 (=> (not res!657418) (not e!553709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84028 (= res!657418 (validMask!0 mask!1948))))

(assert (=> start!84028 e!553709))

(assert (=> start!84028 true))

(assert (=> start!84028 tp_is_empty!22849))

(declare-fun array_inv!22955 (array!61622) Bool)

(assert (=> start!84028 (and (array_inv!22955 _values!1278) e!553710)))

(assert (=> start!84028 tp!68927))

(declare-fun array_inv!22956 (array!61624) Bool)

(assert (=> start!84028 (array_inv!22956 _keys!1544)))

(declare-fun b!982328 () Bool)

(declare-fun res!657420 () Bool)

(assert (=> b!982328 (=> (not res!657420) (not e!553709))))

(declare-datatypes ((List!20612 0))(
  ( (Nil!20609) (Cons!20608 (h!21770 (_ BitVec 64)) (t!29354 List!20612)) )
))
(declare-fun arrayNoDuplicates!0 (array!61624 (_ BitVec 32) List!20612) Bool)

(assert (=> b!982328 (= res!657420 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20609))))

(declare-fun b!982329 () Bool)

(declare-fun res!657415 () Bool)

(assert (=> b!982329 (=> (not res!657415) (not e!553709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61624 (_ BitVec 32)) Bool)

(assert (=> b!982329 (= res!657415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982330 () Bool)

(declare-fun res!657419 () Bool)

(assert (=> b!982330 (=> (not res!657419) (not e!553709))))

(assert (=> b!982330 (= res!657419 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30151 _keys!1544))))))

(declare-fun mapIsEmpty!36302 () Bool)

(assert (=> mapIsEmpty!36302 mapRes!36302))

(assert (= (and start!84028 res!657418) b!982327))

(assert (= (and b!982327 res!657416) b!982329))

(assert (= (and b!982329 res!657415) b!982328))

(assert (= (and b!982328 res!657420) b!982330))

(assert (= (and b!982330 res!657419) b!982323))

(assert (= (and b!982323 res!657414) b!982324))

(assert (= (and b!982324 res!657413) b!982326))

(assert (= (and b!982326 res!657417) b!982322))

(assert (= (and b!982320 condMapEmpty!36302) mapIsEmpty!36302))

(assert (= (and b!982320 (not condMapEmpty!36302)) mapNonEmpty!36302))

(get-info :version)

(assert (= (and mapNonEmpty!36302 ((_ is ValueCellFull!10943) mapValue!36302)) b!982321))

(assert (= (and b!982320 ((_ is ValueCellFull!10943) mapDefault!36302)) b!982325))

(assert (= start!84028 b!982320))

(declare-fun b_lambda!14821 () Bool)

(assert (=> (not b_lambda!14821) (not b!982326)))

(declare-fun t!29352 () Bool)

(declare-fun tb!6593 () Bool)

(assert (=> (and start!84028 (= defaultEntry!1281 defaultEntry!1281) t!29352) tb!6593))

(declare-fun result!13183 () Bool)

(assert (=> tb!6593 (= result!13183 tp_is_empty!22849)))

(assert (=> b!982326 t!29352))

(declare-fun b_and!31661 () Bool)

(assert (= b_and!31659 (and (=> t!29352 result!13183) b_and!31661)))

(declare-fun m!909137 () Bool)

(assert (=> mapNonEmpty!36302 m!909137))

(declare-fun m!909139 () Bool)

(assert (=> start!84028 m!909139))

(declare-fun m!909141 () Bool)

(assert (=> start!84028 m!909141))

(declare-fun m!909143 () Bool)

(assert (=> start!84028 m!909143))

(declare-fun m!909145 () Bool)

(assert (=> b!982329 m!909145))

(declare-fun m!909147 () Bool)

(assert (=> b!982328 m!909147))

(declare-fun m!909149 () Bool)

(assert (=> b!982322 m!909149))

(declare-fun m!909151 () Bool)

(assert (=> b!982322 m!909151))

(assert (=> b!982322 m!909151))

(declare-fun m!909153 () Bool)

(assert (=> b!982322 m!909153))

(declare-fun m!909155 () Bool)

(assert (=> b!982322 m!909155))

(declare-fun m!909157 () Bool)

(assert (=> b!982322 m!909157))

(assert (=> b!982322 m!909155))

(assert (=> b!982322 m!909149))

(declare-fun m!909159 () Bool)

(assert (=> b!982322 m!909159))

(assert (=> b!982323 m!909151))

(assert (=> b!982323 m!909151))

(declare-fun m!909161 () Bool)

(assert (=> b!982323 m!909161))

(assert (=> b!982326 m!909151))

(declare-fun m!909163 () Bool)

(assert (=> b!982326 m!909163))

(declare-fun m!909165 () Bool)

(assert (=> b!982326 m!909165))

(declare-fun m!909167 () Bool)

(assert (=> b!982326 m!909167))

(assert (=> b!982326 m!909163))

(assert (=> b!982326 m!909167))

(declare-fun m!909169 () Bool)

(assert (=> b!982326 m!909169))

(check-sat (not b_next!19801) b_and!31661 (not b!982329) (not b!982323) (not mapNonEmpty!36302) tp_is_empty!22849 (not b!982326) (not b_lambda!14821) (not b!982322) (not start!84028) (not b!982328))
(check-sat b_and!31661 (not b_next!19801))
