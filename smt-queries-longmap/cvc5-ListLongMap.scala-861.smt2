; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20262 () Bool)

(assert start!20262)

(declare-fun b_free!4921 () Bool)

(declare-fun b_next!4921 () Bool)

(assert (=> start!20262 (= b_free!4921 (not b_next!4921))))

(declare-fun tp!17794 () Bool)

(declare-fun b_and!11667 () Bool)

(assert (=> start!20262 (= tp!17794 b_and!11667)))

(declare-fun b!199364 () Bool)

(declare-fun e!130885 () Bool)

(declare-fun tp_is_empty!4777 () Bool)

(assert (=> b!199364 (= e!130885 tp_is_empty!4777)))

(declare-fun b!199365 () Bool)

(declare-fun res!94741 () Bool)

(declare-fun e!130888 () Bool)

(assert (=> b!199365 (=> (not res!94741) (not e!130888))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8795 0))(
  ( (array!8796 (arr!4148 (Array (_ BitVec 32) (_ BitVec 64))) (size!4473 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8795)

(assert (=> b!199365 (= res!94741 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4473 _keys!825))))))

(declare-fun b!199366 () Bool)

(declare-fun res!94740 () Bool)

(assert (=> b!199366 (=> (not res!94740) (not e!130888))))

(declare-datatypes ((List!2599 0))(
  ( (Nil!2596) (Cons!2595 (h!3237 (_ BitVec 64)) (t!7530 List!2599)) )
))
(declare-fun arrayNoDuplicates!0 (array!8795 (_ BitVec 32) List!2599) Bool)

(assert (=> b!199366 (= res!94740 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2596))))

(declare-fun b!199367 () Bool)

(declare-fun e!130887 () Bool)

(declare-fun e!130889 () Bool)

(declare-fun mapRes!8234 () Bool)

(assert (=> b!199367 (= e!130887 (and e!130889 mapRes!8234))))

(declare-fun condMapEmpty!8234 () Bool)

(declare-datatypes ((V!6017 0))(
  ( (V!6018 (val!2433 Int)) )
))
(declare-datatypes ((ValueCell!2045 0))(
  ( (ValueCellFull!2045 (v!4403 V!6017)) (EmptyCell!2045) )
))
(declare-datatypes ((array!8797 0))(
  ( (array!8798 (arr!4149 (Array (_ BitVec 32) ValueCell!2045)) (size!4474 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8797)

(declare-fun mapDefault!8234 () ValueCell!2045)

