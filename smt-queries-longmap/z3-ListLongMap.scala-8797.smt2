; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107230 () Bool)

(assert start!107230)

(declare-fun b!1270058 () Bool)

(declare-fun res!844927 () Bool)

(declare-fun e!723894 () Bool)

(assert (=> b!1270058 (=> (not res!844927) (not e!723894))))

(declare-datatypes ((V!48787 0))(
  ( (V!48788 (val!16422 Int)) )
))
(declare-datatypes ((ValueCell!15494 0))(
  ( (ValueCellFull!15494 (v!19054 V!48787)) (EmptyCell!15494) )
))
(declare-datatypes ((array!82703 0))(
  ( (array!82704 (arr!39884 (Array (_ BitVec 32) ValueCell!15494)) (size!40421 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82703)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((array!82705 0))(
  ( (array!82706 (arr!39885 (Array (_ BitVec 32) (_ BitVec 64))) (size!40422 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82705)

(assert (=> b!1270058 (= res!844927 (and (= (size!40421 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40422 _keys!1364) (size!40421 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270059 () Bool)

(declare-fun e!723895 () Bool)

(declare-fun e!723891 () Bool)

(declare-fun mapRes!50623 () Bool)

(assert (=> b!1270059 (= e!723895 (and e!723891 mapRes!50623))))

(declare-fun condMapEmpty!50623 () Bool)

(declare-fun mapDefault!50623 () ValueCell!15494)

(assert (=> b!1270059 (= condMapEmpty!50623 (= (arr!39884 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15494)) mapDefault!50623)))))

(declare-fun res!844928 () Bool)

(assert (=> start!107230 (=> (not res!844928) (not e!723894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107230 (= res!844928 (validMask!0 mask!1730))))

(assert (=> start!107230 e!723894))

(declare-fun array_inv!30515 (array!82703) Bool)

(assert (=> start!107230 (and (array_inv!30515 _values!1134) e!723895)))

(assert (=> start!107230 true))

(declare-fun array_inv!30516 (array!82705) Bool)

(assert (=> start!107230 (array_inv!30516 _keys!1364)))

(declare-fun mapIsEmpty!50623 () Bool)

(assert (=> mapIsEmpty!50623 mapRes!50623))

(declare-fun b!1270060 () Bool)

(declare-fun res!844929 () Bool)

(assert (=> b!1270060 (=> (not res!844929) (not e!723894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82705 (_ BitVec 32)) Bool)

(assert (=> b!1270060 (= res!844929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270061 () Bool)

(declare-fun tp_is_empty!32695 () Bool)

(assert (=> b!1270061 (= e!723891 tp_is_empty!32695)))

(declare-fun b!1270062 () Bool)

(declare-fun e!723892 () Bool)

(assert (=> b!1270062 (= e!723892 tp_is_empty!32695)))

(declare-fun b!1270063 () Bool)

(assert (=> b!1270063 (= e!723894 false)))

(declare-fun lt!574963 () Bool)

(declare-datatypes ((List!28429 0))(
  ( (Nil!28426) (Cons!28425 (h!29643 (_ BitVec 64)) (t!41950 List!28429)) )
))
(declare-fun arrayNoDuplicates!0 (array!82705 (_ BitVec 32) List!28429) Bool)

(assert (=> b!1270063 (= lt!574963 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28426))))

(declare-fun mapNonEmpty!50623 () Bool)

(declare-fun tp!96802 () Bool)

(assert (=> mapNonEmpty!50623 (= mapRes!50623 (and tp!96802 e!723892))))

(declare-fun mapValue!50623 () ValueCell!15494)

(declare-fun mapRest!50623 () (Array (_ BitVec 32) ValueCell!15494))

(declare-fun mapKey!50623 () (_ BitVec 32))

(assert (=> mapNonEmpty!50623 (= (arr!39884 _values!1134) (store mapRest!50623 mapKey!50623 mapValue!50623))))

(assert (= (and start!107230 res!844928) b!1270058))

(assert (= (and b!1270058 res!844927) b!1270060))

(assert (= (and b!1270060 res!844929) b!1270063))

(assert (= (and b!1270059 condMapEmpty!50623) mapIsEmpty!50623))

(assert (= (and b!1270059 (not condMapEmpty!50623)) mapNonEmpty!50623))

(get-info :version)

(assert (= (and mapNonEmpty!50623 ((_ is ValueCellFull!15494) mapValue!50623)) b!1270062))

(assert (= (and b!1270059 ((_ is ValueCellFull!15494) mapDefault!50623)) b!1270061))

(assert (= start!107230 b!1270059))

(declare-fun m!1169103 () Bool)

(assert (=> start!107230 m!1169103))

(declare-fun m!1169105 () Bool)

(assert (=> start!107230 m!1169105))

(declare-fun m!1169107 () Bool)

(assert (=> start!107230 m!1169107))

(declare-fun m!1169109 () Bool)

(assert (=> b!1270060 m!1169109))

(declare-fun m!1169111 () Bool)

(assert (=> b!1270063 m!1169111))

(declare-fun m!1169113 () Bool)

(assert (=> mapNonEmpty!50623 m!1169113))

(check-sat tp_is_empty!32695 (not b!1270063) (not b!1270060) (not start!107230) (not mapNonEmpty!50623))
(check-sat)
