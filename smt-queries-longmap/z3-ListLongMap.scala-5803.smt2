; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74872 () Bool)

(assert start!74872)

(declare-fun b_free!15409 () Bool)

(declare-fun b_next!15409 () Bool)

(assert (=> start!74872 (= b_free!15409 (not b_next!15409))))

(declare-fun tp!53931 () Bool)

(declare-fun b_and!25491 () Bool)

(assert (=> start!74872 (= tp!53931 b_and!25491)))

(declare-fun b!882541 () Bool)

(declare-fun res!599605 () Bool)

(declare-fun e!491183 () Bool)

(assert (=> b!882541 (=> (not res!599605) (not e!491183))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882541 (= res!599605 (validKeyInArray!0 k0!854))))

(declare-fun b!882542 () Bool)

(declare-fun res!599607 () Bool)

(declare-fun e!491180 () Bool)

(assert (=> b!882542 (=> res!599607 e!491180)))

(declare-datatypes ((List!17568 0))(
  ( (Nil!17565) (Cons!17564 (h!18695 (_ BitVec 64)) (t!24770 List!17568)) )
))
(declare-fun contains!4247 (List!17568 (_ BitVec 64)) Bool)

(assert (=> b!882542 (= res!599607 (contains!4247 Nil!17565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882543 () Bool)

(declare-fun e!491176 () Bool)

(declare-fun tp_is_empty!17653 () Bool)

(assert (=> b!882543 (= e!491176 tp_is_empty!17653)))

(declare-fun mapNonEmpty!28116 () Bool)

(declare-fun mapRes!28116 () Bool)

(declare-fun tp!53930 () Bool)

(declare-fun e!491175 () Bool)

(assert (=> mapNonEmpty!28116 (= mapRes!28116 (and tp!53930 e!491175))))

(declare-fun mapKey!28116 () (_ BitVec 32))

(declare-datatypes ((V!28585 0))(
  ( (V!28586 (val!8874 Int)) )
))
(declare-datatypes ((ValueCell!8387 0))(
  ( (ValueCellFull!8387 (v!11337 V!28585)) (EmptyCell!8387) )
))
(declare-fun mapRest!28116 () (Array (_ BitVec 32) ValueCell!8387))

(declare-fun mapValue!28116 () ValueCell!8387)

(declare-datatypes ((array!51419 0))(
  ( (array!51420 (arr!24729 (Array (_ BitVec 32) ValueCell!8387)) (size!25171 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51419)

(assert (=> mapNonEmpty!28116 (= (arr!24729 _values!688) (store mapRest!28116 mapKey!28116 mapValue!28116))))

(declare-fun b!882545 () Bool)

(declare-fun res!599609 () Bool)

(assert (=> b!882545 (=> (not res!599609) (not e!491183))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882545 (= res!599609 (validMask!0 mask!1196))))

(declare-fun b!882546 () Bool)

(declare-fun res!599606 () Bool)

(assert (=> b!882546 (=> (not res!599606) (not e!491183))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51421 0))(
  ( (array!51422 (arr!24730 (Array (_ BitVec 32) (_ BitVec 64))) (size!25172 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51421)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882546 (= res!599606 (and (= (select (arr!24730 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882547 () Bool)

(declare-fun e!491177 () Bool)

(declare-fun e!491182 () Bool)

(assert (=> b!882547 (= e!491177 (not e!491182))))

(declare-fun res!599601 () Bool)

(assert (=> b!882547 (=> res!599601 e!491182)))

(assert (=> b!882547 (= res!599601 (not (validKeyInArray!0 (select (arr!24730 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11772 0))(
  ( (tuple2!11773 (_1!5897 (_ BitVec 64)) (_2!5897 V!28585)) )
))
(declare-datatypes ((List!17569 0))(
  ( (Nil!17566) (Cons!17565 (h!18696 tuple2!11772) (t!24771 List!17569)) )
))
(declare-datatypes ((ListLongMap!10531 0))(
  ( (ListLongMap!10532 (toList!5281 List!17569)) )
))
(declare-fun lt!399193 () ListLongMap!10531)

(declare-fun lt!399187 () ListLongMap!10531)

(assert (=> b!882547 (= lt!399193 lt!399187)))

(declare-fun v!557 () V!28585)

(declare-fun lt!399188 () ListLongMap!10531)

(declare-fun +!2573 (ListLongMap!10531 tuple2!11772) ListLongMap!10531)

(assert (=> b!882547 (= lt!399187 (+!2573 lt!399188 (tuple2!11773 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28585)

(declare-fun zeroValue!654 () V!28585)

(declare-fun lt!399191 () array!51419)

(declare-fun getCurrentListMapNoExtraKeys!3272 (array!51421 array!51419 (_ BitVec 32) (_ BitVec 32) V!28585 V!28585 (_ BitVec 32) Int) ListLongMap!10531)

(assert (=> b!882547 (= lt!399193 (getCurrentListMapNoExtraKeys!3272 _keys!868 lt!399191 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882547 (= lt!399188 (getCurrentListMapNoExtraKeys!3272 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30057 0))(
  ( (Unit!30058) )
))
(declare-fun lt!399186 () Unit!30057)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!738 (array!51421 array!51419 (_ BitVec 32) (_ BitVec 32) V!28585 V!28585 (_ BitVec 32) (_ BitVec 64) V!28585 (_ BitVec 32) Int) Unit!30057)

(assert (=> b!882547 (= lt!399186 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!738 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882548 () Bool)

(declare-fun e!491179 () Bool)

(assert (=> b!882548 (= e!491182 e!491179)))

(declare-fun res!599614 () Bool)

(assert (=> b!882548 (=> res!599614 e!491179)))

(assert (=> b!882548 (= res!599614 (not (= (select (arr!24730 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399194 () ListLongMap!10531)

(declare-fun get!13033 (ValueCell!8387 V!28585) V!28585)

(declare-fun dynLambda!1261 (Int (_ BitVec 64)) V!28585)

(assert (=> b!882548 (= lt!399194 (+!2573 lt!399187 (tuple2!11773 (select (arr!24730 _keys!868) from!1053) (get!13033 (select (arr!24729 _values!688) from!1053) (dynLambda!1261 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882549 () Bool)

(declare-fun res!599613 () Bool)

(assert (=> b!882549 (=> (not res!599613) (not e!491183))))

(assert (=> b!882549 (= res!599613 (and (= (size!25171 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25172 _keys!868) (size!25171 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882550 () Bool)

(declare-fun e!491178 () Bool)

(assert (=> b!882550 (= e!491178 (and e!491176 mapRes!28116))))

(declare-fun condMapEmpty!28116 () Bool)

(declare-fun mapDefault!28116 () ValueCell!8387)

(assert (=> b!882550 (= condMapEmpty!28116 (= (arr!24729 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8387)) mapDefault!28116)))))

(declare-fun b!882551 () Bool)

(declare-fun res!599610 () Bool)

(assert (=> b!882551 (=> res!599610 e!491180)))

(declare-fun noDuplicate!1326 (List!17568) Bool)

(assert (=> b!882551 (= res!599610 (not (noDuplicate!1326 Nil!17565)))))

(declare-fun b!882552 () Bool)

(declare-fun res!599602 () Bool)

(assert (=> b!882552 (=> (not res!599602) (not e!491183))))

(declare-fun arrayNoDuplicates!0 (array!51421 (_ BitVec 32) List!17568) Bool)

(assert (=> b!882552 (= res!599602 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17565))))

(declare-fun b!882553 () Bool)

(declare-fun res!599611 () Bool)

(assert (=> b!882553 (=> (not res!599611) (not e!491183))))

(assert (=> b!882553 (= res!599611 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25172 _keys!868))))))

(declare-fun mapIsEmpty!28116 () Bool)

(assert (=> mapIsEmpty!28116 mapRes!28116))

(declare-fun b!882554 () Bool)

(assert (=> b!882554 (= e!491180 true)))

(declare-fun lt!399192 () Bool)

(assert (=> b!882554 (= lt!399192 (contains!4247 Nil!17565 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882555 () Bool)

(assert (=> b!882555 (= e!491183 e!491177)))

(declare-fun res!599608 () Bool)

(assert (=> b!882555 (=> (not res!599608) (not e!491177))))

(assert (=> b!882555 (= res!599608 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!882555 (= lt!399194 (getCurrentListMapNoExtraKeys!3272 _keys!868 lt!399191 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882555 (= lt!399191 (array!51420 (store (arr!24729 _values!688) i!612 (ValueCellFull!8387 v!557)) (size!25171 _values!688)))))

(declare-fun lt!399190 () ListLongMap!10531)

(assert (=> b!882555 (= lt!399190 (getCurrentListMapNoExtraKeys!3272 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!599604 () Bool)

(assert (=> start!74872 (=> (not res!599604) (not e!491183))))

(assert (=> start!74872 (= res!599604 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25172 _keys!868))))))

(assert (=> start!74872 e!491183))

(assert (=> start!74872 tp_is_empty!17653))

(assert (=> start!74872 true))

(assert (=> start!74872 tp!53931))

(declare-fun array_inv!19520 (array!51421) Bool)

(assert (=> start!74872 (array_inv!19520 _keys!868)))

(declare-fun array_inv!19521 (array!51419) Bool)

(assert (=> start!74872 (and (array_inv!19521 _values!688) e!491178)))

(declare-fun b!882544 () Bool)

(declare-fun res!599612 () Bool)

(assert (=> b!882544 (=> (not res!599612) (not e!491183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51421 (_ BitVec 32)) Bool)

(assert (=> b!882544 (= res!599612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882556 () Bool)

(assert (=> b!882556 (= e!491179 e!491180)))

(declare-fun res!599603 () Bool)

(assert (=> b!882556 (=> res!599603 e!491180)))

(assert (=> b!882556 (= res!599603 (or (bvsge (size!25172 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25172 _keys!868)) (bvsge from!1053 (size!25172 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882556 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399189 () Unit!30057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30057)

(assert (=> b!882556 (= lt!399189 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882556 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17565)))

(declare-fun lt!399195 () Unit!30057)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51421 (_ BitVec 32) (_ BitVec 32)) Unit!30057)

(assert (=> b!882556 (= lt!399195 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882557 () Bool)

(assert (=> b!882557 (= e!491175 tp_is_empty!17653)))

(assert (= (and start!74872 res!599604) b!882545))

(assert (= (and b!882545 res!599609) b!882549))

(assert (= (and b!882549 res!599613) b!882544))

(assert (= (and b!882544 res!599612) b!882552))

(assert (= (and b!882552 res!599602) b!882553))

(assert (= (and b!882553 res!599611) b!882541))

(assert (= (and b!882541 res!599605) b!882546))

(assert (= (and b!882546 res!599606) b!882555))

(assert (= (and b!882555 res!599608) b!882547))

(assert (= (and b!882547 (not res!599601)) b!882548))

(assert (= (and b!882548 (not res!599614)) b!882556))

(assert (= (and b!882556 (not res!599603)) b!882551))

(assert (= (and b!882551 (not res!599610)) b!882542))

(assert (= (and b!882542 (not res!599607)) b!882554))

(assert (= (and b!882550 condMapEmpty!28116) mapIsEmpty!28116))

(assert (= (and b!882550 (not condMapEmpty!28116)) mapNonEmpty!28116))

(get-info :version)

(assert (= (and mapNonEmpty!28116 ((_ is ValueCellFull!8387) mapValue!28116)) b!882557))

(assert (= (and b!882550 ((_ is ValueCellFull!8387) mapDefault!28116)) b!882543))

(assert (= start!74872 b!882550))

(declare-fun b_lambda!12669 () Bool)

(assert (=> (not b_lambda!12669) (not b!882548)))

(declare-fun t!24769 () Bool)

(declare-fun tb!5059 () Bool)

(assert (=> (and start!74872 (= defaultEntry!696 defaultEntry!696) t!24769) tb!5059))

(declare-fun result!9761 () Bool)

(assert (=> tb!5059 (= result!9761 tp_is_empty!17653)))

(assert (=> b!882548 t!24769))

(declare-fun b_and!25493 () Bool)

(assert (= b_and!25491 (and (=> t!24769 result!9761) b_and!25493)))

(declare-fun m!822015 () Bool)

(assert (=> b!882547 m!822015))

(declare-fun m!822017 () Bool)

(assert (=> b!882547 m!822017))

(declare-fun m!822019 () Bool)

(assert (=> b!882547 m!822019))

(declare-fun m!822021 () Bool)

(assert (=> b!882547 m!822021))

(assert (=> b!882547 m!822019))

(declare-fun m!822023 () Bool)

(assert (=> b!882547 m!822023))

(declare-fun m!822025 () Bool)

(assert (=> b!882547 m!822025))

(declare-fun m!822027 () Bool)

(assert (=> b!882554 m!822027))

(declare-fun m!822029 () Bool)

(assert (=> b!882544 m!822029))

(declare-fun m!822031 () Bool)

(assert (=> b!882546 m!822031))

(declare-fun m!822033 () Bool)

(assert (=> mapNonEmpty!28116 m!822033))

(declare-fun m!822035 () Bool)

(assert (=> start!74872 m!822035))

(declare-fun m!822037 () Bool)

(assert (=> start!74872 m!822037))

(declare-fun m!822039 () Bool)

(assert (=> b!882551 m!822039))

(declare-fun m!822041 () Bool)

(assert (=> b!882541 m!822041))

(declare-fun m!822043 () Bool)

(assert (=> b!882542 m!822043))

(declare-fun m!822045 () Bool)

(assert (=> b!882556 m!822045))

(declare-fun m!822047 () Bool)

(assert (=> b!882556 m!822047))

(declare-fun m!822049 () Bool)

(assert (=> b!882556 m!822049))

(declare-fun m!822051 () Bool)

(assert (=> b!882556 m!822051))

(declare-fun m!822053 () Bool)

(assert (=> b!882555 m!822053))

(declare-fun m!822055 () Bool)

(assert (=> b!882555 m!822055))

(declare-fun m!822057 () Bool)

(assert (=> b!882555 m!822057))

(declare-fun m!822059 () Bool)

(assert (=> b!882545 m!822059))

(declare-fun m!822061 () Bool)

(assert (=> b!882552 m!822061))

(declare-fun m!822063 () Bool)

(assert (=> b!882548 m!822063))

(declare-fun m!822065 () Bool)

(assert (=> b!882548 m!822065))

(declare-fun m!822067 () Bool)

(assert (=> b!882548 m!822067))

(declare-fun m!822069 () Bool)

(assert (=> b!882548 m!822069))

(assert (=> b!882548 m!822065))

(assert (=> b!882548 m!822019))

(assert (=> b!882548 m!822067))

(check-sat (not start!74872) (not b!882544) (not b!882542) tp_is_empty!17653 (not b!882552) (not b!882547) (not b!882548) (not b!882554) (not b!882545) b_and!25493 (not b!882541) (not b_lambda!12669) (not mapNonEmpty!28116) (not b_next!15409) (not b!882556) (not b!882551) (not b!882555))
(check-sat b_and!25493 (not b_next!15409))
