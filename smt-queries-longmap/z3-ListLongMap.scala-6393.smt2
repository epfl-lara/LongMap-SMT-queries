; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82156 () Bool)

(assert start!82156)

(declare-fun b!957563 () Bool)

(declare-fun res!640993 () Bool)

(declare-fun e!539786 () Bool)

(assert (=> b!957563 (=> (not res!640993) (not e!539786))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58373 0))(
  ( (array!58374 (arr!28060 (Array (_ BitVec 32) (_ BitVec 64))) (size!28539 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58373)

(declare-datatypes ((V!33163 0))(
  ( (V!33164 (val!10618 Int)) )
))
(declare-datatypes ((ValueCell!10086 0))(
  ( (ValueCellFull!10086 (v!13175 V!33163)) (EmptyCell!10086) )
))
(declare-datatypes ((array!58375 0))(
  ( (array!58376 (arr!28061 (Array (_ BitVec 32) ValueCell!10086)) (size!28540 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58375)

(assert (=> b!957563 (= res!640993 (and (= (size!28540 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28539 _keys!1668) (size!28540 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!640994 () Bool)

(assert (=> start!82156 (=> (not res!640994) (not e!539786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82156 (= res!640994 (validMask!0 mask!2088))))

(assert (=> start!82156 e!539786))

(assert (=> start!82156 true))

(declare-fun e!539788 () Bool)

(declare-fun array_inv!21765 (array!58375) Bool)

(assert (=> start!82156 (and (array_inv!21765 _values!1386) e!539788)))

(declare-fun array_inv!21766 (array!58373) Bool)

(assert (=> start!82156 (array_inv!21766 _keys!1668)))

(declare-fun b!957564 () Bool)

(declare-fun e!539787 () Bool)

(declare-fun tp_is_empty!21135 () Bool)

(assert (=> b!957564 (= e!539787 tp_is_empty!21135)))

(declare-fun b!957565 () Bool)

(assert (=> b!957565 (= e!539786 false)))

(declare-fun lt!430344 () Bool)

(declare-datatypes ((List!19515 0))(
  ( (Nil!19512) (Cons!19511 (h!20673 (_ BitVec 64)) (t!27878 List!19515)) )
))
(declare-fun arrayNoDuplicates!0 (array!58373 (_ BitVec 32) List!19515) Bool)

(assert (=> b!957565 (= lt!430344 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19512))))

(declare-fun b!957566 () Bool)

(declare-fun res!640992 () Bool)

(assert (=> b!957566 (=> (not res!640992) (not e!539786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58373 (_ BitVec 32)) Bool)

(assert (=> b!957566 (= res!640992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957567 () Bool)

(declare-fun mapRes!33682 () Bool)

(assert (=> b!957567 (= e!539788 (and e!539787 mapRes!33682))))

(declare-fun condMapEmpty!33682 () Bool)

(declare-fun mapDefault!33682 () ValueCell!10086)

(assert (=> b!957567 (= condMapEmpty!33682 (= (arr!28061 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10086)) mapDefault!33682)))))

(declare-fun mapNonEmpty!33682 () Bool)

(declare-fun tp!64287 () Bool)

(declare-fun e!539790 () Bool)

(assert (=> mapNonEmpty!33682 (= mapRes!33682 (and tp!64287 e!539790))))

(declare-fun mapValue!33682 () ValueCell!10086)

(declare-fun mapRest!33682 () (Array (_ BitVec 32) ValueCell!10086))

(declare-fun mapKey!33682 () (_ BitVec 32))

(assert (=> mapNonEmpty!33682 (= (arr!28061 _values!1386) (store mapRest!33682 mapKey!33682 mapValue!33682))))

(declare-fun b!957568 () Bool)

(assert (=> b!957568 (= e!539790 tp_is_empty!21135)))

(declare-fun mapIsEmpty!33682 () Bool)

(assert (=> mapIsEmpty!33682 mapRes!33682))

(assert (= (and start!82156 res!640994) b!957563))

(assert (= (and b!957563 res!640993) b!957566))

(assert (= (and b!957566 res!640992) b!957565))

(assert (= (and b!957567 condMapEmpty!33682) mapIsEmpty!33682))

(assert (= (and b!957567 (not condMapEmpty!33682)) mapNonEmpty!33682))

(get-info :version)

(assert (= (and mapNonEmpty!33682 ((_ is ValueCellFull!10086) mapValue!33682)) b!957568))

(assert (= (and b!957567 ((_ is ValueCellFull!10086) mapDefault!33682)) b!957564))

(assert (= start!82156 b!957567))

(declare-fun m!888497 () Bool)

(assert (=> start!82156 m!888497))

(declare-fun m!888499 () Bool)

(assert (=> start!82156 m!888499))

(declare-fun m!888501 () Bool)

(assert (=> start!82156 m!888501))

(declare-fun m!888503 () Bool)

(assert (=> b!957565 m!888503))

(declare-fun m!888505 () Bool)

(assert (=> b!957566 m!888505))

(declare-fun m!888507 () Bool)

(assert (=> mapNonEmpty!33682 m!888507))

(check-sat (not b!957565) (not b!957566) (not mapNonEmpty!33682) tp_is_empty!21135 (not start!82156))
(check-sat)
