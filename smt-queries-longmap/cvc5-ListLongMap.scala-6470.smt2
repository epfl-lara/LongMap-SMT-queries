; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82660 () Bool)

(assert start!82660)

(declare-fun b_free!18793 () Bool)

(declare-fun b_next!18793 () Bool)

(assert (=> start!82660 (= b_free!18793 (not b_next!18793))))

(declare-fun tp!65498 () Bool)

(declare-fun b_and!30281 () Bool)

(assert (=> start!82660 (= tp!65498 b_and!30281)))

(declare-fun b!963657 () Bool)

(declare-fun res!644956 () Bool)

(declare-fun e!543333 () Bool)

(assert (=> b!963657 (=> (not res!644956) (not e!543333))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963657 (= res!644956 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34387 () Bool)

(declare-fun mapRes!34387 () Bool)

(assert (=> mapIsEmpty!34387 mapRes!34387))

(declare-fun b!963659 () Bool)

(declare-fun res!644954 () Bool)

(assert (=> b!963659 (=> (not res!644954) (not e!543333))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33777 0))(
  ( (V!33778 (val!10848 Int)) )
))
(declare-datatypes ((ValueCell!10316 0))(
  ( (ValueCellFull!10316 (v!13406 V!33777)) (EmptyCell!10316) )
))
(declare-datatypes ((array!59281 0))(
  ( (array!59282 (arr!28509 (Array (_ BitVec 32) ValueCell!10316)) (size!28988 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59281)

(declare-datatypes ((array!59283 0))(
  ( (array!59284 (arr!28510 (Array (_ BitVec 32) (_ BitVec 64))) (size!28989 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59283)

(declare-fun minValue!1342 () V!33777)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33777)

(declare-datatypes ((tuple2!13934 0))(
  ( (tuple2!13935 (_1!6978 (_ BitVec 64)) (_2!6978 V!33777)) )
))
(declare-datatypes ((List!19785 0))(
  ( (Nil!19782) (Cons!19781 (h!20943 tuple2!13934) (t!28148 List!19785)) )
))
(declare-datatypes ((ListLongMap!12631 0))(
  ( (ListLongMap!12632 (toList!6331 List!19785)) )
))
(declare-fun contains!5434 (ListLongMap!12631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3564 (array!59283 array!59281 (_ BitVec 32) (_ BitVec 32) V!33777 V!33777 (_ BitVec 32) Int) ListLongMap!12631)

(assert (=> b!963659 (= res!644954 (contains!5434 (getCurrentListMap!3564 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28510 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34387 () Bool)

(declare-fun tp!65499 () Bool)

(declare-fun e!543332 () Bool)

(assert (=> mapNonEmpty!34387 (= mapRes!34387 (and tp!65499 e!543332))))

(declare-fun mapValue!34387 () ValueCell!10316)

(declare-fun mapRest!34387 () (Array (_ BitVec 32) ValueCell!10316))

(declare-fun mapKey!34387 () (_ BitVec 32))

(assert (=> mapNonEmpty!34387 (= (arr!28509 _values!1400) (store mapRest!34387 mapKey!34387 mapValue!34387))))

(declare-fun b!963660 () Bool)

(declare-fun e!543331 () Bool)

(declare-fun tp_is_empty!21595 () Bool)

(assert (=> b!963660 (= e!543331 tp_is_empty!21595)))

(declare-fun b!963661 () Bool)

(declare-fun res!644952 () Bool)

(assert (=> b!963661 (=> (not res!644952) (not e!543333))))

(assert (=> b!963661 (= res!644952 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28989 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28989 _keys!1686))))))

(declare-fun b!963662 () Bool)

(declare-fun res!644953 () Bool)

(assert (=> b!963662 (=> (not res!644953) (not e!543333))))

(assert (=> b!963662 (= res!644953 (and (= (size!28988 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28989 _keys!1686) (size!28988 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963663 () Bool)

(declare-fun res!644955 () Bool)

(assert (=> b!963663 (=> (not res!644955) (not e!543333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59283 (_ BitVec 32)) Bool)

(assert (=> b!963663 (= res!644955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963664 () Bool)

(assert (=> b!963664 (= e!543333 (not true))))

(assert (=> b!963664 (contains!5434 (getCurrentListMap!3564 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28510 _keys!1686) i!803))))

(declare-datatypes ((Unit!32245 0))(
  ( (Unit!32246) )
))
(declare-fun lt!430993 () Unit!32245)

(declare-fun lemmaInListMapFromThenInFromMinusOne!17 (array!59283 array!59281 (_ BitVec 32) (_ BitVec 32) V!33777 V!33777 (_ BitVec 32) (_ BitVec 32) Int) Unit!32245)

(assert (=> b!963664 (= lt!430993 (lemmaInListMapFromThenInFromMinusOne!17 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963665 () Bool)

(declare-fun res!644957 () Bool)

(assert (=> b!963665 (=> (not res!644957) (not e!543333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963665 (= res!644957 (validKeyInArray!0 (select (arr!28510 _keys!1686) i!803)))))

(declare-fun res!644958 () Bool)

(assert (=> start!82660 (=> (not res!644958) (not e!543333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82660 (= res!644958 (validMask!0 mask!2110))))

(assert (=> start!82660 e!543333))

(assert (=> start!82660 true))

(declare-fun e!543335 () Bool)

(declare-fun array_inv!22085 (array!59281) Bool)

(assert (=> start!82660 (and (array_inv!22085 _values!1400) e!543335)))

(declare-fun array_inv!22086 (array!59283) Bool)

(assert (=> start!82660 (array_inv!22086 _keys!1686)))

(assert (=> start!82660 tp!65498))

(assert (=> start!82660 tp_is_empty!21595))

(declare-fun b!963658 () Bool)

(assert (=> b!963658 (= e!543332 tp_is_empty!21595)))

(declare-fun b!963666 () Bool)

(declare-fun res!644959 () Bool)

(assert (=> b!963666 (=> (not res!644959) (not e!543333))))

(declare-datatypes ((List!19786 0))(
  ( (Nil!19783) (Cons!19782 (h!20944 (_ BitVec 64)) (t!28149 List!19786)) )
))
(declare-fun arrayNoDuplicates!0 (array!59283 (_ BitVec 32) List!19786) Bool)

(assert (=> b!963666 (= res!644959 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19783))))

(declare-fun b!963667 () Bool)

(assert (=> b!963667 (= e!543335 (and e!543331 mapRes!34387))))

(declare-fun condMapEmpty!34387 () Bool)

(declare-fun mapDefault!34387 () ValueCell!10316)

