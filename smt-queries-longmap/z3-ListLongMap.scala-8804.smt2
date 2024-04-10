; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107050 () Bool)

(assert start!107050)

(declare-fun b_free!27555 () Bool)

(declare-fun b_next!27555 () Bool)

(assert (=> start!107050 (= b_free!27555 (not b_next!27555))))

(declare-fun tp!96891 () Bool)

(declare-fun b_and!45587 () Bool)

(assert (=> start!107050 (= tp!96891 b_and!45587)))

(declare-fun b!1269195 () Bool)

(declare-fun res!844653 () Bool)

(declare-fun e!723377 () Bool)

(assert (=> b!1269195 (=> (not res!844653) (not e!723377))))

(declare-datatypes ((array!82742 0))(
  ( (array!82743 (arr!39908 (Array (_ BitVec 32) (_ BitVec 64))) (size!40444 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82742)

(declare-datatypes ((List!28414 0))(
  ( (Nil!28411) (Cons!28410 (h!29619 (_ BitVec 64)) (t!41943 List!28414)) )
))
(declare-fun arrayNoDuplicates!0 (array!82742 (_ BitVec 32) List!28414) Bool)

(assert (=> b!1269195 (= res!844653 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28411))))

(declare-fun b!1269196 () Bool)

(declare-fun e!723376 () Bool)

(declare-fun tp_is_empty!32739 () Bool)

(assert (=> b!1269196 (= e!723376 tp_is_empty!32739)))

(declare-fun b!1269197 () Bool)

(declare-fun res!844654 () Bool)

(assert (=> b!1269197 (=> (not res!844654) (not e!723377))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269197 (= res!844654 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40444 _keys!1364)) (bvslt from!1698 (size!40444 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269198 () Bool)

(declare-fun e!723374 () Bool)

(assert (=> b!1269198 (= e!723374 tp_is_empty!32739)))

(declare-fun mapIsEmpty!50689 () Bool)

(declare-fun mapRes!50689 () Bool)

(assert (=> mapIsEmpty!50689 mapRes!50689))

(declare-fun b!1269199 () Bool)

(declare-fun e!723375 () Bool)

(assert (=> b!1269199 (= e!723375 (and e!723376 mapRes!50689))))

(declare-fun condMapEmpty!50689 () Bool)

(declare-datatypes ((V!48845 0))(
  ( (V!48846 (val!16444 Int)) )
))
(declare-datatypes ((ValueCell!15516 0))(
  ( (ValueCellFull!15516 (v!19081 V!48845)) (EmptyCell!15516) )
))
(declare-datatypes ((array!82744 0))(
  ( (array!82745 (arr!39909 (Array (_ BitVec 32) ValueCell!15516)) (size!40445 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82744)

(declare-fun mapDefault!50689 () ValueCell!15516)

(assert (=> b!1269199 (= condMapEmpty!50689 (= (arr!39909 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15516)) mapDefault!50689)))))

(declare-fun b!1269200 () Bool)

(declare-fun res!844655 () Bool)

(assert (=> b!1269200 (=> (not res!844655) (not e!723377))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82742 (_ BitVec 32)) Bool)

(assert (=> b!1269200 (= res!844655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269201 () Bool)

(declare-fun res!844651 () Bool)

(assert (=> b!1269201 (=> (not res!844651) (not e!723377))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269201 (= res!844651 (and (= (size!40445 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40444 _keys!1364) (size!40445 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269202 () Bool)

(assert (=> b!1269202 (= e!723377 (not true))))

(declare-fun minValueAfter!52 () V!48845)

(declare-fun minValueBefore!52 () V!48845)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48845)

(declare-fun zeroValueBefore!52 () V!48845)

(declare-datatypes ((tuple2!21300 0))(
  ( (tuple2!21301 (_1!10661 (_ BitVec 64)) (_2!10661 V!48845)) )
))
(declare-datatypes ((List!28415 0))(
  ( (Nil!28412) (Cons!28411 (h!29620 tuple2!21300) (t!41944 List!28415)) )
))
(declare-datatypes ((ListLongMap!19029 0))(
  ( (ListLongMap!19030 (toList!9530 List!28415)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5862 (array!82742 array!82744 (_ BitVec 32) (_ BitVec 32) V!48845 V!48845 (_ BitVec 32) Int) ListLongMap!19029)

(assert (=> b!1269202 (= (getCurrentListMapNoExtraKeys!5862 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5862 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42246 0))(
  ( (Unit!42247) )
))
(declare-fun lt!574545 () Unit!42246)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1204 (array!82742 array!82744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48845 V!48845 V!48845 V!48845 (_ BitVec 32) Int) Unit!42246)

(assert (=> b!1269202 (= lt!574545 (lemmaNoChangeToArrayThenSameMapNoExtras!1204 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!844652 () Bool)

(assert (=> start!107050 (=> (not res!844652) (not e!723377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107050 (= res!844652 (validMask!0 mask!1730))))

(assert (=> start!107050 e!723377))

(declare-fun array_inv!30363 (array!82744) Bool)

(assert (=> start!107050 (and (array_inv!30363 _values!1134) e!723375)))

(assert (=> start!107050 true))

(declare-fun array_inv!30364 (array!82742) Bool)

(assert (=> start!107050 (array_inv!30364 _keys!1364)))

(assert (=> start!107050 tp_is_empty!32739))

(assert (=> start!107050 tp!96891))

(declare-fun mapNonEmpty!50689 () Bool)

(declare-fun tp!96892 () Bool)

(assert (=> mapNonEmpty!50689 (= mapRes!50689 (and tp!96892 e!723374))))

(declare-fun mapKey!50689 () (_ BitVec 32))

(declare-fun mapValue!50689 () ValueCell!15516)

(declare-fun mapRest!50689 () (Array (_ BitVec 32) ValueCell!15516))

(assert (=> mapNonEmpty!50689 (= (arr!39909 _values!1134) (store mapRest!50689 mapKey!50689 mapValue!50689))))

(assert (= (and start!107050 res!844652) b!1269201))

(assert (= (and b!1269201 res!844651) b!1269200))

(assert (= (and b!1269200 res!844655) b!1269195))

(assert (= (and b!1269195 res!844653) b!1269197))

(assert (= (and b!1269197 res!844654) b!1269202))

(assert (= (and b!1269199 condMapEmpty!50689) mapIsEmpty!50689))

(assert (= (and b!1269199 (not condMapEmpty!50689)) mapNonEmpty!50689))

(get-info :version)

(assert (= (and mapNonEmpty!50689 ((_ is ValueCellFull!15516) mapValue!50689)) b!1269198))

(assert (= (and b!1269199 ((_ is ValueCellFull!15516) mapDefault!50689)) b!1269196))

(assert (= start!107050 b!1269199))

(declare-fun m!1167797 () Bool)

(assert (=> b!1269202 m!1167797))

(declare-fun m!1167799 () Bool)

(assert (=> b!1269202 m!1167799))

(declare-fun m!1167801 () Bool)

(assert (=> b!1269202 m!1167801))

(declare-fun m!1167803 () Bool)

(assert (=> start!107050 m!1167803))

(declare-fun m!1167805 () Bool)

(assert (=> start!107050 m!1167805))

(declare-fun m!1167807 () Bool)

(assert (=> start!107050 m!1167807))

(declare-fun m!1167809 () Bool)

(assert (=> mapNonEmpty!50689 m!1167809))

(declare-fun m!1167811 () Bool)

(assert (=> b!1269200 m!1167811))

(declare-fun m!1167813 () Bool)

(assert (=> b!1269195 m!1167813))

(check-sat (not mapNonEmpty!50689) tp_is_empty!32739 b_and!45587 (not b!1269202) (not start!107050) (not b!1269200) (not b_next!27555) (not b!1269195))
(check-sat b_and!45587 (not b_next!27555))
