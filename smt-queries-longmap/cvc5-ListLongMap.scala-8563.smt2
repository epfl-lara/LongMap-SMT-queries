; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104556 () Bool)

(assert start!104556)

(declare-fun res!832182 () Bool)

(declare-fun e!707408 () Bool)

(assert (=> start!104556 (=> (not res!832182) (not e!707408))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104556 (= res!832182 (validMask!0 mask!1466))))

(assert (=> start!104556 e!707408))

(assert (=> start!104556 true))

(declare-datatypes ((array!80320 0))(
  ( (array!80321 (arr!38732 (Array (_ BitVec 32) (_ BitVec 64))) (size!39268 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80320)

(declare-fun array_inv!29577 (array!80320) Bool)

(assert (=> start!104556 (array_inv!29577 _keys!1118)))

(declare-datatypes ((V!47119 0))(
  ( (V!47120 (val!15720 Int)) )
))
(declare-datatypes ((ValueCell!14894 0))(
  ( (ValueCellFull!14894 (v!18415 V!47119)) (EmptyCell!14894) )
))
(declare-datatypes ((array!80322 0))(
  ( (array!80323 (arr!38733 (Array (_ BitVec 32) ValueCell!14894)) (size!39269 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80322)

(declare-fun e!707405 () Bool)

(declare-fun array_inv!29578 (array!80322) Bool)

(assert (=> start!104556 (and (array_inv!29578 _values!914) e!707405)))

(declare-fun b!1247099 () Bool)

(declare-fun e!707406 () Bool)

(declare-fun tp_is_empty!31315 () Bool)

(assert (=> b!1247099 (= e!707406 tp_is_empty!31315)))

(declare-fun mapNonEmpty!48718 () Bool)

(declare-fun mapRes!48718 () Bool)

(declare-fun tp!92819 () Bool)

(assert (=> mapNonEmpty!48718 (= mapRes!48718 (and tp!92819 e!707406))))

(declare-fun mapKey!48718 () (_ BitVec 32))

(declare-fun mapRest!48718 () (Array (_ BitVec 32) ValueCell!14894))

(declare-fun mapValue!48718 () ValueCell!14894)

(assert (=> mapNonEmpty!48718 (= (arr!38733 _values!914) (store mapRest!48718 mapKey!48718 mapValue!48718))))

(declare-fun b!1247100 () Bool)

(assert (=> b!1247100 (= e!707408 (and (bvsle #b00000000000000000000000000000000 (size!39268 _keys!1118)) (bvsge (size!39268 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1247101 () Bool)

(declare-fun e!707407 () Bool)

(assert (=> b!1247101 (= e!707405 (and e!707407 mapRes!48718))))

(declare-fun condMapEmpty!48718 () Bool)

(declare-fun mapDefault!48718 () ValueCell!14894)

