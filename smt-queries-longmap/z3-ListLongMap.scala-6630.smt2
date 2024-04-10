; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83754 () Bool)

(assert start!83754)

(declare-fun b_free!19563 () Bool)

(declare-fun b_next!19563 () Bool)

(assert (=> start!83754 (= b_free!19563 (not b_next!19563))))

(declare-fun tp!68131 () Bool)

(declare-fun b_and!31215 () Bool)

(assert (=> start!83754 (= tp!68131 b_and!31215)))

(declare-fun b!977981 () Bool)

(declare-fun res!654492 () Bool)

(declare-fun e!551402 () Bool)

(assert (=> b!977981 (=> (not res!654492) (not e!551402))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35059 0))(
  ( (V!35060 (val!11329 Int)) )
))
(declare-datatypes ((ValueCell!10797 0))(
  ( (ValueCellFull!10797 (v!13891 V!35059)) (EmptyCell!10797) )
))
(declare-datatypes ((array!61141 0))(
  ( (array!61142 (arr!29428 (Array (_ BitVec 32) ValueCell!10797)) (size!29907 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61141)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61143 0))(
  ( (array!61144 (arr!29429 (Array (_ BitVec 32) (_ BitVec 64))) (size!29908 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61143)

(assert (=> b!977981 (= res!654492 (and (= (size!29907 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29908 _keys!1544) (size!29907 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35864 () Bool)

(declare-fun mapRes!35864 () Bool)

(declare-fun tp!68130 () Bool)

(declare-fun e!551403 () Bool)

(assert (=> mapNonEmpty!35864 (= mapRes!35864 (and tp!68130 e!551403))))

(declare-fun mapValue!35864 () ValueCell!10797)

(declare-fun mapKey!35864 () (_ BitVec 32))

(declare-fun mapRest!35864 () (Array (_ BitVec 32) ValueCell!10797))

(assert (=> mapNonEmpty!35864 (= (arr!29428 _values!1278) (store mapRest!35864 mapKey!35864 mapValue!35864))))

(declare-fun b!977982 () Bool)

(declare-fun res!654496 () Bool)

(assert (=> b!977982 (=> (not res!654496) (not e!551402))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!977982 (= res!654496 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29908 _keys!1544))))))

(declare-fun res!654495 () Bool)

(assert (=> start!83754 (=> (not res!654495) (not e!551402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83754 (= res!654495 (validMask!0 mask!1948))))

(assert (=> start!83754 e!551402))

(assert (=> start!83754 true))

(declare-fun tp_is_empty!22557 () Bool)

(assert (=> start!83754 tp_is_empty!22557))

(declare-fun e!551404 () Bool)

(declare-fun array_inv!22747 (array!61141) Bool)

(assert (=> start!83754 (and (array_inv!22747 _values!1278) e!551404)))

(assert (=> start!83754 tp!68131))

(declare-fun array_inv!22748 (array!61143) Bool)

(assert (=> start!83754 (array_inv!22748 _keys!1544)))

(declare-fun b!977983 () Bool)

(declare-fun res!654493 () Bool)

(assert (=> b!977983 (=> (not res!654493) (not e!551402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977983 (= res!654493 (validKeyInArray!0 (select (arr!29429 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35864 () Bool)

(assert (=> mapIsEmpty!35864 mapRes!35864))

(declare-fun b!977984 () Bool)

(declare-fun res!654497 () Bool)

(assert (=> b!977984 (=> (not res!654497) (not e!551402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61143 (_ BitVec 32)) Bool)

(assert (=> b!977984 (= res!654497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977985 () Bool)

(assert (=> b!977985 (= e!551403 tp_is_empty!22557)))

(declare-fun b!977986 () Bool)

(declare-fun e!551406 () Bool)

(assert (=> b!977986 (= e!551406 tp_is_empty!22557)))

(declare-fun b!977987 () Bool)

(assert (=> b!977987 (= e!551404 (and e!551406 mapRes!35864))))

(declare-fun condMapEmpty!35864 () Bool)

(declare-fun mapDefault!35864 () ValueCell!10797)

(assert (=> b!977987 (= condMapEmpty!35864 (= (arr!29428 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10797)) mapDefault!35864)))))

(declare-fun b!977988 () Bool)

(declare-fun res!654494 () Bool)

(assert (=> b!977988 (=> (not res!654494) (not e!551402))))

(declare-datatypes ((List!20393 0))(
  ( (Nil!20390) (Cons!20389 (h!21551 (_ BitVec 64)) (t!28912 List!20393)) )
))
(declare-fun arrayNoDuplicates!0 (array!61143 (_ BitVec 32) List!20393) Bool)

(assert (=> b!977988 (= res!654494 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20390))))

(declare-fun b!977989 () Bool)

(assert (=> b!977989 (= e!551402 (not true))))

(declare-datatypes ((tuple2!14522 0))(
  ( (tuple2!14523 (_1!7272 (_ BitVec 64)) (_2!7272 V!35059)) )
))
(declare-datatypes ((List!20394 0))(
  ( (Nil!20391) (Cons!20390 (h!21552 tuple2!14522) (t!28913 List!20394)) )
))
(declare-datatypes ((ListLongMap!13219 0))(
  ( (ListLongMap!13220 (toList!6625 List!20394)) )
))
(declare-fun lt!433558 () ListLongMap!13219)

(declare-fun lt!433557 () tuple2!14522)

(declare-fun lt!433556 () tuple2!14522)

(declare-fun +!2930 (ListLongMap!13219 tuple2!14522) ListLongMap!13219)

(assert (=> b!977989 (= (+!2930 (+!2930 lt!433558 lt!433557) lt!433556) (+!2930 (+!2930 lt!433558 lt!433556) lt!433557))))

(declare-fun lt!433555 () V!35059)

(assert (=> b!977989 (= lt!433556 (tuple2!14523 (select (arr!29429 _keys!1544) from!1932) lt!433555))))

(declare-fun minValue!1220 () V!35059)

(assert (=> b!977989 (= lt!433557 (tuple2!14523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32499 0))(
  ( (Unit!32500) )
))
(declare-fun lt!433559 () Unit!32499)

(declare-fun addCommutativeForDiffKeys!558 (ListLongMap!13219 (_ BitVec 64) V!35059 (_ BitVec 64) V!35059) Unit!32499)

(assert (=> b!977989 (= lt!433559 (addCommutativeForDiffKeys!558 lt!433558 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29429 _keys!1544) from!1932) lt!433555))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15231 (ValueCell!10797 V!35059) V!35059)

(declare-fun dynLambda!1718 (Int (_ BitVec 64)) V!35059)

(assert (=> b!977989 (= lt!433555 (get!15231 (select (arr!29428 _values!1278) from!1932) (dynLambda!1718 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35059)

(declare-fun getCurrentListMapNoExtraKeys!3332 (array!61143 array!61141 (_ BitVec 32) (_ BitVec 32) V!35059 V!35059 (_ BitVec 32) Int) ListLongMap!13219)

(assert (=> b!977989 (= lt!433558 (+!2930 (getCurrentListMapNoExtraKeys!3332 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!977990 () Bool)

(declare-fun res!654491 () Bool)

(assert (=> b!977990 (=> (not res!654491) (not e!551402))))

(assert (=> b!977990 (= res!654491 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!83754 res!654495) b!977981))

(assert (= (and b!977981 res!654492) b!977984))

(assert (= (and b!977984 res!654497) b!977988))

(assert (= (and b!977988 res!654494) b!977982))

(assert (= (and b!977982 res!654496) b!977983))

(assert (= (and b!977983 res!654493) b!977990))

(assert (= (and b!977990 res!654491) b!977989))

(assert (= (and b!977987 condMapEmpty!35864) mapIsEmpty!35864))

(assert (= (and b!977987 (not condMapEmpty!35864)) mapNonEmpty!35864))

(get-info :version)

(assert (= (and mapNonEmpty!35864 ((_ is ValueCellFull!10797) mapValue!35864)) b!977985))

(assert (= (and b!977987 ((_ is ValueCellFull!10797) mapDefault!35864)) b!977986))

(assert (= start!83754 b!977987))

(declare-fun b_lambda!14607 () Bool)

(assert (=> (not b_lambda!14607) (not b!977989)))

(declare-fun t!28911 () Bool)

(declare-fun tb!6369 () Bool)

(assert (=> (and start!83754 (= defaultEntry!1281 defaultEntry!1281) t!28911) tb!6369))

(declare-fun result!12727 () Bool)

(assert (=> tb!6369 (= result!12727 tp_is_empty!22557)))

(assert (=> b!977989 t!28911))

(declare-fun b_and!31217 () Bool)

(assert (= b_and!31215 (and (=> t!28911 result!12727) b_and!31217)))

(declare-fun m!905071 () Bool)

(assert (=> mapNonEmpty!35864 m!905071))

(declare-fun m!905073 () Bool)

(assert (=> b!977989 m!905073))

(declare-fun m!905075 () Bool)

(assert (=> b!977989 m!905075))

(declare-fun m!905077 () Bool)

(assert (=> b!977989 m!905077))

(assert (=> b!977989 m!905075))

(declare-fun m!905079 () Bool)

(assert (=> b!977989 m!905079))

(declare-fun m!905081 () Bool)

(assert (=> b!977989 m!905081))

(declare-fun m!905083 () Bool)

(assert (=> b!977989 m!905083))

(assert (=> b!977989 m!905083))

(declare-fun m!905085 () Bool)

(assert (=> b!977989 m!905085))

(declare-fun m!905087 () Bool)

(assert (=> b!977989 m!905087))

(assert (=> b!977989 m!905073))

(declare-fun m!905089 () Bool)

(assert (=> b!977989 m!905089))

(declare-fun m!905091 () Bool)

(assert (=> b!977989 m!905091))

(assert (=> b!977989 m!905087))

(assert (=> b!977989 m!905091))

(declare-fun m!905093 () Bool)

(assert (=> b!977989 m!905093))

(assert (=> b!977989 m!905079))

(declare-fun m!905095 () Bool)

(assert (=> start!83754 m!905095))

(declare-fun m!905097 () Bool)

(assert (=> start!83754 m!905097))

(declare-fun m!905099 () Bool)

(assert (=> start!83754 m!905099))

(assert (=> b!977983 m!905073))

(assert (=> b!977983 m!905073))

(declare-fun m!905101 () Bool)

(assert (=> b!977983 m!905101))

(declare-fun m!905103 () Bool)

(assert (=> b!977988 m!905103))

(declare-fun m!905105 () Bool)

(assert (=> b!977984 m!905105))

(check-sat b_and!31217 (not b!977983) (not start!83754) (not b!977988) (not b!977989) (not b!977984) (not mapNonEmpty!35864) (not b_next!19563) tp_is_empty!22557 (not b_lambda!14607))
(check-sat b_and!31217 (not b_next!19563))
