; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73586 () Bool)

(assert start!73586)

(declare-fun b_free!14501 () Bool)

(declare-fun b_next!14501 () Bool)

(assert (=> start!73586 (= b_free!14501 (not b_next!14501))))

(declare-fun tp!51007 () Bool)

(declare-fun b_and!23981 () Bool)

(assert (=> start!73586 (= tp!51007 b_and!23981)))

(declare-fun b!860857 () Bool)

(declare-fun res!585049 () Bool)

(declare-fun e!479674 () Bool)

(assert (=> b!860857 (=> (not res!585049) (not e!479674))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860857 (= res!585049 (validKeyInArray!0 k!854))))

(declare-fun b!860858 () Bool)

(declare-fun e!479677 () Bool)

(declare-fun e!479670 () Bool)

(declare-fun mapRes!26555 () Bool)

(assert (=> b!860858 (= e!479677 (and e!479670 mapRes!26555))))

(declare-fun condMapEmpty!26555 () Bool)

(declare-datatypes ((V!27229 0))(
  ( (V!27230 (val!8366 Int)) )
))
(declare-datatypes ((ValueCell!7879 0))(
  ( (ValueCellFull!7879 (v!10791 V!27229)) (EmptyCell!7879) )
))
(declare-datatypes ((array!49448 0))(
  ( (array!49449 (arr!23755 (Array (_ BitVec 32) ValueCell!7879)) (size!24195 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49448)

(declare-fun mapDefault!26555 () ValueCell!7879)

