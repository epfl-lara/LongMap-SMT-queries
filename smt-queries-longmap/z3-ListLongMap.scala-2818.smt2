; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40858 () Bool)

(assert start!40858)

(declare-fun b_free!10807 () Bool)

(declare-fun b_next!10807 () Bool)

(assert (=> start!40858 (= b_free!10807 (not b_next!10807))))

(declare-fun tp!38248 () Bool)

(declare-fun b_and!18959 () Bool)

(assert (=> start!40858 (= tp!38248 b_and!18959)))

(declare-fun b!453721 () Bool)

(declare-fun res!270240 () Bool)

(declare-fun e!265579 () Bool)

(assert (=> b!453721 (=> (not res!270240) (not e!265579))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453721 (= res!270240 (bvsle from!863 i!563))))

(declare-fun b!453722 () Bool)

(declare-fun res!270244 () Bool)

(declare-fun e!265577 () Bool)

(assert (=> b!453722 (=> (not res!270244) (not e!265577))))

(declare-datatypes ((array!28088 0))(
  ( (array!28089 (arr!13487 (Array (_ BitVec 32) (_ BitVec 64))) (size!13839 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28088)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453722 (= res!270244 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!453723 () Bool)

(declare-fun res!270233 () Bool)

(assert (=> b!453723 (=> (not res!270233) (not e!265577))))

(assert (=> b!453723 (= res!270233 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13839 _keys!709))))))

(declare-fun b!453724 () Bool)

(declare-fun res!270241 () Bool)

(assert (=> b!453724 (=> (not res!270241) (not e!265577))))

(declare-datatypes ((List!8029 0))(
  ( (Nil!8026) (Cons!8025 (h!8881 (_ BitVec 64)) (t!13849 List!8029)) )
))
(declare-fun arrayNoDuplicates!0 (array!28088 (_ BitVec 32) List!8029) Bool)

(assert (=> b!453724 (= res!270241 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8026))))

(declare-fun b!453725 () Bool)

(assert (=> b!453725 (= e!265577 e!265579)))

(declare-fun res!270239 () Bool)

(assert (=> b!453725 (=> (not res!270239) (not e!265579))))

(declare-fun lt!206018 () array!28088)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28088 (_ BitVec 32)) Bool)

(assert (=> b!453725 (= res!270239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206018 mask!1025))))

(assert (=> b!453725 (= lt!206018 (array!28089 (store (arr!13487 _keys!709) i!563 k0!794) (size!13839 _keys!709)))))

(declare-fun mapNonEmpty!19858 () Bool)

(declare-fun mapRes!19858 () Bool)

(declare-fun tp!38247 () Bool)

(declare-fun e!265580 () Bool)

(assert (=> mapNonEmpty!19858 (= mapRes!19858 (and tp!38247 e!265580))))

(declare-datatypes ((V!17299 0))(
  ( (V!17300 (val!6117 Int)) )
))
(declare-datatypes ((ValueCell!5729 0))(
  ( (ValueCellFull!5729 (v!8384 V!17299)) (EmptyCell!5729) )
))
(declare-fun mapRest!19858 () (Array (_ BitVec 32) ValueCell!5729))

(declare-fun mapKey!19858 () (_ BitVec 32))

