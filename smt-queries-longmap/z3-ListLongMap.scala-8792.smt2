; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107200 () Bool)

(assert start!107200)

(declare-fun b!1269788 () Bool)

(declare-fun e!723669 () Bool)

(declare-fun tp_is_empty!32665 () Bool)

(assert (=> b!1269788 (= e!723669 tp_is_empty!32665)))

(declare-fun res!844794 () Bool)

(declare-fun e!723667 () Bool)

(assert (=> start!107200 (=> (not res!844794) (not e!723667))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107200 (= res!844794 (validMask!0 mask!1730))))

(assert (=> start!107200 e!723667))

(declare-datatypes ((V!48747 0))(
  ( (V!48748 (val!16407 Int)) )
))
(declare-datatypes ((ValueCell!15479 0))(
  ( (ValueCellFull!15479 (v!19039 V!48747)) (EmptyCell!15479) )
))
(declare-datatypes ((array!82647 0))(
  ( (array!82648 (arr!39856 (Array (_ BitVec 32) ValueCell!15479)) (size!40393 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82647)

(declare-fun e!723668 () Bool)

(declare-fun array_inv!30495 (array!82647) Bool)

(assert (=> start!107200 (and (array_inv!30495 _values!1134) e!723668)))

(assert (=> start!107200 true))

(declare-datatypes ((array!82649 0))(
  ( (array!82650 (arr!39857 (Array (_ BitVec 32) (_ BitVec 64))) (size!40394 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82649)

(declare-fun array_inv!30496 (array!82649) Bool)

(assert (=> start!107200 (array_inv!30496 _keys!1364)))

(declare-fun b!1269789 () Bool)

(declare-fun res!844793 () Bool)

(assert (=> b!1269789 (=> (not res!844793) (not e!723667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82649 (_ BitVec 32)) Bool)

(assert (=> b!1269789 (= res!844793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269790 () Bool)

(declare-fun res!844792 () Bool)

(assert (=> b!1269790 (=> (not res!844792) (not e!723667))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269790 (= res!844792 (and (= (size!40393 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40394 _keys!1364) (size!40393 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269791 () Bool)

(declare-fun e!723666 () Bool)

(declare-fun mapRes!50578 () Bool)

(assert (=> b!1269791 (= e!723668 (and e!723666 mapRes!50578))))

(declare-fun condMapEmpty!50578 () Bool)

(declare-fun mapDefault!50578 () ValueCell!15479)

(assert (=> b!1269791 (= condMapEmpty!50578 (= (arr!39856 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15479)) mapDefault!50578)))))

(declare-fun mapNonEmpty!50578 () Bool)

(declare-fun tp!96757 () Bool)

(assert (=> mapNonEmpty!50578 (= mapRes!50578 (and tp!96757 e!723669))))

(declare-fun mapRest!50578 () (Array (_ BitVec 32) ValueCell!15479))

(declare-fun mapKey!50578 () (_ BitVec 32))

(declare-fun mapValue!50578 () ValueCell!15479)

(assert (=> mapNonEmpty!50578 (= (arr!39856 _values!1134) (store mapRest!50578 mapKey!50578 mapValue!50578))))

(declare-fun mapIsEmpty!50578 () Bool)

(assert (=> mapIsEmpty!50578 mapRes!50578))

(declare-fun b!1269792 () Bool)

(assert (=> b!1269792 (= e!723667 false)))

(declare-fun lt!574918 () Bool)

(declare-datatypes ((List!28417 0))(
  ( (Nil!28414) (Cons!28413 (h!29631 (_ BitVec 64)) (t!41938 List!28417)) )
))
(declare-fun arrayNoDuplicates!0 (array!82649 (_ BitVec 32) List!28417) Bool)

(assert (=> b!1269792 (= lt!574918 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28414))))

(declare-fun b!1269793 () Bool)

(assert (=> b!1269793 (= e!723666 tp_is_empty!32665)))

(assert (= (and start!107200 res!844794) b!1269790))

(assert (= (and b!1269790 res!844792) b!1269789))

(assert (= (and b!1269789 res!844793) b!1269792))

(assert (= (and b!1269791 condMapEmpty!50578) mapIsEmpty!50578))

(assert (= (and b!1269791 (not condMapEmpty!50578)) mapNonEmpty!50578))

(get-info :version)

(assert (= (and mapNonEmpty!50578 ((_ is ValueCellFull!15479) mapValue!50578)) b!1269788))

(assert (= (and b!1269791 ((_ is ValueCellFull!15479) mapDefault!50578)) b!1269793))

(assert (= start!107200 b!1269791))

(declare-fun m!1168923 () Bool)

(assert (=> start!107200 m!1168923))

(declare-fun m!1168925 () Bool)

(assert (=> start!107200 m!1168925))

(declare-fun m!1168927 () Bool)

(assert (=> start!107200 m!1168927))

(declare-fun m!1168929 () Bool)

(assert (=> b!1269789 m!1168929))

(declare-fun m!1168931 () Bool)

(assert (=> mapNonEmpty!50578 m!1168931))

(declare-fun m!1168933 () Bool)

(assert (=> b!1269792 m!1168933))

(check-sat (not b!1269789) (not mapNonEmpty!50578) (not start!107200) tp_is_empty!32665 (not b!1269792))
(check-sat)
