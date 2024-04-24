; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108852 () Bool)

(assert start!108852)

(declare-fun b_free!28141 () Bool)

(declare-fun b_next!28141 () Bool)

(assert (=> start!108852 (= b_free!28141 (not b_next!28141))))

(declare-fun tp!99538 () Bool)

(declare-fun b_and!46209 () Bool)

(assert (=> start!108852 (= tp!99538 b_and!46209)))

(declare-fun b!1283534 () Bool)

(declare-fun e!733467 () Bool)

(assert (=> b!1283534 (= e!733467 false)))

(declare-datatypes ((V!50145 0))(
  ( (V!50146 (val!16965 Int)) )
))
(declare-fun minValue!1387 () V!50145)

(declare-fun zeroValue!1387 () V!50145)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15992 0))(
  ( (ValueCellFull!15992 (v!19562 V!50145)) (EmptyCell!15992) )
))
(declare-datatypes ((array!84665 0))(
  ( (array!84666 (arr!40830 (Array (_ BitVec 32) ValueCell!15992)) (size!41381 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84665)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576992 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84667 0))(
  ( (array!84668 (arr!40831 (Array (_ BitVec 32) (_ BitVec 64))) (size!41382 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84667)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21742 0))(
  ( (tuple2!21743 (_1!10882 (_ BitVec 64)) (_2!10882 V!50145)) )
))
(declare-datatypes ((List!28956 0))(
  ( (Nil!28953) (Cons!28952 (h!30170 tuple2!21742) (t!42492 List!28956)) )
))
(declare-datatypes ((ListLongMap!19407 0))(
  ( (ListLongMap!19408 (toList!9719 List!28956)) )
))
(declare-fun contains!7850 (ListLongMap!19407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4788 (array!84667 array!84665 (_ BitVec 32) (_ BitVec 32) V!50145 V!50145 (_ BitVec 32) Int) ListLongMap!19407)

(assert (=> b!1283534 (= lt!576992 (contains!7850 (getCurrentListMap!4788 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283535 () Bool)

(declare-fun res!852225 () Bool)

(assert (=> b!1283535 (=> (not res!852225) (not e!733467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84667 (_ BitVec 32)) Bool)

(assert (=> b!1283535 (= res!852225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283536 () Bool)

(declare-fun res!852223 () Bool)

(assert (=> b!1283536 (=> (not res!852223) (not e!733467))))

(assert (=> b!1283536 (= res!852223 (and (= (size!41381 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41382 _keys!1741) (size!41381 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283537 () Bool)

(declare-fun res!852222 () Bool)

(assert (=> b!1283537 (=> (not res!852222) (not e!733467))))

(assert (=> b!1283537 (= res!852222 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41382 _keys!1741))))))

(declare-fun b!1283538 () Bool)

(declare-fun e!733465 () Bool)

(declare-fun tp_is_empty!33781 () Bool)

(assert (=> b!1283538 (= e!733465 tp_is_empty!33781)))

(declare-fun b!1283539 () Bool)

(declare-fun e!733464 () Bool)

(assert (=> b!1283539 (= e!733464 tp_is_empty!33781)))

(declare-fun b!1283540 () Bool)

(declare-fun res!852226 () Bool)

(assert (=> b!1283540 (=> (not res!852226) (not e!733467))))

(declare-datatypes ((List!28957 0))(
  ( (Nil!28954) (Cons!28953 (h!30171 (_ BitVec 64)) (t!42493 List!28957)) )
))
(declare-fun arrayNoDuplicates!0 (array!84667 (_ BitVec 32) List!28957) Bool)

(assert (=> b!1283540 (= res!852226 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28954))))

(declare-fun mapNonEmpty!52229 () Bool)

(declare-fun mapRes!52229 () Bool)

(declare-fun tp!99539 () Bool)

(assert (=> mapNonEmpty!52229 (= mapRes!52229 (and tp!99539 e!733465))))

(declare-fun mapKey!52229 () (_ BitVec 32))

(declare-fun mapRest!52229 () (Array (_ BitVec 32) ValueCell!15992))

(declare-fun mapValue!52229 () ValueCell!15992)

(assert (=> mapNonEmpty!52229 (= (arr!40830 _values!1445) (store mapRest!52229 mapKey!52229 mapValue!52229))))

(declare-fun b!1283541 () Bool)

(declare-fun e!733466 () Bool)

(assert (=> b!1283541 (= e!733466 (and e!733464 mapRes!52229))))

(declare-fun condMapEmpty!52229 () Bool)

(declare-fun mapDefault!52229 () ValueCell!15992)

(assert (=> b!1283541 (= condMapEmpty!52229 (= (arr!40830 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15992)) mapDefault!52229)))))

(declare-fun mapIsEmpty!52229 () Bool)

(assert (=> mapIsEmpty!52229 mapRes!52229))

(declare-fun res!852224 () Bool)

(assert (=> start!108852 (=> (not res!852224) (not e!733467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108852 (= res!852224 (validMask!0 mask!2175))))

(assert (=> start!108852 e!733467))

(assert (=> start!108852 tp_is_empty!33781))

(assert (=> start!108852 true))

(declare-fun array_inv!31189 (array!84665) Bool)

(assert (=> start!108852 (and (array_inv!31189 _values!1445) e!733466)))

(declare-fun array_inv!31190 (array!84667) Bool)

(assert (=> start!108852 (array_inv!31190 _keys!1741)))

(assert (=> start!108852 tp!99538))

(assert (= (and start!108852 res!852224) b!1283536))

(assert (= (and b!1283536 res!852223) b!1283535))

(assert (= (and b!1283535 res!852225) b!1283540))

(assert (= (and b!1283540 res!852226) b!1283537))

(assert (= (and b!1283537 res!852222) b!1283534))

(assert (= (and b!1283541 condMapEmpty!52229) mapIsEmpty!52229))

(assert (= (and b!1283541 (not condMapEmpty!52229)) mapNonEmpty!52229))

(get-info :version)

(assert (= (and mapNonEmpty!52229 ((_ is ValueCellFull!15992) mapValue!52229)) b!1283538))

(assert (= (and b!1283541 ((_ is ValueCellFull!15992) mapDefault!52229)) b!1283539))

(assert (= start!108852 b!1283541))

(declare-fun m!1178113 () Bool)

(assert (=> b!1283535 m!1178113))

(declare-fun m!1178115 () Bool)

(assert (=> b!1283534 m!1178115))

(assert (=> b!1283534 m!1178115))

(declare-fun m!1178117 () Bool)

(assert (=> b!1283534 m!1178117))

(declare-fun m!1178119 () Bool)

(assert (=> start!108852 m!1178119))

(declare-fun m!1178121 () Bool)

(assert (=> start!108852 m!1178121))

(declare-fun m!1178123 () Bool)

(assert (=> start!108852 m!1178123))

(declare-fun m!1178125 () Bool)

(assert (=> b!1283540 m!1178125))

(declare-fun m!1178127 () Bool)

(assert (=> mapNonEmpty!52229 m!1178127))

(check-sat tp_is_empty!33781 (not b!1283535) (not start!108852) b_and!46209 (not b!1283534) (not b_next!28141) (not b!1283540) (not mapNonEmpty!52229))
(check-sat b_and!46209 (not b_next!28141))
