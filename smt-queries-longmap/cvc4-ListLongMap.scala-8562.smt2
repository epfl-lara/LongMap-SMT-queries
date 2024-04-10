; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104546 () Bool)

(assert start!104546)

(declare-fun mapNonEmpty!48712 () Bool)

(declare-fun mapRes!48712 () Bool)

(declare-fun tp!92813 () Bool)

(declare-fun e!707378 () Bool)

(assert (=> mapNonEmpty!48712 (= mapRes!48712 (and tp!92813 e!707378))))

(declare-datatypes ((V!47115 0))(
  ( (V!47116 (val!15719 Int)) )
))
(declare-datatypes ((ValueCell!14893 0))(
  ( (ValueCellFull!14893 (v!18414 V!47115)) (EmptyCell!14893) )
))
(declare-fun mapValue!48712 () ValueCell!14893)

(declare-datatypes ((array!80316 0))(
  ( (array!80317 (arr!38731 (Array (_ BitVec 32) ValueCell!14893)) (size!39267 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80316)

(declare-fun mapRest!48712 () (Array (_ BitVec 32) ValueCell!14893))

(declare-fun mapKey!48712 () (_ BitVec 32))

(assert (=> mapNonEmpty!48712 (= (arr!38731 _values!914) (store mapRest!48712 mapKey!48712 mapValue!48712))))

(declare-fun b!1247061 () Bool)

(declare-fun e!707377 () Bool)

(declare-fun e!707375 () Bool)

(assert (=> b!1247061 (= e!707377 (and e!707375 mapRes!48712))))

(declare-fun condMapEmpty!48712 () Bool)

(declare-fun mapDefault!48712 () ValueCell!14893)

