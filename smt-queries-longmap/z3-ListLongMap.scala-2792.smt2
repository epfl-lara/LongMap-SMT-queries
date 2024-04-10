; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40642 () Bool)

(assert start!40642)

(declare-fun b_free!10653 () Bool)

(declare-fun b_next!10653 () Bool)

(assert (=> start!40642 (= b_free!10653 (not b_next!10653))))

(declare-fun tp!37778 () Bool)

(declare-fun b_and!18661 () Bool)

(assert (=> start!40642 (= tp!37778 b_and!18661)))

(declare-fun b!448862 () Bool)

(declare-fun res!266873 () Bool)

(declare-fun e!263300 () Bool)

(assert (=> b!448862 (=> (not res!266873) (not e!263300))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27789 0))(
  ( (array!27790 (arr!13340 (Array (_ BitVec 32) (_ BitVec 64))) (size!13692 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27789)

(assert (=> b!448862 (= res!266873 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13692 _keys!709))))))

(declare-fun b!448863 () Bool)

(declare-fun res!266874 () Bool)

(assert (=> b!448863 (=> (not res!266874) (not e!263300))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27789 (_ BitVec 32)) Bool)

(assert (=> b!448863 (= res!266874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448864 () Bool)

(declare-fun res!266883 () Bool)

(assert (=> b!448864 (=> (not res!266883) (not e!263300))))

(assert (=> b!448864 (= res!266883 (or (= (select (arr!13340 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13340 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448865 () Bool)

(declare-fun res!266882 () Bool)

(assert (=> b!448865 (=> (not res!266882) (not e!263300))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448865 (= res!266882 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448866 () Bool)

(declare-fun res!266880 () Bool)

(assert (=> b!448866 (=> (not res!266880) (not e!263300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448866 (= res!266880 (validMask!0 mask!1025))))

(declare-fun b!448867 () Bool)

(declare-fun e!263298 () Bool)

(assert (=> b!448867 (= e!263298 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17093 0))(
  ( (V!17094 (val!6040 Int)) )
))
(declare-fun minValue!515 () V!17093)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17093)

(declare-fun lt!204251 () array!27789)

(declare-datatypes ((ValueCell!5652 0))(
  ( (ValueCellFull!5652 (v!8295 V!17093)) (EmptyCell!5652) )
))
(declare-datatypes ((array!27791 0))(
  ( (array!27792 (arr!13341 (Array (_ BitVec 32) ValueCell!5652)) (size!13693 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27791)

(declare-datatypes ((tuple2!7926 0))(
  ( (tuple2!7927 (_1!3974 (_ BitVec 64)) (_2!3974 V!17093)) )
))
(declare-datatypes ((List!7991 0))(
  ( (Nil!7988) (Cons!7987 (h!8843 tuple2!7926) (t!13753 List!7991)) )
))
(declare-datatypes ((ListLongMap!6839 0))(
  ( (ListLongMap!6840 (toList!3435 List!7991)) )
))
(declare-fun lt!204250 () ListLongMap!6839)

(declare-fun v!412 () V!17093)

(declare-fun getCurrentListMapNoExtraKeys!1621 (array!27789 array!27791 (_ BitVec 32) (_ BitVec 32) V!17093 V!17093 (_ BitVec 32) Int) ListLongMap!6839)

(assert (=> b!448867 (= lt!204250 (getCurrentListMapNoExtraKeys!1621 lt!204251 (array!27792 (store (arr!13341 _values!549) i!563 (ValueCellFull!5652 v!412)) (size!13693 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204252 () ListLongMap!6839)

(assert (=> b!448867 (= lt!204252 (getCurrentListMapNoExtraKeys!1621 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448868 () Bool)

(declare-fun e!263295 () Bool)

(declare-fun tp_is_empty!11991 () Bool)

(assert (=> b!448868 (= e!263295 tp_is_empty!11991)))

(declare-fun mapNonEmpty!19620 () Bool)

(declare-fun mapRes!19620 () Bool)

(declare-fun tp!37779 () Bool)

(assert (=> mapNonEmpty!19620 (= mapRes!19620 (and tp!37779 e!263295))))

(declare-fun mapRest!19620 () (Array (_ BitVec 32) ValueCell!5652))

(declare-fun mapKey!19620 () (_ BitVec 32))

(declare-fun mapValue!19620 () ValueCell!5652)

(assert (=> mapNonEmpty!19620 (= (arr!13341 _values!549) (store mapRest!19620 mapKey!19620 mapValue!19620))))

(declare-fun b!448869 () Bool)

(declare-fun res!266872 () Bool)

(assert (=> b!448869 (=> (not res!266872) (not e!263298))))

(declare-datatypes ((List!7992 0))(
  ( (Nil!7989) (Cons!7988 (h!8844 (_ BitVec 64)) (t!13754 List!7992)) )
))
(declare-fun arrayNoDuplicates!0 (array!27789 (_ BitVec 32) List!7992) Bool)

(assert (=> b!448869 (= res!266872 (arrayNoDuplicates!0 lt!204251 #b00000000000000000000000000000000 Nil!7989))))

(declare-fun b!448870 () Bool)

(declare-fun e!263299 () Bool)

(assert (=> b!448870 (= e!263299 tp_is_empty!11991)))

(declare-fun res!266877 () Bool)

(assert (=> start!40642 (=> (not res!266877) (not e!263300))))

(assert (=> start!40642 (= res!266877 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13692 _keys!709))))))

(assert (=> start!40642 e!263300))

(assert (=> start!40642 tp_is_empty!11991))

(assert (=> start!40642 tp!37778))

(assert (=> start!40642 true))

(declare-fun e!263297 () Bool)

(declare-fun array_inv!9670 (array!27791) Bool)

(assert (=> start!40642 (and (array_inv!9670 _values!549) e!263297)))

(declare-fun array_inv!9671 (array!27789) Bool)

(assert (=> start!40642 (array_inv!9671 _keys!709)))

(declare-fun mapIsEmpty!19620 () Bool)

(assert (=> mapIsEmpty!19620 mapRes!19620))

(declare-fun b!448871 () Bool)

(declare-fun res!266879 () Bool)

(assert (=> b!448871 (=> (not res!266879) (not e!263300))))

(assert (=> b!448871 (= res!266879 (and (= (size!13693 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13692 _keys!709) (size!13693 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448872 () Bool)

(assert (=> b!448872 (= e!263300 e!263298)))

(declare-fun res!266875 () Bool)

(assert (=> b!448872 (=> (not res!266875) (not e!263298))))

(assert (=> b!448872 (= res!266875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204251 mask!1025))))

(assert (=> b!448872 (= lt!204251 (array!27790 (store (arr!13340 _keys!709) i!563 k0!794) (size!13692 _keys!709)))))

(declare-fun b!448873 () Bool)

(assert (=> b!448873 (= e!263297 (and e!263299 mapRes!19620))))

(declare-fun condMapEmpty!19620 () Bool)

(declare-fun mapDefault!19620 () ValueCell!5652)

(assert (=> b!448873 (= condMapEmpty!19620 (= (arr!13341 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5652)) mapDefault!19620)))))

(declare-fun b!448874 () Bool)

(declare-fun res!266881 () Bool)

(assert (=> b!448874 (=> (not res!266881) (not e!263300))))

(assert (=> b!448874 (= res!266881 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7989))))

(declare-fun b!448875 () Bool)

(declare-fun res!266876 () Bool)

(assert (=> b!448875 (=> (not res!266876) (not e!263298))))

(assert (=> b!448875 (= res!266876 (bvsle from!863 i!563))))

(declare-fun b!448876 () Bool)

(declare-fun res!266878 () Bool)

(assert (=> b!448876 (=> (not res!266878) (not e!263300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448876 (= res!266878 (validKeyInArray!0 k0!794))))

(assert (= (and start!40642 res!266877) b!448866))

(assert (= (and b!448866 res!266880) b!448871))

(assert (= (and b!448871 res!266879) b!448863))

(assert (= (and b!448863 res!266874) b!448874))

(assert (= (and b!448874 res!266881) b!448862))

(assert (= (and b!448862 res!266873) b!448876))

(assert (= (and b!448876 res!266878) b!448864))

(assert (= (and b!448864 res!266883) b!448865))

(assert (= (and b!448865 res!266882) b!448872))

(assert (= (and b!448872 res!266875) b!448869))

(assert (= (and b!448869 res!266872) b!448875))

(assert (= (and b!448875 res!266876) b!448867))

(assert (= (and b!448873 condMapEmpty!19620) mapIsEmpty!19620))

(assert (= (and b!448873 (not condMapEmpty!19620)) mapNonEmpty!19620))

(get-info :version)

(assert (= (and mapNonEmpty!19620 ((_ is ValueCellFull!5652) mapValue!19620)) b!448868))

(assert (= (and b!448873 ((_ is ValueCellFull!5652) mapDefault!19620)) b!448870))

(assert (= start!40642 b!448873))

(declare-fun m!433273 () Bool)

(assert (=> b!448876 m!433273))

(declare-fun m!433275 () Bool)

(assert (=> b!448863 m!433275))

(declare-fun m!433277 () Bool)

(assert (=> b!448874 m!433277))

(declare-fun m!433279 () Bool)

(assert (=> b!448865 m!433279))

(declare-fun m!433281 () Bool)

(assert (=> b!448869 m!433281))

(declare-fun m!433283 () Bool)

(assert (=> start!40642 m!433283))

(declare-fun m!433285 () Bool)

(assert (=> start!40642 m!433285))

(declare-fun m!433287 () Bool)

(assert (=> b!448867 m!433287))

(declare-fun m!433289 () Bool)

(assert (=> b!448867 m!433289))

(declare-fun m!433291 () Bool)

(assert (=> b!448867 m!433291))

(declare-fun m!433293 () Bool)

(assert (=> b!448872 m!433293))

(declare-fun m!433295 () Bool)

(assert (=> b!448872 m!433295))

(declare-fun m!433297 () Bool)

(assert (=> b!448864 m!433297))

(declare-fun m!433299 () Bool)

(assert (=> b!448866 m!433299))

(declare-fun m!433301 () Bool)

(assert (=> mapNonEmpty!19620 m!433301))

(check-sat (not b!448874) (not b!448876) (not start!40642) (not b!448869) b_and!18661 tp_is_empty!11991 (not b!448867) (not mapNonEmpty!19620) (not b!448865) (not b!448872) (not b!448863) (not b!448866) (not b_next!10653))
(check-sat b_and!18661 (not b_next!10653))
