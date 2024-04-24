; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107392 () Bool)

(assert start!107392)

(declare-fun b!1271840 () Bool)

(declare-fun e!725106 () Bool)

(assert (=> b!1271840 (= e!725106 false)))

(declare-fun lt!575206 () Bool)

(declare-datatypes ((array!83003 0))(
  ( (array!83004 (arr!40034 (Array (_ BitVec 32) (_ BitVec 64))) (size!40571 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83003)

(declare-datatypes ((List!28524 0))(
  ( (Nil!28521) (Cons!28520 (h!29738 (_ BitVec 64)) (t!42045 List!28524)) )
))
(declare-fun arrayNoDuplicates!0 (array!83003 (_ BitVec 32) List!28524) Bool)

(assert (=> b!1271840 (= lt!575206 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28521))))

(declare-fun res!845982 () Bool)

(assert (=> start!107392 (=> (not res!845982) (not e!725106))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107392 (= res!845982 (validMask!0 mask!1730))))

(assert (=> start!107392 e!725106))

(declare-datatypes ((V!49003 0))(
  ( (V!49004 (val!16503 Int)) )
))
(declare-datatypes ((ValueCell!15575 0))(
  ( (ValueCellFull!15575 (v!19135 V!49003)) (EmptyCell!15575) )
))
(declare-datatypes ((array!83005 0))(
  ( (array!83006 (arr!40035 (Array (_ BitVec 32) ValueCell!15575)) (size!40572 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83005)

(declare-fun e!725109 () Bool)

(declare-fun array_inv!30623 (array!83005) Bool)

(assert (=> start!107392 (and (array_inv!30623 _values!1134) e!725109)))

(assert (=> start!107392 true))

(declare-fun array_inv!30624 (array!83003) Bool)

(assert (=> start!107392 (array_inv!30624 _keys!1364)))

(declare-fun mapIsEmpty!50866 () Bool)

(declare-fun mapRes!50866 () Bool)

(assert (=> mapIsEmpty!50866 mapRes!50866))

(declare-fun b!1271841 () Bool)

(declare-fun e!725107 () Bool)

(declare-fun tp_is_empty!32857 () Bool)

(assert (=> b!1271841 (= e!725107 tp_is_empty!32857)))

(declare-fun mapNonEmpty!50866 () Bool)

(declare-fun tp!97207 () Bool)

(declare-fun e!725108 () Bool)

(assert (=> mapNonEmpty!50866 (= mapRes!50866 (and tp!97207 e!725108))))

(declare-fun mapKey!50866 () (_ BitVec 32))

(declare-fun mapRest!50866 () (Array (_ BitVec 32) ValueCell!15575))

(declare-fun mapValue!50866 () ValueCell!15575)

(assert (=> mapNonEmpty!50866 (= (arr!40035 _values!1134) (store mapRest!50866 mapKey!50866 mapValue!50866))))

(declare-fun b!1271842 () Bool)

(declare-fun res!845980 () Bool)

(assert (=> b!1271842 (=> (not res!845980) (not e!725106))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271842 (= res!845980 (and (= (size!40572 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40571 _keys!1364) (size!40572 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271843 () Bool)

(assert (=> b!1271843 (= e!725109 (and e!725107 mapRes!50866))))

(declare-fun condMapEmpty!50866 () Bool)

(declare-fun mapDefault!50866 () ValueCell!15575)

(assert (=> b!1271843 (= condMapEmpty!50866 (= (arr!40035 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15575)) mapDefault!50866)))))

(declare-fun b!1271844 () Bool)

(declare-fun res!845981 () Bool)

(assert (=> b!1271844 (=> (not res!845981) (not e!725106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83003 (_ BitVec 32)) Bool)

(assert (=> b!1271844 (= res!845981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271845 () Bool)

(assert (=> b!1271845 (= e!725108 tp_is_empty!32857)))

(assert (= (and start!107392 res!845982) b!1271842))

(assert (= (and b!1271842 res!845980) b!1271844))

(assert (= (and b!1271844 res!845981) b!1271840))

(assert (= (and b!1271843 condMapEmpty!50866) mapIsEmpty!50866))

(assert (= (and b!1271843 (not condMapEmpty!50866)) mapNonEmpty!50866))

(get-info :version)

(assert (= (and mapNonEmpty!50866 ((_ is ValueCellFull!15575) mapValue!50866)) b!1271845))

(assert (= (and b!1271843 ((_ is ValueCellFull!15575) mapDefault!50866)) b!1271841))

(assert (= start!107392 b!1271843))

(declare-fun m!1170399 () Bool)

(assert (=> b!1271840 m!1170399))

(declare-fun m!1170401 () Bool)

(assert (=> start!107392 m!1170401))

(declare-fun m!1170403 () Bool)

(assert (=> start!107392 m!1170403))

(declare-fun m!1170405 () Bool)

(assert (=> start!107392 m!1170405))

(declare-fun m!1170407 () Bool)

(assert (=> mapNonEmpty!50866 m!1170407))

(declare-fun m!1170409 () Bool)

(assert (=> b!1271844 m!1170409))

(check-sat (not start!107392) tp_is_empty!32857 (not b!1271844) (not mapNonEmpty!50866) (not b!1271840))
(check-sat)
