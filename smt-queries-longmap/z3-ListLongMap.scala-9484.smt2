; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112514 () Bool)

(assert start!112514)

(declare-fun b_free!30909 () Bool)

(declare-fun b_next!30909 () Bool)

(assert (=> start!112514 (= b_free!30909 (not b_next!30909))))

(declare-fun tp!108363 () Bool)

(declare-fun b_and!49817 () Bool)

(assert (=> start!112514 (= tp!108363 b_and!49817)))

(declare-fun b!1334622 () Bool)

(declare-fun e!760102 () Bool)

(declare-fun e!760098 () Bool)

(declare-fun mapRes!56902 () Bool)

(assert (=> b!1334622 (= e!760102 (and e!760098 mapRes!56902))))

(declare-fun condMapEmpty!56902 () Bool)

(declare-datatypes ((V!54195 0))(
  ( (V!54196 (val!18484 Int)) )
))
(declare-datatypes ((ValueCell!17511 0))(
  ( (ValueCellFull!17511 (v!21121 V!54195)) (EmptyCell!17511) )
))
(declare-datatypes ((array!90504 0))(
  ( (array!90505 (arr!43718 (Array (_ BitVec 32) ValueCell!17511)) (size!44268 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90504)

(declare-fun mapDefault!56902 () ValueCell!17511)

(assert (=> b!1334622 (= condMapEmpty!56902 (= (arr!43718 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17511)) mapDefault!56902)))))

(declare-fun mapIsEmpty!56902 () Bool)

(assert (=> mapIsEmpty!56902 mapRes!56902))

(declare-fun b!1334623 () Bool)

(declare-fun e!760099 () Bool)

(assert (=> b!1334623 (= e!760099 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90506 0))(
  ( (array!90507 (arr!43719 (Array (_ BitVec 32) (_ BitVec 64))) (size!44269 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90506)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54195)

(declare-fun zeroValue!1262 () V!54195)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592369 () Bool)

(declare-datatypes ((tuple2!23834 0))(
  ( (tuple2!23835 (_1!11928 (_ BitVec 64)) (_2!11928 V!54195)) )
))
(declare-datatypes ((List!30973 0))(
  ( (Nil!30970) (Cons!30969 (h!32178 tuple2!23834) (t!45237 List!30973)) )
))
(declare-datatypes ((ListLongMap!21491 0))(
  ( (ListLongMap!21492 (toList!10761 List!30973)) )
))
(declare-fun contains!8925 (ListLongMap!21491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5735 (array!90506 array!90504 (_ BitVec 32) (_ BitVec 32) V!54195 V!54195 (_ BitVec 32) Int) ListLongMap!21491)

(assert (=> b!1334623 (= lt!592369 (contains!8925 (getCurrentListMap!5735 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56902 () Bool)

(declare-fun tp!108364 () Bool)

(declare-fun e!760101 () Bool)

(assert (=> mapNonEmpty!56902 (= mapRes!56902 (and tp!108364 e!760101))))

(declare-fun mapRest!56902 () (Array (_ BitVec 32) ValueCell!17511))

(declare-fun mapValue!56902 () ValueCell!17511)

(declare-fun mapKey!56902 () (_ BitVec 32))

(assert (=> mapNonEmpty!56902 (= (arr!43718 _values!1320) (store mapRest!56902 mapKey!56902 mapValue!56902))))

(declare-fun b!1334624 () Bool)

(declare-fun res!885776 () Bool)

(assert (=> b!1334624 (=> (not res!885776) (not e!760099))))

(assert (=> b!1334624 (= res!885776 (and (= (size!44268 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44269 _keys!1590) (size!44268 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334625 () Bool)

(declare-fun res!885777 () Bool)

(assert (=> b!1334625 (=> (not res!885777) (not e!760099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90506 (_ BitVec 32)) Bool)

(assert (=> b!1334625 (= res!885777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334626 () Bool)

(declare-fun tp_is_empty!36819 () Bool)

(assert (=> b!1334626 (= e!760101 tp_is_empty!36819)))

(declare-fun b!1334627 () Bool)

(declare-fun res!885774 () Bool)

(assert (=> b!1334627 (=> (not res!885774) (not e!760099))))

(assert (=> b!1334627 (= res!885774 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44269 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!885775 () Bool)

(assert (=> start!112514 (=> (not res!885775) (not e!760099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112514 (= res!885775 (validMask!0 mask!1998))))

(assert (=> start!112514 e!760099))

(declare-fun array_inv!32971 (array!90504) Bool)

(assert (=> start!112514 (and (array_inv!32971 _values!1320) e!760102)))

(assert (=> start!112514 true))

(declare-fun array_inv!32972 (array!90506) Bool)

(assert (=> start!112514 (array_inv!32972 _keys!1590)))

(assert (=> start!112514 tp!108363))

(assert (=> start!112514 tp_is_empty!36819))

(declare-fun b!1334628 () Bool)

(assert (=> b!1334628 (= e!760098 tp_is_empty!36819)))

(declare-fun b!1334629 () Bool)

(declare-fun res!885773 () Bool)

(assert (=> b!1334629 (=> (not res!885773) (not e!760099))))

(declare-datatypes ((List!30974 0))(
  ( (Nil!30971) (Cons!30970 (h!32179 (_ BitVec 64)) (t!45238 List!30974)) )
))
(declare-fun arrayNoDuplicates!0 (array!90506 (_ BitVec 32) List!30974) Bool)

(assert (=> b!1334629 (= res!885773 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30971))))

(assert (= (and start!112514 res!885775) b!1334624))

(assert (= (and b!1334624 res!885776) b!1334625))

(assert (= (and b!1334625 res!885777) b!1334629))

(assert (= (and b!1334629 res!885773) b!1334627))

(assert (= (and b!1334627 res!885774) b!1334623))

(assert (= (and b!1334622 condMapEmpty!56902) mapIsEmpty!56902))

(assert (= (and b!1334622 (not condMapEmpty!56902)) mapNonEmpty!56902))

(get-info :version)

(assert (= (and mapNonEmpty!56902 ((_ is ValueCellFull!17511) mapValue!56902)) b!1334626))

(assert (= (and b!1334622 ((_ is ValueCellFull!17511) mapDefault!56902)) b!1334628))

(assert (= start!112514 b!1334622))

(declare-fun m!1222963 () Bool)

(assert (=> b!1334623 m!1222963))

(assert (=> b!1334623 m!1222963))

(declare-fun m!1222965 () Bool)

(assert (=> b!1334623 m!1222965))

(declare-fun m!1222967 () Bool)

(assert (=> mapNonEmpty!56902 m!1222967))

(declare-fun m!1222969 () Bool)

(assert (=> b!1334629 m!1222969))

(declare-fun m!1222971 () Bool)

(assert (=> b!1334625 m!1222971))

(declare-fun m!1222973 () Bool)

(assert (=> start!112514 m!1222973))

(declare-fun m!1222975 () Bool)

(assert (=> start!112514 m!1222975))

(declare-fun m!1222977 () Bool)

(assert (=> start!112514 m!1222977))

(check-sat (not b!1334623) (not mapNonEmpty!56902) (not b_next!30909) (not b!1334625) tp_is_empty!36819 (not start!112514) b_and!49817 (not b!1334629))
(check-sat b_and!49817 (not b_next!30909))
