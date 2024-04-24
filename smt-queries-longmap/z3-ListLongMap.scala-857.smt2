; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20242 () Bool)

(assert start!20242)

(declare-fun b_free!4897 () Bool)

(declare-fun b_next!4897 () Bool)

(assert (=> start!20242 (= b_free!4897 (not b_next!4897))))

(declare-fun tp!17722 () Bool)

(declare-fun b_and!11657 () Bool)

(assert (=> start!20242 (= tp!17722 b_and!11657)))

(declare-fun b!199051 () Bool)

(declare-fun res!94505 () Bool)

(declare-fun e!130732 () Bool)

(assert (=> b!199051 (=> (not res!94505) (not e!130732))))

(declare-datatypes ((array!8737 0))(
  ( (array!8738 (arr!4119 (Array (_ BitVec 32) (_ BitVec 64))) (size!4444 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8737)

(declare-datatypes ((V!5985 0))(
  ( (V!5986 (val!2421 Int)) )
))
(declare-datatypes ((ValueCell!2033 0))(
  ( (ValueCellFull!2033 (v!4392 V!5985)) (EmptyCell!2033) )
))
(declare-datatypes ((array!8739 0))(
  ( (array!8740 (arr!4120 (Array (_ BitVec 32) ValueCell!2033)) (size!4445 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8739)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199051 (= res!94505 (and (= (size!4445 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4444 _keys!825) (size!4445 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199052 () Bool)

(declare-fun e!130733 () Bool)

(declare-fun e!130730 () Bool)

(declare-fun mapRes!8198 () Bool)

(assert (=> b!199052 (= e!130733 (and e!130730 mapRes!8198))))

(declare-fun condMapEmpty!8198 () Bool)

(declare-fun mapDefault!8198 () ValueCell!2033)

(assert (=> b!199052 (= condMapEmpty!8198 (= (arr!4120 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2033)) mapDefault!8198)))))

(declare-fun mapNonEmpty!8198 () Bool)

(declare-fun tp!17723 () Bool)

(declare-fun e!130731 () Bool)

(assert (=> mapNonEmpty!8198 (= mapRes!8198 (and tp!17723 e!130731))))

(declare-fun mapValue!8198 () ValueCell!2033)

(declare-fun mapKey!8198 () (_ BitVec 32))

(declare-fun mapRest!8198 () (Array (_ BitVec 32) ValueCell!2033))

(assert (=> mapNonEmpty!8198 (= (arr!4120 _values!649) (store mapRest!8198 mapKey!8198 mapValue!8198))))

(declare-fun mapIsEmpty!8198 () Bool)

(assert (=> mapIsEmpty!8198 mapRes!8198))

(declare-fun b!199053 () Bool)

(declare-fun res!94507 () Bool)

(assert (=> b!199053 (=> (not res!94507) (not e!130732))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199053 (= res!94507 (validKeyInArray!0 k0!843))))

(declare-fun b!199054 () Bool)

(declare-fun res!94508 () Bool)

(assert (=> b!199054 (=> (not res!94508) (not e!130732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8737 (_ BitVec 32)) Bool)

(assert (=> b!199054 (= res!94508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199055 () Bool)

(assert (=> b!199055 (= e!130732 (not true))))

(declare-datatypes ((tuple2!3606 0))(
  ( (tuple2!3607 (_1!1814 (_ BitVec 64)) (_2!1814 V!5985)) )
))
(declare-datatypes ((List!2526 0))(
  ( (Nil!2523) (Cons!2522 (h!3164 tuple2!3606) (t!7449 List!2526)) )
))
(declare-datatypes ((ListLongMap!2521 0))(
  ( (ListLongMap!2522 (toList!1276 List!2526)) )
))
(declare-fun lt!98186 () ListLongMap!2521)

(declare-fun lt!98185 () ListLongMap!2521)

(assert (=> b!199055 (and (= lt!98186 lt!98185) (= lt!98185 lt!98186))))

(declare-fun v!520 () V!5985)

(declare-fun lt!98184 () ListLongMap!2521)

(declare-fun +!330 (ListLongMap!2521 tuple2!3606) ListLongMap!2521)

(assert (=> b!199055 (= lt!98185 (+!330 lt!98184 (tuple2!3607 k0!843 v!520)))))

(declare-datatypes ((Unit!5946 0))(
  ( (Unit!5947) )
))
(declare-fun lt!98183 () Unit!5946)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5985)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5985)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!9 (array!8737 array!8739 (_ BitVec 32) (_ BitVec 32) V!5985 V!5985 (_ BitVec 32) (_ BitVec 64) V!5985 (_ BitVec 32) Int) Unit!5946)

(assert (=> b!199055 (= lt!98183 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!9 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!266 (array!8737 array!8739 (_ BitVec 32) (_ BitVec 32) V!5985 V!5985 (_ BitVec 32) Int) ListLongMap!2521)

(assert (=> b!199055 (= lt!98186 (getCurrentListMapNoExtraKeys!266 _keys!825 (array!8740 (store (arr!4120 _values!649) i!601 (ValueCellFull!2033 v!520)) (size!4445 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199055 (= lt!98184 (getCurrentListMapNoExtraKeys!266 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199056 () Bool)

(declare-fun res!94509 () Bool)

(assert (=> b!199056 (=> (not res!94509) (not e!130732))))

(declare-datatypes ((List!2527 0))(
  ( (Nil!2524) (Cons!2523 (h!3165 (_ BitVec 64)) (t!7450 List!2527)) )
))
(declare-fun arrayNoDuplicates!0 (array!8737 (_ BitVec 32) List!2527) Bool)

(assert (=> b!199056 (= res!94509 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2524))))

(declare-fun res!94510 () Bool)

(assert (=> start!20242 (=> (not res!94510) (not e!130732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20242 (= res!94510 (validMask!0 mask!1149))))

(assert (=> start!20242 e!130732))

(declare-fun array_inv!2689 (array!8739) Bool)

(assert (=> start!20242 (and (array_inv!2689 _values!649) e!130733)))

(assert (=> start!20242 true))

(declare-fun tp_is_empty!4753 () Bool)

(assert (=> start!20242 tp_is_empty!4753))

(declare-fun array_inv!2690 (array!8737) Bool)

(assert (=> start!20242 (array_inv!2690 _keys!825)))

(assert (=> start!20242 tp!17722))

(declare-fun b!199057 () Bool)

(declare-fun res!94506 () Bool)

(assert (=> b!199057 (=> (not res!94506) (not e!130732))))

(assert (=> b!199057 (= res!94506 (= (select (arr!4119 _keys!825) i!601) k0!843))))

(declare-fun b!199058 () Bool)

(assert (=> b!199058 (= e!130731 tp_is_empty!4753)))

(declare-fun b!199059 () Bool)

(assert (=> b!199059 (= e!130730 tp_is_empty!4753)))

(declare-fun b!199060 () Bool)

(declare-fun res!94504 () Bool)

(assert (=> b!199060 (=> (not res!94504) (not e!130732))))

(assert (=> b!199060 (= res!94504 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4444 _keys!825))))))

(assert (= (and start!20242 res!94510) b!199051))

(assert (= (and b!199051 res!94505) b!199054))

(assert (= (and b!199054 res!94508) b!199056))

(assert (= (and b!199056 res!94509) b!199060))

(assert (= (and b!199060 res!94504) b!199053))

(assert (= (and b!199053 res!94507) b!199057))

(assert (= (and b!199057 res!94506) b!199055))

(assert (= (and b!199052 condMapEmpty!8198) mapIsEmpty!8198))

(assert (= (and b!199052 (not condMapEmpty!8198)) mapNonEmpty!8198))

(get-info :version)

(assert (= (and mapNonEmpty!8198 ((_ is ValueCellFull!2033) mapValue!8198)) b!199058))

(assert (= (and b!199052 ((_ is ValueCellFull!2033) mapDefault!8198)) b!199059))

(assert (= start!20242 b!199052))

(declare-fun m!225705 () Bool)

(assert (=> b!199054 m!225705))

(declare-fun m!225707 () Bool)

(assert (=> mapNonEmpty!8198 m!225707))

(declare-fun m!225709 () Bool)

(assert (=> b!199057 m!225709))

(declare-fun m!225711 () Bool)

(assert (=> b!199056 m!225711))

(declare-fun m!225713 () Bool)

(assert (=> b!199055 m!225713))

(declare-fun m!225715 () Bool)

(assert (=> b!199055 m!225715))

(declare-fun m!225717 () Bool)

(assert (=> b!199055 m!225717))

(declare-fun m!225719 () Bool)

(assert (=> b!199055 m!225719))

(declare-fun m!225721 () Bool)

(assert (=> b!199055 m!225721))

(declare-fun m!225723 () Bool)

(assert (=> start!20242 m!225723))

(declare-fun m!225725 () Bool)

(assert (=> start!20242 m!225725))

(declare-fun m!225727 () Bool)

(assert (=> start!20242 m!225727))

(declare-fun m!225729 () Bool)

(assert (=> b!199053 m!225729))

(check-sat (not mapNonEmpty!8198) (not b!199055) (not b!199056) (not b_next!4897) b_and!11657 (not start!20242) tp_is_empty!4753 (not b!199053) (not b!199054))
(check-sat b_and!11657 (not b_next!4897))
