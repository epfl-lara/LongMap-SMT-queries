; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84318 () Bool)

(assert start!84318)

(declare-fun b!986362 () Bool)

(declare-fun res!659954 () Bool)

(declare-fun e!556122 () Bool)

(assert (=> b!986362 (=> (not res!659954) (not e!556122))))

(declare-datatypes ((array!62209 0))(
  ( (array!62210 (arr!29962 (Array (_ BitVec 32) (_ BitVec 64))) (size!30441 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62209)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62209 (_ BitVec 32)) Bool)

(assert (=> b!986362 (= res!659954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36710 () Bool)

(declare-fun mapRes!36710 () Bool)

(assert (=> mapIsEmpty!36710 mapRes!36710))

(declare-fun res!659953 () Bool)

(assert (=> start!84318 (=> (not res!659953) (not e!556122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84318 (= res!659953 (validMask!0 mask!1948))))

(assert (=> start!84318 e!556122))

(assert (=> start!84318 true))

(declare-datatypes ((V!35811 0))(
  ( (V!35812 (val!11611 Int)) )
))
(declare-datatypes ((ValueCell!11079 0))(
  ( (ValueCellFull!11079 (v!14173 V!35811)) (EmptyCell!11079) )
))
(declare-datatypes ((array!62211 0))(
  ( (array!62212 (arr!29963 (Array (_ BitVec 32) ValueCell!11079)) (size!30442 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62211)

(declare-fun e!556121 () Bool)

(declare-fun array_inv!23157 (array!62211) Bool)

(assert (=> start!84318 (and (array_inv!23157 _values!1278) e!556121)))

(declare-fun array_inv!23158 (array!62209) Bool)

(assert (=> start!84318 (array_inv!23158 _keys!1544)))

(declare-fun b!986363 () Bool)

(declare-fun e!556119 () Bool)

(declare-fun tp_is_empty!23121 () Bool)

(assert (=> b!986363 (= e!556119 tp_is_empty!23121)))

(declare-fun b!986364 () Bool)

(declare-fun e!556120 () Bool)

(assert (=> b!986364 (= e!556120 tp_is_empty!23121)))

(declare-fun mapNonEmpty!36710 () Bool)

(declare-fun tp!69565 () Bool)

(assert (=> mapNonEmpty!36710 (= mapRes!36710 (and tp!69565 e!556120))))

(declare-fun mapValue!36710 () ValueCell!11079)

(declare-fun mapRest!36710 () (Array (_ BitVec 32) ValueCell!11079))

(declare-fun mapKey!36710 () (_ BitVec 32))

(assert (=> mapNonEmpty!36710 (= (arr!29963 _values!1278) (store mapRest!36710 mapKey!36710 mapValue!36710))))

(declare-fun b!986365 () Bool)

(declare-fun res!659952 () Bool)

(assert (=> b!986365 (=> (not res!659952) (not e!556122))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986365 (= res!659952 (and (= (size!30442 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30441 _keys!1544) (size!30442 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986366 () Bool)

(assert (=> b!986366 (= e!556122 false)))

(declare-fun lt!437477 () Bool)

(declare-datatypes ((List!20739 0))(
  ( (Nil!20736) (Cons!20735 (h!21897 (_ BitVec 64)) (t!29638 List!20739)) )
))
(declare-fun arrayNoDuplicates!0 (array!62209 (_ BitVec 32) List!20739) Bool)

(assert (=> b!986366 (= lt!437477 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20736))))

(declare-fun b!986367 () Bool)

(assert (=> b!986367 (= e!556121 (and e!556119 mapRes!36710))))

(declare-fun condMapEmpty!36710 () Bool)

(declare-fun mapDefault!36710 () ValueCell!11079)

(assert (=> b!986367 (= condMapEmpty!36710 (= (arr!29963 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11079)) mapDefault!36710)))))

(assert (= (and start!84318 res!659953) b!986365))

(assert (= (and b!986365 res!659952) b!986362))

(assert (= (and b!986362 res!659954) b!986366))

(assert (= (and b!986367 condMapEmpty!36710) mapIsEmpty!36710))

(assert (= (and b!986367 (not condMapEmpty!36710)) mapNonEmpty!36710))

(get-info :version)

(assert (= (and mapNonEmpty!36710 ((_ is ValueCellFull!11079) mapValue!36710)) b!986364))

(assert (= (and b!986367 ((_ is ValueCellFull!11079) mapDefault!36710)) b!986363))

(assert (= start!84318 b!986367))

(declare-fun m!913219 () Bool)

(assert (=> b!986362 m!913219))

(declare-fun m!913221 () Bool)

(assert (=> start!84318 m!913221))

(declare-fun m!913223 () Bool)

(assert (=> start!84318 m!913223))

(declare-fun m!913225 () Bool)

(assert (=> start!84318 m!913225))

(declare-fun m!913227 () Bool)

(assert (=> mapNonEmpty!36710 m!913227))

(declare-fun m!913229 () Bool)

(assert (=> b!986366 m!913229))

(check-sat (not b!986366) tp_is_empty!23121 (not b!986362) (not mapNonEmpty!36710) (not start!84318))
(check-sat)
