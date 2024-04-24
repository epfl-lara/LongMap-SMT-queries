; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79404 () Bool)

(assert start!79404)

(declare-fun b_free!17449 () Bool)

(declare-fun b_next!17449 () Bool)

(assert (=> start!79404 (= b_free!17449 (not b_next!17449))))

(declare-fun tp!60789 () Bool)

(declare-fun b_and!28525 () Bool)

(assert (=> start!79404 (= tp!60789 b_and!28525)))

(declare-fun b!931320 () Bool)

(declare-fun e!523051 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55919 0))(
  ( (array!55920 (arr!26900 (Array (_ BitVec 32) (_ BitVec 64))) (size!27360 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55919)

(assert (=> b!931320 (= e!523051 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27360 _keys!1487)))))

(declare-fun mapIsEmpty!31692 () Bool)

(declare-fun mapRes!31692 () Bool)

(assert (=> mapIsEmpty!31692 mapRes!31692))

(declare-fun b!931322 () Bool)

(declare-fun res!626940 () Bool)

(declare-fun e!523050 () Bool)

(assert (=> b!931322 (=> (not res!626940) (not e!523050))))

(assert (=> b!931322 (= res!626940 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27360 _keys!1487))))))

(declare-fun b!931323 () Bool)

(declare-fun res!626935 () Bool)

(assert (=> b!931323 (=> (not res!626935) (not e!523050))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55919 (_ BitVec 32)) Bool)

