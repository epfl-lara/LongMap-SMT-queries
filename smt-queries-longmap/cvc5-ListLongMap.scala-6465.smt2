; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82630 () Bool)

(assert start!82630)

(declare-fun b_free!18763 () Bool)

(declare-fun b_next!18763 () Bool)

(assert (=> start!82630 (= b_free!18763 (not b_next!18763))))

(declare-fun tp!65408 () Bool)

(declare-fun b_and!30251 () Bool)

(assert (=> start!82630 (= tp!65408 b_and!30251)))

(declare-fun b!963162 () Bool)

(declare-fun res!644594 () Bool)

(declare-fun e!543107 () Bool)

(assert (=> b!963162 (=> (not res!644594) (not e!543107))))

(declare-datatypes ((array!59225 0))(
  ( (array!59226 (arr!28481 (Array (_ BitVec 32) (_ BitVec 64))) (size!28960 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59225)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963162 (= res!644594 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28960 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28960 _keys!1686))))))

(declare-fun b!963163 () Bool)

(declare-fun res!644595 () Bool)

(assert (=> b!963163 (=> (not res!644595) (not e!543107))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33737 0))(
  ( (V!33738 (val!10833 Int)) )
))
(declare-datatypes ((ValueCell!10301 0))(
  ( (ValueCellFull!10301 (v!13391 V!33737)) (EmptyCell!10301) )
))
(declare-datatypes ((array!59227 0))(
  ( (array!59228 (arr!28482 (Array (_ BitVec 32) ValueCell!10301)) (size!28961 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59227)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963163 (= res!644595 (and (= (size!28961 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28960 _keys!1686) (size!28961 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963164 () Bool)

(declare-fun res!644596 () Bool)

(assert (=> b!963164 (=> (not res!644596) (not e!543107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963164 (= res!644596 (validKeyInArray!0 (select (arr!28481 _keys!1686) i!803)))))

(declare-fun b!963165 () Bool)

(declare-fun res!644592 () Bool)

(assert (=> b!963165 (=> (not res!644592) (not e!543107))))

(assert (=> b!963165 (= res!644592 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34342 () Bool)

(declare-fun mapRes!34342 () Bool)

(declare-fun tp!65409 () Bool)

(declare-fun e!543110 () Bool)

(assert (=> mapNonEmpty!34342 (= mapRes!34342 (and tp!65409 e!543110))))

(declare-fun mapValue!34342 () ValueCell!10301)

(declare-fun mapRest!34342 () (Array (_ BitVec 32) ValueCell!10301))

(declare-fun mapKey!34342 () (_ BitVec 32))

(assert (=> mapNonEmpty!34342 (= (arr!28482 _values!1400) (store mapRest!34342 mapKey!34342 mapValue!34342))))

(declare-fun b!963166 () Bool)

(declare-fun res!644593 () Bool)

(assert (=> b!963166 (=> (not res!644593) (not e!543107))))

(declare-fun minValue!1342 () V!33737)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33737)

(declare-datatypes ((tuple2!13916 0))(
  ( (tuple2!13917 (_1!6969 (_ BitVec 64)) (_2!6969 V!33737)) )
))
(declare-datatypes ((List!19766 0))(
  ( (Nil!19763) (Cons!19762 (h!20924 tuple2!13916) (t!28129 List!19766)) )
))
(declare-datatypes ((ListLongMap!12613 0))(
  ( (ListLongMap!12614 (toList!6322 List!19766)) )
))
(declare-fun contains!5425 (ListLongMap!12613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3555 (array!59225 array!59227 (_ BitVec 32) (_ BitVec 32) V!33737 V!33737 (_ BitVec 32) Int) ListLongMap!12613)

(assert (=> b!963166 (= res!644593 (contains!5425 (getCurrentListMap!3555 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28481 _keys!1686) i!803)))))

(declare-fun res!644598 () Bool)

(assert (=> start!82630 (=> (not res!644598) (not e!543107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82630 (= res!644598 (validMask!0 mask!2110))))

(assert (=> start!82630 e!543107))

(assert (=> start!82630 true))

(declare-fun e!543106 () Bool)

(declare-fun array_inv!22067 (array!59227) Bool)

(assert (=> start!82630 (and (array_inv!22067 _values!1400) e!543106)))

(declare-fun array_inv!22068 (array!59225) Bool)

(assert (=> start!82630 (array_inv!22068 _keys!1686)))

(assert (=> start!82630 tp!65408))

(declare-fun tp_is_empty!21565 () Bool)

(assert (=> start!82630 tp_is_empty!21565))

(declare-fun b!963167 () Bool)

(declare-fun res!644599 () Bool)

(assert (=> b!963167 (=> (not res!644599) (not e!543107))))

(declare-datatypes ((List!19767 0))(
  ( (Nil!19764) (Cons!19763 (h!20925 (_ BitVec 64)) (t!28130 List!19767)) )
))
(declare-fun arrayNoDuplicates!0 (array!59225 (_ BitVec 32) List!19767) Bool)

(assert (=> b!963167 (= res!644599 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19764))))

(declare-fun b!963168 () Bool)

(declare-fun e!543108 () Bool)

(assert (=> b!963168 (= e!543108 tp_is_empty!21565)))

(declare-fun b!963169 () Bool)

(assert (=> b!963169 (= e!543107 (not true))))

(assert (=> b!963169 (contains!5425 (getCurrentListMap!3555 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28481 _keys!1686) i!803))))

(declare-datatypes ((Unit!32229 0))(
  ( (Unit!32230) )
))
(declare-fun lt!430948 () Unit!32229)

(declare-fun lemmaInListMapFromThenInFromMinusOne!9 (array!59225 array!59227 (_ BitVec 32) (_ BitVec 32) V!33737 V!33737 (_ BitVec 32) (_ BitVec 32) Int) Unit!32229)

(assert (=> b!963169 (= lt!430948 (lemmaInListMapFromThenInFromMinusOne!9 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963170 () Bool)

(declare-fun res!644597 () Bool)

(assert (=> b!963170 (=> (not res!644597) (not e!543107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59225 (_ BitVec 32)) Bool)

(assert (=> b!963170 (= res!644597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963171 () Bool)

(assert (=> b!963171 (= e!543110 tp_is_empty!21565)))

(declare-fun mapIsEmpty!34342 () Bool)

(assert (=> mapIsEmpty!34342 mapRes!34342))

(declare-fun b!963172 () Bool)

(assert (=> b!963172 (= e!543106 (and e!543108 mapRes!34342))))

(declare-fun condMapEmpty!34342 () Bool)

(declare-fun mapDefault!34342 () ValueCell!10301)

