; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83790 () Bool)

(assert start!83790)

(declare-fun b_free!19599 () Bool)

(declare-fun b_next!19599 () Bool)

(assert (=> start!83790 (= b_free!19599 (not b_next!19599))))

(declare-fun tp!68238 () Bool)

(declare-fun b_and!31287 () Bool)

(assert (=> start!83790 (= tp!68238 b_and!31287)))

(declare-fun b!978557 () Bool)

(declare-fun res!654872 () Bool)

(declare-fun e!551672 () Bool)

(assert (=> b!978557 (=> (not res!654872) (not e!551672))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978557 (= res!654872 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35918 () Bool)

(declare-fun mapRes!35918 () Bool)

(declare-fun tp!68239 () Bool)

(declare-fun e!551673 () Bool)

(assert (=> mapNonEmpty!35918 (= mapRes!35918 (and tp!68239 e!551673))))

(declare-fun mapKey!35918 () (_ BitVec 32))

(declare-datatypes ((V!35107 0))(
  ( (V!35108 (val!11347 Int)) )
))
(declare-datatypes ((ValueCell!10815 0))(
  ( (ValueCellFull!10815 (v!13909 V!35107)) (EmptyCell!10815) )
))
(declare-datatypes ((array!61211 0))(
  ( (array!61212 (arr!29463 (Array (_ BitVec 32) ValueCell!10815)) (size!29942 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61211)

(declare-fun mapRest!35918 () (Array (_ BitVec 32) ValueCell!10815))

(declare-fun mapValue!35918 () ValueCell!10815)

(assert (=> mapNonEmpty!35918 (= (arr!29463 _values!1278) (store mapRest!35918 mapKey!35918 mapValue!35918))))

(declare-fun mapIsEmpty!35918 () Bool)

(assert (=> mapIsEmpty!35918 mapRes!35918))

(declare-fun b!978558 () Bool)

(declare-fun tp_is_empty!22593 () Bool)

(assert (=> b!978558 (= e!551673 tp_is_empty!22593)))

(declare-fun b!978559 () Bool)

(assert (=> b!978559 (= e!551672 (not true))))

(declare-datatypes ((tuple2!14550 0))(
  ( (tuple2!14551 (_1!7286 (_ BitVec 64)) (_2!7286 V!35107)) )
))
(declare-datatypes ((List!20422 0))(
  ( (Nil!20419) (Cons!20418 (h!21580 tuple2!14550) (t!28977 List!20422)) )
))
(declare-datatypes ((ListLongMap!13247 0))(
  ( (ListLongMap!13248 (toList!6639 List!20422)) )
))
(declare-fun lt!433828 () ListLongMap!13247)

(declare-fun lt!433826 () tuple2!14550)

(declare-fun lt!433827 () tuple2!14550)

(declare-fun +!2944 (ListLongMap!13247 tuple2!14550) ListLongMap!13247)

(assert (=> b!978559 (= (+!2944 (+!2944 lt!433828 lt!433826) lt!433827) (+!2944 (+!2944 lt!433828 lt!433827) lt!433826))))

(declare-fun lt!433829 () V!35107)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61213 0))(
  ( (array!61214 (arr!29464 (Array (_ BitVec 32) (_ BitVec 64))) (size!29943 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61213)

(assert (=> b!978559 (= lt!433827 (tuple2!14551 (select (arr!29464 _keys!1544) from!1932) lt!433829))))

(declare-fun minValue!1220 () V!35107)

(assert (=> b!978559 (= lt!433826 (tuple2!14551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32527 0))(
  ( (Unit!32528) )
))
(declare-fun lt!433825 () Unit!32527)

(declare-fun addCommutativeForDiffKeys!572 (ListLongMap!13247 (_ BitVec 64) V!35107 (_ BitVec 64) V!35107) Unit!32527)

(assert (=> b!978559 (= lt!433825 (addCommutativeForDiffKeys!572 lt!433828 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29464 _keys!1544) from!1932) lt!433829))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15257 (ValueCell!10815 V!35107) V!35107)

(declare-fun dynLambda!1732 (Int (_ BitVec 64)) V!35107)

(assert (=> b!978559 (= lt!433829 (get!15257 (select (arr!29463 _values!1278) from!1932) (dynLambda!1732 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35107)

(declare-fun getCurrentListMapNoExtraKeys!3346 (array!61213 array!61211 (_ BitVec 32) (_ BitVec 32) V!35107 V!35107 (_ BitVec 32) Int) ListLongMap!13247)

(assert (=> b!978559 (= lt!433828 (+!2944 (getCurrentListMapNoExtraKeys!3346 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978560 () Bool)

(declare-fun e!551675 () Bool)

(assert (=> b!978560 (= e!551675 tp_is_empty!22593)))

(declare-fun b!978561 () Bool)

(declare-fun e!551674 () Bool)

(assert (=> b!978561 (= e!551674 (and e!551675 mapRes!35918))))

(declare-fun condMapEmpty!35918 () Bool)

(declare-fun mapDefault!35918 () ValueCell!10815)

(assert (=> b!978561 (= condMapEmpty!35918 (= (arr!29463 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10815)) mapDefault!35918)))))

(declare-fun res!654871 () Bool)

(assert (=> start!83790 (=> (not res!654871) (not e!551672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83790 (= res!654871 (validMask!0 mask!1948))))

(assert (=> start!83790 e!551672))

(assert (=> start!83790 true))

(assert (=> start!83790 tp_is_empty!22593))

(declare-fun array_inv!22777 (array!61211) Bool)

(assert (=> start!83790 (and (array_inv!22777 _values!1278) e!551674)))

(assert (=> start!83790 tp!68238))

(declare-fun array_inv!22778 (array!61213) Bool)

(assert (=> start!83790 (array_inv!22778 _keys!1544)))

(declare-fun b!978562 () Bool)

(declare-fun res!654870 () Bool)

(assert (=> b!978562 (=> (not res!654870) (not e!551672))))

(assert (=> b!978562 (= res!654870 (and (= (size!29942 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29943 _keys!1544) (size!29942 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978563 () Bool)

(declare-fun res!654875 () Bool)

(assert (=> b!978563 (=> (not res!654875) (not e!551672))))

(assert (=> b!978563 (= res!654875 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29943 _keys!1544))))))

(declare-fun b!978564 () Bool)

(declare-fun res!654874 () Bool)

(assert (=> b!978564 (=> (not res!654874) (not e!551672))))

(declare-datatypes ((List!20423 0))(
  ( (Nil!20420) (Cons!20419 (h!21581 (_ BitVec 64)) (t!28978 List!20423)) )
))
(declare-fun arrayNoDuplicates!0 (array!61213 (_ BitVec 32) List!20423) Bool)

(assert (=> b!978564 (= res!654874 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20420))))

(declare-fun b!978565 () Bool)

(declare-fun res!654869 () Bool)

(assert (=> b!978565 (=> (not res!654869) (not e!551672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978565 (= res!654869 (validKeyInArray!0 (select (arr!29464 _keys!1544) from!1932)))))

(declare-fun b!978566 () Bool)

(declare-fun res!654873 () Bool)

(assert (=> b!978566 (=> (not res!654873) (not e!551672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61213 (_ BitVec 32)) Bool)

(assert (=> b!978566 (= res!654873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83790 res!654871) b!978562))

(assert (= (and b!978562 res!654870) b!978566))

(assert (= (and b!978566 res!654873) b!978564))

(assert (= (and b!978564 res!654874) b!978563))

(assert (= (and b!978563 res!654875) b!978565))

(assert (= (and b!978565 res!654869) b!978557))

(assert (= (and b!978557 res!654872) b!978559))

(assert (= (and b!978561 condMapEmpty!35918) mapIsEmpty!35918))

(assert (= (and b!978561 (not condMapEmpty!35918)) mapNonEmpty!35918))

(get-info :version)

(assert (= (and mapNonEmpty!35918 ((_ is ValueCellFull!10815) mapValue!35918)) b!978558))

(assert (= (and b!978561 ((_ is ValueCellFull!10815) mapDefault!35918)) b!978560))

(assert (= start!83790 b!978561))

(declare-fun b_lambda!14643 () Bool)

(assert (=> (not b_lambda!14643) (not b!978559)))

(declare-fun t!28976 () Bool)

(declare-fun tb!6405 () Bool)

(assert (=> (and start!83790 (= defaultEntry!1281 defaultEntry!1281) t!28976) tb!6405))

(declare-fun result!12799 () Bool)

(assert (=> tb!6405 (= result!12799 tp_is_empty!22593)))

(assert (=> b!978559 t!28976))

(declare-fun b_and!31289 () Bool)

(assert (= b_and!31287 (and (=> t!28976 result!12799) b_and!31289)))

(declare-fun m!905719 () Bool)

(assert (=> b!978559 m!905719))

(declare-fun m!905721 () Bool)

(assert (=> b!978559 m!905721))

(declare-fun m!905723 () Bool)

(assert (=> b!978559 m!905723))

(declare-fun m!905725 () Bool)

(assert (=> b!978559 m!905725))

(assert (=> b!978559 m!905721))

(declare-fun m!905727 () Bool)

(assert (=> b!978559 m!905727))

(assert (=> b!978559 m!905719))

(declare-fun m!905729 () Bool)

(assert (=> b!978559 m!905729))

(assert (=> b!978559 m!905725))

(declare-fun m!905731 () Bool)

(assert (=> b!978559 m!905731))

(declare-fun m!905733 () Bool)

(assert (=> b!978559 m!905733))

(assert (=> b!978559 m!905733))

(declare-fun m!905735 () Bool)

(assert (=> b!978559 m!905735))

(declare-fun m!905737 () Bool)

(assert (=> b!978559 m!905737))

(assert (=> b!978559 m!905723))

(assert (=> b!978559 m!905737))

(declare-fun m!905739 () Bool)

(assert (=> b!978559 m!905739))

(declare-fun m!905741 () Bool)

(assert (=> b!978564 m!905741))

(declare-fun m!905743 () Bool)

(assert (=> start!83790 m!905743))

(declare-fun m!905745 () Bool)

(assert (=> start!83790 m!905745))

(declare-fun m!905747 () Bool)

(assert (=> start!83790 m!905747))

(declare-fun m!905749 () Bool)

(assert (=> mapNonEmpty!35918 m!905749))

(assert (=> b!978565 m!905721))

(assert (=> b!978565 m!905721))

(declare-fun m!905751 () Bool)

(assert (=> b!978565 m!905751))

(declare-fun m!905753 () Bool)

(assert (=> b!978566 m!905753))

(check-sat b_and!31289 (not start!83790) (not b_next!19599) (not mapNonEmpty!35918) (not b!978565) (not b!978559) (not b!978566) (not b!978564) (not b_lambda!14643) tp_is_empty!22593)
(check-sat b_and!31289 (not b_next!19599))
