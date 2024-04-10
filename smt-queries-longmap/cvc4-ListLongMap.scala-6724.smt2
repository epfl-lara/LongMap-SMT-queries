; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84320 () Bool)

(assert start!84320)

(declare-fun b!986380 () Bool)

(declare-fun e!556137 () Bool)

(assert (=> b!986380 (= e!556137 false)))

(declare-fun lt!437480 () Bool)

(declare-datatypes ((array!62213 0))(
  ( (array!62214 (arr!29964 (Array (_ BitVec 32) (_ BitVec 64))) (size!30443 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62213)

(declare-datatypes ((List!20740 0))(
  ( (Nil!20737) (Cons!20736 (h!21898 (_ BitVec 64)) (t!29639 List!20740)) )
))
(declare-fun arrayNoDuplicates!0 (array!62213 (_ BitVec 32) List!20740) Bool)

(assert (=> b!986380 (= lt!437480 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20737))))

(declare-fun b!986381 () Bool)

(declare-fun e!556136 () Bool)

(declare-fun tp_is_empty!23123 () Bool)

(assert (=> b!986381 (= e!556136 tp_is_empty!23123)))

(declare-fun res!659963 () Bool)

(assert (=> start!84320 (=> (not res!659963) (not e!556137))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84320 (= res!659963 (validMask!0 mask!1948))))

(assert (=> start!84320 e!556137))

(assert (=> start!84320 true))

(declare-datatypes ((V!35813 0))(
  ( (V!35814 (val!11612 Int)) )
))
(declare-datatypes ((ValueCell!11080 0))(
  ( (ValueCellFull!11080 (v!14174 V!35813)) (EmptyCell!11080) )
))
(declare-datatypes ((array!62215 0))(
  ( (array!62216 (arr!29965 (Array (_ BitVec 32) ValueCell!11080)) (size!30444 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62215)

(declare-fun e!556134 () Bool)

(declare-fun array_inv!23159 (array!62215) Bool)

(assert (=> start!84320 (and (array_inv!23159 _values!1278) e!556134)))

(declare-fun array_inv!23160 (array!62213) Bool)

(assert (=> start!84320 (array_inv!23160 _keys!1544)))

(declare-fun mapIsEmpty!36713 () Bool)

(declare-fun mapRes!36713 () Bool)

(assert (=> mapIsEmpty!36713 mapRes!36713))

(declare-fun mapNonEmpty!36713 () Bool)

(declare-fun tp!69568 () Bool)

(declare-fun e!556135 () Bool)

(assert (=> mapNonEmpty!36713 (= mapRes!36713 (and tp!69568 e!556135))))

(declare-fun mapRest!36713 () (Array (_ BitVec 32) ValueCell!11080))

(declare-fun mapKey!36713 () (_ BitVec 32))

(declare-fun mapValue!36713 () ValueCell!11080)

(assert (=> mapNonEmpty!36713 (= (arr!29965 _values!1278) (store mapRest!36713 mapKey!36713 mapValue!36713))))

(declare-fun b!986382 () Bool)

(assert (=> b!986382 (= e!556135 tp_is_empty!23123)))

(declare-fun b!986383 () Bool)

(declare-fun res!659961 () Bool)

(assert (=> b!986383 (=> (not res!659961) (not e!556137))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986383 (= res!659961 (and (= (size!30444 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30443 _keys!1544) (size!30444 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986384 () Bool)

(assert (=> b!986384 (= e!556134 (and e!556136 mapRes!36713))))

(declare-fun condMapEmpty!36713 () Bool)

(declare-fun mapDefault!36713 () ValueCell!11080)

