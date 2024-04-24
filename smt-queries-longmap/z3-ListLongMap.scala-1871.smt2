; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33646 () Bool)

(assert start!33646)

(declare-fun b_free!6895 () Bool)

(declare-fun b_next!6895 () Bool)

(assert (=> start!33646 (= b_free!6895 (not b_next!6895))))

(declare-fun tp!24189 () Bool)

(declare-fun b_and!14089 () Bool)

(assert (=> start!33646 (= tp!24189 b_and!14089)))

(declare-fun mapIsEmpty!11667 () Bool)

(declare-fun mapRes!11667 () Bool)

(assert (=> mapIsEmpty!11667 mapRes!11667))

(declare-fun b!334219 () Bool)

(declare-fun e!205173 () Bool)

(declare-fun e!205172 () Bool)

(assert (=> b!334219 (= e!205173 e!205172)))

(declare-fun res!184249 () Bool)

(assert (=> b!334219 (=> (not res!184249) (not e!205172))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3121 0))(
  ( (MissingZero!3121 (index!14663 (_ BitVec 32))) (Found!3121 (index!14664 (_ BitVec 32))) (Intermediate!3121 (undefined!3933 Bool) (index!14665 (_ BitVec 32)) (x!33268 (_ BitVec 32))) (Undefined!3121) (MissingVacant!3121 (index!14666 (_ BitVec 32))) )
))
(declare-fun lt!159510 () SeekEntryResult!3121)

