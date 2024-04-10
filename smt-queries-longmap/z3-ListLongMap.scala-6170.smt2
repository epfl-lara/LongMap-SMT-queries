; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79130 () Bool)

(assert start!79130)

(declare-fun b_free!17343 () Bool)

(declare-fun b_next!17343 () Bool)

(assert (=> start!79130 (= b_free!17343 (not b_next!17343))))

(declare-fun tp!60470 () Bool)

(declare-fun b_and!28409 () Bool)

(assert (=> start!79130 (= tp!60470 b_and!28409)))

(declare-fun b!928782 () Bool)

(declare-fun e!521510 () Bool)

(assert (=> b!928782 (= e!521510 false)))

(declare-datatypes ((V!31433 0))(
  ( (V!31434 (val!9976 Int)) )
))
(declare-fun lt!418936 () V!31433)

(declare-datatypes ((tuple2!13034 0))(
  ( (tuple2!13035 (_1!6528 (_ BitVec 64)) (_2!6528 V!31433)) )
))
(declare-datatypes ((List!18832 0))(
  ( (Nil!18829) (Cons!18828 (h!19974 tuple2!13034) (t!26889 List!18832)) )
))
(declare-datatypes ((ListLongMap!11731 0))(
  ( (ListLongMap!11732 (toList!5881 List!18832)) )
))
(declare-fun lt!418935 () ListLongMap!11731)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!710 (ListLongMap!11731 (_ BitVec 64)) V!31433)

(assert (=> b!928782 (= lt!418936 (apply!710 lt!418935 k0!1099))))

(declare-fun mapNonEmpty!31533 () Bool)

(declare-fun mapRes!31533 () Bool)

(declare-fun tp!60469 () Bool)

(declare-fun e!521511 () Bool)

(assert (=> mapNonEmpty!31533 (= mapRes!31533 (and tp!60469 e!521511))))

