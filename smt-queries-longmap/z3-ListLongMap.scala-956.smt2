; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20836 () Bool)

(assert start!20836)

(declare-fun b_free!5485 () Bool)

(declare-fun b_next!5485 () Bool)

(assert (=> start!20836 (= b_free!5485 (not b_next!5485))))

(declare-fun tp!19495 () Bool)

(declare-fun b_and!12205 () Bool)

(assert (=> start!20836 (= tp!19495 b_and!12205)))

(declare-fun mapIsEmpty!9089 () Bool)

(declare-fun mapRes!9089 () Bool)

(assert (=> mapIsEmpty!9089 mapRes!9089))

(declare-fun b!208793 () Bool)

(declare-fun e!136097 () Bool)

(assert (=> b!208793 (= e!136097 false)))

(declare-datatypes ((V!6777 0))(
  ( (V!6778 (val!2718 Int)) )
))
(declare-datatypes ((ValueCell!2330 0))(
  ( (ValueCellFull!2330 (v!4682 V!6777)) (EmptyCell!2330) )
))
(declare-datatypes ((array!9883 0))(
  ( (array!9884 (arr!4691 (Array (_ BitVec 32) ValueCell!2330)) (size!5017 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9883)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4096 0))(
  ( (tuple2!4097 (_1!2059 (_ BitVec 64)) (_2!2059 V!6777)) )
))
(declare-datatypes ((List!3003 0))(
  ( (Nil!3000) (Cons!2999 (h!3641 tuple2!4096) (t!7925 List!3003)) )
))
(declare-datatypes ((ListLongMap!2999 0))(
  ( (ListLongMap!3000 (toList!1515 List!3003)) )
))
(declare-fun lt!106705 () ListLongMap!2999)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6777)

