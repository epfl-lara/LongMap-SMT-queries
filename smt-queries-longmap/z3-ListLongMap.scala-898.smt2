; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20486 () Bool)

(assert start!20486)

(declare-fun b_free!5145 () Bool)

(declare-fun b_next!5145 () Bool)

(assert (=> start!20486 (= b_free!5145 (not b_next!5145))))

(declare-fun tp!18466 () Bool)

(declare-fun b_and!11891 () Bool)

(assert (=> start!20486 (= tp!18466 b_and!11891)))

(declare-fun res!97610 () Bool)

(declare-fun e!133073 () Bool)

(assert (=> start!20486 (=> (not res!97610) (not e!133073))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20486 (= res!97610 (validMask!0 mask!1149))))

(assert (=> start!20486 e!133073))

(declare-datatypes ((V!6315 0))(
  ( (V!6316 (val!2545 Int)) )
))
(declare-datatypes ((ValueCell!2157 0))(
  ( (ValueCellFull!2157 (v!4515 V!6315)) (EmptyCell!2157) )
))
(declare-datatypes ((array!9227 0))(
  ( (array!9228 (arr!4364 (Array (_ BitVec 32) ValueCell!2157)) (size!4689 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9227)

(declare-fun e!133071 () Bool)

(declare-fun array_inv!2885 (array!9227) Bool)

(assert (=> start!20486 (and (array_inv!2885 _values!649) e!133071)))

(assert (=> start!20486 true))

(declare-fun tp_is_empty!5001 () Bool)

(assert (=> start!20486 tp_is_empty!5001))

(declare-datatypes ((array!9229 0))(
  ( (array!9230 (arr!4365 (Array (_ BitVec 32) (_ BitVec 64))) (size!4690 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9229)

(declare-fun array_inv!2886 (array!9229) Bool)

(assert (=> start!20486 (array_inv!2886 _keys!825)))

(assert (=> start!20486 tp!18466))

(declare-fun b!203247 () Bool)

(declare-fun res!97617 () Bool)

(assert (=> b!203247 (=> (not res!97617) (not e!133073))))

(declare-datatypes ((List!2764 0))(
  ( (Nil!2761) (Cons!2760 (h!3402 (_ BitVec 64)) (t!7695 List!2764)) )
))
(declare-fun arrayNoDuplicates!0 (array!9229 (_ BitVec 32) List!2764) Bool)

(assert (=> b!203247 (= res!97617 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2761))))

(declare-fun b!203248 () Bool)

(declare-fun e!133075 () Bool)

(declare-fun e!133072 () Bool)

(assert (=> b!203248 (= e!133075 e!133072)))

(declare-fun res!97612 () Bool)

(assert (=> b!203248 (=> res!97612 e!133072)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203248 (= res!97612 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3862 0))(
  ( (tuple2!3863 (_1!1942 (_ BitVec 64)) (_2!1942 V!6315)) )
))
(declare-datatypes ((List!2765 0))(
  ( (Nil!2762) (Cons!2761 (h!3403 tuple2!3862) (t!7696 List!2765)) )
))
(declare-datatypes ((ListLongMap!2775 0))(
  ( (ListLongMap!2776 (toList!1403 List!2765)) )
))
(declare-fun lt!102431 () ListLongMap!2775)

(declare-fun lt!102427 () ListLongMap!2775)

(assert (=> b!203248 (= lt!102431 lt!102427)))

(declare-fun lt!102430 () ListLongMap!2775)

(declare-fun lt!102426 () tuple2!3862)

(declare-fun +!430 (ListLongMap!2775 tuple2!3862) ListLongMap!2775)

(assert (=> b!203248 (= lt!102427 (+!430 lt!102430 lt!102426))))

(declare-fun lt!102428 () ListLongMap!2775)

(declare-fun lt!102433 () ListLongMap!2775)

(assert (=> b!203248 (= lt!102428 lt!102433)))

(declare-fun lt!102432 () ListLongMap!2775)

(assert (=> b!203248 (= lt!102433 (+!430 lt!102432 lt!102426))))

(declare-fun lt!102434 () ListLongMap!2775)

(assert (=> b!203248 (= lt!102431 (+!430 lt!102434 lt!102426))))

(declare-fun zeroValue!615 () V!6315)

(assert (=> b!203248 (= lt!102426 (tuple2!3863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203249 () Bool)

(declare-fun e!133076 () Bool)

(assert (=> b!203249 (= e!133076 tp_is_empty!5001)))

(declare-fun b!203250 () Bool)

(declare-fun res!97618 () Bool)

(assert (=> b!203250 (=> (not res!97618) (not e!133073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9229 (_ BitVec 32)) Bool)

(assert (=> b!203250 (= res!97618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203251 () Bool)

(declare-fun res!97616 () Bool)

(assert (=> b!203251 (=> (not res!97616) (not e!133073))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203251 (= res!97616 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4690 _keys!825))))))

(declare-fun mapNonEmpty!8570 () Bool)

(declare-fun mapRes!8570 () Bool)

(declare-fun tp!18467 () Bool)

(assert (=> mapNonEmpty!8570 (= mapRes!8570 (and tp!18467 e!133076))))

(declare-fun mapValue!8570 () ValueCell!2157)

(declare-fun mapKey!8570 () (_ BitVec 32))

(declare-fun mapRest!8570 () (Array (_ BitVec 32) ValueCell!2157))

(assert (=> mapNonEmpty!8570 (= (arr!4364 _values!649) (store mapRest!8570 mapKey!8570 mapValue!8570))))

(declare-fun b!203252 () Bool)

(declare-fun e!133070 () Bool)

(assert (=> b!203252 (= e!133071 (and e!133070 mapRes!8570))))

(declare-fun condMapEmpty!8570 () Bool)

(declare-fun mapDefault!8570 () ValueCell!2157)

(assert (=> b!203252 (= condMapEmpty!8570 (= (arr!4364 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2157)) mapDefault!8570)))))

(declare-fun mapIsEmpty!8570 () Bool)

(assert (=> mapIsEmpty!8570 mapRes!8570))

(declare-fun b!203253 () Bool)

(assert (=> b!203253 (= e!133072 true)))

(declare-fun lt!102424 () tuple2!3862)

(assert (=> b!203253 (= lt!102427 (+!430 lt!102433 lt!102424))))

(declare-datatypes ((Unit!6154 0))(
  ( (Unit!6155) )
))
(declare-fun lt!102435 () Unit!6154)

(declare-fun v!520 () V!6315)

(declare-fun addCommutativeForDiffKeys!145 (ListLongMap!2775 (_ BitVec 64) V!6315 (_ BitVec 64) V!6315) Unit!6154)

(assert (=> b!203253 (= lt!102435 (addCommutativeForDiffKeys!145 lt!102432 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203254 () Bool)

(declare-fun res!97614 () Bool)

(assert (=> b!203254 (=> (not res!97614) (not e!133073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203254 (= res!97614 (validKeyInArray!0 k0!843))))

(declare-fun b!203255 () Bool)

(declare-fun res!97615 () Bool)

(assert (=> b!203255 (=> (not res!97615) (not e!133073))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203255 (= res!97615 (and (= (size!4689 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4690 _keys!825) (size!4689 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203256 () Bool)

(declare-fun res!97611 () Bool)

(assert (=> b!203256 (=> (not res!97611) (not e!133073))))

(assert (=> b!203256 (= res!97611 (= (select (arr!4365 _keys!825) i!601) k0!843))))

(declare-fun b!203257 () Bool)

(assert (=> b!203257 (= e!133073 (not e!133075))))

(declare-fun res!97613 () Bool)

(assert (=> b!203257 (=> res!97613 e!133075)))

(assert (=> b!203257 (= res!97613 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6315)

(declare-fun getCurrentListMap!978 (array!9229 array!9227 (_ BitVec 32) (_ BitVec 32) V!6315 V!6315 (_ BitVec 32) Int) ListLongMap!2775)

(assert (=> b!203257 (= lt!102428 (getCurrentListMap!978 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102425 () array!9227)

(assert (=> b!203257 (= lt!102431 (getCurrentListMap!978 _keys!825 lt!102425 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203257 (and (= lt!102434 lt!102430) (= lt!102430 lt!102434))))

(assert (=> b!203257 (= lt!102430 (+!430 lt!102432 lt!102424))))

(assert (=> b!203257 (= lt!102424 (tuple2!3863 k0!843 v!520))))

(declare-fun lt!102429 () Unit!6154)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!91 (array!9229 array!9227 (_ BitVec 32) (_ BitVec 32) V!6315 V!6315 (_ BitVec 32) (_ BitVec 64) V!6315 (_ BitVec 32) Int) Unit!6154)

(assert (=> b!203257 (= lt!102429 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!91 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!352 (array!9229 array!9227 (_ BitVec 32) (_ BitVec 32) V!6315 V!6315 (_ BitVec 32) Int) ListLongMap!2775)

(assert (=> b!203257 (= lt!102434 (getCurrentListMapNoExtraKeys!352 _keys!825 lt!102425 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203257 (= lt!102425 (array!9228 (store (arr!4364 _values!649) i!601 (ValueCellFull!2157 v!520)) (size!4689 _values!649)))))

(assert (=> b!203257 (= lt!102432 (getCurrentListMapNoExtraKeys!352 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203258 () Bool)

(assert (=> b!203258 (= e!133070 tp_is_empty!5001)))

(assert (= (and start!20486 res!97610) b!203255))

(assert (= (and b!203255 res!97615) b!203250))

(assert (= (and b!203250 res!97618) b!203247))

(assert (= (and b!203247 res!97617) b!203251))

(assert (= (and b!203251 res!97616) b!203254))

(assert (= (and b!203254 res!97614) b!203256))

(assert (= (and b!203256 res!97611) b!203257))

(assert (= (and b!203257 (not res!97613)) b!203248))

(assert (= (and b!203248 (not res!97612)) b!203253))

(assert (= (and b!203252 condMapEmpty!8570) mapIsEmpty!8570))

(assert (= (and b!203252 (not condMapEmpty!8570)) mapNonEmpty!8570))

(get-info :version)

(assert (= (and mapNonEmpty!8570 ((_ is ValueCellFull!2157) mapValue!8570)) b!203249))

(assert (= (and b!203252 ((_ is ValueCellFull!2157) mapDefault!8570)) b!203258))

(assert (= start!20486 b!203252))

(declare-fun m!230651 () Bool)

(assert (=> b!203247 m!230651))

(declare-fun m!230653 () Bool)

(assert (=> b!203250 m!230653))

(declare-fun m!230655 () Bool)

(assert (=> b!203256 m!230655))

(declare-fun m!230657 () Bool)

(assert (=> b!203257 m!230657))

(declare-fun m!230659 () Bool)

(assert (=> b!203257 m!230659))

(declare-fun m!230661 () Bool)

(assert (=> b!203257 m!230661))

(declare-fun m!230663 () Bool)

(assert (=> b!203257 m!230663))

(declare-fun m!230665 () Bool)

(assert (=> b!203257 m!230665))

(declare-fun m!230667 () Bool)

(assert (=> b!203257 m!230667))

(declare-fun m!230669 () Bool)

(assert (=> b!203257 m!230669))

(declare-fun m!230671 () Bool)

(assert (=> b!203248 m!230671))

(declare-fun m!230673 () Bool)

(assert (=> b!203248 m!230673))

(declare-fun m!230675 () Bool)

(assert (=> b!203248 m!230675))

(declare-fun m!230677 () Bool)

(assert (=> mapNonEmpty!8570 m!230677))

(declare-fun m!230679 () Bool)

(assert (=> b!203253 m!230679))

(declare-fun m!230681 () Bool)

(assert (=> b!203253 m!230681))

(declare-fun m!230683 () Bool)

(assert (=> b!203254 m!230683))

(declare-fun m!230685 () Bool)

(assert (=> start!20486 m!230685))

(declare-fun m!230687 () Bool)

(assert (=> start!20486 m!230687))

(declare-fun m!230689 () Bool)

(assert (=> start!20486 m!230689))

(check-sat (not b_next!5145) (not b!203257) (not start!20486) (not mapNonEmpty!8570) tp_is_empty!5001 (not b!203250) b_and!11891 (not b!203248) (not b!203253) (not b!203247) (not b!203254))
(check-sat b_and!11891 (not b_next!5145))
