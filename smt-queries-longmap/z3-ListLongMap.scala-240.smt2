; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4124 () Bool)

(assert start!4124)

(declare-fun b_free!1029 () Bool)

(declare-fun b_next!1029 () Bool)

(assert (=> start!4124 (= b_free!1029 (not b_next!1029))))

(declare-fun tp!4506 () Bool)

(declare-fun b_and!1839 () Bool)

(assert (=> start!4124 (= tp!4506 b_and!1839)))

(declare-fun b!30839 () Bool)

(declare-fun res!18632 () Bool)

(declare-fun e!19755 () Bool)

(assert (=> b!30839 (=> (not res!18632) (not e!19755))))

(declare-datatypes ((array!1991 0))(
  ( (array!1992 (arr!949 (Array (_ BitVec 32) (_ BitVec 64))) (size!1050 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1991)

(declare-datatypes ((List!772 0))(
  ( (Nil!769) (Cons!768 (h!1335 (_ BitVec 64)) (t!3465 List!772)) )
))
(declare-fun arrayNoDuplicates!0 (array!1991 (_ BitVec 32) List!772) Bool)

(assert (=> b!30839 (= res!18632 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!769))))

(declare-fun b!30840 () Bool)

(declare-fun e!19758 () Bool)

(declare-fun tp_is_empty!1383 () Bool)

(assert (=> b!30840 (= e!19758 tp_is_empty!1383)))

(declare-fun b!30841 () Bool)

(declare-fun e!19759 () Bool)

(declare-fun e!19754 () Bool)

(assert (=> b!30841 (= e!19759 e!19754)))

(declare-fun res!18629 () Bool)

(assert (=> b!30841 (=> (not res!18629) (not e!19754))))

(declare-datatypes ((SeekEntryResult!111 0))(
  ( (MissingZero!111 (index!2566 (_ BitVec 32))) (Found!111 (index!2567 (_ BitVec 32))) (Intermediate!111 (undefined!923 Bool) (index!2568 (_ BitVec 32)) (x!6573 (_ BitVec 32))) (Undefined!111) (MissingVacant!111 (index!2569 (_ BitVec 32))) )
))
(declare-fun lt!11489 () SeekEntryResult!111)

(get-info :version)

(assert (=> b!30841 (= res!18629 ((_ is Found!111) lt!11489))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1991 (_ BitVec 32)) SeekEntryResult!111)

(assert (=> b!30841 (= lt!11489 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30842 () Bool)

(assert (=> b!30842 (= e!19754 (not true))))

(declare-datatypes ((V!1669 0))(
  ( (V!1670 (val!718 Int)) )
))
(declare-datatypes ((tuple2!1178 0))(
  ( (tuple2!1179 (_1!600 (_ BitVec 64)) (_2!600 V!1669)) )
))
(declare-datatypes ((List!773 0))(
  ( (Nil!770) (Cons!769 (h!1336 tuple2!1178) (t!3466 List!773)) )
))
(declare-datatypes ((ListLongMap!755 0))(
  ( (ListLongMap!756 (toList!393 List!773)) )
))
(declare-fun lt!11488 () ListLongMap!755)

(declare-fun contains!333 (ListLongMap!755 (_ BitVec 64)) Bool)

(assert (=> b!30842 (contains!333 lt!11488 (select (arr!949 _keys!1833) (index!2567 lt!11489)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!492 0))(
  ( (ValueCellFull!492 (v!1807 V!1669)) (EmptyCell!492) )
))
(declare-datatypes ((array!1993 0))(
  ( (array!1994 (arr!950 (Array (_ BitVec 32) ValueCell!492)) (size!1051 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1993)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!691 0))(
  ( (Unit!692) )
))
(declare-fun lt!11487 () Unit!691)

(declare-fun zeroValue!1443 () V!1669)

(declare-fun minValue!1443 () V!1669)

(declare-fun lemmaValidKeyInArrayIsInListMap!39 (array!1991 array!1993 (_ BitVec 32) (_ BitVec 32) V!1669 V!1669 (_ BitVec 32) Int) Unit!691)

(assert (=> b!30842 (= lt!11487 (lemmaValidKeyInArrayIsInListMap!39 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2567 lt!11489) defaultEntry!1504))))

(declare-fun b!30843 () Bool)

(declare-fun res!18633 () Bool)

(assert (=> b!30843 (=> (not res!18633) (not e!19755))))

(assert (=> b!30843 (= res!18633 (and (= (size!1051 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1050 _keys!1833) (size!1051 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30844 () Bool)

(declare-fun res!18628 () Bool)

(assert (=> b!30844 (=> (not res!18628) (not e!19755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1991 (_ BitVec 32)) Bool)

(assert (=> b!30844 (= res!18628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30845 () Bool)

(declare-fun e!19760 () Bool)

(declare-fun e!19757 () Bool)

(declare-fun mapRes!1603 () Bool)

(assert (=> b!30845 (= e!19760 (and e!19757 mapRes!1603))))

(declare-fun condMapEmpty!1603 () Bool)

(declare-fun mapDefault!1603 () ValueCell!492)

(assert (=> b!30845 (= condMapEmpty!1603 (= (arr!950 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!492)) mapDefault!1603)))))

(declare-fun b!30846 () Bool)

(assert (=> b!30846 (= e!19757 tp_is_empty!1383)))

(declare-fun b!30847 () Bool)

(assert (=> b!30847 (= e!19755 e!19759)))

(declare-fun res!18631 () Bool)

(assert (=> b!30847 (=> (not res!18631) (not e!19759))))

(assert (=> b!30847 (= res!18631 (not (contains!333 lt!11488 k0!1304)))))

(declare-fun getCurrentListMap!221 (array!1991 array!1993 (_ BitVec 32) (_ BitVec 32) V!1669 V!1669 (_ BitVec 32) Int) ListLongMap!755)

(assert (=> b!30847 (= lt!11488 (getCurrentListMap!221 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30848 () Bool)

(declare-fun res!18626 () Bool)

(assert (=> b!30848 (=> (not res!18626) (not e!19759))))

(declare-fun arrayContainsKey!0 (array!1991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30848 (= res!18626 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1603 () Bool)

(assert (=> mapIsEmpty!1603 mapRes!1603))

(declare-fun b!30849 () Bool)

(declare-fun res!18630 () Bool)

(assert (=> b!30849 (=> (not res!18630) (not e!19755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30849 (= res!18630 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1603 () Bool)

(declare-fun tp!4507 () Bool)

(assert (=> mapNonEmpty!1603 (= mapRes!1603 (and tp!4507 e!19758))))

(declare-fun mapValue!1603 () ValueCell!492)

(declare-fun mapKey!1603 () (_ BitVec 32))

(declare-fun mapRest!1603 () (Array (_ BitVec 32) ValueCell!492))

(assert (=> mapNonEmpty!1603 (= (arr!950 _values!1501) (store mapRest!1603 mapKey!1603 mapValue!1603))))

(declare-fun res!18627 () Bool)

(assert (=> start!4124 (=> (not res!18627) (not e!19755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4124 (= res!18627 (validMask!0 mask!2294))))

(assert (=> start!4124 e!19755))

(assert (=> start!4124 true))

(assert (=> start!4124 tp!4506))

(declare-fun array_inv!661 (array!1993) Bool)

(assert (=> start!4124 (and (array_inv!661 _values!1501) e!19760)))

(declare-fun array_inv!662 (array!1991) Bool)

(assert (=> start!4124 (array_inv!662 _keys!1833)))

(assert (=> start!4124 tp_is_empty!1383))

(assert (= (and start!4124 res!18627) b!30843))

(assert (= (and b!30843 res!18633) b!30844))

(assert (= (and b!30844 res!18628) b!30839))

(assert (= (and b!30839 res!18632) b!30849))

(assert (= (and b!30849 res!18630) b!30847))

(assert (= (and b!30847 res!18631) b!30848))

(assert (= (and b!30848 res!18626) b!30841))

(assert (= (and b!30841 res!18629) b!30842))

(assert (= (and b!30845 condMapEmpty!1603) mapIsEmpty!1603))

(assert (= (and b!30845 (not condMapEmpty!1603)) mapNonEmpty!1603))

(assert (= (and mapNonEmpty!1603 ((_ is ValueCellFull!492) mapValue!1603)) b!30840))

(assert (= (and b!30845 ((_ is ValueCellFull!492) mapDefault!1603)) b!30846))

(assert (= start!4124 b!30845))

(declare-fun m!24761 () Bool)

(assert (=> b!30849 m!24761))

(declare-fun m!24763 () Bool)

(assert (=> b!30847 m!24763))

(declare-fun m!24765 () Bool)

(assert (=> b!30847 m!24765))

(declare-fun m!24767 () Bool)

(assert (=> b!30848 m!24767))

(declare-fun m!24769 () Bool)

(assert (=> b!30839 m!24769))

(declare-fun m!24771 () Bool)

(assert (=> b!30841 m!24771))

(declare-fun m!24773 () Bool)

(assert (=> b!30844 m!24773))

(declare-fun m!24775 () Bool)

(assert (=> b!30842 m!24775))

(assert (=> b!30842 m!24775))

(declare-fun m!24777 () Bool)

(assert (=> b!30842 m!24777))

(declare-fun m!24779 () Bool)

(assert (=> b!30842 m!24779))

(declare-fun m!24781 () Bool)

(assert (=> mapNonEmpty!1603 m!24781))

(declare-fun m!24783 () Bool)

(assert (=> start!4124 m!24783))

(declare-fun m!24785 () Bool)

(assert (=> start!4124 m!24785))

(declare-fun m!24787 () Bool)

(assert (=> start!4124 m!24787))

(check-sat (not mapNonEmpty!1603) (not b!30849) (not b!30844) (not b!30842) b_and!1839 (not b!30848) (not b_next!1029) (not start!4124) (not b!30841) (not b!30839) tp_is_empty!1383 (not b!30847))
(check-sat b_and!1839 (not b_next!1029))
