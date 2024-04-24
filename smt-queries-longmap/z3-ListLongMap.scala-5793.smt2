; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74868 () Bool)

(assert start!74868)

(declare-fun b_free!15349 () Bool)

(declare-fun b_next!15349 () Bool)

(assert (=> start!74868 (= b_free!15349 (not b_next!15349))))

(declare-fun tp!53736 () Bool)

(declare-fun b_and!25327 () Bool)

(assert (=> start!74868 (= tp!53736 b_and!25327)))

(declare-fun b!881593 () Bool)

(declare-fun res!598708 () Bool)

(declare-fun e!490676 () Bool)

(assert (=> b!881593 (=> (not res!598708) (not e!490676))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881593 (= res!598708 (validKeyInArray!0 k0!854))))

(declare-fun b!881594 () Bool)

(declare-fun e!490679 () Bool)

(assert (=> b!881594 (= e!490679 true)))

(declare-datatypes ((array!51347 0))(
  ( (array!51348 (arr!24693 (Array (_ BitVec 32) (_ BitVec 64))) (size!25134 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51347)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!17471 0))(
  ( (Nil!17468) (Cons!17467 (h!18604 (_ BitVec 64)) (t!24614 List!17471)) )
))
(declare-fun arrayNoDuplicates!0 (array!51347 (_ BitVec 32) List!17471) Bool)

(assert (=> b!881594 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17468)))

(declare-datatypes ((Unit!30040 0))(
  ( (Unit!30041) )
))
(declare-fun lt!398621 () Unit!30040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51347 (_ BitVec 32) (_ BitVec 32)) Unit!30040)

