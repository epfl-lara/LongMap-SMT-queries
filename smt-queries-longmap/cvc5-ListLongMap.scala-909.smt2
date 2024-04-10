; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20550 () Bool)

(assert start!20550)

(declare-fun b_free!5209 () Bool)

(declare-fun b_next!5209 () Bool)

(assert (=> start!20550 (= b_free!5209 (not b_next!5209))))

(declare-fun tp!18659 () Bool)

(declare-fun b_and!11955 () Bool)

(assert (=> start!20550 (= tp!18659 b_and!11955)))

(declare-fun b!204402 () Bool)

(declare-fun res!98480 () Bool)

(declare-fun e!133745 () Bool)

(assert (=> b!204402 (=> (not res!98480) (not e!133745))))

(declare-datatypes ((array!9347 0))(
  ( (array!9348 (arr!4424 (Array (_ BitVec 32) (_ BitVec 64))) (size!4749 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9347)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9347 (_ BitVec 32)) Bool)

(assert (=> b!204402 (= res!98480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204403 () Bool)

(declare-fun res!98479 () Bool)

(assert (=> b!204403 (=> (not res!98479) (not e!133745))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204403 (= res!98479 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8666 () Bool)

(declare-fun mapRes!8666 () Bool)

(assert (=> mapIsEmpty!8666 mapRes!8666))

(declare-fun b!204404 () Bool)

(declare-fun e!133748 () Bool)

(declare-fun e!133742 () Bool)

(assert (=> b!204404 (= e!133748 (and e!133742 mapRes!8666))))

(declare-fun condMapEmpty!8666 () Bool)

(declare-datatypes ((V!6401 0))(
  ( (V!6402 (val!2577 Int)) )
))
(declare-datatypes ((ValueCell!2189 0))(
  ( (ValueCellFull!2189 (v!4547 V!6401)) (EmptyCell!2189) )
))
(declare-datatypes ((array!9349 0))(
  ( (array!9350 (arr!4425 (Array (_ BitVec 32) ValueCell!2189)) (size!4750 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9349)

(declare-fun mapDefault!8666 () ValueCell!2189)

