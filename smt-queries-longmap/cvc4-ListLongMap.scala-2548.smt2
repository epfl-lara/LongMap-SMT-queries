; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39110 () Bool)

(assert start!39110)

(declare-fun b_free!9377 () Bool)

(declare-fun b_next!9377 () Bool)

(assert (=> start!39110 (= b_free!9377 (not b_next!9377))))

(declare-fun tp!33659 () Bool)

(declare-fun b_and!16763 () Bool)

(assert (=> start!39110 (= tp!33659 b_and!16763)))

(declare-fun b!411087 () Bool)

(declare-fun res!238409 () Bool)

(declare-fun e!246267 () Bool)

(assert (=> b!411087 (=> (not res!238409) (not e!246267))))

(declare-datatypes ((array!24919 0))(
  ( (array!24920 (arr!11909 (Array (_ BitVec 32) (_ BitVec 64))) (size!12261 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24919)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411087 (= res!238409 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!411088 () Bool)

(declare-fun res!238418 () Bool)

(assert (=> b!411088 (=> (not res!238418) (not e!246267))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24919 (_ BitVec 32)) Bool)

(assert (=> b!411088 (= res!238418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17415 () Bool)

(declare-fun mapRes!17415 () Bool)

(assert (=> mapIsEmpty!17415 mapRes!17415))

(declare-fun b!411089 () Bool)

(declare-fun res!238413 () Bool)

(declare-fun e!246269 () Bool)

(assert (=> b!411089 (=> (not res!238413) (not e!246269))))

(declare-fun lt!189212 () array!24919)

(declare-datatypes ((List!6911 0))(
  ( (Nil!6908) (Cons!6907 (h!7763 (_ BitVec 64)) (t!12085 List!6911)) )
))
(declare-fun arrayNoDuplicates!0 (array!24919 (_ BitVec 32) List!6911) Bool)

(assert (=> b!411089 (= res!238413 (arrayNoDuplicates!0 lt!189212 #b00000000000000000000000000000000 Nil!6908))))

(declare-fun b!411090 () Bool)

(declare-fun res!238414 () Bool)

(assert (=> b!411090 (=> (not res!238414) (not e!246267))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411090 (= res!238414 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12261 _keys!709))))))

(declare-fun b!411091 () Bool)

(assert (=> b!411091 (= e!246269 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15143 0))(
  ( (V!15144 (val!5309 Int)) )
))
(declare-fun minValue!515 () V!15143)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4921 0))(
  ( (ValueCellFull!4921 (v!7556 V!15143)) (EmptyCell!4921) )
))
(declare-datatypes ((array!24921 0))(
  ( (array!24922 (arr!11910 (Array (_ BitVec 32) ValueCell!4921)) (size!12262 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24921)

(declare-fun v!412 () V!15143)

(declare-datatypes ((tuple2!6886 0))(
  ( (tuple2!6887 (_1!3454 (_ BitVec 64)) (_2!3454 V!15143)) )
))
(declare-datatypes ((List!6912 0))(
  ( (Nil!6909) (Cons!6908 (h!7764 tuple2!6886) (t!12086 List!6912)) )
))
(declare-datatypes ((ListLongMap!5799 0))(
  ( (ListLongMap!5800 (toList!2915 List!6912)) )
))
(declare-fun lt!189211 () ListLongMap!5799)

(declare-fun zeroValue!515 () V!15143)

(declare-fun getCurrentListMapNoExtraKeys!1123 (array!24919 array!24921 (_ BitVec 32) (_ BitVec 32) V!15143 V!15143 (_ BitVec 32) Int) ListLongMap!5799)

(assert (=> b!411091 (= lt!189211 (getCurrentListMapNoExtraKeys!1123 lt!189212 (array!24922 (store (arr!11910 _values!549) i!563 (ValueCellFull!4921 v!412)) (size!12262 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189210 () ListLongMap!5799)

(assert (=> b!411091 (= lt!189210 (getCurrentListMapNoExtraKeys!1123 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411092 () Bool)

(declare-fun res!238410 () Bool)

(assert (=> b!411092 (=> (not res!238410) (not e!246267))))

(assert (=> b!411092 (= res!238410 (and (= (size!12262 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12261 _keys!709) (size!12262 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411093 () Bool)

(declare-fun res!238417 () Bool)

(assert (=> b!411093 (=> (not res!238417) (not e!246267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411093 (= res!238417 (validMask!0 mask!1025))))

(declare-fun b!411094 () Bool)

(declare-fun res!238419 () Bool)

(assert (=> b!411094 (=> (not res!238419) (not e!246267))))

(assert (=> b!411094 (= res!238419 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6908))))

(declare-fun b!411095 () Bool)

(declare-fun e!246266 () Bool)

(declare-fun tp_is_empty!10529 () Bool)

(assert (=> b!411095 (= e!246266 tp_is_empty!10529)))

(declare-fun b!411096 () Bool)

(declare-fun e!246268 () Bool)

(assert (=> b!411096 (= e!246268 (and e!246266 mapRes!17415))))

(declare-fun condMapEmpty!17415 () Bool)

(declare-fun mapDefault!17415 () ValueCell!4921)

