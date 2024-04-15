; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83758 () Bool)

(assert start!83758)

(declare-fun b_free!19585 () Bool)

(declare-fun b_next!19585 () Bool)

(assert (=> start!83758 (= b_free!19585 (not b_next!19585))))

(declare-fun tp!68197 () Bool)

(declare-fun b_and!31233 () Bool)

(assert (=> start!83758 (= tp!68197 b_and!31233)))

(declare-fun b!978094 () Bool)

(declare-fun res!654616 () Bool)

(declare-fun e!551422 () Bool)

(assert (=> b!978094 (=> (not res!654616) (not e!551422))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35089 0))(
  ( (V!35090 (val!11340 Int)) )
))
(declare-datatypes ((ValueCell!10808 0))(
  ( (ValueCellFull!10808 (v!13901 V!35089)) (EmptyCell!10808) )
))
(declare-datatypes ((array!61110 0))(
  ( (array!61111 (arr!29413 (Array (_ BitVec 32) ValueCell!10808)) (size!29894 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61110)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61112 0))(
  ( (array!61113 (arr!29414 (Array (_ BitVec 32) (_ BitVec 64))) (size!29895 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61112)

(assert (=> b!978094 (= res!654616 (and (= (size!29894 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29895 _keys!1544) (size!29894 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978095 () Bool)

(declare-fun res!654614 () Bool)

(assert (=> b!978095 (=> (not res!654614) (not e!551422))))

(assert (=> b!978095 (= res!654614 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978096 () Bool)

(declare-fun e!551421 () Bool)

(declare-fun tp_is_empty!22579 () Bool)

(assert (=> b!978096 (= e!551421 tp_is_empty!22579)))

(declare-fun mapIsEmpty!35897 () Bool)

(declare-fun mapRes!35897 () Bool)

(assert (=> mapIsEmpty!35897 mapRes!35897))

(declare-fun b!978097 () Bool)

(declare-fun res!654613 () Bool)

(assert (=> b!978097 (=> (not res!654613) (not e!551422))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978097 (= res!654613 (validKeyInArray!0 (select (arr!29414 _keys!1544) from!1932)))))

(declare-fun res!654612 () Bool)

(assert (=> start!83758 (=> (not res!654612) (not e!551422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83758 (= res!654612 (validMask!0 mask!1948))))

(assert (=> start!83758 e!551422))

(assert (=> start!83758 true))

(assert (=> start!83758 tp_is_empty!22579))

(declare-fun e!551419 () Bool)

(declare-fun array_inv!22779 (array!61110) Bool)

(assert (=> start!83758 (and (array_inv!22779 _values!1278) e!551419)))

(assert (=> start!83758 tp!68197))

(declare-fun array_inv!22780 (array!61112) Bool)

(assert (=> start!83758 (array_inv!22780 _keys!1544)))

(declare-fun b!978098 () Bool)

(assert (=> b!978098 (= e!551419 (and e!551421 mapRes!35897))))

(declare-fun condMapEmpty!35897 () Bool)

(declare-fun mapDefault!35897 () ValueCell!10808)

(assert (=> b!978098 (= condMapEmpty!35897 (= (arr!29413 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10808)) mapDefault!35897)))))

(declare-fun b!978099 () Bool)

(declare-fun res!654617 () Bool)

(assert (=> b!978099 (=> (not res!654617) (not e!551422))))

(assert (=> b!978099 (= res!654617 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29895 _keys!1544))))))

(declare-fun mapNonEmpty!35897 () Bool)

(declare-fun tp!68198 () Bool)

(declare-fun e!551420 () Bool)

(assert (=> mapNonEmpty!35897 (= mapRes!35897 (and tp!68198 e!551420))))

(declare-fun mapKey!35897 () (_ BitVec 32))

(declare-fun mapValue!35897 () ValueCell!10808)

(declare-fun mapRest!35897 () (Array (_ BitVec 32) ValueCell!10808))

(assert (=> mapNonEmpty!35897 (= (arr!29413 _values!1278) (store mapRest!35897 mapKey!35897 mapValue!35897))))

(declare-fun b!978100 () Bool)

(declare-fun res!654618 () Bool)

(assert (=> b!978100 (=> (not res!654618) (not e!551422))))

(declare-datatypes ((List!20427 0))(
  ( (Nil!20424) (Cons!20423 (h!21585 (_ BitVec 64)) (t!28959 List!20427)) )
))
(declare-fun arrayNoDuplicates!0 (array!61112 (_ BitVec 32) List!20427) Bool)

(assert (=> b!978100 (= res!654618 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20424))))

(declare-fun b!978101 () Bool)

(declare-fun res!654615 () Bool)

(assert (=> b!978101 (=> (not res!654615) (not e!551422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61112 (_ BitVec 32)) Bool)

(assert (=> b!978101 (= res!654615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978102 () Bool)

(assert (=> b!978102 (= e!551420 tp_is_empty!22579)))

(declare-fun b!978103 () Bool)

(assert (=> b!978103 (= e!551422 (not true))))

(declare-datatypes ((tuple2!14600 0))(
  ( (tuple2!14601 (_1!7311 (_ BitVec 64)) (_2!7311 V!35089)) )
))
(declare-datatypes ((List!20428 0))(
  ( (Nil!20425) (Cons!20424 (h!21586 tuple2!14600) (t!28960 List!20428)) )
))
(declare-datatypes ((ListLongMap!13287 0))(
  ( (ListLongMap!13288 (toList!6659 List!20428)) )
))
(declare-fun lt!433484 () ListLongMap!13287)

(declare-fun lt!433488 () tuple2!14600)

(declare-fun lt!433487 () tuple2!14600)

(declare-fun +!2959 (ListLongMap!13287 tuple2!14600) ListLongMap!13287)

(assert (=> b!978103 (= (+!2959 (+!2959 lt!433484 lt!433488) lt!433487) (+!2959 (+!2959 lt!433484 lt!433487) lt!433488))))

(declare-fun lt!433486 () V!35089)

(assert (=> b!978103 (= lt!433487 (tuple2!14601 (select (arr!29414 _keys!1544) from!1932) lt!433486))))

(declare-fun minValue!1220 () V!35089)

(assert (=> b!978103 (= lt!433488 (tuple2!14601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32384 0))(
  ( (Unit!32385) )
))
(declare-fun lt!433485 () Unit!32384)

(declare-fun addCommutativeForDiffKeys!563 (ListLongMap!13287 (_ BitVec 64) V!35089 (_ BitVec 64) V!35089) Unit!32384)

(assert (=> b!978103 (= lt!433485 (addCommutativeForDiffKeys!563 lt!433484 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29414 _keys!1544) from!1932) lt!433486))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15238 (ValueCell!10808 V!35089) V!35089)

(declare-fun dynLambda!1712 (Int (_ BitVec 64)) V!35089)

(assert (=> b!978103 (= lt!433486 (get!15238 (select (arr!29413 _values!1278) from!1932) (dynLambda!1712 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35089)

(declare-fun getCurrentListMapNoExtraKeys!3379 (array!61112 array!61110 (_ BitVec 32) (_ BitVec 32) V!35089 V!35089 (_ BitVec 32) Int) ListLongMap!13287)

(assert (=> b!978103 (= lt!433484 (+!2959 (getCurrentListMapNoExtraKeys!3379 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and start!83758 res!654612) b!978094))

(assert (= (and b!978094 res!654616) b!978101))

(assert (= (and b!978101 res!654615) b!978100))

(assert (= (and b!978100 res!654618) b!978099))

(assert (= (and b!978099 res!654617) b!978097))

(assert (= (and b!978097 res!654613) b!978095))

(assert (= (and b!978095 res!654614) b!978103))

(assert (= (and b!978098 condMapEmpty!35897) mapIsEmpty!35897))

(assert (= (and b!978098 (not condMapEmpty!35897)) mapNonEmpty!35897))

(get-info :version)

(assert (= (and mapNonEmpty!35897 ((_ is ValueCellFull!10808) mapValue!35897)) b!978102))

(assert (= (and b!978098 ((_ is ValueCellFull!10808) mapDefault!35897)) b!978096))

(assert (= start!83758 b!978098))

(declare-fun b_lambda!14611 () Bool)

(assert (=> (not b_lambda!14611) (not b!978103)))

(declare-fun t!28958 () Bool)

(declare-fun tb!6383 () Bool)

(assert (=> (and start!83758 (= defaultEntry!1281 defaultEntry!1281) t!28958) tb!6383))

(declare-fun result!12763 () Bool)

(assert (=> tb!6383 (= result!12763 tp_is_empty!22579)))

(assert (=> b!978103 t!28958))

(declare-fun b_and!31235 () Bool)

(assert (= b_and!31233 (and (=> t!28958 result!12763) b_and!31235)))

(declare-fun m!904709 () Bool)

(assert (=> start!83758 m!904709))

(declare-fun m!904711 () Bool)

(assert (=> start!83758 m!904711))

(declare-fun m!904713 () Bool)

(assert (=> start!83758 m!904713))

(declare-fun m!904715 () Bool)

(assert (=> b!978103 m!904715))

(declare-fun m!904717 () Bool)

(assert (=> b!978103 m!904717))

(declare-fun m!904719 () Bool)

(assert (=> b!978103 m!904719))

(declare-fun m!904721 () Bool)

(assert (=> b!978103 m!904721))

(assert (=> b!978103 m!904721))

(declare-fun m!904723 () Bool)

(assert (=> b!978103 m!904723))

(declare-fun m!904725 () Bool)

(assert (=> b!978103 m!904725))

(assert (=> b!978103 m!904715))

(declare-fun m!904727 () Bool)

(assert (=> b!978103 m!904727))

(declare-fun m!904729 () Bool)

(assert (=> b!978103 m!904729))

(assert (=> b!978103 m!904725))

(assert (=> b!978103 m!904729))

(declare-fun m!904731 () Bool)

(assert (=> b!978103 m!904731))

(assert (=> b!978103 m!904719))

(declare-fun m!904733 () Bool)

(assert (=> b!978103 m!904733))

(assert (=> b!978103 m!904717))

(declare-fun m!904735 () Bool)

(assert (=> b!978103 m!904735))

(declare-fun m!904737 () Bool)

(assert (=> mapNonEmpty!35897 m!904737))

(declare-fun m!904739 () Bool)

(assert (=> b!978101 m!904739))

(declare-fun m!904741 () Bool)

(assert (=> b!978100 m!904741))

(assert (=> b!978097 m!904721))

(assert (=> b!978097 m!904721))

(declare-fun m!904743 () Bool)

(assert (=> b!978097 m!904743))

(check-sat (not b!978103) b_and!31235 (not b!978100) (not b_lambda!14611) (not start!83758) (not b_next!19585) (not b!978097) (not mapNonEmpty!35897) (not b!978101) tp_is_empty!22579)
(check-sat b_and!31235 (not b_next!19585))
