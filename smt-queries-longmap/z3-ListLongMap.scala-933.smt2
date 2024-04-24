; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20698 () Bool)

(assert start!20698)

(declare-fun b_free!5353 () Bool)

(declare-fun b_next!5353 () Bool)

(assert (=> start!20698 (= b_free!5353 (not b_next!5353))))

(declare-fun tp!19090 () Bool)

(declare-fun b_and!12113 () Bool)

(assert (=> start!20698 (= tp!19090 b_and!12113)))

(declare-fun b!206953 () Bool)

(declare-fun res!100356 () Bool)

(declare-fun e!135186 () Bool)

(assert (=> b!206953 (=> (not res!100356) (not e!135186))))

(declare-datatypes ((array!9623 0))(
  ( (array!9624 (arr!4562 (Array (_ BitVec 32) (_ BitVec 64))) (size!4887 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9623)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6593 0))(
  ( (V!6594 (val!2649 Int)) )
))
(declare-datatypes ((ValueCell!2261 0))(
  ( (ValueCellFull!2261 (v!4620 V!6593)) (EmptyCell!2261) )
))
(declare-datatypes ((array!9625 0))(
  ( (array!9626 (arr!4563 (Array (_ BitVec 32) ValueCell!2261)) (size!4888 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9625)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206953 (= res!100356 (and (= (size!4888 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4887 _keys!825) (size!4888 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206954 () Bool)

(declare-fun res!100359 () Bool)

(assert (=> b!206954 (=> (not res!100359) (not e!135186))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206954 (= res!100359 (validKeyInArray!0 k0!843))))

(declare-fun b!206955 () Bool)

(declare-fun res!100360 () Bool)

(assert (=> b!206955 (=> (not res!100360) (not e!135186))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206955 (= res!100360 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4887 _keys!825))))))

(declare-fun b!206956 () Bool)

(declare-fun e!135184 () Bool)

(declare-fun tp_is_empty!5209 () Bool)

(assert (=> b!206956 (= e!135184 tp_is_empty!5209)))

(declare-fun mapIsEmpty!8882 () Bool)

(declare-fun mapRes!8882 () Bool)

(assert (=> mapIsEmpty!8882 mapRes!8882))

(declare-fun mapNonEmpty!8882 () Bool)

(declare-fun tp!19091 () Bool)

(assert (=> mapNonEmpty!8882 (= mapRes!8882 (and tp!19091 e!135184))))

(declare-fun mapKey!8882 () (_ BitVec 32))

(declare-fun mapRest!8882 () (Array (_ BitVec 32) ValueCell!2261))

(declare-fun mapValue!8882 () ValueCell!2261)

(assert (=> mapNonEmpty!8882 (= (arr!4563 _values!649) (store mapRest!8882 mapKey!8882 mapValue!8882))))

(declare-fun b!206957 () Bool)

(declare-fun res!100357 () Bool)

(assert (=> b!206957 (=> (not res!100357) (not e!135186))))

(declare-datatypes ((List!2859 0))(
  ( (Nil!2856) (Cons!2855 (h!3497 (_ BitVec 64)) (t!7782 List!2859)) )
))
(declare-fun arrayNoDuplicates!0 (array!9623 (_ BitVec 32) List!2859) Bool)

(assert (=> b!206957 (= res!100357 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2856))))

(declare-fun b!206958 () Bool)

(assert (=> b!206958 (= e!135186 (not true))))

(declare-datatypes ((tuple2!3972 0))(
  ( (tuple2!3973 (_1!1997 (_ BitVec 64)) (_2!1997 V!6593)) )
))
(declare-datatypes ((List!2860 0))(
  ( (Nil!2857) (Cons!2856 (h!3498 tuple2!3972) (t!7783 List!2860)) )
))
(declare-datatypes ((ListLongMap!2887 0))(
  ( (ListLongMap!2888 (toList!1459 List!2860)) )
))
(declare-fun lt!105956 () ListLongMap!2887)

(declare-fun zeroValue!615 () V!6593)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6593)

(declare-fun getCurrentListMap!1029 (array!9623 array!9625 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) Int) ListLongMap!2887)

(assert (=> b!206958 (= lt!105956 (getCurrentListMap!1029 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105959 () array!9625)

(declare-fun lt!105957 () ListLongMap!2887)

(assert (=> b!206958 (= lt!105957 (getCurrentListMap!1029 _keys!825 lt!105959 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105960 () ListLongMap!2887)

(declare-fun lt!105961 () ListLongMap!2887)

(assert (=> b!206958 (and (= lt!105960 lt!105961) (= lt!105961 lt!105960))))

(declare-fun lt!105962 () ListLongMap!2887)

(declare-fun v!520 () V!6593)

(declare-fun +!513 (ListLongMap!2887 tuple2!3972) ListLongMap!2887)

(assert (=> b!206958 (= lt!105961 (+!513 lt!105962 (tuple2!3973 k0!843 v!520)))))

(declare-datatypes ((Unit!6302 0))(
  ( (Unit!6303) )
))
(declare-fun lt!105958 () Unit!6302)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!165 (array!9623 array!9625 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) (_ BitVec 64) V!6593 (_ BitVec 32) Int) Unit!6302)

(assert (=> b!206958 (= lt!105958 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!165 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!422 (array!9623 array!9625 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) Int) ListLongMap!2887)

(assert (=> b!206958 (= lt!105960 (getCurrentListMapNoExtraKeys!422 _keys!825 lt!105959 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206958 (= lt!105959 (array!9626 (store (arr!4563 _values!649) i!601 (ValueCellFull!2261 v!520)) (size!4888 _values!649)))))

(assert (=> b!206958 (= lt!105962 (getCurrentListMapNoExtraKeys!422 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206959 () Bool)

(declare-fun e!135188 () Bool)

(assert (=> b!206959 (= e!135188 tp_is_empty!5209)))

(declare-fun b!206960 () Bool)

(declare-fun res!100354 () Bool)

(assert (=> b!206960 (=> (not res!100354) (not e!135186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9623 (_ BitVec 32)) Bool)

(assert (=> b!206960 (= res!100354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!100358 () Bool)

(assert (=> start!20698 (=> (not res!100358) (not e!135186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20698 (= res!100358 (validMask!0 mask!1149))))

(assert (=> start!20698 e!135186))

(declare-fun e!135187 () Bool)

(declare-fun array_inv!2989 (array!9625) Bool)

(assert (=> start!20698 (and (array_inv!2989 _values!649) e!135187)))

(assert (=> start!20698 true))

(assert (=> start!20698 tp_is_empty!5209))

(declare-fun array_inv!2990 (array!9623) Bool)

(assert (=> start!20698 (array_inv!2990 _keys!825)))

(assert (=> start!20698 tp!19090))

(declare-fun b!206961 () Bool)

(declare-fun res!100355 () Bool)

(assert (=> b!206961 (=> (not res!100355) (not e!135186))))

(assert (=> b!206961 (= res!100355 (= (select (arr!4562 _keys!825) i!601) k0!843))))

(declare-fun b!206962 () Bool)

(assert (=> b!206962 (= e!135187 (and e!135188 mapRes!8882))))

(declare-fun condMapEmpty!8882 () Bool)

(declare-fun mapDefault!8882 () ValueCell!2261)

(assert (=> b!206962 (= condMapEmpty!8882 (= (arr!4563 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2261)) mapDefault!8882)))))

(assert (= (and start!20698 res!100358) b!206953))

(assert (= (and b!206953 res!100356) b!206960))

(assert (= (and b!206960 res!100354) b!206957))

(assert (= (and b!206957 res!100357) b!206955))

(assert (= (and b!206955 res!100360) b!206954))

(assert (= (and b!206954 res!100359) b!206961))

(assert (= (and b!206961 res!100355) b!206958))

(assert (= (and b!206962 condMapEmpty!8882) mapIsEmpty!8882))

(assert (= (and b!206962 (not condMapEmpty!8882)) mapNonEmpty!8882))

(get-info :version)

(assert (= (and mapNonEmpty!8882 ((_ is ValueCellFull!2261) mapValue!8882)) b!206956))

(assert (= (and b!206962 ((_ is ValueCellFull!2261) mapDefault!8882)) b!206959))

(assert (= start!20698 b!206962))

(declare-fun m!234831 () Bool)

(assert (=> b!206960 m!234831))

(declare-fun m!234833 () Bool)

(assert (=> start!20698 m!234833))

(declare-fun m!234835 () Bool)

(assert (=> start!20698 m!234835))

(declare-fun m!234837 () Bool)

(assert (=> start!20698 m!234837))

(declare-fun m!234839 () Bool)

(assert (=> b!206954 m!234839))

(declare-fun m!234841 () Bool)

(assert (=> b!206958 m!234841))

(declare-fun m!234843 () Bool)

(assert (=> b!206958 m!234843))

(declare-fun m!234845 () Bool)

(assert (=> b!206958 m!234845))

(declare-fun m!234847 () Bool)

(assert (=> b!206958 m!234847))

(declare-fun m!234849 () Bool)

(assert (=> b!206958 m!234849))

(declare-fun m!234851 () Bool)

(assert (=> b!206958 m!234851))

(declare-fun m!234853 () Bool)

(assert (=> b!206958 m!234853))

(declare-fun m!234855 () Bool)

(assert (=> b!206961 m!234855))

(declare-fun m!234857 () Bool)

(assert (=> b!206957 m!234857))

(declare-fun m!234859 () Bool)

(assert (=> mapNonEmpty!8882 m!234859))

(check-sat (not b!206957) (not b!206960) (not b!206958) b_and!12113 (not b!206954) tp_is_empty!5209 (not start!20698) (not b_next!5353) (not mapNonEmpty!8882))
(check-sat b_and!12113 (not b_next!5353))
