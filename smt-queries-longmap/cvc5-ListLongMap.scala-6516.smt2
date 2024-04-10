; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82936 () Bool)

(assert start!82936)

(declare-fun b_free!19063 () Bool)

(declare-fun b_next!19063 () Bool)

(assert (=> start!82936 (= b_free!19063 (not b_next!19063))))

(declare-fun tp!66317 () Bool)

(declare-fun b_and!30551 () Bool)

(assert (=> start!82936 (= tp!66317 b_and!30551)))

(declare-fun b!967878 () Bool)

(declare-fun res!647937 () Bool)

(declare-fun e!545482 () Bool)

(assert (=> b!967878 (=> (not res!647937) (not e!545482))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34145 0))(
  ( (V!34146 (val!10986 Int)) )
))
(declare-datatypes ((ValueCell!10454 0))(
  ( (ValueCellFull!10454 (v!13544 V!34145)) (EmptyCell!10454) )
))
(declare-datatypes ((array!59815 0))(
  ( (array!59816 (arr!28776 (Array (_ BitVec 32) ValueCell!10454)) (size!29255 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59815)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-datatypes ((array!59817 0))(
  ( (array!59818 (arr!28777 (Array (_ BitVec 32) (_ BitVec 64))) (size!29256 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59817)

(assert (=> b!967878 (= res!647937 (and (= (size!29255 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29256 _keys!1686) (size!29255 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34801 () Bool)

(declare-fun mapRes!34801 () Bool)

(declare-fun tp!66318 () Bool)

(declare-fun e!545485 () Bool)

(assert (=> mapNonEmpty!34801 (= mapRes!34801 (and tp!66318 e!545485))))

(declare-fun mapRest!34801 () (Array (_ BitVec 32) ValueCell!10454))

(declare-fun mapValue!34801 () ValueCell!10454)

(declare-fun mapKey!34801 () (_ BitVec 32))

(assert (=> mapNonEmpty!34801 (= (arr!28776 _values!1400) (store mapRest!34801 mapKey!34801 mapValue!34801))))

(declare-fun b!967879 () Bool)

(declare-fun res!647935 () Bool)

(assert (=> b!967879 (=> (not res!647935) (not e!545482))))

(declare-datatypes ((List!19978 0))(
  ( (Nil!19975) (Cons!19974 (h!21136 (_ BitVec 64)) (t!28341 List!19978)) )
))
(declare-fun arrayNoDuplicates!0 (array!59817 (_ BitVec 32) List!19978) Bool)

(assert (=> b!967879 (= res!647935 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19975))))

(declare-fun b!967880 () Bool)

(assert (=> b!967880 (= e!545482 (not true))))

(declare-fun minValue!1342 () V!34145)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34145)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14130 0))(
  ( (tuple2!14131 (_1!7076 (_ BitVec 64)) (_2!7076 V!34145)) )
))
(declare-datatypes ((List!19979 0))(
  ( (Nil!19976) (Cons!19975 (h!21137 tuple2!14130) (t!28342 List!19979)) )
))
(declare-datatypes ((ListLongMap!12827 0))(
  ( (ListLongMap!12828 (toList!6429 List!19979)) )
))
(declare-fun contains!5530 (ListLongMap!12827 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3662 (array!59817 array!59815 (_ BitVec 32) (_ BitVec 32) V!34145 V!34145 (_ BitVec 32) Int) ListLongMap!12827)

(assert (=> b!967880 (contains!5530 (getCurrentListMap!3662 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28777 _keys!1686) i!803))))

(declare-datatypes ((Unit!32339 0))(
  ( (Unit!32340) )
))
(declare-fun lt!431461 () Unit!32339)

(declare-fun lemmaInListMapFromThenInFromMinusOne!64 (array!59817 array!59815 (_ BitVec 32) (_ BitVec 32) V!34145 V!34145 (_ BitVec 32) (_ BitVec 32) Int) Unit!32339)

(assert (=> b!967880 (= lt!431461 (lemmaInListMapFromThenInFromMinusOne!64 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967881 () Bool)

(declare-fun tp_is_empty!21871 () Bool)

(assert (=> b!967881 (= e!545485 tp_is_empty!21871)))

(declare-fun res!647931 () Bool)

(assert (=> start!82936 (=> (not res!647931) (not e!545482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82936 (= res!647931 (validMask!0 mask!2110))))

(assert (=> start!82936 e!545482))

(assert (=> start!82936 true))

(declare-fun e!545483 () Bool)

(declare-fun array_inv!22277 (array!59815) Bool)

(assert (=> start!82936 (and (array_inv!22277 _values!1400) e!545483)))

(declare-fun array_inv!22278 (array!59817) Bool)

(assert (=> start!82936 (array_inv!22278 _keys!1686)))

(assert (=> start!82936 tp!66317))

(assert (=> start!82936 tp_is_empty!21871))

(declare-fun b!967882 () Bool)

(declare-fun res!647938 () Bool)

(assert (=> b!967882 (=> (not res!647938) (not e!545482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967882 (= res!647938 (validKeyInArray!0 (select (arr!28777 _keys!1686) i!803)))))

(declare-fun b!967883 () Bool)

(declare-fun res!647933 () Bool)

(assert (=> b!967883 (=> (not res!647933) (not e!545482))))

(assert (=> b!967883 (= res!647933 (contains!5530 (getCurrentListMap!3662 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28777 _keys!1686) i!803)))))

(declare-fun b!967884 () Bool)

(declare-fun e!545486 () Bool)

(assert (=> b!967884 (= e!545483 (and e!545486 mapRes!34801))))

(declare-fun condMapEmpty!34801 () Bool)

(declare-fun mapDefault!34801 () ValueCell!10454)

