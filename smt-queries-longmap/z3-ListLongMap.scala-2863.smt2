; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41220 () Bool)

(assert start!41220)

(declare-fun b_free!11077 () Bool)

(declare-fun b_next!11077 () Bool)

(assert (=> start!41220 (= b_free!11077 (not b_next!11077))))

(declare-fun tp!39069 () Bool)

(declare-fun b_and!19371 () Bool)

(assert (=> start!41220 (= tp!39069 b_and!19371)))

(declare-fun b!460974 () Bool)

(declare-fun e!268854 () Bool)

(declare-fun e!268858 () Bool)

(assert (=> b!460974 (= e!268854 e!268858)))

(declare-fun res!275737 () Bool)

(assert (=> b!460974 (=> (not res!275737) (not e!268858))))

(declare-datatypes ((array!28625 0))(
  ( (array!28626 (arr!13752 (Array (_ BitVec 32) (_ BitVec 64))) (size!14105 (_ BitVec 32))) )
))
(declare-fun lt!208698 () array!28625)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28625 (_ BitVec 32)) Bool)

(assert (=> b!460974 (= res!275737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208698 mask!1025))))

(declare-fun _keys!709 () array!28625)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460974 (= lt!208698 (array!28626 (store (arr!13752 _keys!709) i!563 k0!794) (size!14105 _keys!709)))))

(declare-fun mapNonEmpty!20275 () Bool)

(declare-fun mapRes!20275 () Bool)

(declare-fun tp!39070 () Bool)

(declare-fun e!268856 () Bool)

(assert (=> mapNonEmpty!20275 (= mapRes!20275 (and tp!39070 e!268856))))

(declare-datatypes ((V!17659 0))(
  ( (V!17660 (val!6252 Int)) )
))
(declare-datatypes ((ValueCell!5864 0))(
  ( (ValueCellFull!5864 (v!8528 V!17659)) (EmptyCell!5864) )
))
(declare-fun mapRest!20275 () (Array (_ BitVec 32) ValueCell!5864))

