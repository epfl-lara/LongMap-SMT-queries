; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107186 () Bool)

(assert start!107186)

(declare-fun b!1270633 () Bool)

(declare-fun res!845515 () Bool)

(declare-fun e!724368 () Bool)

(assert (=> b!1270633 (=> (not res!845515) (not e!724368))))

(declare-datatypes ((array!82921 0))(
  ( (array!82922 (arr!39998 (Array (_ BitVec 32) (_ BitVec 64))) (size!40536 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82921)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82921 (_ BitVec 32)) Bool)

(assert (=> b!1270633 (= res!845515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270634 () Bool)

(declare-fun e!724365 () Bool)

(declare-fun tp_is_empty!32875 () Bool)

(assert (=> b!1270634 (= e!724365 tp_is_empty!32875)))

(declare-fun mapIsEmpty!50893 () Bool)

(declare-fun mapRes!50893 () Bool)

(assert (=> mapIsEmpty!50893 mapRes!50893))

(declare-fun b!1270635 () Bool)

(assert (=> b!1270635 (= e!724368 false)))

(declare-fun lt!574571 () Bool)

(declare-datatypes ((List!28575 0))(
  ( (Nil!28572) (Cons!28571 (h!29780 (_ BitVec 64)) (t!42096 List!28575)) )
))
(declare-fun arrayNoDuplicates!0 (array!82921 (_ BitVec 32) List!28575) Bool)

(assert (=> b!1270635 (= lt!574571 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28572))))

(declare-fun b!1270636 () Bool)

(declare-fun res!845516 () Bool)

(assert (=> b!1270636 (=> (not res!845516) (not e!724368))))

(declare-datatypes ((V!49027 0))(
  ( (V!49028 (val!16512 Int)) )
))
(declare-datatypes ((ValueCell!15584 0))(
  ( (ValueCellFull!15584 (v!19148 V!49027)) (EmptyCell!15584) )
))
(declare-datatypes ((array!82923 0))(
  ( (array!82924 (arr!39999 (Array (_ BitVec 32) ValueCell!15584)) (size!40537 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82923)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270636 (= res!845516 (and (= (size!40537 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40536 _keys!1364) (size!40537 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270637 () Bool)

(declare-fun e!724369 () Bool)

(assert (=> b!1270637 (= e!724369 tp_is_empty!32875)))

(declare-fun res!845514 () Bool)

(assert (=> start!107186 (=> (not res!845514) (not e!724368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107186 (= res!845514 (validMask!0 mask!1730))))

(assert (=> start!107186 e!724368))

(declare-fun e!724367 () Bool)

(declare-fun array_inv!30585 (array!82923) Bool)

(assert (=> start!107186 (and (array_inv!30585 _values!1134) e!724367)))

(assert (=> start!107186 true))

(declare-fun array_inv!30586 (array!82921) Bool)

(assert (=> start!107186 (array_inv!30586 _keys!1364)))

(declare-fun b!1270638 () Bool)

(assert (=> b!1270638 (= e!724367 (and e!724369 mapRes!50893))))

(declare-fun condMapEmpty!50893 () Bool)

(declare-fun mapDefault!50893 () ValueCell!15584)

(assert (=> b!1270638 (= condMapEmpty!50893 (= (arr!39999 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15584)) mapDefault!50893)))))

(declare-fun mapNonEmpty!50893 () Bool)

(declare-fun tp!97235 () Bool)

(assert (=> mapNonEmpty!50893 (= mapRes!50893 (and tp!97235 e!724365))))

(declare-fun mapRest!50893 () (Array (_ BitVec 32) ValueCell!15584))

(declare-fun mapKey!50893 () (_ BitVec 32))

(declare-fun mapValue!50893 () ValueCell!15584)

(assert (=> mapNonEmpty!50893 (= (arr!39999 _values!1134) (store mapRest!50893 mapKey!50893 mapValue!50893))))

(assert (= (and start!107186 res!845514) b!1270636))

(assert (= (and b!1270636 res!845516) b!1270633))

(assert (= (and b!1270633 res!845515) b!1270635))

(assert (= (and b!1270638 condMapEmpty!50893) mapIsEmpty!50893))

(assert (= (and b!1270638 (not condMapEmpty!50893)) mapNonEmpty!50893))

(get-info :version)

(assert (= (and mapNonEmpty!50893 ((_ is ValueCellFull!15584) mapValue!50893)) b!1270634))

(assert (= (and b!1270638 ((_ is ValueCellFull!15584) mapDefault!50893)) b!1270637))

(assert (= start!107186 b!1270638))

(declare-fun m!1168395 () Bool)

(assert (=> b!1270633 m!1168395))

(declare-fun m!1168397 () Bool)

(assert (=> b!1270635 m!1168397))

(declare-fun m!1168399 () Bool)

(assert (=> start!107186 m!1168399))

(declare-fun m!1168401 () Bool)

(assert (=> start!107186 m!1168401))

(declare-fun m!1168403 () Bool)

(assert (=> start!107186 m!1168403))

(declare-fun m!1168405 () Bool)

(assert (=> mapNonEmpty!50893 m!1168405))

(check-sat (not start!107186) (not b!1270635) (not b!1270633) (not mapNonEmpty!50893) tp_is_empty!32875)
(check-sat)
