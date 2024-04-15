; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106976 () Bool)

(assert start!106976)

(declare-fun b!1268419 () Bool)

(declare-fun res!844245 () Bool)

(declare-fun e!722791 () Bool)

(assert (=> b!1268419 (=> (not res!844245) (not e!722791))))

(declare-datatypes ((array!82523 0))(
  ( (array!82524 (arr!39799 (Array (_ BitVec 32) (_ BitVec 64))) (size!40337 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82523)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82523 (_ BitVec 32)) Bool)

(assert (=> b!1268419 (= res!844245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50578 () Bool)

(declare-fun mapRes!50578 () Bool)

(assert (=> mapIsEmpty!50578 mapRes!50578))

(declare-fun b!1268420 () Bool)

(declare-fun res!844247 () Bool)

(assert (=> b!1268420 (=> (not res!844247) (not e!722791))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!48747 0))(
  ( (V!48748 (val!16407 Int)) )
))
(declare-datatypes ((ValueCell!15479 0))(
  ( (ValueCellFull!15479 (v!19043 V!48747)) (EmptyCell!15479) )
))
(declare-datatypes ((array!82525 0))(
  ( (array!82526 (arr!39800 (Array (_ BitVec 32) ValueCell!15479)) (size!40338 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82525)

(assert (=> b!1268420 (= res!844247 (and (= (size!40338 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40337 _keys!1364) (size!40338 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844246 () Bool)

(assert (=> start!106976 (=> (not res!844246) (not e!722791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106976 (= res!844246 (validMask!0 mask!1730))))

(assert (=> start!106976 e!722791))

(declare-fun e!722794 () Bool)

(declare-fun array_inv!30449 (array!82525) Bool)

(assert (=> start!106976 (and (array_inv!30449 _values!1134) e!722794)))

(assert (=> start!106976 true))

(declare-fun array_inv!30450 (array!82523) Bool)

(assert (=> start!106976 (array_inv!30450 _keys!1364)))

(declare-fun b!1268421 () Bool)

(declare-fun e!722790 () Bool)

(assert (=> b!1268421 (= e!722794 (and e!722790 mapRes!50578))))

(declare-fun condMapEmpty!50578 () Bool)

(declare-fun mapDefault!50578 () ValueCell!15479)

(assert (=> b!1268421 (= condMapEmpty!50578 (= (arr!39800 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15479)) mapDefault!50578)))))

(declare-fun b!1268422 () Bool)

(assert (=> b!1268422 (= e!722791 false)))

(declare-fun lt!574256 () Bool)

(declare-datatypes ((List!28467 0))(
  ( (Nil!28464) (Cons!28463 (h!29672 (_ BitVec 64)) (t!41988 List!28467)) )
))
(declare-fun arrayNoDuplicates!0 (array!82523 (_ BitVec 32) List!28467) Bool)

(assert (=> b!1268422 (= lt!574256 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28464))))

(declare-fun b!1268423 () Bool)

(declare-fun tp_is_empty!32665 () Bool)

(assert (=> b!1268423 (= e!722790 tp_is_empty!32665)))

(declare-fun mapNonEmpty!50578 () Bool)

(declare-fun tp!96758 () Bool)

(declare-fun e!722793 () Bool)

(assert (=> mapNonEmpty!50578 (= mapRes!50578 (and tp!96758 e!722793))))

(declare-fun mapRest!50578 () (Array (_ BitVec 32) ValueCell!15479))

(declare-fun mapKey!50578 () (_ BitVec 32))

(declare-fun mapValue!50578 () ValueCell!15479)

(assert (=> mapNonEmpty!50578 (= (arr!39800 _values!1134) (store mapRest!50578 mapKey!50578 mapValue!50578))))

(declare-fun b!1268424 () Bool)

(assert (=> b!1268424 (= e!722793 tp_is_empty!32665)))

(assert (= (and start!106976 res!844246) b!1268420))

(assert (= (and b!1268420 res!844247) b!1268419))

(assert (= (and b!1268419 res!844245) b!1268422))

(assert (= (and b!1268421 condMapEmpty!50578) mapIsEmpty!50578))

(assert (= (and b!1268421 (not condMapEmpty!50578)) mapNonEmpty!50578))

(get-info :version)

(assert (= (and mapNonEmpty!50578 ((_ is ValueCellFull!15479) mapValue!50578)) b!1268424))

(assert (= (and b!1268421 ((_ is ValueCellFull!15479) mapDefault!50578)) b!1268423))

(assert (= start!106976 b!1268421))

(declare-fun m!1166811 () Bool)

(assert (=> b!1268419 m!1166811))

(declare-fun m!1166813 () Bool)

(assert (=> start!106976 m!1166813))

(declare-fun m!1166815 () Bool)

(assert (=> start!106976 m!1166815))

(declare-fun m!1166817 () Bool)

(assert (=> start!106976 m!1166817))

(declare-fun m!1166819 () Bool)

(assert (=> b!1268422 m!1166819))

(declare-fun m!1166821 () Bool)

(assert (=> mapNonEmpty!50578 m!1166821))

(check-sat (not mapNonEmpty!50578) (not start!106976) (not b!1268419) (not b!1268422) tp_is_empty!32665)
(check-sat)
