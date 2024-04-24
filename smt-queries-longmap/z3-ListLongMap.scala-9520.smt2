; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113206 () Bool)

(assert start!113206)

(declare-fun b!1340510 () Bool)

(declare-fun e!763568 () Bool)

(declare-fun tp_is_empty!37033 () Bool)

(assert (=> b!1340510 (= e!763568 tp_is_empty!37033)))

(declare-fun b!1340511 () Bool)

(declare-fun e!763571 () Bool)

(assert (=> b!1340511 (= e!763571 false)))

(declare-fun lt!594329 () Bool)

(declare-datatypes ((array!91051 0))(
  ( (array!91052 (arr!43977 (Array (_ BitVec 32) (_ BitVec 64))) (size!44528 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91051)

(declare-datatypes ((List!31146 0))(
  ( (Nil!31143) (Cons!31142 (h!32360 (_ BitVec 64)) (t!45470 List!31146)) )
))
(declare-fun arrayNoDuplicates!0 (array!91051 (_ BitVec 32) List!31146) Bool)

(assert (=> b!1340511 (= lt!594329 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31143))))

(declare-fun mapIsEmpty!57256 () Bool)

(declare-fun mapRes!57256 () Bool)

(assert (=> mapIsEmpty!57256 mapRes!57256))

(declare-fun b!1340512 () Bool)

(declare-fun res!888960 () Bool)

(assert (=> b!1340512 (=> (not res!888960) (not e!763571))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54481 0))(
  ( (V!54482 (val!18591 Int)) )
))
(declare-datatypes ((ValueCell!17618 0))(
  ( (ValueCellFull!17618 (v!21234 V!54481)) (EmptyCell!17618) )
))
(declare-datatypes ((array!91053 0))(
  ( (array!91054 (arr!43978 (Array (_ BitVec 32) ValueCell!17618)) (size!44529 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91053)

(assert (=> b!1340512 (= res!888960 (and (= (size!44529 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44528 _keys!1571) (size!44529 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57256 () Bool)

(declare-fun tp!108955 () Bool)

(assert (=> mapNonEmpty!57256 (= mapRes!57256 (and tp!108955 e!763568))))

(declare-fun mapKey!57256 () (_ BitVec 32))

(declare-fun mapValue!57256 () ValueCell!17618)

(declare-fun mapRest!57256 () (Array (_ BitVec 32) ValueCell!17618))

(assert (=> mapNonEmpty!57256 (= (arr!43978 _values!1303) (store mapRest!57256 mapKey!57256 mapValue!57256))))

(declare-fun res!888962 () Bool)

(assert (=> start!113206 (=> (not res!888962) (not e!763571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113206 (= res!888962 (validMask!0 mask!1977))))

(assert (=> start!113206 e!763571))

(assert (=> start!113206 true))

(declare-fun e!763567 () Bool)

(declare-fun array_inv!33425 (array!91053) Bool)

(assert (=> start!113206 (and (array_inv!33425 _values!1303) e!763567)))

(declare-fun array_inv!33426 (array!91051) Bool)

(assert (=> start!113206 (array_inv!33426 _keys!1571)))

(declare-fun b!1340513 () Bool)

(declare-fun e!763570 () Bool)

(assert (=> b!1340513 (= e!763570 tp_is_empty!37033)))

(declare-fun b!1340514 () Bool)

(assert (=> b!1340514 (= e!763567 (and e!763570 mapRes!57256))))

(declare-fun condMapEmpty!57256 () Bool)

(declare-fun mapDefault!57256 () ValueCell!17618)

(assert (=> b!1340514 (= condMapEmpty!57256 (= (arr!43978 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17618)) mapDefault!57256)))))

(declare-fun b!1340515 () Bool)

(declare-fun res!888961 () Bool)

(assert (=> b!1340515 (=> (not res!888961) (not e!763571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91051 (_ BitVec 32)) Bool)

(assert (=> b!1340515 (= res!888961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113206 res!888962) b!1340512))

(assert (= (and b!1340512 res!888960) b!1340515))

(assert (= (and b!1340515 res!888961) b!1340511))

(assert (= (and b!1340514 condMapEmpty!57256) mapIsEmpty!57256))

(assert (= (and b!1340514 (not condMapEmpty!57256)) mapNonEmpty!57256))

(get-info :version)

(assert (= (and mapNonEmpty!57256 ((_ is ValueCellFull!17618) mapValue!57256)) b!1340510))

(assert (= (and b!1340514 ((_ is ValueCellFull!17618) mapDefault!57256)) b!1340513))

(assert (= start!113206 b!1340514))

(declare-fun m!1228947 () Bool)

(assert (=> b!1340511 m!1228947))

(declare-fun m!1228949 () Bool)

(assert (=> mapNonEmpty!57256 m!1228949))

(declare-fun m!1228951 () Bool)

(assert (=> start!113206 m!1228951))

(declare-fun m!1228953 () Bool)

(assert (=> start!113206 m!1228953))

(declare-fun m!1228955 () Bool)

(assert (=> start!113206 m!1228955))

(declare-fun m!1228957 () Bool)

(assert (=> b!1340515 m!1228957))

(check-sat tp_is_empty!37033 (not mapNonEmpty!57256) (not b!1340515) (not b!1340511) (not start!113206))
(check-sat)
