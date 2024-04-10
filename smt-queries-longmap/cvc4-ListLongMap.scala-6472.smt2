; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82676 () Bool)

(assert start!82676)

(declare-fun b_free!18809 () Bool)

(declare-fun b_next!18809 () Bool)

(assert (=> start!82676 (= b_free!18809 (not b_next!18809))))

(declare-fun tp!65547 () Bool)

(declare-fun b_and!30297 () Bool)

(assert (=> start!82676 (= tp!65547 b_and!30297)))

(declare-fun b!963921 () Bool)

(declare-fun res!645151 () Bool)

(declare-fun e!543453 () Bool)

(assert (=> b!963921 (=> (not res!645151) (not e!543453))))

(declare-datatypes ((array!59311 0))(
  ( (array!59312 (arr!28524 (Array (_ BitVec 32) (_ BitVec 64))) (size!29003 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59311)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963921 (= res!645151 (validKeyInArray!0 (select (arr!28524 _keys!1686) i!803)))))

(declare-fun b!963922 () Bool)

(declare-fun res!645148 () Bool)

(assert (=> b!963922 (=> (not res!645148) (not e!543453))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963922 (= res!645148 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963923 () Bool)

(declare-fun res!645144 () Bool)

(assert (=> b!963923 (=> (not res!645144) (not e!543453))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33797 0))(
  ( (V!33798 (val!10856 Int)) )
))
(declare-datatypes ((ValueCell!10324 0))(
  ( (ValueCellFull!10324 (v!13414 V!33797)) (EmptyCell!10324) )
))
(declare-datatypes ((array!59313 0))(
  ( (array!59314 (arr!28525 (Array (_ BitVec 32) ValueCell!10324)) (size!29004 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59313)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963923 (= res!645144 (and (= (size!29004 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29003 _keys!1686) (size!29004 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963924 () Bool)

(declare-fun res!645145 () Bool)

(assert (=> b!963924 (=> (not res!645145) (not e!543453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59311 (_ BitVec 32)) Bool)

(assert (=> b!963924 (= res!645145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963925 () Bool)

(assert (=> b!963925 (= e!543453 (not true))))

(declare-fun minValue!1342 () V!33797)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33797)

(declare-datatypes ((tuple2!13946 0))(
  ( (tuple2!13947 (_1!6984 (_ BitVec 64)) (_2!6984 V!33797)) )
))
(declare-datatypes ((List!19796 0))(
  ( (Nil!19793) (Cons!19792 (h!20954 tuple2!13946) (t!28159 List!19796)) )
))
(declare-datatypes ((ListLongMap!12643 0))(
  ( (ListLongMap!12644 (toList!6337 List!19796)) )
))
(declare-fun contains!5440 (ListLongMap!12643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3570 (array!59311 array!59313 (_ BitVec 32) (_ BitVec 32) V!33797 V!33797 (_ BitVec 32) Int) ListLongMap!12643)

(assert (=> b!963925 (contains!5440 (getCurrentListMap!3570 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28524 _keys!1686) i!803))))

(declare-datatypes ((Unit!32257 0))(
  ( (Unit!32258) )
))
(declare-fun lt!431017 () Unit!32257)

(declare-fun lemmaInListMapFromThenInFromMinusOne!23 (array!59311 array!59313 (_ BitVec 32) (_ BitVec 32) V!33797 V!33797 (_ BitVec 32) (_ BitVec 32) Int) Unit!32257)

(assert (=> b!963925 (= lt!431017 (lemmaInListMapFromThenInFromMinusOne!23 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34411 () Bool)

(declare-fun mapRes!34411 () Bool)

(declare-fun tp!65546 () Bool)

(declare-fun e!543452 () Bool)

(assert (=> mapNonEmpty!34411 (= mapRes!34411 (and tp!65546 e!543452))))

(declare-fun mapValue!34411 () ValueCell!10324)

(declare-fun mapRest!34411 () (Array (_ BitVec 32) ValueCell!10324))

(declare-fun mapKey!34411 () (_ BitVec 32))

(assert (=> mapNonEmpty!34411 (= (arr!28525 _values!1400) (store mapRest!34411 mapKey!34411 mapValue!34411))))

(declare-fun b!963927 () Bool)

(declare-fun tp_is_empty!21611 () Bool)

(assert (=> b!963927 (= e!543452 tp_is_empty!21611)))

(declare-fun b!963928 () Bool)

(declare-fun res!645146 () Bool)

(assert (=> b!963928 (=> (not res!645146) (not e!543453))))

(declare-datatypes ((List!19797 0))(
  ( (Nil!19794) (Cons!19793 (h!20955 (_ BitVec 64)) (t!28160 List!19797)) )
))
(declare-fun arrayNoDuplicates!0 (array!59311 (_ BitVec 32) List!19797) Bool)

(assert (=> b!963928 (= res!645146 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19794))))

(declare-fun b!963929 () Bool)

(declare-fun e!543451 () Bool)

(declare-fun e!543454 () Bool)

(assert (=> b!963929 (= e!543451 (and e!543454 mapRes!34411))))

(declare-fun condMapEmpty!34411 () Bool)

(declare-fun mapDefault!34411 () ValueCell!10324)

