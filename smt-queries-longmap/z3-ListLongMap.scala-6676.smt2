; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84196 () Bool)

(assert start!84196)

(declare-fun b_free!19783 () Bool)

(declare-fun b_next!19783 () Bool)

(assert (=> start!84196 (= b_free!19783 (not b_next!19783))))

(declare-fun tp!68873 () Bool)

(declare-fun b_and!31659 () Bool)

(assert (=> start!84196 (= tp!68873 b_and!31659)))

(declare-fun b!983147 () Bool)

(declare-fun e!554275 () Bool)

(declare-fun tp_is_empty!22831 () Bool)

(assert (=> b!983147 (= e!554275 tp_is_empty!22831)))

(declare-fun b!983148 () Bool)

(declare-fun res!657651 () Bool)

(declare-fun e!554278 () Bool)

(assert (=> b!983148 (=> (not res!657651) (not e!554278))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983148 (= res!657651 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36275 () Bool)

(declare-fun mapRes!36275 () Bool)

(assert (=> mapIsEmpty!36275 mapRes!36275))

(declare-fun b!983150 () Bool)

(declare-fun e!554279 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61690 0))(
  ( (array!61691 (arr!29698 (Array (_ BitVec 32) (_ BitVec 64))) (size!30178 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61690)

(assert (=> b!983150 (= e!554279 (not (bvsle from!1932 (size!30178 _keys!1544))))))

(declare-datatypes ((V!35425 0))(
  ( (V!35426 (val!11466 Int)) )
))
(declare-datatypes ((tuple2!14696 0))(
  ( (tuple2!14697 (_1!7359 (_ BitVec 64)) (_2!7359 V!35425)) )
))
(declare-datatypes ((List!20572 0))(
  ( (Nil!20569) (Cons!20568 (h!21736 tuple2!14696) (t!29297 List!20572)) )
))
(declare-datatypes ((ListLongMap!13395 0))(
  ( (ListLongMap!13396 (toList!6713 List!20572)) )
))
(declare-fun lt!436413 () ListLongMap!13395)

(declare-fun lt!436414 () tuple2!14696)

(declare-fun lt!436412 () tuple2!14696)

(declare-fun +!3023 (ListLongMap!13395 tuple2!14696) ListLongMap!13395)

(assert (=> b!983150 (= (+!3023 (+!3023 lt!436413 lt!436414) lt!436412) (+!3023 (+!3023 lt!436413 lt!436412) lt!436414))))

(declare-fun lt!436416 () V!35425)

(assert (=> b!983150 (= lt!436412 (tuple2!14697 (select (arr!29698 _keys!1544) from!1932) lt!436416))))

(declare-fun zeroValue!1220 () V!35425)

(assert (=> b!983150 (= lt!436414 (tuple2!14697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32626 0))(
  ( (Unit!32627) )
))
(declare-fun lt!436415 () Unit!32626)

(declare-fun addCommutativeForDiffKeys!630 (ListLongMap!13395 (_ BitVec 64) V!35425 (_ BitVec 64) V!35425) Unit!32626)

(assert (=> b!983150 (= lt!436415 (addCommutativeForDiffKeys!630 lt!436413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29698 _keys!1544) from!1932) lt!436416))))

(declare-fun b!983151 () Bool)

(declare-fun res!657658 () Bool)

(assert (=> b!983151 (=> (not res!657658) (not e!554278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983151 (= res!657658 (validKeyInArray!0 (select (arr!29698 _keys!1544) from!1932)))))

(declare-fun b!983152 () Bool)

(declare-fun e!554277 () Bool)

(declare-fun e!554276 () Bool)

(assert (=> b!983152 (= e!554277 (and e!554276 mapRes!36275))))

(declare-fun condMapEmpty!36275 () Bool)

(declare-datatypes ((ValueCell!10934 0))(
  ( (ValueCellFull!10934 (v!14025 V!35425)) (EmptyCell!10934) )
))
(declare-datatypes ((array!61692 0))(
  ( (array!61693 (arr!29699 (Array (_ BitVec 32) ValueCell!10934)) (size!30179 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61692)

(declare-fun mapDefault!36275 () ValueCell!10934)

(assert (=> b!983152 (= condMapEmpty!36275 (= (arr!29699 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10934)) mapDefault!36275)))))

(declare-fun b!983153 () Bool)

(declare-fun res!657653 () Bool)

(assert (=> b!983153 (=> (not res!657653) (not e!554278))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61690 (_ BitVec 32)) Bool)

(assert (=> b!983153 (= res!657653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983154 () Bool)

(declare-fun res!657652 () Bool)

(assert (=> b!983154 (=> (not res!657652) (not e!554278))))

(assert (=> b!983154 (= res!657652 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30178 _keys!1544))))))

(declare-fun b!983155 () Bool)

(declare-fun res!657655 () Bool)

(assert (=> b!983155 (=> (not res!657655) (not e!554278))))

(declare-datatypes ((List!20573 0))(
  ( (Nil!20570) (Cons!20569 (h!21737 (_ BitVec 64)) (t!29298 List!20573)) )
))
(declare-fun arrayNoDuplicates!0 (array!61690 (_ BitVec 32) List!20573) Bool)

(assert (=> b!983155 (= res!657655 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20570))))

(declare-fun mapNonEmpty!36275 () Bool)

(declare-fun tp!68872 () Bool)

(assert (=> mapNonEmpty!36275 (= mapRes!36275 (and tp!68872 e!554275))))

(declare-fun mapValue!36275 () ValueCell!10934)

(declare-fun mapRest!36275 () (Array (_ BitVec 32) ValueCell!10934))

(declare-fun mapKey!36275 () (_ BitVec 32))

(assert (=> mapNonEmpty!36275 (= (arr!29699 _values!1278) (store mapRest!36275 mapKey!36275 mapValue!36275))))

(declare-fun b!983156 () Bool)

(assert (=> b!983156 (= e!554276 tp_is_empty!22831)))

(declare-fun b!983157 () Bool)

(assert (=> b!983157 (= e!554278 e!554279)))

(declare-fun res!657656 () Bool)

(assert (=> b!983157 (=> (not res!657656) (not e!554279))))

(assert (=> b!983157 (= res!657656 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29698 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15425 (ValueCell!10934 V!35425) V!35425)

(declare-fun dynLambda!1816 (Int (_ BitVec 64)) V!35425)

(assert (=> b!983157 (= lt!436416 (get!15425 (select (arr!29699 _values!1278) from!1932) (dynLambda!1816 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35425)

(declare-fun getCurrentListMapNoExtraKeys!3457 (array!61690 array!61692 (_ BitVec 32) (_ BitVec 32) V!35425 V!35425 (_ BitVec 32) Int) ListLongMap!13395)

(assert (=> b!983157 (= lt!436413 (getCurrentListMapNoExtraKeys!3457 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983149 () Bool)

(declare-fun res!657657 () Bool)

(assert (=> b!983149 (=> (not res!657657) (not e!554278))))

(assert (=> b!983149 (= res!657657 (and (= (size!30179 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30178 _keys!1544) (size!30179 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!657654 () Bool)

(assert (=> start!84196 (=> (not res!657654) (not e!554278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84196 (= res!657654 (validMask!0 mask!1948))))

(assert (=> start!84196 e!554278))

(assert (=> start!84196 true))

(assert (=> start!84196 tp_is_empty!22831))

(declare-fun array_inv!22985 (array!61692) Bool)

(assert (=> start!84196 (and (array_inv!22985 _values!1278) e!554277)))

(assert (=> start!84196 tp!68873))

(declare-fun array_inv!22986 (array!61690) Bool)

(assert (=> start!84196 (array_inv!22986 _keys!1544)))

(assert (= (and start!84196 res!657654) b!983149))

(assert (= (and b!983149 res!657657) b!983153))

(assert (= (and b!983153 res!657653) b!983155))

(assert (= (and b!983155 res!657655) b!983154))

(assert (= (and b!983154 res!657652) b!983151))

(assert (= (and b!983151 res!657658) b!983148))

(assert (= (and b!983148 res!657651) b!983157))

(assert (= (and b!983157 res!657656) b!983150))

(assert (= (and b!983152 condMapEmpty!36275) mapIsEmpty!36275))

(assert (= (and b!983152 (not condMapEmpty!36275)) mapNonEmpty!36275))

(get-info :version)

(assert (= (and mapNonEmpty!36275 ((_ is ValueCellFull!10934) mapValue!36275)) b!983147))

(assert (= (and b!983152 ((_ is ValueCellFull!10934) mapDefault!36275)) b!983156))

(assert (= start!84196 b!983152))

(declare-fun b_lambda!14835 () Bool)

(assert (=> (not b_lambda!14835) (not b!983157)))

(declare-fun t!29296 () Bool)

(declare-fun tb!6575 () Bool)

(assert (=> (and start!84196 (= defaultEntry!1281 defaultEntry!1281) t!29296) tb!6575))

(declare-fun result!13147 () Bool)

(assert (=> tb!6575 (= result!13147 tp_is_empty!22831)))

(assert (=> b!983157 t!29296))

(declare-fun b_and!31661 () Bool)

(assert (= b_and!31659 (and (=> t!29296 result!13147) b_and!31661)))

(declare-fun m!910883 () Bool)

(assert (=> b!983155 m!910883))

(declare-fun m!910885 () Bool)

(assert (=> mapNonEmpty!36275 m!910885))

(declare-fun m!910887 () Bool)

(assert (=> b!983150 m!910887))

(assert (=> b!983150 m!910887))

(declare-fun m!910889 () Bool)

(assert (=> b!983150 m!910889))

(declare-fun m!910891 () Bool)

(assert (=> b!983150 m!910891))

(declare-fun m!910893 () Bool)

(assert (=> b!983150 m!910893))

(declare-fun m!910895 () Bool)

(assert (=> b!983150 m!910895))

(assert (=> b!983150 m!910891))

(declare-fun m!910897 () Bool)

(assert (=> b!983150 m!910897))

(assert (=> b!983150 m!910893))

(assert (=> b!983157 m!910887))

(declare-fun m!910899 () Bool)

(assert (=> b!983157 m!910899))

(declare-fun m!910901 () Bool)

(assert (=> b!983157 m!910901))

(declare-fun m!910903 () Bool)

(assert (=> b!983157 m!910903))

(assert (=> b!983157 m!910899))

(assert (=> b!983157 m!910903))

(declare-fun m!910905 () Bool)

(assert (=> b!983157 m!910905))

(assert (=> b!983151 m!910887))

(assert (=> b!983151 m!910887))

(declare-fun m!910907 () Bool)

(assert (=> b!983151 m!910907))

(declare-fun m!910909 () Bool)

(assert (=> b!983153 m!910909))

(declare-fun m!910911 () Bool)

(assert (=> start!84196 m!910911))

(declare-fun m!910913 () Bool)

(assert (=> start!84196 m!910913))

(declare-fun m!910915 () Bool)

(assert (=> start!84196 m!910915))

(check-sat (not start!84196) (not b!983155) b_and!31661 (not b!983153) tp_is_empty!22831 (not mapNonEmpty!36275) (not b!983150) (not b_lambda!14835) (not b_next!19783) (not b!983157) (not b!983151))
(check-sat b_and!31661 (not b_next!19783))
