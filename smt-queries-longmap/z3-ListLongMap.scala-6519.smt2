; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82936 () Bool)

(assert start!82936)

(declare-fun b_free!19081 () Bool)

(declare-fun b_next!19081 () Bool)

(assert (=> start!82936 (= b_free!19081 (not b_next!19081))))

(declare-fun tp!66373 () Bool)

(declare-fun b_and!30543 () Bool)

(assert (=> start!82936 (= tp!66373 b_and!30543)))

(declare-fun b!967947 () Bool)

(declare-fun res!648049 () Bool)

(declare-fun e!545485 () Bool)

(assert (=> b!967947 (=> (not res!648049) (not e!545485))))

(declare-datatypes ((array!59778 0))(
  ( (array!59779 (arr!28758 (Array (_ BitVec 32) (_ BitVec 64))) (size!29239 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59778)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967947 (= res!648049 (validKeyInArray!0 (select (arr!28758 _keys!1686) i!803)))))

(declare-fun b!967948 () Bool)

(declare-fun res!648056 () Bool)

(assert (=> b!967948 (=> (not res!648056) (not e!545485))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34169 0))(
  ( (V!34170 (val!10995 Int)) )
))
(declare-datatypes ((ValueCell!10463 0))(
  ( (ValueCellFull!10463 (v!13552 V!34169)) (EmptyCell!10463) )
))
(declare-datatypes ((array!59780 0))(
  ( (array!59781 (arr!28759 (Array (_ BitVec 32) ValueCell!10463)) (size!29240 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59780)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!967948 (= res!648056 (and (= (size!29240 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29239 _keys!1686) (size!29240 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967949 () Bool)

(declare-fun res!648055 () Bool)

(assert (=> b!967949 (=> (not res!648055) (not e!545485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59778 (_ BitVec 32)) Bool)

(assert (=> b!967949 (= res!648055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967951 () Bool)

(declare-fun e!545482 () Bool)

(assert (=> b!967951 (= e!545485 (not e!545482))))

(declare-fun res!648051 () Bool)

(assert (=> b!967951 (=> res!648051 e!545482)))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!967951 (= res!648051 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29239 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!34169)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34169)

(declare-datatypes ((tuple2!14222 0))(
  ( (tuple2!14223 (_1!7122 (_ BitVec 64)) (_2!7122 V!34169)) )
))
(declare-datatypes ((List!20021 0))(
  ( (Nil!20018) (Cons!20017 (h!21179 tuple2!14222) (t!28375 List!20021)) )
))
(declare-datatypes ((ListLongMap!12909 0))(
  ( (ListLongMap!12910 (toList!6470 List!20021)) )
))
(declare-fun contains!5515 (ListLongMap!12909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3632 (array!59778 array!59780 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) Int) ListLongMap!12909)

(assert (=> b!967951 (contains!5515 (getCurrentListMap!3632 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28758 _keys!1686) i!803))))

(declare-datatypes ((Unit!32226 0))(
  ( (Unit!32227) )
))
(declare-fun lt!431263 () Unit!32226)

(declare-fun lemmaInListMapFromThenInFromMinusOne!77 (array!59778 array!59780 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) (_ BitVec 32) Int) Unit!32226)

(assert (=> b!967951 (= lt!431263 (lemmaInListMapFromThenInFromMinusOne!77 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967952 () Bool)

(declare-fun e!545481 () Bool)

(declare-fun tp_is_empty!21889 () Bool)

(assert (=> b!967952 (= e!545481 tp_is_empty!21889)))

(declare-fun b!967953 () Bool)

(declare-fun res!648052 () Bool)

(assert (=> b!967953 (=> (not res!648052) (not e!545485))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967953 (= res!648052 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967954 () Bool)

(declare-fun res!648048 () Bool)

(assert (=> b!967954 (=> (not res!648048) (not e!545485))))

(assert (=> b!967954 (= res!648048 (contains!5515 (getCurrentListMap!3632 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28758 _keys!1686) i!803)))))

(declare-fun b!967955 () Bool)

(declare-fun res!648050 () Bool)

(assert (=> b!967955 (=> (not res!648050) (not e!545485))))

(assert (=> b!967955 (= res!648050 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29239 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29239 _keys!1686))))))

(declare-fun mapIsEmpty!34828 () Bool)

(declare-fun mapRes!34828 () Bool)

(assert (=> mapIsEmpty!34828 mapRes!34828))

(declare-fun b!967956 () Bool)

(declare-fun e!545480 () Bool)

(assert (=> b!967956 (= e!545480 (and e!545481 mapRes!34828))))

(declare-fun condMapEmpty!34828 () Bool)

(declare-fun mapDefault!34828 () ValueCell!10463)

(assert (=> b!967956 (= condMapEmpty!34828 (= (arr!28759 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10463)) mapDefault!34828)))))

(declare-fun b!967957 () Bool)

(declare-fun e!545484 () Bool)

(assert (=> b!967957 (= e!545484 tp_is_empty!21889)))

(declare-fun mapNonEmpty!34828 () Bool)

(declare-fun tp!66372 () Bool)

(assert (=> mapNonEmpty!34828 (= mapRes!34828 (and tp!66372 e!545484))))

(declare-fun mapKey!34828 () (_ BitVec 32))

(declare-fun mapRest!34828 () (Array (_ BitVec 32) ValueCell!10463))

(declare-fun mapValue!34828 () ValueCell!10463)

(assert (=> mapNonEmpty!34828 (= (arr!28759 _values!1400) (store mapRest!34828 mapKey!34828 mapValue!34828))))

(declare-fun b!967958 () Bool)

(declare-fun res!648053 () Bool)

(assert (=> b!967958 (=> (not res!648053) (not e!545485))))

(declare-datatypes ((List!20022 0))(
  ( (Nil!20019) (Cons!20018 (h!21180 (_ BitVec 64)) (t!28376 List!20022)) )
))
(declare-fun arrayNoDuplicates!0 (array!59778 (_ BitVec 32) List!20022) Bool)

(assert (=> b!967958 (= res!648053 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20019))))

(declare-fun b!967950 () Bool)

(assert (=> b!967950 (= e!545482 true)))

(assert (=> b!967950 (contains!5515 (getCurrentListMap!3632 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28758 _keys!1686) i!803))))

(declare-fun lt!431264 () Unit!32226)

(declare-fun lemmaInListMapFromThenInFromSmaller!45 (array!59778 array!59780 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32226)

(assert (=> b!967950 (= lt!431264 (lemmaInListMapFromThenInFromSmaller!45 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun res!648054 () Bool)

(assert (=> start!82936 (=> (not res!648054) (not e!545485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82936 (= res!648054 (validMask!0 mask!2110))))

(assert (=> start!82936 e!545485))

(assert (=> start!82936 true))

(declare-fun array_inv!22331 (array!59780) Bool)

(assert (=> start!82936 (and (array_inv!22331 _values!1400) e!545480)))

(declare-fun array_inv!22332 (array!59778) Bool)

(assert (=> start!82936 (array_inv!22332 _keys!1686)))

(assert (=> start!82936 tp!66373))

(assert (=> start!82936 tp_is_empty!21889))

(assert (= (and start!82936 res!648054) b!967948))

(assert (= (and b!967948 res!648056) b!967949))

(assert (= (and b!967949 res!648055) b!967958))

(assert (= (and b!967958 res!648053) b!967955))

(assert (= (and b!967955 res!648050) b!967947))

(assert (= (and b!967947 res!648049) b!967954))

(assert (= (and b!967954 res!648048) b!967953))

(assert (= (and b!967953 res!648052) b!967951))

(assert (= (and b!967951 (not res!648051)) b!967950))

(assert (= (and b!967956 condMapEmpty!34828) mapIsEmpty!34828))

(assert (= (and b!967956 (not condMapEmpty!34828)) mapNonEmpty!34828))

(get-info :version)

(assert (= (and mapNonEmpty!34828 ((_ is ValueCellFull!10463) mapValue!34828)) b!967957))

(assert (= (and b!967956 ((_ is ValueCellFull!10463) mapDefault!34828)) b!967952))

(assert (= start!82936 b!967956))

(declare-fun m!895831 () Bool)

(assert (=> b!967954 m!895831))

(declare-fun m!895833 () Bool)

(assert (=> b!967954 m!895833))

(assert (=> b!967954 m!895831))

(assert (=> b!967954 m!895833))

(declare-fun m!895835 () Bool)

(assert (=> b!967954 m!895835))

(declare-fun m!895837 () Bool)

(assert (=> b!967951 m!895837))

(assert (=> b!967951 m!895833))

(assert (=> b!967951 m!895837))

(assert (=> b!967951 m!895833))

(declare-fun m!895839 () Bool)

(assert (=> b!967951 m!895839))

(declare-fun m!895841 () Bool)

(assert (=> b!967951 m!895841))

(declare-fun m!895843 () Bool)

(assert (=> b!967958 m!895843))

(declare-fun m!895845 () Bool)

(assert (=> b!967949 m!895845))

(declare-fun m!895847 () Bool)

(assert (=> b!967950 m!895847))

(assert (=> b!967950 m!895833))

(assert (=> b!967950 m!895847))

(assert (=> b!967950 m!895833))

(declare-fun m!895849 () Bool)

(assert (=> b!967950 m!895849))

(declare-fun m!895851 () Bool)

(assert (=> b!967950 m!895851))

(assert (=> b!967947 m!895833))

(assert (=> b!967947 m!895833))

(declare-fun m!895853 () Bool)

(assert (=> b!967947 m!895853))

(declare-fun m!895855 () Bool)

(assert (=> mapNonEmpty!34828 m!895855))

(declare-fun m!895857 () Bool)

(assert (=> start!82936 m!895857))

(declare-fun m!895859 () Bool)

(assert (=> start!82936 m!895859))

(declare-fun m!895861 () Bool)

(assert (=> start!82936 m!895861))

(check-sat b_and!30543 tp_is_empty!21889 (not b!967951) (not start!82936) (not b_next!19081) (not b!967954) (not mapNonEmpty!34828) (not b!967949) (not b!967958) (not b!967950) (not b!967947))
(check-sat b_and!30543 (not b_next!19081))
