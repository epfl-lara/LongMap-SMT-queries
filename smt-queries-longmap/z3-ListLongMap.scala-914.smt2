; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20584 () Bool)

(assert start!20584)

(declare-fun b_free!5239 () Bool)

(declare-fun b_next!5239 () Bool)

(assert (=> start!20584 (= b_free!5239 (not b_next!5239))))

(declare-fun tp!18749 () Bool)

(declare-fun b_and!11999 () Bool)

(assert (=> start!20584 (= tp!18749 b_and!11999)))

(declare-fun b!204995 () Bool)

(declare-fun e!134085 () Bool)

(declare-fun e!134087 () Bool)

(declare-fun mapRes!8711 () Bool)

(assert (=> b!204995 (= e!134085 (and e!134087 mapRes!8711))))

(declare-fun condMapEmpty!8711 () Bool)

(declare-datatypes ((V!6441 0))(
  ( (V!6442 (val!2592 Int)) )
))
(declare-datatypes ((ValueCell!2204 0))(
  ( (ValueCellFull!2204 (v!4563 V!6441)) (EmptyCell!2204) )
))
(declare-datatypes ((array!9399 0))(
  ( (array!9400 (arr!4450 (Array (_ BitVec 32) ValueCell!2204)) (size!4775 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9399)

(declare-fun mapDefault!8711 () ValueCell!2204)

(assert (=> b!204995 (= condMapEmpty!8711 (= (arr!4450 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2204)) mapDefault!8711)))))

(declare-fun b!204996 () Bool)

(declare-fun e!134082 () Bool)

(declare-fun e!134084 () Bool)

(assert (=> b!204996 (= e!134082 (not e!134084))))

(declare-fun res!98915 () Bool)

(assert (=> b!204996 (=> res!98915 e!134084)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204996 (= res!98915 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3880 0))(
  ( (tuple2!3881 (_1!1951 (_ BitVec 64)) (_2!1951 V!6441)) )
))
(declare-datatypes ((List!2775 0))(
  ( (Nil!2772) (Cons!2771 (h!3413 tuple2!3880) (t!7698 List!2775)) )
))
(declare-datatypes ((ListLongMap!2795 0))(
  ( (ListLongMap!2796 (toList!1413 List!2775)) )
))
(declare-fun lt!104146 () ListLongMap!2795)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6441)

(declare-datatypes ((array!9401 0))(
  ( (array!9402 (arr!4451 (Array (_ BitVec 32) (_ BitVec 64))) (size!4776 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9401)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6441)

(declare-fun getCurrentListMap!988 (array!9401 array!9399 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) Int) ListLongMap!2795)

(assert (=> b!204996 (= lt!104146 (getCurrentListMap!988 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104142 () ListLongMap!2795)

(declare-fun lt!104149 () array!9399)

(assert (=> b!204996 (= lt!104142 (getCurrentListMap!988 _keys!825 lt!104149 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104148 () ListLongMap!2795)

(declare-fun lt!104147 () ListLongMap!2795)

(assert (=> b!204996 (and (= lt!104148 lt!104147) (= lt!104147 lt!104148))))

(declare-fun lt!104145 () ListLongMap!2795)

(declare-fun lt!104144 () tuple2!3880)

(declare-fun +!467 (ListLongMap!2795 tuple2!3880) ListLongMap!2795)

(assert (=> b!204996 (= lt!104147 (+!467 lt!104145 lt!104144))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6441)

(assert (=> b!204996 (= lt!104144 (tuple2!3881 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6212 0))(
  ( (Unit!6213) )
))
(declare-fun lt!104141 () Unit!6212)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!124 (array!9401 array!9399 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) (_ BitVec 64) V!6441 (_ BitVec 32) Int) Unit!6212)

(assert (=> b!204996 (= lt!104141 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!124 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!381 (array!9401 array!9399 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) Int) ListLongMap!2795)

(assert (=> b!204996 (= lt!104148 (getCurrentListMapNoExtraKeys!381 _keys!825 lt!104149 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204996 (= lt!104149 (array!9400 (store (arr!4450 _values!649) i!601 (ValueCellFull!2204 v!520)) (size!4775 _values!649)))))

(assert (=> b!204996 (= lt!104145 (getCurrentListMapNoExtraKeys!381 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204997 () Bool)

(declare-fun e!134081 () Bool)

(declare-fun tp_is_empty!5095 () Bool)

(assert (=> b!204997 (= e!134081 tp_is_empty!5095)))

(declare-fun b!204998 () Bool)

(declare-fun res!98917 () Bool)

(assert (=> b!204998 (=> (not res!98917) (not e!134082))))

(assert (=> b!204998 (= res!98917 (= (select (arr!4451 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8711 () Bool)

(assert (=> mapIsEmpty!8711 mapRes!8711))

(declare-fun b!204999 () Bool)

(declare-fun res!98912 () Bool)

(assert (=> b!204999 (=> (not res!98912) (not e!134082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9401 (_ BitVec 32)) Bool)

(assert (=> b!204999 (= res!98912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205000 () Bool)

(declare-fun res!98914 () Bool)

(assert (=> b!205000 (=> (not res!98914) (not e!134082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205000 (= res!98914 (validKeyInArray!0 k0!843))))

(declare-fun res!98909 () Bool)

(assert (=> start!20584 (=> (not res!98909) (not e!134082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20584 (= res!98909 (validMask!0 mask!1149))))

(assert (=> start!20584 e!134082))

(declare-fun array_inv!2915 (array!9399) Bool)

(assert (=> start!20584 (and (array_inv!2915 _values!649) e!134085)))

(assert (=> start!20584 true))

(assert (=> start!20584 tp_is_empty!5095))

(declare-fun array_inv!2916 (array!9401) Bool)

(assert (=> start!20584 (array_inv!2916 _keys!825)))

(assert (=> start!20584 tp!18749))

(declare-fun b!205001 () Bool)

(declare-fun res!98916 () Bool)

(assert (=> b!205001 (=> (not res!98916) (not e!134082))))

(declare-datatypes ((List!2776 0))(
  ( (Nil!2773) (Cons!2772 (h!3414 (_ BitVec 64)) (t!7699 List!2776)) )
))
(declare-fun arrayNoDuplicates!0 (array!9401 (_ BitVec 32) List!2776) Bool)

(assert (=> b!205001 (= res!98916 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2773))))

(declare-fun b!205002 () Bool)

(declare-fun e!134083 () Bool)

(assert (=> b!205002 (= e!134083 true)))

(declare-fun lt!104150 () ListLongMap!2795)

(declare-fun lt!104143 () ListLongMap!2795)

(assert (=> b!205002 (= lt!104150 (+!467 lt!104143 lt!104144))))

(declare-fun lt!104140 () Unit!6212)

(declare-fun addCommutativeForDiffKeys!175 (ListLongMap!2795 (_ BitVec 64) V!6441 (_ BitVec 64) V!6441) Unit!6212)

(assert (=> b!205002 (= lt!104140 (addCommutativeForDiffKeys!175 lt!104145 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205003 () Bool)

(declare-fun res!98913 () Bool)

(assert (=> b!205003 (=> (not res!98913) (not e!134082))))

(assert (=> b!205003 (= res!98913 (and (= (size!4775 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4776 _keys!825) (size!4775 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8711 () Bool)

(declare-fun tp!18748 () Bool)

(assert (=> mapNonEmpty!8711 (= mapRes!8711 (and tp!18748 e!134081))))

(declare-fun mapValue!8711 () ValueCell!2204)

(declare-fun mapKey!8711 () (_ BitVec 32))

(declare-fun mapRest!8711 () (Array (_ BitVec 32) ValueCell!2204))

(assert (=> mapNonEmpty!8711 (= (arr!4450 _values!649) (store mapRest!8711 mapKey!8711 mapValue!8711))))

(declare-fun b!205004 () Bool)

(assert (=> b!205004 (= e!134084 e!134083)))

(declare-fun res!98910 () Bool)

(assert (=> b!205004 (=> res!98910 e!134083)))

(assert (=> b!205004 (= res!98910 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205004 (= lt!104146 lt!104143)))

(declare-fun lt!104139 () tuple2!3880)

(assert (=> b!205004 (= lt!104143 (+!467 lt!104145 lt!104139))))

(assert (=> b!205004 (= lt!104142 lt!104150)))

(assert (=> b!205004 (= lt!104150 (+!467 lt!104147 lt!104139))))

(assert (=> b!205004 (= lt!104142 (+!467 lt!104148 lt!104139))))

(assert (=> b!205004 (= lt!104139 (tuple2!3881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205005 () Bool)

(declare-fun res!98911 () Bool)

(assert (=> b!205005 (=> (not res!98911) (not e!134082))))

(assert (=> b!205005 (= res!98911 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4776 _keys!825))))))

(declare-fun b!205006 () Bool)

(assert (=> b!205006 (= e!134087 tp_is_empty!5095)))

(assert (= (and start!20584 res!98909) b!205003))

(assert (= (and b!205003 res!98913) b!204999))

(assert (= (and b!204999 res!98912) b!205001))

(assert (= (and b!205001 res!98916) b!205005))

(assert (= (and b!205005 res!98911) b!205000))

(assert (= (and b!205000 res!98914) b!204998))

(assert (= (and b!204998 res!98917) b!204996))

(assert (= (and b!204996 (not res!98915)) b!205004))

(assert (= (and b!205004 (not res!98910)) b!205002))

(assert (= (and b!204995 condMapEmpty!8711) mapIsEmpty!8711))

(assert (= (and b!204995 (not condMapEmpty!8711)) mapNonEmpty!8711))

(get-info :version)

(assert (= (and mapNonEmpty!8711 ((_ is ValueCellFull!2204) mapValue!8711)) b!204997))

(assert (= (and b!204995 ((_ is ValueCellFull!2204) mapDefault!8711)) b!205006))

(assert (= start!20584 b!204995))

(declare-fun m!232701 () Bool)

(assert (=> b!204999 m!232701))

(declare-fun m!232703 () Bool)

(assert (=> mapNonEmpty!8711 m!232703))

(declare-fun m!232705 () Bool)

(assert (=> b!205002 m!232705))

(declare-fun m!232707 () Bool)

(assert (=> b!205002 m!232707))

(declare-fun m!232709 () Bool)

(assert (=> b!205001 m!232709))

(declare-fun m!232711 () Bool)

(assert (=> b!204998 m!232711))

(declare-fun m!232713 () Bool)

(assert (=> start!20584 m!232713))

(declare-fun m!232715 () Bool)

(assert (=> start!20584 m!232715))

(declare-fun m!232717 () Bool)

(assert (=> start!20584 m!232717))

(declare-fun m!232719 () Bool)

(assert (=> b!204996 m!232719))

(declare-fun m!232721 () Bool)

(assert (=> b!204996 m!232721))

(declare-fun m!232723 () Bool)

(assert (=> b!204996 m!232723))

(declare-fun m!232725 () Bool)

(assert (=> b!204996 m!232725))

(declare-fun m!232727 () Bool)

(assert (=> b!204996 m!232727))

(declare-fun m!232729 () Bool)

(assert (=> b!204996 m!232729))

(declare-fun m!232731 () Bool)

(assert (=> b!204996 m!232731))

(declare-fun m!232733 () Bool)

(assert (=> b!205000 m!232733))

(declare-fun m!232735 () Bool)

(assert (=> b!205004 m!232735))

(declare-fun m!232737 () Bool)

(assert (=> b!205004 m!232737))

(declare-fun m!232739 () Bool)

(assert (=> b!205004 m!232739))

(check-sat tp_is_empty!5095 (not start!20584) (not b!205000) (not b_next!5239) (not b!205001) (not b!204999) (not b!205004) (not b!205002) (not mapNonEmpty!8711) b_and!11999 (not b!204996))
(check-sat b_and!11999 (not b_next!5239))
