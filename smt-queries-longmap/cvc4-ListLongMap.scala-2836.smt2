; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40984 () Bool)

(assert start!40984)

(declare-fun b_free!10919 () Bool)

(declare-fun b_next!10919 () Bool)

(assert (=> start!40984 (= b_free!10919 (not b_next!10919))))

(declare-fun tp!38584 () Bool)

(declare-fun b_and!19061 () Bool)

(assert (=> start!40984 (= tp!38584 b_and!19061)))

(declare-fun b!456302 () Bool)

(declare-fun res!272262 () Bool)

(declare-fun e!266628 () Bool)

(assert (=> b!456302 (=> (not res!272262) (not e!266628))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456302 (= res!272262 (validKeyInArray!0 k!794))))

(declare-fun b!456303 () Bool)

(declare-fun e!266629 () Bool)

(declare-fun tp_is_empty!12257 () Bool)

(assert (=> b!456303 (= e!266629 tp_is_empty!12257)))

(declare-fun mapIsEmpty!20026 () Bool)

(declare-fun mapRes!20026 () Bool)

(assert (=> mapIsEmpty!20026 mapRes!20026))

(declare-fun b!456304 () Bool)

(declare-fun res!272263 () Bool)

(assert (=> b!456304 (=> (not res!272263) (not e!266628))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456304 (= res!272263 (validMask!0 mask!1025))))

(declare-fun b!456305 () Bool)

(declare-fun res!272265 () Bool)

(assert (=> b!456305 (=> (not res!272265) (not e!266628))))

(declare-datatypes ((array!28317 0))(
  ( (array!28318 (arr!13602 (Array (_ BitVec 32) (_ BitVec 64))) (size!13954 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28317)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17447 0))(
  ( (V!17448 (val!6173 Int)) )
))
(declare-datatypes ((ValueCell!5785 0))(
  ( (ValueCellFull!5785 (v!8439 V!17447)) (EmptyCell!5785) )
))
(declare-datatypes ((array!28319 0))(
  ( (array!28320 (arr!13603 (Array (_ BitVec 32) ValueCell!5785)) (size!13955 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28319)

(assert (=> b!456305 (= res!272265 (and (= (size!13955 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13954 _keys!709) (size!13955 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456306 () Bool)

(declare-fun e!266626 () Bool)

(assert (=> b!456306 (= e!266628 e!266626)))

(declare-fun res!272264 () Bool)

(assert (=> b!456306 (=> (not res!272264) (not e!266626))))

(declare-fun lt!206510 () array!28317)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28317 (_ BitVec 32)) Bool)

(assert (=> b!456306 (= res!272264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206510 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456306 (= lt!206510 (array!28318 (store (arr!13602 _keys!709) i!563 k!794) (size!13954 _keys!709)))))

(declare-fun b!456308 () Bool)

(declare-fun res!272266 () Bool)

(assert (=> b!456308 (=> (not res!272266) (not e!266626))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456308 (= res!272266 (bvsle from!863 i!563))))

(declare-fun b!456309 () Bool)

(assert (=> b!456309 (= e!266626 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13954 _keys!709)) (bvsge (bvsub (size!13954 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13954 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17447)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17447)

(declare-fun v!412 () V!17447)

(declare-datatypes ((tuple2!8134 0))(
  ( (tuple2!8135 (_1!4078 (_ BitVec 64)) (_2!4078 V!17447)) )
))
(declare-datatypes ((List!8206 0))(
  ( (Nil!8203) (Cons!8202 (h!9058 tuple2!8134) (t!14034 List!8206)) )
))
(declare-datatypes ((ListLongMap!7047 0))(
  ( (ListLongMap!7048 (toList!3539 List!8206)) )
))
(declare-fun lt!206508 () ListLongMap!7047)

(declare-fun getCurrentListMapNoExtraKeys!1722 (array!28317 array!28319 (_ BitVec 32) (_ BitVec 32) V!17447 V!17447 (_ BitVec 32) Int) ListLongMap!7047)

(assert (=> b!456309 (= lt!206508 (getCurrentListMapNoExtraKeys!1722 lt!206510 (array!28320 (store (arr!13603 _values!549) i!563 (ValueCellFull!5785 v!412)) (size!13955 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206509 () ListLongMap!7047)

(assert (=> b!456309 (= lt!206509 (getCurrentListMapNoExtraKeys!1722 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456310 () Bool)

(declare-fun res!272260 () Bool)

(assert (=> b!456310 (=> (not res!272260) (not e!266626))))

(declare-datatypes ((List!8207 0))(
  ( (Nil!8204) (Cons!8203 (h!9059 (_ BitVec 64)) (t!14035 List!8207)) )
))
(declare-fun arrayNoDuplicates!0 (array!28317 (_ BitVec 32) List!8207) Bool)

(assert (=> b!456310 (= res!272260 (arrayNoDuplicates!0 lt!206510 #b00000000000000000000000000000000 Nil!8204))))

(declare-fun b!456311 () Bool)

(declare-fun res!272267 () Bool)

(assert (=> b!456311 (=> (not res!272267) (not e!266628))))

(assert (=> b!456311 (= res!272267 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13954 _keys!709))))))

(declare-fun res!272258 () Bool)

(assert (=> start!40984 (=> (not res!272258) (not e!266628))))

(assert (=> start!40984 (= res!272258 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13954 _keys!709))))))

(assert (=> start!40984 e!266628))

(assert (=> start!40984 tp_is_empty!12257))

(assert (=> start!40984 tp!38584))

(assert (=> start!40984 true))

(declare-fun e!266624 () Bool)

(declare-fun array_inv!9858 (array!28319) Bool)

(assert (=> start!40984 (and (array_inv!9858 _values!549) e!266624)))

(declare-fun array_inv!9859 (array!28317) Bool)

(assert (=> start!40984 (array_inv!9859 _keys!709)))

(declare-fun b!456307 () Bool)

(declare-fun res!272257 () Bool)

(assert (=> b!456307 (=> (not res!272257) (not e!266628))))

(declare-fun arrayContainsKey!0 (array!28317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456307 (= res!272257 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!456312 () Bool)

(declare-fun e!266625 () Bool)

(assert (=> b!456312 (= e!266625 tp_is_empty!12257)))

(declare-fun b!456313 () Bool)

(declare-fun res!272261 () Bool)

(assert (=> b!456313 (=> (not res!272261) (not e!266628))))

(assert (=> b!456313 (= res!272261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456314 () Bool)

(declare-fun res!272259 () Bool)

(assert (=> b!456314 (=> (not res!272259) (not e!266628))))

(assert (=> b!456314 (= res!272259 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8204))))

(declare-fun b!456315 () Bool)

(assert (=> b!456315 (= e!266624 (and e!266625 mapRes!20026))))

(declare-fun condMapEmpty!20026 () Bool)

(declare-fun mapDefault!20026 () ValueCell!5785)

