; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73514 () Bool)

(assert start!73514)

(declare-fun b_free!14429 () Bool)

(declare-fun b_next!14429 () Bool)

(assert (=> start!73514 (= b_free!14429 (not b_next!14429))))

(declare-fun tp!50791 () Bool)

(declare-fun b_and!23837 () Bool)

(assert (=> start!73514 (= tp!50791 b_and!23837)))

(declare-fun b!859022 () Bool)

(declare-fun res!583624 () Bool)

(declare-fun e!478729 () Bool)

(assert (=> b!859022 (=> (not res!583624) (not e!478729))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859022 (= res!583624 (validKeyInArray!0 k!854))))

(declare-fun b!859023 () Bool)

(declare-fun e!478732 () Bool)

(declare-fun e!478725 () Bool)

(declare-fun mapRes!26447 () Bool)

(assert (=> b!859023 (= e!478732 (and e!478725 mapRes!26447))))

(declare-fun condMapEmpty!26447 () Bool)

(declare-datatypes ((V!27133 0))(
  ( (V!27134 (val!8330 Int)) )
))
(declare-datatypes ((ValueCell!7843 0))(
  ( (ValueCellFull!7843 (v!10755 V!27133)) (EmptyCell!7843) )
))
(declare-datatypes ((array!49312 0))(
  ( (array!49313 (arr!23687 (Array (_ BitVec 32) ValueCell!7843)) (size!24127 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49312)

(declare-fun mapDefault!26447 () ValueCell!7843)