(declare-datatypes ((array!28090 0))(
  ( (array!28091 (arr!13488 (Array (_ BitVec 32) ValueCell!5729)) (size!13840 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28090)

(declare-fun mapValue!19858 () ValueCell!5729)

(assert (=> mapNonEmpty!19858 (= (arr!13488 _values!549) (store mapRest!19858 mapKey!19858 mapValue!19858))))

(declare-fun b!453726 () Bool)

(declare-fun res!270236 () Bool)

(assert (=> b!453726 (=> (not res!270236) (not e!265577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453726 (= res!270236 (validMask!0 mask!1025))))

(declare-fun b!453727 () Bool)

(declare-fun e!265582 () Bool)

(declare-fun e!265581 () Bool)

(assert (=> b!453727 (= e!265582 (and e!265581 mapRes!19858))))

(declare-fun condMapEmpty!19858 () Bool)

(declare-fun mapDefault!19858 () ValueCell!5729)

(assert (=> b!453727 (= condMapEmpty!19858 (= (arr!13488 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5729)) mapDefault!19858)))))

(declare-fun b!453728 () Bool)

(declare-fun res!270238 () Bool)

(assert (=> b!453728 (=> (not res!270238) (not e!265579))))

(assert (=> b!453728 (= res!270238 (arrayNoDuplicates!0 lt!206018 #b00000000000000000000000000000000 Nil!8026))))

(declare-fun b!453729 () Bool)

(declare-fun tp_is_empty!12145 () Bool)

(assert (=> b!453729 (= e!265580 tp_is_empty!12145)))

(declare-fun b!453730 () Bool)

(declare-fun res!270234 () Bool)

(assert (=> b!453730 (=> (not res!270234) (not e!265577))))

(assert (=> b!453730 (= res!270234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!453731 () Bool)

(assert (=> b!453731 (= e!265581 tp_is_empty!12145)))

(declare-fun mapIsEmpty!19858 () Bool)

(assert (=> mapIsEmpty!19858 mapRes!19858))

(declare-fun b!453733 () Bool)

(declare-fun res!270235 () Bool)

(assert (=> b!453733 (=> (not res!270235) (not e!265577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453733 (= res!270235 (validKeyInArray!0 k0!794))))

(declare-fun b!453734 () Bool)

(declare-fun res!270237 () Bool)

(assert (=> b!453734 (=> (not res!270237) (not e!265577))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!453734 (= res!270237 (and (= (size!13840 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13839 _keys!709) (size!13840 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453735 () Bool)

(assert (=> b!453735 (= e!265579 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13839 _keys!709)))))))

(declare-fun minValue!515 () V!17299)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17299)

(declare-datatypes ((tuple2!7962 0))(
  ( (tuple2!7963 (_1!3992 (_ BitVec 64)) (_2!3992 V!17299)) )
))
(declare-datatypes ((List!8030 0))(
  ( (Nil!8027) (Cons!8026 (h!8882 tuple2!7962) (t!13850 List!8030)) )
))
(declare-datatypes ((ListLongMap!6877 0))(
  ( (ListLongMap!6878 (toList!3454 List!8030)) )
))
(declare-fun lt!206017 () ListLongMap!6877)

(declare-fun v!412 () V!17299)

(declare-fun getCurrentListMapNoExtraKeys!1683 (array!28088 array!28090 (_ BitVec 32) (_ BitVec 32) V!17299 V!17299 (_ BitVec 32) Int) ListLongMap!6877)

(assert (=> b!453735 (= lt!206017 (getCurrentListMapNoExtraKeys!1683 lt!206018 (array!28091 (store (arr!13488 _values!549) i!563 (ValueCellFull!5729 v!412)) (size!13840 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206016 () ListLongMap!6877)

(assert (=> b!453735 (= lt!206016 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453732 () Bool)

(declare-fun res!270242 () Bool)

(assert (=> b!453732 (=> (not res!270242) (not e!265577))))

(assert (=> b!453732 (= res!270242 (or (= (select (arr!13487 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13487 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!270243 () Bool)

(assert (=> start!40858 (=> (not res!270243) (not e!265577))))

(assert (=> start!40858 (= res!270243 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13839 _keys!709))))))

(assert (=> start!40858 e!265577))

(assert (=> start!40858 tp_is_empty!12145))

(assert (=> start!40858 tp!38248))

(assert (=> start!40858 true))

(declare-fun array_inv!9848 (array!28090) Bool)

(assert (=> start!40858 (and (array_inv!9848 _values!549) e!265582)))

(declare-fun array_inv!9849 (array!28088) Bool)

(assert (=> start!40858 (array_inv!9849 _keys!709)))

(assert (= (and start!40858 res!270243) b!453726))

(assert (= (and b!453726 res!270236) b!453734))

(assert (= (and b!453734 res!270237) b!453730))

(assert (= (and b!453730 res!270234) b!453724))

(assert (= (and b!453724 res!270241) b!453723))

(assert (= (and b!453723 res!270233) b!453733))

(assert (= (and b!453733 res!270235) b!453732))

(assert (= (and b!453732 res!270242) b!453722))

(assert (= (and b!453722 res!270244) b!453725))

(assert (= (and b!453725 res!270239) b!453728))

(assert (= (and b!453728 res!270238) b!453721))

(assert (= (and b!453721 res!270240) b!453735))

(assert (= (and b!453727 condMapEmpty!19858) mapIsEmpty!19858))

(assert (= (and b!453727 (not condMapEmpty!19858)) mapNonEmpty!19858))

(get-info :version)

(assert (= (and mapNonEmpty!19858 ((_ is ValueCellFull!5729) mapValue!19858)) b!453729))

(assert (= (and b!453727 ((_ is ValueCellFull!5729) mapDefault!19858)) b!453731))

(assert (= start!40858 b!453727))

(declare-fun m!438303 () Bool)

(assert (=> b!453728 m!438303))

(declare-fun m!438305 () Bool)

(assert (=> start!40858 m!438305))

(declare-fun m!438307 () Bool)

(assert (=> start!40858 m!438307))

(declare-fun m!438309 () Bool)

(assert (=> mapNonEmpty!19858 m!438309))

(declare-fun m!438311 () Bool)

(assert (=> b!453732 m!438311))

(declare-fun m!438313 () Bool)

(assert (=> b!453735 m!438313))

(declare-fun m!438315 () Bool)

(assert (=> b!453735 m!438315))

(declare-fun m!438317 () Bool)

(assert (=> b!453735 m!438317))

(declare-fun m!438319 () Bool)

(assert (=> b!453722 m!438319))

(declare-fun m!438321 () Bool)

(assert (=> b!453733 m!438321))

(declare-fun m!438323 () Bool)

(assert (=> b!453724 m!438323))

(declare-fun m!438325 () Bool)

(assert (=> b!453730 m!438325))

(declare-fun m!438327 () Bool)

(assert (=> b!453726 m!438327))

(declare-fun m!438329 () Bool)

(assert (=> b!453725 m!438329))

(declare-fun m!438331 () Bool)

(assert (=> b!453725 m!438331))

(check-sat (not b!453730) (not b!453726) b_and!18959 (not b!453722) (not b_next!10807) (not mapNonEmpty!19858) tp_is_empty!12145 (not b!453733) (not b!453724) (not b!453725) (not b!453728) (not b!453735) (not start!40858))
(check-sat b_and!18959 (not b_next!10807))
