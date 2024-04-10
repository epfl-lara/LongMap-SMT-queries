; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83760 () Bool)

(assert start!83760)

(declare-fun b_free!19569 () Bool)

(declare-fun b_next!19569 () Bool)

(assert (=> start!83760 (= b_free!19569 (not b_next!19569))))

(declare-fun tp!68149 () Bool)

(declare-fun b_and!31227 () Bool)

(assert (=> start!83760 (= tp!68149 b_and!31227)))

(declare-fun b!978077 () Bool)

(declare-fun res!654554 () Bool)

(declare-fun e!551450 () Bool)

(assert (=> b!978077 (=> (not res!654554) (not e!551450))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61153 0))(
  ( (array!61154 (arr!29434 (Array (_ BitVec 32) (_ BitVec 64))) (size!29913 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61153)

(assert (=> b!978077 (= res!654554 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29913 _keys!1544))))))

(declare-fun b!978078 () Bool)

(assert (=> b!978078 (= e!551450 (not true))))

(declare-datatypes ((V!35067 0))(
  ( (V!35068 (val!11332 Int)) )
))
(declare-datatypes ((tuple2!14526 0))(
  ( (tuple2!14527 (_1!7274 (_ BitVec 64)) (_2!7274 V!35067)) )
))
(declare-datatypes ((List!20397 0))(
  ( (Nil!20394) (Cons!20393 (h!21555 tuple2!14526) (t!28922 List!20397)) )
))
(declare-datatypes ((ListLongMap!13223 0))(
  ( (ListLongMap!13224 (toList!6627 List!20397)) )
))
(declare-fun lt!433603 () ListLongMap!13223)

(declare-fun lt!433601 () tuple2!14526)

(declare-fun lt!433602 () tuple2!14526)

(declare-fun +!2932 (ListLongMap!13223 tuple2!14526) ListLongMap!13223)

(assert (=> b!978078 (= (+!2932 (+!2932 lt!433603 lt!433601) lt!433602) (+!2932 (+!2932 lt!433603 lt!433602) lt!433601))))

(declare-fun lt!433600 () V!35067)

(assert (=> b!978078 (= lt!433602 (tuple2!14527 (select (arr!29434 _keys!1544) from!1932) lt!433600))))

(declare-fun minValue!1220 () V!35067)

