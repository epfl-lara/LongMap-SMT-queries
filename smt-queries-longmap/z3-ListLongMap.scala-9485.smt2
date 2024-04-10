; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112520 () Bool)

(assert start!112520)

(declare-fun b_free!30915 () Bool)

(declare-fun b_next!30915 () Bool)

(assert (=> start!112520 (= b_free!30915 (not b_next!30915))))

(declare-fun tp!108381 () Bool)

(declare-fun b_and!49823 () Bool)

(assert (=> start!112520 (= tp!108381 b_and!49823)))

(declare-fun mapIsEmpty!56911 () Bool)

(declare-fun mapRes!56911 () Bool)

(assert (=> mapIsEmpty!56911 mapRes!56911))

(declare-fun b!1334694 () Bool)

(declare-fun res!885820 () Bool)

(declare-fun e!760147 () Bool)

(assert (=> b!1334694 (=> (not res!885820) (not e!760147))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((array!90514 0))(
  ( (array!90515 (arr!43723 (Array (_ BitVec 32) (_ BitVec 64))) (size!44273 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90514)

(assert (=> b!1334694 (= res!885820 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44273 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334695 () Bool)

(declare-fun res!885819 () Bool)

(assert (=> b!1334695 (=> (not res!885819) (not e!760147))))

(declare-datatypes ((List!30977 0))(
  ( (Nil!30974) (Cons!30973 (h!32182 (_ BitVec 64)) (t!45241 List!30977)) )
))
(declare-fun arrayNoDuplicates!0 (array!90514 (_ BitVec 32) List!30977) Bool)

(assert (=> b!1334695 (= res!885819 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30974))))

(declare-fun b!1334696 () Bool)

(declare-fun e!760144 () Bool)

(declare-fun e!760145 () Bool)

(assert (=> b!1334696 (= e!760144 (and e!760145 mapRes!56911))))

(declare-fun condMapEmpty!56911 () Bool)

(declare-datatypes ((V!54203 0))(
  ( (V!54204 (val!18487 Int)) )
))
(declare-datatypes ((ValueCell!17514 0))(
  ( (ValueCellFull!17514 (v!21124 V!54203)) (EmptyCell!17514) )
))
(declare-datatypes ((array!90516 0))(
  ( (array!90517 (arr!43724 (Array (_ BitVec 32) ValueCell!17514)) (size!44274 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90516)

(declare-fun mapDefault!56911 () ValueCell!17514)

(assert (=> b!1334696 (= condMapEmpty!56911 (= (arr!43724 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17514)) mapDefault!56911)))))

(declare-fun b!1334697 () Bool)

(declare-fun res!885821 () Bool)

(assert (=> b!1334697 (=> (not res!885821) (not e!760147))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90514 (_ BitVec 32)) Bool)

(assert (=> b!1334697 (= res!885821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334698 () Bool)

(assert (=> b!1334698 (= e!760147 false)))

(declare-fun lt!592378 () Bool)

(declare-fun minValue!1262 () V!54203)

(declare-fun zeroValue!1262 () V!54203)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23838 0))(
  ( (tuple2!23839 (_1!11930 (_ BitVec 64)) (_2!11930 V!54203)) )
))
(declare-datatypes ((List!30978 0))(
  ( (Nil!30975) (Cons!30974 (h!32183 tuple2!23838) (t!45242 List!30978)) )
))
(declare-datatypes ((ListLongMap!21495 0))(
  ( (ListLongMap!21496 (toList!10763 List!30978)) )
))
(declare-fun contains!8927 (ListLongMap!21495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5737 (array!90514 array!90516 (_ BitVec 32) (_ BitVec 32) V!54203 V!54203 (_ BitVec 32) Int) ListLongMap!21495)

(assert (=> b!1334698 (= lt!592378 (contains!8927 (getCurrentListMap!5737 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334699 () Bool)

(declare-fun e!760143 () Bool)

(declare-fun tp_is_empty!36825 () Bool)

(assert (=> b!1334699 (= e!760143 tp_is_empty!36825)))

(declare-fun b!1334700 () Bool)

(declare-fun res!885818 () Bool)

(assert (=> b!1334700 (=> (not res!885818) (not e!760147))))

(assert (=> b!1334700 (= res!885818 (and (= (size!44274 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44273 _keys!1590) (size!44274 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56911 () Bool)

(declare-fun tp!108382 () Bool)

(assert (=> mapNonEmpty!56911 (= mapRes!56911 (and tp!108382 e!760143))))

(declare-fun mapKey!56911 () (_ BitVec 32))

(declare-fun mapValue!56911 () ValueCell!17514)

(declare-fun mapRest!56911 () (Array (_ BitVec 32) ValueCell!17514))

(assert (=> mapNonEmpty!56911 (= (arr!43724 _values!1320) (store mapRest!56911 mapKey!56911 mapValue!56911))))

(declare-fun res!885822 () Bool)

(assert (=> start!112520 (=> (not res!885822) (not e!760147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112520 (= res!885822 (validMask!0 mask!1998))))

(assert (=> start!112520 e!760147))

(declare-fun array_inv!32975 (array!90516) Bool)

(assert (=> start!112520 (and (array_inv!32975 _values!1320) e!760144)))

(assert (=> start!112520 true))

(declare-fun array_inv!32976 (array!90514) Bool)

(assert (=> start!112520 (array_inv!32976 _keys!1590)))

(assert (=> start!112520 tp!108381))

(assert (=> start!112520 tp_is_empty!36825))

(declare-fun b!1334701 () Bool)

(assert (=> b!1334701 (= e!760145 tp_is_empty!36825)))

(assert (= (and start!112520 res!885822) b!1334700))

(assert (= (and b!1334700 res!885818) b!1334697))

(assert (= (and b!1334697 res!885821) b!1334695))

(assert (= (and b!1334695 res!885819) b!1334694))

(assert (= (and b!1334694 res!885820) b!1334698))

(assert (= (and b!1334696 condMapEmpty!56911) mapIsEmpty!56911))

(assert (= (and b!1334696 (not condMapEmpty!56911)) mapNonEmpty!56911))

(get-info :version)

(assert (= (and mapNonEmpty!56911 ((_ is ValueCellFull!17514) mapValue!56911)) b!1334699))

(assert (= (and b!1334696 ((_ is ValueCellFull!17514) mapDefault!56911)) b!1334701))

(assert (= start!112520 b!1334696))

(declare-fun m!1223011 () Bool)

(assert (=> start!112520 m!1223011))

(declare-fun m!1223013 () Bool)

(assert (=> start!112520 m!1223013))

(declare-fun m!1223015 () Bool)

(assert (=> start!112520 m!1223015))

(declare-fun m!1223017 () Bool)

(assert (=> b!1334695 m!1223017))

(declare-fun m!1223019 () Bool)

(assert (=> b!1334698 m!1223019))

(assert (=> b!1334698 m!1223019))

(declare-fun m!1223021 () Bool)

(assert (=> b!1334698 m!1223021))

(declare-fun m!1223023 () Bool)

(assert (=> b!1334697 m!1223023))

(declare-fun m!1223025 () Bool)

(assert (=> mapNonEmpty!56911 m!1223025))

(check-sat b_and!49823 (not start!112520) (not mapNonEmpty!56911) (not b!1334698) (not b!1334697) (not b!1334695) tp_is_empty!36825 (not b_next!30915))
(check-sat b_and!49823 (not b_next!30915))
