; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82612 () Bool)

(assert start!82612)

(declare-fun b_free!18763 () Bool)

(declare-fun b_next!18763 () Bool)

(assert (=> start!82612 (= b_free!18763 (not b_next!18763))))

(declare-fun tp!65409 () Bool)

(declare-fun b_and!30225 () Bool)

(assert (=> start!82612 (= tp!65409 b_and!30225)))

(declare-fun b!962923 () Bool)

(declare-fun e!542960 () Bool)

(declare-fun tp_is_empty!21565 () Bool)

(assert (=> b!962923 (= e!542960 tp_is_empty!21565)))

(declare-fun mapIsEmpty!34342 () Bool)

(declare-fun mapRes!34342 () Bool)

(assert (=> mapIsEmpty!34342 mapRes!34342))

(declare-fun b!962924 () Bool)

(declare-fun e!542961 () Bool)

(assert (=> b!962924 (= e!542961 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33737 0))(
  ( (V!33738 (val!10833 Int)) )
))
(declare-datatypes ((ValueCell!10301 0))(
  ( (ValueCellFull!10301 (v!13390 V!33737)) (EmptyCell!10301) )
))
(declare-datatypes ((array!59156 0))(
  ( (array!59157 (arr!28447 (Array (_ BitVec 32) ValueCell!10301)) (size!28928 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59156)

(declare-datatypes ((array!59158 0))(
  ( (array!59159 (arr!28448 (Array (_ BitVec 32) (_ BitVec 64))) (size!28929 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59158)

(declare-fun minValue!1342 () V!33737)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33737)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13976 0))(
  ( (tuple2!13977 (_1!6999 (_ BitVec 64)) (_2!6999 V!33737)) )
))
(declare-datatypes ((List!19785 0))(
  ( (Nil!19782) (Cons!19781 (h!20943 tuple2!13976) (t!28139 List!19785)) )
))
(declare-datatypes ((ListLongMap!12663 0))(
  ( (ListLongMap!12664 (toList!6347 List!19785)) )
))
(declare-fun contains!5394 (ListLongMap!12663 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3509 (array!59158 array!59156 (_ BitVec 32) (_ BitVec 32) V!33737 V!33737 (_ BitVec 32) Int) ListLongMap!12663)

(assert (=> b!962924 (contains!5394 (getCurrentListMap!3509 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28448 _keys!1686) i!803))))

(declare-datatypes ((Unit!32082 0))(
  ( (Unit!32083) )
))
(declare-fun lt!430712 () Unit!32082)

(declare-fun lemmaInListMapFromThenInFromMinusOne!7 (array!59158 array!59156 (_ BitVec 32) (_ BitVec 32) V!33737 V!33737 (_ BitVec 32) (_ BitVec 32) Int) Unit!32082)

(assert (=> b!962924 (= lt!430712 (lemmaInListMapFromThenInFromMinusOne!7 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962925 () Bool)

(declare-fun e!542962 () Bool)

(assert (=> b!962925 (= e!542962 (and e!542960 mapRes!34342))))

(declare-fun condMapEmpty!34342 () Bool)

(declare-fun mapDefault!34342 () ValueCell!10301)

(assert (=> b!962925 (= condMapEmpty!34342 (= (arr!28447 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10301)) mapDefault!34342)))))

(declare-fun b!962926 () Bool)

(declare-fun e!542958 () Bool)

(assert (=> b!962926 (= e!542958 tp_is_empty!21565)))

(declare-fun b!962927 () Bool)

(declare-fun res!644483 () Bool)

(assert (=> b!962927 (=> (not res!644483) (not e!542961))))

(assert (=> b!962927 (= res!644483 (and (= (size!28928 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28929 _keys!1686) (size!28928 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962928 () Bool)

(declare-fun res!644488 () Bool)

(assert (=> b!962928 (=> (not res!644488) (not e!542961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59158 (_ BitVec 32)) Bool)

(assert (=> b!962928 (= res!644488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962929 () Bool)

(declare-fun res!644482 () Bool)

(assert (=> b!962929 (=> (not res!644482) (not e!542961))))

(declare-datatypes ((List!19786 0))(
  ( (Nil!19783) (Cons!19782 (h!20944 (_ BitVec 64)) (t!28140 List!19786)) )
))
(declare-fun arrayNoDuplicates!0 (array!59158 (_ BitVec 32) List!19786) Bool)

(assert (=> b!962929 (= res!644482 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19783))))

(declare-fun b!962930 () Bool)

(declare-fun res!644485 () Bool)

(assert (=> b!962930 (=> (not res!644485) (not e!542961))))

(assert (=> b!962930 (= res!644485 (contains!5394 (getCurrentListMap!3509 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28448 _keys!1686) i!803)))))

(declare-fun b!962931 () Bool)

(declare-fun res!644487 () Bool)

(assert (=> b!962931 (=> (not res!644487) (not e!542961))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962931 (= res!644487 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962932 () Bool)

(declare-fun res!644484 () Bool)

(assert (=> b!962932 (=> (not res!644484) (not e!542961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962932 (= res!644484 (validKeyInArray!0 (select (arr!28448 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34342 () Bool)

(declare-fun tp!65410 () Bool)

(assert (=> mapNonEmpty!34342 (= mapRes!34342 (and tp!65410 e!542958))))

(declare-fun mapValue!34342 () ValueCell!10301)

(declare-fun mapRest!34342 () (Array (_ BitVec 32) ValueCell!10301))

(declare-fun mapKey!34342 () (_ BitVec 32))

(assert (=> mapNonEmpty!34342 (= (arr!28447 _values!1400) (store mapRest!34342 mapKey!34342 mapValue!34342))))

(declare-fun b!962933 () Bool)

(declare-fun res!644489 () Bool)

(assert (=> b!962933 (=> (not res!644489) (not e!542961))))

(assert (=> b!962933 (= res!644489 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28929 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28929 _keys!1686))))))

(declare-fun res!644486 () Bool)

(assert (=> start!82612 (=> (not res!644486) (not e!542961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82612 (= res!644486 (validMask!0 mask!2110))))

(assert (=> start!82612 e!542961))

(assert (=> start!82612 true))

(declare-fun array_inv!22099 (array!59156) Bool)

(assert (=> start!82612 (and (array_inv!22099 _values!1400) e!542962)))

(declare-fun array_inv!22100 (array!59158) Bool)

(assert (=> start!82612 (array_inv!22100 _keys!1686)))

(assert (=> start!82612 tp!65409))

(assert (=> start!82612 tp_is_empty!21565))

(assert (= (and start!82612 res!644486) b!962927))

(assert (= (and b!962927 res!644483) b!962928))

(assert (= (and b!962928 res!644488) b!962929))

(assert (= (and b!962929 res!644482) b!962933))

(assert (= (and b!962933 res!644489) b!962932))

(assert (= (and b!962932 res!644484) b!962930))

(assert (= (and b!962930 res!644485) b!962931))

(assert (= (and b!962931 res!644487) b!962924))

(assert (= (and b!962925 condMapEmpty!34342) mapIsEmpty!34342))

(assert (= (and b!962925 (not condMapEmpty!34342)) mapNonEmpty!34342))

(get-info :version)

(assert (= (and mapNonEmpty!34342 ((_ is ValueCellFull!10301) mapValue!34342)) b!962926))

(assert (= (and b!962925 ((_ is ValueCellFull!10301) mapDefault!34342)) b!962923))

(assert (= start!82612 b!962925))

(declare-fun m!891883 () Bool)

(assert (=> b!962929 m!891883))

(declare-fun m!891885 () Bool)

(assert (=> start!82612 m!891885))

(declare-fun m!891887 () Bool)

(assert (=> start!82612 m!891887))

(declare-fun m!891889 () Bool)

(assert (=> start!82612 m!891889))

(declare-fun m!891891 () Bool)

(assert (=> b!962932 m!891891))

(assert (=> b!962932 m!891891))

(declare-fun m!891893 () Bool)

(assert (=> b!962932 m!891893))

(declare-fun m!891895 () Bool)

(assert (=> mapNonEmpty!34342 m!891895))

(declare-fun m!891897 () Bool)

(assert (=> b!962930 m!891897))

(assert (=> b!962930 m!891891))

(assert (=> b!962930 m!891897))

(assert (=> b!962930 m!891891))

(declare-fun m!891899 () Bool)

(assert (=> b!962930 m!891899))

(declare-fun m!891901 () Bool)

(assert (=> b!962928 m!891901))

(declare-fun m!891903 () Bool)

(assert (=> b!962924 m!891903))

(assert (=> b!962924 m!891891))

(assert (=> b!962924 m!891903))

(assert (=> b!962924 m!891891))

(declare-fun m!891905 () Bool)

(assert (=> b!962924 m!891905))

(declare-fun m!891907 () Bool)

(assert (=> b!962924 m!891907))

(check-sat (not b!962924) (not b!962928) (not b!962930) (not b_next!18763) (not b!962929) b_and!30225 (not mapNonEmpty!34342) (not start!82612) (not b!962932) tp_is_empty!21565)
(check-sat b_and!30225 (not b_next!18763))