(declare-datatypes ((array!28627 0))(
  ( (array!28628 (arr!13753 (Array (_ BitVec 32) ValueCell!5864)) (size!14106 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28627)

(declare-fun mapKey!20275 () (_ BitVec 32))

(declare-fun mapValue!20275 () ValueCell!5864)

(assert (=> mapNonEmpty!20275 (= (arr!13753 _values!549) (store mapRest!20275 mapKey!20275 mapValue!20275))))

(declare-fun b!460975 () Bool)

(declare-fun e!268857 () Bool)

(assert (=> b!460975 (= e!268857 (not true))))

(declare-fun minValue!515 () V!17659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17659)

(declare-fun lt!208694 () array!28627)

(declare-fun v!412 () V!17659)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!8276 0))(
  ( (tuple2!8277 (_1!4149 (_ BitVec 64)) (_2!4149 V!17659)) )
))
(declare-datatypes ((List!8339 0))(
  ( (Nil!8336) (Cons!8335 (h!9191 tuple2!8276) (t!14272 List!8339)) )
))
(declare-datatypes ((ListLongMap!7179 0))(
  ( (ListLongMap!7180 (toList!3605 List!8339)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1797 (array!28625 array!28627 (_ BitVec 32) (_ BitVec 32) V!17659 V!17659 (_ BitVec 32) Int) ListLongMap!7179)

(declare-fun +!1657 (ListLongMap!7179 tuple2!8276) ListLongMap!7179)

(assert (=> b!460975 (= (getCurrentListMapNoExtraKeys!1797 lt!208698 lt!208694 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1657 (getCurrentListMapNoExtraKeys!1797 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8277 k0!794 v!412)))))

(declare-datatypes ((Unit!13394 0))(
  ( (Unit!13395) )
))
(declare-fun lt!208695 () Unit!13394)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!787 (array!28625 array!28627 (_ BitVec 32) (_ BitVec 32) V!17659 V!17659 (_ BitVec 32) (_ BitVec 64) V!17659 (_ BitVec 32) Int) Unit!13394)

(assert (=> b!460975 (= lt!208695 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!787 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460976 () Bool)

(declare-fun tp_is_empty!12415 () Bool)

(assert (=> b!460976 (= e!268856 tp_is_empty!12415)))

(declare-fun b!460977 () Bool)

(declare-fun e!268859 () Bool)

(assert (=> b!460977 (= e!268859 tp_is_empty!12415)))

(declare-fun res!275733 () Bool)

(assert (=> start!41220 (=> (not res!275733) (not e!268854))))

(assert (=> start!41220 (= res!275733 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14105 _keys!709))))))

(assert (=> start!41220 e!268854))

(assert (=> start!41220 tp_is_empty!12415))

(assert (=> start!41220 tp!39069))

(assert (=> start!41220 true))

(declare-fun e!268855 () Bool)

(declare-fun array_inv!10012 (array!28627) Bool)

(assert (=> start!41220 (and (array_inv!10012 _values!549) e!268855)))

(declare-fun array_inv!10013 (array!28625) Bool)

(assert (=> start!41220 (array_inv!10013 _keys!709)))

(declare-fun b!460978 () Bool)

(declare-fun res!275734 () Bool)

(assert (=> b!460978 (=> (not res!275734) (not e!268854))))

(assert (=> b!460978 (= res!275734 (and (= (size!14106 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14105 _keys!709) (size!14106 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20275 () Bool)

(assert (=> mapIsEmpty!20275 mapRes!20275))

(declare-fun b!460979 () Bool)

(declare-fun res!275739 () Bool)

(assert (=> b!460979 (=> (not res!275739) (not e!268854))))

(assert (=> b!460979 (= res!275739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460980 () Bool)

(declare-fun res!275731 () Bool)

(assert (=> b!460980 (=> (not res!275731) (not e!268854))))

(assert (=> b!460980 (= res!275731 (or (= (select (arr!13752 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13752 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460981 () Bool)

(assert (=> b!460981 (= e!268855 (and e!268859 mapRes!20275))))

(declare-fun condMapEmpty!20275 () Bool)

(declare-fun mapDefault!20275 () ValueCell!5864)

(assert (=> b!460981 (= condMapEmpty!20275 (= (arr!13753 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5864)) mapDefault!20275)))))

(declare-fun b!460982 () Bool)

(declare-fun res!275740 () Bool)

(assert (=> b!460982 (=> (not res!275740) (not e!268858))))

(declare-datatypes ((List!8340 0))(
  ( (Nil!8337) (Cons!8336 (h!9192 (_ BitVec 64)) (t!14273 List!8340)) )
))
(declare-fun arrayNoDuplicates!0 (array!28625 (_ BitVec 32) List!8340) Bool)

(assert (=> b!460982 (= res!275740 (arrayNoDuplicates!0 lt!208698 #b00000000000000000000000000000000 Nil!8337))))

(declare-fun b!460983 () Bool)

(declare-fun res!275729 () Bool)

(assert (=> b!460983 (=> (not res!275729) (not e!268854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460983 (= res!275729 (validMask!0 mask!1025))))

(declare-fun b!460984 () Bool)

(declare-fun res!275741 () Bool)

(assert (=> b!460984 (=> (not res!275741) (not e!268854))))

(assert (=> b!460984 (= res!275741 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8337))))

(declare-fun b!460985 () Bool)

(declare-fun res!275730 () Bool)

(assert (=> b!460985 (=> (not res!275730) (not e!268854))))

(declare-fun arrayContainsKey!0 (array!28625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460985 (= res!275730 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460986 () Bool)

(declare-fun res!275738 () Bool)

(assert (=> b!460986 (=> (not res!275738) (not e!268854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460986 (= res!275738 (validKeyInArray!0 k0!794))))

(declare-fun b!460987 () Bool)

(assert (=> b!460987 (= e!268858 e!268857)))

(declare-fun res!275732 () Bool)

(assert (=> b!460987 (=> (not res!275732) (not e!268857))))

(assert (=> b!460987 (= res!275732 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208697 () ListLongMap!7179)

(assert (=> b!460987 (= lt!208697 (getCurrentListMapNoExtraKeys!1797 lt!208698 lt!208694 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460987 (= lt!208694 (array!28628 (store (arr!13753 _values!549) i!563 (ValueCellFull!5864 v!412)) (size!14106 _values!549)))))

(declare-fun lt!208696 () ListLongMap!7179)

(assert (=> b!460987 (= lt!208696 (getCurrentListMapNoExtraKeys!1797 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460988 () Bool)

(declare-fun res!275736 () Bool)

(assert (=> b!460988 (=> (not res!275736) (not e!268858))))

(assert (=> b!460988 (= res!275736 (bvsle from!863 i!563))))

(declare-fun b!460989 () Bool)

(declare-fun res!275735 () Bool)

(assert (=> b!460989 (=> (not res!275735) (not e!268854))))

(assert (=> b!460989 (= res!275735 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14105 _keys!709))))))

(assert (= (and start!41220 res!275733) b!460983))

(assert (= (and b!460983 res!275729) b!460978))

(assert (= (and b!460978 res!275734) b!460979))

(assert (= (and b!460979 res!275739) b!460984))

(assert (= (and b!460984 res!275741) b!460989))

(assert (= (and b!460989 res!275735) b!460986))

(assert (= (and b!460986 res!275738) b!460980))

(assert (= (and b!460980 res!275731) b!460985))

(assert (= (and b!460985 res!275730) b!460974))

(assert (= (and b!460974 res!275737) b!460982))

(assert (= (and b!460982 res!275740) b!460988))

(assert (= (and b!460988 res!275736) b!460987))

(assert (= (and b!460987 res!275732) b!460975))

(assert (= (and b!460981 condMapEmpty!20275) mapIsEmpty!20275))

(assert (= (and b!460981 (not condMapEmpty!20275)) mapNonEmpty!20275))

(get-info :version)

(assert (= (and mapNonEmpty!20275 ((_ is ValueCellFull!5864) mapValue!20275)) b!460976))

(assert (= (and b!460981 ((_ is ValueCellFull!5864) mapDefault!20275)) b!460977))

(assert (= start!41220 b!460981))

(declare-fun m!443707 () Bool)

(assert (=> mapNonEmpty!20275 m!443707))

(declare-fun m!443709 () Bool)

(assert (=> b!460982 m!443709))

(declare-fun m!443711 () Bool)

(assert (=> b!460974 m!443711))

(declare-fun m!443713 () Bool)

(assert (=> b!460974 m!443713))

(declare-fun m!443715 () Bool)

(assert (=> b!460987 m!443715))

(declare-fun m!443717 () Bool)

(assert (=> b!460987 m!443717))

(declare-fun m!443719 () Bool)

(assert (=> b!460987 m!443719))

(declare-fun m!443721 () Bool)

(assert (=> b!460980 m!443721))

(declare-fun m!443723 () Bool)

(assert (=> b!460975 m!443723))

(declare-fun m!443725 () Bool)

(assert (=> b!460975 m!443725))

(assert (=> b!460975 m!443725))

(declare-fun m!443727 () Bool)

(assert (=> b!460975 m!443727))

(declare-fun m!443729 () Bool)

(assert (=> b!460975 m!443729))

(declare-fun m!443731 () Bool)

(assert (=> b!460986 m!443731))

(declare-fun m!443733 () Bool)

(assert (=> b!460983 m!443733))

(declare-fun m!443735 () Bool)

(assert (=> b!460985 m!443735))

(declare-fun m!443737 () Bool)

(assert (=> b!460984 m!443737))

(declare-fun m!443739 () Bool)

(assert (=> start!41220 m!443739))

(declare-fun m!443741 () Bool)

(assert (=> start!41220 m!443741))

(declare-fun m!443743 () Bool)

(assert (=> b!460979 m!443743))

(check-sat (not b!460975) (not b!460982) (not b!460974) (not b!460985) b_and!19371 (not mapNonEmpty!20275) (not b!460984) tp_is_empty!12415 (not b!460987) (not b!460983) (not b_next!11077) (not b!460979) (not start!41220) (not b!460986))
(check-sat b_and!19371 (not b_next!11077))
