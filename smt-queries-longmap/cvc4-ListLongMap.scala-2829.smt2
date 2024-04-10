; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40942 () Bool)

(assert start!40942)

(declare-fun b_free!10877 () Bool)

(declare-fun b_next!10877 () Bool)

(assert (=> start!40942 (= b_free!10877 (not b_next!10877))))

(declare-fun tp!38458 () Bool)

(declare-fun b_and!19019 () Bool)

(assert (=> start!40942 (= tp!38458 b_and!19019)))

(declare-fun b!455357 () Bool)

(declare-fun res!271510 () Bool)

(declare-fun e!266250 () Bool)

(assert (=> b!455357 (=> (not res!271510) (not e!266250))))

(declare-datatypes ((array!28233 0))(
  ( (array!28234 (arr!13560 (Array (_ BitVec 32) (_ BitVec 64))) (size!13912 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28233)

(declare-datatypes ((List!8172 0))(
  ( (Nil!8169) (Cons!8168 (h!9024 (_ BitVec 64)) (t!14000 List!8172)) )
))
(declare-fun arrayNoDuplicates!0 (array!28233 (_ BitVec 32) List!8172) Bool)

(assert (=> b!455357 (= res!271510 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8169))))

(declare-fun b!455359 () Bool)

(declare-fun res!271500 () Bool)

(declare-fun e!266249 () Bool)

(assert (=> b!455359 (=> (not res!271500) (not e!266249))))

(declare-fun lt!206319 () array!28233)

(assert (=> b!455359 (= res!271500 (arrayNoDuplicates!0 lt!206319 #b00000000000000000000000000000000 Nil!8169))))

(declare-fun b!455360 () Bool)

(declare-fun e!266251 () Bool)

(declare-fun e!266246 () Bool)

(declare-fun mapRes!19963 () Bool)

(assert (=> b!455360 (= e!266251 (and e!266246 mapRes!19963))))

(declare-fun condMapEmpty!19963 () Bool)

(declare-datatypes ((V!17391 0))(
  ( (V!17392 (val!6152 Int)) )
))
(declare-datatypes ((ValueCell!5764 0))(
  ( (ValueCellFull!5764 (v!8418 V!17391)) (EmptyCell!5764) )
))
(declare-datatypes ((array!28235 0))(
  ( (array!28236 (arr!13561 (Array (_ BitVec 32) ValueCell!5764)) (size!13913 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28235)

(declare-fun mapDefault!19963 () ValueCell!5764)

