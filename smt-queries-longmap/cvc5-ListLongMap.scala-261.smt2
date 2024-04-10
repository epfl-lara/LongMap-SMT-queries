; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4288 () Bool)

(assert start!4288)

(declare-fun b_free!1153 () Bool)

(declare-fun b_next!1153 () Bool)

(assert (=> start!4288 (= b_free!1153 (not b_next!1153))))

(declare-fun tp!4885 () Bool)

(declare-fun b_and!1967 () Bool)

(assert (=> start!4288 (= tp!4885 b_and!1967)))

(declare-fun b!32918 () Bool)

(declare-fun res!20010 () Bool)

(declare-fun e!20914 () Bool)

(assert (=> b!32918 (=> (not res!20010) (not e!20914))))

(declare-datatypes ((array!2227 0))(
  ( (array!2228 (arr!1065 (Array (_ BitVec 32) (_ BitVec 64))) (size!1166 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2227)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2227 (_ BitVec 32)) Bool)

(assert (=> b!32918 (= res!20010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32919 () Bool)

(declare-fun e!20910 () Bool)

(assert (=> b!32919 (= e!20910 (not true))))

(declare-datatypes ((V!1835 0))(
  ( (V!1836 (val!780 Int)) )
))
(declare-datatypes ((tuple2!1270 0))(
  ( (tuple2!1271 (_1!646 (_ BitVec 64)) (_2!646 V!1835)) )
))
(declare-datatypes ((List!862 0))(
  ( (Nil!859) (Cons!858 (h!1425 tuple2!1270) (t!3559 List!862)) )
))
(declare-datatypes ((ListLongMap!847 0))(
  ( (ListLongMap!848 (toList!439 List!862)) )
))
(declare-fun lt!11928 () ListLongMap!847)

(declare-fun lt!11929 () (_ BitVec 32))

(declare-fun contains!381 (ListLongMap!847 (_ BitVec 64)) Bool)

(assert (=> b!32919 (contains!381 lt!11928 (select (arr!1065 _keys!1833) lt!11929))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!725 0))(
  ( (Unit!726) )
))
(declare-fun lt!11930 () Unit!725)

(declare-datatypes ((ValueCell!554 0))(
  ( (ValueCellFull!554 (v!1871 V!1835)) (EmptyCell!554) )
))
(declare-datatypes ((array!2229 0))(
  ( (array!2230 (arr!1066 (Array (_ BitVec 32) ValueCell!554)) (size!1167 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2229)

(declare-fun zeroValue!1443 () V!1835)

(declare-fun minValue!1443 () V!1835)

(declare-fun lemmaValidKeyInArrayIsInListMap!52 (array!2227 array!2229 (_ BitVec 32) (_ BitVec 32) V!1835 V!1835 (_ BitVec 32) Int) Unit!725)

(assert (=> b!32919 (= lt!11930 (lemmaValidKeyInArrayIsInListMap!52 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11929 defaultEntry!1504))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2227 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32919 (= lt!11929 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32920 () Bool)

(declare-fun res!20011 () Bool)

(assert (=> b!32920 (=> (not res!20011) (not e!20910))))

(declare-fun arrayContainsKey!0 (array!2227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32920 (= res!20011 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1795 () Bool)

(declare-fun mapRes!1795 () Bool)

(declare-fun tp!4884 () Bool)

(declare-fun e!20912 () Bool)

(assert (=> mapNonEmpty!1795 (= mapRes!1795 (and tp!4884 e!20912))))

(declare-fun mapRest!1795 () (Array (_ BitVec 32) ValueCell!554))

(declare-fun mapValue!1795 () ValueCell!554)

(declare-fun mapKey!1795 () (_ BitVec 32))

(assert (=> mapNonEmpty!1795 (= (arr!1066 _values!1501) (store mapRest!1795 mapKey!1795 mapValue!1795))))

(declare-fun b!32921 () Bool)

(assert (=> b!32921 (= e!20914 e!20910)))

(declare-fun res!20008 () Bool)

(assert (=> b!32921 (=> (not res!20008) (not e!20910))))

(assert (=> b!32921 (= res!20008 (not (contains!381 lt!11928 k!1304)))))

(declare-fun getCurrentListMap!267 (array!2227 array!2229 (_ BitVec 32) (_ BitVec 32) V!1835 V!1835 (_ BitVec 32) Int) ListLongMap!847)

(assert (=> b!32921 (= lt!11928 (getCurrentListMap!267 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20012 () Bool)

(assert (=> start!4288 (=> (not res!20012) (not e!20914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4288 (= res!20012 (validMask!0 mask!2294))))

(assert (=> start!4288 e!20914))

(assert (=> start!4288 true))

(assert (=> start!4288 tp!4885))

(declare-fun e!20913 () Bool)

(declare-fun array_inv!747 (array!2229) Bool)

(assert (=> start!4288 (and (array_inv!747 _values!1501) e!20913)))

(declare-fun array_inv!748 (array!2227) Bool)

(assert (=> start!4288 (array_inv!748 _keys!1833)))

(declare-fun tp_is_empty!1507 () Bool)

(assert (=> start!4288 tp_is_empty!1507))

(declare-fun b!32922 () Bool)

(declare-fun e!20915 () Bool)

(assert (=> b!32922 (= e!20915 tp_is_empty!1507)))

(declare-fun b!32923 () Bool)

(declare-fun res!20007 () Bool)

(assert (=> b!32923 (=> (not res!20007) (not e!20914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32923 (= res!20007 (validKeyInArray!0 k!1304))))

(declare-fun b!32924 () Bool)

(declare-fun res!20009 () Bool)

(assert (=> b!32924 (=> (not res!20009) (not e!20914))))

(declare-datatypes ((List!863 0))(
  ( (Nil!860) (Cons!859 (h!1426 (_ BitVec 64)) (t!3560 List!863)) )
))
(declare-fun arrayNoDuplicates!0 (array!2227 (_ BitVec 32) List!863) Bool)

(assert (=> b!32924 (= res!20009 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!860))))

(declare-fun b!32925 () Bool)

(assert (=> b!32925 (= e!20912 tp_is_empty!1507)))

(declare-fun mapIsEmpty!1795 () Bool)

(assert (=> mapIsEmpty!1795 mapRes!1795))

(declare-fun b!32926 () Bool)

(assert (=> b!32926 (= e!20913 (and e!20915 mapRes!1795))))

(declare-fun condMapEmpty!1795 () Bool)

(declare-fun mapDefault!1795 () ValueCell!554)

