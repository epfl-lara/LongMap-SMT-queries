; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39584 () Bool)

(assert start!39584)

(declare-fun b_free!9865 () Bool)

(declare-fun b_next!9865 () Bool)

(assert (=> start!39584 (= b_free!9865 (not b_next!9865))))

(declare-fun tp!35124 () Bool)

(declare-fun b_and!17535 () Bool)

(assert (=> start!39584 (= tp!35124 b_and!17535)))

(declare-fun res!248099 () Bool)

(declare-fun e!252013 () Bool)

(assert (=> start!39584 (=> (not res!248099) (not e!252013))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25882 0))(
  ( (array!25883 (arr!12390 (Array (_ BitVec 32) (_ BitVec 64))) (size!12742 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25882)

(assert (=> start!39584 (= res!248099 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12742 _keys!709))))))

(assert (=> start!39584 e!252013))

(declare-fun tp_is_empty!11017 () Bool)

(assert (=> start!39584 tp_is_empty!11017))

(assert (=> start!39584 tp!35124))

(assert (=> start!39584 true))

(declare-datatypes ((V!15795 0))(
  ( (V!15796 (val!5553 Int)) )
))
(declare-datatypes ((ValueCell!5165 0))(
  ( (ValueCellFull!5165 (v!7801 V!15795)) (EmptyCell!5165) )
))
(declare-datatypes ((array!25884 0))(
  ( (array!25885 (arr!12391 (Array (_ BitVec 32) ValueCell!5165)) (size!12743 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25884)

(declare-fun e!252012 () Bool)

(declare-fun array_inv!9100 (array!25884) Bool)

(assert (=> start!39584 (and (array_inv!9100 _values!549) e!252012)))

(declare-fun array_inv!9101 (array!25882) Bool)

(assert (=> start!39584 (array_inv!9101 _keys!709)))

(declare-fun b!424160 () Bool)

(declare-fun e!252011 () Bool)

(assert (=> b!424160 (= e!252013 e!252011)))

(declare-fun res!248098 () Bool)

(assert (=> b!424160 (=> (not res!248098) (not e!252011))))

(declare-fun lt!194341 () array!25882)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25882 (_ BitVec 32)) Bool)

(assert (=> b!424160 (= res!248098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194341 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424160 (= lt!194341 (array!25883 (store (arr!12390 _keys!709) i!563 k0!794) (size!12742 _keys!709)))))

(declare-fun b!424161 () Bool)

(declare-fun res!248090 () Bool)

(assert (=> b!424161 (=> (not res!248090) (not e!252013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424161 (= res!248090 (validKeyInArray!0 k0!794))))

(declare-fun b!424162 () Bool)

(declare-fun res!248093 () Bool)

(assert (=> b!424162 (=> (not res!248093) (not e!252013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424162 (= res!248093 (validMask!0 mask!1025))))

(declare-fun b!424163 () Bool)

(declare-fun e!252016 () Bool)

(declare-fun mapRes!18147 () Bool)

(assert (=> b!424163 (= e!252012 (and e!252016 mapRes!18147))))

(declare-fun condMapEmpty!18147 () Bool)

(declare-fun mapDefault!18147 () ValueCell!5165)

(assert (=> b!424163 (= condMapEmpty!18147 (= (arr!12391 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5165)) mapDefault!18147)))))

(declare-fun b!424164 () Bool)

(assert (=> b!424164 (= e!252016 tp_is_empty!11017)))

(declare-fun b!424165 () Bool)

(declare-fun res!248100 () Bool)

(assert (=> b!424165 (=> (not res!248100) (not e!252013))))

(assert (=> b!424165 (= res!248100 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12742 _keys!709))))))

(declare-fun b!424166 () Bool)

(declare-fun res!248096 () Bool)

(assert (=> b!424166 (=> (not res!248096) (not e!252013))))

(declare-datatypes ((List!7185 0))(
  ( (Nil!7182) (Cons!7181 (h!8037 (_ BitVec 64)) (t!12621 List!7185)) )
))
(declare-fun arrayNoDuplicates!0 (array!25882 (_ BitVec 32) List!7185) Bool)

(assert (=> b!424166 (= res!248096 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7182))))

(declare-fun b!424167 () Bool)

(declare-fun res!248095 () Bool)

(assert (=> b!424167 (=> (not res!248095) (not e!252013))))

(assert (=> b!424167 (= res!248095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424168 () Bool)

(declare-fun res!248092 () Bool)

(assert (=> b!424168 (=> (not res!248092) (not e!252013))))

(declare-fun arrayContainsKey!0 (array!25882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424168 (= res!248092 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18147 () Bool)

(declare-fun tp!35123 () Bool)

(declare-fun e!252014 () Bool)

(assert (=> mapNonEmpty!18147 (= mapRes!18147 (and tp!35123 e!252014))))

(declare-fun mapRest!18147 () (Array (_ BitVec 32) ValueCell!5165))

(declare-fun mapKey!18147 () (_ BitVec 32))

(declare-fun mapValue!18147 () ValueCell!5165)

(assert (=> mapNonEmpty!18147 (= (arr!12391 _values!549) (store mapRest!18147 mapKey!18147 mapValue!18147))))

(declare-fun b!424169 () Bool)

(declare-fun res!248094 () Bool)

(assert (=> b!424169 (=> (not res!248094) (not e!252011))))

(assert (=> b!424169 (= res!248094 (arrayNoDuplicates!0 lt!194341 #b00000000000000000000000000000000 Nil!7182))))

(declare-fun b!424170 () Bool)

(assert (=> b!424170 (= e!252011 false)))

(declare-fun minValue!515 () V!15795)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15795)

(declare-datatypes ((tuple2!7178 0))(
  ( (tuple2!7179 (_1!3600 (_ BitVec 64)) (_2!3600 V!15795)) )
))
(declare-datatypes ((List!7186 0))(
  ( (Nil!7183) (Cons!7182 (h!8038 tuple2!7178) (t!12622 List!7186)) )
))
(declare-datatypes ((ListLongMap!6093 0))(
  ( (ListLongMap!6094 (toList!3062 List!7186)) )
))
(declare-fun lt!194342 () ListLongMap!6093)

(declare-fun v!412 () V!15795)

(declare-fun getCurrentListMapNoExtraKeys!1308 (array!25882 array!25884 (_ BitVec 32) (_ BitVec 32) V!15795 V!15795 (_ BitVec 32) Int) ListLongMap!6093)

(assert (=> b!424170 (= lt!194342 (getCurrentListMapNoExtraKeys!1308 lt!194341 (array!25885 (store (arr!12391 _values!549) i!563 (ValueCellFull!5165 v!412)) (size!12743 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194343 () ListLongMap!6093)

(assert (=> b!424170 (= lt!194343 (getCurrentListMapNoExtraKeys!1308 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424171 () Bool)

(declare-fun res!248091 () Bool)

(assert (=> b!424171 (=> (not res!248091) (not e!252013))))

(assert (=> b!424171 (= res!248091 (and (= (size!12743 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12742 _keys!709) (size!12743 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424172 () Bool)

(declare-fun res!248097 () Bool)

(assert (=> b!424172 (=> (not res!248097) (not e!252013))))

(assert (=> b!424172 (= res!248097 (or (= (select (arr!12390 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12390 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424173 () Bool)

(declare-fun res!248089 () Bool)

(assert (=> b!424173 (=> (not res!248089) (not e!252011))))

(assert (=> b!424173 (= res!248089 (bvsle from!863 i!563))))

(declare-fun b!424174 () Bool)

(assert (=> b!424174 (= e!252014 tp_is_empty!11017)))

(declare-fun mapIsEmpty!18147 () Bool)

(assert (=> mapIsEmpty!18147 mapRes!18147))

(assert (= (and start!39584 res!248099) b!424162))

(assert (= (and b!424162 res!248093) b!424171))

(assert (= (and b!424171 res!248091) b!424167))

(assert (= (and b!424167 res!248095) b!424166))

(assert (= (and b!424166 res!248096) b!424165))

(assert (= (and b!424165 res!248100) b!424161))

(assert (= (and b!424161 res!248090) b!424172))

(assert (= (and b!424172 res!248097) b!424168))

(assert (= (and b!424168 res!248092) b!424160))

(assert (= (and b!424160 res!248098) b!424169))

(assert (= (and b!424169 res!248094) b!424173))

(assert (= (and b!424173 res!248089) b!424170))

(assert (= (and b!424163 condMapEmpty!18147) mapIsEmpty!18147))

(assert (= (and b!424163 (not condMapEmpty!18147)) mapNonEmpty!18147))

(get-info :version)

(assert (= (and mapNonEmpty!18147 ((_ is ValueCellFull!5165) mapValue!18147)) b!424174))

(assert (= (and b!424163 ((_ is ValueCellFull!5165) mapDefault!18147)) b!424164))

(assert (= start!39584 b!424163))

(declare-fun m!413651 () Bool)

(assert (=> b!424169 m!413651))

(declare-fun m!413653 () Bool)

(assert (=> b!424167 m!413653))

(declare-fun m!413655 () Bool)

(assert (=> b!424172 m!413655))

(declare-fun m!413657 () Bool)

(assert (=> b!424166 m!413657))

(declare-fun m!413659 () Bool)

(assert (=> b!424162 m!413659))

(declare-fun m!413661 () Bool)

(assert (=> start!39584 m!413661))

(declare-fun m!413663 () Bool)

(assert (=> start!39584 m!413663))

(declare-fun m!413665 () Bool)

(assert (=> b!424170 m!413665))

(declare-fun m!413667 () Bool)

(assert (=> b!424170 m!413667))

(declare-fun m!413669 () Bool)

(assert (=> b!424170 m!413669))

(declare-fun m!413671 () Bool)

(assert (=> mapNonEmpty!18147 m!413671))

(declare-fun m!413673 () Bool)

(assert (=> b!424161 m!413673))

(declare-fun m!413675 () Bool)

(assert (=> b!424160 m!413675))

(declare-fun m!413677 () Bool)

(assert (=> b!424160 m!413677))

(declare-fun m!413679 () Bool)

(assert (=> b!424168 m!413679))

(check-sat (not b!424160) (not mapNonEmpty!18147) b_and!17535 tp_is_empty!11017 (not start!39584) (not b!424162) (not b_next!9865) (not b!424167) (not b!424161) (not b!424166) (not b!424169) (not b!424168) (not b!424170))
(check-sat b_and!17535 (not b_next!9865))
