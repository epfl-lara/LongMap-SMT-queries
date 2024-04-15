; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40918 () Bool)

(assert start!40918)

(declare-fun b_free!10867 () Bool)

(declare-fun b_next!10867 () Bool)

(assert (=> start!40918 (= b_free!10867 (not b_next!10867))))

(declare-fun tp!38428 () Bool)

(declare-fun b_and!18983 () Bool)

(assert (=> start!40918 (= tp!38428 b_and!18983)))

(declare-fun b!454861 () Bool)

(declare-fun res!271202 () Bool)

(declare-fun e!265986 () Bool)

(assert (=> b!454861 (=> (not res!271202) (not e!265986))))

(declare-datatypes ((array!28205 0))(
  ( (array!28206 (arr!13546 (Array (_ BitVec 32) (_ BitVec 64))) (size!13899 (_ BitVec 32))) )
))
(declare-fun lt!206041 () array!28205)

(declare-datatypes ((List!8172 0))(
  ( (Nil!8169) (Cons!8168 (h!9024 (_ BitVec 64)) (t!13991 List!8172)) )
))
(declare-fun arrayNoDuplicates!0 (array!28205 (_ BitVec 32) List!8172) Bool)

(assert (=> b!454861 (= res!271202 (arrayNoDuplicates!0 lt!206041 #b00000000000000000000000000000000 Nil!8169))))

(declare-fun b!454862 () Bool)

(declare-fun res!271192 () Bool)

(declare-fun e!265983 () Bool)

(assert (=> b!454862 (=> (not res!271192) (not e!265983))))

(declare-fun _keys!709 () array!28205)

(assert (=> b!454862 (= res!271192 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8169))))

(declare-fun b!454863 () Bool)

(assert (=> b!454863 (= e!265986 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17379 0))(
  ( (V!17380 (val!6147 Int)) )
))
(declare-fun minValue!515 () V!17379)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5759 0))(
  ( (ValueCellFull!5759 (v!8407 V!17379)) (EmptyCell!5759) )
))
(declare-datatypes ((array!28207 0))(
  ( (array!28208 (arr!13547 (Array (_ BitVec 32) ValueCell!5759)) (size!13900 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28207)

(declare-fun zeroValue!515 () V!17379)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!8112 0))(
  ( (tuple2!8113 (_1!4067 (_ BitVec 64)) (_2!4067 V!17379)) )
))
(declare-datatypes ((List!8173 0))(
  ( (Nil!8170) (Cons!8169 (h!9025 tuple2!8112) (t!13992 List!8173)) )
))
(declare-datatypes ((ListLongMap!7015 0))(
  ( (ListLongMap!7016 (toList!3523 List!8173)) )
))
(declare-fun lt!206042 () ListLongMap!7015)

(declare-fun v!412 () V!17379)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1718 (array!28205 array!28207 (_ BitVec 32) (_ BitVec 32) V!17379 V!17379 (_ BitVec 32) Int) ListLongMap!7015)

