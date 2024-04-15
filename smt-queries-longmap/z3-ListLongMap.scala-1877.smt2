; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33682 () Bool)

(assert start!33682)

(declare-fun b_free!6931 () Bool)

(declare-fun b_next!6931 () Bool)

(assert (=> start!33682 (= b_free!6931 (not b_next!6931))))

(declare-fun tp!24297 () Bool)

(declare-fun b_and!14085 () Bool)

(assert (=> start!33682 (= tp!24297 b_and!14085)))

(declare-fun b!334591 () Bool)

(declare-fun e!205366 () Bool)

(assert (=> b!334591 (= e!205366 (not true))))

(declare-datatypes ((V!10155 0))(
  ( (V!10156 (val!3486 Int)) )
))
(declare-datatypes ((tuple2!5008 0))(
  ( (tuple2!5009 (_1!2515 (_ BitVec 64)) (_2!2515 V!10155)) )
))
(declare-datatypes ((List!4647 0))(
  ( (Nil!4644) (Cons!4643 (h!5499 tuple2!5008) (t!9726 List!4647)) )
))
(declare-datatypes ((ListLongMap!3911 0))(
  ( (ListLongMap!3912 (toList!1971 List!4647)) )
))
(declare-fun lt!159387 () ListLongMap!3911)

