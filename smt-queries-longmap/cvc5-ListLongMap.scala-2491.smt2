; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38764 () Bool)

(assert start!38764)

(declare-fun b!404090 () Bool)

(declare-fun res!232968 () Bool)

(declare-fun e!243154 () Bool)

(assert (=> b!404090 (=> (not res!232968) (not e!243154))))

(declare-datatypes ((array!24263 0))(
  ( (array!24264 (arr!11581 (Array (_ BitVec 32) (_ BitVec 64))) (size!11933 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24263)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14683 0))(
  ( (V!14684 (val!5136 Int)) )
))
(declare-datatypes ((ValueCell!4748 0))(
  ( (ValueCellFull!4748 (v!7383 V!14683)) (EmptyCell!4748) )
))
(declare-datatypes ((array!24265 0))(
  ( (array!24266 (arr!11582 (Array (_ BitVec 32) ValueCell!4748)) (size!11934 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24265)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404090 (= res!232968 (and (= (size!11934 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11933 _keys!709) (size!11934 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404091 () Bool)

(declare-fun res!232976 () Bool)

(assert (=> b!404091 (=> (not res!232976) (not e!243154))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404091 (= res!232976 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404092 () Bool)

(declare-fun e!243153 () Bool)

(declare-fun tp_is_empty!10183 () Bool)

(assert (=> b!404092 (= e!243153 tp_is_empty!10183)))

(declare-fun res!232973 () Bool)

(assert (=> start!38764 (=> (not res!232973) (not e!243154))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38764 (= res!232973 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11933 _keys!709))))))

(assert (=> start!38764 e!243154))

(assert (=> start!38764 true))

(declare-fun e!243155 () Bool)

(declare-fun array_inv!8472 (array!24265) Bool)

(assert (=> start!38764 (and (array_inv!8472 _values!549) e!243155)))

(declare-fun array_inv!8473 (array!24263) Bool)

(assert (=> start!38764 (array_inv!8473 _keys!709)))

(declare-fun b!404093 () Bool)

(declare-fun res!232977 () Bool)

(assert (=> b!404093 (=> (not res!232977) (not e!243154))))

(declare-datatypes ((List!6746 0))(
  ( (Nil!6743) (Cons!6742 (h!7598 (_ BitVec 64)) (t!11920 List!6746)) )
))
(declare-fun arrayNoDuplicates!0 (array!24263 (_ BitVec 32) List!6746) Bool)

(assert (=> b!404093 (= res!232977 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6743))))

(declare-fun b!404094 () Bool)

(declare-fun res!232974 () Bool)

(assert (=> b!404094 (=> (not res!232974) (not e!243154))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404094 (= res!232974 (or (= (select (arr!11581 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11581 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404095 () Bool)

(declare-fun e!243156 () Bool)

(assert (=> b!404095 (= e!243156 false)))

(declare-fun lt!188128 () Bool)

(declare-fun lt!188129 () array!24263)

(assert (=> b!404095 (= lt!188128 (arrayNoDuplicates!0 lt!188129 #b00000000000000000000000000000000 Nil!6743))))

(declare-fun mapIsEmpty!16896 () Bool)

(declare-fun mapRes!16896 () Bool)

(assert (=> mapIsEmpty!16896 mapRes!16896))

(declare-fun b!404096 () Bool)

(declare-fun res!232970 () Bool)

(assert (=> b!404096 (=> (not res!232970) (not e!243154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404096 (= res!232970 (validKeyInArray!0 k!794))))

(declare-fun b!404097 () Bool)

(assert (=> b!404097 (= e!243154 e!243156)))

(declare-fun res!232975 () Bool)

(assert (=> b!404097 (=> (not res!232975) (not e!243156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24263 (_ BitVec 32)) Bool)

(assert (=> b!404097 (= res!232975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188129 mask!1025))))

(assert (=> b!404097 (= lt!188129 (array!24264 (store (arr!11581 _keys!709) i!563 k!794) (size!11933 _keys!709)))))

(declare-fun mapNonEmpty!16896 () Bool)

(declare-fun tp!33015 () Bool)

(assert (=> mapNonEmpty!16896 (= mapRes!16896 (and tp!33015 e!243153))))

(declare-fun mapValue!16896 () ValueCell!4748)

(declare-fun mapRest!16896 () (Array (_ BitVec 32) ValueCell!4748))

(declare-fun mapKey!16896 () (_ BitVec 32))

(assert (=> mapNonEmpty!16896 (= (arr!11582 _values!549) (store mapRest!16896 mapKey!16896 mapValue!16896))))

(declare-fun b!404098 () Bool)

(declare-fun res!232971 () Bool)

(assert (=> b!404098 (=> (not res!232971) (not e!243154))))

(assert (=> b!404098 (= res!232971 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11933 _keys!709))))))

(declare-fun b!404099 () Bool)

(declare-fun res!232969 () Bool)

(assert (=> b!404099 (=> (not res!232969) (not e!243154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404099 (= res!232969 (validMask!0 mask!1025))))

(declare-fun b!404100 () Bool)

(declare-fun res!232972 () Bool)

(assert (=> b!404100 (=> (not res!232972) (not e!243154))))

(assert (=> b!404100 (= res!232972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404101 () Bool)

(declare-fun e!243151 () Bool)

(assert (=> b!404101 (= e!243151 tp_is_empty!10183)))

(declare-fun b!404102 () Bool)

(assert (=> b!404102 (= e!243155 (and e!243151 mapRes!16896))))

(declare-fun condMapEmpty!16896 () Bool)

(declare-fun mapDefault!16896 () ValueCell!4748)

