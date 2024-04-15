; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40912 () Bool)

(assert start!40912)

(declare-fun b_free!10861 () Bool)

(declare-fun b_next!10861 () Bool)

(assert (=> start!40912 (= b_free!10861 (not b_next!10861))))

(declare-fun tp!38410 () Bool)

(declare-fun b_and!18977 () Bool)

(assert (=> start!40912 (= tp!38410 b_and!18977)))

(declare-fun b!454726 () Bool)

(declare-fun res!271084 () Bool)

(declare-fun e!265930 () Bool)

(assert (=> b!454726 (=> (not res!271084) (not e!265930))))

(declare-datatypes ((array!28193 0))(
  ( (array!28194 (arr!13540 (Array (_ BitVec 32) (_ BitVec 64))) (size!13893 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28193)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454726 (= res!271084 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19939 () Bool)

(declare-fun mapRes!19939 () Bool)

(assert (=> mapIsEmpty!19939 mapRes!19939))

(declare-fun b!454727 () Bool)

(declare-fun res!271086 () Bool)

(declare-fun e!265932 () Bool)

(assert (=> b!454727 (=> (not res!271086) (not e!265932))))

(declare-fun lt!206014 () array!28193)

(declare-datatypes ((List!8167 0))(
  ( (Nil!8164) (Cons!8163 (h!9019 (_ BitVec 64)) (t!13986 List!8167)) )
))
(declare-fun arrayNoDuplicates!0 (array!28193 (_ BitVec 32) List!8167) Bool)

(assert (=> b!454727 (= res!271086 (arrayNoDuplicates!0 lt!206014 #b00000000000000000000000000000000 Nil!8164))))

(declare-fun b!454728 () Bool)

(declare-fun e!265929 () Bool)

(declare-fun tp_is_empty!12199 () Bool)

(assert (=> b!454728 (= e!265929 tp_is_empty!12199)))

(declare-fun b!454729 () Bool)

(assert (=> b!454729 (= e!265930 e!265932)))

(declare-fun res!271091 () Bool)

(assert (=> b!454729 (=> (not res!271091) (not e!265932))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28193 (_ BitVec 32)) Bool)

(assert (=> b!454729 (= res!271091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206014 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454729 (= lt!206014 (array!28194 (store (arr!13540 _keys!709) i!563 k0!794) (size!13893 _keys!709)))))

(declare-fun b!454730 () Bool)

(declare-fun res!271093 () Bool)

(assert (=> b!454730 (=> (not res!271093) (not e!265930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454730 (= res!271093 (validMask!0 mask!1025))))

(declare-fun b!454731 () Bool)

(declare-fun e!265928 () Bool)

(assert (=> b!454731 (= e!265928 tp_is_empty!12199)))

(declare-fun b!454732 () Bool)

(declare-fun e!265931 () Bool)

(assert (=> b!454732 (= e!265931 (and e!265928 mapRes!19939))))

(declare-fun condMapEmpty!19939 () Bool)

(declare-datatypes ((V!17371 0))(
  ( (V!17372 (val!6144 Int)) )
))
(declare-datatypes ((ValueCell!5756 0))(
  ( (ValueCellFull!5756 (v!8404 V!17371)) (EmptyCell!5756) )
))
(declare-datatypes ((array!28195 0))(
  ( (array!28196 (arr!13541 (Array (_ BitVec 32) ValueCell!5756)) (size!13894 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28195)

(declare-fun mapDefault!19939 () ValueCell!5756)

(assert (=> b!454732 (= condMapEmpty!19939 (= (arr!13541 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5756)) mapDefault!19939)))))

(declare-fun b!454733 () Bool)

(declare-fun res!271092 () Bool)

(assert (=> b!454733 (=> (not res!271092) (not e!265930))))

(assert (=> b!454733 (= res!271092 (or (= (select (arr!13540 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13540 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454734 () Bool)

(declare-fun res!271089 () Bool)

(assert (=> b!454734 (=> (not res!271089) (not e!265932))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!454734 (= res!271089 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19939 () Bool)

(declare-fun tp!38409 () Bool)

(assert (=> mapNonEmpty!19939 (= mapRes!19939 (and tp!38409 e!265929))))

(declare-fun mapKey!19939 () (_ BitVec 32))

(declare-fun mapRest!19939 () (Array (_ BitVec 32) ValueCell!5756))

(declare-fun mapValue!19939 () ValueCell!5756)

(assert (=> mapNonEmpty!19939 (= (arr!13541 _values!549) (store mapRest!19939 mapKey!19939 mapValue!19939))))

(declare-fun b!454735 () Bool)

(declare-fun res!271094 () Bool)

(assert (=> b!454735 (=> (not res!271094) (not e!265930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454735 (= res!271094 (validKeyInArray!0 k0!794))))

(declare-fun b!454736 () Bool)

(declare-fun res!271087 () Bool)

(assert (=> b!454736 (=> (not res!271087) (not e!265930))))

(assert (=> b!454736 (= res!271087 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13893 _keys!709))))))

(declare-fun b!454737 () Bool)

(declare-fun res!271088 () Bool)

(assert (=> b!454737 (=> (not res!271088) (not e!265930))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454737 (= res!271088 (and (= (size!13894 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13893 _keys!709) (size!13894 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454738 () Bool)

(declare-fun res!271083 () Bool)

(assert (=> b!454738 (=> (not res!271083) (not e!265930))))

(assert (=> b!454738 (= res!271083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454739 () Bool)

(assert (=> b!454739 (= e!265932 false)))

(declare-fun minValue!515 () V!17371)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!17371)

(declare-datatypes ((tuple2!8108 0))(
  ( (tuple2!8109 (_1!4065 (_ BitVec 64)) (_2!4065 V!17371)) )
))
(declare-datatypes ((List!8168 0))(
  ( (Nil!8165) (Cons!8164 (h!9020 tuple2!8108) (t!13987 List!8168)) )
))
(declare-datatypes ((ListLongMap!7011 0))(
  ( (ListLongMap!7012 (toList!3521 List!8168)) )
))
(declare-fun lt!206015 () ListLongMap!7011)

(declare-fun zeroValue!515 () V!17371)

(declare-fun getCurrentListMapNoExtraKeys!1716 (array!28193 array!28195 (_ BitVec 32) (_ BitVec 32) V!17371 V!17371 (_ BitVec 32) Int) ListLongMap!7011)

(assert (=> b!454739 (= lt!206015 (getCurrentListMapNoExtraKeys!1716 lt!206014 (array!28196 (store (arr!13541 _values!549) i!563 (ValueCellFull!5756 v!412)) (size!13894 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206013 () ListLongMap!7011)

(assert (=> b!454739 (= lt!206013 (getCurrentListMapNoExtraKeys!1716 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454740 () Bool)

(declare-fun res!271085 () Bool)

(assert (=> b!454740 (=> (not res!271085) (not e!265930))))

(assert (=> b!454740 (= res!271085 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8164))))

(declare-fun res!271090 () Bool)

(assert (=> start!40912 (=> (not res!271090) (not e!265930))))

(assert (=> start!40912 (= res!271090 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13893 _keys!709))))))

(assert (=> start!40912 e!265930))

(assert (=> start!40912 tp_is_empty!12199))

(assert (=> start!40912 tp!38410))

(assert (=> start!40912 true))

(declare-fun array_inv!9868 (array!28195) Bool)

(assert (=> start!40912 (and (array_inv!9868 _values!549) e!265931)))

(declare-fun array_inv!9869 (array!28193) Bool)

(assert (=> start!40912 (array_inv!9869 _keys!709)))

(assert (= (and start!40912 res!271090) b!454730))

(assert (= (and b!454730 res!271093) b!454737))

(assert (= (and b!454737 res!271088) b!454738))

(assert (= (and b!454738 res!271083) b!454740))

(assert (= (and b!454740 res!271085) b!454736))

(assert (= (and b!454736 res!271087) b!454735))

(assert (= (and b!454735 res!271094) b!454733))

(assert (= (and b!454733 res!271092) b!454726))

(assert (= (and b!454726 res!271084) b!454729))

(assert (= (and b!454729 res!271091) b!454727))

(assert (= (and b!454727 res!271086) b!454734))

(assert (= (and b!454734 res!271089) b!454739))

(assert (= (and b!454732 condMapEmpty!19939) mapIsEmpty!19939))

(assert (= (and b!454732 (not condMapEmpty!19939)) mapNonEmpty!19939))

(get-info :version)

(assert (= (and mapNonEmpty!19939 ((_ is ValueCellFull!5756) mapValue!19939)) b!454728))

(assert (= (and b!454732 ((_ is ValueCellFull!5756) mapDefault!19939)) b!454731))

(assert (= start!40912 b!454732))

(declare-fun m!438197 () Bool)

(assert (=> b!454727 m!438197))

(declare-fun m!438199 () Bool)

(assert (=> mapNonEmpty!19939 m!438199))

(declare-fun m!438201 () Bool)

(assert (=> b!454738 m!438201))

(declare-fun m!438203 () Bool)

(assert (=> b!454726 m!438203))

(declare-fun m!438205 () Bool)

(assert (=> b!454740 m!438205))

(declare-fun m!438207 () Bool)

(assert (=> b!454735 m!438207))

(declare-fun m!438209 () Bool)

(assert (=> b!454739 m!438209))

(declare-fun m!438211 () Bool)

(assert (=> b!454739 m!438211))

(declare-fun m!438213 () Bool)

(assert (=> b!454739 m!438213))

(declare-fun m!438215 () Bool)

(assert (=> b!454729 m!438215))

(declare-fun m!438217 () Bool)

(assert (=> b!454729 m!438217))

(declare-fun m!438219 () Bool)

(assert (=> b!454733 m!438219))

(declare-fun m!438221 () Bool)

(assert (=> start!40912 m!438221))

(declare-fun m!438223 () Bool)

(assert (=> start!40912 m!438223))

(declare-fun m!438225 () Bool)

(assert (=> b!454730 m!438225))

(check-sat (not b!454735) b_and!18977 (not b!454739) (not start!40912) (not b!454726) (not mapNonEmpty!19939) (not b!454738) (not b!454727) tp_is_empty!12199 (not b_next!10861) (not b!454730) (not b!454729) (not b!454740))
(check-sat b_and!18977 (not b_next!10861))
