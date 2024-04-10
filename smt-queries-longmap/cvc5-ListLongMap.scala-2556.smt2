; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39154 () Bool)

(assert start!39154)

(declare-fun b_free!9421 () Bool)

(declare-fun b_next!9421 () Bool)

(assert (=> start!39154 (= b_free!9421 (not b_next!9421))))

(declare-fun tp!33791 () Bool)

(declare-fun b_and!16807 () Bool)

(assert (=> start!39154 (= tp!33791 b_and!16807)))

(declare-fun b!412077 () Bool)

(declare-fun e!246666 () Bool)

(declare-fun tp_is_empty!10573 () Bool)

(assert (=> b!412077 (= e!246666 tp_is_empty!10573)))

(declare-fun b!412078 () Bool)

(declare-fun res!239200 () Bool)

(declare-fun e!246664 () Bool)

(assert (=> b!412078 (=> (not res!239200) (not e!246664))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412078 (= res!239200 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!17481 () Bool)

(declare-fun mapRes!17481 () Bool)

(declare-fun tp!33792 () Bool)

(assert (=> mapNonEmpty!17481 (= mapRes!17481 (and tp!33792 e!246666))))

(declare-datatypes ((V!15203 0))(
  ( (V!15204 (val!5331 Int)) )
))
(declare-datatypes ((ValueCell!4943 0))(
  ( (ValueCellFull!4943 (v!7578 V!15203)) (EmptyCell!4943) )
))
(declare-fun mapValue!17481 () ValueCell!4943)

(declare-datatypes ((array!25007 0))(
  ( (array!25008 (arr!11953 (Array (_ BitVec 32) ValueCell!4943)) (size!12305 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25007)

(declare-fun mapRest!17481 () (Array (_ BitVec 32) ValueCell!4943))

(declare-fun mapKey!17481 () (_ BitVec 32))

(assert (=> mapNonEmpty!17481 (= (arr!11953 _values!549) (store mapRest!17481 mapKey!17481 mapValue!17481))))

(declare-fun b!412079 () Bool)

(declare-fun res!239208 () Bool)

(assert (=> b!412079 (=> (not res!239208) (not e!246664))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412079 (= res!239208 (validMask!0 mask!1025))))

(declare-fun b!412080 () Bool)

(declare-fun res!239204 () Bool)

(declare-fun e!246663 () Bool)

(assert (=> b!412080 (=> (not res!239204) (not e!246663))))

(declare-datatypes ((array!25009 0))(
  ( (array!25010 (arr!11954 (Array (_ BitVec 32) (_ BitVec 64))) (size!12306 (_ BitVec 32))) )
))
(declare-fun lt!189409 () array!25009)

(declare-datatypes ((List!6941 0))(
  ( (Nil!6938) (Cons!6937 (h!7793 (_ BitVec 64)) (t!12115 List!6941)) )
))
(declare-fun arrayNoDuplicates!0 (array!25009 (_ BitVec 32) List!6941) Bool)

(assert (=> b!412080 (= res!239204 (arrayNoDuplicates!0 lt!189409 #b00000000000000000000000000000000 Nil!6938))))

(declare-fun mapIsEmpty!17481 () Bool)

(assert (=> mapIsEmpty!17481 mapRes!17481))

(declare-fun res!239206 () Bool)

(assert (=> start!39154 (=> (not res!239206) (not e!246664))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!25009)

(assert (=> start!39154 (= res!239206 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12306 _keys!709))))))

(assert (=> start!39154 e!246664))

(assert (=> start!39154 tp_is_empty!10573))

(assert (=> start!39154 tp!33791))

(assert (=> start!39154 true))

(declare-fun e!246661 () Bool)

(declare-fun array_inv!8716 (array!25007) Bool)

(assert (=> start!39154 (and (array_inv!8716 _values!549) e!246661)))

(declare-fun array_inv!8717 (array!25009) Bool)

(assert (=> start!39154 (array_inv!8717 _keys!709)))

(declare-fun b!412081 () Bool)

(declare-fun res!239211 () Bool)

(assert (=> b!412081 (=> (not res!239211) (not e!246664))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412081 (= res!239211 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12306 _keys!709))))))

(declare-fun b!412082 () Bool)

(assert (=> b!412082 (= e!246664 e!246663)))

(declare-fun res!239202 () Bool)

(assert (=> b!412082 (=> (not res!239202) (not e!246663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25009 (_ BitVec 32)) Bool)

(assert (=> b!412082 (= res!239202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189409 mask!1025))))

(assert (=> b!412082 (= lt!189409 (array!25010 (store (arr!11954 _keys!709) i!563 k!794) (size!12306 _keys!709)))))

(declare-fun b!412083 () Bool)

(declare-fun e!246665 () Bool)

(assert (=> b!412083 (= e!246661 (and e!246665 mapRes!17481))))

(declare-fun condMapEmpty!17481 () Bool)

(declare-fun mapDefault!17481 () ValueCell!4943)

