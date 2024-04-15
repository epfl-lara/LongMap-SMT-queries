; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84316 () Bool)

(assert start!84316)

(declare-fun b!986267 () Bool)

(declare-fun e!556093 () Bool)

(declare-fun tp_is_empty!23137 () Bool)

(assert (=> b!986267 (= e!556093 tp_is_empty!23137)))

(declare-fun mapNonEmpty!36734 () Bool)

(declare-fun mapRes!36734 () Bool)

(declare-fun tp!69590 () Bool)

(assert (=> mapNonEmpty!36734 (= mapRes!36734 (and tp!69590 e!556093))))

(declare-fun mapKey!36734 () (_ BitVec 32))

(declare-datatypes ((V!35833 0))(
  ( (V!35834 (val!11619 Int)) )
))
(declare-datatypes ((ValueCell!11087 0))(
  ( (ValueCellFull!11087 (v!14180 V!35833)) (EmptyCell!11087) )
))
(declare-datatypes ((array!62170 0))(
  ( (array!62171 (arr!29943 (Array (_ BitVec 32) ValueCell!11087)) (size!30424 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62170)

(declare-fun mapRest!36734 () (Array (_ BitVec 32) ValueCell!11087))

(declare-fun mapValue!36734 () ValueCell!11087)

(assert (=> mapNonEmpty!36734 (= (arr!29943 _values!1278) (store mapRest!36734 mapKey!36734 mapValue!36734))))

(declare-fun b!986268 () Bool)

(declare-fun res!659916 () Bool)

(declare-fun e!556090 () Bool)

(assert (=> b!986268 (=> (not res!659916) (not e!556090))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((array!62172 0))(
  ( (array!62173 (arr!29944 (Array (_ BitVec 32) (_ BitVec 64))) (size!30425 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62172)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986268 (= res!659916 (and (= (size!30424 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30425 _keys!1544) (size!30424 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986269 () Bool)

(assert (=> b!986269 (= e!556090 false)))

(declare-fun lt!437265 () Bool)

(declare-datatypes ((List!20778 0))(
  ( (Nil!20775) (Cons!20774 (h!21936 (_ BitVec 64)) (t!29668 List!20778)) )
))
(declare-fun arrayNoDuplicates!0 (array!62172 (_ BitVec 32) List!20778) Bool)

(assert (=> b!986269 (= lt!437265 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20775))))

(declare-fun b!986270 () Bool)

(declare-fun res!659914 () Bool)

(assert (=> b!986270 (=> (not res!659914) (not e!556090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62172 (_ BitVec 32)) Bool)

(assert (=> b!986270 (= res!659914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659915 () Bool)

(assert (=> start!84316 (=> (not res!659915) (not e!556090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84316 (= res!659915 (validMask!0 mask!1948))))

(assert (=> start!84316 e!556090))

(assert (=> start!84316 true))

(declare-fun e!556092 () Bool)

(declare-fun array_inv!23153 (array!62170) Bool)

(assert (=> start!84316 (and (array_inv!23153 _values!1278) e!556092)))

(declare-fun array_inv!23154 (array!62172) Bool)

(assert (=> start!84316 (array_inv!23154 _keys!1544)))

(declare-fun mapIsEmpty!36734 () Bool)

(assert (=> mapIsEmpty!36734 mapRes!36734))

(declare-fun b!986271 () Bool)

(declare-fun e!556091 () Bool)

(assert (=> b!986271 (= e!556092 (and e!556091 mapRes!36734))))

(declare-fun condMapEmpty!36734 () Bool)

(declare-fun mapDefault!36734 () ValueCell!11087)

(assert (=> b!986271 (= condMapEmpty!36734 (= (arr!29943 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11087)) mapDefault!36734)))))

(declare-fun b!986272 () Bool)

(assert (=> b!986272 (= e!556091 tp_is_empty!23137)))

(assert (= (and start!84316 res!659915) b!986268))

(assert (= (and b!986268 res!659916) b!986270))

(assert (= (and b!986270 res!659914) b!986269))

(assert (= (and b!986271 condMapEmpty!36734) mapIsEmpty!36734))

(assert (= (and b!986271 (not condMapEmpty!36734)) mapNonEmpty!36734))

(get-info :version)

(assert (= (and mapNonEmpty!36734 ((_ is ValueCellFull!11087) mapValue!36734)) b!986267))

(assert (= (and b!986271 ((_ is ValueCellFull!11087) mapDefault!36734)) b!986272))

(assert (= start!84316 b!986271))

(declare-fun m!912557 () Bool)

(assert (=> mapNonEmpty!36734 m!912557))

(declare-fun m!912559 () Bool)

(assert (=> b!986269 m!912559))

(declare-fun m!912561 () Bool)

(assert (=> b!986270 m!912561))

(declare-fun m!912563 () Bool)

(assert (=> start!84316 m!912563))

(declare-fun m!912565 () Bool)

(assert (=> start!84316 m!912565))

(declare-fun m!912567 () Bool)

(assert (=> start!84316 m!912567))

(check-sat (not b!986269) (not b!986270) (not mapNonEmpty!36734) tp_is_empty!23137 (not start!84316))
(check-sat)
