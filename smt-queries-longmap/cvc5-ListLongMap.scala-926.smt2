; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20652 () Bool)

(assert start!20652)

(declare-fun b_free!5311 () Bool)

(declare-fun b_next!5311 () Bool)

(assert (=> start!20652 (= b_free!5311 (not b_next!5311))))

(declare-fun tp!18965 () Bool)

(declare-fun b_and!12057 () Bool)

(assert (=> start!20652 (= tp!18965 b_and!12057)))

(declare-fun b!206244 () Bool)

(declare-fun res!99864 () Bool)

(declare-fun e!134816 () Bool)

(assert (=> b!206244 (=> (not res!99864) (not e!134816))))

(declare-datatypes ((array!9545 0))(
  ( (array!9546 (arr!4523 (Array (_ BitVec 32) (_ BitVec 64))) (size!4848 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9545)

(declare-datatypes ((List!2884 0))(
  ( (Nil!2881) (Cons!2880 (h!3522 (_ BitVec 64)) (t!7815 List!2884)) )
))
(declare-fun arrayNoDuplicates!0 (array!9545 (_ BitVec 32) List!2884) Bool)

(assert (=> b!206244 (= res!99864 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2881))))

(declare-fun b!206245 () Bool)

(declare-fun e!134813 () Bool)

(assert (=> b!206245 (= e!134813 true)))

(declare-datatypes ((V!6537 0))(
  ( (V!6538 (val!2628 Int)) )
))
(declare-datatypes ((tuple2!3992 0))(
  ( (tuple2!3993 (_1!2007 (_ BitVec 64)) (_2!2007 V!6537)) )
))
(declare-datatypes ((List!2885 0))(
  ( (Nil!2882) (Cons!2881 (h!3523 tuple2!3992) (t!7816 List!2885)) )
))
(declare-datatypes ((ListLongMap!2905 0))(
  ( (ListLongMap!2906 (toList!1468 List!2885)) )
))
(declare-fun lt!105380 () ListLongMap!2905)

(declare-fun lt!105386 () ListLongMap!2905)

(declare-fun lt!105381 () tuple2!3992)

(declare-fun +!495 (ListLongMap!2905 tuple2!3992) ListLongMap!2905)

(assert (=> b!206245 (= lt!105380 (+!495 lt!105386 lt!105381))))

(declare-fun minValue!615 () V!6537)

(declare-datatypes ((Unit!6278 0))(
  ( (Unit!6279) )
))
(declare-fun lt!105385 () Unit!6278)

(declare-fun lt!105383 () ListLongMap!2905)

(declare-fun v!520 () V!6537)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!193 (ListLongMap!2905 (_ BitVec 64) V!6537 (_ BitVec 64) V!6537) Unit!6278)

(assert (=> b!206245 (= lt!105385 (addCommutativeForDiffKeys!193 lt!105383 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206246 () Bool)

(declare-fun res!99868 () Bool)

(assert (=> b!206246 (=> (not res!99868) (not e!134816))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9545 (_ BitVec 32)) Bool)

(assert (=> b!206246 (= res!99868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206247 () Bool)

(declare-fun res!99860 () Bool)

(assert (=> b!206247 (=> (not res!99860) (not e!134816))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206247 (= res!99860 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4848 _keys!825))))))

(declare-fun res!99863 () Bool)

(assert (=> start!20652 (=> (not res!99863) (not e!134816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20652 (= res!99863 (validMask!0 mask!1149))))

(assert (=> start!20652 e!134816))

(declare-datatypes ((ValueCell!2240 0))(
  ( (ValueCellFull!2240 (v!4598 V!6537)) (EmptyCell!2240) )
))
(declare-datatypes ((array!9547 0))(
  ( (array!9548 (arr!4524 (Array (_ BitVec 32) ValueCell!2240)) (size!4849 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9547)

(declare-fun e!134819 () Bool)

(declare-fun array_inv!2991 (array!9547) Bool)

(assert (=> start!20652 (and (array_inv!2991 _values!649) e!134819)))

(assert (=> start!20652 true))

(declare-fun tp_is_empty!5167 () Bool)

(assert (=> start!20652 tp_is_empty!5167))

(declare-fun array_inv!2992 (array!9545) Bool)

(assert (=> start!20652 (array_inv!2992 _keys!825)))

(assert (=> start!20652 tp!18965))

(declare-fun b!206248 () Bool)

(declare-fun res!99865 () Bool)

(assert (=> b!206248 (=> (not res!99865) (not e!134816))))

(assert (=> b!206248 (= res!99865 (= (select (arr!4523 _keys!825) i!601) k!843))))

(declare-fun b!206249 () Bool)

(declare-fun e!134817 () Bool)

(assert (=> b!206249 (= e!134817 tp_is_empty!5167)))

(declare-fun b!206250 () Bool)

(declare-fun mapRes!8819 () Bool)

(assert (=> b!206250 (= e!134819 (and e!134817 mapRes!8819))))

(declare-fun condMapEmpty!8819 () Bool)

(declare-fun mapDefault!8819 () ValueCell!2240)

