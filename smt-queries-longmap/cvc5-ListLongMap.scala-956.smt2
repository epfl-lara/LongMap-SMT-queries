; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20832 () Bool)

(assert start!20832)

(declare-fun b_free!5485 () Bool)

(declare-fun b_next!5485 () Bool)

(assert (=> start!20832 (= b_free!5485 (not b_next!5485))))

(declare-fun tp!19495 () Bool)

(declare-fun b_and!12231 () Bool)

(assert (=> start!20832 (= tp!19495 b_and!12231)))

(declare-fun res!101751 () Bool)

(declare-fun e!136196 () Bool)

(assert (=> start!20832 (=> (not res!101751) (not e!136196))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20832 (= res!101751 (validMask!0 mask!1149))))

(assert (=> start!20832 e!136196))

(declare-datatypes ((V!6777 0))(
  ( (V!6778 (val!2718 Int)) )
))
(declare-datatypes ((ValueCell!2330 0))(
  ( (ValueCellFull!2330 (v!4688 V!6777)) (EmptyCell!2330) )
))
(declare-datatypes ((array!9897 0))(
  ( (array!9898 (arr!4699 (Array (_ BitVec 32) ValueCell!2330)) (size!5024 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9897)

(declare-fun e!136199 () Bool)

(declare-fun array_inv!3115 (array!9897) Bool)

(assert (=> start!20832 (and (array_inv!3115 _values!649) e!136199)))

(assert (=> start!20832 true))

(declare-fun tp_is_empty!5347 () Bool)

(assert (=> start!20832 tp_is_empty!5347))

(declare-datatypes ((array!9899 0))(
  ( (array!9900 (arr!4700 (Array (_ BitVec 32) (_ BitVec 64))) (size!5025 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9899)

(declare-fun array_inv!3116 (array!9899) Bool)

(assert (=> start!20832 (array_inv!3116 _keys!825)))

(assert (=> start!20832 tp!19495))

(declare-fun b!208940 () Bool)

(declare-fun e!136198 () Bool)

(declare-fun mapRes!9089 () Bool)

(assert (=> b!208940 (= e!136199 (and e!136198 mapRes!9089))))

(declare-fun condMapEmpty!9089 () Bool)

(declare-fun mapDefault!9089 () ValueCell!2330)

