; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82816 () Bool)

(assert start!82816)

(declare-fun b_free!18961 () Bool)

(declare-fun b_next!18961 () Bool)

(assert (=> start!82816 (= b_free!18961 (not b_next!18961))))

(declare-fun tp!66013 () Bool)

(declare-fun b_and!30423 () Bool)

(assert (=> start!82816 (= tp!66013 b_and!30423)))

(declare-fun b!966051 () Bool)

(declare-fun res!646696 () Bool)

(declare-fun e!544572 () Bool)

(assert (=> b!966051 (=> (not res!646696) (not e!544572))))

(declare-datatypes ((array!59550 0))(
  ( (array!59551 (arr!28644 (Array (_ BitVec 32) (_ BitVec 64))) (size!29125 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59550)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966051 (= res!646696 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29125 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29125 _keys!1686))))))

(declare-fun res!646697 () Bool)

(assert (=> start!82816 (=> (not res!646697) (not e!544572))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82816 (= res!646697 (validMask!0 mask!2110))))

(assert (=> start!82816 e!544572))

(assert (=> start!82816 true))

(declare-datatypes ((V!34009 0))(
  ( (V!34010 (val!10935 Int)) )
))
(declare-datatypes ((ValueCell!10403 0))(
  ( (ValueCellFull!10403 (v!13492 V!34009)) (EmptyCell!10403) )
))
(declare-datatypes ((array!59552 0))(
  ( (array!59553 (arr!28645 (Array (_ BitVec 32) ValueCell!10403)) (size!29126 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59552)

(declare-fun e!544569 () Bool)

(declare-fun array_inv!22241 (array!59552) Bool)

(assert (=> start!82816 (and (array_inv!22241 _values!1400) e!544569)))

(declare-fun array_inv!22242 (array!59550) Bool)

(assert (=> start!82816 (array_inv!22242 _keys!1686)))

(assert (=> start!82816 tp!66013))

(declare-fun tp_is_empty!21769 () Bool)

(assert (=> start!82816 tp_is_empty!21769))

(declare-fun b!966052 () Bool)

(declare-fun res!646694 () Bool)

(assert (=> b!966052 (=> (not res!646694) (not e!544572))))

(declare-datatypes ((List!19939 0))(
  ( (Nil!19936) (Cons!19935 (h!21097 (_ BitVec 64)) (t!28293 List!19939)) )
))
(declare-fun arrayNoDuplicates!0 (array!59550 (_ BitVec 32) List!19939) Bool)

(assert (=> b!966052 (= res!646694 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19936))))

(declare-fun b!966053 () Bool)

(declare-fun res!646692 () Bool)

(assert (=> b!966053 (=> (not res!646692) (not e!544572))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966053 (= res!646692 (and (= (size!29126 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29125 _keys!1686) (size!29126 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34648 () Bool)

(declare-fun mapRes!34648 () Bool)

(assert (=> mapIsEmpty!34648 mapRes!34648))

(declare-fun b!966054 () Bool)

(declare-fun res!646695 () Bool)

(assert (=> b!966054 (=> (not res!646695) (not e!544572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966054 (= res!646695 (validKeyInArray!0 (select (arr!28644 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34648 () Bool)

(declare-fun tp!66012 () Bool)

(declare-fun e!544571 () Bool)

(assert (=> mapNonEmpty!34648 (= mapRes!34648 (and tp!66012 e!544571))))

(declare-fun mapValue!34648 () ValueCell!10403)

(declare-fun mapRest!34648 () (Array (_ BitVec 32) ValueCell!10403))

(declare-fun mapKey!34648 () (_ BitVec 32))

(assert (=> mapNonEmpty!34648 (= (arr!28645 _values!1400) (store mapRest!34648 mapKey!34648 mapValue!34648))))

(declare-fun b!966055 () Bool)

(declare-fun e!544573 () Bool)

(assert (=> b!966055 (= e!544569 (and e!544573 mapRes!34648))))

(declare-fun condMapEmpty!34648 () Bool)

(declare-fun mapDefault!34648 () ValueCell!10403)

(assert (=> b!966055 (= condMapEmpty!34648 (= (arr!28645 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10403)) mapDefault!34648)))))

(declare-fun b!966056 () Bool)

(assert (=> b!966056 (= e!544572 false)))

(declare-fun lt!431081 () Bool)

(declare-fun minValue!1342 () V!34009)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34009)

(declare-datatypes ((tuple2!14136 0))(
  ( (tuple2!14137 (_1!7079 (_ BitVec 64)) (_2!7079 V!34009)) )
))
(declare-datatypes ((List!19940 0))(
  ( (Nil!19937) (Cons!19936 (h!21098 tuple2!14136) (t!28294 List!19940)) )
))
(declare-datatypes ((ListLongMap!12823 0))(
  ( (ListLongMap!12824 (toList!6427 List!19940)) )
))
(declare-fun contains!5472 (ListLongMap!12823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3589 (array!59550 array!59552 (_ BitVec 32) (_ BitVec 32) V!34009 V!34009 (_ BitVec 32) Int) ListLongMap!12823)

(assert (=> b!966056 (= lt!431081 (contains!5472 (getCurrentListMap!3589 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28644 _keys!1686) i!803)))))

(declare-fun b!966057 () Bool)

(assert (=> b!966057 (= e!544573 tp_is_empty!21769)))

(declare-fun b!966058 () Bool)

(declare-fun res!646693 () Bool)

(assert (=> b!966058 (=> (not res!646693) (not e!544572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59550 (_ BitVec 32)) Bool)

(assert (=> b!966058 (= res!646693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966059 () Bool)

(assert (=> b!966059 (= e!544571 tp_is_empty!21769)))

(assert (= (and start!82816 res!646697) b!966053))

(assert (= (and b!966053 res!646692) b!966058))

(assert (= (and b!966058 res!646693) b!966052))

(assert (= (and b!966052 res!646694) b!966051))

(assert (= (and b!966051 res!646696) b!966054))

(assert (= (and b!966054 res!646695) b!966056))

(assert (= (and b!966055 condMapEmpty!34648) mapIsEmpty!34648))

(assert (= (and b!966055 (not condMapEmpty!34648)) mapNonEmpty!34648))

(get-info :version)

(assert (= (and mapNonEmpty!34648 ((_ is ValueCellFull!10403) mapValue!34648)) b!966059))

(assert (= (and b!966055 ((_ is ValueCellFull!10403) mapDefault!34648)) b!966057))

(assert (= start!82816 b!966055))

(declare-fun m!894361 () Bool)

(assert (=> b!966058 m!894361))

(declare-fun m!894363 () Bool)

(assert (=> b!966056 m!894363))

(declare-fun m!894365 () Bool)

(assert (=> b!966056 m!894365))

(assert (=> b!966056 m!894363))

(assert (=> b!966056 m!894365))

(declare-fun m!894367 () Bool)

(assert (=> b!966056 m!894367))

(declare-fun m!894369 () Bool)

(assert (=> start!82816 m!894369))

(declare-fun m!894371 () Bool)

(assert (=> start!82816 m!894371))

(declare-fun m!894373 () Bool)

(assert (=> start!82816 m!894373))

(assert (=> b!966054 m!894365))

(assert (=> b!966054 m!894365))

(declare-fun m!894375 () Bool)

(assert (=> b!966054 m!894375))

(declare-fun m!894377 () Bool)

(assert (=> mapNonEmpty!34648 m!894377))

(declare-fun m!894379 () Bool)

(assert (=> b!966052 m!894379))

(check-sat (not start!82816) b_and!30423 (not b!966056) (not b!966052) (not b!966054) tp_is_empty!21769 (not b!966058) (not b_next!18961) (not mapNonEmpty!34648))
(check-sat b_and!30423 (not b_next!18961))
