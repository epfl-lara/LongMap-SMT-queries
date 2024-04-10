; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82168 () Bool)

(assert start!82168)

(declare-fun mapNonEmpty!33700 () Bool)

(declare-fun mapRes!33700 () Bool)

(declare-fun tp!64305 () Bool)

(declare-fun e!539878 () Bool)

(assert (=> mapNonEmpty!33700 (= mapRes!33700 (and tp!64305 e!539878))))

(declare-fun mapKey!33700 () (_ BitVec 32))

(declare-datatypes ((V!33179 0))(
  ( (V!33180 (val!10624 Int)) )
))
(declare-datatypes ((ValueCell!10092 0))(
  ( (ValueCellFull!10092 (v!13181 V!33179)) (EmptyCell!10092) )
))
(declare-fun mapValue!33700 () ValueCell!10092)

(declare-datatypes ((array!58397 0))(
  ( (array!58398 (arr!28072 (Array (_ BitVec 32) ValueCell!10092)) (size!28551 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58397)

(declare-fun mapRest!33700 () (Array (_ BitVec 32) ValueCell!10092))

(assert (=> mapNonEmpty!33700 (= (arr!28072 _values!1386) (store mapRest!33700 mapKey!33700 mapValue!33700))))

(declare-fun b!957671 () Bool)

(declare-fun e!539880 () Bool)

(declare-fun tp_is_empty!21147 () Bool)

(assert (=> b!957671 (= e!539880 tp_is_empty!21147)))

(declare-fun res!641046 () Bool)

(declare-fun e!539876 () Bool)

(assert (=> start!82168 (=> (not res!641046) (not e!539876))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82168 (= res!641046 (validMask!0 mask!2088))))

(assert (=> start!82168 e!539876))

(assert (=> start!82168 true))

(declare-fun e!539877 () Bool)

(declare-fun array_inv!21773 (array!58397) Bool)

(assert (=> start!82168 (and (array_inv!21773 _values!1386) e!539877)))

(declare-datatypes ((array!58399 0))(
  ( (array!58400 (arr!28073 (Array (_ BitVec 32) (_ BitVec 64))) (size!28552 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58399)

(declare-fun array_inv!21774 (array!58399) Bool)

(assert (=> start!82168 (array_inv!21774 _keys!1668)))

(declare-fun mapIsEmpty!33700 () Bool)

(assert (=> mapIsEmpty!33700 mapRes!33700))

(declare-fun b!957672 () Bool)

(assert (=> b!957672 (= e!539877 (and e!539880 mapRes!33700))))

(declare-fun condMapEmpty!33700 () Bool)

(declare-fun mapDefault!33700 () ValueCell!10092)

(assert (=> b!957672 (= condMapEmpty!33700 (= (arr!28072 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10092)) mapDefault!33700)))))

(declare-fun b!957673 () Bool)

(declare-fun res!641047 () Bool)

(assert (=> b!957673 (=> (not res!641047) (not e!539876))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957673 (= res!641047 (and (= (size!28551 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28552 _keys!1668) (size!28551 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957674 () Bool)

(assert (=> b!957674 (= e!539876 false)))

(declare-fun lt!430362 () Bool)

(declare-datatypes ((List!19519 0))(
  ( (Nil!19516) (Cons!19515 (h!20677 (_ BitVec 64)) (t!27882 List!19519)) )
))
(declare-fun arrayNoDuplicates!0 (array!58399 (_ BitVec 32) List!19519) Bool)

(assert (=> b!957674 (= lt!430362 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19516))))

(declare-fun b!957675 () Bool)

(declare-fun res!641048 () Bool)

(assert (=> b!957675 (=> (not res!641048) (not e!539876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58399 (_ BitVec 32)) Bool)

(assert (=> b!957675 (= res!641048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957676 () Bool)

(assert (=> b!957676 (= e!539878 tp_is_empty!21147)))

(assert (= (and start!82168 res!641046) b!957673))

(assert (= (and b!957673 res!641047) b!957675))

(assert (= (and b!957675 res!641048) b!957674))

(assert (= (and b!957672 condMapEmpty!33700) mapIsEmpty!33700))

(assert (= (and b!957672 (not condMapEmpty!33700)) mapNonEmpty!33700))

(get-info :version)

(assert (= (and mapNonEmpty!33700 ((_ is ValueCellFull!10092) mapValue!33700)) b!957676))

(assert (= (and b!957672 ((_ is ValueCellFull!10092) mapDefault!33700)) b!957671))

(assert (= start!82168 b!957672))

(declare-fun m!888569 () Bool)

(assert (=> mapNonEmpty!33700 m!888569))

(declare-fun m!888571 () Bool)

(assert (=> start!82168 m!888571))

(declare-fun m!888573 () Bool)

(assert (=> start!82168 m!888573))

(declare-fun m!888575 () Bool)

(assert (=> start!82168 m!888575))

(declare-fun m!888577 () Bool)

(assert (=> b!957674 m!888577))

(declare-fun m!888579 () Bool)

(assert (=> b!957675 m!888579))

(check-sat (not b!957674) (not mapNonEmpty!33700) (not b!957675) (not start!82168) tp_is_empty!21147)
(check-sat)
