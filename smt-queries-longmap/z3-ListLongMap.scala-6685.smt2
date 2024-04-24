; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84250 () Bool)

(assert start!84250)

(declare-fun b_free!19837 () Bool)

(declare-fun b_next!19837 () Bool)

(assert (=> start!84250 (= b_free!19837 (not b_next!19837))))

(declare-fun tp!69035 () Bool)

(declare-fun b_and!31767 () Bool)

(assert (=> start!84250 (= tp!69035 b_and!31767)))

(declare-fun b!984092 () Bool)

(declare-fun e!554762 () Bool)

(declare-fun tp_is_empty!22885 () Bool)

(assert (=> b!984092 (= e!554762 tp_is_empty!22885)))

(declare-fun b!984093 () Bool)

(declare-fun e!554765 () Bool)

(declare-fun mapRes!36356 () Bool)

(assert (=> b!984093 (= e!554765 (and e!554762 mapRes!36356))))

(declare-fun condMapEmpty!36356 () Bool)

(declare-datatypes ((V!35497 0))(
  ( (V!35498 (val!11493 Int)) )
))
(declare-datatypes ((ValueCell!10961 0))(
  ( (ValueCellFull!10961 (v!14052 V!35497)) (EmptyCell!10961) )
))
(declare-datatypes ((array!61796 0))(
  ( (array!61797 (arr!29751 (Array (_ BitVec 32) ValueCell!10961)) (size!30231 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61796)

(declare-fun mapDefault!36356 () ValueCell!10961)

(assert (=> b!984093 (= condMapEmpty!36356 (= (arr!29751 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10961)) mapDefault!36356)))))

(declare-fun b!984094 () Bool)

(declare-fun e!554766 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984094 (= e!554766 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14746 0))(
  ( (tuple2!14747 (_1!7384 (_ BitVec 64)) (_2!7384 V!35497)) )
))
(declare-datatypes ((List!20617 0))(
  ( (Nil!20614) (Cons!20613 (h!21781 tuple2!14746) (t!29396 List!20617)) )
))
(declare-datatypes ((ListLongMap!13445 0))(
  ( (ListLongMap!13446 (toList!6738 List!20617)) )
))
(declare-fun lt!436821 () ListLongMap!13445)

(declare-fun lt!436817 () tuple2!14746)

(declare-fun lt!436818 () tuple2!14746)

(declare-fun +!3044 (ListLongMap!13445 tuple2!14746) ListLongMap!13445)

(assert (=> b!984094 (= (+!3044 (+!3044 lt!436821 lt!436817) lt!436818) (+!3044 (+!3044 lt!436821 lt!436818) lt!436817))))

(declare-datatypes ((array!61798 0))(
  ( (array!61799 (arr!29752 (Array (_ BitVec 32) (_ BitVec 64))) (size!30232 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61798)

(declare-fun lt!436820 () V!35497)

(assert (=> b!984094 (= lt!436818 (tuple2!14747 (select (arr!29752 _keys!1544) from!1932) lt!436820))))

(declare-fun zeroValue!1220 () V!35497)

(assert (=> b!984094 (= lt!436817 (tuple2!14747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32668 0))(
  ( (Unit!32669) )
))
(declare-fun lt!436819 () Unit!32668)

(declare-fun addCommutativeForDiffKeys!651 (ListLongMap!13445 (_ BitVec 64) V!35497 (_ BitVec 64) V!35497) Unit!32668)

(assert (=> b!984094 (= lt!436819 (addCommutativeForDiffKeys!651 lt!436821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29752 _keys!1544) from!1932) lt!436820))))

(declare-fun mapIsEmpty!36356 () Bool)

(assert (=> mapIsEmpty!36356 mapRes!36356))

(declare-fun b!984096 () Bool)

(declare-fun res!658305 () Bool)

(declare-fun e!554763 () Bool)

(assert (=> b!984096 (=> (not res!658305) (not e!554763))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984096 (= res!658305 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!984097 () Bool)

(declare-fun res!658303 () Bool)

(assert (=> b!984097 (=> (not res!658303) (not e!554763))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!984097 (= res!658303 (and (= (size!30231 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30232 _keys!1544) (size!30231 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984098 () Bool)

(declare-fun res!658299 () Bool)

(assert (=> b!984098 (=> (not res!658299) (not e!554763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61798 (_ BitVec 32)) Bool)

(assert (=> b!984098 (= res!658299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36356 () Bool)

(declare-fun tp!69034 () Bool)

(declare-fun e!554761 () Bool)

(assert (=> mapNonEmpty!36356 (= mapRes!36356 (and tp!69034 e!554761))))

(declare-fun mapRest!36356 () (Array (_ BitVec 32) ValueCell!10961))

(declare-fun mapValue!36356 () ValueCell!10961)

(declare-fun mapKey!36356 () (_ BitVec 32))

(assert (=> mapNonEmpty!36356 (= (arr!29751 _values!1278) (store mapRest!36356 mapKey!36356 mapValue!36356))))

(declare-fun b!984099 () Bool)

(declare-fun res!658304 () Bool)

(assert (=> b!984099 (=> (not res!658304) (not e!554763))))

(declare-datatypes ((List!20618 0))(
  ( (Nil!20615) (Cons!20614 (h!21782 (_ BitVec 64)) (t!29397 List!20618)) )
))
(declare-fun arrayNoDuplicates!0 (array!61798 (_ BitVec 32) List!20618) Bool)

(assert (=> b!984099 (= res!658304 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20615))))

(declare-fun b!984100 () Bool)

(assert (=> b!984100 (= e!554763 e!554766)))

(declare-fun res!658302 () Bool)

(assert (=> b!984100 (=> (not res!658302) (not e!554766))))

(assert (=> b!984100 (= res!658302 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29752 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15463 (ValueCell!10961 V!35497) V!35497)

(declare-fun dynLambda!1836 (Int (_ BitVec 64)) V!35497)

(assert (=> b!984100 (= lt!436820 (get!15463 (select (arr!29751 _values!1278) from!1932) (dynLambda!1836 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35497)

(declare-fun getCurrentListMapNoExtraKeys!3477 (array!61798 array!61796 (_ BitVec 32) (_ BitVec 32) V!35497 V!35497 (_ BitVec 32) Int) ListLongMap!13445)

(assert (=> b!984100 (= lt!436821 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!658306 () Bool)

(assert (=> start!84250 (=> (not res!658306) (not e!554763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84250 (= res!658306 (validMask!0 mask!1948))))

(assert (=> start!84250 e!554763))

(assert (=> start!84250 true))

(assert (=> start!84250 tp_is_empty!22885))

(declare-fun array_inv!23019 (array!61796) Bool)

(assert (=> start!84250 (and (array_inv!23019 _values!1278) e!554765)))

(assert (=> start!84250 tp!69035))

(declare-fun array_inv!23020 (array!61798) Bool)

(assert (=> start!84250 (array_inv!23020 _keys!1544)))

(declare-fun b!984095 () Bool)

(declare-fun res!658301 () Bool)

(assert (=> b!984095 (=> (not res!658301) (not e!554763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984095 (= res!658301 (validKeyInArray!0 (select (arr!29752 _keys!1544) from!1932)))))

(declare-fun b!984101 () Bool)

(assert (=> b!984101 (= e!554761 tp_is_empty!22885)))

(declare-fun b!984102 () Bool)

(declare-fun res!658300 () Bool)

(assert (=> b!984102 (=> (not res!658300) (not e!554763))))

(assert (=> b!984102 (= res!658300 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30232 _keys!1544))))))

(assert (= (and start!84250 res!658306) b!984097))

(assert (= (and b!984097 res!658303) b!984098))

(assert (= (and b!984098 res!658299) b!984099))

(assert (= (and b!984099 res!658304) b!984102))

(assert (= (and b!984102 res!658300) b!984095))

(assert (= (and b!984095 res!658301) b!984096))

(assert (= (and b!984096 res!658305) b!984100))

(assert (= (and b!984100 res!658302) b!984094))

(assert (= (and b!984093 condMapEmpty!36356) mapIsEmpty!36356))

(assert (= (and b!984093 (not condMapEmpty!36356)) mapNonEmpty!36356))

(get-info :version)

(assert (= (and mapNonEmpty!36356 ((_ is ValueCellFull!10961) mapValue!36356)) b!984101))

(assert (= (and b!984093 ((_ is ValueCellFull!10961) mapDefault!36356)) b!984092))

(assert (= start!84250 b!984093))

(declare-fun b_lambda!14889 () Bool)

(assert (=> (not b_lambda!14889) (not b!984100)))

(declare-fun t!29395 () Bool)

(declare-fun tb!6629 () Bool)

(assert (=> (and start!84250 (= defaultEntry!1281 defaultEntry!1281) t!29395) tb!6629))

(declare-fun result!13255 () Bool)

(assert (=> tb!6629 (= result!13255 tp_is_empty!22885)))

(assert (=> b!984100 t!29395))

(declare-fun b_and!31769 () Bool)

(assert (= b_and!31767 (and (=> t!29395 result!13255) b_and!31769)))

(declare-fun m!911801 () Bool)

(assert (=> b!984098 m!911801))

(declare-fun m!911803 () Bool)

(assert (=> start!84250 m!911803))

(declare-fun m!911805 () Bool)

(assert (=> start!84250 m!911805))

(declare-fun m!911807 () Bool)

(assert (=> start!84250 m!911807))

(declare-fun m!911809 () Bool)

(assert (=> b!984095 m!911809))

(assert (=> b!984095 m!911809))

(declare-fun m!911811 () Bool)

(assert (=> b!984095 m!911811))

(declare-fun m!911813 () Bool)

(assert (=> mapNonEmpty!36356 m!911813))

(assert (=> b!984100 m!911809))

(declare-fun m!911815 () Bool)

(assert (=> b!984100 m!911815))

(declare-fun m!911817 () Bool)

(assert (=> b!984100 m!911817))

(declare-fun m!911819 () Bool)

(assert (=> b!984100 m!911819))

(assert (=> b!984100 m!911815))

(assert (=> b!984100 m!911819))

(declare-fun m!911821 () Bool)

(assert (=> b!984100 m!911821))

(declare-fun m!911823 () Bool)

(assert (=> b!984094 m!911823))

(declare-fun m!911825 () Bool)

(assert (=> b!984094 m!911825))

(assert (=> b!984094 m!911823))

(declare-fun m!911827 () Bool)

(assert (=> b!984094 m!911827))

(assert (=> b!984094 m!911809))

(declare-fun m!911829 () Bool)

(assert (=> b!984094 m!911829))

(assert (=> b!984094 m!911809))

(assert (=> b!984094 m!911827))

(declare-fun m!911831 () Bool)

(assert (=> b!984094 m!911831))

(declare-fun m!911833 () Bool)

(assert (=> b!984099 m!911833))

(check-sat (not b!984095) (not b!984098) (not mapNonEmpty!36356) (not b_next!19837) (not start!84250) b_and!31769 tp_is_empty!22885 (not b!984094) (not b!984100) (not b_lambda!14889) (not b!984099))
(check-sat b_and!31769 (not b_next!19837))