(declare-datatypes ((array!17339 0))(
  ( (array!17340 (arr!8200 (Array (_ BitVec 32) (_ BitVec 64))) (size!8553 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17339)

(declare-datatypes ((SeekEntryResult!3171 0))(
  ( (MissingZero!3171 (index!14863 (_ BitVec 32))) (Found!3171 (index!14864 (_ BitVec 32))) (Intermediate!3171 (undefined!3983 Bool) (index!14865 (_ BitVec 32)) (x!33364 (_ BitVec 32))) (Undefined!3171) (MissingVacant!3171 (index!14866 (_ BitVec 32))) )
))
(declare-fun lt!159390 () SeekEntryResult!3171)

(declare-fun contains!2026 (ListLongMap!3911 (_ BitVec 64)) Bool)

(assert (=> b!334591 (contains!2026 lt!159387 (select (arr!8200 _keys!1895) (index!14864 lt!159390)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10155)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3098 0))(
  ( (ValueCellFull!3098 (v!5642 V!10155)) (EmptyCell!3098) )
))
(declare-datatypes ((array!17341 0))(
  ( (array!17342 (arr!8201 (Array (_ BitVec 32) ValueCell!3098)) (size!8554 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17341)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10155)

(declare-datatypes ((Unit!10400 0))(
  ( (Unit!10401) )
))
(declare-fun lt!159389 () Unit!10400)

(declare-fun lemmaValidKeyInArrayIsInListMap!157 (array!17339 array!17341 (_ BitVec 32) (_ BitVec 32) V!10155 V!10155 (_ BitVec 32) Int) Unit!10400)

(assert (=> b!334591 (= lt!159389 (lemmaValidKeyInArrayIsInListMap!157 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14864 lt!159390) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334591 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159388 () Unit!10400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17339 (_ BitVec 64) (_ BitVec 32)) Unit!10400)

(assert (=> b!334591 (= lt!159388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14864 lt!159390)))))

(declare-fun b!334592 () Bool)

(declare-fun res!184561 () Bool)

(assert (=> b!334592 (=> (not res!184561) (not e!205366))))

(assert (=> b!334592 (= res!184561 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14864 lt!159390)))))

(declare-fun b!334593 () Bool)

(declare-fun res!184557 () Bool)

(declare-fun e!205365 () Bool)

(assert (=> b!334593 (=> (not res!184557) (not e!205365))))

(declare-datatypes ((List!4648 0))(
  ( (Nil!4645) (Cons!4644 (h!5500 (_ BitVec 64)) (t!9727 List!4648)) )
))
(declare-fun arrayNoDuplicates!0 (array!17339 (_ BitVec 32) List!4648) Bool)

(assert (=> b!334593 (= res!184557 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4645))))

(declare-fun b!334594 () Bool)

(declare-fun e!205368 () Bool)

(assert (=> b!334594 (= e!205368 e!205366)))

(declare-fun res!184562 () Bool)

(assert (=> b!334594 (=> (not res!184562) (not e!205366))))

(get-info :version)

(assert (=> b!334594 (= res!184562 (and ((_ is Found!3171) lt!159390) (= (select (arr!8200 _keys!1895) (index!14864 lt!159390)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17339 (_ BitVec 32)) SeekEntryResult!3171)

(assert (=> b!334594 (= lt!159390 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334595 () Bool)

(declare-fun e!205363 () Bool)

(declare-fun tp_is_empty!6883 () Bool)

(assert (=> b!334595 (= e!205363 tp_is_empty!6883)))

(declare-fun b!334596 () Bool)

(declare-fun e!205364 () Bool)

(declare-fun mapRes!11721 () Bool)

(assert (=> b!334596 (= e!205364 (and e!205363 mapRes!11721))))

(declare-fun condMapEmpty!11721 () Bool)

(declare-fun mapDefault!11721 () ValueCell!3098)

(assert (=> b!334596 (= condMapEmpty!11721 (= (arr!8201 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3098)) mapDefault!11721)))))

(declare-fun b!334597 () Bool)

(declare-fun res!184556 () Bool)

(assert (=> b!334597 (=> (not res!184556) (not e!205365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334597 (= res!184556 (validKeyInArray!0 k0!1348))))

(declare-fun res!184555 () Bool)

(assert (=> start!33682 (=> (not res!184555) (not e!205365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33682 (= res!184555 (validMask!0 mask!2385))))

(assert (=> start!33682 e!205365))

(assert (=> start!33682 true))

(assert (=> start!33682 tp_is_empty!6883))

(assert (=> start!33682 tp!24297))

(declare-fun array_inv!6114 (array!17341) Bool)

(assert (=> start!33682 (and (array_inv!6114 _values!1525) e!205364)))

(declare-fun array_inv!6115 (array!17339) Bool)

(assert (=> start!33682 (array_inv!6115 _keys!1895)))

(declare-fun b!334598 () Bool)

(declare-fun res!184559 () Bool)

(assert (=> b!334598 (=> (not res!184559) (not e!205365))))

(assert (=> b!334598 (= res!184559 (and (= (size!8554 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8553 _keys!1895) (size!8554 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334599 () Bool)

(assert (=> b!334599 (= e!205365 e!205368)))

(declare-fun res!184558 () Bool)

(assert (=> b!334599 (=> (not res!184558) (not e!205368))))

(assert (=> b!334599 (= res!184558 (not (contains!2026 lt!159387 k0!1348)))))

(declare-fun getCurrentListMap!1480 (array!17339 array!17341 (_ BitVec 32) (_ BitVec 32) V!10155 V!10155 (_ BitVec 32) Int) ListLongMap!3911)

(assert (=> b!334599 (= lt!159387 (getCurrentListMap!1480 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334600 () Bool)

(declare-fun e!205369 () Bool)

(assert (=> b!334600 (= e!205369 tp_is_empty!6883)))

(declare-fun mapIsEmpty!11721 () Bool)

(assert (=> mapIsEmpty!11721 mapRes!11721))

(declare-fun mapNonEmpty!11721 () Bool)

(declare-fun tp!24296 () Bool)

(assert (=> mapNonEmpty!11721 (= mapRes!11721 (and tp!24296 e!205369))))

(declare-fun mapRest!11721 () (Array (_ BitVec 32) ValueCell!3098))

(declare-fun mapKey!11721 () (_ BitVec 32))

(declare-fun mapValue!11721 () ValueCell!3098)

(assert (=> mapNonEmpty!11721 (= (arr!8201 _values!1525) (store mapRest!11721 mapKey!11721 mapValue!11721))))

(declare-fun b!334601 () Bool)

(declare-fun res!184560 () Bool)

(assert (=> b!334601 (=> (not res!184560) (not e!205365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17339 (_ BitVec 32)) Bool)

(assert (=> b!334601 (= res!184560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33682 res!184555) b!334598))

(assert (= (and b!334598 res!184559) b!334601))

(assert (= (and b!334601 res!184560) b!334593))

(assert (= (and b!334593 res!184557) b!334597))

(assert (= (and b!334597 res!184556) b!334599))

(assert (= (and b!334599 res!184558) b!334594))

(assert (= (and b!334594 res!184562) b!334592))

(assert (= (and b!334592 res!184561) b!334591))

(assert (= (and b!334596 condMapEmpty!11721) mapIsEmpty!11721))

(assert (= (and b!334596 (not condMapEmpty!11721)) mapNonEmpty!11721))

(assert (= (and mapNonEmpty!11721 ((_ is ValueCellFull!3098) mapValue!11721)) b!334600))

(assert (= (and b!334596 ((_ is ValueCellFull!3098) mapDefault!11721)) b!334595))

(assert (= start!33682 b!334596))

(declare-fun m!338147 () Bool)

(assert (=> b!334592 m!338147))

(declare-fun m!338149 () Bool)

(assert (=> b!334599 m!338149))

(declare-fun m!338151 () Bool)

(assert (=> b!334599 m!338151))

(declare-fun m!338153 () Bool)

(assert (=> b!334593 m!338153))

(declare-fun m!338155 () Bool)

(assert (=> b!334601 m!338155))

(declare-fun m!338157 () Bool)

(assert (=> b!334597 m!338157))

(declare-fun m!338159 () Bool)

(assert (=> mapNonEmpty!11721 m!338159))

(declare-fun m!338161 () Bool)

(assert (=> b!334594 m!338161))

(declare-fun m!338163 () Bool)

(assert (=> b!334594 m!338163))

(declare-fun m!338165 () Bool)

(assert (=> start!33682 m!338165))

(declare-fun m!338167 () Bool)

(assert (=> start!33682 m!338167))

(declare-fun m!338169 () Bool)

(assert (=> start!33682 m!338169))

(declare-fun m!338171 () Bool)

(assert (=> b!334591 m!338171))

(declare-fun m!338173 () Bool)

(assert (=> b!334591 m!338173))

(assert (=> b!334591 m!338161))

(declare-fun m!338175 () Bool)

(assert (=> b!334591 m!338175))

(declare-fun m!338177 () Bool)

(assert (=> b!334591 m!338177))

(assert (=> b!334591 m!338161))

(check-sat (not b!334593) (not start!33682) (not mapNonEmpty!11721) (not b!334601) tp_is_empty!6883 (not b_next!6931) (not b!334599) b_and!14085 (not b!334594) (not b!334592) (not b!334591) (not b!334597))
(check-sat b_and!14085 (not b_next!6931))
