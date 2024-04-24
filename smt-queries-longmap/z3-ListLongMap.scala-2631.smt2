; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39590 () Bool)

(assert start!39590)

(declare-fun b_free!9871 () Bool)

(declare-fun b_next!9871 () Bool)

(assert (=> start!39590 (= b_free!9871 (not b_next!9871))))

(declare-fun tp!35141 () Bool)

(declare-fun b_and!17541 () Bool)

(assert (=> start!39590 (= tp!35141 b_and!17541)))

(declare-fun mapIsEmpty!18156 () Bool)

(declare-fun mapRes!18156 () Bool)

(assert (=> mapIsEmpty!18156 mapRes!18156))

(declare-fun b!424296 () Bool)

(declare-fun e!252070 () Bool)

(assert (=> b!424296 (= e!252070 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15803 0))(
  ( (V!15804 (val!5556 Int)) )
))
(declare-datatypes ((ValueCell!5168 0))(
  ( (ValueCellFull!5168 (v!7804 V!15803)) (EmptyCell!5168) )
))
(declare-datatypes ((array!25894 0))(
  ( (array!25895 (arr!12396 (Array (_ BitVec 32) ValueCell!5168)) (size!12748 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25894)

(declare-fun zeroValue!515 () V!15803)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7184 0))(
  ( (tuple2!7185 (_1!3603 (_ BitVec 64)) (_2!3603 V!15803)) )
))
(declare-datatypes ((List!7190 0))(
  ( (Nil!7187) (Cons!7186 (h!8042 tuple2!7184) (t!12626 List!7190)) )
))
(declare-datatypes ((ListLongMap!6099 0))(
  ( (ListLongMap!6100 (toList!3065 List!7190)) )
))
(declare-fun lt!194369 () ListLongMap!6099)

(declare-fun v!412 () V!15803)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15803)

(declare-datatypes ((array!25896 0))(
  ( (array!25897 (arr!12397 (Array (_ BitVec 32) (_ BitVec 64))) (size!12749 (_ BitVec 32))) )
))
(declare-fun lt!194370 () array!25896)

(declare-fun getCurrentListMapNoExtraKeys!1311 (array!25896 array!25894 (_ BitVec 32) (_ BitVec 32) V!15803 V!15803 (_ BitVec 32) Int) ListLongMap!6099)