(assert (=> b!978078 (= lt!433601 (tuple2!14527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32503 0))(
  ( (Unit!32504) )
))
(declare-fun lt!433604 () Unit!32503)

(declare-fun addCommutativeForDiffKeys!560 (ListLongMap!13223 (_ BitVec 64) V!35067 (_ BitVec 64) V!35067) Unit!32503)

(assert (=> b!978078 (= lt!433604 (addCommutativeForDiffKeys!560 lt!433603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29434 _keys!1544) from!1932) lt!433600))))

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((ValueCell!10800 0))(
  ( (ValueCellFull!10800 (v!13894 V!35067)) (EmptyCell!10800) )
))
(declare-datatypes ((array!61155 0))(
  ( (array!61156 (arr!29435 (Array (_ BitVec 32) ValueCell!10800)) (size!29914 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61155)

(declare-fun get!15235 (ValueCell!10800 V!35067) V!35067)

(declare-fun dynLambda!1720 (Int (_ BitVec 64)) V!35067)

(assert (=> b!978078 (= lt!433600 (get!15235 (select (arr!29435 _values!1278) from!1932) (dynLambda!1720 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35067)

(declare-fun getCurrentListMapNoExtraKeys!3334 (array!61153 array!61155 (_ BitVec 32) (_ BitVec 32) V!35067 V!35067 (_ BitVec 32) Int) ListLongMap!13223)

(assert (=> b!978078 (= lt!433603 (+!2932 (getCurrentListMapNoExtraKeys!3334 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978079 () Bool)

(declare-fun e!551447 () Bool)

(declare-fun tp_is_empty!22563 () Bool)

(assert (=> b!978079 (= e!551447 tp_is_empty!22563)))

(declare-fun b!978080 () Bool)

(declare-fun res!654560 () Bool)

(assert (=> b!978080 (=> (not res!654560) (not e!551450))))

(assert (=> b!978080 (= res!654560 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978081 () Bool)

(declare-fun res!654555 () Bool)

(assert (=> b!978081 (=> (not res!654555) (not e!551450))))

(declare-datatypes ((List!20398 0))(
  ( (Nil!20395) (Cons!20394 (h!21556 (_ BitVec 64)) (t!28923 List!20398)) )
))
(declare-fun arrayNoDuplicates!0 (array!61153 (_ BitVec 32) List!20398) Bool)

(assert (=> b!978081 (= res!654555 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20395))))

(declare-fun res!654556 () Bool)

(assert (=> start!83760 (=> (not res!654556) (not e!551450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83760 (= res!654556 (validMask!0 mask!1948))))

(assert (=> start!83760 e!551450))

(assert (=> start!83760 true))

(assert (=> start!83760 tp_is_empty!22563))

(declare-fun e!551448 () Bool)

(declare-fun array_inv!22753 (array!61155) Bool)

(assert (=> start!83760 (and (array_inv!22753 _values!1278) e!551448)))

(assert (=> start!83760 tp!68149))

(declare-fun array_inv!22754 (array!61153) Bool)

(assert (=> start!83760 (array_inv!22754 _keys!1544)))

(declare-fun b!978082 () Bool)

(declare-fun res!654557 () Bool)

(assert (=> b!978082 (=> (not res!654557) (not e!551450))))

(assert (=> b!978082 (= res!654557 (and (= (size!29914 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29913 _keys!1544) (size!29914 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35873 () Bool)

(declare-fun mapRes!35873 () Bool)

(declare-fun tp!68148 () Bool)

(declare-fun e!551449 () Bool)

(assert (=> mapNonEmpty!35873 (= mapRes!35873 (and tp!68148 e!551449))))

(declare-fun mapKey!35873 () (_ BitVec 32))

(declare-fun mapRest!35873 () (Array (_ BitVec 32) ValueCell!10800))

(declare-fun mapValue!35873 () ValueCell!10800)

(assert (=> mapNonEmpty!35873 (= (arr!29435 _values!1278) (store mapRest!35873 mapKey!35873 mapValue!35873))))

(declare-fun b!978083 () Bool)

(declare-fun res!654558 () Bool)

(assert (=> b!978083 (=> (not res!654558) (not e!551450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61153 (_ BitVec 32)) Bool)

(assert (=> b!978083 (= res!654558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978084 () Bool)

(assert (=> b!978084 (= e!551448 (and e!551447 mapRes!35873))))

(declare-fun condMapEmpty!35873 () Bool)

(declare-fun mapDefault!35873 () ValueCell!10800)

(assert (=> b!978084 (= condMapEmpty!35873 (= (arr!29435 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10800)) mapDefault!35873)))))

(declare-fun b!978085 () Bool)

(declare-fun res!654559 () Bool)

(assert (=> b!978085 (=> (not res!654559) (not e!551450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978085 (= res!654559 (validKeyInArray!0 (select (arr!29434 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35873 () Bool)

(assert (=> mapIsEmpty!35873 mapRes!35873))

(declare-fun b!978086 () Bool)

(assert (=> b!978086 (= e!551449 tp_is_empty!22563)))

(assert (= (and start!83760 res!654556) b!978082))

(assert (= (and b!978082 res!654557) b!978083))

(assert (= (and b!978083 res!654558) b!978081))

(assert (= (and b!978081 res!654555) b!978077))

(assert (= (and b!978077 res!654554) b!978085))

(assert (= (and b!978085 res!654559) b!978080))

(assert (= (and b!978080 res!654560) b!978078))

(assert (= (and b!978084 condMapEmpty!35873) mapIsEmpty!35873))

(assert (= (and b!978084 (not condMapEmpty!35873)) mapNonEmpty!35873))

(get-info :version)

(assert (= (and mapNonEmpty!35873 ((_ is ValueCellFull!10800) mapValue!35873)) b!978086))

(assert (= (and b!978084 ((_ is ValueCellFull!10800) mapDefault!35873)) b!978079))

(assert (= start!83760 b!978084))

(declare-fun b_lambda!14613 () Bool)

(assert (=> (not b_lambda!14613) (not b!978078)))

(declare-fun t!28921 () Bool)

(declare-fun tb!6375 () Bool)

(assert (=> (and start!83760 (= defaultEntry!1281 defaultEntry!1281) t!28921) tb!6375))

(declare-fun result!12739 () Bool)

(assert (=> tb!6375 (= result!12739 tp_is_empty!22563)))

(assert (=> b!978078 t!28921))

(declare-fun b_and!31229 () Bool)

(assert (= b_and!31227 (and (=> t!28921 result!12739) b_and!31229)))

(declare-fun m!905179 () Bool)

(assert (=> b!978081 m!905179))

(declare-fun m!905181 () Bool)

(assert (=> start!83760 m!905181))

(declare-fun m!905183 () Bool)

(assert (=> start!83760 m!905183))

(declare-fun m!905185 () Bool)

(assert (=> start!83760 m!905185))

(declare-fun m!905187 () Bool)

(assert (=> b!978083 m!905187))

(declare-fun m!905189 () Bool)

(assert (=> b!978085 m!905189))

(assert (=> b!978085 m!905189))

(declare-fun m!905191 () Bool)

(assert (=> b!978085 m!905191))

(declare-fun m!905193 () Bool)

(assert (=> mapNonEmpty!35873 m!905193))

(assert (=> b!978078 m!905189))

(declare-fun m!905195 () Bool)

(assert (=> b!978078 m!905195))

(declare-fun m!905197 () Bool)

(assert (=> b!978078 m!905197))

(assert (=> b!978078 m!905197))

(declare-fun m!905199 () Bool)

(assert (=> b!978078 m!905199))

(declare-fun m!905201 () Bool)

(assert (=> b!978078 m!905201))

(declare-fun m!905203 () Bool)

(assert (=> b!978078 m!905203))

(assert (=> b!978078 m!905189))

(declare-fun m!905205 () Bool)

(assert (=> b!978078 m!905205))

(declare-fun m!905207 () Bool)

(assert (=> b!978078 m!905207))

(declare-fun m!905209 () Bool)

(assert (=> b!978078 m!905209))

(assert (=> b!978078 m!905195))

(assert (=> b!978078 m!905209))

(declare-fun m!905211 () Bool)

(assert (=> b!978078 m!905211))

(assert (=> b!978078 m!905207))

(declare-fun m!905213 () Bool)

(assert (=> b!978078 m!905213))

(assert (=> b!978078 m!905201))

(check-sat (not start!83760) (not mapNonEmpty!35873) (not b!978081) b_and!31229 tp_is_empty!22563 (not b!978085) (not b!978083) (not b!978078) (not b_lambda!14613) (not b_next!19569))
(check-sat b_and!31229 (not b_next!19569))
