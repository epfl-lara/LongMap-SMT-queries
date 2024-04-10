; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106972 () Bool)

(assert start!106972)

(declare-fun b!1268447 () Bool)

(declare-fun e!722789 () Bool)

(declare-fun tp_is_empty!32661 () Bool)

(assert (=> b!1268447 (= e!722789 tp_is_empty!32661)))

(declare-fun mapNonEmpty!50572 () Bool)

(declare-fun mapRes!50572 () Bool)

(declare-fun tp!96751 () Bool)

(assert (=> mapNonEmpty!50572 (= mapRes!50572 (and tp!96751 e!722789))))

(declare-datatypes ((V!48741 0))(
  ( (V!48742 (val!16405 Int)) )
))
(declare-datatypes ((ValueCell!15477 0))(
  ( (ValueCellFull!15477 (v!19042 V!48741)) (EmptyCell!15477) )
))
(declare-datatypes ((array!82596 0))(
  ( (array!82597 (arr!39835 (Array (_ BitVec 32) ValueCell!15477)) (size!40371 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82596)

(declare-fun mapRest!50572 () (Array (_ BitVec 32) ValueCell!15477))

(declare-fun mapKey!50572 () (_ BitVec 32))

(declare-fun mapValue!50572 () ValueCell!15477)

(assert (=> mapNonEmpty!50572 (= (arr!39835 _values!1134) (store mapRest!50572 mapKey!50572 mapValue!50572))))

(declare-fun b!1268448 () Bool)

(declare-fun e!722790 () Bool)

(assert (=> b!1268448 (= e!722790 false)))

(declare-fun lt!574428 () Bool)

(declare-datatypes ((array!82598 0))(
  ( (array!82599 (arr!39836 (Array (_ BitVec 32) (_ BitVec 64))) (size!40372 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82598)

(declare-datatypes ((List!28382 0))(
  ( (Nil!28379) (Cons!28378 (h!29587 (_ BitVec 64)) (t!41911 List!28382)) )
))
(declare-fun arrayNoDuplicates!0 (array!82598 (_ BitVec 32) List!28382) Bool)

(assert (=> b!1268448 (= lt!574428 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28379))))

(declare-fun b!1268449 () Bool)

(declare-fun res!844256 () Bool)

(assert (=> b!1268449 (=> (not res!844256) (not e!722790))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82598 (_ BitVec 32)) Bool)

(assert (=> b!1268449 (= res!844256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844255 () Bool)

(assert (=> start!106972 (=> (not res!844255) (not e!722790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106972 (= res!844255 (validMask!0 mask!1730))))

(assert (=> start!106972 e!722790))

(declare-fun e!722791 () Bool)

(declare-fun array_inv!30311 (array!82596) Bool)

(assert (=> start!106972 (and (array_inv!30311 _values!1134) e!722791)))

(assert (=> start!106972 true))

(declare-fun array_inv!30312 (array!82598) Bool)

(assert (=> start!106972 (array_inv!30312 _keys!1364)))

(declare-fun b!1268450 () Bool)

(declare-fun e!722793 () Bool)

(assert (=> b!1268450 (= e!722791 (and e!722793 mapRes!50572))))

(declare-fun condMapEmpty!50572 () Bool)

(declare-fun mapDefault!50572 () ValueCell!15477)

(assert (=> b!1268450 (= condMapEmpty!50572 (= (arr!39835 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15477)) mapDefault!50572)))))

(declare-fun b!1268451 () Bool)

(assert (=> b!1268451 (= e!722793 tp_is_empty!32661)))

(declare-fun mapIsEmpty!50572 () Bool)

(assert (=> mapIsEmpty!50572 mapRes!50572))

(declare-fun b!1268452 () Bool)

(declare-fun res!844254 () Bool)

(assert (=> b!1268452 (=> (not res!844254) (not e!722790))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268452 (= res!844254 (and (= (size!40371 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40372 _keys!1364) (size!40371 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!106972 res!844255) b!1268452))

(assert (= (and b!1268452 res!844254) b!1268449))

(assert (= (and b!1268449 res!844256) b!1268448))

(assert (= (and b!1268450 condMapEmpty!50572) mapIsEmpty!50572))

(assert (= (and b!1268450 (not condMapEmpty!50572)) mapNonEmpty!50572))

(get-info :version)

(assert (= (and mapNonEmpty!50572 ((_ is ValueCellFull!15477) mapValue!50572)) b!1268447))

(assert (= (and b!1268450 ((_ is ValueCellFull!15477) mapDefault!50572)) b!1268451))

(assert (= start!106972 b!1268450))

(declare-fun m!1167287 () Bool)

(assert (=> mapNonEmpty!50572 m!1167287))

(declare-fun m!1167289 () Bool)

(assert (=> b!1268448 m!1167289))

(declare-fun m!1167291 () Bool)

(assert (=> b!1268449 m!1167291))

(declare-fun m!1167293 () Bool)

(assert (=> start!106972 m!1167293))

(declare-fun m!1167295 () Bool)

(assert (=> start!106972 m!1167295))

(declare-fun m!1167297 () Bool)

(assert (=> start!106972 m!1167297))

(check-sat (not start!106972) (not b!1268448) (not mapNonEmpty!50572) (not b!1268449) tp_is_empty!32661)
(check-sat)
