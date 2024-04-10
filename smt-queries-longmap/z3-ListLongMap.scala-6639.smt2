; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83808 () Bool)

(assert start!83808)

(declare-fun b_free!19617 () Bool)

(declare-fun b_next!19617 () Bool)

(assert (=> start!83808 (= b_free!19617 (not b_next!19617))))

(declare-fun tp!68292 () Bool)

(declare-fun b_and!31323 () Bool)

(assert (=> start!83808 (= tp!68292 b_and!31323)))

(declare-fun b!978845 () Bool)

(declare-fun e!551807 () Bool)

(assert (=> b!978845 (= e!551807 (not true))))

(declare-datatypes ((V!35131 0))(
  ( (V!35132 (val!11356 Int)) )
))
(declare-datatypes ((tuple2!14568 0))(
  ( (tuple2!14569 (_1!7295 (_ BitVec 64)) (_2!7295 V!35131)) )
))
(declare-datatypes ((List!20437 0))(
  ( (Nil!20434) (Cons!20433 (h!21595 tuple2!14568) (t!29010 List!20437)) )
))
(declare-datatypes ((ListLongMap!13265 0))(
  ( (ListLongMap!13266 (toList!6648 List!20437)) )
))
(declare-fun lt!433960 () ListLongMap!13265)

(declare-fun lt!433961 () tuple2!14568)

(declare-fun lt!433963 () tuple2!14568)

(declare-fun +!2953 (ListLongMap!13265 tuple2!14568) ListLongMap!13265)

