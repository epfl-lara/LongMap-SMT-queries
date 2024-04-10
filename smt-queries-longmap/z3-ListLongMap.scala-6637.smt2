; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83796 () Bool)

(assert start!83796)

(declare-fun b_free!19605 () Bool)

(declare-fun b_next!19605 () Bool)

(assert (=> start!83796 (= b_free!19605 (not b_next!19605))))

(declare-fun tp!68257 () Bool)

(declare-fun b_and!31299 () Bool)

(assert (=> start!83796 (= tp!68257 b_and!31299)))

(declare-fun mapIsEmpty!35927 () Bool)

(declare-fun mapRes!35927 () Bool)

(assert (=> mapIsEmpty!35927 mapRes!35927))

(declare-fun b!978653 () Bool)

(declare-fun e!551717 () Bool)

(declare-fun e!551720 () Bool)

(assert (=> b!978653 (= e!551717 (and e!551720 mapRes!35927))))

(declare-fun condMapEmpty!35927 () Bool)

(declare-datatypes ((V!35115 0))(
  ( (V!35116 (val!11350 Int)) )
))
(declare-datatypes ((ValueCell!10818 0))(
  ( (ValueCellFull!10818 (v!13912 V!35115)) (EmptyCell!10818) )
))
(declare-datatypes ((array!61223 0))(
  ( (array!61224 (arr!29469 (Array (_ BitVec 32) ValueCell!10818)) (size!29948 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61223)

(declare-fun mapDefault!35927 () ValueCell!10818)

(assert (=> b!978653 (= condMapEmpty!35927 (= (arr!29469 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10818)) mapDefault!35927)))))

(declare-fun b!978654 () Bool)

(declare-fun res!654933 () Bool)

(declare-fun e!551721 () Bool)

(assert (=> b!978654 (=> (not res!654933) (not e!551721))))

(declare-datatypes ((array!61225 0))(
  ( (array!61226 (arr!29470 (Array (_ BitVec 32) (_ BitVec 64))) (size!29949 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61225)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61225 (_ BitVec 32)) Bool)

(assert (=> b!978654 (= res!654933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!654937 () Bool)

(assert (=> start!83796 (=> (not res!654937) (not e!551721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83796 (= res!654937 (validMask!0 mask!1948))))

(assert (=> start!83796 e!551721))

(assert (=> start!83796 true))

(declare-fun tp_is_empty!22599 () Bool)

(assert (=> start!83796 tp_is_empty!22599))

(declare-fun array_inv!22781 (array!61223) Bool)

(assert (=> start!83796 (and (array_inv!22781 _values!1278) e!551717)))

(assert (=> start!83796 tp!68257))

(declare-fun array_inv!22782 (array!61225) Bool)

(assert (=> start!83796 (array_inv!22782 _keys!1544)))

(declare-fun b!978655 () Bool)

(declare-fun res!654938 () Bool)

(assert (=> b!978655 (=> (not res!654938) (not e!551721))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978655 (= res!654938 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978656 () Bool)

(declare-fun res!654935 () Bool)

(assert (=> b!978656 (=> (not res!654935) (not e!551721))))

(assert (=> b!978656 (= res!654935 (and (= (size!29948 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29949 _keys!1544) (size!29948 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978657 () Bool)

(assert (=> b!978657 (= e!551720 tp_is_empty!22599)))

(declare-fun b!978658 () Bool)

(assert (=> b!978658 (= e!551721 (not true))))

(declare-datatypes ((tuple2!14556 0))(
  ( (tuple2!14557 (_1!7289 (_ BitVec 64)) (_2!7289 V!35115)) )
))
(declare-datatypes ((List!20427 0))(
  ( (Nil!20424) (Cons!20423 (h!21585 tuple2!14556) (t!28988 List!20427)) )
))
(declare-datatypes ((ListLongMap!13253 0))(
  ( (ListLongMap!13254 (toList!6642 List!20427)) )
))
(declare-fun lt!433871 () ListLongMap!13253)

(declare-fun lt!433872 () tuple2!14556)

(declare-fun lt!433873 () tuple2!14556)

(declare-fun +!2947 (ListLongMap!13253 tuple2!14556) ListLongMap!13253)

(assert (=> b!978658 (= (+!2947 (+!2947 lt!433871 lt!433872) lt!433873) (+!2947 (+!2947 lt!433871 lt!433873) lt!433872))))

(declare-fun lt!433870 () V!35115)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978658 (= lt!433873 (tuple2!14557 (select (arr!29470 _keys!1544) from!1932) lt!433870))))

(declare-fun minValue!1220 () V!35115)

(assert (=> b!978658 (= lt!433872 (tuple2!14557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32533 0))(
  ( (Unit!32534) )
))
(declare-fun lt!433874 () Unit!32533)

(declare-fun addCommutativeForDiffKeys!575 (ListLongMap!13253 (_ BitVec 64) V!35115 (_ BitVec 64) V!35115) Unit!32533)

(assert (=> b!978658 (= lt!433874 (addCommutativeForDiffKeys!575 lt!433871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29470 _keys!1544) from!1932) lt!433870))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15262 (ValueCell!10818 V!35115) V!35115)

(declare-fun dynLambda!1735 (Int (_ BitVec 64)) V!35115)

(assert (=> b!978658 (= lt!433870 (get!15262 (select (arr!29469 _values!1278) from!1932) (dynLambda!1735 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35115)

(declare-fun getCurrentListMapNoExtraKeys!3349 (array!61225 array!61223 (_ BitVec 32) (_ BitVec 32) V!35115 V!35115 (_ BitVec 32) Int) ListLongMap!13253)

(assert (=> b!978658 (= lt!433871 (+!2947 (getCurrentListMapNoExtraKeys!3349 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapNonEmpty!35927 () Bool)

(declare-fun tp!68256 () Bool)

(declare-fun e!551718 () Bool)

(assert (=> mapNonEmpty!35927 (= mapRes!35927 (and tp!68256 e!551718))))

(declare-fun mapKey!35927 () (_ BitVec 32))

(declare-fun mapRest!35927 () (Array (_ BitVec 32) ValueCell!10818))

(declare-fun mapValue!35927 () ValueCell!10818)

(assert (=> mapNonEmpty!35927 (= (arr!29469 _values!1278) (store mapRest!35927 mapKey!35927 mapValue!35927))))

(declare-fun b!978659 () Bool)

(declare-fun res!654932 () Bool)

(assert (=> b!978659 (=> (not res!654932) (not e!551721))))

(assert (=> b!978659 (= res!654932 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29949 _keys!1544))))))

(declare-fun b!978660 () Bool)

(declare-fun res!654936 () Bool)

(assert (=> b!978660 (=> (not res!654936) (not e!551721))))

(declare-datatypes ((List!20428 0))(
  ( (Nil!20425) (Cons!20424 (h!21586 (_ BitVec 64)) (t!28989 List!20428)) )
))
(declare-fun arrayNoDuplicates!0 (array!61225 (_ BitVec 32) List!20428) Bool)

(assert (=> b!978660 (= res!654936 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20425))))

(declare-fun b!978661 () Bool)

(assert (=> b!978661 (= e!551718 tp_is_empty!22599)))

(declare-fun b!978662 () Bool)

(declare-fun res!654934 () Bool)

(assert (=> b!978662 (=> (not res!654934) (not e!551721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978662 (= res!654934 (validKeyInArray!0 (select (arr!29470 _keys!1544) from!1932)))))

(assert (= (and start!83796 res!654937) b!978656))

(assert (= (and b!978656 res!654935) b!978654))

(assert (= (and b!978654 res!654933) b!978660))

(assert (= (and b!978660 res!654936) b!978659))

(assert (= (and b!978659 res!654932) b!978662))

(assert (= (and b!978662 res!654934) b!978655))

(assert (= (and b!978655 res!654938) b!978658))

(assert (= (and b!978653 condMapEmpty!35927) mapIsEmpty!35927))

(assert (= (and b!978653 (not condMapEmpty!35927)) mapNonEmpty!35927))

(get-info :version)

(assert (= (and mapNonEmpty!35927 ((_ is ValueCellFull!10818) mapValue!35927)) b!978661))

(assert (= (and b!978653 ((_ is ValueCellFull!10818) mapDefault!35927)) b!978657))

(assert (= start!83796 b!978653))

(declare-fun b_lambda!14649 () Bool)

(assert (=> (not b_lambda!14649) (not b!978658)))

(declare-fun t!28987 () Bool)

(declare-fun tb!6411 () Bool)

(assert (=> (and start!83796 (= defaultEntry!1281 defaultEntry!1281) t!28987) tb!6411))

(declare-fun result!12811 () Bool)

(assert (=> tb!6411 (= result!12811 tp_is_empty!22599)))

(assert (=> b!978658 t!28987))

(declare-fun b_and!31301 () Bool)

(assert (= b_and!31299 (and (=> t!28987 result!12811) b_and!31301)))

(declare-fun m!905827 () Bool)

(assert (=> b!978654 m!905827))

(declare-fun m!905829 () Bool)

(assert (=> b!978660 m!905829))

(declare-fun m!905831 () Bool)

(assert (=> start!83796 m!905831))

(declare-fun m!905833 () Bool)

(assert (=> start!83796 m!905833))

(declare-fun m!905835 () Bool)

(assert (=> start!83796 m!905835))

(declare-fun m!905837 () Bool)

(assert (=> b!978658 m!905837))

(declare-fun m!905839 () Bool)

(assert (=> b!978658 m!905839))

(assert (=> b!978658 m!905837))

(declare-fun m!905841 () Bool)

(assert (=> b!978658 m!905841))

(declare-fun m!905843 () Bool)

(assert (=> b!978658 m!905843))

(declare-fun m!905845 () Bool)

(assert (=> b!978658 m!905845))

(assert (=> b!978658 m!905843))

(declare-fun m!905847 () Bool)

(assert (=> b!978658 m!905847))

(declare-fun m!905849 () Bool)

(assert (=> b!978658 m!905849))

(declare-fun m!905851 () Bool)

(assert (=> b!978658 m!905851))

(declare-fun m!905853 () Bool)

(assert (=> b!978658 m!905853))

(assert (=> b!978658 m!905851))

(assert (=> b!978658 m!905847))

(declare-fun m!905855 () Bool)

(assert (=> b!978658 m!905855))

(assert (=> b!978658 m!905839))

(assert (=> b!978658 m!905855))

(declare-fun m!905857 () Bool)

(assert (=> b!978658 m!905857))

(assert (=> b!978662 m!905837))

(assert (=> b!978662 m!905837))

(declare-fun m!905859 () Bool)

(assert (=> b!978662 m!905859))

(declare-fun m!905861 () Bool)

(assert (=> mapNonEmpty!35927 m!905861))

(check-sat (not b!978660) (not b_next!19605) (not b!978662) (not mapNonEmpty!35927) tp_is_empty!22599 (not b_lambda!14649) (not b!978654) b_and!31301 (not b!978658) (not start!83796))
(check-sat b_and!31301 (not b_next!19605))
