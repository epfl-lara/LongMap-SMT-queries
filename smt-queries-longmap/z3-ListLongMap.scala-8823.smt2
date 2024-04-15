; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107162 () Bool)

(assert start!107162)

(declare-fun b!1270417 () Bool)

(declare-fun res!845406 () Bool)

(declare-fun e!724185 () Bool)

(assert (=> b!1270417 (=> (not res!845406) (not e!724185))))

(declare-datatypes ((array!82873 0))(
  ( (array!82874 (arr!39974 (Array (_ BitVec 32) (_ BitVec 64))) (size!40512 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82873)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82873 (_ BitVec 32)) Bool)

(assert (=> b!1270417 (= res!845406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50857 () Bool)

(declare-fun mapRes!50857 () Bool)

(assert (=> mapIsEmpty!50857 mapRes!50857))

(declare-fun b!1270419 () Bool)

(declare-fun e!724187 () Bool)

(declare-fun tp_is_empty!32851 () Bool)

(assert (=> b!1270419 (= e!724187 tp_is_empty!32851)))

(declare-fun b!1270420 () Bool)

(declare-fun res!845408 () Bool)

(assert (=> b!1270420 (=> (not res!845408) (not e!724185))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!48995 0))(
  ( (V!48996 (val!16500 Int)) )
))
(declare-datatypes ((ValueCell!15572 0))(
  ( (ValueCellFull!15572 (v!19136 V!48995)) (EmptyCell!15572) )
))
(declare-datatypes ((array!82875 0))(
  ( (array!82876 (arr!39975 (Array (_ BitVec 32) ValueCell!15572)) (size!40513 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82875)

(assert (=> b!1270420 (= res!845408 (and (= (size!40513 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40512 _keys!1364) (size!40513 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50857 () Bool)

(declare-fun tp!97199 () Bool)

(assert (=> mapNonEmpty!50857 (= mapRes!50857 (and tp!97199 e!724187))))

(declare-fun mapKey!50857 () (_ BitVec 32))

(declare-fun mapValue!50857 () ValueCell!15572)

(declare-fun mapRest!50857 () (Array (_ BitVec 32) ValueCell!15572))

(assert (=> mapNonEmpty!50857 (= (arr!39975 _values!1134) (store mapRest!50857 mapKey!50857 mapValue!50857))))

(declare-fun b!1270421 () Bool)

(declare-fun e!724186 () Bool)

(declare-fun e!724188 () Bool)

(assert (=> b!1270421 (= e!724186 (and e!724188 mapRes!50857))))

(declare-fun condMapEmpty!50857 () Bool)

(declare-fun mapDefault!50857 () ValueCell!15572)

(assert (=> b!1270421 (= condMapEmpty!50857 (= (arr!39975 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15572)) mapDefault!50857)))))

(declare-fun b!1270422 () Bool)

(assert (=> b!1270422 (= e!724188 tp_is_empty!32851)))

(declare-fun b!1270418 () Bool)

(assert (=> b!1270418 (= e!724185 false)))

(declare-fun lt!574535 () Bool)

(declare-datatypes ((List!28563 0))(
  ( (Nil!28560) (Cons!28559 (h!29768 (_ BitVec 64)) (t!42084 List!28563)) )
))
(declare-fun arrayNoDuplicates!0 (array!82873 (_ BitVec 32) List!28563) Bool)

(assert (=> b!1270418 (= lt!574535 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28560))))

(declare-fun res!845407 () Bool)

(assert (=> start!107162 (=> (not res!845407) (not e!724185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107162 (= res!845407 (validMask!0 mask!1730))))

(assert (=> start!107162 e!724185))

(declare-fun array_inv!30569 (array!82875) Bool)

(assert (=> start!107162 (and (array_inv!30569 _values!1134) e!724186)))

(assert (=> start!107162 true))

(declare-fun array_inv!30570 (array!82873) Bool)

(assert (=> start!107162 (array_inv!30570 _keys!1364)))

(assert (= (and start!107162 res!845407) b!1270420))

(assert (= (and b!1270420 res!845408) b!1270417))

(assert (= (and b!1270417 res!845406) b!1270418))

(assert (= (and b!1270421 condMapEmpty!50857) mapIsEmpty!50857))

(assert (= (and b!1270421 (not condMapEmpty!50857)) mapNonEmpty!50857))

(get-info :version)

(assert (= (and mapNonEmpty!50857 ((_ is ValueCellFull!15572) mapValue!50857)) b!1270419))

(assert (= (and b!1270421 ((_ is ValueCellFull!15572) mapDefault!50857)) b!1270422))

(assert (= start!107162 b!1270421))

(declare-fun m!1168251 () Bool)

(assert (=> b!1270417 m!1168251))

(declare-fun m!1168253 () Bool)

(assert (=> mapNonEmpty!50857 m!1168253))

(declare-fun m!1168255 () Bool)

(assert (=> b!1270418 m!1168255))

(declare-fun m!1168257 () Bool)

(assert (=> start!107162 m!1168257))

(declare-fun m!1168259 () Bool)

(assert (=> start!107162 m!1168259))

(declare-fun m!1168261 () Bool)

(assert (=> start!107162 m!1168261))

(check-sat (not start!107162) (not b!1270418) tp_is_empty!32851 (not mapNonEmpty!50857) (not b!1270417))
(check-sat)
