; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82854 () Bool)

(assert start!82854)

(declare-fun b_free!18981 () Bool)

(declare-fun b_next!18981 () Bool)

(assert (=> start!82854 (= b_free!18981 (not b_next!18981))))

(declare-fun tp!66072 () Bool)

(declare-fun b_and!30469 () Bool)

(assert (=> start!82854 (= tp!66072 b_and!30469)))

(declare-fun mapIsEmpty!34678 () Bool)

(declare-fun mapRes!34678 () Bool)

(assert (=> mapIsEmpty!34678 mapRes!34678))

(declare-fun b!966565 () Bool)

(declare-fun e!544867 () Bool)

(declare-fun tp_is_empty!21789 () Bool)

(assert (=> b!966565 (= e!544867 tp_is_empty!21789)))

(declare-fun b!966566 () Bool)

(declare-fun res!646991 () Bool)

(declare-fun e!544869 () Bool)

(assert (=> b!966566 (=> (not res!646991) (not e!544869))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34035 0))(
  ( (V!34036 (val!10945 Int)) )
))
(declare-datatypes ((ValueCell!10413 0))(
  ( (ValueCellFull!10413 (v!13503 V!34035)) (EmptyCell!10413) )
))
(declare-datatypes ((array!59657 0))(
  ( (array!59658 (arr!28697 (Array (_ BitVec 32) ValueCell!10413)) (size!29176 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59657)

(declare-datatypes ((array!59659 0))(
  ( (array!59660 (arr!28698 (Array (_ BitVec 32) (_ BitVec 64))) (size!29177 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59659)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966566 (= res!646991 (and (= (size!29176 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29177 _keys!1686) (size!29176 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!646988 () Bool)

(assert (=> start!82854 (=> (not res!646988) (not e!544869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82854 (= res!646988 (validMask!0 mask!2110))))

(assert (=> start!82854 e!544869))

(assert (=> start!82854 true))

(declare-fun e!544870 () Bool)

(declare-fun array_inv!22227 (array!59657) Bool)

(assert (=> start!82854 (and (array_inv!22227 _values!1400) e!544870)))

(declare-fun array_inv!22228 (array!59659) Bool)

(assert (=> start!82854 (array_inv!22228 _keys!1686)))

(assert (=> start!82854 tp!66072))

(assert (=> start!82854 tp_is_empty!21789))

(declare-fun b!966567 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966567 (= e!544869 (and (bvsgt from!2084 newFrom!159) (bvsle from!2084 #b00000000000000000000000000000000)))))

(declare-fun b!966568 () Bool)

(declare-fun res!646989 () Bool)

(assert (=> b!966568 (=> (not res!646989) (not e!544869))))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966568 (= res!646989 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29177 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29177 _keys!1686))))))

(declare-fun b!966569 () Bool)

(declare-fun res!646992 () Bool)

(assert (=> b!966569 (=> (not res!646992) (not e!544869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59659 (_ BitVec 32)) Bool)

(assert (=> b!966569 (= res!646992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966570 () Bool)

(declare-fun e!544868 () Bool)

(assert (=> b!966570 (= e!544868 tp_is_empty!21789)))

(declare-fun mapNonEmpty!34678 () Bool)

(declare-fun tp!66071 () Bool)

(assert (=> mapNonEmpty!34678 (= mapRes!34678 (and tp!66071 e!544868))))

(declare-fun mapValue!34678 () ValueCell!10413)

(declare-fun mapKey!34678 () (_ BitVec 32))

(declare-fun mapRest!34678 () (Array (_ BitVec 32) ValueCell!10413))

(assert (=> mapNonEmpty!34678 (= (arr!28697 _values!1400) (store mapRest!34678 mapKey!34678 mapValue!34678))))

(declare-fun b!966571 () Bool)

(assert (=> b!966571 (= e!544870 (and e!544867 mapRes!34678))))

(declare-fun condMapEmpty!34678 () Bool)

(declare-fun mapDefault!34678 () ValueCell!10413)

(assert (=> b!966571 (= condMapEmpty!34678 (= (arr!28697 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10413)) mapDefault!34678)))))

(declare-fun b!966572 () Bool)

(declare-fun res!646993 () Bool)

(assert (=> b!966572 (=> (not res!646993) (not e!544869))))

(declare-datatypes ((List!19919 0))(
  ( (Nil!19916) (Cons!19915 (h!21077 (_ BitVec 64)) (t!28282 List!19919)) )
))
(declare-fun arrayNoDuplicates!0 (array!59659 (_ BitVec 32) List!19919) Bool)

(assert (=> b!966572 (= res!646993 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19916))))

(declare-fun b!966573 () Bool)

(declare-fun res!646987 () Bool)

(assert (=> b!966573 (=> (not res!646987) (not e!544869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966573 (= res!646987 (validKeyInArray!0 (select (arr!28698 _keys!1686) i!803)))))

(declare-fun b!966574 () Bool)

(declare-fun res!646990 () Bool)

(assert (=> b!966574 (=> (not res!646990) (not e!544869))))

(declare-fun minValue!1342 () V!34035)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34035)

(declare-datatypes ((tuple2!14074 0))(
  ( (tuple2!14075 (_1!7048 (_ BitVec 64)) (_2!7048 V!34035)) )
))
(declare-datatypes ((List!19920 0))(
  ( (Nil!19917) (Cons!19916 (h!21078 tuple2!14074) (t!28283 List!19920)) )
))
(declare-datatypes ((ListLongMap!12771 0))(
  ( (ListLongMap!12772 (toList!6401 List!19920)) )
))
(declare-fun contains!5502 (ListLongMap!12771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3634 (array!59659 array!59657 (_ BitVec 32) (_ BitVec 32) V!34035 V!34035 (_ BitVec 32) Int) ListLongMap!12771)

(assert (=> b!966574 (= res!646990 (contains!5502 (getCurrentListMap!3634 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28698 _keys!1686) i!803)))))

(assert (= (and start!82854 res!646988) b!966566))

(assert (= (and b!966566 res!646991) b!966569))

(assert (= (and b!966569 res!646992) b!966572))

(assert (= (and b!966572 res!646993) b!966568))

(assert (= (and b!966568 res!646989) b!966573))

(assert (= (and b!966573 res!646987) b!966574))

(assert (= (and b!966574 res!646990) b!966567))

(assert (= (and b!966571 condMapEmpty!34678) mapIsEmpty!34678))

(assert (= (and b!966571 (not condMapEmpty!34678)) mapNonEmpty!34678))

(get-info :version)

(assert (= (and mapNonEmpty!34678 ((_ is ValueCellFull!10413) mapValue!34678)) b!966570))

(assert (= (and b!966571 ((_ is ValueCellFull!10413) mapDefault!34678)) b!966565))

(assert (= start!82854 b!966571))

(declare-fun m!895319 () Bool)

(assert (=> b!966574 m!895319))

(declare-fun m!895321 () Bool)

(assert (=> b!966574 m!895321))

(assert (=> b!966574 m!895319))

(assert (=> b!966574 m!895321))

(declare-fun m!895323 () Bool)

(assert (=> b!966574 m!895323))

(declare-fun m!895325 () Bool)

(assert (=> b!966572 m!895325))

(declare-fun m!895327 () Bool)

(assert (=> b!966569 m!895327))

(assert (=> b!966573 m!895321))

(assert (=> b!966573 m!895321))

(declare-fun m!895329 () Bool)

(assert (=> b!966573 m!895329))

(declare-fun m!895331 () Bool)

(assert (=> mapNonEmpty!34678 m!895331))

(declare-fun m!895333 () Bool)

(assert (=> start!82854 m!895333))

(declare-fun m!895335 () Bool)

(assert (=> start!82854 m!895335))

(declare-fun m!895337 () Bool)

(assert (=> start!82854 m!895337))

(check-sat (not start!82854) (not b!966574) (not b_next!18981) b_and!30469 (not mapNonEmpty!34678) (not b!966569) (not b!966572) (not b!966573) tp_is_empty!21789)
(check-sat b_and!30469 (not b_next!18981))
