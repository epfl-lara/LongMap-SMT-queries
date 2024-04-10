; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82212 () Bool)

(assert start!82212)

(declare-fun b_free!18485 () Bool)

(declare-fun b_next!18485 () Bool)

(assert (=> start!82212 (= b_free!18485 (not b_next!18485))))

(declare-fun tp!64415 () Bool)

(declare-fun b_and!29973 () Bool)

(assert (=> start!82212 (= tp!64415 b_and!29973)))

(declare-fun b!958226 () Bool)

(declare-fun e!540207 () Bool)

(declare-fun e!540208 () Bool)

(declare-fun mapRes!33766 () Bool)

(assert (=> b!958226 (= e!540207 (and e!540208 mapRes!33766))))

(declare-fun condMapEmpty!33766 () Bool)

(declare-datatypes ((V!33237 0))(
  ( (V!33238 (val!10646 Int)) )
))
(declare-datatypes ((ValueCell!10114 0))(
  ( (ValueCellFull!10114 (v!13203 V!33237)) (EmptyCell!10114) )
))
(declare-datatypes ((array!58485 0))(
  ( (array!58486 (arr!28116 (Array (_ BitVec 32) ValueCell!10114)) (size!28595 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58485)

(declare-fun mapDefault!33766 () ValueCell!10114)

