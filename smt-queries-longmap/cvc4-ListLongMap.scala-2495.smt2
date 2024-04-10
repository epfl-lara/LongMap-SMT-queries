; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38792 () Bool)

(assert start!38792)

(declare-fun b!404636 () Bool)

(declare-fun res!233392 () Bool)

(declare-fun e!243407 () Bool)

(assert (=> b!404636 (=> (not res!233392) (not e!243407))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404636 (= res!233392 (validMask!0 mask!1025))))

(declare-fun b!404637 () Bool)

(declare-fun e!243405 () Bool)

(declare-fun tp_is_empty!10211 () Bool)

(assert (=> b!404637 (= e!243405 tp_is_empty!10211)))

(declare-fun b!404638 () Bool)

(declare-fun res!233393 () Bool)

(assert (=> b!404638 (=> (not res!233393) (not e!243407))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404638 (= res!233393 (validKeyInArray!0 k!794))))

(declare-fun b!404639 () Bool)

(declare-fun res!233394 () Bool)

(assert (=> b!404639 (=> (not res!233394) (not e!243407))))

(declare-datatypes ((array!24317 0))(
  ( (array!24318 (arr!11608 (Array (_ BitVec 32) (_ BitVec 64))) (size!11960 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24317)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404639 (= res!233394 (or (= (select (arr!11608 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11608 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404640 () Bool)

(declare-fun res!233389 () Bool)

(assert (=> b!404640 (=> (not res!233389) (not e!243407))))

(declare-datatypes ((List!6757 0))(
  ( (Nil!6754) (Cons!6753 (h!7609 (_ BitVec 64)) (t!11931 List!6757)) )
))
(declare-fun arrayNoDuplicates!0 (array!24317 (_ BitVec 32) List!6757) Bool)

(assert (=> b!404640 (= res!233389 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6754))))

(declare-fun b!404641 () Bool)

(declare-fun res!233388 () Bool)

(assert (=> b!404641 (=> (not res!233388) (not e!243407))))

(assert (=> b!404641 (= res!233388 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11960 _keys!709))))))

(declare-fun b!404642 () Bool)

(declare-fun e!243406 () Bool)

(assert (=> b!404642 (= e!243406 tp_is_empty!10211)))

(declare-fun mapIsEmpty!16938 () Bool)

(declare-fun mapRes!16938 () Bool)

(assert (=> mapIsEmpty!16938 mapRes!16938))

(declare-fun res!233396 () Bool)

(assert (=> start!38792 (=> (not res!233396) (not e!243407))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38792 (= res!233396 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11960 _keys!709))))))

(assert (=> start!38792 e!243407))

(assert (=> start!38792 true))

(declare-datatypes ((V!14719 0))(
  ( (V!14720 (val!5150 Int)) )
))
(declare-datatypes ((ValueCell!4762 0))(
  ( (ValueCellFull!4762 (v!7397 V!14719)) (EmptyCell!4762) )
))
(declare-datatypes ((array!24319 0))(
  ( (array!24320 (arr!11609 (Array (_ BitVec 32) ValueCell!4762)) (size!11961 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24319)

(declare-fun e!243403 () Bool)

(declare-fun array_inv!8486 (array!24319) Bool)

(assert (=> start!38792 (and (array_inv!8486 _values!549) e!243403)))

(declare-fun array_inv!8487 (array!24317) Bool)

(assert (=> start!38792 (array_inv!8487 _keys!709)))

(declare-fun b!404643 () Bool)

(declare-fun e!243404 () Bool)

(assert (=> b!404643 (= e!243404 false)))

(declare-fun lt!188212 () Bool)

(declare-fun lt!188213 () array!24317)

(assert (=> b!404643 (= lt!188212 (arrayNoDuplicates!0 lt!188213 #b00000000000000000000000000000000 Nil!6754))))

(declare-fun mapNonEmpty!16938 () Bool)

(declare-fun tp!33057 () Bool)

(assert (=> mapNonEmpty!16938 (= mapRes!16938 (and tp!33057 e!243406))))

(declare-fun mapKey!16938 () (_ BitVec 32))

(declare-fun mapValue!16938 () ValueCell!4762)

(declare-fun mapRest!16938 () (Array (_ BitVec 32) ValueCell!4762))

(assert (=> mapNonEmpty!16938 (= (arr!11609 _values!549) (store mapRest!16938 mapKey!16938 mapValue!16938))))

(declare-fun b!404644 () Bool)

(assert (=> b!404644 (= e!243407 e!243404)))

(declare-fun res!233391 () Bool)

(assert (=> b!404644 (=> (not res!233391) (not e!243404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24317 (_ BitVec 32)) Bool)

(assert (=> b!404644 (= res!233391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188213 mask!1025))))

(assert (=> b!404644 (= lt!188213 (array!24318 (store (arr!11608 _keys!709) i!563 k!794) (size!11960 _keys!709)))))

(declare-fun b!404645 () Bool)

(declare-fun res!233397 () Bool)

(assert (=> b!404645 (=> (not res!233397) (not e!243407))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404645 (= res!233397 (and (= (size!11961 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11960 _keys!709) (size!11961 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404646 () Bool)

(declare-fun res!233395 () Bool)

(assert (=> b!404646 (=> (not res!233395) (not e!243407))))

(declare-fun arrayContainsKey!0 (array!24317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404646 (= res!233395 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404647 () Bool)

(assert (=> b!404647 (= e!243403 (and e!243405 mapRes!16938))))

(declare-fun condMapEmpty!16938 () Bool)

(declare-fun mapDefault!16938 () ValueCell!4762)

