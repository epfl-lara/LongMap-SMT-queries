; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20778 () Bool)

(assert start!20778)

(declare-fun b_free!5431 () Bool)

(declare-fun b_next!5431 () Bool)

(assert (=> start!20778 (= b_free!5431 (not b_next!5431))))

(declare-fun tp!19333 () Bool)

(declare-fun b_and!12177 () Bool)

(assert (=> start!20778 (= tp!19333 b_and!12177)))

(declare-fun mapNonEmpty!9008 () Bool)

(declare-fun mapRes!9008 () Bool)

(declare-fun tp!19334 () Bool)

(declare-fun e!135791 () Bool)

(assert (=> mapNonEmpty!9008 (= mapRes!9008 (and tp!19334 e!135791))))

(declare-datatypes ((V!6705 0))(
  ( (V!6706 (val!2691 Int)) )
))
(declare-datatypes ((ValueCell!2303 0))(
  ( (ValueCellFull!2303 (v!4661 V!6705)) (EmptyCell!2303) )
))
(declare-fun mapValue!9008 () ValueCell!2303)

(declare-datatypes ((array!9791 0))(
  ( (array!9792 (arr!4646 (Array (_ BitVec 32) ValueCell!2303)) (size!4971 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9791)

(declare-fun mapRest!9008 () (Array (_ BitVec 32) ValueCell!2303))

(declare-fun mapKey!9008 () (_ BitVec 32))

(assert (=> mapNonEmpty!9008 (= (arr!4646 _values!649) (store mapRest!9008 mapKey!9008 mapValue!9008))))

(declare-fun b!208130 () Bool)

(declare-fun e!135793 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208130 (= e!135793 (bvsge i!601 (size!4971 _values!649)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4078 0))(
  ( (tuple2!4079 (_1!2050 (_ BitVec 64)) (_2!2050 V!6705)) )
))
(declare-datatypes ((List!2973 0))(
  ( (Nil!2970) (Cons!2969 (h!3611 tuple2!4078) (t!7904 List!2973)) )
))
(declare-datatypes ((ListLongMap!2991 0))(
  ( (ListLongMap!2992 (toList!1511 List!2973)) )
))
(declare-fun lt!106731 () ListLongMap!2991)

(declare-fun zeroValue!615 () V!6705)

(declare-datatypes ((array!9793 0))(
  ( (array!9794 (arr!4647 (Array (_ BitVec 32) (_ BitVec 64))) (size!4972 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9793)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6705)

(declare-fun getCurrentListMapNoExtraKeys!452 (array!9793 array!9791 (_ BitVec 32) (_ BitVec 32) V!6705 V!6705 (_ BitVec 32) Int) ListLongMap!2991)

(assert (=> b!208130 (= lt!106731 (getCurrentListMapNoExtraKeys!452 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9008 () Bool)

(assert (=> mapIsEmpty!9008 mapRes!9008))

(declare-fun b!208131 () Bool)

(declare-fun res!101181 () Bool)

(assert (=> b!208131 (=> (not res!101181) (not e!135793))))

(assert (=> b!208131 (= res!101181 (and (= (size!4971 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4972 _keys!825) (size!4971 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208132 () Bool)

(declare-fun res!101182 () Bool)

(assert (=> b!208132 (=> (not res!101182) (not e!135793))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!208132 (= res!101182 (= (select (arr!4647 _keys!825) i!601) k!843))))

(declare-fun b!208133 () Bool)

(declare-fun res!101183 () Bool)

(assert (=> b!208133 (=> (not res!101183) (not e!135793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208133 (= res!101183 (validKeyInArray!0 k!843))))

(declare-fun b!208134 () Bool)

(declare-fun e!135794 () Bool)

(declare-fun tp_is_empty!5293 () Bool)

(assert (=> b!208134 (= e!135794 tp_is_empty!5293)))

(declare-fun b!208135 () Bool)

(assert (=> b!208135 (= e!135791 tp_is_empty!5293)))

(declare-fun b!208136 () Bool)

(declare-fun res!101180 () Bool)

(assert (=> b!208136 (=> (not res!101180) (not e!135793))))

(declare-datatypes ((List!2974 0))(
  ( (Nil!2971) (Cons!2970 (h!3612 (_ BitVec 64)) (t!7905 List!2974)) )
))
(declare-fun arrayNoDuplicates!0 (array!9793 (_ BitVec 32) List!2974) Bool)

(assert (=> b!208136 (= res!101180 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2971))))

(declare-fun res!101184 () Bool)

(assert (=> start!20778 (=> (not res!101184) (not e!135793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20778 (= res!101184 (validMask!0 mask!1149))))

(assert (=> start!20778 e!135793))

(declare-fun e!135792 () Bool)

(declare-fun array_inv!3081 (array!9791) Bool)

(assert (=> start!20778 (and (array_inv!3081 _values!649) e!135792)))

(assert (=> start!20778 true))

(assert (=> start!20778 tp_is_empty!5293))

(declare-fun array_inv!3082 (array!9793) Bool)

(assert (=> start!20778 (array_inv!3082 _keys!825)))

(assert (=> start!20778 tp!19333))

(declare-fun b!208137 () Bool)

(assert (=> b!208137 (= e!135792 (and e!135794 mapRes!9008))))

(declare-fun condMapEmpty!9008 () Bool)

(declare-fun mapDefault!9008 () ValueCell!2303)

