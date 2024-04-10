; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72718 () Bool)

(assert start!72718)

(declare-fun mapIsEmpty!25253 () Bool)

(declare-fun mapRes!25253 () Bool)

(assert (=> mapIsEmpty!25253 mapRes!25253))

(declare-fun b!844004 () Bool)

(declare-fun res!573485 () Bool)

(declare-fun e!471005 () Bool)

(assert (=> b!844004 (=> (not res!573485) (not e!471005))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844004 (= res!573485 (validMask!0 mask!1196))))

(declare-fun res!573482 () Bool)

(assert (=> start!72718 (=> (not res!573482) (not e!471005))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47780 0))(
  ( (array!47781 (arr!22921 (Array (_ BitVec 32) (_ BitVec 64))) (size!23361 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47780)

(assert (=> start!72718 (= res!573482 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23361 _keys!868))))))

(assert (=> start!72718 e!471005))

(assert (=> start!72718 true))

(declare-fun array_inv!18228 (array!47780) Bool)

(assert (=> start!72718 (array_inv!18228 _keys!868)))

(declare-datatypes ((V!26073 0))(
  ( (V!26074 (val!7932 Int)) )
))
(declare-datatypes ((ValueCell!7445 0))(
  ( (ValueCellFull!7445 (v!10357 V!26073)) (EmptyCell!7445) )
))
(declare-datatypes ((array!47782 0))(
  ( (array!47783 (arr!22922 (Array (_ BitVec 32) ValueCell!7445)) (size!23362 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47782)

(declare-fun e!471004 () Bool)

(declare-fun array_inv!18229 (array!47782) Bool)

(assert (=> start!72718 (and (array_inv!18229 _values!688) e!471004)))

(declare-fun b!844005 () Bool)

(declare-fun e!471003 () Bool)

(declare-fun tp_is_empty!15769 () Bool)

(assert (=> b!844005 (= e!471003 tp_is_empty!15769)))

(declare-fun b!844006 () Bool)

(declare-fun e!471006 () Bool)

(assert (=> b!844006 (= e!471004 (and e!471006 mapRes!25253))))

(declare-fun condMapEmpty!25253 () Bool)

(declare-fun mapDefault!25253 () ValueCell!7445)

