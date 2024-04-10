; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40256 () Bool)

(assert start!40256)

(declare-fun b_free!10523 () Bool)

(declare-fun b_next!10523 () Bool)

(assert (=> start!40256 (= b_free!10523 (not b_next!10523))))

(declare-fun tp!37098 () Bool)

(declare-fun b_and!18491 () Bool)

(assert (=> start!40256 (= tp!37098 b_and!18491)))

(declare-fun b!441908 () Bool)

(declare-fun res!261693 () Bool)

(declare-fun e!260139 () Bool)

(assert (=> b!441908 (=> (not res!261693) (not e!260139))))

(declare-datatypes ((array!27161 0))(
  ( (array!27162 (arr!13030 (Array (_ BitVec 32) (_ BitVec 64))) (size!13382 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27161)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27161 (_ BitVec 32)) Bool)

(assert (=> b!441908 (= res!261693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441909 () Bool)

(declare-fun res!261699 () Bool)

(assert (=> b!441909 (=> (not res!261699) (not e!260139))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441909 (= res!261699 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19134 () Bool)

(declare-fun mapRes!19134 () Bool)

(assert (=> mapIsEmpty!19134 mapRes!19134))

(declare-fun b!441911 () Bool)

(declare-fun res!261694 () Bool)

(assert (=> b!441911 (=> (not res!261694) (not e!260139))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441911 (= res!261694 (or (= (select (arr!13030 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13030 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441912 () Bool)

(declare-fun res!261696 () Bool)

(assert (=> b!441912 (=> (not res!261696) (not e!260139))))

(declare-datatypes ((List!7825 0))(
  ( (Nil!7822) (Cons!7821 (h!8677 (_ BitVec 64)) (t!13581 List!7825)) )
))
(declare-fun arrayNoDuplicates!0 (array!27161 (_ BitVec 32) List!7825) Bool)

(assert (=> b!441912 (= res!261696 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7822))))

(declare-fun b!441913 () Bool)

(declare-fun res!261692 () Bool)

(assert (=> b!441913 (=> (not res!261692) (not e!260139))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16671 0))(
  ( (V!16672 (val!5882 Int)) )
))
(declare-datatypes ((ValueCell!5494 0))(
  ( (ValueCellFull!5494 (v!8129 V!16671)) (EmptyCell!5494) )
))
(declare-datatypes ((array!27163 0))(
  ( (array!27164 (arr!13031 (Array (_ BitVec 32) ValueCell!5494)) (size!13383 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27163)

(assert (=> b!441913 (= res!261692 (and (= (size!13383 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13382 _keys!709) (size!13383 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441914 () Bool)

(declare-fun e!260133 () Bool)

(declare-fun tp_is_empty!11675 () Bool)

(assert (=> b!441914 (= e!260133 tp_is_empty!11675)))

(declare-fun b!441915 () Bool)

(declare-fun e!260136 () Bool)

(declare-fun e!260138 () Bool)

(assert (=> b!441915 (= e!260136 e!260138)))

(declare-fun res!261690 () Bool)

(assert (=> b!441915 (=> (not res!261690) (not e!260138))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441915 (= res!261690 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!203045 () array!27163)

(declare-fun minValue!515 () V!16671)

(declare-datatypes ((tuple2!7830 0))(
  ( (tuple2!7831 (_1!3926 (_ BitVec 64)) (_2!3926 V!16671)) )
))
(declare-datatypes ((List!7826 0))(
  ( (Nil!7823) (Cons!7822 (h!8678 tuple2!7830) (t!13582 List!7826)) )
))
(declare-datatypes ((ListLongMap!6743 0))(
  ( (ListLongMap!6744 (toList!3387 List!7826)) )
))
(declare-fun lt!203043 () ListLongMap!6743)

(declare-fun zeroValue!515 () V!16671)

(declare-fun lt!203042 () array!27161)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1576 (array!27161 array!27163 (_ BitVec 32) (_ BitVec 32) V!16671 V!16671 (_ BitVec 32) Int) ListLongMap!6743)

(assert (=> b!441915 (= lt!203043 (getCurrentListMapNoExtraKeys!1576 lt!203042 lt!203045 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16671)

(assert (=> b!441915 (= lt!203045 (array!27164 (store (arr!13031 _values!549) i!563 (ValueCellFull!5494 v!412)) (size!13383 _values!549)))))

(declare-fun lt!203041 () ListLongMap!6743)

(assert (=> b!441915 (= lt!203041 (getCurrentListMapNoExtraKeys!1576 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19134 () Bool)

(declare-fun tp!37097 () Bool)

(declare-fun e!260137 () Bool)

(assert (=> mapNonEmpty!19134 (= mapRes!19134 (and tp!37097 e!260137))))

(declare-fun mapValue!19134 () ValueCell!5494)

(declare-fun mapKey!19134 () (_ BitVec 32))

(declare-fun mapRest!19134 () (Array (_ BitVec 32) ValueCell!5494))

(assert (=> mapNonEmpty!19134 (= (arr!13031 _values!549) (store mapRest!19134 mapKey!19134 mapValue!19134))))

(declare-fun b!441916 () Bool)

(assert (=> b!441916 (= e!260139 e!260136)))

(declare-fun res!261702 () Bool)

(assert (=> b!441916 (=> (not res!261702) (not e!260136))))

(assert (=> b!441916 (= res!261702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203042 mask!1025))))

(assert (=> b!441916 (= lt!203042 (array!27162 (store (arr!13030 _keys!709) i!563 k!794) (size!13382 _keys!709)))))

(declare-fun b!441917 () Bool)

(declare-fun res!261695 () Bool)

(assert (=> b!441917 (=> (not res!261695) (not e!260136))))

(assert (=> b!441917 (= res!261695 (bvsle from!863 i!563))))

(declare-fun b!441918 () Bool)

(declare-fun res!261691 () Bool)

(assert (=> b!441918 (=> (not res!261691) (not e!260136))))

(assert (=> b!441918 (= res!261691 (arrayNoDuplicates!0 lt!203042 #b00000000000000000000000000000000 Nil!7822))))

(declare-fun b!441919 () Bool)

(declare-fun e!260134 () Bool)

(assert (=> b!441919 (= e!260134 (and e!260133 mapRes!19134))))

(declare-fun condMapEmpty!19134 () Bool)

(declare-fun mapDefault!19134 () ValueCell!5494)

