; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82232 () Bool)

(assert start!82232)

(declare-fun b_free!18523 () Bool)

(declare-fun b_next!18523 () Bool)

(assert (=> start!82232 (= b_free!18523 (not b_next!18523))))

(declare-fun tp!64530 () Bool)

(declare-fun b_and!29985 () Bool)

(assert (=> start!82232 (= tp!64530 b_and!29985)))

(declare-fun b!958500 () Bool)

(declare-fun e!540346 () Bool)

(declare-fun tp_is_empty!21229 () Bool)

(assert (=> b!958500 (= e!540346 tp_is_empty!21229)))

(declare-fun mapIsEmpty!33823 () Bool)

(declare-fun mapRes!33823 () Bool)

(assert (=> mapIsEmpty!33823 mapRes!33823))

(declare-fun b!958501 () Bool)

(declare-fun res!641637 () Bool)

(declare-fun e!540345 () Bool)

(assert (=> b!958501 (=> (not res!641637) (not e!540345))))

(declare-datatypes ((array!58490 0))(
  ( (array!58491 (arr!28119 (Array (_ BitVec 32) (_ BitVec 64))) (size!28600 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58490)

(declare-datatypes ((List!19584 0))(
  ( (Nil!19581) (Cons!19580 (h!20742 (_ BitVec 64)) (t!27938 List!19584)) )
))
(declare-fun arrayNoDuplicates!0 (array!58490 (_ BitVec 32) List!19584) Bool)

(assert (=> b!958501 (= res!641637 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19581))))

(declare-fun b!958502 () Bool)

(declare-fun res!641635 () Bool)

(assert (=> b!958502 (=> (not res!641635) (not e!540345))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58490 (_ BitVec 32)) Bool)

(assert (=> b!958502 (= res!641635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641639 () Bool)

(assert (=> start!82232 (=> (not res!641639) (not e!540345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82232 (= res!641639 (validMask!0 mask!2088))))

(assert (=> start!82232 e!540345))

(assert (=> start!82232 true))

(assert (=> start!82232 tp_is_empty!21229))

(declare-fun array_inv!21863 (array!58490) Bool)

(assert (=> start!82232 (array_inv!21863 _keys!1668)))

(declare-datatypes ((V!33289 0))(
  ( (V!33290 (val!10665 Int)) )
))
(declare-datatypes ((ValueCell!10133 0))(
  ( (ValueCellFull!10133 (v!13221 V!33289)) (EmptyCell!10133) )
))
(declare-datatypes ((array!58492 0))(
  ( (array!58493 (arr!28120 (Array (_ BitVec 32) ValueCell!10133)) (size!28601 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58492)

(declare-fun e!540344 () Bool)

(declare-fun array_inv!21864 (array!58492) Bool)

(assert (=> start!82232 (and (array_inv!21864 _values!1386) e!540344)))

(assert (=> start!82232 tp!64530))

(declare-fun b!958503 () Bool)

(declare-fun res!641636 () Bool)

(assert (=> b!958503 (=> (not res!641636) (not e!540345))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!958503 (= res!641636 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28600 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28600 _keys!1668))))))

(declare-fun mapNonEmpty!33823 () Bool)

(declare-fun tp!64531 () Bool)

(assert (=> mapNonEmpty!33823 (= mapRes!33823 (and tp!64531 e!540346))))

(declare-fun mapRest!33823 () (Array (_ BitVec 32) ValueCell!10133))

(declare-fun mapKey!33823 () (_ BitVec 32))

(declare-fun mapValue!33823 () ValueCell!10133)

(assert (=> mapNonEmpty!33823 (= (arr!28120 _values!1386) (store mapRest!33823 mapKey!33823 mapValue!33823))))

(declare-fun b!958504 () Bool)

(assert (=> b!958504 (= e!540345 false)))

(declare-fun lt!430240 () Bool)

(declare-fun minValue!1328 () V!33289)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33289)

(declare-datatypes ((tuple2!13798 0))(
  ( (tuple2!13799 (_1!6910 (_ BitVec 64)) (_2!6910 V!33289)) )
))
(declare-datatypes ((List!19585 0))(
  ( (Nil!19582) (Cons!19581 (h!20743 tuple2!13798) (t!27939 List!19585)) )
))
(declare-datatypes ((ListLongMap!12485 0))(
  ( (ListLongMap!12486 (toList!6258 List!19585)) )
))
(declare-fun contains!5304 (ListLongMap!12485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3420 (array!58490 array!58492 (_ BitVec 32) (_ BitVec 32) V!33289 V!33289 (_ BitVec 32) Int) ListLongMap!12485)

(assert (=> b!958504 (= lt!430240 (contains!5304 (getCurrentListMap!3420 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28119 _keys!1668) i!793)))))

(declare-fun b!958505 () Bool)

(declare-fun e!540343 () Bool)

(assert (=> b!958505 (= e!540343 tp_is_empty!21229)))

(declare-fun b!958506 () Bool)

(assert (=> b!958506 (= e!540344 (and e!540343 mapRes!33823))))

(declare-fun condMapEmpty!33823 () Bool)

(declare-fun mapDefault!33823 () ValueCell!10133)

(assert (=> b!958506 (= condMapEmpty!33823 (= (arr!28120 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10133)) mapDefault!33823)))))

(declare-fun b!958507 () Bool)

(declare-fun res!641640 () Bool)

(assert (=> b!958507 (=> (not res!641640) (not e!540345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958507 (= res!641640 (validKeyInArray!0 (select (arr!28119 _keys!1668) i!793)))))

(declare-fun b!958508 () Bool)

(declare-fun res!641638 () Bool)

(assert (=> b!958508 (=> (not res!641638) (not e!540345))))

(assert (=> b!958508 (= res!641638 (and (= (size!28601 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28600 _keys!1668) (size!28601 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82232 res!641639) b!958508))

(assert (= (and b!958508 res!641638) b!958502))

(assert (= (and b!958502 res!641635) b!958501))

(assert (= (and b!958501 res!641637) b!958503))

(assert (= (and b!958503 res!641636) b!958507))

(assert (= (and b!958507 res!641640) b!958504))

(assert (= (and b!958506 condMapEmpty!33823) mapIsEmpty!33823))

(assert (= (and b!958506 (not condMapEmpty!33823)) mapNonEmpty!33823))

(get-info :version)

(assert (= (and mapNonEmpty!33823 ((_ is ValueCellFull!10133) mapValue!33823)) b!958500))

(assert (= (and b!958506 ((_ is ValueCellFull!10133) mapDefault!33823)) b!958505))

(assert (= start!82232 b!958506))

(declare-fun m!888579 () Bool)

(assert (=> b!958504 m!888579))

(declare-fun m!888581 () Bool)

(assert (=> b!958504 m!888581))

(assert (=> b!958504 m!888579))

(assert (=> b!958504 m!888581))

(declare-fun m!888583 () Bool)

(assert (=> b!958504 m!888583))

(declare-fun m!888585 () Bool)

(assert (=> b!958501 m!888585))

(assert (=> b!958507 m!888581))

(assert (=> b!958507 m!888581))

(declare-fun m!888587 () Bool)

(assert (=> b!958507 m!888587))

(declare-fun m!888589 () Bool)

(assert (=> mapNonEmpty!33823 m!888589))

(declare-fun m!888591 () Bool)

(assert (=> start!82232 m!888591))

(declare-fun m!888593 () Bool)

(assert (=> start!82232 m!888593))

(declare-fun m!888595 () Bool)

(assert (=> start!82232 m!888595))

(declare-fun m!888597 () Bool)

(assert (=> b!958502 m!888597))

(check-sat tp_is_empty!21229 (not b_next!18523) (not b!958502) b_and!29985 (not b!958504) (not b!958507) (not mapNonEmpty!33823) (not b!958501) (not start!82232))
(check-sat b_and!29985 (not b_next!18523))
