; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3964 () Bool)

(assert start!3964)

(declare-fun b_free!869 () Bool)

(declare-fun b_next!869 () Bool)

(assert (=> start!3964 (= b_free!869 (not b_next!869))))

(declare-fun tp!4027 () Bool)

(declare-fun b_and!1679 () Bool)

(assert (=> start!3964 (= tp!4027 b_and!1679)))

(declare-fun b!28424 () Bool)

(declare-fun e!18385 () Bool)

(declare-fun tp_is_empty!1223 () Bool)

(assert (=> b!28424 (= e!18385 tp_is_empty!1223)))

(declare-fun mapIsEmpty!1363 () Bool)

(declare-fun mapRes!1363 () Bool)

(assert (=> mapIsEmpty!1363 mapRes!1363))

(declare-fun b!28426 () Bool)

(declare-fun e!18381 () Bool)

(declare-fun e!18384 () Bool)

(assert (=> b!28426 (= e!18381 (and e!18384 mapRes!1363))))

(declare-fun condMapEmpty!1363 () Bool)

(declare-datatypes ((V!1455 0))(
  ( (V!1456 (val!638 Int)) )
))
(declare-datatypes ((ValueCell!412 0))(
  ( (ValueCellFull!412 (v!1727 V!1455)) (EmptyCell!412) )
))
(declare-datatypes ((array!1683 0))(
  ( (array!1684 (arr!795 (Array (_ BitVec 32) ValueCell!412)) (size!896 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1683)

(declare-fun mapDefault!1363 () ValueCell!412)

