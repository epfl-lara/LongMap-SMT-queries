; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20260 () Bool)

(assert start!20260)

(declare-fun b_free!4915 () Bool)

(declare-fun b_next!4915 () Bool)

(assert (=> start!20260 (= b_free!4915 (not b_next!4915))))

(declare-fun tp!17776 () Bool)

(declare-fun b_and!11635 () Bool)

(assert (=> start!20260 (= tp!17776 b_and!11635)))

(declare-fun b!199127 () Bool)

(declare-fun res!94577 () Bool)

(declare-fun e!130742 () Bool)

(assert (=> b!199127 (=> (not res!94577) (not e!130742))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199127 (= res!94577 (validKeyInArray!0 k0!843))))

(declare-fun res!94579 () Bool)

(assert (=> start!20260 (=> (not res!94579) (not e!130742))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20260 (= res!94579 (validMask!0 mask!1149))))

(assert (=> start!20260 e!130742))

(declare-datatypes ((V!6009 0))(
  ( (V!6010 (val!2430 Int)) )
))
(declare-datatypes ((ValueCell!2042 0))(
  ( (ValueCellFull!2042 (v!4394 V!6009)) (EmptyCell!2042) )
))
(declare-datatypes ((array!8763 0))(
  ( (array!8764 (arr!4131 (Array (_ BitVec 32) ValueCell!2042)) (size!4457 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8763)

(declare-fun e!130739 () Bool)

(declare-fun array_inv!2695 (array!8763) Bool)

(assert (=> start!20260 (and (array_inv!2695 _values!649) e!130739)))

(assert (=> start!20260 true))

(declare-fun tp_is_empty!4771 () Bool)

(assert (=> start!20260 tp_is_empty!4771))

(declare-datatypes ((array!8765 0))(
  ( (array!8766 (arr!4132 (Array (_ BitVec 32) (_ BitVec 64))) (size!4458 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8765)

(declare-fun array_inv!2696 (array!8765) Bool)

(assert (=> start!20260 (array_inv!2696 _keys!825)))

(assert (=> start!20260 tp!17776))

(declare-fun b!199128 () Bool)

(declare-fun res!94581 () Bool)

(assert (=> b!199128 (=> (not res!94581) (not e!130742))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199128 (= res!94581 (and (= (size!4457 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4458 _keys!825) (size!4457 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8225 () Bool)

(declare-fun mapRes!8225 () Bool)

(declare-fun tp!17777 () Bool)

(declare-fun e!130741 () Bool)

(assert (=> mapNonEmpty!8225 (= mapRes!8225 (and tp!17777 e!130741))))

(declare-fun mapRest!8225 () (Array (_ BitVec 32) ValueCell!2042))

(declare-fun mapValue!8225 () ValueCell!2042)

(declare-fun mapKey!8225 () (_ BitVec 32))

(assert (=> mapNonEmpty!8225 (= (arr!4131 _values!649) (store mapRest!8225 mapKey!8225 mapValue!8225))))

(declare-fun b!199129 () Bool)

(declare-fun res!94582 () Bool)

(assert (=> b!199129 (=> (not res!94582) (not e!130742))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199129 (= res!94582 (= (select (arr!4132 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8225 () Bool)

(assert (=> mapIsEmpty!8225 mapRes!8225))

(declare-fun b!199130 () Bool)

(declare-fun res!94580 () Bool)

(assert (=> b!199130 (=> (not res!94580) (not e!130742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8765 (_ BitVec 32)) Bool)

(assert (=> b!199130 (= res!94580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199131 () Bool)

(declare-fun res!94583 () Bool)

(assert (=> b!199131 (=> (not res!94583) (not e!130742))))

(assert (=> b!199131 (= res!94583 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4458 _keys!825))))))

(declare-fun b!199132 () Bool)

(declare-fun res!94578 () Bool)

(assert (=> b!199132 (=> (not res!94578) (not e!130742))))

(declare-datatypes ((List!2574 0))(
  ( (Nil!2571) (Cons!2570 (h!3212 (_ BitVec 64)) (t!7496 List!2574)) )
))
(declare-fun arrayNoDuplicates!0 (array!8765 (_ BitVec 32) List!2574) Bool)

(assert (=> b!199132 (= res!94578 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2571))))

(declare-fun b!199133 () Bool)

(assert (=> b!199133 (= e!130742 (not (bvsle #b00000000000000000000000000000000 (size!4458 _keys!825))))))

(declare-datatypes ((tuple2!3644 0))(
  ( (tuple2!3645 (_1!1833 (_ BitVec 64)) (_2!1833 V!6009)) )
))
(declare-datatypes ((List!2575 0))(
  ( (Nil!2572) (Cons!2571 (h!3213 tuple2!3644) (t!7497 List!2575)) )
))
(declare-datatypes ((ListLongMap!2547 0))(
  ( (ListLongMap!2548 (toList!1289 List!2575)) )
))
(declare-fun lt!98053 () ListLongMap!2547)

(declare-fun lt!98054 () ListLongMap!2547)

(assert (=> b!199133 (and (= lt!98053 lt!98054) (= lt!98054 lt!98053))))

(declare-fun lt!98051 () ListLongMap!2547)

(declare-fun v!520 () V!6009)

(declare-fun +!338 (ListLongMap!2547 tuple2!3644) ListLongMap!2547)

(assert (=> b!199133 (= lt!98054 (+!338 lt!98051 (tuple2!3645 k0!843 v!520)))))

(declare-datatypes ((Unit!5928 0))(
  ( (Unit!5929) )
))
(declare-fun lt!98052 () Unit!5928)

(declare-fun zeroValue!615 () V!6009)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6009)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!18 (array!8765 array!8763 (_ BitVec 32) (_ BitVec 32) V!6009 V!6009 (_ BitVec 32) (_ BitVec 64) V!6009 (_ BitVec 32) Int) Unit!5928)

(assert (=> b!199133 (= lt!98052 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!18 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!269 (array!8765 array!8763 (_ BitVec 32) (_ BitVec 32) V!6009 V!6009 (_ BitVec 32) Int) ListLongMap!2547)

(assert (=> b!199133 (= lt!98053 (getCurrentListMapNoExtraKeys!269 _keys!825 (array!8764 (store (arr!4131 _values!649) i!601 (ValueCellFull!2042 v!520)) (size!4457 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199133 (= lt!98051 (getCurrentListMapNoExtraKeys!269 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199134 () Bool)

(declare-fun e!130740 () Bool)

(assert (=> b!199134 (= e!130739 (and e!130740 mapRes!8225))))

(declare-fun condMapEmpty!8225 () Bool)

(declare-fun mapDefault!8225 () ValueCell!2042)

(assert (=> b!199134 (= condMapEmpty!8225 (= (arr!4131 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2042)) mapDefault!8225)))))

(declare-fun b!199135 () Bool)

(assert (=> b!199135 (= e!130740 tp_is_empty!4771)))

(declare-fun b!199136 () Bool)

(assert (=> b!199136 (= e!130741 tp_is_empty!4771)))

(assert (= (and start!20260 res!94579) b!199128))

(assert (= (and b!199128 res!94581) b!199130))

(assert (= (and b!199130 res!94580) b!199132))

(assert (= (and b!199132 res!94578) b!199131))

(assert (= (and b!199131 res!94583) b!199127))

(assert (= (and b!199127 res!94577) b!199129))

(assert (= (and b!199129 res!94582) b!199133))

(assert (= (and b!199134 condMapEmpty!8225) mapIsEmpty!8225))

(assert (= (and b!199134 (not condMapEmpty!8225)) mapNonEmpty!8225))

(get-info :version)

(assert (= (and mapNonEmpty!8225 ((_ is ValueCellFull!2042) mapValue!8225)) b!199136))

(assert (= (and b!199134 ((_ is ValueCellFull!2042) mapDefault!8225)) b!199135))

(assert (= start!20260 b!199134))

(declare-fun m!225141 () Bool)

(assert (=> b!199130 m!225141))

(declare-fun m!225143 () Bool)

(assert (=> start!20260 m!225143))

(declare-fun m!225145 () Bool)

(assert (=> start!20260 m!225145))

(declare-fun m!225147 () Bool)

(assert (=> start!20260 m!225147))

(declare-fun m!225149 () Bool)

(assert (=> b!199132 m!225149))

(declare-fun m!225151 () Bool)

(assert (=> b!199127 m!225151))

(declare-fun m!225153 () Bool)

(assert (=> b!199133 m!225153))

(declare-fun m!225155 () Bool)

(assert (=> b!199133 m!225155))

(declare-fun m!225157 () Bool)

(assert (=> b!199133 m!225157))

(declare-fun m!225159 () Bool)

(assert (=> b!199133 m!225159))

(declare-fun m!225161 () Bool)

(assert (=> b!199133 m!225161))

(declare-fun m!225163 () Bool)

(assert (=> mapNonEmpty!8225 m!225163))

(declare-fun m!225165 () Bool)

(assert (=> b!199129 m!225165))

(check-sat (not b_next!4915) b_and!11635 (not b!199130) (not b!199132) (not mapNonEmpty!8225) tp_is_empty!4771 (not start!20260) (not b!199133) (not b!199127))
(check-sat b_and!11635 (not b_next!4915))
