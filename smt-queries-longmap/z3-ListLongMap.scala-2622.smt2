; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39552 () Bool)

(assert start!39552)

(declare-fun b_free!9819 () Bool)

(declare-fun b_next!9819 () Bool)

(assert (=> start!39552 (= b_free!9819 (not b_next!9819))))

(declare-fun tp!34985 () Bool)

(declare-fun b_and!17475 () Bool)

(assert (=> start!39552 (= tp!34985 b_and!17475)))

(declare-fun b!423174 () Bool)

(declare-fun e!251632 () Bool)

(declare-fun tp_is_empty!10971 () Bool)

(assert (=> b!423174 (= e!251632 tp_is_empty!10971)))

(declare-fun b!423175 () Bool)

(declare-fun res!247267 () Bool)

(declare-fun e!251633 () Bool)

(assert (=> b!423175 (=> (not res!247267) (not e!251633))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25789 0))(
  ( (array!25790 (arr!12344 (Array (_ BitVec 32) (_ BitVec 64))) (size!12696 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25789)

(assert (=> b!423175 (= res!247267 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12696 _keys!709))))))

(declare-fun b!423176 () Bool)

(declare-fun res!247272 () Bool)

(declare-fun e!251629 () Bool)

(assert (=> b!423176 (=> (not res!247272) (not e!251629))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423176 (= res!247272 (bvsle from!863 i!563))))

(declare-fun b!423177 () Bool)

(declare-fun res!247273 () Bool)

