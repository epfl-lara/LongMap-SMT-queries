; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82912 () Bool)

(assert start!82912)

(declare-fun b_free!19039 () Bool)

(declare-fun b_next!19039 () Bool)

(assert (=> start!82912 (= b_free!19039 (not b_next!19039))))

(declare-fun tp!66246 () Bool)

(declare-fun b_and!30527 () Bool)

(assert (=> start!82912 (= tp!66246 b_and!30527)))

(declare-fun b!967482 () Bool)

(declare-fun res!647644 () Bool)

(declare-fun e!545303 () Bool)

(assert (=> b!967482 (=> (not res!647644) (not e!545303))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967482 (= res!647644 (bvsgt from!2084 newFrom!159))))

(declare-fun res!647649 () Bool)

(assert (=> start!82912 (=> (not res!647649) (not e!545303))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82912 (= res!647649 (validMask!0 mask!2110))))

(assert (=> start!82912 e!545303))

(assert (=> start!82912 true))

(declare-datatypes ((V!34113 0))(
  ( (V!34114 (val!10974 Int)) )
))
(declare-datatypes ((ValueCell!10442 0))(
  ( (ValueCellFull!10442 (v!13532 V!34113)) (EmptyCell!10442) )
))
(declare-datatypes ((array!59767 0))(
  ( (array!59768 (arr!28752 (Array (_ BitVec 32) ValueCell!10442)) (size!29231 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59767)

(declare-fun e!545302 () Bool)

(declare-fun array_inv!22265 (array!59767) Bool)

(assert (=> start!82912 (and (array_inv!22265 _values!1400) e!545302)))

(declare-datatypes ((array!59769 0))(
  ( (array!59770 (arr!28753 (Array (_ BitVec 32) (_ BitVec 64))) (size!29232 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59769)

(declare-fun array_inv!22266 (array!59769) Bool)

(assert (=> start!82912 (array_inv!22266 _keys!1686)))

(assert (=> start!82912 tp!66246))

(declare-fun tp_is_empty!21847 () Bool)

(assert (=> start!82912 tp_is_empty!21847))

(declare-fun b!967483 () Bool)

(assert (=> b!967483 (= e!545303 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34113)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34113)

(declare-datatypes ((tuple2!14114 0))(
  ( (tuple2!14115 (_1!7068 (_ BitVec 64)) (_2!7068 V!34113)) )
))
(declare-datatypes ((List!19963 0))(
  ( (Nil!19960) (Cons!19959 (h!21121 tuple2!14114) (t!28326 List!19963)) )
))
(declare-datatypes ((ListLongMap!12811 0))(
  ( (ListLongMap!12812 (toList!6421 List!19963)) )
))
(declare-fun contains!5522 (ListLongMap!12811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3654 (array!59769 array!59767 (_ BitVec 32) (_ BitVec 32) V!34113 V!34113 (_ BitVec 32) Int) ListLongMap!12811)

(assert (=> b!967483 (contains!5522 (getCurrentListMap!3654 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28753 _keys!1686) i!803))))

(declare-datatypes ((Unit!32325 0))(
  ( (Unit!32326) )
))
(declare-fun lt!431425 () Unit!32325)

(declare-fun lemmaInListMapFromThenInFromMinusOne!57 (array!59769 array!59767 (_ BitVec 32) (_ BitVec 32) V!34113 V!34113 (_ BitVec 32) (_ BitVec 32) Int) Unit!32325)

(assert (=> b!967483 (= lt!431425 (lemmaInListMapFromThenInFromMinusOne!57 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967484 () Bool)

(declare-fun res!647648 () Bool)

(assert (=> b!967484 (=> (not res!647648) (not e!545303))))

(assert (=> b!967484 (= res!647648 (and (= (size!29231 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29232 _keys!1686) (size!29231 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967485 () Bool)

(declare-fun res!647645 () Bool)

(assert (=> b!967485 (=> (not res!647645) (not e!545303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59769 (_ BitVec 32)) Bool)

(assert (=> b!967485 (= res!647645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967486 () Bool)

(declare-fun res!647646 () Bool)

(assert (=> b!967486 (=> (not res!647646) (not e!545303))))

(assert (=> b!967486 (= res!647646 (contains!5522 (getCurrentListMap!3654 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28753 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34765 () Bool)

(declare-fun mapRes!34765 () Bool)

(declare-fun tp!66245 () Bool)

(declare-fun e!545304 () Bool)

(assert (=> mapNonEmpty!34765 (= mapRes!34765 (and tp!66245 e!545304))))

(declare-fun mapKey!34765 () (_ BitVec 32))

(declare-fun mapValue!34765 () ValueCell!10442)

(declare-fun mapRest!34765 () (Array (_ BitVec 32) ValueCell!10442))

(assert (=> mapNonEmpty!34765 (= (arr!28752 _values!1400) (store mapRest!34765 mapKey!34765 mapValue!34765))))

(declare-fun b!967487 () Bool)

(declare-fun res!647650 () Bool)

(assert (=> b!967487 (=> (not res!647650) (not e!545303))))

(assert (=> b!967487 (= res!647650 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29232 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29232 _keys!1686))))))

(declare-fun b!967488 () Bool)

(declare-fun res!647647 () Bool)

(assert (=> b!967488 (=> (not res!647647) (not e!545303))))

(declare-datatypes ((List!19964 0))(
  ( (Nil!19961) (Cons!19960 (h!21122 (_ BitVec 64)) (t!28327 List!19964)) )
))
(declare-fun arrayNoDuplicates!0 (array!59769 (_ BitVec 32) List!19964) Bool)

(assert (=> b!967488 (= res!647647 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19961))))

(declare-fun b!967489 () Bool)

(assert (=> b!967489 (= e!545304 tp_is_empty!21847)))

(declare-fun b!967490 () Bool)

(declare-fun res!647643 () Bool)

(assert (=> b!967490 (=> (not res!647643) (not e!545303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967490 (= res!647643 (validKeyInArray!0 (select (arr!28753 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34765 () Bool)

(assert (=> mapIsEmpty!34765 mapRes!34765))

(declare-fun b!967491 () Bool)

(declare-fun e!545306 () Bool)

(assert (=> b!967491 (= e!545302 (and e!545306 mapRes!34765))))

(declare-fun condMapEmpty!34765 () Bool)

(declare-fun mapDefault!34765 () ValueCell!10442)

