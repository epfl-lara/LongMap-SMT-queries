; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112634 () Bool)

(assert start!112634)

(declare-fun b_free!30805 () Bool)

(declare-fun b_next!30805 () Bool)

(assert (=> start!112634 (= b_free!30805 (not b_next!30805))))

(declare-fun tp!108051 () Bool)

(declare-fun b_and!49649 () Bool)

(assert (=> start!112634 (= tp!108051 b_and!49649)))

(declare-fun b!1334022 () Bool)

(declare-fun res!884929 () Bool)

(declare-fun e!760083 () Bool)

(assert (=> b!1334022 (=> (not res!884929) (not e!760083))))

(declare-datatypes ((V!54057 0))(
  ( (V!54058 (val!18432 Int)) )
))
(declare-datatypes ((ValueCell!17459 0))(
  ( (ValueCellFull!17459 (v!21064 V!54057)) (EmptyCell!17459) )
))
(declare-datatypes ((array!90409 0))(
  ( (array!90410 (arr!43666 (Array (_ BitVec 32) ValueCell!17459)) (size!44217 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90409)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90411 0))(
  ( (array!90412 (arr!43667 (Array (_ BitVec 32) (_ BitVec 64))) (size!44218 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90411)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334022 (= res!884929 (and (= (size!44217 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44218 _keys!1590) (size!44217 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334023 () Bool)

(declare-fun e!760081 () Bool)

(declare-fun tp_is_empty!36715 () Bool)

(assert (=> b!1334023 (= e!760081 tp_is_empty!36715)))

(declare-fun b!1334024 () Bool)

(declare-fun res!884930 () Bool)

(assert (=> b!1334024 (=> (not res!884930) (not e!760083))))

(declare-datatypes ((List!30944 0))(
  ( (Nil!30941) (Cons!30940 (h!32158 (_ BitVec 64)) (t!45134 List!30944)) )
))
(declare-fun arrayNoDuplicates!0 (array!90411 (_ BitVec 32) List!30944) Bool)

(assert (=> b!1334024 (= res!884930 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30941))))

(declare-fun b!1334025 () Bool)

(declare-fun res!884926 () Bool)

(assert (=> b!1334025 (=> (not res!884926) (not e!760083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90411 (_ BitVec 32)) Bool)

(assert (=> b!1334025 (= res!884926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334026 () Bool)

(declare-fun res!884928 () Bool)

(assert (=> b!1334026 (=> (not res!884928) (not e!760083))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334026 (= res!884928 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44218 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334027 () Bool)

(assert (=> b!1334027 (= e!760083 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54057)

(declare-fun minValue!1262 () V!54057)

(declare-fun lt!592536 () Bool)

(declare-datatypes ((tuple2!23788 0))(
  ( (tuple2!23789 (_1!11905 (_ BitVec 64)) (_2!11905 V!54057)) )
))
(declare-datatypes ((List!30945 0))(
  ( (Nil!30942) (Cons!30941 (h!32159 tuple2!23788) (t!45135 List!30945)) )
))
(declare-datatypes ((ListLongMap!21453 0))(
  ( (ListLongMap!21454 (toList!10742 List!30945)) )
))
(declare-fun contains!8918 (ListLongMap!21453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5706 (array!90411 array!90409 (_ BitVec 32) (_ BitVec 32) V!54057 V!54057 (_ BitVec 32) Int) ListLongMap!21453)

(assert (=> b!1334027 (= lt!592536 (contains!8918 (getCurrentListMap!5706 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!884927 () Bool)

(assert (=> start!112634 (=> (not res!884927) (not e!760083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112634 (= res!884927 (validMask!0 mask!1998))))

(assert (=> start!112634 e!760083))

(declare-fun e!760084 () Bool)

(declare-fun array_inv!33209 (array!90409) Bool)

(assert (=> start!112634 (and (array_inv!33209 _values!1320) e!760084)))

(assert (=> start!112634 true))

(declare-fun array_inv!33210 (array!90411) Bool)

(assert (=> start!112634 (array_inv!33210 _keys!1590)))

(assert (=> start!112634 tp!108051))

(assert (=> start!112634 tp_is_empty!36715))

(declare-fun b!1334028 () Bool)

(declare-fun e!760082 () Bool)

(assert (=> b!1334028 (= e!760082 tp_is_empty!36715)))

(declare-fun mapIsEmpty!56746 () Bool)

(declare-fun mapRes!56746 () Bool)

(assert (=> mapIsEmpty!56746 mapRes!56746))

(declare-fun b!1334029 () Bool)

(assert (=> b!1334029 (= e!760084 (and e!760081 mapRes!56746))))

(declare-fun condMapEmpty!56746 () Bool)

(declare-fun mapDefault!56746 () ValueCell!17459)

(assert (=> b!1334029 (= condMapEmpty!56746 (= (arr!43666 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17459)) mapDefault!56746)))))

(declare-fun mapNonEmpty!56746 () Bool)

(declare-fun tp!108052 () Bool)

(assert (=> mapNonEmpty!56746 (= mapRes!56746 (and tp!108052 e!760082))))

(declare-fun mapValue!56746 () ValueCell!17459)

(declare-fun mapKey!56746 () (_ BitVec 32))

(declare-fun mapRest!56746 () (Array (_ BitVec 32) ValueCell!17459))

(assert (=> mapNonEmpty!56746 (= (arr!43666 _values!1320) (store mapRest!56746 mapKey!56746 mapValue!56746))))

(assert (= (and start!112634 res!884927) b!1334022))

(assert (= (and b!1334022 res!884929) b!1334025))

(assert (= (and b!1334025 res!884926) b!1334024))

(assert (= (and b!1334024 res!884930) b!1334026))

(assert (= (and b!1334026 res!884928) b!1334027))

(assert (= (and b!1334029 condMapEmpty!56746) mapIsEmpty!56746))

(assert (= (and b!1334029 (not condMapEmpty!56746)) mapNonEmpty!56746))

(get-info :version)

(assert (= (and mapNonEmpty!56746 ((_ is ValueCellFull!17459) mapValue!56746)) b!1334028))

(assert (= (and b!1334029 ((_ is ValueCellFull!17459) mapDefault!56746)) b!1334023))

(assert (= start!112634 b!1334029))

(declare-fun m!1223081 () Bool)

(assert (=> b!1334025 m!1223081))

(declare-fun m!1223083 () Bool)

(assert (=> mapNonEmpty!56746 m!1223083))

(declare-fun m!1223085 () Bool)

(assert (=> b!1334024 m!1223085))

(declare-fun m!1223087 () Bool)

(assert (=> start!112634 m!1223087))

(declare-fun m!1223089 () Bool)

(assert (=> start!112634 m!1223089))

(declare-fun m!1223091 () Bool)

(assert (=> start!112634 m!1223091))

(declare-fun m!1223093 () Bool)

(assert (=> b!1334027 m!1223093))

(assert (=> b!1334027 m!1223093))

(declare-fun m!1223095 () Bool)

(assert (=> b!1334027 m!1223095))

(check-sat (not b!1334027) b_and!49649 (not mapNonEmpty!56746) (not b!1334024) (not b!1334025) (not b_next!30805) tp_is_empty!36715 (not start!112634))
(check-sat b_and!49649 (not b_next!30805))
