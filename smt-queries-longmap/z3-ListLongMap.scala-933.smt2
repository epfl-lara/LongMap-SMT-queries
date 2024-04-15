; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20698 () Bool)

(assert start!20698)

(declare-fun b_free!5353 () Bool)

(declare-fun b_next!5353 () Bool)

(assert (=> start!20698 (= b_free!5353 (not b_next!5353))))

(declare-fun tp!19091 () Bool)

(declare-fun b_and!12073 () Bool)

(assert (=> start!20698 (= tp!19091 b_and!12073)))

(declare-fun mapNonEmpty!8882 () Bool)

(declare-fun mapRes!8882 () Bool)

(declare-fun tp!19090 () Bool)

(declare-fun e!135059 () Bool)

(assert (=> mapNonEmpty!8882 (= mapRes!8882 (and tp!19090 e!135059))))

(declare-datatypes ((V!6593 0))(
  ( (V!6594 (val!2649 Int)) )
))
(declare-datatypes ((ValueCell!2261 0))(
  ( (ValueCellFull!2261 (v!4613 V!6593)) (EmptyCell!2261) )
))
(declare-fun mapRest!8882 () (Array (_ BitVec 32) ValueCell!2261))

(declare-fun mapKey!8882 () (_ BitVec 32))

(declare-fun mapValue!8882 () ValueCell!2261)

