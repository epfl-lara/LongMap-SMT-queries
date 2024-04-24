; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83998 () Bool)

(assert start!83998)

(declare-fun b_free!19639 () Bool)

(declare-fun b_next!19639 () Bool)

(assert (=> start!83998 (= b_free!19639 (not b_next!19639))))

(declare-fun tp!68360 () Bool)

(declare-fun b_and!31377 () Bool)

(assert (=> start!83998 (= tp!68360 b_and!31377)))

(declare-fun mapNonEmpty!35978 () Bool)

(declare-fun mapRes!35978 () Bool)

(declare-fun tp!68359 () Bool)

(declare-fun e!552588 () Bool)

(assert (=> mapNonEmpty!35978 (= mapRes!35978 (and tp!68359 e!552588))))

(declare-datatypes ((V!35161 0))(
  ( (V!35162 (val!11367 Int)) )
))
(declare-datatypes ((ValueCell!10835 0))(
  ( (ValueCellFull!10835 (v!13926 V!35161)) (EmptyCell!10835) )
))
(declare-datatypes ((array!61312 0))(
  ( (array!61313 (arr!29509 (Array (_ BitVec 32) ValueCell!10835)) (size!29989 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61312)

(declare-fun mapKey!35978 () (_ BitVec 32))

(declare-fun mapRest!35978 () (Array (_ BitVec 32) ValueCell!10835))

(declare-fun mapValue!35978 () ValueCell!10835)

(assert (=> mapNonEmpty!35978 (= (arr!29509 _values!1278) (store mapRest!35978 mapKey!35978 mapValue!35978))))

(declare-fun b!980130 () Bool)

(declare-fun res!655662 () Bool)

(declare-fun e!552587 () Bool)

(assert (=> b!980130 (=> (not res!655662) (not e!552587))))

(declare-datatypes ((array!61314 0))(
  ( (array!61315 (arr!29510 (Array (_ BitVec 32) (_ BitVec 64))) (size!29990 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61314)

(declare-datatypes ((List!20447 0))(
  ( (Nil!20444) (Cons!20443 (h!21611 (_ BitVec 64)) (t!29034 List!20447)) )
))
(declare-fun arrayNoDuplicates!0 (array!61314 (_ BitVec 32) List!20447) Bool)

(assert (=> b!980130 (= res!655662 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20444))))

(declare-fun b!980131 () Bool)

(declare-fun res!655669 () Bool)

(assert (=> b!980131 (=> (not res!655669) (not e!552587))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980131 (= res!655669 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29990 _keys!1544))))))

(declare-fun b!980132 () Bool)

(declare-fun tp_is_empty!22633 () Bool)

(assert (=> b!980132 (= e!552588 tp_is_empty!22633)))

(declare-fun b!980133 () Bool)

(declare-fun res!655666 () Bool)

(assert (=> b!980133 (=> (not res!655666) (not e!552587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980133 (= res!655666 (validKeyInArray!0 (select (arr!29510 _keys!1544) from!1932)))))

(declare-fun b!980134 () Bool)

(declare-fun res!655667 () Bool)

(assert (=> b!980134 (=> (not res!655667) (not e!552587))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980134 (= res!655667 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35978 () Bool)

(assert (=> mapIsEmpty!35978 mapRes!35978))

(declare-fun b!980135 () Bool)

(declare-fun res!655663 () Bool)

(assert (=> b!980135 (=> (not res!655663) (not e!552587))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61314 (_ BitVec 32)) Bool)

(assert (=> b!980135 (= res!655663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980136 () Bool)

(declare-fun e!552585 () Bool)

(assert (=> b!980136 (= e!552585 true)))

(declare-datatypes ((tuple2!14588 0))(
  ( (tuple2!14589 (_1!7305 (_ BitVec 64)) (_2!7305 V!35161)) )
))
(declare-fun lt!434633 () tuple2!14588)

(declare-fun lt!434635 () tuple2!14588)

(declare-datatypes ((List!20448 0))(
  ( (Nil!20445) (Cons!20444 (h!21612 tuple2!14588) (t!29035 List!20448)) )
))
(declare-datatypes ((ListLongMap!13287 0))(
  ( (ListLongMap!13288 (toList!6659 List!20448)) )
))
(declare-fun lt!434640 () ListLongMap!13287)

(declare-fun lt!434638 () ListLongMap!13287)

(declare-fun +!2974 (ListLongMap!13287 tuple2!14588) ListLongMap!13287)

(assert (=> b!980136 (= lt!434638 (+!2974 (+!2974 lt!434640 lt!434635) lt!434633))))

(declare-datatypes ((Unit!32528 0))(
  ( (Unit!32529) )
))
(declare-fun lt!434634 () Unit!32528)

(declare-fun lt!434637 () V!35161)

(declare-fun zeroValue!1220 () V!35161)

(declare-fun addCommutativeForDiffKeys!581 (ListLongMap!13287 (_ BitVec 64) V!35161 (_ BitVec 64) V!35161) Unit!32528)

(assert (=> b!980136 (= lt!434634 (addCommutativeForDiffKeys!581 lt!434640 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29510 _keys!1544) from!1932) lt!434637))))

(declare-fun b!980137 () Bool)

(declare-fun e!552583 () Bool)

(assert (=> b!980137 (= e!552583 tp_is_empty!22633)))

(declare-fun b!980138 () Bool)

(declare-fun e!552584 () Bool)

(assert (=> b!980138 (= e!552584 (and e!552583 mapRes!35978))))

(declare-fun condMapEmpty!35978 () Bool)

(declare-fun mapDefault!35978 () ValueCell!10835)

(assert (=> b!980138 (= condMapEmpty!35978 (= (arr!29509 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10835)) mapDefault!35978)))))

(declare-fun b!980139 () Bool)

(assert (=> b!980139 (= e!552587 (not e!552585))))

(declare-fun res!655668 () Bool)

(assert (=> b!980139 (=> res!655668 e!552585)))

(assert (=> b!980139 (= res!655668 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29510 _keys!1544) from!1932)))))

(declare-fun lt!434636 () ListLongMap!13287)

(declare-fun lt!434631 () tuple2!14588)

(assert (=> b!980139 (= (+!2974 lt!434636 lt!434635) (+!2974 lt!434638 lt!434631))))

(declare-fun lt!434639 () ListLongMap!13287)

(assert (=> b!980139 (= lt!434638 (+!2974 lt!434639 lt!434635))))

(assert (=> b!980139 (= lt!434635 (tuple2!14589 (select (arr!29510 _keys!1544) from!1932) lt!434637))))

(assert (=> b!980139 (= lt!434636 (+!2974 lt!434639 lt!434631))))

(declare-fun minValue!1220 () V!35161)

(assert (=> b!980139 (= lt!434631 (tuple2!14589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434632 () Unit!32528)

(assert (=> b!980139 (= lt!434632 (addCommutativeForDiffKeys!581 lt!434639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29510 _keys!1544) from!1932) lt!434637))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15312 (ValueCell!10835 V!35161) V!35161)

(declare-fun dynLambda!1769 (Int (_ BitVec 64)) V!35161)

(assert (=> b!980139 (= lt!434637 (get!15312 (select (arr!29509 _values!1278) from!1932) (dynLambda!1769 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980139 (= lt!434639 (+!2974 lt!434640 lt!434633))))

(assert (=> b!980139 (= lt!434633 (tuple2!14589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3407 (array!61314 array!61312 (_ BitVec 32) (_ BitVec 32) V!35161 V!35161 (_ BitVec 32) Int) ListLongMap!13287)

(assert (=> b!980139 (= lt!434640 (getCurrentListMapNoExtraKeys!3407 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980129 () Bool)

(declare-fun res!655664 () Bool)

(assert (=> b!980129 (=> (not res!655664) (not e!552587))))

(assert (=> b!980129 (= res!655664 (and (= (size!29989 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29990 _keys!1544) (size!29989 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!655665 () Bool)

(assert (=> start!83998 (=> (not res!655665) (not e!552587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83998 (= res!655665 (validMask!0 mask!1948))))

(assert (=> start!83998 e!552587))

(assert (=> start!83998 true))

(assert (=> start!83998 tp_is_empty!22633))

(declare-fun array_inv!22851 (array!61312) Bool)

(assert (=> start!83998 (and (array_inv!22851 _values!1278) e!552584)))

(assert (=> start!83998 tp!68360))

(declare-fun array_inv!22852 (array!61314) Bool)

(assert (=> start!83998 (array_inv!22852 _keys!1544)))

(assert (= (and start!83998 res!655665) b!980129))

(assert (= (and b!980129 res!655664) b!980135))

(assert (= (and b!980135 res!655663) b!980130))

(assert (= (and b!980130 res!655662) b!980131))

(assert (= (and b!980131 res!655669) b!980133))

(assert (= (and b!980133 res!655666) b!980134))

(assert (= (and b!980134 res!655667) b!980139))

(assert (= (and b!980139 (not res!655668)) b!980136))

(assert (= (and b!980138 condMapEmpty!35978) mapIsEmpty!35978))

(assert (= (and b!980138 (not condMapEmpty!35978)) mapNonEmpty!35978))

(get-info :version)

(assert (= (and mapNonEmpty!35978 ((_ is ValueCellFull!10835) mapValue!35978)) b!980132))

(assert (= (and b!980138 ((_ is ValueCellFull!10835) mapDefault!35978)) b!980137))

(assert (= start!83998 b!980138))

(declare-fun b_lambda!14697 () Bool)

(assert (=> (not b_lambda!14697) (not b!980139)))

(declare-fun t!29033 () Bool)

(declare-fun tb!6437 () Bool)

(assert (=> (and start!83998 (= defaultEntry!1281 defaultEntry!1281) t!29033) tb!6437))

(declare-fun result!12871 () Bool)

(assert (=> tb!6437 (= result!12871 tp_is_empty!22633)))

(assert (=> b!980139 t!29033))

(declare-fun b_and!31379 () Bool)

(assert (= b_and!31377 (and (=> t!29033 result!12871) b_and!31379)))

(declare-fun m!907787 () Bool)

(assert (=> mapNonEmpty!35978 m!907787))

(declare-fun m!907789 () Bool)

(assert (=> b!980136 m!907789))

(assert (=> b!980136 m!907789))

(declare-fun m!907791 () Bool)

(assert (=> b!980136 m!907791))

(declare-fun m!907793 () Bool)

(assert (=> b!980136 m!907793))

(assert (=> b!980136 m!907793))

(declare-fun m!907795 () Bool)

(assert (=> b!980136 m!907795))

(declare-fun m!907797 () Bool)

(assert (=> b!980135 m!907797))

(declare-fun m!907799 () Bool)

(assert (=> b!980139 m!907799))

(assert (=> b!980139 m!907793))

(declare-fun m!907801 () Bool)

(assert (=> b!980139 m!907801))

(declare-fun m!907803 () Bool)

(assert (=> b!980139 m!907803))

(assert (=> b!980139 m!907793))

(declare-fun m!907805 () Bool)

(assert (=> b!980139 m!907805))

(declare-fun m!907807 () Bool)

(assert (=> b!980139 m!907807))

(declare-fun m!907809 () Bool)

(assert (=> b!980139 m!907809))

(declare-fun m!907811 () Bool)

(assert (=> b!980139 m!907811))

(declare-fun m!907813 () Bool)

(assert (=> b!980139 m!907813))

(declare-fun m!907815 () Bool)

(assert (=> b!980139 m!907815))

(assert (=> b!980139 m!907801))

(assert (=> b!980139 m!907815))

(declare-fun m!907817 () Bool)

(assert (=> b!980139 m!907817))

(declare-fun m!907819 () Bool)

(assert (=> start!83998 m!907819))

(declare-fun m!907821 () Bool)

(assert (=> start!83998 m!907821))

(declare-fun m!907823 () Bool)

(assert (=> start!83998 m!907823))

(assert (=> b!980133 m!907793))

(assert (=> b!980133 m!907793))

(declare-fun m!907825 () Bool)

(assert (=> b!980133 m!907825))

(declare-fun m!907827 () Bool)

(assert (=> b!980130 m!907827))

(check-sat (not mapNonEmpty!35978) (not b!980139) b_and!31379 tp_is_empty!22633 (not start!83998) (not b!980130) (not b!980133) (not b!980136) (not b!980135) (not b_lambda!14697) (not b_next!19639))
(check-sat b_and!31379 (not b_next!19639))
