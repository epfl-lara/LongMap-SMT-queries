; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84328 () Bool)

(assert start!84328)

(declare-fun mapNonEmpty!36752 () Bool)

(declare-fun mapRes!36752 () Bool)

(declare-fun tp!69608 () Bool)

(declare-fun e!556184 () Bool)

(assert (=> mapNonEmpty!36752 (= mapRes!36752 (and tp!69608 e!556184))))

(declare-fun mapKey!36752 () (_ BitVec 32))

(declare-datatypes ((V!35849 0))(
  ( (V!35850 (val!11625 Int)) )
))
(declare-datatypes ((ValueCell!11093 0))(
  ( (ValueCellFull!11093 (v!14186 V!35849)) (EmptyCell!11093) )
))
(declare-datatypes ((array!62194 0))(
  ( (array!62195 (arr!29955 (Array (_ BitVec 32) ValueCell!11093)) (size!30436 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62194)

(declare-fun mapValue!36752 () ValueCell!11093)

(declare-fun mapRest!36752 () (Array (_ BitVec 32) ValueCell!11093))

(assert (=> mapNonEmpty!36752 (= (arr!29955 _values!1278) (store mapRest!36752 mapKey!36752 mapValue!36752))))

(declare-fun b!986375 () Bool)

(declare-fun e!556181 () Bool)

(assert (=> b!986375 (= e!556181 false)))

(declare-fun lt!437283 () Bool)

(declare-datatypes ((array!62196 0))(
  ( (array!62197 (arr!29956 (Array (_ BitVec 32) (_ BitVec 64))) (size!30437 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62196)

(declare-datatypes ((List!20782 0))(
  ( (Nil!20779) (Cons!20778 (h!21940 (_ BitVec 64)) (t!29672 List!20782)) )
))
(declare-fun arrayNoDuplicates!0 (array!62196 (_ BitVec 32) List!20782) Bool)

(assert (=> b!986375 (= lt!437283 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20779))))

(declare-fun b!986376 () Bool)

(declare-fun e!556182 () Bool)

(declare-fun tp_is_empty!23149 () Bool)

(assert (=> b!986376 (= e!556182 tp_is_empty!23149)))

(declare-fun b!986377 () Bool)

(assert (=> b!986377 (= e!556184 tp_is_empty!23149)))

(declare-fun res!659969 () Bool)

(assert (=> start!84328 (=> (not res!659969) (not e!556181))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84328 (= res!659969 (validMask!0 mask!1948))))

(assert (=> start!84328 e!556181))

(assert (=> start!84328 true))

(declare-fun e!556183 () Bool)

(declare-fun array_inv!23163 (array!62194) Bool)

(assert (=> start!84328 (and (array_inv!23163 _values!1278) e!556183)))

(declare-fun array_inv!23164 (array!62196) Bool)

(assert (=> start!84328 (array_inv!23164 _keys!1544)))

(declare-fun b!986378 () Bool)

(assert (=> b!986378 (= e!556183 (and e!556182 mapRes!36752))))

(declare-fun condMapEmpty!36752 () Bool)

(declare-fun mapDefault!36752 () ValueCell!11093)

(assert (=> b!986378 (= condMapEmpty!36752 (= (arr!29955 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11093)) mapDefault!36752)))))

(declare-fun b!986379 () Bool)

(declare-fun res!659968 () Bool)

(assert (=> b!986379 (=> (not res!659968) (not e!556181))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986379 (= res!659968 (and (= (size!30436 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30437 _keys!1544) (size!30436 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36752 () Bool)

(assert (=> mapIsEmpty!36752 mapRes!36752))

(declare-fun b!986380 () Bool)

(declare-fun res!659970 () Bool)

(assert (=> b!986380 (=> (not res!659970) (not e!556181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62196 (_ BitVec 32)) Bool)

(assert (=> b!986380 (= res!659970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84328 res!659969) b!986379))

(assert (= (and b!986379 res!659968) b!986380))

(assert (= (and b!986380 res!659970) b!986375))

(assert (= (and b!986378 condMapEmpty!36752) mapIsEmpty!36752))

(assert (= (and b!986378 (not condMapEmpty!36752)) mapNonEmpty!36752))

(get-info :version)

(assert (= (and mapNonEmpty!36752 ((_ is ValueCellFull!11093) mapValue!36752)) b!986377))

(assert (= (and b!986378 ((_ is ValueCellFull!11093) mapDefault!36752)) b!986376))

(assert (= start!84328 b!986378))

(declare-fun m!912629 () Bool)

(assert (=> mapNonEmpty!36752 m!912629))

(declare-fun m!912631 () Bool)

(assert (=> b!986375 m!912631))

(declare-fun m!912633 () Bool)

(assert (=> start!84328 m!912633))

(declare-fun m!912635 () Bool)

(assert (=> start!84328 m!912635))

(declare-fun m!912637 () Bool)

(assert (=> start!84328 m!912637))

(declare-fun m!912639 () Bool)

(assert (=> b!986380 m!912639))

(check-sat (not b!986375) (not b!986380) tp_is_empty!23149 (not mapNonEmpty!36752) (not start!84328))
(check-sat)
