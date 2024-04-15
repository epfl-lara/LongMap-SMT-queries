; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84322 () Bool)

(assert start!84322)

(declare-fun mapIsEmpty!36743 () Bool)

(declare-fun mapRes!36743 () Bool)

(assert (=> mapIsEmpty!36743 mapRes!36743))

(declare-fun res!659942 () Bool)

(declare-fun e!556136 () Bool)

(assert (=> start!84322 (=> (not res!659942) (not e!556136))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84322 (= res!659942 (validMask!0 mask!1948))))

(assert (=> start!84322 e!556136))

(assert (=> start!84322 true))

(declare-datatypes ((V!35841 0))(
  ( (V!35842 (val!11622 Int)) )
))
(declare-datatypes ((ValueCell!11090 0))(
  ( (ValueCellFull!11090 (v!14183 V!35841)) (EmptyCell!11090) )
))
(declare-datatypes ((array!62182 0))(
  ( (array!62183 (arr!29949 (Array (_ BitVec 32) ValueCell!11090)) (size!30430 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62182)

(declare-fun e!556139 () Bool)

(declare-fun array_inv!23159 (array!62182) Bool)

(assert (=> start!84322 (and (array_inv!23159 _values!1278) e!556139)))

(declare-datatypes ((array!62184 0))(
  ( (array!62185 (arr!29950 (Array (_ BitVec 32) (_ BitVec 64))) (size!30431 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62184)

(declare-fun array_inv!23160 (array!62184) Bool)

(assert (=> start!84322 (array_inv!23160 _keys!1544)))

(declare-fun mapNonEmpty!36743 () Bool)

(declare-fun tp!69599 () Bool)

(declare-fun e!556137 () Bool)

(assert (=> mapNonEmpty!36743 (= mapRes!36743 (and tp!69599 e!556137))))

(declare-fun mapValue!36743 () ValueCell!11090)

(declare-fun mapRest!36743 () (Array (_ BitVec 32) ValueCell!11090))

(declare-fun mapKey!36743 () (_ BitVec 32))

(assert (=> mapNonEmpty!36743 (= (arr!29949 _values!1278) (store mapRest!36743 mapKey!36743 mapValue!36743))))

(declare-fun b!986321 () Bool)

(declare-fun res!659941 () Bool)

(assert (=> b!986321 (=> (not res!659941) (not e!556136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62184 (_ BitVec 32)) Bool)

(assert (=> b!986321 (= res!659941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986322 () Bool)

(declare-fun res!659943 () Bool)

(assert (=> b!986322 (=> (not res!659943) (not e!556136))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986322 (= res!659943 (and (= (size!30430 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30431 _keys!1544) (size!30430 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986323 () Bool)

(assert (=> b!986323 (= e!556136 false)))

(declare-fun lt!437274 () Bool)

(declare-datatypes ((List!20780 0))(
  ( (Nil!20777) (Cons!20776 (h!21938 (_ BitVec 64)) (t!29670 List!20780)) )
))
(declare-fun arrayNoDuplicates!0 (array!62184 (_ BitVec 32) List!20780) Bool)

(assert (=> b!986323 (= lt!437274 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20777))))

(declare-fun b!986324 () Bool)

(declare-fun tp_is_empty!23143 () Bool)

(assert (=> b!986324 (= e!556137 tp_is_empty!23143)))

(declare-fun b!986325 () Bool)

(declare-fun e!556135 () Bool)

(assert (=> b!986325 (= e!556135 tp_is_empty!23143)))

(declare-fun b!986326 () Bool)

(assert (=> b!986326 (= e!556139 (and e!556135 mapRes!36743))))

(declare-fun condMapEmpty!36743 () Bool)

(declare-fun mapDefault!36743 () ValueCell!11090)

(assert (=> b!986326 (= condMapEmpty!36743 (= (arr!29949 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11090)) mapDefault!36743)))))

(assert (= (and start!84322 res!659942) b!986322))

(assert (= (and b!986322 res!659943) b!986321))

(assert (= (and b!986321 res!659941) b!986323))

(assert (= (and b!986326 condMapEmpty!36743) mapIsEmpty!36743))

(assert (= (and b!986326 (not condMapEmpty!36743)) mapNonEmpty!36743))

(get-info :version)

(assert (= (and mapNonEmpty!36743 ((_ is ValueCellFull!11090) mapValue!36743)) b!986324))

(assert (= (and b!986326 ((_ is ValueCellFull!11090) mapDefault!36743)) b!986325))

(assert (= start!84322 b!986326))

(declare-fun m!912593 () Bool)

(assert (=> start!84322 m!912593))

(declare-fun m!912595 () Bool)

(assert (=> start!84322 m!912595))

(declare-fun m!912597 () Bool)

(assert (=> start!84322 m!912597))

(declare-fun m!912599 () Bool)

(assert (=> mapNonEmpty!36743 m!912599))

(declare-fun m!912601 () Bool)

(assert (=> b!986321 m!912601))

(declare-fun m!912603 () Bool)

(assert (=> b!986323 m!912603))

(check-sat tp_is_empty!23143 (not b!986321) (not mapNonEmpty!36743) (not b!986323) (not start!84322))
(check-sat)
