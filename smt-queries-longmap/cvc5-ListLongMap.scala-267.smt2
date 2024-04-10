; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4400 () Bool)

(assert start!4400)

(declare-fun b_free!1189 () Bool)

(declare-fun b_next!1189 () Bool)

(assert (=> start!4400 (= b_free!1189 (not b_next!1189))))

(declare-fun tp!5002 () Bool)

(declare-fun b_and!2009 () Bool)

(assert (=> start!4400 (= tp!5002 b_and!2009)))

(declare-fun b!33902 () Bool)

(declare-fun e!21533 () Bool)

(assert (=> b!33902 (= e!21533 (not true))))

(declare-datatypes ((SeekEntryResult!133 0))(
  ( (MissingZero!133 (index!2654 (_ BitVec 32))) (Found!133 (index!2655 (_ BitVec 32))) (Intermediate!133 (undefined!945 Bool) (index!2656 (_ BitVec 32)) (x!6861 (_ BitVec 32))) (Undefined!133) (MissingVacant!133 (index!2657 (_ BitVec 32))) )
))
(declare-fun lt!12502 () SeekEntryResult!133)

(declare-fun lt!12505 () (_ BitVec 32))

(assert (=> b!33902 (and (is-Found!133 lt!12502) (= (index!2655 lt!12502) lt!12505))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((array!2301 0))(
  ( (array!2302 (arr!1099 (Array (_ BitVec 32) (_ BitVec 64))) (size!1200 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2301)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2301 (_ BitVec 32)) SeekEntryResult!133)

(assert (=> b!33902 (= lt!12502 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!760 0))(
  ( (Unit!761) )
))
(declare-fun lt!12503 () Unit!760)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2301 (_ BitVec 32)) Unit!760)

(assert (=> b!33902 (= lt!12503 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12505 _keys!1833 mask!2294))))

(declare-datatypes ((V!1883 0))(
  ( (V!1884 (val!798 Int)) )
))
(declare-datatypes ((tuple2!1298 0))(
  ( (tuple2!1299 (_1!660 (_ BitVec 64)) (_2!660 V!1883)) )
))
(declare-datatypes ((List!888 0))(
  ( (Nil!885) (Cons!884 (h!1451 tuple2!1298) (t!3591 List!888)) )
))
(declare-datatypes ((ListLongMap!875 0))(
  ( (ListLongMap!876 (toList!453 List!888)) )
))
(declare-fun lt!12504 () ListLongMap!875)

(declare-fun contains!398 (ListLongMap!875 (_ BitVec 64)) Bool)

(assert (=> b!33902 (contains!398 lt!12504 (select (arr!1099 _keys!1833) lt!12505))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!572 0))(
  ( (ValueCellFull!572 (v!1892 V!1883)) (EmptyCell!572) )
))
(declare-datatypes ((array!2303 0))(
  ( (array!2304 (arr!1100 (Array (_ BitVec 32) ValueCell!572)) (size!1201 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2303)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12506 () Unit!760)

(declare-fun zeroValue!1443 () V!1883)

(declare-fun minValue!1443 () V!1883)

(declare-fun lemmaValidKeyInArrayIsInListMap!65 (array!2301 array!2303 (_ BitVec 32) (_ BitVec 32) V!1883 V!1883 (_ BitVec 32) Int) Unit!760)

(assert (=> b!33902 (= lt!12506 (lemmaValidKeyInArrayIsInListMap!65 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12505 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2301 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33902 (= lt!12505 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33903 () Bool)

(declare-fun res!20564 () Bool)

(declare-fun e!21532 () Bool)

(assert (=> b!33903 (=> (not res!20564) (not e!21532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2301 (_ BitVec 32)) Bool)

(assert (=> b!33903 (= res!20564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33904 () Bool)

(declare-fun res!20559 () Bool)

(assert (=> b!33904 (=> (not res!20559) (not e!21532))))

(assert (=> b!33904 (= res!20559 (and (= (size!1201 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1200 _keys!1833) (size!1201 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1858 () Bool)

(declare-fun mapRes!1858 () Bool)

(assert (=> mapIsEmpty!1858 mapRes!1858))

(declare-fun b!33905 () Bool)

(declare-fun e!21530 () Bool)

(declare-fun tp_is_empty!1543 () Bool)

(assert (=> b!33905 (= e!21530 tp_is_empty!1543)))

(declare-fun res!20563 () Bool)

(assert (=> start!4400 (=> (not res!20563) (not e!21532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4400 (= res!20563 (validMask!0 mask!2294))))

(assert (=> start!4400 e!21532))

(assert (=> start!4400 true))

(assert (=> start!4400 tp!5002))

(declare-fun e!21531 () Bool)

(declare-fun array_inv!773 (array!2303) Bool)

(assert (=> start!4400 (and (array_inv!773 _values!1501) e!21531)))

(declare-fun array_inv!774 (array!2301) Bool)

(assert (=> start!4400 (array_inv!774 _keys!1833)))

(assert (=> start!4400 tp_is_empty!1543))

(declare-fun b!33906 () Bool)

(declare-fun res!20565 () Bool)

(assert (=> b!33906 (=> (not res!20565) (not e!21532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33906 (= res!20565 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1858 () Bool)

(declare-fun tp!5001 () Bool)

(declare-fun e!21528 () Bool)

(assert (=> mapNonEmpty!1858 (= mapRes!1858 (and tp!5001 e!21528))))

(declare-fun mapRest!1858 () (Array (_ BitVec 32) ValueCell!572))

(declare-fun mapValue!1858 () ValueCell!572)

(declare-fun mapKey!1858 () (_ BitVec 32))

(assert (=> mapNonEmpty!1858 (= (arr!1100 _values!1501) (store mapRest!1858 mapKey!1858 mapValue!1858))))

(declare-fun b!33907 () Bool)

(declare-fun res!20560 () Bool)

(assert (=> b!33907 (=> (not res!20560) (not e!21532))))

(declare-datatypes ((List!889 0))(
  ( (Nil!886) (Cons!885 (h!1452 (_ BitVec 64)) (t!3592 List!889)) )
))
(declare-fun arrayNoDuplicates!0 (array!2301 (_ BitVec 32) List!889) Bool)

(assert (=> b!33907 (= res!20560 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!886))))

(declare-fun b!33908 () Bool)

(assert (=> b!33908 (= e!21528 tp_is_empty!1543)))

(declare-fun b!33909 () Bool)

(assert (=> b!33909 (= e!21531 (and e!21530 mapRes!1858))))

(declare-fun condMapEmpty!1858 () Bool)

(declare-fun mapDefault!1858 () ValueCell!572)

