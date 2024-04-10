; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105268 () Bool)

(assert start!105268)

(declare-fun b_free!26963 () Bool)

(declare-fun b_next!26963 () Bool)

(assert (=> start!105268 (= b_free!26963 (not b_next!26963))))

(declare-fun tp!94397 () Bool)

(declare-fun b_and!44789 () Bool)

(assert (=> start!105268 (= tp!94397 b_and!44789)))

(declare-fun mapIsEmpty!49576 () Bool)

(declare-fun mapRes!49576 () Bool)

(assert (=> mapIsEmpty!49576 mapRes!49576))

(declare-fun b!1254365 () Bool)

(declare-fun e!712754 () Bool)

(declare-fun e!712753 () Bool)

(assert (=> b!1254365 (= e!712754 (and e!712753 mapRes!49576))))

(declare-fun condMapEmpty!49576 () Bool)

(declare-datatypes ((V!47851 0))(
  ( (V!47852 (val!15995 Int)) )
))
(declare-datatypes ((ValueCell!15169 0))(
  ( (ValueCellFull!15169 (v!18694 V!47851)) (EmptyCell!15169) )
))
(declare-datatypes ((array!81386 0))(
  ( (array!81387 (arr!39254 (Array (_ BitVec 32) ValueCell!15169)) (size!39790 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81386)

(declare-fun mapDefault!49576 () ValueCell!15169)

