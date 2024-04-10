; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74230 () Bool)

(assert start!74230)

(declare-fun b!873242 () Bool)

(declare-fun e!486295 () Bool)

(declare-fun e!486294 () Bool)

(declare-fun mapRes!27482 () Bool)

(assert (=> b!873242 (= e!486295 (and e!486294 mapRes!27482))))

(declare-fun condMapEmpty!27482 () Bool)

(declare-datatypes ((V!28049 0))(
  ( (V!28050 (val!8673 Int)) )
))
(declare-datatypes ((ValueCell!8186 0))(
  ( (ValueCellFull!8186 (v!11102 V!28049)) (EmptyCell!8186) )
))
(declare-datatypes ((array!50630 0))(
  ( (array!50631 (arr!24344 (Array (_ BitVec 32) ValueCell!8186)) (size!24784 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50630)

(declare-fun mapDefault!27482 () ValueCell!8186)

