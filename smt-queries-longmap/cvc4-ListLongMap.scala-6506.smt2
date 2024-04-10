; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82880 () Bool)

(assert start!82880)

(declare-fun b_free!19007 () Bool)

(declare-fun b_next!19007 () Bool)

(assert (=> start!82880 (= b_free!19007 (not b_next!19007))))

(declare-fun tp!66150 () Bool)

(declare-fun b_and!30495 () Bool)

(assert (=> start!82880 (= tp!66150 b_and!30495)))

(declare-fun b!966954 () Bool)

(declare-fun e!545062 () Bool)

(declare-fun tp_is_empty!21815 () Bool)

(assert (=> b!966954 (= e!545062 tp_is_empty!21815)))

(declare-fun b!966955 () Bool)

(declare-fun e!545066 () Bool)

(assert (=> b!966955 (= e!545066 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34069 0))(
  ( (V!34070 (val!10958 Int)) )
))
(declare-datatypes ((ValueCell!10426 0))(
  ( (ValueCellFull!10426 (v!13516 V!34069)) (EmptyCell!10426) )
))
(declare-datatypes ((array!59707 0))(
  ( (array!59708 (arr!28722 (Array (_ BitVec 32) ValueCell!10426)) (size!29201 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59707)

(declare-datatypes ((array!59709 0))(
  ( (array!59710 (arr!28723 (Array (_ BitVec 32) (_ BitVec 64))) (size!29202 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59709)

(declare-fun minValue!1342 () V!34069)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34069)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14094 0))(
  ( (tuple2!14095 (_1!7058 (_ BitVec 64)) (_2!7058 V!34069)) )
))
(declare-datatypes ((List!19941 0))(
  ( (Nil!19938) (Cons!19937 (h!21099 tuple2!14094) (t!28304 List!19941)) )
))
(declare-datatypes ((ListLongMap!12791 0))(
  ( (ListLongMap!12792 (toList!6411 List!19941)) )
))
(declare-fun contains!5512 (ListLongMap!12791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3644 (array!59709 array!59707 (_ BitVec 32) (_ BitVec 32) V!34069 V!34069 (_ BitVec 32) Int) ListLongMap!12791)

(assert (=> b!966955 (contains!5512 (getCurrentListMap!3644 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28723 _keys!1686) i!803))))

(declare-datatypes ((Unit!32307 0))(
  ( (Unit!32308) )
))
(declare-fun lt!431377 () Unit!32307)

(declare-fun lemmaInListMapFromThenInFromMinusOne!48 (array!59709 array!59707 (_ BitVec 32) (_ BitVec 32) V!34069 V!34069 (_ BitVec 32) (_ BitVec 32) Int) Unit!32307)

(assert (=> b!966955 (= lt!431377 (lemmaInListMapFromThenInFromMinusOne!48 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34717 () Bool)

(declare-fun mapRes!34717 () Bool)

(assert (=> mapIsEmpty!34717 mapRes!34717))

(declare-fun mapNonEmpty!34717 () Bool)

(declare-fun tp!66149 () Bool)

(assert (=> mapNonEmpty!34717 (= mapRes!34717 (and tp!66149 e!545062))))

(declare-fun mapKey!34717 () (_ BitVec 32))

(declare-fun mapValue!34717 () ValueCell!10426)

(declare-fun mapRest!34717 () (Array (_ BitVec 32) ValueCell!10426))

(assert (=> mapNonEmpty!34717 (= (arr!28722 _values!1400) (store mapRest!34717 mapKey!34717 mapValue!34717))))

(declare-fun b!966956 () Bool)

(declare-fun res!647266 () Bool)

(assert (=> b!966956 (=> (not res!647266) (not e!545066))))

(declare-datatypes ((List!19942 0))(
  ( (Nil!19939) (Cons!19938 (h!21100 (_ BitVec 64)) (t!28305 List!19942)) )
))
(declare-fun arrayNoDuplicates!0 (array!59709 (_ BitVec 32) List!19942) Bool)

(assert (=> b!966956 (= res!647266 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19939))))

(declare-fun b!966957 () Bool)

(declare-fun res!647262 () Bool)

(assert (=> b!966957 (=> (not res!647262) (not e!545066))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966957 (= res!647262 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966958 () Bool)

(declare-fun res!647264 () Bool)

(assert (=> b!966958 (=> (not res!647264) (not e!545066))))

(assert (=> b!966958 (= res!647264 (contains!5512 (getCurrentListMap!3644 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28723 _keys!1686) i!803)))))

(declare-fun res!647263 () Bool)

(assert (=> start!82880 (=> (not res!647263) (not e!545066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82880 (= res!647263 (validMask!0 mask!2110))))

(assert (=> start!82880 e!545066))

(assert (=> start!82880 true))

(declare-fun e!545065 () Bool)

(declare-fun array_inv!22245 (array!59707) Bool)

(assert (=> start!82880 (and (array_inv!22245 _values!1400) e!545065)))

(declare-fun array_inv!22246 (array!59709) Bool)

(assert (=> start!82880 (array_inv!22246 _keys!1686)))

(assert (=> start!82880 tp!66150))

(assert (=> start!82880 tp_is_empty!21815))

(declare-fun b!966959 () Bool)

(declare-fun res!647265 () Bool)

(assert (=> b!966959 (=> (not res!647265) (not e!545066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966959 (= res!647265 (validKeyInArray!0 (select (arr!28723 _keys!1686) i!803)))))

(declare-fun b!966960 () Bool)

(declare-fun res!647259 () Bool)

(assert (=> b!966960 (=> (not res!647259) (not e!545066))))

(assert (=> b!966960 (= res!647259 (and (= (size!29201 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29202 _keys!1686) (size!29201 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966961 () Bool)

(declare-fun res!647260 () Bool)

(assert (=> b!966961 (=> (not res!647260) (not e!545066))))

(assert (=> b!966961 (= res!647260 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29202 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29202 _keys!1686))))))

(declare-fun b!966962 () Bool)

(declare-fun e!545064 () Bool)

(assert (=> b!966962 (= e!545064 tp_is_empty!21815)))

(declare-fun b!966963 () Bool)

(assert (=> b!966963 (= e!545065 (and e!545064 mapRes!34717))))

(declare-fun condMapEmpty!34717 () Bool)

(declare-fun mapDefault!34717 () ValueCell!10426)

