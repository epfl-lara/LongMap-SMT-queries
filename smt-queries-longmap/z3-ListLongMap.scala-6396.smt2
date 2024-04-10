; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82174 () Bool)

(assert start!82174)

(declare-fun mapNonEmpty!33709 () Bool)

(declare-fun mapRes!33709 () Bool)

(declare-fun tp!64314 () Bool)

(declare-fun e!539921 () Bool)

(assert (=> mapNonEmpty!33709 (= mapRes!33709 (and tp!64314 e!539921))))

(declare-fun mapKey!33709 () (_ BitVec 32))

(declare-datatypes ((V!33187 0))(
  ( (V!33188 (val!10627 Int)) )
))
(declare-datatypes ((ValueCell!10095 0))(
  ( (ValueCellFull!10095 (v!13184 V!33187)) (EmptyCell!10095) )
))
(declare-fun mapRest!33709 () (Array (_ BitVec 32) ValueCell!10095))

(declare-datatypes ((array!58409 0))(
  ( (array!58410 (arr!28078 (Array (_ BitVec 32) ValueCell!10095)) (size!28557 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58409)

(declare-fun mapValue!33709 () ValueCell!10095)

(assert (=> mapNonEmpty!33709 (= (arr!28078 _values!1386) (store mapRest!33709 mapKey!33709 mapValue!33709))))

(declare-fun b!957725 () Bool)

(declare-fun res!641074 () Bool)

(declare-fun e!539922 () Bool)

(assert (=> b!957725 (=> (not res!641074) (not e!539922))))

(declare-datatypes ((array!58411 0))(
  ( (array!58412 (arr!28079 (Array (_ BitVec 32) (_ BitVec 64))) (size!28558 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58411)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58411 (_ BitVec 32)) Bool)

(assert (=> b!957725 (= res!641074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641073 () Bool)

(assert (=> start!82174 (=> (not res!641073) (not e!539922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82174 (= res!641073 (validMask!0 mask!2088))))

(assert (=> start!82174 e!539922))

(assert (=> start!82174 true))

(declare-fun e!539925 () Bool)

(declare-fun array_inv!21777 (array!58409) Bool)

(assert (=> start!82174 (and (array_inv!21777 _values!1386) e!539925)))

(declare-fun array_inv!21778 (array!58411) Bool)

(assert (=> start!82174 (array_inv!21778 _keys!1668)))

(declare-fun b!957726 () Bool)

(declare-fun res!641075 () Bool)

(assert (=> b!957726 (=> (not res!641075) (not e!539922))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957726 (= res!641075 (and (= (size!28557 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28558 _keys!1668) (size!28557 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957727 () Bool)

(declare-fun e!539923 () Bool)

(assert (=> b!957727 (= e!539925 (and e!539923 mapRes!33709))))

(declare-fun condMapEmpty!33709 () Bool)

(declare-fun mapDefault!33709 () ValueCell!10095)

(assert (=> b!957727 (= condMapEmpty!33709 (= (arr!28078 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10095)) mapDefault!33709)))))

(declare-fun b!957728 () Bool)

(assert (=> b!957728 (= e!539922 false)))

(declare-fun lt!430371 () Bool)

(declare-datatypes ((List!19521 0))(
  ( (Nil!19518) (Cons!19517 (h!20679 (_ BitVec 64)) (t!27884 List!19521)) )
))
(declare-fun arrayNoDuplicates!0 (array!58411 (_ BitVec 32) List!19521) Bool)

(assert (=> b!957728 (= lt!430371 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19518))))

(declare-fun b!957729 () Bool)

(declare-fun tp_is_empty!21153 () Bool)

(assert (=> b!957729 (= e!539921 tp_is_empty!21153)))

(declare-fun mapIsEmpty!33709 () Bool)

(assert (=> mapIsEmpty!33709 mapRes!33709))

(declare-fun b!957730 () Bool)

(assert (=> b!957730 (= e!539923 tp_is_empty!21153)))

(assert (= (and start!82174 res!641073) b!957726))

(assert (= (and b!957726 res!641075) b!957725))

(assert (= (and b!957725 res!641074) b!957728))

(assert (= (and b!957727 condMapEmpty!33709) mapIsEmpty!33709))

(assert (= (and b!957727 (not condMapEmpty!33709)) mapNonEmpty!33709))

(get-info :version)

(assert (= (and mapNonEmpty!33709 ((_ is ValueCellFull!10095) mapValue!33709)) b!957729))

(assert (= (and b!957727 ((_ is ValueCellFull!10095) mapDefault!33709)) b!957730))

(assert (= start!82174 b!957727))

(declare-fun m!888605 () Bool)

(assert (=> mapNonEmpty!33709 m!888605))

(declare-fun m!888607 () Bool)

(assert (=> b!957725 m!888607))

(declare-fun m!888609 () Bool)

(assert (=> start!82174 m!888609))

(declare-fun m!888611 () Bool)

(assert (=> start!82174 m!888611))

(declare-fun m!888613 () Bool)

(assert (=> start!82174 m!888613))

(declare-fun m!888615 () Bool)

(assert (=> b!957728 m!888615))

(check-sat (not b!957725) tp_is_empty!21153 (not b!957728) (not mapNonEmpty!33709) (not start!82174))
(check-sat)
