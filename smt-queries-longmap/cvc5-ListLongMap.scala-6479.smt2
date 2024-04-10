; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82714 () Bool)

(assert start!82714)

(declare-fun b_free!18847 () Bool)

(declare-fun b_next!18847 () Bool)

(assert (=> start!82714 (= b_free!18847 (not b_next!18847))))

(declare-fun tp!65661 () Bool)

(declare-fun b_and!30335 () Bool)

(assert (=> start!82714 (= tp!65661 b_and!30335)))

(declare-fun b!964604 () Bool)

(declare-fun res!645664 () Bool)

(declare-fun e!543795 () Bool)

(assert (=> b!964604 (=> (not res!645664) (not e!543795))))

(declare-datatypes ((array!59385 0))(
  ( (array!59386 (arr!28561 (Array (_ BitVec 32) (_ BitVec 64))) (size!29040 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59385)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59385 (_ BitVec 32)) Bool)

(assert (=> b!964604 (= res!645664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964605 () Bool)

(declare-fun e!543794 () Bool)

(declare-fun tp_is_empty!21649 () Bool)

(assert (=> b!964605 (= e!543794 tp_is_empty!21649)))

(declare-fun b!964606 () Bool)

(declare-fun res!645661 () Bool)

(assert (=> b!964606 (=> (not res!645661) (not e!543795))))

(declare-datatypes ((List!19821 0))(
  ( (Nil!19818) (Cons!19817 (h!20979 (_ BitVec 64)) (t!28184 List!19821)) )
))
(declare-fun arrayNoDuplicates!0 (array!59385 (_ BitVec 32) List!19821) Bool)

(assert (=> b!964606 (= res!645661 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19818))))

(declare-fun b!964607 () Bool)

(declare-fun res!645658 () Bool)

(assert (=> b!964607 (=> (not res!645658) (not e!543795))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964607 (= res!645658 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964608 () Bool)

(declare-fun res!645656 () Bool)

(assert (=> b!964608 (=> (not res!645656) (not e!543795))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33849 0))(
  ( (V!33850 (val!10875 Int)) )
))
(declare-datatypes ((ValueCell!10343 0))(
  ( (ValueCellFull!10343 (v!13433 V!33849)) (EmptyCell!10343) )
))
(declare-datatypes ((array!59387 0))(
  ( (array!59388 (arr!28562 (Array (_ BitVec 32) ValueCell!10343)) (size!29041 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59387)

(declare-fun minValue!1342 () V!33849)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33849)

(declare-datatypes ((tuple2!13976 0))(
  ( (tuple2!13977 (_1!6999 (_ BitVec 64)) (_2!6999 V!33849)) )
))
(declare-datatypes ((List!19822 0))(
  ( (Nil!19819) (Cons!19818 (h!20980 tuple2!13976) (t!28185 List!19822)) )
))
(declare-datatypes ((ListLongMap!12673 0))(
  ( (ListLongMap!12674 (toList!6352 List!19822)) )
))
(declare-fun contains!5455 (ListLongMap!12673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3585 (array!59385 array!59387 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) Int) ListLongMap!12673)

(assert (=> b!964608 (= res!645656 (contains!5455 (getCurrentListMap!3585 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28561 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34468 () Bool)

(declare-fun mapRes!34468 () Bool)

(assert (=> mapIsEmpty!34468 mapRes!34468))

(declare-fun b!964609 () Bool)

(declare-fun res!645659 () Bool)

(assert (=> b!964609 (=> (not res!645659) (not e!543795))))

(assert (=> b!964609 (= res!645659 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29040 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29040 _keys!1686))))))

(declare-fun b!964610 () Bool)

(declare-fun e!543792 () Bool)

(assert (=> b!964610 (= e!543795 (not e!543792))))

(declare-fun res!645660 () Bool)

(assert (=> b!964610 (=> res!645660 e!543792)))

(assert (=> b!964610 (= res!645660 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29040 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964610 (contains!5455 (getCurrentListMap!3585 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28561 _keys!1686) i!803))))

(declare-datatypes ((Unit!32285 0))(
  ( (Unit!32286) )
))
(declare-fun lt!431131 () Unit!32285)

(declare-fun lemmaInListMapFromThenInFromMinusOne!37 (array!59385 array!59387 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) (_ BitVec 32) Int) Unit!32285)

(assert (=> b!964610 (= lt!431131 (lemmaInListMapFromThenInFromMinusOne!37 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964611 () Bool)

(assert (=> b!964611 (= e!543792 true)))

(assert (=> b!964611 (contains!5455 (getCurrentListMap!3585 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28561 _keys!1686) i!803))))

(declare-fun lt!431130 () Unit!32285)

(declare-fun lemmaInListMapFromThenInFromSmaller!34 (array!59385 array!59387 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32285)

(assert (=> b!964611 (= lt!431130 (lemmaInListMapFromThenInFromSmaller!34 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964612 () Bool)

(declare-fun res!645657 () Bool)

(assert (=> b!964612 (=> (not res!645657) (not e!543795))))

(assert (=> b!964612 (= res!645657 (and (= (size!29041 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29040 _keys!1686) (size!29041 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964613 () Bool)

(declare-fun e!543793 () Bool)

(assert (=> b!964613 (= e!543793 (and e!543794 mapRes!34468))))

(declare-fun condMapEmpty!34468 () Bool)

(declare-fun mapDefault!34468 () ValueCell!10343)

