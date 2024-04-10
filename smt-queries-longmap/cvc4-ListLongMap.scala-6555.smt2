; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83218 () Bool)

(assert start!83218)

(declare-fun b_free!19211 () Bool)

(declare-fun b_next!19211 () Bool)

(assert (=> start!83218 (= b_free!19211 (not b_next!19211))))

(declare-fun tp!66912 () Bool)

(declare-fun b_and!30699 () Bool)

(assert (=> start!83218 (= tp!66912 b_and!30699)))

(declare-fun res!649891 () Bool)

(declare-fun e!547381 () Bool)

(assert (=> start!83218 (=> (not res!649891) (not e!547381))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83218 (= res!649891 (validMask!0 mask!2147))))

(assert (=> start!83218 e!547381))

(assert (=> start!83218 true))

(declare-datatypes ((V!34461 0))(
  ( (V!34462 (val!11105 Int)) )
))
(declare-datatypes ((ValueCell!10573 0))(
  ( (ValueCellFull!10573 (v!13664 V!34461)) (EmptyCell!10573) )
))
(declare-datatypes ((array!60271 0))(
  ( (array!60272 (arr!28999 (Array (_ BitVec 32) ValueCell!10573)) (size!29478 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60271)

(declare-fun e!547384 () Bool)

(declare-fun array_inv!22441 (array!60271) Bool)

(assert (=> start!83218 (and (array_inv!22441 _values!1425) e!547384)))

(declare-fun tp_is_empty!22109 () Bool)

(assert (=> start!83218 tp_is_empty!22109))

(assert (=> start!83218 tp!66912))

(declare-datatypes ((array!60273 0))(
  ( (array!60274 (arr!29000 (Array (_ BitVec 32) (_ BitVec 64))) (size!29479 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60273)

(declare-fun array_inv!22442 (array!60273) Bool)

(assert (=> start!83218 (array_inv!22442 _keys!1717)))

(declare-fun b!970969 () Bool)

(declare-fun e!547382 () Bool)

(declare-fun mapRes!35173 () Bool)

(assert (=> b!970969 (= e!547384 (and e!547382 mapRes!35173))))

(declare-fun condMapEmpty!35173 () Bool)

(declare-fun mapDefault!35173 () ValueCell!10573)

