; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40070 () Bool)

(assert start!40070)

(declare-fun b_free!10337 () Bool)

(declare-fun b_next!10337 () Bool)

(assert (=> start!40070 (= b_free!10337 (not b_next!10337))))

(declare-fun tp!36540 () Bool)

(declare-fun b_and!18305 () Bool)

(assert (=> start!40070 (= tp!36540 b_and!18305)))

(declare-fun res!258072 () Bool)

(declare-fun e!258181 () Bool)

(assert (=> start!40070 (=> (not res!258072) (not e!258181))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26797 0))(
  ( (array!26798 (arr!12848 (Array (_ BitVec 32) (_ BitVec 64))) (size!13200 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26797)

(assert (=> start!40070 (= res!258072 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13200 _keys!709))))))

(assert (=> start!40070 e!258181))

(declare-fun tp_is_empty!11489 () Bool)

(assert (=> start!40070 tp_is_empty!11489))

(assert (=> start!40070 tp!36540))

(assert (=> start!40070 true))

(declare-datatypes ((V!16423 0))(
  ( (V!16424 (val!5789 Int)) )
))
(declare-datatypes ((ValueCell!5401 0))(
  ( (ValueCellFull!5401 (v!8036 V!16423)) (EmptyCell!5401) )
))
(declare-datatypes ((array!26799 0))(
  ( (array!26800 (arr!12849 (Array (_ BitVec 32) ValueCell!5401)) (size!13201 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26799)

(declare-fun e!258185 () Bool)

(declare-fun array_inv!9334 (array!26799) Bool)

(assert (=> start!40070 (and (array_inv!9334 _values!549) e!258185)))

(declare-fun array_inv!9335 (array!26797) Bool)

(assert (=> start!40070 (array_inv!9335 _keys!709)))

(declare-fun b!437444 () Bool)

(declare-fun e!258180 () Bool)

(assert (=> b!437444 (= e!258180 tp_is_empty!11489)))

(declare-fun mapIsEmpty!18855 () Bool)

(declare-fun mapRes!18855 () Bool)

(assert (=> mapIsEmpty!18855 mapRes!18855))

(declare-fun b!437445 () Bool)

(declare-fun res!258071 () Bool)

(declare-fun e!258183 () Bool)

(assert (=> b!437445 (=> (not res!258071) (not e!258183))))

(declare-fun lt!201650 () array!26797)

(declare-datatypes ((List!7672 0))(
  ( (Nil!7669) (Cons!7668 (h!8524 (_ BitVec 64)) (t!13428 List!7672)) )
))
(declare-fun arrayNoDuplicates!0 (array!26797 (_ BitVec 32) List!7672) Bool)

(assert (=> b!437445 (= res!258071 (arrayNoDuplicates!0 lt!201650 #b00000000000000000000000000000000 Nil!7669))))

(declare-fun b!437446 () Bool)

(declare-fun res!258064 () Bool)

(assert (=> b!437446 (=> (not res!258064) (not e!258181))))

(assert (=> b!437446 (= res!258064 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7669))))

(declare-fun b!437447 () Bool)

(declare-fun e!258184 () Bool)

(assert (=> b!437447 (= e!258185 (and e!258184 mapRes!18855))))

(declare-fun condMapEmpty!18855 () Bool)

(declare-fun mapDefault!18855 () ValueCell!5401)

