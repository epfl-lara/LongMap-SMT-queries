; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107224 () Bool)

(assert start!107224)

(declare-fun res!844900 () Bool)

(declare-fun e!723850 () Bool)

(assert (=> start!107224 (=> (not res!844900) (not e!723850))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107224 (= res!844900 (validMask!0 mask!1730))))

(assert (=> start!107224 e!723850))

(declare-datatypes ((V!48779 0))(
  ( (V!48780 (val!16419 Int)) )
))
(declare-datatypes ((ValueCell!15491 0))(
  ( (ValueCellFull!15491 (v!19051 V!48779)) (EmptyCell!15491) )
))
(declare-datatypes ((array!82691 0))(
  ( (array!82692 (arr!39878 (Array (_ BitVec 32) ValueCell!15491)) (size!40415 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82691)

(declare-fun e!723846 () Bool)

(declare-fun array_inv!30511 (array!82691) Bool)

(assert (=> start!107224 (and (array_inv!30511 _values!1134) e!723846)))

(assert (=> start!107224 true))

(declare-datatypes ((array!82693 0))(
  ( (array!82694 (arr!39879 (Array (_ BitVec 32) (_ BitVec 64))) (size!40416 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82693)

(declare-fun array_inv!30512 (array!82693) Bool)

(assert (=> start!107224 (array_inv!30512 _keys!1364)))

(declare-fun mapNonEmpty!50614 () Bool)

(declare-fun mapRes!50614 () Bool)

(declare-fun tp!96793 () Bool)

(declare-fun e!723849 () Bool)

(assert (=> mapNonEmpty!50614 (= mapRes!50614 (and tp!96793 e!723849))))

(declare-fun mapKey!50614 () (_ BitVec 32))

(declare-fun mapRest!50614 () (Array (_ BitVec 32) ValueCell!15491))

(declare-fun mapValue!50614 () ValueCell!15491)

(assert (=> mapNonEmpty!50614 (= (arr!39878 _values!1134) (store mapRest!50614 mapKey!50614 mapValue!50614))))

(declare-fun b!1270004 () Bool)

(declare-fun e!723848 () Bool)

(assert (=> b!1270004 (= e!723846 (and e!723848 mapRes!50614))))

(declare-fun condMapEmpty!50614 () Bool)

(declare-fun mapDefault!50614 () ValueCell!15491)

(assert (=> b!1270004 (= condMapEmpty!50614 (= (arr!39878 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15491)) mapDefault!50614)))))

(declare-fun b!1270005 () Bool)

(declare-fun tp_is_empty!32689 () Bool)

(assert (=> b!1270005 (= e!723849 tp_is_empty!32689)))

(declare-fun mapIsEmpty!50614 () Bool)

(assert (=> mapIsEmpty!50614 mapRes!50614))

(declare-fun b!1270006 () Bool)

(assert (=> b!1270006 (= e!723850 false)))

(declare-fun lt!574954 () Bool)

(declare-datatypes ((List!28426 0))(
  ( (Nil!28423) (Cons!28422 (h!29640 (_ BitVec 64)) (t!41947 List!28426)) )
))
(declare-fun arrayNoDuplicates!0 (array!82693 (_ BitVec 32) List!28426) Bool)

(assert (=> b!1270006 (= lt!574954 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28423))))

(declare-fun b!1270007 () Bool)

(declare-fun res!844901 () Bool)

(assert (=> b!1270007 (=> (not res!844901) (not e!723850))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270007 (= res!844901 (and (= (size!40415 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40416 _keys!1364) (size!40415 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270008 () Bool)

(declare-fun res!844902 () Bool)

(assert (=> b!1270008 (=> (not res!844902) (not e!723850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82693 (_ BitVec 32)) Bool)

(assert (=> b!1270008 (= res!844902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270009 () Bool)

(assert (=> b!1270009 (= e!723848 tp_is_empty!32689)))

(assert (= (and start!107224 res!844900) b!1270007))

(assert (= (and b!1270007 res!844901) b!1270008))

(assert (= (and b!1270008 res!844902) b!1270006))

(assert (= (and b!1270004 condMapEmpty!50614) mapIsEmpty!50614))

(assert (= (and b!1270004 (not condMapEmpty!50614)) mapNonEmpty!50614))

(get-info :version)

(assert (= (and mapNonEmpty!50614 ((_ is ValueCellFull!15491) mapValue!50614)) b!1270005))

(assert (= (and b!1270004 ((_ is ValueCellFull!15491) mapDefault!50614)) b!1270009))

(assert (= start!107224 b!1270004))

(declare-fun m!1169067 () Bool)

(assert (=> start!107224 m!1169067))

(declare-fun m!1169069 () Bool)

(assert (=> start!107224 m!1169069))

(declare-fun m!1169071 () Bool)

(assert (=> start!107224 m!1169071))

(declare-fun m!1169073 () Bool)

(assert (=> mapNonEmpty!50614 m!1169073))

(declare-fun m!1169075 () Bool)

(assert (=> b!1270006 m!1169075))

(declare-fun m!1169077 () Bool)

(assert (=> b!1270008 m!1169077))

(check-sat (not b!1270006) (not start!107224) tp_is_empty!32689 (not b!1270008) (not mapNonEmpty!50614))
(check-sat)
