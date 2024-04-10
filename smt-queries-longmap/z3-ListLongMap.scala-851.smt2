; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20204 () Bool)

(assert start!20204)

(declare-fun b_free!4863 () Bool)

(declare-fun b_next!4863 () Bool)

(assert (=> start!20204 (= b_free!4863 (not b_next!4863))))

(declare-fun tp!17621 () Bool)

(declare-fun b_and!11609 () Bool)

(assert (=> start!20204 (= tp!17621 b_and!11609)))

(declare-fun b!198494 () Bool)

(declare-fun res!94126 () Bool)

(declare-fun e!130453 () Bool)

(assert (=> b!198494 (=> (not res!94126) (not e!130453))))

(declare-datatypes ((array!8687 0))(
  ( (array!8688 (arr!4094 (Array (_ BitVec 32) (_ BitVec 64))) (size!4419 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8687)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5939 0))(
  ( (V!5940 (val!2404 Int)) )
))
(declare-datatypes ((ValueCell!2016 0))(
  ( (ValueCellFull!2016 (v!4374 V!5939)) (EmptyCell!2016) )
))
(declare-datatypes ((array!8689 0))(
  ( (array!8690 (arr!4095 (Array (_ BitVec 32) ValueCell!2016)) (size!4420 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8689)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198494 (= res!94126 (and (= (size!4420 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4419 _keys!825) (size!4420 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198495 () Bool)

(declare-fun e!130452 () Bool)

(declare-fun e!130454 () Bool)

(declare-fun mapRes!8147 () Bool)

(assert (=> b!198495 (= e!130452 (and e!130454 mapRes!8147))))

(declare-fun condMapEmpty!8147 () Bool)

(declare-fun mapDefault!8147 () ValueCell!2016)

(assert (=> b!198495 (= condMapEmpty!8147 (= (arr!4095 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2016)) mapDefault!8147)))))

(declare-fun b!198496 () Bool)

(declare-fun res!94127 () Bool)

(assert (=> b!198496 (=> (not res!94127) (not e!130453))))

(declare-datatypes ((List!2560 0))(
  ( (Nil!2557) (Cons!2556 (h!3198 (_ BitVec 64)) (t!7491 List!2560)) )
))
(declare-fun arrayNoDuplicates!0 (array!8687 (_ BitVec 32) List!2560) Bool)

(assert (=> b!198496 (= res!94127 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2557))))

(declare-fun mapIsEmpty!8147 () Bool)

(assert (=> mapIsEmpty!8147 mapRes!8147))

(declare-fun b!198498 () Bool)

(declare-fun tp_is_empty!4719 () Bool)

(assert (=> b!198498 (= e!130454 tp_is_empty!4719)))

(declare-fun b!198499 () Bool)

(declare-fun res!94128 () Bool)

(assert (=> b!198499 (=> (not res!94128) (not e!130453))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198499 (= res!94128 (= (select (arr!4094 _keys!825) i!601) k0!843))))

(declare-fun b!198500 () Bool)

(declare-fun res!94129 () Bool)

(assert (=> b!198500 (=> (not res!94129) (not e!130453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8687 (_ BitVec 32)) Bool)

(assert (=> b!198500 (= res!94129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198501 () Bool)

(declare-fun res!94132 () Bool)

(assert (=> b!198501 (=> (not res!94132) (not e!130453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198501 (= res!94132 (validKeyInArray!0 k0!843))))

(declare-fun b!198502 () Bool)

(assert (=> b!198502 (= e!130453 false)))

(declare-fun v!520 () V!5939)

(declare-fun zeroValue!615 () V!5939)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3646 0))(
  ( (tuple2!3647 (_1!1834 (_ BitVec 64)) (_2!1834 V!5939)) )
))
(declare-datatypes ((List!2561 0))(
  ( (Nil!2558) (Cons!2557 (h!3199 tuple2!3646) (t!7492 List!2561)) )
))
(declare-datatypes ((ListLongMap!2559 0))(
  ( (ListLongMap!2560 (toList!1295 List!2561)) )
))
(declare-fun lt!97928 () ListLongMap!2559)

(declare-fun minValue!615 () V!5939)

(declare-fun getCurrentListMapNoExtraKeys!260 (array!8687 array!8689 (_ BitVec 32) (_ BitVec 32) V!5939 V!5939 (_ BitVec 32) Int) ListLongMap!2559)

(assert (=> b!198502 (= lt!97928 (getCurrentListMapNoExtraKeys!260 _keys!825 (array!8690 (store (arr!4095 _values!649) i!601 (ValueCellFull!2016 v!520)) (size!4420 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97929 () ListLongMap!2559)

(assert (=> b!198502 (= lt!97929 (getCurrentListMapNoExtraKeys!260 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198497 () Bool)

(declare-fun e!130451 () Bool)

(assert (=> b!198497 (= e!130451 tp_is_empty!4719)))

(declare-fun res!94130 () Bool)

(assert (=> start!20204 (=> (not res!94130) (not e!130453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20204 (= res!94130 (validMask!0 mask!1149))))

(assert (=> start!20204 e!130453))

(declare-fun array_inv!2681 (array!8689) Bool)

(assert (=> start!20204 (and (array_inv!2681 _values!649) e!130452)))

(assert (=> start!20204 true))

(assert (=> start!20204 tp_is_empty!4719))

(declare-fun array_inv!2682 (array!8687) Bool)

(assert (=> start!20204 (array_inv!2682 _keys!825)))

(assert (=> start!20204 tp!17621))

(declare-fun mapNonEmpty!8147 () Bool)

(declare-fun tp!17620 () Bool)

(assert (=> mapNonEmpty!8147 (= mapRes!8147 (and tp!17620 e!130451))))

(declare-fun mapValue!8147 () ValueCell!2016)

(declare-fun mapRest!8147 () (Array (_ BitVec 32) ValueCell!2016))

(declare-fun mapKey!8147 () (_ BitVec 32))

(assert (=> mapNonEmpty!8147 (= (arr!4095 _values!649) (store mapRest!8147 mapKey!8147 mapValue!8147))))

(declare-fun b!198503 () Bool)

(declare-fun res!94131 () Bool)

(assert (=> b!198503 (=> (not res!94131) (not e!130453))))

(assert (=> b!198503 (= res!94131 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4419 _keys!825))))))

(assert (= (and start!20204 res!94130) b!198494))

(assert (= (and b!198494 res!94126) b!198500))

(assert (= (and b!198500 res!94129) b!198496))

(assert (= (and b!198496 res!94127) b!198503))

(assert (= (and b!198503 res!94131) b!198501))

(assert (= (and b!198501 res!94132) b!198499))

(assert (= (and b!198499 res!94128) b!198502))

(assert (= (and b!198495 condMapEmpty!8147) mapIsEmpty!8147))

(assert (= (and b!198495 (not condMapEmpty!8147)) mapNonEmpty!8147))

(get-info :version)

(assert (= (and mapNonEmpty!8147 ((_ is ValueCellFull!2016) mapValue!8147)) b!198497))

(assert (= (and b!198495 ((_ is ValueCellFull!2016) mapDefault!8147)) b!198498))

(assert (= start!20204 b!198495))

(declare-fun m!225089 () Bool)

(assert (=> b!198501 m!225089))

(declare-fun m!225091 () Bool)

(assert (=> start!20204 m!225091))

(declare-fun m!225093 () Bool)

(assert (=> start!20204 m!225093))

(declare-fun m!225095 () Bool)

(assert (=> start!20204 m!225095))

(declare-fun m!225097 () Bool)

(assert (=> b!198502 m!225097))

(declare-fun m!225099 () Bool)

(assert (=> b!198502 m!225099))

(declare-fun m!225101 () Bool)

(assert (=> b!198502 m!225101))

(declare-fun m!225103 () Bool)

(assert (=> mapNonEmpty!8147 m!225103))

(declare-fun m!225105 () Bool)

(assert (=> b!198496 m!225105))

(declare-fun m!225107 () Bool)

(assert (=> b!198499 m!225107))

(declare-fun m!225109 () Bool)

(assert (=> b!198500 m!225109))

(check-sat (not b!198496) (not b!198502) (not start!20204) (not b!198500) (not b!198501) (not b_next!4863) tp_is_empty!4719 b_and!11609 (not mapNonEmpty!8147))
(check-sat b_and!11609 (not b_next!4863))
