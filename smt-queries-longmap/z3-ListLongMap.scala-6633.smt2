; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83752 () Bool)

(assert start!83752)

(declare-fun b_free!19579 () Bool)

(declare-fun b_next!19579 () Bool)

(assert (=> start!83752 (= b_free!19579 (not b_next!19579))))

(declare-fun tp!68180 () Bool)

(declare-fun b_and!31221 () Bool)

(assert (=> start!83752 (= tp!68180 b_and!31221)))

(declare-fun b!977998 () Bool)

(declare-fun res!654554 () Bool)

(declare-fun e!551376 () Bool)

(assert (=> b!977998 (=> (not res!654554) (not e!551376))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61100 0))(
  ( (array!61101 (arr!29408 (Array (_ BitVec 32) (_ BitVec 64))) (size!29889 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61100)

(assert (=> b!977998 (= res!654554 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29889 _keys!1544))))))

(declare-fun res!654549 () Bool)

(assert (=> start!83752 (=> (not res!654549) (not e!551376))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83752 (= res!654549 (validMask!0 mask!1948))))

(assert (=> start!83752 e!551376))

(assert (=> start!83752 true))

(declare-fun tp_is_empty!22573 () Bool)

(assert (=> start!83752 tp_is_empty!22573))

(declare-datatypes ((V!35081 0))(
  ( (V!35082 (val!11337 Int)) )
))
(declare-datatypes ((ValueCell!10805 0))(
  ( (ValueCellFull!10805 (v!13898 V!35081)) (EmptyCell!10805) )
))
(declare-datatypes ((array!61102 0))(
  ( (array!61103 (arr!29409 (Array (_ BitVec 32) ValueCell!10805)) (size!29890 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61102)

(declare-fun e!551374 () Bool)

(declare-fun array_inv!22775 (array!61102) Bool)

(assert (=> start!83752 (and (array_inv!22775 _values!1278) e!551374)))

(assert (=> start!83752 tp!68180))

(declare-fun array_inv!22776 (array!61100) Bool)

(assert (=> start!83752 (array_inv!22776 _keys!1544)))

(declare-fun b!977999 () Bool)

(declare-fun res!654555 () Bool)

(assert (=> b!977999 (=> (not res!654555) (not e!551376))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977999 (= res!654555 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35888 () Bool)

(declare-fun mapRes!35888 () Bool)

(declare-fun tp!68179 () Bool)

(declare-fun e!551378 () Bool)

(assert (=> mapNonEmpty!35888 (= mapRes!35888 (and tp!68179 e!551378))))

(declare-fun mapKey!35888 () (_ BitVec 32))

(declare-fun mapValue!35888 () ValueCell!10805)

(declare-fun mapRest!35888 () (Array (_ BitVec 32) ValueCell!10805))

(assert (=> mapNonEmpty!35888 (= (arr!29409 _values!1278) (store mapRest!35888 mapKey!35888 mapValue!35888))))

(declare-fun b!978000 () Bool)

(declare-fun e!551375 () Bool)

(assert (=> b!978000 (= e!551375 tp_is_empty!22573)))

(declare-fun b!978001 () Bool)

(declare-fun res!654551 () Bool)

(assert (=> b!978001 (=> (not res!654551) (not e!551376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61100 (_ BitVec 32)) Bool)

(assert (=> b!978001 (= res!654551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978002 () Bool)

(assert (=> b!978002 (= e!551376 (not true))))

(declare-datatypes ((tuple2!14596 0))(
  ( (tuple2!14597 (_1!7309 (_ BitVec 64)) (_2!7309 V!35081)) )
))
(declare-datatypes ((List!20423 0))(
  ( (Nil!20420) (Cons!20419 (h!21581 tuple2!14596) (t!28949 List!20423)) )
))
(declare-datatypes ((ListLongMap!13283 0))(
  ( (ListLongMap!13284 (toList!6657 List!20423)) )
))
(declare-fun lt!433441 () ListLongMap!13283)

(declare-fun lt!433440 () tuple2!14596)

(declare-fun lt!433439 () tuple2!14596)

(declare-fun +!2957 (ListLongMap!13283 tuple2!14596) ListLongMap!13283)

(assert (=> b!978002 (= (+!2957 (+!2957 lt!433441 lt!433440) lt!433439) (+!2957 (+!2957 lt!433441 lt!433439) lt!433440))))

(declare-fun lt!433442 () V!35081)

(assert (=> b!978002 (= lt!433439 (tuple2!14597 (select (arr!29408 _keys!1544) from!1932) lt!433442))))

(declare-fun minValue!1220 () V!35081)

(assert (=> b!978002 (= lt!433440 (tuple2!14597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32380 0))(
  ( (Unit!32381) )
))
(declare-fun lt!433443 () Unit!32380)

(declare-fun addCommutativeForDiffKeys!561 (ListLongMap!13283 (_ BitVec 64) V!35081 (_ BitVec 64) V!35081) Unit!32380)

(assert (=> b!978002 (= lt!433443 (addCommutativeForDiffKeys!561 lt!433441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29408 _keys!1544) from!1932) lt!433442))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15234 (ValueCell!10805 V!35081) V!35081)

(declare-fun dynLambda!1710 (Int (_ BitVec 64)) V!35081)

(assert (=> b!978002 (= lt!433442 (get!15234 (select (arr!29409 _values!1278) from!1932) (dynLambda!1710 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35081)

(declare-fun getCurrentListMapNoExtraKeys!3377 (array!61100 array!61102 (_ BitVec 32) (_ BitVec 32) V!35081 V!35081 (_ BitVec 32) Int) ListLongMap!13283)

(assert (=> b!978002 (= lt!433441 (+!2957 (getCurrentListMapNoExtraKeys!3377 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!35888 () Bool)

(assert (=> mapIsEmpty!35888 mapRes!35888))

(declare-fun b!978003 () Bool)

(assert (=> b!978003 (= e!551378 tp_is_empty!22573)))

(declare-fun b!978004 () Bool)

(declare-fun res!654550 () Bool)

(assert (=> b!978004 (=> (not res!654550) (not e!551376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978004 (= res!654550 (validKeyInArray!0 (select (arr!29408 _keys!1544) from!1932)))))

(declare-fun b!978005 () Bool)

(assert (=> b!978005 (= e!551374 (and e!551375 mapRes!35888))))

(declare-fun condMapEmpty!35888 () Bool)

(declare-fun mapDefault!35888 () ValueCell!10805)

(assert (=> b!978005 (= condMapEmpty!35888 (= (arr!29409 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10805)) mapDefault!35888)))))

(declare-fun b!978006 () Bool)

(declare-fun res!654552 () Bool)

(assert (=> b!978006 (=> (not res!654552) (not e!551376))))

(assert (=> b!978006 (= res!654552 (and (= (size!29890 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29889 _keys!1544) (size!29890 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978007 () Bool)

(declare-fun res!654553 () Bool)

(assert (=> b!978007 (=> (not res!654553) (not e!551376))))

(declare-datatypes ((List!20424 0))(
  ( (Nil!20421) (Cons!20420 (h!21582 (_ BitVec 64)) (t!28950 List!20424)) )
))
(declare-fun arrayNoDuplicates!0 (array!61100 (_ BitVec 32) List!20424) Bool)

(assert (=> b!978007 (= res!654553 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20421))))

(assert (= (and start!83752 res!654549) b!978006))

(assert (= (and b!978006 res!654552) b!978001))

(assert (= (and b!978001 res!654551) b!978007))

(assert (= (and b!978007 res!654553) b!977998))

(assert (= (and b!977998 res!654554) b!978004))

(assert (= (and b!978004 res!654550) b!977999))

(assert (= (and b!977999 res!654555) b!978002))

(assert (= (and b!978005 condMapEmpty!35888) mapIsEmpty!35888))

(assert (= (and b!978005 (not condMapEmpty!35888)) mapNonEmpty!35888))

(get-info :version)

(assert (= (and mapNonEmpty!35888 ((_ is ValueCellFull!10805) mapValue!35888)) b!978003))

(assert (= (and b!978005 ((_ is ValueCellFull!10805) mapDefault!35888)) b!978000))

(assert (= start!83752 b!978005))

(declare-fun b_lambda!14605 () Bool)

(assert (=> (not b_lambda!14605) (not b!978002)))

(declare-fun t!28948 () Bool)

(declare-fun tb!6377 () Bool)

(assert (=> (and start!83752 (= defaultEntry!1281 defaultEntry!1281) t!28948) tb!6377))

(declare-fun result!12751 () Bool)

(assert (=> tb!6377 (= result!12751 tp_is_empty!22573)))

(assert (=> b!978002 t!28948))

(declare-fun b_and!31223 () Bool)

(assert (= b_and!31221 (and (=> t!28948 result!12751) b_and!31223)))

(declare-fun m!904601 () Bool)

(assert (=> mapNonEmpty!35888 m!904601))

(declare-fun m!904603 () Bool)

(assert (=> b!978007 m!904603))

(declare-fun m!904605 () Bool)

(assert (=> start!83752 m!904605))

(declare-fun m!904607 () Bool)

(assert (=> start!83752 m!904607))

(declare-fun m!904609 () Bool)

(assert (=> start!83752 m!904609))

(declare-fun m!904611 () Bool)

(assert (=> b!978002 m!904611))

(declare-fun m!904613 () Bool)

(assert (=> b!978002 m!904613))

(declare-fun m!904615 () Bool)

(assert (=> b!978002 m!904615))

(declare-fun m!904617 () Bool)

(assert (=> b!978002 m!904617))

(declare-fun m!904619 () Bool)

(assert (=> b!978002 m!904619))

(assert (=> b!978002 m!904619))

(declare-fun m!904621 () Bool)

(assert (=> b!978002 m!904621))

(declare-fun m!904623 () Bool)

(assert (=> b!978002 m!904623))

(assert (=> b!978002 m!904623))

(declare-fun m!904625 () Bool)

(assert (=> b!978002 m!904625))

(assert (=> b!978002 m!904615))

(declare-fun m!904627 () Bool)

(assert (=> b!978002 m!904627))

(assert (=> b!978002 m!904611))

(declare-fun m!904629 () Bool)

(assert (=> b!978002 m!904629))

(assert (=> b!978002 m!904617))

(assert (=> b!978002 m!904629))

(declare-fun m!904631 () Bool)

(assert (=> b!978002 m!904631))

(declare-fun m!904633 () Bool)

(assert (=> b!978001 m!904633))

(assert (=> b!978004 m!904615))

(assert (=> b!978004 m!904615))

(declare-fun m!904635 () Bool)

(assert (=> b!978004 m!904635))

(check-sat tp_is_empty!22573 (not b_lambda!14605) (not b!978004) (not b_next!19579) (not b!978001) b_and!31223 (not mapNonEmpty!35888) (not start!83752) (not b!978007) (not b!978002))
(check-sat b_and!31223 (not b_next!19579))
