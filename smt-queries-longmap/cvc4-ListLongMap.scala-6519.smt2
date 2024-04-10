; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82958 () Bool)

(assert start!82958)

(declare-fun b_free!19085 () Bool)

(declare-fun b_next!19085 () Bool)

(assert (=> start!82958 (= b_free!19085 (not b_next!19085))))

(declare-fun tp!66384 () Bool)

(declare-fun b_and!30573 () Bool)

(assert (=> start!82958 (= tp!66384 b_and!30573)))

(declare-fun b!968258 () Bool)

(declare-fun res!648215 () Bool)

(declare-fun e!545668 () Bool)

(assert (=> b!968258 (=> (not res!648215) (not e!545668))))

(declare-datatypes ((array!59857 0))(
  ( (array!59858 (arr!28797 (Array (_ BitVec 32) (_ BitVec 64))) (size!29276 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59857)

(declare-datatypes ((List!19996 0))(
  ( (Nil!19993) (Cons!19992 (h!21154 (_ BitVec 64)) (t!28359 List!19996)) )
))
(declare-fun arrayNoDuplicates!0 (array!59857 (_ BitVec 32) List!19996) Bool)

(assert (=> b!968258 (= res!648215 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19993))))

(declare-fun b!968259 () Bool)

(declare-fun res!648218 () Bool)

(assert (=> b!968259 (=> (not res!648218) (not e!545668))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34173 0))(
  ( (V!34174 (val!10997 Int)) )
))
(declare-datatypes ((ValueCell!10465 0))(
  ( (ValueCellFull!10465 (v!13555 V!34173)) (EmptyCell!10465) )
))
(declare-datatypes ((array!59859 0))(
  ( (array!59860 (arr!28798 (Array (_ BitVec 32) ValueCell!10465)) (size!29277 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59859)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!968259 (= res!648218 (and (= (size!29277 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29276 _keys!1686) (size!29277 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968260 () Bool)

(declare-fun e!545665 () Bool)

(declare-fun tp_is_empty!21893 () Bool)

(assert (=> b!968260 (= e!545665 tp_is_empty!21893)))

(declare-fun b!968261 () Bool)

(declare-fun e!545666 () Bool)

(assert (=> b!968261 (= e!545668 (not e!545666))))

(declare-fun res!648216 () Bool)

(assert (=> b!968261 (=> res!648216 e!545666)))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968261 (= res!648216 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29276 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!34173)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34173)

(declare-datatypes ((tuple2!14150 0))(
  ( (tuple2!14151 (_1!7086 (_ BitVec 64)) (_2!7086 V!34173)) )
))
(declare-datatypes ((List!19997 0))(
  ( (Nil!19994) (Cons!19993 (h!21155 tuple2!14150) (t!28360 List!19997)) )
))
(declare-datatypes ((ListLongMap!12847 0))(
  ( (ListLongMap!12848 (toList!6439 List!19997)) )
))
(declare-fun contains!5540 (ListLongMap!12847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3672 (array!59857 array!59859 (_ BitVec 32) (_ BitVec 32) V!34173 V!34173 (_ BitVec 32) Int) ListLongMap!12847)

(assert (=> b!968261 (contains!5540 (getCurrentListMap!3672 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28797 _keys!1686) i!803))))

(declare-datatypes ((Unit!32359 0))(
  ( (Unit!32360) )
))
(declare-fun lt!431512 () Unit!32359)

(declare-fun lemmaInListMapFromThenInFromMinusOne!73 (array!59857 array!59859 (_ BitVec 32) (_ BitVec 32) V!34173 V!34173 (_ BitVec 32) (_ BitVec 32) Int) Unit!32359)

(assert (=> b!968261 (= lt!431512 (lemmaInListMapFromThenInFromMinusOne!73 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968262 () Bool)

(declare-fun res!648213 () Bool)

(assert (=> b!968262 (=> (not res!648213) (not e!545668))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968262 (= res!648213 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34834 () Bool)

(declare-fun mapRes!34834 () Bool)

(declare-fun tp!66383 () Bool)

(assert (=> mapNonEmpty!34834 (= mapRes!34834 (and tp!66383 e!545665))))

(declare-fun mapKey!34834 () (_ BitVec 32))

(declare-fun mapValue!34834 () ValueCell!10465)

(declare-fun mapRest!34834 () (Array (_ BitVec 32) ValueCell!10465))

(assert (=> mapNonEmpty!34834 (= (arr!28798 _values!1400) (store mapRest!34834 mapKey!34834 mapValue!34834))))

(declare-fun b!968264 () Bool)

(declare-fun res!648212 () Bool)

(assert (=> b!968264 (=> (not res!648212) (not e!545668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968264 (= res!648212 (validKeyInArray!0 (select (arr!28797 _keys!1686) i!803)))))

(declare-fun b!968265 () Bool)

(declare-fun res!648220 () Bool)

(assert (=> b!968265 (=> (not res!648220) (not e!545668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59857 (_ BitVec 32)) Bool)

(assert (=> b!968265 (= res!648220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968266 () Bool)

(declare-fun e!545667 () Bool)

(declare-fun e!545669 () Bool)

(assert (=> b!968266 (= e!545667 (and e!545669 mapRes!34834))))

(declare-fun condMapEmpty!34834 () Bool)

(declare-fun mapDefault!34834 () ValueCell!10465)

