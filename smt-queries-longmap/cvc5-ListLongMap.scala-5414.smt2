; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72256 () Bool)

(assert start!72256)

(declare-fun b!837280 () Bool)

(declare-fun e!467268 () Bool)

(declare-fun tp_is_empty!15319 () Bool)

(assert (=> b!837280 (= e!467268 tp_is_empty!15319)))

(declare-fun b!837281 () Bool)

(declare-fun res!569445 () Bool)

(declare-fun e!467270 () Bool)

(assert (=> b!837281 (=> (not res!569445) (not e!467270))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837281 (= res!569445 (validMask!0 mask!1196))))

(declare-fun b!837282 () Bool)

(declare-fun res!569448 () Bool)

(assert (=> b!837282 (=> (not res!569448) (not e!467270))))

(declare-datatypes ((List!16023 0))(
  ( (Nil!16020) (Cons!16019 (h!17150 (_ BitVec 64)) (t!22394 List!16023)) )
))
(declare-fun noDuplicate!1297 (List!16023) Bool)

(assert (=> b!837282 (= res!569448 (noDuplicate!1297 Nil!16020))))

(declare-fun b!837284 () Bool)

(declare-fun e!467273 () Bool)

(assert (=> b!837284 (= e!467273 tp_is_empty!15319)))

(declare-fun b!837285 () Bool)

(declare-fun e!467272 () Bool)

(declare-fun mapRes!24575 () Bool)

(assert (=> b!837285 (= e!467272 (and e!467268 mapRes!24575))))

(declare-fun condMapEmpty!24575 () Bool)

(declare-datatypes ((V!25473 0))(
  ( (V!25474 (val!7707 Int)) )
))
(declare-datatypes ((ValueCell!7220 0))(
  ( (ValueCellFull!7220 (v!10131 V!25473)) (EmptyCell!7220) )
))
(declare-datatypes ((array!46940 0))(
  ( (array!46941 (arr!22502 (Array (_ BitVec 32) ValueCell!7220)) (size!22942 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46940)

(declare-fun mapDefault!24575 () ValueCell!7220)

