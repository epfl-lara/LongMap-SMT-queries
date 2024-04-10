; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72736 () Bool)

(assert start!72736)

(declare-fun b!844193 () Bool)

(declare-fun e!471141 () Bool)

(declare-fun tp_is_empty!15787 () Bool)

(assert (=> b!844193 (= e!471141 tp_is_empty!15787)))

(declare-fun mapNonEmpty!25280 () Bool)

(declare-fun mapRes!25280 () Bool)

(declare-fun tp!48598 () Bool)

(assert (=> mapNonEmpty!25280 (= mapRes!25280 (and tp!48598 e!471141))))

(declare-fun mapKey!25280 () (_ BitVec 32))

(declare-datatypes ((V!26097 0))(
  ( (V!26098 (val!7941 Int)) )
))
(declare-datatypes ((ValueCell!7454 0))(
  ( (ValueCellFull!7454 (v!10366 V!26097)) (EmptyCell!7454) )
))
(declare-fun mapValue!25280 () ValueCell!7454)

(declare-fun mapRest!25280 () (Array (_ BitVec 32) ValueCell!7454))

(declare-datatypes ((array!47812 0))(
  ( (array!47813 (arr!22937 (Array (_ BitVec 32) ValueCell!7454)) (size!23377 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47812)

(assert (=> mapNonEmpty!25280 (= (arr!22937 _values!688) (store mapRest!25280 mapKey!25280 mapValue!25280))))

(declare-fun res!573591 () Bool)

(declare-fun e!471138 () Bool)

(assert (=> start!72736 (=> (not res!573591) (not e!471138))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47814 0))(
  ( (array!47815 (arr!22938 (Array (_ BitVec 32) (_ BitVec 64))) (size!23378 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47814)

(assert (=> start!72736 (= res!573591 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23378 _keys!868))))))

(assert (=> start!72736 e!471138))

(assert (=> start!72736 true))

(declare-fun array_inv!18242 (array!47814) Bool)

(assert (=> start!72736 (array_inv!18242 _keys!868)))

(declare-fun e!471140 () Bool)

(declare-fun array_inv!18243 (array!47812) Bool)

(assert (=> start!72736 (and (array_inv!18243 _values!688) e!471140)))

(declare-fun b!844194 () Bool)

(declare-fun res!573593 () Bool)

(assert (=> b!844194 (=> (not res!573593) (not e!471138))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47814 (_ BitVec 32)) Bool)

(assert (=> b!844194 (= res!573593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844195 () Bool)

(declare-fun e!471142 () Bool)

(assert (=> b!844195 (= e!471140 (and e!471142 mapRes!25280))))

(declare-fun condMapEmpty!25280 () Bool)

(declare-fun mapDefault!25280 () ValueCell!7454)

