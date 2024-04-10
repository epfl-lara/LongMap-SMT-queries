; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33496 () Bool)

(assert start!33496)

(declare-fun b!332467 () Bool)

(declare-fun res!183155 () Bool)

(declare-fun e!204152 () Bool)

(assert (=> b!332467 (=> (not res!183155) (not e!204152))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9975 0))(
  ( (V!9976 (val!3419 Int)) )
))
(declare-datatypes ((ValueCell!3031 0))(
  ( (ValueCellFull!3031 (v!5578 V!9975)) (EmptyCell!3031) )
))
(declare-datatypes ((array!17093 0))(
  ( (array!17094 (arr!8081 (Array (_ BitVec 32) ValueCell!3031)) (size!8433 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17093)

(declare-datatypes ((array!17095 0))(
  ( (array!17096 (arr!8082 (Array (_ BitVec 32) (_ BitVec 64))) (size!8434 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17095)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332467 (= res!183155 (and (= (size!8433 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8434 _keys!1895) (size!8433 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332468 () Bool)

(declare-fun e!204155 () Bool)

(declare-fun tp_is_empty!6749 () Bool)

(assert (=> b!332468 (= e!204155 tp_is_empty!6749)))

(declare-fun res!183158 () Bool)

(assert (=> start!33496 (=> (not res!183158) (not e!204152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33496 (= res!183158 (validMask!0 mask!2385))))

(assert (=> start!33496 e!204152))

(assert (=> start!33496 true))

(declare-fun e!204156 () Bool)

(declare-fun array_inv!6020 (array!17093) Bool)

(assert (=> start!33496 (and (array_inv!6020 _values!1525) e!204156)))

(declare-fun array_inv!6021 (array!17095) Bool)

(assert (=> start!33496 (array_inv!6021 _keys!1895)))

(declare-fun b!332469 () Bool)

(assert (=> b!332469 (= e!204152 (bvsgt #b00000000000000000000000000000000 (size!8434 _keys!1895)))))

(declare-fun b!332470 () Bool)

(declare-fun e!204154 () Bool)

(assert (=> b!332470 (= e!204154 tp_is_empty!6749)))

(declare-fun b!332471 () Bool)

(declare-fun res!183157 () Bool)

(assert (=> b!332471 (=> (not res!183157) (not e!204152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17095 (_ BitVec 32)) Bool)

(assert (=> b!332471 (= res!183157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11508 () Bool)

(declare-fun mapRes!11508 () Bool)

(declare-fun tp!23883 () Bool)

(assert (=> mapNonEmpty!11508 (= mapRes!11508 (and tp!23883 e!204154))))

(declare-fun mapValue!11508 () ValueCell!3031)

(declare-fun mapKey!11508 () (_ BitVec 32))

(declare-fun mapRest!11508 () (Array (_ BitVec 32) ValueCell!3031))

(assert (=> mapNonEmpty!11508 (= (arr!8081 _values!1525) (store mapRest!11508 mapKey!11508 mapValue!11508))))

(declare-fun b!332472 () Bool)

(assert (=> b!332472 (= e!204156 (and e!204155 mapRes!11508))))

(declare-fun condMapEmpty!11508 () Bool)

(declare-fun mapDefault!11508 () ValueCell!3031)

