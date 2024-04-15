; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84094 () Bool)

(assert start!84094)

(declare-fun b!983261 () Bool)

(declare-fun e!554265 () Bool)

(declare-fun tp_is_empty!22915 () Bool)

(assert (=> b!983261 (= e!554265 tp_is_empty!22915)))

(declare-fun mapNonEmpty!36401 () Bool)

(declare-fun mapRes!36401 () Bool)

(declare-fun tp!69086 () Bool)

(assert (=> mapNonEmpty!36401 (= mapRes!36401 (and tp!69086 e!554265))))

(declare-datatypes ((V!35537 0))(
  ( (V!35538 (val!11508 Int)) )
))
(declare-datatypes ((ValueCell!10976 0))(
  ( (ValueCellFull!10976 (v!14069 V!35537)) (EmptyCell!10976) )
))
(declare-datatypes ((array!61750 0))(
  ( (array!61751 (arr!29733 (Array (_ BitVec 32) ValueCell!10976)) (size!30214 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61750)

(declare-fun mapRest!36401 () (Array (_ BitVec 32) ValueCell!10976))

(declare-fun mapValue!36401 () ValueCell!10976)

(declare-fun mapKey!36401 () (_ BitVec 32))

(assert (=> mapNonEmpty!36401 (= (arr!29733 _values!1278) (store mapRest!36401 mapKey!36401 mapValue!36401))))

(declare-fun b!983263 () Bool)

(declare-fun e!554263 () Bool)

(assert (=> b!983263 (= e!554263 tp_is_empty!22915)))

(declare-fun b!983264 () Bool)

(declare-fun e!554264 () Bool)

(assert (=> b!983264 (= e!554264 (and e!554263 mapRes!36401))))

(declare-fun condMapEmpty!36401 () Bool)

(declare-fun mapDefault!36401 () ValueCell!10976)

(assert (=> b!983264 (= condMapEmpty!36401 (= (arr!29733 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10976)) mapDefault!36401)))))

(declare-fun b!983265 () Bool)

(declare-fun res!658016 () Bool)

(declare-fun e!554266 () Bool)

(assert (=> b!983265 (=> (not res!658016) (not e!554266))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61752 0))(
  ( (array!61753 (arr!29734 (Array (_ BitVec 32) (_ BitVec 64))) (size!30215 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61752)

(assert (=> b!983265 (= res!658016 (and (= (size!30214 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30215 _keys!1544) (size!30214 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!658017 () Bool)

(assert (=> start!84094 (=> (not res!658017) (not e!554266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84094 (= res!658017 (validMask!0 mask!1948))))

(assert (=> start!84094 e!554266))

(assert (=> start!84094 true))

(declare-fun array_inv!22999 (array!61750) Bool)

(assert (=> start!84094 (and (array_inv!22999 _values!1278) e!554264)))

(declare-fun array_inv!23000 (array!61752) Bool)

(assert (=> start!84094 (array_inv!23000 _keys!1544)))

(declare-fun b!983262 () Bool)

(declare-fun res!658015 () Bool)

(assert (=> b!983262 (=> (not res!658015) (not e!554266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61752 (_ BitVec 32)) Bool)

(assert (=> b!983262 (= res!658015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983266 () Bool)

(assert (=> b!983266 (= e!554266 false)))

(declare-fun lt!436293 () Bool)

(declare-datatypes ((List!20653 0))(
  ( (Nil!20650) (Cons!20649 (h!21811 (_ BitVec 64)) (t!29435 List!20653)) )
))
(declare-fun arrayNoDuplicates!0 (array!61752 (_ BitVec 32) List!20653) Bool)

(assert (=> b!983266 (= lt!436293 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20650))))

(declare-fun mapIsEmpty!36401 () Bool)

(assert (=> mapIsEmpty!36401 mapRes!36401))

(assert (= (and start!84094 res!658017) b!983265))

(assert (= (and b!983265 res!658016) b!983262))

(assert (= (and b!983262 res!658015) b!983266))

(assert (= (and b!983264 condMapEmpty!36401) mapIsEmpty!36401))

(assert (= (and b!983264 (not condMapEmpty!36401)) mapNonEmpty!36401))

(get-info :version)

(assert (= (and mapNonEmpty!36401 ((_ is ValueCellFull!10976) mapValue!36401)) b!983261))

(assert (= (and b!983264 ((_ is ValueCellFull!10976) mapDefault!36401)) b!983263))

(assert (= start!84094 b!983264))

(declare-fun m!909995 () Bool)

(assert (=> mapNonEmpty!36401 m!909995))

(declare-fun m!909997 () Bool)

(assert (=> start!84094 m!909997))

(declare-fun m!909999 () Bool)

(assert (=> start!84094 m!909999))

(declare-fun m!910001 () Bool)

(assert (=> start!84094 m!910001))

(declare-fun m!910003 () Bool)

(assert (=> b!983262 m!910003))

(declare-fun m!910005 () Bool)

(assert (=> b!983266 m!910005))

(check-sat tp_is_empty!22915 (not b!983266) (not mapNonEmpty!36401) (not start!84094) (not b!983262))
(check-sat)
