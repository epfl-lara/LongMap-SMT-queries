; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40048 () Bool)

(assert start!40048)

(declare-fun b_free!10315 () Bool)

(declare-fun b_next!10315 () Bool)

(assert (=> start!40048 (= b_free!10315 (not b_next!10315))))

(declare-fun tp!36474 () Bool)

(declare-fun b_and!18283 () Bool)

(assert (=> start!40048 (= tp!36474 b_and!18283)))

(declare-fun b!436916 () Bool)

(declare-fun res!257642 () Bool)

(declare-fun e!257951 () Bool)

(assert (=> b!436916 (=> (not res!257642) (not e!257951))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436916 (= res!257642 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18822 () Bool)

(declare-fun mapRes!18822 () Bool)

(assert (=> mapIsEmpty!18822 mapRes!18822))

(declare-fun b!436917 () Bool)

(declare-fun res!257643 () Bool)

(declare-fun e!257953 () Bool)

(assert (=> b!436917 (=> (not res!257643) (not e!257953))))

(declare-datatypes ((array!26757 0))(
  ( (array!26758 (arr!12828 (Array (_ BitVec 32) (_ BitVec 64))) (size!13180 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26757)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16395 0))(
  ( (V!16396 (val!5778 Int)) )
))
(declare-datatypes ((ValueCell!5390 0))(
  ( (ValueCellFull!5390 (v!8025 V!16395)) (EmptyCell!5390) )
))
(declare-datatypes ((array!26759 0))(
  ( (array!26760 (arr!12829 (Array (_ BitVec 32) ValueCell!5390)) (size!13181 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26759)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!436917 (= res!257643 (and (= (size!13181 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13180 _keys!709) (size!13181 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436918 () Bool)

(declare-fun res!257646 () Bool)

(assert (=> b!436918 (=> (not res!257646) (not e!257953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436918 (= res!257646 (validMask!0 mask!1025))))

(declare-fun b!436919 () Bool)

(declare-fun res!257640 () Bool)

(assert (=> b!436919 (=> (not res!257640) (not e!257953))))

(assert (=> b!436919 (= res!257640 (or (= (select (arr!12828 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12828 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18822 () Bool)

(declare-fun tp!36473 () Bool)

(declare-fun e!257954 () Bool)

(assert (=> mapNonEmpty!18822 (= mapRes!18822 (and tp!36473 e!257954))))

(declare-fun mapKey!18822 () (_ BitVec 32))

(declare-fun mapValue!18822 () ValueCell!5390)

(declare-fun mapRest!18822 () (Array (_ BitVec 32) ValueCell!5390))

(assert (=> mapNonEmpty!18822 (= (arr!12829 _values!549) (store mapRest!18822 mapKey!18822 mapValue!18822))))

(declare-fun b!436920 () Bool)

(declare-fun res!257638 () Bool)

(assert (=> b!436920 (=> (not res!257638) (not e!257953))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436920 (= res!257638 (validKeyInArray!0 k!794))))

(declare-fun b!436921 () Bool)

(declare-fun e!257949 () Bool)

(declare-fun tp_is_empty!11467 () Bool)

(assert (=> b!436921 (= e!257949 tp_is_empty!11467)))

(declare-fun b!436922 () Bool)

(assert (=> b!436922 (= e!257953 e!257951)))

(declare-fun res!257639 () Bool)

(assert (=> b!436922 (=> (not res!257639) (not e!257951))))

(declare-fun lt!201485 () array!26757)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26757 (_ BitVec 32)) Bool)

(assert (=> b!436922 (= res!257639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201485 mask!1025))))

(assert (=> b!436922 (= lt!201485 (array!26758 (store (arr!12828 _keys!709) i!563 k!794) (size!13180 _keys!709)))))

(declare-fun res!257635 () Bool)

(assert (=> start!40048 (=> (not res!257635) (not e!257953))))

(assert (=> start!40048 (= res!257635 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13180 _keys!709))))))

(assert (=> start!40048 e!257953))

(assert (=> start!40048 tp_is_empty!11467))

(assert (=> start!40048 tp!36474))

(assert (=> start!40048 true))

(declare-fun e!257952 () Bool)

(declare-fun array_inv!9320 (array!26759) Bool)

(assert (=> start!40048 (and (array_inv!9320 _values!549) e!257952)))

(declare-fun array_inv!9321 (array!26757) Bool)

(assert (=> start!40048 (array_inv!9321 _keys!709)))

(declare-fun b!436923 () Bool)

(declare-fun res!257636 () Bool)

(assert (=> b!436923 (=> (not res!257636) (not e!257951))))

(declare-datatypes ((List!7657 0))(
  ( (Nil!7654) (Cons!7653 (h!8509 (_ BitVec 64)) (t!13413 List!7657)) )
))
(declare-fun arrayNoDuplicates!0 (array!26757 (_ BitVec 32) List!7657) Bool)

(assert (=> b!436923 (= res!257636 (arrayNoDuplicates!0 lt!201485 #b00000000000000000000000000000000 Nil!7654))))

(declare-fun b!436924 () Bool)

(declare-fun res!257637 () Bool)

(assert (=> b!436924 (=> (not res!257637) (not e!257953))))

(assert (=> b!436924 (= res!257637 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7654))))

(declare-fun b!436925 () Bool)

(declare-fun e!257950 () Bool)

(assert (=> b!436925 (= e!257951 e!257950)))

(declare-fun res!257634 () Bool)

(assert (=> b!436925 (=> (not res!257634) (not e!257950))))

(assert (=> b!436925 (= res!257634 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16395)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7658 0))(
  ( (tuple2!7659 (_1!3840 (_ BitVec 64)) (_2!3840 V!16395)) )
))
(declare-datatypes ((List!7658 0))(
  ( (Nil!7655) (Cons!7654 (h!8510 tuple2!7658) (t!13414 List!7658)) )
))
(declare-datatypes ((ListLongMap!6571 0))(
  ( (ListLongMap!6572 (toList!3301 List!7658)) )
))
(declare-fun lt!201482 () ListLongMap!6571)

(declare-fun zeroValue!515 () V!16395)

(declare-fun lt!201481 () array!26759)

(declare-fun getCurrentListMapNoExtraKeys!1490 (array!26757 array!26759 (_ BitVec 32) (_ BitVec 32) V!16395 V!16395 (_ BitVec 32) Int) ListLongMap!6571)

(assert (=> b!436925 (= lt!201482 (getCurrentListMapNoExtraKeys!1490 lt!201485 lt!201481 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16395)

(assert (=> b!436925 (= lt!201481 (array!26760 (store (arr!12829 _values!549) i!563 (ValueCellFull!5390 v!412)) (size!13181 _values!549)))))

(declare-fun lt!201483 () ListLongMap!6571)

(assert (=> b!436925 (= lt!201483 (getCurrentListMapNoExtraKeys!1490 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436926 () Bool)

(assert (=> b!436926 (= e!257954 tp_is_empty!11467)))

(declare-fun b!436927 () Bool)

(assert (=> b!436927 (= e!257952 (and e!257949 mapRes!18822))))

(declare-fun condMapEmpty!18822 () Bool)

(declare-fun mapDefault!18822 () ValueCell!5390)

