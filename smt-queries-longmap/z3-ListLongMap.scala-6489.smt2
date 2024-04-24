; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82942 () Bool)

(assert start!82942)

(declare-fun b_free!18907 () Bool)

(declare-fun b_next!18907 () Bool)

(assert (=> start!82942 (= b_free!18907 (not b_next!18907))))

(declare-fun tp!65842 () Bool)

(declare-fun b_and!30405 () Bool)

(assert (=> start!82942 (= tp!65842 b_and!30405)))

(declare-fun b!966392 () Bool)

(declare-fun res!646616 () Bool)

(declare-fun e!544853 () Bool)

(assert (=> b!966392 (=> (not res!646616) (not e!544853))))

(declare-datatypes ((array!59520 0))(
  ( (array!59521 (arr!28624 (Array (_ BitVec 32) (_ BitVec 64))) (size!29104 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59520)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966392 (= res!646616 (validKeyInArray!0 (select (arr!28624 _keys!1686) i!803)))))

(declare-fun b!966393 () Bool)

(declare-fun res!646619 () Bool)

(assert (=> b!966393 (=> (not res!646619) (not e!544853))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966393 (= res!646619 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29104 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29104 _keys!1686))))))

(declare-fun b!966394 () Bool)

(declare-fun e!544851 () Bool)

(declare-fun tp_is_empty!21709 () Bool)

(assert (=> b!966394 (= e!544851 tp_is_empty!21709)))

(declare-fun res!646618 () Bool)

(assert (=> start!82942 (=> (not res!646618) (not e!544853))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82942 (= res!646618 (validMask!0 mask!2110))))

(assert (=> start!82942 e!544853))

(assert (=> start!82942 true))

