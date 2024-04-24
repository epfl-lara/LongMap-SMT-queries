; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72754 () Bool)

(assert start!72754)

(declare-fun mapNonEmpty!25055 () Bool)

(declare-fun mapRes!25055 () Bool)

(declare-fun tp!48374 () Bool)

(declare-fun e!470597 () Bool)

(assert (=> mapNonEmpty!25055 (= mapRes!25055 (and tp!48374 e!470597))))

(declare-datatypes ((V!25897 0))(
  ( (V!25898 (val!7866 Int)) )
))
(declare-datatypes ((ValueCell!7379 0))(
  ( (ValueCellFull!7379 (v!10291 V!25897)) (EmptyCell!7379) )
))
(declare-fun mapRest!25055 () (Array (_ BitVec 32) ValueCell!7379))

(declare-fun mapValue!25055 () ValueCell!7379)

(declare-datatypes ((array!47567 0))(
  ( (array!47568 (arr!22810 (Array (_ BitVec 32) ValueCell!7379)) (size!23251 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47567)

(declare-fun mapKey!25055 () (_ BitVec 32))

(assert (=> mapNonEmpty!25055 (= (arr!22810 _values!688) (store mapRest!25055 mapKey!25055 mapValue!25055))))

(declare-fun b!843522 () Bool)

(declare-fun res!573036 () Bool)

(declare-fun e!470598 () Bool)

(assert (=> b!843522 (=> (not res!573036) (not e!470598))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47569 0))(
  ( (array!47570 (arr!22811 (Array (_ BitVec 32) (_ BitVec 64))) (size!23252 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47569)

(assert (=> b!843522 (= res!573036 (and (= (size!23251 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23252 _keys!868) (size!23251 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843523 () Bool)

(declare-fun e!470599 () Bool)

(declare-fun tp_is_empty!15637 () Bool)

(assert (=> b!843523 (= e!470599 tp_is_empty!15637)))

(declare-fun b!843524 () Bool)

(declare-fun res!573034 () Bool)

(assert (=> b!843524 (=> (not res!573034) (not e!470598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47569 (_ BitVec 32)) Bool)

(assert (=> b!843524 (= res!573034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25055 () Bool)

(assert (=> mapIsEmpty!25055 mapRes!25055))

(declare-fun b!843525 () Bool)

(assert (=> b!843525 (= e!470598 false)))

(declare-fun lt!381383 () Bool)

(declare-datatypes ((List!16143 0))(
  ( (Nil!16140) (Cons!16139 (h!17276 (_ BitVec 64)) (t!22506 List!16143)) )
))
(declare-fun arrayNoDuplicates!0 (array!47569 (_ BitVec 32) List!16143) Bool)

(assert (=> b!843525 (= lt!381383 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16140))))

(declare-fun b!843526 () Bool)

(assert (=> b!843526 (= e!470597 tp_is_empty!15637)))

(declare-fun b!843527 () Bool)

(declare-fun res!573035 () Bool)

(assert (=> b!843527 (=> (not res!573035) (not e!470598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843527 (= res!573035 (validMask!0 mask!1196))))

(declare-fun res!573037 () Bool)

(assert (=> start!72754 (=> (not res!573037) (not e!470598))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72754 (= res!573037 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23252 _keys!868))))))

(assert (=> start!72754 e!470598))

(assert (=> start!72754 true))

(declare-fun array_inv!18198 (array!47569) Bool)

(assert (=> start!72754 (array_inv!18198 _keys!868)))

(declare-fun e!470596 () Bool)

(declare-fun array_inv!18199 (array!47567) Bool)

(assert (=> start!72754 (and (array_inv!18199 _values!688) e!470596)))

(declare-fun b!843521 () Bool)

(assert (=> b!843521 (= e!470596 (and e!470599 mapRes!25055))))

(declare-fun condMapEmpty!25055 () Bool)

(declare-fun mapDefault!25055 () ValueCell!7379)

(assert (=> b!843521 (= condMapEmpty!25055 (= (arr!22810 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7379)) mapDefault!25055)))))

(assert (= (and start!72754 res!573037) b!843527))

(assert (= (and b!843527 res!573035) b!843522))

(assert (= (and b!843522 res!573036) b!843524))

(assert (= (and b!843524 res!573034) b!843525))

(assert (= (and b!843521 condMapEmpty!25055) mapIsEmpty!25055))

(assert (= (and b!843521 (not condMapEmpty!25055)) mapNonEmpty!25055))

(get-info :version)

(assert (= (and mapNonEmpty!25055 ((_ is ValueCellFull!7379) mapValue!25055)) b!843526))

(assert (= (and b!843521 ((_ is ValueCellFull!7379) mapDefault!25055)) b!843523))

(assert (= start!72754 b!843521))

(declare-fun m!786941 () Bool)

(assert (=> mapNonEmpty!25055 m!786941))

(declare-fun m!786943 () Bool)

(assert (=> b!843527 m!786943))

(declare-fun m!786945 () Bool)

(assert (=> b!843525 m!786945))

(declare-fun m!786947 () Bool)

(assert (=> start!72754 m!786947))

(declare-fun m!786949 () Bool)

(assert (=> start!72754 m!786949))

(declare-fun m!786951 () Bool)

(assert (=> b!843524 m!786951))

(check-sat tp_is_empty!15637 (not b!843524) (not b!843525) (not start!72754) (not mapNonEmpty!25055) (not b!843527))
(check-sat)
