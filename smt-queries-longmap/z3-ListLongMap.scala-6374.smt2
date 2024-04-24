; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82148 () Bool)

(assert start!82148)

(declare-fun b!957106 () Bool)

(declare-fun e!539331 () Bool)

(assert (=> b!957106 (= e!539331 false)))

(declare-fun lt!430467 () Bool)

(declare-datatypes ((array!58186 0))(
  ( (array!58187 (arr!27968 (Array (_ BitVec 32) (_ BitVec 64))) (size!28448 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58186)

(declare-datatypes ((List!19471 0))(
  ( (Nil!19468) (Cons!19467 (h!20635 (_ BitVec 64)) (t!27824 List!19471)) )
))
(declare-fun arrayNoDuplicates!0 (array!58186 (_ BitVec 32) List!19471) Bool)

(assert (=> b!957106 (= lt!430467 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19468))))

(declare-fun b!957107 () Bool)

(declare-fun res!640628 () Bool)

(assert (=> b!957107 (=> (not res!640628) (not e!539331))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33009 0))(
  ( (V!33010 (val!10560 Int)) )
))
(declare-datatypes ((ValueCell!10028 0))(
  ( (ValueCellFull!10028 (v!13112 V!33009)) (EmptyCell!10028) )
))
(declare-datatypes ((array!58188 0))(
  ( (array!58189 (arr!27969 (Array (_ BitVec 32) ValueCell!10028)) (size!28449 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58188)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!957107 (= res!640628 (and (= (size!28449 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28448 _keys!1441) (size!28449 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957108 () Bool)

(declare-fun e!539333 () Bool)

(declare-fun e!539334 () Bool)

(declare-fun mapRes!33490 () Bool)

(assert (=> b!957108 (= e!539333 (and e!539334 mapRes!33490))))

(declare-fun condMapEmpty!33490 () Bool)

(declare-fun mapDefault!33490 () ValueCell!10028)

(assert (=> b!957108 (= condMapEmpty!33490 (= (arr!27969 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10028)) mapDefault!33490)))))

(declare-fun b!957109 () Bool)

(declare-fun tp_is_empty!21019 () Bool)

(assert (=> b!957109 (= e!539334 tp_is_empty!21019)))

(declare-fun b!957110 () Bool)

(declare-fun e!539335 () Bool)

(assert (=> b!957110 (= e!539335 tp_is_empty!21019)))

(declare-fun res!640626 () Bool)

(assert (=> start!82148 (=> (not res!640626) (not e!539331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82148 (= res!640626 (validMask!0 mask!1823))))

(assert (=> start!82148 e!539331))

(assert (=> start!82148 true))

(declare-fun array_inv!21779 (array!58188) Bool)

(assert (=> start!82148 (and (array_inv!21779 _values!1197) e!539333)))

(declare-fun array_inv!21780 (array!58186) Bool)

(assert (=> start!82148 (array_inv!21780 _keys!1441)))

(declare-fun mapIsEmpty!33490 () Bool)

(assert (=> mapIsEmpty!33490 mapRes!33490))

(declare-fun mapNonEmpty!33490 () Bool)

(declare-fun tp!64069 () Bool)

(assert (=> mapNonEmpty!33490 (= mapRes!33490 (and tp!64069 e!539335))))

(declare-fun mapRest!33490 () (Array (_ BitVec 32) ValueCell!10028))

(declare-fun mapKey!33490 () (_ BitVec 32))

(declare-fun mapValue!33490 () ValueCell!10028)

(assert (=> mapNonEmpty!33490 (= (arr!27969 _values!1197) (store mapRest!33490 mapKey!33490 mapValue!33490))))

(declare-fun b!957111 () Bool)

(declare-fun res!640627 () Bool)

(assert (=> b!957111 (=> (not res!640627) (not e!539331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58186 (_ BitVec 32)) Bool)

(assert (=> b!957111 (= res!640627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82148 res!640626) b!957107))

(assert (= (and b!957107 res!640628) b!957111))

(assert (= (and b!957111 res!640627) b!957106))

(assert (= (and b!957108 condMapEmpty!33490) mapIsEmpty!33490))

(assert (= (and b!957108 (not condMapEmpty!33490)) mapNonEmpty!33490))

(get-info :version)

(assert (= (and mapNonEmpty!33490 ((_ is ValueCellFull!10028) mapValue!33490)) b!957110))

(assert (= (and b!957108 ((_ is ValueCellFull!10028) mapDefault!33490)) b!957109))

(assert (= start!82148 b!957108))

(declare-fun m!888855 () Bool)

(assert (=> b!957106 m!888855))

(declare-fun m!888857 () Bool)

(assert (=> start!82148 m!888857))

(declare-fun m!888859 () Bool)

(assert (=> start!82148 m!888859))

(declare-fun m!888861 () Bool)

(assert (=> start!82148 m!888861))

(declare-fun m!888863 () Bool)

(assert (=> mapNonEmpty!33490 m!888863))

(declare-fun m!888865 () Bool)

(assert (=> b!957111 m!888865))

(check-sat tp_is_empty!21019 (not mapNonEmpty!33490) (not b!957106) (not b!957111) (not start!82148))
(check-sat)
