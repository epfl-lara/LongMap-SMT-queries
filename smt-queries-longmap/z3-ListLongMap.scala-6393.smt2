; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82136 () Bool)

(assert start!82136)

(declare-fun b!957306 () Bool)

(declare-fun e!539626 () Bool)

(declare-fun tp_is_empty!21133 () Bool)

(assert (=> b!957306 (= e!539626 tp_is_empty!21133)))

(declare-fun mapIsEmpty!33679 () Bool)

(declare-fun mapRes!33679 () Bool)

(assert (=> mapIsEmpty!33679 mapRes!33679))

(declare-fun b!957307 () Bool)

(declare-fun e!539624 () Bool)

(assert (=> b!957307 (= e!539624 (and e!539626 mapRes!33679))))

(declare-fun condMapEmpty!33679 () Bool)

(declare-datatypes ((V!33161 0))(
  ( (V!33162 (val!10617 Int)) )
))
(declare-datatypes ((ValueCell!10085 0))(
  ( (ValueCellFull!10085 (v!13173 V!33161)) (EmptyCell!10085) )
))
(declare-datatypes ((array!58312 0))(
  ( (array!58313 (arr!28030 (Array (_ BitVec 32) ValueCell!10085)) (size!28511 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58312)

(declare-fun mapDefault!33679 () ValueCell!10085)

(assert (=> b!957307 (= condMapEmpty!33679 (= (arr!28030 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10085)) mapDefault!33679)))))

(declare-fun mapNonEmpty!33679 () Bool)

(declare-fun tp!64285 () Bool)

(declare-fun e!539623 () Bool)

(assert (=> mapNonEmpty!33679 (= mapRes!33679 (and tp!64285 e!539623))))

(declare-fun mapValue!33679 () ValueCell!10085)

(declare-fun mapKey!33679 () (_ BitVec 32))

(declare-fun mapRest!33679 () (Array (_ BitVec 32) ValueCell!10085))

(assert (=> mapNonEmpty!33679 (= (arr!28030 _values!1386) (store mapRest!33679 mapKey!33679 mapValue!33679))))

(declare-fun b!957308 () Bool)

(declare-fun res!640875 () Bool)

(declare-fun e!539625 () Bool)

(assert (=> b!957308 (=> (not res!640875) (not e!539625))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58314 0))(
  ( (array!58315 (arr!28031 (Array (_ BitVec 32) (_ BitVec 64))) (size!28512 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58314)

(assert (=> b!957308 (= res!640875 (and (= (size!28511 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28512 _keys!1668) (size!28511 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!640873 () Bool)

(assert (=> start!82136 (=> (not res!640873) (not e!539625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82136 (= res!640873 (validMask!0 mask!2088))))

(assert (=> start!82136 e!539625))

(assert (=> start!82136 true))

(declare-fun array_inv!21807 (array!58312) Bool)

(assert (=> start!82136 (and (array_inv!21807 _values!1386) e!539624)))

(declare-fun array_inv!21808 (array!58314) Bool)

(assert (=> start!82136 (array_inv!21808 _keys!1668)))

(declare-fun b!957309 () Bool)

(assert (=> b!957309 (= e!539623 tp_is_empty!21133)))

(declare-fun b!957310 () Bool)

(declare-fun res!640874 () Bool)

(assert (=> b!957310 (=> (not res!640874) (not e!539625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58314 (_ BitVec 32)) Bool)

(assert (=> b!957310 (= res!640874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957311 () Bool)

(assert (=> b!957311 (= e!539625 false)))

(declare-fun lt!430105 () Bool)

(declare-datatypes ((List!19527 0))(
  ( (Nil!19524) (Cons!19523 (h!20685 (_ BitVec 64)) (t!27881 List!19527)) )
))
(declare-fun arrayNoDuplicates!0 (array!58314 (_ BitVec 32) List!19527) Bool)

(assert (=> b!957311 (= lt!430105 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19524))))

(assert (= (and start!82136 res!640873) b!957308))

(assert (= (and b!957308 res!640875) b!957310))

(assert (= (and b!957310 res!640874) b!957311))

(assert (= (and b!957307 condMapEmpty!33679) mapIsEmpty!33679))

(assert (= (and b!957307 (not condMapEmpty!33679)) mapNonEmpty!33679))

(get-info :version)

(assert (= (and mapNonEmpty!33679 ((_ is ValueCellFull!10085) mapValue!33679)) b!957309))

(assert (= (and b!957307 ((_ is ValueCellFull!10085) mapDefault!33679)) b!957306))

(assert (= start!82136 b!957307))

(declare-fun m!887727 () Bool)

(assert (=> mapNonEmpty!33679 m!887727))

(declare-fun m!887729 () Bool)

(assert (=> start!82136 m!887729))

(declare-fun m!887731 () Bool)

(assert (=> start!82136 m!887731))

(declare-fun m!887733 () Bool)

(assert (=> start!82136 m!887733))

(declare-fun m!887735 () Bool)

(assert (=> b!957310 m!887735))

(declare-fun m!887737 () Bool)

(assert (=> b!957311 m!887737))

(check-sat (not b!957310) tp_is_empty!21133 (not mapNonEmpty!33679) (not b!957311) (not start!82136))
(check-sat)
