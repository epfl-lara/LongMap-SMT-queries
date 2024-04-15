; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72790 () Bool)

(assert start!72790)

(declare-fun mapIsEmpty!25388 () Bool)

(declare-fun mapRes!25388 () Bool)

(assert (=> mapIsEmpty!25388 mapRes!25388))

(declare-fun mapNonEmpty!25388 () Bool)

(declare-fun tp!48707 () Bool)

(declare-fun e!471533 () Bool)

(assert (=> mapNonEmpty!25388 (= mapRes!25388 (and tp!48707 e!471533))))

(declare-datatypes ((V!26193 0))(
  ( (V!26194 (val!7977 Int)) )
))
(declare-datatypes ((ValueCell!7490 0))(
  ( (ValueCellFull!7490 (v!10396 V!26193)) (EmptyCell!7490) )
))
(declare-fun mapRest!25388 () (Array (_ BitVec 32) ValueCell!7490))

(declare-fun mapKey!25388 () (_ BitVec 32))

(declare-datatypes ((array!47941 0))(
  ( (array!47942 (arr!23002 (Array (_ BitVec 32) ValueCell!7490)) (size!23444 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47941)

(declare-fun mapValue!25388 () ValueCell!7490)

(assert (=> mapNonEmpty!25388 (= (arr!23002 _values!688) (store mapRest!25388 mapKey!25388 mapValue!25388))))

(declare-fun b!844710 () Bool)

(declare-fun e!471531 () Bool)

(declare-fun e!471530 () Bool)

(assert (=> b!844710 (= e!471531 (and e!471530 mapRes!25388))))

(declare-fun condMapEmpty!25388 () Bool)

(declare-fun mapDefault!25388 () ValueCell!7490)

(assert (=> b!844710 (= condMapEmpty!25388 (= (arr!23002 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7490)) mapDefault!25388)))))

(declare-fun b!844712 () Bool)

(declare-fun res!573912 () Bool)

(declare-fun e!471534 () Bool)

(assert (=> b!844712 (=> (not res!573912) (not e!471534))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844712 (= res!573912 (validMask!0 mask!1196))))

(declare-fun b!844713 () Bool)

(declare-fun res!573913 () Bool)

(assert (=> b!844713 (=> (not res!573913) (not e!471534))))

(declare-datatypes ((array!47943 0))(
  ( (array!47944 (arr!23003 (Array (_ BitVec 32) (_ BitVec 64))) (size!23445 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47943)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47943 (_ BitVec 32)) Bool)

(assert (=> b!844713 (= res!573913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844714 () Bool)

(declare-fun tp_is_empty!15859 () Bool)

(assert (=> b!844714 (= e!471533 tp_is_empty!15859)))

(declare-fun res!573914 () Bool)

(assert (=> start!72790 (=> (not res!573914) (not e!471534))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72790 (= res!573914 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23445 _keys!868))))))

(assert (=> start!72790 e!471534))

(assert (=> start!72790 true))

(declare-fun array_inv!18352 (array!47943) Bool)

(assert (=> start!72790 (array_inv!18352 _keys!868)))

(declare-fun array_inv!18353 (array!47941) Bool)

(assert (=> start!72790 (and (array_inv!18353 _values!688) e!471531)))

(declare-fun b!844711 () Bool)

(declare-fun res!573915 () Bool)

(assert (=> b!844711 (=> (not res!573915) (not e!471534))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844711 (= res!573915 (and (= (size!23444 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23445 _keys!868) (size!23444 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844715 () Bool)

(assert (=> b!844715 (= e!471530 tp_is_empty!15859)))

(declare-fun b!844716 () Bool)

(assert (=> b!844716 (= e!471534 false)))

(declare-fun lt!381119 () Bool)

(declare-datatypes ((List!16306 0))(
  ( (Nil!16303) (Cons!16302 (h!17433 (_ BitVec 64)) (t!22668 List!16306)) )
))
(declare-fun arrayNoDuplicates!0 (array!47943 (_ BitVec 32) List!16306) Bool)

(assert (=> b!844716 (= lt!381119 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16303))))

(assert (= (and start!72790 res!573914) b!844712))

(assert (= (and b!844712 res!573912) b!844711))

(assert (= (and b!844711 res!573915) b!844713))

(assert (= (and b!844713 res!573913) b!844716))

(assert (= (and b!844710 condMapEmpty!25388) mapIsEmpty!25388))

(assert (= (and b!844710 (not condMapEmpty!25388)) mapNonEmpty!25388))

(get-info :version)

(assert (= (and mapNonEmpty!25388 ((_ is ValueCellFull!7490) mapValue!25388)) b!844714))

(assert (= (and b!844710 ((_ is ValueCellFull!7490) mapDefault!25388)) b!844715))

(assert (= start!72790 b!844710))

(declare-fun m!786227 () Bool)

(assert (=> b!844716 m!786227))

(declare-fun m!786229 () Bool)

(assert (=> mapNonEmpty!25388 m!786229))

(declare-fun m!786231 () Bool)

(assert (=> b!844713 m!786231))

(declare-fun m!786233 () Bool)

(assert (=> start!72790 m!786233))

(declare-fun m!786235 () Bool)

(assert (=> start!72790 m!786235))

(declare-fun m!786237 () Bool)

(assert (=> b!844712 m!786237))

(check-sat (not mapNonEmpty!25388) (not start!72790) (not b!844713) (not b!844712) tp_is_empty!15859 (not b!844716))
(check-sat)
