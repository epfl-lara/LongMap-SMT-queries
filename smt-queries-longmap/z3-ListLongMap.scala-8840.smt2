; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107264 () Bool)

(assert start!107264)

(declare-fun mapIsEmpty!51010 () Bool)

(declare-fun mapRes!51010 () Bool)

(assert (=> mapIsEmpty!51010 mapRes!51010))

(declare-fun b!1271335 () Bool)

(declare-fun res!845867 () Bool)

(declare-fun e!724954 () Bool)

(assert (=> b!1271335 (=> (not res!845867) (not e!724954))))

(declare-datatypes ((array!83069 0))(
  ( (array!83070 (arr!40072 (Array (_ BitVec 32) (_ BitVec 64))) (size!40610 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83069)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83069 (_ BitVec 32)) Bool)

(assert (=> b!1271335 (= res!845867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271336 () Bool)

(declare-fun res!845866 () Bool)

(assert (=> b!1271336 (=> (not res!845866) (not e!724954))))

(declare-datatypes ((V!49131 0))(
  ( (V!49132 (val!16551 Int)) )
))
(declare-datatypes ((ValueCell!15623 0))(
  ( (ValueCellFull!15623 (v!19187 V!49131)) (EmptyCell!15623) )
))
(declare-datatypes ((array!83071 0))(
  ( (array!83072 (arr!40073 (Array (_ BitVec 32) ValueCell!15623)) (size!40611 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83071)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271336 (= res!845866 (and (= (size!40611 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40610 _keys!1364) (size!40611 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271337 () Bool)

(declare-fun e!724950 () Bool)

(declare-fun e!724952 () Bool)

(assert (=> b!1271337 (= e!724950 (and e!724952 mapRes!51010))))

(declare-fun condMapEmpty!51010 () Bool)

(declare-fun mapDefault!51010 () ValueCell!15623)

(assert (=> b!1271337 (= condMapEmpty!51010 (= (arr!40073 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15623)) mapDefault!51010)))))

(declare-fun b!1271338 () Bool)

(assert (=> b!1271338 (= e!724954 false)))

(declare-fun lt!574688 () Bool)

(declare-datatypes ((List!28602 0))(
  ( (Nil!28599) (Cons!28598 (h!29807 (_ BitVec 64)) (t!42123 List!28602)) )
))
(declare-fun arrayNoDuplicates!0 (array!83069 (_ BitVec 32) List!28602) Bool)

(assert (=> b!1271338 (= lt!574688 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28599))))

(declare-fun mapNonEmpty!51010 () Bool)

(declare-fun tp!97352 () Bool)

(declare-fun e!724951 () Bool)

(assert (=> mapNonEmpty!51010 (= mapRes!51010 (and tp!97352 e!724951))))

(declare-fun mapKey!51010 () (_ BitVec 32))

(declare-fun mapValue!51010 () ValueCell!15623)

(declare-fun mapRest!51010 () (Array (_ BitVec 32) ValueCell!15623))

(assert (=> mapNonEmpty!51010 (= (arr!40073 _values!1134) (store mapRest!51010 mapKey!51010 mapValue!51010))))

(declare-fun b!1271339 () Bool)

(declare-fun tp_is_empty!32953 () Bool)

(assert (=> b!1271339 (= e!724951 tp_is_empty!32953)))

(declare-fun b!1271340 () Bool)

(assert (=> b!1271340 (= e!724952 tp_is_empty!32953)))

(declare-fun res!845865 () Bool)

(assert (=> start!107264 (=> (not res!845865) (not e!724954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107264 (= res!845865 (validMask!0 mask!1730))))

(assert (=> start!107264 e!724954))

(declare-fun array_inv!30635 (array!83071) Bool)

(assert (=> start!107264 (and (array_inv!30635 _values!1134) e!724950)))

(assert (=> start!107264 true))

(declare-fun array_inv!30636 (array!83069) Bool)

(assert (=> start!107264 (array_inv!30636 _keys!1364)))

(assert (= (and start!107264 res!845865) b!1271336))

(assert (= (and b!1271336 res!845866) b!1271335))

(assert (= (and b!1271335 res!845867) b!1271338))

(assert (= (and b!1271337 condMapEmpty!51010) mapIsEmpty!51010))

(assert (= (and b!1271337 (not condMapEmpty!51010)) mapNonEmpty!51010))

(get-info :version)

(assert (= (and mapNonEmpty!51010 ((_ is ValueCellFull!15623) mapValue!51010)) b!1271339))

(assert (= (and b!1271337 ((_ is ValueCellFull!15623) mapDefault!51010)) b!1271340))

(assert (= start!107264 b!1271337))

(declare-fun m!1168863 () Bool)

(assert (=> b!1271335 m!1168863))

(declare-fun m!1168865 () Bool)

(assert (=> b!1271338 m!1168865))

(declare-fun m!1168867 () Bool)

(assert (=> mapNonEmpty!51010 m!1168867))

(declare-fun m!1168869 () Bool)

(assert (=> start!107264 m!1168869))

(declare-fun m!1168871 () Bool)

(assert (=> start!107264 m!1168871))

(declare-fun m!1168873 () Bool)

(assert (=> start!107264 m!1168873))

(check-sat (not start!107264) (not mapNonEmpty!51010) (not b!1271338) tp_is_empty!32953 (not b!1271335))
(check-sat)
