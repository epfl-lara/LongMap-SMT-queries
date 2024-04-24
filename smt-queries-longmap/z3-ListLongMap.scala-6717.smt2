; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84442 () Bool)

(assert start!84442)

(declare-fun b!986842 () Bool)

(declare-fun e!556373 () Bool)

(declare-fun tp_is_empty!23077 () Bool)

(assert (=> b!986842 (= e!556373 tp_is_empty!23077)))

(declare-fun mapNonEmpty!36644 () Bool)

(declare-fun mapRes!36644 () Bool)

(declare-fun tp!69500 () Bool)

(declare-fun e!556374 () Bool)

(assert (=> mapNonEmpty!36644 (= mapRes!36644 (and tp!69500 e!556374))))

(declare-datatypes ((V!35753 0))(
  ( (V!35754 (val!11589 Int)) )
))
(declare-datatypes ((ValueCell!11057 0))(
  ( (ValueCellFull!11057 (v!14148 V!35753)) (EmptyCell!11057) )
))
(declare-datatypes ((array!62168 0))(
  ( (array!62169 (arr!29937 (Array (_ BitVec 32) ValueCell!11057)) (size!30417 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62168)

(declare-fun mapValue!36644 () ValueCell!11057)

(declare-fun mapRest!36644 () (Array (_ BitVec 32) ValueCell!11057))

(declare-fun mapKey!36644 () (_ BitVec 32))

(assert (=> mapNonEmpty!36644 (= (arr!29937 _values!1278) (store mapRest!36644 mapKey!36644 mapValue!36644))))

(declare-fun b!986843 () Bool)

(declare-fun e!556371 () Bool)

(assert (=> b!986843 (= e!556371 (and e!556373 mapRes!36644))))

(declare-fun condMapEmpty!36644 () Bool)

(declare-fun mapDefault!36644 () ValueCell!11057)

(assert (=> b!986843 (= condMapEmpty!36644 (= (arr!29937 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11057)) mapDefault!36644)))))

(declare-fun mapIsEmpty!36644 () Bool)

(assert (=> mapIsEmpty!36644 mapRes!36644))

(declare-fun b!986845 () Bool)

(declare-fun res!660071 () Bool)

(declare-fun e!556372 () Bool)

(assert (=> b!986845 (=> (not res!660071) (not e!556372))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62170 0))(
  ( (array!62171 (arr!29938 (Array (_ BitVec 32) (_ BitVec 64))) (size!30418 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62170)

(assert (=> b!986845 (= res!660071 (and (= (size!30417 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30418 _keys!1544) (size!30417 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986846 () Bool)

(assert (=> b!986846 (= e!556374 tp_is_empty!23077)))

(declare-fun b!986847 () Bool)

(declare-fun res!660073 () Bool)

(assert (=> b!986847 (=> (not res!660073) (not e!556372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62170 (_ BitVec 32)) Bool)

(assert (=> b!986847 (= res!660073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986844 () Bool)

(assert (=> b!986844 (= e!556372 false)))

(declare-fun lt!437772 () Bool)

(declare-datatypes ((List!20724 0))(
  ( (Nil!20721) (Cons!20720 (h!21888 (_ BitVec 64)) (t!29615 List!20724)) )
))
(declare-fun arrayNoDuplicates!0 (array!62170 (_ BitVec 32) List!20724) Bool)

(assert (=> b!986844 (= lt!437772 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20721))))

(declare-fun res!660072 () Bool)

(assert (=> start!84442 (=> (not res!660072) (not e!556372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84442 (= res!660072 (validMask!0 mask!1948))))

(assert (=> start!84442 e!556372))

(assert (=> start!84442 true))

(declare-fun array_inv!23155 (array!62168) Bool)

(assert (=> start!84442 (and (array_inv!23155 _values!1278) e!556371)))

(declare-fun array_inv!23156 (array!62170) Bool)

(assert (=> start!84442 (array_inv!23156 _keys!1544)))

(assert (= (and start!84442 res!660072) b!986845))

(assert (= (and b!986845 res!660071) b!986847))

(assert (= (and b!986847 res!660073) b!986844))

(assert (= (and b!986843 condMapEmpty!36644) mapIsEmpty!36644))

(assert (= (and b!986843 (not condMapEmpty!36644)) mapNonEmpty!36644))

(get-info :version)

(assert (= (and mapNonEmpty!36644 ((_ is ValueCellFull!11057) mapValue!36644)) b!986846))

(assert (= (and b!986843 ((_ is ValueCellFull!11057) mapDefault!36644)) b!986842))

(assert (= start!84442 b!986843))

(declare-fun m!914237 () Bool)

(assert (=> mapNonEmpty!36644 m!914237))

(declare-fun m!914239 () Bool)

(assert (=> b!986847 m!914239))

(declare-fun m!914241 () Bool)

(assert (=> b!986844 m!914241))

(declare-fun m!914243 () Bool)

(assert (=> start!84442 m!914243))

(declare-fun m!914245 () Bool)

(assert (=> start!84442 m!914245))

(declare-fun m!914247 () Bool)

(assert (=> start!84442 m!914247))

(check-sat (not b!986847) tp_is_empty!23077 (not mapNonEmpty!36644) (not b!986844) (not start!84442))
(check-sat)
