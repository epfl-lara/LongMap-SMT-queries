; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82948 () Bool)

(assert start!82948)

(declare-fun b_free!19075 () Bool)

(declare-fun b_next!19075 () Bool)

(assert (=> start!82948 (= b_free!19075 (not b_next!19075))))

(declare-fun tp!66354 () Bool)

(declare-fun b_and!30563 () Bool)

(assert (=> start!82948 (= tp!66354 b_and!30563)))

(declare-fun b!968078 () Bool)

(declare-fun e!545576 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968078 (= e!545576 (bvsge i!803 #b00000000000000000000000000000000))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34161 0))(
  ( (V!34162 (val!10992 Int)) )
))
(declare-datatypes ((ValueCell!10460 0))(
  ( (ValueCellFull!10460 (v!13550 V!34161)) (EmptyCell!10460) )
))
(declare-datatypes ((array!59839 0))(
  ( (array!59840 (arr!28788 (Array (_ BitVec 32) ValueCell!10460)) (size!29267 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59839)

(declare-datatypes ((array!59841 0))(
  ( (array!59842 (arr!28789 (Array (_ BitVec 32) (_ BitVec 64))) (size!29268 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59841)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34161)

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!34161)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-datatypes ((tuple2!14142 0))(
  ( (tuple2!14143 (_1!7082 (_ BitVec 64)) (_2!7082 V!34161)) )
))
(declare-datatypes ((List!19989 0))(
  ( (Nil!19986) (Cons!19985 (h!21147 tuple2!14142) (t!28352 List!19989)) )
))
(declare-datatypes ((ListLongMap!12839 0))(
  ( (ListLongMap!12840 (toList!6435 List!19989)) )
))
(declare-fun contains!5536 (ListLongMap!12839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3668 (array!59841 array!59839 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) Int) ListLongMap!12839)

(assert (=> b!968078 (contains!5536 (getCurrentListMap!3668 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28789 _keys!1686) i!803))))

(declare-datatypes ((Unit!32351 0))(
  ( (Unit!32352) )
))
(declare-fun lt!431482 () Unit!32351)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!39 (array!59841 array!59839 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32351)

(assert (=> b!968078 (= lt!431482 (lemmaInListMapFromThenInFromSmaller!39 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!968079 () Bool)

(declare-fun res!648078 () Bool)

(declare-fun e!545578 () Bool)

(assert (=> b!968079 (=> (not res!648078) (not e!545578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968079 (= res!648078 (validKeyInArray!0 (select (arr!28789 _keys!1686) i!803)))))

(declare-fun res!648080 () Bool)

(assert (=> start!82948 (=> (not res!648080) (not e!545578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82948 (= res!648080 (validMask!0 mask!2110))))

(assert (=> start!82948 e!545578))

(assert (=> start!82948 true))

(declare-fun e!545577 () Bool)

(declare-fun array_inv!22287 (array!59839) Bool)

(assert (=> start!82948 (and (array_inv!22287 _values!1400) e!545577)))

(declare-fun array_inv!22288 (array!59841) Bool)

(assert (=> start!82948 (array_inv!22288 _keys!1686)))

(assert (=> start!82948 tp!66354))

(declare-fun tp_is_empty!21883 () Bool)

(assert (=> start!82948 tp_is_empty!21883))

(declare-fun mapNonEmpty!34819 () Bool)

(declare-fun mapRes!34819 () Bool)

(declare-fun tp!66353 () Bool)

(declare-fun e!545575 () Bool)

(assert (=> mapNonEmpty!34819 (= mapRes!34819 (and tp!66353 e!545575))))

(declare-fun mapValue!34819 () ValueCell!10460)

(declare-fun mapKey!34819 () (_ BitVec 32))

(declare-fun mapRest!34819 () (Array (_ BitVec 32) ValueCell!10460))

(assert (=> mapNonEmpty!34819 (= (arr!28788 _values!1400) (store mapRest!34819 mapKey!34819 mapValue!34819))))

(declare-fun b!968080 () Bool)

(declare-fun res!648077 () Bool)

(assert (=> b!968080 (=> (not res!648077) (not e!545578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59841 (_ BitVec 32)) Bool)

(assert (=> b!968080 (= res!648077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968081 () Bool)

(declare-fun res!648082 () Bool)

(assert (=> b!968081 (=> (not res!648082) (not e!545578))))

(assert (=> b!968081 (= res!648082 (contains!5536 (getCurrentListMap!3668 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28789 _keys!1686) i!803)))))

(declare-fun b!968082 () Bool)

(assert (=> b!968082 (= e!545578 (not e!545576))))

(declare-fun res!648084 () Bool)

(assert (=> b!968082 (=> res!648084 e!545576)))

(assert (=> b!968082 (= res!648084 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29268 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!968082 (contains!5536 (getCurrentListMap!3668 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28789 _keys!1686) i!803))))

(declare-fun lt!431481 () Unit!32351)

(declare-fun lemmaInListMapFromThenInFromMinusOne!70 (array!59841 array!59839 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) (_ BitVec 32) Int) Unit!32351)

(assert (=> b!968082 (= lt!431481 (lemmaInListMapFromThenInFromMinusOne!70 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968083 () Bool)

(assert (=> b!968083 (= e!545575 tp_is_empty!21883)))

(declare-fun b!968084 () Bool)

(declare-fun res!648085 () Bool)

(assert (=> b!968084 (=> (not res!648085) (not e!545578))))

(assert (=> b!968084 (= res!648085 (and (= (size!29267 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29268 _keys!1686) (size!29267 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968085 () Bool)

(declare-fun res!648083 () Bool)

(assert (=> b!968085 (=> (not res!648083) (not e!545578))))

(assert (=> b!968085 (= res!648083 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29268 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29268 _keys!1686))))))

(declare-fun b!968086 () Bool)

(declare-fun res!648079 () Bool)

(assert (=> b!968086 (=> (not res!648079) (not e!545578))))

(declare-datatypes ((List!19990 0))(
  ( (Nil!19987) (Cons!19986 (h!21148 (_ BitVec 64)) (t!28353 List!19990)) )
))
(declare-fun arrayNoDuplicates!0 (array!59841 (_ BitVec 32) List!19990) Bool)

(assert (=> b!968086 (= res!648079 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19987))))

(declare-fun b!968087 () Bool)

(declare-fun e!545574 () Bool)

(assert (=> b!968087 (= e!545577 (and e!545574 mapRes!34819))))

(declare-fun condMapEmpty!34819 () Bool)

(declare-fun mapDefault!34819 () ValueCell!10460)

