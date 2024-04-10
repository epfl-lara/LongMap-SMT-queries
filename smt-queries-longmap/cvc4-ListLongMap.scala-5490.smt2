; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72728 () Bool)

(assert start!72728)

(declare-fun res!573544 () Bool)

(declare-fun e!471080 () Bool)

(assert (=> start!72728 (=> (not res!573544) (not e!471080))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47796 0))(
  ( (array!47797 (arr!22929 (Array (_ BitVec 32) (_ BitVec 64))) (size!23369 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47796)

(assert (=> start!72728 (= res!573544 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23369 _keys!868))))))

(assert (=> start!72728 e!471080))

(assert (=> start!72728 true))

(declare-fun array_inv!18234 (array!47796) Bool)

(assert (=> start!72728 (array_inv!18234 _keys!868)))

(declare-datatypes ((V!26085 0))(
  ( (V!26086 (val!7937 Int)) )
))
(declare-datatypes ((ValueCell!7450 0))(
  ( (ValueCellFull!7450 (v!10362 V!26085)) (EmptyCell!7450) )
))
(declare-datatypes ((array!47798 0))(
  ( (array!47799 (arr!22930 (Array (_ BitVec 32) ValueCell!7450)) (size!23370 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47798)

(declare-fun e!471082 () Bool)

(declare-fun array_inv!18235 (array!47798) Bool)

(assert (=> start!72728 (and (array_inv!18235 _values!688) e!471082)))

(declare-fun b!844109 () Bool)

(declare-fun res!573543 () Bool)

(assert (=> b!844109 (=> (not res!573543) (not e!471080))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844109 (= res!573543 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25268 () Bool)

(declare-fun mapRes!25268 () Bool)

(assert (=> mapIsEmpty!25268 mapRes!25268))

(declare-fun b!844110 () Bool)

(declare-fun e!471081 () Bool)

(declare-fun tp_is_empty!15779 () Bool)

(assert (=> b!844110 (= e!471081 tp_is_empty!15779)))

(declare-fun b!844111 () Bool)

(declare-fun res!573542 () Bool)

(assert (=> b!844111 (=> (not res!573542) (not e!471080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47796 (_ BitVec 32)) Bool)

(assert (=> b!844111 (= res!573542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25268 () Bool)

(declare-fun tp!48586 () Bool)

(assert (=> mapNonEmpty!25268 (= mapRes!25268 (and tp!48586 e!471081))))

(declare-fun mapKey!25268 () (_ BitVec 32))

(declare-fun mapValue!25268 () ValueCell!7450)

(declare-fun mapRest!25268 () (Array (_ BitVec 32) ValueCell!7450))

(assert (=> mapNonEmpty!25268 (= (arr!22930 _values!688) (store mapRest!25268 mapKey!25268 mapValue!25268))))

(declare-fun b!844112 () Bool)

(assert (=> b!844112 (= e!471080 false)))

(declare-fun lt!381235 () Bool)

(declare-datatypes ((List!16260 0))(
  ( (Nil!16257) (Cons!16256 (h!17387 (_ BitVec 64)) (t!22631 List!16260)) )
))
(declare-fun arrayNoDuplicates!0 (array!47796 (_ BitVec 32) List!16260) Bool)

(assert (=> b!844112 (= lt!381235 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16257))))

(declare-fun b!844113 () Bool)

(declare-fun res!573545 () Bool)

(assert (=> b!844113 (=> (not res!573545) (not e!471080))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844113 (= res!573545 (and (= (size!23370 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23369 _keys!868) (size!23370 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844114 () Bool)

(declare-fun e!471078 () Bool)

(assert (=> b!844114 (= e!471082 (and e!471078 mapRes!25268))))

(declare-fun condMapEmpty!25268 () Bool)

(declare-fun mapDefault!25268 () ValueCell!7450)

