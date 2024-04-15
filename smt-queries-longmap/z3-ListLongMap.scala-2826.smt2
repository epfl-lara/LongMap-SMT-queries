; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40906 () Bool)

(assert start!40906)

(declare-fun b_free!10855 () Bool)

(declare-fun b_next!10855 () Bool)

(assert (=> start!40906 (= b_free!10855 (not b_next!10855))))

(declare-fun tp!38391 () Bool)

(declare-fun b_and!18971 () Bool)

(assert (=> start!40906 (= tp!38391 b_and!18971)))

(declare-fun b!454591 () Bool)

(declare-fun res!270978 () Bool)

(declare-fun e!265875 () Bool)

(assert (=> b!454591 (=> (not res!270978) (not e!265875))))

(declare-datatypes ((array!28181 0))(
  ( (array!28182 (arr!13534 (Array (_ BitVec 32) (_ BitVec 64))) (size!13887 (_ BitVec 32))) )
))
(declare-fun lt!205986 () array!28181)

(declare-datatypes ((List!8162 0))(
  ( (Nil!8159) (Cons!8158 (h!9014 (_ BitVec 64)) (t!13981 List!8162)) )
))
(declare-fun arrayNoDuplicates!0 (array!28181 (_ BitVec 32) List!8162) Bool)

