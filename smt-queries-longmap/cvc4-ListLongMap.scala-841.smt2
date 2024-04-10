; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20146 () Bool)

(assert start!20146)

(declare-fun b_free!4805 () Bool)

(declare-fun b_next!4805 () Bool)

(assert (=> start!20146 (= b_free!4805 (not b_next!4805))))

(declare-fun tp!17447 () Bool)

(declare-fun b_and!11551 () Bool)

(assert (=> start!20146 (= tp!17447 b_and!11551)))

(declare-fun b!197624 () Bool)

(declare-fun res!93519 () Bool)

(declare-fun e!130018 () Bool)

(assert (=> b!197624 (=> (not res!93519) (not e!130018))))

(declare-datatypes ((array!8575 0))(
  ( (array!8576 (arr!4038 (Array (_ BitVec 32) (_ BitVec 64))) (size!4363 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8575)

(declare-datatypes ((List!2520 0))(
  ( (Nil!2517) (Cons!2516 (h!3158 (_ BitVec 64)) (t!7451 List!2520)) )
))
(declare-fun arrayNoDuplicates!0 (array!8575 (_ BitVec 32) List!2520) Bool)

(assert (=> b!197624 (= res!93519 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2517))))

(declare-fun b!197625 () Bool)

(declare-fun e!130017 () Bool)

(declare-fun tp_is_empty!4661 () Bool)

(assert (=> b!197625 (= e!130017 tp_is_empty!4661)))

(declare-fun b!197626 () Bool)

(declare-fun res!93520 () Bool)

(assert (=> b!197626 (=> (not res!93520) (not e!130018))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5861 0))(
  ( (V!5862 (val!2375 Int)) )
))
(declare-datatypes ((ValueCell!1987 0))(
  ( (ValueCellFull!1987 (v!4345 V!5861)) (EmptyCell!1987) )
))
(declare-datatypes ((array!8577 0))(
  ( (array!8578 (arr!4039 (Array (_ BitVec 32) ValueCell!1987)) (size!4364 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8577)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197626 (= res!93520 (and (= (size!4364 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4363 _keys!825) (size!4364 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197627 () Bool)

(assert (=> b!197627 (= e!130018 false)))

(declare-datatypes ((tuple2!3606 0))(
  ( (tuple2!3607 (_1!1814 (_ BitVec 64)) (_2!1814 V!5861)) )
))
(declare-datatypes ((List!2521 0))(
  ( (Nil!2518) (Cons!2517 (h!3159 tuple2!3606) (t!7452 List!2521)) )
))
(declare-datatypes ((ListLongMap!2519 0))(
  ( (ListLongMap!2520 (toList!1275 List!2521)) )
))
(declare-fun lt!97754 () ListLongMap!2519)

(declare-fun v!520 () V!5861)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5861)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5861)

(declare-fun getCurrentListMapNoExtraKeys!240 (array!8575 array!8577 (_ BitVec 32) (_ BitVec 32) V!5861 V!5861 (_ BitVec 32) Int) ListLongMap!2519)

(assert (=> b!197627 (= lt!97754 (getCurrentListMapNoExtraKeys!240 _keys!825 (array!8578 (store (arr!4039 _values!649) i!601 (ValueCellFull!1987 v!520)) (size!4364 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97755 () ListLongMap!2519)

(assert (=> b!197627 (= lt!97755 (getCurrentListMapNoExtraKeys!240 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197628 () Bool)

(declare-fun res!93517 () Bool)

(assert (=> b!197628 (=> (not res!93517) (not e!130018))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197628 (= res!93517 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8060 () Bool)

(declare-fun mapRes!8060 () Bool)

(declare-fun tp!17446 () Bool)

(declare-fun e!130019 () Bool)

(assert (=> mapNonEmpty!8060 (= mapRes!8060 (and tp!17446 e!130019))))

(declare-fun mapKey!8060 () (_ BitVec 32))

(declare-fun mapRest!8060 () (Array (_ BitVec 32) ValueCell!1987))

(declare-fun mapValue!8060 () ValueCell!1987)

(assert (=> mapNonEmpty!8060 (= (arr!4039 _values!649) (store mapRest!8060 mapKey!8060 mapValue!8060))))

(declare-fun res!93521 () Bool)

(assert (=> start!20146 (=> (not res!93521) (not e!130018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20146 (= res!93521 (validMask!0 mask!1149))))

(assert (=> start!20146 e!130018))

(declare-fun e!130016 () Bool)

(declare-fun array_inv!2635 (array!8577) Bool)

(assert (=> start!20146 (and (array_inv!2635 _values!649) e!130016)))

(assert (=> start!20146 true))

(assert (=> start!20146 tp_is_empty!4661))

(declare-fun array_inv!2636 (array!8575) Bool)

(assert (=> start!20146 (array_inv!2636 _keys!825)))

(assert (=> start!20146 tp!17447))

(declare-fun b!197629 () Bool)

(declare-fun res!93523 () Bool)

(assert (=> b!197629 (=> (not res!93523) (not e!130018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8575 (_ BitVec 32)) Bool)

(assert (=> b!197629 (= res!93523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197630 () Bool)

(assert (=> b!197630 (= e!130016 (and e!130017 mapRes!8060))))

(declare-fun condMapEmpty!8060 () Bool)

(declare-fun mapDefault!8060 () ValueCell!1987)

