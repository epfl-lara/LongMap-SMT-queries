; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39052 () Bool)

(assert start!39052)

(declare-fun b_free!9319 () Bool)

(declare-fun b_next!9319 () Bool)

(assert (=> start!39052 (= b_free!9319 (not b_next!9319))))

(declare-fun tp!33486 () Bool)

(declare-fun b_and!16705 () Bool)

(assert (=> start!39052 (= tp!33486 b_and!16705)))

(declare-fun b!409782 () Bool)

(declare-fun res!237375 () Bool)

(declare-fun e!245748 () Bool)

(assert (=> b!409782 (=> (not res!237375) (not e!245748))))

(declare-datatypes ((array!24815 0))(
  ( (array!24816 (arr!11857 (Array (_ BitVec 32) (_ BitVec 64))) (size!12209 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24815)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409782 (= res!237375 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!409783 () Bool)

(declare-fun res!237365 () Bool)

(assert (=> b!409783 (=> (not res!237365) (not e!245748))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409783 (= res!237365 (validMask!0 mask!1025))))

(declare-fun b!409784 () Bool)

(declare-fun res!237373 () Bool)

(assert (=> b!409784 (=> (not res!237373) (not e!245748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409784 (= res!237373 (validKeyInArray!0 k!794))))

(declare-fun b!409785 () Bool)

(declare-fun res!237371 () Bool)

(assert (=> b!409785 (=> (not res!237371) (not e!245748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24815 (_ BitVec 32)) Bool)

(assert (=> b!409785 (= res!237371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409786 () Bool)

(declare-fun res!237368 () Bool)

(assert (=> b!409786 (=> (not res!237368) (not e!245748))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409786 (= res!237368 (or (= (select (arr!11857 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11857 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409787 () Bool)

(declare-fun res!237374 () Bool)

(declare-fun e!245746 () Bool)

(assert (=> b!409787 (=> (not res!237374) (not e!245746))))

(declare-fun lt!188993 () array!24815)

(declare-datatypes ((List!6868 0))(
  ( (Nil!6865) (Cons!6864 (h!7720 (_ BitVec 64)) (t!12042 List!6868)) )
))
(declare-fun arrayNoDuplicates!0 (array!24815 (_ BitVec 32) List!6868) Bool)

(assert (=> b!409787 (= res!237374 (arrayNoDuplicates!0 lt!188993 #b00000000000000000000000000000000 Nil!6865))))

(declare-fun b!409789 () Bool)

(declare-fun res!237370 () Bool)

(assert (=> b!409789 (=> (not res!237370) (not e!245748))))

(assert (=> b!409789 (= res!237370 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6865))))

(declare-fun b!409790 () Bool)

(declare-fun res!237364 () Bool)

(assert (=> b!409790 (=> (not res!237364) (not e!245748))))

(assert (=> b!409790 (= res!237364 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12209 _keys!709))))))

(declare-fun b!409791 () Bool)

(declare-fun e!245743 () Bool)

(declare-fun tp_is_empty!10471 () Bool)

(assert (=> b!409791 (= e!245743 tp_is_empty!10471)))

(declare-fun b!409792 () Bool)

(assert (=> b!409792 (= e!245748 e!245746)))

(declare-fun res!237366 () Bool)

(assert (=> b!409792 (=> (not res!237366) (not e!245746))))

(assert (=> b!409792 (= res!237366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188993 mask!1025))))

(assert (=> b!409792 (= lt!188993 (array!24816 (store (arr!11857 _keys!709) i!563 k!794) (size!12209 _keys!709)))))

(declare-fun b!409793 () Bool)

(declare-fun res!237369 () Bool)

(assert (=> b!409793 (=> (not res!237369) (not e!245746))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!409793 (= res!237369 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17328 () Bool)

(declare-fun mapRes!17328 () Bool)

(assert (=> mapIsEmpty!17328 mapRes!17328))

(declare-fun b!409794 () Bool)

(declare-fun e!245745 () Bool)

(assert (=> b!409794 (= e!245745 tp_is_empty!10471)))

(declare-fun b!409795 () Bool)

(declare-fun e!245744 () Bool)

(assert (=> b!409795 (= e!245744 (and e!245743 mapRes!17328))))

(declare-fun condMapEmpty!17328 () Bool)

(declare-datatypes ((V!15067 0))(
  ( (V!15068 (val!5280 Int)) )
))
(declare-datatypes ((ValueCell!4892 0))(
  ( (ValueCellFull!4892 (v!7527 V!15067)) (EmptyCell!4892) )
))
(declare-datatypes ((array!24817 0))(
  ( (array!24818 (arr!11858 (Array (_ BitVec 32) ValueCell!4892)) (size!12210 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24817)

(declare-fun mapDefault!17328 () ValueCell!4892)

