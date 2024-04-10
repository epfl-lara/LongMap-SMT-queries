; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41152 () Bool)

(assert start!41152)

(declare-fun b_free!11021 () Bool)

(declare-fun b_next!11021 () Bool)

(assert (=> start!41152 (= b_free!11021 (not b_next!11021))))

(declare-fun tp!38899 () Bool)

(declare-fun b_and!19281 () Bool)

(assert (=> start!41152 (= tp!38899 b_and!19281)))

(declare-fun b!459460 () Bool)

(declare-fun res!274592 () Bool)

(declare-fun e!268162 () Bool)

(assert (=> b!459460 (=> (not res!274592) (not e!268162))))

(declare-datatypes ((array!28519 0))(
  ( (array!28520 (arr!13700 (Array (_ BitVec 32) (_ BitVec 64))) (size!14052 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28519)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28519 (_ BitVec 32)) Bool)

(assert (=> b!459460 (= res!274592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459461 () Bool)

(declare-fun res!274590 () Bool)

(declare-fun e!268166 () Bool)

(assert (=> b!459461 (=> (not res!274590) (not e!268166))))

(declare-fun lt!207876 () array!28519)

(declare-datatypes ((List!8280 0))(
  ( (Nil!8277) (Cons!8276 (h!9132 (_ BitVec 64)) (t!14180 List!8280)) )
))
(declare-fun arrayNoDuplicates!0 (array!28519 (_ BitVec 32) List!8280) Bool)

(assert (=> b!459461 (= res!274590 (arrayNoDuplicates!0 lt!207876 #b00000000000000000000000000000000 Nil!8277))))

(declare-fun b!459462 () Bool)

(declare-datatypes ((Unit!13355 0))(
  ( (Unit!13356) )
))
(declare-fun e!268163 () Unit!13355)

(declare-fun Unit!13357 () Unit!13355)

(assert (=> b!459462 (= e!268163 Unit!13357)))

(declare-fun b!459463 () Bool)

(declare-fun e!268165 () Bool)

(declare-fun tp_is_empty!12359 () Bool)

(assert (=> b!459463 (= e!268165 tp_is_empty!12359)))

(declare-fun b!459464 () Bool)

(declare-fun e!268164 () Bool)

(declare-fun mapRes!20188 () Bool)

(assert (=> b!459464 (= e!268164 (and e!268165 mapRes!20188))))

(declare-fun condMapEmpty!20188 () Bool)

(declare-datatypes ((V!17583 0))(
  ( (V!17584 (val!6224 Int)) )
))
(declare-datatypes ((ValueCell!5836 0))(
  ( (ValueCellFull!5836 (v!8502 V!17583)) (EmptyCell!5836) )
))
(declare-datatypes ((array!28521 0))(
  ( (array!28522 (arr!13701 (Array (_ BitVec 32) ValueCell!5836)) (size!14053 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28521)

(declare-fun mapDefault!20188 () ValueCell!5836)

