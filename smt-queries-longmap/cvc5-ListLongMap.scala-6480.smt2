; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82720 () Bool)

(assert start!82720)

(declare-fun b_free!18853 () Bool)

(declare-fun b_next!18853 () Bool)

(assert (=> start!82720 (= b_free!18853 (not b_next!18853))))

(declare-fun tp!65678 () Bool)

(declare-fun b_and!30341 () Bool)

(assert (=> start!82720 (= tp!65678 b_and!30341)))

(declare-fun b!964712 () Bool)

(declare-fun e!543851 () Bool)

(declare-fun e!543848 () Bool)

(assert (=> b!964712 (= e!543851 (not e!543848))))

(declare-fun res!645741 () Bool)

(assert (=> b!964712 (=> res!645741 e!543848)))

(declare-datatypes ((array!59397 0))(
  ( (array!59398 (arr!28567 (Array (_ BitVec 32) (_ BitVec 64))) (size!29046 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59397)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964712 (= res!645741 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29046 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33857 0))(
  ( (V!33858 (val!10878 Int)) )
))
(declare-datatypes ((ValueCell!10346 0))(
  ( (ValueCellFull!10346 (v!13436 V!33857)) (EmptyCell!10346) )
))
(declare-datatypes ((array!59399 0))(
  ( (array!59400 (arr!28568 (Array (_ BitVec 32) ValueCell!10346)) (size!29047 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59399)

(declare-fun minValue!1342 () V!33857)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33857)

(declare-datatypes ((tuple2!13982 0))(
  ( (tuple2!13983 (_1!7002 (_ BitVec 64)) (_2!7002 V!33857)) )
))
(declare-datatypes ((List!19827 0))(
  ( (Nil!19824) (Cons!19823 (h!20985 tuple2!13982) (t!28190 List!19827)) )
))
(declare-datatypes ((ListLongMap!12679 0))(
  ( (ListLongMap!12680 (toList!6355 List!19827)) )
))
(declare-fun contains!5458 (ListLongMap!12679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3588 (array!59397 array!59399 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) Int) ListLongMap!12679)

(assert (=> b!964712 (contains!5458 (getCurrentListMap!3588 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28567 _keys!1686) i!803))))

(declare-datatypes ((Unit!32291 0))(
  ( (Unit!32292) )
))
(declare-fun lt!431149 () Unit!32291)

(declare-fun lemmaInListMapFromThenInFromMinusOne!40 (array!59397 array!59399 (_ BitVec 32) (_ BitVec 32) V!33857 V!33857 (_ BitVec 32) (_ BitVec 32) Int) Unit!32291)

(assert (=> b!964712 (= lt!431149 (lemmaInListMapFromThenInFromMinusOne!40 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964713 () Bool)

(declare-fun res!645744 () Bool)

(assert (=> b!964713 (=> (not res!645744) (not e!543851))))

(declare-datatypes ((List!19828 0))(
  ( (Nil!19825) (Cons!19824 (h!20986 (_ BitVec 64)) (t!28191 List!19828)) )
))
(declare-fun arrayNoDuplicates!0 (array!59397 (_ BitVec 32) List!19828) Bool)

(assert (=> b!964713 (= res!645744 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19825))))

(declare-fun mapNonEmpty!34477 () Bool)

(declare-fun mapRes!34477 () Bool)

(declare-fun tp!65679 () Bool)

(declare-fun e!543850 () Bool)

(assert (=> mapNonEmpty!34477 (= mapRes!34477 (and tp!65679 e!543850))))

(declare-fun mapRest!34477 () (Array (_ BitVec 32) ValueCell!10346))

(declare-fun mapValue!34477 () ValueCell!10346)

(declare-fun mapKey!34477 () (_ BitVec 32))

(assert (=> mapNonEmpty!34477 (= (arr!28568 _values!1400) (store mapRest!34477 mapKey!34477 mapValue!34477))))

(declare-fun b!964714 () Bool)

(declare-fun res!645742 () Bool)

(assert (=> b!964714 (=> (not res!645742) (not e!543851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964714 (= res!645742 (validKeyInArray!0 (select (arr!28567 _keys!1686) i!803)))))

(declare-fun b!964715 () Bool)

(declare-fun e!543847 () Bool)

(declare-fun e!543846 () Bool)

(assert (=> b!964715 (= e!543847 (and e!543846 mapRes!34477))))

(declare-fun condMapEmpty!34477 () Bool)

(declare-fun mapDefault!34477 () ValueCell!10346)

