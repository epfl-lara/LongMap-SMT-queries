; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107056 () Bool)

(assert start!107056)

(declare-fun b_free!27561 () Bool)

(declare-fun b_next!27561 () Bool)

(assert (=> start!107056 (= b_free!27561 (not b_next!27561))))

(declare-fun tp!96909 () Bool)

(declare-fun b_and!45593 () Bool)

(assert (=> start!107056 (= tp!96909 b_and!45593)))

(declare-fun b!1269267 () Bool)

(declare-fun res!844700 () Bool)

(declare-fun e!723420 () Bool)

(assert (=> b!1269267 (=> (not res!844700) (not e!723420))))

(declare-datatypes ((array!82754 0))(
  ( (array!82755 (arr!39914 (Array (_ BitVec 32) (_ BitVec 64))) (size!40450 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82754)

(declare-datatypes ((List!28418 0))(
  ( (Nil!28415) (Cons!28414 (h!29623 (_ BitVec 64)) (t!41947 List!28418)) )
))
(declare-fun arrayNoDuplicates!0 (array!82754 (_ BitVec 32) List!28418) Bool)

(assert (=> b!1269267 (= res!844700 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28415))))

(declare-fun b!1269268 () Bool)

(declare-fun res!844698 () Bool)

(assert (=> b!1269268 (=> (not res!844698) (not e!723420))))

(declare-datatypes ((V!48853 0))(
  ( (V!48854 (val!16447 Int)) )
))
(declare-datatypes ((ValueCell!15519 0))(
  ( (ValueCellFull!15519 (v!19084 V!48853)) (EmptyCell!15519) )
))
(declare-datatypes ((array!82756 0))(
  ( (array!82757 (arr!39915 (Array (_ BitVec 32) ValueCell!15519)) (size!40451 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82756)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269268 (= res!844698 (and (= (size!40451 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40450 _keys!1364) (size!40451 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269269 () Bool)

(declare-fun e!723419 () Bool)

(declare-fun tp_is_empty!32745 () Bool)

(assert (=> b!1269269 (= e!723419 tp_is_empty!32745)))

(declare-fun b!1269270 () Bool)

(declare-fun res!844697 () Bool)

(assert (=> b!1269270 (=> (not res!844697) (not e!723420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82754 (_ BitVec 32)) Bool)

(assert (=> b!1269270 (= res!844697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844699 () Bool)

(assert (=> start!107056 (=> (not res!844699) (not e!723420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107056 (= res!844699 (validMask!0 mask!1730))))

(assert (=> start!107056 e!723420))

(declare-fun e!723422 () Bool)

(declare-fun array_inv!30369 (array!82756) Bool)

(assert (=> start!107056 (and (array_inv!30369 _values!1134) e!723422)))

(assert (=> start!107056 true))

(declare-fun array_inv!30370 (array!82754) Bool)

(assert (=> start!107056 (array_inv!30370 _keys!1364)))

(assert (=> start!107056 tp_is_empty!32745))

(assert (=> start!107056 tp!96909))

(declare-fun mapIsEmpty!50698 () Bool)

(declare-fun mapRes!50698 () Bool)

(assert (=> mapIsEmpty!50698 mapRes!50698))

(declare-fun b!1269271 () Bool)

(declare-fun res!844696 () Bool)

(assert (=> b!1269271 (=> (not res!844696) (not e!723420))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269271 (= res!844696 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40450 _keys!1364)) (bvslt from!1698 (size!40450 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269272 () Bool)

(assert (=> b!1269272 (= e!723422 (and e!723419 mapRes!50698))))

(declare-fun condMapEmpty!50698 () Bool)

(declare-fun mapDefault!50698 () ValueCell!15519)

(assert (=> b!1269272 (= condMapEmpty!50698 (= (arr!39915 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15519)) mapDefault!50698)))))

(declare-fun mapNonEmpty!50698 () Bool)

(declare-fun tp!96910 () Bool)

(declare-fun e!723421 () Bool)

(assert (=> mapNonEmpty!50698 (= mapRes!50698 (and tp!96910 e!723421))))

(declare-fun mapRest!50698 () (Array (_ BitVec 32) ValueCell!15519))

(declare-fun mapValue!50698 () ValueCell!15519)

(declare-fun mapKey!50698 () (_ BitVec 32))

(assert (=> mapNonEmpty!50698 (= (arr!39915 _values!1134) (store mapRest!50698 mapKey!50698 mapValue!50698))))

(declare-fun b!1269273 () Bool)

(assert (=> b!1269273 (= e!723421 tp_is_empty!32745)))

(declare-fun b!1269274 () Bool)

(assert (=> b!1269274 (= e!723420 (not true))))

(declare-fun minValueAfter!52 () V!48853)

(declare-fun minValueBefore!52 () V!48853)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48853)

(declare-fun zeroValueBefore!52 () V!48853)

(declare-datatypes ((tuple2!21304 0))(
  ( (tuple2!21305 (_1!10663 (_ BitVec 64)) (_2!10663 V!48853)) )
))
(declare-datatypes ((List!28419 0))(
  ( (Nil!28416) (Cons!28415 (h!29624 tuple2!21304) (t!41948 List!28419)) )
))
(declare-datatypes ((ListLongMap!19033 0))(
  ( (ListLongMap!19034 (toList!9532 List!28419)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5864 (array!82754 array!82756 (_ BitVec 32) (_ BitVec 32) V!48853 V!48853 (_ BitVec 32) Int) ListLongMap!19033)

(assert (=> b!1269274 (= (getCurrentListMapNoExtraKeys!5864 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5864 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42250 0))(
  ( (Unit!42251) )
))
(declare-fun lt!574554 () Unit!42250)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1206 (array!82754 array!82756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48853 V!48853 V!48853 V!48853 (_ BitVec 32) Int) Unit!42250)

(assert (=> b!1269274 (= lt!574554 (lemmaNoChangeToArrayThenSameMapNoExtras!1206 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(assert (= (and start!107056 res!844699) b!1269268))

(assert (= (and b!1269268 res!844698) b!1269270))

(assert (= (and b!1269270 res!844697) b!1269267))

(assert (= (and b!1269267 res!844700) b!1269271))

(assert (= (and b!1269271 res!844696) b!1269274))

(assert (= (and b!1269272 condMapEmpty!50698) mapIsEmpty!50698))

(assert (= (and b!1269272 (not condMapEmpty!50698)) mapNonEmpty!50698))

(get-info :version)

(assert (= (and mapNonEmpty!50698 ((_ is ValueCellFull!15519) mapValue!50698)) b!1269273))

(assert (= (and b!1269272 ((_ is ValueCellFull!15519) mapDefault!50698)) b!1269269))

(assert (= start!107056 b!1269272))

(declare-fun m!1167851 () Bool)

(assert (=> b!1269270 m!1167851))

(declare-fun m!1167853 () Bool)

(assert (=> b!1269267 m!1167853))

(declare-fun m!1167855 () Bool)

(assert (=> mapNonEmpty!50698 m!1167855))

(declare-fun m!1167857 () Bool)

(assert (=> start!107056 m!1167857))

(declare-fun m!1167859 () Bool)

(assert (=> start!107056 m!1167859))

(declare-fun m!1167861 () Bool)

(assert (=> start!107056 m!1167861))

(declare-fun m!1167863 () Bool)

(assert (=> b!1269274 m!1167863))

(declare-fun m!1167865 () Bool)

(assert (=> b!1269274 m!1167865))

(declare-fun m!1167867 () Bool)

(assert (=> b!1269274 m!1167867))

(check-sat tp_is_empty!32745 (not start!107056) (not b!1269270) (not b!1269267) (not b_next!27561) (not b!1269274) b_and!45593 (not mapNonEmpty!50698))
(check-sat b_and!45593 (not b_next!27561))
