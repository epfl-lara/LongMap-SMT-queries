; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40628 () Bool)

(assert start!40628)

(declare-fun b_free!10639 () Bool)

(declare-fun b_next!10639 () Bool)

(assert (=> start!40628 (= b_free!10639 (not b_next!10639))))

(declare-fun tp!37737 () Bool)

(declare-fun b_and!18647 () Bool)

(assert (=> start!40628 (= tp!37737 b_and!18647)))

(declare-fun b!448547 () Bool)

(declare-fun res!266623 () Bool)

(declare-fun e!263171 () Bool)

(assert (=> b!448547 (=> (not res!266623) (not e!263171))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27761 0))(
  ( (array!27762 (arr!13326 (Array (_ BitVec 32) (_ BitVec 64))) (size!13678 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27761)

(assert (=> b!448547 (= res!266623 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13678 _keys!709))))))

(declare-fun b!448548 () Bool)

(declare-fun res!266627 () Bool)

(declare-fun e!263170 () Bool)

(assert (=> b!448548 (=> (not res!266627) (not e!263170))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!448548 (= res!266627 (bvsle from!863 i!563))))

(declare-fun b!448549 () Bool)

(assert (=> b!448549 (= e!263171 e!263170)))

(declare-fun res!266630 () Bool)

(assert (=> b!448549 (=> (not res!266630) (not e!263170))))

(declare-fun lt!204189 () array!27761)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27761 (_ BitVec 32)) Bool)

(assert (=> b!448549 (= res!266630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204189 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!448549 (= lt!204189 (array!27762 (store (arr!13326 _keys!709) i!563 k!794) (size!13678 _keys!709)))))

(declare-fun b!448550 () Bool)

(declare-fun res!266628 () Bool)

(assert (=> b!448550 (=> (not res!266628) (not e!263170))))

(declare-datatypes ((List!7980 0))(
  ( (Nil!7977) (Cons!7976 (h!8832 (_ BitVec 64)) (t!13742 List!7980)) )
))
(declare-fun arrayNoDuplicates!0 (array!27761 (_ BitVec 32) List!7980) Bool)

(assert (=> b!448550 (= res!266628 (arrayNoDuplicates!0 lt!204189 #b00000000000000000000000000000000 Nil!7977))))

(declare-fun b!448551 () Bool)

(declare-fun e!263173 () Bool)

(declare-fun tp_is_empty!11977 () Bool)

(assert (=> b!448551 (= e!263173 tp_is_empty!11977)))

(declare-fun b!448552 () Bool)

(assert (=> b!448552 (= e!263170 false)))

(declare-datatypes ((V!17075 0))(
  ( (V!17076 (val!6033 Int)) )
))
(declare-fun minValue!515 () V!17075)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5645 0))(
  ( (ValueCellFull!5645 (v!8288 V!17075)) (EmptyCell!5645) )
))
(declare-datatypes ((array!27763 0))(
  ( (array!27764 (arr!13327 (Array (_ BitVec 32) ValueCell!5645)) (size!13679 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27763)

(declare-fun zeroValue!515 () V!17075)

(declare-fun v!412 () V!17075)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7916 0))(
  ( (tuple2!7917 (_1!3969 (_ BitVec 64)) (_2!3969 V!17075)) )
))
(declare-datatypes ((List!7981 0))(
  ( (Nil!7978) (Cons!7977 (h!8833 tuple2!7916) (t!13743 List!7981)) )
))
(declare-datatypes ((ListLongMap!6829 0))(
  ( (ListLongMap!6830 (toList!3430 List!7981)) )
))
(declare-fun lt!204187 () ListLongMap!6829)

(declare-fun getCurrentListMapNoExtraKeys!1616 (array!27761 array!27763 (_ BitVec 32) (_ BitVec 32) V!17075 V!17075 (_ BitVec 32) Int) ListLongMap!6829)

(assert (=> b!448552 (= lt!204187 (getCurrentListMapNoExtraKeys!1616 lt!204189 (array!27764 (store (arr!13327 _values!549) i!563 (ValueCellFull!5645 v!412)) (size!13679 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204188 () ListLongMap!6829)

(assert (=> b!448552 (= lt!204188 (getCurrentListMapNoExtraKeys!1616 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448554 () Bool)

(declare-fun res!266621 () Bool)

(assert (=> b!448554 (=> (not res!266621) (not e!263171))))

(assert (=> b!448554 (= res!266621 (and (= (size!13679 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13678 _keys!709) (size!13679 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448555 () Bool)

(declare-fun res!266625 () Bool)

(assert (=> b!448555 (=> (not res!266625) (not e!263171))))

(assert (=> b!448555 (= res!266625 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7977))))

(declare-fun b!448556 () Bool)

(declare-fun res!266631 () Bool)

(assert (=> b!448556 (=> (not res!266631) (not e!263171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448556 (= res!266631 (validMask!0 mask!1025))))

(declare-fun b!448557 () Bool)

(declare-fun res!266629 () Bool)

(assert (=> b!448557 (=> (not res!266629) (not e!263171))))

(assert (=> b!448557 (= res!266629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19599 () Bool)

(declare-fun mapRes!19599 () Bool)

(declare-fun tp!37736 () Bool)

(declare-fun e!263169 () Bool)

(assert (=> mapNonEmpty!19599 (= mapRes!19599 (and tp!37736 e!263169))))

(declare-fun mapKey!19599 () (_ BitVec 32))

(declare-fun mapRest!19599 () (Array (_ BitVec 32) ValueCell!5645))

(declare-fun mapValue!19599 () ValueCell!5645)

(assert (=> mapNonEmpty!19599 (= (arr!13327 _values!549) (store mapRest!19599 mapKey!19599 mapValue!19599))))

(declare-fun b!448553 () Bool)

(declare-fun res!266622 () Bool)

(assert (=> b!448553 (=> (not res!266622) (not e!263171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448553 (= res!266622 (validKeyInArray!0 k!794))))

(declare-fun res!266620 () Bool)

(assert (=> start!40628 (=> (not res!266620) (not e!263171))))

(assert (=> start!40628 (= res!266620 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13678 _keys!709))))))

(assert (=> start!40628 e!263171))

(assert (=> start!40628 tp_is_empty!11977))

(assert (=> start!40628 tp!37737))

(assert (=> start!40628 true))

(declare-fun e!263174 () Bool)

(declare-fun array_inv!9656 (array!27763) Bool)

(assert (=> start!40628 (and (array_inv!9656 _values!549) e!263174)))

(declare-fun array_inv!9657 (array!27761) Bool)

(assert (=> start!40628 (array_inv!9657 _keys!709)))

(declare-fun b!448558 () Bool)

(assert (=> b!448558 (= e!263169 tp_is_empty!11977)))

(declare-fun mapIsEmpty!19599 () Bool)

(assert (=> mapIsEmpty!19599 mapRes!19599))

(declare-fun b!448559 () Bool)

(declare-fun res!266624 () Bool)

(assert (=> b!448559 (=> (not res!266624) (not e!263171))))

(declare-fun arrayContainsKey!0 (array!27761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448559 (= res!266624 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!448560 () Bool)

(declare-fun res!266626 () Bool)

(assert (=> b!448560 (=> (not res!266626) (not e!263171))))

(assert (=> b!448560 (= res!266626 (or (= (select (arr!13326 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13326 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448561 () Bool)

(assert (=> b!448561 (= e!263174 (and e!263173 mapRes!19599))))

(declare-fun condMapEmpty!19599 () Bool)

(declare-fun mapDefault!19599 () ValueCell!5645)

