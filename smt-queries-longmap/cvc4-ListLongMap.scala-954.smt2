; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20824 () Bool)

(assert start!20824)

(declare-fun b_free!5477 () Bool)

(declare-fun b_next!5477 () Bool)

(assert (=> start!20824 (= b_free!5477 (not b_next!5477))))

(declare-fun tp!19471 () Bool)

(declare-fun b_and!12223 () Bool)

(assert (=> start!20824 (= tp!19471 b_and!12223)))

(declare-fun mapNonEmpty!9077 () Bool)

(declare-fun mapRes!9077 () Bool)

(declare-fun tp!19472 () Bool)

(declare-fun e!136135 () Bool)

(assert (=> mapNonEmpty!9077 (= mapRes!9077 (and tp!19472 e!136135))))

(declare-fun mapKey!9077 () (_ BitVec 32))

(declare-datatypes ((V!6765 0))(
  ( (V!6766 (val!2714 Int)) )
))
(declare-datatypes ((ValueCell!2326 0))(
  ( (ValueCellFull!2326 (v!4684 V!6765)) (EmptyCell!2326) )
))
(declare-datatypes ((array!9881 0))(
  ( (array!9882 (arr!4691 (Array (_ BitVec 32) ValueCell!2326)) (size!5016 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9881)

(declare-fun mapRest!9077 () (Array (_ BitVec 32) ValueCell!2326))

(declare-fun mapValue!9077 () ValueCell!2326)

(assert (=> mapNonEmpty!9077 (= (arr!4691 _values!649) (store mapRest!9077 mapKey!9077 mapValue!9077))))

(declare-fun b!208820 () Bool)

(declare-fun res!101663 () Bool)

(declare-fun e!136137 () Bool)

(assert (=> b!208820 (=> (not res!101663) (not e!136137))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208820 (= res!101663 (validKeyInArray!0 k!843))))

(declare-fun b!208821 () Bool)

(declare-fun res!101666 () Bool)

(assert (=> b!208821 (=> (not res!101666) (not e!136137))))

(declare-datatypes ((array!9883 0))(
  ( (array!9884 (arr!4692 (Array (_ BitVec 32) (_ BitVec 64))) (size!5017 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9883)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208821 (= res!101666 (= (select (arr!4692 _keys!825) i!601) k!843))))

(declare-fun b!208822 () Bool)

(assert (=> b!208822 (= e!136137 false)))

(declare-datatypes ((tuple2!4108 0))(
  ( (tuple2!4109 (_1!2065 (_ BitVec 64)) (_2!2065 V!6765)) )
))
(declare-datatypes ((List!3005 0))(
  ( (Nil!3002) (Cons!3001 (h!3643 tuple2!4108) (t!7936 List!3005)) )
))
(declare-datatypes ((ListLongMap!3021 0))(
  ( (ListLongMap!3022 (toList!1526 List!3005)) )
))
(declare-fun lt!106862 () ListLongMap!3021)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6765)

(declare-fun zeroValue!615 () V!6765)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6765)

(declare-fun getCurrentListMapNoExtraKeys!467 (array!9883 array!9881 (_ BitVec 32) (_ BitVec 32) V!6765 V!6765 (_ BitVec 32) Int) ListLongMap!3021)

(assert (=> b!208822 (= lt!106862 (getCurrentListMapNoExtraKeys!467 _keys!825 (array!9882 (store (arr!4691 _values!649) i!601 (ValueCellFull!2326 v!520)) (size!5016 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106863 () ListLongMap!3021)

(assert (=> b!208822 (= lt!106863 (getCurrentListMapNoExtraKeys!467 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208823 () Bool)

(declare-fun res!101668 () Bool)

(assert (=> b!208823 (=> (not res!101668) (not e!136137))))

(assert (=> b!208823 (= res!101668 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5017 _keys!825))))))

(declare-fun b!208824 () Bool)

(declare-fun e!136136 () Bool)

(declare-fun tp_is_empty!5339 () Bool)

(assert (=> b!208824 (= e!136136 tp_is_empty!5339)))

(declare-fun b!208825 () Bool)

(declare-fun res!101664 () Bool)

(assert (=> b!208825 (=> (not res!101664) (not e!136137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9883 (_ BitVec 32)) Bool)

(assert (=> b!208825 (= res!101664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208826 () Bool)

(declare-fun res!101665 () Bool)

(assert (=> b!208826 (=> (not res!101665) (not e!136137))))

(assert (=> b!208826 (= res!101665 (and (= (size!5016 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5017 _keys!825) (size!5016 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208827 () Bool)

(declare-fun e!136139 () Bool)

(assert (=> b!208827 (= e!136139 (and e!136136 mapRes!9077))))

(declare-fun condMapEmpty!9077 () Bool)

(declare-fun mapDefault!9077 () ValueCell!2326)

