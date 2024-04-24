; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112448 () Bool)

(assert start!112448)

(declare-fun b_free!30619 () Bool)

(declare-fun b_next!30619 () Bool)

(assert (=> start!112448 (= b_free!30619 (not b_next!30619))))

(declare-fun tp!107494 () Bool)

(declare-fun b_and!49295 () Bool)

(assert (=> start!112448 (= tp!107494 b_and!49295)))

(declare-fun b!1330622 () Bool)

(declare-fun e!758685 () Bool)

(assert (=> b!1330622 (= e!758685 (not true))))

(declare-datatypes ((V!53809 0))(
  ( (V!53810 (val!18339 Int)) )
))
(declare-datatypes ((tuple2!23642 0))(
  ( (tuple2!23643 (_1!11832 (_ BitVec 64)) (_2!11832 V!53809)) )
))
(declare-datatypes ((List!30815 0))(
  ( (Nil!30812) (Cons!30811 (h!32029 tuple2!23642) (t!44839 List!30815)) )
))
(declare-datatypes ((ListLongMap!21307 0))(
  ( (ListLongMap!21308 (toList!10669 List!30815)) )
))
(declare-fun lt!591414 () ListLongMap!21307)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8845 (ListLongMap!21307 (_ BitVec 64)) Bool)

(assert (=> b!1330622 (contains!8845 lt!591414 k0!1153)))

(declare-datatypes ((Unit!43692 0))(
  ( (Unit!43693) )
))
(declare-fun lt!591413 () Unit!43692)

(declare-fun minValue!1262 () V!53809)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!234 ((_ BitVec 64) (_ BitVec 64) V!53809 ListLongMap!21307) Unit!43692)

(assert (=> b!1330622 (= lt!591413 (lemmaInListMapAfterAddingDiffThenInBefore!234 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591414))))

