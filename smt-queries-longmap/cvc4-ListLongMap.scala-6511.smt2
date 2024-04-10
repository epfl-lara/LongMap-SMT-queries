; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82910 () Bool)

(assert start!82910)

(declare-fun b_free!19037 () Bool)

(declare-fun b_next!19037 () Bool)

(assert (=> start!82910 (= b_free!19037 (not b_next!19037))))

(declare-fun tp!66239 () Bool)

(declare-fun b_and!30525 () Bool)

(assert (=> start!82910 (= tp!66239 b_and!30525)))

(declare-fun mapNonEmpty!34762 () Bool)

(declare-fun mapRes!34762 () Bool)

(declare-fun tp!66240 () Bool)

(declare-fun e!545291 () Bool)

(assert (=> mapNonEmpty!34762 (= mapRes!34762 (and tp!66240 e!545291))))

(declare-datatypes ((V!34109 0))(
  ( (V!34110 (val!10973 Int)) )
))
(declare-datatypes ((ValueCell!10441 0))(
  ( (ValueCellFull!10441 (v!13531 V!34109)) (EmptyCell!10441) )
))
(declare-fun mapRest!34762 () (Array (_ BitVec 32) ValueCell!10441))

(declare-datatypes ((array!59763 0))(
  ( (array!59764 (arr!28750 (Array (_ BitVec 32) ValueCell!10441)) (size!29229 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59763)

(declare-fun mapValue!34762 () ValueCell!10441)

(declare-fun mapKey!34762 () (_ BitVec 32))

(assert (=> mapNonEmpty!34762 (= (arr!28750 _values!1400) (store mapRest!34762 mapKey!34762 mapValue!34762))))

(declare-fun b!967449 () Bool)

(declare-fun res!647620 () Bool)

(declare-fun e!545287 () Bool)

(assert (=> b!967449 (=> (not res!647620) (not e!545287))))

(declare-datatypes ((array!59765 0))(
  ( (array!59766 (arr!28751 (Array (_ BitVec 32) (_ BitVec 64))) (size!29230 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59765)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967449 (= res!647620 (validKeyInArray!0 (select (arr!28751 _keys!1686) i!803)))))

(declare-fun b!967450 () Bool)

(declare-fun res!647624 () Bool)

(assert (=> b!967450 (=> (not res!647624) (not e!545287))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967450 (= res!647624 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967451 () Bool)

(declare-fun tp_is_empty!21845 () Bool)

(assert (=> b!967451 (= e!545291 tp_is_empty!21845)))

(declare-fun b!967452 () Bool)

(declare-fun res!647626 () Bool)

(assert (=> b!967452 (=> (not res!647626) (not e!545287))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59765 (_ BitVec 32)) Bool)

(assert (=> b!967452 (= res!647626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967453 () Bool)

(assert (=> b!967453 (= e!545287 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34109)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34109)

(declare-datatypes ((tuple2!14112 0))(
  ( (tuple2!14113 (_1!7067 (_ BitVec 64)) (_2!7067 V!34109)) )
))
(declare-datatypes ((List!19962 0))(
  ( (Nil!19959) (Cons!19958 (h!21120 tuple2!14112) (t!28325 List!19962)) )
))
(declare-datatypes ((ListLongMap!12809 0))(
  ( (ListLongMap!12810 (toList!6420 List!19962)) )
))
(declare-fun contains!5521 (ListLongMap!12809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3653 (array!59765 array!59763 (_ BitVec 32) (_ BitVec 32) V!34109 V!34109 (_ BitVec 32) Int) ListLongMap!12809)

(assert (=> b!967453 (contains!5521 (getCurrentListMap!3653 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28751 _keys!1686) i!803))))

(declare-datatypes ((Unit!32323 0))(
  ( (Unit!32324) )
))
(declare-fun lt!431422 () Unit!32323)

(declare-fun lemmaInListMapFromThenInFromMinusOne!56 (array!59765 array!59763 (_ BitVec 32) (_ BitVec 32) V!34109 V!34109 (_ BitVec 32) (_ BitVec 32) Int) Unit!32323)

(assert (=> b!967453 (= lt!431422 (lemmaInListMapFromThenInFromMinusOne!56 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967454 () Bool)

(declare-fun res!647622 () Bool)

(assert (=> b!967454 (=> (not res!647622) (not e!545287))))

(assert (=> b!967454 (= res!647622 (and (= (size!29229 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29230 _keys!1686) (size!29229 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34762 () Bool)

(assert (=> mapIsEmpty!34762 mapRes!34762))

(declare-fun b!967455 () Bool)

(declare-fun e!545289 () Bool)

(assert (=> b!967455 (= e!545289 tp_is_empty!21845)))

(declare-fun res!647625 () Bool)

(assert (=> start!82910 (=> (not res!647625) (not e!545287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82910 (= res!647625 (validMask!0 mask!2110))))

(assert (=> start!82910 e!545287))

(assert (=> start!82910 true))

(declare-fun e!545290 () Bool)

(declare-fun array_inv!22263 (array!59763) Bool)

(assert (=> start!82910 (and (array_inv!22263 _values!1400) e!545290)))

(declare-fun array_inv!22264 (array!59765) Bool)

(assert (=> start!82910 (array_inv!22264 _keys!1686)))

(assert (=> start!82910 tp!66239))

(assert (=> start!82910 tp_is_empty!21845))

(declare-fun b!967456 () Bool)

(declare-fun res!647619 () Bool)

(assert (=> b!967456 (=> (not res!647619) (not e!545287))))

(assert (=> b!967456 (= res!647619 (contains!5521 (getCurrentListMap!3653 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28751 _keys!1686) i!803)))))

(declare-fun b!967457 () Bool)

(assert (=> b!967457 (= e!545290 (and e!545289 mapRes!34762))))

(declare-fun condMapEmpty!34762 () Bool)

(declare-fun mapDefault!34762 () ValueCell!10441)