(assert (=> b!881594 (= lt!398621 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!28011 () Bool)

(declare-fun mapRes!28011 () Bool)

(declare-fun tp!53735 () Bool)

(declare-fun e!490677 () Bool)

(assert (=> mapNonEmpty!28011 (= mapRes!28011 (and tp!53735 e!490677))))

(declare-datatypes ((V!28505 0))(
  ( (V!28506 (val!8844 Int)) )
))
(declare-datatypes ((ValueCell!8357 0))(
  ( (ValueCellFull!8357 (v!11292 V!28505)) (EmptyCell!8357) )
))
(declare-fun mapValue!28011 () ValueCell!8357)

(declare-fun mapKey!28011 () (_ BitVec 32))

(declare-fun mapRest!28011 () (Array (_ BitVec 32) ValueCell!8357))

(declare-datatypes ((array!51349 0))(
  ( (array!51350 (arr!24694 (Array (_ BitVec 32) ValueCell!8357)) (size!25135 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51349)

(assert (=> mapNonEmpty!28011 (= (arr!24694 _values!688) (store mapRest!28011 mapKey!28011 mapValue!28011))))

(declare-fun b!881595 () Bool)

(declare-fun res!598707 () Bool)

(assert (=> b!881595 (=> (not res!598707) (not e!490676))))

(assert (=> b!881595 (= res!598707 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17468))))

(declare-fun b!881596 () Bool)

(declare-fun e!490675 () Bool)

(declare-fun tp_is_empty!17593 () Bool)

(assert (=> b!881596 (= e!490675 tp_is_empty!17593)))

(declare-fun b!881597 () Bool)

(declare-fun res!598715 () Bool)

(assert (=> b!881597 (=> (not res!598715) (not e!490676))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881597 (= res!598715 (and (= (select (arr!24693 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28011 () Bool)

(assert (=> mapIsEmpty!28011 mapRes!28011))

(declare-fun b!881598 () Bool)

(declare-fun e!490678 () Bool)

(assert (=> b!881598 (= e!490678 (and e!490675 mapRes!28011))))

(declare-fun condMapEmpty!28011 () Bool)

(declare-fun mapDefault!28011 () ValueCell!8357)

(assert (=> b!881598 (= condMapEmpty!28011 (= (arr!24694 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8357)) mapDefault!28011)))))

(declare-fun b!881599 () Bool)

(declare-fun e!490680 () Bool)

(assert (=> b!881599 (= e!490680 e!490679)))

(declare-fun res!598709 () Bool)

(assert (=> b!881599 (=> res!598709 e!490679)))

(assert (=> b!881599 (= res!598709 (not (= (select (arr!24693 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11642 0))(
  ( (tuple2!11643 (_1!5832 (_ BitVec 64)) (_2!5832 V!28505)) )
))
(declare-datatypes ((List!17472 0))(
  ( (Nil!17469) (Cons!17468 (h!18605 tuple2!11642) (t!24615 List!17472)) )
))
(declare-datatypes ((ListLongMap!10413 0))(
  ( (ListLongMap!10414 (toList!5222 List!17472)) )
))
(declare-fun lt!398623 () ListLongMap!10413)

(declare-fun lt!398618 () ListLongMap!10413)

(declare-fun +!2537 (ListLongMap!10413 tuple2!11642) ListLongMap!10413)

(declare-fun get!13007 (ValueCell!8357 V!28505) V!28505)

(declare-fun dynLambda!1262 (Int (_ BitVec 64)) V!28505)

(assert (=> b!881599 (= lt!398623 (+!2537 lt!398618 (tuple2!11643 (select (arr!24693 _keys!868) from!1053) (get!13007 (select (arr!24694 _values!688) from!1053) (dynLambda!1262 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881600 () Bool)

(declare-fun res!598710 () Bool)

(assert (=> b!881600 (=> (not res!598710) (not e!490676))))

(assert (=> b!881600 (= res!598710 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25134 _keys!868))))))

(declare-fun res!598713 () Bool)

(assert (=> start!74868 (=> (not res!598713) (not e!490676))))

(assert (=> start!74868 (= res!598713 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25134 _keys!868))))))

(assert (=> start!74868 e!490676))

(assert (=> start!74868 tp_is_empty!17593))

(assert (=> start!74868 true))

(assert (=> start!74868 tp!53736))

(declare-fun array_inv!19490 (array!51347) Bool)

(assert (=> start!74868 (array_inv!19490 _keys!868)))

(declare-fun array_inv!19491 (array!51349) Bool)

(assert (=> start!74868 (and (array_inv!19491 _values!688) e!490678)))

(declare-fun b!881601 () Bool)

(assert (=> b!881601 (= e!490677 tp_is_empty!17593)))

(declare-fun b!881602 () Bool)

(declare-fun res!598705 () Bool)

(assert (=> b!881602 (=> (not res!598705) (not e!490676))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!881602 (= res!598705 (and (= (size!25135 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25134 _keys!868) (size!25135 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881603 () Bool)

(declare-fun res!598712 () Bool)

(assert (=> b!881603 (=> (not res!598712) (not e!490676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881603 (= res!598712 (validMask!0 mask!1196))))

(declare-fun b!881604 () Bool)

(declare-fun e!490673 () Bool)

(assert (=> b!881604 (= e!490673 (not e!490680))))

(declare-fun res!598714 () Bool)

(assert (=> b!881604 (=> res!598714 e!490680)))

(assert (=> b!881604 (= res!598714 (not (validKeyInArray!0 (select (arr!24693 _keys!868) from!1053))))))

(declare-fun lt!398619 () ListLongMap!10413)

(assert (=> b!881604 (= lt!398619 lt!398618)))

(declare-fun v!557 () V!28505)

(declare-fun lt!398625 () ListLongMap!10413)

(assert (=> b!881604 (= lt!398618 (+!2537 lt!398625 (tuple2!11643 k0!854 v!557)))))

(declare-fun minValue!654 () V!28505)

(declare-fun zeroValue!654 () V!28505)

(declare-fun lt!398622 () array!51349)

(declare-fun getCurrentListMapNoExtraKeys!3262 (array!51347 array!51349 (_ BitVec 32) (_ BitVec 32) V!28505 V!28505 (_ BitVec 32) Int) ListLongMap!10413)

(assert (=> b!881604 (= lt!398619 (getCurrentListMapNoExtraKeys!3262 _keys!868 lt!398622 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881604 (= lt!398625 (getCurrentListMapNoExtraKeys!3262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398624 () Unit!30040)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!702 (array!51347 array!51349 (_ BitVec 32) (_ BitVec 32) V!28505 V!28505 (_ BitVec 32) (_ BitVec 64) V!28505 (_ BitVec 32) Int) Unit!30040)

(assert (=> b!881604 (= lt!398624 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881605 () Bool)

(declare-fun res!598711 () Bool)

(assert (=> b!881605 (=> (not res!598711) (not e!490676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51347 (_ BitVec 32)) Bool)

(assert (=> b!881605 (= res!598711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881606 () Bool)

(assert (=> b!881606 (= e!490676 e!490673)))

(declare-fun res!598706 () Bool)

(assert (=> b!881606 (=> (not res!598706) (not e!490673))))

(assert (=> b!881606 (= res!598706 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!881606 (= lt!398623 (getCurrentListMapNoExtraKeys!3262 _keys!868 lt!398622 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881606 (= lt!398622 (array!51350 (store (arr!24694 _values!688) i!612 (ValueCellFull!8357 v!557)) (size!25135 _values!688)))))

(declare-fun lt!398620 () ListLongMap!10413)

(assert (=> b!881606 (= lt!398620 (getCurrentListMapNoExtraKeys!3262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74868 res!598713) b!881603))

(assert (= (and b!881603 res!598712) b!881602))

(assert (= (and b!881602 res!598705) b!881605))

(assert (= (and b!881605 res!598711) b!881595))

(assert (= (and b!881595 res!598707) b!881600))

(assert (= (and b!881600 res!598710) b!881593))

(assert (= (and b!881593 res!598708) b!881597))

(assert (= (and b!881597 res!598715) b!881606))

(assert (= (and b!881606 res!598706) b!881604))

(assert (= (and b!881604 (not res!598714)) b!881599))

(assert (= (and b!881599 (not res!598709)) b!881594))

(assert (= (and b!881598 condMapEmpty!28011) mapIsEmpty!28011))

(assert (= (and b!881598 (not condMapEmpty!28011)) mapNonEmpty!28011))

(get-info :version)

(assert (= (and mapNonEmpty!28011 ((_ is ValueCellFull!8357) mapValue!28011)) b!881601))

(assert (= (and b!881598 ((_ is ValueCellFull!8357) mapDefault!28011)) b!881596))

(assert (= start!74868 b!881598))

(declare-fun b_lambda!12471 () Bool)

(assert (=> (not b_lambda!12471) (not b!881599)))

(declare-fun t!24613 () Bool)

(declare-fun tb!4999 () Bool)

(assert (=> (and start!74868 (= defaultEntry!696 defaultEntry!696) t!24613) tb!4999))

(declare-fun result!9631 () Bool)

(assert (=> tb!4999 (= result!9631 tp_is_empty!17593)))

(assert (=> b!881599 t!24613))

(declare-fun b_and!25329 () Bool)

(assert (= b_and!25327 (and (=> t!24613 result!9631) b_and!25329)))

(declare-fun m!821771 () Bool)

(assert (=> b!881603 m!821771))

(declare-fun m!821773 () Bool)

(assert (=> b!881597 m!821773))

(declare-fun m!821775 () Bool)

(assert (=> b!881599 m!821775))

(declare-fun m!821777 () Bool)

(assert (=> b!881599 m!821777))

(declare-fun m!821779 () Bool)

(assert (=> b!881599 m!821779))

(declare-fun m!821781 () Bool)

(assert (=> b!881599 m!821781))

(assert (=> b!881599 m!821777))

(declare-fun m!821783 () Bool)

(assert (=> b!881599 m!821783))

(assert (=> b!881599 m!821779))

(declare-fun m!821785 () Bool)

(assert (=> b!881595 m!821785))

(declare-fun m!821787 () Bool)

(assert (=> b!881605 m!821787))

(declare-fun m!821789 () Bool)

(assert (=> mapNonEmpty!28011 m!821789))

(declare-fun m!821791 () Bool)

(assert (=> b!881594 m!821791))

(declare-fun m!821793 () Bool)

(assert (=> b!881594 m!821793))

(declare-fun m!821795 () Bool)

(assert (=> b!881606 m!821795))

(declare-fun m!821797 () Bool)

(assert (=> b!881606 m!821797))

(declare-fun m!821799 () Bool)

(assert (=> b!881606 m!821799))

(declare-fun m!821801 () Bool)

(assert (=> b!881604 m!821801))

(declare-fun m!821803 () Bool)

(assert (=> b!881604 m!821803))

(assert (=> b!881604 m!821783))

(declare-fun m!821805 () Bool)

(assert (=> b!881604 m!821805))

(assert (=> b!881604 m!821783))

(declare-fun m!821807 () Bool)

(assert (=> b!881604 m!821807))

(declare-fun m!821809 () Bool)

(assert (=> b!881604 m!821809))

(declare-fun m!821811 () Bool)

(assert (=> b!881593 m!821811))

(declare-fun m!821813 () Bool)

(assert (=> start!74868 m!821813))

(declare-fun m!821815 () Bool)

(assert (=> start!74868 m!821815))

(check-sat b_and!25329 (not b!881594) (not mapNonEmpty!28011) (not b!881603) (not start!74868) (not b_lambda!12471) tp_is_empty!17593 (not b!881599) (not b!881595) (not b!881593) (not b_next!15349) (not b!881606) (not b!881605) (not b!881604))
(check-sat b_and!25329 (not b_next!15349))
