; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107188 () Bool)

(assert start!107188)

(declare-fun b!1270715 () Bool)

(declare-fun res!845551 () Bool)

(declare-fun e!724413 () Bool)

(assert (=> b!1270715 (=> (not res!845551) (not e!724413))))

(declare-datatypes ((V!49029 0))(
  ( (V!49030 (val!16513 Int)) )
))
(declare-datatypes ((ValueCell!15585 0))(
  ( (ValueCellFull!15585 (v!19150 V!49029)) (EmptyCell!15585) )
))
(declare-datatypes ((array!83012 0))(
  ( (array!83013 (arr!40043 (Array (_ BitVec 32) ValueCell!15585)) (size!40579 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83012)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83014 0))(
  ( (array!83015 (arr!40044 (Array (_ BitVec 32) (_ BitVec 64))) (size!40580 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83014)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270715 (= res!845551 (and (= (size!40579 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40580 _keys!1364) (size!40579 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270716 () Bool)

(declare-fun e!724411 () Bool)

(declare-fun tp_is_empty!32877 () Bool)

(assert (=> b!1270716 (= e!724411 tp_is_empty!32877)))

(declare-fun b!1270717 () Bool)

(declare-fun res!845550 () Bool)

(assert (=> b!1270717 (=> (not res!845550) (not e!724413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83014 (_ BitVec 32)) Bool)

(assert (=> b!1270717 (= res!845550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50896 () Bool)

(declare-fun mapRes!50896 () Bool)

(assert (=> mapIsEmpty!50896 mapRes!50896))

(declare-fun b!1270718 () Bool)

(declare-fun e!724410 () Bool)

(assert (=> b!1270718 (= e!724410 tp_is_empty!32877)))

(declare-fun b!1270720 () Bool)

(declare-fun e!724409 () Bool)

(assert (=> b!1270720 (= e!724409 (and e!724411 mapRes!50896))))

(declare-fun condMapEmpty!50896 () Bool)

(declare-fun mapDefault!50896 () ValueCell!15585)

(assert (=> b!1270720 (= condMapEmpty!50896 (= (arr!40043 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15585)) mapDefault!50896)))))

(declare-fun mapNonEmpty!50896 () Bool)

(declare-fun tp!97237 () Bool)

(assert (=> mapNonEmpty!50896 (= mapRes!50896 (and tp!97237 e!724410))))

(declare-fun mapValue!50896 () ValueCell!15585)

(declare-fun mapRest!50896 () (Array (_ BitVec 32) ValueCell!15585))

(declare-fun mapKey!50896 () (_ BitVec 32))

(assert (=> mapNonEmpty!50896 (= (arr!40043 _values!1134) (store mapRest!50896 mapKey!50896 mapValue!50896))))

(declare-fun res!845552 () Bool)

(assert (=> start!107188 (=> (not res!845552) (not e!724413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107188 (= res!845552 (validMask!0 mask!1730))))

(assert (=> start!107188 e!724413))

(declare-fun array_inv!30459 (array!83012) Bool)

(assert (=> start!107188 (and (array_inv!30459 _values!1134) e!724409)))

(assert (=> start!107188 true))

(declare-fun array_inv!30460 (array!83014) Bool)

(assert (=> start!107188 (array_inv!30460 _keys!1364)))

(declare-fun b!1270719 () Bool)

(assert (=> b!1270719 (= e!724413 false)))

(declare-fun lt!574752 () Bool)

(declare-datatypes ((List!28499 0))(
  ( (Nil!28496) (Cons!28495 (h!29704 (_ BitVec 64)) (t!42028 List!28499)) )
))
(declare-fun arrayNoDuplicates!0 (array!83014 (_ BitVec 32) List!28499) Bool)

(assert (=> b!1270719 (= lt!574752 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28496))))

(assert (= (and start!107188 res!845552) b!1270715))

(assert (= (and b!1270715 res!845551) b!1270717))

(assert (= (and b!1270717 res!845550) b!1270719))

(assert (= (and b!1270720 condMapEmpty!50896) mapIsEmpty!50896))

(assert (= (and b!1270720 (not condMapEmpty!50896)) mapNonEmpty!50896))

(get-info :version)

(assert (= (and mapNonEmpty!50896 ((_ is ValueCellFull!15585) mapValue!50896)) b!1270718))

(assert (= (and b!1270720 ((_ is ValueCellFull!15585) mapDefault!50896)) b!1270716))

(assert (= start!107188 b!1270720))

(declare-fun m!1168907 () Bool)

(assert (=> b!1270717 m!1168907))

(declare-fun m!1168909 () Bool)

(assert (=> mapNonEmpty!50896 m!1168909))

(declare-fun m!1168911 () Bool)

(assert (=> start!107188 m!1168911))

(declare-fun m!1168913 () Bool)

(assert (=> start!107188 m!1168913))

(declare-fun m!1168915 () Bool)

(assert (=> start!107188 m!1168915))

(declare-fun m!1168917 () Bool)

(assert (=> b!1270719 m!1168917))

(check-sat (not start!107188) (not mapNonEmpty!50896) (not b!1270717) (not b!1270719) tp_is_empty!32877)
(check-sat)
