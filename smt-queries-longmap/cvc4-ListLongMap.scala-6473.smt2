; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82682 () Bool)

(assert start!82682)

(declare-fun b_free!18815 () Bool)

(declare-fun b_next!18815 () Bool)

(assert (=> start!82682 (= b_free!18815 (not b_next!18815))))

(declare-fun tp!65565 () Bool)

(declare-fun b_and!30303 () Bool)

(assert (=> start!82682 (= tp!65565 b_and!30303)))

(declare-fun b!964028 () Bool)

(declare-fun res!645232 () Bool)

(declare-fun e!543508 () Bool)

(assert (=> b!964028 (=> (not res!645232) (not e!543508))))

(declare-datatypes ((array!59323 0))(
  ( (array!59324 (arr!28530 (Array (_ BitVec 32) (_ BitVec 64))) (size!29009 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59323)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59323 (_ BitVec 32)) Bool)

(assert (=> b!964028 (= res!645232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964029 () Bool)

(declare-fun res!645226 () Bool)

(assert (=> b!964029 (=> (not res!645226) (not e!543508))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33805 0))(
  ( (V!33806 (val!10859 Int)) )
))
(declare-datatypes ((ValueCell!10327 0))(
  ( (ValueCellFull!10327 (v!13417 V!33805)) (EmptyCell!10327) )
))
(declare-datatypes ((array!59325 0))(
  ( (array!59326 (arr!28531 (Array (_ BitVec 32) ValueCell!10327)) (size!29010 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59325)

(declare-fun minValue!1342 () V!33805)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33805)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13952 0))(
  ( (tuple2!13953 (_1!6987 (_ BitVec 64)) (_2!6987 V!33805)) )
))
(declare-datatypes ((List!19801 0))(
  ( (Nil!19798) (Cons!19797 (h!20959 tuple2!13952) (t!28164 List!19801)) )
))
(declare-datatypes ((ListLongMap!12649 0))(
  ( (ListLongMap!12650 (toList!6340 List!19801)) )
))
(declare-fun contains!5443 (ListLongMap!12649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3573 (array!59323 array!59325 (_ BitVec 32) (_ BitVec 32) V!33805 V!33805 (_ BitVec 32) Int) ListLongMap!12649)

(assert (=> b!964029 (= res!645226 (contains!5443 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28530 _keys!1686) i!803)))))

(declare-fun res!645225 () Bool)

(assert (=> start!82682 (=> (not res!645225) (not e!543508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82682 (= res!645225 (validMask!0 mask!2110))))

(assert (=> start!82682 e!543508))

(assert (=> start!82682 true))

(declare-fun e!543506 () Bool)

(declare-fun array_inv!22097 (array!59325) Bool)

(assert (=> start!82682 (and (array_inv!22097 _values!1400) e!543506)))

(declare-fun array_inv!22098 (array!59323) Bool)

(assert (=> start!82682 (array_inv!22098 _keys!1686)))

(assert (=> start!82682 tp!65565))

(declare-fun tp_is_empty!21617 () Bool)

(assert (=> start!82682 tp_is_empty!21617))

(declare-fun b!964030 () Bool)

(declare-fun res!645229 () Bool)

(assert (=> b!964030 (=> (not res!645229) (not e!543508))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964030 (= res!645229 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29009 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29009 _keys!1686))))))

(declare-fun b!964031 () Bool)

(declare-fun e!543504 () Bool)

(assert (=> b!964031 (= e!543504 tp_is_empty!21617)))

(declare-fun b!964032 () Bool)

(declare-fun e!543507 () Bool)

(assert (=> b!964032 (= e!543508 (not e!543507))))

(declare-fun res!645224 () Bool)

(assert (=> b!964032 (=> res!645224 e!543507)))

(assert (=> b!964032 (= res!645224 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29009 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964032 (contains!5443 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28530 _keys!1686) i!803))))

(declare-datatypes ((Unit!32263 0))(
  ( (Unit!32264) )
))
(declare-fun lt!431034 () Unit!32263)

(declare-fun lemmaInListMapFromThenInFromMinusOne!26 (array!59323 array!59325 (_ BitVec 32) (_ BitVec 32) V!33805 V!33805 (_ BitVec 32) (_ BitVec 32) Int) Unit!32263)

(assert (=> b!964032 (= lt!431034 (lemmaInListMapFromThenInFromMinusOne!26 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34420 () Bool)

(declare-fun mapRes!34420 () Bool)

(assert (=> mapIsEmpty!34420 mapRes!34420))

(declare-fun b!964033 () Bool)

(declare-fun res!645228 () Bool)

(assert (=> b!964033 (=> (not res!645228) (not e!543508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964033 (= res!645228 (validKeyInArray!0 (select (arr!28530 _keys!1686) i!803)))))

(declare-fun b!964034 () Bool)

(declare-fun res!645231 () Bool)

(assert (=> b!964034 (=> (not res!645231) (not e!543508))))

(assert (=> b!964034 (= res!645231 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34420 () Bool)

(declare-fun tp!65564 () Bool)

(declare-fun e!543509 () Bool)

(assert (=> mapNonEmpty!34420 (= mapRes!34420 (and tp!65564 e!543509))))

(declare-fun mapKey!34420 () (_ BitVec 32))

(declare-fun mapValue!34420 () ValueCell!10327)

(declare-fun mapRest!34420 () (Array (_ BitVec 32) ValueCell!10327))

(assert (=> mapNonEmpty!34420 (= (arr!28531 _values!1400) (store mapRest!34420 mapKey!34420 mapValue!34420))))

(declare-fun b!964035 () Bool)

(declare-fun res!645227 () Bool)

(assert (=> b!964035 (=> (not res!645227) (not e!543508))))

(declare-datatypes ((List!19802 0))(
  ( (Nil!19799) (Cons!19798 (h!20960 (_ BitVec 64)) (t!28165 List!19802)) )
))
(declare-fun arrayNoDuplicates!0 (array!59323 (_ BitVec 32) List!19802) Bool)

(assert (=> b!964035 (= res!645227 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19799))))

(declare-fun b!964036 () Bool)

(assert (=> b!964036 (= e!543509 tp_is_empty!21617)))

(declare-fun b!964037 () Bool)

(assert (=> b!964037 (= e!543507 true)))

(assert (=> b!964037 (contains!5443 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28530 _keys!1686) i!803))))

(declare-fun lt!431035 () Unit!32263)

(declare-fun lemmaInListMapFromThenInFromSmaller!25 (array!59323 array!59325 (_ BitVec 32) (_ BitVec 32) V!33805 V!33805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32263)

(assert (=> b!964037 (= lt!431035 (lemmaInListMapFromThenInFromSmaller!25 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964038 () Bool)

(assert (=> b!964038 (= e!543506 (and e!543504 mapRes!34420))))

(declare-fun condMapEmpty!34420 () Bool)

(declare-fun mapDefault!34420 () ValueCell!10327)

