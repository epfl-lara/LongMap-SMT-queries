; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36710 () Bool)

(assert start!36710)

(declare-fun mapIsEmpty!14337 () Bool)

(declare-fun mapRes!14337 () Bool)

(assert (=> mapIsEmpty!14337 mapRes!14337))

(declare-fun b!366468 () Bool)

(declare-fun res!204999 () Bool)

(declare-fun e!224358 () Bool)

(assert (=> b!366468 (=> (not res!204999) (not e!224358))))

(declare-datatypes ((array!20993 0))(
  ( (array!20994 (arr!9967 (Array (_ BitVec 32) (_ BitVec 64))) (size!10319 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20993)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366468 (= res!204999 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366469 () Bool)

(declare-fun res!205000 () Bool)

(assert (=> b!366469 (=> (not res!205000) (not e!224358))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!12463 0))(
  ( (V!12464 (val!4304 Int)) )
))
(declare-datatypes ((ValueCell!3916 0))(
  ( (ValueCellFull!3916 (v!6500 V!12463)) (EmptyCell!3916) )
))
(declare-datatypes ((array!20995 0))(
  ( (array!20996 (arr!9968 (Array (_ BitVec 32) ValueCell!3916)) (size!10320 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20995)

(assert (=> b!366469 (= res!205000 (and (= (size!10320 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10319 _keys!658) (size!10320 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14337 () Bool)

(declare-fun tp!28413 () Bool)

(declare-fun e!224361 () Bool)

(assert (=> mapNonEmpty!14337 (= mapRes!14337 (and tp!28413 e!224361))))

(declare-fun mapRest!14337 () (Array (_ BitVec 32) ValueCell!3916))

(declare-fun mapValue!14337 () ValueCell!3916)

(declare-fun mapKey!14337 () (_ BitVec 32))

(assert (=> mapNonEmpty!14337 (= (arr!9968 _values!506) (store mapRest!14337 mapKey!14337 mapValue!14337))))

(declare-fun b!366470 () Bool)

(declare-fun res!204998 () Bool)

(assert (=> b!366470 (=> (not res!204998) (not e!224358))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366470 (= res!204998 (or (= (select (arr!9967 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9967 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366471 () Bool)

(declare-fun res!205006 () Bool)

(assert (=> b!366471 (=> (not res!205006) (not e!224358))))

(assert (=> b!366471 (= res!205006 (and (bvsle #b00000000000000000000000000000000 (size!10319 _keys!658)) (bvslt (size!10319 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!366472 () Bool)

(declare-fun res!205001 () Bool)

(assert (=> b!366472 (=> (not res!205001) (not e!224358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366472 (= res!205001 (validKeyInArray!0 k!778))))

(declare-fun b!366474 () Bool)

(declare-fun res!205005 () Bool)

(assert (=> b!366474 (=> (not res!205005) (not e!224358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20993 (_ BitVec 32)) Bool)

(assert (=> b!366474 (= res!205005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20994 (store (arr!9967 _keys!658) i!548 k!778) (size!10319 _keys!658)) mask!970))))

(declare-fun b!366475 () Bool)

(declare-fun e!224359 () Bool)

(declare-fun tp_is_empty!8519 () Bool)

(assert (=> b!366475 (= e!224359 tp_is_empty!8519)))

(declare-fun b!366476 () Bool)

(declare-fun res!205002 () Bool)

(assert (=> b!366476 (=> (not res!205002) (not e!224358))))

(assert (=> b!366476 (= res!205002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366477 () Bool)

(declare-datatypes ((List!5549 0))(
  ( (Nil!5546) (Cons!5545 (h!6401 (_ BitVec 64)) (t!10699 List!5549)) )
))
(declare-fun noDuplicate!189 (List!5549) Bool)

(assert (=> b!366477 (= e!224358 (not (noDuplicate!189 Nil!5546)))))

(declare-fun b!366478 () Bool)

(declare-fun res!205004 () Bool)

(assert (=> b!366478 (=> (not res!205004) (not e!224358))))

(declare-fun arrayNoDuplicates!0 (array!20993 (_ BitVec 32) List!5549) Bool)

(assert (=> b!366478 (= res!205004 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5546))))

(declare-fun b!366479 () Bool)

(declare-fun e!224360 () Bool)

(assert (=> b!366479 (= e!224360 (and e!224359 mapRes!14337))))

(declare-fun condMapEmpty!14337 () Bool)

(declare-fun mapDefault!14337 () ValueCell!3916)

