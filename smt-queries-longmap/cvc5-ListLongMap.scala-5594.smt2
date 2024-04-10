; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73348 () Bool)

(assert start!73348)

(declare-fun b_free!14263 () Bool)

(declare-fun b_next!14263 () Bool)

(assert (=> start!73348 (= b_free!14263 (not b_next!14263))))

(declare-fun tp!50292 () Bool)

(declare-fun b_and!23619 () Bool)

(assert (=> start!73348 (= tp!50292 b_and!23619)))

(declare-fun b!855865 () Bool)

(declare-fun res!581266 () Bool)

(declare-fun e!477117 () Bool)

(assert (=> b!855865 (=> (not res!581266) (not e!477117))))

(declare-datatypes ((array!48994 0))(
  ( (array!48995 (arr!23528 (Array (_ BitVec 32) (_ BitVec 64))) (size!23968 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48994)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48994 (_ BitVec 32)) Bool)

(assert (=> b!855865 (= res!581266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855866 () Bool)

(declare-fun e!477115 () Bool)

(declare-fun e!477118 () Bool)

(declare-fun mapRes!26198 () Bool)

(assert (=> b!855866 (= e!477115 (and e!477118 mapRes!26198))))

(declare-fun condMapEmpty!26198 () Bool)

(declare-datatypes ((V!26913 0))(
  ( (V!26914 (val!8247 Int)) )
))
(declare-datatypes ((ValueCell!7760 0))(
  ( (ValueCellFull!7760 (v!10672 V!26913)) (EmptyCell!7760) )
))
(declare-datatypes ((array!48996 0))(
  ( (array!48997 (arr!23529 (Array (_ BitVec 32) ValueCell!7760)) (size!23969 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48996)

(declare-fun mapDefault!26198 () ValueCell!7760)

