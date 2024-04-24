; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82876 () Bool)

(assert start!82876)

(declare-fun b_free!18841 () Bool)

(declare-fun b_next!18841 () Bool)

(assert (=> start!82876 (= b_free!18841 (not b_next!18841))))

(declare-fun tp!65643 () Bool)

(declare-fun b_and!30339 () Bool)

(assert (=> start!82876 (= tp!65643 b_and!30339)))

(declare-fun b!965399 () Bool)

(declare-fun e!544322 () Bool)

(declare-fun e!544324 () Bool)

(declare-fun mapRes!34459 () Bool)

(assert (=> b!965399 (= e!544322 (and e!544324 mapRes!34459))))

(declare-fun condMapEmpty!34459 () Bool)

(declare-datatypes ((V!33841 0))(
  ( (V!33842 (val!10872 Int)) )
))
(declare-datatypes ((ValueCell!10340 0))(
  ( (ValueCellFull!10340 (v!13427 V!33841)) (EmptyCell!10340) )
))
(declare-datatypes ((array!59396 0))(
  ( (array!59397 (arr!28562 (Array (_ BitVec 32) ValueCell!10340)) (size!29042 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59396)

(declare-fun mapDefault!34459 () ValueCell!10340)

(assert (=> b!965399 (= condMapEmpty!34459 (= (arr!28562 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10340)) mapDefault!34459)))))

(declare-fun b!965400 () Bool)

(declare-fun res!645919 () Bool)

(declare-fun e!544323 () Bool)

(assert (=> b!965400 (=> (not res!645919) (not e!544323))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965400 (= res!645919 (bvsgt from!2084 newFrom!159))))

(declare-fun b!965401 () Bool)

(declare-fun res!645925 () Bool)

(assert (=> b!965401 (=> (not res!645925) (not e!544323))))

(declare-datatypes ((array!59398 0))(
  ( (array!59399 (arr!28563 (Array (_ BitVec 32) (_ BitVec 64))) (size!29043 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59398)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965401 (= res!645925 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29043 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29043 _keys!1686))))))

(declare-fun res!645924 () Bool)

(assert (=> start!82876 (=> (not res!645924) (not e!544323))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82876 (= res!645924 (validMask!0 mask!2110))))

(assert (=> start!82876 e!544323))

(assert (=> start!82876 true))

(declare-fun array_inv!22189 (array!59396) Bool)

(assert (=> start!82876 (and (array_inv!22189 _values!1400) e!544322)))

(declare-fun array_inv!22190 (array!59398) Bool)

(assert (=> start!82876 (array_inv!22190 _keys!1686)))

(assert (=> start!82876 tp!65643))

(declare-fun tp_is_empty!21643 () Bool)

(assert (=> start!82876 tp_is_empty!21643))

(declare-fun b!965402 () Bool)

(declare-fun res!645927 () Bool)

(assert (=> b!965402 (=> (not res!645927) (not e!544323))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965402 (= res!645927 (and (= (size!29042 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29043 _keys!1686) (size!29042 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965403 () Bool)

(declare-fun e!544320 () Bool)

(assert (=> b!965403 (= e!544320 tp_is_empty!21643)))

(declare-fun mapNonEmpty!34459 () Bool)

(declare-fun tp!65644 () Bool)

(assert (=> mapNonEmpty!34459 (= mapRes!34459 (and tp!65644 e!544320))))

(declare-fun mapKey!34459 () (_ BitVec 32))

(declare-fun mapValue!34459 () ValueCell!10340)

(declare-fun mapRest!34459 () (Array (_ BitVec 32) ValueCell!10340))

(assert (=> mapNonEmpty!34459 (= (arr!28562 _values!1400) (store mapRest!34459 mapKey!34459 mapValue!34459))))

(declare-fun b!965404 () Bool)

(declare-fun res!645923 () Bool)

(assert (=> b!965404 (=> (not res!645923) (not e!544323))))

(declare-datatypes ((List!19808 0))(
  ( (Nil!19805) (Cons!19804 (h!20972 (_ BitVec 64)) (t!28163 List!19808)) )
))
(declare-fun arrayNoDuplicates!0 (array!59398 (_ BitVec 32) List!19808) Bool)

(assert (=> b!965404 (= res!645923 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19805))))

(declare-fun b!965405 () Bool)

(declare-fun e!544321 () Bool)

(assert (=> b!965405 (= e!544323 (not e!544321))))

(declare-fun res!645926 () Bool)

(assert (=> b!965405 (=> res!645926 e!544321)))

(assert (=> b!965405 (= res!645926 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29043 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!33841)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33841)

(declare-datatypes ((tuple2!13962 0))(
  ( (tuple2!13963 (_1!6992 (_ BitVec 64)) (_2!6992 V!33841)) )
))
(declare-datatypes ((List!19809 0))(
  ( (Nil!19806) (Cons!19805 (h!20973 tuple2!13962) (t!28164 List!19809)) )
))
(declare-datatypes ((ListLongMap!12661 0))(
  ( (ListLongMap!12662 (toList!6346 List!19809)) )
))
(declare-fun contains!5461 (ListLongMap!12661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3579 (array!59398 array!59396 (_ BitVec 32) (_ BitVec 32) V!33841 V!33841 (_ BitVec 32) Int) ListLongMap!12661)

(assert (=> b!965405 (contains!5461 (getCurrentListMap!3579 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28563 _keys!1686) i!803))))

(declare-datatypes ((Unit!32248 0))(
  ( (Unit!32249) )
))
(declare-fun lt!431474 () Unit!32248)

(declare-fun lemmaInListMapFromThenInFromMinusOne!36 (array!59398 array!59396 (_ BitVec 32) (_ BitVec 32) V!33841 V!33841 (_ BitVec 32) (_ BitVec 32) Int) Unit!32248)

(assert (=> b!965405 (= lt!431474 (lemmaInListMapFromThenInFromMinusOne!36 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!965406 () Bool)

(assert (=> b!965406 (= e!544321 true)))

(assert (=> b!965406 (contains!5461 (getCurrentListMap!3579 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28563 _keys!1686) i!803))))

(declare-fun lt!431473 () Unit!32248)

(declare-fun lemmaInListMapFromThenInFromSmaller!31 (array!59398 array!59396 (_ BitVec 32) (_ BitVec 32) V!33841 V!33841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32248)

(assert (=> b!965406 (= lt!431473 (lemmaInListMapFromThenInFromSmaller!31 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!965407 () Bool)

(declare-fun res!645921 () Bool)

(assert (=> b!965407 (=> (not res!645921) (not e!544323))))

(assert (=> b!965407 (= res!645921 (contains!5461 (getCurrentListMap!3579 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28563 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34459 () Bool)

(assert (=> mapIsEmpty!34459 mapRes!34459))

(declare-fun b!965408 () Bool)

(assert (=> b!965408 (= e!544324 tp_is_empty!21643)))

(declare-fun b!965409 () Bool)

(declare-fun res!645920 () Bool)

(assert (=> b!965409 (=> (not res!645920) (not e!544323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59398 (_ BitVec 32)) Bool)

(assert (=> b!965409 (= res!645920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965410 () Bool)

(declare-fun res!645922 () Bool)

(assert (=> b!965410 (=> (not res!645922) (not e!544323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965410 (= res!645922 (validKeyInArray!0 (select (arr!28563 _keys!1686) i!803)))))

(assert (= (and start!82876 res!645924) b!965402))

(assert (= (and b!965402 res!645927) b!965409))

(assert (= (and b!965409 res!645920) b!965404))

(assert (= (and b!965404 res!645923) b!965401))

(assert (= (and b!965401 res!645925) b!965410))

(assert (= (and b!965410 res!645922) b!965407))

(assert (= (and b!965407 res!645921) b!965400))

(assert (= (and b!965400 res!645919) b!965405))

(assert (= (and b!965405 (not res!645926)) b!965406))

(assert (= (and b!965399 condMapEmpty!34459) mapIsEmpty!34459))

(assert (= (and b!965399 (not condMapEmpty!34459)) mapNonEmpty!34459))

(get-info :version)

(assert (= (and mapNonEmpty!34459 ((_ is ValueCellFull!10340) mapValue!34459)) b!965403))

(assert (= (and b!965399 ((_ is ValueCellFull!10340) mapDefault!34459)) b!965408))

(assert (= start!82876 b!965399))

(declare-fun m!895039 () Bool)

(assert (=> b!965406 m!895039))

(declare-fun m!895041 () Bool)

(assert (=> b!965406 m!895041))

(assert (=> b!965406 m!895039))

(assert (=> b!965406 m!895041))

(declare-fun m!895043 () Bool)

(assert (=> b!965406 m!895043))

(declare-fun m!895045 () Bool)

(assert (=> b!965406 m!895045))

(declare-fun m!895047 () Bool)

(assert (=> b!965404 m!895047))

(assert (=> b!965410 m!895041))

(assert (=> b!965410 m!895041))

(declare-fun m!895049 () Bool)

(assert (=> b!965410 m!895049))

(declare-fun m!895051 () Bool)

(assert (=> b!965405 m!895051))

(assert (=> b!965405 m!895041))

(assert (=> b!965405 m!895051))

(assert (=> b!965405 m!895041))

(declare-fun m!895053 () Bool)

(assert (=> b!965405 m!895053))

(declare-fun m!895055 () Bool)

(assert (=> b!965405 m!895055))

(declare-fun m!895057 () Bool)

(assert (=> mapNonEmpty!34459 m!895057))

(declare-fun m!895059 () Bool)

(assert (=> start!82876 m!895059))

(declare-fun m!895061 () Bool)

(assert (=> start!82876 m!895061))

(declare-fun m!895063 () Bool)

(assert (=> start!82876 m!895063))

(declare-fun m!895065 () Bool)

(assert (=> b!965407 m!895065))

(assert (=> b!965407 m!895041))

(assert (=> b!965407 m!895065))

(assert (=> b!965407 m!895041))

(declare-fun m!895067 () Bool)

(assert (=> b!965407 m!895067))

(declare-fun m!895069 () Bool)

(assert (=> b!965409 m!895069))

(check-sat (not b!965410) (not b!965405) (not b!965404) tp_is_empty!21643 (not start!82876) b_and!30339 (not b!965409) (not mapNonEmpty!34459) (not b!965407) (not b!965406) (not b_next!18841))
(check-sat b_and!30339 (not b_next!18841))
