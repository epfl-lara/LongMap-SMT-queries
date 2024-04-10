; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82150 () Bool)

(assert start!82150)

(declare-fun b!957509 () Bool)

(declare-fun e!539744 () Bool)

(declare-fun tp_is_empty!21129 () Bool)

(assert (=> b!957509 (= e!539744 tp_is_empty!21129)))

(declare-fun b!957510 () Bool)

(declare-fun res!640966 () Bool)

(declare-fun e!539743 () Bool)

(assert (=> b!957510 (=> (not res!640966) (not e!539743))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58363 0))(
  ( (array!58364 (arr!28055 (Array (_ BitVec 32) (_ BitVec 64))) (size!28534 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58363)

(declare-datatypes ((V!33155 0))(
  ( (V!33156 (val!10615 Int)) )
))
(declare-datatypes ((ValueCell!10083 0))(
  ( (ValueCellFull!10083 (v!13172 V!33155)) (EmptyCell!10083) )
))
(declare-datatypes ((array!58365 0))(
  ( (array!58366 (arr!28056 (Array (_ BitVec 32) ValueCell!10083)) (size!28535 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58365)

(declare-fun mask!2088 () (_ BitVec 32))

(assert (=> b!957510 (= res!640966 (and (= (size!28535 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28534 _keys!1668) (size!28535 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957511 () Bool)

(assert (=> b!957511 (= e!539743 false)))

(declare-fun lt!430335 () Bool)

(declare-datatypes ((List!19513 0))(
  ( (Nil!19510) (Cons!19509 (h!20671 (_ BitVec 64)) (t!27876 List!19513)) )
))
(declare-fun arrayNoDuplicates!0 (array!58363 (_ BitVec 32) List!19513) Bool)

(assert (=> b!957511 (= lt!430335 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19510))))

(declare-fun b!957512 () Bool)

(declare-fun res!640967 () Bool)

(assert (=> b!957512 (=> (not res!640967) (not e!539743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58363 (_ BitVec 32)) Bool)

(assert (=> b!957512 (= res!640967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957513 () Bool)

(declare-fun e!539745 () Bool)

(assert (=> b!957513 (= e!539745 tp_is_empty!21129)))

(declare-fun mapIsEmpty!33673 () Bool)

(declare-fun mapRes!33673 () Bool)

(assert (=> mapIsEmpty!33673 mapRes!33673))

(declare-fun b!957514 () Bool)

(declare-fun e!539741 () Bool)

(assert (=> b!957514 (= e!539741 (and e!539744 mapRes!33673))))

(declare-fun condMapEmpty!33673 () Bool)

(declare-fun mapDefault!33673 () ValueCell!10083)

(assert (=> b!957514 (= condMapEmpty!33673 (= (arr!28056 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10083)) mapDefault!33673)))))

(declare-fun res!640965 () Bool)

(assert (=> start!82150 (=> (not res!640965) (not e!539743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82150 (= res!640965 (validMask!0 mask!2088))))

(assert (=> start!82150 e!539743))

(assert (=> start!82150 true))

(declare-fun array_inv!21763 (array!58365) Bool)

(assert (=> start!82150 (and (array_inv!21763 _values!1386) e!539741)))

(declare-fun array_inv!21764 (array!58363) Bool)

(assert (=> start!82150 (array_inv!21764 _keys!1668)))

(declare-fun mapNonEmpty!33673 () Bool)

(declare-fun tp!64278 () Bool)

(assert (=> mapNonEmpty!33673 (= mapRes!33673 (and tp!64278 e!539745))))

(declare-fun mapRest!33673 () (Array (_ BitVec 32) ValueCell!10083))

(declare-fun mapValue!33673 () ValueCell!10083)

(declare-fun mapKey!33673 () (_ BitVec 32))

(assert (=> mapNonEmpty!33673 (= (arr!28056 _values!1386) (store mapRest!33673 mapKey!33673 mapValue!33673))))

(assert (= (and start!82150 res!640965) b!957510))

(assert (= (and b!957510 res!640966) b!957512))

(assert (= (and b!957512 res!640967) b!957511))

(assert (= (and b!957514 condMapEmpty!33673) mapIsEmpty!33673))

(assert (= (and b!957514 (not condMapEmpty!33673)) mapNonEmpty!33673))

(get-info :version)

(assert (= (and mapNonEmpty!33673 ((_ is ValueCellFull!10083) mapValue!33673)) b!957513))

(assert (= (and b!957514 ((_ is ValueCellFull!10083) mapDefault!33673)) b!957509))

(assert (= start!82150 b!957514))

(declare-fun m!888461 () Bool)

(assert (=> b!957511 m!888461))

(declare-fun m!888463 () Bool)

(assert (=> b!957512 m!888463))

(declare-fun m!888465 () Bool)

(assert (=> start!82150 m!888465))

(declare-fun m!888467 () Bool)

(assert (=> start!82150 m!888467))

(declare-fun m!888469 () Bool)

(assert (=> start!82150 m!888469))

(declare-fun m!888471 () Bool)

(assert (=> mapNonEmpty!33673 m!888471))

(check-sat (not start!82150) (not b!957511) tp_is_empty!21129 (not b!957512) (not mapNonEmpty!33673))
(check-sat)
