; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105258 () Bool)

(assert start!105258)

(declare-fun b_free!26953 () Bool)

(declare-fun b_next!26953 () Bool)

(assert (=> start!105258 (= b_free!26953 (not b_next!26953))))

(declare-fun tp!94367 () Bool)

(declare-fun b_and!44779 () Bool)

(assert (=> start!105258 (= tp!94367 b_and!44779)))

(declare-fun b!1254245 () Bool)

(declare-fun e!712664 () Bool)

(declare-fun e!712662 () Bool)

(declare-fun mapRes!49561 () Bool)

(assert (=> b!1254245 (= e!712664 (and e!712662 mapRes!49561))))

(declare-fun condMapEmpty!49561 () Bool)

(declare-datatypes ((V!47839 0))(
  ( (V!47840 (val!15990 Int)) )
))
(declare-datatypes ((ValueCell!15164 0))(
  ( (ValueCellFull!15164 (v!18689 V!47839)) (EmptyCell!15164) )
))
(declare-datatypes ((array!81368 0))(
  ( (array!81369 (arr!39245 (Array (_ BitVec 32) ValueCell!15164)) (size!39781 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81368)

(declare-fun mapDefault!49561 () ValueCell!15164)

