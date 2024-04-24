; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83122 () Bool)

(assert start!83122)

(declare-fun b_free!19081 () Bool)

(declare-fun b_next!19081 () Bool)

(assert (=> start!83122 (= b_free!19081 (not b_next!19081))))

(declare-fun tp!66372 () Bool)

(declare-fun b_and!30579 () Bool)

(assert (=> start!83122 (= tp!66372 b_and!30579)))

(declare-fun b!969089 () Bool)

(declare-fun res!648506 () Bool)

(declare-fun e!546210 () Bool)

(assert (=> b!969089 (=> (not res!648506) (not e!546210))))

(declare-datatypes ((array!59866 0))(
  ( (array!59867 (arr!28797 (Array (_ BitVec 32) (_ BitVec 64))) (size!29277 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59866)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969089 (= res!648506 (validKeyInArray!0 (select (arr!28797 _keys!1686) i!803)))))

(declare-fun b!969090 () Bool)

(declare-fun e!546212 () Bool)

(declare-fun e!546214 () Bool)

(declare-fun mapRes!34828 () Bool)

(assert (=> b!969090 (= e!546212 (and e!546214 mapRes!34828))))

(declare-fun condMapEmpty!34828 () Bool)

(declare-datatypes ((V!34169 0))(
  ( (V!34170 (val!10995 Int)) )
))
(declare-datatypes ((ValueCell!10463 0))(
  ( (ValueCellFull!10463 (v!13550 V!34169)) (EmptyCell!10463) )
))
(declare-datatypes ((array!59868 0))(
  ( (array!59869 (arr!28798 (Array (_ BitVec 32) ValueCell!10463)) (size!29278 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59868)

(declare-fun mapDefault!34828 () ValueCell!10463)

(assert (=> b!969090 (= condMapEmpty!34828 (= (arr!28798 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10463)) mapDefault!34828)))))

(declare-fun b!969091 () Bool)

(declare-fun e!546213 () Bool)

(declare-fun tp_is_empty!21889 () Bool)

(assert (=> b!969091 (= e!546213 tp_is_empty!21889)))

(declare-fun b!969092 () Bool)

(declare-fun res!648510 () Bool)

(assert (=> b!969092 (=> (not res!648510) (not e!546210))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!969092 (= res!648510 (and (= (size!29278 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29277 _keys!1686) (size!29278 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34828 () Bool)

(assert (=> mapIsEmpty!34828 mapRes!34828))

(declare-fun b!969093 () Bool)

(declare-fun res!648505 () Bool)

(assert (=> b!969093 (=> (not res!648505) (not e!546210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59866 (_ BitVec 32)) Bool)

(assert (=> b!969093 (= res!648505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!969094 () Bool)

(declare-fun res!648507 () Bool)

(assert (=> b!969094 (=> (not res!648507) (not e!546210))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!969094 (= res!648507 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29277 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29277 _keys!1686))))))

(declare-fun b!969095 () Bool)

(declare-fun e!546215 () Bool)

(assert (=> b!969095 (= e!546210 (not e!546215))))

(declare-fun res!648508 () Bool)

(assert (=> b!969095 (=> res!648508 e!546215)))

(assert (=> b!969095 (= res!648508 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29277 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!34169)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34169)

(declare-datatypes ((tuple2!14138 0))(
  ( (tuple2!14139 (_1!7080 (_ BitVec 64)) (_2!7080 V!34169)) )
))
(declare-datatypes ((List!19982 0))(
  ( (Nil!19979) (Cons!19978 (h!21146 tuple2!14138) (t!28337 List!19982)) )
))
(declare-datatypes ((ListLongMap!12837 0))(
  ( (ListLongMap!12838 (toList!6434 List!19982)) )
))
(declare-fun contains!5546 (ListLongMap!12837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3667 (array!59866 array!59868 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) Int) ListLongMap!12837)

(assert (=> b!969095 (contains!5546 (getCurrentListMap!3667 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28797 _keys!1686) i!803))))

(declare-datatypes ((Unit!32320 0))(
  ( (Unit!32321) )
))
(declare-fun lt!431861 () Unit!32320)

(declare-fun lemmaInListMapFromThenInFromMinusOne!71 (array!59866 array!59868 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) (_ BitVec 32) Int) Unit!32320)

(assert (=> b!969095 (= lt!431861 (lemmaInListMapFromThenInFromMinusOne!71 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!648502 () Bool)

(assert (=> start!83122 (=> (not res!648502) (not e!546210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83122 (= res!648502 (validMask!0 mask!2110))))

(assert (=> start!83122 e!546210))

(assert (=> start!83122 true))

(declare-fun array_inv!22355 (array!59868) Bool)

(assert (=> start!83122 (and (array_inv!22355 _values!1400) e!546212)))

(declare-fun array_inv!22356 (array!59866) Bool)

(assert (=> start!83122 (array_inv!22356 _keys!1686)))

(assert (=> start!83122 tp!66372))

(assert (=> start!83122 tp_is_empty!21889))

(declare-fun b!969096 () Bool)

(declare-fun res!648509 () Bool)

(assert (=> b!969096 (=> (not res!648509) (not e!546210))))

(assert (=> b!969096 (= res!648509 (contains!5546 (getCurrentListMap!3667 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28797 _keys!1686) i!803)))))

(declare-fun b!969097 () Bool)

(assert (=> b!969097 (= e!546214 tp_is_empty!21889)))

(declare-fun mapNonEmpty!34828 () Bool)

(declare-fun tp!66373 () Bool)

(assert (=> mapNonEmpty!34828 (= mapRes!34828 (and tp!66373 e!546213))))

(declare-fun mapValue!34828 () ValueCell!10463)

(declare-fun mapRest!34828 () (Array (_ BitVec 32) ValueCell!10463))

(declare-fun mapKey!34828 () (_ BitVec 32))

(assert (=> mapNonEmpty!34828 (= (arr!28798 _values!1400) (store mapRest!34828 mapKey!34828 mapValue!34828))))

(declare-fun b!969098 () Bool)

(declare-fun res!648504 () Bool)

(assert (=> b!969098 (=> (not res!648504) (not e!546210))))

(assert (=> b!969098 (= res!648504 (bvsgt from!2084 newFrom!159))))

(declare-fun b!969099 () Bool)

(declare-fun res!648503 () Bool)

(assert (=> b!969099 (=> (not res!648503) (not e!546210))))

(declare-datatypes ((List!19983 0))(
  ( (Nil!19980) (Cons!19979 (h!21147 (_ BitVec 64)) (t!28338 List!19983)) )
))
(declare-fun arrayNoDuplicates!0 (array!59866 (_ BitVec 32) List!19983) Bool)

(assert (=> b!969099 (= res!648503 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19980))))

(declare-fun b!969100 () Bool)

(assert (=> b!969100 (= e!546215 true)))

(assert (=> b!969100 (contains!5546 (getCurrentListMap!3667 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28797 _keys!1686) i!803))))

(declare-fun lt!431860 () Unit!32320)

(declare-fun lemmaInListMapFromThenInFromSmaller!39 (array!59866 array!59868 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32320)

(assert (=> b!969100 (= lt!431860 (lemmaInListMapFromThenInFromSmaller!39 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(assert (= (and start!83122 res!648502) b!969092))

(assert (= (and b!969092 res!648510) b!969093))

(assert (= (and b!969093 res!648505) b!969099))

(assert (= (and b!969099 res!648503) b!969094))

(assert (= (and b!969094 res!648507) b!969089))

(assert (= (and b!969089 res!648506) b!969096))

(assert (= (and b!969096 res!648509) b!969098))

(assert (= (and b!969098 res!648504) b!969095))

(assert (= (and b!969095 (not res!648508)) b!969100))

(assert (= (and b!969090 condMapEmpty!34828) mapIsEmpty!34828))

(assert (= (and b!969090 (not condMapEmpty!34828)) mapNonEmpty!34828))

(get-info :version)

(assert (= (and mapNonEmpty!34828 ((_ is ValueCellFull!10463) mapValue!34828)) b!969091))

(assert (= (and b!969090 ((_ is ValueCellFull!10463) mapDefault!34828)) b!969097))

(assert (= start!83122 b!969090))

(declare-fun m!897883 () Bool)

(assert (=> start!83122 m!897883))

(declare-fun m!897885 () Bool)

(assert (=> start!83122 m!897885))

(declare-fun m!897887 () Bool)

(assert (=> start!83122 m!897887))

(declare-fun m!897889 () Bool)

(assert (=> b!969099 m!897889))

(declare-fun m!897891 () Bool)

(assert (=> b!969093 m!897891))

(declare-fun m!897893 () Bool)

(assert (=> mapNonEmpty!34828 m!897893))

(declare-fun m!897895 () Bool)

(assert (=> b!969100 m!897895))

(declare-fun m!897897 () Bool)

(assert (=> b!969100 m!897897))

(assert (=> b!969100 m!897895))

(assert (=> b!969100 m!897897))

(declare-fun m!897899 () Bool)

(assert (=> b!969100 m!897899))

(declare-fun m!897901 () Bool)

(assert (=> b!969100 m!897901))

(declare-fun m!897903 () Bool)

(assert (=> b!969095 m!897903))

(assert (=> b!969095 m!897897))

(assert (=> b!969095 m!897903))

(assert (=> b!969095 m!897897))

(declare-fun m!897905 () Bool)

(assert (=> b!969095 m!897905))

(declare-fun m!897907 () Bool)

(assert (=> b!969095 m!897907))

(declare-fun m!897909 () Bool)

(assert (=> b!969096 m!897909))

(assert (=> b!969096 m!897897))

(assert (=> b!969096 m!897909))

(assert (=> b!969096 m!897897))

(declare-fun m!897911 () Bool)

(assert (=> b!969096 m!897911))

(assert (=> b!969089 m!897897))

(assert (=> b!969089 m!897897))

(declare-fun m!897913 () Bool)

(assert (=> b!969089 m!897913))

(check-sat (not b!969096) (not mapNonEmpty!34828) (not b!969100) (not b_next!19081) b_and!30579 (not b!969099) (not b!969095) tp_is_empty!21889 (not b!969089) (not start!83122) (not b!969093))
(check-sat b_and!30579 (not b_next!19081))
