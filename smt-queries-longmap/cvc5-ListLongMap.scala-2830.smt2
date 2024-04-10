; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40944 () Bool)

(assert start!40944)

(declare-fun b_free!10879 () Bool)

(declare-fun b_next!10879 () Bool)

(assert (=> start!40944 (= b_free!10879 (not b_next!10879))))

(declare-fun tp!38463 () Bool)

(declare-fun b_and!19021 () Bool)

(assert (=> start!40944 (= tp!38463 b_and!19021)))

(declare-fun b!455402 () Bool)

(declare-fun res!271538 () Bool)

(declare-fun e!266266 () Bool)

(assert (=> b!455402 (=> (not res!271538) (not e!266266))))

(declare-datatypes ((array!28237 0))(
  ( (array!28238 (arr!13562 (Array (_ BitVec 32) (_ BitVec 64))) (size!13914 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28237)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455402 (= res!271538 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!455403 () Bool)

(declare-fun res!271546 () Bool)

(assert (=> b!455403 (=> (not res!271546) (not e!266266))))

(declare-datatypes ((List!8173 0))(
  ( (Nil!8170) (Cons!8169 (h!9025 (_ BitVec 64)) (t!14001 List!8173)) )
))
(declare-fun arrayNoDuplicates!0 (array!28237 (_ BitVec 32) List!8173) Bool)

(assert (=> b!455403 (= res!271546 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8170))))

(declare-fun mapIsEmpty!19966 () Bool)

(declare-fun mapRes!19966 () Bool)

(assert (=> mapIsEmpty!19966 mapRes!19966))

(declare-fun b!455404 () Bool)

(declare-fun res!271542 () Bool)

(assert (=> b!455404 (=> (not res!271542) (not e!266266))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455404 (= res!271542 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13914 _keys!709))))))

(declare-fun b!455405 () Bool)

(declare-fun res!271541 () Bool)

(assert (=> b!455405 (=> (not res!271541) (not e!266266))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455405 (= res!271541 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19966 () Bool)

(declare-fun tp!38464 () Bool)

(declare-fun e!266269 () Bool)

(assert (=> mapNonEmpty!19966 (= mapRes!19966 (and tp!38464 e!266269))))

(declare-fun mapKey!19966 () (_ BitVec 32))

(declare-datatypes ((V!17395 0))(
  ( (V!17396 (val!6153 Int)) )
))
(declare-datatypes ((ValueCell!5765 0))(
  ( (ValueCellFull!5765 (v!8419 V!17395)) (EmptyCell!5765) )
))
(declare-datatypes ((array!28239 0))(
  ( (array!28240 (arr!13563 (Array (_ BitVec 32) ValueCell!5765)) (size!13915 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28239)

(declare-fun mapRest!19966 () (Array (_ BitVec 32) ValueCell!5765))

(declare-fun mapValue!19966 () ValueCell!5765)

(assert (=> mapNonEmpty!19966 (= (arr!13563 _values!549) (store mapRest!19966 mapKey!19966 mapValue!19966))))

(declare-fun res!271545 () Bool)

(assert (=> start!40944 (=> (not res!271545) (not e!266266))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40944 (= res!271545 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13914 _keys!709))))))

(assert (=> start!40944 e!266266))

(declare-fun tp_is_empty!12217 () Bool)

(assert (=> start!40944 tp_is_empty!12217))

(assert (=> start!40944 tp!38463))

(assert (=> start!40944 true))

(declare-fun e!266268 () Bool)

(declare-fun array_inv!9824 (array!28239) Bool)

(assert (=> start!40944 (and (array_inv!9824 _values!549) e!266268)))

(declare-fun array_inv!9825 (array!28237) Bool)

(assert (=> start!40944 (array_inv!9825 _keys!709)))

(declare-fun b!455406 () Bool)

(declare-fun e!266264 () Bool)

(assert (=> b!455406 (= e!266266 e!266264)))

(declare-fun res!271547 () Bool)

(assert (=> b!455406 (=> (not res!271547) (not e!266264))))

(declare-fun lt!206328 () array!28237)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28237 (_ BitVec 32)) Bool)

(assert (=> b!455406 (= res!271547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206328 mask!1025))))

(assert (=> b!455406 (= lt!206328 (array!28238 (store (arr!13562 _keys!709) i!563 k!794) (size!13914 _keys!709)))))

(declare-fun b!455407 () Bool)

(declare-fun res!271536 () Bool)

(assert (=> b!455407 (=> (not res!271536) (not e!266264))))

(assert (=> b!455407 (= res!271536 (bvsle from!863 i!563))))

(declare-fun b!455408 () Bool)

(assert (=> b!455408 (= e!266269 tp_is_empty!12217)))

(declare-fun b!455409 () Bool)

(declare-fun res!271537 () Bool)

(assert (=> b!455409 (=> (not res!271537) (not e!266266))))

(assert (=> b!455409 (= res!271537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455410 () Bool)

(declare-fun res!271544 () Bool)

(assert (=> b!455410 (=> (not res!271544) (not e!266266))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455410 (= res!271544 (and (= (size!13915 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13914 _keys!709) (size!13915 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455411 () Bool)

(assert (=> b!455411 (= e!266264 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17395)

(declare-fun v!412 () V!17395)

(declare-fun minValue!515 () V!17395)

(declare-datatypes ((tuple2!8108 0))(
  ( (tuple2!8109 (_1!4065 (_ BitVec 64)) (_2!4065 V!17395)) )
))
(declare-datatypes ((List!8174 0))(
  ( (Nil!8171) (Cons!8170 (h!9026 tuple2!8108) (t!14002 List!8174)) )
))
(declare-datatypes ((ListLongMap!7021 0))(
  ( (ListLongMap!7022 (toList!3526 List!8174)) )
))
(declare-fun lt!206329 () ListLongMap!7021)

(declare-fun getCurrentListMapNoExtraKeys!1709 (array!28237 array!28239 (_ BitVec 32) (_ BitVec 32) V!17395 V!17395 (_ BitVec 32) Int) ListLongMap!7021)

(assert (=> b!455411 (= lt!206329 (getCurrentListMapNoExtraKeys!1709 lt!206328 (array!28240 (store (arr!13563 _values!549) i!563 (ValueCellFull!5765 v!412)) (size!13915 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206330 () ListLongMap!7021)

(assert (=> b!455411 (= lt!206330 (getCurrentListMapNoExtraKeys!1709 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455412 () Bool)

(declare-fun res!271540 () Bool)

(assert (=> b!455412 (=> (not res!271540) (not e!266266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455412 (= res!271540 (validKeyInArray!0 k!794))))

(declare-fun b!455413 () Bool)

(declare-fun res!271539 () Bool)

(assert (=> b!455413 (=> (not res!271539) (not e!266266))))

(assert (=> b!455413 (= res!271539 (or (= (select (arr!13562 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13562 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455414 () Bool)

(declare-fun e!266267 () Bool)

(assert (=> b!455414 (= e!266267 tp_is_empty!12217)))

(declare-fun b!455415 () Bool)

(declare-fun res!271543 () Bool)

(assert (=> b!455415 (=> (not res!271543) (not e!266264))))

(assert (=> b!455415 (= res!271543 (arrayNoDuplicates!0 lt!206328 #b00000000000000000000000000000000 Nil!8170))))

(declare-fun b!455416 () Bool)

(assert (=> b!455416 (= e!266268 (and e!266267 mapRes!19966))))

(declare-fun condMapEmpty!19966 () Bool)

(declare-fun mapDefault!19966 () ValueCell!5765)

