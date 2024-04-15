; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40202 () Bool)

(assert start!40202)

(declare-fun b_free!10483 () Bool)

(declare-fun b_next!10483 () Bool)

(assert (=> start!40202 (= b_free!10483 (not b_next!10483))))

(declare-fun tp!36977 () Bool)

(declare-fun b_and!18425 () Bool)

(assert (=> start!40202 (= tp!36977 b_and!18425)))

(declare-fun b!440677 () Bool)

(declare-fun res!260783 () Bool)

(declare-fun e!259545 () Bool)

(assert (=> b!440677 (=> (not res!260783) (not e!259545))))

(declare-datatypes ((array!27085 0))(
  ( (array!27086 (arr!12992 (Array (_ BitVec 32) (_ BitVec 64))) (size!13345 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27085)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27085 (_ BitVec 32)) Bool)

(assert (=> b!440677 (= res!260783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19074 () Bool)

(declare-fun mapRes!19074 () Bool)

(assert (=> mapIsEmpty!19074 mapRes!19074))

(declare-fun b!440678 () Bool)

(declare-fun res!260788 () Bool)

(assert (=> b!440678 (=> (not res!260788) (not e!259545))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16619 0))(
  ( (V!16620 (val!5862 Int)) )
))
(declare-datatypes ((ValueCell!5474 0))(
  ( (ValueCellFull!5474 (v!8103 V!16619)) (EmptyCell!5474) )
))
(declare-datatypes ((array!27087 0))(
  ( (array!27088 (arr!12993 (Array (_ BitVec 32) ValueCell!5474)) (size!13346 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27087)

(assert (=> b!440678 (= res!260788 (and (= (size!13346 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13345 _keys!709) (size!13346 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440679 () Bool)

(declare-fun res!260784 () Bool)

(assert (=> b!440679 (=> (not res!260784) (not e!259545))))

(declare-datatypes ((List!7796 0))(
  ( (Nil!7793) (Cons!7792 (h!8648 (_ BitVec 64)) (t!13543 List!7796)) )
))
(declare-fun arrayNoDuplicates!0 (array!27085 (_ BitVec 32) List!7796) Bool)

(assert (=> b!440679 (= res!260784 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7793))))

(declare-fun b!440680 () Bool)

(declare-fun e!259539 () Bool)

(assert (=> b!440680 (= e!259539 (not true))))

(declare-fun minValue!515 () V!16619)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16619)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202508 () array!27085)

(declare-fun lt!202510 () array!27087)

(declare-fun v!412 () V!16619)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7810 0))(
  ( (tuple2!7811 (_1!3916 (_ BitVec 64)) (_2!3916 V!16619)) )
))
(declare-datatypes ((List!7797 0))(
  ( (Nil!7794) (Cons!7793 (h!8649 tuple2!7810) (t!13544 List!7797)) )
))
(declare-datatypes ((ListLongMap!6713 0))(
  ( (ListLongMap!6714 (toList!3372 List!7797)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1571 (array!27085 array!27087 (_ BitVec 32) (_ BitVec 32) V!16619 V!16619 (_ BitVec 32) Int) ListLongMap!6713)

(declare-fun +!1532 (ListLongMap!6713 tuple2!7810) ListLongMap!6713)

(assert (=> b!440680 (= (getCurrentListMapNoExtraKeys!1571 lt!202508 lt!202510 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1532 (getCurrentListMapNoExtraKeys!1571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7811 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13081 0))(
  ( (Unit!13082) )
))
(declare-fun lt!202511 () Unit!13081)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!670 (array!27085 array!27087 (_ BitVec 32) (_ BitVec 32) V!16619 V!16619 (_ BitVec 32) (_ BitVec 64) V!16619 (_ BitVec 32) Int) Unit!13081)

(assert (=> b!440680 (= lt!202511 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!670 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440682 () Bool)

(declare-fun res!260782 () Bool)

(declare-fun e!259543 () Bool)

(assert (=> b!440682 (=> (not res!260782) (not e!259543))))

(assert (=> b!440682 (= res!260782 (bvsle from!863 i!563))))

(declare-fun b!440683 () Bool)

(declare-fun e!259541 () Bool)

(declare-fun tp_is_empty!11635 () Bool)

(assert (=> b!440683 (= e!259541 tp_is_empty!11635)))

(declare-fun b!440684 () Bool)

(declare-fun res!260792 () Bool)

(assert (=> b!440684 (=> (not res!260792) (not e!259545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440684 (= res!260792 (validMask!0 mask!1025))))

(declare-fun b!440685 () Bool)

(declare-fun res!260786 () Bool)

(assert (=> b!440685 (=> (not res!260786) (not e!259543))))

(assert (=> b!440685 (= res!260786 (arrayNoDuplicates!0 lt!202508 #b00000000000000000000000000000000 Nil!7793))))

(declare-fun b!440686 () Bool)

(declare-fun res!260791 () Bool)

(assert (=> b!440686 (=> (not res!260791) (not e!259545))))

(assert (=> b!440686 (= res!260791 (or (= (select (arr!12992 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12992 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19074 () Bool)

(declare-fun tp!36978 () Bool)

(declare-fun e!259544 () Bool)

(assert (=> mapNonEmpty!19074 (= mapRes!19074 (and tp!36978 e!259544))))

(declare-fun mapKey!19074 () (_ BitVec 32))

(declare-fun mapRest!19074 () (Array (_ BitVec 32) ValueCell!5474))

(declare-fun mapValue!19074 () ValueCell!5474)

(assert (=> mapNonEmpty!19074 (= (arr!12993 _values!549) (store mapRest!19074 mapKey!19074 mapValue!19074))))

(declare-fun b!440687 () Bool)

(assert (=> b!440687 (= e!259544 tp_is_empty!11635)))

(declare-fun res!260785 () Bool)

(assert (=> start!40202 (=> (not res!260785) (not e!259545))))

(assert (=> start!40202 (= res!260785 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13345 _keys!709))))))

(assert (=> start!40202 e!259545))

(assert (=> start!40202 tp_is_empty!11635))

(assert (=> start!40202 tp!36977))

(assert (=> start!40202 true))

(declare-fun e!259542 () Bool)

(declare-fun array_inv!9472 (array!27087) Bool)

(assert (=> start!40202 (and (array_inv!9472 _values!549) e!259542)))

(declare-fun array_inv!9473 (array!27085) Bool)

(assert (=> start!40202 (array_inv!9473 _keys!709)))

(declare-fun b!440681 () Bool)

(declare-fun res!260787 () Bool)

(assert (=> b!440681 (=> (not res!260787) (not e!259545))))

(assert (=> b!440681 (= res!260787 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13345 _keys!709))))))

(declare-fun b!440688 () Bool)

(declare-fun res!260793 () Bool)

(assert (=> b!440688 (=> (not res!260793) (not e!259545))))

(declare-fun arrayContainsKey!0 (array!27085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440688 (= res!260793 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440689 () Bool)

(assert (=> b!440689 (= e!259542 (and e!259541 mapRes!19074))))

(declare-fun condMapEmpty!19074 () Bool)

(declare-fun mapDefault!19074 () ValueCell!5474)

(assert (=> b!440689 (= condMapEmpty!19074 (= (arr!12993 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5474)) mapDefault!19074)))))

(declare-fun b!440690 () Bool)

(declare-fun res!260789 () Bool)

(assert (=> b!440690 (=> (not res!260789) (not e!259545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440690 (= res!260789 (validKeyInArray!0 k0!794))))

(declare-fun b!440691 () Bool)

(assert (=> b!440691 (= e!259545 e!259543)))

(declare-fun res!260790 () Bool)

(assert (=> b!440691 (=> (not res!260790) (not e!259543))))

(assert (=> b!440691 (= res!260790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202508 mask!1025))))

(assert (=> b!440691 (= lt!202508 (array!27086 (store (arr!12992 _keys!709) i!563 k0!794) (size!13345 _keys!709)))))

(declare-fun b!440692 () Bool)

(assert (=> b!440692 (= e!259543 e!259539)))

(declare-fun res!260781 () Bool)

(assert (=> b!440692 (=> (not res!260781) (not e!259539))))

(assert (=> b!440692 (= res!260781 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202507 () ListLongMap!6713)

(assert (=> b!440692 (= lt!202507 (getCurrentListMapNoExtraKeys!1571 lt!202508 lt!202510 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440692 (= lt!202510 (array!27088 (store (arr!12993 _values!549) i!563 (ValueCellFull!5474 v!412)) (size!13346 _values!549)))))

(declare-fun lt!202509 () ListLongMap!6713)

(assert (=> b!440692 (= lt!202509 (getCurrentListMapNoExtraKeys!1571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40202 res!260785) b!440684))

(assert (= (and b!440684 res!260792) b!440678))

(assert (= (and b!440678 res!260788) b!440677))

(assert (= (and b!440677 res!260783) b!440679))

(assert (= (and b!440679 res!260784) b!440681))

(assert (= (and b!440681 res!260787) b!440690))

(assert (= (and b!440690 res!260789) b!440686))

(assert (= (and b!440686 res!260791) b!440688))

(assert (= (and b!440688 res!260793) b!440691))

(assert (= (and b!440691 res!260790) b!440685))

(assert (= (and b!440685 res!260786) b!440682))

(assert (= (and b!440682 res!260782) b!440692))

(assert (= (and b!440692 res!260781) b!440680))

(assert (= (and b!440689 condMapEmpty!19074) mapIsEmpty!19074))

(assert (= (and b!440689 (not condMapEmpty!19074)) mapNonEmpty!19074))

(get-info :version)

(assert (= (and mapNonEmpty!19074 ((_ is ValueCellFull!5474) mapValue!19074)) b!440687))

(assert (= (and b!440689 ((_ is ValueCellFull!5474) mapDefault!19074)) b!440683))

(assert (= start!40202 b!440689))

(declare-fun m!427155 () Bool)

(assert (=> b!440685 m!427155))

(declare-fun m!427157 () Bool)

(assert (=> b!440677 m!427157))

(declare-fun m!427159 () Bool)

(assert (=> start!40202 m!427159))

(declare-fun m!427161 () Bool)

(assert (=> start!40202 m!427161))

(declare-fun m!427163 () Bool)

(assert (=> mapNonEmpty!19074 m!427163))

(declare-fun m!427165 () Bool)

(assert (=> b!440690 m!427165))

(declare-fun m!427167 () Bool)

(assert (=> b!440686 m!427167))

(declare-fun m!427169 () Bool)

(assert (=> b!440692 m!427169))

(declare-fun m!427171 () Bool)

(assert (=> b!440692 m!427171))

(declare-fun m!427173 () Bool)

(assert (=> b!440692 m!427173))

(declare-fun m!427175 () Bool)

(assert (=> b!440691 m!427175))

(declare-fun m!427177 () Bool)

(assert (=> b!440691 m!427177))

(declare-fun m!427179 () Bool)

(assert (=> b!440679 m!427179))

(declare-fun m!427181 () Bool)

(assert (=> b!440680 m!427181))

(declare-fun m!427183 () Bool)

(assert (=> b!440680 m!427183))

(assert (=> b!440680 m!427183))

(declare-fun m!427185 () Bool)

(assert (=> b!440680 m!427185))

(declare-fun m!427187 () Bool)

(assert (=> b!440680 m!427187))

(declare-fun m!427189 () Bool)

(assert (=> b!440688 m!427189))

(declare-fun m!427191 () Bool)

(assert (=> b!440684 m!427191))

(check-sat (not b!440680) (not b!440691) (not start!40202) (not b!440679) tp_is_empty!11635 (not mapNonEmpty!19074) (not b!440690) (not b!440685) (not b!440688) (not b!440692) (not b_next!10483) b_and!18425 (not b!440684) (not b!440677))
(check-sat b_and!18425 (not b_next!10483))
