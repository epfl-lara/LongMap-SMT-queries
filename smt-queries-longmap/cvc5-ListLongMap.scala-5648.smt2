; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73672 () Bool)

(assert start!73672)

(declare-fun b_free!14587 () Bool)

(declare-fun b_next!14587 () Bool)

(assert (=> start!73672 (= b_free!14587 (not b_next!14587))))

(declare-fun tp!51264 () Bool)

(declare-fun b_and!24153 () Bool)

(assert (=> start!73672 (= tp!51264 b_and!24153)))

(declare-fun b!862925 () Bool)

(declare-fun e!480757 () Bool)

(declare-fun e!480755 () Bool)

(declare-fun mapRes!26684 () Bool)

(assert (=> b!862925 (= e!480757 (and e!480755 mapRes!26684))))

(declare-fun condMapEmpty!26684 () Bool)

(declare-datatypes ((V!27345 0))(
  ( (V!27346 (val!8409 Int)) )
))
(declare-datatypes ((ValueCell!7922 0))(
  ( (ValueCellFull!7922 (v!10834 V!27345)) (EmptyCell!7922) )
))
(declare-datatypes ((array!49610 0))(
  ( (array!49611 (arr!23836 (Array (_ BitVec 32) ValueCell!7922)) (size!24276 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49610)

(declare-fun mapDefault!26684 () ValueCell!7922)

