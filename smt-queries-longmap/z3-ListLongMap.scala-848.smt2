; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20188 () Bool)

(assert start!20188)

(declare-fun b_free!4843 () Bool)

(declare-fun b_next!4843 () Bool)

(assert (=> start!20188 (= b_free!4843 (not b_next!4843))))

(declare-fun tp!17561 () Bool)

(declare-fun b_and!11563 () Bool)

(assert (=> start!20188 (= tp!17561 b_and!11563)))

(declare-fun b!198047 () Bool)

(declare-fun e!130201 () Bool)

(declare-fun tp_is_empty!4699 () Bool)

(assert (=> b!198047 (= e!130201 tp_is_empty!4699)))

(declare-fun b!198048 () Bool)

(declare-fun res!93822 () Bool)

(declare-fun e!130203 () Bool)

(assert (=> b!198048 (=> (not res!93822) (not e!130203))))

(declare-datatypes ((array!8625 0))(
  ( (array!8626 (arr!4062 (Array (_ BitVec 32) (_ BitVec 64))) (size!4388 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8625)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5913 0))(
  ( (V!5914 (val!2394 Int)) )
))
(declare-datatypes ((ValueCell!2006 0))(
  ( (ValueCellFull!2006 (v!4358 V!5913)) (EmptyCell!2006) )
))
(declare-datatypes ((array!8627 0))(
  ( (array!8628 (arr!4063 (Array (_ BitVec 32) ValueCell!2006)) (size!4389 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8627)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198048 (= res!93822 (and (= (size!4389 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4388 _keys!825) (size!4389 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198049 () Bool)

(declare-fun e!130199 () Bool)

(declare-fun e!130202 () Bool)

(declare-fun mapRes!8117 () Bool)

(assert (=> b!198049 (= e!130199 (and e!130202 mapRes!8117))))

(declare-fun condMapEmpty!8117 () Bool)

(declare-fun mapDefault!8117 () ValueCell!2006)

(assert (=> b!198049 (= condMapEmpty!8117 (= (arr!4063 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2006)) mapDefault!8117)))))

(declare-fun b!198050 () Bool)

(declare-fun res!93824 () Bool)

(assert (=> b!198050 (=> (not res!93824) (not e!130203))))

(declare-datatypes ((List!2525 0))(
  ( (Nil!2522) (Cons!2521 (h!3163 (_ BitVec 64)) (t!7447 List!2525)) )
))
(declare-fun arrayNoDuplicates!0 (array!8625 (_ BitVec 32) List!2525) Bool)

(assert (=> b!198050 (= res!93824 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2522))))

(declare-fun b!198051 () Bool)

(assert (=> b!198051 (= e!130202 tp_is_empty!4699)))

(declare-fun mapIsEmpty!8117 () Bool)

(assert (=> mapIsEmpty!8117 mapRes!8117))

(declare-fun b!198053 () Bool)

(declare-fun res!93827 () Bool)

(assert (=> b!198053 (=> (not res!93827) (not e!130203))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198053 (= res!93827 (= (select (arr!4062 _keys!825) i!601) k0!843))))

(declare-fun b!198054 () Bool)

(assert (=> b!198054 (= e!130203 false)))

(declare-fun v!520 () V!5913)

(declare-fun zeroValue!615 () V!5913)

(declare-datatypes ((tuple2!3592 0))(
  ( (tuple2!3593 (_1!1807 (_ BitVec 64)) (_2!1807 V!5913)) )
))
(declare-datatypes ((List!2526 0))(
  ( (Nil!2523) (Cons!2522 (h!3164 tuple2!3592) (t!7448 List!2526)) )
))
(declare-datatypes ((ListLongMap!2495 0))(
  ( (ListLongMap!2496 (toList!1263 List!2526)) )
))
(declare-fun lt!97688 () ListLongMap!2495)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5913)

(declare-fun getCurrentListMapNoExtraKeys!243 (array!8625 array!8627 (_ BitVec 32) (_ BitVec 32) V!5913 V!5913 (_ BitVec 32) Int) ListLongMap!2495)

(assert (=> b!198054 (= lt!97688 (getCurrentListMapNoExtraKeys!243 _keys!825 (array!8628 (store (arr!4063 _values!649) i!601 (ValueCellFull!2006 v!520)) (size!4389 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97687 () ListLongMap!2495)

(assert (=> b!198054 (= lt!97687 (getCurrentListMapNoExtraKeys!243 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198055 () Bool)

(declare-fun res!93823 () Bool)

(assert (=> b!198055 (=> (not res!93823) (not e!130203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8625 (_ BitVec 32)) Bool)

(assert (=> b!198055 (= res!93823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198056 () Bool)

(declare-fun res!93825 () Bool)

(assert (=> b!198056 (=> (not res!93825) (not e!130203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198056 (= res!93825 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8117 () Bool)

(declare-fun tp!17560 () Bool)

(assert (=> mapNonEmpty!8117 (= mapRes!8117 (and tp!17560 e!130201))))

(declare-fun mapRest!8117 () (Array (_ BitVec 32) ValueCell!2006))

(declare-fun mapKey!8117 () (_ BitVec 32))

(declare-fun mapValue!8117 () ValueCell!2006)

(assert (=> mapNonEmpty!8117 (= (arr!4063 _values!649) (store mapRest!8117 mapKey!8117 mapValue!8117))))

(declare-fun b!198052 () Bool)

(declare-fun res!93821 () Bool)

(assert (=> b!198052 (=> (not res!93821) (not e!130203))))

(assert (=> b!198052 (= res!93821 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4388 _keys!825))))))

(declare-fun res!93826 () Bool)

(assert (=> start!20188 (=> (not res!93826) (not e!130203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20188 (= res!93826 (validMask!0 mask!1149))))

(assert (=> start!20188 e!130203))

(declare-fun array_inv!2643 (array!8627) Bool)

(assert (=> start!20188 (and (array_inv!2643 _values!649) e!130199)))

(assert (=> start!20188 true))

(assert (=> start!20188 tp_is_empty!4699))

(declare-fun array_inv!2644 (array!8625) Bool)

(assert (=> start!20188 (array_inv!2644 _keys!825)))

(assert (=> start!20188 tp!17561))

(assert (= (and start!20188 res!93826) b!198048))

(assert (= (and b!198048 res!93822) b!198055))

(assert (= (and b!198055 res!93823) b!198050))

(assert (= (and b!198050 res!93824) b!198052))

(assert (= (and b!198052 res!93821) b!198056))

(assert (= (and b!198056 res!93825) b!198053))

(assert (= (and b!198053 res!93827) b!198054))

(assert (= (and b!198049 condMapEmpty!8117) mapIsEmpty!8117))

(assert (= (and b!198049 (not condMapEmpty!8117)) mapNonEmpty!8117))

(get-info :version)

(assert (= (and mapNonEmpty!8117 ((_ is ValueCellFull!2006) mapValue!8117)) b!198047))

(assert (= (and b!198049 ((_ is ValueCellFull!2006) mapDefault!8117)) b!198051))

(assert (= start!20188 b!198049))

(declare-fun m!224253 () Bool)

(assert (=> b!198054 m!224253))

(declare-fun m!224255 () Bool)

(assert (=> b!198054 m!224255))

(declare-fun m!224257 () Bool)

(assert (=> b!198054 m!224257))

(declare-fun m!224259 () Bool)

(assert (=> b!198056 m!224259))

(declare-fun m!224261 () Bool)

(assert (=> b!198055 m!224261))

(declare-fun m!224263 () Bool)

(assert (=> mapNonEmpty!8117 m!224263))

(declare-fun m!224265 () Bool)

(assert (=> b!198050 m!224265))

(declare-fun m!224267 () Bool)

(assert (=> b!198053 m!224267))

(declare-fun m!224269 () Bool)

(assert (=> start!20188 m!224269))

(declare-fun m!224271 () Bool)

(assert (=> start!20188 m!224271))

(declare-fun m!224273 () Bool)

(assert (=> start!20188 m!224273))

(check-sat (not b!198056) (not mapNonEmpty!8117) (not b_next!4843) (not start!20188) (not b!198050) (not b!198055) b_and!11563 (not b!198054) tp_is_empty!4699)
(check-sat b_and!11563 (not b_next!4843))
