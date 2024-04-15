; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72778 () Bool)

(assert start!72778)

(declare-fun b!844584 () Bool)

(declare-fun e!471442 () Bool)

(declare-fun tp_is_empty!15847 () Bool)

(assert (=> b!844584 (= e!471442 tp_is_empty!15847)))

(declare-fun b!844585 () Bool)

(declare-fun res!573841 () Bool)

(declare-fun e!471444 () Bool)

(assert (=> b!844585 (=> (not res!573841) (not e!471444))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47917 0))(
  ( (array!47918 (arr!22990 (Array (_ BitVec 32) (_ BitVec 64))) (size!23432 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47917)

(declare-datatypes ((V!26177 0))(
  ( (V!26178 (val!7971 Int)) )
))
(declare-datatypes ((ValueCell!7484 0))(
  ( (ValueCellFull!7484 (v!10390 V!26177)) (EmptyCell!7484) )
))
(declare-datatypes ((array!47919 0))(
  ( (array!47920 (arr!22991 (Array (_ BitVec 32) ValueCell!7484)) (size!23433 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47919)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!844585 (= res!573841 (and (= (size!23433 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23432 _keys!868) (size!23433 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573840 () Bool)

(assert (=> start!72778 (=> (not res!573840) (not e!471444))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72778 (= res!573840 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23432 _keys!868))))))

(assert (=> start!72778 e!471444))

(assert (=> start!72778 true))

(declare-fun array_inv!18344 (array!47917) Bool)

(assert (=> start!72778 (array_inv!18344 _keys!868)))

(declare-fun e!471441 () Bool)

(declare-fun array_inv!18345 (array!47919) Bool)

(assert (=> start!72778 (and (array_inv!18345 _values!688) e!471441)))

(declare-fun mapNonEmpty!25370 () Bool)

(declare-fun mapRes!25370 () Bool)

(declare-fun tp!48689 () Bool)

(assert (=> mapNonEmpty!25370 (= mapRes!25370 (and tp!48689 e!471442))))

(declare-fun mapKey!25370 () (_ BitVec 32))

(declare-fun mapRest!25370 () (Array (_ BitVec 32) ValueCell!7484))

(declare-fun mapValue!25370 () ValueCell!7484)

(assert (=> mapNonEmpty!25370 (= (arr!22991 _values!688) (store mapRest!25370 mapKey!25370 mapValue!25370))))

(declare-fun b!844586 () Bool)

(declare-fun res!573843 () Bool)

(assert (=> b!844586 (=> (not res!573843) (not e!471444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844586 (= res!573843 (validMask!0 mask!1196))))

(declare-fun b!844587 () Bool)

(assert (=> b!844587 (= e!471444 false)))

(declare-fun lt!381101 () Bool)

(declare-datatypes ((List!16300 0))(
  ( (Nil!16297) (Cons!16296 (h!17427 (_ BitVec 64)) (t!22662 List!16300)) )
))
(declare-fun arrayNoDuplicates!0 (array!47917 (_ BitVec 32) List!16300) Bool)

(assert (=> b!844587 (= lt!381101 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16297))))

(declare-fun b!844588 () Bool)

(declare-fun e!471443 () Bool)

(assert (=> b!844588 (= e!471441 (and e!471443 mapRes!25370))))

(declare-fun condMapEmpty!25370 () Bool)

(declare-fun mapDefault!25370 () ValueCell!7484)

(assert (=> b!844588 (= condMapEmpty!25370 (= (arr!22991 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7484)) mapDefault!25370)))))

(declare-fun b!844589 () Bool)

(declare-fun res!573842 () Bool)

(assert (=> b!844589 (=> (not res!573842) (not e!471444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47917 (_ BitVec 32)) Bool)

(assert (=> b!844589 (= res!573842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25370 () Bool)

(assert (=> mapIsEmpty!25370 mapRes!25370))

(declare-fun b!844590 () Bool)

(assert (=> b!844590 (= e!471443 tp_is_empty!15847)))

(assert (= (and start!72778 res!573840) b!844586))

(assert (= (and b!844586 res!573843) b!844585))

(assert (= (and b!844585 res!573841) b!844589))

(assert (= (and b!844589 res!573842) b!844587))

(assert (= (and b!844588 condMapEmpty!25370) mapIsEmpty!25370))

(assert (= (and b!844588 (not condMapEmpty!25370)) mapNonEmpty!25370))

(get-info :version)

(assert (= (and mapNonEmpty!25370 ((_ is ValueCellFull!7484) mapValue!25370)) b!844584))

(assert (= (and b!844588 ((_ is ValueCellFull!7484) mapDefault!25370)) b!844590))

(assert (= start!72778 b!844588))

(declare-fun m!786155 () Bool)

(assert (=> start!72778 m!786155))

(declare-fun m!786157 () Bool)

(assert (=> start!72778 m!786157))

(declare-fun m!786159 () Bool)

(assert (=> b!844587 m!786159))

(declare-fun m!786161 () Bool)

(assert (=> mapNonEmpty!25370 m!786161))

(declare-fun m!786163 () Bool)

(assert (=> b!844589 m!786163))

(declare-fun m!786165 () Bool)

(assert (=> b!844586 m!786165))

(check-sat (not b!844589) (not b!844587) (not mapNonEmpty!25370) (not start!72778) (not b!844586) tp_is_empty!15847)
(check-sat)
