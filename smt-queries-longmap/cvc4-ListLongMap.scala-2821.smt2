; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40894 () Bool)

(assert start!40894)

(declare-fun b_free!10829 () Bool)

(declare-fun b_next!10829 () Bool)

(assert (=> start!40894 (= b_free!10829 (not b_next!10829))))

(declare-fun tp!38314 () Bool)

(declare-fun b_and!18971 () Bool)

(assert (=> start!40894 (= tp!38314 b_and!18971)))

(declare-fun b!454277 () Bool)

(declare-fun res!270642 () Bool)

(declare-fun e!265816 () Bool)

(assert (=> b!454277 (=> (not res!270642) (not e!265816))))

(declare-datatypes ((array!28139 0))(
  ( (array!28140 (arr!13513 (Array (_ BitVec 32) (_ BitVec 64))) (size!13865 (_ BitVec 32))) )
))
(declare-fun lt!206103 () array!28139)

(declare-datatypes ((List!8132 0))(
  ( (Nil!8129) (Cons!8128 (h!8984 (_ BitVec 64)) (t!13960 List!8132)) )
))
(declare-fun arrayNoDuplicates!0 (array!28139 (_ BitVec 32) List!8132) Bool)

(assert (=> b!454277 (= res!270642 (arrayNoDuplicates!0 lt!206103 #b00000000000000000000000000000000 Nil!8129))))

(declare-fun b!454278 () Bool)

(declare-fun res!270638 () Bool)

(declare-fun e!265815 () Bool)

(assert (=> b!454278 (=> (not res!270638) (not e!265815))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!28139)

(assert (=> b!454278 (= res!270638 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13865 _keys!709))))))

(declare-fun res!270639 () Bool)

(assert (=> start!40894 (=> (not res!270639) (not e!265815))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40894 (= res!270639 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13865 _keys!709))))))

(assert (=> start!40894 e!265815))

(declare-fun tp_is_empty!12167 () Bool)

(assert (=> start!40894 tp_is_empty!12167))

(assert (=> start!40894 tp!38314))

(assert (=> start!40894 true))

(declare-datatypes ((V!17327 0))(
  ( (V!17328 (val!6128 Int)) )
))
(declare-datatypes ((ValueCell!5740 0))(
  ( (ValueCellFull!5740 (v!8394 V!17327)) (EmptyCell!5740) )
))
(declare-datatypes ((array!28141 0))(
  ( (array!28142 (arr!13514 (Array (_ BitVec 32) ValueCell!5740)) (size!13866 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28141)

(declare-fun e!265814 () Bool)

(declare-fun array_inv!9788 (array!28141) Bool)

(assert (=> start!40894 (and (array_inv!9788 _values!549) e!265814)))

(declare-fun array_inv!9789 (array!28139) Bool)

(assert (=> start!40894 (array_inv!9789 _keys!709)))

(declare-fun b!454279 () Bool)

(declare-fun e!265818 () Bool)

(assert (=> b!454279 (= e!265818 tp_is_empty!12167)))

(declare-fun b!454280 () Bool)

(assert (=> b!454280 (= e!265815 e!265816)))

(declare-fun res!270640 () Bool)

(assert (=> b!454280 (=> (not res!270640) (not e!265816))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28139 (_ BitVec 32)) Bool)

(assert (=> b!454280 (= res!270640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206103 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!454280 (= lt!206103 (array!28140 (store (arr!13513 _keys!709) i!563 k!794) (size!13865 _keys!709)))))

(declare-fun b!454281 () Bool)

(assert (=> b!454281 (= e!265816 false)))

(declare-fun minValue!515 () V!17327)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17327)

(declare-fun v!412 () V!17327)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8072 0))(
  ( (tuple2!8073 (_1!4047 (_ BitVec 64)) (_2!4047 V!17327)) )
))
(declare-datatypes ((List!8133 0))(
  ( (Nil!8130) (Cons!8129 (h!8985 tuple2!8072) (t!13961 List!8133)) )
))
(declare-datatypes ((ListLongMap!6985 0))(
  ( (ListLongMap!6986 (toList!3508 List!8133)) )
))
(declare-fun lt!206104 () ListLongMap!6985)

(declare-fun getCurrentListMapNoExtraKeys!1691 (array!28139 array!28141 (_ BitVec 32) (_ BitVec 32) V!17327 V!17327 (_ BitVec 32) Int) ListLongMap!6985)

(assert (=> b!454281 (= lt!206104 (getCurrentListMapNoExtraKeys!1691 lt!206103 (array!28142 (store (arr!13514 _values!549) i!563 (ValueCellFull!5740 v!412)) (size!13866 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206105 () ListLongMap!6985)

(assert (=> b!454281 (= lt!206105 (getCurrentListMapNoExtraKeys!1691 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454282 () Bool)

(declare-fun res!270647 () Bool)

(assert (=> b!454282 (=> (not res!270647) (not e!265816))))

(assert (=> b!454282 (= res!270647 (bvsle from!863 i!563))))

(declare-fun b!454283 () Bool)

(declare-fun e!265819 () Bool)

(assert (=> b!454283 (= e!265819 tp_is_empty!12167)))

(declare-fun b!454284 () Bool)

(declare-fun res!270643 () Bool)

(assert (=> b!454284 (=> (not res!270643) (not e!265815))))

(assert (=> b!454284 (= res!270643 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8129))))

(declare-fun mapNonEmpty!19891 () Bool)

(declare-fun mapRes!19891 () Bool)

(declare-fun tp!38313 () Bool)

(assert (=> mapNonEmpty!19891 (= mapRes!19891 (and tp!38313 e!265819))))

(declare-fun mapValue!19891 () ValueCell!5740)

(declare-fun mapRest!19891 () (Array (_ BitVec 32) ValueCell!5740))

(declare-fun mapKey!19891 () (_ BitVec 32))

(assert (=> mapNonEmpty!19891 (= (arr!13514 _values!549) (store mapRest!19891 mapKey!19891 mapValue!19891))))

(declare-fun b!454285 () Bool)

(declare-fun res!270644 () Bool)

(assert (=> b!454285 (=> (not res!270644) (not e!265815))))

(assert (=> b!454285 (= res!270644 (and (= (size!13866 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13865 _keys!709) (size!13866 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19891 () Bool)

(assert (=> mapIsEmpty!19891 mapRes!19891))

(declare-fun b!454286 () Bool)

(declare-fun res!270646 () Bool)

(assert (=> b!454286 (=> (not res!270646) (not e!265815))))

(declare-fun arrayContainsKey!0 (array!28139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454286 (= res!270646 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454287 () Bool)

(declare-fun res!270636 () Bool)

(assert (=> b!454287 (=> (not res!270636) (not e!265815))))

(assert (=> b!454287 (= res!270636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454288 () Bool)

(assert (=> b!454288 (= e!265814 (and e!265818 mapRes!19891))))

(declare-fun condMapEmpty!19891 () Bool)

(declare-fun mapDefault!19891 () ValueCell!5740)

