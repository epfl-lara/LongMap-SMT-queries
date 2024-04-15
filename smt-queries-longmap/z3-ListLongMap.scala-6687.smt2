; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84076 () Bool)

(assert start!84076)

(declare-fun b!983099 () Bool)

(declare-fun e!554132 () Bool)

(declare-fun tp_is_empty!22897 () Bool)

(assert (=> b!983099 (= e!554132 tp_is_empty!22897)))

(declare-fun b!983100 () Bool)

(declare-fun e!554128 () Bool)

(assert (=> b!983100 (= e!554128 false)))

(declare-fun lt!436266 () Bool)

(declare-datatypes ((array!61716 0))(
  ( (array!61717 (arr!29716 (Array (_ BitVec 32) (_ BitVec 64))) (size!30197 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61716)

(declare-datatypes ((List!20646 0))(
  ( (Nil!20643) (Cons!20642 (h!21804 (_ BitVec 64)) (t!29428 List!20646)) )
))
(declare-fun arrayNoDuplicates!0 (array!61716 (_ BitVec 32) List!20646) Bool)

(assert (=> b!983100 (= lt!436266 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20643))))

(declare-fun b!983101 () Bool)

(declare-fun e!554129 () Bool)

(assert (=> b!983101 (= e!554129 tp_is_empty!22897)))

(declare-fun b!983102 () Bool)

(declare-fun e!554131 () Bool)

(declare-fun mapRes!36374 () Bool)

(assert (=> b!983102 (= e!554131 (and e!554132 mapRes!36374))))

(declare-fun condMapEmpty!36374 () Bool)

(declare-datatypes ((V!35513 0))(
  ( (V!35514 (val!11499 Int)) )
))
(declare-datatypes ((ValueCell!10967 0))(
  ( (ValueCellFull!10967 (v!14060 V!35513)) (EmptyCell!10967) )
))
(declare-datatypes ((array!61718 0))(
  ( (array!61719 (arr!29717 (Array (_ BitVec 32) ValueCell!10967)) (size!30198 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61718)

(declare-fun mapDefault!36374 () ValueCell!10967)

(assert (=> b!983102 (= condMapEmpty!36374 (= (arr!29717 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10967)) mapDefault!36374)))))

(declare-fun mapNonEmpty!36374 () Bool)

(declare-fun tp!69059 () Bool)

(assert (=> mapNonEmpty!36374 (= mapRes!36374 (and tp!69059 e!554129))))

(declare-fun mapValue!36374 () ValueCell!10967)

(declare-fun mapKey!36374 () (_ BitVec 32))

(declare-fun mapRest!36374 () (Array (_ BitVec 32) ValueCell!10967))

(assert (=> mapNonEmpty!36374 (= (arr!29717 _values!1278) (store mapRest!36374 mapKey!36374 mapValue!36374))))

(declare-fun mapIsEmpty!36374 () Bool)

(assert (=> mapIsEmpty!36374 mapRes!36374))

(declare-fun res!657934 () Bool)

(assert (=> start!84076 (=> (not res!657934) (not e!554128))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84076 (= res!657934 (validMask!0 mask!1948))))

(assert (=> start!84076 e!554128))

(assert (=> start!84076 true))

(declare-fun array_inv!22989 (array!61718) Bool)

(assert (=> start!84076 (and (array_inv!22989 _values!1278) e!554131)))

(declare-fun array_inv!22990 (array!61716) Bool)

(assert (=> start!84076 (array_inv!22990 _keys!1544)))

(declare-fun b!983103 () Bool)

(declare-fun res!657936 () Bool)

(assert (=> b!983103 (=> (not res!657936) (not e!554128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61716 (_ BitVec 32)) Bool)

(assert (=> b!983103 (= res!657936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983104 () Bool)

(declare-fun res!657935 () Bool)

(assert (=> b!983104 (=> (not res!657935) (not e!554128))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983104 (= res!657935 (and (= (size!30198 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30197 _keys!1544) (size!30198 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84076 res!657934) b!983104))

(assert (= (and b!983104 res!657935) b!983103))

(assert (= (and b!983103 res!657936) b!983100))

(assert (= (and b!983102 condMapEmpty!36374) mapIsEmpty!36374))

(assert (= (and b!983102 (not condMapEmpty!36374)) mapNonEmpty!36374))

(get-info :version)

(assert (= (and mapNonEmpty!36374 ((_ is ValueCellFull!10967) mapValue!36374)) b!983101))

(assert (= (and b!983102 ((_ is ValueCellFull!10967) mapDefault!36374)) b!983099))

(assert (= start!84076 b!983102))

(declare-fun m!909887 () Bool)

(assert (=> b!983100 m!909887))

(declare-fun m!909889 () Bool)

(assert (=> mapNonEmpty!36374 m!909889))

(declare-fun m!909891 () Bool)

(assert (=> start!84076 m!909891))

(declare-fun m!909893 () Bool)

(assert (=> start!84076 m!909893))

(declare-fun m!909895 () Bool)

(assert (=> start!84076 m!909895))

(declare-fun m!909897 () Bool)

(assert (=> b!983103 m!909897))

(check-sat tp_is_empty!22897 (not b!983100) (not start!84076) (not mapNonEmpty!36374) (not b!983103))
(check-sat)
