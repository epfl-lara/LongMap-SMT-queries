; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83232 () Bool)

(assert start!83232)

(declare-fun b_free!19225 () Bool)

(declare-fun b_next!19225 () Bool)

(assert (=> start!83232 (= b_free!19225 (not b_next!19225))))

(declare-fun tp!66953 () Bool)

(declare-fun b_and!30713 () Bool)

(assert (=> start!83232 (= tp!66953 b_and!30713)))

(declare-fun b!971179 () Bool)

(declare-fun res!650040 () Bool)

(declare-fun e!547487 () Bool)

(assert (=> b!971179 (=> (not res!650040) (not e!547487))))

(declare-datatypes ((array!60299 0))(
  ( (array!60300 (arr!29013 (Array (_ BitVec 32) (_ BitVec 64))) (size!29492 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60299)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60299 (_ BitVec 32)) Bool)

(assert (=> b!971179 (= res!650040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35194 () Bool)

(declare-fun mapRes!35194 () Bool)

(assert (=> mapIsEmpty!35194 mapRes!35194))

(declare-fun b!971180 () Bool)

(declare-fun e!547485 () Bool)

(declare-fun e!547488 () Bool)

(assert (=> b!971180 (= e!547485 (and e!547488 mapRes!35194))))

(declare-fun condMapEmpty!35194 () Bool)

(declare-datatypes ((V!34481 0))(
  ( (V!34482 (val!11112 Int)) )
))
(declare-datatypes ((ValueCell!10580 0))(
  ( (ValueCellFull!10580 (v!13671 V!34481)) (EmptyCell!10580) )
))
(declare-datatypes ((array!60301 0))(
  ( (array!60302 (arr!29014 (Array (_ BitVec 32) ValueCell!10580)) (size!29493 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60301)

(declare-fun mapDefault!35194 () ValueCell!10580)

