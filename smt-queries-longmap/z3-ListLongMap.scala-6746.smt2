; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84556 () Bool)

(assert start!84556)

(declare-fun b_free!20037 () Bool)

(declare-fun b_next!20037 () Bool)

(assert (=> start!84556 (= b_free!20037 (not b_next!20037))))

(declare-fun tp!69898 () Bool)

(declare-fun b_and!32143 () Bool)

(assert (=> start!84556 (= tp!69898 b_and!32143)))

(declare-fun b!988977 () Bool)

(declare-fun res!661454 () Bool)

(declare-fun e!557657 () Bool)

(assert (=> b!988977 (=> (not res!661454) (not e!557657))))

(declare-datatypes ((array!62465 0))(
  ( (array!62466 (arr!30086 (Array (_ BitVec 32) (_ BitVec 64))) (size!30565 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62465)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62465 (_ BitVec 32)) Bool)

(assert (=> b!988977 (= res!661454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36921 () Bool)

(declare-fun mapRes!36921 () Bool)

(assert (=> mapIsEmpty!36921 mapRes!36921))

(declare-fun b!988978 () Bool)

(declare-fun res!661453 () Bool)

(assert (=> b!988978 (=> (not res!661453) (not e!557657))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988978 (= res!661453 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988979 () Bool)

(declare-fun e!557659 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!35987 0))(
  ( (V!35988 (val!11677 Int)) )
))
(declare-datatypes ((ValueCell!11145 0))(
  ( (ValueCellFull!11145 (v!14244 V!35987)) (EmptyCell!11145) )
))
(declare-datatypes ((array!62467 0))(
  ( (array!62468 (arr!30087 (Array (_ BitVec 32) ValueCell!11145)) (size!30566 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62467)

(assert (=> b!988979 (= e!557659 (not (bvslt from!1932 (size!30566 _values!1278))))))

(declare-fun minValue!1220 () V!35987)

(declare-fun zeroValue!1220 () V!35987)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14880 0))(
  ( (tuple2!14881 (_1!7451 (_ BitVec 64)) (_2!7451 V!35987)) )
))
(declare-datatypes ((List!20810 0))(
  ( (Nil!20807) (Cons!20806 (h!21968 tuple2!14880) (t!29759 List!20810)) )
))
(declare-datatypes ((ListLongMap!13577 0))(
  ( (ListLongMap!13578 (toList!6804 List!20810)) )
))
(declare-fun lt!438662 () ListLongMap!13577)

(declare-fun getCurrentListMap!3863 (array!62465 array!62467 (_ BitVec 32) (_ BitVec 32) V!35987 V!35987 (_ BitVec 32) Int) ListLongMap!13577)

(assert (=> b!988979 (= lt!438662 (getCurrentListMap!3863 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438667 () ListLongMap!13577)

(declare-fun lt!438664 () tuple2!14880)

(declare-fun lt!438665 () tuple2!14880)

(declare-fun +!3082 (ListLongMap!13577 tuple2!14880) ListLongMap!13577)

(assert (=> b!988979 (= (+!3082 (+!3082 lt!438667 lt!438664) lt!438665) (+!3082 (+!3082 lt!438667 lt!438665) lt!438664))))

(declare-fun lt!438666 () V!35987)

(assert (=> b!988979 (= lt!438665 (tuple2!14881 (select (arr!30086 _keys!1544) from!1932) lt!438666))))

(assert (=> b!988979 (= lt!438664 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32819 0))(
  ( (Unit!32820) )
))
(declare-fun lt!438663 () Unit!32819)

(declare-fun addCommutativeForDiffKeys!705 (ListLongMap!13577 (_ BitVec 64) V!35987 (_ BitVec 64) V!35987) Unit!32819)

(assert (=> b!988979 (= lt!438663 (addCommutativeForDiffKeys!705 lt!438667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30086 _keys!1544) from!1932) lt!438666))))

(declare-fun b!988980 () Bool)

(declare-fun e!557662 () Bool)

(declare-fun tp_is_empty!23253 () Bool)

(assert (=> b!988980 (= e!557662 tp_is_empty!23253)))

(declare-fun b!988981 () Bool)

(declare-fun res!661450 () Bool)

(assert (=> b!988981 (=> (not res!661450) (not e!557657))))

(assert (=> b!988981 (= res!661450 (and (= (size!30566 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30565 _keys!1544) (size!30566 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988982 () Bool)

(declare-fun res!661451 () Bool)

(assert (=> b!988982 (=> (not res!661451) (not e!557657))))

(declare-datatypes ((List!20811 0))(
  ( (Nil!20808) (Cons!20807 (h!21969 (_ BitVec 64)) (t!29760 List!20811)) )
))
(declare-fun arrayNoDuplicates!0 (array!62465 (_ BitVec 32) List!20811) Bool)

(assert (=> b!988982 (= res!661451 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20808))))

(declare-fun b!988983 () Bool)

(assert (=> b!988983 (= e!557657 e!557659)))

(declare-fun res!661448 () Bool)

(assert (=> b!988983 (=> (not res!661448) (not e!557659))))

(assert (=> b!988983 (= res!661448 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30086 _keys!1544) from!1932))))))

(declare-fun get!15615 (ValueCell!11145 V!35987) V!35987)

(declare-fun dynLambda!1865 (Int (_ BitVec 64)) V!35987)

(assert (=> b!988983 (= lt!438666 (get!15615 (select (arr!30087 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3495 (array!62465 array!62467 (_ BitVec 32) (_ BitVec 32) V!35987 V!35987 (_ BitVec 32) Int) ListLongMap!13577)

(assert (=> b!988983 (= lt!438667 (getCurrentListMapNoExtraKeys!3495 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988984 () Bool)

(declare-fun res!661455 () Bool)

(assert (=> b!988984 (=> (not res!661455) (not e!557657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988984 (= res!661455 (validKeyInArray!0 (select (arr!30086 _keys!1544) from!1932)))))

(declare-fun b!988985 () Bool)

(declare-fun res!661449 () Bool)

(assert (=> b!988985 (=> (not res!661449) (not e!557657))))

(assert (=> b!988985 (= res!661449 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30565 _keys!1544))))))

(declare-fun b!988986 () Bool)

(declare-fun e!557658 () Bool)

(assert (=> b!988986 (= e!557658 (and e!557662 mapRes!36921))))

(declare-fun condMapEmpty!36921 () Bool)

(declare-fun mapDefault!36921 () ValueCell!11145)

(assert (=> b!988986 (= condMapEmpty!36921 (= (arr!30087 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11145)) mapDefault!36921)))))

(declare-fun b!988987 () Bool)

(declare-fun e!557661 () Bool)

(assert (=> b!988987 (= e!557661 tp_is_empty!23253)))

(declare-fun res!661452 () Bool)

(assert (=> start!84556 (=> (not res!661452) (not e!557657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84556 (= res!661452 (validMask!0 mask!1948))))

(assert (=> start!84556 e!557657))

(assert (=> start!84556 true))

(assert (=> start!84556 tp_is_empty!23253))

(declare-fun array_inv!23245 (array!62467) Bool)

(assert (=> start!84556 (and (array_inv!23245 _values!1278) e!557658)))

(assert (=> start!84556 tp!69898))

(declare-fun array_inv!23246 (array!62465) Bool)

(assert (=> start!84556 (array_inv!23246 _keys!1544)))

(declare-fun mapNonEmpty!36921 () Bool)

(declare-fun tp!69899 () Bool)

(assert (=> mapNonEmpty!36921 (= mapRes!36921 (and tp!69899 e!557661))))

(declare-fun mapRest!36921 () (Array (_ BitVec 32) ValueCell!11145))

(declare-fun mapKey!36921 () (_ BitVec 32))

(declare-fun mapValue!36921 () ValueCell!11145)

(assert (=> mapNonEmpty!36921 (= (arr!30087 _values!1278) (store mapRest!36921 mapKey!36921 mapValue!36921))))

(assert (= (and start!84556 res!661452) b!988981))

(assert (= (and b!988981 res!661450) b!988977))

(assert (= (and b!988977 res!661454) b!988982))

(assert (= (and b!988982 res!661451) b!988985))

(assert (= (and b!988985 res!661449) b!988984))

(assert (= (and b!988984 res!661455) b!988978))

(assert (= (and b!988978 res!661453) b!988983))

(assert (= (and b!988983 res!661448) b!988979))

(assert (= (and b!988986 condMapEmpty!36921) mapIsEmpty!36921))

(assert (= (and b!988986 (not condMapEmpty!36921)) mapNonEmpty!36921))

(get-info :version)

(assert (= (and mapNonEmpty!36921 ((_ is ValueCellFull!11145) mapValue!36921)) b!988987))

(assert (= (and b!988986 ((_ is ValueCellFull!11145) mapDefault!36921)) b!988980))

(assert (= start!84556 b!988986))

(declare-fun b_lambda!15093 () Bool)

(assert (=> (not b_lambda!15093) (not b!988983)))

(declare-fun t!29758 () Bool)

(declare-fun tb!6799 () Bool)

(assert (=> (and start!84556 (= defaultEntry!1281 defaultEntry!1281) t!29758) tb!6799))

(declare-fun result!13595 () Bool)

(assert (=> tb!6799 (= result!13595 tp_is_empty!23253)))

(assert (=> b!988983 t!29758))

(declare-fun b_and!32145 () Bool)

(assert (= b_and!32143 (and (=> t!29758 result!13595) b_and!32145)))

(declare-fun m!916087 () Bool)

(assert (=> start!84556 m!916087))

(declare-fun m!916089 () Bool)

(assert (=> start!84556 m!916089))

(declare-fun m!916091 () Bool)

(assert (=> start!84556 m!916091))

(declare-fun m!916093 () Bool)

(assert (=> b!988984 m!916093))

(assert (=> b!988984 m!916093))

(declare-fun m!916095 () Bool)

(assert (=> b!988984 m!916095))

(declare-fun m!916097 () Bool)

(assert (=> mapNonEmpty!36921 m!916097))

(assert (=> b!988979 m!916093))

(declare-fun m!916099 () Bool)

(assert (=> b!988979 m!916099))

(declare-fun m!916101 () Bool)

(assert (=> b!988979 m!916101))

(declare-fun m!916103 () Bool)

(assert (=> b!988979 m!916103))

(assert (=> b!988979 m!916093))

(declare-fun m!916105 () Bool)

(assert (=> b!988979 m!916105))

(assert (=> b!988979 m!916101))

(declare-fun m!916107 () Bool)

(assert (=> b!988979 m!916107))

(assert (=> b!988979 m!916099))

(declare-fun m!916109 () Bool)

(assert (=> b!988979 m!916109))

(declare-fun m!916111 () Bool)

(assert (=> b!988977 m!916111))

(declare-fun m!916113 () Bool)

(assert (=> b!988982 m!916113))

(assert (=> b!988983 m!916093))

(declare-fun m!916115 () Bool)

(assert (=> b!988983 m!916115))

(declare-fun m!916117 () Bool)

(assert (=> b!988983 m!916117))

(declare-fun m!916119 () Bool)

(assert (=> b!988983 m!916119))

(assert (=> b!988983 m!916115))

(assert (=> b!988983 m!916119))

(declare-fun m!916121 () Bool)

(assert (=> b!988983 m!916121))

(check-sat (not start!84556) (not mapNonEmpty!36921) (not b_lambda!15093) (not b!988984) (not b_next!20037) (not b!988977) (not b!988979) b_and!32145 tp_is_empty!23253 (not b!988983) (not b!988982))
(check-sat b_and!32145 (not b_next!20037))
