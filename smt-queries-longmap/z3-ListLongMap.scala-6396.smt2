; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82154 () Bool)

(assert start!82154)

(declare-fun b!957468 () Bool)

(declare-fun e!539760 () Bool)

(declare-fun e!539758 () Bool)

(declare-fun mapRes!33706 () Bool)

(assert (=> b!957468 (= e!539760 (and e!539758 mapRes!33706))))

(declare-fun condMapEmpty!33706 () Bool)

(declare-datatypes ((V!33185 0))(
  ( (V!33186 (val!10626 Int)) )
))
(declare-datatypes ((ValueCell!10094 0))(
  ( (ValueCellFull!10094 (v!13182 V!33185)) (EmptyCell!10094) )
))
(declare-datatypes ((array!58344 0))(
  ( (array!58345 (arr!28046 (Array (_ BitVec 32) ValueCell!10094)) (size!28527 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58344)

(declare-fun mapDefault!33706 () ValueCell!10094)

(assert (=> b!957468 (= condMapEmpty!33706 (= (arr!28046 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10094)) mapDefault!33706)))))

(declare-fun b!957469 () Bool)

(declare-fun res!640955 () Bool)

(declare-fun e!539762 () Bool)

(assert (=> b!957469 (=> (not res!640955) (not e!539762))))

(declare-datatypes ((array!58346 0))(
  ( (array!58347 (arr!28047 (Array (_ BitVec 32) (_ BitVec 64))) (size!28528 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58346)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58346 (_ BitVec 32)) Bool)

(assert (=> b!957469 (= res!640955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!640954 () Bool)

(assert (=> start!82154 (=> (not res!640954) (not e!539762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82154 (= res!640954 (validMask!0 mask!2088))))

(assert (=> start!82154 e!539762))

(assert (=> start!82154 true))

(declare-fun array_inv!21815 (array!58344) Bool)

(assert (=> start!82154 (and (array_inv!21815 _values!1386) e!539760)))

(declare-fun array_inv!21816 (array!58346) Bool)

(assert (=> start!82154 (array_inv!21816 _keys!1668)))

(declare-fun b!957470 () Bool)

(declare-fun e!539761 () Bool)

(declare-fun tp_is_empty!21151 () Bool)

(assert (=> b!957470 (= e!539761 tp_is_empty!21151)))

(declare-fun b!957471 () Bool)

(assert (=> b!957471 (= e!539758 tp_is_empty!21151)))

(declare-fun mapIsEmpty!33706 () Bool)

(assert (=> mapIsEmpty!33706 mapRes!33706))

(declare-fun b!957472 () Bool)

(assert (=> b!957472 (= e!539762 false)))

(declare-fun lt!430132 () Bool)

(declare-datatypes ((List!19534 0))(
  ( (Nil!19531) (Cons!19530 (h!20692 (_ BitVec 64)) (t!27888 List!19534)) )
))
(declare-fun arrayNoDuplicates!0 (array!58346 (_ BitVec 32) List!19534) Bool)

(assert (=> b!957472 (= lt!430132 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19531))))

(declare-fun mapNonEmpty!33706 () Bool)

(declare-fun tp!64312 () Bool)

(assert (=> mapNonEmpty!33706 (= mapRes!33706 (and tp!64312 e!539761))))

(declare-fun mapKey!33706 () (_ BitVec 32))

(declare-fun mapValue!33706 () ValueCell!10094)

(declare-fun mapRest!33706 () (Array (_ BitVec 32) ValueCell!10094))

(assert (=> mapNonEmpty!33706 (= (arr!28046 _values!1386) (store mapRest!33706 mapKey!33706 mapValue!33706))))

(declare-fun b!957473 () Bool)

(declare-fun res!640956 () Bool)

(assert (=> b!957473 (=> (not res!640956) (not e!539762))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957473 (= res!640956 (and (= (size!28527 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28528 _keys!1668) (size!28527 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82154 res!640954) b!957473))

(assert (= (and b!957473 res!640956) b!957469))

(assert (= (and b!957469 res!640955) b!957472))

(assert (= (and b!957468 condMapEmpty!33706) mapIsEmpty!33706))

(assert (= (and b!957468 (not condMapEmpty!33706)) mapNonEmpty!33706))

(get-info :version)

(assert (= (and mapNonEmpty!33706 ((_ is ValueCellFull!10094) mapValue!33706)) b!957470))

(assert (= (and b!957468 ((_ is ValueCellFull!10094) mapDefault!33706)) b!957471))

(assert (= start!82154 b!957468))

(declare-fun m!887835 () Bool)

(assert (=> b!957469 m!887835))

(declare-fun m!887837 () Bool)

(assert (=> start!82154 m!887837))

(declare-fun m!887839 () Bool)

(assert (=> start!82154 m!887839))

(declare-fun m!887841 () Bool)

(assert (=> start!82154 m!887841))

(declare-fun m!887843 () Bool)

(assert (=> b!957472 m!887843))

(declare-fun m!887845 () Bool)

(assert (=> mapNonEmpty!33706 m!887845))

(check-sat tp_is_empty!21151 (not b!957472) (not b!957469) (not mapNonEmpty!33706) (not start!82154))
(check-sat)
