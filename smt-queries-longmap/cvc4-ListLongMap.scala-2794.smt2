; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40656 () Bool)

(assert start!40656)

(declare-fun b_free!10667 () Bool)

(declare-fun b_next!10667 () Bool)

(assert (=> start!40656 (= b_free!10667 (not b_next!10667))))

(declare-fun tp!37821 () Bool)

(declare-fun b_and!18675 () Bool)

(assert (=> start!40656 (= tp!37821 b_and!18675)))

(declare-fun b!449177 () Bool)

(declare-fun res!267132 () Bool)

(declare-fun e!263423 () Bool)

(assert (=> b!449177 (=> (not res!267132) (not e!263423))))

(declare-datatypes ((array!27817 0))(
  ( (array!27818 (arr!13354 (Array (_ BitVec 32) (_ BitVec 64))) (size!13706 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27817)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449177 (= res!267132 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!267126 () Bool)

(assert (=> start!40656 (=> (not res!267126) (not e!263423))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40656 (= res!267126 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13706 _keys!709))))))

(assert (=> start!40656 e!263423))

(declare-fun tp_is_empty!12005 () Bool)

(assert (=> start!40656 tp_is_empty!12005))

(assert (=> start!40656 tp!37821))

(assert (=> start!40656 true))

(declare-datatypes ((V!17111 0))(
  ( (V!17112 (val!6047 Int)) )
))
(declare-datatypes ((ValueCell!5659 0))(
  ( (ValueCellFull!5659 (v!8302 V!17111)) (EmptyCell!5659) )
))
(declare-datatypes ((array!27819 0))(
  ( (array!27820 (arr!13355 (Array (_ BitVec 32) ValueCell!5659)) (size!13707 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27819)

(declare-fun e!263425 () Bool)

(declare-fun array_inv!9678 (array!27819) Bool)

(assert (=> start!40656 (and (array_inv!9678 _values!549) e!263425)))

(declare-fun array_inv!9679 (array!27817) Bool)

(assert (=> start!40656 (array_inv!9679 _keys!709)))

(declare-fun b!449178 () Bool)

(declare-fun res!267128 () Bool)

(assert (=> b!449178 (=> (not res!267128) (not e!263423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449178 (= res!267128 (validKeyInArray!0 k!794))))

(declare-fun b!449179 () Bool)

(declare-fun res!267127 () Bool)

(assert (=> b!449179 (=> (not res!267127) (not e!263423))))

(declare-datatypes ((List!8003 0))(
  ( (Nil!8000) (Cons!7999 (h!8855 (_ BitVec 64)) (t!13765 List!8003)) )
))
(declare-fun arrayNoDuplicates!0 (array!27817 (_ BitVec 32) List!8003) Bool)

(assert (=> b!449179 (= res!267127 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8000))))

(declare-fun b!449180 () Bool)

(declare-fun e!263426 () Bool)

(assert (=> b!449180 (= e!263426 tp_is_empty!12005)))

(declare-fun b!449181 () Bool)

(declare-fun res!267133 () Bool)

(assert (=> b!449181 (=> (not res!267133) (not e!263423))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449181 (= res!267133 (and (= (size!13707 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13706 _keys!709) (size!13707 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449182 () Bool)

(declare-fun res!267135 () Bool)

(assert (=> b!449182 (=> (not res!267135) (not e!263423))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449182 (= res!267135 (or (= (select (arr!13354 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13354 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19641 () Bool)

(declare-fun mapRes!19641 () Bool)

(assert (=> mapIsEmpty!19641 mapRes!19641))

(declare-fun b!449183 () Bool)

(declare-fun e!263422 () Bool)

(assert (=> b!449183 (= e!263422 false)))

(declare-fun minValue!515 () V!17111)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17111)

(declare-datatypes ((tuple2!7938 0))(
  ( (tuple2!7939 (_1!3980 (_ BitVec 64)) (_2!3980 V!17111)) )
))
(declare-datatypes ((List!8004 0))(
  ( (Nil!8001) (Cons!8000 (h!8856 tuple2!7938) (t!13766 List!8004)) )
))
(declare-datatypes ((ListLongMap!6851 0))(
  ( (ListLongMap!6852 (toList!3441 List!8004)) )
))
(declare-fun lt!204314 () ListLongMap!6851)

(declare-fun v!412 () V!17111)

(declare-fun lt!204315 () array!27817)

(declare-fun getCurrentListMapNoExtraKeys!1627 (array!27817 array!27819 (_ BitVec 32) (_ BitVec 32) V!17111 V!17111 (_ BitVec 32) Int) ListLongMap!6851)

(assert (=> b!449183 (= lt!204314 (getCurrentListMapNoExtraKeys!1627 lt!204315 (array!27820 (store (arr!13355 _values!549) i!563 (ValueCellFull!5659 v!412)) (size!13707 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204313 () ListLongMap!6851)

(assert (=> b!449183 (= lt!204313 (getCurrentListMapNoExtraKeys!1627 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449184 () Bool)

(declare-fun res!267130 () Bool)

(assert (=> b!449184 (=> (not res!267130) (not e!263423))))

(assert (=> b!449184 (= res!267130 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13706 _keys!709))))))

(declare-fun b!449185 () Bool)

(declare-fun res!267124 () Bool)

(assert (=> b!449185 (=> (not res!267124) (not e!263422))))

(assert (=> b!449185 (= res!267124 (bvsle from!863 i!563))))

(declare-fun b!449186 () Bool)

(declare-fun e!263421 () Bool)

(assert (=> b!449186 (= e!263421 tp_is_empty!12005)))

(declare-fun b!449187 () Bool)

(declare-fun res!267125 () Bool)

(assert (=> b!449187 (=> (not res!267125) (not e!263423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449187 (= res!267125 (validMask!0 mask!1025))))

(declare-fun b!449188 () Bool)

(assert (=> b!449188 (= e!263425 (and e!263421 mapRes!19641))))

(declare-fun condMapEmpty!19641 () Bool)

(declare-fun mapDefault!19641 () ValueCell!5659)

