; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82118 () Bool)

(assert start!82118)

(declare-fun b!957144 () Bool)

(declare-fun res!640792 () Bool)

(declare-fun e!539488 () Bool)

(assert (=> b!957144 (=> (not res!640792) (not e!539488))))

(declare-datatypes ((array!58276 0))(
  ( (array!58277 (arr!28012 (Array (_ BitVec 32) (_ BitVec 64))) (size!28493 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58276)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58276 (_ BitVec 32)) Bool)

(assert (=> b!957144 (= res!640792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!640793 () Bool)

(assert (=> start!82118 (=> (not res!640793) (not e!539488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82118 (= res!640793 (validMask!0 mask!2088))))

(assert (=> start!82118 e!539488))

(assert (=> start!82118 true))

(declare-datatypes ((V!33137 0))(
  ( (V!33138 (val!10608 Int)) )
))
(declare-datatypes ((ValueCell!10076 0))(
  ( (ValueCellFull!10076 (v!13164 V!33137)) (EmptyCell!10076) )
))
(declare-datatypes ((array!58278 0))(
  ( (array!58279 (arr!28013 (Array (_ BitVec 32) ValueCell!10076)) (size!28494 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58278)

(declare-fun e!539492 () Bool)

(declare-fun array_inv!21793 (array!58278) Bool)

(assert (=> start!82118 (and (array_inv!21793 _values!1386) e!539492)))

(declare-fun array_inv!21794 (array!58276) Bool)

(assert (=> start!82118 (array_inv!21794 _keys!1668)))

(declare-fun b!957145 () Bool)

(declare-fun res!640794 () Bool)

(assert (=> b!957145 (=> (not res!640794) (not e!539488))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957145 (= res!640794 (and (= (size!28494 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28493 _keys!1668) (size!28494 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957146 () Bool)

(declare-fun e!539490 () Bool)

(declare-fun mapRes!33652 () Bool)

(assert (=> b!957146 (= e!539492 (and e!539490 mapRes!33652))))

(declare-fun condMapEmpty!33652 () Bool)

(declare-fun mapDefault!33652 () ValueCell!10076)

(assert (=> b!957146 (= condMapEmpty!33652 (= (arr!28013 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10076)) mapDefault!33652)))))

(declare-fun b!957147 () Bool)

(assert (=> b!957147 (= e!539488 false)))

(declare-fun lt!430078 () Bool)

(declare-datatypes ((List!19519 0))(
  ( (Nil!19516) (Cons!19515 (h!20677 (_ BitVec 64)) (t!27873 List!19519)) )
))
(declare-fun arrayNoDuplicates!0 (array!58276 (_ BitVec 32) List!19519) Bool)

(assert (=> b!957147 (= lt!430078 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19516))))

(declare-fun mapNonEmpty!33652 () Bool)

(declare-fun tp!64258 () Bool)

(declare-fun e!539489 () Bool)

(assert (=> mapNonEmpty!33652 (= mapRes!33652 (and tp!64258 e!539489))))

(declare-fun mapKey!33652 () (_ BitVec 32))

(declare-fun mapValue!33652 () ValueCell!10076)

(declare-fun mapRest!33652 () (Array (_ BitVec 32) ValueCell!10076))

(assert (=> mapNonEmpty!33652 (= (arr!28013 _values!1386) (store mapRest!33652 mapKey!33652 mapValue!33652))))

(declare-fun b!957148 () Bool)

(declare-fun tp_is_empty!21115 () Bool)

(assert (=> b!957148 (= e!539489 tp_is_empty!21115)))

(declare-fun mapIsEmpty!33652 () Bool)

(assert (=> mapIsEmpty!33652 mapRes!33652))

(declare-fun b!957149 () Bool)

(assert (=> b!957149 (= e!539490 tp_is_empty!21115)))

(assert (= (and start!82118 res!640793) b!957145))

(assert (= (and b!957145 res!640794) b!957144))

(assert (= (and b!957144 res!640792) b!957147))

(assert (= (and b!957146 condMapEmpty!33652) mapIsEmpty!33652))

(assert (= (and b!957146 (not condMapEmpty!33652)) mapNonEmpty!33652))

(get-info :version)

(assert (= (and mapNonEmpty!33652 ((_ is ValueCellFull!10076) mapValue!33652)) b!957148))

(assert (= (and b!957146 ((_ is ValueCellFull!10076) mapDefault!33652)) b!957149))

(assert (= start!82118 b!957146))

(declare-fun m!887619 () Bool)

(assert (=> b!957144 m!887619))

(declare-fun m!887621 () Bool)

(assert (=> start!82118 m!887621))

(declare-fun m!887623 () Bool)

(assert (=> start!82118 m!887623))

(declare-fun m!887625 () Bool)

(assert (=> start!82118 m!887625))

(declare-fun m!887627 () Bool)

(assert (=> b!957147 m!887627))

(declare-fun m!887629 () Bool)

(assert (=> mapNonEmpty!33652 m!887629))

(check-sat (not mapNonEmpty!33652) (not b!957147) (not b!957144) (not start!82118) tp_is_empty!21115)
(check-sat)
