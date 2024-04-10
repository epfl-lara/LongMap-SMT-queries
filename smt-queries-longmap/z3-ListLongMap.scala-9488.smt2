; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112538 () Bool)

(assert start!112538)

(declare-fun b_free!30933 () Bool)

(declare-fun b_next!30933 () Bool)

(assert (=> start!112538 (= b_free!30933 (not b_next!30933))))

(declare-fun tp!108436 () Bool)

(declare-fun b_and!49841 () Bool)

(assert (=> start!112538 (= tp!108436 b_and!49841)))

(declare-fun res!885957 () Bool)

(declare-fun e!760278 () Bool)

(assert (=> start!112538 (=> (not res!885957) (not e!760278))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112538 (= res!885957 (validMask!0 mask!1998))))

(assert (=> start!112538 e!760278))

(declare-datatypes ((V!54227 0))(
  ( (V!54228 (val!18496 Int)) )
))
(declare-datatypes ((ValueCell!17523 0))(
  ( (ValueCellFull!17523 (v!21133 V!54227)) (EmptyCell!17523) )
))
(declare-datatypes ((array!90548 0))(
  ( (array!90549 (arr!43740 (Array (_ BitVec 32) ValueCell!17523)) (size!44290 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90548)

(declare-fun e!760281 () Bool)

(declare-fun array_inv!32985 (array!90548) Bool)

(assert (=> start!112538 (and (array_inv!32985 _values!1320) e!760281)))

(assert (=> start!112538 true))

(declare-datatypes ((array!90550 0))(
  ( (array!90551 (arr!43741 (Array (_ BitVec 32) (_ BitVec 64))) (size!44291 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90550)

(declare-fun array_inv!32986 (array!90550) Bool)

(assert (=> start!112538 (array_inv!32986 _keys!1590)))

(assert (=> start!112538 tp!108436))

(declare-fun tp_is_empty!36843 () Bool)

(assert (=> start!112538 tp_is_empty!36843))

(declare-fun b!1334910 () Bool)

(declare-fun e!760279 () Bool)

(assert (=> b!1334910 (= e!760279 tp_is_empty!36843)))

(declare-fun b!1334911 () Bool)

(declare-fun e!760280 () Bool)

(assert (=> b!1334911 (= e!760280 tp_is_empty!36843)))

(declare-fun b!1334912 () Bool)

(declare-fun res!885954 () Bool)

(assert (=> b!1334912 (=> (not res!885954) (not e!760278))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334912 (= res!885954 (and (= (size!44290 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44291 _keys!1590) (size!44290 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334913 () Bool)

(assert (=> b!1334913 (= e!760278 false)))

(declare-fun lt!592405 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54227)

(declare-fun zeroValue!1262 () V!54227)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23850 0))(
  ( (tuple2!23851 (_1!11936 (_ BitVec 64)) (_2!11936 V!54227)) )
))
(declare-datatypes ((List!30988 0))(
  ( (Nil!30985) (Cons!30984 (h!32193 tuple2!23850) (t!45252 List!30988)) )
))
(declare-datatypes ((ListLongMap!21507 0))(
  ( (ListLongMap!21508 (toList!10769 List!30988)) )
))
(declare-fun contains!8933 (ListLongMap!21507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5743 (array!90550 array!90548 (_ BitVec 32) (_ BitVec 32) V!54227 V!54227 (_ BitVec 32) Int) ListLongMap!21507)

(assert (=> b!1334913 (= lt!592405 (contains!8933 (getCurrentListMap!5743 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334914 () Bool)

(declare-fun res!885956 () Bool)

(assert (=> b!1334914 (=> (not res!885956) (not e!760278))))

(declare-datatypes ((List!30989 0))(
  ( (Nil!30986) (Cons!30985 (h!32194 (_ BitVec 64)) (t!45253 List!30989)) )
))
(declare-fun arrayNoDuplicates!0 (array!90550 (_ BitVec 32) List!30989) Bool)

(assert (=> b!1334914 (= res!885956 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30986))))

(declare-fun b!1334915 () Bool)

(declare-fun mapRes!56938 () Bool)

(assert (=> b!1334915 (= e!760281 (and e!760279 mapRes!56938))))

(declare-fun condMapEmpty!56938 () Bool)

(declare-fun mapDefault!56938 () ValueCell!17523)

(assert (=> b!1334915 (= condMapEmpty!56938 (= (arr!43740 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17523)) mapDefault!56938)))))

(declare-fun mapIsEmpty!56938 () Bool)

(assert (=> mapIsEmpty!56938 mapRes!56938))

(declare-fun b!1334916 () Bool)

(declare-fun res!885955 () Bool)

(assert (=> b!1334916 (=> (not res!885955) (not e!760278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90550 (_ BitVec 32)) Bool)

(assert (=> b!1334916 (= res!885955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56938 () Bool)

(declare-fun tp!108435 () Bool)

(assert (=> mapNonEmpty!56938 (= mapRes!56938 (and tp!108435 e!760280))))

(declare-fun mapKey!56938 () (_ BitVec 32))

(declare-fun mapRest!56938 () (Array (_ BitVec 32) ValueCell!17523))

(declare-fun mapValue!56938 () ValueCell!17523)

(assert (=> mapNonEmpty!56938 (= (arr!43740 _values!1320) (store mapRest!56938 mapKey!56938 mapValue!56938))))

(declare-fun b!1334917 () Bool)

(declare-fun res!885953 () Bool)

(assert (=> b!1334917 (=> (not res!885953) (not e!760278))))

(assert (=> b!1334917 (= res!885953 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44291 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112538 res!885957) b!1334912))

(assert (= (and b!1334912 res!885954) b!1334916))

(assert (= (and b!1334916 res!885955) b!1334914))

(assert (= (and b!1334914 res!885956) b!1334917))

(assert (= (and b!1334917 res!885953) b!1334913))

(assert (= (and b!1334915 condMapEmpty!56938) mapIsEmpty!56938))

(assert (= (and b!1334915 (not condMapEmpty!56938)) mapNonEmpty!56938))

(get-info :version)

(assert (= (and mapNonEmpty!56938 ((_ is ValueCellFull!17523) mapValue!56938)) b!1334911))

(assert (= (and b!1334915 ((_ is ValueCellFull!17523) mapDefault!56938)) b!1334910))

(assert (= start!112538 b!1334915))

(declare-fun m!1223155 () Bool)

(assert (=> b!1334916 m!1223155))

(declare-fun m!1223157 () Bool)

(assert (=> mapNonEmpty!56938 m!1223157))

(declare-fun m!1223159 () Bool)

(assert (=> b!1334913 m!1223159))

(assert (=> b!1334913 m!1223159))

(declare-fun m!1223161 () Bool)

(assert (=> b!1334913 m!1223161))

(declare-fun m!1223163 () Bool)

(assert (=> b!1334914 m!1223163))

(declare-fun m!1223165 () Bool)

(assert (=> start!112538 m!1223165))

(declare-fun m!1223167 () Bool)

(assert (=> start!112538 m!1223167))

(declare-fun m!1223169 () Bool)

(assert (=> start!112538 m!1223169))

(check-sat (not mapNonEmpty!56938) b_and!49841 (not b!1334916) (not b_next!30933) tp_is_empty!36843 (not start!112538) (not b!1334914) (not b!1334913))
(check-sat b_and!49841 (not b_next!30933))
