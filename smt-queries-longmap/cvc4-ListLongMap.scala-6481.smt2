; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82730 () Bool)

(assert start!82730)

(declare-fun b_free!18863 () Bool)

(declare-fun b_next!18863 () Bool)

(assert (=> start!82730 (= b_free!18863 (not b_next!18863))))

(declare-fun tp!65708 () Bool)

(declare-fun b_and!30351 () Bool)

(assert (=> start!82730 (= tp!65708 b_and!30351)))

(declare-fun b!964892 () Bool)

(declare-fun e!543936 () Bool)

(declare-fun e!543940 () Bool)

(declare-fun mapRes!34492 () Bool)

(assert (=> b!964892 (= e!543936 (and e!543940 mapRes!34492))))

(declare-fun condMapEmpty!34492 () Bool)

(declare-datatypes ((V!33869 0))(
  ( (V!33870 (val!10883 Int)) )
))
(declare-datatypes ((ValueCell!10351 0))(
  ( (ValueCellFull!10351 (v!13441 V!33869)) (EmptyCell!10351) )
))
(declare-datatypes ((array!59417 0))(
  ( (array!59418 (arr!28577 (Array (_ BitVec 32) ValueCell!10351)) (size!29056 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59417)

(declare-fun mapDefault!34492 () ValueCell!10351)

