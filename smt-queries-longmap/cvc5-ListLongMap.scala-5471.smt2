; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72610 () Bool)

(assert start!72610)

(declare-fun b!842870 () Bool)

(declare-fun e!470195 () Bool)

(assert (=> b!842870 (= e!470195 false)))

(declare-fun lt!381058 () Bool)

(declare-datatypes ((array!47588 0))(
  ( (array!47589 (arr!22825 (Array (_ BitVec 32) (_ BitVec 64))) (size!23265 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47588)

(declare-datatypes ((List!16224 0))(
  ( (Nil!16221) (Cons!16220 (h!17351 (_ BitVec 64)) (t!22595 List!16224)) )
))
(declare-fun arrayNoDuplicates!0 (array!47588 (_ BitVec 32) List!16224) Bool)

(assert (=> b!842870 (= lt!381058 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16221))))

(declare-fun b!842871 () Bool)

(declare-fun res!572834 () Bool)

(assert (=> b!842871 (=> (not res!572834) (not e!470195))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25929 0))(
  ( (V!25930 (val!7878 Int)) )
))
(declare-datatypes ((ValueCell!7391 0))(
  ( (ValueCellFull!7391 (v!10303 V!25929)) (EmptyCell!7391) )
))
(declare-datatypes ((array!47590 0))(
  ( (array!47591 (arr!22826 (Array (_ BitVec 32) ValueCell!7391)) (size!23266 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47590)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842871 (= res!572834 (and (= (size!23266 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23265 _keys!868) (size!23266 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25091 () Bool)

(declare-fun mapRes!25091 () Bool)

(declare-fun tp!48409 () Bool)

(declare-fun e!470193 () Bool)

(assert (=> mapNonEmpty!25091 (= mapRes!25091 (and tp!48409 e!470193))))

(declare-fun mapKey!25091 () (_ BitVec 32))

(declare-fun mapValue!25091 () ValueCell!7391)

(declare-fun mapRest!25091 () (Array (_ BitVec 32) ValueCell!7391))

(assert (=> mapNonEmpty!25091 (= (arr!22826 _values!688) (store mapRest!25091 mapKey!25091 mapValue!25091))))

(declare-fun mapIsEmpty!25091 () Bool)

(assert (=> mapIsEmpty!25091 mapRes!25091))

(declare-fun b!842872 () Bool)

(declare-fun tp_is_empty!15661 () Bool)

(assert (=> b!842872 (= e!470193 tp_is_empty!15661)))

(declare-fun res!572837 () Bool)

(assert (=> start!72610 (=> (not res!572837) (not e!470195))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72610 (= res!572837 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23265 _keys!868))))))

(assert (=> start!72610 e!470195))

(assert (=> start!72610 true))

(declare-fun array_inv!18160 (array!47588) Bool)

(assert (=> start!72610 (array_inv!18160 _keys!868)))

(declare-fun e!470197 () Bool)

(declare-fun array_inv!18161 (array!47590) Bool)

(assert (=> start!72610 (and (array_inv!18161 _values!688) e!470197)))

(declare-fun b!842873 () Bool)

(declare-fun e!470194 () Bool)

(assert (=> b!842873 (= e!470197 (and e!470194 mapRes!25091))))

(declare-fun condMapEmpty!25091 () Bool)

(declare-fun mapDefault!25091 () ValueCell!7391)

