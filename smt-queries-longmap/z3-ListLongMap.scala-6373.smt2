; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82142 () Bool)

(assert start!82142)

(declare-fun mapNonEmpty!33481 () Bool)

(declare-fun mapRes!33481 () Bool)

(declare-fun tp!64060 () Bool)

(declare-fun e!539286 () Bool)

(assert (=> mapNonEmpty!33481 (= mapRes!33481 (and tp!64060 e!539286))))

(declare-datatypes ((V!33001 0))(
  ( (V!33002 (val!10557 Int)) )
))
(declare-datatypes ((ValueCell!10025 0))(
  ( (ValueCellFull!10025 (v!13109 V!33001)) (EmptyCell!10025) )
))
(declare-fun mapValue!33481 () ValueCell!10025)

(declare-fun mapRest!33481 () (Array (_ BitVec 32) ValueCell!10025))

(declare-datatypes ((array!58174 0))(
  ( (array!58175 (arr!27962 (Array (_ BitVec 32) ValueCell!10025)) (size!28442 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58174)

(declare-fun mapKey!33481 () (_ BitVec 32))

(assert (=> mapNonEmpty!33481 (= (arr!27962 _values!1197) (store mapRest!33481 mapKey!33481 mapValue!33481))))

(declare-fun mapIsEmpty!33481 () Bool)

(assert (=> mapIsEmpty!33481 mapRes!33481))

(declare-fun b!957052 () Bool)

(declare-fun res!640601 () Bool)

(declare-fun e!539287 () Bool)

(assert (=> b!957052 (=> (not res!640601) (not e!539287))))

(declare-datatypes ((array!58176 0))(
  ( (array!58177 (arr!27963 (Array (_ BitVec 32) (_ BitVec 64))) (size!28443 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58176)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58176 (_ BitVec 32)) Bool)

(assert (=> b!957052 (= res!640601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!957053 () Bool)

(declare-fun tp_is_empty!21013 () Bool)

(assert (=> b!957053 (= e!539286 tp_is_empty!21013)))

(declare-fun res!640600 () Bool)

(assert (=> start!82142 (=> (not res!640600) (not e!539287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82142 (= res!640600 (validMask!0 mask!1823))))

(assert (=> start!82142 e!539287))

(assert (=> start!82142 true))

(declare-fun e!539289 () Bool)

(declare-fun array_inv!21773 (array!58174) Bool)

(assert (=> start!82142 (and (array_inv!21773 _values!1197) e!539289)))

(declare-fun array_inv!21774 (array!58176) Bool)

(assert (=> start!82142 (array_inv!21774 _keys!1441)))

(declare-fun b!957054 () Bool)

(assert (=> b!957054 (= e!539287 false)))

(declare-fun lt!430458 () Bool)

(declare-datatypes ((List!19468 0))(
  ( (Nil!19465) (Cons!19464 (h!20632 (_ BitVec 64)) (t!27821 List!19468)) )
))
(declare-fun arrayNoDuplicates!0 (array!58176 (_ BitVec 32) List!19468) Bool)

(assert (=> b!957054 (= lt!430458 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19465))))

(declare-fun b!957055 () Bool)

(declare-fun res!640599 () Bool)

(assert (=> b!957055 (=> (not res!640599) (not e!539287))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!957055 (= res!640599 (and (= (size!28442 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28443 _keys!1441) (size!28442 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957056 () Bool)

(declare-fun e!539290 () Bool)

(assert (=> b!957056 (= e!539290 tp_is_empty!21013)))

(declare-fun b!957057 () Bool)

(assert (=> b!957057 (= e!539289 (and e!539290 mapRes!33481))))

(declare-fun condMapEmpty!33481 () Bool)

(declare-fun mapDefault!33481 () ValueCell!10025)

(assert (=> b!957057 (= condMapEmpty!33481 (= (arr!27962 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10025)) mapDefault!33481)))))

(assert (= (and start!82142 res!640600) b!957055))

(assert (= (and b!957055 res!640599) b!957052))

(assert (= (and b!957052 res!640601) b!957054))

(assert (= (and b!957057 condMapEmpty!33481) mapIsEmpty!33481))

(assert (= (and b!957057 (not condMapEmpty!33481)) mapNonEmpty!33481))

(get-info :version)

(assert (= (and mapNonEmpty!33481 ((_ is ValueCellFull!10025) mapValue!33481)) b!957053))

(assert (= (and b!957057 ((_ is ValueCellFull!10025) mapDefault!33481)) b!957056))

(assert (= start!82142 b!957057))

(declare-fun m!888819 () Bool)

(assert (=> mapNonEmpty!33481 m!888819))

(declare-fun m!888821 () Bool)

(assert (=> b!957052 m!888821))

(declare-fun m!888823 () Bool)

(assert (=> start!82142 m!888823))

(declare-fun m!888825 () Bool)

(assert (=> start!82142 m!888825))

(declare-fun m!888827 () Bool)

(assert (=> start!82142 m!888827))

(declare-fun m!888829 () Bool)

(assert (=> b!957054 m!888829))

(check-sat tp_is_empty!21013 (not mapNonEmpty!33481) (not start!82142) (not b!957052) (not b!957054))
(check-sat)
