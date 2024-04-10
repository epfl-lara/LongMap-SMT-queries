; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39546 () Bool)

(assert start!39546)

(declare-fun b_free!9813 () Bool)

(declare-fun b_next!9813 () Bool)

(assert (=> start!39546 (= b_free!9813 (not b_next!9813))))

(declare-fun tp!34968 () Bool)

(declare-fun b_and!17469 () Bool)

(assert (=> start!39546 (= tp!34968 b_and!17469)))

(declare-fun res!247158 () Bool)

(declare-fun e!251578 () Bool)

(assert (=> start!39546 (=> (not res!247158) (not e!251578))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25777 0))(
  ( (array!25778 (arr!12338 (Array (_ BitVec 32) (_ BitVec 64))) (size!12690 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25777)

(assert (=> start!39546 (= res!247158 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12690 _keys!709))))))

(assert (=> start!39546 e!251578))

(declare-fun tp_is_empty!10965 () Bool)

(assert (=> start!39546 tp_is_empty!10965))

(assert (=> start!39546 tp!34968))

(assert (=> start!39546 true))

(declare-datatypes ((V!15725 0))(
  ( (V!15726 (val!5527 Int)) )
))
(declare-datatypes ((ValueCell!5139 0))(
  ( (ValueCellFull!5139 (v!7774 V!15725)) (EmptyCell!5139) )
))
(declare-datatypes ((array!25779 0))(
  ( (array!25780 (arr!12339 (Array (_ BitVec 32) ValueCell!5139)) (size!12691 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25779)

(declare-fun e!251579 () Bool)

(declare-fun array_inv!8988 (array!25779) Bool)

(assert (=> start!39546 (and (array_inv!8988 _values!549) e!251579)))

(declare-fun array_inv!8989 (array!25777) Bool)

(assert (=> start!39546 (array_inv!8989 _keys!709)))

(declare-fun mapNonEmpty!18069 () Bool)

(declare-fun mapRes!18069 () Bool)

(declare-fun tp!34967 () Bool)

(declare-fun e!251576 () Bool)

(assert (=> mapNonEmpty!18069 (= mapRes!18069 (and tp!34967 e!251576))))

(declare-fun mapValue!18069 () ValueCell!5139)

(declare-fun mapKey!18069 () (_ BitVec 32))

(declare-fun mapRest!18069 () (Array (_ BitVec 32) ValueCell!5139))

(assert (=> mapNonEmpty!18069 (= (arr!12339 _values!549) (store mapRest!18069 mapKey!18069 mapValue!18069))))

(declare-fun b!423039 () Bool)

(declare-fun res!247162 () Bool)

(assert (=> b!423039 (=> (not res!247162) (not e!251578))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423039 (= res!247162 (validMask!0 mask!1025))))

(declare-fun b!423040 () Bool)

(declare-fun res!247159 () Bool)

(declare-fun e!251577 () Bool)

(assert (=> b!423040 (=> (not res!247159) (not e!251577))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423040 (= res!247159 (bvsle from!863 i!563))))

(declare-fun b!423041 () Bool)

(declare-fun res!247167 () Bool)

(assert (=> b!423041 (=> (not res!247167) (not e!251578))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423041 (= res!247167 (and (= (size!12691 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12690 _keys!709) (size!12691 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423042 () Bool)

(declare-fun res!247166 () Bool)

(assert (=> b!423042 (=> (not res!247166) (not e!251578))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423042 (= res!247166 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423043 () Bool)

(declare-fun res!247156 () Bool)

(assert (=> b!423043 (=> (not res!247156) (not e!251578))))

(assert (=> b!423043 (= res!247156 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12690 _keys!709))))))

(declare-fun b!423044 () Bool)

(declare-fun e!251580 () Bool)

(assert (=> b!423044 (= e!251579 (and e!251580 mapRes!18069))))

(declare-fun condMapEmpty!18069 () Bool)

(declare-fun mapDefault!18069 () ValueCell!5139)

(assert (=> b!423044 (= condMapEmpty!18069 (= (arr!12339 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5139)) mapDefault!18069)))))

(declare-fun b!423045 () Bool)

(declare-fun res!247161 () Bool)

(assert (=> b!423045 (=> (not res!247161) (not e!251578))))

(assert (=> b!423045 (= res!247161 (or (= (select (arr!12338 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12338 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423046 () Bool)

(assert (=> b!423046 (= e!251576 tp_is_empty!10965)))

(declare-fun b!423047 () Bool)

(declare-fun res!247157 () Bool)

(assert (=> b!423047 (=> (not res!247157) (not e!251578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25777 (_ BitVec 32)) Bool)

(assert (=> b!423047 (= res!247157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423048 () Bool)

(assert (=> b!423048 (= e!251577 false)))

(declare-fun lt!194090 () array!25777)

(declare-fun minValue!515 () V!15725)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7258 0))(
  ( (tuple2!7259 (_1!3640 (_ BitVec 64)) (_2!3640 V!15725)) )
))
(declare-datatypes ((List!7265 0))(
  ( (Nil!7262) (Cons!7261 (h!8117 tuple2!7258) (t!12709 List!7265)) )
))
(declare-datatypes ((ListLongMap!6171 0))(
  ( (ListLongMap!6172 (toList!3101 List!7265)) )
))
(declare-fun lt!194088 () ListLongMap!6171)

(declare-fun zeroValue!515 () V!15725)

(declare-fun v!412 () V!15725)

(declare-fun getCurrentListMapNoExtraKeys!1305 (array!25777 array!25779 (_ BitVec 32) (_ BitVec 32) V!15725 V!15725 (_ BitVec 32) Int) ListLongMap!6171)

(assert (=> b!423048 (= lt!194088 (getCurrentListMapNoExtraKeys!1305 lt!194090 (array!25780 (store (arr!12339 _values!549) i!563 (ValueCellFull!5139 v!412)) (size!12691 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194089 () ListLongMap!6171)

(assert (=> b!423048 (= lt!194089 (getCurrentListMapNoExtraKeys!1305 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423049 () Bool)

(assert (=> b!423049 (= e!251580 tp_is_empty!10965)))

(declare-fun b!423050 () Bool)

(declare-fun res!247163 () Bool)

(assert (=> b!423050 (=> (not res!247163) (not e!251577))))

(declare-datatypes ((List!7266 0))(
  ( (Nil!7263) (Cons!7262 (h!8118 (_ BitVec 64)) (t!12710 List!7266)) )
))
(declare-fun arrayNoDuplicates!0 (array!25777 (_ BitVec 32) List!7266) Bool)

(assert (=> b!423050 (= res!247163 (arrayNoDuplicates!0 lt!194090 #b00000000000000000000000000000000 Nil!7263))))

(declare-fun b!423051 () Bool)

(declare-fun res!247164 () Bool)

(assert (=> b!423051 (=> (not res!247164) (not e!251578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423051 (= res!247164 (validKeyInArray!0 k0!794))))

(declare-fun b!423052 () Bool)

(assert (=> b!423052 (= e!251578 e!251577)))

(declare-fun res!247160 () Bool)

(assert (=> b!423052 (=> (not res!247160) (not e!251577))))

(assert (=> b!423052 (= res!247160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194090 mask!1025))))

(assert (=> b!423052 (= lt!194090 (array!25778 (store (arr!12338 _keys!709) i!563 k0!794) (size!12690 _keys!709)))))

(declare-fun b!423053 () Bool)

(declare-fun res!247165 () Bool)

(assert (=> b!423053 (=> (not res!247165) (not e!251578))))

(assert (=> b!423053 (= res!247165 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7263))))

(declare-fun mapIsEmpty!18069 () Bool)

(assert (=> mapIsEmpty!18069 mapRes!18069))

(assert (= (and start!39546 res!247158) b!423039))

(assert (= (and b!423039 res!247162) b!423041))

(assert (= (and b!423041 res!247167) b!423047))

(assert (= (and b!423047 res!247157) b!423053))

(assert (= (and b!423053 res!247165) b!423043))

(assert (= (and b!423043 res!247156) b!423051))

(assert (= (and b!423051 res!247164) b!423045))

(assert (= (and b!423045 res!247161) b!423042))

(assert (= (and b!423042 res!247166) b!423052))

(assert (= (and b!423052 res!247160) b!423050))

(assert (= (and b!423050 res!247163) b!423040))

(assert (= (and b!423040 res!247159) b!423048))

(assert (= (and b!423044 condMapEmpty!18069) mapIsEmpty!18069))

(assert (= (and b!423044 (not condMapEmpty!18069)) mapNonEmpty!18069))

(get-info :version)

(assert (= (and mapNonEmpty!18069 ((_ is ValueCellFull!5139) mapValue!18069)) b!423046))

(assert (= (and b!423044 ((_ is ValueCellFull!5139) mapDefault!18069)) b!423049))

(assert (= start!39546 b!423044))

(declare-fun m!412653 () Bool)

(assert (=> b!423047 m!412653))

(declare-fun m!412655 () Bool)

(assert (=> start!39546 m!412655))

(declare-fun m!412657 () Bool)

(assert (=> start!39546 m!412657))

(declare-fun m!412659 () Bool)

(assert (=> b!423045 m!412659))

(declare-fun m!412661 () Bool)

(assert (=> b!423050 m!412661))

(declare-fun m!412663 () Bool)

(assert (=> b!423052 m!412663))

(declare-fun m!412665 () Bool)

(assert (=> b!423052 m!412665))

(declare-fun m!412667 () Bool)

(assert (=> b!423042 m!412667))

(declare-fun m!412669 () Bool)

(assert (=> mapNonEmpty!18069 m!412669))

(declare-fun m!412671 () Bool)

(assert (=> b!423048 m!412671))

(declare-fun m!412673 () Bool)

(assert (=> b!423048 m!412673))

(declare-fun m!412675 () Bool)

(assert (=> b!423048 m!412675))

(declare-fun m!412677 () Bool)

(assert (=> b!423039 m!412677))

(declare-fun m!412679 () Bool)

(assert (=> b!423053 m!412679))

(declare-fun m!412681 () Bool)

(assert (=> b!423051 m!412681))

(check-sat (not b!423039) (not b!423047) (not mapNonEmpty!18069) (not start!39546) tp_is_empty!10965 b_and!17469 (not b!423052) (not b!423053) (not b!423048) (not b!423051) (not b!423050) (not b_next!9813) (not b!423042))
(check-sat b_and!17469 (not b_next!9813))
