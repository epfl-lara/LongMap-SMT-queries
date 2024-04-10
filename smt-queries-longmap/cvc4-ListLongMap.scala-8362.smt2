; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101758 () Bool)

(assert start!101758)

(declare-fun b_free!26447 () Bool)

(declare-fun b_next!26447 () Bool)

(assert (=> start!101758 (= b_free!26447 (not b_next!26447))))

(declare-fun tp!92387 () Bool)

(declare-fun b_and!44155 () Bool)

(assert (=> start!101758 (= tp!92387 b_and!44155)))

(declare-fun b!1225319 () Bool)

(declare-fun e!695944 () Bool)

(declare-fun e!695935 () Bool)

(declare-fun mapRes!48625 () Bool)

(assert (=> b!1225319 (= e!695944 (and e!695935 mapRes!48625))))

(declare-fun condMapEmpty!48625 () Bool)

(declare-datatypes ((V!46661 0))(
  ( (V!46662 (val!15632 Int)) )
))
(declare-datatypes ((ValueCell!14866 0))(
  ( (ValueCellFull!14866 (v!18294 V!46661)) (EmptyCell!14866) )
))
(declare-datatypes ((array!79083 0))(
  ( (array!79084 (arr!38168 (Array (_ BitVec 32) ValueCell!14866)) (size!38704 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79083)

(declare-fun mapDefault!48625 () ValueCell!14866)