(declare-datatypes ((array!9613 0))(
  ( (array!9614 (arr!4556 (Array (_ BitVec 32) ValueCell!2261)) (size!4882 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9613)

(assert (=> mapNonEmpty!8882 (= (arr!4556 _values!649) (store mapRest!8882 mapKey!8882 mapValue!8882))))

(declare-fun b!206759 () Bool)

(declare-fun res!100239 () Bool)

(declare-fun e!135060 () Bool)

(assert (=> b!206759 (=> (not res!100239) (not e!135060))))

(declare-datatypes ((array!9615 0))(
  ( (array!9616 (arr!4557 (Array (_ BitVec 32) (_ BitVec 64))) (size!4883 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9615)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9615 (_ BitVec 32)) Bool)

(assert (=> b!206759 (= res!100239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206760 () Bool)

(declare-fun res!100238 () Bool)

(assert (=> b!206760 (=> (not res!100238) (not e!135060))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206760 (= res!100238 (= (select (arr!4557 _keys!825) i!601) k0!843))))

(declare-fun b!206761 () Bool)

(declare-fun tp_is_empty!5209 () Bool)

(assert (=> b!206761 (= e!135059 tp_is_empty!5209)))

(declare-fun b!206762 () Bool)

(assert (=> b!206762 (= e!135060 (not true))))

(declare-datatypes ((tuple2!4000 0))(
  ( (tuple2!4001 (_1!2011 (_ BitVec 64)) (_2!2011 V!6593)) )
))
(declare-datatypes ((List!2903 0))(
  ( (Nil!2900) (Cons!2899 (h!3541 tuple2!4000) (t!7825 List!2903)) )
))
(declare-datatypes ((ListLongMap!2903 0))(
  ( (ListLongMap!2904 (toList!1467 List!2903)) )
))
(declare-fun lt!105722 () ListLongMap!2903)

(declare-fun zeroValue!615 () V!6593)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6593)

(declare-fun getCurrentListMap!1008 (array!9615 array!9613 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) Int) ListLongMap!2903)

(assert (=> b!206762 (= lt!105722 (getCurrentListMap!1008 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105719 () ListLongMap!2903)

(declare-fun lt!105718 () array!9613)

(assert (=> b!206762 (= lt!105719 (getCurrentListMap!1008 _keys!825 lt!105718 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105721 () ListLongMap!2903)

(declare-fun lt!105720 () ListLongMap!2903)

(assert (=> b!206762 (and (= lt!105721 lt!105720) (= lt!105720 lt!105721))))

(declare-fun v!520 () V!6593)

(declare-fun lt!105717 () ListLongMap!2903)

(declare-fun +!516 (ListLongMap!2903 tuple2!4000) ListLongMap!2903)

(assert (=> b!206762 (= lt!105720 (+!516 lt!105717 (tuple2!4001 k0!843 v!520)))))

(declare-datatypes ((Unit!6272 0))(
  ( (Unit!6273) )
))
(declare-fun lt!105716 () Unit!6272)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!167 (array!9615 array!9613 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) (_ BitVec 64) V!6593 (_ BitVec 32) Int) Unit!6272)

(assert (=> b!206762 (= lt!105716 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!167 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!418 (array!9615 array!9613 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) Int) ListLongMap!2903)

(assert (=> b!206762 (= lt!105721 (getCurrentListMapNoExtraKeys!418 _keys!825 lt!105718 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206762 (= lt!105718 (array!9614 (store (arr!4556 _values!649) i!601 (ValueCellFull!2261 v!520)) (size!4882 _values!649)))))

(assert (=> b!206762 (= lt!105717 (getCurrentListMapNoExtraKeys!418 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206763 () Bool)

(declare-fun res!100240 () Bool)

(assert (=> b!206763 (=> (not res!100240) (not e!135060))))

(declare-datatypes ((List!2904 0))(
  ( (Nil!2901) (Cons!2900 (h!3542 (_ BitVec 64)) (t!7826 List!2904)) )
))
(declare-fun arrayNoDuplicates!0 (array!9615 (_ BitVec 32) List!2904) Bool)

(assert (=> b!206763 (= res!100240 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2901))))

(declare-fun b!206764 () Bool)

(declare-fun e!135063 () Bool)

(assert (=> b!206764 (= e!135063 tp_is_empty!5209)))

(declare-fun b!206765 () Bool)

(declare-fun res!100243 () Bool)

(assert (=> b!206765 (=> (not res!100243) (not e!135060))))

(assert (=> b!206765 (= res!100243 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4883 _keys!825))))))

(declare-fun mapIsEmpty!8882 () Bool)

(assert (=> mapIsEmpty!8882 mapRes!8882))

(declare-fun b!206767 () Bool)

(declare-fun e!135061 () Bool)

(assert (=> b!206767 (= e!135061 (and e!135063 mapRes!8882))))

(declare-fun condMapEmpty!8882 () Bool)

(declare-fun mapDefault!8882 () ValueCell!2261)

(assert (=> b!206767 (= condMapEmpty!8882 (= (arr!4556 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2261)) mapDefault!8882)))))

(declare-fun b!206768 () Bool)

(declare-fun res!100242 () Bool)

(assert (=> b!206768 (=> (not res!100242) (not e!135060))))

(assert (=> b!206768 (= res!100242 (and (= (size!4882 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4883 _keys!825) (size!4882 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100241 () Bool)

(assert (=> start!20698 (=> (not res!100241) (not e!135060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20698 (= res!100241 (validMask!0 mask!1149))))

(assert (=> start!20698 e!135060))

(declare-fun array_inv!2989 (array!9613) Bool)

(assert (=> start!20698 (and (array_inv!2989 _values!649) e!135061)))

(assert (=> start!20698 true))

(assert (=> start!20698 tp_is_empty!5209))

(declare-fun array_inv!2990 (array!9615) Bool)

(assert (=> start!20698 (array_inv!2990 _keys!825)))

(assert (=> start!20698 tp!19091))

(declare-fun b!206766 () Bool)

(declare-fun res!100244 () Bool)

(assert (=> b!206766 (=> (not res!100244) (not e!135060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206766 (= res!100244 (validKeyInArray!0 k0!843))))

(assert (= (and start!20698 res!100241) b!206768))

(assert (= (and b!206768 res!100242) b!206759))

(assert (= (and b!206759 res!100239) b!206763))

(assert (= (and b!206763 res!100240) b!206765))

(assert (= (and b!206765 res!100243) b!206766))

(assert (= (and b!206766 res!100244) b!206760))

(assert (= (and b!206760 res!100238) b!206762))

(assert (= (and b!206767 condMapEmpty!8882) mapIsEmpty!8882))

(assert (= (and b!206767 (not condMapEmpty!8882)) mapNonEmpty!8882))

(get-info :version)

(assert (= (and mapNonEmpty!8882 ((_ is ValueCellFull!2261) mapValue!8882)) b!206761))

(assert (= (and b!206767 ((_ is ValueCellFull!2261) mapDefault!8882)) b!206764))

(assert (= start!20698 b!206767))

(declare-fun m!234033 () Bool)

(assert (=> b!206759 m!234033))

(declare-fun m!234035 () Bool)

(assert (=> b!206766 m!234035))

(declare-fun m!234037 () Bool)

(assert (=> b!206762 m!234037))

(declare-fun m!234039 () Bool)

(assert (=> b!206762 m!234039))

(declare-fun m!234041 () Bool)

(assert (=> b!206762 m!234041))

(declare-fun m!234043 () Bool)

(assert (=> b!206762 m!234043))

(declare-fun m!234045 () Bool)

(assert (=> b!206762 m!234045))

(declare-fun m!234047 () Bool)

(assert (=> b!206762 m!234047))

(declare-fun m!234049 () Bool)

(assert (=> b!206762 m!234049))

(declare-fun m!234051 () Bool)

(assert (=> b!206760 m!234051))

(declare-fun m!234053 () Bool)

(assert (=> start!20698 m!234053))

(declare-fun m!234055 () Bool)

(assert (=> start!20698 m!234055))

(declare-fun m!234057 () Bool)

(assert (=> start!20698 m!234057))

(declare-fun m!234059 () Bool)

(assert (=> b!206763 m!234059))

(declare-fun m!234061 () Bool)

(assert (=> mapNonEmpty!8882 m!234061))

(check-sat (not mapNonEmpty!8882) tp_is_empty!5209 (not start!20698) b_and!12073 (not b!206759) (not b!206766) (not b_next!5353) (not b!206762) (not b!206763))
(check-sat b_and!12073 (not b_next!5353))
