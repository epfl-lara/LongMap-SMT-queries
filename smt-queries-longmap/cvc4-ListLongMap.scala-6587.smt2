; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83410 () Bool)

(assert start!83410)

(declare-fun b_free!19403 () Bool)

(declare-fun b_next!19403 () Bool)

(assert (=> start!83410 (= b_free!19403 (not b_next!19403))))

(declare-fun tp!67487 () Bool)

(declare-fun b_and!31005 () Bool)

(assert (=> start!83410 (= tp!67487 b_and!31005)))

(declare-fun b!974134 () Bool)

(declare-fun res!652076 () Bool)

(declare-fun e!549075 () Bool)

(assert (=> b!974134 (=> (not res!652076) (not e!549075))))

(declare-datatypes ((array!60643 0))(
  ( (array!60644 (arr!29185 (Array (_ BitVec 32) (_ BitVec 64))) (size!29664 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60643)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60643 (_ BitVec 32)) Bool)

(assert (=> b!974134 (= res!652076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974135 () Bool)

(declare-fun e!549073 () Bool)

(declare-fun tp_is_empty!22301 () Bool)

(assert (=> b!974135 (= e!549073 tp_is_empty!22301)))

(declare-fun b!974136 () Bool)

(declare-fun e!549074 () Bool)

(assert (=> b!974136 (= e!549074 tp_is_empty!22301)))

(declare-fun b!974138 () Bool)

(declare-fun e!549076 () Bool)

(declare-fun mapRes!35461 () Bool)

(assert (=> b!974138 (= e!549076 (and e!549074 mapRes!35461))))

(declare-fun condMapEmpty!35461 () Bool)

(declare-datatypes ((V!34717 0))(
  ( (V!34718 (val!11201 Int)) )
))
(declare-datatypes ((ValueCell!10669 0))(
  ( (ValueCellFull!10669 (v!13760 V!34717)) (EmptyCell!10669) )
))
(declare-datatypes ((array!60645 0))(
  ( (array!60646 (arr!29186 (Array (_ BitVec 32) ValueCell!10669)) (size!29665 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60645)

(declare-fun mapDefault!35461 () ValueCell!10669)

