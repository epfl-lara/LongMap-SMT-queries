; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104524 () Bool)

(assert start!104524)

(declare-fun mapNonEmpty!48685 () Bool)

(declare-fun mapRes!48685 () Bool)

(declare-fun tp!92786 () Bool)

(declare-fun e!707250 () Bool)

(assert (=> mapNonEmpty!48685 (= mapRes!48685 (and tp!92786 e!707250))))

(declare-fun mapKey!48685 () (_ BitVec 32))

(declare-datatypes ((V!47095 0))(
  ( (V!47096 (val!15711 Int)) )
))
(declare-datatypes ((ValueCell!14885 0))(
  ( (ValueCellFull!14885 (v!18406 V!47095)) (EmptyCell!14885) )
))
(declare-datatypes ((array!80286 0))(
  ( (array!80287 (arr!38717 (Array (_ BitVec 32) ValueCell!14885)) (size!39253 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80286)

(declare-fun mapRest!48685 () (Array (_ BitVec 32) ValueCell!14885))

(declare-fun mapValue!48685 () ValueCell!14885)

(assert (=> mapNonEmpty!48685 (= (arr!38717 _values!914) (store mapRest!48685 mapKey!48685 mapValue!48685))))

(declare-fun b!1246941 () Bool)

(declare-fun e!707251 () Bool)

(declare-fun e!707248 () Bool)

(assert (=> b!1246941 (= e!707251 (and e!707248 mapRes!48685))))

(declare-fun condMapEmpty!48685 () Bool)

(declare-fun mapDefault!48685 () ValueCell!14885)

