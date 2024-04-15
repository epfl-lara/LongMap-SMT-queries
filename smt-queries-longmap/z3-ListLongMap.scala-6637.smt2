; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83776 () Bool)

(assert start!83776)

(declare-fun b_free!19603 () Bool)

(declare-fun b_next!19603 () Bool)

(assert (=> start!83776 (= b_free!19603 (not b_next!19603))))

(declare-fun tp!68251 () Bool)

(declare-fun b_and!31269 () Bool)

(assert (=> start!83776 (= tp!68251 b_and!31269)))

(declare-fun res!654804 () Bool)

(declare-fun e!551556 () Bool)

(assert (=> start!83776 (=> (not res!654804) (not e!551556))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83776 (= res!654804 (validMask!0 mask!1948))))

(assert (=> start!83776 e!551556))

(assert (=> start!83776 true))

(declare-fun tp_is_empty!22597 () Bool)

(assert (=> start!83776 tp_is_empty!22597))

(declare-datatypes ((V!35113 0))(
  ( (V!35114 (val!11349 Int)) )
))
(declare-datatypes ((ValueCell!10817 0))(
  ( (ValueCellFull!10817 (v!13910 V!35113)) (EmptyCell!10817) )
))
(declare-datatypes ((array!61144 0))(
  ( (array!61145 (arr!29430 (Array (_ BitVec 32) ValueCell!10817)) (size!29911 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61144)

(declare-fun e!551555 () Bool)

(declare-fun array_inv!22791 (array!61144) Bool)

(assert (=> start!83776 (and (array_inv!22791 _values!1278) e!551555)))

(assert (=> start!83776 tp!68251))

(declare-datatypes ((array!61146 0))(
  ( (array!61147 (arr!29431 (Array (_ BitVec 32) (_ BitVec 64))) (size!29912 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61146)

(declare-fun array_inv!22792 (array!61146) Bool)

(assert (=> start!83776 (array_inv!22792 _keys!1544)))

(declare-fun b!978382 () Bool)

(declare-fun res!654805 () Bool)

(assert (=> b!978382 (=> (not res!654805) (not e!551556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61146 (_ BitVec 32)) Bool)

(assert (=> b!978382 (= res!654805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978383 () Bool)

(declare-fun e!551557 () Bool)

(assert (=> b!978383 (= e!551557 tp_is_empty!22597)))

(declare-fun b!978384 () Bool)

(declare-fun res!654807 () Bool)

(assert (=> b!978384 (=> (not res!654807) (not e!551556))))

(declare-datatypes ((List!20443 0))(
  ( (Nil!20440) (Cons!20439 (h!21601 (_ BitVec 64)) (t!28993 List!20443)) )
))
(declare-fun arrayNoDuplicates!0 (array!61146 (_ BitVec 32) List!20443) Bool)

(assert (=> b!978384 (= res!654807 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20440))))

(declare-fun mapNonEmpty!35924 () Bool)

(declare-fun mapRes!35924 () Bool)

(declare-fun tp!68252 () Bool)

(assert (=> mapNonEmpty!35924 (= mapRes!35924 (and tp!68252 e!551557))))

(declare-fun mapRest!35924 () (Array (_ BitVec 32) ValueCell!10817))

(declare-fun mapKey!35924 () (_ BitVec 32))

(declare-fun mapValue!35924 () ValueCell!10817)

(assert (=> mapNonEmpty!35924 (= (arr!29430 _values!1278) (store mapRest!35924 mapKey!35924 mapValue!35924))))

(declare-fun b!978385 () Bool)

(declare-fun res!654803 () Bool)

(assert (=> b!978385 (=> (not res!654803) (not e!551556))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978385 (= res!654803 (and (= (size!29911 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29912 _keys!1544) (size!29911 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978386 () Bool)

(declare-fun res!654802 () Bool)

(assert (=> b!978386 (=> (not res!654802) (not e!551556))))

(assert (=> b!978386 (= res!654802 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978387 () Bool)

(declare-fun e!551554 () Bool)

(assert (=> b!978387 (= e!551555 (and e!551554 mapRes!35924))))

(declare-fun condMapEmpty!35924 () Bool)

(declare-fun mapDefault!35924 () ValueCell!10817)

(assert (=> b!978387 (= condMapEmpty!35924 (= (arr!29430 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10817)) mapDefault!35924)))))

(declare-fun b!978388 () Bool)

(assert (=> b!978388 (= e!551554 tp_is_empty!22597)))

(declare-fun mapIsEmpty!35924 () Bool)

(assert (=> mapIsEmpty!35924 mapRes!35924))

(declare-fun b!978389 () Bool)

(declare-fun res!654801 () Bool)

(assert (=> b!978389 (=> (not res!654801) (not e!551556))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978389 (= res!654801 (validKeyInArray!0 (select (arr!29431 _keys!1544) from!1932)))))

(declare-fun b!978390 () Bool)

(declare-fun res!654806 () Bool)

(assert (=> b!978390 (=> (not res!654806) (not e!551556))))

(assert (=> b!978390 (= res!654806 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29912 _keys!1544))))))

(declare-fun b!978391 () Bool)

(assert (=> b!978391 (= e!551556 (not true))))

(declare-datatypes ((tuple2!14616 0))(
  ( (tuple2!14617 (_1!7319 (_ BitVec 64)) (_2!7319 V!35113)) )
))
(declare-datatypes ((List!20444 0))(
  ( (Nil!20441) (Cons!20440 (h!21602 tuple2!14616) (t!28994 List!20444)) )
))
(declare-datatypes ((ListLongMap!13303 0))(
  ( (ListLongMap!13304 (toList!6667 List!20444)) )
))
(declare-fun lt!433619 () ListLongMap!13303)

(declare-fun lt!433620 () tuple2!14616)

(declare-fun lt!433622 () tuple2!14616)

(declare-fun +!2967 (ListLongMap!13303 tuple2!14616) ListLongMap!13303)

(assert (=> b!978391 (= (+!2967 (+!2967 lt!433619 lt!433620) lt!433622) (+!2967 (+!2967 lt!433619 lt!433622) lt!433620))))

(declare-fun lt!433623 () V!35113)

(assert (=> b!978391 (= lt!433622 (tuple2!14617 (select (arr!29431 _keys!1544) from!1932) lt!433623))))

(declare-fun minValue!1220 () V!35113)

(assert (=> b!978391 (= lt!433620 (tuple2!14617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32400 0))(
  ( (Unit!32401) )
))
(declare-fun lt!433621 () Unit!32400)

(declare-fun addCommutativeForDiffKeys!571 (ListLongMap!13303 (_ BitVec 64) V!35113 (_ BitVec 64) V!35113) Unit!32400)

(assert (=> b!978391 (= lt!433621 (addCommutativeForDiffKeys!571 lt!433619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29431 _keys!1544) from!1932) lt!433623))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15252 (ValueCell!10817 V!35113) V!35113)

(declare-fun dynLambda!1720 (Int (_ BitVec 64)) V!35113)

(assert (=> b!978391 (= lt!433623 (get!15252 (select (arr!29430 _values!1278) from!1932) (dynLambda!1720 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35113)

(declare-fun getCurrentListMapNoExtraKeys!3387 (array!61146 array!61144 (_ BitVec 32) (_ BitVec 32) V!35113 V!35113 (_ BitVec 32) Int) ListLongMap!13303)

(assert (=> b!978391 (= lt!433619 (+!2967 (getCurrentListMapNoExtraKeys!3387 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and start!83776 res!654804) b!978385))

(assert (= (and b!978385 res!654803) b!978382))

(assert (= (and b!978382 res!654805) b!978384))

(assert (= (and b!978384 res!654807) b!978390))

(assert (= (and b!978390 res!654806) b!978389))

(assert (= (and b!978389 res!654801) b!978386))

(assert (= (and b!978386 res!654802) b!978391))

(assert (= (and b!978387 condMapEmpty!35924) mapIsEmpty!35924))

(assert (= (and b!978387 (not condMapEmpty!35924)) mapNonEmpty!35924))

(get-info :version)

(assert (= (and mapNonEmpty!35924 ((_ is ValueCellFull!10817) mapValue!35924)) b!978383))

(assert (= (and b!978387 ((_ is ValueCellFull!10817) mapDefault!35924)) b!978388))

(assert (= start!83776 b!978387))

(declare-fun b_lambda!14629 () Bool)

(assert (=> (not b_lambda!14629) (not b!978391)))

(declare-fun t!28992 () Bool)

(declare-fun tb!6401 () Bool)

(assert (=> (and start!83776 (= defaultEntry!1281 defaultEntry!1281) t!28992) tb!6401))

(declare-fun result!12799 () Bool)

(assert (=> tb!6401 (= result!12799 tp_is_empty!22597)))

(assert (=> b!978391 t!28992))

(declare-fun b_and!31271 () Bool)

(assert (= b_and!31269 (and (=> t!28992 result!12799) b_and!31271)))

(declare-fun m!905033 () Bool)

(assert (=> b!978384 m!905033))

(declare-fun m!905035 () Bool)

(assert (=> b!978382 m!905035))

(declare-fun m!905037 () Bool)

(assert (=> start!83776 m!905037))

(declare-fun m!905039 () Bool)

(assert (=> start!83776 m!905039))

(declare-fun m!905041 () Bool)

(assert (=> start!83776 m!905041))

(declare-fun m!905043 () Bool)

(assert (=> b!978389 m!905043))

(assert (=> b!978389 m!905043))

(declare-fun m!905045 () Bool)

(assert (=> b!978389 m!905045))

(declare-fun m!905047 () Bool)

(assert (=> b!978391 m!905047))

(declare-fun m!905049 () Bool)

(assert (=> b!978391 m!905049))

(declare-fun m!905051 () Bool)

(assert (=> b!978391 m!905051))

(assert (=> b!978391 m!905047))

(declare-fun m!905053 () Bool)

(assert (=> b!978391 m!905053))

(assert (=> b!978391 m!905051))

(declare-fun m!905055 () Bool)

(assert (=> b!978391 m!905055))

(assert (=> b!978391 m!905043))

(declare-fun m!905057 () Bool)

(assert (=> b!978391 m!905057))

(declare-fun m!905059 () Bool)

(assert (=> b!978391 m!905059))

(assert (=> b!978391 m!905057))

(assert (=> b!978391 m!905043))

(declare-fun m!905061 () Bool)

(assert (=> b!978391 m!905061))

(declare-fun m!905063 () Bool)

(assert (=> b!978391 m!905063))

(assert (=> b!978391 m!905049))

(assert (=> b!978391 m!905063))

(declare-fun m!905065 () Bool)

(assert (=> b!978391 m!905065))

(declare-fun m!905067 () Bool)

(assert (=> mapNonEmpty!35924 m!905067))

(check-sat (not b_lambda!14629) tp_is_empty!22597 b_and!31271 (not b!978391) (not b_next!19603) (not b!978384) (not b!978389) (not b!978382) (not start!83776) (not mapNonEmpty!35924))
(check-sat b_and!31271 (not b_next!19603))