(declare-datatypes ((array!17280 0))(
  ( (array!17281 (arr!8170 (Array (_ BitVec 32) (_ BitVec 64))) (size!8522 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17280)

(get-info :version)

(assert (=> b!334219 (= res!184249 (and ((_ is Found!3121) lt!159510) (= (select (arr!8170 _keys!1895) (index!14664 lt!159510)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17280 (_ BitVec 32)) SeekEntryResult!3121)

(assert (=> b!334219 (= lt!159510 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334220 () Bool)

(assert (=> b!334220 (= e!205172 (not true))))

(declare-fun arrayContainsKey!0 (array!17280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334220 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10369 0))(
  ( (Unit!10370) )
))
(declare-fun lt!159511 () Unit!10369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17280 (_ BitVec 64) (_ BitVec 32)) Unit!10369)

(assert (=> b!334220 (= lt!159511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14664 lt!159510)))))

(declare-fun b!334221 () Bool)

(declare-fun e!205171 () Bool)

(declare-fun tp_is_empty!6847 () Bool)

(assert (=> b!334221 (= e!205171 tp_is_empty!6847)))

(declare-fun b!334222 () Bool)

(declare-fun res!184250 () Bool)

(assert (=> b!334222 (=> (not res!184250) (not e!205173))))

(declare-datatypes ((V!10107 0))(
  ( (V!10108 (val!3468 Int)) )
))
(declare-fun zeroValue!1467 () V!10107)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3080 0))(
  ( (ValueCellFull!3080 (v!5631 V!10107)) (EmptyCell!3080) )
))
(declare-datatypes ((array!17282 0))(
  ( (array!17283 (arr!8171 (Array (_ BitVec 32) ValueCell!3080)) (size!8523 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17282)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10107)

(declare-datatypes ((tuple2!4958 0))(
  ( (tuple2!4959 (_1!2490 (_ BitVec 64)) (_2!2490 V!10107)) )
))
(declare-datatypes ((List!4574 0))(
  ( (Nil!4571) (Cons!4570 (h!5426 tuple2!4958) (t!9654 List!4574)) )
))
(declare-datatypes ((ListLongMap!3873 0))(
  ( (ListLongMap!3874 (toList!1952 List!4574)) )
))
(declare-fun contains!2015 (ListLongMap!3873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1484 (array!17280 array!17282 (_ BitVec 32) (_ BitVec 32) V!10107 V!10107 (_ BitVec 32) Int) ListLongMap!3873)

(assert (=> b!334222 (= res!184250 (not (contains!2015 (getCurrentListMap!1484 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334223 () Bool)

(declare-fun res!184256 () Bool)

(assert (=> b!334223 (=> (not res!184256) (not e!205172))))

(assert (=> b!334223 (= res!184256 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14664 lt!159510)))))

(declare-fun b!334224 () Bool)

(declare-fun res!184253 () Bool)

(assert (=> b!334224 (=> (not res!184253) (not e!205173))))

(declare-datatypes ((List!4575 0))(
  ( (Nil!4572) (Cons!4571 (h!5427 (_ BitVec 64)) (t!9655 List!4575)) )
))
(declare-fun arrayNoDuplicates!0 (array!17280 (_ BitVec 32) List!4575) Bool)

(assert (=> b!334224 (= res!184253 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4572))))

(declare-fun b!334225 () Bool)

(declare-fun res!184255 () Bool)

(assert (=> b!334225 (=> (not res!184255) (not e!205173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334225 (= res!184255 (validKeyInArray!0 k0!1348))))

(declare-fun b!334226 () Bool)

(declare-fun e!205170 () Bool)

(assert (=> b!334226 (= e!205170 (and e!205171 mapRes!11667))))

(declare-fun condMapEmpty!11667 () Bool)

(declare-fun mapDefault!11667 () ValueCell!3080)

(assert (=> b!334226 (= condMapEmpty!11667 (= (arr!8171 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3080)) mapDefault!11667)))))

(declare-fun b!334227 () Bool)

(declare-fun res!184252 () Bool)

(assert (=> b!334227 (=> (not res!184252) (not e!205173))))

(assert (=> b!334227 (= res!184252 (and (= (size!8523 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8522 _keys!1895) (size!8523 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334228 () Bool)

(declare-fun e!205175 () Bool)

(assert (=> b!334228 (= e!205175 tp_is_empty!6847)))

(declare-fun b!334229 () Bool)

(declare-fun res!184254 () Bool)

(assert (=> b!334229 (=> (not res!184254) (not e!205173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17280 (_ BitVec 32)) Bool)

(assert (=> b!334229 (= res!184254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!184251 () Bool)

(assert (=> start!33646 (=> (not res!184251) (not e!205173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33646 (= res!184251 (validMask!0 mask!2385))))

(assert (=> start!33646 e!205173))

(assert (=> start!33646 true))

(assert (=> start!33646 tp_is_empty!6847))

(assert (=> start!33646 tp!24189))

(declare-fun array_inv!6078 (array!17282) Bool)

(assert (=> start!33646 (and (array_inv!6078 _values!1525) e!205170)))

(declare-fun array_inv!6079 (array!17280) Bool)

(assert (=> start!33646 (array_inv!6079 _keys!1895)))

(declare-fun mapNonEmpty!11667 () Bool)

(declare-fun tp!24188 () Bool)

(assert (=> mapNonEmpty!11667 (= mapRes!11667 (and tp!24188 e!205175))))

(declare-fun mapRest!11667 () (Array (_ BitVec 32) ValueCell!3080))

(declare-fun mapKey!11667 () (_ BitVec 32))

(declare-fun mapValue!11667 () ValueCell!3080)

(assert (=> mapNonEmpty!11667 (= (arr!8171 _values!1525) (store mapRest!11667 mapKey!11667 mapValue!11667))))

(assert (= (and start!33646 res!184251) b!334227))

(assert (= (and b!334227 res!184252) b!334229))

(assert (= (and b!334229 res!184254) b!334224))

(assert (= (and b!334224 res!184253) b!334225))

(assert (= (and b!334225 res!184255) b!334222))

(assert (= (and b!334222 res!184250) b!334219))

(assert (= (and b!334219 res!184249) b!334223))

(assert (= (and b!334223 res!184256) b!334220))

(assert (= (and b!334226 condMapEmpty!11667) mapIsEmpty!11667))

(assert (= (and b!334226 (not condMapEmpty!11667)) mapNonEmpty!11667))

(assert (= (and mapNonEmpty!11667 ((_ is ValueCellFull!3080) mapValue!11667)) b!334228))

(assert (= (and b!334226 ((_ is ValueCellFull!3080) mapDefault!11667)) b!334221))

(assert (= start!33646 b!334226))

(declare-fun m!338585 () Bool)

(assert (=> mapNonEmpty!11667 m!338585))

(declare-fun m!338587 () Bool)

(assert (=> b!334220 m!338587))

(declare-fun m!338589 () Bool)

(assert (=> b!334220 m!338589))

(declare-fun m!338591 () Bool)

(assert (=> b!334224 m!338591))

(declare-fun m!338593 () Bool)

(assert (=> b!334225 m!338593))

(declare-fun m!338595 () Bool)

(assert (=> b!334223 m!338595))

(declare-fun m!338597 () Bool)

(assert (=> start!33646 m!338597))

(declare-fun m!338599 () Bool)

(assert (=> start!33646 m!338599))

(declare-fun m!338601 () Bool)

(assert (=> start!33646 m!338601))

(declare-fun m!338603 () Bool)

(assert (=> b!334229 m!338603))

(declare-fun m!338605 () Bool)

(assert (=> b!334219 m!338605))

(declare-fun m!338607 () Bool)

(assert (=> b!334219 m!338607))

(declare-fun m!338609 () Bool)

(assert (=> b!334222 m!338609))

(assert (=> b!334222 m!338609))

(declare-fun m!338611 () Bool)

(assert (=> b!334222 m!338611))

(check-sat tp_is_empty!6847 b_and!14089 (not b!334225) (not b!334219) (not b!334229) (not b!334223) (not b!334222) (not start!33646) (not b!334220) (not mapNonEmpty!11667) (not b!334224) (not b_next!6895))
(check-sat b_and!14089 (not b_next!6895))
