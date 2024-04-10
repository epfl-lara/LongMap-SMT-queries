; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83242 () Bool)

(assert start!83242)

(declare-fun b_free!19235 () Bool)

(declare-fun b_next!19235 () Bool)

(assert (=> start!83242 (= b_free!19235 (not b_next!19235))))

(declare-fun tp!66984 () Bool)

(declare-fun b_and!30723 () Bool)

(assert (=> start!83242 (= tp!66984 b_and!30723)))

(declare-fun b!971329 () Bool)

(declare-fun e!547564 () Bool)

(declare-fun e!547560 () Bool)

(declare-fun mapRes!35209 () Bool)

(assert (=> b!971329 (= e!547564 (and e!547560 mapRes!35209))))

(declare-fun condMapEmpty!35209 () Bool)

(declare-datatypes ((V!34493 0))(
  ( (V!34494 (val!11117 Int)) )
))
(declare-datatypes ((ValueCell!10585 0))(
  ( (ValueCellFull!10585 (v!13676 V!34493)) (EmptyCell!10585) )
))
(declare-datatypes ((array!60315 0))(
  ( (array!60316 (arr!29021 (Array (_ BitVec 32) ValueCell!10585)) (size!29500 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60315)

(declare-fun mapDefault!35209 () ValueCell!10585)

