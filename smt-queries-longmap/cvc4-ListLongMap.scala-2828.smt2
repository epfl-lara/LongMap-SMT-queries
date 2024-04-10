; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40936 () Bool)

(assert start!40936)

(declare-fun b_free!10871 () Bool)

(declare-fun b_next!10871 () Bool)

(assert (=> start!40936 (= b_free!10871 (not b_next!10871))))

(declare-fun tp!38439 () Bool)

(declare-fun b_and!19013 () Bool)

(assert (=> start!40936 (= tp!38439 b_and!19013)))

(declare-fun b!455222 () Bool)

(declare-fun e!266193 () Bool)

(assert (=> b!455222 (= e!266193 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17383 0))(
  ( (V!17384 (val!6149 Int)) )
))
(declare-fun minValue!515 () V!17383)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8104 0))(
  ( (tuple2!8105 (_1!4063 (_ BitVec 64)) (_2!4063 V!17383)) )
))
(declare-datatypes ((List!8167 0))(
  ( (Nil!8164) (Cons!8163 (h!9019 tuple2!8104) (t!13995 List!8167)) )
))
(declare-datatypes ((ListLongMap!7017 0))(
  ( (ListLongMap!7018 (toList!3524 List!8167)) )
))
(declare-fun lt!206292 () ListLongMap!7017)

(declare-datatypes ((ValueCell!5761 0))(
  ( (ValueCellFull!5761 (v!8415 V!17383)) (EmptyCell!5761) )
))
(declare-datatypes ((array!28221 0))(
  ( (array!28222 (arr!13554 (Array (_ BitVec 32) ValueCell!5761)) (size!13906 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28221)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28223 0))(
  ( (array!28224 (arr!13555 (Array (_ BitVec 32) (_ BitVec 64))) (size!13907 (_ BitVec 32))) )
))
(declare-fun lt!206294 () array!28223)

(declare-fun v!412 () V!17383)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17383)

(declare-fun getCurrentListMapNoExtraKeys!1707 (array!28223 array!28221 (_ BitVec 32) (_ BitVec 32) V!17383 V!17383 (_ BitVec 32) Int) ListLongMap!7017)

(assert (=> b!455222 (= lt!206292 (getCurrentListMapNoExtraKeys!1707 lt!206294 (array!28222 (store (arr!13554 _values!549) i!563 (ValueCellFull!5761 v!412)) (size!13906 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206293 () ListLongMap!7017)

(declare-fun _keys!709 () array!28223)

(assert (=> b!455222 (= lt!206293 (getCurrentListMapNoExtraKeys!1707 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!271397 () Bool)

(declare-fun e!266196 () Bool)

(assert (=> start!40936 (=> (not res!271397) (not e!266196))))

(assert (=> start!40936 (= res!271397 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13907 _keys!709))))))

(assert (=> start!40936 e!266196))

(declare-fun tp_is_empty!12209 () Bool)

(assert (=> start!40936 tp_is_empty!12209))

(assert (=> start!40936 tp!38439))

(assert (=> start!40936 true))

(declare-fun e!266195 () Bool)

(declare-fun array_inv!9820 (array!28221) Bool)

(assert (=> start!40936 (and (array_inv!9820 _values!549) e!266195)))

(declare-fun array_inv!9821 (array!28223) Bool)

(assert (=> start!40936 (array_inv!9821 _keys!709)))

(declare-fun b!455223 () Bool)

(declare-fun res!271393 () Bool)

(assert (=> b!455223 (=> (not res!271393) (not e!266196))))

(declare-datatypes ((List!8168 0))(
  ( (Nil!8165) (Cons!8164 (h!9020 (_ BitVec 64)) (t!13996 List!8168)) )
))
(declare-fun arrayNoDuplicates!0 (array!28223 (_ BitVec 32) List!8168) Bool)

(assert (=> b!455223 (= res!271393 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8165))))

(declare-fun b!455224 () Bool)

(declare-fun res!271402 () Bool)

(assert (=> b!455224 (=> (not res!271402) (not e!266196))))

(assert (=> b!455224 (= res!271402 (and (= (size!13906 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13907 _keys!709) (size!13906 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455225 () Bool)

(declare-fun res!271396 () Bool)

(assert (=> b!455225 (=> (not res!271396) (not e!266196))))

(assert (=> b!455225 (= res!271396 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13907 _keys!709))))))

(declare-fun b!455226 () Bool)

(assert (=> b!455226 (= e!266196 e!266193)))

(declare-fun res!271403 () Bool)

(assert (=> b!455226 (=> (not res!271403) (not e!266193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28223 (_ BitVec 32)) Bool)

(assert (=> b!455226 (= res!271403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206294 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!455226 (= lt!206294 (array!28224 (store (arr!13555 _keys!709) i!563 k!794) (size!13907 _keys!709)))))

(declare-fun b!455227 () Bool)

(declare-fun res!271398 () Bool)

(assert (=> b!455227 (=> (not res!271398) (not e!266193))))

(assert (=> b!455227 (= res!271398 (arrayNoDuplicates!0 lt!206294 #b00000000000000000000000000000000 Nil!8165))))

(declare-fun mapIsEmpty!19954 () Bool)

(declare-fun mapRes!19954 () Bool)

(assert (=> mapIsEmpty!19954 mapRes!19954))

(declare-fun b!455228 () Bool)

(declare-fun res!271392 () Bool)

(assert (=> b!455228 (=> (not res!271392) (not e!266196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455228 (= res!271392 (validMask!0 mask!1025))))

(declare-fun b!455229 () Bool)

(declare-fun e!266192 () Bool)

(assert (=> b!455229 (= e!266195 (and e!266192 mapRes!19954))))

(declare-fun condMapEmpty!19954 () Bool)

(declare-fun mapDefault!19954 () ValueCell!5761)

