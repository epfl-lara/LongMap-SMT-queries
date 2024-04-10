; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84294 () Bool)

(assert start!84294)

(declare-fun mapNonEmpty!36674 () Bool)

(declare-fun mapRes!36674 () Bool)

(declare-fun tp!69529 () Bool)

(declare-fun e!555940 () Bool)

(assert (=> mapNonEmpty!36674 (= mapRes!36674 (and tp!69529 e!555940))))

(declare-datatypes ((V!35779 0))(
  ( (V!35780 (val!11599 Int)) )
))
(declare-datatypes ((ValueCell!11067 0))(
  ( (ValueCellFull!11067 (v!14161 V!35779)) (EmptyCell!11067) )
))
(declare-datatypes ((array!62161 0))(
  ( (array!62162 (arr!29938 (Array (_ BitVec 32) ValueCell!11067)) (size!30417 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62161)

(declare-fun mapKey!36674 () (_ BitVec 32))

(declare-fun mapValue!36674 () ValueCell!11067)

(declare-fun mapRest!36674 () (Array (_ BitVec 32) ValueCell!11067))

(assert (=> mapNonEmpty!36674 (= (arr!29938 _values!1278) (store mapRest!36674 mapKey!36674 mapValue!36674))))

(declare-fun mapIsEmpty!36674 () Bool)

(assert (=> mapIsEmpty!36674 mapRes!36674))

(declare-fun b!986119 () Bool)

(declare-fun tp_is_empty!23097 () Bool)

(assert (=> b!986119 (= e!555940 tp_is_empty!23097)))

(declare-fun b!986120 () Bool)

(declare-fun res!659818 () Bool)

(declare-fun e!555938 () Bool)

(assert (=> b!986120 (=> (not res!659818) (not e!555938))))

(declare-datatypes ((array!62163 0))(
  ( (array!62164 (arr!29939 (Array (_ BitVec 32) (_ BitVec 64))) (size!30418 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62163)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62163 (_ BitVec 32)) Bool)

(assert (=> b!986120 (= res!659818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986121 () Bool)

(declare-fun e!555941 () Bool)

(assert (=> b!986121 (= e!555941 tp_is_empty!23097)))

(declare-fun res!659819 () Bool)

(assert (=> start!84294 (=> (not res!659819) (not e!555938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84294 (= res!659819 (validMask!0 mask!1948))))

(assert (=> start!84294 e!555938))

(assert (=> start!84294 true))

(declare-fun e!555939 () Bool)

(declare-fun array_inv!23137 (array!62161) Bool)

(assert (=> start!84294 (and (array_inv!23137 _values!1278) e!555939)))

(declare-fun array_inv!23138 (array!62163) Bool)

(assert (=> start!84294 (array_inv!23138 _keys!1544)))

(declare-fun b!986122 () Bool)

(assert (=> b!986122 (= e!555938 false)))

(declare-fun lt!437441 () Bool)

(declare-datatypes ((List!20728 0))(
  ( (Nil!20725) (Cons!20724 (h!21886 (_ BitVec 64)) (t!29627 List!20728)) )
))
(declare-fun arrayNoDuplicates!0 (array!62163 (_ BitVec 32) List!20728) Bool)

(assert (=> b!986122 (= lt!437441 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20725))))

(declare-fun b!986123 () Bool)

(declare-fun res!659817 () Bool)

(assert (=> b!986123 (=> (not res!659817) (not e!555938))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986123 (= res!659817 (and (= (size!30417 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30418 _keys!1544) (size!30417 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986124 () Bool)

(assert (=> b!986124 (= e!555939 (and e!555941 mapRes!36674))))

(declare-fun condMapEmpty!36674 () Bool)

(declare-fun mapDefault!36674 () ValueCell!11067)

(assert (=> b!986124 (= condMapEmpty!36674 (= (arr!29938 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11067)) mapDefault!36674)))))

(assert (= (and start!84294 res!659819) b!986123))

(assert (= (and b!986123 res!659817) b!986120))

(assert (= (and b!986120 res!659818) b!986122))

(assert (= (and b!986124 condMapEmpty!36674) mapIsEmpty!36674))

(assert (= (and b!986124 (not condMapEmpty!36674)) mapNonEmpty!36674))

(get-info :version)

(assert (= (and mapNonEmpty!36674 ((_ is ValueCellFull!11067) mapValue!36674)) b!986119))

(assert (= (and b!986124 ((_ is ValueCellFull!11067) mapDefault!36674)) b!986121))

(assert (= start!84294 b!986124))

(declare-fun m!913063 () Bool)

(assert (=> mapNonEmpty!36674 m!913063))

(declare-fun m!913065 () Bool)

(assert (=> b!986120 m!913065))

(declare-fun m!913067 () Bool)

(assert (=> start!84294 m!913067))

(declare-fun m!913069 () Bool)

(assert (=> start!84294 m!913069))

(declare-fun m!913071 () Bool)

(assert (=> start!84294 m!913071))

(declare-fun m!913073 () Bool)

(assert (=> b!986122 m!913073))

(check-sat (not b!986120) tp_is_empty!23097 (not start!84294) (not mapNonEmpty!36674) (not b!986122))
(check-sat)
