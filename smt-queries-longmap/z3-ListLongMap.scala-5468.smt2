; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72760 () Bool)

(assert start!72760)

(declare-fun b!843584 () Bool)

(declare-fun res!573073 () Bool)

(declare-fun e!470643 () Bool)

(assert (=> b!843584 (=> (not res!573073) (not e!470643))))

(declare-datatypes ((array!47577 0))(
  ( (array!47578 (arr!22815 (Array (_ BitVec 32) (_ BitVec 64))) (size!23256 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47577)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47577 (_ BitVec 32)) Bool)

(assert (=> b!843584 (= res!573073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573072 () Bool)

(assert (=> start!72760 (=> (not res!573072) (not e!470643))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72760 (= res!573072 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23256 _keys!868))))))

(assert (=> start!72760 e!470643))

(assert (=> start!72760 true))

(declare-fun array_inv!18202 (array!47577) Bool)

(assert (=> start!72760 (array_inv!18202 _keys!868)))

(declare-datatypes ((V!25905 0))(
  ( (V!25906 (val!7869 Int)) )
))
(declare-datatypes ((ValueCell!7382 0))(
  ( (ValueCellFull!7382 (v!10294 V!25905)) (EmptyCell!7382) )
))
(declare-datatypes ((array!47579 0))(
  ( (array!47580 (arr!22816 (Array (_ BitVec 32) ValueCell!7382)) (size!23257 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47579)

(declare-fun e!470642 () Bool)

(declare-fun array_inv!18203 (array!47579) Bool)

(assert (=> start!72760 (and (array_inv!18203 _values!688) e!470642)))

(declare-fun b!843585 () Bool)

(declare-fun e!470641 () Bool)

(declare-fun tp_is_empty!15643 () Bool)

(assert (=> b!843585 (= e!470641 tp_is_empty!15643)))

(declare-fun mapIsEmpty!25064 () Bool)

(declare-fun mapRes!25064 () Bool)

(assert (=> mapIsEmpty!25064 mapRes!25064))

(declare-fun mapNonEmpty!25064 () Bool)

(declare-fun tp!48383 () Bool)

(assert (=> mapNonEmpty!25064 (= mapRes!25064 (and tp!48383 e!470641))))

(declare-fun mapValue!25064 () ValueCell!7382)

(declare-fun mapRest!25064 () (Array (_ BitVec 32) ValueCell!7382))

(declare-fun mapKey!25064 () (_ BitVec 32))

(assert (=> mapNonEmpty!25064 (= (arr!22816 _values!688) (store mapRest!25064 mapKey!25064 mapValue!25064))))

(declare-fun b!843586 () Bool)

(declare-fun e!470640 () Bool)

(assert (=> b!843586 (= e!470642 (and e!470640 mapRes!25064))))

(declare-fun condMapEmpty!25064 () Bool)

(declare-fun mapDefault!25064 () ValueCell!7382)

(assert (=> b!843586 (= condMapEmpty!25064 (= (arr!22816 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7382)) mapDefault!25064)))))

(declare-fun b!843587 () Bool)

(declare-fun res!573071 () Bool)

(assert (=> b!843587 (=> (not res!573071) (not e!470643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843587 (= res!573071 (validMask!0 mask!1196))))

(declare-fun b!843588 () Bool)

(assert (=> b!843588 (= e!470643 false)))

(declare-fun lt!381392 () Bool)

(declare-datatypes ((List!16145 0))(
  ( (Nil!16142) (Cons!16141 (h!17278 (_ BitVec 64)) (t!22508 List!16145)) )
))
(declare-fun arrayNoDuplicates!0 (array!47577 (_ BitVec 32) List!16145) Bool)

(assert (=> b!843588 (= lt!381392 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16142))))

(declare-fun b!843589 () Bool)

(declare-fun res!573070 () Bool)

(assert (=> b!843589 (=> (not res!573070) (not e!470643))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843589 (= res!573070 (and (= (size!23257 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23256 _keys!868) (size!23257 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843590 () Bool)

(assert (=> b!843590 (= e!470640 tp_is_empty!15643)))

(assert (= (and start!72760 res!573072) b!843587))

(assert (= (and b!843587 res!573071) b!843589))

(assert (= (and b!843589 res!573070) b!843584))

(assert (= (and b!843584 res!573073) b!843588))

(assert (= (and b!843586 condMapEmpty!25064) mapIsEmpty!25064))

(assert (= (and b!843586 (not condMapEmpty!25064)) mapNonEmpty!25064))

(get-info :version)

(assert (= (and mapNonEmpty!25064 ((_ is ValueCellFull!7382) mapValue!25064)) b!843585))

(assert (= (and b!843586 ((_ is ValueCellFull!7382) mapDefault!25064)) b!843590))

(assert (= start!72760 b!843586))

(declare-fun m!786977 () Bool)

(assert (=> b!843588 m!786977))

(declare-fun m!786979 () Bool)

(assert (=> b!843584 m!786979))

(declare-fun m!786981 () Bool)

(assert (=> start!72760 m!786981))

(declare-fun m!786983 () Bool)

(assert (=> start!72760 m!786983))

(declare-fun m!786985 () Bool)

(assert (=> mapNonEmpty!25064 m!786985))

(declare-fun m!786987 () Bool)

(assert (=> b!843587 m!786987))

(check-sat (not b!843588) tp_is_empty!15643 (not b!843587) (not b!843584) (not start!72760) (not mapNonEmpty!25064))
(check-sat)