(assert (=> b!454591 (= res!270978 (arrayNoDuplicates!0 lt!205986 #b00000000000000000000000000000000 Nil!8159))))

(declare-fun b!454592 () Bool)

(declare-fun e!265877 () Bool)

(declare-fun tp_is_empty!12193 () Bool)

(assert (=> b!454592 (= e!265877 tp_is_empty!12193)))

(declare-fun b!454593 () Bool)

(declare-fun res!270979 () Bool)

(declare-fun e!265876 () Bool)

(assert (=> b!454593 (=> (not res!270979) (not e!265876))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454593 (= res!270979 (validKeyInArray!0 k0!794))))

(declare-fun b!454594 () Bool)

(declare-fun res!270985 () Bool)

(assert (=> b!454594 (=> (not res!270985) (not e!265876))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!28181)

(assert (=> b!454594 (= res!270985 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13887 _keys!709))))))

(declare-fun b!454595 () Bool)

(declare-fun res!270977 () Bool)

(assert (=> b!454595 (=> (not res!270977) (not e!265876))))

(assert (=> b!454595 (= res!270977 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8159))))

(declare-fun b!454596 () Bool)

(declare-fun res!270983 () Bool)

(assert (=> b!454596 (=> (not res!270983) (not e!265875))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!454596 (= res!270983 (bvsle from!863 i!563))))

(declare-fun b!454597 () Bool)

(declare-fun res!270980 () Bool)

(assert (=> b!454597 (=> (not res!270980) (not e!265876))))

(declare-fun arrayContainsKey!0 (array!28181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454597 (= res!270980 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454598 () Bool)

(declare-fun e!265878 () Bool)

(declare-fun e!265874 () Bool)

(declare-fun mapRes!19930 () Bool)

(assert (=> b!454598 (= e!265878 (and e!265874 mapRes!19930))))

(declare-fun condMapEmpty!19930 () Bool)

(declare-datatypes ((V!17363 0))(
  ( (V!17364 (val!6141 Int)) )
))
(declare-datatypes ((ValueCell!5753 0))(
  ( (ValueCellFull!5753 (v!8401 V!17363)) (EmptyCell!5753) )
))
(declare-datatypes ((array!28183 0))(
  ( (array!28184 (arr!13535 (Array (_ BitVec 32) ValueCell!5753)) (size!13888 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28183)

(declare-fun mapDefault!19930 () ValueCell!5753)

(assert (=> b!454598 (= condMapEmpty!19930 (= (arr!13535 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5753)) mapDefault!19930)))))

(declare-fun b!454599 () Bool)

(assert (=> b!454599 (= e!265874 tp_is_empty!12193)))

(declare-fun b!454600 () Bool)

(declare-fun res!270981 () Bool)

(assert (=> b!454600 (=> (not res!270981) (not e!265876))))

(assert (=> b!454600 (= res!270981 (or (= (select (arr!13534 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13534 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19930 () Bool)

(declare-fun tp!38392 () Bool)

(assert (=> mapNonEmpty!19930 (= mapRes!19930 (and tp!38392 e!265877))))

(declare-fun mapRest!19930 () (Array (_ BitVec 32) ValueCell!5753))

(declare-fun mapValue!19930 () ValueCell!5753)

(declare-fun mapKey!19930 () (_ BitVec 32))

(assert (=> mapNonEmpty!19930 (= (arr!13535 _values!549) (store mapRest!19930 mapKey!19930 mapValue!19930))))

(declare-fun b!454601 () Bool)

(declare-fun res!270976 () Bool)

(assert (=> b!454601 (=> (not res!270976) (not e!265876))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454601 (= res!270976 (validMask!0 mask!1025))))

(declare-fun b!454602 () Bool)

(declare-fun res!270982 () Bool)

(assert (=> b!454602 (=> (not res!270982) (not e!265876))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454602 (= res!270982 (and (= (size!13888 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13887 _keys!709) (size!13888 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454603 () Bool)

(assert (=> b!454603 (= e!265876 e!265875)))

(declare-fun res!270975 () Bool)

(assert (=> b!454603 (=> (not res!270975) (not e!265875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28181 (_ BitVec 32)) Bool)

(assert (=> b!454603 (= res!270975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205986 mask!1025))))

(assert (=> b!454603 (= lt!205986 (array!28182 (store (arr!13534 _keys!709) i!563 k0!794) (size!13887 _keys!709)))))

(declare-fun b!454604 () Bool)

(declare-fun res!270986 () Bool)

(assert (=> b!454604 (=> (not res!270986) (not e!265876))))

(assert (=> b!454604 (= res!270986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454605 () Bool)

(assert (=> b!454605 (= e!265875 false)))

(declare-fun minValue!515 () V!17363)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17363)

(declare-datatypes ((tuple2!8102 0))(
  ( (tuple2!8103 (_1!4062 (_ BitVec 64)) (_2!4062 V!17363)) )
))
(declare-datatypes ((List!8163 0))(
  ( (Nil!8160) (Cons!8159 (h!9015 tuple2!8102) (t!13982 List!8163)) )
))
(declare-datatypes ((ListLongMap!7005 0))(
  ( (ListLongMap!7006 (toList!3518 List!8163)) )
))
(declare-fun lt!205987 () ListLongMap!7005)

(declare-fun v!412 () V!17363)

(declare-fun getCurrentListMapNoExtraKeys!1713 (array!28181 array!28183 (_ BitVec 32) (_ BitVec 32) V!17363 V!17363 (_ BitVec 32) Int) ListLongMap!7005)

(assert (=> b!454605 (= lt!205987 (getCurrentListMapNoExtraKeys!1713 lt!205986 (array!28184 (store (arr!13535 _values!549) i!563 (ValueCellFull!5753 v!412)) (size!13888 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205988 () ListLongMap!7005)

(assert (=> b!454605 (= lt!205988 (getCurrentListMapNoExtraKeys!1713 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19930 () Bool)

(assert (=> mapIsEmpty!19930 mapRes!19930))

(declare-fun res!270984 () Bool)

(assert (=> start!40906 (=> (not res!270984) (not e!265876))))

(assert (=> start!40906 (= res!270984 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13887 _keys!709))))))

(assert (=> start!40906 e!265876))

(assert (=> start!40906 tp_is_empty!12193))

(assert (=> start!40906 tp!38391))

(assert (=> start!40906 true))

(declare-fun array_inv!9864 (array!28183) Bool)

(assert (=> start!40906 (and (array_inv!9864 _values!549) e!265878)))

(declare-fun array_inv!9865 (array!28181) Bool)

(assert (=> start!40906 (array_inv!9865 _keys!709)))

(assert (= (and start!40906 res!270984) b!454601))

(assert (= (and b!454601 res!270976) b!454602))

(assert (= (and b!454602 res!270982) b!454604))

(assert (= (and b!454604 res!270986) b!454595))

(assert (= (and b!454595 res!270977) b!454594))

(assert (= (and b!454594 res!270985) b!454593))

(assert (= (and b!454593 res!270979) b!454600))

(assert (= (and b!454600 res!270981) b!454597))

(assert (= (and b!454597 res!270980) b!454603))

(assert (= (and b!454603 res!270975) b!454591))

(assert (= (and b!454591 res!270978) b!454596))

(assert (= (and b!454596 res!270983) b!454605))

(assert (= (and b!454598 condMapEmpty!19930) mapIsEmpty!19930))

(assert (= (and b!454598 (not condMapEmpty!19930)) mapNonEmpty!19930))

(get-info :version)

(assert (= (and mapNonEmpty!19930 ((_ is ValueCellFull!5753) mapValue!19930)) b!454592))

(assert (= (and b!454598 ((_ is ValueCellFull!5753) mapDefault!19930)) b!454599))

(assert (= start!40906 b!454598))

(declare-fun m!438107 () Bool)

(assert (=> b!454600 m!438107))

(declare-fun m!438109 () Bool)

(assert (=> b!454603 m!438109))

(declare-fun m!438111 () Bool)

(assert (=> b!454603 m!438111))

(declare-fun m!438113 () Bool)

(assert (=> mapNonEmpty!19930 m!438113))

(declare-fun m!438115 () Bool)

(assert (=> start!40906 m!438115))

(declare-fun m!438117 () Bool)

(assert (=> start!40906 m!438117))

(declare-fun m!438119 () Bool)

(assert (=> b!454605 m!438119))

(declare-fun m!438121 () Bool)

(assert (=> b!454605 m!438121))

(declare-fun m!438123 () Bool)

(assert (=> b!454605 m!438123))

(declare-fun m!438125 () Bool)

(assert (=> b!454591 m!438125))

(declare-fun m!438127 () Bool)

(assert (=> b!454597 m!438127))

(declare-fun m!438129 () Bool)

(assert (=> b!454593 m!438129))

(declare-fun m!438131 () Bool)

(assert (=> b!454601 m!438131))

(declare-fun m!438133 () Bool)

(assert (=> b!454595 m!438133))

(declare-fun m!438135 () Bool)

(assert (=> b!454604 m!438135))

(check-sat tp_is_empty!12193 (not b!454601) (not b!454604) (not b!454591) (not b_next!10855) (not start!40906) (not b!454597) (not b!454595) b_and!18971 (not b!454603) (not mapNonEmpty!19930) (not b!454593) (not b!454605))
(check-sat b_and!18971 (not b_next!10855))
