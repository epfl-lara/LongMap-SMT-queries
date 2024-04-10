; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82400 () Bool)

(assert start!82400)

(declare-fun b_free!18667 () Bool)

(declare-fun b_next!18667 () Bool)

(assert (=> start!82400 (= b_free!18667 (not b_next!18667))))

(declare-fun tp!64971 () Bool)

(declare-fun b_and!30155 () Bool)

(assert (=> start!82400 (= tp!64971 b_and!30155)))

(declare-fun mapNonEmpty!34048 () Bool)

(declare-fun mapRes!34048 () Bool)

(declare-fun tp!64970 () Bool)

(declare-fun e!541617 () Bool)

(assert (=> mapNonEmpty!34048 (= mapRes!34048 (and tp!64970 e!541617))))

(declare-fun mapKey!34048 () (_ BitVec 32))

(declare-datatypes ((V!33489 0))(
  ( (V!33490 (val!10740 Int)) )
))
(declare-datatypes ((ValueCell!10208 0))(
  ( (ValueCellFull!10208 (v!13297 V!33489)) (EmptyCell!10208) )
))
(declare-fun mapRest!34048 () (Array (_ BitVec 32) ValueCell!10208))

(declare-fun mapValue!34048 () ValueCell!10208)

(declare-datatypes ((array!58847 0))(
  ( (array!58848 (arr!28297 (Array (_ BitVec 32) ValueCell!10208)) (size!28776 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58847)

(assert (=> mapNonEmpty!34048 (= (arr!28297 _values!1386) (store mapRest!34048 mapKey!34048 mapValue!34048))))

(declare-fun b!960839 () Bool)

(declare-fun e!541618 () Bool)

(assert (=> b!960839 (= e!541618 (not true))))

(declare-fun minValue!1328 () V!33489)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58849 0))(
  ( (array!58850 (arr!28298 (Array (_ BitVec 32) (_ BitVec 64))) (size!28777 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58849)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33489)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((tuple2!13854 0))(
  ( (tuple2!13855 (_1!6938 (_ BitVec 64)) (_2!6938 V!33489)) )
))
(declare-datatypes ((List!19677 0))(
  ( (Nil!19674) (Cons!19673 (h!20835 tuple2!13854) (t!28040 List!19677)) )
))
(declare-datatypes ((ListLongMap!12551 0))(
  ( (ListLongMap!12552 (toList!6291 List!19677)) )
))
(declare-fun contains!5390 (ListLongMap!12551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3524 (array!58849 array!58847 (_ BitVec 32) (_ BitVec 32) V!33489 V!33489 (_ BitVec 32) Int) ListLongMap!12551)

(assert (=> b!960839 (contains!5390 (getCurrentListMap!3524 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28298 _keys!1668) i!793))))

(declare-datatypes ((Unit!32201 0))(
  ( (Unit!32202) )
))
(declare-fun lt!430692 () Unit!32201)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!22 (array!58849 array!58847 (_ BitVec 32) (_ BitVec 32) V!33489 V!33489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32201)

(assert (=> b!960839 (= lt!430692 (lemmaInListMapFromThenInFromSmaller!22 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960840 () Bool)

(declare-fun res!643175 () Bool)

(assert (=> b!960840 (=> (not res!643175) (not e!541618))))

(assert (=> b!960840 (= res!643175 (and (= (size!28776 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28777 _keys!1668) (size!28776 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960841 () Bool)

(declare-fun res!643170 () Bool)

(assert (=> b!960841 (=> (not res!643170) (not e!541618))))

(assert (=> b!960841 (= res!643170 (contains!5390 (getCurrentListMap!3524 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28298 _keys!1668) i!793)))))

(declare-fun b!960842 () Bool)

(declare-fun res!643171 () Bool)

(assert (=> b!960842 (=> (not res!643171) (not e!541618))))

(declare-datatypes ((List!19678 0))(
  ( (Nil!19675) (Cons!19674 (h!20836 (_ BitVec 64)) (t!28041 List!19678)) )
))
(declare-fun arrayNoDuplicates!0 (array!58849 (_ BitVec 32) List!19678) Bool)

(assert (=> b!960842 (= res!643171 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19675))))

(declare-fun mapIsEmpty!34048 () Bool)

(assert (=> mapIsEmpty!34048 mapRes!34048))

(declare-fun b!960843 () Bool)

(declare-fun res!643174 () Bool)

(assert (=> b!960843 (=> (not res!643174) (not e!541618))))

(assert (=> b!960843 (= res!643174 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28777 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28777 _keys!1668))))))

(declare-fun b!960844 () Bool)

(declare-fun e!541619 () Bool)

(declare-fun e!541620 () Bool)

(assert (=> b!960844 (= e!541619 (and e!541620 mapRes!34048))))

(declare-fun condMapEmpty!34048 () Bool)

(declare-fun mapDefault!34048 () ValueCell!10208)

