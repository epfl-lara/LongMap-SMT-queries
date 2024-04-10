; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83514 () Bool)

(assert start!83514)

(declare-fun b_free!19501 () Bool)

(declare-fun b_next!19501 () Bool)

(assert (=> start!83514 (= b_free!19501 (not b_next!19501))))

(declare-fun tp!67791 () Bool)

(declare-fun b_and!31103 () Bool)

(assert (=> start!83514 (= tp!67791 b_and!31103)))

(declare-fun b!975676 () Bool)

(declare-fun res!653149 () Bool)

(declare-fun e!549872 () Bool)

(assert (=> b!975676 (=> (not res!653149) (not e!549872))))

(declare-datatypes ((V!34857 0))(
  ( (V!34858 (val!11253 Int)) )
))
(declare-datatypes ((ValueCell!10721 0))(
  ( (ValueCellFull!10721 (v!13812 V!34857)) (EmptyCell!10721) )
))
(declare-datatypes ((array!60841 0))(
  ( (array!60842 (arr!29284 (Array (_ BitVec 32) ValueCell!10721)) (size!29763 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60841)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60843 0))(
  ( (array!60844 (arr!29285 (Array (_ BitVec 32) (_ BitVec 64))) (size!29764 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60843)

(assert (=> b!975676 (= res!653149 (and (= (size!29763 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29764 _keys!1717) (size!29763 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975677 () Bool)

(declare-fun res!653148 () Bool)

(assert (=> b!975677 (=> (not res!653148) (not e!549872))))

(declare-datatypes ((List!20325 0))(
  ( (Nil!20322) (Cons!20321 (h!21483 (_ BitVec 64)) (t!28802 List!20325)) )
))
(declare-fun arrayNoDuplicates!0 (array!60843 (_ BitVec 32) List!20325) Bool)

(assert (=> b!975677 (= res!653148 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20322))))

(declare-fun b!975678 () Bool)

(assert (=> b!975678 (= e!549872 false)))

(declare-fun zeroValue!1367 () V!34857)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34857)

(declare-datatypes ((tuple2!14472 0))(
  ( (tuple2!14473 (_1!7247 (_ BitVec 64)) (_2!7247 V!34857)) )
))
(declare-datatypes ((List!20326 0))(
  ( (Nil!20323) (Cons!20322 (h!21484 tuple2!14472) (t!28803 List!20326)) )
))
(declare-datatypes ((ListLongMap!13169 0))(
  ( (ListLongMap!13170 (toList!6600 List!20326)) )
))
(declare-fun lt!432887 () ListLongMap!13169)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3833 (array!60843 array!60841 (_ BitVec 32) (_ BitVec 32) V!34857 V!34857 (_ BitVec 32) Int) ListLongMap!13169)

(assert (=> b!975678 (= lt!432887 (getCurrentListMap!3833 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975679 () Bool)

(declare-fun e!549874 () Bool)

(declare-fun tp_is_empty!22405 () Bool)

(assert (=> b!975679 (= e!549874 tp_is_empty!22405)))

(declare-fun res!653154 () Bool)

(assert (=> start!83514 (=> (not res!653154) (not e!549872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83514 (= res!653154 (validMask!0 mask!2147))))

(assert (=> start!83514 e!549872))

(assert (=> start!83514 true))

(declare-fun e!549871 () Bool)

(declare-fun array_inv!22647 (array!60841) Bool)

(assert (=> start!83514 (and (array_inv!22647 _values!1425) e!549871)))

(assert (=> start!83514 tp_is_empty!22405))

(assert (=> start!83514 tp!67791))

(declare-fun array_inv!22648 (array!60843) Bool)

(assert (=> start!83514 (array_inv!22648 _keys!1717)))

(declare-fun b!975680 () Bool)

(declare-fun res!653150 () Bool)

(assert (=> b!975680 (=> (not res!653150) (not e!549872))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975680 (= res!653150 (validKeyInArray!0 (select (arr!29285 _keys!1717) i!822)))))

(declare-fun b!975681 () Bool)

(declare-fun res!653151 () Bool)

(assert (=> b!975681 (=> (not res!653151) (not e!549872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60843 (_ BitVec 32)) Bool)

(assert (=> b!975681 (= res!653151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35617 () Bool)

(declare-fun mapRes!35617 () Bool)

(assert (=> mapIsEmpty!35617 mapRes!35617))

(declare-fun mapNonEmpty!35617 () Bool)

(declare-fun tp!67790 () Bool)

(declare-fun e!549873 () Bool)

(assert (=> mapNonEmpty!35617 (= mapRes!35617 (and tp!67790 e!549873))))

(declare-fun mapKey!35617 () (_ BitVec 32))

(declare-fun mapValue!35617 () ValueCell!10721)

(declare-fun mapRest!35617 () (Array (_ BitVec 32) ValueCell!10721))

(assert (=> mapNonEmpty!35617 (= (arr!29284 _values!1425) (store mapRest!35617 mapKey!35617 mapValue!35617))))

(declare-fun b!975682 () Bool)

(assert (=> b!975682 (= e!549873 tp_is_empty!22405)))

(declare-fun b!975683 () Bool)

(declare-fun res!653153 () Bool)

(assert (=> b!975683 (=> (not res!653153) (not e!549872))))

(declare-fun contains!5681 (ListLongMap!13169 (_ BitVec 64)) Bool)

(assert (=> b!975683 (= res!653153 (contains!5681 (getCurrentListMap!3833 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29285 _keys!1717) i!822)))))

(declare-fun b!975684 () Bool)

(assert (=> b!975684 (= e!549871 (and e!549874 mapRes!35617))))

(declare-fun condMapEmpty!35617 () Bool)

(declare-fun mapDefault!35617 () ValueCell!10721)

