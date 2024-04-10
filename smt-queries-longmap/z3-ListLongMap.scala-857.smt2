; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20240 () Bool)

(assert start!20240)

(declare-fun b_free!4899 () Bool)

(declare-fun b_next!4899 () Bool)

(assert (=> start!20240 (= b_free!4899 (not b_next!4899))))

(declare-fun tp!17728 () Bool)

(declare-fun b_and!11645 () Bool)

(assert (=> start!20240 (= tp!17728 b_and!11645)))

(declare-fun b!199034 () Bool)

(declare-fun res!94504 () Bool)

(declare-fun e!130723 () Bool)

(assert (=> b!199034 (=> (not res!94504) (not e!130723))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199034 (= res!94504 (validKeyInArray!0 k0!843))))

(declare-fun b!199035 () Bool)

(declare-fun res!94506 () Bool)

(assert (=> b!199035 (=> (not res!94506) (not e!130723))))

(declare-datatypes ((array!8751 0))(
  ( (array!8752 (arr!4126 (Array (_ BitVec 32) (_ BitVec 64))) (size!4451 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8751)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199035 (= res!94506 (= (select (arr!4126 _keys!825) i!601) k0!843))))

(declare-fun b!199036 () Bool)

(declare-fun res!94510 () Bool)

(assert (=> b!199036 (=> (not res!94510) (not e!130723))))

(declare-datatypes ((List!2584 0))(
  ( (Nil!2581) (Cons!2580 (h!3222 (_ BitVec 64)) (t!7515 List!2584)) )
))
(declare-fun arrayNoDuplicates!0 (array!8751 (_ BitVec 32) List!2584) Bool)

(assert (=> b!199036 (= res!94510 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2581))))

(declare-fun b!199037 () Bool)

(assert (=> b!199037 (= e!130723 (not true))))

(declare-datatypes ((V!5987 0))(
  ( (V!5988 (val!2422 Int)) )
))
(declare-datatypes ((tuple2!3668 0))(
  ( (tuple2!3669 (_1!1845 (_ BitVec 64)) (_2!1845 V!5987)) )
))
(declare-datatypes ((List!2585 0))(
  ( (Nil!2582) (Cons!2581 (h!3223 tuple2!3668) (t!7516 List!2585)) )
))
(declare-datatypes ((ListLongMap!2581 0))(
  ( (ListLongMap!2582 (toList!1306 List!2585)) )
))
(declare-fun lt!98139 () ListLongMap!2581)

(declare-fun lt!98137 () ListLongMap!2581)

(assert (=> b!199037 (and (= lt!98139 lt!98137) (= lt!98137 lt!98139))))

(declare-fun lt!98138 () ListLongMap!2581)

(declare-fun v!520 () V!5987)

(declare-fun +!333 (ListLongMap!2581 tuple2!3668) ListLongMap!2581)

(assert (=> b!199037 (= lt!98137 (+!333 lt!98138 (tuple2!3669 k0!843 v!520)))))

(declare-datatypes ((Unit!5968 0))(
  ( (Unit!5969) )
))
(declare-fun lt!98136 () Unit!5968)

(declare-datatypes ((ValueCell!2034 0))(
  ( (ValueCellFull!2034 (v!4392 V!5987)) (EmptyCell!2034) )
))
(declare-datatypes ((array!8753 0))(
  ( (array!8754 (arr!4127 (Array (_ BitVec 32) ValueCell!2034)) (size!4452 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8753)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5987)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5987)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!10 (array!8751 array!8753 (_ BitVec 32) (_ BitVec 32) V!5987 V!5987 (_ BitVec 32) (_ BitVec 64) V!5987 (_ BitVec 32) Int) Unit!5968)

(assert (=> b!199037 (= lt!98136 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!10 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!271 (array!8751 array!8753 (_ BitVec 32) (_ BitVec 32) V!5987 V!5987 (_ BitVec 32) Int) ListLongMap!2581)

(assert (=> b!199037 (= lt!98139 (getCurrentListMapNoExtraKeys!271 _keys!825 (array!8754 (store (arr!4127 _values!649) i!601 (ValueCellFull!2034 v!520)) (size!4452 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199037 (= lt!98138 (getCurrentListMapNoExtraKeys!271 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199038 () Bool)

(declare-fun e!130721 () Bool)

(declare-fun tp_is_empty!4755 () Bool)

(assert (=> b!199038 (= e!130721 tp_is_empty!4755)))

(declare-fun b!199039 () Bool)

(declare-fun res!94508 () Bool)

(assert (=> b!199039 (=> (not res!94508) (not e!130723))))

(assert (=> b!199039 (= res!94508 (and (= (size!4452 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4451 _keys!825) (size!4452 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199040 () Bool)

(declare-fun res!94507 () Bool)

(assert (=> b!199040 (=> (not res!94507) (not e!130723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8751 (_ BitVec 32)) Bool)

(assert (=> b!199040 (= res!94507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94505 () Bool)

(assert (=> start!20240 (=> (not res!94505) (not e!130723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20240 (= res!94505 (validMask!0 mask!1149))))

(assert (=> start!20240 e!130723))

(declare-fun e!130722 () Bool)

(declare-fun array_inv!2703 (array!8753) Bool)

(assert (=> start!20240 (and (array_inv!2703 _values!649) e!130722)))

(assert (=> start!20240 true))

(assert (=> start!20240 tp_is_empty!4755))

(declare-fun array_inv!2704 (array!8751) Bool)

(assert (=> start!20240 (array_inv!2704 _keys!825)))

(assert (=> start!20240 tp!17728))

(declare-fun b!199041 () Bool)

(declare-fun e!130720 () Bool)

(assert (=> b!199041 (= e!130720 tp_is_empty!4755)))

(declare-fun b!199042 () Bool)

(declare-fun mapRes!8201 () Bool)

(assert (=> b!199042 (= e!130722 (and e!130721 mapRes!8201))))

(declare-fun condMapEmpty!8201 () Bool)

(declare-fun mapDefault!8201 () ValueCell!2034)

(assert (=> b!199042 (= condMapEmpty!8201 (= (arr!4127 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2034)) mapDefault!8201)))))

(declare-fun mapNonEmpty!8201 () Bool)

(declare-fun tp!17729 () Bool)

(assert (=> mapNonEmpty!8201 (= mapRes!8201 (and tp!17729 e!130720))))

(declare-fun mapRest!8201 () (Array (_ BitVec 32) ValueCell!2034))

(declare-fun mapKey!8201 () (_ BitVec 32))

(declare-fun mapValue!8201 () ValueCell!2034)

(assert (=> mapNonEmpty!8201 (= (arr!4127 _values!649) (store mapRest!8201 mapKey!8201 mapValue!8201))))

(declare-fun mapIsEmpty!8201 () Bool)

(assert (=> mapIsEmpty!8201 mapRes!8201))

(declare-fun b!199043 () Bool)

(declare-fun res!94509 () Bool)

(assert (=> b!199043 (=> (not res!94509) (not e!130723))))

(assert (=> b!199043 (= res!94509 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4451 _keys!825))))))

(assert (= (and start!20240 res!94505) b!199039))

(assert (= (and b!199039 res!94508) b!199040))

(assert (= (and b!199040 res!94507) b!199036))

(assert (= (and b!199036 res!94510) b!199043))

(assert (= (and b!199043 res!94509) b!199034))

(assert (= (and b!199034 res!94504) b!199035))

(assert (= (and b!199035 res!94506) b!199037))

(assert (= (and b!199042 condMapEmpty!8201) mapIsEmpty!8201))

(assert (= (and b!199042 (not condMapEmpty!8201)) mapNonEmpty!8201))

(get-info :version)

(assert (= (and mapNonEmpty!8201 ((_ is ValueCellFull!2034) mapValue!8201)) b!199041))

(assert (= (and b!199042 ((_ is ValueCellFull!2034) mapDefault!8201)) b!199038))

(assert (= start!20240 b!199042))

(declare-fun m!225549 () Bool)

(assert (=> b!199036 m!225549))

(declare-fun m!225551 () Bool)

(assert (=> mapNonEmpty!8201 m!225551))

(declare-fun m!225553 () Bool)

(assert (=> b!199040 m!225553))

(declare-fun m!225555 () Bool)

(assert (=> b!199035 m!225555))

(declare-fun m!225557 () Bool)

(assert (=> b!199037 m!225557))

(declare-fun m!225559 () Bool)

(assert (=> b!199037 m!225559))

(declare-fun m!225561 () Bool)

(assert (=> b!199037 m!225561))

(declare-fun m!225563 () Bool)

(assert (=> b!199037 m!225563))

(declare-fun m!225565 () Bool)

(assert (=> b!199037 m!225565))

(declare-fun m!225567 () Bool)

(assert (=> start!20240 m!225567))

(declare-fun m!225569 () Bool)

(assert (=> start!20240 m!225569))

(declare-fun m!225571 () Bool)

(assert (=> start!20240 m!225571))

(declare-fun m!225573 () Bool)

(assert (=> b!199034 m!225573))

(check-sat (not b!199036) (not b!199037) (not b!199040) b_and!11645 (not mapNonEmpty!8201) (not b_next!4899) tp_is_empty!4755 (not start!20240) (not b!199034))
(check-sat b_and!11645 (not b_next!4899))
