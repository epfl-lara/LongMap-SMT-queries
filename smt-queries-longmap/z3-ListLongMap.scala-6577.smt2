; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83328 () Bool)

(assert start!83328)

(declare-fun b_free!19339 () Bool)

(declare-fun b_next!19339 () Bool)

(assert (=> start!83328 (= b_free!19339 (not b_next!19339))))

(declare-fun tp!67297 () Bool)

(declare-fun b_and!30873 () Bool)

(assert (=> start!83328 (= tp!67297 b_and!30873)))

(declare-fun res!651235 () Bool)

(declare-fun e!548327 () Bool)

(assert (=> start!83328 (=> (not res!651235) (not e!548327))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83328 (= res!651235 (validMask!0 mask!2147))))

(assert (=> start!83328 e!548327))

(assert (=> start!83328 true))

(declare-datatypes ((V!34633 0))(
  ( (V!34634 (val!11169 Int)) )
))
(declare-datatypes ((ValueCell!10637 0))(
  ( (ValueCellFull!10637 (v!13727 V!34633)) (EmptyCell!10637) )
))
(declare-datatypes ((array!60446 0))(
  ( (array!60447 (arr!29087 (Array (_ BitVec 32) ValueCell!10637)) (size!29568 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60446)

(declare-fun e!548324 () Bool)

(declare-fun array_inv!22555 (array!60446) Bool)

(assert (=> start!83328 (and (array_inv!22555 _values!1425) e!548324)))

(declare-fun tp_is_empty!22237 () Bool)

(assert (=> start!83328 tp_is_empty!22237))

(assert (=> start!83328 tp!67297))

(declare-datatypes ((array!60448 0))(
  ( (array!60449 (arr!29088 (Array (_ BitVec 32) (_ BitVec 64))) (size!29569 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60448)

(declare-fun array_inv!22556 (array!60448) Bool)

(assert (=> start!83328 (array_inv!22556 _keys!1717)))

(declare-fun b!972832 () Bool)

(declare-fun e!548328 () Bool)

(assert (=> b!972832 (= e!548328 tp_is_empty!22237)))

(declare-fun b!972833 () Bool)

(declare-fun res!651237 () Bool)

(assert (=> b!972833 (=> (not res!651237) (not e!548327))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972833 (= res!651237 (and (= (size!29568 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29569 _keys!1717) (size!29568 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35365 () Bool)

(declare-fun mapRes!35365 () Bool)

(declare-fun tp!67296 () Bool)

(declare-fun e!548326 () Bool)

(assert (=> mapNonEmpty!35365 (= mapRes!35365 (and tp!67296 e!548326))))

(declare-fun mapRest!35365 () (Array (_ BitVec 32) ValueCell!10637))

(declare-fun mapValue!35365 () ValueCell!10637)

(declare-fun mapKey!35365 () (_ BitVec 32))

(assert (=> mapNonEmpty!35365 (= (arr!29087 _values!1425) (store mapRest!35365 mapKey!35365 mapValue!35365))))

(declare-fun b!972834 () Bool)

(declare-fun e!548325 () Bool)

(declare-fun e!548322 () Bool)

(assert (=> b!972834 (= e!548325 e!548322)))

(declare-fun res!651234 () Bool)

(assert (=> b!972834 (=> (not res!651234) (not e!548322))))

(declare-fun lt!432046 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972834 (= res!651234 (validKeyInArray!0 lt!432046))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972834 (= lt!432046 (select (arr!29088 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34633)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34633)

(declare-datatypes ((tuple2!14406 0))(
  ( (tuple2!14407 (_1!7214 (_ BitVec 64)) (_2!7214 V!34633)) )
))
(declare-datatypes ((List!20217 0))(
  ( (Nil!20214) (Cons!20213 (h!21375 tuple2!14406) (t!28645 List!20217)) )
))
(declare-datatypes ((ListLongMap!13093 0))(
  ( (ListLongMap!13094 (toList!6562 List!20217)) )
))
(declare-fun lt!432042 () ListLongMap!13093)

(declare-fun getCurrentListMap!3724 (array!60448 array!60446 (_ BitVec 32) (_ BitVec 32) V!34633 V!34633 (_ BitVec 32) Int) ListLongMap!13093)

(assert (=> b!972834 (= lt!432042 (getCurrentListMap!3724 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972835 () Bool)

(declare-fun res!651231 () Bool)

(assert (=> b!972835 (=> (not res!651231) (not e!548327))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972835 (= res!651231 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29569 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29569 _keys!1717))))))

(declare-fun b!972836 () Bool)

(declare-fun res!651233 () Bool)

(assert (=> b!972836 (=> (not res!651233) (not e!548327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60448 (_ BitVec 32)) Bool)

(assert (=> b!972836 (= res!651233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972837 () Bool)

(assert (=> b!972837 (= e!548326 tp_is_empty!22237)))

(declare-fun mapIsEmpty!35365 () Bool)

(assert (=> mapIsEmpty!35365 mapRes!35365))

(declare-fun b!972838 () Bool)

(declare-fun res!651236 () Bool)

(assert (=> b!972838 (=> (not res!651236) (not e!548327))))

(declare-datatypes ((List!20218 0))(
  ( (Nil!20215) (Cons!20214 (h!21376 (_ BitVec 64)) (t!28646 List!20218)) )
))
(declare-fun arrayNoDuplicates!0 (array!60448 (_ BitVec 32) List!20218) Bool)

(assert (=> b!972838 (= res!651236 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20215))))

(declare-fun b!972839 () Bool)

(assert (=> b!972839 (= e!548324 (and e!548328 mapRes!35365))))

(declare-fun condMapEmpty!35365 () Bool)

(declare-fun mapDefault!35365 () ValueCell!10637)

(assert (=> b!972839 (= condMapEmpty!35365 (= (arr!29087 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10637)) mapDefault!35365)))))

(declare-fun b!972840 () Bool)

(declare-fun res!651238 () Bool)

(assert (=> b!972840 (=> (not res!651238) (not e!548327))))

(assert (=> b!972840 (= res!651238 (validKeyInArray!0 (select (arr!29088 _keys!1717) i!822)))))

(declare-fun b!972841 () Bool)

(assert (=> b!972841 (= e!548327 e!548325)))

(declare-fun res!651232 () Bool)

(assert (=> b!972841 (=> (not res!651232) (not e!548325))))

(declare-fun lt!432048 () ListLongMap!13093)

(declare-fun contains!5603 (ListLongMap!13093 (_ BitVec 64)) Bool)

(assert (=> b!972841 (= res!651232 (contains!5603 lt!432048 (select (arr!29088 _keys!1717) i!822)))))

(assert (=> b!972841 (= lt!432048 (getCurrentListMap!3724 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!972842 () Bool)

(assert (=> b!972842 (= e!548322 (not true))))

(declare-fun lt!432044 () tuple2!14406)

(declare-fun +!2915 (ListLongMap!13093 tuple2!14406) ListLongMap!13093)

(assert (=> b!972842 (contains!5603 (+!2915 lt!432048 lt!432044) (select (arr!29088 _keys!1717) i!822))))

(declare-datatypes ((Unit!32282 0))(
  ( (Unit!32283) )
))
(declare-fun lt!432045 () Unit!32282)

(declare-fun lt!432047 () V!34633)

(declare-fun addStillContains!585 (ListLongMap!13093 (_ BitVec 64) V!34633 (_ BitVec 64)) Unit!32282)

(assert (=> b!972842 (= lt!432045 (addStillContains!585 lt!432048 lt!432046 lt!432047 (select (arr!29088 _keys!1717) i!822)))))

(assert (=> b!972842 (= lt!432042 (+!2915 (getCurrentListMap!3724 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432044))))

(assert (=> b!972842 (= lt!432044 (tuple2!14407 lt!432046 lt!432047))))

(declare-fun get!15080 (ValueCell!10637 V!34633) V!34633)

(declare-fun dynLambda!1671 (Int (_ BitVec 64)) V!34633)

(assert (=> b!972842 (= lt!432047 (get!15080 (select (arr!29087 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1671 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432043 () Unit!32282)

(declare-fun lemmaListMapRecursiveValidKeyArray!255 (array!60448 array!60446 (_ BitVec 32) (_ BitVec 32) V!34633 V!34633 (_ BitVec 32) Int) Unit!32282)

(assert (=> b!972842 (= lt!432043 (lemmaListMapRecursiveValidKeyArray!255 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83328 res!651235) b!972833))

(assert (= (and b!972833 res!651237) b!972836))

(assert (= (and b!972836 res!651233) b!972838))

(assert (= (and b!972838 res!651236) b!972835))

(assert (= (and b!972835 res!651231) b!972840))

(assert (= (and b!972840 res!651238) b!972841))

(assert (= (and b!972841 res!651232) b!972834))

(assert (= (and b!972834 res!651234) b!972842))

(assert (= (and b!972839 condMapEmpty!35365) mapIsEmpty!35365))

(assert (= (and b!972839 (not condMapEmpty!35365)) mapNonEmpty!35365))

(get-info :version)

(assert (= (and mapNonEmpty!35365 ((_ is ValueCellFull!10637) mapValue!35365)) b!972837))

(assert (= (and b!972839 ((_ is ValueCellFull!10637) mapDefault!35365)) b!972832))

(assert (= start!83328 b!972839))

(declare-fun b_lambda!14485 () Bool)

(assert (=> (not b_lambda!14485) (not b!972842)))

(declare-fun t!28644 () Bool)

(declare-fun tb!6279 () Bool)

(assert (=> (and start!83328 (= defaultEntry!1428 defaultEntry!1428) t!28644) tb!6279))

(declare-fun result!12543 () Bool)

(assert (=> tb!6279 (= result!12543 tp_is_empty!22237)))

(assert (=> b!972842 t!28644))

(declare-fun b_and!30875 () Bool)

(assert (= b_and!30873 (and (=> t!28644 result!12543) b_and!30875)))

(declare-fun m!899813 () Bool)

(assert (=> b!972838 m!899813))

(declare-fun m!899815 () Bool)

(assert (=> b!972841 m!899815))

(assert (=> b!972841 m!899815))

(declare-fun m!899817 () Bool)

(assert (=> b!972841 m!899817))

(declare-fun m!899819 () Bool)

(assert (=> b!972841 m!899819))

(assert (=> b!972840 m!899815))

(assert (=> b!972840 m!899815))

(declare-fun m!899821 () Bool)

(assert (=> b!972840 m!899821))

(assert (=> b!972842 m!899815))

(declare-fun m!899823 () Bool)

(assert (=> b!972842 m!899823))

(declare-fun m!899825 () Bool)

(assert (=> b!972842 m!899825))

(declare-fun m!899827 () Bool)

(assert (=> b!972842 m!899827))

(assert (=> b!972842 m!899815))

(declare-fun m!899829 () Bool)

(assert (=> b!972842 m!899829))

(declare-fun m!899831 () Bool)

(assert (=> b!972842 m!899831))

(declare-fun m!899833 () Bool)

(assert (=> b!972842 m!899833))

(assert (=> b!972842 m!899815))

(assert (=> b!972842 m!899827))

(assert (=> b!972842 m!899825))

(assert (=> b!972842 m!899833))

(declare-fun m!899835 () Bool)

(assert (=> b!972842 m!899835))

(assert (=> b!972842 m!899831))

(declare-fun m!899837 () Bool)

(assert (=> b!972842 m!899837))

(declare-fun m!899839 () Bool)

(assert (=> b!972842 m!899839))

(declare-fun m!899841 () Bool)

(assert (=> start!83328 m!899841))

(declare-fun m!899843 () Bool)

(assert (=> start!83328 m!899843))

(declare-fun m!899845 () Bool)

(assert (=> start!83328 m!899845))

(declare-fun m!899847 () Bool)

(assert (=> mapNonEmpty!35365 m!899847))

(declare-fun m!899849 () Bool)

(assert (=> b!972836 m!899849))

(declare-fun m!899851 () Bool)

(assert (=> b!972834 m!899851))

(declare-fun m!899853 () Bool)

(assert (=> b!972834 m!899853))

(declare-fun m!899855 () Bool)

(assert (=> b!972834 m!899855))

(check-sat (not b_next!19339) (not b!972840) (not b!972842) (not start!83328) (not b_lambda!14485) (not b!972841) (not b!972836) (not mapNonEmpty!35365) tp_is_empty!22237 b_and!30875 (not b!972838) (not b!972834))
(check-sat b_and!30875 (not b_next!19339))
