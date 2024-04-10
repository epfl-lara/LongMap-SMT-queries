; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4286 () Bool)

(assert start!4286)

(declare-fun b_free!1151 () Bool)

(declare-fun b_next!1151 () Bool)

(assert (=> start!4286 (= b_free!1151 (not b_next!1151))))

(declare-fun tp!4879 () Bool)

(declare-fun b_and!1965 () Bool)

(assert (=> start!4286 (= tp!4879 b_and!1965)))

(declare-fun b!32888 () Bool)

(declare-fun res!19988 () Bool)

(declare-fun e!20896 () Bool)

(assert (=> b!32888 (=> (not res!19988) (not e!20896))))

(declare-datatypes ((V!1831 0))(
  ( (V!1832 (val!779 Int)) )
))
(declare-datatypes ((ValueCell!553 0))(
  ( (ValueCellFull!553 (v!1870 V!1831)) (EmptyCell!553) )
))
(declare-datatypes ((array!2223 0))(
  ( (array!2224 (arr!1063 (Array (_ BitVec 32) ValueCell!553)) (size!1164 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2223)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2225 0))(
  ( (array!2226 (arr!1064 (Array (_ BitVec 32) (_ BitVec 64))) (size!1165 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2225)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32888 (= res!19988 (and (= (size!1164 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1165 _keys!1833) (size!1164 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1792 () Bool)

(declare-fun mapRes!1792 () Bool)

(declare-fun tp!4878 () Bool)

(declare-fun e!20892 () Bool)

(assert (=> mapNonEmpty!1792 (= mapRes!1792 (and tp!4878 e!20892))))

(declare-fun mapKey!1792 () (_ BitVec 32))

(declare-fun mapRest!1792 () (Array (_ BitVec 32) ValueCell!553))

(declare-fun mapValue!1792 () ValueCell!553)

(assert (=> mapNonEmpty!1792 (= (arr!1063 _values!1501) (store mapRest!1792 mapKey!1792 mapValue!1792))))

(declare-fun b!32889 () Bool)

(declare-fun tp_is_empty!1505 () Bool)

(assert (=> b!32889 (= e!20892 tp_is_empty!1505)))

(declare-fun b!32890 () Bool)

(declare-fun e!20894 () Bool)

(assert (=> b!32890 (= e!20894 tp_is_empty!1505)))

(declare-fun b!32891 () Bool)

(declare-fun e!20893 () Bool)

(assert (=> b!32891 (= e!20896 e!20893)))

(declare-fun res!19990 () Bool)

(assert (=> b!32891 (=> (not res!19990) (not e!20893))))

(declare-datatypes ((tuple2!1268 0))(
  ( (tuple2!1269 (_1!645 (_ BitVec 64)) (_2!645 V!1831)) )
))
(declare-datatypes ((List!861 0))(
  ( (Nil!858) (Cons!857 (h!1424 tuple2!1268) (t!3558 List!861)) )
))
(declare-datatypes ((ListLongMap!845 0))(
  ( (ListLongMap!846 (toList!438 List!861)) )
))
(declare-fun lt!11920 () ListLongMap!845)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!380 (ListLongMap!845 (_ BitVec 64)) Bool)

(assert (=> b!32891 (= res!19990 (not (contains!380 lt!11920 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1831)

(declare-fun minValue!1443 () V!1831)

(declare-fun getCurrentListMap!266 (array!2225 array!2223 (_ BitVec 32) (_ BitVec 32) V!1831 V!1831 (_ BitVec 32) Int) ListLongMap!845)

(assert (=> b!32891 (= lt!11920 (getCurrentListMap!266 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!19992 () Bool)

(assert (=> start!4286 (=> (not res!19992) (not e!20896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4286 (= res!19992 (validMask!0 mask!2294))))

(assert (=> start!4286 e!20896))

(assert (=> start!4286 true))

(assert (=> start!4286 tp!4879))

(declare-fun e!20897 () Bool)

(declare-fun array_inv!745 (array!2223) Bool)

(assert (=> start!4286 (and (array_inv!745 _values!1501) e!20897)))

(declare-fun array_inv!746 (array!2225) Bool)

(assert (=> start!4286 (array_inv!746 _keys!1833)))

(assert (=> start!4286 tp_is_empty!1505))

(declare-fun b!32892 () Bool)

(declare-fun res!19991 () Bool)

(assert (=> b!32892 (=> (not res!19991) (not e!20896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32892 (= res!19991 (validKeyInArray!0 k!1304))))

(declare-fun b!32893 () Bool)

(assert (=> b!32893 (= e!20893 (not true))))

(declare-fun lt!11919 () (_ BitVec 32))

(assert (=> b!32893 (contains!380 lt!11920 (select (arr!1064 _keys!1833) lt!11919))))

(declare-datatypes ((Unit!723 0))(
  ( (Unit!724) )
))
(declare-fun lt!11921 () Unit!723)

(declare-fun lemmaValidKeyInArrayIsInListMap!51 (array!2225 array!2223 (_ BitVec 32) (_ BitVec 32) V!1831 V!1831 (_ BitVec 32) Int) Unit!723)

(assert (=> b!32893 (= lt!11921 (lemmaValidKeyInArrayIsInListMap!51 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11919 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32893 (= lt!11919 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32894 () Bool)

(declare-fun res!19987 () Bool)

(assert (=> b!32894 (=> (not res!19987) (not e!20893))))

(declare-fun arrayContainsKey!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32894 (= res!19987 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32895 () Bool)

(declare-fun res!19986 () Bool)

(assert (=> b!32895 (=> (not res!19986) (not e!20896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2225 (_ BitVec 32)) Bool)

(assert (=> b!32895 (= res!19986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32896 () Bool)

(assert (=> b!32896 (= e!20897 (and e!20894 mapRes!1792))))

(declare-fun condMapEmpty!1792 () Bool)

(declare-fun mapDefault!1792 () ValueCell!553)