(assert (=> b!423177 (=> (not res!247273) (not e!251633))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15733 0))(
  ( (V!15734 (val!5530 Int)) )
))
(declare-datatypes ((ValueCell!5142 0))(
  ( (ValueCellFull!5142 (v!7777 V!15733)) (EmptyCell!5142) )
))
(declare-datatypes ((array!25791 0))(
  ( (array!25792 (arr!12345 (Array (_ BitVec 32) ValueCell!5142)) (size!12697 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25791)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423177 (= res!247273 (and (= (size!12697 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12696 _keys!709) (size!12697 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423178 () Bool)

(assert (=> b!423178 (= e!251629 false)))

(declare-fun minValue!515 () V!15733)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15733)

(declare-fun lt!194115 () array!25789)

(declare-datatypes ((tuple2!7264 0))(
  ( (tuple2!7265 (_1!3643 (_ BitVec 64)) (_2!3643 V!15733)) )
))
(declare-datatypes ((List!7271 0))(
  ( (Nil!7268) (Cons!7267 (h!8123 tuple2!7264) (t!12715 List!7271)) )
))
(declare-datatypes ((ListLongMap!6177 0))(
  ( (ListLongMap!6178 (toList!3104 List!7271)) )
))
(declare-fun lt!194116 () ListLongMap!6177)

(declare-fun v!412 () V!15733)

(declare-fun getCurrentListMapNoExtraKeys!1308 (array!25789 array!25791 (_ BitVec 32) (_ BitVec 32) V!15733 V!15733 (_ BitVec 32) Int) ListLongMap!6177)

(assert (=> b!423178 (= lt!194116 (getCurrentListMapNoExtraKeys!1308 lt!194115 (array!25792 (store (arr!12345 _values!549) i!563 (ValueCellFull!5142 v!412)) (size!12697 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194117 () ListLongMap!6177)

(assert (=> b!423178 (= lt!194117 (getCurrentListMapNoExtraKeys!1308 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423179 () Bool)

(declare-fun res!247268 () Bool)

(assert (=> b!423179 (=> (not res!247268) (not e!251633))))

(declare-datatypes ((List!7272 0))(
  ( (Nil!7269) (Cons!7268 (h!8124 (_ BitVec 64)) (t!12716 List!7272)) )
))
(declare-fun arrayNoDuplicates!0 (array!25789 (_ BitVec 32) List!7272) Bool)

(assert (=> b!423179 (= res!247268 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7269))))

(declare-fun b!423180 () Bool)

(declare-fun e!251630 () Bool)

(assert (=> b!423180 (= e!251630 tp_is_empty!10971)))

(declare-fun mapIsEmpty!18078 () Bool)

(declare-fun mapRes!18078 () Bool)

(assert (=> mapIsEmpty!18078 mapRes!18078))

(declare-fun res!247264 () Bool)

(assert (=> start!39552 (=> (not res!247264) (not e!251633))))

(assert (=> start!39552 (= res!247264 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12696 _keys!709))))))

(assert (=> start!39552 e!251633))

(assert (=> start!39552 tp_is_empty!10971))

(assert (=> start!39552 tp!34985))

(assert (=> start!39552 true))

(declare-fun e!251631 () Bool)

(declare-fun array_inv!8994 (array!25791) Bool)

(assert (=> start!39552 (and (array_inv!8994 _values!549) e!251631)))

(declare-fun array_inv!8995 (array!25789) Bool)

(assert (=> start!39552 (array_inv!8995 _keys!709)))

(declare-fun b!423181 () Bool)

(assert (=> b!423181 (= e!251631 (and e!251632 mapRes!18078))))

(declare-fun condMapEmpty!18078 () Bool)

(declare-fun mapDefault!18078 () ValueCell!5142)

(assert (=> b!423181 (= condMapEmpty!18078 (= (arr!12345 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5142)) mapDefault!18078)))))

(declare-fun b!423182 () Bool)

(declare-fun res!247265 () Bool)

(assert (=> b!423182 (=> (not res!247265) (not e!251633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423182 (= res!247265 (validMask!0 mask!1025))))

(declare-fun b!423183 () Bool)

(declare-fun res!247274 () Bool)

(assert (=> b!423183 (=> (not res!247274) (not e!251633))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423183 (= res!247274 (validKeyInArray!0 k0!794))))

(declare-fun b!423184 () Bool)

(declare-fun res!247270 () Bool)

(assert (=> b!423184 (=> (not res!247270) (not e!251633))))

(declare-fun arrayContainsKey!0 (array!25789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423184 (= res!247270 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423185 () Bool)

(declare-fun res!247275 () Bool)

(assert (=> b!423185 (=> (not res!247275) (not e!251633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25789 (_ BitVec 32)) Bool)

(assert (=> b!423185 (= res!247275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423186 () Bool)

(assert (=> b!423186 (= e!251633 e!251629)))

(declare-fun res!247266 () Bool)

(assert (=> b!423186 (=> (not res!247266) (not e!251629))))

(assert (=> b!423186 (= res!247266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194115 mask!1025))))

(assert (=> b!423186 (= lt!194115 (array!25790 (store (arr!12344 _keys!709) i!563 k0!794) (size!12696 _keys!709)))))

(declare-fun b!423187 () Bool)

(declare-fun res!247269 () Bool)

(assert (=> b!423187 (=> (not res!247269) (not e!251629))))

(assert (=> b!423187 (= res!247269 (arrayNoDuplicates!0 lt!194115 #b00000000000000000000000000000000 Nil!7269))))

(declare-fun b!423188 () Bool)

(declare-fun res!247271 () Bool)

(assert (=> b!423188 (=> (not res!247271) (not e!251633))))

(assert (=> b!423188 (= res!247271 (or (= (select (arr!12344 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12344 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18078 () Bool)

(declare-fun tp!34986 () Bool)

(assert (=> mapNonEmpty!18078 (= mapRes!18078 (and tp!34986 e!251630))))

(declare-fun mapKey!18078 () (_ BitVec 32))

(declare-fun mapRest!18078 () (Array (_ BitVec 32) ValueCell!5142))

(declare-fun mapValue!18078 () ValueCell!5142)

(assert (=> mapNonEmpty!18078 (= (arr!12345 _values!549) (store mapRest!18078 mapKey!18078 mapValue!18078))))

(assert (= (and start!39552 res!247264) b!423182))

(assert (= (and b!423182 res!247265) b!423177))

(assert (= (and b!423177 res!247273) b!423185))

(assert (= (and b!423185 res!247275) b!423179))

(assert (= (and b!423179 res!247268) b!423175))

(assert (= (and b!423175 res!247267) b!423183))

(assert (= (and b!423183 res!247274) b!423188))

(assert (= (and b!423188 res!247271) b!423184))

(assert (= (and b!423184 res!247270) b!423186))

(assert (= (and b!423186 res!247266) b!423187))

(assert (= (and b!423187 res!247269) b!423176))

(assert (= (and b!423176 res!247272) b!423178))

(assert (= (and b!423181 condMapEmpty!18078) mapIsEmpty!18078))

(assert (= (and b!423181 (not condMapEmpty!18078)) mapNonEmpty!18078))

(get-info :version)

(assert (= (and mapNonEmpty!18078 ((_ is ValueCellFull!5142) mapValue!18078)) b!423180))

(assert (= (and b!423181 ((_ is ValueCellFull!5142) mapDefault!18078)) b!423174))

(assert (= start!39552 b!423181))

(declare-fun m!412743 () Bool)

(assert (=> b!423186 m!412743))

(declare-fun m!412745 () Bool)

(assert (=> b!423186 m!412745))

(declare-fun m!412747 () Bool)

(assert (=> b!423182 m!412747))

(declare-fun m!412749 () Bool)

(assert (=> b!423178 m!412749))

(declare-fun m!412751 () Bool)

(assert (=> b!423178 m!412751))

(declare-fun m!412753 () Bool)

(assert (=> b!423178 m!412753))

(declare-fun m!412755 () Bool)

(assert (=> b!423185 m!412755))

(declare-fun m!412757 () Bool)

(assert (=> mapNonEmpty!18078 m!412757))

(declare-fun m!412759 () Bool)

(assert (=> b!423179 m!412759))

(declare-fun m!412761 () Bool)

(assert (=> b!423184 m!412761))

(declare-fun m!412763 () Bool)

(assert (=> b!423188 m!412763))

(declare-fun m!412765 () Bool)

(assert (=> start!39552 m!412765))

(declare-fun m!412767 () Bool)

(assert (=> start!39552 m!412767))

(declare-fun m!412769 () Bool)

(assert (=> b!423183 m!412769))

(declare-fun m!412771 () Bool)

(assert (=> b!423187 m!412771))

(check-sat b_and!17475 (not b!423184) (not b!423183) (not b!423178) tp_is_empty!10971 (not b_next!9819) (not b!423182) (not mapNonEmpty!18078) (not start!39552) (not b!423187) (not b!423185) (not b!423186) (not b!423179))
(check-sat b_and!17475 (not b_next!9819))
