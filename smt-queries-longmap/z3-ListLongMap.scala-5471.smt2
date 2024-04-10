; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72612 () Bool)

(assert start!72612)

(declare-fun b!842891 () Bool)

(declare-fun res!572846 () Bool)

(declare-fun e!470210 () Bool)

(assert (=> b!842891 (=> (not res!572846) (not e!470210))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842891 (= res!572846 (validMask!0 mask!1196))))

(declare-fun b!842892 () Bool)

(assert (=> b!842892 (= e!470210 false)))

(declare-fun lt!381061 () Bool)

(declare-datatypes ((array!47592 0))(
  ( (array!47593 (arr!22827 (Array (_ BitVec 32) (_ BitVec 64))) (size!23267 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47592)

(declare-datatypes ((List!16225 0))(
  ( (Nil!16222) (Cons!16221 (h!17352 (_ BitVec 64)) (t!22596 List!16225)) )
))
(declare-fun arrayNoDuplicates!0 (array!47592 (_ BitVec 32) List!16225) Bool)

(assert (=> b!842892 (= lt!381061 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16222))))

(declare-fun mapIsEmpty!25094 () Bool)

(declare-fun mapRes!25094 () Bool)

(assert (=> mapIsEmpty!25094 mapRes!25094))

(declare-fun mapNonEmpty!25094 () Bool)

(declare-fun tp!48412 () Bool)

(declare-fun e!470209 () Bool)

(assert (=> mapNonEmpty!25094 (= mapRes!25094 (and tp!48412 e!470209))))

(declare-fun mapKey!25094 () (_ BitVec 32))

(declare-datatypes ((V!25931 0))(
  ( (V!25932 (val!7879 Int)) )
))
(declare-datatypes ((ValueCell!7392 0))(
  ( (ValueCellFull!7392 (v!10304 V!25931)) (EmptyCell!7392) )
))
(declare-fun mapRest!25094 () (Array (_ BitVec 32) ValueCell!7392))

(declare-fun mapValue!25094 () ValueCell!7392)

(declare-datatypes ((array!47594 0))(
  ( (array!47595 (arr!22828 (Array (_ BitVec 32) ValueCell!7392)) (size!23268 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47594)

(assert (=> mapNonEmpty!25094 (= (arr!22828 _values!688) (store mapRest!25094 mapKey!25094 mapValue!25094))))

(declare-fun b!842893 () Bool)

(declare-fun tp_is_empty!15663 () Bool)

(assert (=> b!842893 (= e!470209 tp_is_empty!15663)))

(declare-fun b!842894 () Bool)

(declare-fun res!572847 () Bool)

(assert (=> b!842894 (=> (not res!572847) (not e!470210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47592 (_ BitVec 32)) Bool)

(assert (=> b!842894 (= res!572847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572848 () Bool)

(assert (=> start!72612 (=> (not res!572848) (not e!470210))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72612 (= res!572848 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23267 _keys!868))))))

(assert (=> start!72612 e!470210))

(assert (=> start!72612 true))

(declare-fun array_inv!18162 (array!47592) Bool)

(assert (=> start!72612 (array_inv!18162 _keys!868)))

(declare-fun e!470208 () Bool)

(declare-fun array_inv!18163 (array!47594) Bool)

(assert (=> start!72612 (and (array_inv!18163 _values!688) e!470208)))

(declare-fun b!842895 () Bool)

(declare-fun e!470212 () Bool)

(assert (=> b!842895 (= e!470212 tp_is_empty!15663)))

(declare-fun b!842896 () Bool)

(assert (=> b!842896 (= e!470208 (and e!470212 mapRes!25094))))

(declare-fun condMapEmpty!25094 () Bool)

(declare-fun mapDefault!25094 () ValueCell!7392)

(assert (=> b!842896 (= condMapEmpty!25094 (= (arr!22828 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7392)) mapDefault!25094)))))

(declare-fun b!842897 () Bool)

(declare-fun res!572849 () Bool)

(assert (=> b!842897 (=> (not res!572849) (not e!470210))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842897 (= res!572849 (and (= (size!23268 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23267 _keys!868) (size!23268 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72612 res!572848) b!842891))

(assert (= (and b!842891 res!572846) b!842897))

(assert (= (and b!842897 res!572849) b!842894))

(assert (= (and b!842894 res!572847) b!842892))

(assert (= (and b!842896 condMapEmpty!25094) mapIsEmpty!25094))

(assert (= (and b!842896 (not condMapEmpty!25094)) mapNonEmpty!25094))

(get-info :version)

(assert (= (and mapNonEmpty!25094 ((_ is ValueCellFull!7392) mapValue!25094)) b!842893))

(assert (= (and b!842896 ((_ is ValueCellFull!7392) mapDefault!25094)) b!842895))

(assert (= start!72612 b!842896))

(declare-fun m!785805 () Bool)

(assert (=> b!842892 m!785805))

(declare-fun m!785807 () Bool)

(assert (=> mapNonEmpty!25094 m!785807))

(declare-fun m!785809 () Bool)

(assert (=> b!842891 m!785809))

(declare-fun m!785811 () Bool)

(assert (=> b!842894 m!785811))

(declare-fun m!785813 () Bool)

(assert (=> start!72612 m!785813))

(declare-fun m!785815 () Bool)

(assert (=> start!72612 m!785815))

(check-sat (not b!842891) tp_is_empty!15663 (not mapNonEmpty!25094) (not b!842892) (not start!72612) (not b!842894))
(check-sat)
