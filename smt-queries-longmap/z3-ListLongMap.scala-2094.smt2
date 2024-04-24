; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35718 () Bool)

(assert start!35718)

(declare-fun b!358834 () Bool)

(declare-fun e!219733 () Bool)

(declare-datatypes ((array!19908 0))(
  ( (array!19909 (arr!9447 (Array (_ BitVec 32) (_ BitVec 64))) (size!9799 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19908)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358834 (= e!219733 (not (validKeyInArray!0 (select (arr!9447 _keys!1456) from!1805))))))

(declare-fun b!358835 () Bool)

(declare-fun res!199462 () Bool)

(assert (=> b!358835 (=> (not res!199462) (not e!219733))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11891 0))(
  ( (V!11892 (val!4137 Int)) )
))
(declare-datatypes ((ValueCell!3749 0))(
  ( (ValueCellFull!3749 (v!6332 V!11891)) (EmptyCell!3749) )
))
(declare-datatypes ((array!19910 0))(
  ( (array!19911 (arr!9448 (Array (_ BitVec 32) ValueCell!3749)) (size!9800 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19910)

(assert (=> b!358835 (= res!199462 (and (= (size!9800 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9799 _keys!1456) (size!9800 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358836 () Bool)

(declare-fun e!219732 () Bool)

(declare-fun tp_is_empty!8185 () Bool)

(assert (=> b!358836 (= e!219732 tp_is_empty!8185)))

(declare-fun b!358837 () Bool)

(declare-fun res!199460 () Bool)

(assert (=> b!358837 (=> (not res!199460) (not e!219733))))

(declare-datatypes ((List!5357 0))(
  ( (Nil!5354) (Cons!5353 (h!6209 (_ BitVec 64)) (t!10499 List!5357)) )
))
(declare-fun arrayNoDuplicates!0 (array!19908 (_ BitVec 32) List!5357) Bool)

(assert (=> b!358837 (= res!199460 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5354))))

(declare-fun b!358838 () Bool)

(declare-fun res!199455 () Bool)

(assert (=> b!358838 (=> (not res!199455) (not e!219733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19908 (_ BitVec 32)) Bool)

(assert (=> b!358838 (= res!199455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13785 () Bool)

(declare-fun mapRes!13785 () Bool)

(assert (=> mapIsEmpty!13785 mapRes!13785))

(declare-fun b!358839 () Bool)

(declare-fun res!199461 () Bool)

(assert (=> b!358839 (=> (not res!199461) (not e!219733))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!358839 (= res!199461 (validKeyInArray!0 k0!1077))))

(declare-fun b!358840 () Bool)

(declare-fun res!199458 () Bool)

(assert (=> b!358840 (=> (not res!199458) (not e!219733))))

(declare-fun arrayContainsKey!0 (array!19908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358840 (= res!199458 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358841 () Bool)

(declare-fun res!199459 () Bool)

(assert (=> b!358841 (=> (not res!199459) (not e!219733))))

(assert (=> b!358841 (= res!199459 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9799 _keys!1456))))))

(declare-fun b!358842 () Bool)

(declare-fun e!219731 () Bool)

(assert (=> b!358842 (= e!219731 tp_is_empty!8185)))

(declare-fun b!358843 () Bool)

(declare-fun e!219730 () Bool)

(assert (=> b!358843 (= e!219730 (and e!219732 mapRes!13785))))

(declare-fun condMapEmpty!13785 () Bool)

(declare-fun mapDefault!13785 () ValueCell!3749)

(assert (=> b!358843 (= condMapEmpty!13785 (= (arr!9448 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3749)) mapDefault!13785)))))

(declare-fun b!358844 () Bool)

(declare-fun res!199457 () Bool)

(assert (=> b!358844 (=> (not res!199457) (not e!219733))))

(assert (=> b!358844 (= res!199457 (= (select (arr!9447 _keys!1456) from!1805) k0!1077))))

(declare-fun mapNonEmpty!13785 () Bool)

(declare-fun tp!27843 () Bool)

(assert (=> mapNonEmpty!13785 (= mapRes!13785 (and tp!27843 e!219731))))

(declare-fun mapRest!13785 () (Array (_ BitVec 32) ValueCell!3749))

(declare-fun mapValue!13785 () ValueCell!3749)

(declare-fun mapKey!13785 () (_ BitVec 32))

(assert (=> mapNonEmpty!13785 (= (arr!9448 _values!1208) (store mapRest!13785 mapKey!13785 mapValue!13785))))

(declare-fun res!199456 () Bool)

(assert (=> start!35718 (=> (not res!199456) (not e!219733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35718 (= res!199456 (validMask!0 mask!1842))))

(assert (=> start!35718 e!219733))

(assert (=> start!35718 true))

(declare-fun array_inv!6984 (array!19908) Bool)

(assert (=> start!35718 (array_inv!6984 _keys!1456)))

(declare-fun array_inv!6985 (array!19910) Bool)

(assert (=> start!35718 (and (array_inv!6985 _values!1208) e!219730)))

(assert (= (and start!35718 res!199456) b!358835))

(assert (= (and b!358835 res!199462) b!358838))

(assert (= (and b!358838 res!199455) b!358837))

(assert (= (and b!358837 res!199460) b!358839))

(assert (= (and b!358839 res!199461) b!358841))

(assert (= (and b!358841 res!199459) b!358840))

(assert (= (and b!358840 res!199458) b!358844))

(assert (= (and b!358844 res!199457) b!358834))

(assert (= (and b!358843 condMapEmpty!13785) mapIsEmpty!13785))

(assert (= (and b!358843 (not condMapEmpty!13785)) mapNonEmpty!13785))

(get-info :version)

(assert (= (and mapNonEmpty!13785 ((_ is ValueCellFull!3749) mapValue!13785)) b!358842))

(assert (= (and b!358843 ((_ is ValueCellFull!3749) mapDefault!13785)) b!358836))

(assert (= start!35718 b!358843))

(declare-fun m!356787 () Bool)

(assert (=> start!35718 m!356787))

(declare-fun m!356789 () Bool)

(assert (=> start!35718 m!356789))

(declare-fun m!356791 () Bool)

(assert (=> start!35718 m!356791))

(declare-fun m!356793 () Bool)

(assert (=> b!358834 m!356793))

(assert (=> b!358834 m!356793))

(declare-fun m!356795 () Bool)

(assert (=> b!358834 m!356795))

(declare-fun m!356797 () Bool)

(assert (=> b!358837 m!356797))

(declare-fun m!356799 () Bool)

(assert (=> b!358840 m!356799))

(declare-fun m!356801 () Bool)

(assert (=> mapNonEmpty!13785 m!356801))

(declare-fun m!356803 () Bool)

(assert (=> b!358838 m!356803))

(assert (=> b!358844 m!356793))

(declare-fun m!356805 () Bool)

(assert (=> b!358839 m!356805))

(check-sat (not start!35718) (not b!358837) (not b!358839) (not mapNonEmpty!13785) tp_is_empty!8185 (not b!358838) (not b!358834) (not b!358840))
(check-sat)
