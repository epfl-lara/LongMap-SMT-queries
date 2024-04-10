; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107104 () Bool)

(assert start!107104)

(declare-fun b_free!27609 () Bool)

(declare-fun b_next!27609 () Bool)

(assert (=> start!107104 (= b_free!27609 (not b_next!27609))))

(declare-fun tp!97054 () Bool)

(declare-fun b_and!45641 () Bool)

(assert (=> start!107104 (= tp!97054 b_and!45641)))

(declare-fun b!1269843 () Bool)

(declare-fun res!845058 () Bool)

(declare-fun e!723780 () Bool)

(assert (=> b!1269843 (=> (not res!845058) (not e!723780))))

(declare-datatypes ((V!48917 0))(
  ( (V!48918 (val!16471 Int)) )
))
(declare-datatypes ((ValueCell!15543 0))(
  ( (ValueCellFull!15543 (v!19108 V!48917)) (EmptyCell!15543) )
))
(declare-datatypes ((array!82848 0))(
  ( (array!82849 (arr!39961 (Array (_ BitVec 32) ValueCell!15543)) (size!40497 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82848)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82850 0))(
  ( (array!82851 (arr!39962 (Array (_ BitVec 32) (_ BitVec 64))) (size!40498 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82850)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269843 (= res!845058 (and (= (size!40497 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40498 _keys!1364) (size!40497 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269844 () Bool)

(assert (=> b!1269844 (= e!723780 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48917)

(declare-fun minValueBefore!52 () V!48917)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48917)

(declare-fun zeroValueBefore!52 () V!48917)

(declare-datatypes ((tuple2!21336 0))(
  ( (tuple2!21337 (_1!10679 (_ BitVec 64)) (_2!10679 V!48917)) )
))
(declare-datatypes ((List!28451 0))(
  ( (Nil!28448) (Cons!28447 (h!29656 tuple2!21336) (t!41980 List!28451)) )
))
(declare-datatypes ((ListLongMap!19065 0))(
  ( (ListLongMap!19066 (toList!9548 List!28451)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5880 (array!82850 array!82848 (_ BitVec 32) (_ BitVec 32) V!48917 V!48917 (_ BitVec 32) Int) ListLongMap!19065)

(assert (=> b!1269844 (= (getCurrentListMapNoExtraKeys!5880 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5880 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42282 0))(
  ( (Unit!42283) )
))
(declare-fun lt!574626 () Unit!42282)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1222 (array!82850 array!82848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48917 V!48917 V!48917 V!48917 (_ BitVec 32) Int) Unit!42282)

(assert (=> b!1269844 (= lt!574626 (lemmaNoChangeToArrayThenSameMapNoExtras!1222 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!845057 () Bool)

(assert (=> start!107104 (=> (not res!845057) (not e!723780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107104 (= res!845057 (validMask!0 mask!1730))))

(assert (=> start!107104 e!723780))

(declare-fun e!723783 () Bool)

(declare-fun array_inv!30397 (array!82848) Bool)

(assert (=> start!107104 (and (array_inv!30397 _values!1134) e!723783)))

(assert (=> start!107104 true))

(declare-fun array_inv!30398 (array!82850) Bool)

(assert (=> start!107104 (array_inv!30398 _keys!1364)))

(declare-fun tp_is_empty!32793 () Bool)

(assert (=> start!107104 tp_is_empty!32793))

(assert (=> start!107104 tp!97054))

(declare-fun b!1269845 () Bool)

(declare-fun res!845056 () Bool)

(assert (=> b!1269845 (=> (not res!845056) (not e!723780))))

(assert (=> b!1269845 (= res!845056 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40498 _keys!1364)) (bvslt from!1698 (size!40498 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269846 () Bool)

(declare-fun e!723782 () Bool)

(assert (=> b!1269846 (= e!723782 tp_is_empty!32793)))

(declare-fun b!1269847 () Bool)

(declare-fun res!845059 () Bool)

(assert (=> b!1269847 (=> (not res!845059) (not e!723780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82850 (_ BitVec 32)) Bool)

(assert (=> b!1269847 (= res!845059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50770 () Bool)

(declare-fun mapRes!50770 () Bool)

(assert (=> mapIsEmpty!50770 mapRes!50770))

(declare-fun b!1269848 () Bool)

(declare-fun e!723779 () Bool)

(assert (=> b!1269848 (= e!723779 tp_is_empty!32793)))

(declare-fun b!1269849 () Bool)

(declare-fun res!845060 () Bool)

(assert (=> b!1269849 (=> (not res!845060) (not e!723780))))

(declare-datatypes ((List!28452 0))(
  ( (Nil!28449) (Cons!28448 (h!29657 (_ BitVec 64)) (t!41981 List!28452)) )
))
(declare-fun arrayNoDuplicates!0 (array!82850 (_ BitVec 32) List!28452) Bool)

(assert (=> b!1269849 (= res!845060 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28449))))

(declare-fun mapNonEmpty!50770 () Bool)

(declare-fun tp!97053 () Bool)

(assert (=> mapNonEmpty!50770 (= mapRes!50770 (and tp!97053 e!723782))))

(declare-fun mapValue!50770 () ValueCell!15543)

(declare-fun mapRest!50770 () (Array (_ BitVec 32) ValueCell!15543))

(declare-fun mapKey!50770 () (_ BitVec 32))

(assert (=> mapNonEmpty!50770 (= (arr!39961 _values!1134) (store mapRest!50770 mapKey!50770 mapValue!50770))))

(declare-fun b!1269850 () Bool)

(assert (=> b!1269850 (= e!723783 (and e!723779 mapRes!50770))))

(declare-fun condMapEmpty!50770 () Bool)

(declare-fun mapDefault!50770 () ValueCell!15543)

(assert (=> b!1269850 (= condMapEmpty!50770 (= (arr!39961 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15543)) mapDefault!50770)))))

(assert (= (and start!107104 res!845057) b!1269843))

(assert (= (and b!1269843 res!845058) b!1269847))

(assert (= (and b!1269847 res!845059) b!1269849))

(assert (= (and b!1269849 res!845060) b!1269845))

(assert (= (and b!1269845 res!845056) b!1269844))

(assert (= (and b!1269850 condMapEmpty!50770) mapIsEmpty!50770))

(assert (= (and b!1269850 (not condMapEmpty!50770)) mapNonEmpty!50770))

(get-info :version)

(assert (= (and mapNonEmpty!50770 ((_ is ValueCellFull!15543) mapValue!50770)) b!1269846))

(assert (= (and b!1269850 ((_ is ValueCellFull!15543) mapDefault!50770)) b!1269848))

(assert (= start!107104 b!1269850))

(declare-fun m!1168283 () Bool)

(assert (=> b!1269849 m!1168283))

(declare-fun m!1168285 () Bool)

(assert (=> b!1269844 m!1168285))

(declare-fun m!1168287 () Bool)

(assert (=> b!1269844 m!1168287))

(declare-fun m!1168289 () Bool)

(assert (=> b!1269844 m!1168289))

(declare-fun m!1168291 () Bool)

(assert (=> mapNonEmpty!50770 m!1168291))

(declare-fun m!1168293 () Bool)

(assert (=> b!1269847 m!1168293))

(declare-fun m!1168295 () Bool)

(assert (=> start!107104 m!1168295))

(declare-fun m!1168297 () Bool)

(assert (=> start!107104 m!1168297))

(declare-fun m!1168299 () Bool)

(assert (=> start!107104 m!1168299))

(check-sat (not mapNonEmpty!50770) (not b!1269849) (not b_next!27609) tp_is_empty!32793 (not b!1269847) b_and!45641 (not start!107104) (not b!1269844))
(check-sat b_and!45641 (not b_next!27609))
