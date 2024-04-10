; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71028 () Bool)

(assert start!71028)

(declare-fun b_free!13231 () Bool)

(declare-fun b_next!13231 () Bool)

(assert (=> start!71028 (= b_free!13231 (not b_next!13231))))

(declare-fun tp!46446 () Bool)

(declare-fun b_and!22135 () Bool)

(assert (=> start!71028 (= tp!46446 b_and!22135)))

(declare-fun b!824812 () Bool)

(declare-fun res!562316 () Bool)

(declare-fun e!458969 () Bool)

(assert (=> b!824812 (=> (not res!562316) (not e!458969))))

(declare-datatypes ((array!46070 0))(
  ( (array!46071 (arr!22082 (Array (_ BitVec 32) (_ BitVec 64))) (size!22503 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46070)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46070 (_ BitVec 32)) Bool)

(assert (=> b!824812 (= res!562316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824813 () Bool)

(declare-fun e!458964 () Bool)

(declare-fun e!458967 () Bool)

(declare-fun mapRes!24031 () Bool)

(assert (=> b!824813 (= e!458964 (and e!458967 mapRes!24031))))

(declare-fun condMapEmpty!24031 () Bool)

(declare-datatypes ((V!24923 0))(
  ( (V!24924 (val!7518 Int)) )
))
(declare-datatypes ((ValueCell!7055 0))(
  ( (ValueCellFull!7055 (v!9951 V!24923)) (EmptyCell!7055) )
))
(declare-datatypes ((array!46072 0))(
  ( (array!46073 (arr!22083 (Array (_ BitVec 32) ValueCell!7055)) (size!22504 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46072)

(declare-fun mapDefault!24031 () ValueCell!7055)

