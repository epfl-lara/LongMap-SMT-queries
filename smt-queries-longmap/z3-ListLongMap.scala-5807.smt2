; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74896 () Bool)

(assert start!74896)

(declare-fun b_free!15433 () Bool)

(declare-fun b_next!15433 () Bool)

(assert (=> start!74896 (= b_free!15433 (not b_next!15433))))

(declare-fun tp!54002 () Bool)

(declare-fun b_and!25539 () Bool)

(assert (=> start!74896 (= tp!54002 b_and!25539)))

(declare-fun b!883128 () Bool)

(declare-fun e!491481 () Bool)

(declare-fun e!491480 () Bool)

(declare-fun mapRes!28152 () Bool)

(assert (=> b!883128 (= e!491481 (and e!491480 mapRes!28152))))

(declare-fun condMapEmpty!28152 () Bool)

(declare-datatypes ((V!28617 0))(
  ( (V!28618 (val!8886 Int)) )
))
(declare-datatypes ((ValueCell!8399 0))(
  ( (ValueCellFull!8399 (v!11349 V!28617)) (EmptyCell!8399) )
))
(declare-datatypes ((array!51463 0))(
  ( (array!51464 (arr!24751 (Array (_ BitVec 32) ValueCell!8399)) (size!25193 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51463)

(declare-fun mapDefault!28152 () ValueCell!8399)

(assert (=> b!883128 (= condMapEmpty!28152 (= (arr!24751 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8399)) mapDefault!28152)))))

(declare-fun b!883129 () Bool)

(declare-fun res!600039 () Bool)

(declare-fun e!491485 () Bool)

(assert (=> b!883129 (=> (not res!600039) (not e!491485))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883129 (= res!600039 (validMask!0 mask!1196))))

(declare-fun b!883130 () Bool)

(declare-fun res!600042 () Bool)

(assert (=> b!883130 (=> (not res!600042) (not e!491485))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883130 (= res!600042 (validKeyInArray!0 k0!854))))

(declare-fun b!883131 () Bool)

(declare-fun e!491479 () Bool)

(declare-fun e!491483 () Bool)

(assert (=> b!883131 (= e!491479 (not e!491483))))

(declare-fun res!600034 () Bool)

(assert (=> b!883131 (=> res!600034 e!491483)))

(declare-datatypes ((array!51465 0))(
  ( (array!51466 (arr!24752 (Array (_ BitVec 32) (_ BitVec 64))) (size!25194 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51465)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883131 (= res!600034 (not (validKeyInArray!0 (select (arr!24752 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11788 0))(
  ( (tuple2!11789 (_1!5905 (_ BitVec 64)) (_2!5905 V!28617)) )
))
(declare-datatypes ((List!17585 0))(
  ( (Nil!17582) (Cons!17581 (h!18712 tuple2!11788) (t!24811 List!17585)) )
))
(declare-datatypes ((ListLongMap!10547 0))(
  ( (ListLongMap!10548 (toList!5289 List!17585)) )
))
(declare-fun lt!399565 () ListLongMap!10547)

(declare-fun lt!399560 () ListLongMap!10547)

(assert (=> b!883131 (= lt!399565 lt!399560)))

(declare-fun v!557 () V!28617)

(declare-fun lt!399563 () ListLongMap!10547)

(declare-fun +!2581 (ListLongMap!10547 tuple2!11788) ListLongMap!10547)

(assert (=> b!883131 (= lt!399560 (+!2581 lt!399563 (tuple2!11789 k0!854 v!557)))))

(declare-fun lt!399562 () array!51463)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28617)

(declare-fun zeroValue!654 () V!28617)

(declare-fun getCurrentListMapNoExtraKeys!3280 (array!51465 array!51463 (_ BitVec 32) (_ BitVec 32) V!28617 V!28617 (_ BitVec 32) Int) ListLongMap!10547)

(assert (=> b!883131 (= lt!399565 (getCurrentListMapNoExtraKeys!3280 _keys!868 lt!399562 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883131 (= lt!399563 (getCurrentListMapNoExtraKeys!3280 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30078 0))(
  ( (Unit!30079) )
))
(declare-fun lt!399564 () Unit!30078)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!745 (array!51465 array!51463 (_ BitVec 32) (_ BitVec 32) V!28617 V!28617 (_ BitVec 32) (_ BitVec 64) V!28617 (_ BitVec 32) Int) Unit!30078)

(assert (=> b!883131 (= lt!399564 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883132 () Bool)

(declare-fun res!600035 () Bool)

(assert (=> b!883132 (=> (not res!600035) (not e!491485))))

(assert (=> b!883132 (= res!600035 (and (= (select (arr!24752 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883133 () Bool)

(assert (=> b!883133 (= e!491485 e!491479)))

(declare-fun res!600036 () Bool)

(assert (=> b!883133 (=> (not res!600036) (not e!491479))))

(assert (=> b!883133 (= res!600036 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399567 () ListLongMap!10547)

(assert (=> b!883133 (= lt!399567 (getCurrentListMapNoExtraKeys!3280 _keys!868 lt!399562 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883133 (= lt!399562 (array!51464 (store (arr!24751 _values!688) i!612 (ValueCellFull!8399 v!557)) (size!25193 _values!688)))))

(declare-fun lt!399566 () ListLongMap!10547)

(assert (=> b!883133 (= lt!399566 (getCurrentListMapNoExtraKeys!3280 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!28152 () Bool)

(assert (=> mapIsEmpty!28152 mapRes!28152))

(declare-fun b!883134 () Bool)

(declare-fun e!491482 () Unit!30078)

(declare-fun Unit!30080 () Unit!30078)

(assert (=> b!883134 (= e!491482 Unit!30080)))

(declare-fun b!883135 () Bool)

(declare-fun res!600037 () Bool)

(assert (=> b!883135 (=> (not res!600037) (not e!491485))))

(assert (=> b!883135 (= res!600037 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25194 _keys!868))))))

(declare-fun mapNonEmpty!28152 () Bool)

(declare-fun tp!54003 () Bool)

(declare-fun e!491484 () Bool)

(assert (=> mapNonEmpty!28152 (= mapRes!28152 (and tp!54003 e!491484))))

(declare-fun mapValue!28152 () ValueCell!8399)

(declare-fun mapKey!28152 () (_ BitVec 32))

(declare-fun mapRest!28152 () (Array (_ BitVec 32) ValueCell!8399))

(assert (=> mapNonEmpty!28152 (= (arr!24751 _values!688) (store mapRest!28152 mapKey!28152 mapValue!28152))))

(declare-fun res!600040 () Bool)

(assert (=> start!74896 (=> (not res!600040) (not e!491485))))

(assert (=> start!74896 (= res!600040 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25194 _keys!868))))))

(assert (=> start!74896 e!491485))

(declare-fun tp_is_empty!17677 () Bool)

(assert (=> start!74896 tp_is_empty!17677))

(assert (=> start!74896 true))

(assert (=> start!74896 tp!54002))

(declare-fun array_inv!19538 (array!51465) Bool)

(assert (=> start!74896 (array_inv!19538 _keys!868)))

(declare-fun array_inv!19539 (array!51463) Bool)

(assert (=> start!74896 (and (array_inv!19539 _values!688) e!491481)))

(declare-fun b!883136 () Bool)

(declare-fun res!600043 () Bool)

(assert (=> b!883136 (=> (not res!600043) (not e!491485))))

(assert (=> b!883136 (= res!600043 (and (= (size!25193 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25194 _keys!868) (size!25193 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883137 () Bool)

(assert (=> b!883137 (= e!491480 tp_is_empty!17677)))

(declare-fun b!883138 () Bool)

(declare-fun Unit!30081 () Unit!30078)

(assert (=> b!883138 (= e!491482 Unit!30081)))

(declare-fun lt!399559 () Unit!30078)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51465 (_ BitVec 32) (_ BitVec 32)) Unit!30078)

(assert (=> b!883138 (= lt!399559 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17586 0))(
  ( (Nil!17583) (Cons!17582 (h!18713 (_ BitVec 64)) (t!24812 List!17586)) )
))
(declare-fun arrayNoDuplicates!0 (array!51465 (_ BitVec 32) List!17586) Bool)

(assert (=> b!883138 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17583)))

(declare-fun lt!399561 () Unit!30078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51465 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30078)

(assert (=> b!883138 (= lt!399561 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883138 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399557 () Unit!30078)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51465 (_ BitVec 64) (_ BitVec 32) List!17586) Unit!30078)

(assert (=> b!883138 (= lt!399557 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17583))))

(assert (=> b!883138 false))

(declare-fun b!883139 () Bool)

(assert (=> b!883139 (= e!491484 tp_is_empty!17677)))

(declare-fun b!883140 () Bool)

(declare-fun res!600041 () Bool)

(assert (=> b!883140 (=> (not res!600041) (not e!491485))))

(assert (=> b!883140 (= res!600041 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17583))))

(declare-fun b!883141 () Bool)

(assert (=> b!883141 (= e!491483 (not (= (select (arr!24752 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399558 () Unit!30078)

(assert (=> b!883141 (= lt!399558 e!491482)))

(declare-fun c!92990 () Bool)

(assert (=> b!883141 (= c!92990 (= (select (arr!24752 _keys!868) from!1053) k0!854))))

(declare-fun get!13048 (ValueCell!8399 V!28617) V!28617)

(declare-fun dynLambda!1268 (Int (_ BitVec 64)) V!28617)

(assert (=> b!883141 (= lt!399567 (+!2581 lt!399560 (tuple2!11789 (select (arr!24752 _keys!868) from!1053) (get!13048 (select (arr!24751 _values!688) from!1053) (dynLambda!1268 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883142 () Bool)

(declare-fun res!600038 () Bool)

(assert (=> b!883142 (=> (not res!600038) (not e!491485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51465 (_ BitVec 32)) Bool)

(assert (=> b!883142 (= res!600038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74896 res!600040) b!883129))

(assert (= (and b!883129 res!600039) b!883136))

(assert (= (and b!883136 res!600043) b!883142))

(assert (= (and b!883142 res!600038) b!883140))

(assert (= (and b!883140 res!600041) b!883135))

(assert (= (and b!883135 res!600037) b!883130))

(assert (= (and b!883130 res!600042) b!883132))

(assert (= (and b!883132 res!600035) b!883133))

(assert (= (and b!883133 res!600036) b!883131))

(assert (= (and b!883131 (not res!600034)) b!883141))

(assert (= (and b!883141 c!92990) b!883138))

(assert (= (and b!883141 (not c!92990)) b!883134))

(assert (= (and b!883128 condMapEmpty!28152) mapIsEmpty!28152))

(assert (= (and b!883128 (not condMapEmpty!28152)) mapNonEmpty!28152))

(get-info :version)

(assert (= (and mapNonEmpty!28152 ((_ is ValueCellFull!8399) mapValue!28152)) b!883139))

(assert (= (and b!883128 ((_ is ValueCellFull!8399) mapDefault!28152)) b!883137))

(assert (= start!74896 b!883128))

(declare-fun b_lambda!12693 () Bool)

(assert (=> (not b_lambda!12693) (not b!883141)))

(declare-fun t!24810 () Bool)

(declare-fun tb!5083 () Bool)

(assert (=> (and start!74896 (= defaultEntry!696 defaultEntry!696) t!24810) tb!5083))

(declare-fun result!9809 () Bool)

(assert (=> tb!5083 (= result!9809 tp_is_empty!17677)))

(assert (=> b!883141 t!24810))

(declare-fun b_and!25541 () Bool)

(assert (= b_and!25539 (and (=> t!24810 result!9809) b_and!25541)))

(declare-fun m!822663 () Bool)

(assert (=> b!883132 m!822663))

(declare-fun m!822665 () Bool)

(assert (=> b!883138 m!822665))

(declare-fun m!822667 () Bool)

(assert (=> b!883138 m!822667))

(declare-fun m!822669 () Bool)

(assert (=> b!883138 m!822669))

(declare-fun m!822671 () Bool)

(assert (=> b!883138 m!822671))

(declare-fun m!822673 () Bool)

(assert (=> b!883138 m!822673))

(declare-fun m!822675 () Bool)

(assert (=> mapNonEmpty!28152 m!822675))

(declare-fun m!822677 () Bool)

(assert (=> b!883130 m!822677))

(declare-fun m!822679 () Bool)

(assert (=> b!883141 m!822679))

(declare-fun m!822681 () Bool)

(assert (=> b!883141 m!822681))

(declare-fun m!822683 () Bool)

(assert (=> b!883141 m!822683))

(declare-fun m!822685 () Bool)

(assert (=> b!883141 m!822685))

(assert (=> b!883141 m!822681))

(declare-fun m!822687 () Bool)

(assert (=> b!883141 m!822687))

(assert (=> b!883141 m!822683))

(declare-fun m!822689 () Bool)

(assert (=> b!883140 m!822689))

(declare-fun m!822691 () Bool)

(assert (=> b!883131 m!822691))

(declare-fun m!822693 () Bool)

(assert (=> b!883131 m!822693))

(assert (=> b!883131 m!822687))

(declare-fun m!822695 () Bool)

(assert (=> b!883131 m!822695))

(assert (=> b!883131 m!822687))

(declare-fun m!822697 () Bool)

(assert (=> b!883131 m!822697))

(declare-fun m!822699 () Bool)

(assert (=> b!883131 m!822699))

(declare-fun m!822701 () Bool)

(assert (=> b!883129 m!822701))

(declare-fun m!822703 () Bool)

(assert (=> start!74896 m!822703))

(declare-fun m!822705 () Bool)

(assert (=> start!74896 m!822705))

(declare-fun m!822707 () Bool)

(assert (=> b!883142 m!822707))

(declare-fun m!822709 () Bool)

(assert (=> b!883133 m!822709))

(declare-fun m!822711 () Bool)

(assert (=> b!883133 m!822711))

(declare-fun m!822713 () Bool)

(assert (=> b!883133 m!822713))

(check-sat (not b!883131) (not start!74896) (not b!883129) (not b_lambda!12693) (not b!883141) (not b_next!15433) (not b!883133) tp_is_empty!17677 (not b!883138) b_and!25541 (not b!883130) (not mapNonEmpty!28152) (not b!883142) (not b!883140))
(check-sat b_and!25541 (not b_next!15433))
