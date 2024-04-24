; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84334 () Bool)

(assert start!84334)

(declare-fun b_free!19867 () Bool)

(declare-fun b_next!19867 () Bool)

(assert (=> start!84334 (= b_free!19867 (not b_next!19867))))

(declare-fun tp!69205 () Bool)

(declare-fun b_and!31821 () Bool)

(assert (=> start!84334 (= tp!69205 b_and!31821)))

(declare-fun mapNonEmpty!36482 () Bool)

(declare-fun mapRes!36482 () Bool)

(declare-fun tp!69206 () Bool)

(declare-fun e!555432 () Bool)

(assert (=> mapNonEmpty!36482 (= mapRes!36482 (and tp!69206 e!555432))))

(declare-datatypes ((V!35609 0))(
  ( (V!35610 (val!11535 Int)) )
))
(declare-datatypes ((ValueCell!11003 0))(
  ( (ValueCellFull!11003 (v!14094 V!35609)) (EmptyCell!11003) )
))
(declare-fun mapRest!36482 () (Array (_ BitVec 32) ValueCell!11003))

(declare-fun mapValue!36482 () ValueCell!11003)

(declare-datatypes ((array!61958 0))(
  ( (array!61959 (arr!29832 (Array (_ BitVec 32) ValueCell!11003)) (size!30312 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61958)

(declare-fun mapKey!36482 () (_ BitVec 32))

(assert (=> mapNonEmpty!36482 (= (arr!29832 _values!1278) (store mapRest!36482 mapKey!36482 mapValue!36482))))

(declare-fun b!985115 () Bool)

(declare-fun res!658920 () Bool)

(declare-fun e!555430 () Bool)

(assert (=> b!985115 (=> (not res!658920) (not e!555430))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61960 0))(
  ( (array!61961 (arr!29833 (Array (_ BitVec 32) (_ BitVec 64))) (size!30313 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61960)

(assert (=> b!985115 (= res!658920 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30313 _keys!1544))))))

(declare-fun b!985116 () Bool)

(declare-fun res!658927 () Bool)

(assert (=> b!985116 (=> (not res!658927) (not e!555430))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61960 (_ BitVec 32)) Bool)

(assert (=> b!985116 (= res!658927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985117 () Bool)

(declare-fun res!658925 () Bool)

(assert (=> b!985117 (=> (not res!658925) (not e!555430))))

(declare-datatypes ((List!20656 0))(
  ( (Nil!20653) (Cons!20652 (h!21820 (_ BitVec 64)) (t!29459 List!20656)) )
))
(declare-fun arrayNoDuplicates!0 (array!61960 (_ BitVec 32) List!20656) Bool)

(assert (=> b!985117 (= res!658925 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20653))))

(declare-fun b!985118 () Bool)

(declare-fun res!658923 () Bool)

(assert (=> b!985118 (=> (not res!658923) (not e!555430))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985118 (= res!658923 (and (= (size!30312 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30313 _keys!1544) (size!30312 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985119 () Bool)

(declare-fun e!555428 () Bool)

(declare-fun e!555429 () Bool)

(assert (=> b!985119 (= e!555428 (and e!555429 mapRes!36482))))

(declare-fun condMapEmpty!36482 () Bool)

(declare-fun mapDefault!36482 () ValueCell!11003)

(assert (=> b!985119 (= condMapEmpty!36482 (= (arr!29832 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11003)) mapDefault!36482)))))

(declare-fun b!985120 () Bool)

(declare-fun res!658922 () Bool)

(assert (=> b!985120 (=> (not res!658922) (not e!555430))))

(assert (=> b!985120 (= res!658922 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985121 () Bool)

(declare-fun e!555431 () Bool)

(assert (=> b!985121 (= e!555431 (not true))))

(declare-datatypes ((tuple2!14774 0))(
  ( (tuple2!14775 (_1!7398 (_ BitVec 64)) (_2!7398 V!35609)) )
))
(declare-datatypes ((List!20657 0))(
  ( (Nil!20654) (Cons!20653 (h!21821 tuple2!14774) (t!29460 List!20657)) )
))
(declare-datatypes ((ListLongMap!13473 0))(
  ( (ListLongMap!13474 (toList!6752 List!20657)) )
))
(declare-fun lt!437078 () ListLongMap!13473)

(declare-fun lt!437082 () tuple2!14774)

(declare-fun lt!437081 () tuple2!14774)

(declare-fun +!3055 (ListLongMap!13473 tuple2!14774) ListLongMap!13473)

(assert (=> b!985121 (= (+!3055 (+!3055 lt!437078 lt!437082) lt!437081) (+!3055 (+!3055 lt!437078 lt!437081) lt!437082))))

(declare-fun lt!437080 () V!35609)

(assert (=> b!985121 (= lt!437081 (tuple2!14775 (select (arr!29833 _keys!1544) from!1932) lt!437080))))

(declare-fun minValue!1220 () V!35609)

(assert (=> b!985121 (= lt!437082 (tuple2!14775 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32690 0))(
  ( (Unit!32691) )
))
(declare-fun lt!437079 () Unit!32690)

(declare-fun addCommutativeForDiffKeys!662 (ListLongMap!13473 (_ BitVec 64) V!35609 (_ BitVec 64) V!35609) Unit!32690)

(assert (=> b!985121 (= lt!437079 (addCommutativeForDiffKeys!662 lt!437078 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29833 _keys!1544) from!1932) lt!437080))))

(declare-fun res!658926 () Bool)

(assert (=> start!84334 (=> (not res!658926) (not e!555430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84334 (= res!658926 (validMask!0 mask!1948))))

(assert (=> start!84334 e!555430))

(assert (=> start!84334 true))

(declare-fun tp_is_empty!22969 () Bool)

(assert (=> start!84334 tp_is_empty!22969))

(declare-fun array_inv!23083 (array!61958) Bool)

(assert (=> start!84334 (and (array_inv!23083 _values!1278) e!555428)))

(assert (=> start!84334 tp!69205))

(declare-fun array_inv!23084 (array!61960) Bool)

(assert (=> start!84334 (array_inv!23084 _keys!1544)))

(declare-fun b!985122 () Bool)

(assert (=> b!985122 (= e!555432 tp_is_empty!22969)))

(declare-fun b!985123 () Bool)

(declare-fun res!658921 () Bool)

(assert (=> b!985123 (=> (not res!658921) (not e!555430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985123 (= res!658921 (validKeyInArray!0 (select (arr!29833 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36482 () Bool)

(assert (=> mapIsEmpty!36482 mapRes!36482))

(declare-fun b!985124 () Bool)

(assert (=> b!985124 (= e!555430 e!555431)))

(declare-fun res!658924 () Bool)

(assert (=> b!985124 (=> (not res!658924) (not e!555431))))

(assert (=> b!985124 (= res!658924 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29833 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15500 (ValueCell!11003 V!35609) V!35609)

(declare-fun dynLambda!1845 (Int (_ BitVec 64)) V!35609)

(assert (=> b!985124 (= lt!437080 (get!15500 (select (arr!29832 _values!1278) from!1932) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35609)

(declare-fun getCurrentListMapNoExtraKeys!3488 (array!61960 array!61958 (_ BitVec 32) (_ BitVec 32) V!35609 V!35609 (_ BitVec 32) Int) ListLongMap!13473)

(assert (=> b!985124 (= lt!437078 (getCurrentListMapNoExtraKeys!3488 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985125 () Bool)

(assert (=> b!985125 (= e!555429 tp_is_empty!22969)))

(assert (= (and start!84334 res!658926) b!985118))

(assert (= (and b!985118 res!658923) b!985116))

(assert (= (and b!985116 res!658927) b!985117))

(assert (= (and b!985117 res!658925) b!985115))

(assert (= (and b!985115 res!658920) b!985123))

(assert (= (and b!985123 res!658921) b!985120))

(assert (= (and b!985120 res!658922) b!985124))

(assert (= (and b!985124 res!658924) b!985121))

(assert (= (and b!985119 condMapEmpty!36482) mapIsEmpty!36482))

(assert (= (and b!985119 (not condMapEmpty!36482)) mapNonEmpty!36482))

(get-info :version)

(assert (= (and mapNonEmpty!36482 ((_ is ValueCellFull!11003) mapValue!36482)) b!985122))

(assert (= (and b!985119 ((_ is ValueCellFull!11003) mapDefault!36482)) b!985125))

(assert (= start!84334 b!985119))

(declare-fun b_lambda!14913 () Bool)

(assert (=> (not b_lambda!14913) (not b!985124)))

(declare-fun t!29458 () Bool)

(declare-fun tb!6653 () Bool)

(assert (=> (and start!84334 (= defaultEntry!1281 defaultEntry!1281) t!29458) tb!6653))

(declare-fun result!13303 () Bool)

(assert (=> tb!6653 (= result!13303 tp_is_empty!22969)))

(assert (=> b!985124 t!29458))

(declare-fun b_and!31823 () Bool)

(assert (= b_and!31821 (and (=> t!29458 result!13303) b_and!31823)))

(declare-fun m!912599 () Bool)

(assert (=> b!985124 m!912599))

(declare-fun m!912601 () Bool)

(assert (=> b!985124 m!912601))

(declare-fun m!912603 () Bool)

(assert (=> b!985124 m!912603))

(declare-fun m!912605 () Bool)

(assert (=> b!985124 m!912605))

(assert (=> b!985124 m!912601))

(assert (=> b!985124 m!912605))

(declare-fun m!912607 () Bool)

(assert (=> b!985124 m!912607))

(declare-fun m!912609 () Bool)

(assert (=> start!84334 m!912609))

(declare-fun m!912611 () Bool)

(assert (=> start!84334 m!912611))

(declare-fun m!912613 () Bool)

(assert (=> start!84334 m!912613))

(assert (=> b!985123 m!912599))

(assert (=> b!985123 m!912599))

(declare-fun m!912615 () Bool)

(assert (=> b!985123 m!912615))

(declare-fun m!912617 () Bool)

(assert (=> b!985117 m!912617))

(declare-fun m!912619 () Bool)

(assert (=> mapNonEmpty!36482 m!912619))

(declare-fun m!912621 () Bool)

(assert (=> b!985116 m!912621))

(assert (=> b!985121 m!912599))

(declare-fun m!912623 () Bool)

(assert (=> b!985121 m!912623))

(assert (=> b!985121 m!912599))

(declare-fun m!912625 () Bool)

(assert (=> b!985121 m!912625))

(declare-fun m!912627 () Bool)

(assert (=> b!985121 m!912627))

(assert (=> b!985121 m!912625))

(declare-fun m!912629 () Bool)

(assert (=> b!985121 m!912629))

(assert (=> b!985121 m!912629))

(declare-fun m!912631 () Bool)

(assert (=> b!985121 m!912631))

(check-sat (not b!985116) (not b!985121) (not b!985123) (not b!985117) (not b_next!19867) (not b_lambda!14913) b_and!31823 (not start!84334) (not b!985124) tp_is_empty!22969 (not mapNonEmpty!36482))
(check-sat b_and!31823 (not b_next!19867))
