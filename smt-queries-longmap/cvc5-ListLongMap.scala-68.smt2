; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!940 () Bool)

(assert start!940)

(declare-fun b_free!313 () Bool)

(declare-fun b_next!313 () Bool)

(assert (=> start!940 (= b_free!313 (not b_next!313))))

(declare-fun tp!1171 () Bool)

(declare-fun b_and!461 () Bool)

(assert (=> start!940 (= tp!1171 b_and!461)))

(declare-fun b!7932 () Bool)

(declare-fun res!7688 () Bool)

(declare-fun e!4484 () Bool)

(assert (=> b!7932 (=> (not res!7688) (not e!4484))))

(declare-datatypes ((array!713 0))(
  ( (array!714 (arr!344 (Array (_ BitVec 32) (_ BitVec 64))) (size!406 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!713)

(declare-datatypes ((List!234 0))(
  ( (Nil!231) (Cons!230 (h!796 (_ BitVec 64)) (t!2371 List!234)) )
))
(declare-fun arrayNoDuplicates!0 (array!713 (_ BitVec 32) List!234) Bool)

(assert (=> b!7932 (= res!7688 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!231))))

(declare-fun b!7933 () Bool)

(declare-fun e!4483 () Bool)

(declare-fun e!4485 () Bool)

(declare-fun mapRes!560 () Bool)

(assert (=> b!7933 (= e!4483 (and e!4485 mapRes!560))))

(declare-fun condMapEmpty!560 () Bool)

(declare-datatypes ((V!699 0))(
  ( (V!700 (val!201 Int)) )
))
(declare-datatypes ((ValueCell!179 0))(
  ( (ValueCellFull!179 (v!1293 V!699)) (EmptyCell!179) )
))
(declare-datatypes ((array!715 0))(
  ( (array!716 (arr!345 (Array (_ BitVec 32) ValueCell!179)) (size!407 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!715)

(declare-fun mapDefault!560 () ValueCell!179)