(assert (=> b!424296 (= lt!194369 (getCurrentListMapNoExtraKeys!1311 lt!194370 (array!25895 (store (arr!12396 _values!549) i!563 (ValueCellFull!5168 v!412)) (size!12748 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194368 () ListLongMap!6099)

(declare-fun _keys!709 () array!25896)

(assert (=> b!424296 (= lt!194368 (getCurrentListMapNoExtraKeys!1311 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424297 () Bool)

(declare-fun res!248203 () Bool)

(declare-fun e!252067 () Bool)

(assert (=> b!424297 (=> (not res!248203) (not e!252067))))

(assert (=> b!424297 (= res!248203 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12749 _keys!709))))))

(declare-fun mapNonEmpty!18156 () Bool)

(declare-fun tp!35142 () Bool)

(declare-fun e!252066 () Bool)

(assert (=> mapNonEmpty!18156 (= mapRes!18156 (and tp!35142 e!252066))))

(declare-fun mapKey!18156 () (_ BitVec 32))

(declare-fun mapRest!18156 () (Array (_ BitVec 32) ValueCell!5168))

(declare-fun mapValue!18156 () ValueCell!5168)

(assert (=> mapNonEmpty!18156 (= (arr!12396 _values!549) (store mapRest!18156 mapKey!18156 mapValue!18156))))

(declare-fun b!424298 () Bool)

(declare-fun e!252068 () Bool)

(declare-fun tp_is_empty!11023 () Bool)

(assert (=> b!424298 (= e!252068 tp_is_empty!11023)))

(declare-fun b!424299 () Bool)

(declare-fun res!248199 () Bool)

(assert (=> b!424299 (=> (not res!248199) (not e!252067))))

(declare-datatypes ((List!7191 0))(
  ( (Nil!7188) (Cons!7187 (h!8043 (_ BitVec 64)) (t!12627 List!7191)) )
))
(declare-fun arrayNoDuplicates!0 (array!25896 (_ BitVec 32) List!7191) Bool)

(assert (=> b!424299 (= res!248199 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7188))))

(declare-fun b!424300 () Bool)

(declare-fun res!248197 () Bool)

(assert (=> b!424300 (=> (not res!248197) (not e!252070))))

(assert (=> b!424300 (= res!248197 (arrayNoDuplicates!0 lt!194370 #b00000000000000000000000000000000 Nil!7188))))

(declare-fun b!424301 () Bool)

(declare-fun e!252069 () Bool)

(assert (=> b!424301 (= e!252069 (and e!252068 mapRes!18156))))

(declare-fun condMapEmpty!18156 () Bool)

(declare-fun mapDefault!18156 () ValueCell!5168)

(assert (=> b!424301 (= condMapEmpty!18156 (= (arr!12396 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5168)) mapDefault!18156)))))

(declare-fun b!424302 () Bool)

(declare-fun res!248198 () Bool)

(assert (=> b!424302 (=> (not res!248198) (not e!252067))))

(assert (=> b!424302 (= res!248198 (and (= (size!12748 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12749 _keys!709) (size!12748 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424303 () Bool)

(declare-fun res!248201 () Bool)

(assert (=> b!424303 (=> (not res!248201) (not e!252067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25896 (_ BitVec 32)) Bool)

(assert (=> b!424303 (= res!248201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!248205 () Bool)

(assert (=> start!39590 (=> (not res!248205) (not e!252067))))

(assert (=> start!39590 (= res!248205 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12749 _keys!709))))))

(assert (=> start!39590 e!252067))

(assert (=> start!39590 tp_is_empty!11023))

(assert (=> start!39590 tp!35141))

(assert (=> start!39590 true))

(declare-fun array_inv!9102 (array!25894) Bool)

(assert (=> start!39590 (and (array_inv!9102 _values!549) e!252069)))

(declare-fun array_inv!9103 (array!25896) Bool)

(assert (=> start!39590 (array_inv!9103 _keys!709)))

(declare-fun b!424295 () Bool)

(assert (=> b!424295 (= e!252066 tp_is_empty!11023)))

(declare-fun b!424304 () Bool)

(declare-fun res!248204 () Bool)

(assert (=> b!424304 (=> (not res!248204) (not e!252070))))

(assert (=> b!424304 (= res!248204 (bvsle from!863 i!563))))

(declare-fun b!424305 () Bool)

(declare-fun res!248200 () Bool)

(assert (=> b!424305 (=> (not res!248200) (not e!252067))))

(assert (=> b!424305 (= res!248200 (or (= (select (arr!12397 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12397 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424306 () Bool)

(declare-fun res!248208 () Bool)

(assert (=> b!424306 (=> (not res!248208) (not e!252067))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424306 (= res!248208 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424307 () Bool)

(assert (=> b!424307 (= e!252067 e!252070)))

(declare-fun res!248207 () Bool)

(assert (=> b!424307 (=> (not res!248207) (not e!252070))))

(assert (=> b!424307 (= res!248207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194370 mask!1025))))

(assert (=> b!424307 (= lt!194370 (array!25897 (store (arr!12397 _keys!709) i!563 k0!794) (size!12749 _keys!709)))))

(declare-fun b!424308 () Bool)

(declare-fun res!248202 () Bool)

(assert (=> b!424308 (=> (not res!248202) (not e!252067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424308 (= res!248202 (validMask!0 mask!1025))))

(declare-fun b!424309 () Bool)

(declare-fun res!248206 () Bool)

(assert (=> b!424309 (=> (not res!248206) (not e!252067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424309 (= res!248206 (validKeyInArray!0 k0!794))))

(assert (= (and start!39590 res!248205) b!424308))

(assert (= (and b!424308 res!248202) b!424302))

(assert (= (and b!424302 res!248198) b!424303))

(assert (= (and b!424303 res!248201) b!424299))

(assert (= (and b!424299 res!248199) b!424297))

(assert (= (and b!424297 res!248203) b!424309))

(assert (= (and b!424309 res!248206) b!424305))

(assert (= (and b!424305 res!248200) b!424306))

(assert (= (and b!424306 res!248208) b!424307))

(assert (= (and b!424307 res!248207) b!424300))

(assert (= (and b!424300 res!248197) b!424304))

(assert (= (and b!424304 res!248204) b!424296))

(assert (= (and b!424301 condMapEmpty!18156) mapIsEmpty!18156))

(assert (= (and b!424301 (not condMapEmpty!18156)) mapNonEmpty!18156))

(get-info :version)

(assert (= (and mapNonEmpty!18156 ((_ is ValueCellFull!5168) mapValue!18156)) b!424295))

(assert (= (and b!424301 ((_ is ValueCellFull!5168) mapDefault!18156)) b!424298))

(assert (= start!39590 b!424301))

(declare-fun m!413741 () Bool)

(assert (=> b!424300 m!413741))

(declare-fun m!413743 () Bool)

(assert (=> b!424305 m!413743))

(declare-fun m!413745 () Bool)

(assert (=> b!424309 m!413745))

(declare-fun m!413747 () Bool)

(assert (=> b!424303 m!413747))

(declare-fun m!413749 () Bool)

(assert (=> b!424299 m!413749))

(declare-fun m!413751 () Bool)

(assert (=> mapNonEmpty!18156 m!413751))

(declare-fun m!413753 () Bool)

(assert (=> b!424308 m!413753))

(declare-fun m!413755 () Bool)

(assert (=> b!424306 m!413755))

(declare-fun m!413757 () Bool)

(assert (=> start!39590 m!413757))

(declare-fun m!413759 () Bool)

(assert (=> start!39590 m!413759))

(declare-fun m!413761 () Bool)

(assert (=> b!424307 m!413761))

(declare-fun m!413763 () Bool)

(assert (=> b!424307 m!413763))

(declare-fun m!413765 () Bool)

(assert (=> b!424296 m!413765))

(declare-fun m!413767 () Bool)

(assert (=> b!424296 m!413767))

(declare-fun m!413769 () Bool)

(assert (=> b!424296 m!413769))

(check-sat (not b!424299) (not b!424296) b_and!17541 (not b_next!9871) (not b!424306) (not b!424309) (not b!424303) (not b!424308) (not start!39590) (not b!424307) (not mapNonEmpty!18156) tp_is_empty!11023 (not b!424300))
(check-sat b_and!17541 (not b_next!9871))
