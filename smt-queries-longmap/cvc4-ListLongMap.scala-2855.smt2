; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41164 () Bool)

(assert start!41164)

(declare-fun b_free!11033 () Bool)

(declare-fun b_next!11033 () Bool)

(assert (=> start!41164 (= b_free!11033 (not b_next!11033))))

(declare-fun tp!38934 () Bool)

(declare-fun b_and!19305 () Bool)

(assert (=> start!41164 (= tp!38934 b_and!19305)))

(declare-fun b!459814 () Bool)

(declare-datatypes ((Unit!13369 0))(
  ( (Unit!13370) )
))
(declare-fun e!268324 () Unit!13369)

(declare-fun Unit!13371 () Unit!13369)

(assert (=> b!459814 (= e!268324 Unit!13371)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!208053 () Unit!13369)

(declare-datatypes ((array!28543 0))(
  ( (array!28544 (arr!13712 (Array (_ BitVec 32) (_ BitVec 64))) (size!14064 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28543)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13369)

(assert (=> b!459814 (= lt!208053 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459814 false))

(declare-fun b!459815 () Bool)

(declare-fun e!268323 () Bool)

(declare-fun tp_is_empty!12371 () Bool)

(assert (=> b!459815 (= e!268323 tp_is_empty!12371)))

(declare-fun b!459816 () Bool)

(declare-fun res!274838 () Bool)

(declare-fun e!268325 () Bool)

(assert (=> b!459816 (=> (not res!274838) (not e!268325))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459816 (= res!274838 (bvsle from!863 i!563))))

(declare-fun b!459817 () Bool)

(declare-fun res!274836 () Bool)

(declare-fun e!268322 () Bool)

(assert (=> b!459817 (=> (not res!274836) (not e!268322))))

(declare-datatypes ((List!8287 0))(
  ( (Nil!8284) (Cons!8283 (h!9139 (_ BitVec 64)) (t!14199 List!8287)) )
))
(declare-fun arrayNoDuplicates!0 (array!28543 (_ BitVec 32) List!8287) Bool)

(assert (=> b!459817 (= res!274836 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8284))))

(declare-fun b!459818 () Bool)

(declare-fun e!268328 () Bool)

(assert (=> b!459818 (= e!268328 tp_is_empty!12371)))

(declare-fun b!459819 () Bool)

(declare-fun res!274845 () Bool)

(assert (=> b!459819 (=> (not res!274845) (not e!268322))))

(declare-fun arrayContainsKey!0 (array!28543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459819 (= res!274845 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!459820 () Bool)

(declare-fun Unit!13372 () Unit!13369)

(assert (=> b!459820 (= e!268324 Unit!13372)))

(declare-fun b!459821 () Bool)

(assert (=> b!459821 (= e!268322 e!268325)))

(declare-fun res!274835 () Bool)

(assert (=> b!459821 (=> (not res!274835) (not e!268325))))

(declare-fun lt!208054 () array!28543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28543 (_ BitVec 32)) Bool)

(assert (=> b!459821 (= res!274835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208054 mask!1025))))

(assert (=> b!459821 (= lt!208054 (array!28544 (store (arr!13712 _keys!709) i!563 k!794) (size!14064 _keys!709)))))

(declare-fun b!459822 () Bool)

(declare-fun res!274837 () Bool)

(assert (=> b!459822 (=> (not res!274837) (not e!268322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459822 (= res!274837 (validMask!0 mask!1025))))

(declare-fun b!459823 () Bool)

(declare-fun e!268327 () Bool)

(declare-fun mapRes!20206 () Bool)

(assert (=> b!459823 (= e!268327 (and e!268323 mapRes!20206))))

(declare-fun condMapEmpty!20206 () Bool)

(declare-datatypes ((V!17599 0))(
  ( (V!17600 (val!6230 Int)) )
))
(declare-datatypes ((ValueCell!5842 0))(
  ( (ValueCellFull!5842 (v!8508 V!17599)) (EmptyCell!5842) )
))
(declare-datatypes ((array!28545 0))(
  ( (array!28546 (arr!13713 (Array (_ BitVec 32) ValueCell!5842)) (size!14065 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28545)

(declare-fun mapDefault!20206 () ValueCell!5842)

