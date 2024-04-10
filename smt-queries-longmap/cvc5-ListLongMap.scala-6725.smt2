; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84322 () Bool)

(assert start!84322)

(declare-fun b!986398 () Bool)

(declare-fun res!659970 () Bool)

(declare-fun e!556151 () Bool)

(assert (=> b!986398 (=> (not res!659970) (not e!556151))))

(declare-datatypes ((array!62217 0))(
  ( (array!62218 (arr!29966 (Array (_ BitVec 32) (_ BitVec 64))) (size!30445 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62217)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62217 (_ BitVec 32)) Bool)

(assert (=> b!986398 (= res!659970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986399 () Bool)

(declare-fun e!556152 () Bool)

(declare-fun tp_is_empty!23125 () Bool)

(assert (=> b!986399 (= e!556152 tp_is_empty!23125)))

(declare-fun b!986400 () Bool)

(declare-fun e!556149 () Bool)

(assert (=> b!986400 (= e!556149 tp_is_empty!23125)))

(declare-fun res!659972 () Bool)

(assert (=> start!84322 (=> (not res!659972) (not e!556151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84322 (= res!659972 (validMask!0 mask!1948))))

(assert (=> start!84322 e!556151))

(assert (=> start!84322 true))

(declare-datatypes ((V!35817 0))(
  ( (V!35818 (val!11613 Int)) )
))
(declare-datatypes ((ValueCell!11081 0))(
  ( (ValueCellFull!11081 (v!14175 V!35817)) (EmptyCell!11081) )
))
(declare-datatypes ((array!62219 0))(
  ( (array!62220 (arr!29967 (Array (_ BitVec 32) ValueCell!11081)) (size!30446 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62219)

(declare-fun e!556148 () Bool)

(declare-fun array_inv!23161 (array!62219) Bool)

(assert (=> start!84322 (and (array_inv!23161 _values!1278) e!556148)))

(declare-fun array_inv!23162 (array!62217) Bool)

(assert (=> start!84322 (array_inv!23162 _keys!1544)))

(declare-fun mapNonEmpty!36716 () Bool)

(declare-fun mapRes!36716 () Bool)

(declare-fun tp!69571 () Bool)

(assert (=> mapNonEmpty!36716 (= mapRes!36716 (and tp!69571 e!556152))))

(declare-fun mapValue!36716 () ValueCell!11081)

(declare-fun mapKey!36716 () (_ BitVec 32))

(declare-fun mapRest!36716 () (Array (_ BitVec 32) ValueCell!11081))

(assert (=> mapNonEmpty!36716 (= (arr!29967 _values!1278) (store mapRest!36716 mapKey!36716 mapValue!36716))))

(declare-fun mapIsEmpty!36716 () Bool)

(assert (=> mapIsEmpty!36716 mapRes!36716))

(declare-fun b!986401 () Bool)

(assert (=> b!986401 (= e!556151 false)))

(declare-fun lt!437483 () Bool)

(declare-datatypes ((List!20741 0))(
  ( (Nil!20738) (Cons!20737 (h!21899 (_ BitVec 64)) (t!29640 List!20741)) )
))
(declare-fun arrayNoDuplicates!0 (array!62217 (_ BitVec 32) List!20741) Bool)

(assert (=> b!986401 (= lt!437483 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20738))))

(declare-fun b!986402 () Bool)

(assert (=> b!986402 (= e!556148 (and e!556149 mapRes!36716))))

(declare-fun condMapEmpty!36716 () Bool)

(declare-fun mapDefault!36716 () ValueCell!11081)

