; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82642 () Bool)

(assert start!82642)

(declare-fun b_free!18775 () Bool)

(declare-fun b_next!18775 () Bool)

(assert (=> start!82642 (= b_free!18775 (not b_next!18775))))

(declare-fun tp!65444 () Bool)

(declare-fun b_and!30263 () Bool)

(assert (=> start!82642 (= tp!65444 b_and!30263)))

(declare-fun b!963360 () Bool)

(declare-fun res!644739 () Bool)

(declare-fun e!543198 () Bool)

(assert (=> b!963360 (=> (not res!644739) (not e!543198))))

(declare-datatypes ((array!59249 0))(
  ( (array!59250 (arr!28493 (Array (_ BitVec 32) (_ BitVec 64))) (size!28972 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59249)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963360 (= res!644739 (validKeyInArray!0 (select (arr!28493 _keys!1686) i!803)))))

(declare-fun res!644736 () Bool)

(assert (=> start!82642 (=> (not res!644736) (not e!543198))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82642 (= res!644736 (validMask!0 mask!2110))))

(assert (=> start!82642 e!543198))

(assert (=> start!82642 true))

(declare-datatypes ((V!33753 0))(
  ( (V!33754 (val!10839 Int)) )
))
(declare-datatypes ((ValueCell!10307 0))(
  ( (ValueCellFull!10307 (v!13397 V!33753)) (EmptyCell!10307) )
))
(declare-datatypes ((array!59251 0))(
  ( (array!59252 (arr!28494 (Array (_ BitVec 32) ValueCell!10307)) (size!28973 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59251)

(declare-fun e!543196 () Bool)

(declare-fun array_inv!22077 (array!59251) Bool)

(assert (=> start!82642 (and (array_inv!22077 _values!1400) e!543196)))

(declare-fun array_inv!22078 (array!59249) Bool)

(assert (=> start!82642 (array_inv!22078 _keys!1686)))

(assert (=> start!82642 tp!65444))

(declare-fun tp_is_empty!21577 () Bool)

(assert (=> start!82642 tp_is_empty!21577))

(declare-fun mapIsEmpty!34360 () Bool)

(declare-fun mapRes!34360 () Bool)

(assert (=> mapIsEmpty!34360 mapRes!34360))

(declare-fun b!963361 () Bool)

(declare-fun res!644738 () Bool)

(assert (=> b!963361 (=> (not res!644738) (not e!543198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59249 (_ BitVec 32)) Bool)

(assert (=> b!963361 (= res!644738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963362 () Bool)

(declare-fun e!543197 () Bool)

(assert (=> b!963362 (= e!543197 tp_is_empty!21577)))

(declare-fun b!963363 () Bool)

(declare-fun res!644737 () Bool)

(assert (=> b!963363 (=> (not res!644737) (not e!543198))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33753)

(declare-fun zeroValue!1342 () V!33753)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!13924 0))(
  ( (tuple2!13925 (_1!6973 (_ BitVec 64)) (_2!6973 V!33753)) )
))
(declare-datatypes ((List!19776 0))(
  ( (Nil!19773) (Cons!19772 (h!20934 tuple2!13924) (t!28139 List!19776)) )
))
(declare-datatypes ((ListLongMap!12621 0))(
  ( (ListLongMap!12622 (toList!6326 List!19776)) )
))
(declare-fun contains!5429 (ListLongMap!12621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3559 (array!59249 array!59251 (_ BitVec 32) (_ BitVec 32) V!33753 V!33753 (_ BitVec 32) Int) ListLongMap!12621)

(assert (=> b!963363 (= res!644737 (contains!5429 (getCurrentListMap!3559 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28493 _keys!1686) i!803)))))

(declare-fun b!963364 () Bool)

(declare-fun e!543199 () Bool)

(assert (=> b!963364 (= e!543199 tp_is_empty!21577)))

(declare-fun mapNonEmpty!34360 () Bool)

(declare-fun tp!65445 () Bool)

(assert (=> mapNonEmpty!34360 (= mapRes!34360 (and tp!65445 e!543197))))

(declare-fun mapKey!34360 () (_ BitVec 32))

(declare-fun mapRest!34360 () (Array (_ BitVec 32) ValueCell!10307))

(declare-fun mapValue!34360 () ValueCell!10307)

(assert (=> mapNonEmpty!34360 (= (arr!28494 _values!1400) (store mapRest!34360 mapKey!34360 mapValue!34360))))

(declare-fun b!963365 () Bool)

(assert (=> b!963365 (= e!543198 (not true))))

(assert (=> b!963365 (contains!5429 (getCurrentListMap!3559 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28493 _keys!1686) i!803))))

(declare-datatypes ((Unit!32235 0))(
  ( (Unit!32236) )
))
(declare-fun lt!430966 () Unit!32235)

(declare-fun lemmaInListMapFromThenInFromMinusOne!12 (array!59249 array!59251 (_ BitVec 32) (_ BitVec 32) V!33753 V!33753 (_ BitVec 32) (_ BitVec 32) Int) Unit!32235)

(assert (=> b!963365 (= lt!430966 (lemmaInListMapFromThenInFromMinusOne!12 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963366 () Bool)

(declare-fun res!644742 () Bool)

(assert (=> b!963366 (=> (not res!644742) (not e!543198))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963366 (= res!644742 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963367 () Bool)

(declare-fun res!644740 () Bool)

(assert (=> b!963367 (=> (not res!644740) (not e!543198))))

(assert (=> b!963367 (= res!644740 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28972 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28972 _keys!1686))))))

(declare-fun b!963368 () Bool)

(declare-fun res!644743 () Bool)

(assert (=> b!963368 (=> (not res!644743) (not e!543198))))

(assert (=> b!963368 (= res!644743 (and (= (size!28973 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28972 _keys!1686) (size!28973 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963369 () Bool)

(assert (=> b!963369 (= e!543196 (and e!543199 mapRes!34360))))

(declare-fun condMapEmpty!34360 () Bool)

(declare-fun mapDefault!34360 () ValueCell!10307)

