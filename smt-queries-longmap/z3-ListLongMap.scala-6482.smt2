; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82714 () Bool)

(assert start!82714)

(declare-fun b_free!18865 () Bool)

(declare-fun b_next!18865 () Bool)

(assert (=> start!82714 (= b_free!18865 (not b_next!18865))))

(declare-fun tp!65716 () Bool)

(declare-fun b_and!30327 () Bool)

(assert (=> start!82714 (= tp!65716 b_and!30327)))

(declare-fun b!964683 () Bool)

(declare-fun e!543808 () Bool)

(declare-fun e!543805 () Bool)

(declare-fun mapRes!34495 () Bool)

(assert (=> b!964683 (= e!543808 (and e!543805 mapRes!34495))))

(declare-fun condMapEmpty!34495 () Bool)

(declare-datatypes ((V!33873 0))(
  ( (V!33874 (val!10884 Int)) )
))
(declare-datatypes ((ValueCell!10352 0))(
  ( (ValueCellFull!10352 (v!13441 V!33873)) (EmptyCell!10352) )
))
(declare-datatypes ((array!59356 0))(
  ( (array!59357 (arr!28547 (Array (_ BitVec 32) ValueCell!10352)) (size!29028 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59356)

(declare-fun mapDefault!34495 () ValueCell!10352)

(assert (=> b!964683 (= condMapEmpty!34495 (= (arr!28547 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10352)) mapDefault!34495)))))

(declare-fun mapNonEmpty!34495 () Bool)

(declare-fun tp!65715 () Bool)

(declare-fun e!543806 () Bool)

(assert (=> mapNonEmpty!34495 (= mapRes!34495 (and tp!65715 e!543806))))

(declare-fun mapRest!34495 () (Array (_ BitVec 32) ValueCell!10352))

(declare-fun mapValue!34495 () ValueCell!10352)

(declare-fun mapKey!34495 () (_ BitVec 32))

(assert (=> mapNonEmpty!34495 (= (arr!28547 _values!1400) (store mapRest!34495 mapKey!34495 mapValue!34495))))

(declare-fun b!964684 () Bool)

(declare-fun e!543807 () Bool)

(assert (=> b!964684 (= e!543807 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59358 0))(
  ( (array!59359 (arr!28548 (Array (_ BitVec 32) (_ BitVec 64))) (size!29029 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59358)

(declare-fun minValue!1342 () V!33873)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!430946 () Bool)

(declare-fun zeroValue!1342 () V!33873)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14064 0))(
  ( (tuple2!14065 (_1!7043 (_ BitVec 64)) (_2!7043 V!33873)) )
))
(declare-datatypes ((List!19869 0))(
  ( (Nil!19866) (Cons!19865 (h!21027 tuple2!14064) (t!28223 List!19869)) )
))
(declare-datatypes ((ListLongMap!12751 0))(
  ( (ListLongMap!12752 (toList!6391 List!19869)) )
))
(declare-fun contains!5438 (ListLongMap!12751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3553 (array!59358 array!59356 (_ BitVec 32) (_ BitVec 32) V!33873 V!33873 (_ BitVec 32) Int) ListLongMap!12751)

(assert (=> b!964684 (= lt!430946 (contains!5438 (getCurrentListMap!3553 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28548 _keys!1686) i!803)))))

(declare-fun b!964685 () Bool)

(declare-fun res!645786 () Bool)

(assert (=> b!964685 (=> (not res!645786) (not e!543807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59358 (_ BitVec 32)) Bool)

(assert (=> b!964685 (= res!645786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964686 () Bool)

(declare-fun res!645787 () Bool)

(assert (=> b!964686 (=> (not res!645787) (not e!543807))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964686 (= res!645787 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29029 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29029 _keys!1686))))))

(declare-fun res!645783 () Bool)

(assert (=> start!82714 (=> (not res!645783) (not e!543807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82714 (= res!645783 (validMask!0 mask!2110))))

(assert (=> start!82714 e!543807))

(assert (=> start!82714 true))

(declare-fun array_inv!22167 (array!59356) Bool)

(assert (=> start!82714 (and (array_inv!22167 _values!1400) e!543808)))

(declare-fun array_inv!22168 (array!59358) Bool)

(assert (=> start!82714 (array_inv!22168 _keys!1686)))

(assert (=> start!82714 tp!65716))

(declare-fun tp_is_empty!21667 () Bool)

(assert (=> start!82714 tp_is_empty!21667))

(declare-fun b!964687 () Bool)

(assert (=> b!964687 (= e!543806 tp_is_empty!21667)))

(declare-fun b!964688 () Bool)

(declare-fun res!645784 () Bool)

(assert (=> b!964688 (=> (not res!645784) (not e!543807))))

(assert (=> b!964688 (= res!645784 (and (= (size!29028 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29029 _keys!1686) (size!29028 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34495 () Bool)

(assert (=> mapIsEmpty!34495 mapRes!34495))

(declare-fun b!964689 () Bool)

(declare-fun res!645788 () Bool)

(assert (=> b!964689 (=> (not res!645788) (not e!543807))))

(declare-datatypes ((List!19870 0))(
  ( (Nil!19867) (Cons!19866 (h!21028 (_ BitVec 64)) (t!28224 List!19870)) )
))
(declare-fun arrayNoDuplicates!0 (array!59358 (_ BitVec 32) List!19870) Bool)

(assert (=> b!964689 (= res!645788 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19867))))

(declare-fun b!964690 () Bool)

(assert (=> b!964690 (= e!543805 tp_is_empty!21667)))

(declare-fun b!964691 () Bool)

(declare-fun res!645785 () Bool)

(assert (=> b!964691 (=> (not res!645785) (not e!543807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964691 (= res!645785 (validKeyInArray!0 (select (arr!28548 _keys!1686) i!803)))))

(assert (= (and start!82714 res!645783) b!964688))

(assert (= (and b!964688 res!645784) b!964685))

(assert (= (and b!964685 res!645786) b!964689))

(assert (= (and b!964689 res!645788) b!964686))

(assert (= (and b!964686 res!645787) b!964691))

(assert (= (and b!964691 res!645785) b!964684))

(assert (= (and b!964683 condMapEmpty!34495) mapIsEmpty!34495))

(assert (= (and b!964683 (not condMapEmpty!34495)) mapNonEmpty!34495))

(get-info :version)

(assert (= (and mapNonEmpty!34495 ((_ is ValueCellFull!10352) mapValue!34495)) b!964687))

(assert (= (and b!964683 ((_ is ValueCellFull!10352) mapDefault!34495)) b!964690))

(assert (= start!82714 b!964683))

(declare-fun m!893371 () Bool)

(assert (=> mapNonEmpty!34495 m!893371))

(declare-fun m!893373 () Bool)

(assert (=> start!82714 m!893373))

(declare-fun m!893375 () Bool)

(assert (=> start!82714 m!893375))

(declare-fun m!893377 () Bool)

(assert (=> start!82714 m!893377))

(declare-fun m!893379 () Bool)

(assert (=> b!964689 m!893379))

(declare-fun m!893381 () Bool)

(assert (=> b!964691 m!893381))

(assert (=> b!964691 m!893381))

(declare-fun m!893383 () Bool)

(assert (=> b!964691 m!893383))

(declare-fun m!893385 () Bool)

(assert (=> b!964685 m!893385))

(declare-fun m!893387 () Bool)

(assert (=> b!964684 m!893387))

(assert (=> b!964684 m!893381))

(assert (=> b!964684 m!893387))

(assert (=> b!964684 m!893381))

(declare-fun m!893389 () Bool)

(assert (=> b!964684 m!893389))

(check-sat (not b!964691) (not mapNonEmpty!34495) (not b!964684) (not b!964689) (not b_next!18865) (not start!82714) b_and!30327 (not b!964685) tp_is_empty!21667)
(check-sat b_and!30327 (not b_next!18865))
