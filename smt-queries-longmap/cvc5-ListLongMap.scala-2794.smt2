; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40652 () Bool)

(assert start!40652)

(declare-fun b_free!10663 () Bool)

(declare-fun b_next!10663 () Bool)

(assert (=> start!40652 (= b_free!10663 (not b_next!10663))))

(declare-fun tp!37809 () Bool)

(declare-fun b_and!18671 () Bool)

(assert (=> start!40652 (= tp!37809 b_and!18671)))

(declare-fun b!449087 () Bool)

(declare-fun res!267053 () Bool)

(declare-fun e!263386 () Bool)

(assert (=> b!449087 (=> (not res!267053) (not e!263386))))

(declare-datatypes ((array!27809 0))(
  ( (array!27810 (arr!13350 (Array (_ BitVec 32) (_ BitVec 64))) (size!13702 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27809)

(declare-datatypes ((List!7999 0))(
  ( (Nil!7996) (Cons!7995 (h!8851 (_ BitVec 64)) (t!13761 List!7999)) )
))
(declare-fun arrayNoDuplicates!0 (array!27809 (_ BitVec 32) List!7999) Bool)

(assert (=> b!449087 (= res!267053 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7996))))

(declare-fun mapNonEmpty!19635 () Bool)

(declare-fun mapRes!19635 () Bool)

(declare-fun tp!37808 () Bool)

(declare-fun e!263389 () Bool)

(assert (=> mapNonEmpty!19635 (= mapRes!19635 (and tp!37808 e!263389))))

(declare-datatypes ((V!17107 0))(
  ( (V!17108 (val!6045 Int)) )
))
(declare-datatypes ((ValueCell!5657 0))(
  ( (ValueCellFull!5657 (v!8300 V!17107)) (EmptyCell!5657) )
))
(declare-fun mapRest!19635 () (Array (_ BitVec 32) ValueCell!5657))

(declare-datatypes ((array!27811 0))(
  ( (array!27812 (arr!13351 (Array (_ BitVec 32) ValueCell!5657)) (size!13703 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27811)

(declare-fun mapValue!19635 () ValueCell!5657)

(declare-fun mapKey!19635 () (_ BitVec 32))

(assert (=> mapNonEmpty!19635 (= (arr!13351 _values!549) (store mapRest!19635 mapKey!19635 mapValue!19635))))

(declare-fun b!449088 () Bool)

(declare-fun res!267058 () Bool)

(assert (=> b!449088 (=> (not res!267058) (not e!263386))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449088 (= res!267058 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!19635 () Bool)

(assert (=> mapIsEmpty!19635 mapRes!19635))

(declare-fun b!449089 () Bool)

(declare-fun res!267054 () Bool)

(declare-fun e!263385 () Bool)

(assert (=> b!449089 (=> (not res!267054) (not e!263385))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449089 (= res!267054 (bvsle from!863 i!563))))

(declare-fun b!449090 () Bool)

(declare-fun res!267062 () Bool)

(assert (=> b!449090 (=> (not res!267062) (not e!263386))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449090 (= res!267062 (and (= (size!13703 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13702 _keys!709) (size!13703 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449091 () Bool)

(assert (=> b!449091 (= e!263386 e!263385)))

(declare-fun res!267063 () Bool)

(assert (=> b!449091 (=> (not res!267063) (not e!263385))))

(declare-fun lt!204297 () array!27809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27809 (_ BitVec 32)) Bool)

(assert (=> b!449091 (= res!267063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204297 mask!1025))))

(assert (=> b!449091 (= lt!204297 (array!27810 (store (arr!13350 _keys!709) i!563 k!794) (size!13702 _keys!709)))))

(declare-fun b!449092 () Bool)

(assert (=> b!449092 (= e!263385 false)))

(declare-datatypes ((tuple2!7934 0))(
  ( (tuple2!7935 (_1!3978 (_ BitVec 64)) (_2!3978 V!17107)) )
))
(declare-datatypes ((List!8000 0))(
  ( (Nil!7997) (Cons!7996 (h!8852 tuple2!7934) (t!13762 List!8000)) )
))
(declare-datatypes ((ListLongMap!6847 0))(
  ( (ListLongMap!6848 (toList!3439 List!8000)) )
))
(declare-fun lt!204296 () ListLongMap!6847)

(declare-fun minValue!515 () V!17107)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17107)

(declare-fun v!412 () V!17107)

(declare-fun getCurrentListMapNoExtraKeys!1625 (array!27809 array!27811 (_ BitVec 32) (_ BitVec 32) V!17107 V!17107 (_ BitVec 32) Int) ListLongMap!6847)

(assert (=> b!449092 (= lt!204296 (getCurrentListMapNoExtraKeys!1625 lt!204297 (array!27812 (store (arr!13351 _values!549) i!563 (ValueCellFull!5657 v!412)) (size!13703 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204295 () ListLongMap!6847)

(assert (=> b!449092 (= lt!204295 (getCurrentListMapNoExtraKeys!1625 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449093 () Bool)

(declare-fun res!267056 () Bool)

(assert (=> b!449093 (=> (not res!267056) (not e!263386))))

(assert (=> b!449093 (= res!267056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449094 () Bool)

(declare-fun res!267057 () Bool)

(assert (=> b!449094 (=> (not res!267057) (not e!263385))))

(assert (=> b!449094 (= res!267057 (arrayNoDuplicates!0 lt!204297 #b00000000000000000000000000000000 Nil!7996))))

(declare-fun res!267061 () Bool)

(assert (=> start!40652 (=> (not res!267061) (not e!263386))))

(assert (=> start!40652 (= res!267061 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13702 _keys!709))))))

(assert (=> start!40652 e!263386))

(declare-fun tp_is_empty!12001 () Bool)

(assert (=> start!40652 tp_is_empty!12001))

(assert (=> start!40652 tp!37809))

(assert (=> start!40652 true))

(declare-fun e!263390 () Bool)

(declare-fun array_inv!9674 (array!27811) Bool)

(assert (=> start!40652 (and (array_inv!9674 _values!549) e!263390)))

(declare-fun array_inv!9675 (array!27809) Bool)

(assert (=> start!40652 (array_inv!9675 _keys!709)))

(declare-fun b!449095 () Bool)

(declare-fun res!267059 () Bool)

(assert (=> b!449095 (=> (not res!267059) (not e!263386))))

(assert (=> b!449095 (= res!267059 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13702 _keys!709))))))

(declare-fun b!449096 () Bool)

(declare-fun e!263388 () Bool)

(assert (=> b!449096 (= e!263388 tp_is_empty!12001)))

(declare-fun b!449097 () Bool)

(assert (=> b!449097 (= e!263390 (and e!263388 mapRes!19635))))

(declare-fun condMapEmpty!19635 () Bool)

(declare-fun mapDefault!19635 () ValueCell!5657)

