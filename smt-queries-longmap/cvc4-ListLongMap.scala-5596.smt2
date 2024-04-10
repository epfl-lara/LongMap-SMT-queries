; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73364 () Bool)

(assert start!73364)

(declare-fun b_free!14279 () Bool)

(declare-fun b_next!14279 () Bool)

(assert (=> start!73364 (= b_free!14279 (not b_next!14279))))

(declare-fun tp!50340 () Bool)

(declare-fun b_and!23635 () Bool)

(assert (=> start!73364 (= tp!50340 b_and!23635)))

(declare-fun mapIsEmpty!26222 () Bool)

(declare-fun mapRes!26222 () Bool)

(assert (=> mapIsEmpty!26222 mapRes!26222))

(declare-fun b!856146 () Bool)

(declare-fun res!581477 () Bool)

(declare-fun e!477256 () Bool)

(assert (=> b!856146 (=> (not res!581477) (not e!477256))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856146 (= res!581477 (validMask!0 mask!1196))))

(declare-fun b!856147 () Bool)

(declare-fun e!477253 () Bool)

(declare-fun e!477254 () Bool)

(assert (=> b!856147 (= e!477253 (and e!477254 mapRes!26222))))

(declare-fun condMapEmpty!26222 () Bool)

(declare-datatypes ((V!26933 0))(
  ( (V!26934 (val!8255 Int)) )
))
(declare-datatypes ((ValueCell!7768 0))(
  ( (ValueCellFull!7768 (v!10680 V!26933)) (EmptyCell!7768) )
))
(declare-datatypes ((array!49024 0))(
  ( (array!49025 (arr!23543 (Array (_ BitVec 32) ValueCell!7768)) (size!23983 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49024)

(declare-fun mapDefault!26222 () ValueCell!7768)

