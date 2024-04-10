; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82826 () Bool)

(assert start!82826)

(declare-fun b_free!18953 () Bool)

(declare-fun b_next!18953 () Bool)

(assert (=> start!82826 (= b_free!18953 (not b_next!18953))))

(declare-fun tp!65987 () Bool)

(declare-fun b_and!30441 () Bool)

(assert (=> start!82826 (= tp!65987 b_and!30441)))

(declare-fun b!966182 () Bool)

(declare-fun res!646732 () Bool)

(declare-fun e!544657 () Bool)

(assert (=> b!966182 (=> (not res!646732) (not e!544657))))

(declare-datatypes ((array!59607 0))(
  ( (array!59608 (arr!28672 (Array (_ BitVec 32) (_ BitVec 64))) (size!29151 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59607)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966182 (= res!646732 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29151 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29151 _keys!1686))))))

(declare-fun mapIsEmpty!34636 () Bool)

(declare-fun mapRes!34636 () Bool)

(assert (=> mapIsEmpty!34636 mapRes!34636))

(declare-fun b!966184 () Bool)

(declare-fun e!544661 () Bool)

(declare-fun tp_is_empty!21761 () Bool)

(assert (=> b!966184 (= e!544661 tp_is_empty!21761)))

(declare-fun b!966185 () Bool)

(assert (=> b!966185 (= e!544657 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33997 0))(
  ( (V!33998 (val!10931 Int)) )
))
(declare-fun minValue!1342 () V!33997)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!431305 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((ValueCell!10399 0))(
  ( (ValueCellFull!10399 (v!13489 V!33997)) (EmptyCell!10399) )
))
(declare-datatypes ((array!59609 0))(
  ( (array!59610 (arr!28673 (Array (_ BitVec 32) ValueCell!10399)) (size!29152 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59609)

(declare-fun zeroValue!1342 () V!33997)

(declare-datatypes ((tuple2!14060 0))(
  ( (tuple2!14061 (_1!7041 (_ BitVec 64)) (_2!7041 V!33997)) )
))
(declare-datatypes ((List!19901 0))(
  ( (Nil!19898) (Cons!19897 (h!21059 tuple2!14060) (t!28264 List!19901)) )
))
(declare-datatypes ((ListLongMap!12757 0))(
  ( (ListLongMap!12758 (toList!6394 List!19901)) )
))
(declare-fun contains!5495 (ListLongMap!12757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3627 (array!59607 array!59609 (_ BitVec 32) (_ BitVec 32) V!33997 V!33997 (_ BitVec 32) Int) ListLongMap!12757)

(assert (=> b!966185 (= lt!431305 (contains!5495 (getCurrentListMap!3627 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28672 _keys!1686) i!803)))))

(declare-fun b!966186 () Bool)

(declare-fun res!646734 () Bool)

(assert (=> b!966186 (=> (not res!646734) (not e!544657))))

(declare-datatypes ((List!19902 0))(
  ( (Nil!19899) (Cons!19898 (h!21060 (_ BitVec 64)) (t!28265 List!19902)) )
))
(declare-fun arrayNoDuplicates!0 (array!59607 (_ BitVec 32) List!19902) Bool)

(assert (=> b!966186 (= res!646734 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19899))))

(declare-fun b!966187 () Bool)

(declare-fun res!646730 () Bool)

(assert (=> b!966187 (=> (not res!646730) (not e!544657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59607 (_ BitVec 32)) Bool)

(assert (=> b!966187 (= res!646730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966183 () Bool)

(declare-fun res!646733 () Bool)

(assert (=> b!966183 (=> (not res!646733) (not e!544657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966183 (= res!646733 (validKeyInArray!0 (select (arr!28672 _keys!1686) i!803)))))

(declare-fun res!646735 () Bool)

(assert (=> start!82826 (=> (not res!646735) (not e!544657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82826 (= res!646735 (validMask!0 mask!2110))))

(assert (=> start!82826 e!544657))

(assert (=> start!82826 true))

(declare-fun e!544660 () Bool)

(declare-fun array_inv!22209 (array!59609) Bool)

(assert (=> start!82826 (and (array_inv!22209 _values!1400) e!544660)))

(declare-fun array_inv!22210 (array!59607) Bool)

(assert (=> start!82826 (array_inv!22210 _keys!1686)))

(assert (=> start!82826 tp!65987))

(assert (=> start!82826 tp_is_empty!21761))

(declare-fun b!966188 () Bool)

(declare-fun e!544659 () Bool)

(assert (=> b!966188 (= e!544660 (and e!544659 mapRes!34636))))

(declare-fun condMapEmpty!34636 () Bool)

(declare-fun mapDefault!34636 () ValueCell!10399)

