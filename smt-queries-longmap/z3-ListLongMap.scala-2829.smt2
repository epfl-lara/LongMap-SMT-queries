; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40924 () Bool)

(assert start!40924)

(declare-fun b_free!10873 () Bool)

(declare-fun b_next!10873 () Bool)

(assert (=> start!40924 (= b_free!10873 (not b_next!10873))))

(declare-fun tp!38445 () Bool)

(declare-fun b_and!19025 () Bool)

(assert (=> start!40924 (= tp!38445 b_and!19025)))

(declare-fun b!455206 () Bool)

(declare-fun res!271432 () Bool)

(declare-fun e!266172 () Bool)

(assert (=> b!455206 (=> (not res!271432) (not e!266172))))

(declare-datatypes ((array!28216 0))(
  ( (array!28217 (arr!13551 (Array (_ BitVec 32) (_ BitVec 64))) (size!13903 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28216)

(declare-datatypes ((List!8078 0))(
  ( (Nil!8075) (Cons!8074 (h!8930 (_ BitVec 64)) (t!13898 List!8078)) )
))
(declare-fun arrayNoDuplicates!0 (array!28216 (_ BitVec 32) List!8078) Bool)

(assert (=> b!455206 (= res!271432 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8075))))

(declare-fun b!455207 () Bool)

(declare-fun e!266173 () Bool)

(declare-fun tp_is_empty!12211 () Bool)

(assert (=> b!455207 (= e!266173 tp_is_empty!12211)))

(declare-fun b!455208 () Bool)

(declare-fun res!271426 () Bool)

(assert (=> b!455208 (=> (not res!271426) (not e!266172))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455208 (= res!271426 (validMask!0 mask!1025))))

(declare-fun b!455209 () Bool)

(declare-fun res!271428 () Bool)

(declare-fun e!266176 () Bool)

(assert (=> b!455209 (=> (not res!271428) (not e!266176))))

(declare-fun lt!206315 () array!28216)

(assert (=> b!455209 (= res!271428 (arrayNoDuplicates!0 lt!206315 #b00000000000000000000000000000000 Nil!8075))))

(declare-fun mapIsEmpty!19957 () Bool)

(declare-fun mapRes!19957 () Bool)

(assert (=> mapIsEmpty!19957 mapRes!19957))

(declare-fun b!455210 () Bool)

(assert (=> b!455210 (= e!266176 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17387 0))(
  ( (V!17388 (val!6150 Int)) )
))
(declare-datatypes ((ValueCell!5762 0))(
  ( (ValueCellFull!5762 (v!8417 V!17387)) (EmptyCell!5762) )
))
(declare-datatypes ((array!28218 0))(
  ( (array!28219 (arr!13552 (Array (_ BitVec 32) ValueCell!5762)) (size!13904 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28218)

(declare-datatypes ((tuple2!8008 0))(
  ( (tuple2!8009 (_1!4015 (_ BitVec 64)) (_2!4015 V!17387)) )
))
(declare-datatypes ((List!8079 0))(
  ( (Nil!8076) (Cons!8075 (h!8931 tuple2!8008) (t!13899 List!8079)) )
))
(declare-datatypes ((ListLongMap!6923 0))(
  ( (ListLongMap!6924 (toList!3477 List!8079)) )
))
(declare-fun lt!206313 () ListLongMap!6923)

(declare-fun zeroValue!515 () V!17387)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17387)

(declare-fun minValue!515 () V!17387)

(declare-fun getCurrentListMapNoExtraKeys!1706 (array!28216 array!28218 (_ BitVec 32) (_ BitVec 32) V!17387 V!17387 (_ BitVec 32) Int) ListLongMap!6923)

(assert (=> b!455210 (= lt!206313 (getCurrentListMapNoExtraKeys!1706 lt!206315 (array!28219 (store (arr!13552 _values!549) i!563 (ValueCellFull!5762 v!412)) (size!13904 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206314 () ListLongMap!6923)

(assert (=> b!455210 (= lt!206314 (getCurrentListMapNoExtraKeys!1706 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455211 () Bool)

(declare-fun res!271422 () Bool)

(assert (=> b!455211 (=> (not res!271422) (not e!266172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28216 (_ BitVec 32)) Bool)

(assert (=> b!455211 (= res!271422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!271429 () Bool)

(assert (=> start!40924 (=> (not res!271429) (not e!266172))))

(assert (=> start!40924 (= res!271429 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13903 _keys!709))))))

(assert (=> start!40924 e!266172))

(assert (=> start!40924 tp_is_empty!12211))

(assert (=> start!40924 tp!38445))

(assert (=> start!40924 true))

(declare-fun e!266171 () Bool)

(declare-fun array_inv!9890 (array!28218) Bool)

(assert (=> start!40924 (and (array_inv!9890 _values!549) e!266171)))

(declare-fun array_inv!9891 (array!28216) Bool)

(assert (=> start!40924 (array_inv!9891 _keys!709)))

(declare-fun mapNonEmpty!19957 () Bool)

(declare-fun tp!38446 () Bool)

(assert (=> mapNonEmpty!19957 (= mapRes!19957 (and tp!38446 e!266173))))

(declare-fun mapKey!19957 () (_ BitVec 32))

(declare-fun mapRest!19957 () (Array (_ BitVec 32) ValueCell!5762))

(declare-fun mapValue!19957 () ValueCell!5762)

(assert (=> mapNonEmpty!19957 (= (arr!13552 _values!549) (store mapRest!19957 mapKey!19957 mapValue!19957))))

(declare-fun b!455212 () Bool)

(declare-fun res!271425 () Bool)

(assert (=> b!455212 (=> (not res!271425) (not e!266172))))

(assert (=> b!455212 (= res!271425 (and (= (size!13904 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13903 _keys!709) (size!13904 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455213 () Bool)

(declare-fun res!271421 () Bool)

(assert (=> b!455213 (=> (not res!271421) (not e!266172))))

(assert (=> b!455213 (= res!271421 (or (= (select (arr!13551 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13551 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455214 () Bool)

(declare-fun res!271430 () Bool)

(assert (=> b!455214 (=> (not res!271430) (not e!266172))))

(assert (=> b!455214 (= res!271430 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13903 _keys!709))))))

(declare-fun b!455215 () Bool)

(declare-fun res!271431 () Bool)

(assert (=> b!455215 (=> (not res!271431) (not e!266172))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455215 (= res!271431 (validKeyInArray!0 k0!794))))

(declare-fun b!455216 () Bool)

(declare-fun res!271427 () Bool)

(assert (=> b!455216 (=> (not res!271427) (not e!266172))))

(declare-fun arrayContainsKey!0 (array!28216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455216 (= res!271427 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455217 () Bool)

(declare-fun e!266175 () Bool)

(assert (=> b!455217 (= e!266171 (and e!266175 mapRes!19957))))

(declare-fun condMapEmpty!19957 () Bool)

(declare-fun mapDefault!19957 () ValueCell!5762)

(assert (=> b!455217 (= condMapEmpty!19957 (= (arr!13552 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5762)) mapDefault!19957)))))

(declare-fun b!455218 () Bool)

(declare-fun res!271424 () Bool)

(assert (=> b!455218 (=> (not res!271424) (not e!266176))))

(assert (=> b!455218 (= res!271424 (bvsle from!863 i!563))))

(declare-fun b!455219 () Bool)

(assert (=> b!455219 (= e!266175 tp_is_empty!12211)))

(declare-fun b!455220 () Bool)

(assert (=> b!455220 (= e!266172 e!266176)))

(declare-fun res!271423 () Bool)

(assert (=> b!455220 (=> (not res!271423) (not e!266176))))

(assert (=> b!455220 (= res!271423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206315 mask!1025))))

(assert (=> b!455220 (= lt!206315 (array!28217 (store (arr!13551 _keys!709) i!563 k0!794) (size!13903 _keys!709)))))

(assert (= (and start!40924 res!271429) b!455208))

(assert (= (and b!455208 res!271426) b!455212))

(assert (= (and b!455212 res!271425) b!455211))

(assert (= (and b!455211 res!271422) b!455206))

(assert (= (and b!455206 res!271432) b!455214))

(assert (= (and b!455214 res!271430) b!455215))

(assert (= (and b!455215 res!271431) b!455213))

(assert (= (and b!455213 res!271421) b!455216))

(assert (= (and b!455216 res!271427) b!455220))

(assert (= (and b!455220 res!271423) b!455209))

(assert (= (and b!455209 res!271428) b!455218))

(assert (= (and b!455218 res!271424) b!455210))

(assert (= (and b!455217 condMapEmpty!19957) mapIsEmpty!19957))

(assert (= (and b!455217 (not condMapEmpty!19957)) mapNonEmpty!19957))

(get-info :version)

(assert (= (and mapNonEmpty!19957 ((_ is ValueCellFull!5762) mapValue!19957)) b!455207))

(assert (= (and b!455217 ((_ is ValueCellFull!5762) mapDefault!19957)) b!455219))

(assert (= start!40924 b!455217))

(declare-fun m!439293 () Bool)

(assert (=> b!455210 m!439293))

(declare-fun m!439295 () Bool)

(assert (=> b!455210 m!439295))

(declare-fun m!439297 () Bool)

(assert (=> b!455210 m!439297))

(declare-fun m!439299 () Bool)

(assert (=> b!455220 m!439299))

(declare-fun m!439301 () Bool)

(assert (=> b!455220 m!439301))

(declare-fun m!439303 () Bool)

(assert (=> mapNonEmpty!19957 m!439303))

(declare-fun m!439305 () Bool)

(assert (=> b!455215 m!439305))

(declare-fun m!439307 () Bool)

(assert (=> b!455213 m!439307))

(declare-fun m!439309 () Bool)

(assert (=> b!455211 m!439309))

(declare-fun m!439311 () Bool)

(assert (=> b!455209 m!439311))

(declare-fun m!439313 () Bool)

(assert (=> b!455216 m!439313))

(declare-fun m!439315 () Bool)

(assert (=> b!455208 m!439315))

(declare-fun m!439317 () Bool)

(assert (=> start!40924 m!439317))

(declare-fun m!439319 () Bool)

(assert (=> start!40924 m!439319))

(declare-fun m!439321 () Bool)

(assert (=> b!455206 m!439321))

(check-sat (not b!455210) (not mapNonEmpty!19957) (not b_next!10873) (not b!455216) b_and!19025 (not b!455211) (not b!455209) (not b!455208) (not b!455206) (not start!40924) (not b!455215) (not b!455220) tp_is_empty!12211)
(check-sat b_and!19025 (not b_next!10873))
