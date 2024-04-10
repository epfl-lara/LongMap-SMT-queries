; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105042 () Bool)

(assert start!105042)

(declare-fun b_free!26789 () Bool)

(declare-fun b_next!26789 () Bool)

(assert (=> start!105042 (= b_free!26789 (not b_next!26789))))

(declare-fun tp!93866 () Bool)

(declare-fun b_and!44585 () Bool)

(assert (=> start!105042 (= tp!93866 b_and!44585)))

(declare-fun mapIsEmpty!49306 () Bool)

(declare-fun mapRes!49306 () Bool)

(assert (=> mapIsEmpty!49306 mapRes!49306))

(declare-fun b!1251906 () Bool)

(declare-fun e!710964 () Bool)

(declare-fun e!710965 () Bool)

(assert (=> b!1251906 (= e!710964 (and e!710965 mapRes!49306))))

(declare-fun condMapEmpty!49306 () Bool)

(declare-datatypes ((V!47619 0))(
  ( (V!47620 (val!15908 Int)) )
))
(declare-datatypes ((ValueCell!15082 0))(
  ( (ValueCellFull!15082 (v!18606 V!47619)) (EmptyCell!15082) )
))
(declare-datatypes ((array!81048 0))(
  ( (array!81049 (arr!39088 (Array (_ BitVec 32) ValueCell!15082)) (size!39624 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81048)

(declare-fun mapDefault!49306 () ValueCell!15082)

