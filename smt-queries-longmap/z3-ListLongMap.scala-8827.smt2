; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107410 () Bool)

(assert start!107410)

(declare-fun b!1272002 () Bool)

(declare-fun res!846062 () Bool)

(declare-fun e!725242 () Bool)

(assert (=> b!1272002 (=> (not res!846062) (not e!725242))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83037 0))(
  ( (array!83038 (arr!40051 (Array (_ BitVec 32) (_ BitVec 64))) (size!40588 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83037)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!49027 0))(
  ( (V!49028 (val!16512 Int)) )
))
(declare-datatypes ((ValueCell!15584 0))(
  ( (ValueCellFull!15584 (v!19144 V!49027)) (EmptyCell!15584) )
))
(declare-datatypes ((array!83039 0))(
  ( (array!83040 (arr!40052 (Array (_ BitVec 32) ValueCell!15584)) (size!40589 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83039)

(assert (=> b!1272002 (= res!846062 (and (= (size!40589 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40588 _keys!1364) (size!40589 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272003 () Bool)

(declare-fun e!725244 () Bool)

(declare-fun e!725243 () Bool)

(declare-fun mapRes!50893 () Bool)

(assert (=> b!1272003 (= e!725244 (and e!725243 mapRes!50893))))

(declare-fun condMapEmpty!50893 () Bool)

(declare-fun mapDefault!50893 () ValueCell!15584)

(assert (=> b!1272003 (= condMapEmpty!50893 (= (arr!40052 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15584)) mapDefault!50893)))))

(declare-fun b!1272004 () Bool)

(declare-fun e!725245 () Bool)

(declare-fun tp_is_empty!32875 () Bool)

(assert (=> b!1272004 (= e!725245 tp_is_empty!32875)))

(declare-fun b!1272005 () Bool)

(declare-fun res!846061 () Bool)

(assert (=> b!1272005 (=> (not res!846061) (not e!725242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83037 (_ BitVec 32)) Bool)

(assert (=> b!1272005 (= res!846061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272006 () Bool)

(assert (=> b!1272006 (= e!725243 tp_is_empty!32875)))

(declare-fun mapIsEmpty!50893 () Bool)

(assert (=> mapIsEmpty!50893 mapRes!50893))

(declare-fun mapNonEmpty!50893 () Bool)

(declare-fun tp!97234 () Bool)

(assert (=> mapNonEmpty!50893 (= mapRes!50893 (and tp!97234 e!725245))))

(declare-fun mapKey!50893 () (_ BitVec 32))

(declare-fun mapRest!50893 () (Array (_ BitVec 32) ValueCell!15584))

(declare-fun mapValue!50893 () ValueCell!15584)

(assert (=> mapNonEmpty!50893 (= (arr!40052 _values!1134) (store mapRest!50893 mapKey!50893 mapValue!50893))))

(declare-fun b!1272007 () Bool)

(assert (=> b!1272007 (= e!725242 false)))

(declare-fun lt!575233 () Bool)

(declare-datatypes ((List!28531 0))(
  ( (Nil!28528) (Cons!28527 (h!29745 (_ BitVec 64)) (t!42052 List!28531)) )
))
(declare-fun arrayNoDuplicates!0 (array!83037 (_ BitVec 32) List!28531) Bool)

(assert (=> b!1272007 (= lt!575233 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28528))))

(declare-fun res!846063 () Bool)

(assert (=> start!107410 (=> (not res!846063) (not e!725242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107410 (= res!846063 (validMask!0 mask!1730))))

(assert (=> start!107410 e!725242))

(declare-fun array_inv!30635 (array!83039) Bool)

(assert (=> start!107410 (and (array_inv!30635 _values!1134) e!725244)))

(assert (=> start!107410 true))

(declare-fun array_inv!30636 (array!83037) Bool)

(assert (=> start!107410 (array_inv!30636 _keys!1364)))

(assert (= (and start!107410 res!846063) b!1272002))

(assert (= (and b!1272002 res!846062) b!1272005))

(assert (= (and b!1272005 res!846061) b!1272007))

(assert (= (and b!1272003 condMapEmpty!50893) mapIsEmpty!50893))

(assert (= (and b!1272003 (not condMapEmpty!50893)) mapNonEmpty!50893))

(get-info :version)

(assert (= (and mapNonEmpty!50893 ((_ is ValueCellFull!15584) mapValue!50893)) b!1272004))

(assert (= (and b!1272003 ((_ is ValueCellFull!15584) mapDefault!50893)) b!1272006))

(assert (= start!107410 b!1272003))

(declare-fun m!1170507 () Bool)

(assert (=> b!1272005 m!1170507))

(declare-fun m!1170509 () Bool)

(assert (=> mapNonEmpty!50893 m!1170509))

(declare-fun m!1170511 () Bool)

(assert (=> b!1272007 m!1170511))

(declare-fun m!1170513 () Bool)

(assert (=> start!107410 m!1170513))

(declare-fun m!1170515 () Bool)

(assert (=> start!107410 m!1170515))

(declare-fun m!1170517 () Bool)

(assert (=> start!107410 m!1170517))

(check-sat (not mapNonEmpty!50893) tp_is_empty!32875 (not b!1272007) (not start!107410) (not b!1272005))
(check-sat)
