; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39612 () Bool)

(assert start!39612)

(declare-fun b_free!9879 () Bool)

(declare-fun b_next!9879 () Bool)

(assert (=> start!39612 (= b_free!9879 (not b_next!9879))))

(declare-fun tp!35165 () Bool)

(declare-fun b_and!17535 () Bool)

(assert (=> start!39612 (= tp!35165 b_and!17535)))

(declare-fun mapIsEmpty!18168 () Bool)

(declare-fun mapRes!18168 () Bool)

(assert (=> mapIsEmpty!18168 mapRes!18168))

(declare-fun b!424524 () Bool)

(declare-fun res!248345 () Bool)

(declare-fun e!252169 () Bool)

(assert (=> b!424524 (=> (not res!248345) (not e!252169))))

(declare-datatypes ((array!25901 0))(
  ( (array!25902 (arr!12400 (Array (_ BitVec 32) (_ BitVec 64))) (size!12752 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25901)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424524 (= res!248345 (or (= (select (arr!12400 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12400 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424525 () Bool)

(declare-fun res!248344 () Bool)

(assert (=> b!424525 (=> (not res!248344) (not e!252169))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25901 (_ BitVec 32)) Bool)

(assert (=> b!424525 (= res!248344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424526 () Bool)

(declare-fun e!252174 () Bool)

(declare-fun tp_is_empty!11031 () Bool)

(assert (=> b!424526 (= e!252174 tp_is_empty!11031)))

(declare-fun b!424527 () Bool)

(declare-fun res!248349 () Bool)

(assert (=> b!424527 (=> (not res!248349) (not e!252169))))

(assert (=> b!424527 (= res!248349 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12752 _keys!709))))))

(declare-fun b!424528 () Bool)

(declare-fun res!248348 () Bool)

(declare-fun e!252171 () Bool)

(assert (=> b!424528 (=> (not res!248348) (not e!252171))))

(declare-fun lt!194386 () array!25901)

(declare-datatypes ((List!7309 0))(
  ( (Nil!7306) (Cons!7305 (h!8161 (_ BitVec 64)) (t!12753 List!7309)) )
))
(declare-fun arrayNoDuplicates!0 (array!25901 (_ BitVec 32) List!7309) Bool)

(assert (=> b!424528 (= res!248348 (arrayNoDuplicates!0 lt!194386 #b00000000000000000000000000000000 Nil!7306))))

(declare-fun b!424529 () Bool)

(declare-fun res!248353 () Bool)

(assert (=> b!424529 (=> (not res!248353) (not e!252171))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424529 (= res!248353 (bvsle from!863 i!563))))

(declare-fun b!424530 () Bool)

(declare-fun e!252173 () Bool)

(declare-fun e!252172 () Bool)

(assert (=> b!424530 (= e!252173 (and e!252172 mapRes!18168))))

(declare-fun condMapEmpty!18168 () Bool)

(declare-datatypes ((V!15813 0))(
  ( (V!15814 (val!5560 Int)) )
))
(declare-datatypes ((ValueCell!5172 0))(
  ( (ValueCellFull!5172 (v!7807 V!15813)) (EmptyCell!5172) )
))
(declare-datatypes ((array!25903 0))(
  ( (array!25904 (arr!12401 (Array (_ BitVec 32) ValueCell!5172)) (size!12753 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25903)

(declare-fun mapDefault!18168 () ValueCell!5172)

(assert (=> b!424530 (= condMapEmpty!18168 (= (arr!12401 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5172)) mapDefault!18168)))))

(declare-fun mapNonEmpty!18168 () Bool)

(declare-fun tp!35166 () Bool)

(assert (=> mapNonEmpty!18168 (= mapRes!18168 (and tp!35166 e!252174))))

(declare-fun mapKey!18168 () (_ BitVec 32))

(declare-fun mapRest!18168 () (Array (_ BitVec 32) ValueCell!5172))

(declare-fun mapValue!18168 () ValueCell!5172)

(assert (=> mapNonEmpty!18168 (= (arr!12401 _values!549) (store mapRest!18168 mapKey!18168 mapValue!18168))))

(declare-fun b!424531 () Bool)

(assert (=> b!424531 (= e!252171 false)))

(declare-fun minValue!515 () V!15813)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15813)

(declare-fun v!412 () V!15813)

(declare-datatypes ((tuple2!7298 0))(
  ( (tuple2!7299 (_1!3660 (_ BitVec 64)) (_2!3660 V!15813)) )
))
(declare-datatypes ((List!7310 0))(
  ( (Nil!7307) (Cons!7306 (h!8162 tuple2!7298) (t!12754 List!7310)) )
))
(declare-datatypes ((ListLongMap!6211 0))(
  ( (ListLongMap!6212 (toList!3121 List!7310)) )
))
(declare-fun lt!194387 () ListLongMap!6211)

(declare-fun getCurrentListMapNoExtraKeys!1325 (array!25901 array!25903 (_ BitVec 32) (_ BitVec 32) V!15813 V!15813 (_ BitVec 32) Int) ListLongMap!6211)

(assert (=> b!424531 (= lt!194387 (getCurrentListMapNoExtraKeys!1325 lt!194386 (array!25904 (store (arr!12401 _values!549) i!563 (ValueCellFull!5172 v!412)) (size!12753 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194385 () ListLongMap!6211)

(assert (=> b!424531 (= lt!194385 (getCurrentListMapNoExtraKeys!1325 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424532 () Bool)

(declare-fun res!248350 () Bool)

(assert (=> b!424532 (=> (not res!248350) (not e!252169))))

(assert (=> b!424532 (= res!248350 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7306))))

(declare-fun b!424533 () Bool)

(declare-fun res!248347 () Bool)

(assert (=> b!424533 (=> (not res!248347) (not e!252169))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424533 (= res!248347 (validKeyInArray!0 k0!794))))

(declare-fun res!248351 () Bool)

(assert (=> start!39612 (=> (not res!248351) (not e!252169))))

(assert (=> start!39612 (= res!248351 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12752 _keys!709))))))

(assert (=> start!39612 e!252169))

(assert (=> start!39612 tp_is_empty!11031))

(assert (=> start!39612 tp!35165))

(assert (=> start!39612 true))

(declare-fun array_inv!9034 (array!25903) Bool)

(assert (=> start!39612 (and (array_inv!9034 _values!549) e!252173)))

(declare-fun array_inv!9035 (array!25901) Bool)

(assert (=> start!39612 (array_inv!9035 _keys!709)))

(declare-fun b!424534 () Bool)

(declare-fun res!248352 () Bool)

(assert (=> b!424534 (=> (not res!248352) (not e!252169))))

(assert (=> b!424534 (= res!248352 (and (= (size!12753 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12752 _keys!709) (size!12753 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424535 () Bool)

(assert (=> b!424535 (= e!252172 tp_is_empty!11031)))

(declare-fun b!424536 () Bool)

(declare-fun res!248354 () Bool)

(assert (=> b!424536 (=> (not res!248354) (not e!252169))))

(declare-fun arrayContainsKey!0 (array!25901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424536 (= res!248354 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424537 () Bool)

(assert (=> b!424537 (= e!252169 e!252171)))

(declare-fun res!248355 () Bool)

(assert (=> b!424537 (=> (not res!248355) (not e!252171))))

(assert (=> b!424537 (= res!248355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194386 mask!1025))))

(assert (=> b!424537 (= lt!194386 (array!25902 (store (arr!12400 _keys!709) i!563 k0!794) (size!12752 _keys!709)))))

(declare-fun b!424538 () Bool)

(declare-fun res!248346 () Bool)

(assert (=> b!424538 (=> (not res!248346) (not e!252169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424538 (= res!248346 (validMask!0 mask!1025))))

(assert (= (and start!39612 res!248351) b!424538))

(assert (= (and b!424538 res!248346) b!424534))

(assert (= (and b!424534 res!248352) b!424525))

(assert (= (and b!424525 res!248344) b!424532))

(assert (= (and b!424532 res!248350) b!424527))

(assert (= (and b!424527 res!248349) b!424533))

(assert (= (and b!424533 res!248347) b!424524))

(assert (= (and b!424524 res!248345) b!424536))

(assert (= (and b!424536 res!248354) b!424537))

(assert (= (and b!424537 res!248355) b!424528))

(assert (= (and b!424528 res!248348) b!424529))

(assert (= (and b!424529 res!248353) b!424531))

(assert (= (and b!424530 condMapEmpty!18168) mapIsEmpty!18168))

(assert (= (and b!424530 (not condMapEmpty!18168)) mapNonEmpty!18168))

(get-info :version)

(assert (= (and mapNonEmpty!18168 ((_ is ValueCellFull!5172) mapValue!18168)) b!424526))

(assert (= (and b!424530 ((_ is ValueCellFull!5172) mapDefault!18168)) b!424535))

(assert (= start!39612 b!424530))

(declare-fun m!413643 () Bool)

(assert (=> b!424525 m!413643))

(declare-fun m!413645 () Bool)

(assert (=> b!424537 m!413645))

(declare-fun m!413647 () Bool)

(assert (=> b!424537 m!413647))

(declare-fun m!413649 () Bool)

(assert (=> b!424531 m!413649))

(declare-fun m!413651 () Bool)

(assert (=> b!424531 m!413651))

(declare-fun m!413653 () Bool)

(assert (=> b!424531 m!413653))

(declare-fun m!413655 () Bool)

(assert (=> mapNonEmpty!18168 m!413655))

(declare-fun m!413657 () Bool)

(assert (=> b!424536 m!413657))

(declare-fun m!413659 () Bool)

(assert (=> b!424524 m!413659))

(declare-fun m!413661 () Bool)

(assert (=> b!424528 m!413661))

(declare-fun m!413663 () Bool)

(assert (=> b!424533 m!413663))

(declare-fun m!413665 () Bool)

(assert (=> b!424538 m!413665))

(declare-fun m!413667 () Bool)

(assert (=> start!39612 m!413667))

(declare-fun m!413669 () Bool)

(assert (=> start!39612 m!413669))

(declare-fun m!413671 () Bool)

(assert (=> b!424532 m!413671))

(check-sat (not b!424525) (not mapNonEmpty!18168) (not b!424528) (not b!424533) (not b_next!9879) tp_is_empty!11031 (not start!39612) (not b!424538) b_and!17535 (not b!424537) (not b!424532) (not b!424536) (not b!424531))
(check-sat b_and!17535 (not b_next!9879))