(declare-datatypes ((array!9885 0))(
  ( (array!9886 (arr!4692 (Array (_ BitVec 32) (_ BitVec 64))) (size!5018 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9885)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6777)

(declare-fun v!520 () V!6777)

(declare-fun getCurrentListMapNoExtraKeys!466 (array!9885 array!9883 (_ BitVec 32) (_ BitVec 32) V!6777 V!6777 (_ BitVec 32) Int) ListLongMap!2999)

(assert (=> b!208793 (= lt!106705 (getCurrentListMapNoExtraKeys!466 _keys!825 (array!9884 (store (arr!4691 _values!649) i!601 (ValueCellFull!2330 v!520)) (size!5017 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106706 () ListLongMap!2999)

(assert (=> b!208793 (= lt!106706 (getCurrentListMapNoExtraKeys!466 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208794 () Bool)

(declare-fun res!101654 () Bool)

(assert (=> b!208794 (=> (not res!101654) (not e!136097))))

(assert (=> b!208794 (= res!101654 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5018 _keys!825))))))

(declare-fun b!208795 () Bool)

(declare-fun e!136098 () Bool)

(declare-fun e!136095 () Bool)

(assert (=> b!208795 (= e!136098 (and e!136095 mapRes!9089))))

(declare-fun condMapEmpty!9089 () Bool)

(declare-fun mapDefault!9089 () ValueCell!2330)

(assert (=> b!208795 (= condMapEmpty!9089 (= (arr!4691 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2330)) mapDefault!9089)))))

(declare-fun b!208796 () Bool)

(declare-fun tp_is_empty!5347 () Bool)

(assert (=> b!208796 (= e!136095 tp_is_empty!5347)))

(declare-fun b!208797 () Bool)

(declare-fun res!101652 () Bool)

(assert (=> b!208797 (=> (not res!101652) (not e!136097))))

(assert (=> b!208797 (= res!101652 (and (= (size!5017 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5018 _keys!825) (size!5017 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208798 () Bool)

(declare-fun e!136094 () Bool)

(assert (=> b!208798 (= e!136094 tp_is_empty!5347)))

(declare-fun res!101655 () Bool)

(assert (=> start!20836 (=> (not res!101655) (not e!136097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20836 (= res!101655 (validMask!0 mask!1149))))

(assert (=> start!20836 e!136097))

(declare-fun array_inv!3081 (array!9883) Bool)

(assert (=> start!20836 (and (array_inv!3081 _values!649) e!136098)))

(assert (=> start!20836 true))

(assert (=> start!20836 tp_is_empty!5347))

(declare-fun array_inv!3082 (array!9885) Bool)

(assert (=> start!20836 (array_inv!3082 _keys!825)))

(assert (=> start!20836 tp!19495))

(declare-fun b!208799 () Bool)

(declare-fun res!101657 () Bool)

(assert (=> b!208799 (=> (not res!101657) (not e!136097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9885 (_ BitVec 32)) Bool)

(assert (=> b!208799 (= res!101657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!9089 () Bool)

(declare-fun tp!19496 () Bool)

(assert (=> mapNonEmpty!9089 (= mapRes!9089 (and tp!19496 e!136094))))

(declare-fun mapKey!9089 () (_ BitVec 32))

(declare-fun mapRest!9089 () (Array (_ BitVec 32) ValueCell!2330))

(declare-fun mapValue!9089 () ValueCell!2330)

(assert (=> mapNonEmpty!9089 (= (arr!4691 _values!649) (store mapRest!9089 mapKey!9089 mapValue!9089))))

(declare-fun b!208800 () Bool)

(declare-fun res!101653 () Bool)

(assert (=> b!208800 (=> (not res!101653) (not e!136097))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208800 (= res!101653 (= (select (arr!4692 _keys!825) i!601) k0!843))))

(declare-fun b!208801 () Bool)

(declare-fun res!101656 () Bool)

(assert (=> b!208801 (=> (not res!101656) (not e!136097))))

(declare-datatypes ((List!3004 0))(
  ( (Nil!3001) (Cons!3000 (h!3642 (_ BitVec 64)) (t!7926 List!3004)) )
))
(declare-fun arrayNoDuplicates!0 (array!9885 (_ BitVec 32) List!3004) Bool)

(assert (=> b!208801 (= res!101656 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3001))))

(declare-fun b!208802 () Bool)

(declare-fun res!101651 () Bool)

(assert (=> b!208802 (=> (not res!101651) (not e!136097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208802 (= res!101651 (validKeyInArray!0 k0!843))))

(assert (= (and start!20836 res!101655) b!208797))

(assert (= (and b!208797 res!101652) b!208799))

(assert (= (and b!208799 res!101657) b!208801))

(assert (= (and b!208801 res!101656) b!208794))

(assert (= (and b!208794 res!101654) b!208802))

(assert (= (and b!208802 res!101651) b!208800))

(assert (= (and b!208800 res!101653) b!208793))

(assert (= (and b!208795 condMapEmpty!9089) mapIsEmpty!9089))

(assert (= (and b!208795 (not condMapEmpty!9089)) mapNonEmpty!9089))

(get-info :version)

(assert (= (and mapNonEmpty!9089 ((_ is ValueCellFull!2330) mapValue!9089)) b!208798))

(assert (= (and b!208795 ((_ is ValueCellFull!2330) mapDefault!9089)) b!208796))

(assert (= start!20836 b!208795))

(declare-fun m!235821 () Bool)

(assert (=> b!208793 m!235821))

(declare-fun m!235823 () Bool)

(assert (=> b!208793 m!235823))

(declare-fun m!235825 () Bool)

(assert (=> b!208793 m!235825))

(declare-fun m!235827 () Bool)

(assert (=> start!20836 m!235827))

(declare-fun m!235829 () Bool)

(assert (=> start!20836 m!235829))

(declare-fun m!235831 () Bool)

(assert (=> start!20836 m!235831))

(declare-fun m!235833 () Bool)

(assert (=> b!208802 m!235833))

(declare-fun m!235835 () Bool)

(assert (=> b!208801 m!235835))

(declare-fun m!235837 () Bool)

(assert (=> b!208799 m!235837))

(declare-fun m!235839 () Bool)

(assert (=> b!208800 m!235839))

(declare-fun m!235841 () Bool)

(assert (=> mapNonEmpty!9089 m!235841))

(check-sat (not b!208801) (not b!208793) tp_is_empty!5347 (not b_next!5485) (not mapNonEmpty!9089) (not start!20836) (not b!208799) b_and!12205 (not b!208802))
(check-sat b_and!12205 (not b_next!5485))
