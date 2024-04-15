; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83878 () Bool)

(assert start!83878)

(declare-fun b_free!19705 () Bool)

(declare-fun b_next!19705 () Bool)

(assert (=> start!83878 (= b_free!19705 (not b_next!19705))))

(declare-fun tp!68558 () Bool)

(declare-fun b_and!31473 () Bool)

(assert (=> start!83878 (= tp!68558 b_and!31473)))

(declare-fun b!980142 () Bool)

(declare-fun e!552452 () Bool)

(declare-fun tp_is_empty!22699 () Bool)

(assert (=> b!980142 (= e!552452 tp_is_empty!22699)))

(declare-fun b!980143 () Bool)

(declare-fun res!656002 () Bool)

(declare-fun e!552448 () Bool)

(assert (=> b!980143 (=> (not res!656002) (not e!552448))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980143 (= res!656002 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980144 () Bool)

(declare-fun e!552447 () Bool)

(assert (=> b!980144 (= e!552448 (not e!552447))))

(declare-fun res!656001 () Bool)

(assert (=> b!980144 (=> res!656001 e!552447)))

(declare-datatypes ((array!61334 0))(
  ( (array!61335 (arr!29525 (Array (_ BitVec 32) (_ BitVec 64))) (size!30006 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61334)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980144 (= res!656001 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29525 _keys!1544) from!1932)))))

(declare-datatypes ((V!35249 0))(
  ( (V!35250 (val!11400 Int)) )
))
(declare-datatypes ((tuple2!14696 0))(
  ( (tuple2!14697 (_1!7359 (_ BitVec 64)) (_2!7359 V!35249)) )
))
(declare-datatypes ((List!20518 0))(
  ( (Nil!20515) (Cons!20514 (h!21676 tuple2!14696) (t!29170 List!20518)) )
))
(declare-datatypes ((ListLongMap!13383 0))(
  ( (ListLongMap!13384 (toList!6707 List!20518)) )
))
(declare-fun lt!435025 () ListLongMap!13383)

(declare-fun lt!435028 () tuple2!14696)

(declare-fun lt!435024 () ListLongMap!13383)

(declare-fun lt!435033 () tuple2!14696)

(declare-fun +!3007 (ListLongMap!13383 tuple2!14696) ListLongMap!13383)

(assert (=> b!980144 (= (+!3007 lt!435025 lt!435028) (+!3007 lt!435024 lt!435033))))

(declare-fun lt!435032 () ListLongMap!13383)

(assert (=> b!980144 (= lt!435024 (+!3007 lt!435032 lt!435028))))

(declare-fun lt!435030 () V!35249)

(assert (=> b!980144 (= lt!435028 (tuple2!14697 (select (arr!29525 _keys!1544) from!1932) lt!435030))))

(assert (=> b!980144 (= lt!435025 (+!3007 lt!435032 lt!435033))))

(declare-fun minValue!1220 () V!35249)

(assert (=> b!980144 (= lt!435033 (tuple2!14697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32480 0))(
  ( (Unit!32481) )
))
(declare-fun lt!435031 () Unit!32480)

(declare-fun addCommutativeForDiffKeys!611 (ListLongMap!13383 (_ BitVec 64) V!35249 (_ BitVec 64) V!35249) Unit!32480)

(assert (=> b!980144 (= lt!435031 (addCommutativeForDiffKeys!611 lt!435032 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29525 _keys!1544) from!1932) lt!435030))))

