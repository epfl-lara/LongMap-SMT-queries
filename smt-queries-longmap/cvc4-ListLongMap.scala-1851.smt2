; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33478 () Bool)

(assert start!33478)

(declare-fun res!183059 () Bool)

(declare-fun e!204018 () Bool)

(assert (=> start!33478 (=> (not res!183059) (not e!204018))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33478 (= res!183059 (validMask!0 mask!2385))))

(assert (=> start!33478 e!204018))

(assert (=> start!33478 true))

(declare-datatypes ((V!9951 0))(
  ( (V!9952 (val!3410 Int)) )
))
(declare-datatypes ((ValueCell!3022 0))(
  ( (ValueCellFull!3022 (v!5569 V!9951)) (EmptyCell!3022) )
))
(declare-datatypes ((array!17057 0))(
  ( (array!17058 (arr!8063 (Array (_ BitVec 32) ValueCell!3022)) (size!8415 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17057)

(declare-fun e!204021 () Bool)

(declare-fun array_inv!6006 (array!17057) Bool)

(assert (=> start!33478 (and (array_inv!6006 _values!1525) e!204021)))

(declare-datatypes ((array!17059 0))(
  ( (array!17060 (arr!8064 (Array (_ BitVec 32) (_ BitVec 64))) (size!8416 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17059)

(declare-fun array_inv!6007 (array!17059) Bool)

(assert (=> start!33478 (array_inv!6007 _keys!1895)))

(declare-fun b!332289 () Bool)

(assert (=> b!332289 (= e!204018 false)))

(declare-fun lt!158992 () Bool)

(declare-datatypes ((List!4589 0))(
  ( (Nil!4586) (Cons!4585 (h!5441 (_ BitVec 64)) (t!9671 List!4589)) )
))
(declare-fun arrayNoDuplicates!0 (array!17059 (_ BitVec 32) List!4589) Bool)

(assert (=> b!332289 (= lt!158992 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4586))))

(declare-fun b!332290 () Bool)

(declare-fun e!204017 () Bool)

(declare-fun mapRes!11481 () Bool)

(assert (=> b!332290 (= e!204021 (and e!204017 mapRes!11481))))

(declare-fun condMapEmpty!11481 () Bool)

(declare-fun mapDefault!11481 () ValueCell!3022)

