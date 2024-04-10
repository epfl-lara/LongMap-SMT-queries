; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38806 () Bool)

(assert start!38806)

(declare-fun b!404909 () Bool)

(declare-fun res!233599 () Bool)

(declare-fun e!243530 () Bool)

(assert (=> b!404909 (=> (not res!233599) (not e!243530))))

(declare-datatypes ((array!24345 0))(
  ( (array!24346 (arr!11622 (Array (_ BitVec 32) (_ BitVec 64))) (size!11974 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24345)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404909 (= res!233599 (or (= (select (arr!11622 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11622 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404910 () Bool)

(declare-fun res!233606 () Bool)

(assert (=> b!404910 (=> (not res!233606) (not e!243530))))

(assert (=> b!404910 (= res!233606 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11974 _keys!709))))))

(declare-fun b!404911 () Bool)

(declare-fun res!233602 () Bool)

(assert (=> b!404911 (=> (not res!233602) (not e!243530))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404911 (= res!233602 (validMask!0 mask!1025))))

(declare-fun b!404912 () Bool)

(declare-fun e!243532 () Bool)

(assert (=> b!404912 (= e!243532 false)))

(declare-fun lt!188254 () Bool)

(declare-fun lt!188255 () array!24345)

(declare-datatypes ((List!6764 0))(
  ( (Nil!6761) (Cons!6760 (h!7616 (_ BitVec 64)) (t!11938 List!6764)) )
))
(declare-fun arrayNoDuplicates!0 (array!24345 (_ BitVec 32) List!6764) Bool)

(assert (=> b!404912 (= lt!188254 (arrayNoDuplicates!0 lt!188255 #b00000000000000000000000000000000 Nil!6761))))

(declare-fun b!404913 () Bool)

(declare-fun res!233600 () Bool)

(assert (=> b!404913 (=> (not res!233600) (not e!243530))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404913 (= res!233600 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404914 () Bool)

(declare-fun e!243529 () Bool)

(declare-fun tp_is_empty!10225 () Bool)

(assert (=> b!404914 (= e!243529 tp_is_empty!10225)))

(declare-fun mapIsEmpty!16959 () Bool)

(declare-fun mapRes!16959 () Bool)

(assert (=> mapIsEmpty!16959 mapRes!16959))

(declare-fun b!404916 () Bool)

(declare-fun res!233598 () Bool)

(assert (=> b!404916 (=> (not res!233598) (not e!243530))))

(assert (=> b!404916 (= res!233598 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6761))))

(declare-fun b!404917 () Bool)

(declare-fun res!233605 () Bool)

(assert (=> b!404917 (=> (not res!233605) (not e!243530))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14739 0))(
  ( (V!14740 (val!5157 Int)) )
))
(declare-datatypes ((ValueCell!4769 0))(
  ( (ValueCellFull!4769 (v!7404 V!14739)) (EmptyCell!4769) )
))
(declare-datatypes ((array!24347 0))(
  ( (array!24348 (arr!11623 (Array (_ BitVec 32) ValueCell!4769)) (size!11975 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24347)

(assert (=> b!404917 (= res!233605 (and (= (size!11975 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11974 _keys!709) (size!11975 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16959 () Bool)

(declare-fun tp!33078 () Bool)

(assert (=> mapNonEmpty!16959 (= mapRes!16959 (and tp!33078 e!243529))))

(declare-fun mapValue!16959 () ValueCell!4769)

(declare-fun mapRest!16959 () (Array (_ BitVec 32) ValueCell!4769))

(declare-fun mapKey!16959 () (_ BitVec 32))

(assert (=> mapNonEmpty!16959 (= (arr!11623 _values!549) (store mapRest!16959 mapKey!16959 mapValue!16959))))

(declare-fun b!404918 () Bool)

(assert (=> b!404918 (= e!243530 e!243532)))

(declare-fun res!233603 () Bool)

(assert (=> b!404918 (=> (not res!233603) (not e!243532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24345 (_ BitVec 32)) Bool)

(assert (=> b!404918 (= res!233603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188255 mask!1025))))

(assert (=> b!404918 (= lt!188255 (array!24346 (store (arr!11622 _keys!709) i!563 k!794) (size!11974 _keys!709)))))

(declare-fun b!404919 () Bool)

(declare-fun res!233601 () Bool)

(assert (=> b!404919 (=> (not res!233601) (not e!243530))))

(assert (=> b!404919 (= res!233601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404920 () Bool)

(declare-fun e!243531 () Bool)

(assert (=> b!404920 (= e!243531 tp_is_empty!10225)))

(declare-fun b!404921 () Bool)

(declare-fun res!233607 () Bool)

(assert (=> b!404921 (=> (not res!233607) (not e!243530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404921 (= res!233607 (validKeyInArray!0 k!794))))

(declare-fun res!233604 () Bool)

(assert (=> start!38806 (=> (not res!233604) (not e!243530))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38806 (= res!233604 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11974 _keys!709))))))

(assert (=> start!38806 e!243530))

(assert (=> start!38806 true))

(declare-fun e!243533 () Bool)

(declare-fun array_inv!8498 (array!24347) Bool)

(assert (=> start!38806 (and (array_inv!8498 _values!549) e!243533)))

(declare-fun array_inv!8499 (array!24345) Bool)

(assert (=> start!38806 (array_inv!8499 _keys!709)))

(declare-fun b!404915 () Bool)

(assert (=> b!404915 (= e!243533 (and e!243531 mapRes!16959))))

(declare-fun condMapEmpty!16959 () Bool)

(declare-fun mapDefault!16959 () ValueCell!4769)

