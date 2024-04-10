; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40896 () Bool)

(assert start!40896)

(declare-fun b_free!10831 () Bool)

(declare-fun b_next!10831 () Bool)

(assert (=> start!40896 (= b_free!10831 (not b_next!10831))))

(declare-fun tp!38319 () Bool)

(declare-fun b_and!18973 () Bool)

(assert (=> start!40896 (= tp!38319 b_and!18973)))

(declare-fun b!454322 () Bool)

(declare-fun e!265834 () Bool)

(declare-fun e!265835 () Bool)

(assert (=> b!454322 (= e!265834 e!265835)))

(declare-fun res!270681 () Bool)

(assert (=> b!454322 (=> (not res!270681) (not e!265835))))

(declare-datatypes ((array!28143 0))(
  ( (array!28144 (arr!13515 (Array (_ BitVec 32) (_ BitVec 64))) (size!13867 (_ BitVec 32))) )
))
(declare-fun lt!206114 () array!28143)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28143 (_ BitVec 32)) Bool)

(assert (=> b!454322 (= res!270681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206114 mask!1025))))

(declare-fun _keys!709 () array!28143)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454322 (= lt!206114 (array!28144 (store (arr!13515 _keys!709) i!563 k!794) (size!13867 _keys!709)))))

(declare-fun b!454323 () Bool)

(declare-fun res!270679 () Bool)

(assert (=> b!454323 (=> (not res!270679) (not e!265834))))

(declare-datatypes ((List!8134 0))(
  ( (Nil!8131) (Cons!8130 (h!8986 (_ BitVec 64)) (t!13962 List!8134)) )
))
(declare-fun arrayNoDuplicates!0 (array!28143 (_ BitVec 32) List!8134) Bool)

(assert (=> b!454323 (= res!270679 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8131))))

(declare-fun b!454325 () Bool)

(declare-fun res!270678 () Bool)

(assert (=> b!454325 (=> (not res!270678) (not e!265834))))

(assert (=> b!454325 (= res!270678 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13867 _keys!709))))))

(declare-fun b!454326 () Bool)

(declare-fun e!265832 () Bool)

(declare-fun e!265837 () Bool)

(declare-fun mapRes!19894 () Bool)

(assert (=> b!454326 (= e!265832 (and e!265837 mapRes!19894))))

(declare-fun condMapEmpty!19894 () Bool)

(declare-datatypes ((V!17331 0))(
  ( (V!17332 (val!6129 Int)) )
))
(declare-datatypes ((ValueCell!5741 0))(
  ( (ValueCellFull!5741 (v!8395 V!17331)) (EmptyCell!5741) )
))
(declare-datatypes ((array!28145 0))(
  ( (array!28146 (arr!13516 (Array (_ BitVec 32) ValueCell!5741)) (size!13868 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28145)

(declare-fun mapDefault!19894 () ValueCell!5741)

