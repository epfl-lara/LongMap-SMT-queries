; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20448 () Bool)

(assert start!20448)

(declare-fun b_free!5107 () Bool)

(declare-fun b_next!5107 () Bool)

(assert (=> start!20448 (= b_free!5107 (not b_next!5107))))

(declare-fun tp!18353 () Bool)

(declare-fun b_and!11853 () Bool)

(assert (=> start!20448 (= tp!18353 b_and!11853)))

(declare-fun b!202563 () Bool)

(declare-fun res!97098 () Bool)

(declare-fun e!132677 () Bool)

(assert (=> b!202563 (=> (not res!97098) (not e!132677))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202563 (= res!97098 (validKeyInArray!0 k!843))))

(declare-fun b!202564 () Bool)

(declare-fun res!97104 () Bool)

(assert (=> b!202564 (=> (not res!97104) (not e!132677))))

(declare-datatypes ((array!9151 0))(
  ( (array!9152 (arr!4326 (Array (_ BitVec 32) (_ BitVec 64))) (size!4651 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9151)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9151 (_ BitVec 32)) Bool)

(assert (=> b!202564 (= res!97104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202565 () Bool)

(declare-fun res!97102 () Bool)

(assert (=> b!202565 (=> (not res!97102) (not e!132677))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6265 0))(
  ( (V!6266 (val!2526 Int)) )
))
(declare-datatypes ((ValueCell!2138 0))(
  ( (ValueCellFull!2138 (v!4496 V!6265)) (EmptyCell!2138) )
))
(declare-datatypes ((array!9153 0))(
  ( (array!9154 (arr!4327 (Array (_ BitVec 32) ValueCell!2138)) (size!4652 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9153)

(assert (=> b!202565 (= res!97102 (and (= (size!4652 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4651 _keys!825) (size!4652 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202566 () Bool)

(declare-fun e!132671 () Bool)

(declare-fun tp_is_empty!4963 () Bool)

(assert (=> b!202566 (= e!132671 tp_is_empty!4963)))

(declare-fun b!202567 () Bool)

(declare-fun e!132672 () Bool)

(declare-fun e!132676 () Bool)

(assert (=> b!202567 (= e!132672 e!132676)))

(declare-fun res!97103 () Bool)

(assert (=> b!202567 (=> res!97103 e!132676)))

(assert (=> b!202567 (= res!97103 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3832 0))(
  ( (tuple2!3833 (_1!1927 (_ BitVec 64)) (_2!1927 V!6265)) )
))
(declare-datatypes ((List!2735 0))(
  ( (Nil!2732) (Cons!2731 (h!3373 tuple2!3832) (t!7666 List!2735)) )
))
(declare-datatypes ((ListLongMap!2745 0))(
  ( (ListLongMap!2746 (toList!1388 List!2735)) )
))
(declare-fun lt!101751 () ListLongMap!2745)

(declare-fun lt!101742 () ListLongMap!2745)

(assert (=> b!202567 (= lt!101751 lt!101742)))

(declare-fun lt!101746 () ListLongMap!2745)

(declare-fun lt!101748 () tuple2!3832)

(declare-fun +!415 (ListLongMap!2745 tuple2!3832) ListLongMap!2745)

(assert (=> b!202567 (= lt!101742 (+!415 lt!101746 lt!101748))))

(declare-fun lt!101747 () ListLongMap!2745)

(declare-fun lt!101744 () ListLongMap!2745)

(assert (=> b!202567 (= lt!101747 lt!101744)))

(declare-fun lt!101743 () ListLongMap!2745)

(assert (=> b!202567 (= lt!101744 (+!415 lt!101743 lt!101748))))

(declare-fun lt!101750 () ListLongMap!2745)

(assert (=> b!202567 (= lt!101751 (+!415 lt!101750 lt!101748))))

(declare-fun zeroValue!615 () V!6265)

(assert (=> b!202567 (= lt!101748 (tuple2!3833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202568 () Bool)

(declare-fun res!97097 () Bool)

(assert (=> b!202568 (=> (not res!97097) (not e!132677))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202568 (= res!97097 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4651 _keys!825))))))

(declare-fun b!202569 () Bool)

(declare-fun res!97100 () Bool)

(assert (=> b!202569 (=> (not res!97100) (not e!132677))))

(declare-datatypes ((List!2736 0))(
  ( (Nil!2733) (Cons!2732 (h!3374 (_ BitVec 64)) (t!7667 List!2736)) )
))
(declare-fun arrayNoDuplicates!0 (array!9151 (_ BitVec 32) List!2736) Bool)

(assert (=> b!202569 (= res!97100 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2733))))

(declare-fun b!202570 () Bool)

(declare-fun res!97099 () Bool)

(assert (=> b!202570 (=> (not res!97099) (not e!132677))))

(assert (=> b!202570 (= res!97099 (= (select (arr!4326 _keys!825) i!601) k!843))))

(declare-fun b!202571 () Bool)

(declare-fun e!132675 () Bool)

(declare-fun mapRes!8513 () Bool)

(assert (=> b!202571 (= e!132675 (and e!132671 mapRes!8513))))

(declare-fun condMapEmpty!8513 () Bool)

(declare-fun mapDefault!8513 () ValueCell!2138)