(assert (=> b!978845 (= (+!2953 (+!2953 lt!433960 lt!433961) lt!433963) (+!2953 (+!2953 lt!433960 lt!433963) lt!433961))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61247 0))(
  ( (array!61248 (arr!29481 (Array (_ BitVec 32) (_ BitVec 64))) (size!29960 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61247)

(declare-fun lt!433964 () V!35131)

(assert (=> b!978845 (= lt!433963 (tuple2!14569 (select (arr!29481 _keys!1544) from!1932) lt!433964))))

(declare-fun minValue!1220 () V!35131)

(assert (=> b!978845 (= lt!433961 (tuple2!14569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32545 0))(
  ( (Unit!32546) )
))
(declare-fun lt!433962 () Unit!32545)

(declare-fun addCommutativeForDiffKeys!581 (ListLongMap!13265 (_ BitVec 64) V!35131 (_ BitVec 64) V!35131) Unit!32545)

(assert (=> b!978845 (= lt!433962 (addCommutativeForDiffKeys!581 lt!433960 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29481 _keys!1544) from!1932) lt!433964))))

(declare-datatypes ((ValueCell!10824 0))(
  ( (ValueCellFull!10824 (v!13918 V!35131)) (EmptyCell!10824) )
))
(declare-datatypes ((array!61249 0))(
  ( (array!61250 (arr!29482 (Array (_ BitVec 32) ValueCell!10824)) (size!29961 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61249)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15272 (ValueCell!10824 V!35131) V!35131)

(declare-fun dynLambda!1741 (Int (_ BitVec 64)) V!35131)

(assert (=> b!978845 (= lt!433964 (get!15272 (select (arr!29482 _values!1278) from!1932) (dynLambda!1741 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35131)

(declare-fun getCurrentListMapNoExtraKeys!3355 (array!61247 array!61249 (_ BitVec 32) (_ BitVec 32) V!35131 V!35131 (_ BitVec 32) Int) ListLongMap!13265)

(assert (=> b!978845 (= lt!433960 (+!2953 (getCurrentListMapNoExtraKeys!3355 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapNonEmpty!35945 () Bool)

(declare-fun mapRes!35945 () Bool)

(declare-fun tp!68293 () Bool)

(declare-fun e!551811 () Bool)

(assert (=> mapNonEmpty!35945 (= mapRes!35945 (and tp!68293 e!551811))))

(declare-fun mapValue!35945 () ValueCell!10824)

(declare-fun mapRest!35945 () (Array (_ BitVec 32) ValueCell!10824))

(declare-fun mapKey!35945 () (_ BitVec 32))

(assert (=> mapNonEmpty!35945 (= (arr!29482 _values!1278) (store mapRest!35945 mapKey!35945 mapValue!35945))))

(declare-fun b!978846 () Bool)

(declare-fun res!655059 () Bool)

(assert (=> b!978846 (=> (not res!655059) (not e!551807))))

(assert (=> b!978846 (= res!655059 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29960 _keys!1544))))))

(declare-fun mapIsEmpty!35945 () Bool)

(assert (=> mapIsEmpty!35945 mapRes!35945))

(declare-fun b!978847 () Bool)

(declare-fun res!655060 () Bool)

(assert (=> b!978847 (=> (not res!655060) (not e!551807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61247 (_ BitVec 32)) Bool)

(assert (=> b!978847 (= res!655060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978848 () Bool)

(declare-fun tp_is_empty!22611 () Bool)

(assert (=> b!978848 (= e!551811 tp_is_empty!22611)))

(declare-fun b!978849 () Bool)

(declare-fun res!655063 () Bool)

(assert (=> b!978849 (=> (not res!655063) (not e!551807))))

(assert (=> b!978849 (= res!655063 (and (= (size!29961 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29960 _keys!1544) (size!29961 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978850 () Bool)

(declare-fun res!655061 () Bool)

(assert (=> b!978850 (=> (not res!655061) (not e!551807))))

(assert (=> b!978850 (= res!655061 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978851 () Bool)

(declare-fun e!551810 () Bool)

(declare-fun e!551809 () Bool)

(assert (=> b!978851 (= e!551810 (and e!551809 mapRes!35945))))

(declare-fun condMapEmpty!35945 () Bool)

(declare-fun mapDefault!35945 () ValueCell!10824)

(assert (=> b!978851 (= condMapEmpty!35945 (= (arr!29482 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10824)) mapDefault!35945)))))

(declare-fun b!978852 () Bool)

(declare-fun res!655062 () Bool)

(assert (=> b!978852 (=> (not res!655062) (not e!551807))))

(declare-datatypes ((List!20438 0))(
  ( (Nil!20435) (Cons!20434 (h!21596 (_ BitVec 64)) (t!29011 List!20438)) )
))
(declare-fun arrayNoDuplicates!0 (array!61247 (_ BitVec 32) List!20438) Bool)

(assert (=> b!978852 (= res!655062 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20435))))

(declare-fun res!655064 () Bool)

(assert (=> start!83808 (=> (not res!655064) (not e!551807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83808 (= res!655064 (validMask!0 mask!1948))))

(assert (=> start!83808 e!551807))

(assert (=> start!83808 true))

(assert (=> start!83808 tp_is_empty!22611))

(declare-fun array_inv!22793 (array!61249) Bool)

(assert (=> start!83808 (and (array_inv!22793 _values!1278) e!551810)))

(assert (=> start!83808 tp!68292))

(declare-fun array_inv!22794 (array!61247) Bool)

(assert (=> start!83808 (array_inv!22794 _keys!1544)))

(declare-fun b!978853 () Bool)

(assert (=> b!978853 (= e!551809 tp_is_empty!22611)))

(declare-fun b!978854 () Bool)

(declare-fun res!655058 () Bool)

(assert (=> b!978854 (=> (not res!655058) (not e!551807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978854 (= res!655058 (validKeyInArray!0 (select (arr!29481 _keys!1544) from!1932)))))

(assert (= (and start!83808 res!655064) b!978849))

(assert (= (and b!978849 res!655063) b!978847))

(assert (= (and b!978847 res!655060) b!978852))

(assert (= (and b!978852 res!655062) b!978846))

(assert (= (and b!978846 res!655059) b!978854))

(assert (= (and b!978854 res!655058) b!978850))

(assert (= (and b!978850 res!655061) b!978845))

(assert (= (and b!978851 condMapEmpty!35945) mapIsEmpty!35945))

(assert (= (and b!978851 (not condMapEmpty!35945)) mapNonEmpty!35945))

(get-info :version)

(assert (= (and mapNonEmpty!35945 ((_ is ValueCellFull!10824) mapValue!35945)) b!978848))

(assert (= (and b!978851 ((_ is ValueCellFull!10824) mapDefault!35945)) b!978853))

(assert (= start!83808 b!978851))

(declare-fun b_lambda!14661 () Bool)

(assert (=> (not b_lambda!14661) (not b!978845)))

(declare-fun t!29009 () Bool)

(declare-fun tb!6423 () Bool)

(assert (=> (and start!83808 (= defaultEntry!1281 defaultEntry!1281) t!29009) tb!6423))

(declare-fun result!12835 () Bool)

(assert (=> tb!6423 (= result!12835 tp_is_empty!22611)))

(assert (=> b!978845 t!29009))

(declare-fun b_and!31325 () Bool)

(assert (= b_and!31323 (and (=> t!29009 result!12835) b_and!31325)))

(declare-fun m!906043 () Bool)

(assert (=> mapNonEmpty!35945 m!906043))

(declare-fun m!906045 () Bool)

(assert (=> b!978854 m!906045))

(assert (=> b!978854 m!906045))

(declare-fun m!906047 () Bool)

(assert (=> b!978854 m!906047))

(assert (=> b!978845 m!906045))

(declare-fun m!906049 () Bool)

(assert (=> b!978845 m!906049))

(declare-fun m!906051 () Bool)

(assert (=> b!978845 m!906051))

(declare-fun m!906053 () Bool)

(assert (=> b!978845 m!906053))

(assert (=> b!978845 m!906053))

(declare-fun m!906055 () Bool)

(assert (=> b!978845 m!906055))

(declare-fun m!906057 () Bool)

(assert (=> b!978845 m!906057))

(assert (=> b!978845 m!906045))

(declare-fun m!906059 () Bool)

(assert (=> b!978845 m!906059))

(declare-fun m!906061 () Bool)

(assert (=> b!978845 m!906061))

(assert (=> b!978845 m!906049))

(assert (=> b!978845 m!906061))

(declare-fun m!906063 () Bool)

(assert (=> b!978845 m!906063))

(assert (=> b!978845 m!906057))

(declare-fun m!906065 () Bool)

(assert (=> b!978845 m!906065))

(assert (=> b!978845 m!906051))

(declare-fun m!906067 () Bool)

(assert (=> b!978845 m!906067))

(declare-fun m!906069 () Bool)

(assert (=> b!978852 m!906069))

(declare-fun m!906071 () Bool)

(assert (=> b!978847 m!906071))

(declare-fun m!906073 () Bool)

(assert (=> start!83808 m!906073))

(declare-fun m!906075 () Bool)

(assert (=> start!83808 m!906075))

(declare-fun m!906077 () Bool)

(assert (=> start!83808 m!906077))

(check-sat (not start!83808) tp_is_empty!22611 (not mapNonEmpty!35945) (not b_lambda!14661) (not b!978847) (not b!978852) b_and!31325 (not b!978854) (not b_next!19617) (not b!978845))
(check-sat b_and!31325 (not b_next!19617))
