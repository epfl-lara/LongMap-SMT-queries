; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82132 () Bool)

(assert start!82132)

(declare-fun b!957347 () Bool)

(declare-fun e!539610 () Bool)

(declare-fun tp_is_empty!21111 () Bool)

(assert (=> b!957347 (= e!539610 tp_is_empty!21111)))

(declare-fun mapNonEmpty!33646 () Bool)

(declare-fun mapRes!33646 () Bool)

(declare-fun tp!64251 () Bool)

(declare-fun e!539607 () Bool)

(assert (=> mapNonEmpty!33646 (= mapRes!33646 (and tp!64251 e!539607))))

(declare-datatypes ((V!33131 0))(
  ( (V!33132 (val!10606 Int)) )
))
(declare-datatypes ((ValueCell!10074 0))(
  ( (ValueCellFull!10074 (v!13163 V!33131)) (EmptyCell!10074) )
))
(declare-fun mapRest!33646 () (Array (_ BitVec 32) ValueCell!10074))

(declare-fun mapKey!33646 () (_ BitVec 32))

(declare-fun mapValue!33646 () ValueCell!10074)

(declare-datatypes ((array!58329 0))(
  ( (array!58330 (arr!28038 (Array (_ BitVec 32) ValueCell!10074)) (size!28517 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58329)

(assert (=> mapNonEmpty!33646 (= (arr!28038 _values!1386) (store mapRest!33646 mapKey!33646 mapValue!33646))))

(declare-fun b!957348 () Bool)

(declare-fun e!539609 () Bool)

(assert (=> b!957348 (= e!539609 (and e!539610 mapRes!33646))))

(declare-fun condMapEmpty!33646 () Bool)

(declare-fun mapDefault!33646 () ValueCell!10074)

(assert (=> b!957348 (= condMapEmpty!33646 (= (arr!28038 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10074)) mapDefault!33646)))))

(declare-fun b!957349 () Bool)

(assert (=> b!957349 (= e!539607 tp_is_empty!21111)))

(declare-fun mapIsEmpty!33646 () Bool)

(assert (=> mapIsEmpty!33646 mapRes!33646))

(declare-fun b!957350 () Bool)

(declare-fun e!539608 () Bool)

(assert (=> b!957350 (= e!539608 false)))

(declare-fun lt!430308 () Bool)

(declare-datatypes ((array!58331 0))(
  ( (array!58332 (arr!28039 (Array (_ BitVec 32) (_ BitVec 64))) (size!28518 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58331)

(declare-datatypes ((List!19506 0))(
  ( (Nil!19503) (Cons!19502 (h!20664 (_ BitVec 64)) (t!27869 List!19506)) )
))
(declare-fun arrayNoDuplicates!0 (array!58331 (_ BitVec 32) List!19506) Bool)

(assert (=> b!957350 (= lt!430308 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19503))))

(declare-fun b!957351 () Bool)

(declare-fun res!640884 () Bool)

(assert (=> b!957351 (=> (not res!640884) (not e!539608))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58331 (_ BitVec 32)) Bool)

(assert (=> b!957351 (= res!640884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957352 () Bool)

(declare-fun res!640886 () Bool)

(assert (=> b!957352 (=> (not res!640886) (not e!539608))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957352 (= res!640886 (and (= (size!28517 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28518 _keys!1668) (size!28517 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!640885 () Bool)

(assert (=> start!82132 (=> (not res!640885) (not e!539608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82132 (= res!640885 (validMask!0 mask!2088))))

(assert (=> start!82132 e!539608))

(assert (=> start!82132 true))

(declare-fun array_inv!21753 (array!58329) Bool)

(assert (=> start!82132 (and (array_inv!21753 _values!1386) e!539609)))

(declare-fun array_inv!21754 (array!58331) Bool)

(assert (=> start!82132 (array_inv!21754 _keys!1668)))

(assert (= (and start!82132 res!640885) b!957352))

(assert (= (and b!957352 res!640886) b!957351))

(assert (= (and b!957351 res!640884) b!957350))

(assert (= (and b!957348 condMapEmpty!33646) mapIsEmpty!33646))

(assert (= (and b!957348 (not condMapEmpty!33646)) mapNonEmpty!33646))

(get-info :version)

(assert (= (and mapNonEmpty!33646 ((_ is ValueCellFull!10074) mapValue!33646)) b!957349))

(assert (= (and b!957348 ((_ is ValueCellFull!10074) mapDefault!33646)) b!957347))

(assert (= start!82132 b!957348))

(declare-fun m!888353 () Bool)

(assert (=> mapNonEmpty!33646 m!888353))

(declare-fun m!888355 () Bool)

(assert (=> b!957350 m!888355))

(declare-fun m!888357 () Bool)

(assert (=> b!957351 m!888357))

(declare-fun m!888359 () Bool)

(assert (=> start!82132 m!888359))

(declare-fun m!888361 () Bool)

(assert (=> start!82132 m!888361))

(declare-fun m!888363 () Bool)

(assert (=> start!82132 m!888363))

(check-sat (not start!82132) (not mapNonEmpty!33646) (not b!957350) (not b!957351) tp_is_empty!21111)
(check-sat)
