; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83514 () Bool)

(assert start!83514)

(declare-fun b_free!19339 () Bool)

(declare-fun b_next!19339 () Bool)

(assert (=> start!83514 (= b_free!19339 (not b_next!19339))))

(declare-fun tp!67296 () Bool)

(declare-fun b_and!30909 () Bool)

(assert (=> start!83514 (= tp!67296 b_and!30909)))

(declare-fun b!973974 () Bool)

(declare-fun e!549052 () Bool)

(declare-fun e!549053 () Bool)

(declare-fun mapRes!35365 () Bool)

(assert (=> b!973974 (= e!549052 (and e!549053 mapRes!35365))))

(declare-fun condMapEmpty!35365 () Bool)

(declare-datatypes ((V!34633 0))(
  ( (V!34634 (val!11169 Int)) )
))
(declare-datatypes ((ValueCell!10637 0))(
  ( (ValueCellFull!10637 (v!13725 V!34633)) (EmptyCell!10637) )
))
(declare-datatypes ((array!60546 0))(
  ( (array!60547 (arr!29132 (Array (_ BitVec 32) ValueCell!10637)) (size!29612 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60546)

(declare-fun mapDefault!35365 () ValueCell!10637)

(assert (=> b!973974 (= condMapEmpty!35365 (= (arr!29132 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10637)) mapDefault!35365)))))

(declare-fun b!973975 () Bool)

(declare-fun res!651688 () Bool)

(declare-fun e!549058 () Bool)

(assert (=> b!973975 (=> (not res!651688) (not e!549058))))

(declare-datatypes ((array!60548 0))(
  ( (array!60549 (arr!29133 (Array (_ BitVec 32) (_ BitVec 64))) (size!29613 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60548)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973975 (= res!651688 (validKeyInArray!0 (select (arr!29133 _keys!1717) i!822)))))

(declare-fun b!973976 () Bool)

(declare-fun e!549057 () Bool)

(declare-fun e!549054 () Bool)

(assert (=> b!973976 (= e!549057 e!549054)))

(declare-fun res!651685 () Bool)

(assert (=> b!973976 (=> (not res!651685) (not e!549054))))

(declare-fun lt!432643 () (_ BitVec 64))

(assert (=> b!973976 (= res!651685 (validKeyInArray!0 lt!432643))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973976 (= lt!432643 (select (arr!29133 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34633)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34633)

(declare-datatypes ((tuple2!14338 0))(
  ( (tuple2!14339 (_1!7180 (_ BitVec 64)) (_2!7180 V!34633)) )
))
(declare-datatypes ((List!20188 0))(
  ( (Nil!20185) (Cons!20184 (h!21352 tuple2!14338) (t!28617 List!20188)) )
))
(declare-datatypes ((ListLongMap!13037 0))(
  ( (ListLongMap!13038 (toList!6534 List!20188)) )
))
(declare-fun lt!432645 () ListLongMap!13037)

(declare-fun getCurrentListMap!3767 (array!60548 array!60546 (_ BitVec 32) (_ BitVec 32) V!34633 V!34633 (_ BitVec 32) Int) ListLongMap!13037)

(assert (=> b!973976 (= lt!432645 (getCurrentListMap!3767 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35365 () Bool)

(declare-fun tp!67297 () Bool)

(declare-fun e!549056 () Bool)

(assert (=> mapNonEmpty!35365 (= mapRes!35365 (and tp!67297 e!549056))))

(declare-fun mapKey!35365 () (_ BitVec 32))

(declare-fun mapRest!35365 () (Array (_ BitVec 32) ValueCell!10637))

(declare-fun mapValue!35365 () ValueCell!10637)

(assert (=> mapNonEmpty!35365 (= (arr!29132 _values!1425) (store mapRest!35365 mapKey!35365 mapValue!35365))))

(declare-fun res!651686 () Bool)

(assert (=> start!83514 (=> (not res!651686) (not e!549058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83514 (= res!651686 (validMask!0 mask!2147))))

(assert (=> start!83514 e!549058))

(assert (=> start!83514 true))

(declare-fun array_inv!22591 (array!60546) Bool)

(assert (=> start!83514 (and (array_inv!22591 _values!1425) e!549052)))

(declare-fun tp_is_empty!22237 () Bool)

(assert (=> start!83514 tp_is_empty!22237))

(assert (=> start!83514 tp!67296))

(declare-fun array_inv!22592 (array!60548) Bool)

(assert (=> start!83514 (array_inv!22592 _keys!1717)))

(declare-fun b!973977 () Bool)

(assert (=> b!973977 (= e!549054 (not true))))

(declare-fun lt!432640 () tuple2!14338)

(declare-fun lt!432642 () ListLongMap!13037)

(declare-fun contains!5642 (ListLongMap!13037 (_ BitVec 64)) Bool)

(declare-fun +!2910 (ListLongMap!13037 tuple2!14338) ListLongMap!13037)

(assert (=> b!973977 (contains!5642 (+!2910 lt!432642 lt!432640) (select (arr!29133 _keys!1717) i!822))))

(declare-fun lt!432641 () V!34633)

(declare-datatypes ((Unit!32384 0))(
  ( (Unit!32385) )
))
(declare-fun lt!432644 () Unit!32384)

(declare-fun addStillContains!592 (ListLongMap!13037 (_ BitVec 64) V!34633 (_ BitVec 64)) Unit!32384)

(assert (=> b!973977 (= lt!432644 (addStillContains!592 lt!432642 lt!432643 lt!432641 (select (arr!29133 _keys!1717) i!822)))))

(assert (=> b!973977 (= lt!432645 (+!2910 (getCurrentListMap!3767 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432640))))

(assert (=> b!973977 (= lt!432640 (tuple2!14339 lt!432643 lt!432641))))

(declare-fun get!15115 (ValueCell!10637 V!34633) V!34633)

(declare-fun dynLambda!1707 (Int (_ BitVec 64)) V!34633)

(assert (=> b!973977 (= lt!432641 (get!15115 (select (arr!29132 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1707 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432639 () Unit!32384)

(declare-fun lemmaListMapRecursiveValidKeyArray!266 (array!60548 array!60546 (_ BitVec 32) (_ BitVec 32) V!34633 V!34633 (_ BitVec 32) Int) Unit!32384)

(assert (=> b!973977 (= lt!432639 (lemmaListMapRecursiveValidKeyArray!266 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973978 () Bool)

(declare-fun res!651687 () Bool)

(assert (=> b!973978 (=> (not res!651687) (not e!549058))))

(assert (=> b!973978 (= res!651687 (and (= (size!29612 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29613 _keys!1717) (size!29612 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973979 () Bool)

(declare-fun res!651691 () Bool)

(assert (=> b!973979 (=> (not res!651691) (not e!549058))))

(assert (=> b!973979 (= res!651691 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29613 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29613 _keys!1717))))))

(declare-fun mapIsEmpty!35365 () Bool)

(assert (=> mapIsEmpty!35365 mapRes!35365))

(declare-fun b!973980 () Bool)

(assert (=> b!973980 (= e!549053 tp_is_empty!22237)))

(declare-fun b!973981 () Bool)

(assert (=> b!973981 (= e!549058 e!549057)))

(declare-fun res!651692 () Bool)

(assert (=> b!973981 (=> (not res!651692) (not e!549057))))

(assert (=> b!973981 (= res!651692 (contains!5642 lt!432642 (select (arr!29133 _keys!1717) i!822)))))

(assert (=> b!973981 (= lt!432642 (getCurrentListMap!3767 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973982 () Bool)

(declare-fun res!651689 () Bool)

(assert (=> b!973982 (=> (not res!651689) (not e!549058))))

(declare-datatypes ((List!20189 0))(
  ( (Nil!20186) (Cons!20185 (h!21353 (_ BitVec 64)) (t!28618 List!20189)) )
))
(declare-fun arrayNoDuplicates!0 (array!60548 (_ BitVec 32) List!20189) Bool)

(assert (=> b!973982 (= res!651689 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20186))))

(declare-fun b!973983 () Bool)

(assert (=> b!973983 (= e!549056 tp_is_empty!22237)))

(declare-fun b!973984 () Bool)

(declare-fun res!651690 () Bool)

(assert (=> b!973984 (=> (not res!651690) (not e!549058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60548 (_ BitVec 32)) Bool)

(assert (=> b!973984 (= res!651690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83514 res!651686) b!973978))

(assert (= (and b!973978 res!651687) b!973984))

(assert (= (and b!973984 res!651690) b!973982))

(assert (= (and b!973982 res!651689) b!973979))

(assert (= (and b!973979 res!651691) b!973975))

(assert (= (and b!973975 res!651688) b!973981))

(assert (= (and b!973981 res!651692) b!973976))

(assert (= (and b!973976 res!651685) b!973977))

(assert (= (and b!973974 condMapEmpty!35365) mapIsEmpty!35365))

(assert (= (and b!973974 (not condMapEmpty!35365)) mapNonEmpty!35365))

(get-info :version)

(assert (= (and mapNonEmpty!35365 ((_ is ValueCellFull!10637) mapValue!35365)) b!973983))

(assert (= (and b!973974 ((_ is ValueCellFull!10637) mapDefault!35365)) b!973980))

(assert (= start!83514 b!973974))

(declare-fun b_lambda!14517 () Bool)

(assert (=> (not b_lambda!14517) (not b!973977)))

(declare-fun t!28616 () Bool)

(declare-fun tb!6279 () Bool)

(assert (=> (and start!83514 (= defaultEntry!1428 defaultEntry!1428) t!28616) tb!6279))

(declare-fun result!12543 () Bool)

(assert (=> tb!6279 (= result!12543 tp_is_empty!22237)))

(assert (=> b!973977 t!28616))

(declare-fun b_and!30911 () Bool)

(assert (= b_and!30909 (and (=> t!28616 result!12543) b_and!30911)))

(declare-fun m!901865 () Bool)

(assert (=> b!973984 m!901865))

(declare-fun m!901867 () Bool)

(assert (=> mapNonEmpty!35365 m!901867))

(declare-fun m!901869 () Bool)

(assert (=> b!973981 m!901869))

(assert (=> b!973981 m!901869))

(declare-fun m!901871 () Bool)

(assert (=> b!973981 m!901871))

(declare-fun m!901873 () Bool)

(assert (=> b!973981 m!901873))

(declare-fun m!901875 () Bool)

(assert (=> b!973977 m!901875))

(declare-fun m!901877 () Bool)

(assert (=> b!973977 m!901877))

(assert (=> b!973977 m!901869))

(declare-fun m!901879 () Bool)

(assert (=> b!973977 m!901879))

(declare-fun m!901881 () Bool)

(assert (=> b!973977 m!901881))

(declare-fun m!901883 () Bool)

(assert (=> b!973977 m!901883))

(assert (=> b!973977 m!901869))

(declare-fun m!901885 () Bool)

(assert (=> b!973977 m!901885))

(declare-fun m!901887 () Bool)

(assert (=> b!973977 m!901887))

(assert (=> b!973977 m!901879))

(assert (=> b!973977 m!901875))

(assert (=> b!973977 m!901869))

(declare-fun m!901889 () Bool)

(assert (=> b!973977 m!901889))

(assert (=> b!973977 m!901877))

(declare-fun m!901891 () Bool)

(assert (=> b!973977 m!901891))

(assert (=> b!973977 m!901881))

(declare-fun m!901893 () Bool)

(assert (=> start!83514 m!901893))

(declare-fun m!901895 () Bool)

(assert (=> start!83514 m!901895))

(declare-fun m!901897 () Bool)

(assert (=> start!83514 m!901897))

(declare-fun m!901899 () Bool)

(assert (=> b!973976 m!901899))

(declare-fun m!901901 () Bool)

(assert (=> b!973976 m!901901))

(declare-fun m!901903 () Bool)

(assert (=> b!973976 m!901903))

(assert (=> b!973975 m!901869))

(assert (=> b!973975 m!901869))

(declare-fun m!901905 () Bool)

(assert (=> b!973975 m!901905))

(declare-fun m!901907 () Bool)

(assert (=> b!973982 m!901907))

(check-sat (not b!973976) (not b!973982) b_and!30911 (not mapNonEmpty!35365) tp_is_empty!22237 (not b_lambda!14517) (not b!973975) (not start!83514) (not b!973981) (not b!973977) (not b_next!19339) (not b!973984))
(check-sat b_and!30911 (not b_next!19339))
