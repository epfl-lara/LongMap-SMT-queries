; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84080 () Bool)

(assert start!84080)

(declare-fun b_free!19835 () Bool)

(declare-fun b_next!19835 () Bool)

(assert (=> start!84080 (= b_free!19835 (not b_next!19835))))

(declare-fun tp!69027 () Bool)

(declare-fun b_and!31753 () Bool)

(assert (=> start!84080 (= tp!69027 b_and!31753)))

(declare-fun b!983154 () Bool)

(declare-fun res!657934 () Bool)

(declare-fun e!554162 () Bool)

(assert (=> b!983154 (=> (not res!657934) (not e!554162))))

(declare-datatypes ((array!61755 0))(
  ( (array!61756 (arr!29735 (Array (_ BitVec 32) (_ BitVec 64))) (size!30214 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61755)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61755 (_ BitVec 32)) Bool)

(assert (=> b!983154 (= res!657934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983155 () Bool)

(declare-fun e!554163 () Bool)

(declare-fun e!554165 () Bool)

(declare-fun mapRes!36353 () Bool)

(assert (=> b!983155 (= e!554163 (and e!554165 mapRes!36353))))

(declare-fun condMapEmpty!36353 () Bool)

(declare-datatypes ((V!35493 0))(
  ( (V!35494 (val!11492 Int)) )
))
(declare-datatypes ((ValueCell!10960 0))(
  ( (ValueCellFull!10960 (v!14054 V!35493)) (EmptyCell!10960) )
))
(declare-datatypes ((array!61757 0))(
  ( (array!61758 (arr!29736 (Array (_ BitVec 32) ValueCell!10960)) (size!30215 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61757)

(declare-fun mapDefault!36353 () ValueCell!10960)

