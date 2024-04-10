; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72640 () Bool)

(assert start!72640)

(declare-fun b!843185 () Bool)

(declare-fun res!573015 () Bool)

(declare-fun e!470421 () Bool)

(assert (=> b!843185 (=> (not res!573015) (not e!470421))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843185 (= res!573015 (validMask!0 mask!1196))))

(declare-fun b!843186 () Bool)

(declare-fun e!470418 () Bool)

(declare-fun tp_is_empty!15691 () Bool)

(assert (=> b!843186 (= e!470418 tp_is_empty!15691)))

(declare-fun b!843187 () Bool)

(declare-fun res!573016 () Bool)

(assert (=> b!843187 (=> (not res!573016) (not e!470421))))

(declare-datatypes ((array!47640 0))(
  ( (array!47641 (arr!22851 (Array (_ BitVec 32) (_ BitVec 64))) (size!23291 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47640)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47640 (_ BitVec 32)) Bool)

(assert (=> b!843187 (= res!573016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573017 () Bool)

(assert (=> start!72640 (=> (not res!573017) (not e!470421))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72640 (= res!573017 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23291 _keys!868))))))

(assert (=> start!72640 e!470421))

(assert (=> start!72640 true))

(declare-fun array_inv!18176 (array!47640) Bool)

(assert (=> start!72640 (array_inv!18176 _keys!868)))

(declare-datatypes ((V!25969 0))(
  ( (V!25970 (val!7893 Int)) )
))
(declare-datatypes ((ValueCell!7406 0))(
  ( (ValueCellFull!7406 (v!10318 V!25969)) (EmptyCell!7406) )
))
(declare-datatypes ((array!47642 0))(
  ( (array!47643 (arr!22852 (Array (_ BitVec 32) ValueCell!7406)) (size!23292 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47642)

(declare-fun e!470419 () Bool)

(declare-fun array_inv!18177 (array!47642) Bool)

(assert (=> start!72640 (and (array_inv!18177 _values!688) e!470419)))

(declare-fun mapNonEmpty!25136 () Bool)

(declare-fun mapRes!25136 () Bool)

(declare-fun tp!48454 () Bool)

(declare-fun e!470422 () Bool)

(assert (=> mapNonEmpty!25136 (= mapRes!25136 (and tp!48454 e!470422))))

(declare-fun mapValue!25136 () ValueCell!7406)

(declare-fun mapKey!25136 () (_ BitVec 32))

(declare-fun mapRest!25136 () (Array (_ BitVec 32) ValueCell!7406))

(assert (=> mapNonEmpty!25136 (= (arr!22852 _values!688) (store mapRest!25136 mapKey!25136 mapValue!25136))))

(declare-fun b!843188 () Bool)

(assert (=> b!843188 (= e!470421 false)))

(declare-fun lt!381103 () Bool)

(declare-datatypes ((List!16232 0))(
  ( (Nil!16229) (Cons!16228 (h!17359 (_ BitVec 64)) (t!22603 List!16232)) )
))
(declare-fun arrayNoDuplicates!0 (array!47640 (_ BitVec 32) List!16232) Bool)

(assert (=> b!843188 (= lt!381103 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16229))))

(declare-fun b!843189 () Bool)

(declare-fun res!573014 () Bool)

(assert (=> b!843189 (=> (not res!573014) (not e!470421))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843189 (= res!573014 (and (= (size!23292 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23291 _keys!868) (size!23292 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843190 () Bool)

(assert (=> b!843190 (= e!470422 tp_is_empty!15691)))

(declare-fun mapIsEmpty!25136 () Bool)

(assert (=> mapIsEmpty!25136 mapRes!25136))

(declare-fun b!843191 () Bool)

(assert (=> b!843191 (= e!470419 (and e!470418 mapRes!25136))))

(declare-fun condMapEmpty!25136 () Bool)

(declare-fun mapDefault!25136 () ValueCell!7406)

