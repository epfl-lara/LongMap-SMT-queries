; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133838 () Bool)

(assert start!133838)

(declare-fun mapIsEmpty!59710 () Bool)

(declare-fun mapRes!59710 () Bool)

(assert (=> mapIsEmpty!59710 mapRes!59710))

(declare-fun b!1564777 () Bool)

(declare-fun e!872170 () Bool)

(declare-fun tp_is_empty!38885 () Bool)

(assert (=> b!1564777 (= e!872170 tp_is_empty!38885)))

(declare-fun b!1564778 () Bool)

(declare-fun res!1069720 () Bool)

(declare-fun e!872173 () Bool)

(assert (=> b!1564778 (=> (not res!1069720) (not e!872173))))

(declare-datatypes ((array!104458 0))(
  ( (array!104459 (arr!50419 (Array (_ BitVec 32) (_ BitVec 64))) (size!50969 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104458)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104458 (_ BitVec 32)) Bool)

(assert (=> b!1564778 (= res!1069720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564779 () Bool)

(declare-fun e!872171 () Bool)

(assert (=> b!1564779 (= e!872171 tp_is_empty!38885)))

(declare-fun b!1564780 () Bool)

(declare-fun res!1069719 () Bool)

(assert (=> b!1564780 (=> (not res!1069719) (not e!872173))))

(declare-datatypes ((V!60053 0))(
  ( (V!60054 (val!19526 Int)) )
))
(declare-datatypes ((ValueCell!18412 0))(
  ( (ValueCellFull!18412 (v!22280 V!60053)) (EmptyCell!18412) )
))
(declare-datatypes ((array!104460 0))(
  ( (array!104461 (arr!50420 (Array (_ BitVec 32) ValueCell!18412)) (size!50970 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104460)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564780 (= res!1069719 (and (= (size!50970 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50969 _keys!637) (size!50970 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59710 () Bool)

(declare-fun tp!113635 () Bool)

(assert (=> mapNonEmpty!59710 (= mapRes!59710 (and tp!113635 e!872171))))

(declare-fun mapKey!59710 () (_ BitVec 32))

(declare-fun mapValue!59710 () ValueCell!18412)

(declare-fun mapRest!59710 () (Array (_ BitVec 32) ValueCell!18412))

(assert (=> mapNonEmpty!59710 (= (arr!50420 _values!487) (store mapRest!59710 mapKey!59710 mapValue!59710))))

(declare-fun res!1069718 () Bool)

(assert (=> start!133838 (=> (not res!1069718) (not e!872173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133838 (= res!1069718 (validMask!0 mask!947))))

(assert (=> start!133838 e!872173))

(assert (=> start!133838 true))

(declare-fun e!872172 () Bool)

(declare-fun array_inv!39183 (array!104460) Bool)

(assert (=> start!133838 (and (array_inv!39183 _values!487) e!872172)))

(declare-fun array_inv!39184 (array!104458) Bool)

(assert (=> start!133838 (array_inv!39184 _keys!637)))

(declare-fun b!1564781 () Bool)

(assert (=> b!1564781 (= e!872172 (and e!872170 mapRes!59710))))

(declare-fun condMapEmpty!59710 () Bool)

(declare-fun mapDefault!59710 () ValueCell!18412)

