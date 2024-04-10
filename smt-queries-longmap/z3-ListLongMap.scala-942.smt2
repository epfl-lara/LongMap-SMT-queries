; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20750 () Bool)

(assert start!20750)

(declare-fun b_free!5409 () Bool)

(declare-fun b_next!5409 () Bool)

(assert (=> start!20750 (= b_free!5409 (not b_next!5409))))

(declare-fun tp!19258 () Bool)

(declare-fun b_and!12155 () Bool)

(assert (=> start!20750 (= tp!19258 b_and!12155)))

(declare-fun b!207746 () Bool)

(declare-fun res!100921 () Bool)

(declare-fun e!135581 () Bool)

(assert (=> b!207746 (=> (not res!100921) (not e!135581))))

(declare-datatypes ((array!9737 0))(
  ( (array!9738 (arr!4619 (Array (_ BitVec 32) (_ BitVec 64))) (size!4944 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9737)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9737 (_ BitVec 32)) Bool)

(assert (=> b!207746 (= res!100921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8966 () Bool)

(declare-fun mapRes!8966 () Bool)

(declare-fun tp!19259 () Bool)

(declare-fun e!135582 () Bool)

(assert (=> mapNonEmpty!8966 (= mapRes!8966 (and tp!19259 e!135582))))

(declare-datatypes ((V!6667 0))(
  ( (V!6668 (val!2677 Int)) )
))
(declare-datatypes ((ValueCell!2289 0))(
  ( (ValueCellFull!2289 (v!4647 V!6667)) (EmptyCell!2289) )
))
(declare-fun mapRest!8966 () (Array (_ BitVec 32) ValueCell!2289))

(declare-fun mapValue!8966 () ValueCell!2289)

(declare-fun mapKey!8966 () (_ BitVec 32))

(declare-datatypes ((array!9739 0))(
  ( (array!9740 (arr!4620 (Array (_ BitVec 32) ValueCell!2289)) (size!4945 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9739)

(assert (=> mapNonEmpty!8966 (= (arr!4620 _values!649) (store mapRest!8966 mapKey!8966 mapValue!8966))))

(declare-fun b!207747 () Bool)

(declare-fun res!100926 () Bool)

(assert (=> b!207747 (=> (not res!100926) (not e!135581))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!207747 (= res!100926 (and (= (size!4945 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4944 _keys!825) (size!4945 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207748 () Bool)

(declare-fun res!100923 () Bool)

(assert (=> b!207748 (=> (not res!100923) (not e!135581))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207748 (= res!100923 (= (select (arr!4619 _keys!825) i!601) k0!843))))

(declare-fun b!207749 () Bool)

(declare-fun res!100924 () Bool)

(assert (=> b!207749 (=> (not res!100924) (not e!135581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207749 (= res!100924 (validKeyInArray!0 k0!843))))

(declare-fun b!207750 () Bool)

(declare-fun res!100922 () Bool)

(assert (=> b!207750 (=> (not res!100922) (not e!135581))))

(declare-datatypes ((List!2955 0))(
  ( (Nil!2952) (Cons!2951 (h!3593 (_ BitVec 64)) (t!7886 List!2955)) )
))
(declare-fun arrayNoDuplicates!0 (array!9737 (_ BitVec 32) List!2955) Bool)

(assert (=> b!207750 (= res!100922 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2952))))

(declare-fun b!207751 () Bool)

(declare-fun e!135583 () Bool)

(declare-fun tp_is_empty!5265 () Bool)

(assert (=> b!207751 (= e!135583 tp_is_empty!5265)))

(declare-fun b!207752 () Bool)

(assert (=> b!207752 (= e!135582 tp_is_empty!5265)))

(declare-fun b!207753 () Bool)

(declare-fun e!135580 () Bool)

(assert (=> b!207753 (= e!135580 (and e!135583 mapRes!8966))))

(declare-fun condMapEmpty!8966 () Bool)

(declare-fun mapDefault!8966 () ValueCell!2289)

(assert (=> b!207753 (= condMapEmpty!8966 (= (arr!4620 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2289)) mapDefault!8966)))))

(declare-fun b!207754 () Bool)

(declare-fun res!100925 () Bool)

(assert (=> b!207754 (=> (not res!100925) (not e!135581))))

(assert (=> b!207754 (= res!100925 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4944 _keys!825))))))

(declare-fun mapIsEmpty!8966 () Bool)

(assert (=> mapIsEmpty!8966 mapRes!8966))

(declare-fun res!100927 () Bool)

(assert (=> start!20750 (=> (not res!100927) (not e!135581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20750 (= res!100927 (validMask!0 mask!1149))))

(assert (=> start!20750 e!135581))

(declare-fun array_inv!3061 (array!9739) Bool)

(assert (=> start!20750 (and (array_inv!3061 _values!649) e!135580)))

(assert (=> start!20750 true))

(assert (=> start!20750 tp_is_empty!5265))

(declare-fun array_inv!3062 (array!9737) Bool)

(assert (=> start!20750 (array_inv!3062 _keys!825)))

(assert (=> start!20750 tp!19258))

(declare-fun b!207755 () Bool)

(assert (=> b!207755 (= e!135581 (not true))))

(declare-fun zeroValue!615 () V!6667)

(declare-datatypes ((tuple2!4062 0))(
  ( (tuple2!4063 (_1!2042 (_ BitVec 64)) (_2!2042 V!6667)) )
))
(declare-datatypes ((List!2956 0))(
  ( (Nil!2953) (Cons!2952 (h!3594 tuple2!4062) (t!7887 List!2956)) )
))
(declare-datatypes ((ListLongMap!2975 0))(
  ( (ListLongMap!2976 (toList!1503 List!2956)) )
))
(declare-fun lt!106494 () ListLongMap!2975)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6667)

(declare-fun getCurrentListMap!1070 (array!9737 array!9739 (_ BitVec 32) (_ BitVec 32) V!6667 V!6667 (_ BitVec 32) Int) ListLongMap!2975)

(assert (=> b!207755 (= lt!106494 (getCurrentListMap!1070 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106497 () ListLongMap!2975)

(declare-fun lt!106500 () array!9739)

(assert (=> b!207755 (= lt!106497 (getCurrentListMap!1070 _keys!825 lt!106500 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106496 () ListLongMap!2975)

(declare-fun lt!106499 () ListLongMap!2975)

(assert (=> b!207755 (and (= lt!106496 lt!106499) (= lt!106499 lt!106496))))

(declare-fun v!520 () V!6667)

(declare-fun lt!106498 () ListLongMap!2975)

(declare-fun +!530 (ListLongMap!2975 tuple2!4062) ListLongMap!2975)

(assert (=> b!207755 (= lt!106499 (+!530 lt!106498 (tuple2!4063 k0!843 v!520)))))

(declare-datatypes ((Unit!6348 0))(
  ( (Unit!6349) )
))
(declare-fun lt!106495 () Unit!6348)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!183 (array!9737 array!9739 (_ BitVec 32) (_ BitVec 32) V!6667 V!6667 (_ BitVec 32) (_ BitVec 64) V!6667 (_ BitVec 32) Int) Unit!6348)

(assert (=> b!207755 (= lt!106495 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!183 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!444 (array!9737 array!9739 (_ BitVec 32) (_ BitVec 32) V!6667 V!6667 (_ BitVec 32) Int) ListLongMap!2975)

(assert (=> b!207755 (= lt!106496 (getCurrentListMapNoExtraKeys!444 _keys!825 lt!106500 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207755 (= lt!106500 (array!9740 (store (arr!4620 _values!649) i!601 (ValueCellFull!2289 v!520)) (size!4945 _values!649)))))

(assert (=> b!207755 (= lt!106498 (getCurrentListMapNoExtraKeys!444 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20750 res!100927) b!207747))

(assert (= (and b!207747 res!100926) b!207746))

(assert (= (and b!207746 res!100921) b!207750))

(assert (= (and b!207750 res!100922) b!207754))

(assert (= (and b!207754 res!100925) b!207749))

(assert (= (and b!207749 res!100924) b!207748))

(assert (= (and b!207748 res!100923) b!207755))

(assert (= (and b!207753 condMapEmpty!8966) mapIsEmpty!8966))

(assert (= (and b!207753 (not condMapEmpty!8966)) mapNonEmpty!8966))

(get-info :version)

(assert (= (and mapNonEmpty!8966 ((_ is ValueCellFull!2289) mapValue!8966)) b!207752))

(assert (= (and b!207753 ((_ is ValueCellFull!2289) mapDefault!8966)) b!207751))

(assert (= start!20750 b!207753))

(declare-fun m!235489 () Bool)

(assert (=> mapNonEmpty!8966 m!235489))

(declare-fun m!235491 () Bool)

(assert (=> b!207748 m!235491))

(declare-fun m!235493 () Bool)

(assert (=> b!207746 m!235493))

(declare-fun m!235495 () Bool)

(assert (=> b!207750 m!235495))

(declare-fun m!235497 () Bool)

(assert (=> b!207749 m!235497))

(declare-fun m!235499 () Bool)

(assert (=> start!20750 m!235499))

(declare-fun m!235501 () Bool)

(assert (=> start!20750 m!235501))

(declare-fun m!235503 () Bool)

(assert (=> start!20750 m!235503))

(declare-fun m!235505 () Bool)

(assert (=> b!207755 m!235505))

(declare-fun m!235507 () Bool)

(assert (=> b!207755 m!235507))

(declare-fun m!235509 () Bool)

(assert (=> b!207755 m!235509))

(declare-fun m!235511 () Bool)

(assert (=> b!207755 m!235511))

(declare-fun m!235513 () Bool)

(assert (=> b!207755 m!235513))

(declare-fun m!235515 () Bool)

(assert (=> b!207755 m!235515))

(declare-fun m!235517 () Bool)

(assert (=> b!207755 m!235517))

(check-sat tp_is_empty!5265 (not mapNonEmpty!8966) (not start!20750) b_and!12155 (not b_next!5409) (not b!207750) (not b!207746) (not b!207749) (not b!207755))
(check-sat b_and!12155 (not b_next!5409))