(assert (=> b!931323 (= res!626935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931324 () Bool)

(declare-fun res!626937 () Bool)

(assert (=> b!931324 (=> (not res!626937) (not e!523050))))

(declare-datatypes ((List!18909 0))(
  ( (Nil!18906) (Cons!18905 (h!20057 (_ BitVec 64)) (t!26958 List!18909)) )
))
(declare-fun arrayNoDuplicates!0 (array!55919 (_ BitVec 32) List!18909) Bool)

(assert (=> b!931324 (= res!626937 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18906))))

(declare-fun b!931325 () Bool)

(declare-fun res!626941 () Bool)

(assert (=> b!931325 (=> (not res!626941) (not e!523051))))

(assert (=> b!931325 (= res!626941 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931326 () Bool)

(declare-fun res!626943 () Bool)

(assert (=> b!931326 (=> (not res!626943) (not e!523050))))

(declare-datatypes ((V!31575 0))(
  ( (V!31576 (val!10029 Int)) )
))
(declare-datatypes ((ValueCell!9497 0))(
  ( (ValueCellFull!9497 (v!12544 V!31575)) (EmptyCell!9497) )
))
(declare-datatypes ((array!55921 0))(
  ( (array!55922 (arr!26901 (Array (_ BitVec 32) ValueCell!9497)) (size!27361 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55921)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931326 (= res!626943 (and (= (size!27361 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27360 _keys!1487) (size!27361 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931327 () Bool)

(declare-fun res!626936 () Bool)

(assert (=> b!931327 (=> (not res!626936) (not e!523051))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31575)

(declare-datatypes ((tuple2!13120 0))(
  ( (tuple2!13121 (_1!6571 (_ BitVec 64)) (_2!6571 V!31575)) )
))
(declare-datatypes ((List!18910 0))(
  ( (Nil!18907) (Cons!18906 (h!20058 tuple2!13120) (t!26959 List!18910)) )
))
(declare-datatypes ((ListLongMap!11819 0))(
  ( (ListLongMap!11820 (toList!5925 List!18910)) )
))
(declare-fun lt!419594 () ListLongMap!11819)

(declare-fun apply!761 (ListLongMap!11819 (_ BitVec 64)) V!31575)

(assert (=> b!931327 (= res!626936 (= (apply!761 lt!419594 k0!1099) v!791))))

(declare-fun b!931328 () Bool)

(assert (=> b!931328 (= e!523050 e!523051)))

(declare-fun res!626942 () Bool)

(assert (=> b!931328 (=> (not res!626942) (not e!523051))))

(declare-fun contains!4992 (ListLongMap!11819 (_ BitVec 64)) Bool)

(assert (=> b!931328 (= res!626942 (contains!4992 lt!419594 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31575)

(declare-fun minValue!1173 () V!31575)

(declare-fun getCurrentListMap!3170 (array!55919 array!55921 (_ BitVec 32) (_ BitVec 32) V!31575 V!31575 (_ BitVec 32) Int) ListLongMap!11819)

(assert (=> b!931328 (= lt!419594 (getCurrentListMap!3170 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931329 () Bool)

(declare-fun e!523046 () Bool)

(declare-fun tp_is_empty!19957 () Bool)

(assert (=> b!931329 (= e!523046 tp_is_empty!19957)))

(declare-fun b!931330 () Bool)

(declare-fun res!626939 () Bool)

(assert (=> b!931330 (=> (not res!626939) (not e!523051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931330 (= res!626939 (validKeyInArray!0 k0!1099))))

(declare-fun b!931321 () Bool)

(declare-fun e!523047 () Bool)

(assert (=> b!931321 (= e!523047 (and e!523046 mapRes!31692))))

(declare-fun condMapEmpty!31692 () Bool)

(declare-fun mapDefault!31692 () ValueCell!9497)

(assert (=> b!931321 (= condMapEmpty!31692 (= (arr!26901 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9497)) mapDefault!31692)))))

(declare-fun res!626938 () Bool)

(assert (=> start!79404 (=> (not res!626938) (not e!523050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79404 (= res!626938 (validMask!0 mask!1881))))

(assert (=> start!79404 e!523050))

(assert (=> start!79404 true))

(assert (=> start!79404 tp_is_empty!19957))

(declare-fun array_inv!21038 (array!55921) Bool)

(assert (=> start!79404 (and (array_inv!21038 _values!1231) e!523047)))

(assert (=> start!79404 tp!60789))

(declare-fun array_inv!21039 (array!55919) Bool)

(assert (=> start!79404 (array_inv!21039 _keys!1487)))

(declare-fun mapNonEmpty!31692 () Bool)

(declare-fun tp!60788 () Bool)

(declare-fun e!523049 () Bool)

(assert (=> mapNonEmpty!31692 (= mapRes!31692 (and tp!60788 e!523049))))

(declare-fun mapRest!31692 () (Array (_ BitVec 32) ValueCell!9497))

(declare-fun mapValue!31692 () ValueCell!9497)

(declare-fun mapKey!31692 () (_ BitVec 32))

(assert (=> mapNonEmpty!31692 (= (arr!26901 _values!1231) (store mapRest!31692 mapKey!31692 mapValue!31692))))

(declare-fun b!931331 () Bool)

(assert (=> b!931331 (= e!523049 tp_is_empty!19957)))

(assert (= (and start!79404 res!626938) b!931326))

(assert (= (and b!931326 res!626943) b!931323))

(assert (= (and b!931323 res!626935) b!931324))

(assert (= (and b!931324 res!626937) b!931322))

(assert (= (and b!931322 res!626940) b!931328))

(assert (= (and b!931328 res!626942) b!931327))

(assert (= (and b!931327 res!626936) b!931325))

(assert (= (and b!931325 res!626941) b!931330))

(assert (= (and b!931330 res!626939) b!931320))

(assert (= (and b!931321 condMapEmpty!31692) mapIsEmpty!31692))

(assert (= (and b!931321 (not condMapEmpty!31692)) mapNonEmpty!31692))

(get-info :version)

(assert (= (and mapNonEmpty!31692 ((_ is ValueCellFull!9497) mapValue!31692)) b!931331))

(assert (= (and b!931321 ((_ is ValueCellFull!9497) mapDefault!31692)) b!931329))

(assert (= start!79404 b!931321))

(declare-fun m!865939 () Bool)

(assert (=> mapNonEmpty!31692 m!865939))

(declare-fun m!865941 () Bool)

(assert (=> b!931324 m!865941))

(declare-fun m!865943 () Bool)

(assert (=> start!79404 m!865943))

(declare-fun m!865945 () Bool)

(assert (=> start!79404 m!865945))

(declare-fun m!865947 () Bool)

(assert (=> start!79404 m!865947))

(declare-fun m!865949 () Bool)

(assert (=> b!931328 m!865949))

(declare-fun m!865951 () Bool)

(assert (=> b!931328 m!865951))

(declare-fun m!865953 () Bool)

(assert (=> b!931327 m!865953))

(declare-fun m!865955 () Bool)

(assert (=> b!931323 m!865955))

(declare-fun m!865957 () Bool)

(assert (=> b!931330 m!865957))

(check-sat (not b!931323) tp_is_empty!19957 (not b!931330) (not b!931327) (not b!931328) (not b_next!17449) (not start!79404) (not mapNonEmpty!31692) b_and!28525 (not b!931324))
(check-sat b_and!28525 (not b_next!17449))
