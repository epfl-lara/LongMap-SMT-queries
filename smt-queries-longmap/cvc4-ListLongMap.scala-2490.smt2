; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38762 () Bool)

(assert start!38762)

(declare-fun b!404051 () Bool)

(declare-fun res!232943 () Bool)

(declare-fun e!243134 () Bool)

(assert (=> b!404051 (=> (not res!232943) (not e!243134))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404051 (= res!232943 (validKeyInArray!0 k!794))))

(declare-fun b!404052 () Bool)

(declare-fun res!232939 () Bool)

(assert (=> b!404052 (=> (not res!232939) (not e!243134))))

(declare-datatypes ((array!24259 0))(
  ( (array!24260 (arr!11579 (Array (_ BitVec 32) (_ BitVec 64))) (size!11931 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24259)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24259 (_ BitVec 32)) Bool)

(assert (=> b!404052 (= res!232939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404053 () Bool)

(declare-fun res!232938 () Bool)

(assert (=> b!404053 (=> (not res!232938) (not e!243134))))

(declare-fun arrayContainsKey!0 (array!24259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404053 (= res!232938 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16893 () Bool)

(declare-fun mapRes!16893 () Bool)

(declare-fun tp!33012 () Bool)

(declare-fun e!243135 () Bool)

(assert (=> mapNonEmpty!16893 (= mapRes!16893 (and tp!33012 e!243135))))

(declare-datatypes ((V!14679 0))(
  ( (V!14680 (val!5135 Int)) )
))
(declare-datatypes ((ValueCell!4747 0))(
  ( (ValueCellFull!4747 (v!7382 V!14679)) (EmptyCell!4747) )
))
(declare-fun mapRest!16893 () (Array (_ BitVec 32) ValueCell!4747))

(declare-datatypes ((array!24261 0))(
  ( (array!24262 (arr!11580 (Array (_ BitVec 32) ValueCell!4747)) (size!11932 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24261)

(declare-fun mapKey!16893 () (_ BitVec 32))

(declare-fun mapValue!16893 () ValueCell!4747)

(assert (=> mapNonEmpty!16893 (= (arr!11580 _values!549) (store mapRest!16893 mapKey!16893 mapValue!16893))))

(declare-fun b!404054 () Bool)

(declare-fun tp_is_empty!10181 () Bool)

(assert (=> b!404054 (= e!243135 tp_is_empty!10181)))

(declare-fun b!404055 () Bool)

(declare-fun res!232941 () Bool)

(assert (=> b!404055 (=> (not res!232941) (not e!243134))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404055 (= res!232941 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11931 _keys!709))))))

(declare-fun b!404057 () Bool)

(declare-fun e!243136 () Bool)

(assert (=> b!404057 (= e!243134 e!243136)))

(declare-fun res!232946 () Bool)

(assert (=> b!404057 (=> (not res!232946) (not e!243136))))

(declare-fun lt!188122 () array!24259)

(assert (=> b!404057 (= res!232946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188122 mask!1025))))

(assert (=> b!404057 (= lt!188122 (array!24260 (store (arr!11579 _keys!709) i!563 k!794) (size!11931 _keys!709)))))

(declare-fun mapIsEmpty!16893 () Bool)

(assert (=> mapIsEmpty!16893 mapRes!16893))

(declare-fun b!404058 () Bool)

(declare-fun e!243133 () Bool)

(assert (=> b!404058 (= e!243133 tp_is_empty!10181)))

(declare-fun b!404059 () Bool)

(declare-fun res!232940 () Bool)

(assert (=> b!404059 (=> (not res!232940) (not e!243134))))

(declare-datatypes ((List!6745 0))(
  ( (Nil!6742) (Cons!6741 (h!7597 (_ BitVec 64)) (t!11919 List!6745)) )
))
(declare-fun arrayNoDuplicates!0 (array!24259 (_ BitVec 32) List!6745) Bool)

(assert (=> b!404059 (= res!232940 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6742))))

(declare-fun b!404060 () Bool)

(declare-fun res!232942 () Bool)

(assert (=> b!404060 (=> (not res!232942) (not e!243134))))

(assert (=> b!404060 (= res!232942 (or (= (select (arr!11579 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11579 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404061 () Bool)

(assert (=> b!404061 (= e!243136 false)))

(declare-fun lt!188123 () Bool)

(assert (=> b!404061 (= lt!188123 (arrayNoDuplicates!0 lt!188122 #b00000000000000000000000000000000 Nil!6742))))

(declare-fun b!404056 () Bool)

(declare-fun e!243138 () Bool)

(assert (=> b!404056 (= e!243138 (and e!243133 mapRes!16893))))

(declare-fun condMapEmpty!16893 () Bool)

(declare-fun mapDefault!16893 () ValueCell!4747)