(declare-datatypes ((ValueCell!10868 0))(
  ( (ValueCellFull!10868 (v!13961 V!35249)) (EmptyCell!10868) )
))
(declare-datatypes ((array!61336 0))(
  ( (array!61337 (arr!29526 (Array (_ BitVec 32) ValueCell!10868)) (size!30007 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61336)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15319 (ValueCell!10868 V!35249) V!35249)

(declare-fun dynLambda!1753 (Int (_ BitVec 64)) V!35249)

(assert (=> b!980144 (= lt!435030 (get!15319 (select (arr!29526 _values!1278) from!1932) (dynLambda!1753 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435027 () ListLongMap!13383)

(declare-fun lt!435029 () tuple2!14696)

(assert (=> b!980144 (= lt!435032 (+!3007 lt!435027 lt!435029))))

(declare-fun zeroValue!1220 () V!35249)

(assert (=> b!980144 (= lt!435029 (tuple2!14697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3420 (array!61334 array!61336 (_ BitVec 32) (_ BitVec 32) V!35249 V!35249 (_ BitVec 32) Int) ListLongMap!13383)

(assert (=> b!980144 (= lt!435027 (getCurrentListMapNoExtraKeys!3420 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980146 () Bool)

(declare-fun res!656004 () Bool)

(assert (=> b!980146 (=> (not res!656004) (not e!552448))))

(declare-datatypes ((List!20519 0))(
  ( (Nil!20516) (Cons!20515 (h!21677 (_ BitVec 64)) (t!29171 List!20519)) )
))
(declare-fun arrayNoDuplicates!0 (array!61334 (_ BitVec 32) List!20519) Bool)

(assert (=> b!980146 (= res!656004 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20516))))

(declare-fun mapIsEmpty!36077 () Bool)

(declare-fun mapRes!36077 () Bool)

(assert (=> mapIsEmpty!36077 mapRes!36077))

(declare-fun b!980147 () Bool)

(declare-fun e!552449 () Bool)

(assert (=> b!980147 (= e!552449 tp_is_empty!22699)))

(declare-fun b!980148 () Bool)

(declare-fun res!656007 () Bool)

(assert (=> b!980148 (=> (not res!656007) (not e!552448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980148 (= res!656007 (validKeyInArray!0 (select (arr!29525 _keys!1544) from!1932)))))

(declare-fun b!980149 () Bool)

(declare-fun res!656000 () Bool)

(assert (=> b!980149 (=> (not res!656000) (not e!552448))))

(assert (=> b!980149 (= res!656000 (and (= (size!30007 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30006 _keys!1544) (size!30007 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36077 () Bool)

(declare-fun tp!68557 () Bool)

(assert (=> mapNonEmpty!36077 (= mapRes!36077 (and tp!68557 e!552452))))

(declare-fun mapRest!36077 () (Array (_ BitVec 32) ValueCell!10868))

(declare-fun mapValue!36077 () ValueCell!10868)

(declare-fun mapKey!36077 () (_ BitVec 32))

(assert (=> mapNonEmpty!36077 (= (arr!29526 _values!1278) (store mapRest!36077 mapKey!36077 mapValue!36077))))

(declare-fun res!656005 () Bool)

(assert (=> start!83878 (=> (not res!656005) (not e!552448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83878 (= res!656005 (validMask!0 mask!1948))))

(assert (=> start!83878 e!552448))

(assert (=> start!83878 true))

(assert (=> start!83878 tp_is_empty!22699))

(declare-fun e!552451 () Bool)

(declare-fun array_inv!22851 (array!61336) Bool)

(assert (=> start!83878 (and (array_inv!22851 _values!1278) e!552451)))

(assert (=> start!83878 tp!68558))

(declare-fun array_inv!22852 (array!61334) Bool)

(assert (=> start!83878 (array_inv!22852 _keys!1544)))

(declare-fun b!980145 () Bool)

(declare-fun res!656003 () Bool)

(assert (=> b!980145 (=> (not res!656003) (not e!552448))))

(assert (=> b!980145 (= res!656003 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30006 _keys!1544))))))

(declare-fun b!980150 () Bool)

(assert (=> b!980150 (= e!552447 true)))

(assert (=> b!980150 (= lt!435024 (+!3007 (+!3007 lt!435027 lt!435028) lt!435029))))

(declare-fun lt!435026 () Unit!32480)

(assert (=> b!980150 (= lt!435026 (addCommutativeForDiffKeys!611 lt!435027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29525 _keys!1544) from!1932) lt!435030))))

(declare-fun b!980151 () Bool)

(assert (=> b!980151 (= e!552451 (and e!552449 mapRes!36077))))

(declare-fun condMapEmpty!36077 () Bool)

(declare-fun mapDefault!36077 () ValueCell!10868)

(assert (=> b!980151 (= condMapEmpty!36077 (= (arr!29526 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10868)) mapDefault!36077)))))

(declare-fun b!980152 () Bool)

(declare-fun res!656006 () Bool)

(assert (=> b!980152 (=> (not res!656006) (not e!552448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61334 (_ BitVec 32)) Bool)

(assert (=> b!980152 (= res!656006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83878 res!656005) b!980149))

(assert (= (and b!980149 res!656000) b!980152))

(assert (= (and b!980152 res!656006) b!980146))

(assert (= (and b!980146 res!656004) b!980145))

(assert (= (and b!980145 res!656003) b!980148))

(assert (= (and b!980148 res!656007) b!980143))

(assert (= (and b!980143 res!656002) b!980144))

(assert (= (and b!980144 (not res!656001)) b!980150))

(assert (= (and b!980151 condMapEmpty!36077) mapIsEmpty!36077))

(assert (= (and b!980151 (not condMapEmpty!36077)) mapNonEmpty!36077))

(get-info :version)

(assert (= (and mapNonEmpty!36077 ((_ is ValueCellFull!10868) mapValue!36077)) b!980142))

(assert (= (and b!980151 ((_ is ValueCellFull!10868) mapDefault!36077)) b!980147))

(assert (= start!83878 b!980151))

(declare-fun b_lambda!14731 () Bool)

(assert (=> (not b_lambda!14731) (not b!980144)))

(declare-fun t!29169 () Bool)

(declare-fun tb!6503 () Bool)

(assert (=> (and start!83878 (= defaultEntry!1281 defaultEntry!1281) t!29169) tb!6503))

(declare-fun result!13003 () Bool)

(assert (=> tb!6503 (= result!13003 tp_is_empty!22699)))

(assert (=> b!980144 t!29169))

(declare-fun b_and!31475 () Bool)

(assert (= b_and!31473 (and (=> t!29169 result!13003) b_and!31475)))

(declare-fun m!907121 () Bool)

(assert (=> b!980144 m!907121))

(declare-fun m!907123 () Bool)

(assert (=> b!980144 m!907123))

(declare-fun m!907125 () Bool)

(assert (=> b!980144 m!907125))

(declare-fun m!907127 () Bool)

(assert (=> b!980144 m!907127))

(declare-fun m!907129 () Bool)

(assert (=> b!980144 m!907129))

(declare-fun m!907131 () Bool)

(assert (=> b!980144 m!907131))

(assert (=> b!980144 m!907131))

(declare-fun m!907133 () Bool)

(assert (=> b!980144 m!907133))

(declare-fun m!907135 () Bool)

(assert (=> b!980144 m!907135))

(declare-fun m!907137 () Bool)

(assert (=> b!980144 m!907137))

(declare-fun m!907139 () Bool)

(assert (=> b!980144 m!907139))

(assert (=> b!980144 m!907121))

(assert (=> b!980144 m!907139))

(declare-fun m!907141 () Bool)

(assert (=> b!980144 m!907141))

(declare-fun m!907143 () Bool)

(assert (=> b!980152 m!907143))

(assert (=> b!980148 m!907131))

(assert (=> b!980148 m!907131))

(declare-fun m!907145 () Bool)

(assert (=> b!980148 m!907145))

(declare-fun m!907147 () Bool)

(assert (=> mapNonEmpty!36077 m!907147))

(declare-fun m!907149 () Bool)

(assert (=> start!83878 m!907149))

(declare-fun m!907151 () Bool)

(assert (=> start!83878 m!907151))

(declare-fun m!907153 () Bool)

(assert (=> start!83878 m!907153))

(declare-fun m!907155 () Bool)

(assert (=> b!980150 m!907155))

(assert (=> b!980150 m!907155))

(declare-fun m!907157 () Bool)

(assert (=> b!980150 m!907157))

(assert (=> b!980150 m!907131))

(assert (=> b!980150 m!907131))

(declare-fun m!907159 () Bool)

(assert (=> b!980150 m!907159))

(declare-fun m!907161 () Bool)

(assert (=> b!980146 m!907161))

(check-sat b_and!31475 (not b!980152) tp_is_empty!22699 (not start!83878) (not b!980148) (not mapNonEmpty!36077) (not b_next!19705) (not b!980144) (not b!980146) (not b!980150) (not b_lambda!14731))
(check-sat b_and!31475 (not b_next!19705))
