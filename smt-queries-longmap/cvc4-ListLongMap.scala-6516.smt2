; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82940 () Bool)

(assert start!82940)

(declare-fun b_free!19067 () Bool)

(declare-fun b_next!19067 () Bool)

(assert (=> start!82940 (= b_free!19067 (not b_next!19067))))

(declare-fun tp!66329 () Bool)

(declare-fun b_and!30555 () Bool)

(assert (=> start!82940 (= tp!66329 b_and!30555)))

(declare-fun b!967944 () Bool)

(declare-fun res!647981 () Bool)

(declare-fun e!545512 () Bool)

(assert (=> b!967944 (=> (not res!647981) (not e!545512))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967944 (= res!647981 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34807 () Bool)

(declare-fun mapRes!34807 () Bool)

(assert (=> mapIsEmpty!34807 mapRes!34807))

(declare-fun b!967945 () Bool)

(declare-fun e!545513 () Bool)

(declare-fun tp_is_empty!21875 () Bool)

(assert (=> b!967945 (= e!545513 tp_is_empty!21875)))

(declare-fun b!967946 () Bool)

(assert (=> b!967946 (= e!545512 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34149 0))(
  ( (V!34150 (val!10988 Int)) )
))
(declare-datatypes ((ValueCell!10456 0))(
  ( (ValueCellFull!10456 (v!13546 V!34149)) (EmptyCell!10456) )
))
(declare-datatypes ((array!59823 0))(
  ( (array!59824 (arr!28780 (Array (_ BitVec 32) ValueCell!10456)) (size!29259 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59823)

(declare-datatypes ((array!59825 0))(
  ( (array!59826 (arr!28781 (Array (_ BitVec 32) (_ BitVec 64))) (size!29260 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59825)

(declare-fun minValue!1342 () V!34149)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34149)

(declare-datatypes ((tuple2!14134 0))(
  ( (tuple2!14135 (_1!7078 (_ BitVec 64)) (_2!7078 V!34149)) )
))
(declare-datatypes ((List!19982 0))(
  ( (Nil!19979) (Cons!19978 (h!21140 tuple2!14134) (t!28345 List!19982)) )
))
(declare-datatypes ((ListLongMap!12831 0))(
  ( (ListLongMap!12832 (toList!6431 List!19982)) )
))
(declare-fun contains!5532 (ListLongMap!12831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3664 (array!59825 array!59823 (_ BitVec 32) (_ BitVec 32) V!34149 V!34149 (_ BitVec 32) Int) ListLongMap!12831)

(assert (=> b!967946 (contains!5532 (getCurrentListMap!3664 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28781 _keys!1686) i!803))))

(declare-datatypes ((Unit!32343 0))(
  ( (Unit!32344) )
))
(declare-fun lt!431467 () Unit!32343)

(declare-fun lemmaInListMapFromThenInFromMinusOne!66 (array!59825 array!59823 (_ BitVec 32) (_ BitVec 32) V!34149 V!34149 (_ BitVec 32) (_ BitVec 32) Int) Unit!32343)

(assert (=> b!967946 (= lt!431467 (lemmaInListMapFromThenInFromMinusOne!66 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967947 () Bool)

(declare-fun e!545515 () Bool)

(assert (=> b!967947 (= e!545515 tp_is_empty!21875)))

(declare-fun b!967948 () Bool)

(declare-fun res!647979 () Bool)

(assert (=> b!967948 (=> (not res!647979) (not e!545512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967948 (= res!647979 (validKeyInArray!0 (select (arr!28781 _keys!1686) i!803)))))

(declare-fun b!967949 () Bool)

(declare-fun res!647984 () Bool)

(assert (=> b!967949 (=> (not res!647984) (not e!545512))))

(declare-datatypes ((List!19983 0))(
  ( (Nil!19980) (Cons!19979 (h!21141 (_ BitVec 64)) (t!28346 List!19983)) )
))
(declare-fun arrayNoDuplicates!0 (array!59825 (_ BitVec 32) List!19983) Bool)

(assert (=> b!967949 (= res!647984 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19980))))

(declare-fun b!967950 () Bool)

(declare-fun res!647983 () Bool)

(assert (=> b!967950 (=> (not res!647983) (not e!545512))))

(assert (=> b!967950 (= res!647983 (and (= (size!29259 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29260 _keys!1686) (size!29259 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967951 () Bool)

(declare-fun res!647986 () Bool)

(assert (=> b!967951 (=> (not res!647986) (not e!545512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59825 (_ BitVec 32)) Bool)

(assert (=> b!967951 (= res!647986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967952 () Bool)

(declare-fun res!647982 () Bool)

(assert (=> b!967952 (=> (not res!647982) (not e!545512))))

(assert (=> b!967952 (= res!647982 (contains!5532 (getCurrentListMap!3664 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28781 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34807 () Bool)

(declare-fun tp!66330 () Bool)

(assert (=> mapNonEmpty!34807 (= mapRes!34807 (and tp!66330 e!545513))))

(declare-fun mapRest!34807 () (Array (_ BitVec 32) ValueCell!10456))

(declare-fun mapValue!34807 () ValueCell!10456)

(declare-fun mapKey!34807 () (_ BitVec 32))

(assert (=> mapNonEmpty!34807 (= (arr!28780 _values!1400) (store mapRest!34807 mapKey!34807 mapValue!34807))))

(declare-fun res!647980 () Bool)

(assert (=> start!82940 (=> (not res!647980) (not e!545512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82940 (= res!647980 (validMask!0 mask!2110))))

(assert (=> start!82940 e!545512))

(assert (=> start!82940 true))

(declare-fun e!545516 () Bool)

(declare-fun array_inv!22281 (array!59823) Bool)

(assert (=> start!82940 (and (array_inv!22281 _values!1400) e!545516)))

(declare-fun array_inv!22282 (array!59825) Bool)

(assert (=> start!82940 (array_inv!22282 _keys!1686)))

(assert (=> start!82940 tp!66329))

(assert (=> start!82940 tp_is_empty!21875))

(declare-fun b!967953 () Bool)

(assert (=> b!967953 (= e!545516 (and e!545515 mapRes!34807))))

(declare-fun condMapEmpty!34807 () Bool)

(declare-fun mapDefault!34807 () ValueCell!10456)

