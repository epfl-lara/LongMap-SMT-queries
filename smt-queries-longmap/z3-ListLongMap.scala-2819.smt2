; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40880 () Bool)

(assert start!40880)

(declare-fun b_free!10815 () Bool)

(declare-fun b_next!10815 () Bool)

(assert (=> start!40880 (= b_free!10815 (not b_next!10815))))

(declare-fun tp!38272 () Bool)

(declare-fun b_and!18957 () Bool)

(assert (=> start!40880 (= tp!38272 b_and!18957)))

(declare-fun mapIsEmpty!19870 () Bool)

(declare-fun mapRes!19870 () Bool)

(assert (=> mapIsEmpty!19870 mapRes!19870))

(declare-fun b!453962 () Bool)

(declare-fun e!265690 () Bool)

(assert (=> b!453962 (= e!265690 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28111 0))(
  ( (array!28112 (arr!13499 (Array (_ BitVec 32) (_ BitVec 64))) (size!13851 (_ BitVec 32))) )
))
(declare-fun lt!206042 () array!28111)

(declare-datatypes ((V!17309 0))(
  ( (V!17310 (val!6121 Int)) )
))
(declare-fun minValue!515 () V!17309)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5733 0))(
  ( (ValueCellFull!5733 (v!8387 V!17309)) (EmptyCell!5733) )
))
(declare-datatypes ((array!28113 0))(
  ( (array!28114 (arr!13500 (Array (_ BitVec 32) ValueCell!5733)) (size!13852 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28113)

(declare-fun zeroValue!515 () V!17309)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17309)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8064 0))(
  ( (tuple2!8065 (_1!4043 (_ BitVec 64)) (_2!4043 V!17309)) )
))
(declare-datatypes ((List!8121 0))(
  ( (Nil!8118) (Cons!8117 (h!8973 tuple2!8064) (t!13949 List!8121)) )
))
(declare-datatypes ((ListLongMap!6977 0))(
  ( (ListLongMap!6978 (toList!3504 List!8121)) )
))
(declare-fun lt!206040 () ListLongMap!6977)

(declare-fun getCurrentListMapNoExtraKeys!1687 (array!28111 array!28113 (_ BitVec 32) (_ BitVec 32) V!17309 V!17309 (_ BitVec 32) Int) ListLongMap!6977)

