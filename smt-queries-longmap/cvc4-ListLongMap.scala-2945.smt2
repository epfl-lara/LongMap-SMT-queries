; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41880 () Bool)

(assert start!41880)

(declare-fun b_free!11483 () Bool)

(declare-fun b_next!11483 () Bool)

(assert (=> start!41880 (= b_free!11483 (not b_next!11483))))

(declare-fun tp!40459 () Bool)

(declare-fun b_and!19863 () Bool)

(assert (=> start!41880 (= tp!40459 b_and!19863)))

(declare-fun b!467618 () Bool)

(declare-fun res!279477 () Bool)

(declare-fun e!273562 () Bool)

(assert (=> b!467618 (=> (not res!279477) (not e!273562))))

(declare-datatypes ((array!29597 0))(
  ( (array!29598 (arr!14226 (Array (_ BitVec 32) (_ BitVec 64))) (size!14578 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29597)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29597 (_ BitVec 32)) Bool)

(assert (=> b!467618 (= res!279477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467619 () Bool)

(declare-fun e!273560 () Bool)

(declare-fun tp_is_empty!12911 () Bool)

(assert (=> b!467619 (= e!273560 tp_is_empty!12911)))

(declare-fun b!467620 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467620 (= e!273562 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14578 _keys!1025)))))))

(declare-datatypes ((V!18319 0))(
  ( (V!18320 (val!6500 Int)) )
))
(declare-datatypes ((tuple2!8530 0))(
  ( (tuple2!8531 (_1!4276 (_ BitVec 64)) (_2!4276 V!18319)) )
))
(declare-datatypes ((List!8617 0))(
  ( (Nil!8614) (Cons!8613 (h!9469 tuple2!8530) (t!14571 List!8617)) )
))
(declare-datatypes ((ListLongMap!7443 0))(
  ( (ListLongMap!7444 (toList!3737 List!8617)) )
))
(declare-fun lt!211427 () ListLongMap!7443)

(declare-fun lt!211426 () ListLongMap!7443)

(assert (=> b!467620 (= lt!211427 lt!211426)))

(declare-fun minValueBefore!38 () V!18319)

(declare-fun zeroValue!794 () V!18319)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13634 0))(
  ( (Unit!13635) )
))
(declare-fun lt!211425 () Unit!13634)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6112 0))(
  ( (ValueCellFull!6112 (v!8789 V!18319)) (EmptyCell!6112) )
))
(declare-datatypes ((array!29599 0))(
  ( (array!29600 (arr!14227 (Array (_ BitVec 32) ValueCell!6112)) (size!14579 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29599)

(declare-fun minValueAfter!38 () V!18319)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!91 (array!29597 array!29599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18319 V!18319 V!18319 V!18319 (_ BitVec 32) Int) Unit!13634)

(assert (=> b!467620 (= lt!211425 (lemmaNoChangeToArrayThenSameMapNoExtras!91 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1911 (array!29597 array!29599 (_ BitVec 32) (_ BitVec 32) V!18319 V!18319 (_ BitVec 32) Int) ListLongMap!7443)

(assert (=> b!467620 (= lt!211426 (getCurrentListMapNoExtraKeys!1911 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467620 (= lt!211427 (getCurrentListMapNoExtraKeys!1911 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467621 () Bool)

(declare-fun res!279480 () Bool)

(assert (=> b!467621 (=> (not res!279480) (not e!273562))))

(assert (=> b!467621 (= res!279480 (and (= (size!14579 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14578 _keys!1025) (size!14579 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467623 () Bool)

(declare-fun res!279479 () Bool)

(assert (=> b!467623 (=> (not res!279479) (not e!273562))))

(declare-datatypes ((List!8618 0))(
  ( (Nil!8615) (Cons!8614 (h!9470 (_ BitVec 64)) (t!14572 List!8618)) )
))
(declare-fun arrayNoDuplicates!0 (array!29597 (_ BitVec 32) List!8618) Bool)

(assert (=> b!467623 (= res!279479 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8615))))

(declare-fun mapIsEmpty!21055 () Bool)

(declare-fun mapRes!21055 () Bool)

(assert (=> mapIsEmpty!21055 mapRes!21055))

(declare-fun mapNonEmpty!21055 () Bool)

(declare-fun tp!40458 () Bool)

(assert (=> mapNonEmpty!21055 (= mapRes!21055 (and tp!40458 e!273560))))

(declare-fun mapValue!21055 () ValueCell!6112)

(declare-fun mapRest!21055 () (Array (_ BitVec 32) ValueCell!6112))

(declare-fun mapKey!21055 () (_ BitVec 32))

(assert (=> mapNonEmpty!21055 (= (arr!14227 _values!833) (store mapRest!21055 mapKey!21055 mapValue!21055))))

(declare-fun b!467624 () Bool)

(declare-fun e!273561 () Bool)

(assert (=> b!467624 (= e!273561 tp_is_empty!12911)))

(declare-fun b!467622 () Bool)

(declare-fun e!273563 () Bool)

(assert (=> b!467622 (= e!273563 (and e!273561 mapRes!21055))))

(declare-fun condMapEmpty!21055 () Bool)

(declare-fun mapDefault!21055 () ValueCell!6112)

