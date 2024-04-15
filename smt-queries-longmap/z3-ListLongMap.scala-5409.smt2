; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72190 () Bool)

(assert start!72190)

(declare-fun b!836697 () Bool)

(declare-fun e!466861 () Bool)

(declare-fun e!466859 () Bool)

(declare-fun mapRes!24524 () Bool)

(assert (=> b!836697 (= e!466861 (and e!466859 mapRes!24524))))

(declare-fun condMapEmpty!24524 () Bool)

(declare-datatypes ((V!25433 0))(
  ( (V!25434 (val!7692 Int)) )
))
(declare-datatypes ((ValueCell!7205 0))(
  ( (ValueCellFull!7205 (v!10110 V!25433)) (EmptyCell!7205) )
))
(declare-datatypes ((array!46847 0))(
  ( (array!46848 (arr!22458 (Array (_ BitVec 32) ValueCell!7205)) (size!22900 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46847)

(declare-fun mapDefault!24524 () ValueCell!7205)

(assert (=> b!836697 (= condMapEmpty!24524 (= (arr!22458 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7205)) mapDefault!24524)))))

(declare-fun b!836698 () Bool)

(declare-fun res!569154 () Bool)

(declare-fun e!466858 () Bool)

(assert (=> b!836698 (=> (not res!569154) (not e!466858))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836698 (= res!569154 (validMask!0 mask!1196))))

(declare-fun b!836699 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!46849 0))(
  ( (array!46850 (arr!22459 (Array (_ BitVec 32) (_ BitVec 64))) (size!22901 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46849)

(assert (=> b!836699 (= e!466858 (and (= (size!22900 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22901 _keys!868) (size!22900 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (not (= (size!22901 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)))))))

(declare-fun mapNonEmpty!24524 () Bool)

(declare-fun tp!47519 () Bool)

(declare-fun e!466857 () Bool)

(assert (=> mapNonEmpty!24524 (= mapRes!24524 (and tp!47519 e!466857))))

(declare-fun mapRest!24524 () (Array (_ BitVec 32) ValueCell!7205))

(declare-fun mapKey!24524 () (_ BitVec 32))

(declare-fun mapValue!24524 () ValueCell!7205)

(assert (=> mapNonEmpty!24524 (= (arr!22458 _values!688) (store mapRest!24524 mapKey!24524 mapValue!24524))))

(declare-fun mapIsEmpty!24524 () Bool)

(assert (=> mapIsEmpty!24524 mapRes!24524))

(declare-fun b!836700 () Bool)

(declare-fun tp_is_empty!15289 () Bool)

(assert (=> b!836700 (= e!466857 tp_is_empty!15289)))

(declare-fun res!569155 () Bool)

(assert (=> start!72190 (=> (not res!569155) (not e!466858))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72190 (= res!569155 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22901 _keys!868))))))

(assert (=> start!72190 e!466858))

(assert (=> start!72190 true))

(declare-fun array_inv!17970 (array!46849) Bool)

(assert (=> start!72190 (array_inv!17970 _keys!868)))

(declare-fun array_inv!17971 (array!46847) Bool)

(assert (=> start!72190 (and (array_inv!17971 _values!688) e!466861)))

(declare-fun b!836701 () Bool)

(assert (=> b!836701 (= e!466859 tp_is_empty!15289)))

(assert (= (and start!72190 res!569155) b!836698))

(assert (= (and b!836698 res!569154) b!836699))

(assert (= (and b!836697 condMapEmpty!24524) mapIsEmpty!24524))

(assert (= (and b!836697 (not condMapEmpty!24524)) mapNonEmpty!24524))

(get-info :version)

(assert (= (and mapNonEmpty!24524 ((_ is ValueCellFull!7205) mapValue!24524)) b!836700))

(assert (= (and b!836697 ((_ is ValueCellFull!7205) mapDefault!24524)) b!836701))

(assert (= start!72190 b!836697))

(declare-fun m!781259 () Bool)

(assert (=> b!836698 m!781259))

(declare-fun m!781261 () Bool)

(assert (=> mapNonEmpty!24524 m!781261))

(declare-fun m!781263 () Bool)

(assert (=> start!72190 m!781263))

(declare-fun m!781265 () Bool)

(assert (=> start!72190 m!781265))

(check-sat (not start!72190) (not b!836698) (not mapNonEmpty!24524) tp_is_empty!15289)
(check-sat)
