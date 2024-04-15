; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72796 () Bool)

(assert start!72796)

(declare-fun b!844773 () Bool)

(declare-fun e!471577 () Bool)

(declare-fun tp_is_empty!15865 () Bool)

(assert (=> b!844773 (= e!471577 tp_is_empty!15865)))

(declare-fun b!844774 () Bool)

(declare-fun res!573948 () Bool)

(declare-fun e!471575 () Bool)

(assert (=> b!844774 (=> (not res!573948) (not e!471575))))

(declare-datatypes ((array!47953 0))(
  ( (array!47954 (arr!23008 (Array (_ BitVec 32) (_ BitVec 64))) (size!23450 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47953)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47953 (_ BitVec 32)) Bool)

(assert (=> b!844774 (= res!573948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844775 () Bool)

(declare-fun e!471579 () Bool)

(declare-fun mapRes!25397 () Bool)

(assert (=> b!844775 (= e!471579 (and e!471577 mapRes!25397))))

(declare-fun condMapEmpty!25397 () Bool)

(declare-datatypes ((V!26201 0))(
  ( (V!26202 (val!7980 Int)) )
))
(declare-datatypes ((ValueCell!7493 0))(
  ( (ValueCellFull!7493 (v!10399 V!26201)) (EmptyCell!7493) )
))
(declare-datatypes ((array!47955 0))(
  ( (array!47956 (arr!23009 (Array (_ BitVec 32) ValueCell!7493)) (size!23451 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47955)

(declare-fun mapDefault!25397 () ValueCell!7493)

(assert (=> b!844775 (= condMapEmpty!25397 (= (arr!23009 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7493)) mapDefault!25397)))))

(declare-fun b!844776 () Bool)

(assert (=> b!844776 (= e!471575 false)))

(declare-fun lt!381128 () Bool)

(declare-datatypes ((List!16309 0))(
  ( (Nil!16306) (Cons!16305 (h!17436 (_ BitVec 64)) (t!22671 List!16309)) )
))
(declare-fun arrayNoDuplicates!0 (array!47953 (_ BitVec 32) List!16309) Bool)

(assert (=> b!844776 (= lt!381128 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16306))))

(declare-fun b!844777 () Bool)

(declare-fun res!573950 () Bool)

(assert (=> b!844777 (=> (not res!573950) (not e!471575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844777 (= res!573950 (validMask!0 mask!1196))))

(declare-fun res!573951 () Bool)

(assert (=> start!72796 (=> (not res!573951) (not e!471575))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72796 (= res!573951 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23450 _keys!868))))))

(assert (=> start!72796 e!471575))

(assert (=> start!72796 true))

(declare-fun array_inv!18354 (array!47953) Bool)

(assert (=> start!72796 (array_inv!18354 _keys!868)))

(declare-fun array_inv!18355 (array!47955) Bool)

(assert (=> start!72796 (and (array_inv!18355 _values!688) e!471579)))

(declare-fun mapIsEmpty!25397 () Bool)

(assert (=> mapIsEmpty!25397 mapRes!25397))

(declare-fun mapNonEmpty!25397 () Bool)

(declare-fun tp!48716 () Bool)

(declare-fun e!471578 () Bool)

(assert (=> mapNonEmpty!25397 (= mapRes!25397 (and tp!48716 e!471578))))

(declare-fun mapValue!25397 () ValueCell!7493)

(declare-fun mapKey!25397 () (_ BitVec 32))

(declare-fun mapRest!25397 () (Array (_ BitVec 32) ValueCell!7493))

(assert (=> mapNonEmpty!25397 (= (arr!23009 _values!688) (store mapRest!25397 mapKey!25397 mapValue!25397))))

(declare-fun b!844778 () Bool)

(assert (=> b!844778 (= e!471578 tp_is_empty!15865)))

(declare-fun b!844779 () Bool)

(declare-fun res!573949 () Bool)

(assert (=> b!844779 (=> (not res!573949) (not e!471575))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844779 (= res!573949 (and (= (size!23451 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23450 _keys!868) (size!23451 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72796 res!573951) b!844777))

(assert (= (and b!844777 res!573950) b!844779))

(assert (= (and b!844779 res!573949) b!844774))

(assert (= (and b!844774 res!573948) b!844776))

(assert (= (and b!844775 condMapEmpty!25397) mapIsEmpty!25397))

(assert (= (and b!844775 (not condMapEmpty!25397)) mapNonEmpty!25397))

(get-info :version)

(assert (= (and mapNonEmpty!25397 ((_ is ValueCellFull!7493) mapValue!25397)) b!844778))

(assert (= (and b!844775 ((_ is ValueCellFull!7493) mapDefault!25397)) b!844773))

(assert (= start!72796 b!844775))

(declare-fun m!786263 () Bool)

(assert (=> mapNonEmpty!25397 m!786263))

(declare-fun m!786265 () Bool)

(assert (=> b!844776 m!786265))

(declare-fun m!786267 () Bool)

(assert (=> b!844777 m!786267))

(declare-fun m!786269 () Bool)

(assert (=> b!844774 m!786269))

(declare-fun m!786271 () Bool)

(assert (=> start!72796 m!786271))

(declare-fun m!786273 () Bool)

(assert (=> start!72796 m!786273))

(check-sat (not b!844777) (not start!72796) (not b!844776) (not mapNonEmpty!25397) (not b!844774) tp_is_empty!15865)
(check-sat)