(declare-datatypes ((V!33929 0))(
  ( (V!33930 (val!10905 Int)) )
))
(declare-datatypes ((ValueCell!10373 0))(
  ( (ValueCellFull!10373 (v!13460 V!33929)) (EmptyCell!10373) )
))
(declare-datatypes ((array!59522 0))(
  ( (array!59523 (arr!28625 (Array (_ BitVec 32) ValueCell!10373)) (size!29105 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59522)

(declare-fun e!544850 () Bool)

(declare-fun array_inv!22225 (array!59522) Bool)

(assert (=> start!82942 (and (array_inv!22225 _values!1400) e!544850)))

(declare-fun array_inv!22226 (array!59520) Bool)

(assert (=> start!82942 (array_inv!22226 _keys!1686)))

(assert (=> start!82942 tp!65842))

(assert (=> start!82942 tp_is_empty!21709))

(declare-fun mapNonEmpty!34558 () Bool)

(declare-fun mapRes!34558 () Bool)

(declare-fun tp!65841 () Bool)

(assert (=> mapNonEmpty!34558 (= mapRes!34558 (and tp!65841 e!544851))))

(declare-fun mapValue!34558 () ValueCell!10373)

(declare-fun mapKey!34558 () (_ BitVec 32))

(declare-fun mapRest!34558 () (Array (_ BitVec 32) ValueCell!10373))

(assert (=> mapNonEmpty!34558 (= (arr!28625 _values!1400) (store mapRest!34558 mapKey!34558 mapValue!34558))))

(declare-fun b!966395 () Bool)

(assert (=> b!966395 (= e!544853 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33929)

(declare-fun lt!431606 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33929)

(declare-datatypes ((tuple2!14008 0))(
  ( (tuple2!14009 (_1!7015 (_ BitVec 64)) (_2!7015 V!33929)) )
))
(declare-datatypes ((List!19853 0))(
  ( (Nil!19850) (Cons!19849 (h!21017 tuple2!14008) (t!28208 List!19853)) )
))
(declare-datatypes ((ListLongMap!12707 0))(
  ( (ListLongMap!12708 (toList!6369 List!19853)) )
))
(declare-fun contains!5484 (ListLongMap!12707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3602 (array!59520 array!59522 (_ BitVec 32) (_ BitVec 32) V!33929 V!33929 (_ BitVec 32) Int) ListLongMap!12707)

(assert (=> b!966395 (= lt!431606 (contains!5484 (getCurrentListMap!3602 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28624 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34558 () Bool)

(assert (=> mapIsEmpty!34558 mapRes!34558))

(declare-fun b!966396 () Bool)

(declare-fun res!646615 () Bool)

(assert (=> b!966396 (=> (not res!646615) (not e!544853))))

(declare-datatypes ((List!19854 0))(
  ( (Nil!19851) (Cons!19850 (h!21018 (_ BitVec 64)) (t!28209 List!19854)) )
))
(declare-fun arrayNoDuplicates!0 (array!59520 (_ BitVec 32) List!19854) Bool)

(assert (=> b!966396 (= res!646615 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19851))))

(declare-fun b!966397 () Bool)

(declare-fun res!646620 () Bool)

(assert (=> b!966397 (=> (not res!646620) (not e!544853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59520 (_ BitVec 32)) Bool)

(assert (=> b!966397 (= res!646620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966398 () Bool)

(declare-fun res!646617 () Bool)

(assert (=> b!966398 (=> (not res!646617) (not e!544853))))

(assert (=> b!966398 (= res!646617 (and (= (size!29105 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29104 _keys!1686) (size!29105 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966399 () Bool)

(declare-fun e!544852 () Bool)

(assert (=> b!966399 (= e!544850 (and e!544852 mapRes!34558))))

(declare-fun condMapEmpty!34558 () Bool)

(declare-fun mapDefault!34558 () ValueCell!10373)

(assert (=> b!966399 (= condMapEmpty!34558 (= (arr!28625 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10373)) mapDefault!34558)))))

(declare-fun b!966400 () Bool)

(assert (=> b!966400 (= e!544852 tp_is_empty!21709)))

(assert (= (and start!82942 res!646618) b!966398))

(assert (= (and b!966398 res!646617) b!966397))

(assert (= (and b!966397 res!646620) b!966396))

(assert (= (and b!966396 res!646615) b!966393))

(assert (= (and b!966393 res!646619) b!966392))

(assert (= (and b!966392 res!646616) b!966395))

(assert (= (and b!966399 condMapEmpty!34558) mapIsEmpty!34558))

(assert (= (and b!966399 (not condMapEmpty!34558)) mapNonEmpty!34558))

(get-info :version)

(assert (= (and mapNonEmpty!34558 ((_ is ValueCellFull!10373) mapValue!34558)) b!966394))

(assert (= (and b!966399 ((_ is ValueCellFull!10373) mapDefault!34558)) b!966400))

(assert (= start!82942 b!966399))

(declare-fun m!895843 () Bool)

(assert (=> b!966396 m!895843))

(declare-fun m!895845 () Bool)

(assert (=> b!966392 m!895845))

(assert (=> b!966392 m!895845))

(declare-fun m!895847 () Bool)

(assert (=> b!966392 m!895847))

(declare-fun m!895849 () Bool)

(assert (=> start!82942 m!895849))

(declare-fun m!895851 () Bool)

(assert (=> start!82942 m!895851))

(declare-fun m!895853 () Bool)

(assert (=> start!82942 m!895853))

(declare-fun m!895855 () Bool)

(assert (=> b!966397 m!895855))

(declare-fun m!895857 () Bool)

(assert (=> mapNonEmpty!34558 m!895857))

(declare-fun m!895859 () Bool)

(assert (=> b!966395 m!895859))

(assert (=> b!966395 m!895845))

(assert (=> b!966395 m!895859))

(assert (=> b!966395 m!895845))

(declare-fun m!895861 () Bool)

(assert (=> b!966395 m!895861))

(check-sat (not b!966392) (not b!966397) (not b!966395) (not mapNonEmpty!34558) (not start!82942) (not b_next!18907) tp_is_empty!21709 b_and!30405 (not b!966396))
(check-sat b_and!30405 (not b_next!18907))
