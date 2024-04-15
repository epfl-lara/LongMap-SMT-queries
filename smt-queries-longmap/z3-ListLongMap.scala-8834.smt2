; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107228 () Bool)

(assert start!107228)

(declare-fun mapIsEmpty!50956 () Bool)

(declare-fun mapRes!50956 () Bool)

(assert (=> mapIsEmpty!50956 mapRes!50956))

(declare-fun b!1271011 () Bool)

(declare-fun e!724681 () Bool)

(assert (=> b!1271011 (= e!724681 false)))

(declare-fun lt!574634 () Bool)

(declare-datatypes ((array!83003 0))(
  ( (array!83004 (arr!40039 (Array (_ BitVec 32) (_ BitVec 64))) (size!40577 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83003)

(declare-datatypes ((List!28591 0))(
  ( (Nil!28588) (Cons!28587 (h!29796 (_ BitVec 64)) (t!42112 List!28591)) )
))
(declare-fun arrayNoDuplicates!0 (array!83003 (_ BitVec 32) List!28591) Bool)

(assert (=> b!1271011 (= lt!574634 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28588))))

(declare-fun b!1271012 () Bool)

(declare-fun e!724684 () Bool)

(declare-fun tp_is_empty!32917 () Bool)

(assert (=> b!1271012 (= e!724684 tp_is_empty!32917)))

(declare-fun mapNonEmpty!50956 () Bool)

(declare-fun tp!97298 () Bool)

(assert (=> mapNonEmpty!50956 (= mapRes!50956 (and tp!97298 e!724684))))

(declare-datatypes ((V!49083 0))(
  ( (V!49084 (val!16533 Int)) )
))
(declare-datatypes ((ValueCell!15605 0))(
  ( (ValueCellFull!15605 (v!19169 V!49083)) (EmptyCell!15605) )
))
(declare-datatypes ((array!83005 0))(
  ( (array!83006 (arr!40040 (Array (_ BitVec 32) ValueCell!15605)) (size!40578 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83005)

(declare-fun mapValue!50956 () ValueCell!15605)

(declare-fun mapKey!50956 () (_ BitVec 32))

(declare-fun mapRest!50956 () (Array (_ BitVec 32) ValueCell!15605))

(assert (=> mapNonEmpty!50956 (= (arr!40040 _values!1134) (store mapRest!50956 mapKey!50956 mapValue!50956))))

(declare-fun res!845704 () Bool)

(assert (=> start!107228 (=> (not res!845704) (not e!724681))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107228 (= res!845704 (validMask!0 mask!1730))))

(assert (=> start!107228 e!724681))

(declare-fun e!724680 () Bool)

(declare-fun array_inv!30611 (array!83005) Bool)

(assert (=> start!107228 (and (array_inv!30611 _values!1134) e!724680)))

(assert (=> start!107228 true))

(declare-fun array_inv!30612 (array!83003) Bool)

(assert (=> start!107228 (array_inv!30612 _keys!1364)))

(declare-fun b!1271013 () Bool)

(declare-fun res!845703 () Bool)

(assert (=> b!1271013 (=> (not res!845703) (not e!724681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83003 (_ BitVec 32)) Bool)

(assert (=> b!1271013 (= res!845703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271014 () Bool)

(declare-fun res!845705 () Bool)

(assert (=> b!1271014 (=> (not res!845705) (not e!724681))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1271014 (= res!845705 (and (= (size!40578 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40577 _keys!1364) (size!40578 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271015 () Bool)

(declare-fun e!724682 () Bool)

(assert (=> b!1271015 (= e!724680 (and e!724682 mapRes!50956))))

(declare-fun condMapEmpty!50956 () Bool)

(declare-fun mapDefault!50956 () ValueCell!15605)

(assert (=> b!1271015 (= condMapEmpty!50956 (= (arr!40040 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15605)) mapDefault!50956)))))

(declare-fun b!1271016 () Bool)

(assert (=> b!1271016 (= e!724682 tp_is_empty!32917)))

(assert (= (and start!107228 res!845704) b!1271014))

(assert (= (and b!1271014 res!845705) b!1271013))

(assert (= (and b!1271013 res!845703) b!1271011))

(assert (= (and b!1271015 condMapEmpty!50956) mapIsEmpty!50956))

(assert (= (and b!1271015 (not condMapEmpty!50956)) mapNonEmpty!50956))

(get-info :version)

(assert (= (and mapNonEmpty!50956 ((_ is ValueCellFull!15605) mapValue!50956)) b!1271012))

(assert (= (and b!1271015 ((_ is ValueCellFull!15605) mapDefault!50956)) b!1271016))

(assert (= start!107228 b!1271015))

(declare-fun m!1168647 () Bool)

(assert (=> b!1271011 m!1168647))

(declare-fun m!1168649 () Bool)

(assert (=> mapNonEmpty!50956 m!1168649))

(declare-fun m!1168651 () Bool)

(assert (=> start!107228 m!1168651))

(declare-fun m!1168653 () Bool)

(assert (=> start!107228 m!1168653))

(declare-fun m!1168655 () Bool)

(assert (=> start!107228 m!1168655))

(declare-fun m!1168657 () Bool)

(assert (=> b!1271013 m!1168657))

(check-sat (not start!107228) tp_is_empty!32917 (not b!1271011) (not mapNonEmpty!50956) (not b!1271013))
(check-sat)
