; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82144 () Bool)

(assert start!82144)

(declare-fun b!957455 () Bool)

(declare-fun e!539696 () Bool)

(assert (=> b!957455 (= e!539696 false)))

(declare-fun lt!430326 () Bool)

(declare-datatypes ((array!58351 0))(
  ( (array!58352 (arr!28049 (Array (_ BitVec 32) (_ BitVec 64))) (size!28528 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58351)

(declare-datatypes ((List!19511 0))(
  ( (Nil!19508) (Cons!19507 (h!20669 (_ BitVec 64)) (t!27874 List!19511)) )
))
(declare-fun arrayNoDuplicates!0 (array!58351 (_ BitVec 32) List!19511) Bool)

(assert (=> b!957455 (= lt!430326 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19508))))

(declare-fun b!957456 () Bool)

(declare-fun e!539698 () Bool)

(declare-fun tp_is_empty!21123 () Bool)

(assert (=> b!957456 (= e!539698 tp_is_empty!21123)))

(declare-fun b!957457 () Bool)

(declare-fun res!640940 () Bool)

(assert (=> b!957457 (=> (not res!640940) (not e!539696))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33147 0))(
  ( (V!33148 (val!10612 Int)) )
))
(declare-datatypes ((ValueCell!10080 0))(
  ( (ValueCellFull!10080 (v!13169 V!33147)) (EmptyCell!10080) )
))
(declare-datatypes ((array!58353 0))(
  ( (array!58354 (arr!28050 (Array (_ BitVec 32) ValueCell!10080)) (size!28529 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58353)

(assert (=> b!957457 (= res!640940 (and (= (size!28529 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28528 _keys!1668) (size!28529 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33664 () Bool)

(declare-fun mapRes!33664 () Bool)

(declare-fun tp!64269 () Bool)

(assert (=> mapNonEmpty!33664 (= mapRes!33664 (and tp!64269 e!539698))))

(declare-fun mapKey!33664 () (_ BitVec 32))

(declare-fun mapValue!33664 () ValueCell!10080)

(declare-fun mapRest!33664 () (Array (_ BitVec 32) ValueCell!10080))

(assert (=> mapNonEmpty!33664 (= (arr!28050 _values!1386) (store mapRest!33664 mapKey!33664 mapValue!33664))))

(declare-fun b!957458 () Bool)

(declare-fun e!539699 () Bool)

(assert (=> b!957458 (= e!539699 tp_is_empty!21123)))

(declare-fun b!957459 () Bool)

(declare-fun e!539700 () Bool)

(assert (=> b!957459 (= e!539700 (and e!539699 mapRes!33664))))

(declare-fun condMapEmpty!33664 () Bool)

(declare-fun mapDefault!33664 () ValueCell!10080)

(assert (=> b!957459 (= condMapEmpty!33664 (= (arr!28050 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10080)) mapDefault!33664)))))

(declare-fun res!640939 () Bool)

(assert (=> start!82144 (=> (not res!640939) (not e!539696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82144 (= res!640939 (validMask!0 mask!2088))))

(assert (=> start!82144 e!539696))

(assert (=> start!82144 true))

(declare-fun array_inv!21759 (array!58353) Bool)

(assert (=> start!82144 (and (array_inv!21759 _values!1386) e!539700)))

(declare-fun array_inv!21760 (array!58351) Bool)

(assert (=> start!82144 (array_inv!21760 _keys!1668)))

(declare-fun mapIsEmpty!33664 () Bool)

(assert (=> mapIsEmpty!33664 mapRes!33664))

(declare-fun b!957460 () Bool)

(declare-fun res!640938 () Bool)

(assert (=> b!957460 (=> (not res!640938) (not e!539696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58351 (_ BitVec 32)) Bool)

(assert (=> b!957460 (= res!640938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82144 res!640939) b!957457))

(assert (= (and b!957457 res!640940) b!957460))

(assert (= (and b!957460 res!640938) b!957455))

(assert (= (and b!957459 condMapEmpty!33664) mapIsEmpty!33664))

(assert (= (and b!957459 (not condMapEmpty!33664)) mapNonEmpty!33664))

(get-info :version)

(assert (= (and mapNonEmpty!33664 ((_ is ValueCellFull!10080) mapValue!33664)) b!957456))

(assert (= (and b!957459 ((_ is ValueCellFull!10080) mapDefault!33664)) b!957458))

(assert (= start!82144 b!957459))

(declare-fun m!888425 () Bool)

(assert (=> b!957455 m!888425))

(declare-fun m!888427 () Bool)

(assert (=> mapNonEmpty!33664 m!888427))

(declare-fun m!888429 () Bool)

(assert (=> start!82144 m!888429))

(declare-fun m!888431 () Bool)

(assert (=> start!82144 m!888431))

(declare-fun m!888433 () Bool)

(assert (=> start!82144 m!888433))

(declare-fun m!888435 () Bool)

(assert (=> b!957460 m!888435))

(check-sat tp_is_empty!21123 (not start!82144) (not b!957455) (not b!957460) (not mapNonEmpty!33664))
(check-sat)
