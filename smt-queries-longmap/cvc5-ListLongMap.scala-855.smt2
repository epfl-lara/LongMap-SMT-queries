; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20226 () Bool)

(assert start!20226)

(declare-fun b_free!4885 () Bool)

(declare-fun b_next!4885 () Bool)

(assert (=> start!20226 (= b_free!4885 (not b_next!4885))))

(declare-fun tp!17687 () Bool)

(declare-fun b_and!11631 () Bool)

(assert (=> start!20226 (= tp!17687 b_and!11631)))

(declare-fun b!198824 () Bool)

(declare-fun e!130615 () Bool)

(declare-fun tp_is_empty!4741 () Bool)

(assert (=> b!198824 (= e!130615 tp_is_empty!4741)))

(declare-fun b!198825 () Bool)

(declare-fun res!94357 () Bool)

(declare-fun e!130619 () Bool)

(assert (=> b!198825 (=> (not res!94357) (not e!130619))))

(declare-datatypes ((array!8723 0))(
  ( (array!8724 (arr!4112 (Array (_ BitVec 32) (_ BitVec 64))) (size!4437 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8723)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8723 (_ BitVec 32)) Bool)

(assert (=> b!198825 (= res!94357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94362 () Bool)

(assert (=> start!20226 (=> (not res!94362) (not e!130619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20226 (= res!94362 (validMask!0 mask!1149))))

(assert (=> start!20226 e!130619))

(declare-datatypes ((V!5969 0))(
  ( (V!5970 (val!2415 Int)) )
))
(declare-datatypes ((ValueCell!2027 0))(
  ( (ValueCellFull!2027 (v!4385 V!5969)) (EmptyCell!2027) )
))
(declare-datatypes ((array!8725 0))(
  ( (array!8726 (arr!4113 (Array (_ BitVec 32) ValueCell!2027)) (size!4438 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8725)

(declare-fun e!130616 () Bool)

(declare-fun array_inv!2693 (array!8725) Bool)

(assert (=> start!20226 (and (array_inv!2693 _values!649) e!130616)))

(assert (=> start!20226 true))

(assert (=> start!20226 tp_is_empty!4741))

(declare-fun array_inv!2694 (array!8723) Bool)

(assert (=> start!20226 (array_inv!2694 _keys!825)))

(assert (=> start!20226 tp!17687))

(declare-fun b!198826 () Bool)

(declare-fun res!94359 () Bool)

(assert (=> b!198826 (=> (not res!94359) (not e!130619))))

(declare-datatypes ((List!2574 0))(
  ( (Nil!2571) (Cons!2570 (h!3212 (_ BitVec 64)) (t!7505 List!2574)) )
))
(declare-fun arrayNoDuplicates!0 (array!8723 (_ BitVec 32) List!2574) Bool)

(assert (=> b!198826 (= res!94359 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2571))))

(declare-fun b!198827 () Bool)

(declare-fun res!94363 () Bool)

(assert (=> b!198827 (=> (not res!94363) (not e!130619))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198827 (= res!94363 (validKeyInArray!0 k!843))))

(declare-fun b!198828 () Bool)

(declare-fun e!130617 () Bool)

(declare-fun mapRes!8180 () Bool)

(assert (=> b!198828 (= e!130616 (and e!130617 mapRes!8180))))

(declare-fun condMapEmpty!8180 () Bool)

(declare-fun mapDefault!8180 () ValueCell!2027)

