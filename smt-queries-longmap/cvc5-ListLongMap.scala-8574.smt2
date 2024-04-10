; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104652 () Bool)

(assert start!104652)

(declare-fun res!832556 () Bool)

(declare-fun e!707974 () Bool)

(assert (=> start!104652 (=> (not res!832556) (not e!707974))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104652 (= res!832556 (validMask!0 mask!1466))))

(assert (=> start!104652 e!707974))

(assert (=> start!104652 true))

(declare-datatypes ((array!80454 0))(
  ( (array!80455 (arr!38796 (Array (_ BitVec 32) (_ BitVec 64))) (size!39332 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80454)

(declare-fun array_inv!29619 (array!80454) Bool)

(assert (=> start!104652 (array_inv!29619 _keys!1118)))

(declare-datatypes ((V!47207 0))(
  ( (V!47208 (val!15753 Int)) )
))
(declare-datatypes ((ValueCell!14927 0))(
  ( (ValueCellFull!14927 (v!18449 V!47207)) (EmptyCell!14927) )
))
(declare-datatypes ((array!80456 0))(
  ( (array!80457 (arr!38797 (Array (_ BitVec 32) ValueCell!14927)) (size!39333 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80456)

(declare-fun e!707976 () Bool)

(declare-fun array_inv!29620 (array!80456) Bool)

(assert (=> start!104652 (and (array_inv!29620 _values!914) e!707976)))

(declare-fun b!1247811 () Bool)

(assert (=> b!1247811 (= e!707974 (bvsgt #b00000000000000000000000000000000 (size!39332 _keys!1118)))))

(declare-fun b!1247812 () Bool)

(declare-fun e!707973 () Bool)

(declare-fun mapRes!48826 () Bool)

(assert (=> b!1247812 (= e!707976 (and e!707973 mapRes!48826))))

(declare-fun condMapEmpty!48826 () Bool)

(declare-fun mapDefault!48826 () ValueCell!14927)

