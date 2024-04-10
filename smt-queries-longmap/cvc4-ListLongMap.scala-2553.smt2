; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39140 () Bool)

(assert start!39140)

(declare-fun b_free!9407 () Bool)

(declare-fun b_next!9407 () Bool)

(assert (=> start!39140 (= b_free!9407 (not b_next!9407))))

(declare-fun tp!33750 () Bool)

(declare-fun b_and!16793 () Bool)

(assert (=> start!39140 (= tp!33750 b_and!16793)))

(declare-fun b!411762 () Bool)

(declare-fun e!246539 () Bool)

(declare-fun tp_is_empty!10559 () Bool)

(assert (=> b!411762 (= e!246539 tp_is_empty!10559)))

(declare-fun b!411763 () Bool)

(declare-fun e!246537 () Bool)

(declare-fun e!246538 () Bool)

(assert (=> b!411763 (= e!246537 e!246538)))

(declare-fun res!238959 () Bool)

(assert (=> b!411763 (=> (not res!238959) (not e!246538))))

(declare-datatypes ((array!24979 0))(
  ( (array!24980 (arr!11939 (Array (_ BitVec 32) (_ BitVec 64))) (size!12291 (_ BitVec 32))) )
))
(declare-fun lt!189345 () array!24979)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24979 (_ BitVec 32)) Bool)

(assert (=> b!411763 (= res!238959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189345 mask!1025))))

(declare-fun _keys!709 () array!24979)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411763 (= lt!189345 (array!24980 (store (arr!11939 _keys!709) i!563 k!794) (size!12291 _keys!709)))))

(declare-fun b!411764 () Bool)

(declare-fun res!238957 () Bool)

(assert (=> b!411764 (=> (not res!238957) (not e!246537))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15183 0))(
  ( (V!15184 (val!5324 Int)) )
))
(declare-datatypes ((ValueCell!4936 0))(
  ( (ValueCellFull!4936 (v!7571 V!15183)) (EmptyCell!4936) )
))
(declare-datatypes ((array!24981 0))(
  ( (array!24982 (arr!11940 (Array (_ BitVec 32) ValueCell!4936)) (size!12292 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24981)

(assert (=> b!411764 (= res!238957 (and (= (size!12292 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12291 _keys!709) (size!12292 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411765 () Bool)

(declare-fun e!246535 () Bool)

(declare-fun e!246540 () Bool)

(declare-fun mapRes!17460 () Bool)

(assert (=> b!411765 (= e!246535 (and e!246540 mapRes!17460))))

(declare-fun condMapEmpty!17460 () Bool)

(declare-fun mapDefault!17460 () ValueCell!4936)

