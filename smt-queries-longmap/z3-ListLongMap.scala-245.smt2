; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4142 () Bool)

(assert start!4142)

(declare-fun b_free!1057 () Bool)

(declare-fun b_next!1057 () Bool)

(assert (=> start!4142 (= b_free!1057 (not b_next!1057))))

(declare-fun tp!4590 () Bool)

(declare-fun b_and!1861 () Bool)

(assert (=> start!4142 (= tp!4590 b_and!1861)))

(declare-fun b!31223 () Bool)

(declare-fun e!19951 () Bool)

(declare-fun e!19949 () Bool)

(declare-fun mapRes!1645 () Bool)

(assert (=> b!31223 (= e!19951 (and e!19949 mapRes!1645))))

(declare-fun condMapEmpty!1645 () Bool)

(declare-datatypes ((V!1707 0))(
  ( (V!1708 (val!732 Int)) )
))
(declare-datatypes ((ValueCell!506 0))(
  ( (ValueCellFull!506 (v!1820 V!1707)) (EmptyCell!506) )
))
(declare-datatypes ((array!2015 0))(
  ( (array!2016 (arr!961 (Array (_ BitVec 32) ValueCell!506)) (size!1062 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2015)

(declare-fun mapDefault!1645 () ValueCell!506)

(assert (=> b!31223 (= condMapEmpty!1645 (= (arr!961 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!506)) mapDefault!1645)))))

(declare-fun b!31224 () Bool)

(declare-fun res!18908 () Bool)

(declare-fun e!19947 () Bool)

(assert (=> b!31224 (=> (not res!18908) (not e!19947))))

(declare-datatypes ((array!2017 0))(
  ( (array!2018 (arr!962 (Array (_ BitVec 32) (_ BitVec 64))) (size!1063 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2017)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2017 (_ BitVec 32)) Bool)

(assert (=> b!31224 (= res!18908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31225 () Bool)

(declare-fun res!18906 () Bool)

(assert (=> b!31225 (=> (not res!18906) (not e!19947))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31225 (= res!18906 (validKeyInArray!0 k0!1304))))

(declare-fun b!31226 () Bool)

(declare-fun tp_is_empty!1411 () Bool)

(assert (=> b!31226 (= e!19949 tp_is_empty!1411)))

(declare-fun b!31227 () Bool)

(declare-fun res!18907 () Bool)

(assert (=> b!31227 (=> (not res!18907) (not e!19947))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31227 (= res!18907 (and (= (size!1062 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1063 _keys!1833) (size!1062 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31228 () Bool)

(declare-fun res!18910 () Bool)

(assert (=> b!31228 (=> (not res!18910) (not e!19947))))

(declare-datatypes ((List!785 0))(
  ( (Nil!782) (Cons!781 (h!1348 (_ BitVec 64)) (t!3471 List!785)) )
))
(declare-fun arrayNoDuplicates!0 (array!2017 (_ BitVec 32) List!785) Bool)

(assert (=> b!31228 (= res!18910 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!782))))

(declare-fun res!18909 () Bool)

(assert (=> start!4142 (=> (not res!18909) (not e!19947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4142 (= res!18909 (validMask!0 mask!2294))))

(assert (=> start!4142 e!19947))

(assert (=> start!4142 true))

(assert (=> start!4142 tp!4590))

(declare-fun array_inv!677 (array!2015) Bool)

(assert (=> start!4142 (and (array_inv!677 _values!1501) e!19951)))

(declare-fun array_inv!678 (array!2017) Bool)

(assert (=> start!4142 (array_inv!678 _keys!1833)))

(assert (=> start!4142 tp_is_empty!1411))

(declare-fun mapIsEmpty!1645 () Bool)

(assert (=> mapIsEmpty!1645 mapRes!1645))

(declare-fun mapNonEmpty!1645 () Bool)

(declare-fun tp!4591 () Bool)

(declare-fun e!19950 () Bool)

(assert (=> mapNonEmpty!1645 (= mapRes!1645 (and tp!4591 e!19950))))

(declare-fun mapRest!1645 () (Array (_ BitVec 32) ValueCell!506))

(declare-fun mapKey!1645 () (_ BitVec 32))

(declare-fun mapValue!1645 () ValueCell!506)

(assert (=> mapNonEmpty!1645 (= (arr!961 _values!1501) (store mapRest!1645 mapKey!1645 mapValue!1645))))

(declare-fun b!31229 () Bool)

(assert (=> b!31229 (= e!19950 tp_is_empty!1411)))

(declare-fun b!31230 () Bool)

(assert (=> b!31230 (= e!19947 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1707)

(declare-fun minValue!1443 () V!1707)

(declare-fun lt!11542 () Bool)

(declare-datatypes ((tuple2!1202 0))(
  ( (tuple2!1203 (_1!612 (_ BitVec 64)) (_2!612 V!1707)) )
))
(declare-datatypes ((List!786 0))(
  ( (Nil!783) (Cons!782 (h!1349 tuple2!1202) (t!3472 List!786)) )
))
(declare-datatypes ((ListLongMap!767 0))(
  ( (ListLongMap!768 (toList!399 List!786)) )
))
(declare-fun contains!340 (ListLongMap!767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!222 (array!2017 array!2015 (_ BitVec 32) (_ BitVec 32) V!1707 V!1707 (_ BitVec 32) Int) ListLongMap!767)

(assert (=> b!31230 (= lt!11542 (contains!340 (getCurrentListMap!222 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(assert (= (and start!4142 res!18909) b!31227))

(assert (= (and b!31227 res!18907) b!31224))

(assert (= (and b!31224 res!18908) b!31228))

(assert (= (and b!31228 res!18910) b!31225))

(assert (= (and b!31225 res!18906) b!31230))

(assert (= (and b!31223 condMapEmpty!1645) mapIsEmpty!1645))

(assert (= (and b!31223 (not condMapEmpty!1645)) mapNonEmpty!1645))

(get-info :version)

(assert (= (and mapNonEmpty!1645 ((_ is ValueCellFull!506) mapValue!1645)) b!31229))

(assert (= (and b!31223 ((_ is ValueCellFull!506) mapDefault!1645)) b!31226))

(assert (= start!4142 b!31223))

(declare-fun m!25029 () Bool)

(assert (=> b!31224 m!25029))

(declare-fun m!25031 () Bool)

(assert (=> start!4142 m!25031))

(declare-fun m!25033 () Bool)

(assert (=> start!4142 m!25033))

(declare-fun m!25035 () Bool)

(assert (=> start!4142 m!25035))

(declare-fun m!25037 () Bool)

(assert (=> b!31228 m!25037))

(declare-fun m!25039 () Bool)

(assert (=> b!31225 m!25039))

(declare-fun m!25041 () Bool)

(assert (=> mapNonEmpty!1645 m!25041))

(declare-fun m!25043 () Bool)

(assert (=> b!31230 m!25043))

(assert (=> b!31230 m!25043))

(declare-fun m!25045 () Bool)

(assert (=> b!31230 m!25045))

(check-sat b_and!1861 (not b!31225) (not mapNonEmpty!1645) (not b!31230) (not start!4142) tp_is_empty!1411 (not b!31228) (not b_next!1057) (not b!31224))
(check-sat b_and!1861 (not b_next!1057))
