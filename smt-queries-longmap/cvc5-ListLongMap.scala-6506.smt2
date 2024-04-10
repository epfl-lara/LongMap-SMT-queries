; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82876 () Bool)

(assert start!82876)

(declare-fun b_free!19003 () Bool)

(declare-fun b_next!19003 () Bool)

(assert (=> start!82876 (= b_free!19003 (not b_next!19003))))

(declare-fun tp!66137 () Bool)

(declare-fun b_and!30491 () Bool)

(assert (=> start!82876 (= tp!66137 b_and!30491)))

(declare-fun b!966888 () Bool)

(declare-fun res!647218 () Bool)

(declare-fun e!545035 () Bool)

(assert (=> b!966888 (=> (not res!647218) (not e!545035))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59699 0))(
  ( (array!59700 (arr!28718 (Array (_ BitVec 32) (_ BitVec 64))) (size!29197 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59699)

(declare-datatypes ((V!34065 0))(
  ( (V!34066 (val!10956 Int)) )
))
(declare-fun minValue!1342 () V!34065)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10424 0))(
  ( (ValueCellFull!10424 (v!13514 V!34065)) (EmptyCell!10424) )
))
(declare-datatypes ((array!59701 0))(
  ( (array!59702 (arr!28719 (Array (_ BitVec 32) ValueCell!10424)) (size!29198 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59701)

(declare-fun zeroValue!1342 () V!34065)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14090 0))(
  ( (tuple2!14091 (_1!7056 (_ BitVec 64)) (_2!7056 V!34065)) )
))
(declare-datatypes ((List!19937 0))(
  ( (Nil!19934) (Cons!19933 (h!21095 tuple2!14090) (t!28300 List!19937)) )
))
(declare-datatypes ((ListLongMap!12787 0))(
  ( (ListLongMap!12788 (toList!6409 List!19937)) )
))
(declare-fun contains!5510 (ListLongMap!12787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3642 (array!59699 array!59701 (_ BitVec 32) (_ BitVec 32) V!34065 V!34065 (_ BitVec 32) Int) ListLongMap!12787)

(assert (=> b!966888 (= res!647218 (contains!5510 (getCurrentListMap!3642 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28718 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34711 () Bool)

(declare-fun mapRes!34711 () Bool)

(declare-fun tp!66138 () Bool)

(declare-fun e!545033 () Bool)

(assert (=> mapNonEmpty!34711 (= mapRes!34711 (and tp!66138 e!545033))))

(declare-fun mapValue!34711 () ValueCell!10424)

(declare-fun mapRest!34711 () (Array (_ BitVec 32) ValueCell!10424))

(declare-fun mapKey!34711 () (_ BitVec 32))

(assert (=> mapNonEmpty!34711 (= (arr!28719 _values!1400) (store mapRest!34711 mapKey!34711 mapValue!34711))))

(declare-fun b!966889 () Bool)

(declare-fun res!647214 () Bool)

(assert (=> b!966889 (=> (not res!647214) (not e!545035))))

(assert (=> b!966889 (= res!647214 (and (= (size!29198 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29197 _keys!1686) (size!29198 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34711 () Bool)

(assert (=> mapIsEmpty!34711 mapRes!34711))

(declare-fun b!966891 () Bool)

(declare-fun res!647211 () Bool)

(assert (=> b!966891 (=> (not res!647211) (not e!545035))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966891 (= res!647211 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29197 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29197 _keys!1686))))))

(declare-fun b!966892 () Bool)

(declare-fun res!647213 () Bool)

(assert (=> b!966892 (=> (not res!647213) (not e!545035))))

(declare-datatypes ((List!19938 0))(
  ( (Nil!19935) (Cons!19934 (h!21096 (_ BitVec 64)) (t!28301 List!19938)) )
))
(declare-fun arrayNoDuplicates!0 (array!59699 (_ BitVec 32) List!19938) Bool)

(assert (=> b!966892 (= res!647213 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19935))))

(declare-fun b!966893 () Bool)

(declare-fun e!545036 () Bool)

(declare-fun e!545032 () Bool)

(assert (=> b!966893 (= e!545036 (and e!545032 mapRes!34711))))

(declare-fun condMapEmpty!34711 () Bool)

(declare-fun mapDefault!34711 () ValueCell!10424)

