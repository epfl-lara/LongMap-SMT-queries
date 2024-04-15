; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84298 () Bool)

(assert start!84298)

(declare-fun b!986105 () Bool)

(declare-fun e!555959 () Bool)

(assert (=> b!986105 (= e!555959 false)))

(declare-fun lt!437238 () Bool)

(declare-datatypes ((array!62136 0))(
  ( (array!62137 (arr!29926 (Array (_ BitVec 32) (_ BitVec 64))) (size!30407 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62136)

(declare-datatypes ((List!20772 0))(
  ( (Nil!20769) (Cons!20768 (h!21930 (_ BitVec 64)) (t!29662 List!20772)) )
))
(declare-fun arrayNoDuplicates!0 (array!62136 (_ BitVec 32) List!20772) Bool)

(assert (=> b!986105 (= lt!437238 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20769))))

(declare-fun b!986106 () Bool)

(declare-fun e!555958 () Bool)

(declare-fun tp_is_empty!23119 () Bool)

(assert (=> b!986106 (= e!555958 tp_is_empty!23119)))

(declare-fun b!986107 () Bool)

(declare-fun e!555955 () Bool)

(declare-fun e!555956 () Bool)

(declare-fun mapRes!36707 () Bool)

(assert (=> b!986107 (= e!555955 (and e!555956 mapRes!36707))))

(declare-fun condMapEmpty!36707 () Bool)

(declare-datatypes ((V!35809 0))(
  ( (V!35810 (val!11610 Int)) )
))
(declare-datatypes ((ValueCell!11078 0))(
  ( (ValueCellFull!11078 (v!14171 V!35809)) (EmptyCell!11078) )
))
(declare-datatypes ((array!62138 0))(
  ( (array!62139 (arr!29927 (Array (_ BitVec 32) ValueCell!11078)) (size!30408 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62138)

(declare-fun mapDefault!36707 () ValueCell!11078)

(assert (=> b!986107 (= condMapEmpty!36707 (= (arr!29927 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11078)) mapDefault!36707)))))

(declare-fun b!986108 () Bool)

(declare-fun res!659835 () Bool)

(assert (=> b!986108 (=> (not res!659835) (not e!555959))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986108 (= res!659835 (and (= (size!30408 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30407 _keys!1544) (size!30408 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36707 () Bool)

(declare-fun tp!69563 () Bool)

(assert (=> mapNonEmpty!36707 (= mapRes!36707 (and tp!69563 e!555958))))

(declare-fun mapValue!36707 () ValueCell!11078)

(declare-fun mapKey!36707 () (_ BitVec 32))

(declare-fun mapRest!36707 () (Array (_ BitVec 32) ValueCell!11078))

(assert (=> mapNonEmpty!36707 (= (arr!29927 _values!1278) (store mapRest!36707 mapKey!36707 mapValue!36707))))

(declare-fun b!986109 () Bool)

(declare-fun res!659834 () Bool)

(assert (=> b!986109 (=> (not res!659834) (not e!555959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62136 (_ BitVec 32)) Bool)

(assert (=> b!986109 (= res!659834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986110 () Bool)

(assert (=> b!986110 (= e!555956 tp_is_empty!23119)))

(declare-fun res!659833 () Bool)

(assert (=> start!84298 (=> (not res!659833) (not e!555959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84298 (= res!659833 (validMask!0 mask!1948))))

(assert (=> start!84298 e!555959))

(assert (=> start!84298 true))

(declare-fun array_inv!23139 (array!62138) Bool)

(assert (=> start!84298 (and (array_inv!23139 _values!1278) e!555955)))

(declare-fun array_inv!23140 (array!62136) Bool)

(assert (=> start!84298 (array_inv!23140 _keys!1544)))

(declare-fun mapIsEmpty!36707 () Bool)

(assert (=> mapIsEmpty!36707 mapRes!36707))

(assert (= (and start!84298 res!659833) b!986108))

(assert (= (and b!986108 res!659835) b!986109))

(assert (= (and b!986109 res!659834) b!986105))

(assert (= (and b!986107 condMapEmpty!36707) mapIsEmpty!36707))

(assert (= (and b!986107 (not condMapEmpty!36707)) mapNonEmpty!36707))

(get-info :version)

(assert (= (and mapNonEmpty!36707 ((_ is ValueCellFull!11078) mapValue!36707)) b!986106))

(assert (= (and b!986107 ((_ is ValueCellFull!11078) mapDefault!36707)) b!986110))

(assert (= start!84298 b!986107))

(declare-fun m!912449 () Bool)

(assert (=> b!986105 m!912449))

(declare-fun m!912451 () Bool)

(assert (=> mapNonEmpty!36707 m!912451))

(declare-fun m!912453 () Bool)

(assert (=> b!986109 m!912453))

(declare-fun m!912455 () Bool)

(assert (=> start!84298 m!912455))

(declare-fun m!912457 () Bool)

(assert (=> start!84298 m!912457))

(declare-fun m!912459 () Bool)

(assert (=> start!84298 m!912459))

(check-sat (not b!986105) (not start!84298) (not mapNonEmpty!36707) (not b!986109) tp_is_empty!23119)
(check-sat)