(assert (=> b!453962 (= lt!206040 (getCurrentListMapNoExtraKeys!1687 lt!206042 (array!28114 (store (arr!13500 _values!549) i!563 (ValueCellFull!5733 v!412)) (size!13852 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206041 () ListLongMap!6977)

(declare-fun _keys!709 () array!28111)

(assert (=> b!453962 (= lt!206041 (getCurrentListMapNoExtraKeys!1687 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453963 () Bool)

(declare-fun e!265691 () Bool)

(declare-fun tp_is_empty!12153 () Bool)

(assert (=> b!453963 (= e!265691 tp_is_empty!12153)))

(declare-fun b!453964 () Bool)

(declare-fun res!270386 () Bool)

(declare-fun e!265692 () Bool)

(assert (=> b!453964 (=> (not res!270386) (not e!265692))))

(assert (=> b!453964 (= res!270386 (and (= (size!13852 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13851 _keys!709) (size!13852 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19870 () Bool)

(declare-fun tp!38271 () Bool)

(assert (=> mapNonEmpty!19870 (= mapRes!19870 (and tp!38271 e!265691))))

(declare-fun mapKey!19870 () (_ BitVec 32))

(declare-fun mapRest!19870 () (Array (_ BitVec 32) ValueCell!5733))

(declare-fun mapValue!19870 () ValueCell!5733)

(assert (=> mapNonEmpty!19870 (= (arr!13500 _values!549) (store mapRest!19870 mapKey!19870 mapValue!19870))))

(declare-fun res!270390 () Bool)

(assert (=> start!40880 (=> (not res!270390) (not e!265692))))

(assert (=> start!40880 (= res!270390 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13851 _keys!709))))))

(assert (=> start!40880 e!265692))

(assert (=> start!40880 tp_is_empty!12153))

(assert (=> start!40880 tp!38272))

(assert (=> start!40880 true))

(declare-fun e!265693 () Bool)

(declare-fun array_inv!9776 (array!28113) Bool)

(assert (=> start!40880 (and (array_inv!9776 _values!549) e!265693)))

(declare-fun array_inv!9777 (array!28111) Bool)

(assert (=> start!40880 (array_inv!9777 _keys!709)))

(declare-fun b!453965 () Bool)

(declare-fun res!270384 () Bool)

(assert (=> b!453965 (=> (not res!270384) (not e!265692))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453965 (= res!270384 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!453966 () Bool)

(declare-fun res!270394 () Bool)

(assert (=> b!453966 (=> (not res!270394) (not e!265690))))

(assert (=> b!453966 (= res!270394 (bvsle from!863 i!563))))

(declare-fun b!453967 () Bool)

(declare-fun res!270392 () Bool)

(assert (=> b!453967 (=> (not res!270392) (not e!265692))))

(declare-datatypes ((List!8122 0))(
  ( (Nil!8119) (Cons!8118 (h!8974 (_ BitVec 64)) (t!13950 List!8122)) )
))
(declare-fun arrayNoDuplicates!0 (array!28111 (_ BitVec 32) List!8122) Bool)

(assert (=> b!453967 (= res!270392 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8119))))

(declare-fun b!453968 () Bool)

(declare-fun res!270385 () Bool)

(assert (=> b!453968 (=> (not res!270385) (not e!265692))))

(assert (=> b!453968 (= res!270385 (or (= (select (arr!13499 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13499 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453969 () Bool)

(declare-fun res!270391 () Bool)

(assert (=> b!453969 (=> (not res!270391) (not e!265692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453969 (= res!270391 (validMask!0 mask!1025))))

(declare-fun b!453970 () Bool)

(assert (=> b!453970 (= e!265692 e!265690)))

(declare-fun res!270393 () Bool)

(assert (=> b!453970 (=> (not res!270393) (not e!265690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28111 (_ BitVec 32)) Bool)

(assert (=> b!453970 (= res!270393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206042 mask!1025))))

(assert (=> b!453970 (= lt!206042 (array!28112 (store (arr!13499 _keys!709) i!563 k0!794) (size!13851 _keys!709)))))

(declare-fun b!453971 () Bool)

(declare-fun e!265689 () Bool)

(assert (=> b!453971 (= e!265689 tp_is_empty!12153)))

(declare-fun b!453972 () Bool)

(declare-fun res!270388 () Bool)

(assert (=> b!453972 (=> (not res!270388) (not e!265690))))

(assert (=> b!453972 (= res!270388 (arrayNoDuplicates!0 lt!206042 #b00000000000000000000000000000000 Nil!8119))))

(declare-fun b!453973 () Bool)

(assert (=> b!453973 (= e!265693 (and e!265689 mapRes!19870))))

(declare-fun condMapEmpty!19870 () Bool)

(declare-fun mapDefault!19870 () ValueCell!5733)

(assert (=> b!453973 (= condMapEmpty!19870 (= (arr!13500 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5733)) mapDefault!19870)))))

(declare-fun b!453974 () Bool)

(declare-fun res!270389 () Bool)

(assert (=> b!453974 (=> (not res!270389) (not e!265692))))

(assert (=> b!453974 (= res!270389 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13851 _keys!709))))))

(declare-fun b!453975 () Bool)

(declare-fun res!270387 () Bool)

(assert (=> b!453975 (=> (not res!270387) (not e!265692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453975 (= res!270387 (validKeyInArray!0 k0!794))))

(declare-fun b!453976 () Bool)

(declare-fun res!270395 () Bool)

(assert (=> b!453976 (=> (not res!270395) (not e!265692))))

(assert (=> b!453976 (= res!270395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40880 res!270390) b!453969))

(assert (= (and b!453969 res!270391) b!453964))

(assert (= (and b!453964 res!270386) b!453976))

(assert (= (and b!453976 res!270395) b!453967))

(assert (= (and b!453967 res!270392) b!453974))

(assert (= (and b!453974 res!270389) b!453975))

(assert (= (and b!453975 res!270387) b!453968))

(assert (= (and b!453968 res!270385) b!453965))

(assert (= (and b!453965 res!270384) b!453970))

(assert (= (and b!453970 res!270393) b!453972))

(assert (= (and b!453972 res!270388) b!453966))

(assert (= (and b!453966 res!270394) b!453962))

(assert (= (and b!453973 condMapEmpty!19870) mapIsEmpty!19870))

(assert (= (and b!453973 (not condMapEmpty!19870)) mapNonEmpty!19870))

(get-info :version)

(assert (= (and mapNonEmpty!19870 ((_ is ValueCellFull!5733) mapValue!19870)) b!453963))

(assert (= (and b!453973 ((_ is ValueCellFull!5733) mapDefault!19870)) b!453971))

(assert (= start!40880 b!453973))

(declare-fun m!438241 () Bool)

(assert (=> b!453972 m!438241))

(declare-fun m!438243 () Bool)

(assert (=> b!453975 m!438243))

(declare-fun m!438245 () Bool)

(assert (=> b!453962 m!438245))

(declare-fun m!438247 () Bool)

(assert (=> b!453962 m!438247))

(declare-fun m!438249 () Bool)

(assert (=> b!453962 m!438249))

(declare-fun m!438251 () Bool)

(assert (=> b!453969 m!438251))

(declare-fun m!438253 () Bool)

(assert (=> b!453968 m!438253))

(declare-fun m!438255 () Bool)

(assert (=> start!40880 m!438255))

(declare-fun m!438257 () Bool)

(assert (=> start!40880 m!438257))

(declare-fun m!438259 () Bool)

(assert (=> b!453965 m!438259))

(declare-fun m!438261 () Bool)

(assert (=> b!453967 m!438261))

(declare-fun m!438263 () Bool)

(assert (=> b!453970 m!438263))

(declare-fun m!438265 () Bool)

(assert (=> b!453970 m!438265))

(declare-fun m!438267 () Bool)

(assert (=> mapNonEmpty!19870 m!438267))

(declare-fun m!438269 () Bool)

(assert (=> b!453976 m!438269))

(check-sat (not b!453976) (not start!40880) (not b!453970) (not b!453975) (not b!453965) b_and!18957 (not b!453967) (not b!453962) (not mapNonEmpty!19870) (not b_next!10815) (not b!453969) (not b!453972) tp_is_empty!12153)
(check-sat b_and!18957 (not b_next!10815))
