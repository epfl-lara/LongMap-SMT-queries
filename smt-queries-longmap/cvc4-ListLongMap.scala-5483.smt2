; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72686 () Bool)

(assert start!72686)

(declare-fun mapNonEmpty!25205 () Bool)

(declare-fun mapRes!25205 () Bool)

(declare-fun tp!48523 () Bool)

(declare-fun e!470767 () Bool)

(assert (=> mapNonEmpty!25205 (= mapRes!25205 (and tp!48523 e!470767))))

(declare-datatypes ((V!26029 0))(
  ( (V!26030 (val!7916 Int)) )
))
(declare-datatypes ((ValueCell!7429 0))(
  ( (ValueCellFull!7429 (v!10341 V!26029)) (EmptyCell!7429) )
))
(declare-fun mapValue!25205 () ValueCell!7429)

(declare-fun mapKey!25205 () (_ BitVec 32))

(declare-datatypes ((array!47720 0))(
  ( (array!47721 (arr!22891 (Array (_ BitVec 32) ValueCell!7429)) (size!23331 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47720)

(declare-fun mapRest!25205 () (Array (_ BitVec 32) ValueCell!7429))

(assert (=> mapNonEmpty!25205 (= (arr!22891 _values!688) (store mapRest!25205 mapKey!25205 mapValue!25205))))

(declare-fun res!573291 () Bool)

(declare-fun e!470764 () Bool)

(assert (=> start!72686 (=> (not res!573291) (not e!470764))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47722 0))(
  ( (array!47723 (arr!22892 (Array (_ BitVec 32) (_ BitVec 64))) (size!23332 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47722)

(assert (=> start!72686 (= res!573291 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23332 _keys!868))))))

(assert (=> start!72686 e!470764))

(assert (=> start!72686 true))

(declare-fun array_inv!18204 (array!47722) Bool)

(assert (=> start!72686 (array_inv!18204 _keys!868)))

(declare-fun e!470765 () Bool)

(declare-fun array_inv!18205 (array!47720) Bool)

(assert (=> start!72686 (and (array_inv!18205 _values!688) e!470765)))

(declare-fun b!843668 () Bool)

(declare-fun e!470766 () Bool)

(assert (=> b!843668 (= e!470765 (and e!470766 mapRes!25205))))

(declare-fun condMapEmpty!25205 () Bool)

(declare-fun mapDefault!25205 () ValueCell!7429)

