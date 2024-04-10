; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40892 () Bool)

(assert start!40892)

(declare-fun b_free!10827 () Bool)

(declare-fun b_next!10827 () Bool)

(assert (=> start!40892 (= b_free!10827 (not b_next!10827))))

(declare-fun tp!38308 () Bool)

(declare-fun b_and!18969 () Bool)

(assert (=> start!40892 (= tp!38308 b_and!18969)))

(declare-fun b!454232 () Bool)

(declare-fun res!270604 () Bool)

(declare-fun e!265797 () Bool)

(assert (=> b!454232 (=> (not res!270604) (not e!265797))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454232 (= res!270604 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19888 () Bool)

(declare-fun mapRes!19888 () Bool)

(assert (=> mapIsEmpty!19888 mapRes!19888))

(declare-fun b!454233 () Bool)

(declare-fun res!270608 () Bool)

(assert (=> b!454233 (=> (not res!270608) (not e!265797))))

(declare-datatypes ((array!28135 0))(
  ( (array!28136 (arr!13511 (Array (_ BitVec 32) (_ BitVec 64))) (size!13863 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28135)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28135 (_ BitVec 32)) Bool)

(assert (=> b!454233 (= res!270608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454234 () Bool)

(declare-fun res!270600 () Bool)

(assert (=> b!454234 (=> (not res!270600) (not e!265797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454234 (= res!270600 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19888 () Bool)

(declare-fun tp!38307 () Bool)

(declare-fun e!265799 () Bool)

(assert (=> mapNonEmpty!19888 (= mapRes!19888 (and tp!38307 e!265799))))

(declare-datatypes ((V!17325 0))(
  ( (V!17326 (val!6127 Int)) )
))
(declare-datatypes ((ValueCell!5739 0))(
  ( (ValueCellFull!5739 (v!8393 V!17325)) (EmptyCell!5739) )
))
(declare-datatypes ((array!28137 0))(
  ( (array!28138 (arr!13512 (Array (_ BitVec 32) ValueCell!5739)) (size!13864 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28137)

(declare-fun mapValue!19888 () ValueCell!5739)

(declare-fun mapKey!19888 () (_ BitVec 32))

(declare-fun mapRest!19888 () (Array (_ BitVec 32) ValueCell!5739))

(assert (=> mapNonEmpty!19888 (= (arr!13512 _values!549) (store mapRest!19888 mapKey!19888 mapValue!19888))))

(declare-fun b!454235 () Bool)

(declare-fun e!265798 () Bool)

(assert (=> b!454235 (= e!265798 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17325)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17325)

(declare-datatypes ((tuple2!8070 0))(
  ( (tuple2!8071 (_1!4046 (_ BitVec 64)) (_2!4046 V!17325)) )
))
(declare-datatypes ((List!8130 0))(
  ( (Nil!8127) (Cons!8126 (h!8982 tuple2!8070) (t!13958 List!8130)) )
))
(declare-datatypes ((ListLongMap!6983 0))(
  ( (ListLongMap!6984 (toList!3507 List!8130)) )
))
(declare-fun lt!206094 () ListLongMap!6983)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!206096 () array!28135)

(declare-fun v!412 () V!17325)

(declare-fun getCurrentListMapNoExtraKeys!1690 (array!28135 array!28137 (_ BitVec 32) (_ BitVec 32) V!17325 V!17325 (_ BitVec 32) Int) ListLongMap!6983)

(assert (=> b!454235 (= lt!206094 (getCurrentListMapNoExtraKeys!1690 lt!206096 (array!28138 (store (arr!13512 _values!549) i!563 (ValueCellFull!5739 v!412)) (size!13864 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206095 () ListLongMap!6983)

(assert (=> b!454235 (= lt!206095 (getCurrentListMapNoExtraKeys!1690 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454236 () Bool)

(declare-fun res!270605 () Bool)

(assert (=> b!454236 (=> (not res!270605) (not e!265797))))

(assert (=> b!454236 (= res!270605 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13863 _keys!709))))))

(declare-fun b!454237 () Bool)

(declare-fun res!270601 () Bool)

(assert (=> b!454237 (=> (not res!270601) (not e!265797))))

(declare-datatypes ((List!8131 0))(
  ( (Nil!8128) (Cons!8127 (h!8983 (_ BitVec 64)) (t!13959 List!8131)) )
))
(declare-fun arrayNoDuplicates!0 (array!28135 (_ BitVec 32) List!8131) Bool)

(assert (=> b!454237 (= res!270601 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8128))))

(declare-fun b!454238 () Bool)

(declare-fun res!270606 () Bool)

(assert (=> b!454238 (=> (not res!270606) (not e!265797))))

(assert (=> b!454238 (= res!270606 (and (= (size!13864 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13863 _keys!709) (size!13864 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454239 () Bool)

(declare-fun tp_is_empty!12165 () Bool)

(assert (=> b!454239 (= e!265799 tp_is_empty!12165)))

(declare-fun b!454240 () Bool)

(declare-fun res!270611 () Bool)

(assert (=> b!454240 (=> (not res!270611) (not e!265797))))

(assert (=> b!454240 (= res!270611 (or (= (select (arr!13511 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13511 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454241 () Bool)

(declare-fun res!270602 () Bool)

(assert (=> b!454241 (=> (not res!270602) (not e!265798))))

(assert (=> b!454241 (= res!270602 (bvsle from!863 i!563))))

(declare-fun b!454242 () Bool)

(declare-fun res!270607 () Bool)

(assert (=> b!454242 (=> (not res!270607) (not e!265797))))

(declare-fun arrayContainsKey!0 (array!28135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454242 (= res!270607 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454243 () Bool)

(declare-fun e!265801 () Bool)

(declare-fun e!265800 () Bool)

(assert (=> b!454243 (= e!265801 (and e!265800 mapRes!19888))))

(declare-fun condMapEmpty!19888 () Bool)

(declare-fun mapDefault!19888 () ValueCell!5739)

(assert (=> b!454243 (= condMapEmpty!19888 (= (arr!13512 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5739)) mapDefault!19888)))))

(declare-fun b!454244 () Bool)

(assert (=> b!454244 (= e!265797 e!265798)))

(declare-fun res!270610 () Bool)

(assert (=> b!454244 (=> (not res!270610) (not e!265798))))

(assert (=> b!454244 (= res!270610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206096 mask!1025))))

(assert (=> b!454244 (= lt!206096 (array!28136 (store (arr!13511 _keys!709) i!563 k0!794) (size!13863 _keys!709)))))

(declare-fun b!454245 () Bool)

(declare-fun res!270609 () Bool)

(assert (=> b!454245 (=> (not res!270609) (not e!265798))))

(assert (=> b!454245 (= res!270609 (arrayNoDuplicates!0 lt!206096 #b00000000000000000000000000000000 Nil!8128))))

(declare-fun res!270603 () Bool)

(assert (=> start!40892 (=> (not res!270603) (not e!265797))))

(assert (=> start!40892 (= res!270603 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13863 _keys!709))))))

(assert (=> start!40892 e!265797))

(assert (=> start!40892 tp_is_empty!12165))

(assert (=> start!40892 tp!38308))

(assert (=> start!40892 true))

(declare-fun array_inv!9786 (array!28137) Bool)

(assert (=> start!40892 (and (array_inv!9786 _values!549) e!265801)))

(declare-fun array_inv!9787 (array!28135) Bool)

(assert (=> start!40892 (array_inv!9787 _keys!709)))

(declare-fun b!454246 () Bool)

(assert (=> b!454246 (= e!265800 tp_is_empty!12165)))

(assert (= (and start!40892 res!270603) b!454234))

(assert (= (and b!454234 res!270600) b!454238))

(assert (= (and b!454238 res!270606) b!454233))

(assert (= (and b!454233 res!270608) b!454237))

(assert (= (and b!454237 res!270601) b!454236))

(assert (= (and b!454236 res!270605) b!454232))

(assert (= (and b!454232 res!270604) b!454240))

(assert (= (and b!454240 res!270611) b!454242))

(assert (= (and b!454242 res!270607) b!454244))

(assert (= (and b!454244 res!270610) b!454245))

(assert (= (and b!454245 res!270609) b!454241))

(assert (= (and b!454241 res!270602) b!454235))

(assert (= (and b!454243 condMapEmpty!19888) mapIsEmpty!19888))

(assert (= (and b!454243 (not condMapEmpty!19888)) mapNonEmpty!19888))

(get-info :version)

(assert (= (and mapNonEmpty!19888 ((_ is ValueCellFull!5739) mapValue!19888)) b!454239))

(assert (= (and b!454243 ((_ is ValueCellFull!5739) mapDefault!19888)) b!454246))

(assert (= start!40892 b!454243))

(declare-fun m!438421 () Bool)

(assert (=> b!454245 m!438421))

(declare-fun m!438423 () Bool)

(assert (=> b!454233 m!438423))

(declare-fun m!438425 () Bool)

(assert (=> b!454237 m!438425))

(declare-fun m!438427 () Bool)

(assert (=> b!454244 m!438427))

(declare-fun m!438429 () Bool)

(assert (=> b!454244 m!438429))

(declare-fun m!438431 () Bool)

(assert (=> b!454235 m!438431))

(declare-fun m!438433 () Bool)

(assert (=> b!454235 m!438433))

(declare-fun m!438435 () Bool)

(assert (=> b!454235 m!438435))

(declare-fun m!438437 () Bool)

(assert (=> b!454232 m!438437))

(declare-fun m!438439 () Bool)

(assert (=> mapNonEmpty!19888 m!438439))

(declare-fun m!438441 () Bool)

(assert (=> start!40892 m!438441))

(declare-fun m!438443 () Bool)

(assert (=> start!40892 m!438443))

(declare-fun m!438445 () Bool)

(assert (=> b!454242 m!438445))

(declare-fun m!438447 () Bool)

(assert (=> b!454234 m!438447))

(declare-fun m!438449 () Bool)

(assert (=> b!454240 m!438449))

(check-sat (not b!454244) (not start!40892) (not b_next!10827) (not b!454245) (not b!454232) (not b!454235) (not b!454237) tp_is_empty!12165 (not b!454234) b_and!18969 (not mapNonEmpty!19888) (not b!454242) (not b!454233))
(check-sat b_and!18969 (not b_next!10827))
