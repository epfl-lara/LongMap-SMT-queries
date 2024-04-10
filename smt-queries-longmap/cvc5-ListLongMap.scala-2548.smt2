; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39106 () Bool)

(assert start!39106)

(declare-fun b_free!9373 () Bool)

(declare-fun b_next!9373 () Bool)

(assert (=> start!39106 (= b_free!9373 (not b_next!9373))))

(declare-fun tp!33647 () Bool)

(declare-fun b_and!16759 () Bool)

(assert (=> start!39106 (= tp!33647 b_and!16759)))

(declare-fun b!410997 () Bool)

(declare-fun res!238345 () Bool)

(declare-fun e!246231 () Bool)

(assert (=> b!410997 (=> (not res!238345) (not e!246231))))

(declare-datatypes ((array!24911 0))(
  ( (array!24912 (arr!11905 (Array (_ BitVec 32) (_ BitVec 64))) (size!12257 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24911)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410997 (= res!238345 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17409 () Bool)

(declare-fun mapRes!17409 () Bool)

(declare-fun tp!33648 () Bool)

(declare-fun e!246233 () Bool)

(assert (=> mapNonEmpty!17409 (= mapRes!17409 (and tp!33648 e!246233))))

(declare-datatypes ((V!15139 0))(
  ( (V!15140 (val!5307 Int)) )
))
(declare-datatypes ((ValueCell!4919 0))(
  ( (ValueCellFull!4919 (v!7554 V!15139)) (EmptyCell!4919) )
))
(declare-fun mapValue!17409 () ValueCell!4919)

(declare-fun mapRest!17409 () (Array (_ BitVec 32) ValueCell!4919))

(declare-datatypes ((array!24913 0))(
  ( (array!24914 (arr!11906 (Array (_ BitVec 32) ValueCell!4919)) (size!12258 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24913)

(declare-fun mapKey!17409 () (_ BitVec 32))

(assert (=> mapNonEmpty!17409 (= (arr!11906 _values!549) (store mapRest!17409 mapKey!17409 mapValue!17409))))

(declare-fun b!410998 () Bool)

(declare-fun res!238343 () Bool)

(assert (=> b!410998 (=> (not res!238343) (not e!246231))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410998 (= res!238343 (validMask!0 mask!1025))))

(declare-fun b!410999 () Bool)

(declare-fun e!246234 () Bool)

(assert (=> b!410999 (= e!246234 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15139)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189192 () array!24911)

(declare-fun zeroValue!515 () V!15139)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15139)

(declare-datatypes ((tuple2!6882 0))(
  ( (tuple2!6883 (_1!3452 (_ BitVec 64)) (_2!3452 V!15139)) )
))
(declare-datatypes ((List!6907 0))(
  ( (Nil!6904) (Cons!6903 (h!7759 tuple2!6882) (t!12081 List!6907)) )
))
(declare-datatypes ((ListLongMap!5795 0))(
  ( (ListLongMap!5796 (toList!2913 List!6907)) )
))
(declare-fun lt!189193 () ListLongMap!5795)

(declare-fun getCurrentListMapNoExtraKeys!1121 (array!24911 array!24913 (_ BitVec 32) (_ BitVec 32) V!15139 V!15139 (_ BitVec 32) Int) ListLongMap!5795)

(assert (=> b!410999 (= lt!189193 (getCurrentListMapNoExtraKeys!1121 lt!189192 (array!24914 (store (arr!11906 _values!549) i!563 (ValueCellFull!4919 v!412)) (size!12258 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189194 () ListLongMap!5795)

(assert (=> b!410999 (= lt!189194 (getCurrentListMapNoExtraKeys!1121 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411000 () Bool)

(declare-fun res!238344 () Bool)

(assert (=> b!411000 (=> (not res!238344) (not e!246231))))

(assert (=> b!411000 (= res!238344 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12257 _keys!709))))))

(declare-fun b!411001 () Bool)

(declare-fun res!238347 () Bool)

(assert (=> b!411001 (=> (not res!238347) (not e!246231))))

(declare-datatypes ((List!6908 0))(
  ( (Nil!6905) (Cons!6904 (h!7760 (_ BitVec 64)) (t!12082 List!6908)) )
))
(declare-fun arrayNoDuplicates!0 (array!24911 (_ BitVec 32) List!6908) Bool)

(assert (=> b!411001 (= res!238347 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6905))))

(declare-fun res!238341 () Bool)

(assert (=> start!39106 (=> (not res!238341) (not e!246231))))

(assert (=> start!39106 (= res!238341 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12257 _keys!709))))))

(assert (=> start!39106 e!246231))

(declare-fun tp_is_empty!10525 () Bool)

(assert (=> start!39106 tp_is_empty!10525))

(assert (=> start!39106 tp!33647))

(assert (=> start!39106 true))

(declare-fun e!246230 () Bool)

(declare-fun array_inv!8688 (array!24913) Bool)

(assert (=> start!39106 (and (array_inv!8688 _values!549) e!246230)))

(declare-fun array_inv!8689 (array!24911) Bool)

(assert (=> start!39106 (array_inv!8689 _keys!709)))

(declare-fun b!411002 () Bool)

(declare-fun res!238339 () Bool)

(assert (=> b!411002 (=> (not res!238339) (not e!246231))))

(assert (=> b!411002 (= res!238339 (and (= (size!12258 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12257 _keys!709) (size!12258 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411003 () Bool)

(declare-fun res!238336 () Bool)

(assert (=> b!411003 (=> (not res!238336) (not e!246234))))

(assert (=> b!411003 (= res!238336 (arrayNoDuplicates!0 lt!189192 #b00000000000000000000000000000000 Nil!6905))))

(declare-fun b!411004 () Bool)

(assert (=> b!411004 (= e!246231 e!246234)))

(declare-fun res!238346 () Bool)

(assert (=> b!411004 (=> (not res!238346) (not e!246234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24911 (_ BitVec 32)) Bool)

(assert (=> b!411004 (= res!238346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189192 mask!1025))))

(assert (=> b!411004 (= lt!189192 (array!24912 (store (arr!11905 _keys!709) i!563 k!794) (size!12257 _keys!709)))))

(declare-fun b!411005 () Bool)

(declare-fun e!246232 () Bool)

(assert (=> b!411005 (= e!246230 (and e!246232 mapRes!17409))))

(declare-fun condMapEmpty!17409 () Bool)

(declare-fun mapDefault!17409 () ValueCell!4919)

