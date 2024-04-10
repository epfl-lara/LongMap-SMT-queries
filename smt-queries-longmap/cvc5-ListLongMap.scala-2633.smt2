; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39616 () Bool)

(assert start!39616)

(declare-fun b_free!9883 () Bool)

(declare-fun b_next!9883 () Bool)

(assert (=> start!39616 (= b_free!9883 (not b_next!9883))))

(declare-fun tp!35177 () Bool)

(declare-fun b_and!17539 () Bool)

(assert (=> start!39616 (= tp!35177 b_and!17539)))

(declare-fun b!424614 () Bool)

(declare-fun res!248424 () Bool)

(declare-fun e!252207 () Bool)

(assert (=> b!424614 (=> (not res!248424) (not e!252207))))

(declare-datatypes ((array!25909 0))(
  ( (array!25910 (arr!12404 (Array (_ BitVec 32) (_ BitVec 64))) (size!12756 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25909)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424614 (= res!248424 (or (= (select (arr!12404 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12404 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!248419 () Bool)

(assert (=> start!39616 (=> (not res!248419) (not e!252207))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39616 (= res!248419 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12756 _keys!709))))))

(assert (=> start!39616 e!252207))

(declare-fun tp_is_empty!11035 () Bool)

(assert (=> start!39616 tp_is_empty!11035))

(assert (=> start!39616 tp!35177))

(assert (=> start!39616 true))

(declare-datatypes ((V!15819 0))(
  ( (V!15820 (val!5562 Int)) )
))
(declare-datatypes ((ValueCell!5174 0))(
  ( (ValueCellFull!5174 (v!7809 V!15819)) (EmptyCell!5174) )
))
(declare-datatypes ((array!25911 0))(
  ( (array!25912 (arr!12405 (Array (_ BitVec 32) ValueCell!5174)) (size!12757 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25911)

(declare-fun e!252209 () Bool)

(declare-fun array_inv!9038 (array!25911) Bool)

(assert (=> start!39616 (and (array_inv!9038 _values!549) e!252209)))

(declare-fun array_inv!9039 (array!25909) Bool)

(assert (=> start!39616 (array_inv!9039 _keys!709)))

(declare-fun mapNonEmpty!18174 () Bool)

(declare-fun mapRes!18174 () Bool)

(declare-fun tp!35178 () Bool)

(declare-fun e!252208 () Bool)

(assert (=> mapNonEmpty!18174 (= mapRes!18174 (and tp!35178 e!252208))))

(declare-fun mapValue!18174 () ValueCell!5174)

(declare-fun mapRest!18174 () (Array (_ BitVec 32) ValueCell!5174))

(declare-fun mapKey!18174 () (_ BitVec 32))

(assert (=> mapNonEmpty!18174 (= (arr!12405 _values!549) (store mapRest!18174 mapKey!18174 mapValue!18174))))

(declare-fun b!424615 () Bool)

(declare-fun res!248422 () Bool)

(assert (=> b!424615 (=> (not res!248422) (not e!252207))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424615 (= res!248422 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424616 () Bool)

(declare-fun e!252205 () Bool)

(assert (=> b!424616 (= e!252207 e!252205)))

(declare-fun res!248423 () Bool)

(assert (=> b!424616 (=> (not res!248423) (not e!252205))))

(declare-fun lt!194404 () array!25909)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25909 (_ BitVec 32)) Bool)

(assert (=> b!424616 (= res!248423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194404 mask!1025))))

(assert (=> b!424616 (= lt!194404 (array!25910 (store (arr!12404 _keys!709) i!563 k!794) (size!12756 _keys!709)))))

(declare-fun b!424617 () Bool)

(declare-fun res!248421 () Bool)

(assert (=> b!424617 (=> (not res!248421) (not e!252207))))

(assert (=> b!424617 (= res!248421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18174 () Bool)

(assert (=> mapIsEmpty!18174 mapRes!18174))

(declare-fun b!424618 () Bool)

(declare-fun res!248425 () Bool)

(assert (=> b!424618 (=> (not res!248425) (not e!252207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424618 (= res!248425 (validKeyInArray!0 k!794))))

(declare-fun b!424619 () Bool)

(declare-fun res!248427 () Bool)

(assert (=> b!424619 (=> (not res!248427) (not e!252207))))

(assert (=> b!424619 (= res!248427 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12756 _keys!709))))))

(declare-fun b!424620 () Bool)

(assert (=> b!424620 (= e!252208 tp_is_empty!11035)))

(declare-fun b!424621 () Bool)

(assert (=> b!424621 (= e!252205 false)))

(declare-fun minValue!515 () V!15819)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15819)

(declare-fun v!412 () V!15819)

(declare-datatypes ((tuple2!7302 0))(
  ( (tuple2!7303 (_1!3662 (_ BitVec 64)) (_2!3662 V!15819)) )
))
(declare-datatypes ((List!7313 0))(
  ( (Nil!7310) (Cons!7309 (h!8165 tuple2!7302) (t!12757 List!7313)) )
))
(declare-datatypes ((ListLongMap!6215 0))(
  ( (ListLongMap!6216 (toList!3123 List!7313)) )
))
(declare-fun lt!194403 () ListLongMap!6215)

(declare-fun getCurrentListMapNoExtraKeys!1327 (array!25909 array!25911 (_ BitVec 32) (_ BitVec 32) V!15819 V!15819 (_ BitVec 32) Int) ListLongMap!6215)

(assert (=> b!424621 (= lt!194403 (getCurrentListMapNoExtraKeys!1327 lt!194404 (array!25912 (store (arr!12405 _values!549) i!563 (ValueCellFull!5174 v!412)) (size!12757 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194405 () ListLongMap!6215)

(assert (=> b!424621 (= lt!194405 (getCurrentListMapNoExtraKeys!1327 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424622 () Bool)

(declare-fun e!252206 () Bool)

(assert (=> b!424622 (= e!252206 tp_is_empty!11035)))

(declare-fun b!424623 () Bool)

(declare-fun res!248418 () Bool)

(assert (=> b!424623 (=> (not res!248418) (not e!252205))))

(declare-datatypes ((List!7314 0))(
  ( (Nil!7311) (Cons!7310 (h!8166 (_ BitVec 64)) (t!12758 List!7314)) )
))
(declare-fun arrayNoDuplicates!0 (array!25909 (_ BitVec 32) List!7314) Bool)

(assert (=> b!424623 (= res!248418 (arrayNoDuplicates!0 lt!194404 #b00000000000000000000000000000000 Nil!7311))))

(declare-fun b!424624 () Bool)

(declare-fun res!248416 () Bool)

(assert (=> b!424624 (=> (not res!248416) (not e!252207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424624 (= res!248416 (validMask!0 mask!1025))))

(declare-fun b!424625 () Bool)

(declare-fun res!248426 () Bool)

(assert (=> b!424625 (=> (not res!248426) (not e!252207))))

(assert (=> b!424625 (= res!248426 (and (= (size!12757 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12756 _keys!709) (size!12757 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424626 () Bool)

(declare-fun res!248417 () Bool)

(assert (=> b!424626 (=> (not res!248417) (not e!252207))))

(assert (=> b!424626 (= res!248417 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7311))))

(declare-fun b!424627 () Bool)

(assert (=> b!424627 (= e!252209 (and e!252206 mapRes!18174))))

(declare-fun condMapEmpty!18174 () Bool)

(declare-fun mapDefault!18174 () ValueCell!5174)

