; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104560 () Bool)

(assert start!104560)

(declare-fun b!1247135 () Bool)

(declare-fun e!707435 () Bool)

(declare-datatypes ((array!80328 0))(
  ( (array!80329 (arr!38736 (Array (_ BitVec 32) (_ BitVec 64))) (size!39272 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80328)

(assert (=> b!1247135 (= e!707435 (and (bvsle #b00000000000000000000000000000000 (size!39272 _keys!1118)) (bvsge (size!39272 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1247136 () Bool)

(declare-fun e!707434 () Bool)

(declare-fun tp_is_empty!31319 () Bool)

(assert (=> b!1247136 (= e!707434 tp_is_empty!31319)))

(declare-fun res!832201 () Bool)

(assert (=> start!104560 (=> (not res!832201) (not e!707435))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104560 (= res!832201 (validMask!0 mask!1466))))

(assert (=> start!104560 e!707435))

(assert (=> start!104560 true))

(declare-fun array_inv!29581 (array!80328) Bool)

(assert (=> start!104560 (array_inv!29581 _keys!1118)))

(declare-datatypes ((V!47123 0))(
  ( (V!47124 (val!15722 Int)) )
))
(declare-datatypes ((ValueCell!14896 0))(
  ( (ValueCellFull!14896 (v!18417 V!47123)) (EmptyCell!14896) )
))
(declare-datatypes ((array!80330 0))(
  ( (array!80331 (arr!38737 (Array (_ BitVec 32) ValueCell!14896)) (size!39273 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80330)

(declare-fun e!707436 () Bool)

(declare-fun array_inv!29582 (array!80330) Bool)

(assert (=> start!104560 (and (array_inv!29582 _values!914) e!707436)))

(declare-fun mapNonEmpty!48724 () Bool)

(declare-fun mapRes!48724 () Bool)

(declare-fun tp!92825 () Bool)

(assert (=> mapNonEmpty!48724 (= mapRes!48724 (and tp!92825 e!707434))))

(declare-fun mapRest!48724 () (Array (_ BitVec 32) ValueCell!14896))

(declare-fun mapValue!48724 () ValueCell!14896)

(declare-fun mapKey!48724 () (_ BitVec 32))

(assert (=> mapNonEmpty!48724 (= (arr!38737 _values!914) (store mapRest!48724 mapKey!48724 mapValue!48724))))

(declare-fun b!1247137 () Bool)

(declare-fun e!707437 () Bool)

(assert (=> b!1247137 (= e!707436 (and e!707437 mapRes!48724))))

(declare-fun condMapEmpty!48724 () Bool)

(declare-fun mapDefault!48724 () ValueCell!14896)

