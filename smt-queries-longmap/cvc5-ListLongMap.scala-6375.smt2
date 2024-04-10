; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81986 () Bool)

(assert start!81986)

(declare-fun b!956257 () Bool)

(declare-fun e!538794 () Bool)

(declare-fun tp_is_empty!21025 () Bool)

(assert (=> b!956257 (= e!538794 tp_is_empty!21025)))

(declare-fun b!956258 () Bool)

(declare-fun e!538796 () Bool)

(assert (=> b!956258 (= e!538796 tp_is_empty!21025)))

(declare-fun b!956259 () Bool)

(declare-fun e!538798 () Bool)

(assert (=> b!956259 (= e!538798 false)))

(declare-fun lt!430115 () Bool)

(declare-datatypes ((array!58149 0))(
  ( (array!58150 (arr!27954 (Array (_ BitVec 32) (_ BitVec 64))) (size!28433 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58149)

(declare-datatypes ((List!19474 0))(
  ( (Nil!19471) (Cons!19470 (h!20632 (_ BitVec 64)) (t!27835 List!19474)) )
))
(declare-fun arrayNoDuplicates!0 (array!58149 (_ BitVec 32) List!19474) Bool)

(assert (=> b!956259 (= lt!430115 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19471))))

(declare-fun mapIsEmpty!33499 () Bool)

(declare-fun mapRes!33499 () Bool)

(assert (=> mapIsEmpty!33499 mapRes!33499))

(declare-fun res!640311 () Bool)

(assert (=> start!81986 (=> (not res!640311) (not e!538798))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81986 (= res!640311 (validMask!0 mask!1823))))

(assert (=> start!81986 e!538798))

(assert (=> start!81986 true))

(declare-datatypes ((V!33017 0))(
  ( (V!33018 (val!10563 Int)) )
))
(declare-datatypes ((ValueCell!10031 0))(
  ( (ValueCellFull!10031 (v!13118 V!33017)) (EmptyCell!10031) )
))
(declare-datatypes ((array!58151 0))(
  ( (array!58152 (arr!27955 (Array (_ BitVec 32) ValueCell!10031)) (size!28434 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58151)

(declare-fun e!538797 () Bool)

(declare-fun array_inv!21691 (array!58151) Bool)

(assert (=> start!81986 (and (array_inv!21691 _values!1197) e!538797)))

(declare-fun array_inv!21692 (array!58149) Bool)

(assert (=> start!81986 (array_inv!21692 _keys!1441)))

(declare-fun b!956260 () Bool)

(assert (=> b!956260 (= e!538797 (and e!538796 mapRes!33499))))

(declare-fun condMapEmpty!33499 () Bool)

(declare-fun mapDefault!33499 () ValueCell!10031)

