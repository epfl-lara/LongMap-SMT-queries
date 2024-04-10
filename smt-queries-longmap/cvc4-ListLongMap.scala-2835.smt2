; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40978 () Bool)

(assert start!40978)

(declare-fun b_free!10913 () Bool)

(declare-fun b_next!10913 () Bool)

(assert (=> start!40978 (= b_free!10913 (not b_next!10913))))

(declare-fun tp!38566 () Bool)

(declare-fun b_and!19055 () Bool)

(assert (=> start!40978 (= tp!38566 b_and!19055)))

(declare-fun b!456167 () Bool)

(declare-fun e!266571 () Bool)

(declare-fun tp_is_empty!12251 () Bool)

(assert (=> b!456167 (= e!266571 tp_is_empty!12251)))

(declare-fun mapIsEmpty!20017 () Bool)

(declare-fun mapRes!20017 () Bool)

(assert (=> mapIsEmpty!20017 mapRes!20017))

(declare-fun b!456169 () Bool)

(declare-fun res!272159 () Bool)

(declare-fun e!266574 () Bool)

(assert (=> b!456169 (=> (not res!272159) (not e!266574))))

(declare-datatypes ((array!28305 0))(
  ( (array!28306 (arr!13596 (Array (_ BitVec 32) (_ BitVec 64))) (size!13948 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28305)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17439 0))(
  ( (V!17440 (val!6170 Int)) )
))
(declare-datatypes ((ValueCell!5782 0))(
  ( (ValueCellFull!5782 (v!8436 V!17439)) (EmptyCell!5782) )
))
(declare-datatypes ((array!28307 0))(
  ( (array!28308 (arr!13597 (Array (_ BitVec 32) ValueCell!5782)) (size!13949 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28307)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!456169 (= res!272159 (and (= (size!13949 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13948 _keys!709) (size!13949 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456170 () Bool)

(declare-fun res!272149 () Bool)

(declare-fun e!266572 () Bool)

(assert (=> b!456170 (=> (not res!272149) (not e!266572))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456170 (= res!272149 (bvsle from!863 i!563))))

(declare-fun b!456171 () Bool)

(declare-fun res!272153 () Bool)

(assert (=> b!456171 (=> (not res!272153) (not e!266574))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456171 (= res!272153 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!456172 () Bool)

(declare-fun res!272154 () Bool)

(assert (=> b!456172 (=> (not res!272154) (not e!266574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456172 (= res!272154 (validMask!0 mask!1025))))

(declare-fun b!456173 () Bool)

(declare-fun res!272158 () Bool)

(assert (=> b!456173 (=> (not res!272158) (not e!266574))))

(assert (=> b!456173 (= res!272158 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13948 _keys!709))))))

(declare-fun b!456174 () Bool)

(declare-fun res!272152 () Bool)

(assert (=> b!456174 (=> (not res!272152) (not e!266572))))

(declare-fun lt!206481 () array!28305)

(declare-datatypes ((List!8201 0))(
  ( (Nil!8198) (Cons!8197 (h!9053 (_ BitVec 64)) (t!14029 List!8201)) )
))
(declare-fun arrayNoDuplicates!0 (array!28305 (_ BitVec 32) List!8201) Bool)

(assert (=> b!456174 (= res!272152 (arrayNoDuplicates!0 lt!206481 #b00000000000000000000000000000000 Nil!8198))))

(declare-fun b!456175 () Bool)

(declare-fun e!266570 () Bool)

(assert (=> b!456175 (= e!266570 tp_is_empty!12251)))

(declare-fun b!456176 () Bool)

(declare-fun res!272156 () Bool)

(assert (=> b!456176 (=> (not res!272156) (not e!266574))))

(assert (=> b!456176 (= res!272156 (or (= (select (arr!13596 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13596 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456168 () Bool)

(declare-fun res!272155 () Bool)

(assert (=> b!456168 (=> (not res!272155) (not e!266574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456168 (= res!272155 (validKeyInArray!0 k!794))))

(declare-fun res!272150 () Bool)

(assert (=> start!40978 (=> (not res!272150) (not e!266574))))

(assert (=> start!40978 (= res!272150 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13948 _keys!709))))))

(assert (=> start!40978 e!266574))

(assert (=> start!40978 tp_is_empty!12251))

(assert (=> start!40978 tp!38566))

(assert (=> start!40978 true))

(declare-fun e!266573 () Bool)

(declare-fun array_inv!9854 (array!28307) Bool)

(assert (=> start!40978 (and (array_inv!9854 _values!549) e!266573)))

(declare-fun array_inv!9855 (array!28305) Bool)

(assert (=> start!40978 (array_inv!9855 _keys!709)))

(declare-fun b!456177 () Bool)

(assert (=> b!456177 (= e!266572 false)))

(declare-fun minValue!515 () V!17439)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17439)

(declare-datatypes ((tuple2!8130 0))(
  ( (tuple2!8131 (_1!4076 (_ BitVec 64)) (_2!4076 V!17439)) )
))
(declare-datatypes ((List!8202 0))(
  ( (Nil!8199) (Cons!8198 (h!9054 tuple2!8130) (t!14030 List!8202)) )
))
(declare-datatypes ((ListLongMap!7043 0))(
  ( (ListLongMap!7044 (toList!3537 List!8202)) )
))
(declare-fun lt!206482 () ListLongMap!7043)

(declare-fun v!412 () V!17439)

(declare-fun getCurrentListMapNoExtraKeys!1720 (array!28305 array!28307 (_ BitVec 32) (_ BitVec 32) V!17439 V!17439 (_ BitVec 32) Int) ListLongMap!7043)

(assert (=> b!456177 (= lt!206482 (getCurrentListMapNoExtraKeys!1720 lt!206481 (array!28308 (store (arr!13597 _values!549) i!563 (ValueCellFull!5782 v!412)) (size!13949 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206483 () ListLongMap!7043)

(assert (=> b!456177 (= lt!206483 (getCurrentListMapNoExtraKeys!1720 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456178 () Bool)

(assert (=> b!456178 (= e!266574 e!266572)))

(declare-fun res!272157 () Bool)

(assert (=> b!456178 (=> (not res!272157) (not e!266572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28305 (_ BitVec 32)) Bool)

(assert (=> b!456178 (= res!272157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206481 mask!1025))))

(assert (=> b!456178 (= lt!206481 (array!28306 (store (arr!13596 _keys!709) i!563 k!794) (size!13948 _keys!709)))))

(declare-fun mapNonEmpty!20017 () Bool)

(declare-fun tp!38565 () Bool)

(assert (=> mapNonEmpty!20017 (= mapRes!20017 (and tp!38565 e!266570))))

(declare-fun mapKey!20017 () (_ BitVec 32))

(declare-fun mapRest!20017 () (Array (_ BitVec 32) ValueCell!5782))

(declare-fun mapValue!20017 () ValueCell!5782)

(assert (=> mapNonEmpty!20017 (= (arr!13597 _values!549) (store mapRest!20017 mapKey!20017 mapValue!20017))))

(declare-fun b!456179 () Bool)

(assert (=> b!456179 (= e!266573 (and e!266571 mapRes!20017))))

(declare-fun condMapEmpty!20017 () Bool)

(declare-fun mapDefault!20017 () ValueCell!5782)

