; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82124 () Bool)

(assert start!82124)

(declare-fun b!957198 () Bool)

(declare-fun e!539537 () Bool)

(declare-fun e!539536 () Bool)

(declare-fun mapRes!33661 () Bool)

(assert (=> b!957198 (= e!539537 (and e!539536 mapRes!33661))))

(declare-fun condMapEmpty!33661 () Bool)

(declare-datatypes ((V!33145 0))(
  ( (V!33146 (val!10611 Int)) )
))
(declare-datatypes ((ValueCell!10079 0))(
  ( (ValueCellFull!10079 (v!13167 V!33145)) (EmptyCell!10079) )
))
(declare-datatypes ((array!58288 0))(
  ( (array!58289 (arr!28018 (Array (_ BitVec 32) ValueCell!10079)) (size!28499 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58288)

(declare-fun mapDefault!33661 () ValueCell!10079)

(assert (=> b!957198 (= condMapEmpty!33661 (= (arr!28018 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10079)) mapDefault!33661)))))

(declare-fun b!957199 () Bool)

(declare-fun e!539534 () Bool)

(assert (=> b!957199 (= e!539534 false)))

(declare-fun lt!430087 () Bool)

(declare-datatypes ((array!58290 0))(
  ( (array!58291 (arr!28019 (Array (_ BitVec 32) (_ BitVec 64))) (size!28500 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58290)

(declare-datatypes ((List!19521 0))(
  ( (Nil!19518) (Cons!19517 (h!20679 (_ BitVec 64)) (t!27875 List!19521)) )
))
(declare-fun arrayNoDuplicates!0 (array!58290 (_ BitVec 32) List!19521) Bool)

(assert (=> b!957199 (= lt!430087 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19518))))

(declare-fun res!640820 () Bool)

(assert (=> start!82124 (=> (not res!640820) (not e!539534))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82124 (= res!640820 (validMask!0 mask!2088))))

(assert (=> start!82124 e!539534))

(assert (=> start!82124 true))

(declare-fun array_inv!21799 (array!58288) Bool)

(assert (=> start!82124 (and (array_inv!21799 _values!1386) e!539537)))

(declare-fun array_inv!21800 (array!58290) Bool)

(assert (=> start!82124 (array_inv!21800 _keys!1668)))

(declare-fun mapIsEmpty!33661 () Bool)

(assert (=> mapIsEmpty!33661 mapRes!33661))

(declare-fun b!957200 () Bool)

(declare-fun tp_is_empty!21121 () Bool)

(assert (=> b!957200 (= e!539536 tp_is_empty!21121)))

(declare-fun b!957201 () Bool)

(declare-fun res!640821 () Bool)

(assert (=> b!957201 (=> (not res!640821) (not e!539534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58290 (_ BitVec 32)) Bool)

(assert (=> b!957201 (= res!640821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957202 () Bool)

(declare-fun res!640819 () Bool)

(assert (=> b!957202 (=> (not res!640819) (not e!539534))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957202 (= res!640819 (and (= (size!28499 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28500 _keys!1668) (size!28499 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957203 () Bool)

(declare-fun e!539535 () Bool)

(assert (=> b!957203 (= e!539535 tp_is_empty!21121)))

(declare-fun mapNonEmpty!33661 () Bool)

(declare-fun tp!64267 () Bool)

(assert (=> mapNonEmpty!33661 (= mapRes!33661 (and tp!64267 e!539535))))

(declare-fun mapRest!33661 () (Array (_ BitVec 32) ValueCell!10079))

(declare-fun mapKey!33661 () (_ BitVec 32))

(declare-fun mapValue!33661 () ValueCell!10079)

(assert (=> mapNonEmpty!33661 (= (arr!28018 _values!1386) (store mapRest!33661 mapKey!33661 mapValue!33661))))

(assert (= (and start!82124 res!640820) b!957202))

(assert (= (and b!957202 res!640819) b!957201))

(assert (= (and b!957201 res!640821) b!957199))

(assert (= (and b!957198 condMapEmpty!33661) mapIsEmpty!33661))

(assert (= (and b!957198 (not condMapEmpty!33661)) mapNonEmpty!33661))

(get-info :version)

(assert (= (and mapNonEmpty!33661 ((_ is ValueCellFull!10079) mapValue!33661)) b!957203))

(assert (= (and b!957198 ((_ is ValueCellFull!10079) mapDefault!33661)) b!957200))

(assert (= start!82124 b!957198))

(declare-fun m!887655 () Bool)

(assert (=> b!957199 m!887655))

(declare-fun m!887657 () Bool)

(assert (=> start!82124 m!887657))

(declare-fun m!887659 () Bool)

(assert (=> start!82124 m!887659))

(declare-fun m!887661 () Bool)

(assert (=> start!82124 m!887661))

(declare-fun m!887663 () Bool)

(assert (=> b!957201 m!887663))

(declare-fun m!887665 () Bool)

(assert (=> mapNonEmpty!33661 m!887665))

(check-sat (not start!82124) tp_is_empty!21121 (not b!957199) (not b!957201) (not mapNonEmpty!33661))
(check-sat)
