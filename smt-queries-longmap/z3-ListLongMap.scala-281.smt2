; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4564 () Bool)

(assert start!4564)

(declare-fun b_free!1273 () Bool)

(declare-fun b_next!1273 () Bool)

(assert (=> start!4564 (= b_free!1273 (not b_next!1273))))

(declare-fun tp!5266 () Bool)

(declare-fun b_and!2095 () Bool)

(assert (=> start!4564 (= tp!5266 b_and!2095)))

(declare-fun b!35682 () Bool)

(declare-fun res!21648 () Bool)

(declare-fun e!22538 () Bool)

(assert (=> b!35682 (=> (not res!21648) (not e!22538))))

(declare-datatypes ((array!2445 0))(
  ( (array!2446 (arr!1167 (Array (_ BitVec 32) (_ BitVec 64))) (size!1268 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2445)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35682 (= res!21648 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35683 () Bool)

(declare-fun res!21650 () Bool)

(declare-fun e!22541 () Bool)

(assert (=> b!35683 (=> (not res!21650) (not e!22541))))

(declare-datatypes ((List!934 0))(
  ( (Nil!931) (Cons!930 (h!1497 (_ BitVec 64)) (t!3638 List!934)) )
))
(declare-fun arrayNoDuplicates!0 (array!2445 (_ BitVec 32) List!934) Bool)

(assert (=> b!35683 (= res!21650 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!931))))

(declare-fun b!35684 () Bool)

(assert (=> b!35684 (= e!22541 e!22538)))

(declare-fun res!21644 () Bool)

(assert (=> b!35684 (=> (not res!21644) (not e!22538))))

(declare-datatypes ((V!1995 0))(
  ( (V!1996 (val!840 Int)) )
))
(declare-datatypes ((tuple2!1350 0))(
  ( (tuple2!1351 (_1!686 (_ BitVec 64)) (_2!686 V!1995)) )
))
(declare-datatypes ((List!935 0))(
  ( (Nil!932) (Cons!931 (h!1498 tuple2!1350) (t!3639 List!935)) )
))
(declare-datatypes ((ListLongMap!915 0))(
  ( (ListLongMap!916 (toList!473 List!935)) )
))
(declare-fun lt!13189 () ListLongMap!915)

(declare-fun contains!423 (ListLongMap!915 (_ BitVec 64)) Bool)

(assert (=> b!35684 (= res!21644 (not (contains!423 lt!13189 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!614 0))(
  ( (ValueCellFull!614 (v!1937 V!1995)) (EmptyCell!614) )
))
(declare-datatypes ((array!2447 0))(
  ( (array!2448 (arr!1168 (Array (_ BitVec 32) ValueCell!614)) (size!1269 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2447)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1995)

(declare-fun minValue!1443 () V!1995)

(declare-fun getCurrentListMap!292 (array!2445 array!2447 (_ BitVec 32) (_ BitVec 32) V!1995 V!1995 (_ BitVec 32) Int) ListLongMap!915)

(assert (=> b!35684 (= lt!13189 (getCurrentListMap!292 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1996 () Bool)

(declare-fun mapRes!1996 () Bool)

(declare-fun tp!5265 () Bool)

(declare-fun e!22539 () Bool)

(assert (=> mapNonEmpty!1996 (= mapRes!1996 (and tp!5265 e!22539))))

(declare-fun mapRest!1996 () (Array (_ BitVec 32) ValueCell!614))

(declare-fun mapKey!1996 () (_ BitVec 32))

(declare-fun mapValue!1996 () ValueCell!614)

(assert (=> mapNonEmpty!1996 (= (arr!1168 _values!1501) (store mapRest!1996 mapKey!1996 mapValue!1996))))

(declare-fun b!35685 () Bool)

(declare-fun res!21649 () Bool)

(assert (=> b!35685 (=> (not res!21649) (not e!22541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35685 (= res!21649 (validKeyInArray!0 k0!1304))))

(declare-fun b!35686 () Bool)

(declare-fun e!22536 () Bool)

(declare-fun e!22540 () Bool)

(assert (=> b!35686 (= e!22536 (and e!22540 mapRes!1996))))

(declare-fun condMapEmpty!1996 () Bool)

(declare-fun mapDefault!1996 () ValueCell!614)

(assert (=> b!35686 (= condMapEmpty!1996 (= (arr!1168 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!614)) mapDefault!1996)))))

(declare-fun b!35687 () Bool)

(declare-fun e!22535 () Bool)

(assert (=> b!35687 (= e!22535 (not true))))

(declare-datatypes ((SeekEntryResult!168 0))(
  ( (MissingZero!168 (index!2794 (_ BitVec 32))) (Found!168 (index!2795 (_ BitVec 32))) (Intermediate!168 (undefined!980 Bool) (index!2796 (_ BitVec 32)) (x!7048 (_ BitVec 32))) (Undefined!168) (MissingVacant!168 (index!2797 (_ BitVec 32))) )
))
(declare-fun lt!13190 () SeekEntryResult!168)

(assert (=> b!35687 (contains!423 lt!13189 (select (arr!1167 _keys!1833) (index!2795 lt!13190)))))

(declare-datatypes ((Unit!791 0))(
  ( (Unit!792) )
))
(declare-fun lt!13191 () Unit!791)

(declare-fun lemmaValidKeyInArrayIsInListMap!70 (array!2445 array!2447 (_ BitVec 32) (_ BitVec 32) V!1995 V!1995 (_ BitVec 32) Int) Unit!791)

(assert (=> b!35687 (= lt!13191 (lemmaValidKeyInArrayIsInListMap!70 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2795 lt!13190) defaultEntry!1504))))

(declare-fun res!21647 () Bool)

(assert (=> start!4564 (=> (not res!21647) (not e!22541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4564 (= res!21647 (validMask!0 mask!2294))))

(assert (=> start!4564 e!22541))

(assert (=> start!4564 true))

(assert (=> start!4564 tp!5266))

(declare-fun array_inv!823 (array!2447) Bool)

(assert (=> start!4564 (and (array_inv!823 _values!1501) e!22536)))

(declare-fun array_inv!824 (array!2445) Bool)

(assert (=> start!4564 (array_inv!824 _keys!1833)))

(declare-fun tp_is_empty!1627 () Bool)

(assert (=> start!4564 tp_is_empty!1627))

(declare-fun mapIsEmpty!1996 () Bool)

(assert (=> mapIsEmpty!1996 mapRes!1996))

(declare-fun b!35688 () Bool)

(assert (=> b!35688 (= e!22539 tp_is_empty!1627)))

(declare-fun b!35689 () Bool)

(declare-fun res!21645 () Bool)

(assert (=> b!35689 (=> (not res!21645) (not e!22541))))

(assert (=> b!35689 (= res!21645 (and (= (size!1269 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1268 _keys!1833) (size!1269 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35690 () Bool)

(declare-fun res!21646 () Bool)

(assert (=> b!35690 (=> (not res!21646) (not e!22541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2445 (_ BitVec 32)) Bool)

(assert (=> b!35690 (= res!21646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35691 () Bool)

(assert (=> b!35691 (= e!22540 tp_is_empty!1627)))

(declare-fun b!35692 () Bool)

(assert (=> b!35692 (= e!22538 e!22535)))

(declare-fun res!21643 () Bool)

(assert (=> b!35692 (=> (not res!21643) (not e!22535))))

(get-info :version)

(assert (=> b!35692 (= res!21643 ((_ is Found!168) lt!13190))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2445 (_ BitVec 32)) SeekEntryResult!168)

(assert (=> b!35692 (= lt!13190 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(assert (= (and start!4564 res!21647) b!35689))

(assert (= (and b!35689 res!21645) b!35690))

(assert (= (and b!35690 res!21646) b!35683))

(assert (= (and b!35683 res!21650) b!35685))

(assert (= (and b!35685 res!21649) b!35684))

(assert (= (and b!35684 res!21644) b!35682))

(assert (= (and b!35682 res!21648) b!35692))

(assert (= (and b!35692 res!21643) b!35687))

(assert (= (and b!35686 condMapEmpty!1996) mapIsEmpty!1996))

(assert (= (and b!35686 (not condMapEmpty!1996)) mapNonEmpty!1996))

(assert (= (and mapNonEmpty!1996 ((_ is ValueCellFull!614) mapValue!1996)) b!35688))

(assert (= (and b!35686 ((_ is ValueCellFull!614) mapDefault!1996)) b!35691))

(assert (= start!4564 b!35686))

(declare-fun m!28655 () Bool)

(assert (=> b!35687 m!28655))

(assert (=> b!35687 m!28655))

(declare-fun m!28657 () Bool)

(assert (=> b!35687 m!28657))

(declare-fun m!28659 () Bool)

(assert (=> b!35687 m!28659))

(declare-fun m!28661 () Bool)

(assert (=> b!35690 m!28661))

(declare-fun m!28663 () Bool)

(assert (=> b!35682 m!28663))

(declare-fun m!28665 () Bool)

(assert (=> b!35683 m!28665))

(declare-fun m!28667 () Bool)

(assert (=> b!35692 m!28667))

(declare-fun m!28669 () Bool)

(assert (=> b!35684 m!28669))

(declare-fun m!28671 () Bool)

(assert (=> b!35684 m!28671))

(declare-fun m!28673 () Bool)

(assert (=> start!4564 m!28673))

(declare-fun m!28675 () Bool)

(assert (=> start!4564 m!28675))

(declare-fun m!28677 () Bool)

(assert (=> start!4564 m!28677))

(declare-fun m!28679 () Bool)

(assert (=> mapNonEmpty!1996 m!28679))

(declare-fun m!28681 () Bool)

(assert (=> b!35685 m!28681))

(check-sat tp_is_empty!1627 (not b!35685) b_and!2095 (not b_next!1273) (not b!35687) (not b!35692) (not b!35690) (not b!35682) (not b!35683) (not start!4564) (not mapNonEmpty!1996) (not b!35684))
(check-sat b_and!2095 (not b_next!1273))
