; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107246 () Bool)

(assert start!107246)

(declare-fun b!1271173 () Bool)

(declare-fun res!845786 () Bool)

(declare-fun e!724819 () Bool)

(assert (=> b!1271173 (=> (not res!845786) (not e!724819))))

(declare-datatypes ((V!49107 0))(
  ( (V!49108 (val!16542 Int)) )
))
(declare-datatypes ((ValueCell!15614 0))(
  ( (ValueCellFull!15614 (v!19178 V!49107)) (EmptyCell!15614) )
))
(declare-datatypes ((array!83035 0))(
  ( (array!83036 (arr!40055 (Array (_ BitVec 32) ValueCell!15614)) (size!40593 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83035)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83037 0))(
  ( (array!83038 (arr!40056 (Array (_ BitVec 32) (_ BitVec 64))) (size!40594 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83037)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(assert (=> b!1271173 (= res!845786 (and (= (size!40593 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40594 _keys!1364) (size!40593 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271174 () Bool)

(declare-fun e!724815 () Bool)

(declare-fun tp_is_empty!32935 () Bool)

(assert (=> b!1271174 (= e!724815 tp_is_empty!32935)))

(declare-fun mapNonEmpty!50983 () Bool)

(declare-fun mapRes!50983 () Bool)

(declare-fun tp!97325 () Bool)

(assert (=> mapNonEmpty!50983 (= mapRes!50983 (and tp!97325 e!724815))))

(declare-fun mapValue!50983 () ValueCell!15614)

(declare-fun mapKey!50983 () (_ BitVec 32))

(declare-fun mapRest!50983 () (Array (_ BitVec 32) ValueCell!15614))

(assert (=> mapNonEmpty!50983 (= (arr!40055 _values!1134) (store mapRest!50983 mapKey!50983 mapValue!50983))))

(declare-fun b!1271175 () Bool)

(declare-fun res!845785 () Bool)

(assert (=> b!1271175 (=> (not res!845785) (not e!724819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83037 (_ BitVec 32)) Bool)

(assert (=> b!1271175 (= res!845785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271176 () Bool)

(declare-fun e!724816 () Bool)

(declare-fun e!724817 () Bool)

(assert (=> b!1271176 (= e!724816 (and e!724817 mapRes!50983))))

(declare-fun condMapEmpty!50983 () Bool)

(declare-fun mapDefault!50983 () ValueCell!15614)

(assert (=> b!1271176 (= condMapEmpty!50983 (= (arr!40055 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15614)) mapDefault!50983)))))

(declare-fun mapIsEmpty!50983 () Bool)

(assert (=> mapIsEmpty!50983 mapRes!50983))

(declare-fun res!845784 () Bool)

(assert (=> start!107246 (=> (not res!845784) (not e!724819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107246 (= res!845784 (validMask!0 mask!1730))))

(assert (=> start!107246 e!724819))

(declare-fun array_inv!30623 (array!83035) Bool)

(assert (=> start!107246 (and (array_inv!30623 _values!1134) e!724816)))

(assert (=> start!107246 true))

(declare-fun array_inv!30624 (array!83037) Bool)

(assert (=> start!107246 (array_inv!30624 _keys!1364)))

(declare-fun b!1271177 () Bool)

(assert (=> b!1271177 (= e!724817 tp_is_empty!32935)))

(declare-fun b!1271178 () Bool)

(assert (=> b!1271178 (= e!724819 false)))

(declare-fun lt!574661 () Bool)

(declare-datatypes ((List!28595 0))(
  ( (Nil!28592) (Cons!28591 (h!29800 (_ BitVec 64)) (t!42116 List!28595)) )
))
(declare-fun arrayNoDuplicates!0 (array!83037 (_ BitVec 32) List!28595) Bool)

(assert (=> b!1271178 (= lt!574661 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28592))))

(assert (= (and start!107246 res!845784) b!1271173))

(assert (= (and b!1271173 res!845786) b!1271175))

(assert (= (and b!1271175 res!845785) b!1271178))

(assert (= (and b!1271176 condMapEmpty!50983) mapIsEmpty!50983))

(assert (= (and b!1271176 (not condMapEmpty!50983)) mapNonEmpty!50983))

(get-info :version)

(assert (= (and mapNonEmpty!50983 ((_ is ValueCellFull!15614) mapValue!50983)) b!1271174))

(assert (= (and b!1271176 ((_ is ValueCellFull!15614) mapDefault!50983)) b!1271177))

(assert (= start!107246 b!1271176))

(declare-fun m!1168755 () Bool)

(assert (=> mapNonEmpty!50983 m!1168755))

(declare-fun m!1168757 () Bool)

(assert (=> b!1271175 m!1168757))

(declare-fun m!1168759 () Bool)

(assert (=> start!107246 m!1168759))

(declare-fun m!1168761 () Bool)

(assert (=> start!107246 m!1168761))

(declare-fun m!1168763 () Bool)

(assert (=> start!107246 m!1168763))

(declare-fun m!1168765 () Bool)

(assert (=> b!1271178 m!1168765))

(check-sat (not b!1271175) (not b!1271178) (not mapNonEmpty!50983) tp_is_empty!32935 (not start!107246))
(check-sat)
