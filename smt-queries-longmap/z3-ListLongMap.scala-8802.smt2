; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107260 () Bool)

(assert start!107260)

(declare-fun b_free!27541 () Bool)

(declare-fun b_next!27541 () Bool)

(assert (=> start!107260 (= b_free!27541 (not b_next!27541))))

(declare-fun tp!96850 () Bool)

(declare-fun b_and!45575 () Bool)

(assert (=> start!107260 (= tp!96850 b_and!45575)))

(declare-fun b!1270332 () Bool)

(declare-fun e!724118 () Bool)

(declare-fun tp_is_empty!32725 () Bool)

(assert (=> b!1270332 (= e!724118 tp_is_empty!32725)))

(declare-fun res!845067 () Bool)

(declare-fun e!724117 () Bool)

(assert (=> start!107260 (=> (not res!845067) (not e!724117))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107260 (= res!845067 (validMask!0 mask!1730))))

(assert (=> start!107260 e!724117))

(declare-datatypes ((V!48827 0))(
  ( (V!48828 (val!16437 Int)) )
))
(declare-datatypes ((ValueCell!15509 0))(
  ( (ValueCellFull!15509 (v!19069 V!48827)) (EmptyCell!15509) )
))
(declare-datatypes ((array!82755 0))(
  ( (array!82756 (arr!39910 (Array (_ BitVec 32) ValueCell!15509)) (size!40447 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82755)

(declare-fun e!724120 () Bool)

(declare-fun array_inv!30533 (array!82755) Bool)

(assert (=> start!107260 (and (array_inv!30533 _values!1134) e!724120)))

(assert (=> start!107260 true))

(declare-datatypes ((array!82757 0))(
  ( (array!82758 (arr!39911 (Array (_ BitVec 32) (_ BitVec 64))) (size!40448 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82757)

(declare-fun array_inv!30534 (array!82757) Bool)

(assert (=> start!107260 (array_inv!30534 _keys!1364)))

(assert (=> start!107260 tp_is_empty!32725))

(assert (=> start!107260 tp!96850))

(declare-fun b!1270333 () Bool)

(declare-fun e!724119 () Bool)

(assert (=> b!1270333 (= e!724119 tp_is_empty!32725)))

(declare-fun mapNonEmpty!50668 () Bool)

(declare-fun mapRes!50668 () Bool)

(declare-fun tp!96849 () Bool)

(assert (=> mapNonEmpty!50668 (= mapRes!50668 (and tp!96849 e!724118))))

(declare-fun mapKey!50668 () (_ BitVec 32))

(declare-fun mapRest!50668 () (Array (_ BitVec 32) ValueCell!15509))

(declare-fun mapValue!50668 () ValueCell!15509)

(assert (=> mapNonEmpty!50668 (= (arr!39910 _values!1134) (store mapRest!50668 mapKey!50668 mapValue!50668))))

(declare-fun b!1270334 () Bool)

(declare-fun res!845068 () Bool)

(assert (=> b!1270334 (=> (not res!845068) (not e!724117))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270334 (= res!845068 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40448 _keys!1364)) (bvslt from!1698 (size!40448 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270335 () Bool)

(declare-fun res!845070 () Bool)

(assert (=> b!1270335 (=> (not res!845070) (not e!724117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82757 (_ BitVec 32)) Bool)

(assert (=> b!1270335 (= res!845070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270336 () Bool)

(declare-fun res!845069 () Bool)

(assert (=> b!1270336 (=> (not res!845069) (not e!724117))))

(declare-datatypes ((List!28440 0))(
  ( (Nil!28437) (Cons!28436 (h!29654 (_ BitVec 64)) (t!41961 List!28440)) )
))
(declare-fun arrayNoDuplicates!0 (array!82757 (_ BitVec 32) List!28440) Bool)

(assert (=> b!1270336 (= res!845069 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28437))))

(declare-fun b!1270337 () Bool)

(declare-fun res!845066 () Bool)

(assert (=> b!1270337 (=> (not res!845066) (not e!724117))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270337 (= res!845066 (and (= (size!40447 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40448 _keys!1364) (size!40447 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270338 () Bool)

(assert (=> b!1270338 (= e!724120 (and e!724119 mapRes!50668))))

(declare-fun condMapEmpty!50668 () Bool)

(declare-fun mapDefault!50668 () ValueCell!15509)

(assert (=> b!1270338 (= condMapEmpty!50668 (= (arr!39910 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15509)) mapDefault!50668)))))

(declare-fun mapIsEmpty!50668 () Bool)

(assert (=> mapIsEmpty!50668 mapRes!50668))

(declare-fun b!1270339 () Bool)

(assert (=> b!1270339 (= e!724117 (not true))))

(declare-fun minValueAfter!52 () V!48827)

(declare-fun minValueBefore!52 () V!48827)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48827)

(declare-fun zeroValueBefore!52 () V!48827)

(declare-datatypes ((tuple2!21300 0))(
  ( (tuple2!21301 (_1!10661 (_ BitVec 64)) (_2!10661 V!48827)) )
))
(declare-datatypes ((List!28441 0))(
  ( (Nil!28438) (Cons!28437 (h!29655 tuple2!21300) (t!41962 List!28441)) )
))
(declare-datatypes ((ListLongMap!19037 0))(
  ( (ListLongMap!19038 (toList!9534 List!28441)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5906 (array!82757 array!82755 (_ BitVec 32) (_ BitVec 32) V!48827 V!48827 (_ BitVec 32) Int) ListLongMap!19037)

(assert (=> b!1270339 (= (getCurrentListMapNoExtraKeys!5906 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5906 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42209 0))(
  ( (Unit!42210) )
))
(declare-fun lt!575008 () Unit!42209)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1196 (array!82757 array!82755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48827 V!48827 V!48827 V!48827 (_ BitVec 32) Int) Unit!42209)

(assert (=> b!1270339 (= lt!575008 (lemmaNoChangeToArrayThenSameMapNoExtras!1196 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(assert (= (and start!107260 res!845067) b!1270337))

(assert (= (and b!1270337 res!845066) b!1270335))

(assert (= (and b!1270335 res!845070) b!1270336))

(assert (= (and b!1270336 res!845069) b!1270334))

(assert (= (and b!1270334 res!845068) b!1270339))

(assert (= (and b!1270338 condMapEmpty!50668) mapIsEmpty!50668))

(assert (= (and b!1270338 (not condMapEmpty!50668)) mapNonEmpty!50668))

(get-info :version)

(assert (= (and mapNonEmpty!50668 ((_ is ValueCellFull!15509) mapValue!50668)) b!1270332))

(assert (= (and b!1270338 ((_ is ValueCellFull!15509) mapDefault!50668)) b!1270333))

(assert (= start!107260 b!1270338))

(declare-fun m!1169283 () Bool)

(assert (=> b!1270336 m!1169283))

(declare-fun m!1169285 () Bool)

(assert (=> mapNonEmpty!50668 m!1169285))

(declare-fun m!1169287 () Bool)

(assert (=> b!1270339 m!1169287))

(declare-fun m!1169289 () Bool)

(assert (=> b!1270339 m!1169289))

(declare-fun m!1169291 () Bool)

(assert (=> b!1270339 m!1169291))

(declare-fun m!1169293 () Bool)

(assert (=> b!1270335 m!1169293))

(declare-fun m!1169295 () Bool)

(assert (=> start!107260 m!1169295))

(declare-fun m!1169297 () Bool)

(assert (=> start!107260 m!1169297))

(declare-fun m!1169299 () Bool)

(assert (=> start!107260 m!1169299))

(check-sat tp_is_empty!32725 (not b_next!27541) (not b!1270339) (not mapNonEmpty!50668) (not b!1270336) b_and!45575 (not b!1270335) (not start!107260))
(check-sat b_and!45575 (not b_next!27541))