(assert (=> b!454863 (= lt!206042 (getCurrentListMapNoExtraKeys!1718 lt!206041 (array!28208 (store (arr!13547 _values!549) i!563 (ValueCellFull!5759 v!412)) (size!13900 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206040 () ListLongMap!7015)

(assert (=> b!454863 (= lt!206040 (getCurrentListMapNoExtraKeys!1718 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454864 () Bool)

(declare-fun e!265984 () Bool)

(declare-fun tp_is_empty!12205 () Bool)

(assert (=> b!454864 (= e!265984 tp_is_empty!12205)))

(declare-fun b!454865 () Bool)

(declare-fun res!271199 () Bool)

(assert (=> b!454865 (=> (not res!271199) (not e!265983))))

(assert (=> b!454865 (= res!271199 (or (= (select (arr!13546 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13546 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454867 () Bool)

(declare-fun res!271193 () Bool)

(assert (=> b!454867 (=> (not res!271193) (not e!265983))))

(assert (=> b!454867 (= res!271193 (and (= (size!13900 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13899 _keys!709) (size!13900 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454868 () Bool)

(declare-fun res!271201 () Bool)

(assert (=> b!454868 (=> (not res!271201) (not e!265986))))

(assert (=> b!454868 (= res!271201 (bvsle from!863 i!563))))

(declare-fun b!454869 () Bool)

(assert (=> b!454869 (= e!265983 e!265986)))

(declare-fun res!271191 () Bool)

(assert (=> b!454869 (=> (not res!271191) (not e!265986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28205 (_ BitVec 32)) Bool)

(assert (=> b!454869 (= res!271191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206041 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!454869 (= lt!206041 (array!28206 (store (arr!13546 _keys!709) i!563 k0!794) (size!13899 _keys!709)))))

(declare-fun b!454870 () Bool)

(declare-fun res!271200 () Bool)

(assert (=> b!454870 (=> (not res!271200) (not e!265983))))

(assert (=> b!454870 (= res!271200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19948 () Bool)

(declare-fun mapRes!19948 () Bool)

(declare-fun tp!38427 () Bool)

(declare-fun e!265985 () Bool)

(assert (=> mapNonEmpty!19948 (= mapRes!19948 (and tp!38427 e!265985))))

(declare-fun mapRest!19948 () (Array (_ BitVec 32) ValueCell!5759))

(declare-fun mapKey!19948 () (_ BitVec 32))

(declare-fun mapValue!19948 () ValueCell!5759)

(assert (=> mapNonEmpty!19948 (= (arr!13547 _values!549) (store mapRest!19948 mapKey!19948 mapValue!19948))))

(declare-fun res!271198 () Bool)

(assert (=> start!40918 (=> (not res!271198) (not e!265983))))

(assert (=> start!40918 (= res!271198 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13899 _keys!709))))))

(assert (=> start!40918 e!265983))

(assert (=> start!40918 tp_is_empty!12205))

(assert (=> start!40918 tp!38428))

(assert (=> start!40918 true))

(declare-fun e!265987 () Bool)

(declare-fun array_inv!9874 (array!28207) Bool)

(assert (=> start!40918 (and (array_inv!9874 _values!549) e!265987)))

(declare-fun array_inv!9875 (array!28205) Bool)

(assert (=> start!40918 (array_inv!9875 _keys!709)))

(declare-fun b!454866 () Bool)

(declare-fun res!271197 () Bool)

(assert (=> b!454866 (=> (not res!271197) (not e!265983))))

(assert (=> b!454866 (= res!271197 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13899 _keys!709))))))

(declare-fun b!454871 () Bool)

(assert (=> b!454871 (= e!265985 tp_is_empty!12205)))

(declare-fun mapIsEmpty!19948 () Bool)

(assert (=> mapIsEmpty!19948 mapRes!19948))

(declare-fun b!454872 () Bool)

(declare-fun res!271195 () Bool)

(assert (=> b!454872 (=> (not res!271195) (not e!265983))))

(declare-fun arrayContainsKey!0 (array!28205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454872 (= res!271195 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454873 () Bool)

(assert (=> b!454873 (= e!265987 (and e!265984 mapRes!19948))))

(declare-fun condMapEmpty!19948 () Bool)

(declare-fun mapDefault!19948 () ValueCell!5759)

(assert (=> b!454873 (= condMapEmpty!19948 (= (arr!13547 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5759)) mapDefault!19948)))))

(declare-fun b!454874 () Bool)

(declare-fun res!271194 () Bool)

(assert (=> b!454874 (=> (not res!271194) (not e!265983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454874 (= res!271194 (validMask!0 mask!1025))))

(declare-fun b!454875 () Bool)

(declare-fun res!271196 () Bool)

(assert (=> b!454875 (=> (not res!271196) (not e!265983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454875 (= res!271196 (validKeyInArray!0 k0!794))))

(assert (= (and start!40918 res!271198) b!454874))

(assert (= (and b!454874 res!271194) b!454867))

(assert (= (and b!454867 res!271193) b!454870))

(assert (= (and b!454870 res!271200) b!454862))

(assert (= (and b!454862 res!271192) b!454866))

(assert (= (and b!454866 res!271197) b!454875))

(assert (= (and b!454875 res!271196) b!454865))

(assert (= (and b!454865 res!271199) b!454872))

(assert (= (and b!454872 res!271195) b!454869))

(assert (= (and b!454869 res!271191) b!454861))

(assert (= (and b!454861 res!271202) b!454868))

(assert (= (and b!454868 res!271201) b!454863))

(assert (= (and b!454873 condMapEmpty!19948) mapIsEmpty!19948))

(assert (= (and b!454873 (not condMapEmpty!19948)) mapNonEmpty!19948))

(get-info :version)

(assert (= (and mapNonEmpty!19948 ((_ is ValueCellFull!5759) mapValue!19948)) b!454871))

(assert (= (and b!454873 ((_ is ValueCellFull!5759) mapDefault!19948)) b!454864))

(assert (= start!40918 b!454873))

(declare-fun m!438287 () Bool)

(assert (=> b!454862 m!438287))

(declare-fun m!438289 () Bool)

(assert (=> b!454875 m!438289))

(declare-fun m!438291 () Bool)

(assert (=> mapNonEmpty!19948 m!438291))

(declare-fun m!438293 () Bool)

(assert (=> start!40918 m!438293))

(declare-fun m!438295 () Bool)

(assert (=> start!40918 m!438295))

(declare-fun m!438297 () Bool)

(assert (=> b!454865 m!438297))

(declare-fun m!438299 () Bool)

(assert (=> b!454872 m!438299))

(declare-fun m!438301 () Bool)

(assert (=> b!454869 m!438301))

(declare-fun m!438303 () Bool)

(assert (=> b!454869 m!438303))

(declare-fun m!438305 () Bool)

(assert (=> b!454870 m!438305))

(declare-fun m!438307 () Bool)

(assert (=> b!454861 m!438307))

(declare-fun m!438309 () Bool)

(assert (=> b!454874 m!438309))

(declare-fun m!438311 () Bool)

(assert (=> b!454863 m!438311))

(declare-fun m!438313 () Bool)

(assert (=> b!454863 m!438313))

(declare-fun m!438315 () Bool)

(assert (=> b!454863 m!438315))

(check-sat (not b!454870) (not b!454869) b_and!18983 tp_is_empty!12205 (not b!454872) (not start!40918) (not b!454861) (not b_next!10867) (not b!454875) (not b!454862) (not mapNonEmpty!19948) (not b!454863) (not b!454874))
(check-sat b_and!18983 (not b_next!10867))