(declare-datatypes ((ValueCell!17366 0))(
  ( (ValueCellFull!17366 (v!20971 V!53809)) (EmptyCell!17366) )
))
(declare-datatypes ((array!90059 0))(
  ( (array!90060 (arr!43491 (Array (_ BitVec 32) ValueCell!17366)) (size!44042 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90059)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90061 0))(
  ( (array!90062 (arr!43492 (Array (_ BitVec 32) (_ BitVec 64))) (size!44043 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90061)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53809)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4691 (ListLongMap!21307 tuple2!23642) ListLongMap!21307)

(declare-fun getCurrentListMapNoExtraKeys!6335 (array!90061 array!90059 (_ BitVec 32) (_ BitVec 32) V!53809 V!53809 (_ BitVec 32) Int) ListLongMap!21307)

(declare-fun get!21930 (ValueCell!17366 V!53809) V!53809)

(declare-fun dynLambda!3645 (Int (_ BitVec 64)) V!53809)

(assert (=> b!1330622 (= lt!591414 (+!4691 (getCurrentListMapNoExtraKeys!6335 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23643 (select (arr!43492 _keys!1590) from!1980) (get!21930 (select (arr!43491 _values!1320) from!1980) (dynLambda!3645 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330623 () Bool)

(declare-fun res!882538 () Bool)

(assert (=> b!1330623 (=> (not res!882538) (not e!758685))))

(assert (=> b!1330623 (= res!882538 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330624 () Bool)

(declare-fun res!882534 () Bool)

(assert (=> b!1330624 (=> (not res!882534) (not e!758685))))

(assert (=> b!1330624 (= res!882534 (and (= (size!44042 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44043 _keys!1590) (size!44042 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330625 () Bool)

(declare-fun res!882536 () Bool)

(assert (=> b!1330625 (=> (not res!882536) (not e!758685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330625 (= res!882536 (validKeyInArray!0 (select (arr!43492 _keys!1590) from!1980)))))

(declare-fun b!1330626 () Bool)

(declare-fun e!758687 () Bool)

(declare-fun e!758686 () Bool)

(declare-fun mapRes!56467 () Bool)

(assert (=> b!1330626 (= e!758687 (and e!758686 mapRes!56467))))

(declare-fun condMapEmpty!56467 () Bool)

(declare-fun mapDefault!56467 () ValueCell!17366)

(assert (=> b!1330626 (= condMapEmpty!56467 (= (arr!43491 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17366)) mapDefault!56467)))))

(declare-fun b!1330627 () Bool)

(declare-fun res!882537 () Bool)

(assert (=> b!1330627 (=> (not res!882537) (not e!758685))))

(assert (=> b!1330627 (= res!882537 (not (= (select (arr!43492 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330628 () Bool)

(declare-fun e!758688 () Bool)

(declare-fun tp_is_empty!36529 () Bool)

(assert (=> b!1330628 (= e!758688 tp_is_empty!36529)))

(declare-fun mapNonEmpty!56467 () Bool)

(declare-fun tp!107493 () Bool)

(assert (=> mapNonEmpty!56467 (= mapRes!56467 (and tp!107493 e!758688))))

(declare-fun mapKey!56467 () (_ BitVec 32))

(declare-fun mapRest!56467 () (Array (_ BitVec 32) ValueCell!17366))

(declare-fun mapValue!56467 () ValueCell!17366)

(assert (=> mapNonEmpty!56467 (= (arr!43491 _values!1320) (store mapRest!56467 mapKey!56467 mapValue!56467))))

(declare-fun b!1330629 () Bool)

(declare-fun res!882531 () Bool)

(assert (=> b!1330629 (=> (not res!882531) (not e!758685))))

(declare-datatypes ((List!30816 0))(
  ( (Nil!30813) (Cons!30812 (h!32030 (_ BitVec 64)) (t!44840 List!30816)) )
))
(declare-fun arrayNoDuplicates!0 (array!90061 (_ BitVec 32) List!30816) Bool)

(assert (=> b!1330629 (= res!882531 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30813))))

(declare-fun mapIsEmpty!56467 () Bool)

(assert (=> mapIsEmpty!56467 mapRes!56467))

(declare-fun b!1330630 () Bool)

(assert (=> b!1330630 (= e!758686 tp_is_empty!36529)))

(declare-fun b!1330631 () Bool)

(declare-fun res!882535 () Bool)

(assert (=> b!1330631 (=> (not res!882535) (not e!758685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90061 (_ BitVec 32)) Bool)

(assert (=> b!1330631 (= res!882535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!882533 () Bool)

(assert (=> start!112448 (=> (not res!882533) (not e!758685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112448 (= res!882533 (validMask!0 mask!1998))))

(assert (=> start!112448 e!758685))

(declare-fun array_inv!33099 (array!90059) Bool)

(assert (=> start!112448 (and (array_inv!33099 _values!1320) e!758687)))

(assert (=> start!112448 true))

(declare-fun array_inv!33100 (array!90061) Bool)

(assert (=> start!112448 (array_inv!33100 _keys!1590)))

(assert (=> start!112448 tp!107494))

(assert (=> start!112448 tp_is_empty!36529))

(declare-fun b!1330632 () Bool)

(declare-fun res!882539 () Bool)

(assert (=> b!1330632 (=> (not res!882539) (not e!758685))))

(declare-fun getCurrentListMap!5644 (array!90061 array!90059 (_ BitVec 32) (_ BitVec 32) V!53809 V!53809 (_ BitVec 32) Int) ListLongMap!21307)

(assert (=> b!1330632 (= res!882539 (contains!8845 (getCurrentListMap!5644 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330633 () Bool)

(declare-fun res!882532 () Bool)

(assert (=> b!1330633 (=> (not res!882532) (not e!758685))))

(assert (=> b!1330633 (= res!882532 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44043 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112448 res!882533) b!1330624))

(assert (= (and b!1330624 res!882534) b!1330631))

(assert (= (and b!1330631 res!882535) b!1330629))

(assert (= (and b!1330629 res!882531) b!1330633))

(assert (= (and b!1330633 res!882532) b!1330632))

(assert (= (and b!1330632 res!882539) b!1330627))

(assert (= (and b!1330627 res!882537) b!1330625))

(assert (= (and b!1330625 res!882536) b!1330623))

(assert (= (and b!1330623 res!882538) b!1330622))

(assert (= (and b!1330626 condMapEmpty!56467) mapIsEmpty!56467))

(assert (= (and b!1330626 (not condMapEmpty!56467)) mapNonEmpty!56467))

(get-info :version)

(assert (= (and mapNonEmpty!56467 ((_ is ValueCellFull!17366) mapValue!56467)) b!1330628))

(assert (= (and b!1330626 ((_ is ValueCellFull!17366) mapDefault!56467)) b!1330630))

(assert (= start!112448 b!1330626))

(declare-fun b_lambda!23873 () Bool)

(assert (=> (not b_lambda!23873) (not b!1330622)))

(declare-fun t!44838 () Bool)

(declare-fun tb!11827 () Bool)

(assert (=> (and start!112448 (= defaultEntry!1323 defaultEntry!1323) t!44838) tb!11827))

(declare-fun result!24733 () Bool)

(assert (=> tb!11827 (= result!24733 tp_is_empty!36529)))

(assert (=> b!1330622 t!44838))

(declare-fun b_and!49297 () Bool)

(assert (= b_and!49295 (and (=> t!44838 result!24733) b_and!49297)))

(declare-fun m!1219691 () Bool)

(assert (=> b!1330631 m!1219691))

(declare-fun m!1219693 () Bool)

(assert (=> b!1330622 m!1219693))

(declare-fun m!1219695 () Bool)

(assert (=> b!1330622 m!1219695))

(declare-fun m!1219697 () Bool)

(assert (=> b!1330622 m!1219697))

(declare-fun m!1219699 () Bool)

(assert (=> b!1330622 m!1219699))

(declare-fun m!1219701 () Bool)

(assert (=> b!1330622 m!1219701))

(assert (=> b!1330622 m!1219695))

(declare-fun m!1219703 () Bool)

(assert (=> b!1330622 m!1219703))

(assert (=> b!1330622 m!1219697))

(assert (=> b!1330622 m!1219701))

(declare-fun m!1219705 () Bool)

(assert (=> b!1330622 m!1219705))

(declare-fun m!1219707 () Bool)

(assert (=> b!1330622 m!1219707))

(declare-fun m!1219709 () Bool)

(assert (=> mapNonEmpty!56467 m!1219709))

(declare-fun m!1219711 () Bool)

(assert (=> b!1330629 m!1219711))

(assert (=> b!1330627 m!1219707))

(assert (=> b!1330625 m!1219707))

(assert (=> b!1330625 m!1219707))

(declare-fun m!1219713 () Bool)

(assert (=> b!1330625 m!1219713))

(declare-fun m!1219715 () Bool)

(assert (=> b!1330632 m!1219715))

(assert (=> b!1330632 m!1219715))

(declare-fun m!1219717 () Bool)

(assert (=> b!1330632 m!1219717))

(declare-fun m!1219719 () Bool)

(assert (=> start!112448 m!1219719))

(declare-fun m!1219721 () Bool)

(assert (=> start!112448 m!1219721))

(declare-fun m!1219723 () Bool)

(assert (=> start!112448 m!1219723))

(check-sat (not b!1330631) (not b_lambda!23873) (not b!1330625) (not b!1330622) (not start!112448) b_and!49297 (not b!1330632) (not b_next!30619) (not mapNonEmpty!56467) tp_is_empty!36529 (not b!1330629))
(check-sat b_and!49297 (not b_next!30619))
