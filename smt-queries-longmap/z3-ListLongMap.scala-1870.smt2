; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33640 () Bool)

(assert start!33640)

(declare-fun b_free!6889 () Bool)

(declare-fun b_next!6889 () Bool)

(assert (=> start!33640 (= b_free!6889 (not b_next!6889))))

(declare-fun tp!24170 () Bool)

(declare-fun b_and!14083 () Bool)

(assert (=> start!33640 (= tp!24170 b_and!14083)))

(declare-fun b!334121 () Bool)

(declare-fun res!184181 () Bool)

(declare-fun e!205117 () Bool)

(assert (=> b!334121 (=> (not res!184181) (not e!205117))))

(declare-datatypes ((array!17270 0))(
  ( (array!17271 (arr!8165 (Array (_ BitVec 32) (_ BitVec 64))) (size!8517 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17270)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17270 (_ BitVec 32)) Bool)

(assert (=> b!334121 (= res!184181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334122 () Bool)

(declare-fun e!205121 () Bool)

(assert (=> b!334122 (= e!205117 e!205121)))

(declare-fun res!184184 () Bool)

(assert (=> b!334122 (=> (not res!184184) (not e!205121))))

(declare-datatypes ((SeekEntryResult!3119 0))(
  ( (MissingZero!3119 (index!14655 (_ BitVec 32))) (Found!3119 (index!14656 (_ BitVec 32))) (Intermediate!3119 (undefined!3931 Bool) (index!14657 (_ BitVec 32)) (x!33258 (_ BitVec 32))) (Undefined!3119) (MissingVacant!3119 (index!14658 (_ BitVec 32))) )
))
(declare-fun lt!159492 () SeekEntryResult!3119)

(declare-fun k0!1348 () (_ BitVec 64))

(get-info :version)

(assert (=> b!334122 (= res!184184 (and ((_ is Found!3119) lt!159492) (= (select (arr!8165 _keys!1895) (index!14656 lt!159492)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17270 (_ BitVec 32)) SeekEntryResult!3119)

(assert (=> b!334122 (= lt!159492 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11658 () Bool)

(declare-fun mapRes!11658 () Bool)

(declare-fun tp!24171 () Bool)

(declare-fun e!205119 () Bool)

(assert (=> mapNonEmpty!11658 (= mapRes!11658 (and tp!24171 e!205119))))

(declare-datatypes ((V!10099 0))(
  ( (V!10100 (val!3465 Int)) )
))
(declare-datatypes ((ValueCell!3077 0))(
  ( (ValueCellFull!3077 (v!5628 V!10099)) (EmptyCell!3077) )
))
(declare-fun mapRest!11658 () (Array (_ BitVec 32) ValueCell!3077))

(declare-datatypes ((array!17272 0))(
  ( (array!17273 (arr!8166 (Array (_ BitVec 32) ValueCell!3077)) (size!8518 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17272)

(declare-fun mapKey!11658 () (_ BitVec 32))

(declare-fun mapValue!11658 () ValueCell!3077)

(assert (=> mapNonEmpty!11658 (= (arr!8166 _values!1525) (store mapRest!11658 mapKey!11658 mapValue!11658))))

(declare-fun b!334123 () Bool)

(declare-fun res!184177 () Bool)

(assert (=> b!334123 (=> (not res!184177) (not e!205117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334123 (= res!184177 (validKeyInArray!0 k0!1348))))

(declare-fun b!334124 () Bool)

(declare-fun res!184179 () Bool)

(assert (=> b!334124 (=> (not res!184179) (not e!205117))))

(declare-datatypes ((List!4570 0))(
  ( (Nil!4567) (Cons!4566 (h!5422 (_ BitVec 64)) (t!9650 List!4570)) )
))
(declare-fun arrayNoDuplicates!0 (array!17270 (_ BitVec 32) List!4570) Bool)

(assert (=> b!334124 (= res!184179 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4567))))

(declare-fun b!334125 () Bool)

(declare-fun tp_is_empty!6841 () Bool)

(assert (=> b!334125 (= e!205119 tp_is_empty!6841)))

(declare-fun b!334126 () Bool)

(declare-fun res!184178 () Bool)

(assert (=> b!334126 (=> (not res!184178) (not e!205117))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334126 (= res!184178 (and (= (size!8518 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8517 _keys!1895) (size!8518 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334127 () Bool)

(declare-fun e!205120 () Bool)

(assert (=> b!334127 (= e!205120 tp_is_empty!6841)))

(declare-fun b!334128 () Bool)

(declare-fun res!184182 () Bool)

(assert (=> b!334128 (=> (not res!184182) (not e!205121))))

(declare-fun arrayContainsKey!0 (array!17270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334128 (= res!184182 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14656 lt!159492)))))

(declare-fun mapIsEmpty!11658 () Bool)

(assert (=> mapIsEmpty!11658 mapRes!11658))

(declare-fun b!334129 () Bool)

(declare-fun res!184180 () Bool)

(assert (=> b!334129 (=> (not res!184180) (not e!205117))))

(declare-fun zeroValue!1467 () V!10099)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10099)

(declare-datatypes ((tuple2!4954 0))(
  ( (tuple2!4955 (_1!2488 (_ BitVec 64)) (_2!2488 V!10099)) )
))
(declare-datatypes ((List!4571 0))(
  ( (Nil!4568) (Cons!4567 (h!5423 tuple2!4954) (t!9651 List!4571)) )
))
(declare-datatypes ((ListLongMap!3869 0))(
  ( (ListLongMap!3870 (toList!1950 List!4571)) )
))
(declare-fun contains!2013 (ListLongMap!3869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1482 (array!17270 array!17272 (_ BitVec 32) (_ BitVec 32) V!10099 V!10099 (_ BitVec 32) Int) ListLongMap!3869)

(assert (=> b!334129 (= res!184180 (not (contains!2013 (getCurrentListMap!1482 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334130 () Bool)

(declare-fun e!205118 () Bool)

(assert (=> b!334130 (= e!205118 (and e!205120 mapRes!11658))))

(declare-fun condMapEmpty!11658 () Bool)

(declare-fun mapDefault!11658 () ValueCell!3077)

(assert (=> b!334130 (= condMapEmpty!11658 (= (arr!8166 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3077)) mapDefault!11658)))))

(declare-fun res!184183 () Bool)

(assert (=> start!33640 (=> (not res!184183) (not e!205117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33640 (= res!184183 (validMask!0 mask!2385))))

(assert (=> start!33640 e!205117))

(assert (=> start!33640 true))

(assert (=> start!33640 tp_is_empty!6841))

(assert (=> start!33640 tp!24170))

(declare-fun array_inv!6074 (array!17272) Bool)

(assert (=> start!33640 (and (array_inv!6074 _values!1525) e!205118)))

(declare-fun array_inv!6075 (array!17270) Bool)

(assert (=> start!33640 (array_inv!6075 _keys!1895)))

(declare-fun b!334120 () Bool)

(assert (=> b!334120 (= e!205121 (not true))))

(assert (=> b!334120 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10365 0))(
  ( (Unit!10366) )
))
(declare-fun lt!159493 () Unit!10365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17270 (_ BitVec 64) (_ BitVec 32)) Unit!10365)

(assert (=> b!334120 (= lt!159493 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14656 lt!159492)))))

(assert (= (and start!33640 res!184183) b!334126))

(assert (= (and b!334126 res!184178) b!334121))

(assert (= (and b!334121 res!184181) b!334124))

(assert (= (and b!334124 res!184179) b!334123))

(assert (= (and b!334123 res!184177) b!334129))

(assert (= (and b!334129 res!184180) b!334122))

(assert (= (and b!334122 res!184184) b!334128))

(assert (= (and b!334128 res!184182) b!334120))

(assert (= (and b!334130 condMapEmpty!11658) mapIsEmpty!11658))

(assert (= (and b!334130 (not condMapEmpty!11658)) mapNonEmpty!11658))

(assert (= (and mapNonEmpty!11658 ((_ is ValueCellFull!3077) mapValue!11658)) b!334125))

(assert (= (and b!334130 ((_ is ValueCellFull!3077) mapDefault!11658)) b!334127))

(assert (= start!33640 b!334130))

(declare-fun m!338501 () Bool)

(assert (=> b!334123 m!338501))

(declare-fun m!338503 () Bool)

(assert (=> b!334129 m!338503))

(assert (=> b!334129 m!338503))

(declare-fun m!338505 () Bool)

(assert (=> b!334129 m!338505))

(declare-fun m!338507 () Bool)

(assert (=> b!334128 m!338507))

(declare-fun m!338509 () Bool)

(assert (=> mapNonEmpty!11658 m!338509))

(declare-fun m!338511 () Bool)

(assert (=> b!334122 m!338511))

(declare-fun m!338513 () Bool)

(assert (=> b!334122 m!338513))

(declare-fun m!338515 () Bool)

(assert (=> b!334124 m!338515))

(declare-fun m!338517 () Bool)

(assert (=> start!33640 m!338517))

(declare-fun m!338519 () Bool)

(assert (=> start!33640 m!338519))

(declare-fun m!338521 () Bool)

(assert (=> start!33640 m!338521))

(declare-fun m!338523 () Bool)

(assert (=> b!334120 m!338523))

(declare-fun m!338525 () Bool)

(assert (=> b!334120 m!338525))

(declare-fun m!338527 () Bool)

(assert (=> b!334121 m!338527))

(check-sat tp_is_empty!6841 (not b!334120) (not b!334122) (not b!334129) (not start!33640) (not b!334124) (not b_next!6889) (not b!334123) (not b!334121) b_and!14083 (not b!334128) (not mapNonEmpty!11658))
(check-sat b_and!14083 (not b_next!6889))
