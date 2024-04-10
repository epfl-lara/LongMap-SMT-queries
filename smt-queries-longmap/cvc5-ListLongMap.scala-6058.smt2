; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78394 () Bool)

(assert start!78394)

(declare-fun b_free!16759 () Bool)

(declare-fun b_next!16759 () Bool)

(assert (=> start!78394 (= b_free!16759 (not b_next!16759))))

(declare-fun tp!58565 () Bool)

(declare-fun b_and!27379 () Bool)

(assert (=> start!78394 (= tp!58565 b_and!27379)))

(declare-fun b!914516 () Bool)

(declare-fun e!513041 () Bool)

(declare-fun e!513035 () Bool)

(assert (=> b!914516 (= e!513041 e!513035)))

(declare-fun c!96006 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!914516 (= c!96006 (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914517 () Bool)

(declare-fun e!513042 () Bool)

(assert (=> b!914517 (= e!513042 e!513041)))

(declare-fun res!616757 () Bool)

(assert (=> b!914517 (=> (not res!616757) (not e!513041))))

(declare-datatypes ((V!30535 0))(
  ( (V!30536 (val!9639 Int)) )
))
(declare-datatypes ((tuple2!12566 0))(
  ( (tuple2!12567 (_1!6294 (_ BitVec 64)) (_2!6294 V!30535)) )
))
(declare-datatypes ((List!18354 0))(
  ( (Nil!18351) (Cons!18350 (h!19496 tuple2!12566) (t!25965 List!18354)) )
))
(declare-datatypes ((ListLongMap!11263 0))(
  ( (ListLongMap!11264 (toList!5647 List!18354)) )
))
(declare-fun lt!411492 () ListLongMap!11263)

(declare-fun contains!4697 (ListLongMap!11263 (_ BitVec 64)) Bool)

(assert (=> b!914517 (= res!616757 (contains!4697 lt!411492 k!1033))))

(declare-datatypes ((ValueCell!9107 0))(
  ( (ValueCellFull!9107 (v!12155 V!30535)) (EmptyCell!9107) )
))
(declare-datatypes ((array!54344 0))(
  ( (array!54345 (arr!26123 (Array (_ BitVec 32) ValueCell!9107)) (size!26582 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54344)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30535)

(declare-datatypes ((array!54346 0))(
  ( (array!54347 (arr!26124 (Array (_ BitVec 32) (_ BitVec 64))) (size!26583 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54346)

(declare-fun minValue!1094 () V!30535)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun getCurrentListMap!2908 (array!54346 array!54344 (_ BitVec 32) (_ BitVec 32) V!30535 V!30535 (_ BitVec 32) Int) ListLongMap!11263)

(assert (=> b!914517 (= lt!411492 (getCurrentListMap!2908 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!30504 () Bool)

(declare-fun mapRes!30504 () Bool)

(declare-fun tp!58564 () Bool)

(declare-fun e!513040 () Bool)

(assert (=> mapNonEmpty!30504 (= mapRes!30504 (and tp!58564 e!513040))))

(declare-fun mapRest!30504 () (Array (_ BitVec 32) ValueCell!9107))

(declare-fun mapKey!30504 () (_ BitVec 32))

(declare-fun mapValue!30504 () ValueCell!9107)

(assert (=> mapNonEmpty!30504 (= (arr!26123 _values!1152) (store mapRest!30504 mapKey!30504 mapValue!30504))))

(declare-fun b!914518 () Bool)

(declare-fun e!513037 () Bool)

(assert (=> b!914518 (= e!513035 e!513037)))

(declare-fun res!616749 () Bool)

(assert (=> b!914518 (= res!616749 (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!914518 (=> res!616749 e!513037)))

(declare-fun bm!40501 () Bool)

(declare-fun call!40504 () V!30535)

(declare-fun apply!523 (ListLongMap!11263 (_ BitVec 64)) V!30535)

(assert (=> bm!40501 (= call!40504 (apply!523 lt!411492 k!1033))))

(declare-fun b!914519 () Bool)

(assert (=> b!914519 (= e!513037 (not (= call!40504 zeroValue!1094)))))

(declare-fun b!914520 () Bool)

(declare-fun res!616751 () Bool)

(assert (=> b!914520 (=> (not res!616751) (not e!513041))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!914520 (= res!616751 (and (= (select (arr!26124 _keys!1386) i!717) k!1033) (or (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914522 () Bool)

(declare-fun res!616756 () Bool)

(assert (=> b!914522 (= res!616756 (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun e!513039 () Bool)

(assert (=> b!914522 (=> res!616756 e!513039)))

(declare-fun e!513038 () Bool)

(assert (=> b!914522 (= e!513038 e!513039)))

(declare-fun b!914523 () Bool)

(declare-fun tp_is_empty!19177 () Bool)

(assert (=> b!914523 (= e!513040 tp_is_empty!19177)))

(declare-fun b!914524 () Bool)

(assert (=> b!914524 (= e!513035 e!513038)))

(declare-fun res!616748 () Bool)

(assert (=> b!914524 (= res!616748 (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914524 (=> (not res!616748) (not e!513038))))

(declare-fun b!914525 () Bool)

(declare-fun e!513043 () Bool)

(assert (=> b!914525 (= e!513043 tp_is_empty!19177)))

(declare-fun b!914526 () Bool)

(declare-fun res!616750 () Bool)

(assert (=> b!914526 (=> (not res!616750) (not e!513042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54346 (_ BitVec 32)) Bool)

(assert (=> b!914526 (= res!616750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914527 () Bool)

(declare-fun e!513044 () Bool)

(assert (=> b!914527 (= e!513044 (and e!513043 mapRes!30504))))

(declare-fun condMapEmpty!30504 () Bool)

(declare-fun mapDefault!30504 () ValueCell!9107)

