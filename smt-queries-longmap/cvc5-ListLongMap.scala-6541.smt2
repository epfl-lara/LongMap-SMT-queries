; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83130 () Bool)

(assert start!83130)

(declare-fun b_free!19123 () Bool)

(declare-fun b_next!19123 () Bool)

(assert (=> start!83130 (= b_free!19123 (not b_next!19123))))

(declare-fun tp!66647 () Bool)

(declare-fun b_and!30611 () Bool)

(assert (=> start!83130 (= tp!66647 b_and!30611)))

(declare-fun res!649074 () Bool)

(declare-fun e!546722 () Bool)

(assert (=> start!83130 (=> (not res!649074) (not e!546722))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83130 (= res!649074 (validMask!0 mask!2147))))

(assert (=> start!83130 e!546722))

(assert (=> start!83130 true))

(declare-datatypes ((V!34345 0))(
  ( (V!34346 (val!11061 Int)) )
))
(declare-datatypes ((ValueCell!10529 0))(
  ( (ValueCellFull!10529 (v!13620 V!34345)) (EmptyCell!10529) )
))
(declare-datatypes ((array!60105 0))(
  ( (array!60106 (arr!28916 (Array (_ BitVec 32) ValueCell!10529)) (size!29395 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60105)

(declare-fun e!546723 () Bool)

(declare-fun array_inv!22383 (array!60105) Bool)

(assert (=> start!83130 (and (array_inv!22383 _values!1425) e!546723)))

(declare-fun tp_is_empty!22021 () Bool)

(assert (=> start!83130 tp_is_empty!22021))

(assert (=> start!83130 tp!66647))

(declare-datatypes ((array!60107 0))(
  ( (array!60108 (arr!28917 (Array (_ BitVec 32) (_ BitVec 64))) (size!29396 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60107)

(declare-fun array_inv!22384 (array!60107) Bool)

(assert (=> start!83130 (array_inv!22384 _keys!1717)))

(declare-fun b!969755 () Bool)

(declare-fun e!546720 () Bool)

(declare-fun mapRes!35041 () Bool)

(assert (=> b!969755 (= e!546723 (and e!546720 mapRes!35041))))

(declare-fun condMapEmpty!35041 () Bool)

(declare-fun mapDefault!35041 () ValueCell!10529)

