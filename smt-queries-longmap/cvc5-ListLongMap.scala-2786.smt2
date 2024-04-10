; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40604 () Bool)

(assert start!40604)

(declare-fun b_free!10615 () Bool)

(declare-fun b_next!10615 () Bool)

(assert (=> start!40604 (= b_free!10615 (not b_next!10615))))

(declare-fun tp!37664 () Bool)

(declare-fun b_and!18623 () Bool)

(assert (=> start!40604 (= tp!37664 b_and!18623)))

(declare-fun b!448007 () Bool)

(declare-fun res!266188 () Bool)

(declare-fun e!262953 () Bool)

(assert (=> b!448007 (=> (not res!266188) (not e!262953))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27713 0))(
  ( (array!27714 (arr!13302 (Array (_ BitVec 32) (_ BitVec 64))) (size!13654 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27713)

(assert (=> b!448007 (= res!266188 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13654 _keys!709))))))

(declare-fun b!448008 () Bool)

(declare-fun e!262958 () Bool)

(assert (=> b!448008 (= e!262958 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17043 0))(
  ( (V!17044 (val!6021 Int)) )
))
(declare-fun minValue!515 () V!17043)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7896 0))(
  ( (tuple2!7897 (_1!3959 (_ BitVec 64)) (_2!3959 V!17043)) )
))
(declare-datatypes ((List!7961 0))(
  ( (Nil!7958) (Cons!7957 (h!8813 tuple2!7896) (t!13723 List!7961)) )
))
(declare-datatypes ((ListLongMap!6809 0))(
  ( (ListLongMap!6810 (toList!3420 List!7961)) )
))
(declare-fun lt!204080 () ListLongMap!6809)

(declare-datatypes ((ValueCell!5633 0))(
  ( (ValueCellFull!5633 (v!8276 V!17043)) (EmptyCell!5633) )
))
(declare-datatypes ((array!27715 0))(
  ( (array!27716 (arr!13303 (Array (_ BitVec 32) ValueCell!5633)) (size!13655 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27715)

(declare-fun zeroValue!515 () V!17043)

(declare-fun lt!204081 () array!27713)

(declare-fun v!412 () V!17043)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1606 (array!27713 array!27715 (_ BitVec 32) (_ BitVec 32) V!17043 V!17043 (_ BitVec 32) Int) ListLongMap!6809)

(assert (=> b!448008 (= lt!204080 (getCurrentListMapNoExtraKeys!1606 lt!204081 (array!27716 (store (arr!13303 _values!549) i!563 (ValueCellFull!5633 v!412)) (size!13655 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204079 () ListLongMap!6809)

(assert (=> b!448008 (= lt!204079 (getCurrentListMapNoExtraKeys!1606 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448009 () Bool)

(assert (=> b!448009 (= e!262953 e!262958)))

(declare-fun res!266197 () Bool)

(assert (=> b!448009 (=> (not res!266197) (not e!262958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27713 (_ BitVec 32)) Bool)

(assert (=> b!448009 (= res!266197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204081 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!448009 (= lt!204081 (array!27714 (store (arr!13302 _keys!709) i!563 k!794) (size!13654 _keys!709)))))

(declare-fun b!448010 () Bool)

(declare-fun res!266193 () Bool)

(assert (=> b!448010 (=> (not res!266193) (not e!262953))))

(assert (=> b!448010 (= res!266193 (or (= (select (arr!13302 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13302 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448011 () Bool)

(declare-fun res!266192 () Bool)

(assert (=> b!448011 (=> (not res!266192) (not e!262953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448011 (= res!266192 (validKeyInArray!0 k!794))))

(declare-fun b!448012 () Bool)

(declare-fun res!266189 () Bool)

(assert (=> b!448012 (=> (not res!266189) (not e!262953))))

(assert (=> b!448012 (= res!266189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448014 () Bool)

(declare-fun res!266191 () Bool)

(assert (=> b!448014 (=> (not res!266191) (not e!262953))))

(assert (=> b!448014 (= res!266191 (and (= (size!13655 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13654 _keys!709) (size!13655 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448015 () Bool)

(declare-fun e!262957 () Bool)

(declare-fun tp_is_empty!11953 () Bool)

(assert (=> b!448015 (= e!262957 tp_is_empty!11953)))

(declare-fun b!448016 () Bool)

(declare-fun res!266195 () Bool)

(assert (=> b!448016 (=> (not res!266195) (not e!262958))))

(assert (=> b!448016 (= res!266195 (bvsle from!863 i!563))))

(declare-fun b!448017 () Bool)

(declare-fun res!266194 () Bool)

(assert (=> b!448017 (=> (not res!266194) (not e!262953))))

(declare-datatypes ((List!7962 0))(
  ( (Nil!7959) (Cons!7958 (h!8814 (_ BitVec 64)) (t!13724 List!7962)) )
))
(declare-fun arrayNoDuplicates!0 (array!27713 (_ BitVec 32) List!7962) Bool)

(assert (=> b!448017 (= res!266194 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7959))))

(declare-fun mapIsEmpty!19563 () Bool)

(declare-fun mapRes!19563 () Bool)

(assert (=> mapIsEmpty!19563 mapRes!19563))

(declare-fun mapNonEmpty!19563 () Bool)

(declare-fun tp!37665 () Bool)

(assert (=> mapNonEmpty!19563 (= mapRes!19563 (and tp!37665 e!262957))))

(declare-fun mapValue!19563 () ValueCell!5633)

(declare-fun mapKey!19563 () (_ BitVec 32))

(declare-fun mapRest!19563 () (Array (_ BitVec 32) ValueCell!5633))

(assert (=> mapNonEmpty!19563 (= (arr!13303 _values!549) (store mapRest!19563 mapKey!19563 mapValue!19563))))

(declare-fun b!448018 () Bool)

(declare-fun e!262954 () Bool)

(declare-fun e!262955 () Bool)

(assert (=> b!448018 (= e!262954 (and e!262955 mapRes!19563))))

(declare-fun condMapEmpty!19563 () Bool)

(declare-fun mapDefault!19563 () ValueCell!5633)

