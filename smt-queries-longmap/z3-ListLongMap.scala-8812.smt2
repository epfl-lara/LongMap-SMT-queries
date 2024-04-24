; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107320 () Bool)

(assert start!107320)

(declare-fun b_free!27601 () Bool)

(declare-fun b_next!27601 () Bool)

(assert (=> start!107320 (= b_free!27601 (not b_next!27601))))

(declare-fun tp!97029 () Bool)

(declare-fun b_and!45635 () Bool)

(assert (=> start!107320 (= tp!97029 b_and!45635)))

(declare-fun b!1271052 () Bool)

(declare-fun res!845520 () Bool)

(declare-fun e!724567 () Bool)

(assert (=> b!1271052 (=> (not res!845520) (not e!724567))))

(declare-datatypes ((V!48907 0))(
  ( (V!48908 (val!16467 Int)) )
))
(declare-datatypes ((ValueCell!15539 0))(
  ( (ValueCellFull!15539 (v!19099 V!48907)) (EmptyCell!15539) )
))
(declare-datatypes ((array!82867 0))(
  ( (array!82868 (arr!39966 (Array (_ BitVec 32) ValueCell!15539)) (size!40503 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82867)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82869 0))(
  ( (array!82870 (arr!39967 (Array (_ BitVec 32) (_ BitVec 64))) (size!40504 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82869)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271052 (= res!845520 (and (= (size!40503 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40504 _keys!1364) (size!40503 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271053 () Bool)

(declare-fun res!845519 () Bool)

(assert (=> b!1271053 (=> (not res!845519) (not e!724567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82869 (_ BitVec 32)) Bool)

(assert (=> b!1271053 (= res!845519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50758 () Bool)

(declare-fun mapRes!50758 () Bool)

(assert (=> mapIsEmpty!50758 mapRes!50758))

(declare-fun b!1271054 () Bool)

(declare-fun e!724568 () Bool)

(declare-fun e!724570 () Bool)

(assert (=> b!1271054 (= e!724568 (and e!724570 mapRes!50758))))

(declare-fun condMapEmpty!50758 () Bool)

(declare-fun mapDefault!50758 () ValueCell!15539)

(assert (=> b!1271054 (= condMapEmpty!50758 (= (arr!39966 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15539)) mapDefault!50758)))))

(declare-fun b!1271055 () Bool)

(declare-fun res!845516 () Bool)

(assert (=> b!1271055 (=> (not res!845516) (not e!724567))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271055 (= res!845516 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40504 _keys!1364)) (bvslt from!1698 (size!40504 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271056 () Bool)

(assert (=> b!1271056 (= e!724567 (not true))))

(declare-fun minValueAfter!52 () V!48907)

(declare-fun minValueBefore!52 () V!48907)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48907)

(declare-fun zeroValueBefore!52 () V!48907)

(declare-datatypes ((tuple2!21336 0))(
  ( (tuple2!21337 (_1!10679 (_ BitVec 64)) (_2!10679 V!48907)) )
))
(declare-datatypes ((List!28480 0))(
  ( (Nil!28477) (Cons!28476 (h!29694 tuple2!21336) (t!42001 List!28480)) )
))
(declare-datatypes ((ListLongMap!19073 0))(
  ( (ListLongMap!19074 (toList!9552 List!28480)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5924 (array!82869 array!82867 (_ BitVec 32) (_ BitVec 32) V!48907 V!48907 (_ BitVec 32) Int) ListLongMap!19073)

(assert (=> b!1271056 (= (getCurrentListMapNoExtraKeys!5924 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5924 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42245 0))(
  ( (Unit!42246) )
))
(declare-fun lt!575098 () Unit!42245)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1214 (array!82869 array!82867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48907 V!48907 V!48907 V!48907 (_ BitVec 32) Int) Unit!42245)

(assert (=> b!1271056 (= lt!575098 (lemmaNoChangeToArrayThenSameMapNoExtras!1214 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!845517 () Bool)

(assert (=> start!107320 (=> (not res!845517) (not e!724567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107320 (= res!845517 (validMask!0 mask!1730))))

(assert (=> start!107320 e!724567))

(declare-fun array_inv!30577 (array!82867) Bool)

(assert (=> start!107320 (and (array_inv!30577 _values!1134) e!724568)))

(assert (=> start!107320 true))

(declare-fun array_inv!30578 (array!82869) Bool)

(assert (=> start!107320 (array_inv!30578 _keys!1364)))

(declare-fun tp_is_empty!32785 () Bool)

(assert (=> start!107320 tp_is_empty!32785))

(assert (=> start!107320 tp!97029))

(declare-fun b!1271057 () Bool)

(declare-fun res!845518 () Bool)

(assert (=> b!1271057 (=> (not res!845518) (not e!724567))))

(declare-datatypes ((List!28481 0))(
  ( (Nil!28478) (Cons!28477 (h!29695 (_ BitVec 64)) (t!42002 List!28481)) )
))
(declare-fun arrayNoDuplicates!0 (array!82869 (_ BitVec 32) List!28481) Bool)

(assert (=> b!1271057 (= res!845518 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28478))))

(declare-fun b!1271058 () Bool)

(assert (=> b!1271058 (= e!724570 tp_is_empty!32785)))

(declare-fun mapNonEmpty!50758 () Bool)

(declare-fun tp!97030 () Bool)

(declare-fun e!724566 () Bool)

(assert (=> mapNonEmpty!50758 (= mapRes!50758 (and tp!97030 e!724566))))

(declare-fun mapRest!50758 () (Array (_ BitVec 32) ValueCell!15539))

(declare-fun mapValue!50758 () ValueCell!15539)

(declare-fun mapKey!50758 () (_ BitVec 32))

(assert (=> mapNonEmpty!50758 (= (arr!39966 _values!1134) (store mapRest!50758 mapKey!50758 mapValue!50758))))

(declare-fun b!1271059 () Bool)

(assert (=> b!1271059 (= e!724566 tp_is_empty!32785)))

(assert (= (and start!107320 res!845517) b!1271052))

(assert (= (and b!1271052 res!845520) b!1271053))

(assert (= (and b!1271053 res!845519) b!1271057))

(assert (= (and b!1271057 res!845518) b!1271055))

(assert (= (and b!1271055 res!845516) b!1271056))

(assert (= (and b!1271054 condMapEmpty!50758) mapIsEmpty!50758))

(assert (= (and b!1271054 (not condMapEmpty!50758)) mapNonEmpty!50758))

(get-info :version)

(assert (= (and mapNonEmpty!50758 ((_ is ValueCellFull!15539) mapValue!50758)) b!1271059))

(assert (= (and b!1271054 ((_ is ValueCellFull!15539) mapDefault!50758)) b!1271058))

(assert (= start!107320 b!1271054))

(declare-fun m!1169823 () Bool)

(assert (=> start!107320 m!1169823))

(declare-fun m!1169825 () Bool)

(assert (=> start!107320 m!1169825))

(declare-fun m!1169827 () Bool)

(assert (=> start!107320 m!1169827))

(declare-fun m!1169829 () Bool)

(assert (=> mapNonEmpty!50758 m!1169829))

(declare-fun m!1169831 () Bool)

(assert (=> b!1271053 m!1169831))

(declare-fun m!1169833 () Bool)

(assert (=> b!1271056 m!1169833))

(declare-fun m!1169835 () Bool)

(assert (=> b!1271056 m!1169835))

(declare-fun m!1169837 () Bool)

(assert (=> b!1271056 m!1169837))

(declare-fun m!1169839 () Bool)

(assert (=> b!1271057 m!1169839))

(check-sat b_and!45635 tp_is_empty!32785 (not b_next!27601) (not mapNonEmpty!50758) (not b!1271053) (not start!107320) (not b!1271056) (not b!1271057))
(check-sat b_and!45635 (not b_next!27601))