(declare-datatypes ((ValueCell!9444 0))(
  ( (ValueCellFull!9444 (v!12494 V!31433)) (EmptyCell!9444) )
))
(declare-datatypes ((array!55656 0))(
  ( (array!55657 (arr!26773 (Array (_ BitVec 32) ValueCell!9444)) (size!27232 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55656)

(declare-fun mapRest!31533 () (Array (_ BitVec 32) ValueCell!9444))

(declare-fun mapValue!31533 () ValueCell!9444)

(declare-fun mapKey!31533 () (_ BitVec 32))

(assert (=> mapNonEmpty!31533 (= (arr!26773 _values!1231) (store mapRest!31533 mapKey!31533 mapValue!31533))))

(declare-fun res!625435 () Bool)

(declare-fun e!521514 () Bool)

(assert (=> start!79130 (=> (not res!625435) (not e!521514))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79130 (= res!625435 (validMask!0 mask!1881))))

(assert (=> start!79130 e!521514))

(assert (=> start!79130 true))

(declare-fun e!521512 () Bool)

(declare-fun array_inv!20842 (array!55656) Bool)

(assert (=> start!79130 (and (array_inv!20842 _values!1231) e!521512)))

(assert (=> start!79130 tp!60470))

(declare-datatypes ((array!55658 0))(
  ( (array!55659 (arr!26774 (Array (_ BitVec 32) (_ BitVec 64))) (size!27233 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55658)

(declare-fun array_inv!20843 (array!55658) Bool)

(assert (=> start!79130 (array_inv!20843 _keys!1487)))

(declare-fun tp_is_empty!19851 () Bool)

(assert (=> start!79130 tp_is_empty!19851))

(declare-fun b!928783 () Bool)

(declare-fun res!625433 () Bool)

(assert (=> b!928783 (=> (not res!625433) (not e!521514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55658 (_ BitVec 32)) Bool)

(assert (=> b!928783 (= res!625433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928784 () Bool)

(declare-fun e!521513 () Bool)

(assert (=> b!928784 (= e!521512 (and e!521513 mapRes!31533))))

(declare-fun condMapEmpty!31533 () Bool)

(declare-fun mapDefault!31533 () ValueCell!9444)

(assert (=> b!928784 (= condMapEmpty!31533 (= (arr!26773 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9444)) mapDefault!31533)))))

(declare-fun b!928785 () Bool)

(assert (=> b!928785 (= e!521513 tp_is_empty!19851)))

(declare-fun mapIsEmpty!31533 () Bool)

(assert (=> mapIsEmpty!31533 mapRes!31533))

(declare-fun b!928786 () Bool)

(assert (=> b!928786 (= e!521511 tp_is_empty!19851)))

(declare-fun b!928787 () Bool)

(declare-fun res!625434 () Bool)

(assert (=> b!928787 (=> (not res!625434) (not e!521514))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928787 (= res!625434 (and (= (size!27232 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27233 _keys!1487) (size!27232 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928788 () Bool)

(assert (=> b!928788 (= e!521514 e!521510)))

(declare-fun res!625438 () Bool)

(assert (=> b!928788 (=> (not res!625438) (not e!521510))))

(declare-fun contains!4938 (ListLongMap!11731 (_ BitVec 64)) Bool)

(assert (=> b!928788 (= res!625438 (contains!4938 lt!418935 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31433)

(declare-fun minValue!1173 () V!31433)

(declare-fun getCurrentListMap!3129 (array!55658 array!55656 (_ BitVec 32) (_ BitVec 32) V!31433 V!31433 (_ BitVec 32) Int) ListLongMap!11731)

(assert (=> b!928788 (= lt!418935 (getCurrentListMap!3129 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928789 () Bool)

(declare-fun res!625436 () Bool)

(assert (=> b!928789 (=> (not res!625436) (not e!521514))))

(assert (=> b!928789 (= res!625436 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27233 _keys!1487))))))

(declare-fun b!928790 () Bool)

(declare-fun res!625437 () Bool)

(assert (=> b!928790 (=> (not res!625437) (not e!521514))))

(declare-datatypes ((List!18833 0))(
  ( (Nil!18830) (Cons!18829 (h!19975 (_ BitVec 64)) (t!26890 List!18833)) )
))
(declare-fun arrayNoDuplicates!0 (array!55658 (_ BitVec 32) List!18833) Bool)

(assert (=> b!928790 (= res!625437 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18830))))

(assert (= (and start!79130 res!625435) b!928787))

(assert (= (and b!928787 res!625434) b!928783))

(assert (= (and b!928783 res!625433) b!928790))

(assert (= (and b!928790 res!625437) b!928789))

(assert (= (and b!928789 res!625436) b!928788))

(assert (= (and b!928788 res!625438) b!928782))

(assert (= (and b!928784 condMapEmpty!31533) mapIsEmpty!31533))

(assert (= (and b!928784 (not condMapEmpty!31533)) mapNonEmpty!31533))

(get-info :version)

(assert (= (and mapNonEmpty!31533 ((_ is ValueCellFull!9444) mapValue!31533)) b!928786))

(assert (= (and b!928784 ((_ is ValueCellFull!9444) mapDefault!31533)) b!928785))

(assert (= start!79130 b!928784))

(declare-fun m!863571 () Bool)

(assert (=> b!928782 m!863571))

(declare-fun m!863573 () Bool)

(assert (=> start!79130 m!863573))

(declare-fun m!863575 () Bool)

(assert (=> start!79130 m!863575))

(declare-fun m!863577 () Bool)

(assert (=> start!79130 m!863577))

(declare-fun m!863579 () Bool)

(assert (=> mapNonEmpty!31533 m!863579))

(declare-fun m!863581 () Bool)

(assert (=> b!928788 m!863581))

(declare-fun m!863583 () Bool)

(assert (=> b!928788 m!863583))

(declare-fun m!863585 () Bool)

(assert (=> b!928790 m!863585))

(declare-fun m!863587 () Bool)

(assert (=> b!928783 m!863587))

(check-sat b_and!28409 (not b!928788) (not mapNonEmpty!31533) (not b!928782) (not start!79130) tp_is_empty!19851 (not b!928783) (not b!928790) (not b_next!17343))
(check-sat b_and!28409 (not b_next!17343))
