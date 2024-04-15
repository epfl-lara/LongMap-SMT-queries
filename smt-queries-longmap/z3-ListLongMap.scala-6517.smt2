; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82924 () Bool)

(assert start!82924)

(declare-fun b_free!19069 () Bool)

(declare-fun b_next!19069 () Bool)

(assert (=> start!82924 (= b_free!19069 (not b_next!19069))))

(declare-fun tp!66337 () Bool)

(declare-fun b_and!30531 () Bool)

(assert (=> start!82924 (= tp!66337 b_and!30531)))

(declare-datatypes ((array!59758 0))(
  ( (array!59759 (arr!28748 (Array (_ BitVec 32) (_ BitVec 64))) (size!29229 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59758)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun b!967738 () Bool)

(declare-fun e!545379 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967738 (= e!545379 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29229 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001)) (bvslt (bvsub (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159) (bvsub from!2084 newFrom!159)))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34153 0))(
  ( (V!34154 (val!10989 Int)) )
))
(declare-datatypes ((ValueCell!10457 0))(
  ( (ValueCellFull!10457 (v!13546 V!34153)) (EmptyCell!10457) )
))
(declare-datatypes ((array!59760 0))(
  ( (array!59761 (arr!28749 (Array (_ BitVec 32) ValueCell!10457)) (size!29230 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59760)

(declare-fun minValue!1342 () V!34153)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34153)

(declare-datatypes ((tuple2!14216 0))(
  ( (tuple2!14217 (_1!7119 (_ BitVec 64)) (_2!7119 V!34153)) )
))
(declare-datatypes ((List!20015 0))(
  ( (Nil!20012) (Cons!20011 (h!21173 tuple2!14216) (t!28369 List!20015)) )
))
(declare-datatypes ((ListLongMap!12903 0))(
  ( (ListLongMap!12904 (toList!6467 List!20015)) )
))
(declare-fun contains!5512 (ListLongMap!12903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3629 (array!59758 array!59760 (_ BitVec 32) (_ BitVec 32) V!34153 V!34153 (_ BitVec 32) Int) ListLongMap!12903)

(assert (=> b!967738 (contains!5512 (getCurrentListMap!3629 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28748 _keys!1686) i!803))))

(declare-datatypes ((Unit!32220 0))(
  ( (Unit!32221) )
))
(declare-fun lt!431234 () Unit!32220)

(declare-fun lemmaInListMapFromThenInFromMinusOne!74 (array!59758 array!59760 (_ BitVec 32) (_ BitVec 32) V!34153 V!34153 (_ BitVec 32) (_ BitVec 32) Int) Unit!32220)

(assert (=> b!967738 (= lt!431234 (lemmaInListMapFromThenInFromMinusOne!74 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34810 () Bool)

(declare-fun mapRes!34810 () Bool)

(declare-fun tp!66336 () Bool)

(declare-fun e!545382 () Bool)

(assert (=> mapNonEmpty!34810 (= mapRes!34810 (and tp!66336 e!545382))))

(declare-fun mapKey!34810 () (_ BitVec 32))

(declare-fun mapRest!34810 () (Array (_ BitVec 32) ValueCell!10457))

(declare-fun mapValue!34810 () ValueCell!10457)

(assert (=> mapNonEmpty!34810 (= (arr!28749 _values!1400) (store mapRest!34810 mapKey!34810 mapValue!34810))))

(declare-fun b!967739 () Bool)

(declare-fun res!647893 () Bool)

(assert (=> b!967739 (=> (not res!647893) (not e!545379))))

(declare-datatypes ((List!20016 0))(
  ( (Nil!20013) (Cons!20012 (h!21174 (_ BitVec 64)) (t!28370 List!20016)) )
))
(declare-fun arrayNoDuplicates!0 (array!59758 (_ BitVec 32) List!20016) Bool)

(assert (=> b!967739 (= res!647893 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20013))))

(declare-fun b!967740 () Bool)

(declare-fun res!647900 () Bool)

(assert (=> b!967740 (=> (not res!647900) (not e!545379))))

(assert (=> b!967740 (= res!647900 (contains!5512 (getCurrentListMap!3629 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28748 _keys!1686) i!803)))))

(declare-fun b!967741 () Bool)

(declare-fun tp_is_empty!21877 () Bool)

(assert (=> b!967741 (= e!545382 tp_is_empty!21877)))

(declare-fun b!967742 () Bool)

(declare-fun e!545380 () Bool)

(declare-fun e!545383 () Bool)

(assert (=> b!967742 (= e!545380 (and e!545383 mapRes!34810))))

(declare-fun condMapEmpty!34810 () Bool)

(declare-fun mapDefault!34810 () ValueCell!10457)

(assert (=> b!967742 (= condMapEmpty!34810 (= (arr!28749 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10457)) mapDefault!34810)))))

(declare-fun res!647897 () Bool)

(assert (=> start!82924 (=> (not res!647897) (not e!545379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82924 (= res!647897 (validMask!0 mask!2110))))

(assert (=> start!82924 e!545379))

(assert (=> start!82924 true))

(declare-fun array_inv!22325 (array!59760) Bool)

(assert (=> start!82924 (and (array_inv!22325 _values!1400) e!545380)))

(declare-fun array_inv!22326 (array!59758) Bool)

(assert (=> start!82924 (array_inv!22326 _keys!1686)))

(assert (=> start!82924 tp!66337))

(assert (=> start!82924 tp_is_empty!21877))

(declare-fun b!967743 () Bool)

(declare-fun res!647894 () Bool)

(assert (=> b!967743 (=> (not res!647894) (not e!545379))))

(assert (=> b!967743 (= res!647894 (and (= (size!29230 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29229 _keys!1686) (size!29230 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967744 () Bool)

(declare-fun res!647895 () Bool)

(assert (=> b!967744 (=> (not res!647895) (not e!545379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967744 (= res!647895 (validKeyInArray!0 (select (arr!28748 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34810 () Bool)

(assert (=> mapIsEmpty!34810 mapRes!34810))

(declare-fun b!967745 () Bool)

(declare-fun res!647896 () Bool)

(assert (=> b!967745 (=> (not res!647896) (not e!545379))))

(assert (=> b!967745 (= res!647896 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967746 () Bool)

(declare-fun res!647898 () Bool)

(assert (=> b!967746 (=> (not res!647898) (not e!545379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59758 (_ BitVec 32)) Bool)

(assert (=> b!967746 (= res!647898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967747 () Bool)

(declare-fun res!647899 () Bool)

(assert (=> b!967747 (=> (not res!647899) (not e!545379))))

(assert (=> b!967747 (= res!647899 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29229 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29229 _keys!1686))))))

(declare-fun b!967748 () Bool)

(assert (=> b!967748 (= e!545383 tp_is_empty!21877)))

(assert (= (and start!82924 res!647897) b!967743))

(assert (= (and b!967743 res!647894) b!967746))

(assert (= (and b!967746 res!647898) b!967739))

(assert (= (and b!967739 res!647893) b!967747))

(assert (= (and b!967747 res!647899) b!967744))

(assert (= (and b!967744 res!647895) b!967740))

(assert (= (and b!967740 res!647900) b!967745))

(assert (= (and b!967745 res!647896) b!967738))

(assert (= (and b!967742 condMapEmpty!34810) mapIsEmpty!34810))

(assert (= (and b!967742 (not condMapEmpty!34810)) mapNonEmpty!34810))

(get-info :version)

(assert (= (and mapNonEmpty!34810 ((_ is ValueCellFull!10457) mapValue!34810)) b!967741))

(assert (= (and b!967742 ((_ is ValueCellFull!10457) mapDefault!34810)) b!967748))

(assert (= start!82924 b!967742))

(declare-fun m!895657 () Bool)

(assert (=> b!967744 m!895657))

(assert (=> b!967744 m!895657))

(declare-fun m!895659 () Bool)

(assert (=> b!967744 m!895659))

(declare-fun m!895661 () Bool)

(assert (=> b!967739 m!895661))

(declare-fun m!895663 () Bool)

(assert (=> mapNonEmpty!34810 m!895663))

(declare-fun m!895665 () Bool)

(assert (=> b!967746 m!895665))

(declare-fun m!895667 () Bool)

(assert (=> b!967738 m!895667))

(assert (=> b!967738 m!895657))

(assert (=> b!967738 m!895667))

(assert (=> b!967738 m!895657))

(declare-fun m!895669 () Bool)

(assert (=> b!967738 m!895669))

(declare-fun m!895671 () Bool)

(assert (=> b!967738 m!895671))

(declare-fun m!895673 () Bool)

(assert (=> start!82924 m!895673))

(declare-fun m!895675 () Bool)

(assert (=> start!82924 m!895675))

(declare-fun m!895677 () Bool)

(assert (=> start!82924 m!895677))

(declare-fun m!895679 () Bool)

(assert (=> b!967740 m!895679))

(assert (=> b!967740 m!895657))

(assert (=> b!967740 m!895679))

(assert (=> b!967740 m!895657))

(declare-fun m!895681 () Bool)

(assert (=> b!967740 m!895681))

(check-sat (not b_next!19069) (not mapNonEmpty!34810) (not b!967739) (not b!967740) (not b!967738) (not b!967744) tp_is_empty!21877 b_and!30531 (not b!967746) (not start!82924))
(check-sat b_and!30531 (not b_next!19069))
