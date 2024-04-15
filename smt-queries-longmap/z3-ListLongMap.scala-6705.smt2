; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84184 () Bool)

(assert start!84184)

(declare-fun b_free!19903 () Bool)

(declare-fun b_next!19903 () Bool)

(assert (=> start!84184 (= b_free!19903 (not b_next!19903))))

(declare-fun tp!69313 () Bool)

(declare-fun b_and!31857 () Bool)

(assert (=> start!84184 (= tp!69313 b_and!31857)))

(declare-fun b!984603 () Bool)

(declare-fun e!555024 () Bool)

(declare-fun e!555022 () Bool)

(declare-fun mapRes!36536 () Bool)

(assert (=> b!984603 (= e!555024 (and e!555022 mapRes!36536))))

(declare-fun condMapEmpty!36536 () Bool)

(declare-datatypes ((V!35657 0))(
  ( (V!35658 (val!11553 Int)) )
))
(declare-datatypes ((ValueCell!11021 0))(
  ( (ValueCellFull!11021 (v!14114 V!35657)) (EmptyCell!11021) )
))
(declare-datatypes ((array!61918 0))(
  ( (array!61919 (arr!29817 (Array (_ BitVec 32) ValueCell!11021)) (size!30298 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61918)

(declare-fun mapDefault!36536 () ValueCell!11021)

(assert (=> b!984603 (= condMapEmpty!36536 (= (arr!29817 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11021)) mapDefault!36536)))))

(declare-fun b!984604 () Bool)

(declare-fun e!555025 () Bool)

(declare-fun tp_is_empty!23005 () Bool)

(assert (=> b!984604 (= e!555025 tp_is_empty!23005)))

(declare-fun b!984605 () Bool)

(declare-fun e!555023 () Bool)

(assert (=> b!984605 (= e!555023 (not true))))

(declare-datatypes ((tuple2!14858 0))(
  ( (tuple2!14859 (_1!7440 (_ BitVec 64)) (_2!7440 V!35657)) )
))
(declare-datatypes ((List!20708 0))(
  ( (Nil!20705) (Cons!20704 (h!21866 tuple2!14858) (t!29546 List!20708)) )
))
(declare-datatypes ((ListLongMap!13545 0))(
  ( (ListLongMap!13546 (toList!6788 List!20708)) )
))
(declare-fun lt!436751 () ListLongMap!13545)

(declare-fun lt!436752 () tuple2!14858)

(declare-fun lt!436754 () tuple2!14858)

(declare-fun +!3067 (ListLongMap!13545 tuple2!14858) ListLongMap!13545)

(assert (=> b!984605 (= (+!3067 (+!3067 lt!436751 lt!436752) lt!436754) (+!3067 (+!3067 lt!436751 lt!436754) lt!436752))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!436753 () V!35657)

(declare-datatypes ((array!61920 0))(
  ( (array!61921 (arr!29818 (Array (_ BitVec 32) (_ BitVec 64))) (size!30299 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61920)

(assert (=> b!984605 (= lt!436754 (tuple2!14859 (select (arr!29818 _keys!1544) from!1932) lt!436753))))

(declare-fun minValue!1220 () V!35657)

(assert (=> b!984605 (= lt!436752 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32600 0))(
  ( (Unit!32601) )
))
(declare-fun lt!436755 () Unit!32600)

(declare-fun addCommutativeForDiffKeys!671 (ListLongMap!13545 (_ BitVec 64) V!35657 (_ BitVec 64) V!35657) Unit!32600)

(assert (=> b!984605 (= lt!436755 (addCommutativeForDiffKeys!671 lt!436751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29818 _keys!1544) from!1932) lt!436753))))

(declare-fun mapNonEmpty!36536 () Bool)

(declare-fun tp!69314 () Bool)

(assert (=> mapNonEmpty!36536 (= mapRes!36536 (and tp!69314 e!555025))))

(declare-fun mapRest!36536 () (Array (_ BitVec 32) ValueCell!11021))

(declare-fun mapKey!36536 () (_ BitVec 32))

(declare-fun mapValue!36536 () ValueCell!11021)

(assert (=> mapNonEmpty!36536 (= (arr!29817 _values!1278) (store mapRest!36536 mapKey!36536 mapValue!36536))))

(declare-fun b!984606 () Bool)

(declare-fun res!658900 () Bool)

(declare-fun e!555026 () Bool)

(assert (=> b!984606 (=> (not res!658900) (not e!555026))))

(declare-datatypes ((List!20709 0))(
  ( (Nil!20706) (Cons!20705 (h!21867 (_ BitVec 64)) (t!29547 List!20709)) )
))
(declare-fun arrayNoDuplicates!0 (array!61920 (_ BitVec 32) List!20709) Bool)

(assert (=> b!984606 (= res!658900 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20706))))

(declare-fun b!984607 () Bool)

(declare-fun res!658905 () Bool)

(assert (=> b!984607 (=> (not res!658905) (not e!555026))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984607 (= res!658905 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984608 () Bool)

(declare-fun res!658902 () Bool)

(assert (=> b!984608 (=> (not res!658902) (not e!555026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984608 (= res!658902 (validKeyInArray!0 (select (arr!29818 _keys!1544) from!1932)))))

(declare-fun b!984609 () Bool)

(declare-fun res!658903 () Bool)

(assert (=> b!984609 (=> (not res!658903) (not e!555026))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61920 (_ BitVec 32)) Bool)

(assert (=> b!984609 (= res!658903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984610 () Bool)

(declare-fun res!658898 () Bool)

(assert (=> b!984610 (=> (not res!658898) (not e!555026))))

(assert (=> b!984610 (= res!658898 (and (= (size!30298 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30299 _keys!1544) (size!30298 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36536 () Bool)

(assert (=> mapIsEmpty!36536 mapRes!36536))

(declare-fun b!984611 () Bool)

(assert (=> b!984611 (= e!555026 e!555023)))

(declare-fun res!658904 () Bool)

(assert (=> b!984611 (=> (not res!658904) (not e!555023))))

(assert (=> b!984611 (= res!658904 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29818 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15489 (ValueCell!11021 V!35657) V!35657)

(declare-fun dynLambda!1821 (Int (_ BitVec 64)) V!35657)

(assert (=> b!984611 (= lt!436753 (get!15489 (select (arr!29817 _values!1278) from!1932) (dynLambda!1821 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35657)

(declare-fun getCurrentListMapNoExtraKeys!3493 (array!61920 array!61918 (_ BitVec 32) (_ BitVec 32) V!35657 V!35657 (_ BitVec 32) Int) ListLongMap!13545)

(assert (=> b!984611 (= lt!436751 (getCurrentListMapNoExtraKeys!3493 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984612 () Bool)

(assert (=> b!984612 (= e!555022 tp_is_empty!23005)))

(declare-fun res!658901 () Bool)

(assert (=> start!84184 (=> (not res!658901) (not e!555026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84184 (= res!658901 (validMask!0 mask!1948))))

(assert (=> start!84184 e!555026))

(assert (=> start!84184 true))

(assert (=> start!84184 tp_is_empty!23005))

(declare-fun array_inv!23051 (array!61918) Bool)

(assert (=> start!84184 (and (array_inv!23051 _values!1278) e!555024)))

(assert (=> start!84184 tp!69313))

(declare-fun array_inv!23052 (array!61920) Bool)

(assert (=> start!84184 (array_inv!23052 _keys!1544)))

(declare-fun b!984613 () Bool)

(declare-fun res!658899 () Bool)

(assert (=> b!984613 (=> (not res!658899) (not e!555026))))

(assert (=> b!984613 (= res!658899 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30299 _keys!1544))))))

(assert (= (and start!84184 res!658901) b!984610))

(assert (= (and b!984610 res!658898) b!984609))

(assert (= (and b!984609 res!658903) b!984606))

(assert (= (and b!984606 res!658900) b!984613))

(assert (= (and b!984613 res!658899) b!984608))

(assert (= (and b!984608 res!658902) b!984607))

(assert (= (and b!984607 res!658905) b!984611))

(assert (= (and b!984611 res!658904) b!984605))

(assert (= (and b!984603 condMapEmpty!36536) mapIsEmpty!36536))

(assert (= (and b!984603 (not condMapEmpty!36536)) mapNonEmpty!36536))

(get-info :version)

(assert (= (and mapNonEmpty!36536 ((_ is ValueCellFull!11021) mapValue!36536)) b!984604))

(assert (= (and b!984603 ((_ is ValueCellFull!11021) mapDefault!36536)) b!984612))

(assert (= start!84184 b!984603))

(declare-fun b_lambda!14917 () Bool)

(assert (=> (not b_lambda!14917) (not b!984611)))

(declare-fun t!29545 () Bool)

(declare-fun tb!6689 () Bool)

(assert (=> (and start!84184 (= defaultEntry!1281 defaultEntry!1281) t!29545) tb!6689))

(declare-fun result!13375 () Bool)

(assert (=> tb!6689 (= result!13375 tp_is_empty!23005)))

(assert (=> b!984611 t!29545))

(declare-fun b_and!31859 () Bool)

(assert (= b_and!31857 (and (=> t!29545 result!13375) b_and!31859)))

(declare-fun m!911159 () Bool)

(assert (=> b!984605 m!911159))

(declare-fun m!911161 () Bool)

(assert (=> b!984605 m!911161))

(declare-fun m!911163 () Bool)

(assert (=> b!984605 m!911163))

(assert (=> b!984605 m!911159))

(declare-fun m!911165 () Bool)

(assert (=> b!984605 m!911165))

(declare-fun m!911167 () Bool)

(assert (=> b!984605 m!911167))

(assert (=> b!984605 m!911161))

(assert (=> b!984605 m!911167))

(declare-fun m!911169 () Bool)

(assert (=> b!984605 m!911169))

(declare-fun m!911171 () Bool)

(assert (=> b!984609 m!911171))

(assert (=> b!984611 m!911159))

(declare-fun m!911173 () Bool)

(assert (=> b!984611 m!911173))

(declare-fun m!911175 () Bool)

(assert (=> b!984611 m!911175))

(declare-fun m!911177 () Bool)

(assert (=> b!984611 m!911177))

(assert (=> b!984611 m!911173))

(assert (=> b!984611 m!911177))

(declare-fun m!911179 () Bool)

(assert (=> b!984611 m!911179))

(declare-fun m!911181 () Bool)

(assert (=> start!84184 m!911181))

(declare-fun m!911183 () Bool)

(assert (=> start!84184 m!911183))

(declare-fun m!911185 () Bool)

(assert (=> start!84184 m!911185))

(declare-fun m!911187 () Bool)

(assert (=> b!984606 m!911187))

(assert (=> b!984608 m!911159))

(assert (=> b!984608 m!911159))

(declare-fun m!911189 () Bool)

(assert (=> b!984608 m!911189))

(declare-fun m!911191 () Bool)

(assert (=> mapNonEmpty!36536 m!911191))

(check-sat (not b!984611) (not start!84184) (not b!984606) (not b!984608) (not b_lambda!14917) (not mapNonEmpty!36536) b_and!31859 tp_is_empty!23005 (not b!984609) (not b!984605) (not b_next!19903))
(check-sat b_and!31859 (not b_next!19903))
