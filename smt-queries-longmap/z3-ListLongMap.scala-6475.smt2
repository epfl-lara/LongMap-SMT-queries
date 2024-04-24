; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82858 () Bool)

(assert start!82858)

(declare-fun b_free!18823 () Bool)

(declare-fun b_next!18823 () Bool)

(assert (=> start!82858 (= b_free!18823 (not b_next!18823))))

(declare-fun tp!65589 () Bool)

(declare-fun b_and!30321 () Bool)

(assert (=> start!82858 (= tp!65589 b_and!30321)))

(declare-fun b!965075 () Bool)

(declare-fun res!645682 () Bool)

(declare-fun e!544163 () Bool)

(assert (=> b!965075 (=> (not res!645682) (not e!544163))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33817 0))(
  ( (V!33818 (val!10863 Int)) )
))
(declare-datatypes ((ValueCell!10331 0))(
  ( (ValueCellFull!10331 (v!13418 V!33817)) (EmptyCell!10331) )
))
(declare-datatypes ((array!59360 0))(
  ( (array!59361 (arr!28544 (Array (_ BitVec 32) ValueCell!10331)) (size!29024 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59360)

(declare-datatypes ((array!59362 0))(
  ( (array!59363 (arr!28545 (Array (_ BitVec 32) (_ BitVec 64))) (size!29025 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59362)

(declare-fun minValue!1342 () V!33817)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33817)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13946 0))(
  ( (tuple2!13947 (_1!6984 (_ BitVec 64)) (_2!6984 V!33817)) )
))
(declare-datatypes ((List!19794 0))(
  ( (Nil!19791) (Cons!19790 (h!20958 tuple2!13946) (t!28149 List!19794)) )
))
(declare-datatypes ((ListLongMap!12645 0))(
  ( (ListLongMap!12646 (toList!6338 List!19794)) )
))
(declare-fun contains!5453 (ListLongMap!12645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3571 (array!59362 array!59360 (_ BitVec 32) (_ BitVec 32) V!33817 V!33817 (_ BitVec 32) Int) ListLongMap!12645)

(assert (=> b!965075 (= res!645682 (contains!5453 (getCurrentListMap!3571 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28545 _keys!1686) i!803)))))

(declare-fun b!965076 () Bool)

(declare-fun res!645677 () Bool)

(assert (=> b!965076 (=> (not res!645677) (not e!544163))))

(assert (=> b!965076 (= res!645677 (and (= (size!29024 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29025 _keys!1686) (size!29024 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965077 () Bool)

(declare-fun res!645680 () Bool)

(assert (=> b!965077 (=> (not res!645680) (not e!544163))))

(declare-datatypes ((List!19795 0))(
  ( (Nil!19792) (Cons!19791 (h!20959 (_ BitVec 64)) (t!28150 List!19795)) )
))
(declare-fun arrayNoDuplicates!0 (array!59362 (_ BitVec 32) List!19795) Bool)

(assert (=> b!965077 (= res!645680 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19792))))

(declare-fun b!965078 () Bool)

(declare-fun res!645676 () Bool)

(assert (=> b!965078 (=> (not res!645676) (not e!544163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965078 (= res!645676 (validKeyInArray!0 (select (arr!28545 _keys!1686) i!803)))))

(declare-fun b!965079 () Bool)

(declare-fun e!544162 () Bool)

(declare-fun tp_is_empty!21625 () Bool)

(assert (=> b!965079 (= e!544162 tp_is_empty!21625)))

(declare-fun res!645684 () Bool)

(assert (=> start!82858 (=> (not res!645684) (not e!544163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82858 (= res!645684 (validMask!0 mask!2110))))

(assert (=> start!82858 e!544163))

(assert (=> start!82858 true))

(declare-fun e!544158 () Bool)

(declare-fun array_inv!22175 (array!59360) Bool)

(assert (=> start!82858 (and (array_inv!22175 _values!1400) e!544158)))

(declare-fun array_inv!22176 (array!59362) Bool)

(assert (=> start!82858 (array_inv!22176 _keys!1686)))

(assert (=> start!82858 tp!65589))

(assert (=> start!82858 tp_is_empty!21625))

(declare-fun b!965080 () Bool)

(declare-fun e!544159 () Bool)

(assert (=> b!965080 (= e!544159 tp_is_empty!21625)))

(declare-fun b!965081 () Bool)

(declare-fun e!544161 () Bool)

(assert (=> b!965081 (= e!544163 (not e!544161))))

(declare-fun res!645678 () Bool)

(assert (=> b!965081 (=> res!645678 e!544161)))

(assert (=> b!965081 (= res!645678 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29025 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!965081 (contains!5453 (getCurrentListMap!3571 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28545 _keys!1686) i!803))))

(declare-datatypes ((Unit!32232 0))(
  ( (Unit!32233) )
))
(declare-fun lt!431420 () Unit!32232)

(declare-fun lemmaInListMapFromThenInFromMinusOne!30 (array!59362 array!59360 (_ BitVec 32) (_ BitVec 32) V!33817 V!33817 (_ BitVec 32) (_ BitVec 32) Int) Unit!32232)

(assert (=> b!965081 (= lt!431420 (lemmaInListMapFromThenInFromMinusOne!30 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!965082 () Bool)

(declare-fun res!645683 () Bool)

(assert (=> b!965082 (=> (not res!645683) (not e!544163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59362 (_ BitVec 32)) Bool)

(assert (=> b!965082 (= res!645683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965083 () Bool)

(declare-fun mapRes!34432 () Bool)

(assert (=> b!965083 (= e!544158 (and e!544162 mapRes!34432))))

(declare-fun condMapEmpty!34432 () Bool)

(declare-fun mapDefault!34432 () ValueCell!10331)

(assert (=> b!965083 (= condMapEmpty!34432 (= (arr!28544 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10331)) mapDefault!34432)))))

(declare-fun b!965084 () Bool)

(declare-fun res!645681 () Bool)

(assert (=> b!965084 (=> (not res!645681) (not e!544163))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965084 (= res!645681 (bvsgt from!2084 newFrom!159))))

(declare-fun b!965085 () Bool)

(declare-fun res!645679 () Bool)

(assert (=> b!965085 (=> (not res!645679) (not e!544163))))

(assert (=> b!965085 (= res!645679 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29025 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29025 _keys!1686))))))

(declare-fun mapNonEmpty!34432 () Bool)

(declare-fun tp!65590 () Bool)

(assert (=> mapNonEmpty!34432 (= mapRes!34432 (and tp!65590 e!544159))))

(declare-fun mapKey!34432 () (_ BitVec 32))

(declare-fun mapValue!34432 () ValueCell!10331)

(declare-fun mapRest!34432 () (Array (_ BitVec 32) ValueCell!10331))

(assert (=> mapNonEmpty!34432 (= (arr!28544 _values!1400) (store mapRest!34432 mapKey!34432 mapValue!34432))))

(declare-fun b!965086 () Bool)

(assert (=> b!965086 (= e!544161 true)))

(assert (=> b!965086 (contains!5453 (getCurrentListMap!3571 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28545 _keys!1686) i!803))))

(declare-fun lt!431419 () Unit!32232)

(declare-fun lemmaInListMapFromThenInFromSmaller!25 (array!59362 array!59360 (_ BitVec 32) (_ BitVec 32) V!33817 V!33817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32232)

(assert (=> b!965086 (= lt!431419 (lemmaInListMapFromThenInFromSmaller!25 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34432 () Bool)

(assert (=> mapIsEmpty!34432 mapRes!34432))

(assert (= (and start!82858 res!645684) b!965076))

(assert (= (and b!965076 res!645677) b!965082))

(assert (= (and b!965082 res!645683) b!965077))

(assert (= (and b!965077 res!645680) b!965085))

(assert (= (and b!965085 res!645679) b!965078))

(assert (= (and b!965078 res!645676) b!965075))

(assert (= (and b!965075 res!645682) b!965084))

(assert (= (and b!965084 res!645681) b!965081))

(assert (= (and b!965081 (not res!645678)) b!965086))

(assert (= (and b!965083 condMapEmpty!34432) mapIsEmpty!34432))

(assert (= (and b!965083 (not condMapEmpty!34432)) mapNonEmpty!34432))

(get-info :version)

(assert (= (and mapNonEmpty!34432 ((_ is ValueCellFull!10331) mapValue!34432)) b!965080))

(assert (= (and b!965083 ((_ is ValueCellFull!10331) mapDefault!34432)) b!965079))

(assert (= start!82858 b!965083))

(declare-fun m!894751 () Bool)

(assert (=> b!965082 m!894751))

(declare-fun m!894753 () Bool)

(assert (=> b!965075 m!894753))

(declare-fun m!894755 () Bool)

(assert (=> b!965075 m!894755))

(assert (=> b!965075 m!894753))

(assert (=> b!965075 m!894755))

(declare-fun m!894757 () Bool)

(assert (=> b!965075 m!894757))

(declare-fun m!894759 () Bool)

(assert (=> mapNonEmpty!34432 m!894759))

(assert (=> b!965078 m!894755))

(assert (=> b!965078 m!894755))

(declare-fun m!894761 () Bool)

(assert (=> b!965078 m!894761))

(declare-fun m!894763 () Bool)

(assert (=> b!965077 m!894763))

(declare-fun m!894765 () Bool)

(assert (=> b!965081 m!894765))

(assert (=> b!965081 m!894755))

(assert (=> b!965081 m!894765))

(assert (=> b!965081 m!894755))

(declare-fun m!894767 () Bool)

(assert (=> b!965081 m!894767))

(declare-fun m!894769 () Bool)

(assert (=> b!965081 m!894769))

(declare-fun m!894771 () Bool)

(assert (=> b!965086 m!894771))

(assert (=> b!965086 m!894755))

(assert (=> b!965086 m!894771))

(assert (=> b!965086 m!894755))

(declare-fun m!894773 () Bool)

(assert (=> b!965086 m!894773))

(declare-fun m!894775 () Bool)

(assert (=> b!965086 m!894775))

(declare-fun m!894777 () Bool)

(assert (=> start!82858 m!894777))

(declare-fun m!894779 () Bool)

(assert (=> start!82858 m!894779))

(declare-fun m!894781 () Bool)

(assert (=> start!82858 m!894781))

(check-sat (not b!965082) (not b!965086) (not start!82858) (not b!965081) (not b!965078) (not b!965077) b_and!30321 (not mapNonEmpty!34432) tp_is_empty!21625 (not b_next!18823) (not b!965075))
(check-sat b_and!30321 (not b_next!18823))
