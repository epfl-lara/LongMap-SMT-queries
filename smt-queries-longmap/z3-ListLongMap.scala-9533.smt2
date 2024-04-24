; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113284 () Bool)

(assert start!113284)

(declare-fun b_free!31111 () Bool)

(declare-fun b_next!31111 () Bool)

(assert (=> start!113284 (= b_free!31111 (not b_next!31111))))

(declare-fun tp!109138 () Bool)

(declare-fun b_and!50143 () Bool)

(assert (=> start!113284 (= tp!109138 b_and!50143)))

(declare-fun b!1341351 () Bool)

(declare-fun res!889454 () Bool)

(declare-fun e!764155 () Bool)

(assert (=> b!1341351 (=> (not res!889454) (not e!764155))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91199 0))(
  ( (array!91200 (arr!44051 (Array (_ BitVec 32) (_ BitVec 64))) (size!44602 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91199)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341351 (= res!889454 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44602 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341352 () Bool)

(assert (=> b!1341352 (= e!764155 false)))

(declare-datatypes ((V!54585 0))(
  ( (V!54586 (val!18630 Int)) )
))
(declare-fun minValue!1245 () V!54585)

(declare-fun zeroValue!1245 () V!54585)

(declare-datatypes ((ValueCell!17657 0))(
  ( (ValueCellFull!17657 (v!21273 V!54585)) (EmptyCell!17657) )
))
(declare-datatypes ((array!91201 0))(
  ( (array!91202 (arr!44052 (Array (_ BitVec 32) ValueCell!17657)) (size!44603 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91201)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!594437 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24036 0))(
  ( (tuple2!24037 (_1!12029 (_ BitVec 64)) (_2!12029 V!54585)) )
))
(declare-datatypes ((List!31193 0))(
  ( (Nil!31190) (Cons!31189 (h!32407 tuple2!24036) (t!45517 List!31193)) )
))
(declare-datatypes ((ListLongMap!21701 0))(
  ( (ListLongMap!21702 (toList!10866 List!31193)) )
))
(declare-fun contains!9054 (ListLongMap!21701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5819 (array!91199 array!91201 (_ BitVec 32) (_ BitVec 32) V!54585 V!54585 (_ BitVec 32) Int) ListLongMap!21701)

(assert (=> b!1341352 (= lt!594437 (contains!9054 (getCurrentListMap!5819 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341354 () Bool)

(declare-fun res!889450 () Bool)

(assert (=> b!1341354 (=> (not res!889450) (not e!764155))))

(assert (=> b!1341354 (= res!889450 (and (= (size!44603 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44602 _keys!1571) (size!44603 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57373 () Bool)

(declare-fun mapRes!57373 () Bool)

(declare-fun tp!109137 () Bool)

(declare-fun e!764154 () Bool)

(assert (=> mapNonEmpty!57373 (= mapRes!57373 (and tp!109137 e!764154))))

(declare-fun mapValue!57373 () ValueCell!17657)

(declare-fun mapRest!57373 () (Array (_ BitVec 32) ValueCell!17657))

(declare-fun mapKey!57373 () (_ BitVec 32))

(assert (=> mapNonEmpty!57373 (= (arr!44052 _values!1303) (store mapRest!57373 mapKey!57373 mapValue!57373))))

(declare-fun b!1341355 () Bool)

(declare-fun e!764156 () Bool)

(declare-fun e!764152 () Bool)

(assert (=> b!1341355 (= e!764156 (and e!764152 mapRes!57373))))

(declare-fun condMapEmpty!57373 () Bool)

(declare-fun mapDefault!57373 () ValueCell!17657)

(assert (=> b!1341355 (= condMapEmpty!57373 (= (arr!44052 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17657)) mapDefault!57373)))))

(declare-fun b!1341356 () Bool)

(declare-fun res!889452 () Bool)

(assert (=> b!1341356 (=> (not res!889452) (not e!764155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91199 (_ BitVec 32)) Bool)

(assert (=> b!1341356 (= res!889452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57373 () Bool)

(assert (=> mapIsEmpty!57373 mapRes!57373))

(declare-fun b!1341357 () Bool)

(declare-fun tp_is_empty!37111 () Bool)

(assert (=> b!1341357 (= e!764154 tp_is_empty!37111)))

(declare-fun b!1341358 () Bool)

(assert (=> b!1341358 (= e!764152 tp_is_empty!37111)))

(declare-fun b!1341353 () Bool)

(declare-fun res!889453 () Bool)

(assert (=> b!1341353 (=> (not res!889453) (not e!764155))))

(declare-datatypes ((List!31194 0))(
  ( (Nil!31191) (Cons!31190 (h!32408 (_ BitVec 64)) (t!45518 List!31194)) )
))
(declare-fun arrayNoDuplicates!0 (array!91199 (_ BitVec 32) List!31194) Bool)

(assert (=> b!1341353 (= res!889453 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31191))))

(declare-fun res!889451 () Bool)

(assert (=> start!113284 (=> (not res!889451) (not e!764155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113284 (= res!889451 (validMask!0 mask!1977))))

(assert (=> start!113284 e!764155))

(assert (=> start!113284 tp_is_empty!37111))

(assert (=> start!113284 true))

(declare-fun array_inv!33477 (array!91199) Bool)

(assert (=> start!113284 (array_inv!33477 _keys!1571)))

(declare-fun array_inv!33478 (array!91201) Bool)

(assert (=> start!113284 (and (array_inv!33478 _values!1303) e!764156)))

(assert (=> start!113284 tp!109138))

(assert (= (and start!113284 res!889451) b!1341354))

(assert (= (and b!1341354 res!889450) b!1341356))

(assert (= (and b!1341356 res!889452) b!1341353))

(assert (= (and b!1341353 res!889453) b!1341351))

(assert (= (and b!1341351 res!889454) b!1341352))

(assert (= (and b!1341355 condMapEmpty!57373) mapIsEmpty!57373))

(assert (= (and b!1341355 (not condMapEmpty!57373)) mapNonEmpty!57373))

(get-info :version)

(assert (= (and mapNonEmpty!57373 ((_ is ValueCellFull!17657) mapValue!57373)) b!1341357))

(assert (= (and b!1341355 ((_ is ValueCellFull!17657) mapDefault!57373)) b!1341358))

(assert (= start!113284 b!1341355))

(declare-fun m!1229499 () Bool)

(assert (=> b!1341356 m!1229499))

(declare-fun m!1229501 () Bool)

(assert (=> b!1341353 m!1229501))

(declare-fun m!1229503 () Bool)

(assert (=> mapNonEmpty!57373 m!1229503))

(declare-fun m!1229505 () Bool)

(assert (=> start!113284 m!1229505))

(declare-fun m!1229507 () Bool)

(assert (=> start!113284 m!1229507))

(declare-fun m!1229509 () Bool)

(assert (=> start!113284 m!1229509))

(declare-fun m!1229511 () Bool)

(assert (=> b!1341352 m!1229511))

(assert (=> b!1341352 m!1229511))

(declare-fun m!1229513 () Bool)

(assert (=> b!1341352 m!1229513))

(check-sat tp_is_empty!37111 (not b_next!31111) b_and!50143 (not b!1341353) (not b!1341356) (not start!113284) (not b!1341352) (not mapNonEmpty!57373))
(check-sat b_and!50143 (not b_next!31111))
