; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99706 () Bool)

(assert start!99706)

(declare-fun b_free!25285 () Bool)

(declare-fun b_next!25285 () Bool)

(assert (=> start!99706 (= b_free!25285 (not b_next!25285))))

(declare-fun tp!88569 () Bool)

(declare-fun b_and!41437 () Bool)

(assert (=> start!99706 (= tp!88569 b_and!41437)))

(declare-fun b!1183121 () Bool)

(declare-fun e!672661 () Bool)

(declare-fun tp_is_empty!29815 () Bool)

(assert (=> b!1183121 (= e!672661 tp_is_empty!29815)))

(declare-fun b!1183122 () Bool)

(declare-fun e!672667 () Bool)

(declare-fun e!672670 () Bool)

(declare-fun mapRes!46550 () Bool)

(assert (=> b!1183122 (= e!672667 (and e!672670 mapRes!46550))))

(declare-fun condMapEmpty!46550 () Bool)

(declare-datatypes ((V!44881 0))(
  ( (V!44882 (val!14964 Int)) )
))
(declare-datatypes ((ValueCell!14198 0))(
  ( (ValueCellFull!14198 (v!17602 V!44881)) (EmptyCell!14198) )
))
(declare-datatypes ((array!76433 0))(
  ( (array!76434 (arr!36866 (Array (_ BitVec 32) ValueCell!14198)) (size!37402 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76433)

(declare-fun mapDefault!46550 () ValueCell!14198)

