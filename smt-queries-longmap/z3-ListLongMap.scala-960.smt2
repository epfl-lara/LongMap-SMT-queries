; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20858 () Bool)

(assert start!20858)

(declare-fun b_free!5511 () Bool)

(declare-fun b_next!5511 () Bool)

(assert (=> start!20858 (= b_free!5511 (not b_next!5511))))

(declare-fun tp!19573 () Bool)

(declare-fun b_and!12257 () Bool)

(assert (=> start!20858 (= tp!19573 b_and!12257)))

(declare-fun res!102020 () Bool)

(declare-fun e!136391 () Bool)

(assert (=> start!20858 (=> (not res!102020) (not e!136391))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20858 (= res!102020 (validMask!0 mask!1149))))

(assert (=> start!20858 e!136391))

(declare-datatypes ((V!6811 0))(
  ( (V!6812 (val!2731 Int)) )
))
(declare-datatypes ((ValueCell!2343 0))(
  ( (ValueCellFull!2343 (v!4701 V!6811)) (EmptyCell!2343) )
))
(declare-datatypes ((array!9943 0))(
  ( (array!9944 (arr!4722 (Array (_ BitVec 32) ValueCell!2343)) (size!5047 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9943)

(declare-fun e!136394 () Bool)

(declare-fun array_inv!3125 (array!9943) Bool)

(assert (=> start!20858 (and (array_inv!3125 _values!649) e!136394)))

(assert (=> start!20858 true))

(declare-fun tp_is_empty!5373 () Bool)

(assert (=> start!20858 tp_is_empty!5373))

(declare-datatypes ((array!9945 0))(
  ( (array!9946 (arr!4723 (Array (_ BitVec 32) (_ BitVec 64))) (size!5048 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9945)

(declare-fun array_inv!3126 (array!9945) Bool)

(assert (=> start!20858 (array_inv!3126 _keys!825)))

(assert (=> start!20858 tp!19573))

(declare-fun b!209330 () Bool)

(declare-fun res!102023 () Bool)

(assert (=> b!209330 (=> (not res!102023) (not e!136391))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209330 (= res!102023 (validKeyInArray!0 k0!843))))

(declare-fun b!209331 () Bool)

(declare-fun res!102019 () Bool)

(assert (=> b!209331 (=> (not res!102019) (not e!136391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9945 (_ BitVec 32)) Bool)

(assert (=> b!209331 (= res!102019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209332 () Bool)

(declare-fun e!136392 () Bool)

(assert (=> b!209332 (= e!136392 tp_is_empty!5373)))

(declare-fun b!209333 () Bool)

(declare-fun res!102022 () Bool)

(assert (=> b!209333 (=> (not res!102022) (not e!136391))))

(declare-datatypes ((List!3021 0))(
  ( (Nil!3018) (Cons!3017 (h!3659 (_ BitVec 64)) (t!7952 List!3021)) )
))
(declare-fun arrayNoDuplicates!0 (array!9945 (_ BitVec 32) List!3021) Bool)

(assert (=> b!209333 (= res!102022 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3018))))

(declare-fun b!209334 () Bool)

(declare-fun e!136390 () Bool)

(assert (=> b!209334 (= e!136390 tp_is_empty!5373)))

(declare-fun mapIsEmpty!9128 () Bool)

(declare-fun mapRes!9128 () Bool)

(assert (=> mapIsEmpty!9128 mapRes!9128))

(declare-fun b!209335 () Bool)

(declare-fun res!102024 () Bool)

(assert (=> b!209335 (=> (not res!102024) (not e!136391))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209335 (= res!102024 (= (select (arr!4723 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9128 () Bool)

(declare-fun tp!19574 () Bool)

(assert (=> mapNonEmpty!9128 (= mapRes!9128 (and tp!19574 e!136390))))

(declare-fun mapKey!9128 () (_ BitVec 32))

(declare-fun mapValue!9128 () ValueCell!2343)

(declare-fun mapRest!9128 () (Array (_ BitVec 32) ValueCell!2343))

(assert (=> mapNonEmpty!9128 (= (arr!4722 _values!649) (store mapRest!9128 mapKey!9128 mapValue!9128))))

(declare-fun b!209336 () Bool)

(declare-fun res!102021 () Bool)

(assert (=> b!209336 (=> (not res!102021) (not e!136391))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209336 (= res!102021 (and (= (size!5047 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5048 _keys!825) (size!5047 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209337 () Bool)

(assert (=> b!209337 (= e!136394 (and e!136392 mapRes!9128))))

(declare-fun condMapEmpty!9128 () Bool)

(declare-fun mapDefault!9128 () ValueCell!2343)

(assert (=> b!209337 (= condMapEmpty!9128 (= (arr!4722 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2343)) mapDefault!9128)))))

(declare-fun b!209338 () Bool)

(declare-fun res!102025 () Bool)

(assert (=> b!209338 (=> (not res!102025) (not e!136391))))

(assert (=> b!209338 (= res!102025 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5048 _keys!825))))))

(declare-fun b!209339 () Bool)

(declare-datatypes ((tuple2!4126 0))(
  ( (tuple2!4127 (_1!2074 (_ BitVec 64)) (_2!2074 V!6811)) )
))
(declare-datatypes ((List!3022 0))(
  ( (Nil!3019) (Cons!3018 (h!3660 tuple2!4126) (t!7953 List!3022)) )
))
(declare-datatypes ((ListLongMap!3039 0))(
  ( (ListLongMap!3040 (toList!1535 List!3022)) )
))
(declare-fun lt!106977 () ListLongMap!3039)

(declare-fun lt!106976 () ListLongMap!3039)

(assert (=> b!209339 (= e!136391 (not (= lt!106977 lt!106976)))))

(assert (=> b!209339 (= lt!106976 lt!106977)))

(declare-fun lt!106975 () ListLongMap!3039)

(declare-fun v!520 () V!6811)

(declare-fun +!538 (ListLongMap!3039 tuple2!4126) ListLongMap!3039)

(assert (=> b!209339 (= lt!106977 (+!538 lt!106975 (tuple2!4127 k0!843 v!520)))))

(declare-datatypes ((Unit!6364 0))(
  ( (Unit!6365) )
))
(declare-fun lt!106974 () Unit!6364)

(declare-fun zeroValue!615 () V!6811)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6811)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!191 (array!9945 array!9943 (_ BitVec 32) (_ BitVec 32) V!6811 V!6811 (_ BitVec 32) (_ BitVec 64) V!6811 (_ BitVec 32) Int) Unit!6364)

(assert (=> b!209339 (= lt!106974 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!191 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!476 (array!9945 array!9943 (_ BitVec 32) (_ BitVec 32) V!6811 V!6811 (_ BitVec 32) Int) ListLongMap!3039)

(assert (=> b!209339 (= lt!106976 (getCurrentListMapNoExtraKeys!476 _keys!825 (array!9944 (store (arr!4722 _values!649) i!601 (ValueCellFull!2343 v!520)) (size!5047 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209339 (= lt!106975 (getCurrentListMapNoExtraKeys!476 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20858 res!102020) b!209336))

(assert (= (and b!209336 res!102021) b!209331))

(assert (= (and b!209331 res!102019) b!209333))

(assert (= (and b!209333 res!102022) b!209338))

(assert (= (and b!209338 res!102025) b!209330))

(assert (= (and b!209330 res!102023) b!209335))

(assert (= (and b!209335 res!102024) b!209339))

(assert (= (and b!209337 condMapEmpty!9128) mapIsEmpty!9128))

(assert (= (and b!209337 (not condMapEmpty!9128)) mapNonEmpty!9128))

(get-info :version)

(assert (= (and mapNonEmpty!9128 ((_ is ValueCellFull!2343) mapValue!9128)) b!209334))

(assert (= (and b!209337 ((_ is ValueCellFull!2343) mapDefault!9128)) b!209332))

(assert (= start!20858 b!209337))

(declare-fun m!236727 () Bool)

(assert (=> b!209339 m!236727))

(declare-fun m!236729 () Bool)

(assert (=> b!209339 m!236729))

(declare-fun m!236731 () Bool)

(assert (=> b!209339 m!236731))

(declare-fun m!236733 () Bool)

(assert (=> b!209339 m!236733))

(declare-fun m!236735 () Bool)

(assert (=> b!209339 m!236735))

(declare-fun m!236737 () Bool)

(assert (=> b!209331 m!236737))

(declare-fun m!236739 () Bool)

(assert (=> b!209335 m!236739))

(declare-fun m!236741 () Bool)

(assert (=> b!209333 m!236741))

(declare-fun m!236743 () Bool)

(assert (=> b!209330 m!236743))

(declare-fun m!236745 () Bool)

(assert (=> start!20858 m!236745))

(declare-fun m!236747 () Bool)

(assert (=> start!20858 m!236747))

(declare-fun m!236749 () Bool)

(assert (=> start!20858 m!236749))

(declare-fun m!236751 () Bool)

(assert (=> mapNonEmpty!9128 m!236751))

(check-sat (not b_next!5511) (not b!209331) (not b!209330) (not start!20858) (not b!209333) (not b!209339) (not mapNonEmpty!9128) b_and!12257 tp_is_empty!5373)
(check-sat b_and!12257 (not b_next!5511))
