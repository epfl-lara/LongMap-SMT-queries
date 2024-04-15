; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82522 () Bool)

(assert start!82522)

(declare-fun b_free!18673 () Bool)

(declare-fun b_next!18673 () Bool)

(assert (=> start!82522 (= b_free!18673 (not b_next!18673))))

(declare-fun tp!65139 () Bool)

(declare-fun b_and!30135 () Bool)

(assert (=> start!82522 (= tp!65139 b_and!30135)))

(declare-fun b!961632 () Bool)

(declare-fun e!542283 () Bool)

(declare-fun tp_is_empty!21475 () Bool)

(assert (=> b!961632 (= e!542283 tp_is_empty!21475)))

(declare-fun b!961633 () Bool)

(declare-fun e!542285 () Bool)

(declare-fun e!542287 () Bool)

(declare-fun mapRes!34207 () Bool)

(assert (=> b!961633 (= e!542285 (and e!542287 mapRes!34207))))

(declare-fun condMapEmpty!34207 () Bool)

(declare-datatypes ((V!33617 0))(
  ( (V!33618 (val!10788 Int)) )
))
(declare-datatypes ((ValueCell!10256 0))(
  ( (ValueCellFull!10256 (v!13345 V!33617)) (EmptyCell!10256) )
))
(declare-datatypes ((array!58978 0))(
  ( (array!58979 (arr!28358 (Array (_ BitVec 32) ValueCell!10256)) (size!28839 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58978)

(declare-fun mapDefault!34207 () ValueCell!10256)

(assert (=> b!961633 (= condMapEmpty!34207 (= (arr!28358 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10256)) mapDefault!34207)))))

(declare-fun b!961634 () Bool)

(assert (=> b!961634 (= e!542287 tp_is_empty!21475)))

(declare-fun b!961635 () Bool)

(declare-fun res!643601 () Bool)

(declare-fun e!542284 () Bool)

(assert (=> b!961635 (=> (not res!643601) (not e!542284))))

(declare-datatypes ((array!58980 0))(
  ( (array!58981 (arr!28359 (Array (_ BitVec 32) (_ BitVec 64))) (size!28840 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58980)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961635 (= res!643601 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28840 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28840 _keys!1686))))))

(declare-fun b!961636 () Bool)

(declare-fun res!643600 () Bool)

(assert (=> b!961636 (=> (not res!643600) (not e!542284))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961636 (= res!643600 (and (= (size!28839 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28840 _keys!1686) (size!28839 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34207 () Bool)

(declare-fun tp!65140 () Bool)

(assert (=> mapNonEmpty!34207 (= mapRes!34207 (and tp!65140 e!542283))))

(declare-fun mapKey!34207 () (_ BitVec 32))

(declare-fun mapValue!34207 () ValueCell!10256)

(declare-fun mapRest!34207 () (Array (_ BitVec 32) ValueCell!10256))

(assert (=> mapNonEmpty!34207 (= (arr!28358 _values!1400) (store mapRest!34207 mapKey!34207 mapValue!34207))))

(declare-fun res!643596 () Bool)

(assert (=> start!82522 (=> (not res!643596) (not e!542284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82522 (= res!643596 (validMask!0 mask!2110))))

(assert (=> start!82522 e!542284))

(assert (=> start!82522 true))

(declare-fun array_inv!22031 (array!58978) Bool)

(assert (=> start!82522 (and (array_inv!22031 _values!1400) e!542285)))

(declare-fun array_inv!22032 (array!58980) Bool)

(assert (=> start!82522 (array_inv!22032 _keys!1686)))

(assert (=> start!82522 tp!65139))

(assert (=> start!82522 tp_is_empty!21475))

(declare-fun b!961637 () Bool)

(assert (=> b!961637 (= e!542284 false)))

(declare-fun minValue!1342 () V!33617)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430577 () Bool)

(declare-fun zeroValue!1342 () V!33617)

(declare-datatypes ((tuple2!13912 0))(
  ( (tuple2!13913 (_1!6967 (_ BitVec 64)) (_2!6967 V!33617)) )
))
(declare-datatypes ((List!19719 0))(
  ( (Nil!19716) (Cons!19715 (h!20877 tuple2!13912) (t!28073 List!19719)) )
))
(declare-datatypes ((ListLongMap!12599 0))(
  ( (ListLongMap!12600 (toList!6315 List!19719)) )
))
(declare-fun contains!5362 (ListLongMap!12599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3477 (array!58980 array!58978 (_ BitVec 32) (_ BitVec 32) V!33617 V!33617 (_ BitVec 32) Int) ListLongMap!12599)

(assert (=> b!961637 (= lt!430577 (contains!5362 (getCurrentListMap!3477 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28359 _keys!1686) i!803)))))

(declare-fun b!961638 () Bool)

(declare-fun res!643599 () Bool)

(assert (=> b!961638 (=> (not res!643599) (not e!542284))))

(declare-datatypes ((List!19720 0))(
  ( (Nil!19717) (Cons!19716 (h!20878 (_ BitVec 64)) (t!28074 List!19720)) )
))
(declare-fun arrayNoDuplicates!0 (array!58980 (_ BitVec 32) List!19720) Bool)

(assert (=> b!961638 (= res!643599 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19717))))

(declare-fun b!961639 () Bool)

(declare-fun res!643598 () Bool)

(assert (=> b!961639 (=> (not res!643598) (not e!542284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961639 (= res!643598 (validKeyInArray!0 (select (arr!28359 _keys!1686) i!803)))))

(declare-fun b!961640 () Bool)

(declare-fun res!643597 () Bool)

(assert (=> b!961640 (=> (not res!643597) (not e!542284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58980 (_ BitVec 32)) Bool)

(assert (=> b!961640 (= res!643597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34207 () Bool)

(assert (=> mapIsEmpty!34207 mapRes!34207))

(assert (= (and start!82522 res!643596) b!961636))

(assert (= (and b!961636 res!643600) b!961640))

(assert (= (and b!961640 res!643597) b!961638))

(assert (= (and b!961638 res!643599) b!961635))

(assert (= (and b!961635 res!643601) b!961639))

(assert (= (and b!961639 res!643598) b!961637))

(assert (= (and b!961633 condMapEmpty!34207) mapIsEmpty!34207))

(assert (= (and b!961633 (not condMapEmpty!34207)) mapNonEmpty!34207))

(get-info :version)

(assert (= (and mapNonEmpty!34207 ((_ is ValueCellFull!10256) mapValue!34207)) b!961632))

(assert (= (and b!961633 ((_ is ValueCellFull!10256) mapDefault!34207)) b!961634))

(assert (= start!82522 b!961633))

(declare-fun m!890911 () Bool)

(assert (=> b!961640 m!890911))

(declare-fun m!890913 () Bool)

(assert (=> start!82522 m!890913))

(declare-fun m!890915 () Bool)

(assert (=> start!82522 m!890915))

(declare-fun m!890917 () Bool)

(assert (=> start!82522 m!890917))

(declare-fun m!890919 () Bool)

(assert (=> b!961639 m!890919))

(assert (=> b!961639 m!890919))

(declare-fun m!890921 () Bool)

(assert (=> b!961639 m!890921))

(declare-fun m!890923 () Bool)

(assert (=> mapNonEmpty!34207 m!890923))

(declare-fun m!890925 () Bool)

(assert (=> b!961637 m!890925))

(assert (=> b!961637 m!890919))

(assert (=> b!961637 m!890925))

(assert (=> b!961637 m!890919))

(declare-fun m!890927 () Bool)

(assert (=> b!961637 m!890927))

(declare-fun m!890929 () Bool)

(assert (=> b!961638 m!890929))

(check-sat (not b!961638) (not b!961637) (not start!82522) b_and!30135 (not b_next!18673) (not b!961639) (not b!961640) tp_is_empty!21475 (not mapNonEmpty!34207))
(check-sat b_and!30135 (not b_next!18673))
