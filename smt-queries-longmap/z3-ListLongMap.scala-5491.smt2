; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72712 () Bool)

(assert start!72712)

(declare-fun b!843891 () Bool)

(declare-fun res!573444 () Bool)

(declare-fun e!470946 () Bool)

(assert (=> b!843891 (=> (not res!573444) (not e!470946))))

(declare-datatypes ((array!47799 0))(
  ( (array!47800 (arr!22931 (Array (_ BitVec 32) (_ BitVec 64))) (size!23373 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47799)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47799 (_ BitVec 32)) Bool)

(assert (=> b!843891 (= res!573444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843892 () Bool)

(declare-fun e!470945 () Bool)

(declare-fun tp_is_empty!15781 () Bool)

(assert (=> b!843892 (= e!470945 tp_is_empty!15781)))

(declare-fun res!573446 () Bool)

(assert (=> start!72712 (=> (not res!573446) (not e!470946))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72712 (= res!573446 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23373 _keys!868))))))

(assert (=> start!72712 e!470946))

(assert (=> start!72712 true))

(declare-fun array_inv!18310 (array!47799) Bool)

(assert (=> start!72712 (array_inv!18310 _keys!868)))

(declare-datatypes ((V!26089 0))(
  ( (V!26090 (val!7938 Int)) )
))
(declare-datatypes ((ValueCell!7451 0))(
  ( (ValueCellFull!7451 (v!10357 V!26089)) (EmptyCell!7451) )
))
(declare-datatypes ((array!47801 0))(
  ( (array!47802 (arr!22932 (Array (_ BitVec 32) ValueCell!7451)) (size!23374 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47801)

(declare-fun e!470949 () Bool)

(declare-fun array_inv!18311 (array!47801) Bool)

(assert (=> start!72712 (and (array_inv!18311 _values!688) e!470949)))

(declare-fun b!843893 () Bool)

(declare-fun e!470947 () Bool)

(assert (=> b!843893 (= e!470947 tp_is_empty!15781)))

(declare-fun b!843894 () Bool)

(declare-fun res!573445 () Bool)

(assert (=> b!843894 (=> (not res!573445) (not e!470946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843894 (= res!573445 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25271 () Bool)

(declare-fun mapRes!25271 () Bool)

(declare-fun tp!48590 () Bool)

(assert (=> mapNonEmpty!25271 (= mapRes!25271 (and tp!48590 e!470947))))

(declare-fun mapRest!25271 () (Array (_ BitVec 32) ValueCell!7451))

(declare-fun mapKey!25271 () (_ BitVec 32))

(declare-fun mapValue!25271 () ValueCell!7451)

(assert (=> mapNonEmpty!25271 (= (arr!22932 _values!688) (store mapRest!25271 mapKey!25271 mapValue!25271))))

(declare-fun b!843895 () Bool)

(assert (=> b!843895 (= e!470949 (and e!470945 mapRes!25271))))

(declare-fun condMapEmpty!25271 () Bool)

(declare-fun mapDefault!25271 () ValueCell!7451)

(assert (=> b!843895 (= condMapEmpty!25271 (= (arr!22932 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7451)) mapDefault!25271)))))

(declare-fun b!843896 () Bool)

(assert (=> b!843896 (= e!470946 false)))

(declare-fun lt!381002 () Bool)

(declare-datatypes ((List!16280 0))(
  ( (Nil!16277) (Cons!16276 (h!17407 (_ BitVec 64)) (t!22642 List!16280)) )
))
(declare-fun arrayNoDuplicates!0 (array!47799 (_ BitVec 32) List!16280) Bool)

(assert (=> b!843896 (= lt!381002 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16277))))

(declare-fun b!843897 () Bool)

(declare-fun res!573447 () Bool)

(assert (=> b!843897 (=> (not res!573447) (not e!470946))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843897 (= res!573447 (and (= (size!23374 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23373 _keys!868) (size!23374 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25271 () Bool)

(assert (=> mapIsEmpty!25271 mapRes!25271))

(assert (= (and start!72712 res!573446) b!843894))

(assert (= (and b!843894 res!573445) b!843897))

(assert (= (and b!843897 res!573447) b!843891))

(assert (= (and b!843891 res!573444) b!843896))

(assert (= (and b!843895 condMapEmpty!25271) mapIsEmpty!25271))

(assert (= (and b!843895 (not condMapEmpty!25271)) mapNonEmpty!25271))

(get-info :version)

(assert (= (and mapNonEmpty!25271 ((_ is ValueCellFull!7451) mapValue!25271)) b!843893))

(assert (= (and b!843895 ((_ is ValueCellFull!7451) mapDefault!25271)) b!843892))

(assert (= start!72712 b!843895))

(declare-fun m!785759 () Bool)

(assert (=> b!843896 m!785759))

(declare-fun m!785761 () Bool)

(assert (=> mapNonEmpty!25271 m!785761))

(declare-fun m!785763 () Bool)

(assert (=> start!72712 m!785763))

(declare-fun m!785765 () Bool)

(assert (=> start!72712 m!785765))

(declare-fun m!785767 () Bool)

(assert (=> b!843891 m!785767))

(declare-fun m!785769 () Bool)

(assert (=> b!843894 m!785769))

(check-sat (not b!843894) tp_is_empty!15781 (not b!843891) (not start!72712) (not mapNonEmpty!25271) (not b!843896))
(check-sat)
