; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72342 () Bool)

(assert start!72342)

(declare-fun mapNonEmpty!24689 () Bool)

(declare-fun mapRes!24689 () Bool)

(declare-fun tp!47683 () Bool)

(declare-fun e!467861 () Bool)

(assert (=> mapNonEmpty!24689 (= mapRes!24689 (and tp!47683 e!467861))))

(declare-datatypes ((V!25571 0))(
  ( (V!25572 (val!7744 Int)) )
))
(declare-datatypes ((ValueCell!7257 0))(
  ( (ValueCellFull!7257 (v!10169 V!25571)) (EmptyCell!7257) )
))
(declare-fun mapRest!24689 () (Array (_ BitVec 32) ValueCell!7257))

(declare-fun mapKey!24689 () (_ BitVec 32))

(declare-datatypes ((array!47076 0))(
  ( (array!47077 (arr!22569 (Array (_ BitVec 32) ValueCell!7257)) (size!23009 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47076)

(declare-fun mapValue!24689 () ValueCell!7257)

(assert (=> mapNonEmpty!24689 (= (arr!22569 _values!688) (store mapRest!24689 mapKey!24689 mapValue!24689))))

(declare-fun b!838112 () Bool)

(declare-fun res!569931 () Bool)

(declare-fun e!467860 () Bool)

(assert (=> b!838112 (=> (not res!569931) (not e!467860))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47078 0))(
  ( (array!47079 (arr!22570 (Array (_ BitVec 32) (_ BitVec 64))) (size!23010 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47078)

(assert (=> b!838112 (= res!569931 (and (= (size!23009 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23010 _keys!868) (size!23009 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!569932 () Bool)

(assert (=> start!72342 (=> (not res!569932) (not e!467860))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72342 (= res!569932 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23010 _keys!868))))))

(assert (=> start!72342 e!467860))

(assert (=> start!72342 true))

(declare-fun array_inv!17984 (array!47078) Bool)

(assert (=> start!72342 (array_inv!17984 _keys!868)))

(declare-fun e!467859 () Bool)

(declare-fun array_inv!17985 (array!47076) Bool)

(assert (=> start!72342 (and (array_inv!17985 _values!688) e!467859)))

(declare-fun b!838113 () Bool)

(declare-fun res!569930 () Bool)

(assert (=> b!838113 (=> (not res!569930) (not e!467860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47078 (_ BitVec 32)) Bool)

(assert (=> b!838113 (= res!569930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24689 () Bool)

(assert (=> mapIsEmpty!24689 mapRes!24689))

(declare-fun b!838114 () Bool)

(declare-fun tp_is_empty!15393 () Bool)

(assert (=> b!838114 (= e!467861 tp_is_empty!15393)))

(declare-fun b!838115 () Bool)

(declare-fun res!569933 () Bool)

(assert (=> b!838115 (=> (not res!569933) (not e!467860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838115 (= res!569933 (validMask!0 mask!1196))))

(declare-fun b!838116 () Bool)

(declare-fun e!467863 () Bool)

(assert (=> b!838116 (= e!467863 tp_is_empty!15393)))

(declare-fun b!838117 () Bool)

(assert (=> b!838117 (= e!467860 false)))

(declare-fun lt!380656 () Bool)

(declare-datatypes ((List!16047 0))(
  ( (Nil!16044) (Cons!16043 (h!17174 (_ BitVec 64)) (t!22418 List!16047)) )
))
(declare-fun arrayNoDuplicates!0 (array!47078 (_ BitVec 32) List!16047) Bool)

(assert (=> b!838117 (= lt!380656 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16044))))

(declare-fun b!838118 () Bool)

(assert (=> b!838118 (= e!467859 (and e!467863 mapRes!24689))))

(declare-fun condMapEmpty!24689 () Bool)

(declare-fun mapDefault!24689 () ValueCell!7257)

(assert (=> b!838118 (= condMapEmpty!24689 (= (arr!22569 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7257)) mapDefault!24689)))))

(assert (= (and start!72342 res!569932) b!838115))

(assert (= (and b!838115 res!569933) b!838112))

(assert (= (and b!838112 res!569931) b!838113))

(assert (= (and b!838113 res!569930) b!838117))

(assert (= (and b!838118 condMapEmpty!24689) mapIsEmpty!24689))

(assert (= (and b!838118 (not condMapEmpty!24689)) mapNonEmpty!24689))

(get-info :version)

(assert (= (and mapNonEmpty!24689 ((_ is ValueCellFull!7257) mapValue!24689)) b!838114))

(assert (= (and b!838118 ((_ is ValueCellFull!7257) mapDefault!24689)) b!838116))

(assert (= start!72342 b!838118))

(declare-fun m!782673 () Bool)

(assert (=> mapNonEmpty!24689 m!782673))

(declare-fun m!782675 () Bool)

(assert (=> b!838113 m!782675))

(declare-fun m!782677 () Bool)

(assert (=> b!838117 m!782677))

(declare-fun m!782679 () Bool)

(assert (=> b!838115 m!782679))

(declare-fun m!782681 () Bool)

(assert (=> start!72342 m!782681))

(declare-fun m!782683 () Bool)

(assert (=> start!72342 m!782683))

(check-sat (not mapNonEmpty!24689) (not b!838113) (not b!838115) (not b!838117) (not start!72342) tp_is_empty!15393)
(check-sat)
