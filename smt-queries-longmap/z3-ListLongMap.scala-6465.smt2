; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82798 () Bool)

(assert start!82798)

(declare-fun b_free!18763 () Bool)

(declare-fun b_next!18763 () Bool)

(assert (=> start!82798 (= b_free!18763 (not b_next!18763))))

(declare-fun tp!65409 () Bool)

(declare-fun b_and!30261 () Bool)

(assert (=> start!82798 (= tp!65409 b_and!30261)))

(declare-fun b!964065 () Bool)

(declare-fun res!644937 () Bool)

(declare-fun e!543688 () Bool)

(assert (=> b!964065 (=> (not res!644937) (not e!543688))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964065 (= res!644937 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964066 () Bool)

(declare-fun e!543692 () Bool)

(declare-fun tp_is_empty!21565 () Bool)

(assert (=> b!964066 (= e!543692 tp_is_empty!21565)))

(declare-fun b!964067 () Bool)

(assert (=> b!964067 (= e!543688 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33737 0))(
  ( (V!33738 (val!10833 Int)) )
))
(declare-datatypes ((ValueCell!10301 0))(
  ( (ValueCellFull!10301 (v!13388 V!33737)) (EmptyCell!10301) )
))
(declare-datatypes ((array!59242 0))(
  ( (array!59243 (arr!28485 (Array (_ BitVec 32) ValueCell!10301)) (size!28965 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59242)

(declare-datatypes ((array!59244 0))(
  ( (array!59245 (arr!28486 (Array (_ BitVec 32) (_ BitVec 64))) (size!28966 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59244)

(declare-fun minValue!1342 () V!33737)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33737)

(declare-datatypes ((tuple2!13896 0))(
  ( (tuple2!13897 (_1!6959 (_ BitVec 64)) (_2!6959 V!33737)) )
))
(declare-datatypes ((List!19748 0))(
  ( (Nil!19745) (Cons!19744 (h!20912 tuple2!13896) (t!28103 List!19748)) )
))
(declare-datatypes ((ListLongMap!12595 0))(
  ( (ListLongMap!12596 (toList!6313 List!19748)) )
))
(declare-fun contains!5428 (ListLongMap!12595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3546 (array!59244 array!59242 (_ BitVec 32) (_ BitVec 32) V!33737 V!33737 (_ BitVec 32) Int) ListLongMap!12595)

(assert (=> b!964067 (contains!5428 (getCurrentListMap!3546 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28486 _keys!1686) i!803))))

(declare-datatypes ((Unit!32188 0))(
  ( (Unit!32189) )
))
(declare-fun lt!431309 () Unit!32188)

(declare-fun lemmaInListMapFromThenInFromMinusOne!8 (array!59244 array!59242 (_ BitVec 32) (_ BitVec 32) V!33737 V!33737 (_ BitVec 32) (_ BitVec 32) Int) Unit!32188)

(assert (=> b!964067 (= lt!431309 (lemmaInListMapFromThenInFromMinusOne!8 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964068 () Bool)

(declare-fun res!644941 () Bool)

(assert (=> b!964068 (=> (not res!644941) (not e!543688))))

(assert (=> b!964068 (= res!644941 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28966 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28966 _keys!1686))))))

(declare-fun b!964069 () Bool)

(declare-fun res!644939 () Bool)

(assert (=> b!964069 (=> (not res!644939) (not e!543688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59244 (_ BitVec 32)) Bool)

(assert (=> b!964069 (= res!644939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964070 () Bool)

(declare-fun e!543691 () Bool)

(declare-fun e!543689 () Bool)

(declare-fun mapRes!34342 () Bool)

(assert (=> b!964070 (= e!543691 (and e!543689 mapRes!34342))))

(declare-fun condMapEmpty!34342 () Bool)

(declare-fun mapDefault!34342 () ValueCell!10301)

(assert (=> b!964070 (= condMapEmpty!34342 (= (arr!28485 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10301)) mapDefault!34342)))))

(declare-fun b!964072 () Bool)

(declare-fun res!644936 () Bool)

(assert (=> b!964072 (=> (not res!644936) (not e!543688))))

(assert (=> b!964072 (= res!644936 (and (= (size!28965 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28966 _keys!1686) (size!28965 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964073 () Bool)

(declare-fun res!644943 () Bool)

(assert (=> b!964073 (=> (not res!644943) (not e!543688))))

(declare-datatypes ((List!19749 0))(
  ( (Nil!19746) (Cons!19745 (h!20913 (_ BitVec 64)) (t!28104 List!19749)) )
))
(declare-fun arrayNoDuplicates!0 (array!59244 (_ BitVec 32) List!19749) Bool)

(assert (=> b!964073 (= res!644943 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19746))))

(declare-fun mapNonEmpty!34342 () Bool)

(declare-fun tp!65410 () Bool)

(assert (=> mapNonEmpty!34342 (= mapRes!34342 (and tp!65410 e!543692))))

(declare-fun mapKey!34342 () (_ BitVec 32))

(declare-fun mapRest!34342 () (Array (_ BitVec 32) ValueCell!10301))

(declare-fun mapValue!34342 () ValueCell!10301)

(assert (=> mapNonEmpty!34342 (= (arr!28485 _values!1400) (store mapRest!34342 mapKey!34342 mapValue!34342))))

(declare-fun b!964074 () Bool)

(declare-fun res!644940 () Bool)

(assert (=> b!964074 (=> (not res!644940) (not e!543688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964074 (= res!644940 (validKeyInArray!0 (select (arr!28486 _keys!1686) i!803)))))

(declare-fun res!644938 () Bool)

(assert (=> start!82798 (=> (not res!644938) (not e!543688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82798 (= res!644938 (validMask!0 mask!2110))))

(assert (=> start!82798 e!543688))

(assert (=> start!82798 true))

(declare-fun array_inv!22131 (array!59242) Bool)

(assert (=> start!82798 (and (array_inv!22131 _values!1400) e!543691)))

(declare-fun array_inv!22132 (array!59244) Bool)

(assert (=> start!82798 (array_inv!22132 _keys!1686)))

(assert (=> start!82798 tp!65409))

(assert (=> start!82798 tp_is_empty!21565))

(declare-fun b!964071 () Bool)

(declare-fun res!644942 () Bool)

(assert (=> b!964071 (=> (not res!644942) (not e!543688))))

(assert (=> b!964071 (= res!644942 (contains!5428 (getCurrentListMap!3546 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28486 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34342 () Bool)

(assert (=> mapIsEmpty!34342 mapRes!34342))

(declare-fun b!964075 () Bool)

(assert (=> b!964075 (= e!543689 tp_is_empty!21565)))

(assert (= (and start!82798 res!644938) b!964072))

(assert (= (and b!964072 res!644936) b!964069))

(assert (= (and b!964069 res!644939) b!964073))

(assert (= (and b!964073 res!644943) b!964068))

(assert (= (and b!964068 res!644941) b!964074))

(assert (= (and b!964074 res!644940) b!964071))

(assert (= (and b!964071 res!644942) b!964065))

(assert (= (and b!964065 res!644937) b!964067))

(assert (= (and b!964070 condMapEmpty!34342) mapIsEmpty!34342))

(assert (= (and b!964070 (not condMapEmpty!34342)) mapNonEmpty!34342))

(get-info :version)

(assert (= (and mapNonEmpty!34342 ((_ is ValueCellFull!10301) mapValue!34342)) b!964066))

(assert (= (and b!964070 ((_ is ValueCellFull!10301) mapDefault!34342)) b!964075))

(assert (= start!82798 b!964070))

(declare-fun m!893935 () Bool)

(assert (=> b!964067 m!893935))

(declare-fun m!893937 () Bool)

(assert (=> b!964067 m!893937))

(assert (=> b!964067 m!893935))

(assert (=> b!964067 m!893937))

(declare-fun m!893939 () Bool)

(assert (=> b!964067 m!893939))

(declare-fun m!893941 () Bool)

(assert (=> b!964067 m!893941))

(declare-fun m!893943 () Bool)

(assert (=> b!964073 m!893943))

(declare-fun m!893945 () Bool)

(assert (=> b!964071 m!893945))

(assert (=> b!964071 m!893937))

(assert (=> b!964071 m!893945))

(assert (=> b!964071 m!893937))

(declare-fun m!893947 () Bool)

(assert (=> b!964071 m!893947))

(declare-fun m!893949 () Bool)

(assert (=> start!82798 m!893949))

(declare-fun m!893951 () Bool)

(assert (=> start!82798 m!893951))

(declare-fun m!893953 () Bool)

(assert (=> start!82798 m!893953))

(declare-fun m!893955 () Bool)

(assert (=> b!964069 m!893955))

(assert (=> b!964074 m!893937))

(assert (=> b!964074 m!893937))

(declare-fun m!893957 () Bool)

(assert (=> b!964074 m!893957))

(declare-fun m!893959 () Bool)

(assert (=> mapNonEmpty!34342 m!893959))

(check-sat (not b!964074) (not b!964069) (not b_next!18763) (not start!82798) (not b!964071) (not b!964067) tp_is_empty!21565 b_and!30261 (not mapNonEmpty!34342) (not b!964073))
(check-sat b_and!30261 (not b_next!18763))
